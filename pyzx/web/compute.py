# PyZX - Python library for quantum circuit rewriting
#        and optimization using the ZX-calculus
# Copyright (C) 2024 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from typing import Optional, Tuple, List

import numpy as np

from .red_green import to_red_green_form
from .firing_assignments import (
    determine_ordering,
    create_firing_verification,
    convert_firing_assignment_to_web_prototype,
)
from ..graph.base import BaseGraph
from ..pauliweb import PauliWeb


def _compute(
    graph: BaseGraph[int, Tuple[int, int]], *, stabilisers: bool, detecting_regions: bool
) -> Tuple[Optional[List[PauliWeb[int, Tuple[int, int]]]], Optional[List[PauliWeb[int, Tuple[int, int]]]]]:
    """
    Performs full stabiliser and detecting region computation, depending on the given flags. Enabling both flags in one
    call is preferred to enabling them in separate calls as they may share basic computations.
    """

    g = graph.clone()

    additional_nodes = to_red_green_form(g)
    ordering = determine_ordering(g)
    m_d = create_firing_verification(g, ordering)

    # Compute row span of valid firing assignment space
    sol_row_basis = m_d.null_space()

    stabs = None
    if stabilisers:
        # Search for solutions that do not highlight boundary edges, i.e. detecting regions
        boundary_selected_basis = sol_row_basis.transpose()[: len(ordering.z_boundaries) * 2, :]

        pivot_cols = []
        for row in boundary_selected_basis.row_reduce():
            nonzero_indices = np.nonzero(row)[0]
            if len(nonzero_indices) > 0:
                pivot_cols.append(nonzero_indices[0])
        stab_sols = [sol_row_basis[i].tolist() for i in pivot_cols]
        stabs = list(map(lambda v: convert_firing_assignment_to_web_prototype(g, ordering, v), stab_sols))
        for stab in stabs:
            additional_nodes.remove_from(g, stab)
            stab.g = graph

    regions = None
    if detecting_regions:
        # Search for solutions that do not highlight boundary edges, i.e. detecting regions
        boundary_selected_basis = sol_row_basis.transpose()[: len(ordering.z_boundaries) * 2, :]
        boundary_nullspace_vectors = boundary_selected_basis.null_space()
        # Empty nullspace of boundary edges -> no webs that highlight no boundary edges -> no detecting regions
        if len(boundary_nullspace_vectors) == 0:
            region_sols = []
        else:
            region_sols = (boundary_nullspace_vectors @ sol_row_basis).tolist()
        regions = list(map(lambda v: convert_firing_assignment_to_web_prototype(g, ordering, v), region_sols))
        for region in regions:
            additional_nodes.remove_from(g, region)
            region.g = graph

    return stabs, regions


def compute_stabilisers(graph: BaseGraph[int, Tuple[int, int]]) -> List[PauliWeb[int, Tuple[int, int]]]:
    """
    :return: A set of stabilising webs for the given diagram that forms a basis for the diagrams stabilisers when
        restricted to its boundary. A full basis for all stabilising webs is only obtained by combining the return value
        with a basis for the diagrams detecting regions.
    """
    stabs, _ = _compute(graph, stabilisers=True, detecting_regions=False)
    if stabs is None:
        raise RuntimeError("Stabilisers requested but not given!")

    return stabs


def compute_detecting_regions(graph: BaseGraph[int, Tuple[int, int]]) -> List[PauliWeb[int, Tuple[int, int]]]:
    """
    :return: A basis for the detecting regions of the given diagram.
    """
    _, regions = _compute(graph, stabilisers=False, detecting_regions=True)
    if regions is None:
        raise RuntimeError("Regions requested but not given!")

    return regions


def compute_pauli_webs(graph: BaseGraph[int, Tuple[int, int]])\
        -> Tuple[List[PauliWeb[int, Tuple[int, int]]], List[PauliWeb[int, Tuple[int, int]]]]:
    """
    See .compute_stabilisers and .compute_detecting_regions of this package.
    """
    stabs, regions = _compute(graph, stabilisers=True, detecting_regions=True)
    if stabs is None or regions is None:
        raise RuntimeError("Stabilisers and regions requested but at least one is not given!")

    return stabs, regions
