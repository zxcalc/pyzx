# PyZX - Python library for quantum circuit rewriting 
#        and optimization using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from typing import Dict, List, Optional

from . import Circuit
from .gates import Measurement, TargetMapper
from ..utils import EdgeType, VertexType, FloatInt, FractionLike
from ..graph import Graph
from ..graph.base import BaseGraph, VT, ET
from ..symbolic import Poly, new_var

def graph_to_circuit(g:BaseGraph[VT,ET], split_phases:bool=True) -> Circuit:
    inputs = g.inputs()
    qs = g.qubits()
    rs = g.rows()
    ty = g.types()
    phases = g.phases()
    rows: Dict[FloatInt,List[VT]] = {}

    c = Circuit(len(inputs))
    
    for v in g.vertices():
        if v in inputs: continue
        r = g.row(v)
        if r in rows: rows[r].append(v)
        else: rows[r] = [v]
    for r in sorted(rows.keys()):
        for v in rows[r]:
            q = qs[v]
            phase = phases[v]
            t = ty[v]
            neigh = [w for w in g.neighbors(v) if rs[w]<r]
            if len(neigh) != 1:
                raise TypeError("Graph doesn't seem circuit like: multiple parents")
            n = neigh[0]
            if qs[n] != q:
                raise TypeError("Graph doesn't seem circuit like: cross qubit connections")
            if g.edge_type(g.edge(n,v)) == EdgeType.HADAMARD:
                c.add_gate("HAD", q)
            if t == VertexType.BOUNDARY: #vertex is an output
                continue
            if phase!=0 and not split_phases:
                if t == VertexType.Z: c.add_gate("ZPhase", q, phase=phase)
                else: c.add_gate("XPhase", q, phase=phase)
            elif t == VertexType.Z and phase.denominator == 2:
                c.add_gate("S", q, adjoint=(phase.numerator==3))
            elif t == VertexType.Z and phase.denominator == 4:
                if phase.numerator in (1,7): c.add_gate("T", q, adjoint=(phase.numerator==7))
                if phase.numerator in (3,5):
                    c.add_gate("Z", q)
                    c.add_gate("T", q, adjoint=(phase.numerator==3))
            elif phase == 1:
                if t == VertexType.Z: c.add_gate("Z", q)
                else: c.add_gate("NOT", q)
            elif phase != 0:
                if t == VertexType.Z: c.add_gate("ZPhase", q, phase=phase)
                else: c.add_gate("XPhase", q, phase=phase)

            neigh = [w for w in g.neighbors(v) if rs[w]==r and w<v] # TODO: find a different way to do comparison of vertices
            for n in neigh:
                t2 = ty[n]
                q2 = qs[n]
                if t == t2:
                    if g.edge_type(g.edge(v,n)) != EdgeType.HADAMARD:
                        raise TypeError("Invalid vertical connection between vertices of the same type")
                    if t == VertexType.Z: c.add_gate("CZ", q2, q)
                    else: c.add_gate("CX", q2, q)
                else:
                    if g.edge_type(g.edge(v,n)) != EdgeType.SIMPLE:
                        raise TypeError("Invalid vertical connection between vertices of different type")
                    if t == VertexType.Z: c.add_gate("CNOT", q, q2)
                    else: c.add_gate("CNOT", q2, q)
    return c


def circuit_to_graph(
    c: Circuit, 
    compress_rows:bool=True,
    backend:Optional[str]=None,
    init:Optional[List[bool]]=None,
    post_select:Optional[List[int]]=None
) -> BaseGraph[VT, ET]:
    """Turns the circuit into a ZX-Graph.
    If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
    on the same row.

    ``init`` denotes whether each input should be connected to |0\ranlge,
    ``post_select`` denotes for each measurement whether it should be 
    postselected to |0\rangle (0) or |1\ranlge (1)."""
    g = Graph(backend)
    q_mapper: TargetMapper[VT] = TargetMapper()
    c_mapper: TargetMapper[VT] = TargetMapper()
    inputs = []
    outputs = []
    measure_targets = set()

    # Create input vertices
    for i in range(c.qubits):
        v = g.add_vertex(VertexType.BOUNDARY,i,0)
        inputs.append(v)
        q_mapper.add_label(i, 1)
        q_mapper.set_prev_vertex(i, v)
    for i in range(c.bits):
        qubit = i+c.qubits
        v = g.add_vertex(VertexType.BOUNDARY, qubit, 0)
        inputs.append(v)
        q_mapper.add_label(qubit, 1)
        c_mapper.set_prev_vertex(qubit, v)


    for gate in c.gates:
        if gate.name == "Measurement":
            assert isinstance(gate, Measurement)
            measure_targets.add(gate.target)
        if gate.name == 'InitAncilla':
            l = gate.label # type: ignore
            try:
                q_mapper.add_label(l, q_mapper.next_row_or_default(l, q_mapper.max_row() - 1))
            except ValueError:
                raise ValueError("Ancilla label {} already in use".format(str(l)))
            v = g.add_vertex(VertexType.Z, q_mapper.to_qubit(l), q_mapper.next_row(l))
            q_mapper.set_prev_vertex(l, v)
            q_mapper.advance_next_row(l)
        elif gate.name == 'PostSelect':
            l = gate.label # type: ignore
            try:
                q = q_mapper.to_qubit(l)
                r = q_mapper.next_row(l)
                u = q_mapper.prev_vertex(l)
                q_mapper.set_next_row(l, r + 1)
                q_mapper.remove_label(l)
            except ValueError:
                raise ValueError("PostSelect label {} is not in use".format(str(l)))
            v = g.add_vertex(VertexType.Z, q, r)
            g.add_edge((u,v),EdgeType.SIMPLE)
        else:
            if not compress_rows: #or not isinstance(gate, (ZPhase, XPhase, HAD)):
                q_mapper.set_max_row(max(q_mapper.max_row(), c_mapper.max_row()))
                c_mapper.set_max_row(q_mapper.max_row())
                q_mapper.set_all_rows_to_max()
                c_mapper.set_all_rows_to_max()
            gate.to_graph(g, q_mapper, c_mapper)
            if not compress_rows: # or not isinstance(gate, (ZPhase, XPhase, HAD)):
                q_mapper.set_max_row(max(q_mapper.max_row(), c_mapper.max_row()))
                c_mapper.set_max_row(q_mapper.max_row())
                q_mapper.set_all_rows_to_max()
                c_mapper.set_all_rows_to_max()

    # Create output vertices
    r = max(q_mapper.max_row(), c_mapper.max_row())
    measure_vertices = []
    for mapper in (q_mapper, c_mapper):
        for l in mapper.labels():
            o = mapper.to_qubit(l)
            u = mapper.prev_vertex(l)
            if o not in measure_targets:
                v = g.add_vertex(VertexType.BOUNDARY, o, r)
                outputs.append(v)
                g.add_edge((u,v))
            else:
                measure_vertices.append(u)

    g.set_inputs(tuple(inputs))
    g.set_outputs(tuple(outputs))

    if init:
        assert len(inputs) == len(init), "Length of init list must be equal to number of inputs!"
        state = "".join("0" if i else "/" for i in init)
        g.apply_state(state)

    if post_select:
        assert len(measure_vertices) == len(post_select), "Length of post_select list must be equal to number of measurements!"
        for i, v in enumerate(measure_vertices):
            g.set_phase(v, post_select[i])

    return g
