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

from .simplify import spider_simp, id_simp
from .hrules import *

def to_hbox(g):
    """Convert a graph g to hbox-form. First, all X spiders are turned into
    Z-spiders by colour-change, then all interior Hadamard edges are replaced
    by arity-2 hboxes and all Z-phases are replaced by arity-1 hboxes."""
    to_gh(g)
    del_e = []
    add_e = []
    types = g.types()
    phases = g.phases()
    es = list(g.edges())
    vs = list(g.vertices())
    for v in vs:
        if types[v] == 1 and phases[v] != 0:
            h = g.add_vertex(3)
            g.add_edge((h,v))
            g.set_qubit(h, g.qubit(v) - 0.5)
            g.set_row(h, g.row(v) + 0.5)
            g.set_phase(h, phases[v])
            g.set_phase(v, 0)
    for e in es:
        if g.edge_type(e) == 2:
            s,t = g.edge_st(e)
            if types[s] == 0 or types[t] == 0: continue
            qs = g.qubit(s)
            qt = g.qubit(t)
            h = g.add_vertex(3)
            del_e.append(e)
            add_e.append((s, h))
            add_e.append((h, t))
            if qs == qt:
                g.set_qubit(h, qs)
            else:
                q = (qs + qt) / 2
                if round(q) == q: q += 0.5
                g.set_qubit(h, q)
            g.set_row(h, (g.row(s) + g.row(t)) / 2)
    g.remove_edges(del_e)
    g.add_edges(add_e)

def from_hbox(g):
    """Convert a graph with hboxes and no interior Hadamard edges back to 'ZX-friendly'
    form. All arity-2 hboxes with phase pi are turned into Hadamard edges and all
    arity-1 hboxes connected to Z-spiders are fused in. Note that more general hboxes
    are not changed, so this does *not* give a ZX graph in general."""
    types = g.types()
    phases = g.phases()
    hs = [h for h in g.vertices() if types[h] == 3]
    for h in hs:
        if g.vertex_degree(h) == 1:
            n = next(iter(g.neighbours(h)))
            if types[n] == 1:
                g.set_phase(n, phases[n] + phases[h])
                g.remove_vertex(h)
        elif g.vertex_degree(h) == 2 and g.phase(h) == 1:
            s,t = g.neighbours(h)
            g.add_edge((s,t), 2)
            g.remove_vertex(h)

# a stripped-down version of "simp", since hrules don't return edge tables etc
def hsimp(g, name, match, rule, iterations=-1, quiet=False):
    i = 0
    while iterations == -1 or i < iterations:
        ms = match(g)
        if len(ms) > 0:
            rule(g, ms)
            i += 1
            if i == 1 and not quiet: print("{}: ".format(name),end='')
            if not quiet: print(len(ms), end='. ')
        else:
            break
    if not quiet and i>0: print(' {!s} iterations'.format(i))
    return i

def hpivot_simp(g, quiet=False):
    while True:
        i = spider_simp(g, quiet=quiet)
        i += id_simp(g, quiet=quiet)

        to_hbox(g)
        i += hsimp(g, 'hpivot', match_hpivot, hpivot, 1, quiet)
        i += hsimp(g, 'par_hbox', match_par_hbox, par_hbox, quiet)
        from_hbox(g)

        if i == 0: break
    