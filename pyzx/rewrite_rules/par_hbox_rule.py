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
This module contains the implementation of two parallel hbox rules: multiply rule and intro rule.
These rules act on an entire graph and should be called using hsimplify.par_hbox_simp and hsimplify.par_hbox_intro_simp

These rules are based on the axioms of the corresponding name in the paper https://arxiv.org/abs/2103.06610
"""

__all__ = ['check_par_hbox_for_simp',
           'par_hbox',
           'simp_par_hbox',
           'check_par_hbox_intro_for_simp',
           'simp_par_hbox_intro',
           'par_hbox_intro',]


from typing import Dict, List, Tuple, Optional, Set, FrozenSet
from pyzx.utils import EdgeType, VertexType, hbox_has_complex_label
from pyzx.graph.base import BaseGraph, ET, VT


## Multiply rule:


def check_par_hbox_for_simp(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_par_hbox` and returns whether any matches were found."""
    matches = match_par_hbox(g)
    return len(matches) > 0

def simp_par_hbox(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_par_hbox` and if any matches are found runs :func:`unsafe_par_hbox`"""
    matches = match_par_hbox(g)
    if len(matches) == 0: return False
    return unsafe_par_hbox(g, matches)

def par_hbox(g: BaseGraph[VT,ET], vertices: List[VT]) -> bool:
    """Runs :func:`match_par_hbox` on given vertices and if any matches are found runs :func:`unsafe_par_hbox`"""
    checked_vertices = list([v for v in g.vertices() if (v in vertices)])
    matches = match_par_hbox(g, checked_vertices)
    if len(matches) == 0: return False
    return unsafe_par_hbox(g, matches)


TYPE_MATCH_PAR_HBOX = Tuple[List[VT],List[VT],List[VT]]

def match_par_hbox(
        g: BaseGraph[VT, ET],
        vertices: Optional[List[VT]] = None) -> List[TYPE_MATCH_PAR_HBOX]:
    """Matches sets of H-boxes that are connected in parallel (via optional NOT gates)
    to the same white spiders."""
    if vertices is not None: candidates = set(vertices)
    else: candidates = g.vertex_set()

    groupings: Dict[Tuple[FrozenSet[VT], FrozenSet[VT]], Tuple[List[VT], List[VT], List[VT]]] = dict()
    ty = g.types()
    for h in candidates:
        if ty[h] != VertexType.H_BOX: continue
        if hbox_has_complex_label(g, h): continue
        suitable = True
        neighbors_regular = set()
        neighbors_NOT = set()
        NOTs = []
        for v in g.neighbors(h):
            e = g.edge(v, h)
            if g.edge_type(e) == EdgeType.HADAMARD:
                if ty[v] == VertexType.X:
                    neighbors_regular.add(v)
                elif ty[v] == VertexType.Z and g.vertex_degree(v) == 2 and g.phase(v) == 1:
                    w = [w for w in g.neighbors(v) if w != h][0]  # unique other neighbor
                    if ty[w] != VertexType.Z or g.edge_type(g.edge(v, w)) != EdgeType.HADAMARD:
                        suitable = False
                        break
                    neighbors_NOT.add(w)
                    NOTs.append(v)
                else:
                    suitable = False
                    break
            else:  # e == EdgeType.SIMPLE
                if ty[v] == VertexType.Z:
                    neighbors_regular.add(v)
                elif ty[v] == VertexType.X and g.vertex_degree(v) == 2 and g.phase(v) == 1:
                    w = [w for w in g.neighbors(v) if w != h][0]  # unique other neighbor
                    if ty[w] != VertexType.Z or g.edge_type(g.edge(v, w)) != EdgeType.SIMPLE:
                        suitable = False
                        break
                    neighbors_NOT.add(w)
                    NOTs.append(v)
                else:
                    suitable = False
                    break
        if not suitable: continue
        group = (frozenset(neighbors_regular), frozenset(neighbors_NOT))
        if group in groupings:
            groupings[group][0].append(h)
            groupings[group][2].extend(NOTs)
        else:
            groupings[group] = ([h], NOTs, [])

    m = []
    for (n_r, n_N), (hs, firstNOTs, NOTs) in groupings.items():
        if len(hs) < 2: continue
        m.append((hs, firstNOTs, NOTs))
    return m

def unsafe_par_hbox(g: BaseGraph[VT, ET], matches: List[TYPE_MATCH_PAR_HBOX]) -> bool:
    """Implements the `multiply rule' (M) from https://arxiv.org/abs/1805.02175"""
    rem_verts = []
    for hs, firstNOTs, NOTs in matches:
        p = sum(g.phase(h) for h in hs) % 2
        rem_verts.extend(hs[1:])
        rem_verts.extend(NOTs)
        if p == 0:
            rem_verts.append(hs[0])
            rem_verts.extend(firstNOTs)
        else:
            g.set_phase(hs[0], p)

    g.remove_vertices(rem_verts)

    return True


## Intro rule:

def check_par_hbox_intro_for_simp(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_par_hbox_intro` and returns whether any matches were found."""
    matches = match_par_hbox_intro(g)
    return len(matches) != 0

def simp_par_hbox_intro(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_par_hbox_intro` and if any matches are found runs :func:`unsafe_par_hbox_intro`"""
    matches = match_par_hbox_intro(g)
    if len(matches) == 0: return False
    return unsafe_par_hbox_intro(g, matches)

def par_hbox_intro(g: BaseGraph[VT,ET], vertices: List[VT]) -> bool:
    """Runs :func:`match_par_hbox_intro` on given vertices and if any matches are found runs :func:`unsafe_par_hbox_intro`"""
    checked_vertices = list([v for v in g.vertices() if (v in vertices)])
    matches = match_par_hbox_intro(g, checked_vertices)
    if len(matches) == 0: return False
    return unsafe_par_hbox_intro(g, matches)


TYPE_MATCH_PAR_HBOX_INTRO = Tuple[VT, VT, VT, List[VT], Set[VT]]
def match_par_hbox_intro(g: BaseGraph[VT, ET], vertices: Optional[List[VT]]=None) -> List[TYPE_MATCH_PAR_HBOX_INTRO]:
    """Matches sets of H-boxes that are connected in parallel (via optional NOT gates)
    to the same white spiders, but with just one NOT different, so that the Intro rule can be applied there."""
    if vertices is not None: candidates = set(vertices)
    else: candidates = g.vertex_set()

    groupings: Dict[FrozenSet[VT], List[Tuple[VT, List[VT], Set[VT], Set[VT], Set[VT]]]] = dict()
    ty = g.types()
    for h in candidates:
        if ty[h] != VertexType.H_BOX: continue
        if hbox_has_complex_label(g, h): continue
        suitable = True
        neighbors_regular = set()
        neighbors_NOT = set()
        neighbors_single = set()  # Single-arity Z-spiders connected to the H-box.
        NOTs = []
        for v in g.neighbors(h):
            e = g.edge(v, h)
            if g.edge_type(e) == EdgeType.HADAMARD:
                if ty[v] != VertexType.Z or g.vertex_degree(v) != 2 or g.phase(v) != 1:
                    suitable = False
                    break
                w = [w for w in g.neighbors(v) if w != h][0]  # unique other neighbor
                if ty[w] != VertexType.Z or g.edge_type(g.edge(v, w)) != EdgeType.HADAMARD:
                    suitable = False
                    break
                neighbors_NOT.add(w)
                NOTs.append(v)
            else:  # e == EdgeType.SIMPLE
                if ty[v] == VertexType.Z:
                    if g.vertex_degree(v) == 1:
                        if g.phase(v) != 0:
                            suitable = False
                            break
                        neighbors_single.add(v)
                    else:
                        neighbors_regular.add(v)
                else:
                    if ty[v] != VertexType.X or g.vertex_degree(v) != 2 or g.phase(v) != 1:
                        suitable = False
                        break
                    w = [w for w in g.neighbors(v) if w != h][0]  # unique other neighbor
                    if ty[w] != VertexType.Z or g.edge_type(g.edge(v, w)) != EdgeType.SIMPLE:
                        suitable = False
                        break
                    neighbors_NOT.add(w)
                    NOTs.append(v)
        if not suitable: continue
        group = frozenset(neighbors_regular | neighbors_NOT)
        if group not in groupings:
            groupings[group] = [(h, NOTs, neighbors_regular, neighbors_NOT, neighbors_single)]
            continue
        # There is another H-box with the same set of neighbours
        for h2, NOTs2, neighbors_regular2, neighbors_NOT2, neighbors_single2 in groupings[group]:
            vs = neighbors_regular.symmetric_difference(neighbors_regular2)
            if g.phase(h) != g.phase(h2): continue  # TODO: Allow intro rule with different phases.
            if len(neighbors_single) != len(
                neighbors_single2): continue  # TODO: Allow different sets of neighbours here.
            if len(vs) != 1:  # To use the Intro rule, the H-boxes should differ on exactly one position on where there are NOTs.
                continue
            # We have a match!
            v = vs.pop()
            break
        else:
            continue
        if v in neighbors_regular2:  # Make it so that h is the vertex that remains
            h, h2 = h2, h
            NOTs2 = NOTs
            neighbors_single2 = neighbors_single
        return [(h, h2, v, NOTs2, neighbors_single2)]
    return []



def unsafe_par_hbox_intro(g: BaseGraph[VT, ET], matches: List[TYPE_MATCH_PAR_HBOX_INTRO]) -> bool:
    """Removes an H-box according to the Intro rule (See Section 3.2 of arxiv:2103.06610)."""
    rem_verts = []
    rem_edges = []
    for h, h2, v, NOTs, singles in matches:
        rem_verts.append(h2)
        rem_verts.extend(singles)
        rem_verts.extend(NOTs)
        rem_edges.append(g.edge(h, v))
        g.scalar.add_power(2 * len(singles))


    g.remove_edges(rem_edges)
    g.remove_vertices(rem_verts)
    g.remove_isolated_vertices()

    return True
