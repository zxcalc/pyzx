# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2019 - Aleks Kissinger and John van de Wetering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

from .simplify import *
from .graph.base import BaseGraph

from fractions import Fraction
from itertools import combinations


def match_h2(g: BaseGraph):
    m = set()
    ty = g.types()
    for v in g.vertices():
        if ty[v] == 3 and g.vertex_degree(v) == 2:
            n1,n2 = g.neighbours(v)
            if n1 not in m and n2 not in m: m.add(v)

    return list(m)

def h2(g: BaseGraph, m):
    del_e = []
    etab = dict()
    for h in m:
        n1,n2 = g.neighbours(h)
        new_e = (n1,n2) if n1 < n2 else (n2,n1)
        e1, e2 = g.incident_edges(h)
        if g.edge_type(e1) != g.edge_type(e2):
            if new_e in etab: etab[new_e][0] += 1
            else: etab[new_e] = [1,0]
        else:
            if new_e in etab: etab[new_e][1] += 1
            else: etab[new_e] = [0,1]
        del_e.append(e1)
        del_e.append(e2)

    g.remove_edges(del_e)
    g.remove_vertices(m)
    g.add_edge_table(etab)


def match_hpivot(g, matchf=None):
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
            types[h] == 3 and
            phases[h] == 1
        ): continue

        v0, v1 = g.neighbours(h)

        v0n = set(g.neighbours(v0))
        v1n = set(g.neighbours(v1))

        if (len(v0n.intersection(v1n)) > 1): continue

        v0b = [v for v in v0n if types[v] == 0]
        v0h = [v for v in v0n if types[v] == 3 and v != h]
        v1b = [v for v in v1n if types[v] == 0]
        v1h = [v for v in v1n if types[v] == 3 and v != h]

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

        v0nn = [list(filter(lambda w : w != v0, g.neighbours(v))) for v in v0h]
        v1nn = [
          (phases[v],
           list(filter(lambda w : w != v1, g.neighbours(v))))
          for v in v1h]


        if not (
            all(all(types[v] == 1 for v in vs) for vs in v0nn) and
            all(all(types[v] == 1 for v in vs[1]) for vs in v1nn) and
            len(v0b) + len(v1b) <= 1 and
            len(v0b) + len(v0h) + 1 == len(v0n) and
            len(v1b) + len(v1h) + 1 == len(v1n)
        ): continue

        degree = g.vertex_degree(v0) * g.vertex_degree(v1)

        if min_degree == -1 or degree < min_degree:
            m = [(h, v0, v1, v0b, v1b, v0nn, v1nn)]
            min_degree = degree
    return m


def hpivot(g, m):
    if len(m) == 0: return None

    types = g.types()

    # # cache hboxes
    # hboxes = dict()
    # for h in g.vertices():
    #     if types[h] != 3: continue
    #     nhd = tuple(sorted(g.neighbours(h)))
    #     hboxes[nhd] = h


    h, v0, v1, v0b, v1b, v0nn, v1nn = m[0]
    g.remove_vertices([v for v in g.neighbours(v0) if types[v] == 3])
    g.remove_vertices([v for v in g.neighbours(v1) if types[v] == 3])
    
    if len(v0b) == 0:
        g.remove_vertex(v0)
    else:
        e = g.edge(v0, v0b[0])
        g.set_edge_type(e, 2 if g.edge_type(e) == 1 else 1)
        v0nn.append([v0])
    
    if len(v1b) == 0:
        g.remove_vertex(v1)
    else:
        e = g.edge(v1, v1b[0])
        g.set_edge_type(e, 2 if g.edge_type(e) == 1 else 1)
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
                h0 = g.add_vertex(3)
                g.set_phase(h0, f_phase)
                q = 0
                r = 0
                for u in us:
                    q += g.qubit(u)
                    r += g.row(u)
                    g.add_edge((h0,u))
                g.set_qubit(h0, q / len(us) - 0.4)
                g.set_row(h0, r / len(us) + 0.4)

def match_par_hbox(g):
    hs = dict()
    types = g.types()
    for h in g.vertices():
        if types[h] != 3: continue
        nhd = tuple(sorted(g.neighbours(h)))
        if nhd in hs:
            hs[nhd].append(h)
        else:
            hs[nhd] = [h]
    return list(filter(lambda l: len(l) > 1, hs.values()))

def par_hbox(g, ms):
    for m in ms:
        p = sum(g.phase(h) for h in m) % 2
        for h in m[1:]: g.remove_vertex(h)
        if p == 0: g.remove_vertex(m[0])
        else: g.set_phase(m[0], p)

def match_zero_hbox(g):
    types = g.types()
    phases = g.phases()
    return [v for v in g.vertices() if types[v] == 3 and phases[v] == 0]

def zero_hbox(g, ms):
    for h in ms:
        g.remove_vertex(h)
