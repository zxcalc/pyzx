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
This module contains the implementation of the gadget phasepoly rule. 
This finds 4 groups of phase-gadgets that act on the same set of 4 vertices 
in order to apply a rewrite based on rule R_13 of 
the paper *A Finite Presentation of CNOT-Dihedral Operators*.

This rule acts on an entire graph and should only be called using the using
simplify.gadget_phasepoly_simp(g).
"""

__all__ = ['gadgets_phasepoly_for_simp',
           'gadgets_phasepoly_for_apply']

from typing import Tuple, List, Dict, Set, FrozenSet
from typing import Union

from fractions import Fraction
import itertools

from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, VT, ET


MatchPhasePolyType = Tuple[List[VT], Dict[FrozenSet[VT],Union[VT,Tuple[VT,VT]]]]



def match_gadgets_phasepoly(g: BaseGraph[VT,ET]) -> List[MatchPhasePolyType[VT]]:
    """Finds 4 groups of phase-gadgets that act on the same set of 4 vertices in order to apply a rewrite based on
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


def gadgets_phasepoly_for_apply(g: BaseGraph[VT,ET], vertices: List[VT]) -> bool:
    """Dummy function, do not use"""
    return False

def gadgets_phasepoly_for_simp(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_gadgets_phasepoly` and if any matches are found runs :func:`apply_gadget_phasepoly`"""
    matches = match_gadgets_phasepoly(g)
    if (len(matches)==0): return False
    return apply_gadget_phasepoly(g, matches)


def apply_gadget_phasepoly(g: BaseGraph[VT,ET], matches: List[MatchPhasePolyType[VT]]) -> bool:
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
                    g.add_edges([(n,v),(v1,n),(v2,n)],EdgeType.HADAMARD)
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
                        g.add_edges([(n,v),(v1,n),(v2,n),(v3,n)],EdgeType.HADAMARD)
                    g.set_phase(v, phase + Fraction(1,4))
        f = frozenset(group)
        if f in gadgets:
            n,v = gadgets[f] # type: ignore
            phase = phases[v]
            if phases[n]:
                phase = -phase
                g.set_phase(n,0)
        else:
            n = g.add_vertex(VertexType.Z, -1, rs[group[0]]+0.5)
            v = g.add_vertex(VertexType.Z, -2, rs[group[0]]+0.5)
            phase = 0
            g.add_edges([(n,v)]+[(n,w) for w in group],EdgeType.HADAMARD)
        g.set_phase(v, phase + Fraction(7,4))

    return True
