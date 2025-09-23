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


__all__ = ['check_copy',
           'copy',
           'unsafe_copy']

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.rewrite_rules.color_change_rule import color_change_diagram
from pyzx.rewrite_rules.bialgebra_rule import bialgebra

from pyzx.utils import (EdgeType, VertexType, is_pauli)


def check_copy(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not (v in g.vertices()): return False

    swap_color: bool = False
    if g.type(v) == VertexType.Z:
        swap_color = True
        color_change_diagram(g)

    if not (g.vertex_degree(v) == 1 and
            g.type(v) == VertexType.X and
            is_pauli(g.phase(v))):
        if swap_color: color_change_diagram(g)
        return False

    nv = next(iter(g.neighbors(v)))
    if not (g.type(nv) == VertexType.Z and
            g.edge_type(g.edge(v,nv)) == EdgeType.SIMPLE):
        if swap_color: color_change_diagram(g)
        return False

    if swap_color: color_change_diagram(g)
    return True

def copy(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not check_copy(g, v): return False
    return check_copy(g, v)

def unsafe_copy(g: BaseGraph[VT,ET], v: VT) -> bool:
    swap_color: bool = False
    if g.type(v) == VertexType.Z:
        swap_color = True
        color_change_diagram(g)
    nv = next(iter(g.neighbors(v)))
    bialgebra(g, v, nv)
    if swap_color: color_change_diagram(g)
    return True

