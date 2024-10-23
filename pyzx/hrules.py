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

from fractions import Fraction
from itertools import combinations
from typing import Dict, List, Tuple, Callable, Optional, Set, FrozenSet
from .utils import EdgeType, VertexType, toggle_edge, toggle_vertex, FractionLike, FloatInt, vertex_is_zx
from .simplify import *
from .graph.base import BaseGraph, ET, VT, upair
from . import rules

def is_hadamard(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Returns whether the vertex v in graph g is a Hadamard gate."""
    if g.type(v) != VertexType.H_BOX: return False
    if g.phase(v) != 1: return False
    if g.vertex_degree(v) != 2: return False
    return True

def replace_hadamard(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Replaces a Hadamard gate with a Hadamard edge."""
    if not is_hadamard(g, v): return False
    n1,n2 = g.neighbors(v)
    et1 = g.edge_type(g.edge(v,n1))
    et2 = g.edge_type(g.edge(v,n2))
    if et1 == et2: # both connecting edges are HADAMARD or SIMPLE
        g.add_edge((n1,n2), EdgeType.HADAMARD)
    else:
        g.add_edge((n1,n2), EdgeType.SIMPLE)
    g.remove_vertex(v)
    g.scalar.add_power(1) # Correct for the sqrt(2) difference in H-boxes and H-edges
    return True

def had_edge_to_hbox(g: BaseGraph[VT,ET], e: ET) -> bool:
    """Converts a Hadamard edge to a Hadamard gate.
    Note that while this works with multigraphs, it will put the new H-box in the middle of the vertices,
    so that the diagram might look wrong.
    """
    et = g.edge_type(e)
    if et != EdgeType.HADAMARD: return False
    s,t = g.edge_st(e)
    rs = g.row(s)
    rt = g.row(t)
    qs = g.qubit(s)
    qt = g.qubit(t)
    g.remove_edge(e)
    h = g.add_vertex(VertexType.H_BOX)
    g.scalar.add_power(-1) # Correct for sqrt(2) scalar difference in H-edge and H-box.
    g.add_edge((s, h),EdgeType.SIMPLE)
    g.add_edge((h, t),EdgeType.SIMPLE)
    
    if qs == qt:
        g.set_qubit(h, qs)
    else:
        q = (qs + qt) / 2
        if round(q) == q: q += 0.5
        g.set_qubit(h, q)
    g.set_row(h, (rs + rt) / 2)
    return True
    

def match_hadamards(g: BaseGraph[VT,ET],
        vertexf: Optional[Callable[[VT],bool]] = None
        ) -> List[VT]:
    """Matches all the H-boxes with arity 2 and phase 1, i.e. all the Hadamard gates."""
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    m : Set[VT] = set()
    ty = g.types()
    taken: Set[VT] = set()
    for v in candidates:
        if ty[v] == VertexType.H_BOX and g.vertex_degree(v) == 2 and g.phase(v) == 1:
            n1,n2 = g.neighbors(v)
            if n1 in taken or n2 in taken: continue
            if n1 not in m and n2 not in m: 
                m.add(v)
                taken.add(n1)
                taken.add(n2)

    return list(m)

def hadamard_to_h_edge(g: BaseGraph[VT,ET], matches: List[VT]) -> rules.RewriteOutputType[VT,ET]:
    """Converts a matching of H-boxes with arity 2 and phase 1, i.e. Hadamard gates, to Hadamard edges."""
    rem_verts = []
    etab: Dict[Tuple[VT,VT], List[int]] = {}
    for v in matches:
        rem_verts.append(v)
        w1,w2 = list(g.neighbors(v))
        et1 = g.edge_type(g.edge(w1,v))
        et2 = g.edge_type(g.edge(w2,v))
        if et1 == et2:
            etab[upair(w1,w2)] = [0,1]
        else:
            etab[upair(w1,w2)] = [1,0]
    g.scalar.add_power(len(matches)) # Correct for the sqrt(2) difference in H-boxes and H-edges
    return (etab, rem_verts, [], True)

def match_connected_hboxes(g: BaseGraph[VT,ET],
        edgef: Optional[Callable[[ET],bool]] = None
        ) -> List[ET]:
    """Matches Hadamard-edges that are connected to H-boxes, as these can be fused,
    see the rule (HS1) of https://arxiv.org/pdf/1805.02175.pdf."""
    if edgef is not None: candidates = set([e for e in g.edges() if edgef(e)])
    else: candidates = g.edge_set()
    m : Set[ET] = set()
    ty = g.types()
    while candidates:
        e = candidates.pop()
        if g.edge_type(e) != EdgeType.HADAMARD: continue
        v1,v2 = g.edge_st(e)
        if ty[v1] != VertexType.H_BOX or ty[v2] != VertexType.H_BOX: continue
        if g.phase(v1) != 1 and g.phase(v2) != 1: continue
        m.add(e)
        candidates.difference_update(g.incident_edges(v1))
        candidates.difference_update(g.incident_edges(v2))
    return list(m)

def fuse_hboxes(g: BaseGraph[VT,ET], matches: List[ET]) -> rules.RewriteOutputType[VT,ET]:
    """Fuses two neighboring H-boxes together. 
    See rule (HS1) of https://arxiv.org/pdf/1805.02175.pdf."""
    rem_verts = []
    etab: Dict[Tuple[VT,VT], List[int]] = {}
    for e in matches:
        v1, v2 = g.edge_st(e)
        if g.phase(v2) != 1: # at most one of v1 and v2 has a phase different from 1
            v1, v2 = v2, v1
        rem_verts.append(v2)
        g.scalar.add_power(1)
        for n in g.neighbors(v2):
            if n == v1: continue
            e2 = g.edge(v2,n)
            if g.edge_type(e2) == EdgeType.SIMPLE:
                etab[upair(v1,n)] = [1,0]
            else:
                etab[upair(v1,n)] = [0,1]

    return (etab, rem_verts, [], True)



MatchCopyType = Tuple[VT,VT,VertexType,FractionLike,FractionLike,List[ET]]

def match_copy(
        g: BaseGraph[VT,ET], 
        vertexf:Optional[Callable[[VT],bool]]=None
        ) -> List[MatchCopyType[VT, ET]]:
    """Finds arity-1 spiders (with a 0 or pi phase) that can be copied through their neighbor.""" 
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    phases = g.phases()
    types = g.types()
    m = []
    taken: Set[VT] = set()

    while len(candidates) > 0:
        v = candidates.pop()
        if phases[v] not in (0,1) or types[v] == VertexType.BOUNDARY or g.vertex_degree(v) != 1:
                    continue
        w = list(g.neighbors(v))[0]
        if w in taken: continue
        tv = types[v]
        if tv == VertexType.H_BOX: tv = VertexType.Z # v is arity 1, so we can treat it as a Z spider
        tw = types[w]
        if tw == VertexType.BOUNDARY: continue
        e = g.edge(v,w)
        et = g.edge_type(e)
        copy_type: VertexType = VertexType.Z
        if vertex_is_zx(tv):
            if vertex_is_zx(tw):
                if et == EdgeType.HADAMARD:
                    if tw != tv: continue
                    copy_type = toggle_vertex(tv)
                else:
                    if tw == tv: continue
                    copy_type = tv
            elif tw == VertexType.H_BOX:
                # X pi/0 can always copy through H-box
                # But if v is Z, then it can only copy if the phase is 1
                if et == EdgeType.HADAMARD:
                    if tv == VertexType.Z:
                        if phases[v] == 1: copy_type = VertexType.BOUNDARY # We don't actually copy in this case
                        else: copy_type = VertexType.Z
                    else:
                        if phases[v] != 1: continue
                        copy_type = VertexType.X
                else:
                    if tv == VertexType.X:
                        if phases[v] == 1: copy_type = VertexType.BOUNDARY # We don't actually copy in this case
                        else: copy_type = VertexType.Z
                    else:
                        if phases[v] != 1: continue
                        copy_type = VertexType.X
            else:
                continue
        else:
            continue
        neigh = [n for n in g.neighbors(w) if n != v]
        neigh_edges = [e for e in g.incident_edges(w) if v not in g.edge_st(e)]
        m.append((v,w,copy_type,phases[v],phases[w],neigh_edges))
        candidates.discard(w)
        candidates.difference_update(neigh)
        taken.add(w)
        taken.update(neigh)

    return m

def apply_copy(
        g: BaseGraph[VT,ET],
        matches: List[MatchCopyType[VT, ET]]
        ) -> rules.RewriteOutputType[VT,ET]:
    """Copy arity-1 spider through their neighbor."""
    rem = []
    types = g.types()
    for v,w,copy_type,a,alpha,neigh_edges in matches:
        rem.append(v)
        if copy_type == VertexType.BOUNDARY:
            g.scalar.add_power(1)
            continue # Don't have to do anything more for this case
        rem.append(w)
        if vertex_is_zx(types[w]):
            if a: g.scalar.add_phase(alpha)
            g.scalar.add_power(-(len(neigh_edges)-1))
        else: #types[w] == H_BOX
            if copy_type == VertexType.Z:
                g.scalar.add_power(1)
            else:
                g.scalar.add_power(-(len(neigh_edges)-2))
                if alpha != 1:
                    g.scalar.add_power(-2)
                    g.scalar.add_node(alpha+1)
        for edge in neigh_edges:
            st = g.edge_st(edge)
            n = st[0] if st[1] == w else st[1]
            r = 0.7*g.row(w) + 0.3*g.row(n)
            q = 0.7*g.qubit(w) + 0.3*g.qubit(n)

            u = g.add_vertex(copy_type, q, r, a)
            et = g.edge_type(edge)
            g.add_edge((n,u), et)

    return ({}, rem, [], True)


def is_NOT_gate(g, v, n1, n2):
    """Returns whether the vertex v in graph g is a NOT gate between its neighbours n1 and n2."""
    if g.edge_type(g.edge(n1,v)) == EdgeType.SIMPLE and g.type(v) == VertexType.X: 
        if g.edge_type(g.edge(n2,v)) != EdgeType.SIMPLE:
            return False
    elif g.edge_type(g.edge(n1,v)) == EdgeType.HADAMARD and g.type(v) == VertexType.Z: 
        if g.edge_type(g.edge(n2,v)) != EdgeType.HADAMARD:
            return False
    else:
        return False
    return True


def match_hbox_parallel_not(
        g: BaseGraph[VT,ET], 
        vertexf:Optional[Callable[[VT],bool]]=None
        ) -> List[Tuple[VT,VT,VT]]:
    """Finds H-boxes that are connected to a Z-spider both directly and via a NOT.""" 
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    phases = g.phases()
    types = g.types()
    m = []

    while len(candidates) > 0:
        h = candidates.pop()
        if types[h] != VertexType.H_BOX or phases[h] != 1: continue

        for n in g.neighbors(h):
            if g.vertex_degree(n) != 2 or phases[n] != 1: continue # If it turns out to be useful, this rule can be generalised to allow spiders of arbitrary phase here
            v = [v for v in g.neighbors(n) if v != h][0] # The other neighbor of n
            if not g.connected(v,h): continue
            if not is_NOT_gate(g,n,h,v):
                continue
            break
        else:
            continue
        # h is connected to both v and n in the appropriate way, and n is a NOT that is connected to v as well
        m.append((h,v,n))
        candidates.difference_update(g.neighbors(h))
    return m

def hbox_parallel_not_remove(g: BaseGraph[VT,ET], 
        matches: List[Tuple[VT,VT,VT]]
        ) -> rules.RewriteOutputType[VT,ET]:
    """If a Z-spider is connected to an H-box via a regular wire and a NOT, then they disconnect, and the H-box is turned into a Z-spider."""
    rem = []
    etab: Dict[Tuple[VT,VT], List[int]] = {}
    types = g.types()
    for h, v, n in matches:
        rem.append(h)
        rem.append(n)
        for w in g.neighbors(h):
            if w == v or w == n: continue
            et = g.edge_type(g.edge(w,h))
            if types[w] == VertexType.Z and et == EdgeType.SIMPLE: continue
            if types[w] == VertexType.X and et == EdgeType.HADAMARD: continue
            q = 0.6*g.qubit(h) + 0.4*g.qubit(w)
            r = 0.6*g.row(h) + 0.4*g.row(w)
            z = g.add_vertex(VertexType.Z,q,r)
            if et == EdgeType.SIMPLE:
                etab[upair(z,w)] = [1,0]
            else: etab[upair(z,w)] = [0,1]
    return (etab, rem, [], True)


TYPE_MATCH_PAR_HBOX = Tuple[List[VT],List[VT],List[VT]]
def match_par_hbox(
    g: BaseGraph[VT,ET],
    vertexf: Optional[Callable[[VT],bool]] = None
    ) -> List[TYPE_MATCH_PAR_HBOX]:
    """Matches sets of H-boxes that are connected in parallel (via optional NOT gates)
    to the same white spiders."""
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    
    groupings: Dict[Tuple[FrozenSet[VT],FrozenSet[VT]], Tuple[List[VT],List[VT],List[VT]]] = dict()
    ty = g.types()
    for h in candidates:
        if ty[h] != VertexType.H_BOX: continue
        suitable = True
        neighbors_regular = set()
        neighbors_NOT = set()
        NOTs = []
        for v in g.neighbors(h):
            e = g.edge(v,h)
            if g.edge_type(e) == EdgeType.HADAMARD:
                if ty[v] == VertexType.X:
                    neighbors_regular.add(v)
                elif ty[v] == VertexType.Z and g.vertex_degree(v) == 2 and g.phase(v) == 1:
                    w = [w for w in g.neighbors(v) if w!=h][0] # unique other neighbor
                    if ty[w] != VertexType.Z or g.edge_type(g.edge(v,w)) != EdgeType.HADAMARD:
                        suitable = False
                        break
                    neighbors_NOT.add(w)
                    NOTs.append(v)
                else:    
                    suitable = False
                    break
            else: # e == EdgeType.SIMPLE
                if ty[v] == VertexType.Z:
                    neighbors_regular.add(v)
                elif ty[v] == VertexType.X and g.vertex_degree(v) == 2 and g.phase(v) == 1:
                    w = [w for w in g.neighbors(v) if w!=h][0] # unique other neighbor
                    if ty[w] != VertexType.Z or g.edge_type(g.edge(v,w)) != EdgeType.SIMPLE:
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
        else: groupings[group] = ([h],NOTs, [])

    m = []
    for (n_r, n_N), (hs,firstNOTs, NOTs) in groupings.items():
        if len(hs) < 2: continue
        m.append((hs, firstNOTs, NOTs))
    return m

def par_hbox(g: BaseGraph[VT,ET], matches: List[TYPE_MATCH_PAR_HBOX]) -> rules.RewriteOutputType[VT,ET]:
    """Implements the `multiply rule' (M) from https://arxiv.org/abs/1805.02175"""
    rem_verts = []
    for hs, firstNOTs, NOTs in matches:
        p = sum(g.phase(h) for h in hs) % 2
        rem_verts.extend(hs[1:])
        rem_verts.extend(NOTs)
        if p == 0: 
            rem_verts.append(hs[0])
            rem_verts.extend(firstNOTs)
        else: g.set_phase(hs[0], p)
    
    return ({}, rem_verts, [], False)


TYPE_MATCH_PAR_HBOX_INTRO = Tuple[VT,VT,VT,List[VT],Set[VT]]
def match_par_hbox_intro(
    g: BaseGraph[VT,ET],
    vertexf: Optional[Callable[[VT],bool]] = None
    ) -> List[TYPE_MATCH_PAR_HBOX_INTRO]:
    """Matches sets of H-boxes that are connected in parallel (via optional NOT gates)
    to the same white spiders, but with just one NOT different, so that the Intro rule can be applied there."""
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    
    groupings: Dict[FrozenSet[VT], List[Tuple[VT,List[VT],Set[VT],Set[VT],Set[VT]]]] = dict()
    ty = g.types()
    for h in candidates:
        if ty[h] != VertexType.H_BOX: continue
        suitable = True
        neighbors_regular = set()
        neighbors_NOT = set()
        neighbors_single = set()  # Single-arity Z-spiders connected to the H-box.
        NOTs = []
        for v in g.neighbors(h):
            e = g.edge(v,h)
            if g.edge_type(e) == EdgeType.HADAMARD:
                if ty[v] != VertexType.Z or g.vertex_degree(v) != 2 or g.phase(v) != 1: 
                    suitable = False
                    break
                w = [w for w in g.neighbors(v) if w!=h][0]  # unique other neighbor
                if ty[w] != VertexType.Z or g.edge_type(g.edge(v,w)) != EdgeType.HADAMARD:
                    suitable = False
                    break
                neighbors_NOT.add(w)
                NOTs.append(v)
            else: # e == EdgeType.SIMPLE
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
                    w = [w for w in g.neighbors(v) if w!=h][0]  # unique other neighbor
                    if ty[w] != VertexType.Z or g.edge_type(g.edge(v,w)) != EdgeType.SIMPLE:
                        suitable = False
                        break
                    neighbors_NOT.add(w)
                    NOTs.append(v)
        if not suitable: continue
        group = frozenset(neighbors_regular | neighbors_NOT)
        if group not in groupings: 
            groupings[group] = [(h,NOTs, neighbors_regular, neighbors_NOT, neighbors_single)]
            continue
        # There is another H-box with the same set of neighbours
        for h2, NOTs2, neighbors_regular2, neighbors_NOT2, neighbors_single2 in groupings[group]:
            vs = neighbors_regular.symmetric_difference(neighbors_regular2)
            if g.phase(h) != g.phase(h2): continue  # TODO: Allow intro rule with different phases.
            if len(neighbors_single) != len(neighbors_single2): continue  # TODO: Allow different sets of neighbours here.
            if len(vs) != 1: # To use the Intro rule, the H-boxes should differ on exactly one position on where there are NOTs.
                continue
            # We have a match!
            v = vs.pop() 
            break
        else:
            continue
        if v in neighbors_regular2:  # Make it so that h is the vertex that remains
            h,h2 = h2, h
            NOTs2 = NOTs
            neighbors_single2 = neighbors_single
        return [(h,h2,v,NOTs2,neighbors_single2)]
    return []

def par_hbox_intro(g: BaseGraph[VT,ET], matches: List[TYPE_MATCH_PAR_HBOX_INTRO]) -> rules.RewriteOutputType[VT,ET]:
    """Removes an H-box according to the Intro rule (See Section 3.2 of arxiv:2103.06610)."""
    rem_verts = []
    rem_edges = []
    for h, h2, v, NOTs, singles in matches:
        rem_verts.append(h2)
        rem_verts.extend(singles)
        rem_verts.extend(NOTs)
        rem_edges.append(g.edge(h,v))
        g.scalar.add_power(2*len(singles))
    return ({}, rem_verts, rem_edges, True)


def match_zero_hbox(g: BaseGraph[VT,ET]) -> List[VT]:
    """Matches H-boxes that have a phase of 2pi==0."""
    types = g.types()
    phases = g.phases()
    return [v for v in g.vertices() if types[v] == VertexType.H_BOX and phases[v] == 0]

def zero_hbox(g: BaseGraph[VT,ET], m: List[VT]) -> None:
    """Removes H-boxes with a phase of 2pi=0.
    Note that this rule is only semantically correct when all its neighbors are white spiders."""
    g.remove_vertices(m)


hpivot_match_output = List[Tuple[
            VT,
            VT,
            VT,
            List[VT],
            List[VT],
            List[List[VT]],
            List[Tuple[FractionLike,List[VT]]]
            ]]

def match_hpivot(
    g: BaseGraph[VT,ET], matchf=None
    ) -> hpivot_match_output:
    """Finds a matching of the hyper-pivot rule. Note this currently assumes
    hboxes don't have phases.

    :param g: An instance of a ZH-graph.
    :param matchf: An optional filtering function for candidate arity-2 hbox, should
       return True if an hbox should considered as a match. Passing None will
       consider all arity-2 hboxes.
    :rtype: List containing 0 or 1 matches.
    """

    types = g.types()
    phases = g.phases()
    m = []

    min_degree = -1

    for h in g.vertices():
        if not (
            (matchf is None or matchf(h)) and
            g.vertex_degree(h) == 2 and
            types[h] == VertexType.H_BOX and
            phases[h] == 1
        ): continue

        v0, v1 = g.neighbors(h)

        v0n = set(g.neighbors(v0))
        v1n = set(g.neighbors(v1))

        if (len(v0n.intersection(v1n)) > 1): continue

        v0b = [v for v in v0n if types[v] == VertexType.BOUNDARY]
        v0h = [v for v in v0n if types[v] == VertexType.H_BOX and v != h]
        v1b = [v for v in v1n if types[v] == VertexType.BOUNDARY]
        v1h = [v for v in v1n if types[v] == VertexType.H_BOX and v != h]

        # check that at least one of v0 or v1 has all pi phases on adjacent
        # hboxes.
        if not (all(phases[v] == 1 for v in v0h)):
            if not (all(phases[v] == 1 for v in v1h)):
                continue
            else:
                # interchange the roles of v0 <-> v1
                v0,v1 = v1,v0
                v0n,v1n = v1n,v0n
                v0b,v1b = v1b,v0b
                v0h,v1h = v1h,v0h

        v0nn = [list(filter(lambda w : w != v0, g.neighbors(v))) for v in v0h]
        v1nn = [
          (phases[v],
           list(filter(lambda w : w != v1, g.neighbors(v))))
          for v in v1h]


        if not (
            all(all(types[v] == VertexType.Z for v in vs) for vs in v0nn) and
            all(all(types[v] == VertexType.Z for v in vs[1]) for vs in v1nn) and
            len(v0b) + len(v1b) <= 1 and
            len(v0b) + len(v0h) + 1 == len(v0n) and
            len(v1b) + len(v1h) + 1 == len(v1n)
        ): continue

        degree = g.vertex_degree(v0) * g.vertex_degree(v1)

        if min_degree == -1 or degree < min_degree:
            m = [(h, v0, v1, v0b, v1b, v0nn, v1nn)]
            min_degree = degree
    return m


def hpivot(g: BaseGraph[VT,ET], m: hpivot_match_output) -> None:
    if len(m) == 0: return None

    types = g.types()

    # # cache hboxes
    # hboxes = dict()
    # for h in g.vertices():
    #     if types[h] != VertexType.H_BOX: continue
    #     nhd = tuple(sorted(g.neighbors(h)))
    #     hboxes[nhd] = h


    h, v0, v1, v0b, v1b, v0nn, v1nn = m[0]
    g.remove_vertices([v for v in g.neighbors(v0) if types[v] == VertexType.H_BOX])
    g.remove_vertices([v for v in g.neighbors(v1) if types[v] == VertexType.H_BOX])
    g.scalar.add_power(2) # Applying a Fourier Hyperpivot adds a scalar of 2
    
    if len(v0b) == 0:
        g.remove_vertex(v0)
    else:
        e = g.edge(v0, v0b[0])
        g.set_edge_type(e, toggle_edge(g.edge_type(e)))
        v0nn.append([v0])
    
    if len(v1b) == 0:
        g.remove_vertex(v1)
    else:
        e = g.edge(v1, v1b[0])
        g.set_edge_type(e, toggle_edge(g.edge_type(e)))
        v1nn.append((Fraction(1,1), [v1]))

    for phase,ws in v1nn:
        for weight in range(1,len(v0nn)+1):
            phase_mult = int((-2)**(weight-1))
            f_phase = (phase * phase_mult) % 2
            if f_phase == 0: continue
            for vvs in combinations(v0nn, weight):
                us = tuple(sorted(sum(vvs, ws)))

                # TODO: check if this is the right thing to do (and update scalar)
                if len(us) == 0: continue

                # if us in hboxes:
                #     h0 = hboxes[us]
                #     print("adding %s to %s" % (f_phase, g.phase(h0)))
                #     g.add_to_phase(h0, f_phase)
                # else:
                h0 = g.add_vertex(VertexType.H_BOX)
                g.set_phase(h0, f_phase)
                q: FloatInt = 0
                r: FloatInt = 0
                for u in us:
                    q += g.qubit(u)
                    r += g.row(u)
                    g.add_edge((h0,u))
                g.set_qubit(h0, q / len(us) - 0.4)
                g.set_row(h0, r / len(us) + 0.4)