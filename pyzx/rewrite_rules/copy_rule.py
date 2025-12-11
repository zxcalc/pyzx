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
This module contains the implementation of the copy rule

This rule acts on one vertex. The check function returns a boolean indicating whether
the rule can be applied to the two given vertices. The standard version of the applier will automatically
call the basic checker, while the unsafe version of the applier will assume that the given input is correct and will apply
the rule without running the check first.

This rewrite rule can be called using simplify.copy_simp.apply(g, v) or simplify.copy_simp(g).
"""

__all__ = ['check_copy',
           'copy',
           'unsafe_copy',]

from typing import Optional
from pyzx.utils import EdgeType, VertexType, toggle_vertex, vertex_is_zx

from pyzx.graph.base import BaseGraph, ET, VT


def check_copy(
        g: BaseGraph[VT,ET],
        v: VT
        ) -> bool:
    """Checks if input is an arity-1 spider (with a 0 or pi phase) that can be copied through its neighbor."""

    if not (v in g.vertices()): return False

    if g.phase(v) not in (0,1) or g.type(v) == VertexType.BOUNDARY or g.vertex_degree(v) != 1:
        return False

    w = list(g.neighbors(v))[0]

    tv = g.type(v)
    if tv == VertexType.H_BOX: tv = VertexType.Z # v is arity 1, so we can treat it as a Z spider
    tw = g.type(w)
    if tw == VertexType.BOUNDARY: return False
    et = g.edge_type(g.edge(v,w))

    if not vertex_is_zx(tv): return False

    copy_type: Optional[VertexType]  = check_copy_zx(g, v, w)
    if copy_type is not None: return True

    copy_type = check_copy_h(g, v, w)
    if copy_type is not None: return True

    return False


def check_copy_zx(
        g: BaseGraph[VT,ET],
        v: VT,
        w: VT) -> Optional[VertexType]:
    """Checks if the two given vertices are zx spiders and if v can be copied through its neighbor."""
    tv = g.types()[v]
    tw = g.types()[w]
    et = g.edge_type(g.edge(v, w))

    if vertex_is_zx(tw):
        if et == EdgeType.HADAMARD:
            if tw != tv: return None
            return toggle_vertex(tv)
        else:
            if tw == tv: return None
            return tv

    return None


def check_copy_h(
        g: BaseGraph[VT,ET],
        v: VT,
        w: VT) -> Optional[VertexType]:
    """Checks if the w is a H-box and if v can be copied through its neighbor."""
    tv = g.types()[v]
    tw = g.types()[w]
    et = g.edge_type(g.edge(v, w))

    if tw == VertexType.H_BOX:
        # X pi/0 can always copy through H-box
        # But if v is Z, then it can only copy if the phase is 1
        if et == EdgeType.HADAMARD:
            if tv == VertexType.Z:
                if g.phases()[v] == 1:
                    return VertexType.BOUNDARY  # We don't actually copy in this case
                else:
                    return VertexType.Z
            else:
                if g.phases()[v] != 1: return None
                return VertexType.X

        else:
            if tv == VertexType.X:
                if g.phases()[v] == 1:
                    return VertexType.BOUNDARY  # We don't actually copy in this case
                else:
                    return VertexType.Z
            else:
                if g.phases()[v] != 1: return None
                return VertexType.X
    else : return None


def copy(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Checks if the given vertex can be copied through its neighbor, and then applies the rule"""
    match: bool
    if check_copy(g, v):
        unsafe_copy(g, v)
        return True
    return False


def unsafe_copy(
        g: BaseGraph[VT,ET],
        v: VT
        ) -> bool:
    """Copy arity-1 spider through their neighbor."""
    rem = []
    types = g.types()

    w = list(g.neighbors(v))[0]
    a = g.phases()[v]
    alpha = g.phases()[w]
    neigh_edges = [e for e in g.incident_edges(w) if v not in g.edge_st(e)]

    rem.append(v)

    copy_type: Optional[VertexType]  = check_copy_zx(g, v, w)
    if copy_type is None: copy_type = check_copy_h(g, v, w)

    if copy_type == VertexType.BOUNDARY:
        g.scalar.add_power(1)
        return True

    rem.append(w)
    if vertex_is_zx(types[w]):
        if a: g.scalar.add_phase(alpha)
        g.scalar.add_power(-(len(neigh_edges)-1))

    else: #types[w] == H_BOX
        if copy_type == VertexType.Z:
            g.scalar.add_power(1)
        else:
            g.scalar.add_power(-(len(neigh_edges)-2))
            if alpha != 1:
                g.scalar.add_power(-2)
                g.scalar.add_node(alpha+1)

    for edge in neigh_edges:
        st = g.edge_st(edge)
        n = st[0] if st[1] == w else st[1]
        r = 0.7*g.row(w) + 0.3*g.row(n)
        q = 0.7*g.qubit(w) + 0.3*g.qubit(n)

        assert copy_type is not None
        u = g.add_vertex(copy_type, q, r, a)
        et = g.edge_type(edge)
        g.add_edge((n,u), et)

    g.remove_vertices(rem)
    return True


