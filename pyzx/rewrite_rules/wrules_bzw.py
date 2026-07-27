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
    'check_bialgebra_zw_reverse',
    'check_bialgebra_zw_forward',
    'apply_bialgebra_zw_reverse',
    'apply_bialgebra_zw_forward',
]

import logging
from typing import Collection

import itertools

from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, VT, ET

console = logging.getLogger(__name__)

def check_bialgebra_zw_reverse(g: BaseGraph[VT,ET], wos: Collection[VT], zs: Collection[VT]) -> bool:
    """Checks if the BZW rule can be applied in a forward way to a complete (m,n)-bipartite pattern of W and Z vertices."""

    # All vertices must be from the graph
    if any(w not in g.vertices() for w in wos) or any(z not in g.vertices() for z in zs):
        console.info("All proposed vertices must belong to the ZX-graph.")
        return False

    # The proposed vertices must be all W_OUTPUT and all Z-spiders with identical phases
    if any(g.type(w) != VertexType.W_OUTPUT for w in wos):
        console.info(f"All proposed W-vertices must be of type VertexType.W_OUTPUT [{wos}].")
        return False
    phase = g.phase(next(iter(zs)))
    if any(g.type(z) != VertexType.Z or g.phase(z) != phase for z in zs):
        console.info(f"All proposed Z-vertices must be of type VertexType.Z with identical phases [{zs}].")
        return False

    # The Z vertices must be connected to each W_OUTPUT with a single SIMPLE edge
    if any(
        g.num_edges(wo,z) != 1 or g.edge_type(g.edge(wo,z)) != EdgeType.SIMPLE
        for wo, z in itertools.product(wos, zs)
    ):
        console.info("The W and Z-vertices must form a complete bipartite graph [connections].")
        return False

    # The Z vertices must have one neighbour outside the complete (m,n)-bipartite pattern
    count_wos = len(wos)
    if any(
        g.vertex_degree(z) != count_wos + 1 or sum(1 for nb in g.neighbors(z) if nb not in wos and nb not in zs) != 1
        for z in zs
    ):
        console.info("The Z-vertices must belong to a complete bipartite graph [external].")
        return False

    # The W_OUTPUT vertices must have one neighbour outside the complete (m,n)-bipartite pattern
    count_zs = len(zs)
    if any(
        g.vertex_degree(w) != count_zs + 1 or sum(1 for nb in g.neighbors(w) if nb not in wos and nb not in zs) != 1
        for w in wos
    ):
        console.info("The W_OUTPUT-vertices must belong to a complete bipartite graph [external].")
        return False

    console.info(f"BZW-rule is applicable to vertices {wos} and {zs}.")
    return True

def apply_bialgebra_zw_reverse(g: BaseGraph[VT,ET], ws: Collection[VT], zs: Collection[VT]) -> bool:
    if not check_bialgebra_zw_reverse(g, ws, zs):
        return False

    new_z = g.add_vertex(ty=VertexType.Z, phase=g.phase(next(iter(zs))))
    new_wi = g.add_vertex(ty=VertexType.W_INPUT)
    new_wo = g.add_vertex(ty=VertexType.W_OUTPUT)
    g.add_edge( (new_z,new_wi) )
    g.add_edge( (new_wi,new_wo), EdgeType.W_IO )

    row_z = 0
    qubit_z = 0
    row_wi = 0
    qubit_wi = 0

    # Connect the two input vertices (i.e. connected through W_INPUTs into W-vertices) to the new Z-spider
    for w in ws:
        wi = next(filter(
            lambda nb: g.type(nb) == VertexType.W_INPUT and g.edge_type(g.edge(w,nb)) == EdgeType.W_IO, g.neighbors(w)
        ))
        i = next(filter(lambda nb: g.type(nb) != VertexType.W_OUTPUT, g.neighbors(wi)))
        g.add_edge( (i,new_z) )
        row_z += g.row(wi)
        qubit_z += g.qubit(wi)
        row_wi += g.row(w)
        qubit_wi += g.qubit(w)
        g.remove_vertex(wi)
        g.remove_vertex(w)

    # Position the new Z-spider halfway between the old W_INPUT vertices
    g.set_row(new_z, row_z / len(zs))
    g.set_qubit(new_z, qubit_z / len(zs))
    # Position the new W_INPUT halfway between the old W_OUTPUT vertices
    g.set_row(new_wi, row_wi / len(ws))
    g.set_qubit(new_wi, qubit_wi / len(ws))

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
    g.set_row(new_wo, row_wo / len(ws))
    g.set_qubit(new_wo, qubit_wo / len(ws))

    return True

def check_bialgebra_zw_forward(g: BaseGraph[VT,ET], w: VT, z: VT) -> bool:
    # Both vertices must be from the graph
    if w not in g.vertices() or z not in g.vertices():
        return False

    # The vertices involved must be; one W_OUTPUT and one Z
    if g.type(w) != VertexType.W_OUTPUT or g.type(z) != VertexType.Z:
        return False

    # The Z vertex must be connected to the W vertex through a W_INPUT with SIMPLE edges
    if not any(
        g.num_edges(z, wi) == 1 and g.edge_type(g.edge(z, wi)) == EdgeType.SIMPLE
        for wi in g.neighbors(w) if g.edge_type(g.edge(w, wi)) == EdgeType.W_IO and g.type(wi) == VertexType.W_INPUT
    ):
        return False

    return True

def apply_bialgebra_zw_forward(g: BaseGraph[VT,ET], wo: VT, z: VT) -> bool:
    if not check_bialgebra_zw_forward(g, wo, z):
        return False

    # The current W_INPUT connecting W_OUTPUT to Z
    wi = next(nb for nb in g.neighbors(wo) if g.type(nb) == VertexType.W_INPUT)

    wos = []
    # Attach each nb_z as the input to a dedicated W_OUTPUT
    for nb_z in g.neighbors(z):
        if nb_z == wi:
            continue

        nwi = g.add_vertex(ty=VertexType.W_INPUT, qubit=g.qubit(nb_z), row=g.row(nb_z) + 0.5)
        nwo = g.add_vertex(ty=VertexType.W_OUTPUT, qubit=g.qubit(nb_z), row=g.row(nb_z) + 1.0)
        wos.append(nwo)
        g.add_edge( (nb_z, nwi) )
        g.add_edge( (nwi,nwo) , EdgeType.W_IO )

    zs = []
    # Attach each nb_w to a dedicated Z-spider
    for nb_w in g.neighbors(wo):
        if nb_w == wi:
            continue

        nz = g.add_vertex(ty=VertexType.Z, qubit=g.qubit(nb_w), row=g.row(nb_w) - 1.0)
        zs.append(nz)
        g.set_phase(nz, g.phase(z))
        g.add_edge( (nz, nb_w) )

    # Remove the old vertices
    g.remove_vertex(z)
    g.remove_vertex(wi)
    g.remove_vertex(wo)

    # Weave the complete bipartite pattern between the Z and W_OUTPUT
    for wo, z in itertools.product(wos, zs):
        g.add_edge( (wo, z) )

    return True
