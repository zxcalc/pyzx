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
This module contains the implementation of the fault-equivalent un-fusion rules that decompose high-degree spiders
into diagrams with only degree 3 spiders.

The check function returns a boolean indicating whether the rule can be applied.
The standard version of the applier will automatically call the basic checker, while the unsafe version
of the applier will assume that the given input is correct and will apply the rule without running the check first.

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

__all__ = [
    'check_unfuse_4_FE',
    'unfuse_4_FE',
    'unsafe_unfuse_4_FE',
    'check_unfuse_5_FE',
    'unfuse_5_FE',
    'unsafe_unfuse_5_FE',
    'check_unfuse_2n_FE',
    'unfuse_2n_FE',
    'unsafe_unfuse_2n_FE',
    'check_unfuse_2n_plus_FE',
    'unfuse_2n_plus_FE',
    'unsafe_unfuse_2n_plus_FE',
    'check_recursive_unfuse_FE',
    'recursive_unfuse_FE',
    'unsafe_recursive_unfuse_FE',
]

import itertools
import math
from typing import Callable, Optional

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.utils import VertexType


def _linear_sum_assignment_itertools(cost_matrix) -> tuple[list, list]:
    rows = list(range(len(cost_matrix)))
    cols = list(range(len(cost_matrix[0]) if cost_matrix else 0))

    best = None
    best_perm = None
    for perm in itertools.permutations(cols, len(rows)):
        s = 0.0
        for i, j in enumerate(perm):
            s += float(cost_matrix[i][j])
        if best is None or s < best:
            best = s
            best_perm = perm
    row_ind = list(rows)
    col_ind = list(best_perm) if best_perm else []
    return row_ind, col_ind


def _find_best_pairing(
        g: BaseGraph[VT, ET],
        neighbors: list[VT],
        new_vertices: list[VT]
) -> tuple:
    """Finds the optimal assignment using the Hungarian algorithm if available,
    otherwise falls back to lighter solvers / heuristics."""
    # build cost matrix (num_vs x num_vs)
    num_vs = len(neighbors)
    if num_vs == 0:
        return tuple()
    cost_matrix = [[0.0] * num_vs for _ in range(num_vs)]
    for i in range(num_vs):
        n_q, n_r = g.qubit(neighbors[i]), g.row(neighbors[i])
        for j in range(num_vs):
            new_v_q, new_v_r = g.qubit(new_vertices[j]), g.row(new_vertices[j])
            cost_matrix[i][j] = math.hypot(new_v_q - n_q, new_v_r - n_r)
    row_ind, col_ind = _linear_sum_assignment_itertools(cost_matrix)
    # return tuple of column indices matching each row index order;
    # ensure ordering by row index
    # build a mapping row->col
    mapping = {r: c for r, c in zip(row_ind, col_ind)}
    result = [mapping[i] for i in range(num_vs)]
    return tuple(result)


def _find_best_assignment(
        g: BaseGraph[VT, ET],
        items_to_assign: list[VT],
        available_slots: list[VT]
) -> dict[VT, VT]:
    """
    Finds the optimal assignment of items to slots (where len(slots) >= len(items))
    to minimize total connection distance using the Hungarian algorithm.

    Returns:
        A dictionary mapping {item: slot}
    """
    num_items = len(items_to_assign)
    num_slots = len(available_slots)
    if num_items == 0:
        return {}
    # If more items than slots, trim (should not usually happen)
    if num_items > num_slots:
        items_to_assign = items_to_assign[:num_slots]
        num_items = num_slots

    # build cost matrix (num_items x num_slots)
    cost_matrix = [[0.0] * num_slots for _ in range(num_items)]
    for i in range(num_items):
        item_q, item_r = g.qubit(items_to_assign[i]), g.row(items_to_assign[i])
        for j in range(num_slots):
            slot_q, slot_r = g.qubit(available_slots[j]), g.row(available_slots[j])
            cost_matrix[i][j] = math.hypot(slot_q - item_q, slot_r - item_r)

    row_ind, col_ind = _linear_sum_assignment_itertools(cost_matrix)
    assignment_map = {}
    for r, c in zip(row_ind, col_ind):
        if r < num_items and c < num_slots:
            assignment_map[items_to_assign[r]] = available_slots[c]
    return assignment_map


def _get_square_coords(q: float, r: float) -> list[tuple[float, float]]:
    """Generates coordinates for 4 vertices in a square centered at (q, r)."""
    d = 0.5
    return [(q - d, r - d), (q + d, r - d), (q + d, r + d), (q - d, r + d)]


def _get_n_cycle_coords(N: int, q: float, r: float) -> list[tuple[float, float]]:
    """Generates coordinates for N vertices in a N-cycle graph centered at (q, r)."""
    radius = 0.75 * N / 5
    coords = []
    for i in range(N):
        angle = (2 * math.pi * i / N) + (math.pi)
        qc = q + radius * math.cos(angle)
        rc = r - radius * math.sin(angle)
        coords.append((qc, rc))
    return coords


def _unsafe_unfuse_spider(
        g: BaseGraph[VT, ET],
        v: VT,
        coords_func: Callable
) -> bool:
    """A generic function to unfuse a spider into a polygon of new spiders."""
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
    assignment = _find_best_pairing(g, neighs, new_vs)
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
    if not check_unfuse_4_FE(g, v):
        return False
    return unsafe_unfuse_4_FE(g, v)


def unsafe_unfuse_4_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Unfuses a degree-4 spider into a square."""
    return _unsafe_unfuse_spider(g, v, _get_square_coords)


def check_unfuse_5_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) in (VertexType.X, VertexType.Z) and g.vertex_degree(v) == 5 and g.phase(v) == 0


def unfuse_5_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Unfuses a degree-5 spider into a pentagon."""
    if not check_unfuse_5_FE(g, v):
        return False
    return unsafe_unfuse_5_FE(g, v)


def unsafe_unfuse_5_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Unfuses a degree-5 spider into a pentagon."""
    return _unsafe_unfuse_spider(g, v, lambda x, y: _get_n_cycle_coords(5, x, y))


def check_unfuse_2n_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) in (VertexType.X, VertexType.Z) and g.vertex_degree(v) % 2 == 0 and g.phase(v) == 0


def check_unfuse_2n_plus_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) in (VertexType.X, VertexType.Z) and g.vertex_degree(v) % 2 == 1 and g.phase(v) == 0


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


def _unfuse_2n_spider_core(g: BaseGraph[VT, ET], v: VT, w: Optional[int] = None) -> tuple[
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
    if len(group2) > len(group1):
        g.add_edge((inner_2, group2[-1]))

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
    return unsafe_unfuse_2n_FE(g, v, w)


def unsafe_unfuse_2n_FE(g: BaseGraph[VT, ET], v: VT, w: Optional[int] = None) -> bool:
    """
    Unfuses a degree-2n spider into two degree-n spiders.

    Args:
        w (Optional[int]): If specified, the function implements the w-fault-equivalent rewrite.
            Only the first w-1 pairs will have a full parity check gadget created between them.
    """
    _unfuse_2n_spider_core(g, v, w)
    return True


def unfuse_2n_plus_FE(g: BaseGraph[VT, ET], v: VT, w: Optional[int] = None) -> bool:
    """
    Unfuses a degree-(2n + 1) spider into a degree-n spider and a degree-(n + 1) spider.

    Args:
        w (Optional[int]): If specified, the function implements the w-fault-equivalent rewrite.
            Only the first w-1 pairs will have a full parity check gadget created between them.
    """
    if not check_unfuse_2n_plus_FE(g, v):
        return False
    return unsafe_unfuse_2n_plus_FE(g, v, w)


def unsafe_unfuse_2n_plus_FE(g: BaseGraph[VT, ET], v: VT, w: Optional[int] = None) -> bool:
    """
    Unfuses a degree-(2n + 1) spider into a degree-n spider and a degree-(n + 1) spider.

    Args:
        w (Optional[int]): If specified, the function implements the w-fault-equivalent rewrite.
            Only the first w-1 pairs will have a full parity check gadget created between them.
    """
    _unfuse_2n_spider_core(g, v, w)
    return True


def check_recursive_unfuse_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) in (VertexType.X, VertexType.Z) and g.phase(v) == 0


def recursive_unfuse_FE(g: BaseGraph[VT, ET], v: VT, w: Optional[int] = None) -> bool:
    """
    Recursively unfuses a spider.

    Args:
        w (Optional[int]): If specified, the function implements the w-fault-equivalent rewrite.
            Only the first w-1 pairs will have a full parity check gadget created between them.
    """
    if not check_recursive_unfuse_FE(g, v):
        return False
    return unsafe_recursive_unfuse_FE(g, v, w)


def unsafe_recursive_unfuse_FE(g: BaseGraph[VT, ET], v: VT, w: Optional[int] = None) -> bool:
    """
    Recursively unfuses a spider.

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

    inner_1, inner_2 = _unfuse_2n_spider_core(g, v, w)
    return (unsafe_recursive_unfuse_FE(g, inner_1, w) and
            unsafe_recursive_unfuse_FE(g, inner_2, w))
