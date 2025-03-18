
# PyZX - Python library for quantum circuit rewriting 
#        and optimization using the ZX-calculus
# Copyright (C) 2025 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from pyzx.graph.multigraph import Edge
from .utils import EdgeType, VertexType
from .graph.base import BaseGraph, VT, ET
from itertools import combinations
from fractions import Fraction

def check_fourier(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Returns True if the given node is an H-box adjacent to Z spiders"""
    ty = g.types()
    if (ty[v] == VertexType.H_BOX and
        all(ty[w] == VertexType.Z for w in g.neighbors(v)) and 
        all(g.edge_type(e) == EdgeType.SIMPLE for e in g.incident_edges(v))):
        return True
    else:
        return False

def fourier(g: BaseGraph[VT, ET], v: VT, graph_like: bool=False) -> bool:
    """Applies the graphical fourier transform, replacing the given H-box of arity k with
    2**k phase gadgets."""
    if not check_fourier(g, v): return False

    q,r = g.qubit(v), g.row(v)
    nhd = tuple(g.neighbors(v))
    ph = g.phase(v) * Fraction(1,2**(len(nhd)-1))
    g.remove_vertex(v)
    pos = r - 0.5*(2**len(nhd) - len(nhd))

    if graph_like:
        et = EdgeType.HADAMARD
        vt = VertexType.Z
    else:
        et = EdgeType.SIMPLE
        vt = VertexType.X

    for w in nhd:
        g.add_to_phase(w, ph)
    for weight in range(2, len(nhd)+1):
        for ws in combinations(nhd, weight):
            w1 = g.add_vertex(VertexType.Z, qubit=q-1, row=pos)
            g.set_phase(w1, (-1)**(weight-1) * ph)
            w2 = g.add_vertex(vt, qubit=q, row=pos)
            g.add_edge((w1,w2), et)
            for w3 in ws:
                g.add_edge((w2, w3), et)
            g.scalar.add_power(weight-1)
            pos += 1
    return True

def check_ifourier(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Returns True if the given node is the phase part of a phase gadget, and the gadget is
    connected to all Z spiders.
    
    Note this accepts phase gadgets either in graph-like form, with Hadamard edges, or in the standard
    form of a Z-spider connected to a X-spider, with normal edges."""
    ty = g.types()
    if (ty[v] != VertexType.Z or g.vertex_degree(v) != 1):
        return False
    w = next(iter(g.neighbors(v)))

    if not (
        (ty[w] == VertexType.X and all(g.edge_type(e) == EdgeType.SIMPLE for e in g.incident_edges(w))) or
        (ty[w] == VertexType.Z and all(g.edge_type(e) == EdgeType.HADAMARD for e in g.incident_edges(w)))
    ): return False

    return all(ty[w1] == VertexType.Z for w1 in g.neighbors(w))

def ifourier(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Applies the inverse graphical fourier transform, replacing the given phase gadget of arity k with
    2**k H-boxes.
    
    To avoid ambiguity, the phase gadget should be specified as the arity-1 spider with the phase on it."""
    if not check_ifourier(g, v): return False

    w = next(iter(g.neighbors(v)))

    q,r = g.qubit(w), g.row(w)
    nhd = tuple(w for w in g.neighbors(w) if w != v)
    ph = g.phase(v)
    g.remove_vertex(v)
    g.remove_vertex(w)
    g.scalar.add_power(1-len(nhd))
    pos = r - 0.5*(2**len(nhd) - len(nhd))

    for w in nhd:
        g.add_to_phase(w, ph)
    for weight in range(2, len(nhd)+1):
        for ws in combinations(nhd, weight):
            w1 = g.add_vertex(VertexType.H_BOX, qubit=q, row=pos)
            g.set_phase(w1, (-2)**(weight-1) * ph)
            for w2 in ws:
                g.add_edge((w1, w2))
            pos += 1
    return True
