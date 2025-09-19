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


from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.utils import (EdgeType, VertexType, get_w_io, get_z_box_label, is_pauli,
                    set_z_box_label, vertex_is_w, vertex_is_z_like, toggle_vertex, toggle_edge)


def color_change_diagram(g: BaseGraph[VT,ET]):
    """Color-change an entire diagram by applying Hadamards to the inputs and ouputs."""
    for v in g.vertices():
        if g.type(v) == VertexType.BOUNDARY:
            if g.vertex_degree(v) != 1:
                raise ValueError("Boundary should only have 1 neighbor.")
            for e in g.incident_edges(v):
                g.set_edge_type(e, toggle_edge(g.edge_type(e)))
        elif check_color_change(g, v):
            g.set_type(v, toggle_vertex(g.type(v)))

def check_color_change(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Check if a vertex can be color-changed. It must be either a Z- or X- vertex"""

    return g.type(v) == VertexType.Z or g.type(v) == VertexType.X

def color_change(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Color-change a vertex by applying Hadamards to all incident edges. Must be either a Z- or X- vertex"""
    if not (g.type(v) == VertexType.Z or g.type(v) == VertexType.X):
        return False

    g.set_type(v, toggle_vertex(g.type(v)))
    for e in g.incident_edges(v):
        g.set_edge_type(e, toggle_edge(g.edge_type(e)))

    return True