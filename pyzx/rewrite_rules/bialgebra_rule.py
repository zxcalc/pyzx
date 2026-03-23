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

"""
This module contains the implementation of the bialgebra rule.

This rule acts on two connected vertices, supporting both Z-X bialgebra
and X-H bialgebra (X spider with standard H-box). The check functions
return a boolean indicating whether the rule can be applied to the two
given vertices. The safe version of the applier (bialgebra) will
automatically call the basic checker, while the unsafe version of the
applier will assume that the given input is correct and will apply the
rule without running the check first.

This rewrite rule can be called using simplify.bialg_simp.apply(g, v, w)
or simplify.bialg_simp(g).
"""


__all__ = ['check_bialgebra_reduce',
           'check_bialgebra',
           'bialgebra',
           'unsafe_bialgebra',
           'simp_bialgebra_op',
           'safe_apply_bialgebra_op',
           'is_bialg_op_match',
           ]

from collections import defaultdict
from typing import Callable, Optional, List, Tuple, Dict
from pyzx.utils import (EdgeType, FractionLike, VertexType, is_pauli,
                        is_standard_hbox)
from pyzx.graph.base import BaseGraph, VT, ET, upair

RewriteOutputType = Tuple[Dict[Tuple[VT,VT],List[int]], List[VT], List[ET], bool]


def check_bialgebra(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    """Checks if the bialgebra rule can be applied to a given pair of vertices.
    Supports both Z-X bialgebra and X-H bialgebra (X spider with standard H-box)."""
    if not (v1 in g.vertices() and v2 in g.vertices()): return False

    if not (g.num_edges(v1, v2) == 1 and
            g.num_edges(v1, v1) == 0 and
            g.num_edges(v2, v2) == 0 and
            EdgeType.SIMPLE in [g.edge_type(edge) for edge in g.edges(v1,v2)]):
        return False

    # Z-X bialgebra: both vertices must be Pauli.
    if ((g.type(v1) == VertexType.X and g.type(v2) == VertexType.Z) or
        (g.type(v1) == VertexType.Z and g.type(v2) == VertexType.X)):
        return is_pauli(g.phase(v1)) and is_pauli(g.phase(v2))

    # X-H bialgebra: X spider must be phase-free, H-box must be standard.
    if g.type(v1) == VertexType.X and g.type(v2) == VertexType.H_BOX:
        return g.phase(v1) == 0 and is_standard_hbox(g, v2)
    if g.type(v1) == VertexType.H_BOX and g.type(v2) == VertexType.X:
        return is_standard_hbox(g, v1) and g.phase(v2) == 0

    return False

def _is_valid_reduce_neighbor(g: BaseGraph[VT,ET], n: VT, expected_type: VertexType) -> bool:
    """Checks if a neighbour is valid for bialgebra reduction.
    For H-boxes, requires a standard H-box. For spiders, requires phase 0."""
    if g.type(n) != expected_type:
        return False
    if expected_type == VertexType.H_BOX:
        return is_standard_hbox(g, n)
    return g.phase(n) == 0

def check_bialgebra_reduce(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    """Checks if the bialgebra rule can be applied to a given pair of vertices.
    Supports both Z-X and X-H bialgebra.
    NOTE: only returns true if the spiders are not neighbouring any boundary vertices."""
    if not (v1 in g.vertices() and v2 in g.vertices()): return False

    v1n = [n for n in g.neighbors(v1) if not n == v2]
    v2n = [n for n in g.neighbors(v2) if not n == v1]
    if (check_bialgebra(g, v1, v2) and
        all([_is_valid_reduce_neighbor(g, n, g.type(v2)) for n in v1n]) and
        all([_is_valid_reduce_neighbor(g, n, g.type(v1)) for n in v2n]) and
        EdgeType.SIMPLE in [g.edge_type(edge) for edge in g.edges(v1,v2)]):
        return True
    return False

def bialgebra(g: BaseGraph[VT, ET], v1: VT, v2: VT) -> bool:
    if not check_bialgebra(g, v1, v2): return False
    return unsafe_bialgebra(g, v1, v2)

def unsafe_bialgebra(g: BaseGraph[VT,ET], v1: VT, v2: VT ) -> bool:
    """Applies the bialgebra rule to a given pair of spiders (Z-X or X-H)."""
    rem_verts = []
    etab = {}

    rem_verts.append(v1)
    rem_verts.append(v2)
    v = (v1,v2)
    new_verts: Tuple[List[VT],List[VT]] = ([],[]) # new vertices for v1 and v2

    # Determine the vertex type and phase for copies placed at each side's
    # neighbours. copy_type[i] is the type for new vertices at v[i]'s
    # neighbours; copy_phase[i] is the corresponding phase.
    # For Z-X bialgebra: neighbours of v[i] get copies of v[j].
    # For X-H bialgebra: neighbours of X get H-box copies (phase 1), but
    # neighbours of the H-box get Z spiders (phase 0), not X spiders.
    copy_phase: Tuple[FractionLike, FractionLike]
    if g.type(v1) == VertexType.H_BOX or g.type(v2) == VertexType.H_BOX:
        if g.type(v1) == VertexType.X:
            copy_type = (VertexType.H_BOX, VertexType.Z)
            copy_phase = (1, 0)
        else:
            copy_type = (VertexType.Z, VertexType.H_BOX)
            copy_phase = (0, 1)
    else:
        copy_type = (g.type(v2), g.type(v1))
        copy_phase = (g.phase(v2), g.phase(v1))

    for i, j in [(0, 1), (1, 0)]:
        multi_edge_found = False
        for e in g.incident_edges(v[i]):
            source, target = g.edge_st(e)
            other_vertex = source if source != v[i] else target
            if other_vertex != v[j] or multi_edge_found:
                q = 0.4*g.qubit(other_vertex) + 0.6*g.qubit(v[i])
                r = 0.4*g.row(other_vertex) + 0.6*g.row(v[i])
                newv = g.add_vertex(copy_type[i], qubit=q, row=r)
                g.set_phase(newv, copy_phase[i])
                new_verts[i].append(newv)
                if other_vertex == v[j]:
                    q = 0.4*g.qubit(v[i]) + 0.6*g.qubit(other_vertex)
                    r = 0.4*g.row(v[i]) + 0.6*g.row(other_vertex)
                    newv2 = g.add_vertex(copy_type[j], qubit=q, row=r)
                    g.set_phase(newv2, copy_phase[j])
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
        g.scalar.add_power(-(g.vertex_degree(x_vertex)-2))
    else: # z-x bialgebra
        g.scalar.add_power((g.vertex_degree(v1)-2)*(g.vertex_degree(v2)-2))
        # Phase interaction contributes a factor of (-1)^(phase1 * phase2).
        phase_correction = (g.phase(v1) * g.phase(v2)) % 2
        if phase_correction != 0:
            g.scalar.add_phase(phase_correction)

    g.remove_vertices(rem_verts)
    g.add_edge_table(etab)
    return True

def simp_bialgebra_op(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_bialgebra_op` and if any matches are found runs :func:`unsafe_bialgebra_op`"""
    matches = match_bialgebra_op(g)
    if matches is None: return False
    return unsafe_bialgebra_op(g, matches)

def safe_apply_bialgebra_op(g: BaseGraph[VT,ET], vertices: List[VT]) -> bool:
    """Runs :func:`match_bialgebra_op` on the input vertices and if any matches are found runs :func:`unsafe_bialgebra_op`"""
    checked_vertices = list([v for v in g.vertices() if (v in vertices)])
    matches = match_bialgebra_op(g, checked_vertices)
    if matches is None: return False
    return unsafe_bialgebra_op(g, matches)


def match_bialgebra_op(g: BaseGraph[VT,ET],
        vertices: Optional[List[VT]]=None,
        vertex_type: Optional[Tuple[VertexType, VertexType]] = None,
        edge_type: Optional[EdgeType] = None
        ) -> Optional[Tuple[List[VT], List[VT]]]:
    if vertices is not None: candidates = set(vertices)
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

def is_bialg_op_match(g: BaseGraph[VT,ET],vertices: list[VT]) -> bool:
    """Checks if the given vertices form a valid match for the bialgebra operation."""
    match = match_bialgebra_op(g, vertices)
    return match is not None

def unsafe_bialgebra_op(g: BaseGraph[VT,ET],
        matches: Tuple[List[VT], List[VT]],
        edge_type: Optional[EdgeType] = EdgeType.SIMPLE
        ) -> bool:
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

    g.add_edge_table(etab)
    g.remove_vertices(type1_vertices + type2_vertices)

    return True
