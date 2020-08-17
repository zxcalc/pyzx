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
from typing import Dict, List, Tuple, Callable, Optional

from .utils import EdgeType, VertexType, toggle_edge, FractionLike, FloatInt
from .simplify import *
from .graph.base import BaseGraph, ET, VT
from . import rules


def match_hadamards(g: BaseGraph[VT,ET], 
        vertexf: Optional[Callable[[VT],bool]] = None
        ) -> List[VT]:
    if vertexf is not None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    m = set()
    ty = g.types()
    for v in candidates:
        if ty[v] == VertexType.H_BOX and g.vertex_degree(v) == 2 and g.phase(v) == 1:
            n1,n2 = g.neighbors(v)
            if n1 not in m and n2 not in m: m.add(v)

    return list(m)

def hadamard_to_h_edge(g: BaseGraph[VT,ET], matches: List[VT]) -> rules.RewriteOutputType[ET,VT]:
    rem_verts = []
    etab = {}
    for v in matches:
        rem_verts.append(v)
        w1,w2 = list(g.neighbors(v))
        et1 = g.edge_type(g.edge(w1,v))
        et2 = g.edge_type(g.edge(w2,v))
        if et1 == et2:
            etab[g.edge(w1,w2)] = [0,1]
        else:
            etab[g.edge(w1,w2)] = [1,0]
    return (etab, rem_verts, [], True)

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
                    g.add_edge(g.edge(h0,u))
                g.set_qubit(h0, q / len(us) - 0.4)
                g.set_row(h0, r / len(us) + 0.4)

def match_par_hbox(g: BaseGraph[VT,ET]) -> List[List[VT]]:
    hs: Dict[Tuple[VT,...],List[VT]] = dict()
    types = g.types()
    for h in g.vertices():
        if types[h] != VertexType.H_BOX: continue
        nhd = tuple(sorted(g.neighbors(h)))
        if nhd in hs:
            hs[nhd].append(h)
        else:
            hs[nhd] = [h]
    return list(filter(lambda l: len(l) > 1, hs.values()))

def par_hbox(g: BaseGraph[VT,ET], ms: List[List[VT]]) -> None:
    for m in ms:
        p = sum(g.phase(h) for h in m) % 2
        g.remove_vertices(m[1:])
        if p == 0: g.remove_vertex(m[0])
        else: g.set_phase(m[0], p)

def match_zero_hbox(g: BaseGraph[VT,ET]) -> List[VT]:
    types = g.types()
    phases = g.phases()
    return [v for v in g.vertices() if types[v] == VertexType.H_BOX and phases[v] == 0]

def zero_hbox(g: BaseGraph[VT,ET], m: List[VT]) -> None:
    g.remove_vertices(m)
