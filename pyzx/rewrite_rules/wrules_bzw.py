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
    'check_bialgebra_zw_reverse',
    'apply_bialgebra_zw_forward',
]

import logging
from typing import Tuple

import itertools

from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, VT, ET

console = logging.getLogger(__name__)

# TODO: is it necessary to check that a W_OUTPUT is connected to exactly one W_INPUT ?
# TODO: is it necessary to check that a W_INPUT is connected to exactly two neighbors ?
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

    # console.info(f"BZW-rule applicable to vertices {ws} and {zs}.")
    return True

def check_bialgebra_zw_reverse(g: BaseGraph[VT,ET], w: VT, z: VT) -> bool:
    # Both vertices must be from the graph
    if w not in g.vertices() or z not in g.vertices():
        return False

    # The vertices involved must be; one W_OUTPUT and one Z with a phase of 0
    if g.type(w) != VertexType.W_OUTPUT or g.type(z) != VertexType.Z or g.phase(z) != 0:
        return False

    # The Z vertex must be connected to the W vertex through a W_INPUT with SIMPLE edges
    if not any(
        g.num_edges(z, wi) == 1 and g.edge_type(g.edge(z, wi)) == EdgeType.SIMPLE
        for wi in g.neighbors(w) if g.edge_type(g.edge(w, wi)) == EdgeType.SIMPLE and g.type(wi) == VertexType.W_INPUT
    ):
        return False

    return True

def apply_bialgebra_zw_forward(g: BaseGraph[VT,ET], ws: Tuple[VT,VT], zs: Tuple[VT,VT]) -> bool:
    if not check_bialgebra_zw_forward(g, ws, zs):
        return False

    # TODO: is a phase of 0 or pi allowed on the Z-spiders as in the Bialgebra rule ?
    # TODO: figure out the qubit and row for those new vertices
    new_z = g.add_vertex(ty=VertexType.Z)
    new_wi = g.add_vertex(ty=VertexType.W_INPUT)
    new_wo = g.add_vertex(ty=VertexType.W_OUTPUT)
    g.add_edge( (new_z,new_wi) )
    g.add_edge( (new_wi,new_wo) )

    row_z = 0
    qubit_z = 0
    row_wi = 0
    qubit_wi = 0

    # Connect the two input vertices (i.e. connected through W_INPUTs into W-vertices) to the new Z-spider
    for w in ws:
        wi = next(filter(lambda nb: g.type(nb) == VertexType.W_INPUT, g.neighbors(w)))
        i = next(filter(lambda nb: g.type(nb) != VertexType.W_OUTPUT, g.neighbors(wi)))
        g.add_edge( (i,new_z) )
        row_z += g.row(wi)
        qubit_z += g.qubit(wi)
        row_wi += g.row(w)
        qubit_wi += g.qubit(w)
        g.remove_vertex(wi)
        g.remove_vertex(w)

    # Position the new Z-spider halfway between the old W_INPUT vertices
    g.set_row(new_z, row_z / 2)
    g.set_qubit(new_z, qubit_z / 2)
    # Position the new W_INPUT halfway between the old W_OUTPUT vertices
    g.set_row(new_wi, row_wi / 2)
    g.set_qubit(new_wi, qubit_wi / 2)

    row_wo = 0
    qubit_wo = 0
    # Connect the two output vertices (i.e. connected to Z-vertices except the W_OUTPUTs) to the new W_OUTPUT
    for z in zs:
        o = next(filter(lambda nb: g.type(nb) != VertexType.W_OUTPUT, g.neighbors(z)))
        g.add_edge( (new_wo,o) )
        row_wo += g.row(z)
        qubit_wo += g.qubit(z)
        g.remove_vertex(z)

    # Position the new W_OUTPUT halfway between the old Z-spiders
    g.set_row(new_wo, row_wo / 2)
    g.set_qubit(new_wo, qubit_wo / 2)

    return True
