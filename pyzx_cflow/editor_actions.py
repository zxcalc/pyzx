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


import json
from fractions import Fraction

from typing import Callable, Optional, List, Tuple

from .utils import EdgeType, VertexType, FractionLike
from .utils import toggle_edge, vertex_is_zx, toggle_vertex
from .graph.base import BaseGraph, VT, ET
from . import rules
from . import hrules


def match_X_spiders(
        g: BaseGraph[VT, ET],
        vertexf: Optional[Callable[[VT], bool]] = None
        ) -> List[VT]:
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    types = g.types()

    return [v for v in candidates if types[v] == VertexType.X]


def match_Z_spiders(
        g: BaseGraph[VT, ET],
        vertexf: Optional[Callable[[VT], bool]] = None
        ) -> List[VT]:
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    types = g.types()

    return [v for v in candidates if types[v] == VertexType.Z]


def color_change(g: BaseGraph[VT,ET], matches: List[VT]) -> rules.RewriteOutputType[ET,VT]:
    for v in matches:
        g.set_type(v, toggle_vertex(g.type(v)))
        for e in g.incident_edges(v):
            et = g.edge_type(e)
            g.set_edge_type(e, toggle_edge(et))
    return ({}, [],[],False)


def pauli_matcher(
        g: BaseGraph[VT,ET], 
        vertexf: Optional[Callable[[VT],bool]] = None
        ) -> List[Tuple[VT,VT]]:
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    phases = g.phases()
    types = g.types()
    m: List[Tuple[VT,VT]] = []
    paulis = {v for v in candidates
                if phases[v] == 1 and vertex_is_zx(types[v])}
    if not paulis: return m
    while len(candidates) > 0:
        v = candidates.pop()
        if v in paulis and g.vertex_degree(v) == 2: continue
        for w in g.neighbors(v):
            if w in paulis: break
        else:
            continue
        et = g.edge_type(g.edge(v,w))
        if ((types[v] == types[w] and et == EdgeType.HADAMARD) or
            (vertex_is_zx(types[v]) and types[v] != types[w] and et == EdgeType.SIMPLE) or
            (types[v] == VertexType.H_BOX and phases[v] == 1 and (
                (et == EdgeType.SIMPLE and types[w] == VertexType.X) or
                (et == EdgeType.HADAMARD and types[w] == VertexType.Z)))
            ):
            m.append((w,v))
            candidates.difference_update(g.neighbors(v))
            candidates.difference_update(g.neighbors(w))
    return m


def pauli_push(g: BaseGraph[VT,ET], 
               matches: List[Tuple[VT,VT]]
               ) -> rules.RewriteOutputType[ET,VT]:
    """Pushes a Pauli (i.e. a pi phase) through another spider."""
    rem_verts = []
    rem_edges = []
    etab = {}
    for w,v in matches:  # w is a Pauli and v is the spider we are gonna push it through
        if g.vertex_degree(w) == 2:
            rem_verts.append(w)
            l = list(g.neighbors(w))
            l.remove(v)
            v2 = l[0]
            et1 = g.edge_type(g.edge(v,w))
            et2 = g.edge_type(g.edge(v2,w))
            etab[g.edge(v,v2)] = [1,0] if et1 == et2 else [0,1]
        else:
            g.set_phase(w,0)

        new_verts = []
        if vertex_is_zx(g.type(v)): 
            g.scalar.add_phase(g.phase(v))
            g.set_phase(v,(-g.phase(v)) % 2)
            t = toggle_vertex(g.type(v))
            p: FractionLike = Fraction(1)
        else: 
            t = VertexType.Z
            p = 0
        for n in g.neighbors(v):
            if n == w: continue
            r = 0.5*(g.row(n) + g.row(v))
            q = 0.5*(g.qubit(n) + g.qubit(v))
            e = g.edge(n,v)
            et = g.edge_type(e)
            rem_edges.append(e)
            w2 = g.add_vertex(t,q,r,p)
            etab[g.edge(v,w2)] = [1,0]
            etab[g.edge(n,w2)] = [1,0] if et == EdgeType.SIMPLE else [0,1]
            new_verts.append(w2)
        if not vertex_is_zx(g.type(v)): # v is H_BOX
            if len(new_verts) == 2:
                etab[g.edge(new_verts[0],new_verts[1])] = [0,1]
            else:
                r = (g.row(v) + sum(g.row(n) for n in new_verts)) / (len(new_verts) + 1)
                q = (g.qubit(v) + sum(g.qubit(n) for n in new_verts))/(len(new_verts)+1)
                h = g.add_vertex(VertexType.H_BOX,q,r,Fraction(1))
                for n in new_verts: etab[g.edge(h,n)] = [1,0]
    return (etab, rem_verts, rem_edges, False)


def match_hadamard_edge(
        g: BaseGraph[VT,ET], 
        edgef: Optional[Callable[[ET],bool]] = None
        ) -> List[ET]:
    if edgef is not None: candidates = set([e for e in g.edges() if edgef(e)])
    else: candidates = g.edge_set()
    return [e for e in candidates if g.edge_type(e)==EdgeType.HADAMARD]


def match_edge(
        g: BaseGraph[VT,ET], 
        edgef: Optional[Callable[[ET],bool]] = None
        ) -> List[ET]:
    if edgef is not None: candidates = set([e for e in g.edges() if edgef(e)])
    else: candidates = g.edge_set()
    return list(candidates)


def euler_expansion(g: BaseGraph[VT,ET], 
                    matches: List[ET]
                    ) -> rules.RewriteOutputType[ET,VT]:
    """Expands the given Hadamard-edges into pi/2 phases using its Euler decomposition."""
    types = g.types()
    phases = g.phases()
    rem_edges = []
    etab = {}
    for e in matches:
        rem_edges.append(e)
        v1,v2 = g.edge_st(e)
        if vertex_is_zx(types[v1]) and types[v1] == types[v2]:
            r = 0.5*(g.row(v1) + g.row(v2))
            q = 0.5*(g.qubit(v1) + g.qubit(v2))
            t = toggle_vertex(types[v1])
            v = g.add_vertex(t,q,r)
            etab[g.edge(v,v1)] = [1,0]
            etab[g.edge(v,v2)] = [1,0]
            if phases[v1] == Fraction(1,2) or phases[v2] == Fraction(1,2):
                g.add_to_phase(v1,Fraction(3,2))
                g.add_to_phase(v2,Fraction(3,2))
                g.set_phase(v, Fraction(3,2))
                g.scalar.add_phase(Fraction(1,4))
            else:
                g.add_to_phase(v1,Fraction(1,2))
                g.add_to_phase(v2,Fraction(1,2))
                g.set_phase(v, Fraction(1,2))
                g.scalar.add_phase(Fraction(7,4))
        else:
            r = 0.25*g.row(v1) + 0.75*g.row(v2)
            q = 0.25*g.qubit(v1) + 0.75*g.qubit(v2)
            w1 = g.add_vertex(VertexType.Z,q,r,Fraction(1,2))
            etab[g.edge(v2,w1)] = [1,0]
            r = 0.5*g.row(v1) + 0.5*g.row(v2)
            q = 0.5*g.qubit(v1) + 0.5*g.qubit(v2)
            w2 = g.add_vertex(VertexType.X,q,r,Fraction(1,2))
            etab[g.edge(w1,w2)] = [1,0]
            r = 0.75*g.row(v1) + 0.25*g.row(v2)
            q = 0.75*g.qubit(v1) + 0.25*g.qubit(v2)
            w3 = g.add_vertex(VertexType.Z,q,r,Fraction(1,2))
            etab[g.edge(w2,w3)] = [1,0]
            etab[g.edge(w3,v1)] = [1,0]
            g.scalar.add_phase(Fraction(7,4))
            
    return (etab, [], rem_edges, False)

def add_Z_identity(g: BaseGraph[VT,ET], 
        matches: List[ET]
        ) -> rules.RewriteOutputType[ET,VT]:
    rem_edges = []
    etab = {}
    for e in matches:
        rem_edges.append(e)
        et = g.edge_type(e)
        v1,v2 = g.edge_st(e)
        r = 0.5*(g.row(v1) + g.row(v2))
        q = 0.5*(g.qubit(v1) + g.qubit(v2))
        w = g.add_vertex(VertexType.Z, q,r, 0)
        etab[g.edge(v1,w)] = [1,0] if et == EdgeType.SIMPLE else [0,1]
        etab[g.edge(v2,w)] = [1,0]
    return (etab, [], rem_edges, False)

def match_bialgebra(g: BaseGraph[VT,ET], 
        edgef: Optional[Callable[[ET],bool]] = None
        ) -> List[Tuple[VT,VT]]:
    if edgef is not None: candidates = set([e for e in g.edges() if edgef(e)])
    else: candidates = g.edge_set()
    m = []
    types = g.types()
    phases = g.phases()
    while len(candidates) > 0:
        e = candidates.pop()
        if g.edge_type(e) != EdgeType.SIMPLE: continue
        v,w = g.edge_st(e)
        if types[v] != VertexType.X:
            v,w = w,v
        if types[v] != VertexType.X: continue
        if types[w] == VertexType.Z:
            if phases[v] != 0 or phases[w] != 0: continue
            m.append((v,w))
            for n in g.neighbors(v):
                candidates.difference_update(g.incident_edges(n))
            for n in g.neighbors(w):
                candidates.difference_update(g.incident_edges(n))
        if types[w] == VertexType.H_BOX:
            if phases[v] != 0 or phases[w] != 1: continue
            m.append((v,w))
            for n in g.neighbors(v):
                candidates.difference_update(g.incident_edges(n))
            for n in g.neighbors(w):
                candidates.difference_update(g.incident_edges(n))
    return m

def bialgebra(g: BaseGraph[VT,ET], 
        matches: List[Tuple[VT,VT]]
        ) -> rules.RewriteOutputType[ET,VT]:
    rem_verts = []
    etab = {}
    for v,w in matches:
        rem_verts.append(v)
        rem_verts.append(w)
        new_verts = []
        # v is an X-spider, but w is either a Z-spider or an H-box
        t = g.type(w)
        for n in g.neighbors(v):
            if n == w: continue
            r = 0.6*g.row(v) + 0.4*g.row(n)
            q = 0.6*g.qubit(v) + 0.4*g.qubit(n)
            v2 = g.add_vertex(t,q,r)
            etab[g.edge(n,v2)] = [1,0] if g.edge_type(g.edge(n,v)) == EdgeType.SIMPLE else [0,1]
            new_verts.append(v2)
        if g.type(w) == VertexType.Z:
            t = VertexType.X
            g.scalar.add_power((g.vertex_degree(v)-2)*(g.vertex_degree(w)-2))
        else: #g.type(w) == VertexType.H_BOX
            t = VertexType.Z
            g.scalar.add_power(g.vertex_degree(v)-2)
        for n in g.neighbors(w):
            if n == v: continue
            r = 0.6*g.row(w) + 0.4*g.row(n)
            q = 0.6*g.qubit(w) + 0.4*g.qubit(n)
            w2 = g.add_vertex(t,q,r)
            etab[g.edge(n,w2)] = [1,0] if g.edge_type(g.edge(n,w)) == EdgeType.SIMPLE else [0,1]
            for v2 in new_verts:
                etab[g.edge(w2,v2)] = [1,0]
    return (etab, rem_verts, [], False)
            

MATCHES_VERTICES = 1
MATCHES_EDGES = 2

operations = {
    "spider": {"text": "fuse spiders", 
               "tooltip": "Fuses connected spiders of the same color",
               "matcher": rules.match_spider_parallel, 
               "rule": rules.spider, 
               "type": MATCHES_EDGES},
    "to_z": {"text": "change color to Z", 
               "tooltip": "Changes X spiders into Z spiders by pushing out Hadamards",
               "matcher": match_X_spiders, 
               "rule": color_change, 
               "type": MATCHES_VERTICES},
    "to_x": {"text": "change color to X", 
               "tooltip": "Changes Z spiders into X spiders by pushing out Hadamards",
               "matcher": match_Z_spiders, 
               "rule": color_change, 
               "type": MATCHES_VERTICES},
    "rem_id": {"text": "remove identity", 
               "tooltip": "Removes a 2-ary phaseless spider",
               "matcher": rules.match_ids_parallel, 
               "rule": rules.remove_ids, 
               "type": MATCHES_VERTICES},
    "id_z": {"text": "Add Z identity", 
               "tooltip": "Adds a phaseless arity 2 Z spider on the selected edges",
               "matcher": match_edge, 
               "rule": add_Z_identity, 
               "type": MATCHES_EDGES},
    "z_to_z_box": {"text": "Convert Z-spider to Z-box",
                "tooltip": "Converts a Z-spider into a Z-box",
                "matcher": rules.match_z_to_z_box_parallel,
                "rule": rules.z_to_z_box,
                "type": MATCHES_VERTICES},
    "had2edge": {"text": "Convert H-box", 
               "tooltip": "Converts an arity 2 H-box into an H-edge.",
               "matcher": hrules.match_hadamards, 
               "rule": hrules.hadamard_to_h_edge, 
               "type": MATCHES_VERTICES},
    "fuse_hbox": {"text": "Fuse H-boxes", 
               "tooltip": "Merges two adjacent H-boxes together",
               "matcher": hrules.match_connected_hboxes, 
               "rule": hrules.fuse_hboxes, 
               "type": MATCHES_EDGES},
    "mult_hbox": {"text": "Multiply H-boxes", 
               "tooltip": "Merges groups of H-boxes that have the same connectivity",
               "matcher": hrules.match_par_hbox, 
               "rule": hrules.par_hbox, 
               "type": MATCHES_VERTICES},
    "fuse_w": {"text": "fuse W nodes",
               "tooltip": "Merges two connected W nodes together",
               "matcher": rules.match_w_fusion_parallel,
                "rule": rules.w_fusion,
                "type": MATCHES_EDGES},
    "copy": {"text": "copy 0/pi spider", 
               "tooltip": "Copies a single-legged spider with a 0/pi phase through its neighbor",
               "matcher": hrules.match_copy, 
               "rule": hrules.apply_copy, 
               "type": MATCHES_VERTICES},
    "pauli": {"text": "push Pauli", 
               "tooltip": "Pushes an arity 2 pi-phase through a selected neighbor",
               "matcher": pauli_matcher, 
               "rule": pauli_push, 
               "type": MATCHES_VERTICES},
    "bialgebra": {"text": "bialgebra", 
               "tooltip": "Applies the bialgebra rule to a connected pair of Z and X spiders",
               "matcher": match_bialgebra, 
               "rule": bialgebra, 
               "type": MATCHES_EDGES},
    "euler": {"text": "decompose Hadamard", 
               "tooltip": "Expands a Hadamard-edge into its component spiders using its Euler decomposition",
               "matcher": match_hadamard_edge, 
               "rule": euler_expansion, 
               "type": MATCHES_EDGES},
    "lcomp": {"text": "local complementation", 
               "tooltip": "Deletes a spider with a pi/2 phase by performing a local complementation on its neighbors",
               "matcher": rules.match_lcomp_parallel, 
               "rule": rules.lcomp, 
               "type": MATCHES_VERTICES},
    "pivot": {"text": "pivot", 
               "tooltip": "Deletes a pair of spiders with 0/pi phases by performing a pivot",
               "matcher": lambda g, matchf: rules.match_pivot_parallel(g, matchf, check_edge_types=True), 
               "rule": rules.pivot, 
               "type": MATCHES_EDGES}
}


def operations_to_js() -> str:
    global operations
    return json.dumps({k:
            {"active":False, 
             "text":v["text"], 
             "tooltip":v["tooltip"]
            } for k,v in operations.items()})
