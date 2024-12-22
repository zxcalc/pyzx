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
from .utils import EdgeType, VertexType, vertex_is_zx
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
    
    def add_half_edge(self, v_pair: Tuple[VT, VT], pauli: str):
        s, t = v_pair
        self.vs.add(s)
        p = self.es.get((s,t), 'I')
        self.es[(s,t)] = multiply_paulis(p, pauli)

    def add_edge(self, v_pair: Tuple[VT, VT], pauli: str):
        s, t = v_pair
        et = self.g.edge_type(self.g.edge(s, t))
        self.add_half_edge((s,t), pauli)
        self.add_half_edge((t,s), pauli if et == EdgeType.SIMPLE else h_pauli(pauli))

        # if spread_to_input: 
        #     inp = self.g.inputs()
        #     if ('Z' if self.g.type(s) == VertexType.Z else 'X') == pauli:
        #         for v2 in self.g.neighbors(s):
        #             if v2 in inp:
        #                 self.add_edge((s, v2), pauli, spread_to_input=False)
        #                 break

        #     if ('Z' if self.g.type(t) == VertexType.Z else 'X') == pauli:
        #         for v2 in self.g.neighbors(t):
        #             if v2 in inp:
        #                 self.add_edge((t, v2), pauli, spread_to_input=False)
        #                 break

    def spread_to_boundary(self, inputs=True, outputs=True):
        bnd = []
        if inputs: bnd += self.g.inputs()
        if outputs: bnd += self.g.outputs()

        for i in bnd:
            v = next(iter(self.g.neighbors(i)))
            vt = self.g.type(v)
            if vt == VertexType.Z:
                p = 'Z'
            elif vt == VertexType.X:
                p = 'X'
            else:
                continue
            adj = sum(1 for v1 in self.g.neighbors(v)
                      if (v,v1) in self.es and self.es[(v,v1)] in [p, 'Y'])
            if adj % 2 == 1:
                self.add_edge((v, i), p)


    # def add_vertex(self, v: VT, spread_to_input: bool=False):
    #     p = 'X' if self.g.type(v) == VertexType.Z else 'Z'
    #     for v1 in self.g.neighbors(v):
    #         self.add_edge((v, v1), p, spread_to_input=spread_to_input)
    
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

def compute_pauli_webs(g: BaseGraph[VT,ET], backwards:bool=True) -> Tuple[Dict[VT, int], Dict[VT, PauliWeb[VT,ET]], Dict[VT, PauliWeb[VT,ET]]]:
    g1 = g.clone()
    color_edge: Dict[VT, Tuple[VT,VT]] = dict()
    boundary: Dict[VT, VT] = dict()

    for e in g.edges():
        s, t = g.edge_st(e)
        st = g.type(s)
        tt = g.type(t)
        et = g.edge_type(e)
        if not (vertex_is_zx(st) and vertex_is_zx(tt)): continue

        if (st == tt and et == EdgeType.SIMPLE) or (st != tt and et == EdgeType.HADAMARD):
            v = g1.add_vertex(VertexType.Z if st == VertexType.X else VertexType.X)
            g1.remove_edge(e)
            g1.add_edge((s, v), EdgeType.SIMPLE)
            g1.add_edge((v, t), et)
            color_edge[v] = (s,t)
        
    for b in g1.inputs() + g1.outputs():
        e = g1.incident_edges(b)[0]
        v = next(iter(g1.neighbors(b)))
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
        g1.add_edge((v1, b), EdgeType.SIMPLE)
        color_edge[v0] = (b, v)
        boundary[v0] = b
        boundary[v1] = b

    gf = gflow(g1, focus=True, reverse=backwards, pauli=True)
    if not gf:
        raise ValueError("Graph must have gFlow")
    order, corr = gf

    zwebs: Dict[VT, PauliWeb[VT,ET]] = dict()
    xwebs: Dict[VT, PauliWeb[VT,ET]] = dict()
    vset = g.vertex_set()
    # corr_t = transpose_corrections(corr)

    for v,c in corr.items():
        pw = PauliWeb(g)
        for v1 in c:
            if v1 in vset:
                p = 'X' if g.type(v1) == VertexType.Z else 'Z'
                for v2 in g.neighbors(v1):
                    if g.type(v2) == VertexType.BOUNDARY or g1.connected(v1, v2):
                        pw.add_edge((v1, v2), p)
                    else:
                        pw.add_half_edge((v1, v2), p)
            elif v1 in color_edge:
                pw.add_edge(color_edge[v1], 'Z' if g1.type(v1) == VertexType.X else 'X')
        if v in boundary:
            ref = boundary[v]
        else:
            ref = v

        # pw.spread_to_boundary(inputs=True, outputs=False)
        if g1.type(v) == VertexType.Z: zwebs[ref] = pw
        elif g1.type(v) == VertexType.X: xwebs[ref] = pw


    return (order, zwebs, xwebs)
