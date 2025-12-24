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
This module contains the implementation of the hbox_parallel_not rule.
This finds H-boxes that are connected to a Z-spider both directly and via a NOT.
We can then disconnect them, and the H-box is turned into a Z-spider.

The check function returns a boolean indicating whether the rule can be applied.
The standard version of the applier will automatically call the basic checker, while the unsafe version
of the applier will assume that the given input is correct and will apply the rule without running the check first.

This rewrite rule can be called using hsimplify.hbox_parallel_not_remove_simp
"""

__all__ = ['check_hbox_parallel_not',
           'hbox_parallel_not_remove',
           'unsafe_hbox_parallel_not_remove']


from typing import Dict, List, Tuple
from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, ET, VT, upair


def is_NOT_gate(g, v, n1, n2):
    """Returns whether the vertex v in graph g is a NOT gate between its neighbours n1 and n2."""
    return (
        (
            g.edge_type(g.edge(n1,v)) == EdgeType.SIMPLE
            and g.type(v) == VertexType.X
            and g.edge_type(g.edge(n2,v)) == EdgeType.SIMPLE
        ) or (
            g.edge_type(g.edge(n1,v)) == EdgeType.HADAMARD
            and g.type(v) == VertexType.Z
            and g.edge_type(g.edge(n2,v)) == EdgeType.HADAMARD
        )
    )


def check_hbox_parallel_not(
        g: BaseGraph[VT,ET],
        h: VT,
        n: VT
        ) -> bool:
    """Finds H-boxes that are connected to a Z-spider both directly and via a NOT.
    :param g: Graph to check.
    :param h: H-box to check.
    :param n: NOT connecting hbox and Z-spider."""

    phases = g.phases()
    types = g.types()

    if not (h in g.vertices() and n in g.vertices()): return False
    if types[h] != VertexType.H_BOX or phases[h] != 1: return False

    if g.vertex_degree(n) != 2 or phases[n] != 1: return False # If it turns out to be useful, this rule can be generalised to allow spiders of arbitrary phase here

    v = [v for v in g.neighbors(n) if v != h][0]  # The other neighbor of n

    if not g.connected(v,h): return False


    if not is_NOT_gate(g,n,h,v): return False

    # h is connected to both v and n in the appropriate way, and n is a NOT that is connected to v as well
    return True


def hbox_parallel_not_remove(g: BaseGraph[VT,ET], h: VT, n: VT) -> bool:
    """If a Z-spider is connected to an H-box via a regular wire and a NOT, then they disconnect, and the H-box is turned into a Z-spider."""
    if check_hbox_parallel_not(g,h,n): return unsafe_hbox_parallel_not_remove(g,h,n)
    return False


def unsafe_hbox_parallel_not_remove(g: BaseGraph[VT,ET], h: VT, n: VT) -> bool:
    """Disconnects the Z-spider and H-box, and the H-box is turned into a Z-spider.
    :param g: Graph to check.
    :param h: H-box to check.
    :param n: NOT connecting hbox and Z-spider."""

    rem = []
    etab: Dict[Tuple[VT,VT], List[int]] = {}
    types = g.types()

    rem.append(h)
    rem.append(n)
    v = [v for v in g.neighbors(n) if v != h][0]  # The other neighbor of n

    for w in g.neighbors(h):
        if w == v or w == n: continue
        et = g.edge_type(g.edge(w,h))
        if types[w] == VertexType.Z and et == EdgeType.SIMPLE: continue
        if types[w] == VertexType.X and et == EdgeType.HADAMARD: continue
        q = 0.6*g.qubit(h) + 0.4*g.qubit(w)
        r = 0.6*g.row(h) + 0.4*g.row(w)
        z = g.add_vertex(VertexType.Z,q,r)
        if et == EdgeType.SIMPLE:
            etab[upair(z,w)] = [1,0]
        else: etab[upair(z,w)] = [0,1]

    g.add_edge_table(etab)
    g.remove_vertices(rem)
    g.remove_isolated_vertices()

    return True
