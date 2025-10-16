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

__all__ = ['check_remove_id',
           'remove_id',
           'unsafe_remove_id']

## seperate into 3 parts: overarching, zx remove, w remove. have overarching be in __all__

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.utils import EdgeType, VertexType, get_z_box_label, vertex_is_w, get_w_io


def check_remove_id(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not (v in g.vertices()): return False

    if vertex_is_w(g.type(v)):
        return check_remove_id_w(g, v)

    return check_remove_zx(g, v)


def remove_id(g: BaseGraph[VT,ET], v: VT) -> bool:
    if vertex_is_w(g.type(v)) and check_remove_id_w(g, v):
        return unsafe_remove_id_w(g, v)

    if check_remove_id(g, v):
        return unsafe_remove_zx(g, v)

    return False


def unsafe_remove_id(g: BaseGraph[VT,ET], v: VT) -> bool:
    if vertex_is_w(g.type(v)):
        return unsafe_remove_id_w(g, v)

    return unsafe_remove_zx(g, v)




# Remove identity subrules

def check_remove_zx(g: BaseGraph[VT,ET], v: VT) -> bool:
    if not g.vertex_degree(v) == 2:
        return False
    if g.type(v) == VertexType.Z_BOX and get_z_box_label(g, v) == 1:
        return True
    elif g.type(v) != VertexType.Z_BOX and g.phase(v) == 0:
        return True
    return False

def unsafe_remove_zx(g: BaseGraph[VT,ET], v: VT) -> bool:
    neighbors = list(g.neighbors(v))
    if len(neighbors) == 2:
        v1, v2 = neighbors[0], neighbors[1]
    else: # self loop
        v1, v2 = neighbors[0], neighbors[0]
    g.add_edge((v1,v2), edgetype=EdgeType.SIMPLE
    if g.edge_type(g.edge(v,v1)) == g.edge_type(g.edge(v,v2))
    else EdgeType.HADAMARD)
    g.remove_vertex(v)
    return True

def check_remove_id_w(g: BaseGraph[VT, ET], v: VT) -> bool:
    w_in, w_out = get_w_io(g, v)
    return g.vertex_degree(w_out) == 2

def unsafe_remove_id_w(g: BaseGraph[VT, ET], v: VT) -> bool:
    w_in, w_out = get_w_io(g, v)
    v1 = [n for n in g.neighbors(w_out) if n != w_in][0]
    v2 = [n for n in g.neighbors(w_in) if n != w_out][0]
    g.add_edge((v1, v2), edgetype=EdgeType.SIMPLE
    if g.edge_type(g.edge(w_out, v1)) == g.edge_type(g.edge(w_in, v2))
        else EdgeType.HADAMARD)
    g.remove_vertex(w_in)
    g.remove_vertex(w_out)
    return True
