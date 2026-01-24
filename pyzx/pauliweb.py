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

from __future__ import annotations

from .gflow import gflow
from .utils import EdgeType, VertexType, vertex_is_zx, phase_is_clifford
from .graph.base import BaseGraph, VT, ET

from typing import Any, Optional, Dict, Tuple, Generic, Iterable
import random

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
    
    This is a labelling of edges of a given graph by Paulis from the set {'X', 'Y', 'Z'}. In order
    to deal properly with Hadamard edges, we actually label all "half-edges", where a half-edge named
    (v, w) is the end of the edge closest to `v`, and (w, v) is the end closest to `w`.

    A Pauli web is "closed" if
    (i)  every spider has adjacent half-edges labelled by a stabiliser or anti-stabiliser of that spider
    (ii) for every half-edge (v,w) labelled by a Pauli P, the other half is labelled by P (for a normal edge)
         and labelled HPH (for a Hadamard edge).
    
    If these conditions are violated, the Pauli web is called "open", and a spider violating (i) or edge violating
    (ii) is called a boundary of the web.
    """
    
    def __init__(self, g: BaseGraph[VT,ET]):
        self.g = g
        self.es: Dict[Tuple[VT,VT], str] = dict()
    
    def __getitem__(self, edge: Tuple[VT, VT]):
        return self.es.get(edge, 'I')
    
    @staticmethod
    def random(g: BaseGraph[VT,ET], pX=0.1, pY=0.1, pZ=0.1):
        w = PauliWeb(g)
        for e in g.edges():
            s,t = g.edge_st(e)
            for _ in range(2):
                p = random.random()
                if p < pX:
                    w.add_half_edge((s,t), 'X')
                elif p < pX + pY:
                    w.add_half_edge((s,t), 'Y')
                elif p < pX + pY + pZ:
                    w.add_half_edge((s,t), 'Z')
                s,t = (t,s)
        return w
    
    def copy(self) -> PauliWeb[VT, ET]:
        pw = PauliWeb(self.g)
        pw.es = self.es.copy()
        return pw
    
    def add_half_edge(self, v_pair: Tuple[VT, VT], pauli: str):
        s, t = v_pair
        p = multiply_paulis(self.es.get((s,t), 'I'), pauli)
        if p == 'I':
            self.es.pop((s,t),'')
        else:
            self.es[(s,t)] = p
    
    def add_edge(self, v_pair: Tuple[VT, VT], pauli: str):
        s, t = v_pair
        et = self.g.edge_type(self.g.edge(s, t))
        self.add_half_edge((s,t), pauli)
        self.add_half_edge((t,s), pauli if et == EdgeType.SIMPLE else h_pauli(pauli))
    
    def remove_edges(self, v_pairs: Iterable[Tuple[VT, VT]]):
        for s, t in v_pairs:
            self.es.pop((s, t), '')
            self.es.pop((t, s), '')
    
    def vertices(self):
        return set(v for (v,_) in self.es)
    
    def half_edges(self) -> Dict[Tuple[VT,VT],str]:
        return self.es
    
    def __repr__(self):
        return 'PauliWeb' + str(self.vertices())
    
    def __mul__(self, other: PauliWeb[VT, ET]) -> PauliWeb[VT, ET]:
        pw = self.copy()
        for e,p in other.es.items():
            pw.add_half_edge(e, p)
        return pw
    
    def commutes_with(self, other: PauliWeb[VT, ET]) -> bool:
        comm = True
        for e,p1 in self.es.items():
            p2 = other.es.get(e, 'I')
            if p1 != 'I' and p2 != 'I' and p1 != p2:
                comm = not comm
        return comm
    
    def graph_with_errors(self) -> BaseGraph[VT,ET]:
        g = self.g.clone()
        edges = set((s,t) if s < t else (t,s) for s,t in self.es)
        for s,t in edges:
            p0 = self.es.get((s,t), 'I')
            p1 = self.es.get((t,s), 'I')
            
            e = g.edge(s, t)
            et = g.edge_type(e)
            g.remove_edge(e)
            
            spots = 1
            for p in [p0,p1]:
                if p == 'Y': spots += 2
                elif p == 'X' or p == 'Z': spots += 1
            
            q, r = (g.qubit(s), g.row(s))
            dq, dr = ((g.qubit(t) - q)/spots, (g.row(t) - r)/spots)
            
            v0 = s
            v1 = t
            if p0 == 'X':
                q += dq; r += dr
                v0 = g.add_vertex(VertexType.X, q, r, phase=1)
                g.add_edge((s, v0))
            elif p0 == 'Y':
                q += dq; r += dr
                v = g.add_vertex(VertexType.X, q, r, phase=1)
                q += dq; r += dr
                v0 = g.add_vertex(VertexType.Z, q, r, phase=1)
                g.add_edge((s, v))
                g.add_edge((v, v0))
            elif p0 == 'Z':
                q += dq; r += dr
                v0 = g.add_vertex(VertexType.Z, q, r, phase=1)
                g.add_edge((s, v0))
            
            if p1 == 'X':
                q += dq; r += dr
                v1 = g.add_vertex(VertexType.X, q, r, phase=1)
                g.add_edge((t, v1))
            elif p1 == 'Y':
                q += dq; r += dr
                v1 = g.add_vertex(VertexType.Z, q, r, phase=1)
                q += dq; r += dr
                v = g.add_vertex(VertexType.X, q, r, phase=1)
                g.add_edge((v1, v))
                g.add_edge((v, t))
            elif p1 == 'Z':
                q += dq; r += dr
                v1 = g.add_vertex(VertexType.Z, q, r, phase=1)
                g.add_edge((t, v1))
            
            g.add_edge((v0,v1), et)
        return g




# def transpose_corrections(c: Dict[VT, Set[VT]]) -> Dict[VT, Set[VT]]:
#     ct: Dict[VT, Set[VT]] = dict()
#     for k,s in c.items():
#         for v in s:
#             if v not in ct: ct[v] = set()
#             ct[v].add(k)
#     return ct

def compute_pauli_webs(g: BaseGraph[VT,ET], backwards:bool=True, debug:Optional[Dict[str,Any]]=None) -> Tuple[Dict[VT, int], Dict[VT, PauliWeb[VT,ET]], Dict[VT, PauliWeb[VT,ET]]]:
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
        q, r = g1.qubit(b), g1.row(b)
        if ((vt == VertexType.Z and et == EdgeType.SIMPLE) or
            (vt == VertexType.X and et == EdgeType.HADAMARD)):
            v0 = g1.add_vertex(VertexType.X, qubit=q, row=r)
            v1 = g1.add_vertex(VertexType.Z, qubit=q, row=r)
        else:
            v0 = g1.add_vertex(VertexType.Z, qubit=q, row=r)
            v1 = g1.add_vertex(VertexType.X, qubit=q, row=r)
        g1.add_edge((v, v0), et)
        g1.add_edge((v0, v1), EdgeType.SIMPLE)
        g1.add_edge((v1, b), EdgeType.SIMPLE)
        color_edge[v0] = (b, v)
        boundary[v0] = b
        boundary[v1] = b

    if not debug is None:
        debug['g1'] = g1

    gf = gflow(g1, focus=True, reverse=backwards, pauli=True)
    if not gf:
        raise ValueError("Graph must have gFlow")
    order, corr = gf
    vset = g.vertex_set()
    order = { v: i for v,i in order.items() if v in vset and not phase_is_clifford(g.phase(v)) }

    zwebs: Dict[VT, PauliWeb[VT,ET]] = dict()
    xwebs: Dict[VT, PauliWeb[VT,ET]] = dict()
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
