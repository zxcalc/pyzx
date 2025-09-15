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

from .simplify import simp, Stats, spider_simp, id_simp
from .simplify import pivot_simp, lcomp_simp, pivot_gadget_simp, pivot_boundary_simp
from .utils import EdgeType, VertexType
from .graph.base import BaseGraph, VT,ET
from .rewrite_rules.hrules import *
from .rewrite_rules.rules import MatchObject


def hadamard_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=False) -> int:
    """Converts as many Hadamards represented by H-boxes to Hadamard-edges."""
    # We can't use the regular simp function, because removing H-nodes could lead to an infinite loop,
    # since sometimes g.add_edge_table() decides that we can't change an H-box into an H-edge.
    i = 0
    while True:
        vcount = g.num_vertices()
        m = match_hadamards(g, matchf)
        if len(m) == 0: break
        i += 1
        if i == 1 and not quiet: print("hadamard_simp: ",end='')
        if not quiet: print(len(m), end='')
        etab, rem_verts, rem_edges, check_isolated_vertices = hadamard_to_h_edge(g, m)
        g.add_edge_table(etab)
        g.remove_edges(rem_edges)
        g.remove_vertices(rem_verts)
        if check_isolated_vertices: g.remove_isolated_vertices()
        if not quiet: print('. ', end='')
        if g.num_vertices() >= vcount: break # To make sure we don't get in an infinite loop
    if not quiet and i>0: print(' {!s} iterations'.format(i))
    return i

def to_hypergraph_form(g: BaseGraph[VT,ET]) -> None:
    """Convert a Graph g to hypergraph form (see https://arxiv.org/abs/2003.13564)
    First, all X spiders are turned into Z-spiders by color-change, 
    then all interior Hadamard edges are replaced by arity-2 hboxes 
    and all Z-phases are replaced by arity-1 hboxes.
    Finally, to ensure H-boxes are only connected to white spiders, 
    additional identities are introduced"""
    to_gh(g)
    del_e: List[ET] = []
    add_e: List[Tuple[VT,VT]] = []
    types = g.types()
    phases = g.phases()
    es = list(g.edges())
    vs = list(g.vertices())
    for v in vs:
        if types[v] == VertexType.Z and phases[v] != 0:
            h = g.add_vertex(VertexType.H_BOX)
            g.add_edge((h,v))
            g.set_qubit(h, g.qubit(v) - 0.5)
            g.set_row(h, g.row(v) + 0.5)
            g.set_phase(h, phases[v])
            g.set_phase(v, 0)
    for e in es:
        if g.edge_type(e) == EdgeType.HADAMARD:
            s,t = g.edge_st(e)
            rs = g.row(s)
            rt = g.row(t)
            qs = g.qubit(s)
            qt = g.qubit(t)
            if types[s] == VertexType.BOUNDARY or types[t] == VertexType.BOUNDARY: continue
            h = g.add_vertex(VertexType.H_BOX)
            del_e.append(e)
            add_e.append((s, h))
            add_e.append((h, t))
            g.scalar.add_power(-1) # Correct for sqrt(2) scalar difference in H-edge and H-box.
            if qs == qt:
                g.set_qubit(h, qs)
            else:
                q = (qs + qt) / 2
                if round(q) == q: q += 0.5
                g.set_qubit(h, q)
            g.set_row(h, (rs + rt) / 2)
    g.remove_edges(del_e)
    g.add_edges(add_e)
    # At this point, all interior Hadamard edges and phases are converted to H-boxes
    # It remains to add missing identities between connected H-boxes
    for v in list(g.vertices()):
        if types[v] != VertexType.H_BOX: continue
        del_e = []
        add_e = []
        for n in g.neighbors(v):
            if types[n] != VertexType.H_BOX: continue
            w = g.add_vertex(VertexType.Z)
            g.set_row(w, (g.row(v)+g.row(n))/2)
            g.set_qubit(w,(g.qubit(v)+g.qubit(n))/2)
            del_e.append(g.edge(v,n))
            add_e.append((v,w))
            add_e.append((w,n))
        g.remove_edges(del_e)
        g.add_edges(add_e)

def from_hypergraph_form(g: BaseGraph[VT,ET]) -> None:
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
    hadamard_simp(g,quiet=True)


def par_hbox_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=False, stats:Optional[Stats]=None) -> int:
    return simp(g, 'par_hbox_simp', match_par_hbox, par_hbox, matchf=matchf, quiet=quiet, stats=stats)

def par_hbox_intro_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=False, stats:Optional[Stats]=None) -> int:
    return simp(g, 'par_hbox_intro_simp', match_par_hbox_intro, par_hbox_intro, matchf=matchf, quiet=quiet, stats=stats)

def copy_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=False, stats:Optional[Stats]=None) -> int:
    return simp(g, 'copy_simp', match_copy, apply_copy, matchf=matchf, quiet=quiet, stats=stats)

def hspider_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[ET],bool]]=None, quiet:bool=False, stats:Optional[Stats]=None) -> int:
    return simp(g, 'hspider_simp', match_connected_hboxes, fuse_hboxes, matchf=matchf, quiet=quiet, stats=stats)

def hbox_parallel_not_remove_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=False, stats:Optional[Stats]=None) -> int:
    return simp(g, 'hbox_parallel_not_remove_simp', match_hbox_parallel_not, hbox_parallel_not_remove, matchf=matchf, quiet=quiet, stats=stats)


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

def hpivot_simp(g: BaseGraph[VT,ET], quiet:bool=False) -> int:
    spider_simp(g, quiet=quiet)
    id_simp(g, quiet=quiet)
    from_hypergraph_form(g)
    spider_simp(g, quiet=quiet)
    id_simp(g, quiet=quiet)
    count = 0
    while True:
        to_hypergraph_form(g)
        i = hsimp(g, 'hpivot', match_hpivot, hpivot, iterations=1, quiet=quiet)
        #i += hsimp(g, 'zero_hbox', match_zero_hbox, zero_hbox, quiet=quiet)
        i += par_hbox_simp(g,quiet=quiet)
        from_hypergraph_form(g)
        spider_simp(g, quiet=quiet)
        id_simp(g, quiet=quiet)
        if i == 0: break
        count += 1
    return count

def zh_simp(g: BaseGraph[VT,ET], quiet:bool=False) -> int:
    """Does a whole bunch of rewrites to simplify diagrams containing
    arbitrary Z-spiders, X-spiders and H-boxes. 
    Tries to do as many "non-complicating" rewrites before doing
    rewrites that can make a diagram look more complex."""
    count = 0
    while True:
        to_gh(g)
        i = spider_simp(g, quiet=quiet)
        i += id_simp(g, quiet=quiet)
        from_hypergraph_form(g)
        i += spider_simp(g, quiet=quiet)
        i += id_simp(g, quiet=quiet)
        i += hspider_simp(g, quiet=quiet)
        if i > 0: 
            count += 1
            continue
        if copy_simp(g, quiet=quiet):
            count += 1
            continue
        if par_hbox_simp(g,quiet=quiet):
            count += 1
            continue
        if par_hbox_intro_simp(g,quiet=quiet):
            count += 1
            continue
        if hbox_parallel_not_remove_simp(g,quiet=quiet):
            count += 1
            continue
        i = pivot_simp(g, quiet=quiet)
        i += lcomp_simp(g, quiet=quiet)
        if i> 0: 
            count += 1
            continue
        if pivot_gadget_simp(g, quiet=quiet):
            count += 1
            continue
        if pivot_boundary_simp(g, quiet=quiet):
            count += 1
            continue

        to_hypergraph_form(g)
        i = hsimp(g, 'hpivot', match_hpivot, hpivot, iterations=1, quiet=quiet)
        i += par_hbox_simp(g,quiet=quiet)
        from_hypergraph_form(g)
        id_simp(g, quiet=True)
        if i > 0:
            count += 1
            continue
        
        break
    return count
