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
This module contains the implementation of the spider fuse rule

This rule acts on two connected vertices. The check function returns a boolean indicating whether
the rule can be applied to the given vertices. The standard version of the applier will automatically
call the basic checker, while the unsafe version of the applier will assume that the given input is correct and will apply
the rule without running the check first.

This rewrite rule can be called using simplify.fuse_simp.apply(g, v, w) or simplify.fuse_simp(g).
"""

__all__ = [
        'check_fuse',
        'fuse',
        'unsafe_fuse']


from pyzx.utils import (get_w_io, get_z_box_label, EdgeType, VertexType,
                        set_z_box_label, vertex_is_w, vertex_is_z_like,
                        FloatInt)
from typing import List, Any, Dict, Tuple
from fractions import Fraction

from pyzx.rewrite_rules.z_to_z_box_rule import unsafe_z_to_z_box
from pyzx.graph.base import BaseGraph, VT, ET

# Fuse spiders

def check_fuse(g: BaseGraph[VT,ET], v: VT, w: VT) -> bool:
    """Checks if two vertices can be fused. Accepts Z, X or w_input/output vertices"""
    if check_fuse_w(g, v, w):
        return True

    if not (v in g.vertices() and w in g.vertices()): return False

    if (g.connected(v, w) and
        ((g.type(v) == VertexType.X and g.type(w) == VertexType.X) or
         (vertex_is_z_like(g.type(v)) and vertex_is_z_like(g.type(w)))) and
        EdgeType.SIMPLE in [g.edge_type(edge) for edge in g.edges(v, w)]):
        return True
    return False

def fuse(g: BaseGraph[VT,ET], v: VT, w: VT) -> bool:
    """Checks if two vertices can be fused and then fuses them."""
    if not check_fuse(g, v, w): return False
    return unsafe_fuse(g, v, w)

def unsafe_fuse(g: BaseGraph[VT,ET], v: VT, w: VT) -> bool:
    """Fuses two vertices into one"""
    if vertex_is_w(g.type(v)):
        return unsafe_fuse_w(g, v, w)

    if g.row(v) == 0:
        v, w = w, v

    ground = g.is_ground(v) or g.is_ground(w)

    if ground:
        g.set_phase(v, 0)
        g.set_ground(v)
    elif g.type(v) == VertexType.Z_BOX or g.type(w) == VertexType.Z_BOX:
        if g.type(v) == VertexType.Z:
            unsafe_z_to_z_box(g, v)
        if g.type(w) == VertexType.Z:
            unsafe_z_to_z_box(g, w)
        g.set_phase(v, 0)
        set_z_box_label(g, v, get_z_box_label(g, v) * get_z_box_label(g, w))
    else:
        g.add_to_phase(v, g.phase(w))

    if g.track_phases:
        g.fuse_phases(v, w)


    etab: Dict[Tuple[VT, VT], List[int]] = dict()

    for e in g.incident_edges(w):
        source, target = g.edge_st(e)
        other_vertex = source if source != w else target
        if source != w:
            other_vertex = source
        elif target != w:
            other_vertex = target
        else: #self-loop
            other_vertex = v
        new_e = (v, other_vertex)
        if new_e not in etab: etab[new_e] = [0, 0]
        etab[new_e][g.edge_type(e) - 1] += 1 # TODO: This implicitly assumes that there is only two types of edges
    if (v, v) in etab:
        etab[(v, v)][0] = 0  # remove simple edge loops

    g.add_edge_table(etab)
    g.remove_vertex(w)
    return True


# Fuse w

def check_fuse_w(g: BaseGraph[VT,ET], v: VT, w: VT) -> bool:
    """Checks if two vertices are either w_input or w_output and whether they can be fused."""
    if not (v in g.vertices() and w in g.vertices()): return False

    if vertex_is_w(g.type(v)) and vertex_is_w(g.type(w)):
        v1_in, v1_out = get_w_io(g, v)
        v2_in, v2_out = get_w_io(g, w)
        if (g.connected(v1_in, v2_out) and g.edge_type(g.edge(v1_in, v2_out)) == EdgeType.SIMPLE) or \
           (g.connected(v2_in, v1_out) and g.edge_type(g.edge(v2_in, v1_out)) == EdgeType.SIMPLE):
            return True
    return False

def fuse_w(g: BaseGraph[VT,ET], v: VT, w: VT) -> bool:
    """Checks and then performs W fusion on a given set of vertices."""
    if not check_fuse_w(g, v, w): return False
    return unsafe_fuse_w(g, v, w)

def unsafe_fuse_w(g: BaseGraph[VT,ET], v: VT, w: VT) -> bool:
    """Performs W fusion on a given set of vertices.
    Note: Does not check if fuse can be applied before applying the rule"""
    rem_verts: List[VT] = []
    etab: Dict[Tuple[VT,VT],List[int]] = dict()

    v1_in, v1_out = get_w_io(g, v)
    v2_in, v2_out = get_w_io(g, w)
    if not g.connected(v1_out, v2_in):
        v1_in, v2_in = v2_in, v1_in
        v1_out, v2_out = v2_out, v1_out
    # always delete the second vertex in the match
    rem_verts.extend([v2_in, v2_out])

    # edges from the second vertex are transferred to the first
    for w in g.neighbors(v2_out):
        if w == v2_in or w == v1_in:
            continue
        if w == v2_out:
            w = v1_out
        e = (v1_out, w)
        if e not in etab: etab[e] = [0,0]
        etab[e][g.edge_type(g.edge(v2_out, w)) - 1] += 1

    g.add_edge_table(etab)
    g.remove_vertices(rem_verts)
    g.remove_isolated_vertices()
    return True



#TODO: fix this to work with Rewrite class

def unfuse(g: BaseGraph[VT,ET], m: List[Any], qubit:FloatInt=-1, row:FloatInt=-1) -> VT:
    """Undoes a single spider fusion, given a match ``m``. A match is a list with 3
    elements given by::

      m[0] : a vertex to unfuse
      m[1] : the neighbors of the new node, which should be a subset of the
             neighbors of m[0]
      m[2] : the phase of the new node. If omitted, the new node gets all the phase of m[0]

    Returns the index of the new node. Optional parameters ``qubit`` and ``row`` can be used
    to position the new node. If they are omitted, they are set as the same as the old node.
    """
    u = m[0]
    v = g.add_vertex(ty=g.type(u))
    u_is_ground = g.is_ground(u)
    g.set_qubit(v, qubit if qubit != -1 else g.qubit(u))
    g.set_row(v, row if row != -1 else g.row(u))

    g.add_edge((u, v))
    for n in m[1]:
        e = g.edge(u,n)
        g.add_edge((v,n), edgetype=g.edge_type(e))
        g.remove_edge(e)
    if len(m) >= 3:
        g.add_to_phase(v, m[2])
        if not u_is_ground:
            g.add_to_phase(u, Fraction(0) - m[2])
    else:
        g.set_phase(v, g.phase(u))
        g.set_phase(u, 0)
    return v

