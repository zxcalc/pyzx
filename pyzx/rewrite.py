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

"""This module contains the ZX-diagram rewrite class of PyZX.
It is part of a major reworking of how the rule and simplify files 
work to perform the rewrite rules on diagrams."""

from typing import List, Callable, Optional, Union, Generic, Set, Tuple, Dict, Iterator, cast
from .graph.base import BaseGraph, VT, ET

class Rewrite(object):

    def __init__(self) -> None:
        pass

    def simp(self, graph) -> None:
        raise Exception("This rewrite rule cannot terminate when run automatically. Try using apply() instead to manually target vertices.")

    def __call__(self, graph) -> None:
        self.simp(graph)

class RewriteSingleVertex(Rewrite):
    applier: Callable[[BaseGraph[VT, ET], VT], bool]
    is_match: Callable[[BaseGraph[VT, ET], VT], bool]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT], bool]) -> None:
        super().__init__()
        self.is_match = is_match
        self.applier = applier
        self.__doc__ = is_match.__doc__

    def apply(self, graph: BaseGraph[VT, ET], v: VT) -> None:
        if self.is_match(graph, v):
            self.applier(graph, v)


class RewriteSimpSingleVertex(RewriteSingleVertex):
    simp_match: Optional[Callable[[BaseGraph[VT, ET], VT], bool]]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT], bool],
                 simp_match: Optional[Callable[[BaseGraph[VT, ET], VT], bool]] = None) -> None:
        super().__init__(is_match, applier)
        self.simp_match = simp_match

    def find_all_matches (self, graph: BaseGraph[VT, ET]) -> Set[VT]:
        all_matches: Set[VT] = set()
        if self.simp_match is not None:
            match = self.simp_match
        else:
            match = self.is_match

        for v in graph.vertices():
            if match(graph, v):
                all_matches.add(v)
        return all_matches

    def simp(self, graph: BaseGraph[VT, ET]) -> None:
        if self.simp_match is not None:
            match = self.simp_match
        else:
            match = self.is_match

        while True:
            j = 0
            all_matches = self.find_all_matches(graph)
            for m in all_matches:
                if match(graph, m):
                    j += 1
                    self.applier(graph, m)
            if j == 0:
                break

class RewriteDoubleVertex(Rewrite):
    applier: Callable[[BaseGraph[VT, ET], VT, VT], bool]
    is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT, VT], bool]) -> None:
        super().__init__()
        self.is_match = is_match
        self.applier = applier
        self.__doc__ = is_match.__doc__

    def apply(self, graph: BaseGraph[VT, ET], v1: VT, v2: VT) -> None:
        if self.is_match(graph, v1, v2):
            self.applier(graph, v1, v2)


class RewriteSimpDoubleVertex(RewriteDoubleVertex):
    simp_match: Optional[Callable[[BaseGraph[VT, ET], VT, VT], bool]]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 simp_match: Optional[Callable[[BaseGraph[VT, ET], VT, VT], bool]] = None) -> None:
        super().__init__(is_match, applier)
        self.simp_match = simp_match

    def find_all_matches (self, graph: BaseGraph[VT, ET]) -> Set[Tuple[VT, VT]]:
        all_matches: Set[VT] = set()
        if self.simp_match is not None:
            match = self.simp_match
        else:
            match = self.is_match

        for v1 in graph.vertices():
            for v2 in graph.neighbors(v1):
                if match(graph, v1, v2):
                    all_matches.add(tuple(sorted((v1, v2))))
        return all_matches

    def simp(self, graph: BaseGraph[VT, ET]) -> None:
        if self.simp_match is not None:
            match = self.simp_match
        else:
            match = self.is_match

        while True:
            j = 0
            all_matches = self.find_all_matches(graph)

            for m in all_matches:
                if match(graph, m[0], m[1]):
                    j += 1
                    self.applier(graph, m[0], m[1])

            if j == 0:
                break