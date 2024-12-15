# PyZX - Python library for quantum circuit rewriting 
#        and optimization using the ZX-calculus
# Copyright (C) 2024 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from .gflow import gflow
from .circuit import Circuit
from .utils import EdgeType, VertexType
from .simplify import gadgetize, to_rg
from .graph.base import BaseGraph, VT, ET

from typing import Set, Dict, Tuple, Generic

def multiply_paulis(p1: str, p2: str) -> str:
    if p1 == 'I': return p2
    elif p2 == 'I': return p1
    elif p1 == p2: return 'I'
    elif p1 != 'X' and p2 != 'X': return 'X'
    elif p1 != 'Y' and p2 != 'Y': return 'Y'
    elif p1 != 'Z' and p2 != 'Z': return 'Z'
    else: raise ValueError('Expected: I, X, Y, or Z')



class PauliWeb(Generic[VT, ET]):
    """A Pauli web
    
    This class stores a Pauli web in "correction set" format. That is, the edges in the web are
    all the edges incident to the vertices in `c`. To account for Hadamard edges, edge typing is
    assigned to "half-edges".
    """
    def __init__(self, g: BaseGraph[VT,ET], c: Set[VT]):
        self.g = g
        self.c = c

    def vertices(self):
        vs = self.c.copy()
        for v in self.c:
            vs |= set(self.g.neighbors(v))
        return vs

    def half_edges(self):
        es: Dict[Tuple[VT,VT],str] = dict()
        for v in self.c:
            for e in self.g.incident_edges(v):
                s, t = self.g.edge_st(e)
                v1 = s if s != v else t
                ty = 'Z' if self.g.type(v) == VertexType.Z else 'X'
                oty = 'X' if ty == 'Z' else 'Z'
                if self.g.edge_type(e) == EdgeType.SIMPLE:
                    ty = oty

                t1 = es.get((v,v1), 'I')
                t2 = es.get((v1,v), 'I')
                es[(v,v1)] = multiply_paulis(t1, oty)
                es[(v1,v)] = multiply_paulis(t2, ty)
        return es
    
    def boundary(self):
        b: Dict[VT, int] = dict()
        for v in self.c:
            for n in self.g.neighbors(v):
                if n in b: b[n] += 1
                else: b[n] = 1
        return set(n for n,k in b.items() if k%2 == 1)
    
    def __repr__(self):
        return 'PauliWeb' + repr(self.c)


def preprocess(g: BaseGraph[VT,ET]):
    g.normalize()
    gadgetize(g)
    to_rg(g)

    in_circ = Circuit(len(g.inputs()))
    for j,i in enumerate(g.inputs()):
        e = g.incident_edges(i)[0]
        v = next(iter(g.neighbors(i)))
        p = g.phase(v)
        ty = g.type(v)

        # remove local cliffords from the inputs
        if g.edge_type(e) == EdgeType.HADAMARD:
            in_circ.add_gate('H', j)
            g.set_edge_type(e, EdgeType.SIMPLE)
        if p != 0:
            g.set_phase(v, 0)
            in_circ.add_gate("ZPhase" if ty == VertexType.Z else "XPhase", j, phase=p)

    out_circ = Circuit(len(g.outputs()))
    for j,o in enumerate(g.outputs()):
        r = g.row(o)
        g.set_row(o, r + 2)
        e = g.incident_edges(o)[0]
        v = next(iter(g.neighbors(o)))
        p = g.phase(v)
        ty = g.type(v)

        # remove local cliffords from the outputs
        if p != 0:
            g.set_phase(v, 0)
            out_circ.add_gate("ZPhase" if ty == VertexType.Z else "XPhase", j, phase=p)

        if g.edge_type(e) == EdgeType.HADAMARD:
            out_circ.add_gate('H', j)
        g.remove_edge(e)

        # introduce ID spiders at the outputs for computing pauli webs
        if ty == VertexType.X:
            v1 = g.add_vertex(VertexType.Z, qubit=g.qubit(o), row=r)
            g.add_edge((v,v1), EdgeType.SIMPLE)
        else:
            v1 = v
            g.set_row(v1, r)
        
        v2 = g.add_vertex(VertexType.X, qubit=g.qubit(o), row=r+1)

        
        g.add_edge((v1,v2), EdgeType.SIMPLE)
        g.add_edge((v2,o), EdgeType.SIMPLE)
    
    return (in_circ, out_circ)


def transpose_corrections(c) -> Dict[VT, Set[VT]]:
    ct = dict()
    for k,s in c.items():
        for v in s:
            if v not in ct: ct[v] = set()
            ct[v].add(k)
    return ct

def compute_pauli_webs(g: BaseGraph[VT,ET]) -> Tuple[Dict[VT, int], Dict[VT, PauliWeb[VT,ET]]]:
    gf = gflow(g, focus=True, pauli=True)
    if not gf:
        raise ValueError("Graph must have gFlow")
    order, c = gf

    return (order, { v: PauliWeb(g, c) for v,c in transpose_corrections(c).items() })