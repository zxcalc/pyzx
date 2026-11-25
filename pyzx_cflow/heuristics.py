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

"""This module contains heuristics and helper functions for some of the rewrite rules in the rules_ module."""

from typing import TYPE_CHECKING, List, Callable, Optional, Union, Generic, Tuple, Dict, Iterator, Any
from typing_extensions import Literal

from .utils import EdgeType, VertexType, toggle_edge, vertex_is_zx, toggle_vertex
from .graph.base import BaseGraph, VT, ET
from .rules import MatchIdFuseType, MatchLcompUnfuseType, MatchPivotUnfuseType

def pivot_statistics(g: BaseGraph[VT,ET], v0: VT, v1: VT, neighbours_to_unfuse: Tuple[Tuple[VT,...],...] = ((),())) -> Tuple[int,int]:
    """Returns the number of edges and vertices which would be removed under a pivot.

    :param g: The graph on which the pivot would be performed.
    :param v0: The first vertex of the pivot.
    :param v1: The second vertex of the pivot.
    :param neighbours_to_unfuse: 2-tuple containing the neighbours to unfuse onto for the respecive vertices, defaults to ((),())
    :return: 2-tuple containing the number of edges removed and number of vertices removed.
    """
    unfuse0, unfuse1 = set(neighbours_to_unfuse[0]), set(neighbours_to_unfuse[1])
    
    v0n = set(g.neighbors(v0)) - {v1} - unfuse0
    v1n = set(g.neighbors(v1)) - {v0} - unfuse1
    
    shared_n = v0n & v1n
    num_shared_n = len(shared_n)
    
    v0n -= shared_n
    v1n -= shared_n
    
    num_v0n = len(v0n) + bool(unfuse0)
    num_v1n = len(v1n) + bool(unfuse1)
    
    max_new_connections = num_v0n * num_v1n + num_v0n * num_shared_n + num_v1n * num_shared_n
    
    num_edges_between_neighbours = sum(1 for v in v0n for n in g.neighbors(v) if n in v1n or n in shared_n)
    num_edges_between_neighbours += sum(1 for v in v1n for n in g.neighbors(v) if n in shared_n)
    
    num_unfusions = bool(unfuse0) + bool(unfuse1)

    edges_removed = 2*num_edges_between_neighbours - max_new_connections + num_v0n + 2*num_shared_n + num_v1n + 1 - 2*num_unfusions
    vertices_removed = 2 - (2*num_unfusions)
    return edges_removed, vertices_removed

def lcomp_statistics(g: BaseGraph[VT,ET], v: VT, vn: Tuple[VT,...], neighbours_to_unfuse: Tuple[VT,...]) -> Tuple[int,int]:
    """Returns the number of edges and vertices which would be removed under a local complementation.

    :param g: The graph on which the local complementation would be performed.
    :param v: The vertex of the local complementation.
    :param vn: The neighbours of the vertex ``v``.
    :param neighbours_to_unfuse: The neighbours to unfuse from the vertex.
    :return: 2-tuple containing the number of edges removed and number of vertices removed.
    """
    unfuse = set(neighbours_to_unfuse)
    vns = set(vn) - unfuse
    num_vns = len(vns) + bool(unfuse)
    
    max_new_connections = (num_vns * (num_vns-1)) // 2
    num_edges_between_neighbours = sum(1 for v1 in vns for v2 in vns if v1 < v2 and g.connected(v1, v2))
    num_unfusions = bool(unfuse)
    
    edges_removed = 2*num_edges_between_neighbours - max_new_connections + num_vns - (2*num_unfusions)
    vertices_removed = 1 - (2*num_unfusions)
    return edges_removed, vertices_removed

def id_fuse_statistics(g: BaseGraph[VT,ET], v: VT, v0: VT, v1: VT) -> Tuple[int,int]:
    """Returns the number of edges and vertices which would be removed under an identity fusion.

    :param g: The graph on which identity fusion would be performed.
    :param v: The central identity fusion.
    :param v0: The first vertex of the fusion.
    :param v1: The second vertex of the fusion. 
    :return: 2-tuple containing the number of edges removed and number of vertices removed.
    """
    v0n = set(g.neighbors(v0)) - {v}
    v1n = set(g.neighbors(v1)) - {v}
    shared_n = v0n & v1n
    
    same_edge_type_removed = sum(1 for n in shared_n if g.edge_type(g.edge(n,v0)) == g.edge_type(g.edge(n,v1)))
    extra_vertices_removed = sum(1 for n in shared_n if g.edge_type(g.edge(n,v0)) == g.edge_type(g.edge(n,v1)) and len(g.neighbors(n)) == 2)
    
    edges_removed = 2 + same_edge_type_removed + len(shared_n)
    if g.connected(v0,v1): edges_removed += 1
    
    vertices_removed = 2 + extra_vertices_removed
    
    return edges_removed, vertices_removed

def lcomp_2Q_simp_heuristic(g: BaseGraph[VT,ET], match: MatchLcompUnfuseType, weight: float) -> Optional[float]:
    """Returns the score heuristic for a local complementation match"""
    edges_removed, vertices_removed = lcomp_statistics(g, match[0], match[1], match[2])
    twoQ_removed = edges_removed - vertices_removed
    if twoQ_removed > 0: return weight*twoQ_removed
    if twoQ_removed == 0 and vertices_removed > 0: return weight*twoQ_removed
    return None

def pivot_2Q_simp_heuristic(g: BaseGraph[VT,ET], match: MatchPivotUnfuseType, weight: float) -> Optional[float]:
    """Returns the score heuristic for a pivot match"""
    edges_removed, vertices_removed = pivot_statistics(g, match[0], match[1], match[2])
    twoQ_removed = edges_removed - vertices_removed
    if twoQ_removed > 0: return weight*twoQ_removed
    if twoQ_removed == 0 and vertices_removed > 0: return weight*twoQ_removed
    return None

def id_fuse_2Q_reduce_heuristic(g: BaseGraph[VT,ET], match: MatchIdFuseType, weight: float) -> float:
    """Returns the score heuristic for a identity fusion match"""
    edges_removed, vertices_removed = id_fuse_statistics(g, match[0], match[1], match[2])
    twoQ_removed = edges_removed - vertices_removed
    assert(twoQ_removed >= 0)
    return weight*twoQ_removed