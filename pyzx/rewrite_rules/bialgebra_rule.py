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

__all__ = ['check_bialgebra_reduce',
           'check_bialgebra',
           'bialgebra',
           'unsafe_bialgebra']

from collections import defaultdict
from typing import Callable, Optional, List, Tuple, Dict
from pyzx.utils import EdgeType, VertexType, is_pauli
from pyzx.graph.base import BaseGraph, VT, ET, upair

from pyzx.rewrite_rules.rules import RewriteOutputType

def check_bialgebra(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    """Checks if the bialgebra rule can be applied to a given pair of vertices."""
    if not (v1 in g.vertices() and v2 in g.vertices()): return False

    return (((g.type(v1) == VertexType.X and g.type(v2) == VertexType.Z) or
             (g.type(v1) == VertexType.Z and g.type(v2) == VertexType.X)) and
            is_pauli(g.phase(v1)) and
            is_pauli(g.phase(v2)) and
            g.num_edges(v1, v2) == 1 and  # there is exactly 1 edge between vertices
            g.num_edges(v1, v1) == 0 and  # there are no self-loops on v1
            g.num_edges(v2, v2) == 0 and  # there are no self-loops on v2
            EdgeType.SIMPLE in [g.edge_type(edge) for edge in g.edges(v1,v2)])

def check_bialgebra_reduce(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    """Checks if the bialgebra rule can be applied to a given pair of vertices.
    NOTE: only returns true if the match of the spiders are neighbouring other
    spiders not a boundary vertex."""
    if not (v1 in g.vertices() and v2 in g.vertices()): return False

    v1n = [n for n in g.neighbors(v1) if not n == v2]
    v2n = [n for n in g.neighbors(v2) if not n == v1]
    if (check_bialgebra(g, v1, v2) and
        all([g.type(n) == g.type(v2) and g.phase(n) == 0 for n in v1n]) and  # all neighbors of v1 are of the same type as v2
        all([g.type(n) ==  g.type(v1) and g.phase(n) == 0 for n in v2n]) and  # all neighbors of v0 are of the same type as v1
        EdgeType.SIMPLE in [g.edge_type(edge) for edge in g.edges(v1,v2)]):
        return True
    return False

def bialgebra(g: BaseGraph[VT, ET], v1: VT, v2: VT) -> bool:
    if not check_bialgebra(g, v1, v2): return False
    return unsafe_bialgebra(g, v1, v2)

def unsafe_bialgebra(g: BaseGraph[VT,ET], v1: VT, v2: VT ) -> bool:
    """Applies the bialgebra rule to a given pair of Z and X spiders"""
    rem_verts = []
    etab = {}

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

    g.remove_vertices(rem_verts)
    g.add_edge_table(etab)
    return True


#TODO: fix this to work with Rewrite class

def match_bialgebra_op(g: BaseGraph[VT,ET],
        vertexf: Optional[Callable[[VT], bool]] = None,
        vertex_type: Optional[Tuple[VertexType, VertexType]] = None,
        edge_type: Optional[EdgeType] = None
        ) -> Optional[Tuple[List[VT], List[VT]]]:
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    if vertex_type is not None:
        vtype1, vtype2 = vertex_type
    else:
        vtype1, vtype2 = VertexType.Z, VertexType.X
    if edge_type is None:
        edge_type = EdgeType.SIMPLE
    type1_vertices = [v for v in candidates if g.type(v) == vtype1]
    type2_vertices = [v for v in candidates if g.type(v) == vtype2]
    if len(type1_vertices) <= 1 or len(type2_vertices) <= 1:
        return None
    #the vertices must be phase-free
    for v in type1_vertices + type2_vertices:
        if g.phase(v) != 0:
            return None
    # the vertices must have one external edge
    for v1 in type1_vertices:
        if g.vertex_degree(v1) != len(type2_vertices) + 1:
            return None
    for v2 in type2_vertices:
        if g.vertex_degree(v2) != len(type1_vertices) + 1:
            return None
    # if all type1 vertices are connected to all type2 vertices with a simple edge, then they are a match
    for v1 in type1_vertices:
        for v2 in type2_vertices:
            edges = list(g.edges(v1, v2))
            if not (len(edges) == 1 and g.edge_type(edges[0]) == edge_type):
                return None
    return type1_vertices, type2_vertices

def bialgebra_op(g: BaseGraph[VT,ET],
        matches: Tuple[List[VT], List[VT]],
        edge_type: Optional[EdgeType] = EdgeType.SIMPLE
        ) -> RewriteOutputType[VT,ET]:
    """Applies the bialgebra rule to a connected pair of Z and X spiders in the opposite direction"""
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
    if edge_type == EdgeType.SIMPLE:
        etab[upair(new_vertex1, new_vertex2)] = [1, 0]
    else:
        etab[upair(new_vertex1, new_vertex2)] = [0, 1]
    update_etab(etab, new_vertex1, neighbors1, loops1)
    update_etab(etab, new_vertex2, neighbors2, loops2)

    g.scalar.add_power(-(len(neighbors1)-1)*(len(neighbors2)-1))

    return (etab, type1_vertices + type2_vertices, [], False)
