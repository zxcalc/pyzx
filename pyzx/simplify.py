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

"""This module contains the ZX-diagram simplification strategies of PyZX.
Each strategy is based on applying some combination of the rewrite rules in the rules_ module.
The main procedures of interest are :func:`clifford_simp` for simple reductions, 
:func:`full_reduce` for the full rewriting power of PyZX, and :func:`teleport_reduce` to 
use the power of :func:`full_reduce` while not changing the structure of the graph.
"""

__all__ = ['bialg_simp','spider_simp', 'id_simp', 'phase_free_simp', 'pivot_simp', 
        'pivot_gadget_simp', 'pivot_boundary_simp', 'gadget_simp',
        'lcomp_simp', 'clifford_simp', 'tcount', 'to_gh', 'to_rg', 
        'full_reduce', 'teleport_reduce', 'reduce_scalar', 'supplementarity_simp']

from typing import List, Callable, Optional, Union, Generic, Tuple, Dict, Iterator

from .utils import EdgeType, VertexType, toggle_edge, vertex_is_zx, toggle_vertex
from .rules import *
from .graph.base import BaseGraph, VT, ET
from .circuit import Circuit

def simp(
    g: BaseGraph[VT,ET], 
    name: str, 
    match: Callable[..., List[MatchObject]], 
    rewrite: Callable[[BaseGraph[VT,ET],List[MatchObject]],RewriteOutputType[ET,VT]], 
    matchf:Optional[Union[Callable[[ET],bool], Callable[[VT],bool]]]=None, 
    quiet:bool=False) -> int:
    """Helper method for constructing simplification strategies based on the rules present in rules_.
    It uses the ``match`` function to find matches, and then rewrites ``g`` using ``rewrite``. 
    If ``matchf`` is supplied, only the vertices or edges for which matchf() returns True are considered for matches.

    Example:
        ``simp(g, 'spider_simp', rules.match_spider_parallel, rules.spider)``
    
    Args:
        g: The graph that needs to be simplified.
        str name: The name to display if ``quiet`` is set to False.
        match: One of the ``match_*`` functions of rules_.
        rewrite: One of the rewrite functions of rules_.
        matchf: An optional filtering function on candidate vertices or edges, which
           is passed as the second argument to the match function.
        quiet: Suppress output on numbers of matches found during simplification.

    Returns:
        Number of iterations of ``rewrite`` that had to be applied before no more matches were found."""

    i = 0
    new_matches = True
    while new_matches:
        new_matches = False
        if matchf is not None:
            m = match(g, matchf)
        else:
            m = match(g)
        if len(m) > 0:
            i += 1
            if i == 1 and not quiet: print("{}: ".format(name),end='')
            if not quiet: print(len(m), end='')
            #print(len(m), end='', flush=True) #flush only supported on Python >3.3
            etab, rem_verts, rem_edges, check_isolated_vertices = rewrite(g, m)
            g.add_edge_table(etab)
            g.remove_edges(rem_edges)
            g.remove_vertices(rem_verts)
            if check_isolated_vertices: g.remove_isolated_vertices()
            if not quiet: print('. ', end='')
            #print('. ', end='', flush=True)
            new_matches = True
    if not quiet and i>0: print(' {!s} iterations'.format(i))
    return i

def pivot_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[ET],bool]]=None, quiet:bool=False) -> int:
    return simp(g, 'pivot_simp', match_pivot_parallel, pivot, matchf=matchf, quiet=quiet)

def pivot_gadget_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[ET],bool]]=None, quiet:bool=False) -> int:
    return simp(g, 'pivot_gadget_simp', match_pivot_gadget, pivot, matchf=matchf, quiet=quiet)

def pivot_boundary_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[ET],bool]]=None, quiet:bool=False) -> int:
    return simp(g, 'pivot_boundary_simp', match_pivot_boundary, pivot, matchf=matchf, quiet=quiet)

def lcomp_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=False) -> int:
    return simp(g, 'lcomp_simp', match_lcomp_parallel, lcomp, matchf=matchf, quiet=quiet)

def bialg_simp(g: BaseGraph[VT,ET], quiet:bool=False) -> int:
    return simp(g, 'bialg_simp', match_bialg_parallel, bialg, quiet=quiet)

def spider_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=False) -> int:
    return simp(g, 'spider_simp', match_spider_parallel, spider, matchf=matchf, quiet=quiet)

def id_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=False) -> int:
    return simp(g, 'id_simp', match_ids_parallel, remove_ids, matchf=matchf, quiet=quiet)

def gadget_simp(g: BaseGraph[VT,ET], quiet:bool=False) -> int:
    return simp(g, 'gadget_simp', match_phase_gadgets, merge_phase_gadgets, quiet=quiet)

def supplementarity_simp(g: BaseGraph[VT,ET], quiet:bool=False) -> int:
    return simp(g, 'supplementarity_simp', match_supplementarity, apply_supplementarity, quiet=quiet)

def copy_simp(g: BaseGraph[VT,ET], quiet:bool=False) -> int:
    """Copies 1-ary spiders with 0/pi phase through neighbors.
    WARNING: only use on maximally fused diagrams consisting solely of Z-spiders."""
    return simp(g, 'copy_simp', match_copy, apply_copy, quiet=quiet)

def phase_free_simp(g: BaseGraph[VT,ET], quiet:bool=False) -> int:
    '''Performs the following set of simplifications on the graph:
    spider -> bialg'''
    i1 = spider_simp(g, quiet=quiet)
    i2 = bialg_simp(g, quiet=quiet)
    return i1+i2

def interior_clifford_simp(g: BaseGraph[VT,ET], quiet:bool=False) -> int:
    """Keeps doing the simplifications ``id_simp``, ``spider_simp``, 
    ``pivot_simp`` and ``lcomp_simp`` until none of them can be applied anymore."""
    spider_simp(g, quiet=quiet)
    to_gh(g)
    i = 0
    while True:
        i1 = id_simp(g, quiet=quiet)
        i2 = spider_simp(g, quiet=quiet)
        i3 = pivot_simp(g, quiet=quiet)
        i4 = lcomp_simp(g, quiet=quiet)
        if i1+i2+i3+i4==0: break
        i += 1
    return i

def clifford_simp(g: BaseGraph[VT,ET], quiet:bool=True) -> int:
    """Keeps doing rounds of :func:`interior_clifford_simp` and
    :func:`pivot_boundary_simp` until they can't be applied anymore."""
    i = 0
    while True:
        i += interior_clifford_simp(g, quiet=quiet)
        i2 = pivot_boundary_simp(g, quiet=quiet)
        if i2 == 0:
            break
    return i

def reduce_scalar(g: BaseGraph[VT,ET], quiet:bool=True) -> int:
    """Modification of ``full_reduce`` that is tailered for scalar ZX-diagrams.
    It skips the boundary pivots, and it additionally does ``supplementarity_simp``."""
    i = 0
    while True:
        i1 = id_simp(g, quiet=quiet)
        i2 = spider_simp(g, quiet=quiet)
        i3 = pivot_simp(g, quiet=quiet)
        i4 = lcomp_simp(g, quiet=quiet)
        if i1+i2+i3+i4: 
            i += 1
            continue
        i5 = pivot_gadget_simp(g,quiet=quiet)
        i6 = gadget_simp(g, quiet=quiet)
        if i5 + i6:
            i += 1
            continue
        i7 = supplementarity_simp(g,quiet=quiet)
        if not i7: break
        i += 1
    return i



def full_reduce(g: BaseGraph[VT,ET], quiet:bool=True) -> None:
    """The main simplification routine of PyZX. It uses a combination of :func:`clifford_simp` and
    the gadgetization strategies :func:`pivot_gadget_simp` and :func:`gadget_simp`."""
    interior_clifford_simp(g, quiet=quiet)
    pivot_gadget_simp(g,quiet=quiet)
    while True:
        clifford_simp(g,quiet=quiet)
        i = gadget_simp(g, quiet=quiet)
        interior_clifford_simp(g,quiet=quiet)
        j = pivot_gadget_simp(g,quiet=quiet)
        if i+j == 0:
            break

def teleport_reduce(g: BaseGraph[VT,ET], quiet:bool=True) -> BaseGraph[VT,ET]:
    """This simplification procedure runs :func:`full_reduce` in a way 
    that does not change the graph structure of the resulting diagram.
    The only thing that is different in the output graph are the location and value of the phases.""" 
    s = Simplifier(g)
    s.full_reduce(quiet)
    return s.mastergraph


class Simplifier(Generic[VT, ET]):
    """Class used for :func:`teleport_reduce`."""
    def __init__(self, g: BaseGraph[VT,ET]) -> None:
        g.track_phases = True
        self.mastergraph = g.copy()
        self.simplifygraph = g.copy()
        self.simplifygraph.set_phase_master(self)
        self.phantom_phases: Dict[VT, Tuple[VT,int]] = dict()

    def fuse_phases(self,i1:int, i2: int) -> None:
        try:
            v1 = self.mastergraph.vertex_from_phase_index(i1)
            v2 = self.mastergraph.vertex_from_phase_index(i2)
        except ValueError: return
        #self.mastergraph.phase_index[v2] = i1
        p1 = self.mastergraph.phase(v1)
        p2 = self.mastergraph.phase(v2)
        m1 = self.simplifygraph.phase_mult[i1]
        m2 = self.simplifygraph.phase_mult[i2]
        if (p2 == 0 or p2.denominator <= 2): # Deleted vertex contains Clifford phase
            if v2 in self.phantom_phases:
                v3,i3 = self.phantom_phases[v2]
                m2 = m2*self.simplifygraph.phase_mult[i3] # type: ignore
                v2,i2 = v3,i3
                p2 = self.mastergraph.phase(v2)
            else: return
        if (p1 == 0 or p1.denominator <= 2): # Need to save non-Clifford location
            self.simplifygraph.phase_mult[i1] = 1
            if v1 in self.phantom_phases: # Already fused with non-Clifford before
                v3,i3 = self.phantom_phases[v1]
                self.mastergraph.phase_index[v3] = i1
                del self.mastergraph.phase_index[v1]
                p1 = self.mastergraph.phase(v3)
                if (p1+p2).denominator <= 2:
                    del self.phantom_phases[v1]
                v1,i1 = v3,i3
                m1 = m1*self.simplifygraph.phase_mult[i3] # type: ignore
            else:
                self.phantom_phases[v1] = (v2,i2)
                self.simplifygraph.phase_mult[i2] = m2
                return
        if p1.denominator <= 2 or p2.denominator <= 2: raise Exception("Clifford phases here??")
        # Both have non-Clifford phase
        if m1*m2 == 1: phase = (p1 + p2)%2
        else: phase = p1 - p2
        self.mastergraph.set_phase(v1,phase)
        self.mastergraph.set_phase(v2,0)
        
        self.simplifygraph.phase_mult[i2] = 1
    
    def full_reduce(self, quiet:bool=True) -> None:
        full_reduce(self.simplifygraph,quiet=quiet)



def to_gh(g: BaseGraph[VT,ET],quiet:bool=True) -> None:
    """Turns every red node into a green node by changing regular edges into hadamard edges"""
    ty = g.types()
    for v in g.vertices():
        if ty[v] == VertexType.X:
            g.set_type(v, VertexType.Z)
            for e in g.incident_edges(v):
                et = g.edge_type(e)
                g.set_edge_type(e, toggle_edge(et))

def to_rg(g: BaseGraph[VT,ET], select:Optional[Callable[[VT],bool]]=None) -> None:
    """Turn green nodes into red nodes by color-changing vertices which satisfy the predicate ``select``.
    By default, the predicate is set to greedily reducing the number of Hadamard-edges.
    :param g: A ZX-graph.
    :param select: A function taking in vertices and returning ``True`` or ``False``."""
    if select is None:
        select = lambda v: (
            len([e for e in g.incident_edges(v) if g.edge_type(e) == EdgeType.SIMPLE]) <
            len([e for e in g.incident_edges(v) if g.edge_type(e) == EdgeType.HADAMARD])
            )

    ty = g.types()
    for v in g.vertices():
        if select(v) and vertex_is_zx(ty[v]):
            g.set_type(v, toggle_vertex(ty[v]))
            for e in g.incident_edges(v):
                g.set_edge_type(e, toggle_edge(g.edge_type(e)))

def tcount(g: Union[BaseGraph[VT,ET], Circuit]) -> int:
    """Returns the amount of nodes in g that have a non-Clifford phase."""
    if isinstance(g, Circuit):
        return g.tcount()
    count = 0
    phases = g.phases()
    for v in g.vertices():
        if phases[v]!=0 and phases[v].denominator > 2:
            count += 1
    return count

#The functions below haven't been updated in a while. Use at your own risk.

def simp_iter(
        g: BaseGraph[VT,ET], 
        name: str, 
        match: Callable[..., List[MatchObject]], 
        rewrite: Callable[[BaseGraph[VT,ET],List[MatchObject]],RewriteOutputType[ET,VT]]
        ) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    """Version of :func:`simp` that instead of performing all rewrites at once, returns an iterator."""
    i = 0
    new_matches = True
    while new_matches:
        i += 1
        new_matches = False
        m = match(g)
        if len(m) > 0:
            etab, rem_verts, rem_edges, check_isolated_vertices = rewrite(g, m)
            g.add_edge_table(etab)
            g.remove_edges(rem_edges)
            g.remove_vertices(rem_verts)
            if check_isolated_vertices: g.remove_isolated_vertices()
            yield g, name+str(i)
            new_matches = True

def pivot_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    return simp_iter(g, 'pivot', match_pivot_parallel, pivot)

def lcomp_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    return simp_iter(g, 'lcomp', match_lcomp_parallel, lcomp)

def bialg_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    return simp_iter(g, 'bialg', match_bialg_parallel, bialg)

def spider_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    return simp_iter(g, 'spider', match_spider_parallel, spider)

def id_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    return simp_iter(g, 'id', match_ids_parallel, remove_ids)

def clifford_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    yield from spider_iter(g)
    to_gh(g)
    yield g, "to_gh"
    yield from spider_iter(g)
    yield from pivot_iter(g)
    yield from lcomp_iter(g)
    yield from pivot_iter(g)
    yield from id_iter(g)
    yield from spider_iter(g)