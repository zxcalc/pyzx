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
This module contains several rules more easily applied interactively to ZX
diagrams. The emphasis is more on ease of use and simplicity than performance.

Rules are given as functions that take as input a vertex or a pair of vertices
to fix the location the rule is applied. They then apply the rule and return
True if the rule indeed applies at this location, otherwise they return false.

Most rules also have a companion function check_RULENAME, which only checks
whether the rule applies at the given location and doesn't actually apply
the rule.
"""

__all__ = ['color_change_diagram',
        'check_color_change',
        'color_change',
        'check_copy_X',
        'copy_X',
        'check_copy_Z',
        'copy_Z',
        'check_pi_commute_X',
        'pi_commute_X',
        'check_pi_commute_Z',
        'pi_commute_Z',
        'check_strong_comp',
        'strong_comp',
        'check_fuse',
        'fuse',
        'check_remove_id',
        'remove_id']

from typing import Tuple, List
from .editor_actions import bialgebra
from .graph.base import BaseGraph, VT, ET
from .rules import apply_rule, w_fusion, z_to_z_box
from .utils import (EdgeType, VertexType, get_w_io, get_z_box_label, is_pauli,
                    set_z_box_label, vertex_is_w, vertex_is_z_like, toggle_vertex, toggle_edge)

def color_change_diagram(g: BaseGraph[VT,ET]):
    """Color-change an entire diagram by applying Hadamards to the inputs and ouputs."""
    for v in g.vertices():
        if g.type(v) == VertexType.BOUNDARY:
            if g.vertex_degree(v) != 1:
                raise ValueError("Boundary should only have 1 neighbor.")
            for e in g.incident_edges(v):
                g.set_edge_type(e, toggle_edge(g.edge_type(e)))
        elif check_color_change(g, v):
            color_change(g, v)

def check_color_change(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not (g.type(v) == VertexType.Z or g.type(v) == VertexType.X):
        return False
    else:
        return True

def color_change(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not (g.type(v) == VertexType.Z or g.type(v) == VertexType.X):
        return False

    g.set_type(v, toggle_vertex(g.type(v)))
    for e in g.incident_edges(v):
        g.set_edge_type(e, toggle_edge(g.edge_type(e)))

    return True

def check_strong_comp(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    if not (((g.type(v1) == VertexType.X and g.type(v2) == VertexType.Z) or
             (g.type(v1) == VertexType.Z and g.type(v2) == VertexType.X)) and
            is_pauli(g.phase(v1)) and
            is_pauli(g.phase(v2)) and
            g.connected(v1,v2) and
            EdgeType.SIMPLE in [g.edge_type(edge) for edge in g.edges(v1,v2)]):
        return False
    return True

def strong_comp(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    if not check_strong_comp(g, v1, v2): return False

    etab, rem_verts, rem_edges, check_isolated_vertices = bialgebra(g, [(v1, v2)])
    g.remove_edges(rem_edges)
    g.remove_vertices(rem_verts)
    g.add_edge_table(etab)
    return True

def check_copy_X(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not (g.vertex_degree(v) == 1 and
            g.type(v) == VertexType.X and
            is_pauli(g.phase(v))):
        return False
    nv = next(iter(g.neighbors(v)))
    if not (g.type(nv) == VertexType.Z and
            g.edge_type(g.edge(v,nv)) == EdgeType.SIMPLE):
        return False
    return True

def copy_X(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not check_copy_X(g, v): return False
    nv = next(iter(g.neighbors(v)))
    strong_comp(g, v, nv)

    return True

def check_pi_commute_Z(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) == VertexType.Z

def pi_commute_Z(g: BaseGraph[VT, ET], v: VT) -> bool:
    if not check_pi_commute_Z(g, v): return False
    g.set_phase(v, -g.phase(v))
    ns = g.neighbors(v)
    for w in ns:
        e = g.edge(v, w)
        et = g.edge_type(e)
        if ((g.type(w) == VertexType.Z and et == EdgeType.HADAMARD) or
            (g.type(w) == VertexType.X and et == EdgeType.SIMPLE)):
            g.add_to_phase(w, 1)
        else:
            g.remove_edge(e)
            c = g.add_vertex(VertexType.X,
                    qubit=0.5*(g.qubit(v) + g.qubit(w)),
                    row=0.5*(g.row(v) + g.row(w)))
            g.add_edge((v, c))
            g.add_edge((c, w), edgetype=et)
    return True

def check_pi_commute_X(g: BaseGraph[VT,ET], v: VT) -> bool:
    color_change_diagram(g)
    b = check_pi_commute_Z(g, v)
    color_change_diagram(g)
    return b

def pi_commute_X(g: BaseGraph[VT,ET], v: VT) -> bool:
    color_change_diagram(g)
    b = pi_commute_Z(g, v)
    color_change_diagram(g)
    return b

def check_copy_Z(g: BaseGraph[VT,ET], v: VT) -> bool:
    color_change_diagram(g)
    b = check_copy_X(g, v)
    color_change_diagram(g)
    return b

def copy_Z(g: BaseGraph, v: VT) -> bool:
    color_change_diagram(g)
    b = copy_X(g, v)
    color_change_diagram(g)
    return b

def check_fuse(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    if check_fuse_w(g, v1, v2):
        return True
    if not (g.connected(v1,v2) and
            ((g.type(v1) == VertexType.X and g.type(v2) == VertexType.X) or
             (vertex_is_z_like(g.type(v1)) and vertex_is_z_like(g.type(v2)))) and
            EdgeType.SIMPLE in [g.edge_type(edge) for edge in g.edges(v1,v2)]):
        return False
    return True

def fuse(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    if not check_fuse(g, v1, v2): return False
    if vertex_is_w(g.type(v1)):
        return fuse_w(g, v1, v2)
    if g.type(v1) == VertexType.Z_BOX or g.type(v2) == VertexType.Z_BOX:
        if g.type(v1) == VertexType.Z:
            z_to_z_box(g, [v1])
        if g.type(v2) == VertexType.Z:
            z_to_z_box(g, [v2])
        set_z_box_label(g, v1, get_z_box_label(g, v1) * get_z_box_label(g, v2))
    else:
        g.add_to_phase(v1, g.phase(v2))
    for e in g.incident_edges(v2):
        source, target = g.edge_st(e)
        other_vertex = source if source != v2 else target
        if source != v2:
            other_vertex = source
        elif target != v2:
            other_vertex = target
        else: #self-loop
            other_vertex = v1
        if other_vertex == v1 and g.edge_type(e) == EdgeType.SIMPLE:
            continue
        g.add_edge((v1,other_vertex), edgetype=g.edge_type(e))
    g.remove_vertex(v2)
    return True

def check_fuse_w(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    if vertex_is_w(g.type(v1)) and vertex_is_w(g.type(v2)):
        v1_in, v1_out = get_w_io(g, v1)
        v2_in, v2_out = get_w_io(g, v2)
        if g.edge_type(g.edge(v1_in, v2_out)) == EdgeType.SIMPLE or \
           g.edge_type(g.edge(v2_in, v1_out)) == EdgeType.SIMPLE:
            return True
    return False

def fuse_w(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    if not check_fuse_w(g, v1, v2): return False
    v1_in, v1_out = get_w_io(g, v1)
    v2_in, v2_out = get_w_io(g, v2)
    if not g.connected(v1_out, v2_in):
        g.set_position(v2_in, g.qubit(v1_in), g.row(v1_in))
        g.set_position(v2_out, g.qubit(v1_out), g.row(v1_out))
    apply_rule(g, w_fusion, [(v2, v1)])
    return True

def check_remove_id(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not g.vertex_degree(v) == 2:
        return False
    if g.type(v) == VertexType.Z_BOX and get_z_box_label(g, v) == 1:
        return True
    elif g.type(v) != VertexType.Z_BOX and g.phase(v) == 0:
        return True
    return False

def remove_id(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not check_remove_id(g, v):
        return False

    neighbors = list(g.neighbors(v))
    if len(neighbors) == 2:
        v1, v2 = neighbors[0], neighbors[1]
    else: # self loop
        v1, v2 = neighbors[0], neighbors[0]
    g.add_edge((v1,v2), edgetype=EdgeType.SIMPLE
            if g.edge_type(g.edge(v,v1)) == g.edge_type(g.edge(v,v2))
            else EdgeType.HADAMARD)
    g.remove_vertex(v)

    return True


