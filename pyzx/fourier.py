
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

from .utils import EdgeType, VertexType
from .graph.base import BaseGraph, VT, ET
from itertools import combinations

def check_fourier(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Returns True if the given node is an H-box adjacent to Z spiders"""
    ty = g.types()
    if (ty[v] == VertexType.H_BOX and
        all(ty[w] == VertexType.Z for w in g.neighbors(v)) and 
        all(g.edge_type(e) == EdgeType.SIMPLE for e in g.incident_edges(v))):
        return True
    else:
        return False

def fourier(g: BaseGraph[VT, ET], v: VT) -> bool:
    """Applies the graphical fourier transform, replacing the given H-box of arity k with
    2**k phase gadgets."""
    if not check_fourier(g, v): return False

    q,r = g.qubit(v), g.row(v)
    nhd = tuple(g.neighbors(g))
    ph = g.phase(v) / (2**(len(nhd)-1))
    g.remove_vertex(v)
    pos = r - 0.25*(2**len(nhd))

    for weight in range(1, len(nhd)+1):
        for ws in combinations(nhd, weight):
            w1 = g.add_vertex(VertexType.Z, qubit=q-1, row=pos)
            g.set_phase(w1, (-1)**(weight-1) * ph)
            w2 = g.add_vertex(VertexType.X, qubit=q, row=pos)
            g.add_edge((w1,w2))
            for w3 in ws:
                g.add_edge((w2, w3))
            g.scalar.add_power(weight-1)
    return True
