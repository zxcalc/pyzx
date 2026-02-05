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
This module contains the implementation of the fault-equivalent fusion rules that fuse multiple spiders into a single spider. 

The check function returns a boolean indicating whether the rule can be applied.
The safe version of the applier will automatically call the basic checker, while the unsafe version
of the applier will assume that the given input is correct and will apply the rule without running the check first.

Fault-equivalent rewrites are defined in arXiv:2506.17181.
Alternatively, they are defined as distance-preserving rewrites in arXiv:2410.17240.

Formal Definition
=================

Let :math:`C_1` and :math:`C_2` be two circuits with respective noise models :math:`\mathcal{F}_1` and :math:`\mathcal{F}_2`.
The circuit :math:`C_1` under :math:`\mathcal{F}_1` is **w-fault-equivalent** to :math:`C_2` under :math:`\mathcal{F}_2`,
if and only if for all faults :math:`F_1 \in \langle \mathcal{F}_1 \rangle` with weight :math:`wt(F_1) < w`, we have either:

1.  :math:`F_1` is detectable, or
2.  There exists a fault :math:`F_2 \in \langle \mathcal{F}_2 \rangle` on :math:`C_2` such that:
        - :math:`wt(F_2) \leq wt(F_1)` and
        - :math:`C_1^{F_1} = C_2^{F_2}`.

The condition must similarly hold for all faults :math:`F_2 \in \langle \mathcal{F}_2 \rangle` with weight :math:`wt(F_2) < w`, making this equivalence relation symmetric.

Two circuits :math:`C_1` and :math:`C_2` are **fault-equivalent**, written :math:`C_1 \hat{=} C_2`, if they are :math:`w`-fault-equivalent for all :math:`w \in \mathbb{N}`.
"""

__all__ = [
    'simp_fuse_4_FE',
    'safe_fuse_4_FE',
    'unsafe_fuse_4_FE',
    'match_fuse_4_FE',
    'is_fuse_4_match',
    'simp_fuse_5_FE',
    'safe_fuse_5_FE',
    'unsafe_fuse_5_FE',
    'match_fuse_5_FE',
    'is_fuse_5_match',
    'simp_fuse_n_2FE',
    'safe_fuse_n_2FE',
    'unsafe_fuse_n_2FE',
    'match_fuse_n_2FE',
    'is_fuse_n_match'
]

from typing import Optional, List

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.utils import VertexType, EdgeType, is_pauli


def match_fuse_4_FE(g: BaseGraph[VT,ET], vertices: Optional[List[VT]]=None) -> Optional[List[VT]]:
    """Checks if the fuse-4 rule can be applied to the given vertex set"""
    if vertices is not None: candidates = vertices
    else: candidates = list(g.vertex_set())

    if len(candidates) != len(set(candidates)):
        return None  # duplicates are not allowed

    if not len(candidates) == 4: 
        return None

    if not all(v in g.vertices() for v in candidates): 
        return None
    
    if not all(g.type(v) == g.type(candidates[0]) and g.type(v) in (VertexType.X, VertexType.Z) and is_pauli(g.phase(v)) for v in candidates): 
        return None
    
    for v in candidates:
        neighs = list(g.neighbors(v))
        neighsinsquare = [w for w in neighs if w in candidates]
        if not (len(neighs) == 3 and len(neighsinsquare) == 2): 
            return None
        if not all(g.num_edges(v, vertex, EdgeType.SIMPLE) == 1 for vertex in neighs): 
            return None
        if not all(g.num_edges(v, z, EdgeType.HADAMARD) == 0 for z in neighsinsquare):
            return None

    return candidates  

def unsafe_fuse_4_FE(g: BaseGraph[VT, ET], vertices: list[VT]) -> bool:
    """Applies the fusion-4 rule to 4 connected spiders of the same type in a square configuration"""
    avg_qubit = sum(g.qubit(v) for v in vertices) // 4
    avg_row   = sum(g.row(v) for v in vertices) // 4

    new_vertex = g.add_vertex(g.type(vertices[0]), avg_qubit, avg_row)

    for v in vertices:
        external_neighbors = [n for n in list(g.neighbors(v)) if n not in vertices]
        g.add_edge((new_vertex, external_neighbors[0]))

    g.remove_vertices(vertices)
    return True

def safe_fuse_4_FE(g: BaseGraph[VT, ET], vertices: list[VT]) -> bool:
    """Runs :func:`match_fuse_4_FE` on the input vertices and if any matches are found runs :func:`unsafe_fuse_4_FE`"""
    checked_vertices = list([v for v in g.vertices() if (v in vertices)])
    matches = match_fuse_4_FE(g, checked_vertices)
    if matches is None: return False
    return unsafe_fuse_4_FE(g, matches)

def simp_fuse_4_FE(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_fuse_4_FE` on the entire graph and if any matches are found runs :func:`unsafe_fuse_4_FE`"""
    matches = match_fuse_4_FE(g)
    if matches is None: return False
    return unsafe_fuse_4_FE(g, matches)

def is_fuse_4_match(g: BaseGraph[VT,ET], vertices: list[VT]) -> bool:
    """Checks if the given vertices form a valid match for the fuse 4 operation."""
    match = match_fuse_4_FE(g, vertices)
    return match is not None

def match_fuse_5_FE(g: BaseGraph[VT,ET], vertices: Optional[List[VT]]=None) -> Optional[List[VT]]:
    """Checks if the fuse-5 rule can be applied to the given vertex set"""
    if vertices is not None: candidates = vertices
    else: candidates = list(g.vertex_set())

    if not (len(candidates) == 5 and len(candidates) == len(set(candidates))): 
        return None

    if not all(v in g.vertices() for v in candidates): 
        return None
    
    if not all(g.type(v) == g.type(candidates[0]) and g.type(v) in (VertexType.X, VertexType.Z) and is_pauli(g.phase(v)) for v in candidates): 
        return None
    
    #start traversal from the first vertex
    checked = []
    neighs0 = list(g.neighbors(candidates[0]))
    neighsincycle0 = [w for w in neighs0 if w in candidates]

    #checks for first vertex
    if not (len(neighs0) == 3 and len(neighsincycle0) == 2): 
            return None
    
    if not all(g.num_edges(candidates[0], vertex, EdgeType.SIMPLE) == 1 for vertex in neighs0): 
                return None
            
    if not all(g.num_edges(candidates[0], z, EdgeType.HADAMARD) == 0 for z in neighsincycle0):
            return None
            
    checked.extend([candidates[0], neighsincycle0[0]])

    #traverse the rest of the cycle
    for i in range(1,len(candidates)):
        currentvertex = checked[i]
        neighs = list(g.neighbors(currentvertex))
        neighsincycle = [w for w in neighs if w in candidates]
        visited_neighbors = [w for w in neighs if w in checked]

        if i < len(candidates) - 1:
            # intermediate vertices
            if not (len(neighs) == 3 and len(visited_neighbors) == 1 and len(neighsincycle) == 2):
                return None
            
            unvisited_cycle_neighbor = [v for v in neighsincycle if v not in visited_neighbors]
            checked.append(unvisited_cycle_neighbor[0])

        else:
            # last vertex
            if not (len(neighs) == 3 and len(visited_neighbors) == 2 and len(neighsincycle) == 2):
                return None
        
        if not all(g.num_edges(currentvertex, vertex, EdgeType.SIMPLE) == 1 for vertex in neighs): 
            return None
            
        if not all(g.num_edges(currentvertex, z, EdgeType.HADAMARD) == 0 for z in neighsincycle):
            return None

    return candidates  

def unsafe_fuse_5_FE(g: BaseGraph[VT, ET], vertices: list[VT]) -> bool:
    """Applies the fusion-5 rule to 5 connected spiders of the same type in a pentagon configuration"""
    avg_qubit = sum(g.qubit(v) for v in vertices) // 5
    avg_row   = sum(g.row(v) for v in vertices) // 5

    new_vertex = g.add_vertex(g.type(vertices[0]), avg_qubit, avg_row)

    for v in vertices:
        external_neighbors = [n for n in list(g.neighbors(v)) if n not in vertices]
        g.add_edge((new_vertex, external_neighbors[0]))

    g.remove_vertices(vertices)
    return True

def safe_fuse_5_FE(g: BaseGraph[VT, ET], vertices: list[VT]) -> bool:
    """Runs :func:`match_fuse_5_FE` on the input vertices and if any matches are found runs :func:`unsafe_fuse_5_FE`"""
    checked_vertices = list([v for v in g.vertices() if (v in vertices)])
    matches = match_fuse_5_FE(g, checked_vertices)
    if matches is None: return False
    return unsafe_fuse_5_FE(g, matches)

def simp_fuse_5_FE(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_fuse_5_FE` on the entire graph and if any matches are found runs :func:`unsafe_fuse_5_FE`"""
    matches = match_fuse_5_FE(g)
    if matches is None: return False
    return unsafe_fuse_5_FE(g, matches)

def is_fuse_5_match(g: BaseGraph[VT,ET], vertices: list[VT]) -> bool:
    """Checks if the given vertices form a valid match for the fuse 5 operation."""
    match = match_fuse_5_FE(g, vertices)
    return match is not None

def match_fuse_n_2FE(g: BaseGraph[VT,ET], vertices: Optional[List[VT]]=None) -> Optional[List[VT]]:
    """Checks if the fuse-n rule can be applied to the given vertex set. Note: Only gives a match if n greater or equal than 6, otherwise fuse-4 or fuse-5 rule must be used."""
    if vertices is not None: candidates = vertices
    else: candidates = list(g.vertex_set())

    if not (len(candidates) > 5 and len(candidates) == len(set(candidates))): 
        return None

    if not all(v in g.vertices() for v in candidates): 
        return None
    
    if not all(g.type(v) == g.type(candidates[0]) and g.type(v) in (VertexType.X, VertexType.Z) and is_pauli(g.phase(v)) for v in candidates): 
        return None
    
    #start traversal from the first vertex
    checked = []
    neighs0 = list(g.neighbors(candidates[0]))
    neighsincycle0 = [w for w in neighs0 if w in candidates]

    #checks for first vertex
    if not (len(neighs0) == 3 and len(neighsincycle0) == 2): 
            return None
    
    if not all(g.num_edges(candidates[0], vertex, EdgeType.SIMPLE) == 1 for vertex in neighs0): 
                return None
            
    if not all(g.num_edges(candidates[0], z, EdgeType.HADAMARD) == 0 for z in neighsincycle0):
            return None
            
    checked.extend([candidates[0], neighsincycle0[0]])

    #traverse the rest of the cycle
    for i in range(1,len(candidates)):
        currentvertex = checked[i]
        neighs = list(g.neighbors(currentvertex))
        neighsincycle = [w for w in neighs if w in candidates]
        visited_neighbors = [w for w in neighs if w in checked]

        if i < len(candidates) - 1:
            # intermediate vertices
            if not (len(neighs) == 3 and len(visited_neighbors) == 1 and len(neighsincycle) == 2):
                return None
            
            unvisited_cycle_neighbor = [v for v in neighsincycle if v not in visited_neighbors]
            checked.append(unvisited_cycle_neighbor[0])

        else:
            # last vertex
            if not (len(neighs) == 3 and len(visited_neighbors) == 2 and len(neighsincycle) == 2):
                return None
        
        if not all(g.num_edges(currentvertex, vertex, EdgeType.SIMPLE) == 1 for vertex in neighs): 
            return None
            
        if not all(g.num_edges(currentvertex, z, EdgeType.HADAMARD) == 0 for z in neighsincycle):
            return None

    return candidates  

def unsafe_fuse_n_2FE(g: BaseGraph[VT, ET], vertices: list[VT]) -> bool:
    """Applies the fusion-n rule to n connected spiders of the same type in a cycle configuration"""
    n = len(vertices)
    avg_qubit = sum(g.qubit(v) for v in vertices) // n
    avg_row   = sum(g.row(v) for v in vertices) // n

    new_vertex = g.add_vertex(g.type(vertices[0]), avg_qubit, avg_row)

    for v in vertices:
        external_neighbors = [n for n in list(g.neighbors(v)) if n not in vertices]
        g.add_edge((new_vertex, external_neighbors[0]))

    g.remove_vertices(vertices)
    return True

def safe_fuse_n_2FE(g: BaseGraph[VT, ET], vertices: list[VT]) -> bool:
    """Runs :func:`match_fuse_n_2FE` on the input vertices and if any matches are found runs :func:`unsafe_fuse_n_2FE`"""
    checked_vertices = list([v for v in g.vertices() if (v in vertices)])
    matches = match_fuse_n_2FE(g, checked_vertices)
    if matches is None: return False
    return unsafe_fuse_n_2FE(g, matches)

def simp_fuse_n_2FE(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_fuse_n_2FE` on the entire graph and if any matches are found runs :func:`unsafe_fuse_n_2FE`"""
    matches = match_fuse_n_2FE(g)
    if matches is None: return False
    return unsafe_fuse_n_2FE(g, matches)

def is_fuse_n_match(g: BaseGraph[VT,ET], vertices: list[VT]) -> bool:
    """Checks if the given vertices form a valid match for the fuse n operation."""
    match = match_fuse_n_2FE(g, vertices)
    return match is not None