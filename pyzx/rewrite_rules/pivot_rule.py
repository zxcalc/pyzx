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


__all__ = [
        'check_pivot_parallel',
        'pivot',
        'unsafe_pivot',
        'check_pivot_boundary_for_apply',
        'check_pivot_boundary_for_simp',
        'pivot_boundary_for_simp',
        'pivot_boundary_for_apply',
        'check_pivot_gadget_for_apply',
        'check_pivot_gadget_for_simp',
        'pivot_gadget_for_simp',
        'pivot_gadget_for_apply'
        ]


from typing import Tuple, List, Dict, Set, Optional

from collections import Counter
from fractions import Fraction

from pyzx.utils import VertexType, EdgeType, phase_is_pauli, phase_is_clifford
from pyzx.graph.base import BaseGraph, VT, ET

MatchPivotType = Tuple[Tuple[VT,VT],Tuple[List[VT],List[VT]]]


def boundary_list_for_vertex(
        g: BaseGraph[VT,ET],
        v0: VT
) -> Optional[List[VT]]:
    types = g.types()
    v0n = list(g.neighbors(v0))
    v0b: List[VT] = []
    for n in v0n:
        if len(list(g.edges(v0,n))) != 1:
            return None
        et = g.edge_type(g.edge(v0,n))
        if types[n] == VertexType.Z and et == EdgeType.HADAMARD: pass
        elif types[n] == VertexType.BOUNDARY: v0b.append(n)
        else: return None
    return v0b


def check_pivot_parallel(
        g: BaseGraph[VT,ET],
        v0: VT,
        v1: VT
        ) -> bool:
    """Checks if an edge can be simplified using the pivot rule.

    :param g: An instance of a ZX-graph.
    :param v0: The source vertex of the edge to check.
    :param v1: The target vertex of the edge  to check.
    """

    types = g.types()
    phases = g.phases()
    if not (v0 in g.vertices() and v1 in g.vertices()): return False
    if not g.connected(v0,v1): return False

    if g.edge_type(g.edge(v0, v1)) != EdgeType.HADAMARD: return False

    if not (types[v0] == VertexType.Z and types[v1] == VertexType.Z): return False

    v0a = phases[v0]
    v1a = phases[v1]
    if not ((v0a in (0,1)) and (v1a in (0,1))): return False
    if g.is_ground(v0) or g.is_ground(v1):
        return False

    maybe_v0b = boundary_list_for_vertex(g, v0)
    if maybe_v0b is None: return False
    b0: List[VT] = maybe_v0b

    maybe_v1b = boundary_list_for_vertex(g, v1)
    if maybe_v1b is None: return False
    b1: List[VT] = maybe_v1b

    return len(b0) + len(b1) <= 1


def check_pivot_boundary_for_apply(g: BaseGraph[VT,ET], v: VT, w:VT) -> bool:
    matches = match_pivot_boundary(g, [v, w])
    return len(matches) != 0

def check_pivot_boundary_for_simp(g: BaseGraph[VT,ET]) -> bool:
    return True

def pivot_boundary_for_simp(g: BaseGraph[VT,ET]) -> bool:
    matches = match_pivot_boundary(g)
    return pivot_NOT_REWORKED(g, matches)

def pivot_boundary_for_apply(g: BaseGraph[VT,ET], v: VT, w:VT) -> bool:
    matches = match_pivot_boundary(g, [v, w])
    return pivot_NOT_REWORKED(g, matches)


def check_pivot_gadget_for_apply(g: BaseGraph[VT,ET], v: VT, w:VT) -> bool:
    matches = match_pivot_gadget(g, [v, w])
    return len(matches) != 0

def check_pivot_gadget_for_simp(g: BaseGraph[VT,ET]) -> bool:
    return True

def pivot_gadget_for_simp(g: BaseGraph[VT,ET]) -> bool:
    matches = match_pivot_gadget(g)
    return pivot_NOT_REWORKED(g, matches)

def pivot_gadget_for_apply(g: BaseGraph[VT,ET], v: VT, w:VT) -> bool:
    matches = match_pivot_gadget(g, [v, w])
    return pivot_NOT_REWORKED(g, matches)

def match_pivot_boundary(
        g: BaseGraph[VT,ET],
        vertices: Optional[List[VT]] = None,
        num:int=-1) -> List[MatchPivotType[VT]]:
    """Like :func:`match_pivot_parallel`, but except for pairings of
    Pauli vertices, it looks for a pair of an interior Pauli vertex and a
    boundary non-Pauli Clifford vertex in order to gadgetize the non-Pauli vertex."""
    if vertices is not None: candidates = set(vertices)
    else: candidates = g.vertex_set()
    types = g.types()
    phases = g.phases()
    rs = g.rows()

    edge_list: List[Tuple[VT,VT]] = []
    consumed_vertices : Set[VT] = set()
    i = 0
    m: List[MatchPivotType[VT]] = []
    inputs = g.inputs()
    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        if types[v] != VertexType.Z or not phase_is_pauli(phases[v]) or g.is_ground(v):
            continue

        good_vert = True
        w = None
        bound = None
        for n in g.neighbors(v):
            if types[n] != VertexType.Z:
                good_vert = False
                break
            if len(g.neighbors(n)) == 1: # v is a phase gadget
                good_vert = False
                break
            if n in consumed_vertices:
                good_vert = False
                break
            if g.is_ground(n) in consumed_vertices:
                good_vert = False
                break
            boundaries: List[VT] = []
            wrong_match = False
            for b in g.neighbors(n):
                if types[b] == VertexType.BOUNDARY:
                    boundaries.append(b)
                elif types[b] != VertexType.Z:
                    wrong_match = True
            if len(boundaries) != 1 or wrong_match: # n is not on the boundary,
                continue             # has too many boundaries or has neighbors of wrong type
            if not phase_is_pauli(phases[n]) and phase_is_clifford(phases[n]):
                w = n
                bound = boundaries[0]
            if not w:
                w = n
                bound = boundaries[0]
        if not good_vert or w is None: continue
        if bound in inputs: mod = 0.5
        else: mod = -0.5
        v1 = g.add_vertex(VertexType.Z,-2,rs[w]+mod,phases[w])
        v2 = g.add_vertex(VertexType.Z,-1,rs[w]+mod,0)
        g.set_phase(w, 0)
        g.update_phase_index(w,v1)
        edge_list.append((w,v2))
        edge_list.append((v1,v2))
        for n in g.neighbors(v): consumed_vertices.add(n)
        for n in g.neighbors(w): consumed_vertices.add(n)
        assert bound is not None
        m.append(((v,w),([],[bound])))
        i += 1
        for n in g.neighbors(v): candidates.discard(n)
        for n in g.neighbors(w): candidates.discard(n)

    g.add_edges(edge_list, EdgeType.HADAMARD)
    return m

def match_pivot_gadget(
        g: BaseGraph[VT,ET],
        vertices: Optional[List[ET]] = None,
        num:int=-1) -> List[MatchPivotType[VT]]:
    """Like :func:`match_pivot_parallel`, but except for pairings of
    Pauli vertices, it looks for a pair of an interior Pauli vertex and an
    interior non-Clifford vertex in order to gadgetize the non-Clifford vertex."""
    if vertices is not None: candidates_set = set(g.edge(vertices[0], vertices[1]))

    else: candidates_set = g.edge_set()
    candidates = list(Counter(candidates_set).elements())
    types = g.types()
    phases = g.phases()
    rs = g.rows()

    edge_list: List[Tuple[VT,VT]] = []
    i = 0
    m: List[MatchPivotType[VT]] = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        v0, v1 = g.edge_st(e)

        if not (types[v0] == VertexType.Z and types[v1] == VertexType.Z): continue

        v0a = phases[v0]
        v1a = phases[v1]

        if v0a not in (0,1):
            if v1a in (0,1):
                v0, v1 = v1, v0
                v0a, v1a = v1a, v0a
            else: continue
        elif v1a in (0,1): continue
        # Now v0 has a Pauli phase and v1 has a non-Pauli phase

        if g.is_ground(v0):
            continue

        v0n = list(g.neighbors(v0))
        v1n = list(g.neighbors(v1))
        if len(v1n) == 1: continue # It is a phase gadget
        bad_match = False
        discard_edges: List[ET] = []
        for i,l in enumerate((v0n, v1n)):
            for n in l:
                if types[n] != VertexType.Z:
                    bad_match = True
                    break
                ne = list(g.incident_edges(n))
                if i==0 and len(ne) == 1 and not (e == ne[0]): # v0 is a phase gadget
                    bad_match = True
                    break
                discard_edges.extend(ne)
            if bad_match: break
        if bad_match: continue

        if any(types[w]!=VertexType.Z for w in v0n): continue
        if any(types[w]!=VertexType.Z for w in v1n): continue
        # Both v0 and v1 are interior

        v = g.add_vertex(VertexType.Z,-2,rs[v0],v1a)
        g.set_phase(v1, 0)
        g.set_qubit(v0,-1)
        g.update_phase_index(v1,v)
        edge_list.append((v,v1))

        m.append(((v0,v1),([],[v])))
        i += 1
        for c in discard_edges:
            if c in candidates:
                candidates.remove(c)
    g.add_edges(edge_list,EdgeType.SIMPLE)
    return m


def pivot(g: BaseGraph[VT,ET], v: VT, v1: VT) -> bool:
    if check_pivot_parallel(g, v, v1):
        return unsafe_pivot(g, v, v1)
    return False

def unsafe_pivot(g: BaseGraph[VT,ET], v0: VT, v1: VT) -> bool:
    """Perform a pivoting rewrite, given a list of matches as returned by
    ``match_pivot(_parallel)``. A match is itself a list where:

    ``m[0][0]`` : first vertex in pivot.
    ``m[0][1]`` : second vertex in pivot.
    ``m[1][0]`` : list of zero or one boundaries adjacent to ``m[0]``.
    ``m[1][1]`` : list of zero or one boundaries adjacent to ``m[1]``.
    """
    rem_verts: List[VT] = []
    rem_edges: List[ET] = []
    etab: Dict[Tuple[VT,VT],List[int]] = dict()

    b0: Optional[list[VT]] = boundary_list_for_vertex(g, v0)
    assert b0 is not None
    b1: Optional[list[VT]] = boundary_list_for_vertex(g, v1)
    assert b1 is not None

    m = ((v0, v1), (b0, b1))

    # compute:
    #  n[0] <- non-boundary neighbors of m[0] only
    #  n[1] <- non-boundary neighbors of m[1] only
    #  n[2] <- non-boundary neighbors of m[0] and m[1]
    g.update_phase_index(m[0][0],m[0][1])
    n = [set(g.neighbors(m[0][0])), set(g.neighbors(m[0][1]))]
    for i in range(2):
        n[i].remove(m[0][1-i])
        if len(m[1][i]) == 1: n[i].remove(m[1][i][0])
    n.append(n[0] & n[1])
    n[0] = n[0] - n[2]
    n[1] = n[1] - n[2]
    es = ([(s,t) for s in n[0] for t in n[1]] +
          [(s,t) for s in n[1] for t in n[2]] +
          [(s,t) for s in n[0] for t in n[2]])
    k0, k1, k2 = len(n[0]), len(n[1]), len(n[2])
    g.scalar.add_power(k0*k2 + k1*k2 + k0*k1)

    for v in n[2]:
        if not g.is_ground(v):
            g.add_to_phase(v, 1)

    if g.phase(m[0][0]) and g.phase(m[0][1]): g.scalar.add_phase(Fraction(1))
    if not m[1][0] and not m[1][1]:
        g.scalar.add_power(-(k0+k1+2*k2-1))
    elif not m[1][0]:
        g.scalar.add_power(-(k1+k2))
    else: g.scalar.add_power(-(k0+k2))

    for i in 0, 1:
        # if m[i] has a phase, it will get copied on to the neighbors of m[1-i]:
        a = g.phase(m[0][i])
        if a:
            for v in n[1-i]:
                if not g.is_ground(v):
                    g.add_to_phase(v, a)
            for v in n[2]:
                if not g.is_ground(v):
                    g.add_to_phase(v, a)

        if not m[1][i]:
            # if there is no boundary, the other vertex is destroyed
            rem_verts.append(m[0][1-i])
        else:
            # if there is a boundary, toggle whether it is an h-edge or a normal edge
            # and point it at the other vertex
            e = (m[0][i], m[1][i][0])
            new_e = (m[0][1-i], m[1][i][0])
            ne,nhe = etab.get(new_e) or [0,0]
            if g.edge_type(g.edge(e[0],e[1])) == EdgeType.SIMPLE: nhe += 1
            elif g.edge_type(g.edge(e[0],e[1])) == EdgeType.HADAMARD: ne += 1
            etab[new_e] = [ne,nhe]
            rem_edges.append(g.edge(e[0], e[1]))

    for e in es:
        nhe = etab.get(e, (0,0))[1]
        etab[e] = [0,nhe+1]

    g.add_edge_table(etab)
    g.remove_edges(rem_edges)
    g.remove_vertices(rem_verts)
    g.remove_isolated_vertices()

    return True


def pivot_NOT_REWORKED(g: BaseGraph[VT,ET], matches: List[MatchPivotType[VT]]) -> bool:
    """Perform a pivoting rewrite, given a list of matches as returned by
    ``match_pivot(_parallel)``. A match is itself a list where:

    ``m[0][0]`` : first vertex in pivot.
    ``m[0][1]`` : second vertex in pivot.
    ``m[1][0]`` : list of zero or one boundaries adjacent to ``m[0]``.
    ``m[1][1]`` : list of zero or one boundaries adjacent to ``m[1]``.
    """
    rem_verts: List[VT] = []
    rem_edges: List[ET] = []
    etab: Dict[Tuple[VT,VT],List[int]] = dict()

    if len(matches) <= 0: return False

    for m in matches:
        # compute:
        #  n[0] <- non-boundary neighbors of m[0] only
        #  n[1] <- non-boundary neighbors of m[1] only
        #  n[2] <- non-boundary neighbors of m[0] and m[1]
        g.update_phase_index(m[0][0],m[0][1])
        n = [set(g.neighbors(m[0][0])), set(g.neighbors(m[0][1]))]
        for i in range(2):
            n[i].remove(m[0][1-i])
            if len(m[1][i]) == 1: n[i].remove(m[1][i][0])
        n.append(n[0] & n[1])
        n[0] = n[0] - n[2]
        n[1] = n[1] - n[2]
        es = ([(s,t) for s in n[0] for t in n[1]] +
              [(s,t) for s in n[1] for t in n[2]] +
              [(s,t) for s in n[0] for t in n[2]])
        k0, k1, k2 = len(n[0]), len(n[1]), len(n[2])
        g.scalar.add_power(k0*k2 + k1*k2 + k0*k1)

        for v in n[2]:
            if not g.is_ground(v):
                g.add_to_phase(v, 1)

        if g.phase(m[0][0]) and g.phase(m[0][1]): g.scalar.add_phase(Fraction(1))
        if not m[1][0] and not m[1][1]:
            g.scalar.add_power(-(k0+k1+2*k2-1))
        elif not m[1][0]:
            g.scalar.add_power(-(k1+k2))
        else: g.scalar.add_power(-(k0+k2))

        for i in 0, 1:
            # if m[i] has a phase, it will get copied on to the neighbors of m[1-i]:
            a = g.phase(m[0][i])
            if a:
                for v in n[1-i]:
                    if not g.is_ground(v):
                        g.add_to_phase(v, a)
                for v in n[2]:
                    if not g.is_ground(v):
                        g.add_to_phase(v, a)

            if not m[1][i]:
                # if there is no boundary, the other vertex is destroyed
                rem_verts.append(m[0][1-i])
            else:
                # if there is a boundary, toggle whether it is an h-edge or a normal edge
                # and point it at the other vertex
                e = (m[0][i], m[1][i][0])
                new_e = (m[0][1-i], m[1][i][0])
                ne,nhe = etab.get(new_e) or [0,0]
                if g.edge_type(g.edge(e[0],e[1])) == EdgeType.SIMPLE: nhe += 1
                elif g.edge_type(g.edge(e[0],e[1])) == EdgeType.HADAMARD: ne += 1
                etab[new_e] = [ne,nhe]
                rem_edges.append(g.edge(e[0], e[1]))


        for e in es:
            nhe = etab.get(e, (0,0))[1]
            etab[e] = [0,nhe+1]

    g.add_edge_table(etab)
    g.remove_edges(rem_edges)
    g.remove_vertices(rem_verts)
    g.remove_isolated_vertices()

    return True
