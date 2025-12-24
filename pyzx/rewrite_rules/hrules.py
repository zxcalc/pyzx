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
This file originally contained many rewrites, which now have moved into their own files. 
Below is a reference for the original function name and signature and the new name it has now gotten.
"""


# check_hadamard: had_edge_to_hbox_rule
# def is_hadamard(g: BaseGraph[VT,ET], v: VT) -> bool:
#     """Returns whether the vertex v in graph g is a Hadamard gate."""



# replace_hadamard: had_edge_to_hbox_rule
# def replace_hadamard(g: BaseGraph[VT,ET], v: VT) -> bool:
#     """Replaces a Hadamard gate with a Hadamard edge."""


# had_edge_to_hbox: had_edge_to_hbox_rule
# def had_edge_to_hbox(g: BaseGraph[VT,ET], e: ET) -> bool:
#     """Converts a Hadamard edge to a Hadamard gate.
#     Note that while this works with multigraphs, it will put the new H-box in the middle of the vertices,
#     so that the diagram might look wrong.
#

# check_hadamard: had_edge_to_hbox_rule

# def match_hadamards(g: BaseGraph[VT,ET],
#         vertexf: Optional[Callable[[VT],bool]] = None
#         ) -> List[VT]:
#     """Matches all the H-boxes with arity 2 and phase 1, i.e. all the Hadamard gates."""

# replace_hadamard: had_edge_to_hbox_rule
# def hadamard_to_h_edge(g: BaseGraph[VT,ET], matches: List[VT]) -> rules.RewriteOutputType[VT,ET]:
#     """Converts a matching of H-boxes with arity 2 and phase 1, i.e. Hadamard gates, to Hadamard edges."""


# check_connected_hboxes: fuse_hboes_rule
# def match_connected_hboxes(g: BaseGraph[VT,ET],
#         edgef: Optional[Callable[[ET],bool]] = None
#         ) -> List[ET]:
#     """Matches Hadamard-edges that are connected to H-boxes, as these can be fused,
#     see the rule (HS1) of https://arxiv.org/pdf/1805.02175.pdf.
#
#     Warning:
#         Does not work with multigraphs.
#     """

# fuse_hboxes: fuse_hboes_rule
# def fuse_hboxes(g: BaseGraph[VT,ET], matches: List[ET]) -> rules.RewriteOutputType[VT,ET]:
#     """Fuses two neighboring H-boxes together.
#     See rule (HS1) of https://arxiv.org/pdf/1805.02175.pdf."""



# copy_rule

# def match_copy(
#         g: BaseGraph[VT,ET],
#         vertexf:Optional[Callable[[VT],bool]]=None
#         ) -> List[MatchCopyType[VT, ET]]:
#     """Finds arity-1 spiders (with a 0 or pi phase) that can be copied through their neighbor."""
#
# def apply_copy(
#         g: BaseGraph[VT,ET],
#         matches: List[MatchCopyType[VT, ET]]
#         ) -> rules.RewriteOutputType[VT,ET]:
#     """Copy arity-1 spider through their neighbor."""


# is_NOT_gate: hbox_not_remove_rule
# def is_NOT_gate(g, v, n1, n2):
#     """Returns whether the vertex v in graph g is a NOT gate between its neighbours n1 and n2."""


# check_hbox_parallel_not: hbox_not_remove_rule
# def match_hbox_parallel_not(
#         g: BaseGraph[VT,ET],
#         vertexf:Optional[Callable[[VT],bool]]=None
#         ) -> List[Tuple[VT,VT,VT]]:
#     """Finds H-boxes that are connected to a Z-spider both directly and via a NOT."""


# hbox_parallel_not_remove: hbox_not_remove_rule
# def hbox_parallel_not_remove(g: BaseGraph[VT,ET],
#         matches: List[Tuple[VT,VT,VT]]
#         ) -> rules.RewriteOutputType[VT,ET]:
#     """If a Z-spider is connected to an H-box via a regular wire and a NOT, then they disconnect, and the H-box is turned into a Z-spider."""



#par_hbox_rule
# def match_par_hbox(
#     g: BaseGraph[VT,ET],
#     vertexf: Optional[Callable[[VT],bool]] = None
#     ) -> List[TYPE_MATCH_PAR_HBOX]:
#     """Matches sets of H-boxes that are connected in parallel (via optional NOT gates)
#     to the same white spiders."""
#
# def par_hbox(g: BaseGraph[VT,ET], matches: List[TYPE_MATCH_PAR_HBOX]) -> rules.RewriteOutputType[VT,ET]:
#     """Implements the `multiply rule' (M) from https://arxiv.org/abs/1805.02175"""
#
# def match_par_hbox_intro(
#     g: BaseGraph[VT,ET],
#     vertexf: Optional[Callable[[VT],bool]] = None
#     ) -> List[TYPE_MATCH_PAR_HBOX_INTRO]:
#     """Matches sets of H-boxes that are connected in parallel (via optional NOT gates)
#     to the same white spiders, but with just one NOT different, so that the Intro rule can be applied there."""
#
# def par_hbox_intro(g: BaseGraph[VT,ET], matches: List[TYPE_MATCH_PAR_HBOX_INTRO]) -> rules.RewriteOutputType[VT,ET]:
#     """Removes an H-box according to the Intro rule (See Section 3.2 of arxiv:2103.06610)."""



# zero_hbox_rules
# def match_zero_hbox(g: BaseGraph[VT,ET]) -> List[VT]:
#     """Matches H-boxes that have a phase of 2pi==0."""
#     types = g.types()
#     phases = g.phases()
#     return [v for v in g.vertices() if types[v] == VertexType.H_BOX and phases[v] == 0]
#
# def zero_hbox(g: BaseGraph[VT,ET], m: List[VT]) -> None:
#     """Removes H-boxes with a phase of 2pi=0.
#     Note that this rule is only semantically correct when all its neighbors are white spiders."""
#     g.remove_vertices(m)


# hpivot_rule
# def match_hpivot(
#     g: BaseGraph[VT,ET], matchf=None
#     ) -> hpivot_match_output:
#     """Finds a matching of the hyper-pivot rule. Note this currently assumes
#     hboxes don't have phases.
#
#     :param g: An instance of a ZH-graph.
#     :param matchf: An optional filtering function for candidate arity-2 hbox, should
#        return True if an hbox should considered as a match. Passing None will
#        consider all arity-2 hboxes.
#     :rtype: List containing 0 or 1 matches.
#     """
#
#
# def hpivot(g: BaseGraph[VT,ET], m: hpivot_match_output) -> None:
