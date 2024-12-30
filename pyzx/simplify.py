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
        'full_reduce', 'teleport_reduce', 'reduce_scalar', 'supplementarity_simp',
        'to_clifford_normal_form_graph', 'to_graph_like', 'is_graph_like']

from ast import Mult
from functools import reduce
from optparse import Option
from typing import List, Callable, Optional, Union, Generic, Tuple, Dict, Iterator, cast

from .utils import EdgeType, VertexType, phase_is_clifford, toggle_edge, vertex_is_zx, toggle_vertex
from .rules import *
from .graph.base import BaseGraph, VT, ET
from .graph.multigraph import Multigraph
from .circuit import Circuit

class Stats(object):
    def __init__(self) -> None:
        self.num_rewrites: Dict[str,int] = {}
    def count_rewrites(self, rule: str, n: int) -> None:
        if rule in self.num_rewrites:
            self.num_rewrites[rule] += n
        else:
            self.num_rewrites[rule] = n
    def __str__(self) -> str:
        s = "REWRITES\n"
        nt = 0
        for r,n in self.num_rewrites.items():
            nt += n
            s += "%s %s\n" % (str(n).rjust(6),r)
        s += "%s TOTAL" % str(nt).rjust(6)
        return s


def simp(
    g: BaseGraph[VT,ET],
    name: str,
    match: Callable[..., List[MatchObject]],
    rewrite: Callable[[BaseGraph[VT,ET],List[MatchObject]],RewriteOutputType[VT,ET]],
    auto_simplify_parallel_edges: bool = False,
    matchf:Optional[Union[Callable[[ET],bool], Callable[[VT],bool]]]=None,
    quiet:bool=True,
    stats:Optional[Stats]=None) -> int:
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
        auto_simplify_parallel_edges: whether to automatically combine parallel edges between vertices if the graph is a Multigraph
        matchf: An optional filtering function on candidate vertices or edges, which
           is passed as the second argument to the match function.
        quiet: Suppress output on numbers of matches found during simplification.

    Returns:
        Number of iterations of ``rewrite`` that had to be applied before no more matches were found."""

    auto_simp_value = g.get_auto_simplify()
    if auto_simplify_parallel_edges:
        g.set_auto_simplify(True)
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
            if stats is not None: stats.count_rewrites(name, len(m))
    if not quiet and i>0: print(' {!s} iterations'.format(i))
    if auto_simplify_parallel_edges:
        g.set_auto_simplify(auto_simp_value)
    return i

def pivot_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[ET],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    return simp(g, 'pivot_simp', match_pivot_parallel, pivot, 
                auto_simplify_parallel_edges=True, matchf=matchf, quiet=quiet, stats=stats)

def pivot_gadget_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[ET],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    return simp(g, 'pivot_gadget_simp', match_pivot_gadget, pivot, 
                auto_simplify_parallel_edges=True, matchf=matchf, quiet=quiet, stats=stats)

def pivot_boundary_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[ET],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    return simp(g, 'pivot_boundary_simp', match_pivot_boundary, pivot, 
                auto_simplify_parallel_edges=True, matchf=matchf, quiet=quiet, stats=stats)

def lcomp_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    return simp(g, 'lcomp_simp', match_lcomp_parallel, lcomp, 
                auto_simplify_parallel_edges=True, matchf=matchf, quiet=quiet, stats=stats)

def bialg_simp(g: BaseGraph[VT,ET], quiet:bool=True, stats: Optional[Stats]=None) -> int:
    return simp(g, 'bialg_simp', match_bialg_parallel, bialg, quiet=quiet, stats=stats)

def spider_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    return simp(g, 'spider_simp', match_spider_parallel, spider, matchf=matchf, quiet=quiet, stats=stats)

def id_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    return simp(g, 'id_simp', match_ids_parallel, remove_ids, matchf=matchf, quiet=quiet, stats=stats)

def gadget_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[VT],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    return simp(g, 'gadget_simp', match_phase_gadgets, merge_phase_gadgets, 
                auto_simplify_parallel_edges=True, matchf=matchf, quiet=quiet, stats=stats)

def supplementarity_simp(g: BaseGraph[VT,ET], quiet:bool=True, stats:Optional[Stats]=None) -> int:
    return simp(g, 'supplementarity_simp', match_supplementarity, apply_supplementarity, 
                auto_simplify_parallel_edges=True, quiet=quiet, stats=stats)

def copy_simp(g: BaseGraph[VT,ET], quiet:bool=True, stats:Optional[Stats]=None) -> int:
    """Copies 1-ary spiders with 0/pi phase through neighbors.
    WARNING: only use on maximally fused diagrams consisting solely of Z-spiders."""
    return simp(g, 'copy_simp', match_copy, apply_copy, quiet=quiet, stats=stats)

def phase_free_simp(g: BaseGraph[VT,ET], quiet:bool=True, stats:Optional[Stats]=None) -> int:
    '''Performs the following set of simplifications on the graph:
    spider -> bialg'''
    i1 = spider_simp(g, quiet=quiet, stats=stats)
    i2 = bialg_simp(g, quiet=quiet, stats=stats)
    return i1+i2

def basic_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[Union[VT, ET]],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    """Keeps doing the simplifications ``id_simp`` and ``spider_simp`` until none of them can be applied anymore. If
    starting from a circuit, the result should still have causal flow."""
    spider_simp(g, matchf=matchf, quiet=quiet, stats=stats)
    to_gh(g)
    i = 0
    while True:
        i1 = id_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        i2 = spider_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        if i1+i2==0: break
        i += 1
    return i

def interior_clifford_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[Union[VT, ET]],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    """Keeps doing the simplifications ``id_simp``, ``spider_simp``,
    ``pivot_simp`` and ``lcomp_simp`` until none of them can be applied anymore."""
    spider_simp(g, matchf=matchf, quiet=quiet, stats=stats)
    to_gh(g)
    i = 0
    while True:
        i1 = id_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        i2 = spider_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        i3 = pivot_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        i4 = lcomp_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        if i1+i2+i3+i4==0: break
        i += 1
    return i

def clifford_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[Union[VT, ET]],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> int:
    """Keeps doing rounds of :func:`interior_clifford_simp` and
    :func:`pivot_boundary_simp` until they can't be applied anymore."""
    i = 0
    while True:
        i += interior_clifford_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        i2 = pivot_boundary_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        if i2 == 0:
            break
    return i

def reduce_scalar(g: BaseGraph[VT,ET], quiet:bool=True, stats:Optional[Stats]=None) -> int:
    """Modification of ``full_reduce`` that is tailered for scalar ZX-diagrams.
    It skips the boundary pivots, and it additionally does ``supplementarity_simp``."""
    i = 0
    while True:
        i1 = id_simp(g, quiet=quiet, stats=stats)
        i2 = spider_simp(g, quiet=quiet, stats=stats)
        i3 = pivot_simp(g, quiet=quiet, stats=stats)
        i4 = lcomp_simp(g, quiet=quiet, stats=stats)
        if i1+i2+i3+i4:
            i += 1
            continue
        i5 = pivot_gadget_simp(g,quiet=quiet, stats=stats)
        i6 = gadget_simp(g, quiet=quiet, stats=stats)
        if i5 + i6:
            i += 1
            continue
        i7 = supplementarity_simp(g,quiet=quiet, stats=stats)
        if not i7: break
        i += 1
    return i


def full_reduce(g: BaseGraph[VT,ET], matchf: Optional[Callable[[Union[VT, ET]],bool]]=None, quiet:bool=True, stats:Optional[Stats]=None) -> None:
    """The main simplification routine of PyZX. It uses a combination of :func:`clifford_simp` and
    the gadgetization strategies :func:`pivot_gadget_simp` and :func:`gadget_simp`."""
    if any(g.types()[h] == VertexType.H_BOX for h in g.vertices()):
        raise ValueError("Input graph is not a ZX-diagram as it contains an H-box. "
                         "Maybe call pyzx.hsimplify.from_hypergraph_form(g) first?")
    interior_clifford_simp(g, matchf=matchf, quiet=quiet, stats=stats)
    pivot_gadget_simp(g, matchf=matchf, quiet=quiet, stats=stats)
    while True:
        clifford_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        i = gadget_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        interior_clifford_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        j = pivot_gadget_simp(g, matchf=matchf, quiet=quiet, stats=stats)
        if i+j == 0:
            break

def teleport_reduce(g: BaseGraph[VT,ET], quiet:bool=True, stats:Optional[Stats]=None) -> BaseGraph[VT,ET]:
    """This simplification procedure runs :func:`full_reduce` in a way
    that does not change the graph structure of the resulting diagram.
    The only thing that is different in the output graph are the location and value of the phases."""
    s = Simplifier(g)
    s.full_reduce(quiet=quiet, stats=stats)
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
                m2 = cast(Literal[1, -1], m2*self.simplifygraph.phase_mult[i3])
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
                m1 = cast(Literal[1, -1], m1*self.simplifygraph.phase_mult[i3])
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

    def full_reduce(self, quiet:bool=True, stats:Optional[Stats]=None) -> None:
        full_reduce(self.simplifygraph,quiet=quiet, stats=stats)



def to_gh(g: BaseGraph[VT,ET],quiet:bool=True) -> None:
    """Turns every red node into a green node by changing regular edges into hadamard edges"""
    ty = g.types()
    for v in g.vertices():
        if ty[v] == VertexType.X:
            g.set_type(v, VertexType.Z)
            for e in g.incident_edges(v):
                et = g.edge_type(e)
                g.set_edge_type(e, toggle_edge(et))


def max_cut(g: BaseGraph[VT,ET], vs0: Optional[Set[VT]]=None, vs1: Optional[Set[VT]]=None) -> Tuple[Set[VT],Set[VT]]:
    """Approximate the MAX-CUT of a graph, starting with an initial partition

    This uses the quadratic-time SG3 heuristic explained by Wang et al in https://arxiv.org/abs/2312.10895 .
    """
    if vs0 is None: vs0 = set()
    if vs1 is None: vs1 = set()
    # print(f'vs0={vs0} vs1={vs1}')
    remaining = set(g.vertices()) - vs0 - vs1
    while len(remaining) > 0:
        score_max = -1
        v_max: Optional[VT] = None
        in0 = True
        for v in remaining:
            wt0 = sum(len(list(g.edges(v,w))) for w in vs1)
            wt1 = sum(len(list(g.edges(v,w))) for w in vs0)
            score = abs(wt0 - wt1)
            if score > score_max:
                # print(f'{v}: score={score}, wt0={wt0}, wt1={wt1}')
                score_max = score
                v_max = v
                in0 = wt0 >= wt1
        # print(f'choosing {v_max} for set {"vs0" if in0 else "vs1"}')
        
        if v_max is None: raise RuntimeError("No max found")
        remaining.remove(v_max)
        if in0: vs0.add(v_max)
        else: vs1.add(v_max)
    return(vs0, vs1)

def to_rg(g: BaseGraph[VT,ET], init_z: Optional[Set[VT]]=None, init_x: Optional[Set[VT]]=None) -> None:
    """Try to eliminate H-edges by turning green nodes red

    This implements a quadratic-time max-cut heuristic to eliminate H-edges. In the future, we may want
    to implement a linear-time version that does a worse job for very large graphs.

    :param g: A ZX-graph.
    :param init_z: An optional set of vertices to make Z.
    :param init_x: An optional set of vertices to make X.
    """

    ty = g.types()
    vs0, vs1 = max_cut(g, init_z, init_x)
    for v in vs0:
        if ty[v] == VertexType.X:
            g.set_type(v, VertexType.Z)
            for e in g.incident_edges(v):
                g.set_edge_type(e, toggle_edge(g.edge_type(e)))
    for v in vs1:
        if ty[v] == VertexType.Z:
            g.set_type(v, VertexType.X)
            for e in g.incident_edges(v):
                g.set_edge_type(e, toggle_edge(g.edge_type(e)))

def gadgetize(g: BaseGraph[VT,ET], graphlike:bool=True):
    """Convert every non-Clifford phase to a phase gadget"""
    for v in list(g.vertices()):
        p = g.phase(v)
        if not phase_is_clifford(p) and g.vertex_degree(v) > 1:
            y = g.add_vertex(VertexType.Z, -2, g.row(v))
            if graphlike:
                x = g.add_vertex(VertexType.Z, -1, g.row(v))
                g.add_edge((x, y), EdgeType.HADAMARD)
                g.add_edge((v, x), EdgeType.HADAMARD)
            else:
                x = g.add_vertex(VertexType.X, -1, g.row(v))
                g.add_edge((x, y), EdgeType.SIMPLE)
                g.add_edge((v, x), EdgeType.SIMPLE)
            g.set_phase(y, p)
            g.set_phase(v, 0)

def tcount(g: Union[BaseGraph[VT,ET], Circuit]) -> int:
    """Returns the amount of nodes in g that have a non-Clifford phase."""
    if isinstance(g, Circuit):
        return g.tcount()
    count = 0
    phases = g.phases()
    for v in g.vertices():
        if not phase_is_clifford(phases[v]):
            count += 1
    return count

#The functions below haven't been updated in a while. Use at your own risk.

def simp_iter(
        g: BaseGraph[VT,ET],
        name: str,
        match: Callable[..., List[MatchObject]],
        rewrite: Callable[[BaseGraph[VT,ET],List[MatchObject]],RewriteOutputType[VT,ET]]
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

def pivot_gadget_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    return simp_iter(g, 'pivot_gadget', match_pivot_gadget, pivot)

def gadget_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    return simp_iter(g, 'gadget', match_phase_gadgets, merge_phase_gadgets)

def pivot_boundary_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    return simp_iter(g, 'pivot_boundary', match_pivot_boundary, pivot)

def clifford_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    ok = True
    while ok:
        ok = False
        for g, step in interior_clifford_iter(g):
            yield g, step
        for g, step in pivot_boundary_iter(g):
            ok = True
            yield g, step

def interior_clifford_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    yield from spider_iter(g)
    to_gh(g)
    yield g, "to_gh"
    ok = True
    while ok:
        ok = False
        for g, step in id_iter(g):
            ok = True
            yield g, step
        for g, step in spider_iter(g):
            ok = True
            yield g, step
        for g, step in pivot_iter(g):
            ok = True
            yield g, step
        for g, step in lcomp_iter(g):
            ok = True
            yield g, step

def full_reduce_iter(g: BaseGraph[VT,ET]) -> Iterator[Tuple[BaseGraph[VT,ET],str]]:
    yield from interior_clifford_iter(g)
    yield from pivot_gadget_iter(g)
    ok = True
    while ok:
        ok = False
        for g, step in clifford_iter(g):
            yield g, f"clifford -> {step}"
        for g, step in gadget_iter(g):
            ok = True
            yield g, f"gadget -> {step}"
        for g, step in interior_clifford_iter(g):
            yield g, f"interior_clifford -> {step}"
        for g, step in pivot_gadget_iter(g):
            ok = True
            yield g, f"pivot_gadget -> {step}"

def is_graph_like(g: BaseGraph[VT,ET], strict:bool=False) -> bool:
    """Checks if a ZX-diagram is graph-like: 
    only contains Z-spiders which are connected by Hadamard edges.
    If `strict` is True, then also checks that each boundary vertex is connected to a Z-spider,
    and that each Z-spider is connected to at most one boundary."""

    # checks that all spiders are Z-spiders
    for v in g.vertices():
        if g.type(v) not in [VertexType.Z, VertexType.BOUNDARY]:
            return False

    for v1, v2 in itertools.combinations(g.vertices(), 2):
        if not g.connected(v1, v2):
            continue

        # Z-spiders are only connected via Hadamard edges
        if g.type(v1) == VertexType.Z and g.type(v2) == VertexType.Z \
           and g.edge_type(g.edge(v1, v2)) != EdgeType.HADAMARD:
            return False

        # FIXME: no parallel edges

    # no self-loops
    for v in g.vertices():
        if g.connected(v, v):
            return False

    if strict:
        # every I/O is connected to a Z-spider
        bs = [v for v in g.vertices() if g.type(v) == VertexType.BOUNDARY]
        for b in bs:
            if g.vertex_degree(b) != 1 or g.type(list(g.neighbors(b))[0]) != VertexType.Z:
                return False

        # every Z-spider is connected to at most one I/O
        zs = [v for v in g.vertices() if g.type(v) == VertexType.Z]
        for z in zs:
            b_neighbors = [n for n in g.neighbors(z) if g.type(n) == VertexType.BOUNDARY]
            if len(b_neighbors) > 1:
                return False

    return True


def to_graph_like(g: BaseGraph[VT,ET]) -> None:
    """Puts a ZX-diagram in graph-like form."""

    # turn all red spiders into green spiders
    to_gh(g)

    # simplify: remove excess HAD's, fuse along non-HAD edges, remove parallel edges and self-loops
    spider_simp(g, quiet=True)

    # ensure all I/O are connected to a Z-spider
    bs = [v for v in g.vertices() if g.type(v) == VertexType.BOUNDARY]
    for v in bs:

        # if it's already connected to a Z-spider, continue on
        if any([g.type(n) == VertexType.Z for n in g.neighbors(v)]):
            continue

        # have to connect the (boundary) vertex to a Z-spider
        ns = list(g.neighbors(v))
        for n in ns:
            # every neighbor is another boundary or an H-Box
            assert(g.type(n) in [VertexType.BOUNDARY, VertexType.H_BOX])
            if g.type(n) == VertexType.BOUNDARY:
                z1 = g.add_vertex(ty=VertexType.Z)
                z2 = g.add_vertex(ty=VertexType.Z)
                z3 = g.add_vertex(ty=VertexType.Z)
                g.remove_edge(g.edge(v, n))
                g.add_edge((v, z1), edgetype=EdgeType.SIMPLE)
                g.add_edge((z1, z2), edgetype=EdgeType.HADAMARD)
                g.add_edge((z2, z3), edgetype=EdgeType.HADAMARD)
                g.add_edge((z3, n), edgetype=EdgeType.SIMPLE)
            else: # g.type(n) == VertexType.H_BOX
                z = g.add_vertex(ty=VertexType.Z)
                g.remove_edge(g.edge(v, n))
                g.add_edge((v, z), edgetype=EdgeType.SIMPLE)
                g.add_edge((z, n), edgetype=EdgeType.SIMPLE)

    # each Z-spider can only be connected to at most 1 I/O
    vs = list(g.vertices())
    for v in vs:
        if not g.type(v) == VertexType.Z:
            continue
        boundary_ns = [n for n in g.neighbors(v) if g.type(n) == VertexType.BOUNDARY]
        if len(boundary_ns) <= 1:
            continue

        # add dummy spiders for all but one
        for b in boundary_ns[:-1]:
            e = g.edge(v,b)
            if g.edge_type(e) == EdgeType.SIMPLE:
                z1 = g.add_vertex(ty=VertexType.Z,row=0.3*g.row(v)+0.7*g.row(b),qubit=0.3*g.qubit(v)+0.7*g.qubit(b))
                z2 = g.add_vertex(ty=VertexType.Z,row=0.7*g.row(v)+0.3*g.row(b),qubit=0.7*g.qubit(v)+0.3*g.qubit(b))

                g.remove_edge(e)
                g.add_edge((z1, z2), edgetype=EdgeType.HADAMARD)
                g.add_edge((b, z1), edgetype=EdgeType.SIMPLE)
                g.add_edge((z2, v), edgetype=EdgeType.HADAMARD)
            elif g.edge_type(e) == EdgeType.HADAMARD:
                z = g.add_vertex(ty=VertexType.Z,row=0.5*g.row(v)+0.5*g.row(b),qubit=0.5*g.qubit(v)+0.5*g.qubit(b))
                g.remove_edge(e)
                g.add_edge((b,z),EdgeType.SIMPLE)
                g.add_edge((z,v),EdgeType.HADAMARD)

    assert(is_graph_like(g,strict=True))

def unfuse_non_cliffords(g: BaseGraph[VT,ET]) -> None:
    """Unfuses any non-Clifford spider into a magic state connected to a phase-free spider

    Replaces any spider with a non-Clifford phase p and degree n > 1 with a degree 1 spider with phase p connected to
    a degree n+1 spider with phase 0.
    """
    for v in list(g.vertices()):
        ty = g.type(v)
        p = g.phase(v)
        if vertex_is_zx(ty) and not phase_is_clifford(p) and g.vertex_degree(v) > 1:
            v1 = g.add_vertex(ty, qubit=-1, row=g.row(v), phase=p)
            g.set_phase(v, 0)
            g.add_edge((v, v1))

def to_clifford_normal_form_graph(g: BaseGraph[VT,ET]) -> None:
    """Converts a graph that is Clifford into the form described by the right-hand side of eq. (11) of
    *Graph-theoretic Simplification of Quantum Circuits with the ZX-calculus* (https://arxiv.org/abs/1902.03178).
    That is, writes it as a series of layers: 
    Hadamards, phase gates, CZ gates, parity form of Z-spiders to X-spiders, Hadamards, CZ gates, phase gates, Hadamards.
    Changes the graph in place.
    """
    full_reduce(g)
    g.normalize()
    # At this point the only vertices g should have are those directly connected to an input or an output (and not both).
    if any([((g.phase(v)*4) % 2 != 0) for v in g.vertices()]):  # If any phase is not a multiple of 1/2, then this will fail.
        raise ValueError("Specified graph is not Clifford.")

    inputs = list(g.inputs())
    outputs = list(g.outputs())
    v_inputs = [list(g.neighbors(i))[0] for i in inputs] # input vertices should have a unique spider neighbor
    v_outputs = [list(g.neighbors(o))[0] for o in outputs] # input vertices should have a unique spider neighbor
    # create more spacing
    for v in v_inputs:
        g.set_row(v, 3)
    for v in v_outputs:
        g.set_row(v,  5)
    for o in outputs:
        g.set_row(o, 8)
    
    # Separate out the Hadamards 
    for q in range(len(inputs)):
        v = v_inputs[q]
        i = inputs[q]
        e = g.edge(v,i)
        e_type = g.edge_type(e)
        if e_type == EdgeType.HADAMARD or g.phase(v) != 0:
            h = g.add_vertex(VertexType.Z, q, row=1, phase=g.phase(v))
            g.add_edge((i,h),e_type)
            g.add_edge((h,v),EdgeType.SIMPLE)
            g.remove_edge(e)
            g.set_phase(v,0)
            inputs[q] = h
    
    for q in range(len(outputs)):
        v = v_outputs[q]
        o = outputs[q]
        e = g.edge(v,o)
        e_type = g.edge_type(e)
        if e_type == EdgeType.HADAMARD or g.phase(v) != 0:
            h = g.add_vertex(VertexType.Z, q, row=7, phase=g.phase(v))
            g.add_edge((h,o),e_type)
            g.add_edge((v,h),EdgeType.SIMPLE)
            g.remove_edge(e)
            g.set_phase(v,0)
            outputs[q] = h
    
    # Unfuse the czs on the inputs
    czs = []
    cz_qubits = set()
    for q1 in range(len(inputs)):
        for q2 in range(q1+1,len(inputs)):
            if g.connected(v_inputs[q1],v_inputs[q2]):
                g.remove_edge(g.edge(v_inputs[q1],v_inputs[q2]))
                czs.append((q1,q2))
                cz_qubits.add(q1)
                cz_qubits.add(q2)
    cz_v = {}
    for q in cz_qubits:
        w = g.add_vertex(VertexType.Z,q,row=2)
        g.remove_edge(g.edge(inputs[q],v_inputs[q]))
        g.add_edge((inputs[q],w))
        g.add_edge((w,v_inputs[q]))
        cz_v[q] = w
    for q1,q2 in czs:
        g.add_edge((cz_v[q1],cz_v[q2]),EdgeType.HADAMARD)
    
    # Unfuse the czs on the outputs
    czs = []
    cz_qubits = set(range(len(outputs))) # We actually definitely need to add another spider at every position, as we are going to introduce Hadamards everywhere later
    for q1 in range(len(outputs)):
        for q2 in range(q1+1,len(outputs)):
            if g.connected(v_outputs[q1],v_outputs[q2]):
                g.remove_edge(g.edge(v_outputs[q1],v_outputs[q2]))
                czs.append((q1,q2))
                cz_qubits.add(q1)
                cz_qubits.add(q2)
    cz_v = {}
    for q in cz_qubits:
        w = g.add_vertex(VertexType.Z,q,row=6)
        g.remove_edge(g.edge(v_outputs[q],outputs[q]))
        g.add_edge((w,outputs[q]))
        g.add_edge((v_outputs[q],w))
        cz_v[q] = w
    for q1,q2 in czs:
        g.add_edge((cz_v[q1],cz_v[q2]),EdgeType.HADAMARD)
    
    # TODO: re-introduce correct to_rg behaviour here
    #to_rg(g,select=lambda v: v in v_outputs)
