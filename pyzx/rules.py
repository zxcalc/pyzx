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
This module contains the implementation of all the rewrite rules on ZX-diagrams in PyZX.

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
:meth:`~pyzx.graph.base.BaseGraph.remove_isolated_vertices`\ .

Dealing with this output is done using either :func:`apply_rule` or :func:`pyzx.simplify.simp`.

Warning:
    There is no guarantee that the matcher does not affect the graph, and currently some matchers
    do in fact change the graph. Similarly, the rewrite function also changes the graph other
    than through the output it generates (for instance by adding vertices or changes phases).

"""

from typing import Tuple, List, Dict, Set, FrozenSet
from typing import Any, Callable, TypeVar, Optional, Union
from typing_extensions import Literal

from fractions import Fraction
import itertools

import numpy as np

from .utils import VertexType, EdgeType, get_w_partner, get_z_box_label, set_z_box_label, toggle_edge, vertex_is_w, vertex_is_zx, FloatInt, FractionLike, get_w_io, vertex_is_z_like
from .graph.base import BaseGraph, VT, ET
from .symbolic import Poly

RewriteOutputType = Tuple[Dict[ET,List[int]], List[VT], List[ET], bool]
MatchObject = TypeVar('MatchObject')

def apply_rule(
        g: BaseGraph[VT,ET],
        rewrite: Callable[[BaseGraph[VT,ET], List[MatchObject]],RewriteOutputType[ET,VT]],
        m: List[MatchObject],
        check_isolated_vertices:bool=True
        ) -> None:
    """Applies a given match of a rule onto a graph"""
    etab, rem_verts, rem_edges, check_isolated_vertices = rewrite(g, m)
    g.add_edge_table(etab)
    g.remove_edges(rem_edges)
    g.remove_vertices(rem_verts)
    if check_isolated_vertices: g.remove_isolated_vertices()


MatchBialgType = Tuple[VT,VT,List[VT],List[VT]]

def match_bialg(g: BaseGraph[VT,ET]) -> List[MatchBialgType[VT]]:
    """Does the same as :func:`match_bialg_parallel` but with ``num=1``."""
    return match_bialg_parallel(g, num=1)

#TODO: make it be hadamard edge aware
def match_bialg_parallel(
        g: BaseGraph[VT,ET],
        matchf: Optional[Callable[[ET],bool]] = None,
        num: int = -1
        ) -> List[MatchBialgType[VT]]:
    """Finds noninteracting matchings of the bialgebra rule.

    :param g: An instance of a ZX-graph.
    :param matchf: An optional filtering function for candidate edge, should
       return True if a edge should considered as a match. Passing None will
       consider all edges.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :rtype: List of 4-tuples ``(v1, v2, neighbors_of_v1,neighbors_of_v2)``
    """
    if matchf is not None: candidates = set([e for e in g.edges() if matchf(e)])
    else: candidates = g.edge_set()
    phases = g.phases()
    types = g.types()

    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v0, v1 = g.edge_st(candidates.pop())
        if g.is_ground(v0) or g.is_ground(v1):
            continue
        v0t = types[v0]
        v1t = types[v1]
        v0p = phases[v0]
        v1p = phases[v1]
        if (v0p == 0 and v1p == 0 and
        ((v0t == VertexType.Z and v1t == VertexType.X) or (v0t == VertexType.X and v1t == VertexType.Z))):
            v0n = [n for n in g.neighbors(v0) if not n == v1]
            v1n = [n for n in g.neighbors(v1) if not n == v0]
            if (
                all([types[n] == v1t and phases[n] == 0 for n in v0n]) and
                all([types[n] == v0t and phases[n] == 0 for n in v1n])):
                i += 1
                for v in v0n:
                    for c in g.incident_edges(v): candidates.discard(c)
                for v in v1n:
                    for c in g.incident_edges(v): candidates.discard(c)
                m.append((v0,v1,v0n,v1n))
    return m

def bialg(g: BaseGraph[VT,ET], matches: List[MatchBialgType[VT]]) -> RewriteOutputType[ET,VT]:
    """Performs a certain type of bialgebra rewrite given matchings supplied by
    ``match_bialg(_parallel)``."""
    rem_verts = []
    etab: Dict[ET, List[int]] = dict()
    for m in matches:
        rem_verts.append(m[0])
        rem_verts.append(m[1])
        es = [g.edge(i,j) for i in m[2] for j in m[3]]
        for e in es:
            if e in etab: etab[e][0] += 1
            else: etab[e] = [1,0]

    return (etab, rem_verts, [], True)


MatchSpiderType = Tuple[VT,VT]

def match_spider(g: BaseGraph[VT,ET]) -> List[MatchSpiderType[VT]]:
    """Does the same as :func:`match_spider_parallel` but with ``num=1``."""
    return match_spider_parallel(g, num=1)

def match_spider_parallel(
        g: BaseGraph[VT,ET],
        matchf: Optional[Callable[[ET],bool]] = None,
        num: int = -1,
        allow_interacting_matches: bool = False
        ) -> List[MatchSpiderType[VT]]:
    """Finds matches of the spider fusion rule.
    
    :param g: An instance of a ZX-graph.
    :param matchf: An optional filtering function for candidate edge, should
       return True if the edge should be considered for matchings. Passing None will
       consider all edges.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param allow_interacting_matches: Whether or not to allow matches which overlap,
        hence can not all be applied at once. Defaults to False.
    :rtype: List of 2-tuples ``(v1, v2)``
    """
    if matchf is not None: candidates = set([e for e in g.edges() if matchf(e)])
    else: candidates = g.edge_set()
    
    types = g.types()

    i = 0
    m: List[MatchSpiderType[VT]] = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if g.edge_type(e) != EdgeType.SIMPLE: continue
        
        v0, v1 = g.edge_st(e)
        v0t, v1t = types[v0], types[v1]
        if not ((v0t == v1t and vertex_is_zx(v0t)) or \
            (vertex_is_z_like(v0t) and vertex_is_z_like(v1t))): continue
        
        m.append((v0,v1))
        i += 1
        
        if allow_interacting_matches: continue
        for n in g.neighbors(v0):
            for ne in g.incident_edges(n): candidates.discard(ne)
        for n in g.neighbors(v1):
            for ne in g.incident_edges(n): candidates.discard(ne)
            
    return m

def spider(g: BaseGraph[VT,ET], matches: List[MatchSpiderType[VT]]) -> RewriteOutputType[ET,VT]:
    '''Performs spider fusion given a list of matchings from ``match_spider(_parallel)``
    '''
    rem_verts = []
    etab: Dict[ET,List[int]] = dict()

    for v0, v1 in matches:
        if g.row(v0) == 0: v0, v1 = v1, v0

        if g.is_ground(v0) or g.is_ground(v1):
            g.set_phase(v0, 0)
            g.set_ground(v0)
        elif g.type(v0) == VertexType.Z_BOX or g.type(v1) == VertexType.Z_BOX:
            if g.type(v0) == VertexType.Z:
                z_to_z_box(g, [v0])
            if g.type(v1) == VertexType.Z:
                z_to_z_box(g, [v1])
            g.set_phase(v0, 0)
            set_z_box_label(g, v0, get_z_box_label(g, v0) * get_z_box_label(g, v1))
        else:
            g.add_to_phase(v0, g.phase(v1))

        if g.phase_tracking: g.fuse_phases(v0,v1)

        rem_verts.append(v1) # always delete the second vertex in the match

        for n in g.neighbors(v1): # edges from the second vertex are transferred to the first
            if v0 == n: continue
            e = g.edge(v0,n)
            if e not in etab: etab[e] = [0,0]
            etab[e][g.edge_type(g.edge(v1,n))-1] += 1
            
    return (etab, rem_verts, [], True)

def unspider(g: BaseGraph[VT,ET], m: List[Any], qubit:FloatInt=-1, row:FloatInt=-1) -> VT:
    """Undoes a single spider fusion, given a match ``m``. A match is a list with 3
    elements given by::

      m[0] : a vertex to unspider
      m[1] : the neighbors of the new node, which should be a subset of the
             neighbors of m[0]
      m[2] : the phase of the new node. If omitted, the new node gets all of the phase of m[0]

    Returns the index of the new node. Optional parameters ``qubit`` and ``row`` can be used
    to position the new node. If they are omitted, they are set as the same as the old node.
    """
    u = m[0]
    v = g.add_vertex(ty=g.type(u))
    u_is_ground = g.is_ground(u)
    g.set_qubit(v, qubit if qubit != -1 else g.qubit(u))
    g.set_row(v, row if row != -1 else g.row(u))

    g.add_edge(g.edge(u, v))
    for n in m[1]:
        e = g.edge(u,n)
        g.add_edge(g.edge(v,n), edgetype=g.edge_type(e))
        g.remove_edge(e)
    if len(m) >= 3:
        g.add_to_phase(v, m[2])
        if not u_is_ground:
            g.add_to_phase(u, Fraction(0) - m[2])
    else:
        g.set_phase(v, g.phase(u))
        g.set_phase(u, 0)
    return v

def match_z_to_z_box(g: BaseGraph[VT,ET]) -> List[VT]:
    """Does the same as :func:`match_z_to_z_box_parallel` but with ``num=1``."""
    return match_z_to_z_box_parallel(g, num=1)

def match_z_to_z_box_parallel(
        g: BaseGraph[VT,ET],
        matchf:Optional[Callable[[VT],bool]]=None,
        num:int=-1
        ) -> List[VT]:
    """Finds all vertices that can be converted to Z-boxes."""
    if matchf is not None: candidates = set([v for v in g.vertices() if matchf(v)])
    else: candidates = g.vertex_set()
    types = g.types()
    phases = g.phases()
    m = []
    for v in candidates:
        if types[v] == VertexType.Z and not isinstance(phases[v],Poly):
            if num == 0: break
            m.append(v)
            num -= 1
    return m

def z_to_z_box(g: BaseGraph[VT,ET], matches: List[VT]) -> RewriteOutputType[ET,VT]:
    """Converts a Z vertex to a Z-box."""
    for v in matches:
        g.set_type(v, VertexType.Z_BOX)
        phase = g.phase(v)
        assert not isinstance(phase, Poly)
        label = np.round(np.e**(1j * np.pi * phase), 8)
        set_z_box_label(g, v, label)
        g.set_phase(v, 0)
    return ({}, [], [], True)

MatchWType = Tuple[VT,VT]

def match_w_fusion(g: BaseGraph[VT,ET]) -> List[MatchWType[VT]]:
    """Does the same as :func:`match_w_fusion_parallel` but with ``num=1``."""
    return match_w_fusion_parallel(g, num=1)

def match_w_fusion_parallel(
        g: BaseGraph[VT,ET],
        matchf:Optional[Callable[[ET],bool]]=None,
        num:int=-1
        ) -> List[MatchWType[VT]]:
    """Finds non-interacting matchings of the W fusion rule.

    :param g: An instance of a ZX-graph.
    :param matchf: An optional filtering function for candidate edge, should
       return True if the edge should be considered for matchings. Passing None will
       consider all edges.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :rtype: List of 2-tuples ``(v1, v2)``
    """
    if matchf is not None: candidates = set([e for e in g.edges() if matchf(e)])
    else: candidates = g.edge_set()
    types = g.types()

    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if g.edge_type(e) != EdgeType.SIMPLE: continue
        v0, v1 = g.edge_st(e)
        v0t = types[v0]
        v1t = types[v1]
        if vertex_is_w(v0t) and vertex_is_w(v1t):
            i += 1
            candidates_to_remove = []
            candidates_to_remove.extend(list(g.neighbors(v0)))
            candidates_to_remove.extend(list(g.neighbors(v1)))
            candidates_to_remove.extend(list(g.neighbors(get_w_partner(g, v0))))
            candidates_to_remove.extend(list(g.neighbors(get_w_partner(g, v1))))
            for v in candidates_to_remove:
                for c in g.incident_edges(v): candidates.discard(c)
            m.append((v0,v1))
    return m

def w_fusion(g: BaseGraph[VT,ET], matches: List[MatchSpiderType[VT]]) -> RewriteOutputType[ET,VT]:
    '''Performs W fusion given a list of matchings from ``match_w_fusion(_parallel)``
    '''
    rem_verts = []
    etab: Dict[ET,List[int]] = dict()

    for v0, v1 in matches:
        v0_in, v0_out = get_w_io(g, v0)
        v1_in, v1_out = get_w_io(g, v1)
        if not g.connected(v0_out, v1_in):
            v0_in, v1_in = v1_in, v0_in
            v0_out, v1_out = v1_out, v0_out
        # always delete the second vertex in the match
        rem_verts.extend([v1_in, v1_out])

        # edges from the second vertex are transferred to the first
        for w in g.neighbors(v1_out):
            if w == v1_in or w == v0_in:
                continue
            if w == v1_out:
                w = v0_out
            e = g.edge(v0_out, w)
            if e not in etab: etab[e] = [0,0]
            etab[e][g.edge_type(g.edge(v1_out, w)) - 1] += 1
    return (etab, rem_verts, [], True)


MatchPivotType = Tuple[VT,VT,Tuple[VT,...],Tuple[VT,...]]

def match_pivot(g: BaseGraph[VT,ET]) -> List[MatchPivotType[VT]]:
    """Does the same as :func:`match_pivot_parallel` but with ``num=1``."""
    return match_pivot_parallel(g, num=1, check_edge_types=True)

def match_pivot_parallel(
        g: BaseGraph[VT,ET],
        matchf: Optional[Callable[[ET],bool]] = None,
        num: int = -1,
        check_edge_types: bool = True,
        allow_interacting_matches: bool = False
        ) -> List[MatchPivotType[VT]]:
    """Finds matches of the pivot rule.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param check_edge_types: Whether the method has to check if all the edges involved
       are of the correct type (Hadamard edges).
    :param matchf: An optional filtering function for candidate edge, should
       return True if a edge should considered as a match. Passing None will
       consider all edges.
    :param allow_interacting_matches: Whether or not to allow matches which overlap,
        hence can not all be applied at once. Defaults to False.
    :rtype: List of 4-tuples. See :func:`pivot` for the details.
    """
    if matchf is not None: candidates = set([e for e in g.edges() if matchf(e)])
    else: candidates = g.edge_set()
    
    types = g.types()
    phases = g.phases()

    i = 0
    m: List[MatchPivotType[VT]] = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if check_edge_types and g.edge_type(e) != EdgeType.HADAMARD: continue
        
        v0, v1 = g.edge_st(e)
        if not (types[v0] == VertexType.Z and types[v1] == VertexType.Z): continue
        if any(phases[v] not in (0,1) for v in (v0,v1)): continue
        if g.is_ground(v0) or g.is_ground(v1): continue
        
        invalid_edge = False
        v0n = list(g.neighbors(v0))
        v0b = []
        for n in v0n:
            if types[n] == VertexType.Z and g.edge_type(g.edge(v0,n)) == EdgeType.HADAMARD: pass
            elif types[n] == VertexType.BOUNDARY: v0b.append(n)
            else:
                invalid_edge = True
                break
        if invalid_edge: continue

        v1n = list(g.neighbors(v1))
        v1b = []
        for n in v1n:
            if types[n] == VertexType.Z and g.edge_type(g.edge(v1,n)) == EdgeType.HADAMARD: pass
            elif types[n] == VertexType.BOUNDARY: v1b.append(n)
            else:
                invalid_edge = True
                break
        if invalid_edge: continue
        if len(v0b) + len(v1b) > 1: continue
        
        m.append((v0,v1,tuple(v0b),tuple(v1b)))
        i += 1
        
        if allow_interacting_matches: continue
        for n in v0n:
            for ne in g.incident_edges(n): candidates.discard(ne)
        for n in v1n:
            for ne in g.incident_edges(n): candidates.discard(ne)
        
    return m

def match_pivot_gadget(
        g: BaseGraph[VT,ET], 
        matchf: Optional[Callable[[ET],bool]] = None, 
        num: int = -1,
        allow_interacting_matches: bool = False
        ) -> List[MatchPivotType[VT]]:
    """Like :func:`match_pivot_parallel`, but except for pairings of
    Pauli vertices, it looks for a pair of an interior Pauli vertex and an
    interior non-Clifford vertex in order to gadgetize the non-Clifford vertex."""
    if matchf is not None: candidates = set([e for e in g.edges() if matchf(e)])
    else: candidates = g.edge_set()
    
    types = g.types()
    phases = g.phases()
    
    i = 0
    m: List[MatchPivotType[VT]] = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        v0, v1 = g.edge_st(e)
        if not all(types[v] == VertexType.Z for v in (v0,v1)): continue
        
        if phases[v0] not in (0,1):
            if phases[v1] in (0,1): v0, v1 = v1, v0
            else: continue
        elif phases[v1] in (0,1): continue # Now v0 has a Pauli phase and v1 has a non-Pauli phase
        
        if g.is_ground(v0): continue
        
        v0n = list(g.neighbors(v0))
        v1n = list(g.neighbors(v1))
        if len(v1n) == 1: continue # It is a phase gadget
        if any(types[n] != VertexType.Z for vn in (v0n,v1n) for n in vn): continue
        
        bad_match = False
        edges_to_discard = []
        for i, neighbors in enumerate((v0n, v1n)):
            for n in neighbors:
                if types[n] != VertexType.Z:
                    bad_match = True
                    break
                ne = list(g.incident_edges(n))
                if i == 0 and len(ne) == 1 and not (e == ne[0]): # v0 is a phase gadget
                    bad_match = True
                    break
                edges_to_discard.extend(ne)
            if bad_match: break
        if bad_match: continue
        
        m.append((v0,v1,tuple(),tuple()))
        i += 1
        
        if allow_interacting_matches: continue
        for c in edges_to_discard: candidates.discard(c)
        
    return m

def match_pivot_boundary(
        g: BaseGraph[VT,ET], 
        matchf: Optional[Callable[[VT],bool]] = None, 
        num: int=-1,
        allow_interacting_matches: bool = False
        ) -> List[MatchPivotType[VT]]:
    """Like :func:`match_pivot_parallel`, but except for pairings of
    Pauli vertices, it looks for a pair of an interior Pauli vertex and a
    boundary non-Pauli vertex in order to gadgetize the non-Pauli vertex."""
    if matchf is not None: candidates = set([v for v in g.vertices() if matchf(v)])
    else: candidates = g.vertex_set()
    
    phases = g.phases()
    types = g.types()
    
    i = 0
    consumed_vertices: Set[VT] = set()
    m: List[MatchPivotType[VT]] = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        if types[v] != VertexType.Z or phases[v] not in (0,1) or g.is_ground(v): continue
        
        good_vert = True
        w = None
        bound = None
        for n in g.neighbors(v):
            if types[n] != VertexType.Z or len(g.neighbors(n)) == 1 or n in consumed_vertices or g.is_ground(n): 
                good_vert = False
                break
            
            boundaries = []
            wrong_match = False
            for b in g.neighbors(n):
                if types[b] == VertexType.BOUNDARY: boundaries.append(b)
                elif types[b] != VertexType.Z: wrong_match = True
            if len(boundaries) != 1 or wrong_match: continue  # n is not on the boundary or has too many boundaries or has neighbors of wrong type
            if phases[n] and hasattr(phases[n], 'denominator') and phases[n].denominator == 2:
                w = n
                bound = boundaries[0]
            if not w:
                w = n
                bound = boundaries[0]
        if not good_vert or w is None: continue
        assert bound is not None
        
        m.append((v,w,tuple(),tuple([bound])))
        i += 1
        
        if allow_interacting_matches: continue
        for n in g.neighbors(v): 
            consumed_vertices.add(n)
            candidates.discard(n)
        for n in g.neighbors(w): 
            consumed_vertices.add(n)
            candidates.discard(n)
        
    return m

def pivot(g: BaseGraph[VT,ET], matches: List[MatchPivotType[VT]]) -> RewriteOutputType[ET,VT]:
    """Perform a pivoting rewrite, given a list of matches as returned by
    ``match_pivot(_parallel)``. A match is itself a list where:

    ``m[0]`` : first vertex in pivot.
    ``m[1]`` : second vertex in pivot.
    ``m[2]`` : list of zero or one boundaries adjacent to ``m[0]``.
    ``m[3]`` : list of zero or one boundaries adjacent to ``m[1]``.
    """
    rem_verts: List[VT] = []
    rem_edges: List[ET] = []
    etab: Dict[ET,List[int]] = dict()
    
    phases = g.phases()

    for m in matches:
        n = [set(g.neighbors(m[0])), set(g.neighbors(m[1]))]
        for i in range(2):
            n[i].remove(m[1-i]) # type: ignore # Really complex typing situation
            if len(m[i+2]) == 1: n[i].remove(m[i+2][0]) # type: ignore
        
        n.append(n[0] & n[1]) #  n[2] <- non-boundary neighbors of m[0] and m[1]
        n[0] = n[0] - n[2]  #  n[0] <- non-boundary neighbors of m[0] only
        n[1] = n[1] - n[2]  #  n[1] <- non-boundary neighbors of m[1] only
        
        es = ([g.edge(s,t) for s in n[0] for t in n[1]] +
              [g.edge(s,t) for s in n[1] for t in n[2]] +
              [g.edge(s,t) for s in n[0] for t in n[2]])
        k0, k1, k2 = len(n[0]), len(n[1]), len(n[2])
        g.scalar.add_power(k0*k2 + k1*k2 + k0*k1)

        for v in n[2]:
            if not g.is_ground(v): g.add_to_phase(v, 1)

        if phases[m[0]] and phases[m[1]]: g.scalar.add_phase(Fraction(1))
        if not m[2] and not m[3]: g.scalar.add_power(-(k0+k1+2*k2-1))
        elif not m[2]: g.scalar.add_power(-(k1+k2))
        else: g.scalar.add_power(-(k0+k2))

        for i in range(2): # if m[i] has a phase, it will get copied on to the neighbors of m[1-i]:
            a = phases[m[i]] # type: ignore
            if a:
                for v in n[1-i]:
                    if not g.is_ground(v): g.add_to_phase(v, a)
                for v in n[2]:
                    if not g.is_ground(v): g.add_to_phase(v, a)

            if not m[i+2]: rem_verts.append(m[1-i]) # type: ignore # if there is no boundary, the other vertex is destroyed
            else:
                e = g.edge(m[i], m[i+2][0]) # type: ignore # if there is a boundary, toggle whether it is an h-edge or a normal edge
                new_e = g.edge(m[1-i], m[i+2][0]) # type: ignore # and point it at the other vertex
                ne,nhe = etab.get(new_e, [0,0])
                if g.edge_type(e) == EdgeType.SIMPLE: nhe += 1
                elif g.edge_type(e) == EdgeType.HADAMARD: ne += 1
                etab[new_e] = [ne,nhe]
                rem_edges.append(e)
            
        for e in es:
            nhe = etab.get(e, (0,0))[1]
            etab[e] = [0,nhe+1]
            
    return (etab, rem_verts, rem_edges, True)

def pivot_gadget(g: BaseGraph[VT,ET], matches: List[MatchPivotType[VT]]) -> RewriteOutputType[ET,VT]:
    """Performs the gadgetizations required before applying pivots.
    ``m[0]`` : interior pauli vertex
    ``m[1]`` : interior non-pauli vertex to gadgetize
    ``m[2]`` : list of zero or one boundaries adjacent to ``m[0]``.
    ``m[3]`` : list of zero or one boundaries adjacent to ``m[1]``.
    """
    vertices_to_gadgetize = [m[1] for m in matches]
    gadgetize(g, vertices_to_gadgetize)
    return pivot(g, matches)

def gadgetize(g: BaseGraph[VT,ET], vertices: List[VT]) -> None:
    """Helper function which pulls out a list of vertices into gadgets"""
    edge_list = []
    
    inputs = g.inputs()
    phases = g.phases()
    
    for v in vertices:
        if any(n in inputs for n in g.neighbors(v)): mod = 0.5
        else: mod = -0.5

        vp = g.add_vertex(VertexType.Z,-2,g.row(v)+mod,phases[v])
        v0 = g.add_vertex(VertexType.Z,-1,g.row(v)+mod,0)
        g.set_phase(v, 0)
        
        edge_list.append(g.edge(v,v0))
        edge_list.append(g.edge(v0,vp))
        
        if g.phase_tracking: g.unfuse_vertex(vp,v)
        
    g.add_edges(edge_list, EdgeType.HADAMARD)
    return


MatchLcompType = Tuple[VT,Tuple[VT,...]]

def match_lcomp(g: BaseGraph[VT,ET]) -> List[MatchLcompType[VT]]:
    """Same as :func:`match_lcomp_parallel`, but with ``num=1``"""
    return match_lcomp_parallel(g, num=1, check_edge_types=True)

def match_lcomp_parallel(
        g: BaseGraph[VT,ET], 
        vertexf: Optional[Callable[[VT],bool]] = None, 
        num: int = -1, 
        check_edge_types: bool = True,
        allow_interacting_matches: bool = False
        ) -> List[MatchLcompType[VT]]:
    """Finds matches of the local complementation rule.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param check_edge_types: Whether the method has to check if all the edges involved
       are of the correct type (Hadamard edges).
    :param vertexf: An optional filtering function for candidate vertices, should
       return True if a vertex should be considered as a match. Passing None will
       consider all vertices.
    :param allow_interacting_matches: Whether or not to allow matches which overlap,
        hence can not all be applied at once. Defaults to False.
    :rtype: List of 2-tuples ``(vertex, neighbors)``.
    """
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    
    phases = g.phases()
    types = g.types()
    
    i = 0
    m: List[MatchLcompType[VT]] = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        
        if types[v] != VertexType.Z: continue
        if phases[v] not in (Fraction(1,2), Fraction(3,2)): continue
        if g.is_ground(v): continue

        if check_edge_types and not (
            all(g.edge_type(e) == EdgeType.HADAMARD for e in g.incident_edges(v))
            ): continue

        vn = list(g.neighbors(v))
        if any(types[n] != VertexType.Z for n in vn): continue
        
        m.append((v,tuple(vn)))
        i += 1
        
        if allow_interacting_matches: continue
        for n in vn: candidates.discard(n)
    return m

def lcomp(g: BaseGraph[VT,ET], matches: List[MatchLcompType[VT]]) -> RewriteOutputType[ET,VT]:
    """Performs a local complementation based rewrite rule on the given graph with the
    given ``matches`` returned from ``match_lcomp(_parallel)``. See "Graph Theoretic
    Simplification of Quantum Circuits using the ZX calculus" (arXiv:1902.03178)
    for more details on the rewrite"""
    etab: Dict[ET,List[int]] = dict()
    rem = []
    
    phases = g.phases()
    
    for v, vn in matches:
        p = phases[v]
        rem.append(v)
        assert isinstance(p,Fraction)
        
        if p.numerator == 1: g.scalar.add_phase(Fraction(1,4))
        else: g.scalar.add_phase(Fraction(7,4))
        
        n = len(vn)
        g.scalar.add_power((n-2)*(n-1)//2)
        
        for i in range(n):
            if not g.is_ground(vn[i]):
                g.add_to_phase(vn[i], -p)
            for j in range(i+1, n):
                e = g.edge(vn[i],vn[j])
                he = etab.get(e, [0,0])[1]
                etab[e] = [0, he+1]

    return (etab, rem, [], True)


MatchIdType = Tuple[VT,VT,VT,EdgeType.Type]

def match_ids(g: BaseGraph[VT,ET]) -> List[MatchIdType[VT]]:
    """Finds a single identity node. See :func:`match_ids_parallel`."""
    return match_ids_parallel(g, num=1)

def match_ids_parallel(
        g: BaseGraph[VT,ET], 
        vertexf: Optional[Callable[[VT],bool]] = None, 
        num: int = -1,
        allow_interacting_matches: bool = False
        ) -> List[MatchIdType[VT]]:
    """Finds matches of identity vertices.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param vertexf: An optional filtering function for candidate vertices, should
       return True if a vertex should be considered as a match. Passing None will
       consider all vertices.
    :param allow_interacting_matches: Whether or not to allow matches which overlap,
        hence can not all be applied at once
    :rtype: List of 4-tuples ``(identity_vertex, neighbor1, neighbor2, edge_type)``.
    """
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    
    types = g.types()
    phases = g.phases()
    
    i = 0
    m: List[MatchIdType[VT]] = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        if phases[v] != 0 or not vertex_is_zx(types[v]) or g.is_ground(v): continue
        
        vn = g.neighbors(v)
        if len(vn) != 2: continue
        v0, v1 = vn
        
        if (g.is_ground(v0) and types[v1] == VertexType.BOUNDARY or
                g.is_ground(v1) and types[v0] == VertexType.BOUNDARY):  # Do not put ground spiders on the boundary
            continue
        
        if g.edge_type(g.edge(v,v0)) != g.edge_type(g.edge(v,v1)): #exactly one of them is a hadamard edge
            m.append((v,v0,v1,EdgeType.HADAMARD))
        else: m.append((v,v0,v1,EdgeType.SIMPLE))
        i += 1
        
        if allow_interacting_matches: continue
        candidates.discard(v0)
        candidates.discard(v1)
        
    return m

def remove_ids(g: BaseGraph[VT,ET], matches: List[MatchIdType[VT]]) -> RewriteOutputType[ET,VT]:
    """Given the output of ``match_ids(_parallel)``, returns a list of edges to add,
    and vertices to remove."""
    etab : Dict[ET,List[int]] = dict()
    rem = []
    for v,v0,v1,et in matches:
        rem.append(v)
        e = g.edge(v0,v1)
        if not e in etab: etab[e] = [0,0]
        if et == EdgeType.SIMPLE: etab[e][0] += 1
        else: etab[e][1] += 1
        
    return (etab, rem, [], False)


MatchGadgetType = Tuple[VT, int, List[VT], Dict[VT,VT]]

def match_phase_gadgets(g: BaseGraph[VT,ET],vertexf:Optional[Callable[[VT],bool]]=None) -> List[MatchGadgetType[VT]]:
    """Determines which phase gadgets act on the same vertices, so that they can be fused together.

    :param g: An instance of a ZX-graph.
    :rtype: List of 4-tuples ``(leaf, parity_length, other axels with same targets, leaf dictionary)``.
    """
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()

    phases = g.phases()

    parities: Dict[FrozenSet[VT], List[VT]] = dict()
    gadgets: Dict[VT,VT] = dict()
    inputs = g.inputs()
    outputs = g.outputs()
    # First we find all the phase-gadgets, and the list of vertices they act on
    for v in candidates:
        non_clifford = phases[v] != 0 and getattr(phases[v], 'denominator', 1) > 2
        if isinstance(phases[v], Poly): non_clifford = True
        if non_clifford and len(list(g.neighbors(v)))==1:
            n = list(g.neighbors(v))[0]
            if phases[n] not in (0,1): continue # Not a real phase gadget (happens for scalar diagrams)
            if n in gadgets: continue # Not a real phase gadget (happens for scalar diagrams)
            if n in inputs or n in outputs: continue # Not a real phase gadget (happens for non-unitary diagrams)
            gadgets[n] = v
            par = frozenset(set(g.neighbors(n)).difference({v}))
            if par in parities: parities[par].append(n)
            else: parities[par] = [n]

    m: List[MatchGadgetType[VT]] = []
    for par, gad in parities.items():
        if len(gad) == 1:
            n = gad[0]
            if phases[n] != 0: 
                m.append((n, len(par), [], gadgets))
        else:
            n = gad.pop()
            m.append((n, len(par), gad, gadgets))
    return m

def merge_phase_gadgets(g: BaseGraph[VT,ET], matches: List[MatchGadgetType[VT]]) -> RewriteOutputType[ET,VT]:
    """Given the output of :func:``match_phase_gadgets``, removes phase gadgets that act on the same set of targets."""
    rem = []
    phases = g.phases()
    for n, par_num, gad, gadgets in matches:
        v = gadgets[n]
        if len(gad) == 0:
            if phases[n] != 0:
                g.scalar.add_phase(phases[v])
                if g.phase_tracking: g.phase_negate(v)
                phase = -phases[v]
        else:
            phase = sum((1 if phases[w]==0 else -1)*phases[gadgets[w]] for w in gad+[n])%2
            for w in gad+[n]:
                if phases[w] != 0:
                    g.scalar.add_phase(phases[gadgets[w]])
                    if g.phase_tracking: g.phase_negate(gadgets[w])
            g.scalar.add_power(-((par_num-1)*len(gad)))
        g.set_phase(v, phase)
        g.set_phase(n, 0)
        othertargets = [gadgets[w] for w in gad]
        rem.extend(gad)
        rem.extend(othertargets)
        for w in othertargets:
            if g.phase_tracking: g.fuse_phases(v,w)
            if g.merge_vdata is not None: g.merge_vdata(v, w)
    return ({}, rem, [], False)


MatchSupplementarityType = Tuple[VT,VT,Literal[1,2],FrozenSet[VT]]

def match_supplementarity(g: BaseGraph[VT,ET], vertexf:Optional[Callable[[VT],bool]]=None) -> List[MatchSupplementarityType[VT]]:
    """Finds pairs of non-Clifford spiders that are connected to exactly the same set of vertices.

    :param g: An instance of a ZX-graph.
    :rtype: List of 4-tuples ``(vertex1, vertex2, type of supplementarity, neighbors)``.
    """
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    phases = g.phases()

    parities: Dict[FrozenSet[VT],List[VT]] = dict()
    m: List[MatchSupplementarityType[VT]] = []
    taken: Set[VT] = set()
    # First we find all the non-Clifford vertices and their list of neighbors
    while len(candidates) > 0:
        v = candidates.pop()
        if phases[v] == 0 or phases[v].denominator <= 2: continue # Skip Clifford vertices
        neigh = set(g.neighbors(v))
        if not neigh.isdisjoint(taken): continue
        par = frozenset(neigh)
        if par in parities:
            for w in parities[par]:
                if (phases[v]-phases[w]) % 2 == 1 or (phases[v]+phases[w]) % 2 == 1:
                    m.append((v,w,1,par))
                    taken.update({v,w})
                    taken.update(neigh)
                    candidates.difference_update(neigh)
                    break
            else: parities[par].append(v)
            if v in taken: continue
        else: parities[par] = [v]
        for w in neigh:
            if phases[w] == 0 or phases[w].denominator <= 2 or w in taken: continue
            diff = neigh.symmetric_difference(g.neighbors(w))
            if len(diff) == 2: # Perfect overlap
                if (phases[v] + phases[w]) % 2 == 0 or (phases[v] - phases[w]) % 2 == 1:
                    m.append((v,w,2,frozenset(neigh.difference({w}))))
                    taken.update({v,w})
                    taken.update(neigh)
                    candidates.difference_update(neigh)
                    break
    return m

def apply_supplementarity(
        g: BaseGraph[VT,ET],
        matches: List[MatchSupplementarityType[VT]]
        ) -> RewriteOutputType[ET,VT]:
    """Given the output of :func:``match_supplementarity``, removes non-Clifford spiders that act on the same set of targets trough supplementarity."""
    rem = []
    for v, w, t, neigh in matches:
        rem.append(v)
        rem.append(w)
        alpha = g.phase(v)
        beta = g.phase(w)
        g.scalar.add_power(-2*len(neigh))
        if t == 1: # v and w are not connected
            g.scalar.add_node(2*alpha+1)
            #if (alpha-beta)%2 == 1: # Standard supplementarity
            if (alpha+beta)%2 == 1: # Need negation on beta
                g.scalar.add_phase(-alpha + 1)
                for n in neigh:
                    g.add_to_phase(n,1)
        elif t == 2: # they are connected
            g.scalar.add_power(-1)
            g.scalar.add_node(2*alpha)
            #if (alpha-beta)%2 == 1: # Standard supplementarity
            if (alpha+beta)%2 == 0: # Need negation
                g.scalar.add_phase(-alpha)
                for n in neigh:
                    g.add_to_phase(n,1)
        else: raise Exception("Shouldn't happen")
    return ({}, rem, [], True)


MatchCopyType = Tuple[VT,VT,FractionLike,FractionLike,List[VT]]

def match_copy(
    g: BaseGraph[VT,ET], 
    vertexf:Optional[Callable[[VT],bool]]=None
    ) -> List[MatchCopyType[VT]]:
    """Finds spiders with a 0 or pi phase that have a single neighbor,
    and copies them through. Assumes that all the spiders are green and maximally fused."""
    if vertexf is not None:
        candidates = set([v for v in g.vertices() if vertexf(v)])
    else:
        candidates = g.vertex_set()
    phases = g.phases()
    types = g.types()
    m = []

    while len(candidates) > 0:
        v = candidates.pop()
        if phases[v] not in (0,1) or types[v] != VertexType.Z or g.vertex_degree(v) != 1: continue
        w = list(g.neighbors(v))[0]
        if types[w] != VertexType.Z: continue
        neigh = [n for n in g.neighbors(w) if n != v]
        m.append((v,w,phases[v],phases[w],neigh))
        candidates.discard(w)
        candidates.difference_update(neigh)
    return m

def apply_copy(g: BaseGraph[VT,ET], matches: List[MatchCopyType[VT]]) -> RewriteOutputType[ET,VT]:
    rem = []
    types = g.types()
    outputs = g.outputs()
    for v,w,a,alpha, neigh in matches:
        rem.append(v)
        rem.append(w)
        g.scalar.add_power(-len(neigh)+1)
        if a: g.scalar.add_phase(alpha)
        for n in neigh:
            if types[n] == VertexType.BOUNDARY:
                r = g.row(n) - 1 if n in outputs else g.row(n)+1
                u = g.add_vertex(VertexType.Z, g.qubit(n), r, a)
                e = g.edge(w,n)
                et = g.edge_type(e)
                g.add_edge(g.edge(n,u), toggle_edge(et))
            g.add_to_phase(n, a)
    return ({}, rem, [], True)


MatchPhasePolyType = Tuple[List[VT], Dict[FrozenSet[VT],Union[VT,Tuple[VT,VT]]]]

def match_gadgets_phasepoly(g: BaseGraph[VT,ET]) -> List[MatchPhasePolyType[VT]]:
    """Finds groups of phase-gadgets that act on the same set of 4 vertices in order to apply a rewrite based on
    rule R_13 of the paper *A Finite Presentation of CNOT-Dihedral Operators*."""
    targets: Dict[VT,Set[FrozenSet[VT]]] = {}
    gadgets: Dict[FrozenSet[VT], Tuple[VT,VT]] = {}
    inputs = g.inputs()
    outputs = g.outputs()
    for v in g.vertices():
        if v not in inputs and v not in outputs and len(list(g.neighbors(v)))==1:
            if g.phase(v) != 0 and g.phase(v).denominator != 4: continue
            n = list(g.neighbors(v))[0]
            tgts = frozenset(set(g.neighbors(n)).difference({v}))
            if len(tgts)>4: continue
            gadgets[tgts] = (n,v)
            for t in tgts:
                if t in targets: targets[t].add(tgts)
                else: targets[t] = {tgts}
        if g.phase(v) != 0 and g.phase(v).denominator == 4:
            if v in targets: targets[v].add(frozenset([v]))
            else: targets[v] = {frozenset([v])}
    targets = {t:s for t,s in targets.items() if len(s)>1}
    matches: Dict[FrozenSet[VT], Set[FrozenSet[VT]]] = {}

    for v1,t1 in targets.items():
        s = t1.difference(frozenset([v1]))
        if len(s) == 1:
            c = s.pop()
            if any(len(targets[v2])==2 for v2 in c): continue
        s = t1.difference({frozenset({v1})})
        for c in [d for d in s if not any(d.issuperset(e) for e in s if e!=d)]:
            if not all(v2 in targets for v2 in c): continue
            if any(v2<v1 for v2 in c): continue
            a = set()
            for t in c: a.update([i for s in targets[t] for i in s if i in targets])
            for group in itertools.combinations(a.difference(c),4-len(c)):
                gr = list(group)+list(c)
                b: Set[FrozenSet[VT]] = set()
                for t in gr: b.update([s for s in targets[t] if s.issubset(gr)])
                if len(b)>7:
                    matches[frozenset(gr)] = b

    m: List[MatchPhasePolyType[VT]] = []
    taken: Set[VT] = set()
    for groupp, gad in sorted(matches.items(), key=lambda x: len(x[1]), reverse=True):
        if taken.intersection(groupp): continue
        m.append((list(groupp), {s:(gadgets[s] if len(s)>1 else list(s)[0]) for s in gad}))
        taken.update(groupp)

    return m

def apply_gadget_phasepoly(g: BaseGraph[VT,ET], matches: List[MatchPhasePolyType[VT]]) -> None:
    """Uses the output of :func:`match_gadgets_phasepoly` to apply a rewrite based
    on rule R_13 of the paper *A Finite Presentation of CNOT-Dihedral Operators*."""
    rs = g.rows()
    phases = g.phases()
    for group, gadgets in matches:
        for i in range(4):
            v1 = group[i]
            g.add_to_phase(v1, Fraction(5,4))

            for j in range(i+1,4):
                v2 = group[j]
                f = frozenset({v1,v2})
                if f in gadgets:
                    n,v = gadgets[f] # type: ignore # complex typing situation
                    phase = phases[v]
                    if phases[n]:
                        phase = -phase
                        g.set_phase(n,0)
                else:
                    n = g.add_vertex(VertexType.Z,-1, rs[v2]+0.5)
                    v = g.add_vertex(VertexType.Z,-2, rs[v2]+0.5)
                    phase = 0
                    g.add_edges([g.edge(n,v),g.edge(v1,n),g.edge(v2,n)],EdgeType.HADAMARD)
                g.set_phase(v, phase + Fraction(3,4))

                for k in range(j+1,4):
                    v3 = group[k]
                    f = frozenset({v1,v2,v3})
                    if f in gadgets:
                        n,v = gadgets[f] # type: ignore
                        phase = phases[v]
                        if phases[n]:
                            phase = -phase
                            g.set_phase(n,0)
                    else:
                        n = g.add_vertex(VertexType.Z,-1, rs[v3]+0.5)
                        v = g.add_vertex(VertexType.Z,-2, rs[v3]+0.5)
                        phase = 0
                        g.add_edges([g.edge(*e) for e in [(n,v),(v1,n),(v2,n),(v3,n)]],EdgeType.HADAMARD)
                    g.set_phase(v, phase + Fraction(1,4))
        f = frozenset(group)
        if f in gadgets:
            n,v = gadgets[f] # type: ignore
            phase = phases[v]
            if phases[n]:
                phase = -phase
                g.set_phase(n,0)
        else:
            n = g.add_vertex(1,-1, rs[group[0]]+0.5)
            v = g.add_vertex(1,-2, rs[group[0]]+0.5)
            phase = 0
            g.add_edges([g.edge(n,v)]+[g.edge(n,w) for w in group],EdgeType.HADAMARD)
        g.set_phase(v, phase + Fraction(7,4))


MatchIdFuseType = Tuple[VT,VT,VT]

def match_id_fuse(
        g: BaseGraph[VT,ET], 
        matchf: Optional[Callable[[VT], bool]] = None, 
        num: int = -1,
        allow_interacting_matches: bool = False
        ) -> List[MatchIdFuseType[VT]]:
    """Finds matches of the identity fusion rule (identity removal followed immediately by spider fusion)

    :param g: An instance of a ZX-graph
    :param matchf: An optional filtering function for candidate edge, should
       return True if a edge should considered as a match. Defaults to None
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible., defaults to -1
    :param allow_interacting_matches: Whether or not to allow matches which overlap,
        hence can not all be applied at once. Defaults to False.
    :return: List of 3-tuples. See :func:`id_fuse` for the details.
    """
    if matchf is not None: candidates = {v for v in g.vertices() if matchf(v)}
    else: candidates = g.vertex_set()
    
    phases = g.phases()
    types = g.types()
    
    i = 0
    m: List[MatchIdFuseType] = []
    while candidates and (num == -1 or i < num):
        v = candidates.pop()
        phase = phases[v]
        
        if not vertex_is_zx(types[v]) or g.is_ground(v): continue
        if g.phase_tracking:
            if g.check_phase(v, phase, 0) is False: continue
        elif phase != 0: continue
        
        ns = g.neighbors(v)
        if len(ns) != 2: continue
        v0, v1 = ns
        
        if not (vertex_is_zx(types[v0]) and types[v0] == types[v1]): continue
        if g.edge_type(g.edge(v,v0)) != g.edge_type(g.edge(v,v1)): continue # Do not put ground spiders on the boundary
        if any(len(g.neighbors(u)) == 1 for u in (v0,v1)): continue # Phase gadget
        
        m.append((v,v0,v1))
        i += 1
        
        if allow_interacting_matches: continue
        candidates.discard(v0)
        candidates.discard(v1)
        for n in g.neighbors(v0): 
            candidates.discard(n)
            for n2 in g.neighbors(n): candidates.discard(n2)
        for n in g.neighbors(v1): 
            candidates.discard(n)
            for n2 in g.neighbors(n): candidates.discard(n2)
    return m

def id_fuse(g: BaseGraph[VT,ET], matches: List[MatchIdFuseType[VT]]) -> RewriteOutputType[ET,VT]:
    """Perform a identity fusion rewrite, given a list of matches as returned by
    ``match_id_fuse``. A match is itself a tuple where:

    ``m[0]`` : The central identity vertex to be removed.
    ``m[1]`` : The first neighbour of the central vertex.
    ``m[2]`` : The second neighbour of the central vertex.
    """
    rem_verts = []
    etab: Dict[ET,List[int]] = dict()
    
    phases = g.phases()

    for id_v, v0, v1 in matches:
        rem_verts.append(id_v)

        if g.is_ground(v0) or g.is_ground(v1):
            g.set_phase(v0, 0)
            g.set_ground(v0)
        else: g.add_to_phase(v0, phases[v1])
        
        if g.phase_tracking:
            g.fix_phase(id_v, phases[id_v], 0)
            g.fuse_phases(v0, v1)
        
        rem_verts.append(v1) # always delete the second vertex in the match

        for w in g.neighbors(v1): # edges from the second vertex are transferred to the first
            if w in [id_v, v0]: continue
            e = g.edge(v0,w)
            etab.setdefault(e, [0,0])[g.edge_type(g.edge(v1,w)) - 1] += 1
            
    return (etab, rem_verts, [], True)


def unfuse_neighbours(g: BaseGraph[VT,ET], v: VT, neighbours_to_unfuse: Tuple[VT,...], desired_phase: FractionLike) -> Tuple[VT,VT]:
    """Helper function which unfuses a vertex onto a set of neighbours, leaving it with a desired phase."""
    unfused_phase = g.phase(v) - desired_phase
    
    vp = g.add_vertex(VertexType.Z, -2, g.row(v), unfused_phase)
    v0 = g.add_vertex(VertexType.Z, -1, g.row(v))
    
    g.set_phase(v, desired_phase)
    g.add_edge(g.edge(v,v0), EdgeType.HADAMARD)
    g.add_edge(g.edge(v0,vp), EdgeType.HADAMARD)
    
    for n in neighbours_to_unfuse:
        g.add_edge(g.edge(vp, n), g.edge_type(g.edge(v, n)))
        g.remove_edge(g.edge(v, n))
        
    if g.phase_tracking: g.unfuse_vertex(vp, v)
    
    return v0, vp


MatchLcompUnfuseType = Tuple[VT,Tuple[VT,...],Tuple[VT,...]]

def match_lcomp_unfuse(
        g: BaseGraph[VT,ET],
        matchf: Optional[Callable[[VT], bool]] = None,
        num: int = -1,
        allow_interacting_matches: bool = True,
        max_unfusions: int = 0,
        **kwargs: Any
        ) -> List[MatchLcompUnfuseType]:
    """Finds matches of the local complementation rule including unfusions onto (a set maximum) number of neighbours.
    Increasing ``max_unfusions`` scales the number of matches exponentially.
    Note that the different unfusion match variations cannot be applied at once.

    :param g: An instance of a ZX-graph
    :param matchf: An optional filtering function for candidate edge, should
       return True if a edge should considered as a match. Defaults to None
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible., defaults to -1
    :param allow_interacting_matches: Whether or not to allow matches which overlap,
        hence can not all be applied at once. Defaults to True.
    :param max_unfusions: The maximum number of neighours to unfuse onto.
    :return: List of 3-tuples. See :func:`lcomp_unfuse` for the details.
    """
    if matchf is not None: candidates = {v for v in g.vertices() if matchf(v)}
    else: candidates = g.vertex_set()
    
    phases = g.phases()
    types = g.types()
    
    i = 0
    m: List[MatchLcompUnfuseType] = []
    while candidates and (num == -1 or i < num):
        v = candidates.pop()
        
        if types[v] != VertexType.Z or g.is_ground(v) or g.vertex_degree(v) == 1: continue
        
        vn = list(g.neighbors(v))
        
        vb = [n for n in vn if types[n] == VertexType.BOUNDARY]
        if any(types[n] != VertexType.Z or g.edge_type(g.edge(v, n)) != EdgeType.HADAMARD for n in vn if n not in vb): continue
        
        for subset_size in range(min(len(vn)-1, max_unfusions+1)):
            for neighbours_to_unfuse in itertools.combinations(vn, subset_size):
                if not set(vb).issubset(set(neighbours_to_unfuse)): continue
            
                if len(neighbours_to_unfuse) == 0:
                    phase = phases[v]
                    if g.phase_tracking:
                        if not (g.check_phase(v, phase, Fraction(1,2)) or g.check_phase(v, phase, Fraction(3,2))): continue
                    elif phase not in (Fraction(1,2), Fraction(3,2)): continue
                
                m.append((v,tuple(vn),neighbours_to_unfuse))
        
        i += 1
        
        if allow_interacting_matches: continue
        candidates.difference_update(vn)
    return m

def lcomp_unfuse(g: BaseGraph[VT,ET], matches: List[MatchLcompUnfuseType[VT]]) -> RewriteOutputType[ET,VT]:
    """Perform a local complemntation unfusion rewrite, given a list of matches as returned by
    ``match_lcomp_unfuse``. A match is itself a tuple where:

    ``m[0]`` : The central identity vertex to be removed.
    ``m[1]`` : The first neighbour of the central vertex.
    ``m[2]`` : The second neighbour of the central vertex.
    """
    updated_matches: List[MatchLcompType] = []
    
    phases = g.phases()
    
    for v, vn, neighbours_to_unfuse in matches:
        if not neighbours_to_unfuse:
            if g.phase_tracking:
                phase = phases[v]
                if g.check_phase(v, phase, Fraction(1,2)): g.fix_phase(v, phase, Fraction(1,2))
                else: g.fix_phase(v, phase, Fraction(3,2))
            updated_matches.append((v,tuple(vn)))
        else:
            v0, vp = unfuse_neighbours(g, v, neighbours_to_unfuse, Fraction(1,2))
            updated_matches.append((v, tuple(v for v in vn if v not in neighbours_to_unfuse) + (v0,)))
            
    return lcomp(g, updated_matches)


MatchPivotUnfuseType = Tuple[VT,VT,Tuple[Tuple[VT,...],...]]

def match_pivot_unfuse(
        g: BaseGraph[VT,ET], 
        matchf: Optional[Callable[[ET], bool]] = None, 
        num: int = -1,
        allow_interacting_matches: bool = False,
        max_unfusions: int = 0,
        **kwargs: Any
        ) -> List[MatchPivotUnfuseType[VT]]:
    """Finds matches of the pivot rule including unfusions onto (a set maximum) number of neighbours from each vertex.
    Increasing ``max_unfusions`` scales the number of matches exponentially.
    Note that the different unfusion match variations cannot be applied at once.

    :param g: An instance of a ZX-graph
    :param matchf: An optional filtering function for candidate edge, should
       return True if a edge should considered as a match. Defaults to None
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible., defaults to -1
    :param allow_interacting_matches: Whether or not to allow matches which overlap,
        hence can not all be applied at once. Defaults to True.
    :param max_unfusions: The maximum number of neighours to unfuse onto for each vertex.
    :return: List of 3-tuples. See :func:`pivot_unfuse` for the details.
    """
    if matchf: candidates = {e for e in g.edges() if matchf(e) and g.edge_type(e) == EdgeType.HADAMARD}
    else: candidates = {e for e in g.edges() if g.edge_type(e) == EdgeType.HADAMARD}
    
    phases = g.phases()
    types = g.types()
    
    i = 0
    m: List[MatchPivotUnfuseType] = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        
        v0, v1 = g.edge_st(e)
        if types[v0] != VertexType.Z or types[v1] != VertexType.Z or g.is_ground(v0) or g.is_ground(v1): continue
        
        v0n = list(g.neighbors(v0))
        v1n = list(g.neighbors(v1))
        if len(v0n) == 1 or len(v1n) == 1: continue
        
        v0b = set()
        for n in v0n:
            ty = types[n]
            if ty == VertexType.BOUNDARY:
                v0b.add(n)
                continue
            if ty != VertexType.Z or g.edge_type(g.edge(v0, n)) != EdgeType.HADAMARD: continue
        
        v1b = set()
        for n in v1n:
            ty = types[n]
            if ty == VertexType.BOUNDARY:
                v1b.add(n)
                continue
            if ty != VertexType.Z or g.edge_type(g.edge(v1, n)) != EdgeType.HADAMARD: continue
        
        if g.phase_tracking: pivot_phases = g.check_two_pauli_phases(v0, phases[v0], v1, phases[v1])
        else: pivot_phases = [p if p in {0, 1} else None for p in (phases[v0], phases[v1])]
        
        max_subset_v0 = min(len(v0n) - 1, max_unfusions + 1)
        max_subset_v1 = min(len(v1n) - 1, max_unfusions + 1)
        for subset_size_v0 in range(max_subset_v0):
            for neighbours_to_unfuse_0 in itertools.combinations(v0n, subset_size_v0):
                if v1 in neighbours_to_unfuse_0: continue
                if v0b and not v0b.issubset(neighbours_to_unfuse_0): continue
                
                for subset_size_v1 in range(max_subset_v1):
                    for neighbours_to_unfuse_1 in itertools.combinations(v1n, subset_size_v1):
                        if v0 in neighbours_to_unfuse_1: continue
                        if v1b and not v1b.issubset(neighbours_to_unfuse_1): continue
                        
                        if (pivot_phases is None and not (neighbours_to_unfuse_0 or neighbours_to_unfuse_1)) or \
                            (pivot_phases == [None, None] and (not neighbours_to_unfuse_0 or not neighbours_to_unfuse_1)) or \
                            (pivot_phases and pivot_phases[0] is None and not neighbours_to_unfuse_0) or \
                            (pivot_phases and pivot_phases[1] is None and not neighbours_to_unfuse_1):
                            continue
                        
                        m.append((v0, v1, (tuple(neighbours_to_unfuse_0), tuple(neighbours_to_unfuse_1))))
        
        i += 1
        
        if allow_interacting_matches: continue
        for n in v0n + v1n:
            candidates -= set(g.incident_edges(n))
    return m

def pivot_unfuse(g: BaseGraph[VT,ET], matches: List[MatchPivotUnfuseType[VT]]) -> RewriteOutputType[ET,VT]:
    """Perform a pivot unfusion rewrite, given a list of matches as returned by
    ``match_pivot_unfuse``. A match is itself a tuple where:

    ``m[0]`` : The first pivot vertex
    ``m[1]`` : The second pivot vertex
    ``m[2]`` : 2-tuple containing tuples of the neighbours to unfuse from each respective vertex
    """
    updated_matches: List[MatchPivotType[VT]] = []
    
    phases = g.phases()
    
    for v0, v1, (neighbours_to_unfuse_0, neighbours_to_unfuse_1) in matches:
        len_n0, len_n1 = len(neighbours_to_unfuse_0), len(neighbours_to_unfuse_1)
        
        if g.phase_tracking:
            v0p, v1p = phases[v0], phases[v1]
            pivot_phases = g.check_two_pauli_phases(v0, v0p, v1, v1p)
            
            if len_n0 == 0:
                p0 = pivot_phases[0] if pivot_phases else 0
                assert p0 is not None
                g.fix_phase(v0, v0p, p0)
                if len_n1 == 0 and pivot_phases:
                    assert pivot_phases[1] is not None
                    g.fix_phase(v1, v1p, pivot_phases[1])
            elif len_n1 == 0:
                p1 = pivot_phases[1] if pivot_phases else 0
                assert p1 is not None
                g.fix_phase(v1, v1p, p1)
        
        if len_n0 > 0: unfuse_neighbours(g, v0, neighbours_to_unfuse_0, 0)
        if len_n1 > 0: unfuse_neighbours(g, v1, neighbours_to_unfuse_1, 0)
        
        updated_matches.append((v0, v1, tuple(), tuple()))
        
    return pivot(g, updated_matches)


MatchUnfuseType = Union[Tuple[MatchLcompUnfuseType, None, None],Tuple[None, MatchPivotUnfuseType, None], Tuple[None,None,MatchIdFuseType]]

def match_2Q_simp(
        g: BaseGraph[VT,ET], 
        matchf: Optional[Callable[[Union[VT,ET]],bool]] = None, 
        rewrites: List[str] = ['id_fuse','lcomp','pivot'], 
        max_lc_unfusions: int = 0, 
        max_p_unfusions: int = 0, 
        **kwargs: Any
        ) -> List[MatchUnfuseType]:
    """Finds matches of :func:`lcomp_unfuse`, :func:`pivot_unfuse` and :func:`id_fuse`.
    Increasing ``max_lc_unfusions`` or ``max_p_unfusions`` scales the number of matches exponentially.

    :param g: An instance of a ZX-graph
    :param matchf: An optional filtering function for candidate edge, should
       return True if a edge should considered as a match. Defaults to None
    :param rewrites: A list containing which rewrites to apply. Defaults to ['id_fuse','lcomp','pivot']
    :param max_lc_unfusions: The maximum number of neighours to unfuse onto for each local complementation.
    :param max_p_unfusions: The maximum number of neighours to unfuse onto for each pivot vertex.
    :return: List of 3-tuples. See :func:`rewrite_2Q_simp` for the details.
    """
    m: List[MatchUnfuseType] = []
    if 'lcomp' in rewrites: m.extend([(match,None,None) for match in match_lcomp_unfuse(g, matchf, allow_interacting_matches=True, max_unfusions=max_lc_unfusions)])
    if 'pivot' in rewrites: m.extend([(None,match,None) for match in match_pivot_unfuse(g, matchf, allow_interacting_matches=True, max_unfusions=max_p_unfusions)])
    if 'id_fuse' in rewrites: m.extend([(None,None,match) for match in match_id_fuse(g, matchf, allow_interacting_matches=True)])
    return m

def rewrite_2Q_simp(g: BaseGraph[VT,ET], match: List[MatchUnfuseType]) -> RewriteOutputType[ET,VT]:
    """Perform a 2Q_simp rewrite, given a list of matches as returned by
    ``match_2Q_simp``. A match is itself a tuple where:

    ``m[0]`` : ``lcomp_unfuse`` match, otherwise None.
    ``m[1]`` : ``pivot_unfuse`` match, otherwise None.
    ``m[2]`` : ``id_fuse`` match, otherwise None.
    """
    if match[0][0]: return lcomp_unfuse(g,[match[0][0]])
    if match[0][1]: return pivot_unfuse(g,[match[0][1]])
    if match[0][2]: return id_fuse(g,[match[0][2]])