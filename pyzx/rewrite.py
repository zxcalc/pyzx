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

"""This module contains the ZX-diagram Rewrite class of PyZX.
Rewrites in pyzx are usually specified by a matcher function and an applier function.
Depending on the rule, the matcher might match on one vertex, two vertices, or something more complicated.
The applier then performs the rewrite on the matched vertices.
The matcher and applier functions are then wrapped in a Rewrite class instance to provide additional functionality.

The Rewrite class comes in several variants, depending on whether the rewrite can be applied automatically
on the entire graph or only manually on specific vertices.
The RewriteSingleVertex and RewriteDoubleVertex classes can only be run manually on specific vertices,
while the RewriteSimpSingleVertex and RewriteSimpDoubleVertex classes can also be run automatically on the entire graph.
The RewriteSimpGraph class is for rewrites that act on the entire graph at once, and cannot be run manually on specific vertices,
because their behaviour is too complex to fit into these other cases.
"""

from typing import Callable, Optional, Generic, Set, Tuple, List

from .graph.base import BaseGraph, VT, ET

class Rewrite(Generic[VT, ET]):

    def __init__(self) -> None:
        pass

    def simp(self, graph: BaseGraph[VT, ET]) -> bool:
        raise Exception("This rewrite rule cannot terminate when run automatically. Try using apply() instead to manually target vertices.")

    def __call__(self, graph: BaseGraph[VT, ET]) -> bool:
        return self.simp(graph)

class RewriteSingleVertex(Rewrite[VT, ET]):
    """
    Rewrite class that works on a single vertex. Can only be run manually on specific vertices, otherwise may enter an infinite loop.
    Parameters
    ----------
    applier : Callable[[BaseGraph[VT, ET], VT], bool]
        function that will perform the rewrite rule.
    is_match : Callable[[BaseGraph[VT, ET], VT], bool]
        function that checks whether a given vertex can be rewritten.
    rmv_isolated : bool
        whether to remove isolated vertices after running the applier.
    """

    applier: Callable[[BaseGraph[VT, ET], VT], bool]
    is_match: Callable[[BaseGraph[VT, ET], VT], bool]
    rmv_isolated: bool


    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT], bool],
                 rmv_isolated: bool = False) -> None:
        super().__init__()
        self.is_match = is_match
        self.applier = applier
        self.rmv_isolated = rmv_isolated

    def apply(self, graph: BaseGraph[VT, ET], v: VT) -> bool:
        applied: bool = False
        if self.is_match(graph, v):
            applied = self.applier(graph, v)
            if self.rmv_isolated:
                graph.remove_isolated_vertices()
        return applied

class RewriteSimpSingleVertex(RewriteSingleVertex[VT, ET]):
    """
    Rewrite class that works on a single vertex. Can be run automatically using simp(g)
    Parameters
    ----------
    applier : Callable[[BaseGraph[VT, ET], VT], bool]
        function that will perform the rewrite rule.
    is_match : Callable[[BaseGraph[VT, ET], VT], bool]
        function that checks whether a given vertex can be rewritten.
    simp_match : Optional[Callable[[BaseGraph[VT, ET], VT], bool]]
        optional function that checks whether graph can be rewritten automatically.
    rmv_isolated : bool
        whether to remove isolated vertices after running the applier.
    """
    simp_match: Optional[Callable[[BaseGraph[VT, ET], VT], bool]]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT], bool],
                 simp_match: Optional[Callable[[BaseGraph[VT, ET], VT], bool]] = None,
                 rmv_isolated: bool = False) -> None:
        super().__init__(is_match, applier, rmv_isolated)
        self.simp_match = simp_match

    def find_all_matches(self, graph: BaseGraph[VT, ET]) -> Set[VT]:
        all_matches: Set[VT] = set()
        if self.simp_match is not None:
            match = self.simp_match
        else:
            match = self.is_match

        for v in graph.vertices():  # Make a subset of vertices
            if match(graph, v):
                all_matches.add(v)
        return all_matches

    def simp(self, graph: BaseGraph[VT, ET]) -> bool:
        if self.simp_match is not None:
            match = self.simp_match
        else:
            match = self.is_match
        applied: bool = False
        while True:
            j = 0
            all_matches = self.find_all_matches(graph)
            for m in all_matches:
                if match(graph, m):
                    j += 1
                    self.applier(graph, m)
                    applied = True
                    if self.rmv_isolated:
                        graph.remove_isolated_vertices()
            if j == 0: break
        return applied

class RewriteDoubleVertex(Rewrite[VT, ET]):
    """
    Rewrite class that works on two vertices. Can only be run manually on specific vertices, otherwise may enter an infinite loop.
    Parameters
    ----------
    applier : Callable[[BaseGraph[VT, ET], VT, VT], bool]
        function that will perform the rewrite rule.
    is_match : Callable[[BaseGraph[VT, ET], VT, VT], bool]
        function that checks whether the given vertices can be rewritten.
    rmv_isolated : bool
        whether to remove isolated vertices after running the applier.
    """
    applier: Callable[[BaseGraph[VT, ET], VT, VT], bool]
    is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 rmv_isolated: bool = False) -> None:
        super().__init__()
        self.is_match = is_match
        self.applier = applier
        self.rmv_isolated = rmv_isolated

    def apply(self, graph: BaseGraph[VT, ET], v1: VT, v2: VT) -> bool:
        applied: bool = False
        if self.is_match(graph, v1, v2):
            applied = self.applier(graph, v1, v2)
            if self.rmv_isolated:
                graph.remove_isolated_vertices()
        return applied


class RewriteSimpDoubleVertex(RewriteDoubleVertex[VT, ET]):
    """
    Rewrite class that works on two vertices. Can be run automatically using simp(g)
    Parameters
    ----------
    applier : Callable[[BaseGraph[VT, ET], VT, VT], bool]
        function that will perform the rewrite rule.
    is_match : Callable[[BaseGraph[VT, ET], VT, VT], bool]
        function that checks whether the given vertices can be rewritten.
    simp_match : Optional[Callable[[BaseGraph[VT, ET], VT, VT], bool]]
        optional function that checks whether graph can be rewritten automatically.
    rmv_isolated : bool
        whether to remove isolated vertices after running the applier.
    is_ordered : bool
        whether to order vertices after running the check.
    """
    simp_match: Optional[Callable[[BaseGraph[VT, ET], VT, VT], bool]]
    is_ordered: bool

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 simp_match: Optional[Callable[[BaseGraph[VT, ET], VT, VT], bool]] = None,
                 is_ordered: bool = False,
                 rmv_isolated: bool = False) -> None:
        super().__init__(is_match, applier, rmv_isolated)
        self.simp_match = simp_match
        self.is_ordered = is_ordered

    def find_all_matches (self, graph: BaseGraph[VT, ET]) -> Set[Tuple[VT, VT]]:
        all_matches: Set[Tuple[VT, VT]] = set()
        if self.simp_match is not None:
            match = self.simp_match
        else:
            match = self.is_match

        for v1 in graph.vertices():
            for v2 in graph.neighbors(v1):
                if v1 == v2: continue
                if match(graph, v1, v2):
                    pair = (v1, v2) if (self.is_ordered or v1 <= v2) else (v2, v1)
                    all_matches.add(pair)
        return all_matches

    def simp(self, graph: BaseGraph[VT, ET]) -> bool:
        if self.simp_match is not None:
            match = self.simp_match
        else:
            match = self.is_match

        applied: bool = False
        while True:
            j = 0
            all_matches = self.find_all_matches(graph)

            for m in all_matches:
                if match(graph, m[0], m[1]):
                    j += 1
                    self.applier(graph, m[0], m[1])
                    applied = True
                    if self.rmv_isolated:
                        graph.remove_isolated_vertices()
            if j == 0:
                break
        return applied

class RewriteSimpGraph(Rewrite[VT, ET]):
    """Applies the rewrite rule on the entire graph, running manually on specific vertices will result in undefined behavior
    Parameters
    ----------
    applier : Callable[[BaseGraph[VT, ET], VT, VT], bool]
        function that both checks if a rewrite can be done and performs the rule.
    is_match : Callable[[BaseGraph[VT, ET], VT], bool]
        function that checks whether the given vertices can be rewritten.
    simp_match : Optional[Callable[[BaseGraph[VT, ET], VT], bool]]
        function that checks whether graph can be rewritten automatically (may be a placeholder function)
    simp_applier : Callable[[BaseGraph[VT, ET]], bool]
        that both checks if a rewrite can be done and performs the rule on the entire graph.
    """
    applier: Callable[[BaseGraph[VT, ET], List[VT]], bool]
    is_match: Callable[[BaseGraph[VT, ET], List[VT]], bool]
    simp_match: Callable[[BaseGraph[VT, ET]], bool]
    simp_applier: Callable[[BaseGraph[VT, ET]], bool]
    is_ordered: bool

    def __init__(self,
                 applier: Callable[[BaseGraph[VT, ET], List[VT]], bool],
                 simp_applier: Callable[[BaseGraph[VT, ET]], bool]) -> None:
        super().__init__()
        self.applier = applier
        self.simp_applier = simp_applier


    def apply(self, graph: BaseGraph[VT, ET], vertices: List[VT]) -> bool:
        return self.applier(graph, vertices)

    def simp(self, graph: BaseGraph[VT, ET]) -> bool:
        return  self.simp_applier(graph)

