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
        'id_fuse_simp', 'to_graph_like', 'is_graph_like', 'basic_simp', 'flow_2Q_simp',
        'to_clifford_normal_form_graph']

from typing import List, Callable, Optional, Union, Generic, Tuple, Dict, Iterator, Any, cast
from collections import defaultdict

from .utils import EdgeType, VertexType, toggle_edge, vertex_is_zx, toggle_vertex
from .rules import *
from .heuristics import *
from .flow import *
from .graph.base import BaseGraph, VT, ET
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
    rewrite: Callable[[BaseGraph[VT, ET], List[MatchObject]], RewriteOutputType[ET, VT]],
    matchf: Union[Optional[Callable[[VT], bool]], Optional[Callable[[ET], bool]]] = None,
    num: Optional[int] = None,
    quiet: bool = False,
    stats: Optional[Stats] = None
    ) -> int:
    """Helper method for constructing simplification strategies based on the rules present in rules_. 
    It uses the ``match`` function to find matches, then rewrites ``g`` using ``rewrite``.

    :param g: The graph to be simplified
    :param name: The name to display if ``quiet`` is set to False.
    :param match: One of the match functions of rules_.
    :param rewrite: One of the rewrite functions of rules_.
    :param matchf: An optional filtering function on candidate vertices or edges, passed as a second argument to the match function. 
                        If it is supplied only vertices or edges whih return True are considered for matches. Defaults to None.
    :param num: The maximum number of rewrites to perform, defaults to None.
    :param quiet: Supress output on numbers of matches found during simplification, defaults to False.
    :return: Number of iterations of ``rewrite`` that had to be applied before no more matches were found.
    """
    num_iterations = 0
    total_rewrites = 0
    while True:
        if matchf:
            if num: 
                matches = match(g, matchf, num = -1 if num == -1 else num-total_rewrites)
            else: 
                matches = match(g, matchf)
        elif num: 
            matches = match(g, num = -1 if num == -1 else num-total_rewrites)
        else: 
            matches = match(g)
        
        num_rewrites = len(matches)
        if num_rewrites == 0: break
        
        num_iterations += 1
        total_rewrites += num_rewrites
        
        if num_iterations == 1 and not quiet: print(f'{name}: ',end='')
        if not quiet: print(num_rewrites, end='')
        
        apply_rule(g,rewrite,matches)
        
        if not quiet: print('. ', end='')
        if stats is not None: stats.count_rewrites(name, num_rewrites)
        
        if total_rewrites == num: break
        
    if not quiet and num_iterations > 0: print(f' {num_iterations} iterations')
    return num_iterations

def pivot_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[ET], bool]] = None, quiet: bool = False, stats: Optional[Stats] = None) -> int:
    """Iteratively applies the pivot rule until there are no more matches"""
    return simp(g, 'pivot_simp', match_pivot_parallel, pivot, matchf=matchf, quiet=quiet, stats=stats)

def pivot_gadget_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[ET],bool]] = None, quiet: bool = False, stats: Optional[Stats] = None) -> int:
    """Iteratively applies the pivot_gadget rule until there are no more matches"""
    return simp(g, 'pivot_gadget_simp', match_pivot_gadget, pivot_gadget, matchf=matchf, quiet=quiet, stats=stats)

def pivot_boundary_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[ET], bool]]=None, quiet: bool = False, stats: Optional[Stats] = None) -> int:
    """Iteratively applies the pivot boundary rule until there are no more matches"""
    return simp(g, 'pivot_boundary_simp', match_pivot_boundary, pivot_gadget, matchf=matchf, quiet=quiet, stats=stats)

def lcomp_simp(g: BaseGraph[VT,ET], matchf:Optional[Callable[[VT],bool]] = None, quiet: bool = False, stats: Optional[Stats] = None) -> int:
    """Iteratively applies the local complementation rule until there are no more matches"""
    return simp(g, 'lcomp_simp', match_lcomp_parallel, lcomp, matchf=matchf, quiet=quiet, stats=stats)

def bialg_simp(g: BaseGraph[VT,ET], quiet:bool = False, stats: Optional[Stats] = None) -> int:
    """Iteratively applies the bialgebra rule until there are no more matches"""
    return simp(g, 'bialg_simp', match_bialg_parallel, bialg, quiet=quiet, stats=stats)

def spider_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[VT],bool]] = None, quiet:bool = False, stats: Optional[Stats] = None) -> int:
    """Iteratively applies the spider fusion boundary rule until there are no more matches"""
    return simp(g, 'spider_simp', match_spider_parallel, spider, matchf=matchf, quiet=quiet, stats=stats)

def id_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[VT],bool]] = None, quiet: bool = False, stats: Optional[Stats] = None) -> int:
    """Iteratively applies the identity removal rule until there are no more matches"""
    return simp(g, 'id_simp', match_ids_parallel, remove_ids, matchf=matchf, quiet=quiet, stats=stats)

def id_fuse_simp(g: BaseGraph[VT,ET], matchf: Optional[Callable[[VT], bool]] = None, quiet :bool = False, stats: Optional[Stats] = None) -> int:
    """Iteratively applies the identity fusion rule (identity removal followed by spider fusion) until there are no more matches"""
    return simp(g, 'id_fuse', match_id_fuse, id_fuse, matchf=matchf, quiet=quiet, stats=stats)

def gadget_simp(g: BaseGraph[VT,ET], quiet: bool = False, stats:Optional[Stats] = None) -> int:
    """Iteratively applies the gadget fusion rule until there are no more matches"""
    return simp(g, 'gadget_simp', match_phase_gadgets, merge_phase_gadgets, quiet=quiet, stats=stats)

def supplementarity_simp(g: BaseGraph[VT,ET], quiet: bool = False, stats: Optional[Stats] = None) -> int:
    """Iteratively applies the supplementarity rule until there are no more matches"""
    return simp(g, 'supplementarity_simp', match_supplementarity, apply_supplementarity, quiet=quiet, stats=stats)

def copy_simp(g: BaseGraph[VT,ET], quiet: bool = False, stats: Optional[Stats] = None) -> int:
    """Copies 1-ary spiders with 0/pi phase through neighbors.
    WARNING: only use on maximally fused diagrams consisting solely of Z-spiders."""
    return simp(g, 'copy_simp', match_copy, apply_copy, quiet=quiet, stats=stats)

def phase_free_simp(g: BaseGraph[VT,ET], quiet: bool = False, stats: Optional[Stats] = None) -> int:
    '''Performs the following set of simplifications on the graph:
    spider -> bialg'''
    i1 = spider_simp(g, quiet=quiet, stats=stats)
    i2 = bialg_simp(g, quiet=quiet, stats=stats)
    return i1+i2

def basic_simp(g: BaseGraph[VT,ET], quiet: bool = True, stats: Optional[Stats] = None) -> int:
    """Keeps doing the simplifications ``id_simp``, ``spider_simp`` until none of them can be applied anymore."""
    j = 0
    while True:
        i1 = id_simp(g, quiet=quiet, stats=stats)
        i2 = spider_simp(g, quiet=quiet, stats=stats)
        if i1 + i2 == 0: break
        j += 1
    return j

def interior_clifford_simp(g: BaseGraph[VT,ET], quiet: bool = False, stats: Optional[Stats] = None) -> int:
    """Keeps doing the simplifications ``id_simp``, ``spider_simp``,
    ``pivot_simp`` and ``lcomp_simp`` until none of them can be applied anymore."""
    spider_simp(g, quiet=quiet, stats=stats)
    to_gh(g)
    i = 0
    while True:
        i1 = id_simp(g, quiet=quiet, stats=stats)
        i2 = spider_simp(g, quiet=quiet, stats=stats)
        i3 = pivot_simp(g, quiet=quiet, stats=stats)
        i4 = lcomp_simp(g, quiet=quiet, stats=stats)
        if i1+i2+i3+i4==0: break
        i += 1
    return i

def clifford_simp(g: BaseGraph[VT,ET], quiet: bool = True, stats: Optional[Stats] = None) -> int:
    """Keeps doing rounds of :func:`interior_clifford_simp` and
    :func:`pivot_boundary_simp` until they can't be applied anymore."""
    i = 0
    while True:
        i += interior_clifford_simp(g, quiet=quiet, stats=stats)
        i2 = pivot_boundary_simp(g, quiet=quiet, stats=stats)
        if i2 == 0:
            break
    return i

def reduce_scalar(g: BaseGraph[VT,ET], quiet: bool = True, stats: Optional[Stats] = None) -> int:
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

def full_reduce(g: BaseGraph[VT,ET], quiet: bool = True, stats: Optional[Stats] = None) -> None:
    """The main simplification routine of PyZX. It uses a combination of :func:`clifford_simp` and
    the gadgetization strategies :func:`pivot_gadget_simp` and :func:`gadget_simp`."""
    interior_clifford_simp(g, quiet=quiet, stats=stats)
    pivot_gadget_simp(g,quiet=quiet, stats=stats)
    while True:
        clifford_simp(g,quiet=quiet, stats=stats)
        i = gadget_simp(g, quiet=quiet, stats=stats)
        interior_clifford_simp(g,quiet=quiet, stats=stats)
        j = pivot_gadget_simp(g,quiet=quiet, stats=stats)
        if i+j == 0: 
            break


class PhaseTeleporter(Generic[VT, ET]):
    """Class used for phase teleportation."""
    def __init__(self, g: BaseGraph[VT,ET]) -> None:
        self.original_graph: BaseGraph[VT,ET] = g.copy()
        self.parent_vertex: Dict[VT,VT] = {}
        self.vertex_rank: Dict[VT,int] = {}
        self.phase_mult: Dict[VT,int] = {}
        self.non_clifford_vertices: Set[VT] = set()
        for v in self.original_graph.vertices():
            if self.original_graph.phase(v).denominator > 2:
                self.parent_vertex[v] = v
                self.vertex_rank[v] = 0
                self.phase_mult[v] = 1
                self.non_clifford_vertices.add(v)
    
    def parent(self, v: VT) -> VT:
        if self.parent_vertex[v] != v:
            self.parent_vertex[v] = self.parent(self.parent_vertex[v])
        return self.parent_vertex[v]
    
    def get_vertex_groups(self) -> List[List[VT]]:
        vertex_groups: defaultdict[VT,List[VT]] = defaultdict(list)
        for v in self.non_clifford_vertices:
            root = self.parent(v)
            vertex_groups[root].append(v)
        return list(vertex_groups.values())
    
    def fuse_phases(self, v1: VT, v2: VT) -> None:
        if not all(v in self.non_clifford_vertices for v in (v1, v2)): return
        self.parent_vertex[v2] = v1
        self.vertex_rank[v2] = self.vertex_rank[v1]
        self.vertex_rank[v1] += 1
    
    def phase_negate(self, v: VT) -> None:
        root = self.parent(v)
        verts = [vert for vert in self.non_clifford_vertices if self.parent(vert) == root]
        for vert in verts:
            self.phase_mult[vert] *= -1
    
    def init_simplify_graph(self, fusing_mode: bool = True) -> None:
        self.simplify_graph = self.original_graph.clone()
        self.simplify_graph.set_phase_teleporter(self, fusing_mode)
    
    def teleport_phases(self, store:bool = False) -> None:
        self.init_simplify_graph()
        full_reduce(self.simplify_graph)
        self.init_simplify_graph(fusing_mode = False)
        if not store: self.simplify_graph.place_tracked_phases()

def teleport_reduce(g: BaseGraph[VT,ET], store: bool = False) -> None:
    """This simplification procedure performs phase teleportation, running :func:`full_reduce` 
    to find simplifications which do not change the graph structure of the resulting diagram.
    The only thing that is different in the output graph are the location and value of the non-Clifford phases.
    ``store`` provides an option to store the different possiblities for the phases and locations without placing them on the graph `yet`, 
    giving more flexibility for future simplifications.
    Currently this is only of use when using :func:`flow_2Q_simp`.
    The phases can be placed at any time using ``g.place_tracked_phases()``

    :param g: The graph to be simplified
    :param store: Whether or not to store the phases rather than placing them onto the graph, defaults to False
    
    Warning:
        If ``store`` is True, the resulting graph will not represent the same graph as the original graph. Only once all phases have been placed will the graph be equal.
    """
    s = PhaseTeleporter(g)
    s.teleport_phases(store = store)
    g.replace(s.simplify_graph)


def selective_simp(
    g: BaseGraph[VT,ET],
    get_matches: Callable[..., List[MatchObject]],
    match_score: Callable[..., Optional[float]],
    update_matches: Callable[..., Dict[MatchObject, float]],
    rewrite: Callable[[BaseGraph[VT, ET],List[MatchObject]], RewriteOutputType[ET, VT]],
    matchf: Union[Optional[Callable[[VT], bool]], Optional[Callable[[ET], bool]]] = None,
    condition: Callable[..., bool] = lambda *args: True,
    num: int = -1,
    **kwargs: Any
    ) -> int:
    """Helper method for constructing simplification strategies in which each match is assigned a score, and 
    the highest score is iteratively chosen, updating the matches each time a rewrite has been performed.

    :param g: The graph to be simplified
    :param get_matches: A match function which takes ``g``, ``matchf`` and any ``**kwargs`` as inputs, 
                        and returns a list of matches (MatchObjects).
    :param heuristic: A heuristic function which takes in the graph, a MatchObject and any **kwargs, and outputs the score (a float)
                        of that match, and None if the match should be ignored.
    :param update_matches: Function which updates the dictionary of matches. Should take as inputs:
                            - The graph before the rewrite was applied
                            - The graph after the rewrite was applied
                            - The dictionary containing the current matches
                            - The ``get_matches`` function
                            - The ``heuristic`` function
                            - ``matchf``
                            - Any ``**kwargs``
                            The function should then return the updated dictionary of matches.
    :param rewrite: The rewrite function which accepts a match and performs the rewrite on the graph. 
                    This is passed into ::func::`~pyzx.rules.apply_rule`
    :param matchf: An optional filtering function for candidate vertices or edges. 
                        If provided should return False if a candidate should not be considered for a match. Defaults to None.
    :param condition: A function which accepts the graph after a rewrite has been applied as well as the associated ``MatchObject``. 
                        Should return True if the condition is fufilled, defaults to a lambda function which always returns True.
    :param num: The maximum number of successful rewrites to perform, defaults to -1.
    :return: The number of successful rewrites performed.
    """
    num_rewrites = 0
    matches = {}
    for match in get_matches(g, matchf, **kwargs):
        score = match_score(g=g, match=match, **kwargs)
        if score is None: continue
        matches[match] = score
    while matches and num_rewrites != num:
        match = max(matches, key=matches.__getitem__)
        check_g = g.clone()
        apply_rule(check_g, rewrite, [match])
        if condition(check_g, match):
            num_rewrites += 1
            matches = update_matches(g, check_g, matches, get_matches, match_score, matchf, **kwargs)
            g.replace(check_g)
            continue
        del matches[match]
    return num_rewrites

def flow_2Q_simp(
    g: BaseGraph[VT, ET],
    matchf: Union[Optional[Callable[[VT], bool]], Optional[Callable[[ET], bool]]] = None,
    cFlow: bool = True,
    rewrites: List[str] = ['id_fuse','lcomp','pivot'],
    score_weights: List[float] = [1,1,1],
    max_lc_unfusions: int = 0,
    max_p_unfusions: int = 0
    ) -> int:
    """Simplification strategy which aims to minimise the number of two qubit gates in the extracted circuit by selecting matches based on the heuristic |edges removed| - |vertices removed|.
    See https://arxiv.org/abs/2312.02793 for details.

    :param g: The graph to be simplified, for optimal performance should be put into graph-like form prior using ::func::`to_graph_like`.
    :param matchf: An optional filtering function for candidate vertices and edges.
                        If provided should return False if a candidate should not be considered for a match. Defaults to None.
    :param cFlow: Whether the existence of a causal flow should be preserved throughout simplification, defaults to True
    :param rewrites: Which rewrites to apply, defaults to ['id_fuse','lcomp','pivot']
    :param score_weights: Weighting factor for each of the three rewrites, defaults to [1,1,1]
    :param max_lc_unfusions: Maximum number of neighbours to unfuse for local complementation, defaults to 0
    :param max_p_unfusions: Maximum number of neighbours to unfuse on each vertex for pivoting, defaults to 0
    :return: The number of succeessful rewrites performed.
    """
    g.vertices_to_update = []
    
    if cFlow:
        flow_condition = lambda graph, match: True if match[2] else cflow(graph) is not None
    else: 
        def flow_condition(graph, match):
            if match[0] and len(match[0][2]) != 0:
                return gflow(graph) is not None
            if match[1] and (len(match[1][2][0]) != 0 or len(match[1][2][1]) != 0):
                return gflow(graph) is not None
            return True
        
    return selective_simp(g, match_2Q_simp, match_score_2Q_simp, update_2Q_simp_matches, rewrite_2Q_simp, matchf, flow_condition, rewrites=rewrites, score_weights=score_weights, max_lc_unfusions=max_lc_unfusions, max_p_unfusions=max_p_unfusions) #type:ignore

def match_score_2Q_simp(g: BaseGraph[VT, ET], match: MatchUnfuseType, score_weights: List[float] = [1,1,1], **kwargs) -> Optional[float]:
    """Function which returns the score for a ``UnfuseMatchType``."""
    if match[0]: return lcomp_2Q_simp_heuristic(g, match[0], score_weights[0])
    if match[1]: return pivot_2Q_simp_heuristic(g, match[1], score_weights[1])
    if match[2]: return id_fuse_2Q_reduce_heuristic(g, match[2], score_weights[2])

def update_2Q_simp_matches(
    g_before: BaseGraph[VT, ET],
    g_after: BaseGraph[VT, ET],
    current_matches: Dict[MatchUnfuseType, float],
    get_matches: Callable[..., List[MatchUnfuseType]],
    match_score: Callable[..., Optional[float]],
    matchf: Union[Optional[Callable[[VT], bool]], Optional[Callable[[ET], bool]]] = None,
    **kwargs: Any
    ) -> Dict[MatchUnfuseType, float]:
    """Function which updates matches for ::func::`flow_2Q_simp`, rechecking any candidate vertices and edges which have been effected by the rewrite performed"""
    before_vertices = set(g_before.vertices())
    after_vertices, after_edges = set(g_after.vertices()), set(g_after.edges())
    
    removed_vertices = before_vertices - after_vertices
    changed_vertices = {v for v in after_vertices if v in g_after.vertices_to_update or g_after.neighbors(v) != g_before.graph.get(v, {}).keys()} # type: ignore
    
    vertices_to_update = changed_vertices | {n for v in changed_vertices for n in g_after.neighbors(v)}
    edges_to_update = {(v1,v2) for v1 in vertices_to_update for v2 in vertices_to_update if v1 < v2 and (v1, v2) in after_edges}
    
    matches_to_update = vertices_to_update | edges_to_update
    update_matchf = lambda candidate: candidate in matches_to_update and (not matchf or matchf(candidate))
    new_matches = get_matches(g_after, update_matchf, **kwargs)
    
    updated_matches_dict = {}
    for m, score in current_matches.items():
        if m[0] and m[0][0] in vertices_to_update | removed_vertices: continue
        elif m[1] and (all(v in vertices_to_update for v in [m[1][0],m[1][1]]) or any(v in removed_vertices for v in [m[1][0],m[1][1]])): continue
        elif m[2] and m[2][0] in vertices_to_update | removed_vertices: continue
        updated_matches_dict[m] = score
    
    for m in new_matches:
        m_score = match_score(g=g_after, match=m, **kwargs)
        if m_score is None: continue
        updated_matches_dict[m] = m_score
        
    g_after.vertices_to_update = []
    return updated_matches_dict


def to_gh(g: BaseGraph[VT,ET], quiet: bool = True) -> None:
    """Turns every red node into a green node by changing regular edges into hadamard edges"""
    ty = g.types()
    for v in g.vertices():
        if ty[v] == VertexType.X:
            g.set_type(v, VertexType.Z)
            for e in g.incident_edges(v):
                et = g.edge_type(e)
                g.set_edge_type(e, toggle_edge(et))

def to_rg(g: BaseGraph[VT,ET], select: Optional[Callable[[VT], bool]] = None) -> None:
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

def to_graph_like(g: BaseGraph[VT,ET], assert_bound_connections: bool = True) -> None:
    """Puts a ZX-diagram in graph-like form. 
    If ``assert_bound_connections`` is False, the conditions on inputs/output connections are not enforced."""
    to_gh(g)
    spider_simp(g, quiet=True)
    
    if not assert_bound_connections: return
    
    for b in [v for v in g.vertices() if g.type(v) == VertexType.BOUNDARY]:
        for n in list(g.neighbors(b)):
            if g.edge_type(g.edge(b,n)) == EdgeType.HADAMARD:
                z = g.add_vertex(VertexType.Z)
                g.add_edge(g.edge(b,z), edgetype=EdgeType.SIMPLE)
                g.add_edge(g.edge(z,n), edgetype=EdgeType.HADAMARD)
                g.remove_edge(g.edge(b,n))
            elif g.type(n) == VertexType.BOUNDARY:
                z1 = g.add_vertex(VertexType.Z)
                z2 = g.add_vertex(VertexType.Z)
                z3 = g.add_vertex(VertexType.Z)
                g.add_edge(g.edge(b,z1), edgetype=EdgeType.SIMPLE)
                g.add_edge(g.edge(z1,z2), edgetype=EdgeType.HADAMARD)
                g.add_edge(g.edge(z2,z3), edgetype=EdgeType.HADAMARD)
                g.add_edge(g.edge(z3,n), edgetype=EdgeType.SIMPLE)
                g.remove_edge(g.edge(b,n))
    
    for v in [v for v in g.vertices() if g.type(v) == VertexType.Z]:
        boundary_ns = [n for n in g.neighbors(v) if g.type(n)==VertexType.BOUNDARY]
        if len(boundary_ns) <= 1: continue
        for b in boundary_ns[:-1]:
            z1 = g.add_vertex(VertexType.Z)
            z2 = g.add_vertex(VertexType.Z)
            g.add_edge(g.edge(b,z1), edgetype=EdgeType.SIMPLE)
            g.add_edge(g.edge(z1,z2), edgetype=EdgeType.HADAMARD)
            g.add_edge(g.edge(z2,v), edgetype=EdgeType.HADAMARD)
            g.remove_edge(g.edge(b,v))

def is_graph_like(g, assert_bound_connections: bool = True):
    """Returns True if a ZX-diagram is graph-like.
    If ``assert_bound_connections`` is False, the conditions on inputs/output connections are not enforced."""
    for v in g.vertices():
        if g.type(v) not in [VertexType.Z, VertexType.BOUNDARY]: return False
        if assert_bound_connections and g.type(v) == VertexType.Z and len([n for n in g.neighbors(v) if g.type(n)==VertexType.BOUNDARY]) > 1: return False
    
    for e in g.edges():
        if not assert_bound_connections:
            if g.type(e[0]) == g.type(e[1]) == VertexType.Z and g.edge_type(e) != EdgeType.HADAMARD: return False
        elif g.edge_type(e) == EdgeType.SIMPLE and g.type(e[0]) == g.type(e[1]): return False
        elif g.edge_type(e) == EdgeType.HADAMARD and (g.type(e[0]) != VertexType.Z or g.type(e[1]) != VertexType.Z): return False
        
    return True

def tcount(g: Union[BaseGraph[VT,ET], Circuit]) -> int:
    """Returns the amount of nodes in g that have a non-Clifford phase."""
    if isinstance(g, Circuit): return g.tcount()
    phases = g.phases()
    return len([v for v in g.vertices() if phases[v] != 0 and phases[v].denominator > 2])


# THE FUNCTIONS BELOW HAVEN'T BEEN UPDATED IN A WHILE. USE AT YOUR OWN RISK.

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
        if g.edge_type(e) == EdgeType.HADAMARD or g.phase(v) != 0:
            h = g.add_vertex(VertexType.Z, q, row=1, phase=g.phase(v))
            g.add_edge(g.edge(i,h),EdgeType.HADAMARD)
            g.add_edge(g.edge(h,v),EdgeType.SIMPLE)
            g.remove_edge(e)
            g.set_phase(v,0)
            inputs[q] = h
    
    for q in range(len(outputs)):
        v = v_outputs[q]
        o = outputs[q]
        e = g.edge(v,o)
        if g.edge_type(e) == EdgeType.HADAMARD or g.phase(v) != 0:
            h = g.add_vertex(VertexType.Z, q, row=7, phase=g.phase(v))
            g.add_edge(g.edge(h,o),EdgeType.HADAMARD)
            g.add_edge(g.edge(v,h),EdgeType.SIMPLE)
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
        g.add_edge(g.edge(inputs[q],w))
        g.add_edge(g.edge(w,v_inputs[q]))
        cz_v[q] = w
    for q1,q2 in czs:
        g.add_edge(g.edge(cz_v[q1],cz_v[q2]),EdgeType.HADAMARD)
    
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
        g.add_edge(g.edge(w,outputs[q]))
        g.add_edge(g.edge(v_outputs[q],w))
        cz_v[q] = w
    for q1,q2 in czs:
        g.add_edge(g.edge(cz_v[q1],cz_v[q2]),EdgeType.HADAMARD)
    
    to_rg(g,select=lambda v: v in v_outputs)
