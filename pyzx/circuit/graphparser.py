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
from ..utils import EdgeType, VertexType, FloatInt, FractionLike
from ..graph import Graph
from ..graph.base import BaseGraph, VT, ET

def graph_to_circuit(g:BaseGraph[VT,ET], split_phases:bool=True) -> Circuit:
    c = Circuit(g.qubit_count())
    qs = g.qubits()
    rs = g.rows()
    ty = g.types()
    phases = g.phases()
    rows: Dict[FloatInt,List[VT]] = {}
    for v in g.vertices():
        if v in g.inputs: continue
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

            neigh = [w for w in g.neighbors(v) if rs[w]==r and w<v] # type: ignore # TODO: find a different way to do comparison of vertices
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


def circuit_to_graph(c: Circuit, compress_rows:bool=True, backend:Optional[str]=None):
    """Turns the circuit into a ZX-Graph.
    If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
    on the same row."""
    g = Graph(backend)
    qs = {}
    rs = {}
    for i in range(c.qubits):
        v = g.add_vertex(VertexType.BOUNDARY,i,0)
        g.inputs.append(v)
        qs[i] = v
        rs[i] = 1

    labels = {i:i for i in range(c.qubits)}

    for gate in c.gates:
        if gate.name == 'InitAncilla':
            l = gate.label # type: ignore
            if l in labels:
                raise ValueError("Ancilla label {} already in use".format(str(l)))
            q = len(labels)
            labels[l] = q
            r = max(rs.values())
            for i in rs: rs[i] = r
            rs[l] = r+1
            v = g.add_vertex(VertexType.Z, q, r)
            qs[l] = v
        elif gate.name == 'PostSelect':
            l = gate.label # type: ignore
            if l not in labels:
                raise ValueError("PostSelect label {} is not in use".format(str(l)))
            v = g.add_vertex(VertexType.Z, labels[l], rs[l])
            g.add_edge((qs[l],v),EdgeType.SIMPLE)
            r = max(rs.values())
            for i in rs: rs[i] = r+1
            del qs[l]
            del rs[l]
            del labels[l]
        else:
            if not compress_rows: #or not isinstance(gate, (ZPhase, XPhase, HAD)):
                r = max(rs.values())
                for i in rs: rs[i] = r
            gate.to_graph(g,labels, qs,rs)
            if not compress_rows: # or not isinstance(gate, (ZPhase, XPhase, HAD)):
                r = max(rs.values())
                for i in rs: rs[i] = r

    r = max(rs.values())
    for l, o in labels.items():
        v = g.add_vertex(VertexType.BOUNDARY,o,r)
        g.outputs.append(v)
        g.add_edge((qs[l],v))

    return g
