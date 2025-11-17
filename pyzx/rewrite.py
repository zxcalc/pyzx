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

from pyzx import VertexType
from .graph.base import BaseGraph, VT, ET

class Rewrite(Generic[VT, ET]):

    def __init__(self) -> None:
        pass

    def simp(self, graph) -> bool:
        raise Exception("This rewrite rule cannot terminate when run automatically. Try using apply() instead to manually target vertices.")

    def __call__(self, graph) -> bool:
        return self.simp(graph)

class RewriteSingleVertex(Rewrite[VT, ET]):
    applier: Callable[[BaseGraph[VT, ET], VT], bool]
    is_match: Callable[[BaseGraph[VT, ET], VT], bool]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT], bool]) -> None:
        super().__init__()
        self.is_match = is_match
        self.applier = applier
        self.__doc__ = is_match.__doc__

    def apply(self, graph: BaseGraph[VT, ET], v: VT) -> bool:
        if self.is_match(graph, v):
            self.applier(graph, v)
            return True
        return False

class RewriteSimpSingleVertex(RewriteSingleVertex[VT, ET]):
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

        for v in graph.vertices():          #make optional subset of vertices
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
            if j == 0:
                break
        return applied

class RewriteSimpGraph(Rewrite[VT, ET]):
    applier: Callable[[BaseGraph[VT, ET]], bool]
    is_match: Callable[[BaseGraph[VT, ET]], bool]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET]], bool],
                 applier: Callable[[BaseGraph[VT, ET]], bool]) -> None:
        super().__init__()
        self.applier = applier
        self.is_match = is_match

    def simp(self, graph: BaseGraph[VT, ET]) -> bool:
        applied: bool = False
        if self.is_match(graph):
            self.applier(graph)
            applied = True
        return applied

class RewriteDoubleVertex(Rewrite[VT, ET]):
    applier: Callable[[BaseGraph[VT, ET], VT, VT], bool]
    is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT, VT], bool]) -> None:
        super().__init__()
        self.is_match = is_match
        self.applier = applier
        self.__doc__ = is_match.__doc__

    def apply(self, graph: BaseGraph[VT, ET], v1: VT, v2: VT) -> bool:
        if self.is_match(graph, v1, v2):
            self.applier(graph, v1, v2)
            return True
        return False


class RewriteSimpDoubleVertex(RewriteDoubleVertex[VT, ET]):
    simp_match: Optional[Callable[[BaseGraph[VT, ET], VT, VT], bool]]
    is_ordered: bool

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 simp_match: Optional[Callable[[BaseGraph[VT, ET], VT, VT], bool]] = None,
                 is_ordered: bool = False) -> None:
        super().__init__(is_match, applier)
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
            if j == 0:
                break
        return applied

class RewriteApplyDoubleVertexOrSimpGraph(RewriteDoubleVertex[VT, ET]):
    simp_match: Callable[[BaseGraph[VT, ET]], bool]
    simp_applier: Callable[[BaseGraph[VT, ET]], bool]
    is_ordered: bool

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT, VT], bool],
                 simp_match: Callable[[BaseGraph[VT, ET]], bool],
                 simp_applier: Callable[[BaseGraph[VT, ET]], bool]) -> None:
        super().__init__(is_match, applier)
        self.simp_match = simp_match
        self.simp_applier = simp_applier

    def simp(self, graph: BaseGraph[VT, ET]) -> bool:
        applied: bool = False
        if self.simp_match(graph):
            self.simp_applier(graph)
            applied = True
        return applied


class RewriteTripleVertex(Rewrite[VT, ET]):
    applier: Callable[[BaseGraph[VT, ET], VT, VT, VT], bool]
    is_match: Callable[[BaseGraph[VT, ET], VT, VT, VT], bool]

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT, VT, VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT, VT, VT], bool]) -> None:
        super().__init__()
        self.is_match = is_match
        self.applier = applier
        self.__doc__ = is_match.__doc__

    def apply(self, graph: BaseGraph[VT, ET], v1: VT, v2: VT, v3:VT) -> bool:
        if self.is_match(graph, v1, v2, v3):
            self.applier(graph, v1, v2, v3)
            return True
        return False


class RewriteSimpTripleVertex(RewriteTripleVertex[VT, ET]):
    simp_match: Optional[Callable[[BaseGraph[VT, ET], VT, VT, VT], bool]]
    is_ordered: bool

    def __init__(self, is_match: Callable[[BaseGraph[VT, ET], VT, VT, VT], bool],
                 applier: Callable[[BaseGraph[VT, ET], VT, VT, VT], bool],
                 simp_match: Optional[Callable[[BaseGraph[VT, ET], VT, VT, VT], bool]] = None,
                 is_ordered: bool = False) -> None:
        super().__init__(is_match, applier)
        self.simp_match = simp_match
        self.is_ordered = is_ordered

    def find_all_matches (self, graph: BaseGraph[VT, ET]) -> Set[Tuple[VT,...]]:
        all_matches: Set[Tuple[VT,...]] = set()
        if self.simp_match is not None:
            match = self.simp_match
        else:
            match = self.is_match

        for v1 in graph.vertices():
            for v2 in graph.neighbors(v1):
                for v3 in graph.neighbors(v1):
                    if v2 != v3 and match(graph, v1, v2, v3):
                        if self.is_ordered:
                            all_matches.add((v1, v2, v3))
                        else:
                            m = list((v1, v2, v3))
                            m.sort()
                            m = tuple(m)
                            all_matches.add(m)
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
                if match(graph, m[0], m[1], m[2]):
                    j += 1
                    self.applier(graph, m[0], m[1], m[2])
                    applied = True
            if j == 0:
                break
        return applied
