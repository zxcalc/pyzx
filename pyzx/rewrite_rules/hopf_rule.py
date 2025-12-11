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
This module contains the implementation of the hopf rule.

The check function returns a boolean indicating whether the rule can be applied.
The standard version of the applier will automatically call the basic checker, while the unsafe version
of the applier will assume that the given input is correct and will apply the rule without running the check first.

This rewrite rule can be called using simplify.hopf_simp
"""

__all__ = ['check_hopf',
           'hopf',
           'unsafe_hopf']

from typing import Tuple, List, Dict
from pyzx.utils import EdgeType, vertex_is_z_like, vertex_is_zx_like
from pyzx.graph.base import BaseGraph, VT, ET

MatchHopfType = Tuple[VT, VT, EdgeType]


def check_hopf(g: BaseGraph[VT, ET], v: VT, w: VT) -> bool:
    """Checks if input vertices are connected by parallel edges and whether they can be removed.
    """

    types = g.types()
    if not (v in g.vertices()) or not (w in g.vertices()): return False


    if not vertex_is_zx_like(types[v]) or not vertex_is_zx_like(types[w]): return False

    # If the number of edges between v and w is greater than 1, we can remove edges
    ns = g.num_edges(v, w, EdgeType.SIMPLE)
    nh = g.num_edges(v, w, EdgeType.HADAMARD)

    v_is_z = vertex_is_z_like(types[v])
    w_is_z = vertex_is_z_like(types[w])

    if v_is_z == w_is_z:  # Both Z-like or X-like
        if nh > 1:
            return True
    else:  # One is Z-like, the other is X-like
        if ns > 1:
            return True
    return False


def hopf(g: BaseGraph[VT, ET], v: VT, w: VT) -> bool:
    """First checks if the rule can be applied, and then removes parallel edges between the given vertices."""
    if check_hopf(g, v, w):
        return unsafe_hopf(g, v, w)
    return False

def unsafe_hopf(g: BaseGraph[VT, ET], v: VT, w: VT) -> bool:
    """Removes parallel edges between the given vertices.
    """
    etab: Dict[Tuple[VT, VT], List[int]] = dict()
    rem_edges: List[ET] = []

    et = g.edge_type(g.edge(v, w))

    n = g.num_edges(v, w, et)
    parity = n % 2
    rem_edges.extend([g.edge(v, w, et)] * (n - parity))
    g.scalar.add_power(-(n - parity))

    g.add_edge_table(etab)
    g.remove_edges(rem_edges)

    return True
