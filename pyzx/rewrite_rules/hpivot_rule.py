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

__all__ = ['check_hpivot',
           'hpivot',
           'unsafe_hpivot']

from fractions import Fraction
from itertools import combinations
from typing import List, Tuple
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

def check_hpivot(g: BaseGraph[VT, ET], h: VT, v0: VT, v1: VT) -> bool:
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

    if not (h in g.vertices() and v0 in g.vertices() and v1 in g.vertices()): return False

    if not (g.vertex_degree(h) == 2 and
            types[h] == VertexType.H_BOX and
            phases[h] == 1
    ): return False

    v0n = set(g.neighbors(v0))
    v1n = set(g.neighbors(v1))

    if len(v0n.intersection(v1n)) > 1: return False

    v0b = [v for v in v0n if types[v] == VertexType.BOUNDARY]
    v0h = [v for v in v0n if types[v] == VertexType.H_BOX and v != h]
    v1b = [v for v in v1n if types[v] == VertexType.BOUNDARY]
    v1h = [v for v in v1n if types[v] == VertexType.H_BOX and v != h]

    # check that v0 has all pi phases on adjacent hboxes.
    if not (all(phases[v] == 1 for v in v0h)):
        return False


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
    ): return False

    return True


def hpivot(g: BaseGraph[VT, ET], h: VT, v0: VT, v1: VT) -> bool:
    if check_hpivot(g, h, v0, v1): return unsafe_hpivot(g, h, v0, v1)
    return False

def unsafe_hpivot(g: BaseGraph[VT, ET], h: VT, v0: VT, v1: VT) -> bool:

    types = g.types()
    phases = g.phases()

    v0n = set(g.neighbors(v0))
    v1n = set(g.neighbors(v1))

    if len(v0n.intersection(v1n)) > 1: return False

    v0b = [v for v in v0n if types[v] == VertexType.BOUNDARY]
    v0h = [v for v in v0n if types[v] == VertexType.H_BOX and v != h]
    v1b = [v for v in v1n if types[v] == VertexType.BOUNDARY]
    v1h = [v for v in v1n if types[v] == VertexType.H_BOX and v != h]

    v0nn = [list(filter(lambda w: w != v0, g.neighbors(v))) for v in v0h]
    v1nn = [(phases[v], list(filter(lambda w: w != v1, g.neighbors(v)))) for v in v1h]

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