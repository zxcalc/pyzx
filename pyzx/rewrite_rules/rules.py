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
DEPRECATED 
This module used to contain the implementation of all the rewrite rules on ZX-diagrams in PyZX.
These have now been moved to their own files in order to improve maintainability and readability.
The commented out rule names below show where each rewrite rule has moved to.

OLD DOCUMENTATION:
Each rewrite rule consists of two methods: a matcher and a rewriter.
The matcher finds as many non-overlapping places where the rewrite rule can be applied.
The rewriter takes in a list of matches, and performs the necessary changes on the graph to implement the rewrite.

Each match function takes as input a Graph instance,
and an optional "filter function" that tells the matcher to only consider
the vertices or edges that the filter function accepts.
It outputs a list of "match" objects. What these objects look like differs
per rewrite rule.

The rewrite function takes as input a Graph instance and a list of match objects
of the appropriate type. It outputs a 4-tuple
(edges to add, vertices to remove, edges to remove, isolated vertices check).
The first of these should be fed to :meth:`~pyzx.graph.base.BaseGraph.add_edge_table`,
while the second and third should be fed to
:meth:`~graph.base.BaseGraph.remove_vertices` and :meth:`~pyzx.graph.base.BaseGraph.remove_edges`.
The last parameter is a Boolean that when true means that the rewrite rule can introduce
isolated vertices that should be removed by
:meth:`~pyzx.graph.base.BaseGraph.remove_isolated_vertices`.

Dealing with this output is done using either :func:`apply_rule` or :func:`pyzx.simplify.simp`.

Warning:
    There is no guarantee that the matcher does not affect the graph, and currently some matchers
    do in fact change the graph. Similarly, the rewrite function also changes the graph other
    than through the output it generates (for instance by adding vertices or changes phases).

"""

from typing import Tuple, List, Dict, Set, FrozenSet
from typing import Any, Callable, TypeVar, Optional, Union
from typing_extensions import Literal

from collections import Counter
from fractions import Fraction
import itertools

import numpy as np

from pyzx.utils import (
    EdgeType, FloatInt, FractionLike, VertexType, get_w_io, get_w_partner,
    get_z_box_label, set_z_box_label, toggle_edge, vertex_is_w, vertex_is_z_like,
    vertex_is_zx, vertex_is_zx_like, phase_is_pauli, phase_is_clifford
)
from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.symbolic import Poly

# RewriteOutputType = Tuple[Dict[Tuple[VT,VT],List[int]], List[VT], List[ET], bool]
#
#
# MatchObject = TypeVar('MatchObject')
#
# def apply_rule(
#         g: BaseGraph[VT,ET],
#         rewrite: Callable[[BaseGraph[VT,ET], List[MatchObject]],RewriteOutputType[VT,ET]],
#         m: List[MatchObject],
#         check_isolated_vertices:bool=True
#         ) -> None:
#     etab, rem_verts, rem_edges, check_isolated_vertices = rewrite(g, m)
#
#     g.add_edge_table(etab)
#     g.remove_vertices(rem_verts)
#     g.remove_edges(rem_edges)
#     if check_isolated_vertices: g.remove_isolated_vertices()



####    z_to_z_box_rule
# def match_z_to_z_box(g: BaseGraph[VT,ET]) -> List[VT]:
#     """Does the same as :func:`match_z_to_z_box_parallel` but with ``num=1``."""
#
# def match_z_to_z_box_parallel
#     """Finds all vertices that can be converted to Z-boxes."""
#     if matchf is not None: candidates = set([v for v in g.vertices() if matchf(v)])
#
#
# def z_to_z_box(g: BaseGraph[VT,ET], matches: List[VT]) -> RewriteOutputType[VT,ET]:
#     """Converts a Z vertex to a Z-box."""


####    fuse_rule
# def match_spider(g: BaseGraph[VT,ET]) -> List[MatchSpiderType[VT]]:
#     """Does the same as :func:`match_spider_parallel` but with ``num=1``."""
#     return match_spider_parallel(g, num=1)
#
# def match_spider_parallel(
#         g: BaseGraph[VT,ET],
#         matchf:Optional[Callable[[VT],bool]]=None,
#         num:int=-1
#         ) -> List[MatchSpiderType[VT]]:
#     """Finds non-interacting matchings of the spider fusion rule.

# def spider(g: BaseGraph[VT,ET], matches: List[MatchSpiderType[VT]]) -> RewriteOutputType[VT,ET]:
#     '''Performs spider fusion given a list of matchings from ``match_spider(_parallel)``
#     '''

# def match_w_fusion(g: BaseGraph[VT,ET]) -> List[MatchWType[VT]]:
#     """Does the same as :func:`match_w_fusion_parallel` but with ``num=1``."""
#     return match_w_fusion_parallel(g, num=1)

# def match_w_fusion_parallel(
#         g: BaseGraph[VT,ET],
#         matchf:Optional[Callable[[ET],bool]]=None,
#         num:int=-1) -> List[MatchWType[VT]]:
#     """Finds non-interacting matchings of the W fusion rule.
#
#     :param g: An instance of a ZX-graph.
#     :param matchf: An optional filtering function for candidate edge, should
#        return True if the edge should be considered for matchings. Passing None will
#        consider all edges.
#     :param num: Maximal amount of matchings to find. If -1 (the default)
#        tries to find as many as possible.
#     :rtype: List of 2-tuples ``(v1, v2)``
#     """
#

# def w_fusion(g: BaseGraph[VT,ET], matches: List[MatchSpiderType[VT]]) -> RewriteOutputType[VT,ET]:
#     '''Performs W fusion given a list of matchings from ``match_w_fusion(_parallel)``
#     '''

#####   'check_pivot_parallel': pivot_rule
#
# def match_pivot(g: BaseGraph[VT,ET]) -> List[MatchPivotType[VT]]:
#     """Does the same as :func:`match_pivot_parallel` but with ``num=1``."""
#     return match_pivot_parallel(g, num=1, check_edge_types=True)
#
#
# def match_pivot_parallel(
#         g: BaseGraph[VT,ET],
#         matchf:Optional[Callable[[ET],bool]]=None,
#         num:int=-1,
#         check_edge_types:bool=True
#         ) -> List[MatchPivotType[VT]]:
#     """Finds non-interacting matchings of the pivot rule.
#     :param g: An instance of a ZX-graph.
#     :param num: Maximal amount of matchings to find. If -1 (the default)
#        tries to find as many as possible.
#     :param check_edge_types: Whether the method has to check if all the edges involved
#        are of the correct type (Hadamard edges).
#     :param matchf: An optional filtering function for candidate edge, should
#        return True if a edge should considered as a match. Passing None will
#        consider all edges.
#     :rtype: List of 4-tuples. See :func:`pivot` for the details.
#     """
#


###### pivot_gadget_for_simp and pivot_gadget_for_apply

# def match_pivot_gadget(
#         g: BaseGraph[VT,ET],
#         matchf:Optional[Callable[[ET],bool]]=None,
#         num:int=-1) -> List[MatchPivotType[VT]]:
#     """Like :func:`match_pivot_parallel`, but except for pairings of
#     Pauli vertices, it looks for a pair of an interior Pauli vertex and an
#     interior non-Clifford vertex in order to gadgetize the non-Clifford vertex."""
#

###### pivot_boundary_for_simp and pivot_boundary_for_apply

# def match_pivot_boundary(
#         g: BaseGraph[VT,ET],
#         matchf:Optional[Callable[[VT],bool]]=None,
#         num:int=-1) -> List[MatchPivotType[VT]]:
#     """Like :func:`match_pivot_parallel`, but except for pairings of
#     Pauli vertices, it looks for a pair of an interior Pauli vertex and a
#     boundary non-Pauli Clifford vertex in order to gadgetize the non-Pauli vertex."""
#


#pivot: pivot_rule

# def pivot(g: BaseGraph[VT,ET], matches: List[MatchPivotType[VT]]) -> RewriteOutputType[VT,ET]:
#     """Perform a pivoting rewrite, given a list of matches as returned by
#     ``match_pivot(_parallel)``. A match is itself a list where:
#
#     ``m[0][0]`` : first vertex in pivot.
#     ``m[0][1]`` : second vertex in pivot.
#     ``m[1][0]`` : list of zero or one boundaries adjacent to ``m[0]``.
#     ``m[1][1]`` : list of zero or one boundaries adjacent to ``m[1]``.
#     """
#

###### lcomp_rule
# def match_lcomp(g: BaseGraph[VT,ET]) -> List[MatchLcompType[VT]]:
#     """Same as :func:`match_lcomp_parallel`, but with ``num=1``"""
#
# def match_lcomp_parallel(
#         g: BaseGraph[VT,ET],
#         vertexf:Optional[Callable[[VT],bool]]=None,
#         num:int=-1,
#         check_edge_types:bool=True
#         ) -> List[MatchLcompType[VT]]:
#     """Finds noninteracting matchings of the local complementation rule.
#
# def lcomp(g: BaseGraph[VT,ET], matches: List[MatchLcompType[VT]]) -> RewriteOutputType[VT,ET]:
#     """Performs a local complementation based rewrite rule on the given graph with the
#     given ``matches`` returned from ``match_lcomp(_parallel)``. See "Graph Theoretic
#     Simplification of Quantum Circuits using the ZX calculus" (arXiv:1902.03178)
#     for more details on the rewrite"""

########### remove_id_rule
#
# def match_ids(g: BaseGraph[VT,ET]) -> List[MatchIdType[VT]]:
#     """Finds a single identity node. See :func:`match_ids_parallel`."""
#
# def match_ids_parallel(
#         g: BaseGraph[VT,ET],
#         vertexf:Optional[Callable[[VT],bool]]=None,
#         num:int=-1
#         ) -> List[MatchIdType[VT]]:
#     """Finds non-interacting identity vertices.
#
#
# def remove_ids(g: BaseGraph[VT,ET], matches: List[MatchIdType[VT]]) -> RewriteOutputType[VT,ET]:
#     """Given the output of ``match_ids(_parallel)``, returns a list of edges to add,
#     and vertices to remove."""


####     merge_phase_gadget_rule

# def match_phase_gadgets(g: BaseGraph[VT,ET],vertexf:Optional[Callable[[VT],bool]]=None) -> List[MatchGadgetType[VT]]:
#     """Determines which phase gadgets act on the same vertices, so that they can be fused together.
#
#     :param g: An instance of a ZX-graph.
#     :rtype: List of 5-tuples ``(axel,leaf, total combined phase, other axels with same targets, other leafs)``.
#     """

# def merge_phase_gadgets(g: BaseGraph[VT,ET], matches: List[MatchGadgetType[VT]]) -> RewriteOutputType[VT,ET]:
#     """Given the output of :func:``match_phase_gadgets``, removes phase gadgets that act on the same set of targets."""



######## supplementarity_rule
#
# def match_supplementarity(g: BaseGraph[VT,ET], vertexf:Optional[Callable[[VT],bool]]=None) -> List[MatchSupplementarityType[VT]]:
#     """Finds pairs of non-Clifford spiders that are connected to exactly the same set of vertices.
#
#     :param g: An instance of a ZX-graph.
#     :rtype: List of 4-tuples ``(vertex1, vertex2, type of supplementarity, neighbors)``.
#     """
#

# def apply_supplementarity(
#         g: BaseGraph[VT,ET],
#         matches: List[MatchSupplementarityType[VT]]
#         ) -> RewriteOutputType[VT,ET]:
#     """Given the output of :func:``match_supplementarity``, removes non-Clifford spiders that act on the same set of targets trough supplementarity.
#
#     Warning:
#         Takes in a graph-like diagram.
#         """
#


######### hopf_rule
#
# def match_hopf(g: BaseGraph[VT, ET], vertexf: Optional[Callable[[VT], bool]] = None) -> List[MatchHopfType[VT]]:
#     """Finds parallel edges between spiders that can be removed.
#     :param g: An instance of a ZX-graph.
#     :param vertexf: An optional filtering function for candidate vertices, should
#     return True if a vertex should be considered as a match. Passing None will
#     consider all vertices.
#     :rtype: List of 2-tuples ``(vertex, neighbors)``.
#     """
#
#
# def hopf(g: BaseGraph[VT, ET], matches: List[MatchHopfType[VT]]) -> RewriteOutputType[VT, ET]:
#     """Performs a Hopf rule rewrite on the given graph with the
#     given ``matches`` returned from ``match_hopf``. Removes all parallel edges of the given type
#     A match is itself a list where:
#
#

####### self_loop_rule
# def match_self_loop(g: BaseGraph[VT, ET], vertexf: Optional[Callable[[VT], bool]] = None) -> List[
#     MatchSelfLoopType[VT]]:
#     """Finds self-loops on vertices that can be removed.
#
#
# def remove_self_loops(g: BaseGraph[VT, ET], matches: List[MatchSelfLoopType[VT]]) -> RewriteOutputType[VT, ET]:
#     """Performs a self-loop removal rewrite on the given graph with the
#     given ``matches`` returned from ``match_self_loop``. Removes all self-loops of the given type
#

########## copy_rule
# MatchCopyType = Tuple[VT,VT,FractionLike,FractionLike,List[VT]]
#
# def match_copy(
#     g: BaseGraph[VT,ET],
#     vertexf:Optional[Callable[[VT],bool]]=None
#     ) -> List[MatchCopyType[VT]]:
#     """Finds spiders with a 0 or pi phase that have a single neighbor,
#     and copies them through. Assumes that all the spiders are green and maximally fused."""
#
# def apply_copy(g: BaseGraph[VT,ET], matches: List[MatchCopyType[VT]]) -> RewriteOutputType[VT,ET]:



############## gadget_phasepoly_rule
#
# def match_gadgets_phasepoly(g: BaseGraph[VT,ET]) -> List[MatchPhasePolyType[VT]]:
#     """Finds groups of phase-gadgets that act on the same set of 4 vertices in order to apply a rewrite based on
#     rule R_13 of the paper *A Finite Presentation of CNOT-Dihedral Operators*."""
#
#
# def apply_gadget_phasepoly(g: BaseGraph[VT,ET], matches: List[MatchPhasePolyType[VT]]) -> None:
#     """Uses the output of :func:`match_gadgets_phasepoly` to apply a rewrite based
#     on rule R_13 of the paper *A Finite Presentation of CNOT-Dihedral Operators*."""
#