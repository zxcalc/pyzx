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

__all__ = ['check_supplementarity_for_simp',
           'check_supplementarity_for_apply',
           'safe_apply_supplementarity',
           'simp_supplementarity'
           ]


from typing import Tuple, List, Dict, Set, FrozenSet
from typing import Optional
from typing_extensions import Literal
from pyzx.symbolic import Poly
from pyzx.graph.base import BaseGraph, VT, ET

MatchSupplementarityType = Tuple[VT, VT, Literal[1, 2], FrozenSet[VT]]

def check_supplementarity_for_simp(g: BaseGraph[VT,ET]) -> bool:
    matches = match_supplementarity(g)
    return len(matches) != 0

def check_supplementarity_for_apply(g: BaseGraph[VT,ET], v: VT, w: VT) -> bool:
    matches = match_supplementarity(g, [v, w])
    return len(matches) != 0

def match_supplementarity(g: BaseGraph[VT,ET], vertices: Optional[List[VT]]=None) -> List[MatchSupplementarityType[VT]]:
    """Finds pairs of non-Clifford spiders that are connected to exactly the same set of vertices.

    :param g: An instance of a ZX-graph.
    :rtype: List of 4-tuples ``(vertex1, vertex2, type of supplementarity, neighbors)``.
    :param vertices: An optional list of vertices.
    """
    if vertices is not None: candidates = set(vertices)
    else: candidates = g.vertex_set()
    phases = g.phases()

    parities: Dict[FrozenSet[VT],List[VT]] = dict()
    m: List[MatchSupplementarityType[VT]] = []
    taken: Set[VT] = set()
    # First we find all the non-Clifford vertices and their list of neighbors
    while len(candidates) > 0:
        v = candidates.pop()
        if phases[v] == 0 or (not isinstance(phases[v], Poly) and phases[v].denominator <= 2): continue # Skip Clifford vertices
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
            if phases[w] == 0 or (not isinstance(phases[w], Poly) and phases[w].denominator <= 2) or w in taken: continue
            diff = neigh.symmetric_difference(g.neighbors(w))
            if len(diff) == 2: # Perfect overlap
                if (phases[v] + phases[w]) % 2 == 0 or (phases[v] - phases[w]) % 2 == 1:
                    m.append((v,w,2,frozenset(neigh.difference({w}))))
                    taken.update({v,w})
                    taken.update(neigh)
                    candidates.difference_update(neigh)
                    break
    return m

def simp_supplementarity(g: BaseGraph[VT,ET]) -> bool:
    matches = match_supplementarity(g)
    return unsafe_apply_supplementarity(g, matches)

def safe_apply_supplementarity(g: BaseGraph[VT,ET], v: VT, w: VT) -> bool:
    matches = match_supplementarity(g, [v, w])
    return unsafe_apply_supplementarity(g, matches)

def unsafe_apply_supplementarity(
        g: BaseGraph[VT,ET],
        matches: List[MatchSupplementarityType[VT]]
        ) -> bool:
    """Given the output of :func:``match_supplementarity``, removes non-Clifford spiders that act on the same set of targets trough supplementarity."""
    rem: List[VT] = []
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


    g.remove_vertices(rem)
    g.remove_isolated_vertices()

    return True


