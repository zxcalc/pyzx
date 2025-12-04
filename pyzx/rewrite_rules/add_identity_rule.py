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






__all__ = ['check_edge',
           'add_Z_identity',
           'unsafe_add_Z_identity']



from typing import Tuple

from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, VT, ET, upair

MatchSelfLoopType = Tuple[VT, int, int]



def check_edge( g: BaseGraph[VT,ET], v:VT, w:VT) -> bool:
    if not (v in g.vertices() and w in g.vertices()): return False
    if not g.connected(v,w): return False
    return True

def add_Z_identity( g: BaseGraph[VT,ET], v:VT, w:VT) -> bool:
    if check_edge(g,v,w): return unsafe_add_Z_identity(g,v,w)
    return False


def unsafe_add_Z_identity(g: BaseGraph[VT,ET], v:VT, w:VT) -> bool:

    etab = {}

    e = g.edge(v, w)
    et = g.edge_type(e)

    v1,v2 = g.edge_st(e)
    r = 0.5*(g.row(v1) + g.row(v2))
    q = 0.5*(g.qubit(v1) + g.qubit(v2))
    w = g.add_vertex(VertexType.Z, q,r, 0)
    etab[upair(v1,w)] = [1,0] if et == EdgeType.SIMPLE else [0,1]
    etab[upair(v2,w)] = [1,0]


    g.add_edge_table(etab)
    g.remove_edge(e)

    return True