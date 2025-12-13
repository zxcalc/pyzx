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

from typing import Dict, List, NamedTuple, Tuple

from galois import GF2

from ..graph.base import BaseGraph
from ..linalg import Z2
from ..pauliweb import PauliWeb
from ..utils import VertexType


class GraphOrdering(NamedTuple):
    """
    Creates an ordering of all vertices in the graph (which is assumed to be in red-green form by usage of related
    functions in this package), seperated into three groups: 1. A mapping of Z spiders identifying a boundary, to their
    boundary; 2. a list of all internal 0/pi-phase spiders; 3. a list of all (minus) half-pi-phase spiders.

    The collections identify vertices from the graph and mappings between the ordering and the graph vertex ids
    are provided.
    """
    graph_to_ordering: Dict[int, int]
    ordering_to_graph: Dict[int, int]

    z_boundaries: Dict[int, int]
    internal_spiders: List[int]
    pi_2_spiders: List[int]

    def ord(self, s: int) -> int:
        return self.graph_to_ordering[s]

    def graph(self, o: int) -> int:
        return self.ordering_to_graph[o]


def determine_ordering(g: BaseGraph[int, Tuple[int, int]]) -> GraphOrdering:
    """
    Creates an ordering of all vertices in the graph, such that the three groups of spiders (see GraphOrdering class
    for details) have contiguous ordering indices. The group order is:
    <Z boundaries><0/pi-phase spiders><(minus) half-pi-phase spiders>.
    """
    boundaries = [v for v in g.vertices() if g.type(v) == VertexType.BOUNDARY]
    z_boundaries = {list(g.neighbors(b))[0]: b for b in boundaries}
    internal_spiders = list(g.vertex_set().difference(boundaries).difference(z_boundaries.keys()))
    pi_2_spiders = list(filter(lambda _v: g.phase(_v).denominator == 2, internal_spiders))

    graph_to_ordering: Dict[int, int] = dict()
    ordering_to_graph: Dict[int, int] = dict()
    idx = 0
    for boundary in z_boundaries.keys():
        graph_to_ordering[boundary] = idx
        ordering_to_graph[idx] = boundary
        idx += 1
    for internal in set(internal_spiders).difference(pi_2_spiders):
        graph_to_ordering[internal] = idx
        ordering_to_graph[idx] = internal
        idx += 1
    for pi_2_spider in pi_2_spiders:
        graph_to_ordering[pi_2_spider] = idx
        ordering_to_graph[idx] = pi_2_spider
        idx += 1

    return GraphOrdering(graph_to_ordering, ordering_to_graph, z_boundaries, internal_spiders, pi_2_spiders)


def create_firing_verification(g: BaseGraph[int, Tuple[int, int]], ordering: GraphOrdering) -> GF2:
    """
    Based on a graph with an accompanying vertex ordering, creates a 'firing verification matrix' that exactly has the
    space of all valid firing assignments (equivalent to Pauli webs) as its nullspace.
    """
    num_z_boundaries = len(ordering.z_boundaries)
    num_non_boundary_spiders = num_z_boundaries + len(ordering.internal_spiders)
    adj_matrix = GF2.Zeros((num_non_boundary_spiders, num_non_boundary_spiders))

    for s, t in g.edges():
        if g.type(s) != VertexType.BOUNDARY and g.type(t) != VertexType.BOUNDARY:
            adj_matrix[ordering.ord(s), ordering.ord(t)] = 1
            adj_matrix[ordering.ord(t), ordering.ord(s)] = 1

    rows, cols = num_non_boundary_spiders, num_non_boundary_spiders + num_z_boundaries
    m_d = GF2.Zeros((rows, cols))
    m_d[0:num_z_boundaries, 0:num_z_boundaries] = GF2.Identity(num_z_boundaries)
    m_d[:, num_z_boundaries:] = adj_matrix
    num_pi_2 = len(ordering.pi_2_spiders)
    slice_key = (slice(rows - num_pi_2, rows), slice(cols - num_pi_2, cols))
    m_d[slice_key] = m_d[slice_key].view(dtype=bool) ^ GF2.Identity(num_pi_2).view(dtype=bool)

    return m_d


def convert_firing_assignment_to_web_prototype(
    g: BaseGraph[int, Tuple[int, int]], ordering: GraphOrdering, v: List[Z2]
) -> PauliWeb:
    """
    Based on a graph with an accompanying vertex ordering, takes a valid firing assignment and converts it to a Pauli
    web valid on the given graph. Note that the graph is assumed to be in red-green form, and functions from this file
    / package have been used to convert it and create the ordering.
    """
    prot = PauliWeb(g)

    for adj_vertex, g_vertex in ordering.ordering_to_graph.items():
        g_type = g.type(g_vertex)
        # Fire all green spiders with full red edges and thus their red neighbours
        if g_type == VertexType.Z and v[adj_vertex + len(ordering.z_boundaries)] == 1:
            for _n in g.neighbors(g_vertex):
                prot.add_edge((g_vertex, _n), 'X')
        # Fire all red spiders with full green edges and thus their green neighbours
        if g_type == VertexType.X and v[adj_vertex + len(ordering.z_boundaries)] == 1:
            for _n in g.neighbors(g_vertex):
                prot.add_edge((g_vertex, _n), 'Z')

    # Fire all green output edges
    for g_z_boundary, g_boundary in ordering.z_boundaries.items():
        adj_z_boundary = ordering.ord(g_z_boundary)
        if v[adj_z_boundary] == 1:
            prot.add_edge((g_z_boundary, g_boundary), 'Z')

    return prot
