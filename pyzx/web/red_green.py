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

from dataclasses import dataclass
from fractions import Fraction
from typing import Dict, List, Tuple, Iterable, Optional, Any

from ..pauliweb import PauliWeb
from ..utils import VertexType, EdgeType
from ..graph.base import BaseGraph


@dataclass(init=True, frozen=True)
class ExtraIdNode:
    node: int


@dataclass(init=True, frozen=True)
class ExpandedHadamard:
    r1_node: int
    r2_node: int
    r3_node: int
    origin: Optional[int]
    flipped_decomposition: bool


class AdditionalNodes:
    """
    Represents collections of additional nodes introduced during conversion of a graph to red-green form, additionally
    storing the original identities of the removed nodes (if any).
    """
    extra_id_nodes: List[ExtraIdNode]
    expanded_hadamards: List[ExpandedHadamard]

    def __init__(self, extra_id_nodes: List[ExtraIdNode], expanded_hadamards: List[ExpandedHadamard]):
        self.extra_id_nodes = extra_id_nodes
        self.expanded_hadamards = expanded_hadamards

    @staticmethod
    def empty() -> "AdditionalNodes":
        return AdditionalNodes([], [])

    def add_extra_id_node(self, node: int):
        self.extra_id_nodes.append(ExtraIdNode(node))

    def add_expanded_hadamard(self, expanded_hadamard: ExpandedHadamard):
        self.expanded_hadamards.append(expanded_hadamard)

    def _remove_extra_id_node(self, adj: Dict[int, Dict[int, Any]], web: PauliWeb, id_node: ExtraIdNode):
        v1, v2 = adj[id_node.node].keys()
        web.add_half_edge((v1, v2), web[v1, id_node.node])
        web.add_half_edge((v2, v1), web[v1, id_node.node])
        adj[v1][v2] = True
        adj[v2][v1] = True
        web.remove_edges([(v1, id_node.node), (id_node.node, v2)])
        del adj[v1][id_node.node]
        del adj[id_node.node][v1]
        del adj[id_node.node][v2]
        del adj[v2][id_node.node]

    def _remove_expanded_hadamard(self, adj: Dict[int, Dict[int, Any]], web: PauliWeb, hadamard: ExpandedHadamard):
        w1, w2, w3 = hadamard.r1_node, hadamard.r2_node, hadamard.r3_node
        w1_left, w1_right = adj[w1].keys()
        l = w1_left if w1_right == w2 else w1_right
        w3_left, w3_right = adj[w3].keys()
        r = w3_right if w3_left == w2 else w3_left

        if hadamard.origin is not None:
            web.add_half_edge((l, hadamard.origin), web[l, w1])
            web.add_half_edge((hadamard.origin, l), web[l, w1])
            web.add_half_edge((hadamard.origin, r), web[r, w3])
            web.add_half_edge((r, hadamard.origin), web[r, w3])
            if hadamard.origin not in adj: adj[hadamard.origin] = dict()
            adj[l][hadamard.origin] = True
            adj[hadamard.origin][l] = True
            adj[hadamard.origin][r] = True
            adj[r][hadamard.origin] = True
        else:
            web.add_half_edge((l, r), web[l, w1])
            web.add_half_edge((r, l), web[r, w3])
            adj[l][r] = True
            adj[r][l] = True
        web.remove_edges([(l, w1), (w1, w2), (w2, w3), (w3, r)])
        del adj[l][w1]
        del adj[w1][l]
        del adj[w1][w2]
        del adj[w2][w1]
        del adj[w2][w3]
        del adj[w3][w2]
        del adj[w3][r]
        del adj[r][w3]

    def remove_from(self, g: BaseGraph[int, Tuple[int, int]], web: PauliWeb) -> None:
        """
        For a given graph in red-green form and a Pauli web that is valid on it, reverses the node introduction used to
        achieve the red-green form on the Pauli web. That is, this function fuses neighbouring edge colorings in the web
        in-place to convert it to a web valid in the original, potentially non-red-green graph.
        """
        adj = {n1: {n2: True for n2 in g.neighbors(n1)} for n1 in g.vertices()}
        for id_node in self.extra_id_nodes:
            self._remove_extra_id_node(adj, web, id_node)
        for hadamard in self.expanded_hadamards:
            self._remove_expanded_hadamard(adj, web, hadamard)


def _place_node_between(g: BaseGraph[int, Tuple[int, int]], _type: VertexType, n1: int, n2: int) -> int:
    node = g.add_vertex(_type)
    g.remove_edge((n1, n2))
    g.add_edges([(n1, node), (node, n2)])

    return node


_euler_decomposition_xzx = [VertexType.X, VertexType.Z, VertexType.X]
_euler_decomposition_zxz = [VertexType.Z, VertexType.X, VertexType.Z]


def _euler_expand_edges(g: BaseGraph[int, Tuple[int, int]]) -> Iterable[ExpandedHadamard]:
    """
    A cut down version of pyzx.euler_expansion which does not add global scalars and does not prematurely 'merge' spiders
    """

    def _decompose_between(_v1: int, _v2: int, _flip: bool) -> Tuple[int, int, int]:
        # Change decomposition to avoid introducing more X-spiders due to adjacent Z-spider
        pattern = _euler_decomposition_xzx if _flip else _euler_decomposition_zxz

        _w2 = _place_node_between(g, pattern[1], _v1, _v2)
        g.add_to_phase(_w2, Fraction(1, 2))
        _w1 = _place_node_between(g, pattern[0], _v1, _w2)
        g.add_to_phase(_w1, Fraction(1, 2))
        _w3 = _place_node_between(g, pattern[2], _w2, _v2)
        g.add_to_phase(_w3, Fraction(1, 2))

        return _w1, _w2, _w3

    expanded_hadamards = []
    for v in list(g.vertices()):
        if g.type(v) != VertexType.H_BOX:
            continue

        v1, v2 = g.neighbors(v)
        v1_edge_type = g.edge_type((v1, v))
        v2_edge_type = g.edge_type((v2, v))

        g.remove_vertex(v)
        g.add_edge((v1, v2))

        flip = g.type(v1) == g.type(v2) and g.type(v1) == VertexType.X
        w1, w2, w3 = _decompose_between(v1, v2, flip)
        g.set_edge_type((v1, w1), v1_edge_type)
        g.set_edge_type((w3, v2), v2_edge_type)

        expanded_hadamards.append(ExpandedHadamard(w1, w2, w3, origin=v, flipped_decomposition=flip))

    for v1, v2 in list(filter(lambda e: g.edge_type(e) == EdgeType.HADAMARD, g.edges())):
        flip = g.type(v1) == g.type(v2) and g.type(v1) == VertexType.Z
        w1, w2, w3 = _decompose_between(v1, v2, flip)
        expanded_hadamards.append(ExpandedHadamard(w1, w2, w3, origin=None, flipped_decomposition=flip))

    return expanded_hadamards


def _ensure_red_green(g: BaseGraph[int, Tuple[int, int]]) -> Iterable[int]:
    new_nodes = []
    # Introduce intermediate nodes
    for s, t in list(g.edges()):
        if g.type(s) == g.type(t):
            new_type = VertexType.Z if g.type(s) == VertexType.X else VertexType.X
            new_nodes.append(_place_node_between(g, new_type, s, t))

    # Introduce intermediate nodes for boundary <-> boundary connections
    for s, t in list(g.edges()):
        if g.type(s) == g.type(t) and g.type(s) == VertexType.BOUNDARY:
            new_nodes.append(_place_node_between(g, VertexType.X, s, t))

    # Ensure boundaries are not connected to a red spider
    boundaries = [v for v in g.vertices() if g.type(v) == VertexType.BOUNDARY]
    for boundary in boundaries:
        neighbour = list(g.neighbors(boundary))[0]
        if g.type(neighbour) == VertexType.X:
            new_nodes.append(_place_node_between(g, VertexType.Z, boundary, neighbour))

    # Ensure boundaries are not connected to green spiders with nonzero phase or more than one boundary connection
    for boundary in boundaries:
        neighbour = list(g.neighbors(boundary))[0]
        neighbour_boundaries = [v for v in g.neighbors(neighbour) if g.type(v) == VertexType.BOUNDARY]
        if g.phase(neighbour) != 0 or len(neighbour_boundaries) > 1:
            new_x = _place_node_between(g, VertexType.X, boundary, neighbour)
            new_nodes.append(new_x)
            new_nodes.append(_place_node_between(g, VertexType.Z, boundary, new_x))

    return new_nodes


def to_red_green_form(g: BaseGraph[int, Tuple[int, int]]) -> AdditionalNodes:
    """
    Converts a graph to red-green form in-place. Returns an object that identifies all nodes introduced / removed and
    that can reverse the conversion process on Pauli webs of the converted graph. See the AdditionalNodes class for
    details.
    """
    # Convert all H-edges and Hadamards to red and green spiders
    additional_nodes = AdditionalNodes.empty()
    for hadamard in _euler_expand_edges(g):
        additional_nodes.add_expanded_hadamard(hadamard)

    # Verify that diagram is clifford
    offending_vertices = list(
        filter(
            lambda n: g.phase(n).denominator > 2
            or (g.type(n) != VertexType.Z and g.type(n) != VertexType.X and g.type(n) != VertexType.BOUNDARY),
            g.vertices(),
        )
    )
    if len(offending_vertices) > 0:
        raise AssertionError(
            f"Given diagram is not a Clifford diagram up to hadamard expansion. The following "
            f"vertices are either not of type X,Z,BOUNDARY or have a non-clifford "
            f"phase: {', '.join(map(str, offending_vertices))}"
        )
    offending_edges = [e for e in g.edges() if g.edge_type(e) != EdgeType.SIMPLE]
    if len(offending_edges) > 0:
        raise AssertionError(f"Given diagram is not a Clifford diagram up to hadamard expansion. The following "
                             f"edges are not simple edges: {', '.join(map(str, offending_edges))}")

    for node in _ensure_red_green(g):
        additional_nodes.add_extra_id_node(node)

    return additional_nodes
