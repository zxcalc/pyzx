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
This module contains the implementation of the h-box fuse rule

This rule acts on two connected vertices. The check function returns a boolean indicating whether
the rule can be applied to the given vertices. The standard version of the applier will automatically
call the basic checker, while the unsafe version of the applier will assume that the given input is correct and will apply
the rule without running the check first.

This rewrite rule can be called using simplify.euler_expansion_rewrite.apply(g, v, w).
"""

__all__ = ['check_connected_hboxes',
           'fuse_hboxes',
           'unsafe_fuse_hboxes']


from typing import Dict, List, Tuple, Set
from pyzx.utils import EdgeType, VertexType, is_standard_hbox
from pyzx.graph.base import BaseGraph, ET, VT, upair


def check_connected_hboxes(g: BaseGraph[VT ,ET], v: VT, w: VT) -> bool:
    """Matches Hadamard-edges that are connected to H-boxes, as these can be fused,
    see the rule (HS1) of https://arxiv.org/pdf/1805.02175.pdf.

    Warning:
        Does not work with multigraphs.
    """
    if not (v in g.vertices() and w in g.vertices()): return False
    if not g.connected(v, w): return False

    e = g.edge(v, w)
    m : Set[ET] = set()
    ty = g.types()

    if g.edge_type(e) != EdgeType.HADAMARD: return False
    v1 ,v2 = g.edge_st(e)
    if ty[v1] != VertexType.H_BOX or ty[v2] != VertexType.H_BOX: return False
    if not is_standard_hbox(g, v1) and not is_standard_hbox(g, v2): return False
    m.add(e)

    return True

def fuse_hboxes(g: BaseGraph[VT ,ET], v1: VT, v2: VT) -> bool:
    """Fuses two neighboring H-boxes together, if they can be fused.
        See rule (HS1) of https://arxiv.org/pdf/1805.02175.pdf."""
    if check_connected_hboxes(g, v1, v2): return unsafe_fuse_hboxes(g, v1, v2)
    return False

def unsafe_fuse_hboxes(g: BaseGraph[VT ,ET], v1: VT, v2: VT) -> bool:
    """Fuses two neighboring H-boxes together.
    See rule (HS1) of https://arxiv.org/pdf/1805.02175.pdf."""
    rem_verts = []
    etab: Dict[Tuple[VT ,VT], List[int]] = {}

    if not is_standard_hbox(g, v2):  # Ensure v2 is the standard one.
        v1, v2 = v2, v1
    rem_verts.append(v2)
    g.scalar.add_power(1)
    for n in g.neighbors(v2):
        if n == v1: continue
        e2 = g.edge(v2 ,n)
        if g.edge_type(e2) == EdgeType.SIMPLE:
            etab[upair(v1 ,n)] = [1 ,0]
        else:
            etab[upair(v1 ,n)] = [0 ,1]

    g.add_edge_table(etab)
    g.remove_vertices(rem_verts)
    g.remove_isolated_vertices()

    return True

