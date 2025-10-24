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

__all__ = ['check_self_loop',
           'remove_self_loop',
           'unsafe_remove_self_loop']


from typing import Tuple, List, Dict
from fractions import Fraction

from pyzx.utils import  EdgeType, vertex_is_zx_like
from pyzx.graph.base import BaseGraph, VT, ET

MatchSelfLoopType = Tuple[VT, int, int]

def check_self_loop(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Finds self-loops on vertices that can be removed.
    :param g: An instance of a ZX-graph.
    :param v: The vertex to check.
    """

    types = g.types()
    if not (v in g.vertices()): return False


    if not vertex_is_zx_like(types[v]): return False

    ns = g.num_edges(v, v, EdgeType.SIMPLE)
    nh = g.num_edges(v, v, EdgeType.HADAMARD)
    if ns == 0 and nh == 0: return False

    return True


def remove_self_loop(g: BaseGraph[VT, ET], v: VT) -> bool:
    if check_self_loop(g, g):
        return unsafe_remove_self_loop(g, v)
    return False

def unsafe_remove_self_loop(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Performs a self-loop removal rewrite on the given graph with the
    given vertex. Removes all self-loops of the given type
    """

    etab: Dict[Tuple[VT, VT], List[int]] = dict()
    rem_edges: List[ET] = []
    ns = g.num_edges(v, v, EdgeType.SIMPLE)
    nh = g.num_edges(v, v, EdgeType.HADAMARD)

    rem_edges.extend([g.edge(v, v, EdgeType.SIMPLE)] * ns)
    rem_edges.extend([g.edge(v, v, EdgeType.HADAMARD)] * nh)
    g.scalar.add_power(-nh)

    if nh % 2 == 1:  # A Hadamard self-loop gives a phase of pi
        g.add_to_phase(v, Fraction(1, 1))

    g.add_edge_table(etab)
    g.remove_edges(rem_edges)

    return True