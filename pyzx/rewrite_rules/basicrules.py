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
        'check_pi_commute_X',
        'pi_commute_X',
        'check_pi_commute_Z',
        'pi_commute_Z']

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.rewrite_rules.color_change_rule import color_change_diagram
from pyzx.rewrite_rules.bialgebra_rule import bialgebra

from pyzx.utils import (EdgeType, VertexType, get_w_io, get_z_box_label, is_pauli,
                    vertex_is_w)

##wanna merge

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
