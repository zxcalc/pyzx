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

from typing import List, Callable, Optional, Union, Generic, Tuple, Dict, Iterator, cast
from .graph.base import BaseGraph, VT, ET
from .graph.base import BaseGraph, VT, ET



class Rewrite(object):
    
    def __init__(self, is_match: Callable[[BaseGraph[VT,ET]], VT] | Callable[[BaseGraph[VT, ET]], tuple[VT,VT]], applyer: Callable[[BaseGraph[VT,ET]], VT]| Callable[[BaseGraph[VT, ET]], tuple[VT,VT]]) -> None:
        self.__doc__ = is_match.__doc__

    def find_all_matches (self, graph) -> list:
        # Must be implemented by subclass
        pass

    def simp(self, graph):
        matches = self.find_all_matches(graph)
        for m in matches:
            self.applyer(graph, m)
            
    def __call__(self, graph) :
        self. simp (graph)

class RewriteSingleVertex(Rewrite):
    def __init__(self, is_match: Callable[[BaseGraph[VT,ET]], VT], applyer: Callable[[BaseGraph[VT,ET]], VT]) -> None:
        self.__doc__ = is_match.__doc__ + applyer.__doc__

    def find_all_matches (self, graph) -> list:
        all_matches = []
        for v in graph.vertices():
            if self.is_match(graph, v):
                all_matches.append(v)
        return all_matches

class RewriteDoubleVertex(Rewrite):
    # Matcher takes in single vertex
    pass