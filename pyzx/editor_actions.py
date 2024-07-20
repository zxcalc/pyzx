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
from collections import defaultdict
from fractions import Fraction

from typing import Callable, Optional, List, Dict, Tuple

from .utils import EdgeType, VertexType, FractionLike
from .utils import toggle_edge, vertex_is_zx, toggle_vertex
from .graph.base import BaseGraph, VT, ET, upair
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


def color_change(g: BaseGraph[VT,ET], matches: List[VT]) -> rules.RewriteOutputType[VT,ET]:
    for v in matches:
        g.set_type(v, toggle_vertex(g.type(v)))
        for e in g.incident_edges(v):
            g.set_edge_type(e, toggle_edge(g.edge_type(e)))
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
               ) -> rules.RewriteOutputType[VT,ET]:
    """Pushes a Pauli (i.e. a pi phase) through another spider."""
    rem_verts: List[VT] = []
    rem_edges: List[ET] = []
    etab: Dict[Tuple[VT,VT], List[int]] = dict()
    for w,v in matches:  # w is a Pauli and v is the spider we are gonna push it through
        if g.vertex_degree(w) == 2:
            rem_verts.append(w)
            l = list(g.neighbors(w))
            l.remove(v)
            v2 = l[0]
            et1 = g.edge_type(g.edge(v,w))
            et2 = g.edge_type(g.edge(v2,w))
            etab[upair(v,v2)] = [1,0] if et1 == et2 else [0,1]
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
        for edge in g.incident_edges(v):
            st = g.edge_st(edge)
            n = st[0] if st[1] == v else st[1]
            if n == w: continue
            r = 0.5*(g.row(n) + g.row(v))
            q = 0.5*(g.qubit(n) + g.qubit(v))
            et = g.edge_type(edge)
            rem_edges.append(edge)
            w2 = g.add_vertex(t,q,r,p)
            etab[upair(v,w2)] = [1,0]
            etab[upair(n,w2)] = [1,0] if et == EdgeType.SIMPLE else [0,1]
            new_verts.append(w2)
        if not vertex_is_zx(g.type(v)): # v is H_BOX
            if len(new_verts) == 2:
                etab[upair(new_verts[0],new_verts[1])] = [0,1]
            else:
                r = (g.row(v) + sum(g.row(n) for n in new_verts)) / (len(new_verts) + 1)
                q = (g.qubit(v) + sum(g.qubit(n) for n in new_verts))/(len(new_verts)+1)
                h = g.add_vertex(VertexType.H_BOX,q,r,Fraction(1))
                for n in new_verts: etab[upair(h,n)] = [1,0]
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
                    ) -> rules.RewriteOutputType[VT,ET]:
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
            etab[upair(v,v1)] = [1,0]
            etab[upair(v,v2)] = [1,0]
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
            etab[upair(v2,w1)] = [1,0]
            r = 0.5*g.row(v1) + 0.5*g.row(v2)
            q = 0.5*g.qubit(v1) + 0.5*g.qubit(v2)
            w2 = g.add_vertex(VertexType.X,q,r,Fraction(1,2))
            etab[upair(w1,w2)] = [1,0]
            r = 0.75*g.row(v1) + 0.25*g.row(v2)
            q = 0.75*g.qubit(v1) + 0.25*g.qubit(v2)
            w3 = g.add_vertex(VertexType.Z,q,r,Fraction(1,2))
            etab[upair(w2,w3)] = [1,0]
            etab[upair(w3,v1)] = [1,0]
            g.scalar.add_phase(Fraction(7,4))
            
    return (etab, [], rem_edges, False)

def add_Z_identity(g: BaseGraph[VT,ET], 
        matches: List[ET]
        ) -> rules.RewriteOutputType[VT,ET]:
    rem_edges = []
    etab = {}
    for e in matches:
        rem_edges.append(e)
        et = g.edge_type(e)
        v1,v2 = g.edge_st(e)
        r = 0.5*(g.row(v1) + g.row(v2))
        q = 0.5*(g.qubit(v1) + g.qubit(v2))
        w = g.add_vertex(VertexType.Z, q,r, 0)
        etab[upair(v1,w)] = [1,0] if et == EdgeType.SIMPLE else [0,1]
        etab[upair(v2,w)] = [1,0]
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
        ) -> rules.RewriteOutputType[VT,ET]:
    rem_verts = []
    etab = {}
    for v1, v2 in matches:
        rem_verts.append(v1)
        rem_verts.append(v2)
        v = (v1,v2)
        new_verts: Tuple[List[VT],List[VT]] = ([],[]) # new vertices for v1 and v2

        for i, j in [(0, 1), (1, 0)]:
            multi_edge_found = False
            for e in g.incident_edges(v[i]):
                source, target = g.edge_st(e)
                other_vertex = source if source != v[i] else target
                if other_vertex != v[j] or multi_edge_found:
                    q = 0.4*g.qubit(other_vertex) + 0.6*g.qubit(v[i])
                    r = 0.4*g.row(other_vertex) + 0.6*g.row(v[i])
                    newv = g.add_vertex(g.type(v[j]), qubit=q, row=r)
                    g.set_phase(newv, g.phase(v[j]))
                    new_verts[i].append(newv)
                    if other_vertex == v[j]:
                        q = 0.4*g.qubit(v[i]) + 0.6*g.qubit(other_vertex)
                        r = 0.4*g.row(v[i]) + 0.6*g.row(other_vertex)
                        newv2 = g.add_vertex(g.type(v[i]), qubit=q, row=r)
                        new_verts[j].append(newv2)
                        other_vertex = newv2
                    if upair(newv, other_vertex) not in etab:
                        etab[upair(newv, other_vertex)] = [0, 0]
                    type_index = 0 if g.edge_type(e) == EdgeType.SIMPLE else 1
                    etab[upair(newv, other_vertex)][type_index] += 1
                elif i == 0: # only add new vertex once
                    multi_edge_found = True

        for n1 in new_verts[0]:
            for n2 in new_verts[1]:
                if upair(n1,n2) not in etab:
                    etab[upair(n1,n2)] = [0, 0]
                etab[upair(n1,n2)][0] += 1

        if g.type(v1) == VertexType.H_BOX or g.type(v2) == VertexType.H_BOX: # x-h bialgebra
            x_vertex = v1 if g.type(v2) == VertexType.H_BOX else v2
            g.scalar.add_power(g.vertex_degree(x_vertex)-2)
        else: # z-x bialgebra
            g.scalar.add_power((g.vertex_degree(v1)-2)*(g.vertex_degree(v2)-2))
    return (etab, rem_verts, [], False)


def match_bialgebra_op(g: BaseGraph[VT,ET],
        vertexf: Optional[Callable[[VT], bool]] = None,
        vertex_type: Optional[Tuple[VertexType, VertexType]] = None
        ) -> Optional[Tuple[List[VT], List[VT]]]:
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    if vertex_type is not None:
        vtype1, vtype2 = vertex_type
    else:
        vtype1, vtype2 = VertexType.Z, VertexType.X
    type1_vertices = [v for v in candidates if g.type(v) == vtype1]
    type2_vertices = [v for v in candidates if g.type(v) == vtype2]
    if len(type1_vertices) == 0 or len(type2_vertices) == 0:
        return None
    # if all type1 vertices are connected to all type2 vertices with a simple edge, then they are a match
    for v1 in type1_vertices:
        for v2 in type2_vertices:
            edges = list(g.edges(v1, v2))
            if not (len(edges) == 1 and g.edge_type(edges[0]) == EdgeType.SIMPLE):
                return None
    return type1_vertices, type2_vertices

def bialgebra_op(g: BaseGraph[VT,ET],
        matches: Tuple[List[VT], List[VT]]
        ) -> rules.RewriteOutputType[VT,ET]:
    def get_neighbors_and_loops(type1_vertices: List[VT], type2_vertices: List[VT]) -> Tuple[List[Tuple[VT, EdgeType]], List[EdgeType]]:
        neighbors: List[Tuple[VT, EdgeType]] = []
        loops: List[EdgeType] = []
        for v1 in type1_vertices:
            for edge in g.incident_edges(v1):
                edge_st = g.edge_st(edge)
                neighbor = edge_st[0] if edge_st[0] != v1 else edge_st[1]
                if neighbor in type2_vertices:
                    continue
                elif neighbor in type1_vertices:
                    if v1 > neighbor:
                        loops.append(g.edge_type(edge))
                else:
                    neighbors.append((neighbor, g.edge_type(edge)))
        return neighbors, loops

    def add_vertex_with_averages(vertices, g, vtype):
        average_row = sum(g.row(v) for v in vertices) / len(vertices)
        average_qubit = sum(g.qubit(v) for v in vertices) / len(vertices)
        return g.add_vertex(vtype, average_qubit, average_row)

    def update_etab(etab, new_vertex, neighbors, loops):
        for n, et in neighbors + [(new_vertex, et) for et in loops]:
            etab[upair(new_vertex, n)][0 if et == EdgeType.SIMPLE else 1] += 1

    type1_vertices, type2_vertices = matches
    neighbors1, loops1 = get_neighbors_and_loops(type1_vertices, type2_vertices)
    neighbors2, loops2 = get_neighbors_and_loops(type2_vertices, type1_vertices)

    new_vertex1 = add_vertex_with_averages(type1_vertices, g, g.type(type2_vertices[0]))
    new_vertex2 = add_vertex_with_averages(type2_vertices, g, g.type(type1_vertices[0]))

    etab: dict = defaultdict(lambda: [0, 0])
    etab[upair(new_vertex1, new_vertex2)] = [1, 0]
    update_etab(etab, new_vertex1, neighbors1, loops1)
    update_etab(etab, new_vertex2, neighbors2, loops2)

    g.scalar.add_power(-(len(neighbors1)-1)*(len(neighbors2)-1)) #TODO: not sure if this is correct

    return (etab, type1_vertices + type2_vertices, [], False)

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
    "bialgebra_op": {"text": "bialgebra_op",
               "tooltip": "Applies the bialgebra rule to a connected pair of Z and X spiders in the opposite direction",
               "matcher": match_bialgebra_op,
               "rule": bialgebra_op,
               "type": MATCHES_VERTICES},
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
