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

__all__ = ['check_zero_hbox',
           'zero_hbox',
           'unsafe_zero_hbox']


from typing import Dict, List, Tuple, Callable, Optional
from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, ET, VT, upair


def check_zero_hbox(g: BaseGraph[VT,ET], v:VT) -> bool:
    """Matches H-boxes that have a phase of 2pi==0."""
    types = g.types()
    phases = g.phases()
    if types[v] == VertexType.H_BOX and phases[v] == 0: return True
    return False


def zero_hbox(g: BaseGraph[VT,ET], v: VT) -> bool:
    if check_zero_hbox(g, v): return unsafe_zero_hbox(g, v)
    return False

def unsafe_zero_hbox(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Removes H-boxes with a phase of 2pi=0.
    Note that this rule is only semantically correct when all its neighbors are white spiders."""
    g.remove_vertex(v)

    return True
