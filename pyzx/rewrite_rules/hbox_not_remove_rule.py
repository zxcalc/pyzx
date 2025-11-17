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

__all__ = ['check_hbox_parallel_not',
           'hbox_parallel_not_remove',
           'unsafe_hbox_parallel_not_remove']


from typing import Dict, List, Tuple, Callable, Optional
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


#change this to take in h and n only and that guarantees v (2 vertex)

def check_hbox_parallel_not(
        g: BaseGraph[VT,ET],
        h: VT,
        n: VT,
        v: VT
        ) -> bool:
    """Finds H-boxes that are connected to a Z-spider both directly and via a NOT.
    :param g: Graph to check.
    :param h: H-box to check.
    :param n: NOT connecting hbox and Z-spider.
    :param v: Z-spider connected to hbox and NOT."""

    phases = g.phases()
    types = g.types()

    if not (h in g.vertices() and n in g.vertices() and v in g.vertices()): return False

    if types[h] != VertexType.H_BOX or phases[h] != 1: return False
    if v == h: return False
    if not g.connected(v,n): return False

    if g.vertex_degree(n) != 2 or phases[n] != 1: return False # If it turns out to be useful, this rule can be generalised to allow spiders of arbitrary phase here

    if not is_NOT_gate(g,n,h,v): return False

    # h is connected to both v and n in the appropriate way, and n is a NOT that is connected to v as well
    return True


def hbox_parallel_not_remove(g: BaseGraph[VT,ET], h: VT, n: VT, v: VT) -> bool:
    if check_hbox_parallel_not(g,h,n,v): return unsafe_hbox_parallel_not_remove(g,h,n,v)
    return False


def unsafe_hbox_parallel_not_remove(g: BaseGraph[VT,ET], h: VT, n: VT, v: VT) -> bool:
    """If a Z-spider is connected to an H-box via a regular wire and a NOT, then they disconnect, and the H-box is turned into a Z-spider.
    :param g: Graph to check.
    :param h: H-box to check.
    :param v: Z-spider connected to hbox and NOT.
    :param n: NOT connecting hbox and Z-spider."""

    rem = []
    etab: Dict[Tuple[VT,VT], List[int]] = {}
    types = g.types()

    rem.append(h)
    rem.append(n)

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
