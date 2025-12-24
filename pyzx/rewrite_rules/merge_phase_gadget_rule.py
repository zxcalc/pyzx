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
This module contains the implementation of the phase gadgets merging rule.
This rule acts on an entire graph and the matcher modifies the graph, so this rule should only be run
using the using simplify.gadget_simp(g) or simplify.gadget_simp.apply(g).
"""

from typing import Tuple, List, Dict, FrozenSet
from typing import Optional

from pyzx.utils import  FractionLike, phase_is_pauli
from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.symbolic import Poly


__all__ = ['merge_phase_gadgets_for_simp',
        'merge_phase_gadgets_for_apply']

MatchGadgetType = Tuple[VT,VT,FractionLike,List[VT],List[VT]]

def merge_phase_gadgets_for_simp(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_phase_gadgets` and if any matches are found runs :func:`merge_phase_gadgets`"""
    matches = match_phase_gadgets(g)
    if len(matches) == 0: return False
    return merge_phase_gadgets(g, matches)

def merge_phase_gadgets_for_apply(g: BaseGraph[VT,ET], vertices: List[VT]) -> bool:
    """Runs :func:`match_phase_gadgets` on the input vertices and if any matches are found runs :func:`merge_phase_gadgets`"""
    checked_vertices = list([v for v in g.vertices() if (v in vertices)])
    matches = match_phase_gadgets(g, checked_vertices)
    if len(matches) == 0: return False
    return merge_phase_gadgets(g, matches)

def match_phase_gadgets(g: BaseGraph[VT,ET], vertices:Optional[List[VT]]=None) -> List[MatchGadgetType[VT]]:
    """Determines which phase gadgets act on the same vertices, so that they can be fused together.

    :param g: An instance of a ZX-graph.
    :rtype: List of 5-tuples ``(axel,leaf, total combined phase, other axels with same targets, other leafs)``.
    .. warning:: Matcher function modifies the graph. Do not run multiple times without calling the applier between calls.
    """
    if vertices is not None: candidates = set(vertices)
    else: candidates = g.vertex_set()

    phases = g.phases()

    parities: Dict[FrozenSet[VT], List[VT]] = dict()
    gadgets: Dict[VT,VT] = dict()
    inputs = g.inputs()
    outputs = g.outputs()
    # First we find all the phase-gadgets, and the list of vertices they act on
    for v in candidates:
        if isinstance(phases[v], Poly):
            non_clifford = True
        else:
            non_clifford = phases[v] != 0 and getattr(phases[v], 'denominator', 1) > 2
        if non_clifford and len(list(g.neighbors(v)))==1:
            n = list(g.neighbors(v))[0]
            if not phase_is_pauli(phases[n]): continue # Not a real phase gadget (happens for scalar diagrams)
            if n in gadgets: continue # Not a real phase gadget (happens for scalar diagrams)
            if n in inputs or n in outputs: continue # Not a real phase gadget (happens for non-unitary diagrams)
            gadgets[n] = v
            par = frozenset(set(g.neighbors(n)).difference({v}))
            if par == frozenset(): continue # Not a real phase gadget if it acts on nothing
            if par in parities: parities[par].append(n)
            else: parities[par] = [n]

    m: List[MatchGadgetType[VT]] = []
    for par, gad in parities.items():
        if len(gad) == 1:
            n = gad[0]
            v = gadgets[n]
            if phases[n] != 0: # If the phase of the axel vertex is pi, we change the phase of the gadget
                g.scalar.add_phase(phases[v])
                g.phase_negate(v)
                m.append((v,n,-phases[v],[],[]))
        else:
            totphase = sum((1 if phases[n]==0 else -1)*phases[gadgets[n]] for n in gad)%2
            for n in gad:
                if phases[n] != 0:
                    g.scalar.add_phase(phases[gadgets[n]])
                    g.phase_negate(gadgets[n])
            g.scalar.add_power(-((len(par)-1)*(len(gad)-1)))
            n = gad.pop()
            v = gadgets[n]
            m.append((v,n,totphase, gad, [gadgets[n] for n in gad]))
    return m

def merge_phase_gadgets(g: BaseGraph[VT,ET], matches: List[MatchGadgetType[VT]]) -> bool:
    """Given the output of :func:``match_phase_gadgets``, removes phase gadgets that act on the same set of targets."""
    rem: List[VT] = []


    for v, n, phase, othergadgets, othertargets in matches:
        g.set_phase(v, phase)
        g.set_phase(n, 0)
        rem.extend(othergadgets)
        rem.extend(othertargets)
        for w in othertargets:
            g.fuse_phases(v,w)
            if g.merge_vdata is not None:
                g.merge_vdata(v, w)

    g.remove_vertices(rem)
    return True

