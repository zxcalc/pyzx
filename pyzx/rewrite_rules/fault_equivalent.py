# PyZX - Python library for quantum circuit rewriting
#        and optimization using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

r"""
This module implements fault-equivalent rewrites.

Functions that provide fault-equivalent rewrites have names ending with `_FE`, e.g. `unfuse_1_FE`.

Fault-equivalent rewrites are defined in arXiv:2506.17181.
Alternatively, they are defined as distance-preserving rewrites in arXiv:2410.17240.

Formal Definition
=================

Let :math:`C_1` and :math:`C_2` be two circuits with respective noise models :math:`\mathcal{F}_1` and :math:`\mathcal{F}_2`.
The circuit :math:`C_1` under :math:`\mathcal{F}_1` is **w-fault-equivalent** to :math:`C_2` under :math:`\mathcal{F}_2`,
if and only if for all faults :math:`F_1 \in \langle \mathcal{F}_1 \rangle` with weight :math:`wt(F_1) < w`, we have either:

1.  :math:`F_1` is detectable, or
2.  There exists a fault :math:`F_2 \in \langle \mathcal{F}_2 \rangle` on :math:`C_2` such that:
        - :math:`wt(F_2) \leq wt(F_1)` and
        - :math:`C_1^{F_1} = C_2^{F_2}`.

The condition must similarly hold for all faults :math:`F_2 \in \langle \mathcal{F}_2 \rangle` with weight :math:`wt(F_2) < w`, making this equivalence relation symmetric.

Two circuits :math:`C_1` and :math:`C_2` are **fault-equivalent**, written :math:`C_1 \hat{=} C_2`, if they are :math:`w`-fault-equivalent for all :math:`w \in \mathbb{N}`.
"""

import itertools
import math
from typing import Callable, Optional

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.rewrite_rules.basicrules import (
    check_remove_id as check_elim_FE,             # noqa # pylint: disable=unused-import
    remove_id as elim_FE,                         # noqa # pylint: disable=unused-import
    check_color_change as check_color_change_FE,  # noqa # pylint: disable=unused-import
    color_change as color_change_FE,              # noqa # pylint: disable=unused-import
    fuse as _fuse,
)
from pyzx.utils import VertexType, is_pauli


def check_fuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    neighs = g.neighbors(v)
    return len(neighs) == 1 and g.type(neighs[0]) == g.type(v) and is_pauli(g.phase(v))


def fuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    if not check_fuse_1_FE(g, v):
        return False
    [v2] = g.neighbors(v)
    return _fuse(g, v, v2)


def check_unfuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) in (VertexType.X, VertexType.Z, VertexType.Z_BOX) and g.vertex_degree(v) > 0


def unfuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    if not check_unfuse_1_FE(g, v):
        return False
    typ = VertexType.X if g.type(v) == VertexType.X else VertexType.Z
    v2 = g.add_vertex(typ, g.qubit(v), g.row(v) - 1)
    _e = g.add_edge((v, v2))
    return True


# def _find_best_pairing_scipy(
#         g: BaseGraph[VT, ET],
#         neighbors: list[VT],
#         new_vertices: list[VT]
# ) -> tuple:
#     """Finds the optimal assignment using the Hungarian algorithm via SciPy."""
#     import numpy as np
#     from scipy.optimize import linear_sum_assignment
#
#     num_vs = len(neighbors)
#     cost_matrix = np.zeros((num_vs, num_vs))
#
#     for i in range(num_vs):
#         n_q, n_r = g.qubit(neighbors[i]), g.row(neighbors[i])
#         for j in range(num_vs):
#             new_v_q, new_v_r = g.qubit(new_vertices[j]), g.row(new_vertices[j])
#             cost_matrix[i, j] = math.hypot(new_v_q - n_q, new_v_r - n_r)
#
#     row_ind, col_ind = linear_sum_assignment(cost_matrix)
#     return tuple(col_ind)


def _find_best_pairing_itertools(
        g: BaseGraph[VT, ET],
        neighbors: list[VT],
        new_vertices: list[VT]
) -> tuple:
    """
    Finds the optimal neighbor-to-new-vertex assignment to minimize total distance.

    For the small number of nodes this is meant to be used, `itertools.permutations` works.
    """
    num_vs = len(neighbors)
    # 1. Build a cost matrix of distances
    cost_matrix = [[math.hypot(g.qubit(new_v) - g.qubit(n), g.row(new_v) - g.row(n))
                    for new_v in new_vertices] for n in neighbors]

    min_cost = float('inf')
    best_assignment = tuple(range(num_vs))

    # 2. Iterate through all permutations to find the one with the lowest cost
    for p in itertools.permutations(range(num_vs)):
        current_cost = sum(cost_matrix[i][p[i]] for i in range(num_vs))
        if current_cost < min_cost:
            min_cost = current_cost
            best_assignment = p

    return best_assignment


def _get_square_coords(q: float, r: float) -> list[tuple[float, float]]:
    """Generates coordinates for 4 vertices in a square centered at (q, r)."""
    d = 0.5
    return [(q - d, r - d), (q + d, r - d), (q + d, r + d), (q - d, r + d)]


def _get_pentagon_coords(q: float, r: float) -> list[tuple[float, float]]:
    """Generates coordinates for 5 vertices in a pentagon centered at (q, r)."""
    num_vs = 5
    radius = 0.75
    coords = []
    for i in range(num_vs):
        angle = (2 * math.pi * i / num_vs) + (math.pi)
        qc = q + radius * math.cos(angle)
        rc = r - radius * math.sin(angle)
        coords.append((qc, rc))
    return coords


def _unfuse_spider(
        g: BaseGraph[VT, ET],
        v: VT,
        check_func: Callable,
        coords_func: Callable
) -> bool:
    """A generic function to unfuse a spider into a polygon of new spiders."""
    if not check_func(g, v):
        return False

    v_type = g.type(v)
    neighs = list(g.neighbors(v))
    original_edge_types = {n: g.edge_type(g.edge(v, n)) for n in neighs}
    q, r = g.qubit(v), g.row(v)

    # 1. Generate coordinates for the new shape using the provided function
    new_coords = coords_func(q, r)
    num_vs = len(new_coords)

    # 2. Add the new vertices
    new_vs = [g.add_vertex(v_type, qc, rc) for qc, rc in new_coords]

    # 3. Connect new vertices to form the polygon
    for i in range(num_vs):
        g.add_edge((new_vs[i], new_vs[(i + 1) % num_vs]))

    # 4. Find and apply the optimal one-to-one neighbor connections
    assignment = _find_best_pairing_itertools(g, neighs, new_vs)
    for i, neighbor_v in enumerate(neighs):
        new_v = new_vs[assignment[i]]
        g.add_edge((neighbor_v, new_v), original_edge_types[neighbor_v])

    # 5. Remove the original vertex
    g.remove_vertex(v)
    return True


def check_unfuse_4_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) in (VertexType.X, VertexType.Z) and g.vertex_degree(v) == 4 and g.phase(v) == 0


def unfuse_4_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Unfuses a degree-4 spider into a square."""
    return _unfuse_spider(g, v, check_unfuse_4_FE, _get_square_coords)


def check_unfuse_5_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) in (VertexType.X, VertexType.Z) and g.vertex_degree(v) == 5 and g.phase(v) == 0


def unfuse_5_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Unfuses a degree-5 spider into a pentagon."""
    return _unfuse_spider(g, v, check_unfuse_5_FE, _get_pentagon_coords)


def check_unfuse_2n_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) in (VertexType.X, VertexType.Z) and g.vertex_degree(v) % 2 == 0 and g.phase(v) == 0


def _split_neighbors_into_groups(g: BaseGraph[VT, ET], neighbors: list[VT]) -> tuple[list[VT], list[VT]]:
    """
    Splits neighbors into two groups based on their horizontal position (qubit).
    """
    sorted_neighbors = sorted(neighbors, key=lambda n: g.qubit(n))

    midpoint = len(sorted_neighbors) // 2
    group1 = sorted_neighbors[:midpoint]
    group2 = sorted_neighbors[midpoint:]

    return group1, group2


def _calculate_new_spider_positions(
        g: BaseGraph[VT, ET],
        group1: list[VT],
        group2: list[VT]
) -> tuple[float, float, float]:
    """Calculates the average positions for the two new central spiders based on the groups."""
    all_neighbors = group1 + group2
    start_from = min(g.row(n) for n in all_neighbors) - 1

    # Calculate the center (centroid) of each group
    pos_q1 = sum(g.qubit(n) for n in group1) / len(group1)
    pos_q2 = sum(g.qubit(n) for n in group2) / len(group2)

    return pos_q1, pos_q2, start_from


def _unfuse_2n_spider_core(g: BaseGraph[VT, ET], v: VT, w: Optional[int] = None, alternate_pairing_order: bool = False) -> tuple[
    VT, VT]:
    """
    The core function that performs the 2n-degree unfusing operation.

    Args:
        w (Optional[int]): If specified, the function implements the w-fault-equivalent rewrite.
            Only the first w-1 pairs will have a full parity check gadget created between them.
    """
    v_type = g.type(v)
    neighs = list(g.neighbors(v))

    # 1. Split neighbors into two deterministic groups (left and right)
    group1, group2 = _split_neighbors_into_groups(g, neighs)

    # At each level of recursion, we reverse the pairing order within the groups
    # to ensure the resulting ZX diagram can be implemented.
    if alternate_pairing_order:
        group1, group2 = group1[::-1], group2[::-1]
    degree_n = len(group1)

    # 2. Calculate positions based on these two groups
    pos_1, pos_2, start_from = _calculate_new_spider_positions(g, group1, group2)

    # 3. Add the two new central "inner" spiders
    inner_1 = g.add_vertex(v_type, pos_1, start_from - degree_n - 1)
    inner_2 = g.add_vertex(v_type, pos_2, start_from - degree_n - 1)

    # 4. Create the parity check gadgets by pairing nodes from each group
    for i, (n1, n2) in enumerate(zip(group1, group2)):
        if w is None or w >= i + 1:
            v1 = g.add_vertex(v_type, g.qubit(n1), start_from - i)
            v2 = g.add_vertex(v_type, g.qubit(n2), start_from - i)

            g.add_edge((v1, n1))
            g.add_edge((v2, n2))
            g.add_edge((v1, v2))
            g.add_edge((inner_1, v1))
            g.add_edge((inner_2, v2))
        else:
            g.add_edge((inner_1, n1))
            g.add_edge((inner_2, n2))

    g.remove_vertex(v)
    return inner_1, inner_2


def unfuse_2n_FE(g: BaseGraph[VT, ET], v: VT, w: Optional[int] = None) -> bool:
    """
    Unfuses a degree-2n spider into two degree-n spiders.

    Args:
        w (Optional[int]): If specified, the function implements the w-fault-equivalent rewrite.
            Only the first w-1 pairs will have a full parity check gadget created between them.
    """
    if not check_unfuse_2n_FE(g, v):
        return False
    _unfuse_2n_spider_core(g, v, w)
    return True


def recursive_unfuse_2n_FE(g: BaseGraph[VT, ET], v: VT,w: Optional[int] = None, _alternate_pairing_order: bool = False) -> bool:
    """
    Recursively unfuses a degree-2n spider until there is a distance preserving rewrite for an n-legged spider.

    Args:
        w (Optional[int]): If specified, the function implements the w-fault-equivalent rewrite.
            Only the first w-1 pairs will have a full parity check gadget created between them.
    """
    degree = g.vertex_degree(v)
    if degree <= 3:
        return True
    if degree == 4:
        return unfuse_4_FE(g, v)
    if degree == 5:
        return unfuse_5_FE(g, v)

    if not check_unfuse_2n_FE(g, v):
        return False

    inner_1, inner_2 = _unfuse_2n_spider_core(g, v, w, _alternate_pairing_order)
    return (recursive_unfuse_2n_FE(g, inner_1, w, not _alternate_pairing_order) and
            recursive_unfuse_2n_FE(g, inner_2, w, not _alternate_pairing_order))
