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

def h_pauli(p: str) -> str:
    if p == 'I': return 'I'
    elif p == 'X': return 'Z'
    elif p == 'Y': return 'Y'
    else: return 'X'


class PauliWeb(Generic[VT, ET]):
    """A Pauli web
    
    This class stores a Pauli web in "correction set" format. That is, the edges in the web are
    all the edges incident to the vertices in `c`. To account for Hadamard edges, edge typing is
    assigned to "half-edges".
    """
    def __init__(self, g: BaseGraph[VT,ET]):
        self.g = g
        self.es: Dict[Tuple[VT,VT], str] = dict()
        self.vs: Set[VT] = set()
    
    def add_edge(self, v_pair: Tuple[VT, VT], pauli: str, spread_to_input: bool=False):
        s, t = v_pair
        self.vs.add(s)
        self.vs.add(t)
        et = self.g.edge_type(self.g.edge(s, t))
        t1 = self.es.get((s,t), 'I')
        t2 = self.es.get((t,s), 'I')
        self.es[(s,t)] = multiply_paulis(t1, pauli)
        self.es[(t,s)] = multiply_paulis(t2, pauli if et == EdgeType.SIMPLE else h_pauli(pauli))

        if spread_to_input and ('Z' if self.g.type(t) == VertexType.Z else 'X') == pauli:
            inp = self.g.inputs()
            for v2 in self.g.neighbors(t):
                if v2 in inp:
                    self.add_edge((t, v2), pauli, spread_to_input=False)
                    break


    def add_vertex(self, v: VT, spread_to_input: bool=False):
        p = 'X' if self.g.type(v) == VertexType.Z else 'Z'
        for v1 in self.g.neighbors(v):
            self.add_edge((v, v1), p, spread_to_input=spread_to_input)
    
    def vertices(self):
        return self.vs

    def half_edges(self) -> Dict[Tuple[VT,VT],str]:
        return self.es
    
    def __repr__(self):
        return 'PauliWeb' + str(self.vs)

def transpose_corrections(c: Dict[VT, Set[VT]]) -> Dict[VT, Set[VT]]:
    ct: Dict[VT, Set[VT]] = dict()
    for k,s in c.items():
        for v in s:
            if v not in ct: ct[v] = set()
            ct[v].add(k)
    return ct

def compute_pauli_webs(g: BaseGraph[VT,ET]) -> Tuple[Dict[VT, int], Dict[VT, PauliWeb[VT,ET]], Dict[VT, PauliWeb[VT,ET]]]:
    g1 = g.clone()
    out_edge: Dict[VT, Tuple[VT,VT]] = dict()
    for o in g1.outputs():
        e = g1.incident_edges(o)[0]
        v = next(iter(g1.neighbors(o)))
        vt = g1.type(v)
        et = g1.edge_type(e)
        g1.remove_edge(e)
        if ((vt == VertexType.Z and et == EdgeType.SIMPLE) or
            (vt == VertexType.X and et == EdgeType.HADAMARD)):
            v0 = g1.add_vertex(VertexType.X)
            v1 = g1.add_vertex(VertexType.Z)
        else:
            v0 = g1.add_vertex(VertexType.Z)
            v1 = g1.add_vertex(VertexType.X)
        g1.add_edge((v, v0), et)
        g1.add_edge((v0, v1), EdgeType.SIMPLE)
        g1.add_edge((v1, o), EdgeType.SIMPLE)
        out_edge[v0] = (o, v)
        out_edge[v1] = (o, v)

    gf = gflow(g1, focus=True, pauli=True)
    if not gf:
        raise ValueError("Graph must have gFlow")
    order, corr = gf

    zwebs: Dict[VT, PauliWeb[VT,ET]] = dict()
    xwebs: Dict[VT, PauliWeb[VT,ET]] = dict()
    vset = g.vertex_set()
    corr_t = transpose_corrections(corr)

    for v,c in corr_t.items():
        pw = PauliWeb(g)
        for v1 in c:
            if v1 in vset:
                pw.add_vertex(v1, spread_to_input=True)
            elif v1 in out_edge:
                o, vo = out_edge[v1]
                pw.add_edge((o,vo), 'Z' if g1.type(v1) == VertexType.X else 'X', spread_to_input=True)
        if v in out_edge:
            # o, vo = out_edge[v]
            # pw.add_edge((o,vo), 'Z' if g1.type(v) == VertexType.Z else 'X')
            ref = out_edge[v][0]
        else:
            ref = v

        if g1.type(v) == VertexType.Z: zwebs[ref] = pw
        elif g1.type(v) == VertexType.X: xwebs[ref] = pw

    for i in g.inputs():
        v = next(iter(g.neighbors(i)))
        pw = PauliWeb(g)
        if g.type(v) == VertexType.Z:
            pw.add_edge((v, i), 'Z')
            zwebs[v] = pw
        elif g.type(v) == VertexType.X:
            pw.add_edge((v, i), 'X')
            xwebs[v] = pw
        elif g.type(v) == VertexType.BOUNDARY:
            pw.add_edge((v, i), 'X')
            xwebs[v] = pw
            pw1 = PauliWeb(g)
            pw1.add_edge((v, i), 'Z')
            zwebs[v] = pw1


    return (order, zwebs, xwebs)