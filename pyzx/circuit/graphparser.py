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
from .gates import TargetMapper
from ..utils import EdgeType, VertexType, FloatInt, FractionLike
from ..graph import Graph
from ..graph.base import BaseGraph, VT, ET

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


def circuit_to_graph(c: Circuit, compress_rows:bool=True, backend:Optional[str]=None) -> BaseGraph[VT, ET]:
    """Turns the circuit into a ZX-Graph.
    If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
    on the same row."""
    g = Graph(backend)
    q_mapper: TargetMapper[VT] = TargetMapper()
    c_mapper: TargetMapper[VT] = TargetMapper()
    inputs = []
    outputs = []

    for i in range(c.qubits):
        v = g.add_vertex(VertexType.BOUNDARY,i,0)
        inputs.append(v)
        q_mapper.set_prev_vertex(i, v)
        q_mapper.set_next_row(i, 1)
        q_mapper.set_qubit(i, i)
    for i in range(c.bits):
        qubit = i+c.qubits
        v = g.add_vertex(VertexType.BOUNDARY, qubit, 0)
        inputs.append(v)
        c_mapper.set_prev_vertex(i, v)
        c_mapper.set_next_row(i, 1)
        c_mapper.set_qubit(i, qubit)

    for gate in c.gates:
        if gate.name == 'InitAncilla':
            l = gate.label # type: ignore
            try:
                q_mapper.add_label(l, compress_rows)
            except ValueError:
                raise ValueError("Ancilla label {} already in use".format(str(l)))
            v = g.add_vertex(VertexType.Z, q_mapper.to_qubit(l), q_mapper.next_row(l)-1)
            q_mapper.set_prev_vertex(l, v)
            # q_mapper.advance_next_row(l)
        elif gate.name == 'PostSelect':
            l = gate.label # type: ignore
            try:
                q = q_mapper.to_qubit(l)
                r = q_mapper.next_row(l)
                u = q_mapper.prev_vertex(l)
                q_mapper.remove_label(l, compress_rows)
            except ValueError:
                raise ValueError("PostSelect label {} is not in use".format(str(l)))
            v = g.add_vertex(VertexType.Z, q, r)
            g.add_edge((u,v),EdgeType.SIMPLE)
        else:
            if not compress_rows: #or not isinstance(gate, (ZPhase, XPhase, HAD)):
                r = max(q_mapper.max_row(), c_mapper.max_row())
                q_mapper.set_all_rows(r)
                c_mapper.set_all_rows(r)
            gate.to_graph(g, q_mapper, c_mapper)
            if not compress_rows: # or not isinstance(gate, (ZPhase, XPhase, HAD)):
                r = max(q_mapper.max_row(), c_mapper.max_row())
                q_mapper.set_all_rows(r)
                c_mapper.set_all_rows(r)

    r = max(q_mapper.max_row(), c_mapper.max_row())
    for mapper in (q_mapper, c_mapper):
        for l in mapper.labels():
            o = mapper.to_qubit(l)
            v = g.add_vertex(VertexType.BOUNDARY, o, r)
            outputs.append(v)
            u = mapper.prev_vertex(l)
            g.add_edge((u,v))

    g.set_inputs(tuple(inputs))
    g.set_outputs(tuple(outputs))

    return g
