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

__all__ = ['check_pauli',
           'pauli_push',
           'unsafe_pauli_push',]

from fractions import Fraction

from typing import List, Dict, Tuple

from pyzx.utils import EdgeType, VertexType, FractionLike, phase_is_pauli, vertex_is_zx, toggle_vertex
from pyzx.graph.base import BaseGraph, VT, ET, upair

def check_pauli(g: BaseGraph[VT,ET], v: VT, w: VT) -> bool:
    """Checks if a w is a Pauli and v is a spider we can push it through
    :param g: Graph to check
    :param v: Spider
    :param w: Pauli"""

    phases = g.phases()
    types = g.types()

    if not (v in g.vertices() and w in g.vertices()): return False
    if not g.connected(v, w): return False

    if not vertex_is_zx(types[w]): return False
    if isinstance(phases[w], (int, Fraction)) and phases[w] == 0: return False

    if not phase_is_pauli(phases[w]): return False

    if phase_is_pauli(phases[v]) and g.vertex_degree(v) == 2: return False

    et = g.edge_type(g.edge(v,w))

    if ((types[v] == types[w] and et == EdgeType.HADAMARD) or
        (vertex_is_zx(types[v]) and types[v] != types[w] and et == EdgeType.SIMPLE) or
        (types[v] == VertexType.H_BOX and phases[v] == 1 and (
            (et == EdgeType.SIMPLE and types[w] == VertexType.X) or
            (et == EdgeType.HADAMARD and types[w] == VertexType.Z)))
        ):
        return True
    return False


def pauli_push(g: BaseGraph[VT,ET], v:VT,w:VT) -> bool:
    """Pushes a Pauli (i.e. a pi phase) through another spider."""
    if check_pauli(g, v, w): return unsafe_pauli_push(g, w, v)
    return False


def unsafe_pauli_push(g: BaseGraph[VT,ET], v:VT, w:VT) -> bool:
    """Pushes a Pauli (i.e. a pi phase) through another spider.
    :param g: Graph to push to
    :param v: Vertex to push through
    :param w: Pauli getting pushed"""

    rem_verts: List[VT] = []
    rem_edges: List[ET] = []
    etab: Dict[Tuple[VT,VT], List[int]] = dict()

    # w is a Pauli and v is the spider we are going to push it through

    if g.vertex_degree(w) == 2:
        rem_verts.append(w)
        l = list(g.neighbors(w))
        l.remove(v)
        v2 = l[0]
        et1 = g.edge_type(g.edge(v,w))
        et2 = g.edge_type(g.edge(v2,w))
        etab[upair(v,v2)] = [1,0] if et1 == et2 else [0,1]
    else:
        g.set_phase(w,0)

    new_verts = []
    if vertex_is_zx(g.type(v)):
        g.scalar.add_phase(g.phase(v))
        g.set_phase(v,((1 - 2 * g.phase(w)) * g.phase(v)) % 2) # 1-2a is -1 if a=1 (i.e. pi) and 1 if a=0 (i.e. 0). We need to do it this way to handle boolean symbolic phases
        t = toggle_vertex(g.type(v))
        p: FractionLike = g.phase(w)
    else:
        t = VertexType.Z
        p = 0
    for edge in g.incident_edges(v):
        st = g.edge_st(edge)
        n = st[0] if st[1] == v else st[1]
        if n == w: continue
        r = 0.5*(g.row(n) + g.row(v))
        q = 0.5*(g.qubit(n) + g.qubit(v))
        et = g.edge_type(edge)
        rem_edges.append(edge)
        w2 = g.add_vertex(t,q,r,p)
        etab[upair(v,w2)] = [1,0]
        etab[upair(n,w2)] = [1,0] if et == EdgeType.SIMPLE else [0,1]
        new_verts.append(w2)
    if not vertex_is_zx(g.type(v)): # v is H_BOX
        if len(new_verts) == 2:
            etab[upair(new_verts[0],new_verts[1])] = [0,1]
        else:
            r = (g.row(v) + sum(g.row(n) for n in new_verts)) / (len(new_verts) + 1)
            q = (g.qubit(v) + sum(g.qubit(n) for n in new_verts))/(len(new_verts)+1)
            h = g.add_vertex(VertexType.H_BOX,q,r,Fraction(1)) # TODO: check if Fraction(1) is correct in case of symbolic phases
            for n in new_verts: etab[upair(h,n)] = [1,0]

    g.add_edge_table(etab)
    g.remove_vertices(rem_verts)
    g.remove_edges(rem_edges)

    return True
