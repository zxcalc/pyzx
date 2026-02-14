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
This module contains the implementation of the H-box cancellation rule.

An H-box with phase 1 and arity 2 can be cancelled if:
- it is connected to another H-box (phase 1, arity 2) via a simple edge; or
- it has at least one incident Hadamard edge.

Both cases derive from H*H = I.

This rewrite rule can be called using simplify.hbox_cancel_simp(g).
"""

__all__ = ['check_hbox_cancel',
           'hbox_cancel',
           'unsafe_hbox_cancel']

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.utils import EdgeType, VertexType, is_standard_hbox


def check_hbox_cancel(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Checks if an H-box can be cancelled."""
    if v not in g.vertices():
        return False
    if g.type(v) != VertexType.H_BOX:
        return False
    if not is_standard_hbox(g, v):
        return False
    if g.vertex_degree(v) != 2:
        return False

    neighbors = list(g.neighbors(v))

    for n in neighbors:
        e = g.edge(v, n)
        if g.edge_type(e) == EdgeType.SIMPLE:
            if (g.type(n) == VertexType.H_BOX and
                is_standard_hbox(g, n) and
                g.vertex_degree(n) == 2):
                return True

    for n in neighbors:
        e = g.edge(v, n)
        if g.edge_type(e) == EdgeType.HADAMARD:
            return True

    return False


def hbox_cancel(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Cancels an H-box if possible."""
    if check_hbox_cancel(g, v):
        return unsafe_hbox_cancel(g, v)
    return False


def unsafe_hbox_cancel(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Cancels an H-box without checking preconditions."""
    neighbors = list(g.neighbors(v))
    n1, n2 = neighbors[0], neighbors[1]

    for n in neighbors:
        e = g.edge(v, n)
        if g.edge_type(e) == EdgeType.SIMPLE:
            if (g.type(n) == VertexType.H_BOX and
                is_standard_hbox(g, n) and
                g.vertex_degree(n) == 2):

                # Found two adjacent H-boxes connected by a simple edge.
                v_other = n1 if n2 == n else n2
                n_neighbors = list(g.neighbors(n))
                n_other = n_neighbors[0] if n_neighbors[1] == v else n_neighbors[1]

                e_v = g.edge(v, v_other)
                e_n = g.edge(n, n_other)
                et_v = g.edge_type(e_v)
                et_n = g.edge_type(e_n)

                if et_v == et_n:
                    new_edge_type = EdgeType.SIMPLE
                else:
                    new_edge_type = EdgeType.HADAMARD

                g.remove_vertices([v, n])
                g.add_edge((v_other, n_other), new_edge_type)
                g.scalar.add_power(2)
                return True

    e1 = g.edge(v, n1)
    e2 = g.edge(v, n2)
    et1 = g.edge_type(e1)
    et2 = g.edge_type(e2)

    if et1 == EdgeType.HADAMARD or et2 == EdgeType.HADAMARD:
        # Found H-box next to Hadamard edge.
        if et1 == EdgeType.HADAMARD and et2 == EdgeType.HADAMARD:
            new_edge_type = EdgeType.HADAMARD
        else:
            new_edge_type = EdgeType.SIMPLE

        g.remove_vertex(v)
        g.add_edge((n1, n2), new_edge_type)
        g.scalar.add_power(1)
        return True

    return False
