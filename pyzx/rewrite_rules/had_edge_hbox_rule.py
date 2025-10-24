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

__all__ = ['check_hadamard',
           'replace_hadamard',
           'unsafe_replace_hadamard',
           'had_edge_hbox_rule',
           'unsafe_had_edge_to_hbox']

from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, ET, VT
from pyzx.rewrite_rules.euler_rule import check_hadamard_edge

def check_hadamard(g: BaseGraph[VT ,ET], v: VT) -> bool:
    """Returns whether the vertex v in graph g is a Hadamard gate."""
    if g.type(v) != VertexType.H_BOX: return False
    if g.phase(v) != 1: return False
    if g.vertex_degree(v) != 2: return False
    return True

def replace_hadamard(g: BaseGraph[VT ,ET], v: VT) -> bool:
    """Replaces a Hadamard gate with a Hadamard edge."""
    if check_hadamard(g, v): return unsafe_replace_hadamard(g, v)
    return False

def unsafe_replace_hadamard(g: BaseGraph[VT ,ET], v: VT) -> bool:
    """Replaces a Hadamard gate with a Hadamard edge."""
    n1 ,n2 = g.neighbors(v)
    et1 = g.edge_type(g.edge(v ,n1))
    et2 = g.edge_type(g.edge(v ,n2))
    if et1 == et2: # both connecting edges are HADAMARD or SIMPLE
        g.add_edge((n1 ,n2), EdgeType.HADAMARD)
    else:
        g.add_edge((n1 ,n2), EdgeType.SIMPLE)
    g.remove_vertex(v)
    g.scalar.add_power(1) # Correct for the sqrt(2) difference in H-boxes and H-edges
    return True


def had_edge_to_hbox(g: BaseGraph[VT, ET], v: VT, w: VT) -> bool:
    if check_hadamard_edge(g, v, w): return unsafe_had_edge_to_hbox(g, v, w)
    return False

def unsafe_had_edge_to_hbox(g: BaseGraph[VT ,ET], v: VT, w: VT) -> bool:
    """Converts a Hadamard edge to a Hadamard gate.
    Note that while this works with multigraphs, it will put the new H-box in the middle of the vertices,
    so that the diagram might look wrong.
    """

    e = g.edge(v, w)
    et = g.edge_type(e)
    if et != EdgeType.HADAMARD: return False
    s ,t = g.edge_st(e)
    rs = g.row(s)
    rt = g.row(t)
    qs = g.qubit(s)
    qt = g.qubit(t)
    g.remove_edge(e)
    h = g.add_vertex(VertexType.H_BOX)
    g.scalar.add_power(-1) # Correct for sqrt(2) scalar difference in H-edge and H-box.
    g.add_edge((s, h) ,EdgeType.SIMPLE)
    g.add_edge((h, t) ,EdgeType.SIMPLE)

    if qs == qt:
        g.set_qubit(h, qs)
    else:
        q = (qs + qt) / 2
        if round(q) == q: q += 0.5
        g.set_qubit(h, q)
    g.set_row(h, (rs + rt) / 2)
    return True


