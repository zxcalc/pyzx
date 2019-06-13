# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

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


# def to_zh(g: BaseGraph):
#     to_gh(g)
#     del_e = []
#     add_e = []
#     es = list(g.edges())
#     for e in es:
#         if g.edge_type(e) == 2:
#             s,t = g.edge_st(e)
#             qs = g.qubit(s)
#             qt = g.qubit(t)
#             h = g.add_vertex(3)
#             del_e.append(e)
#             add_e.append((s, h))
#             add_e.append((h, t))
#             if qs == qt:
#                 g.set_qubit(h, qs)
#             else:
#                 q = (qs + qt) / 2
#                 if round(q) == q: q += 0.5
#                 g.set_qubit(h, q)
#             g.set_row(h, (g.row(s) + g.row(t)) / 2)
#     g.remove_edges(del_e)
#     g.add_edges(add_e)


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

def basic_simp(g):
    to_gh(g)
    progress = True
    while progress:
        progress = False
        ms = match_h2(g)
        if len(ms) != 0:
            h2(g, ms)
            progress = True


def match_hpivot(g, matchf=None):
    """Finds non-interacting matchings of the hyper-pivot rule.

    :param g: An instance of a ZH-graph.
    :param matchf: An optional filtering function for candidate arity-2 hbox, should
       return True if an hbox should considered as a match. Passing None will
       consider all arity-2 hboxes.
    :rtype: List containing 0 or 1 matches.
    """

    types = g.types()
    # phases = g.phases()

    for v in g.vertices():
        if not (
            (matchf is None or matchf(v)) and
            g.vertex_degree(v) == 2 and
            types[v] == 3
        ): continue

        v0, v1 = g.neighbours(v)
        v0n = g.neighbours(v0)
        v1n = g.neighbours(v1)

        if not (
            types[v0] == 1 and types[v1] == 1 and
            all(types[n] == 3 and all(types[nn] == 1 for nn in g.neighbours(n)) for n in v0n) and
            all(types[n] == 3 and all(types[nn] == 1 for nn in g.neighbours(n)) for n in v1n)
        ): continue

        return [v]
    return []


def hpivot(g, m):
    v0, v1 = g.neighbours(v)
    v0h = g.neighbours(v0)
    v1h = g.neighbours(v1)
