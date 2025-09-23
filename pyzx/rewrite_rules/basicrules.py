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
NEW VERSION

This module contains several rules more easily applied interactively to ZX
diagrams. The emphasis is more on ease of use and simplicity than performance.

Rules are given as functions that take as input a vertex or a pair of vertices
to fix the location the rule is applied. They then apply the rule and return
True if the rule indeed applies at this location, otherwise they return false.

Most rules also have a companion function check_RULENAME, which only checks
whether the rule applies at the given location and doesn't actually apply
the rule.
"""

__all__ = [
        'check_copy_X',
        'copy_X',
        'check_copy_Z',
        'copy_Z',
        'check_pi_commute_X',
        'pi_commute_X',
        'check_pi_commute_Z',
        'pi_commute_Z',
        'check_remove_id',
        'remove_id']

from pyzx.graph.base import BaseGraph, VT, ET
from .rules import apply_rule, w_fusion, z_to_z_box
from pyzx.rewrite_rules.color_change_rule import color_change_diagram
from pyzx.rewrite_rules.bialgebra_rule import bialgebra

from pyzx.utils import (EdgeType, VertexType, get_w_io, get_z_box_label, is_pauli,
                    set_z_box_label, vertex_is_w, vertex_is_z_like, toggle_vertex, toggle_edge)

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
    bialgebra(g, v, nv)

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

def check_remove_id(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not g.vertex_degree(v) == 2:
        return False
    if g.type(v) == VertexType.Z_BOX and get_z_box_label(g, v) == 1:
        return True
    elif g.type(v) != VertexType.Z_BOX and g.phase(v) == 0:
        return True
    return False

def remove_id(g: BaseGraph[VT,ET], v: VT) -> bool:
    if vertex_is_w(g.type(v)):
        return remove_id_w(g, v)
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

def check_remove_id_w(g: BaseGraph[VT,ET], v: VT) -> bool:
    w_in, w_out = get_w_io(g, v)
    if g.vertex_degree(w_out) == 2:
        return True
    return False

def remove_id_w(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not check_remove_id_w(g, v):
        return False
    w_in, w_out = get_w_io(g, v)
    v1 = [n for n in g.neighbors(w_out) if n != w_in][0]
    v2 = [n for n in g.neighbors(w_in) if n != w_out][0]
    g.add_edge((v1,v2), edgetype=EdgeType.SIMPLE
        if g.edge_type(g.edge(w_out, v1)) == g.edge_type(g.edge(w_in, v2))
        else EdgeType.HADAMARD)
    g.remove_vertex(w_in)
    g.remove_vertex(w_out)
    return True
