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


"""
This module contains the implementation of the identity rule

This rule acts on a single edge, taken as an input of two vertices. The check function returns a boolean indicating
whether the two vertices are connected in the graph. The safe version of the applier (add_Z_identity) will automatically
call the check_edge, while the unsafe version of the applier will assume that the given input is correct and will apply
the rule without running the check first.

This rewrite rule can be called using the simplify.add_identity_rewrite.apply(g, v, w)
"""



__all__ = ['check_edge',
           'add_Z_identity',
           'unsafe_add_Z_identity']

from pyzx.utils import EdgeType, VertexType
from pyzx.graph.base import BaseGraph, VT, ET, upair



def check_edge(g: BaseGraph[VT,ET], v:VT, w:VT) -> bool:
    """Checks if two vertices are connected in the graph.
     """
    if not (v in g.vertices() and w in g.vertices()): return False
    if not g.connected(v,w): return False
    return True

def add_Z_identity( g: BaseGraph[VT,ET], v:VT, w:VT) -> bool:
    """First checks if the 2 given vertices are connected by an edge, and then adds a Z spider to that edge.
     """
    if check_edge(g,v,w): return unsafe_add_Z_identity(g,v,w)
    return False


def unsafe_add_Z_identity(g: BaseGraph[VT,ET], v:VT, w:VT) -> bool:
    """Adds a Z spider to the edge given by the input vertices"""
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