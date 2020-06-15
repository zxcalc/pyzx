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

from typing import Callable, List

from .simplify import spider_simp, id_simp
from .utils import EdgeType, VertexType
from .graph.base import BaseGraph, VT,ET
from .hrules import *
from .rules import MatchObject

def to_hbox(g: BaseGraph[VT,ET]) -> None:
    """Convert a graph g to hbox-form. First, all X spiders are turned into
    Z-spiders by color-change, then all interior Hadamard edges are replaced
    by arity-2 hboxes and all Z-phases are replaced by arity-1 hboxes."""
    to_gh(g)
    del_e = []
    add_e = []
    types = g.types()
    phases = g.phases()
    es = list(g.edges())
    vs = list(g.vertices())
    for v in vs:
        if types[v] == VertexType.Z and phases[v] != 0:
            h = g.add_vertex(VertexType.H_BOX)
            g.add_edge(g.edge(h,v))
            g.set_qubit(h, g.qubit(v) - 0.5)
            g.set_row(h, g.row(v) + 0.5)
            g.set_phase(h, phases[v])
            g.set_phase(v, 0)
    for e in es:
        if g.edge_type(e) == VertexType.X:
            s,t = g.edge_st(e)
            if types[s] == VertexType.BOUNDARY or types[t] == VertexType.BOUNDARY: continue
            qs = g.qubit(s)
            qt = g.qubit(t)
            h = g.add_vertex(VertexType.H_BOX)
            del_e.append(e)
            add_e.append(g.edge(s, h))
            add_e.append(g.edge(h, t))
            if qs == qt:
                g.set_qubit(h, qs)
            else:
                q = (qs + qt) / 2
                if round(q) == q: q += 0.5
                g.set_qubit(h, q)
            g.set_row(h, (g.row(s) + g.row(t)) / 2)
    g.remove_edges(del_e)
    g.add_edges(add_e)

def from_hbox(g: BaseGraph[VT,ET]) -> None:
    """Convert a graph with hboxes and no interior Hadamard edges back to 'ZX-friendly'
    form. All arity-2 hboxes with phase pi are turned into Hadamard edges and all
    arity-1 hboxes connected to Z-spiders are fused in. Note that more general hboxes
    are not changed, so this does *not* give a ZX graph in general."""
    types = g.types()
    phases = g.phases()
    hs = [h for h in g.vertices() if types[h] == VertexType.H_BOX]
    for h in hs:
        if g.vertex_degree(h) == 1:
            n = next(iter(g.neighbors(h)))
            if types[n] == VertexType.Z:
                g.set_phase(n, phases[n] + phases[h])
                g.remove_vertex(h)
        elif g.vertex_degree(h) == 2 and g.phase(h) == 1:
            s,t = g.neighbors(h)
            # Need to use add_edge_table here, because there might be parallel connections already present
            g.add_edge_table({g.edge(s,t): [0,1]})
            g.remove_vertex(h)

# a stripped-down version of "simp", since hrules don't return edge tables etc
def hsimp(
        g: BaseGraph[VT,ET], 
        name:str, 
        match: Callable[..., List[MatchObject]],
        rule: Callable[[BaseGraph[VT,ET],List[MatchObject]],None], 
        iterations:int=-1, 
        quiet:bool=False
        ) -> int:
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

def hpivot_simp(g: BaseGraph[VT,ET], quiet:bool=False) -> None:
    while True:
        i = spider_simp(g, quiet=quiet)
        i += id_simp(g, quiet=quiet)

        to_hbox(g)
        i += hsimp(g, 'hpivot', match_hpivot, hpivot, iterations=1, quiet=quiet)
        #i += hsimp(g, 'zero_hbox', match_zero_hbox, zero_hbox, quiet=quiet)
        i += hsimp(g, 'par_hbox', match_par_hbox, par_hbox, quiet=quiet)
        from_hbox(g)

        if i == 0: break
    
