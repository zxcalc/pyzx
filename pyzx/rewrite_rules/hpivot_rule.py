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
This module contains the implementation of the hpivot rule.

This rule acts on an entire graph and should be called only using simplify.hpivot_simp(g).
"""

__all__ = ['check_hpivot_for_apply',
           'check_hpivot_for_simp',
           'hpivot',
           'simp_hpivot']

from fractions import Fraction
from itertools import combinations
from typing import List, Tuple, Optional
from pyzx.utils import VertexType, toggle_edge, FractionLike, FloatInt
from pyzx.graph.base import BaseGraph, ET, VT


hpivot_match_output = List[Tuple[
    VT,
    VT,
    VT,
    List[VT],
    List[VT],
    List[List[VT]],
    List[Tuple[FractionLike, List[VT]]]
]]

def check_hpivot_for_apply(g: BaseGraph[VT,ET], v: VT, w:VT) -> bool:
    """Dummy function, may have undefined behavior"""
    matches = match_hpivot(g, [v])
    return len(matches) != 0

def check_hpivot_for_simp(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_hpivot` and returns whether any matches were found."""
    matches = match_hpivot(g)
    return len(matches) != 0

def simp_hpivot(g: BaseGraph[VT,ET]) -> bool:
    """Runs :func:`match_hpivot` and if any matches are found runs :func:`unsafe_hpivot`"""
    matches = match_hpivot(g)
    if len(matches) == 0: return False
    return unsafe_hpivot(g, matches)

def hpivot(g: BaseGraph[VT,ET], v: VT, w:VT) -> bool:
    """Dummy function, may have undefined behavior"""
    matches = match_hpivot(g, [v])
    if len(matches) == 0: return False
    return unsafe_hpivot(g, matches)


# hpivot
def match_hpivot(
        g: BaseGraph[VT, ET], vertices: Optional[List[VT]] = None
) -> hpivot_match_output:
    """Finds a matching of the hyper-pivot rule. Note this currently assumes
    hboxes don't have phases.

    :param g: An instance of a ZH-graph.
    :param vertices: An optional filtering function for candidate arity-2 hbox. Passing None will
       consider all arity-2 hboxes.
    :rtype: List containing 0 or 1 matches.
    """

    types = g.types()
    phases = g.phases()
    m = []

    min_degree = -1

    for h in g.vertices():
        if not (
                (vertices is None or (vertices[0] == h)) and
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
                v0, v1 = v1, v0
                v0n, v1n = v1n, v0n
                v0b, v1b = v1b, v0b
                v0h, v1h = v1h, v0h

        v0nn = [list(filter(lambda w: w != v0, g.neighbors(v))) for v in v0h]
        v1nn = [
            (phases[v],
             list(filter(lambda w: w != v1, g.neighbors(v))))
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



def unsafe_hpivot(g: BaseGraph[VT, ET], m: hpivot_match_output) -> bool:


    types = g.types()

    h, v0, v1, v0b, v1b, v0nn, v1nn = m[0]
    g.remove_vertices([v for v in g.neighbors(v0) if types[v] == VertexType.H_BOX])
    g.remove_vertices([v for v in g.neighbors(v1) if types[v] == VertexType.H_BOX])
    g.scalar.add_power(2)  # Applying a Fourier Hyperpivot adds a scalar of 2

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
        v1nn.append((Fraction(1, 1), [v1]))

    for phase, ws in v1nn:
        for weight in range(1, len(v0nn) + 1):
            phase_mult = int((-2) ** (weight - 1))
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
                    g.add_edge((h0, u))
                g.set_qubit(h0, q / len(us) - 0.4)
                g.set_row(h0, r / len(us) + 0.4)

    return True




#
# def check_hpivot(g: BaseGraph[VT, ET], h: VT) -> bool:
#     #change to take only 1 vertex, the h input, which guarantees v0 v1
#     """Finds a matching of the hyper-pivot rule. Note this currently assumes
#     hboxes don't have phases.
#
#     :param g: An instance of a ZH-graph.
#     :param h: A H_box vertex
#     """
#
#     types = g.types()
#     phases = g.phases()
#
#     if not h in g.vertices(): return False
#
#     if not (g.vertex_degree(h) == 2 and
#             types[h] == VertexType.H_BOX and
#             phases[h] == 1
#     ): return False
#
#     v0 = g.neighbors(h)[0]
#     v1 = g.neighbors(h)[1]
#
#     v0n = set(g.neighbors(v0))
#     v1n = set(g.neighbors(v1))
#
#     if len(v0n.intersection(v1n)) > 1: return False
#
#     v0b = [v for v in v0n if types[v] == VertexType.BOUNDARY]
#     v0h = [v for v in v0n if types[v] == VertexType.H_BOX and v != h]
#     v1b = [v for v in v1n if types[v] == VertexType.BOUNDARY]
#     v1h = [v for v in v1n if types[v] == VertexType.H_BOX and v != h]
#
#     # check that at least one of v0 or v1 has all pi phases on adjacent
#     # hboxes.
#     if not (all(phases[v] == 1 for v in v0h)):
#         if not (all(phases[v] == 1 for v in v1h)):
#             return False
#         else:
#             # interchange the roles of v0 <-> v1
#             v0, v1 = v1, v0
#             v0n, v1n = v1n, v0n
#             v0b, v1b = v1b, v0b
#             v0h, v1h = v1h, v0h
#
#
#     v0nn = [list(filter(lambda w: w != v0, g.neighbors(v))) for v in v0h]
#     v1nn = [
#         (phases[v],
#          list(filter(lambda w: w != v1, g.neighbors(v))))
#         for v in v1h]
#
#     if not (
#             all(all(types[v] == VertexType.Z for v in vs) for vs in v0nn) and
#             all(all(types[v] == VertexType.Z for v in vs[1]) for vs in v1nn) and
#             len(v0b) + len(v1b) <= 1 and
#             len(v0b) + len(v0h) + 1 == len(v0n) and
#             len(v1b) + len(v1h) + 1 == len(v1n)
#     ): return False
#
#     return True
#
#
# def hpivot(g: BaseGraph[VT, ET], h: VT, v0: VT, v1: VT) -> bool:
#     if check_hpivot(g, h): return unsafe_hpivot(g, h)
#     return False
#
# def unsafe_hpivot(g: BaseGraph[VT, ET], h: VT) -> bool:
#
#     types = g.types()
#     phases = g.phases()
#
#     v0 = g.neighbors(h)[0]
#     v1 = g.neighbors(h)[1]
#
#     v0n = set(g.neighbors(v0))
#     v1n = set(g.neighbors(v1))
#
#     if len(v0n.intersection(v1n)) > 1: return False
#
#     v0b = [v for v in v0n if types[v] == VertexType.BOUNDARY]
#     v0h = [v for v in v0n if types[v] == VertexType.H_BOX and v != h]
#     v1b = [v for v in v1n if types[v] == VertexType.BOUNDARY]
#     v1h = [v for v in v1n if types[v] == VertexType.H_BOX and v != h]
#
#     v0nn = [list(filter(lambda w: w != v0, g.neighbors(v))) for v in v0h]
#     v1nn = [(phases[v], list(filter(lambda w: w != v1, g.neighbors(v)))) for v in v1h]
#
#     g.remove_vertices([v for v in g.neighbors(v0) if types[v] == VertexType.H_BOX])
#     g.remove_vertices([v for v in g.neighbors(v1) if types[v] == VertexType.H_BOX])
#     g.scalar.add_power(2)  # Applying a Fourier Hyperpivot adds a scalar of 2
#
#     if len(v0b) == 0:
#         g.remove_vertex(v0)
#     else:
#         e = g.edge(v0, v0b[0])
#         g.set_edge_type(e, toggle_edge(g.edge_type(e)))
#         v0nn.append([v0])
#
#     if len(v1b) == 0:
#         g.remove_vertex(v1)
#     else:
#         e = g.edge(v1, v1b[0])
#         g.set_edge_type(e, toggle_edge(g.edge_type(e)))
#         v1nn.append((Fraction(1, 1), [v1]))
#
#     for phase, ws in v1nn:
#         for weight in range(1, len(v0nn) + 1):
#             phase_mult = int((-2) ** (weight - 1))
#             f_phase = (phase * phase_mult) % 2
#             if f_phase == 0: continue
#             for vvs in combinations(v0nn, weight):
#                 us = tuple(sorted(sum(vvs, ws)))
#
#                 # TODO: check if this is the right thing to do (and update scalar)
#                 if len(us) == 0: continue
#
#                 # if us in hboxes:
#                 #     h0 = hboxes[us]
#                 #     print("adding %s to %s" % (f_phase, g.phase(h0)))
#                 #     g.add_to_phase(h0, f_phase)
#                 # else:
#                 h0 = g.add_vertex(VertexType.H_BOX)
#                 g.set_phase(h0, f_phase)
#                 q: FloatInt = 0
#                 r: FloatInt = 0
#                 for u in us:
#                     q += g.qubit(u)
#                     r += g.row(u)
#                     g.add_edge((h0, u))
#                 g.set_qubit(h0, q / len(us) - 0.4)
#                 g.set_row(h0, r / len(us) + 0.4)
#     return True
