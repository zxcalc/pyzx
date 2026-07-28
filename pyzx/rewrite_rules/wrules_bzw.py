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
    'apply_bialgebra_zw_forward',
    'unsafe_bialgebra_zw_forward',
    'match_bialgebra_zw_reverse',
    'apply_bialgebra_zw_reverse',
    'apply_bialgebra_zw_reverse_auto',
]

import logging
from typing import Collection, Optional, Tuple, List, Iterable

import itertools

from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, VT, ET

console = logging.getLogger(__name__)

def __bzw_reverse_identify_vertices(g: BaseGraph[VT,ET], vertices: Iterable[VT]) -> Optional[Tuple[List[VT],List[VT]]]:
    wos: List[VT] = []
    zs: List[VT] = []

    for v in vertices:
        if g.type(v) == VertexType.W_OUTPUT: wos.append(v)
        elif g.type(v) == VertexType.Z: zs.append(v)

    return wos, zs

def match_bialgebra_zw_reverse(g: BaseGraph[VT,ET], vertices: Optional[Collection[VT]] = None) -> Optional[Tuple[List[VT],List[VT]]]:
    """Checks if the reverse BZW rule can be applied; reducing a complete (m,n)-bipartite WZ-pattern to a single ZW-edge.

    Args:
        g: The ZX-diagram graph in which to match for the pattern.
        vertices: a selection of vertices to test for the applicability of the reverse BZW rule.

    Returns:
        wos, zs : a partition of a subset of vertices into W_OUTPUT and Z vertices which
        - form a complete bipartite WZ-pattern
        - each W_OUTPUT vertex has exactly one external neighbour (i.e. outside the bipartite WZ-pattern)
        - each Z vertex has exactly one external neighbour (i.e. outside the bipartite WZ-pattern)
        None if no such pattern was found

    """

    pattern = __bzw_reverse_identify_vertices(g, vertices or g.vertices())
    if pattern is None:
        return None
    wos, zs = pattern

    # All vertices must be from the graph
    if any(w not in g.vertices() for w in wos) or any(z not in g.vertices() for z in zs):
        # console.info("All proposed vertices must belong to the ZX-graph.")
        return None

    # The proposed vertices must be all W_OUTPUT and all Z-spiders with identical phases
    if any(g.type(w) != VertexType.W_OUTPUT for w in wos):
        # console.info(f"All proposed W-vertices must be of type VertexType.W_OUTPUT [{wos}].")
        return None
    phase = g.phase(next(iter(zs)))
    if any(g.type(z) != VertexType.Z or g.phase(z) != phase for z in zs):
        # console.info(f"All proposed Z-vertices must be of type VertexType.Z with identical phases [{zs}].")
        return None

    # The Z vertices must be connected to each W_OUTPUT with a single SIMPLE edge
    if any(
        g.num_edges(wo,z) != 1 or g.edge_type(g.edge(wo,z)) != EdgeType.SIMPLE
        for wo, z in itertools.product(wos, zs)
    ):
        # console.info("The W and Z-vertices must form a complete bipartite graph [connections].")
        return None

    # The Z vertices must have one neighbour outside the complete (m,n)-bipartite pattern
    count_wos = len(wos)
    if any(
        g.vertex_degree(z) != count_wos + 1 or sum(1 for nb in g.neighbors(z) if nb not in wos and nb not in zs) != 1
        for z in zs
    ):
        # console.info("The Z-vertices must belong to a complete bipartite graph [external].")
        return None

    # The W_OUTPUT vertices must have one neighbour outside the complete (m,n)-bipartite pattern
    count_zs = len(zs)
    if any(
        g.vertex_degree(w) != count_zs + 1 or sum(1 for nb in g.neighbors(w) if nb not in wos and nb not in zs) != 1
        for w in wos
    ):
        # console.info("The W_OUTPUT-vertices must belong to a complete bipartite graph [external].")
        return None

    # console.info(f"BZW-rule is applicable to vertices {wos} and {zs}.")
    return wos, zs

def apply_bialgebra_zw_reverse(g: BaseGraph[VT,ET], vertices: Collection[VT]) -> bool:
    """Attempts to apply the reverse BZW rule; reducing a complete (m,n)-bipartite WZ-pattern to a single ZW-edge.

    Args:
        g: The ZX-diagram graph on which to apply the rule.
        vertices: a selection of vertices to consider for applying the reverse BZW rule.

    Returns:
        True or False, depending on whether a matching pattern was found and thus the rule was successfully applied or not.

    """
    match = match_bialgebra_zw_reverse(g, vertices)
    if match is None:
        return False
    wos, zs = match

    return unsafe_apply_bialgebra_zw_reverse(g, wos, zs)

def apply_bialgebra_zw_reverse_auto(g: BaseGraph[VT,ET]) -> bool:
    """Attempt to apply the reverse BZW rule on the entire graph; reducing a complete (m,n)-bipartite WZ-pattern to a single ZW-edge."""
    match = match_bialgebra_zw_reverse(g)
    if match is None:
        return False
    wos, zs = match

    return unsafe_apply_bialgebra_zw_reverse(g, wos, zs)

def unsafe_apply_bialgebra_zw_reverse(g: BaseGraph[VT,ET], wos: Collection[VT], zs: Collection[VT]) -> bool:
    """Apply the reverse BZW rule assuming it is applicable to wos and zs.

    Args:
        g: The ZX-diagram graph on which to apply the rule.
        wos: a collection of W_OUTPUT vertices.
        zs: a collection of Z vertices.

    Returns: always True

    """
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
    for w in wos:
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
    g.set_row(new_wi, row_wi / len(wos))
    g.set_qubit(new_wi, qubit_wi / len(wos))

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
    g.set_row(new_wo, row_wo / len(wos))
    g.set_qubit(new_wo, qubit_wo / len(wos))

    return True

def __bzw_forward_identify_vertices(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> Optional[Tuple[VT,VT]]:
    if g.type(v1) == VertexType.W_INPUT and g.type(v2) == VertexType.Z:
        return v1, v2
    elif g.type(v1) == VertexType.Z and g.type(v2) == VertexType.W_INPUT:
        return v2, v1
    else:
        return None

def check_bialgebra_zw_forward(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    """Checks if the forward BZW rule can be applied; expanding a single ZW-edge to a complete (m,n)-bipartite WZ-pattern.

    Args:
        g: The ZX-diagram graph in which to match for the pattern.
        v1: a vertex from the graph
        v2: a vertex from the graph

    Returns:
        True or False, depending on whether the vertices v1, v2 are a pair of W_INPUT and Z vertices connected through a SIMPLE edge

    """
    # Both vertices must be from the graph
    if v1 not in g.vertices() or v2 not in g.vertices():
        return False

    # The vertices involved must be; one W_INPUT and one Z
    endpoints = __bzw_forward_identify_vertices(g, v1, v2)
    if not endpoints:
        return False
    wi, z = endpoints

    # The Z vertex must be connected to the W_INPUT through a SIMPLE edge
    if g.num_edges(z, wi) != 1 or g.edge_type(g.edge(z, wi)) != EdgeType.SIMPLE:
        return False

    return True

def apply_bialgebra_zw_forward(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    """Attempt to apply the forward BZW rule; expanding a single ZW-edge to a complete (m,n)-bipartite WZ-pattern.

    Args:
        g: The ZX-diagram graph on which to apply the rule.
        v1: a vertex from the graph
        v2: a vertex from the graph

    Returns:
        True or False, depending on whether the rule is applicable to vertices v1, v2

    """
    if not check_bialgebra_zw_forward(g, v1, v2):
        return False

    return unsafe_bialgebra_zw_forward(g, v1, v2)

def unsafe_bialgebra_zw_forward(g: BaseGraph[VT,ET], v1: VT, v2: VT) -> bool:
    """Attempt to apply the forward BZW rule without checking for its applicability.

    Args:
        g: The ZX-diagram graph on which to apply the rule.
        v1: a vertex from the graph
        v2: a vertex from the graph

    Returns:
        True if the rule was successfully applied
        False if v1, v2 are not a pair of W_INPUT and Z vertices

    """

    # The vertices involved must be; one W_INPUT and one Z
    endpoints = __bzw_forward_identify_vertices(g, v1, v2)
    if not endpoints:
        return False
    wi, z = endpoints

    # The W_OUTPUT connected to Z through W_INPUT
    wo = next(
        nb for nb in g.neighbors(wi)
        if g.type(nb) == VertexType.W_OUTPUT and g.edge_type(g.edge(nb, wi)) == EdgeType.W_IO
    )

    wos = []
    # Attach each external neighbour of Z (except W_INPUT) as the input to a dedicated W_OUTPUT
    for nb_z in g.neighbors(z):
        if nb_z == wi:
            continue

        nwi = g.add_vertex(ty=VertexType.W_INPUT, qubit=g.qubit(nb_z), row=g.row(nb_z) + 0.5)
        nwo = g.add_vertex(ty=VertexType.W_OUTPUT, qubit=g.qubit(nb_z), row=g.row(nb_z) + 1.0)
        g.add_edge( (nb_z, nwi) )
        g.add_edge( (nwi,nwo) , EdgeType.W_IO )
        wos.append(nwo)

    zs = []
    # Attach each output of W_OUTPUT to a dedicated Z-spider
    for nb_w in g.neighbors(wo):
        if nb_w == wi:
            continue

        nz = g.add_vertex(ty=VertexType.Z, qubit=g.qubit(nb_w), row=g.row(nb_w) - 1.0)
        g.set_phase(nz, g.phase(z))
        g.add_edge( (nz, nb_w) )
        zs.append(nz)

    # Remove the old vertices
    g.remove_vertex(z)
    g.remove_vertex(wi)
    g.remove_vertex(wo)

    # Weave the complete bipartite pattern between the W_OUTPUT and Z vertices
    for wo, z in itertools.product(wos, zs):
        g.add_edge( (wo, z) )

    return True
