# PyZX - Python library for quantum circuit rewriting
#        and optimization using the ZX-calculus
# Copyright (C) 2026 - Aleks Kissinger and John van de Wetering

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
This module contains the implementation of the ZW-bialgebra rule (hereinafter BZW) for the ZXW-Calculus
cfr. Section 2.2.2 in https://arxiv.org/pdf/2302.12135

"""


__all__ = [
    'check_bialgebra_zw_forward',
]

import logging
from typing import Tuple

import itertools

from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, VT, ET

console = logging.getLogger(__name__)

def check_bialgebra_zw_forward(g: BaseGraph[VT,ET], ws: Tuple[VT,VT], zs: Tuple[VT,VT]) -> bool:
    """Checks if the BZW rule can be applied in a forward way to two pairs of W and Z vertices."""

    # All vertices must be from the graph
    if any(w not in g.vertices() for w in ws) or any(z not in g.vertices() for z in zs):
        # console.info("All proposed vertices must belong to the ZX-graph.")
        return False

    # The vertices involved must be; two W_OUTPUT and two Z with a phase of 0
    if any(g.type(w) != VertexType.W_OUTPUT for w in ws):
        # console.info(f"All proposed W-vertices must be of type VertexType.W_OUTPUT [{ws}].")
        return False
    if any(g.type(z) != VertexType.Z or g.phase(z) != 0 for z in zs):
        # console.info(f"All proposed Z-vertices must be of type VertexType.Z with zero-phase [{zs}].")
        return False

    # The Z vertices must be connected to each W_OUTPUT with a single SIMPLE edge
    if any(
        g.num_edges(w,z) != 1 or g.edge_type(g.edge(w,z)) != EdgeType.SIMPLE
        for w, z in itertools.product(ws, zs)
    ):
        # console.info("The W and Z-vertices must form a complete bipartite graph.")
        return False

    # Neither the Z vertices nor the W_OUTPUT vertices can have edges among themselves
    if g.num_edges(zs[0], zs[1]) != 0 or g.num_edges(ws[0], ws[1]) != 0:
        # console.info("The W and Z-vertices cannot be connected among themselves")
        return False

    # TODO: Must each W_OUTPUT be connected to exactly one W_INPUT ?

    # console.info(f"BZW-rule applicable to vertices {ws} and {zs}.")
    return True
