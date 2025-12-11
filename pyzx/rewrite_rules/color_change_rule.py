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
This module contains the implementation of the color change rule

This rule acts on one vertex. The check function returns a boolean indicating whether
the rule can be applied to the two given vertices. The standard version of the applier will automatically
call the basic checker, while the unsafe version of the applier will assume that the given input is correct and will apply
the rule without running the check first.

This rewrite rule can be called using simplify.color_change_rewrite.apply(g, v).
"""

__all__ = [
        'color_change_diagram',
        'color_change',
        'unsafe_color_change',
        'check_color_change']

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.utils import VertexType, toggle_vertex, toggle_edge


def color_change_diagram(g: BaseGraph[VT,ET]) -> bool:
    """Color-change an entire diagram by applying Hadamards to the inputs and ouputs."""
    for v in g.vertices():
        if g.type(v) == VertexType.BOUNDARY:
            if g.vertex_degree(v) != 1:
                raise ValueError("Boundary should only have 1 neighbor.")
            for e in g.incident_edges(v):
                g.set_edge_type(e, toggle_edge(g.edge_type(e)))
        elif check_color_change(g, v):
            g.set_type(v, toggle_vertex(g.type(v)))
    return True

def check_color_change(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Check if a vertex can be color-changed. It must be either a Z- or X- vertex"""
    if not (v in g.vertices()): return False
    return g.type(v) == VertexType.Z or g.type(v) == VertexType.X

def color_change(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Color-change a vertex by applying Hadamards to all incident edges. Must be either a Z- or X- vertex"""
    if not check_color_change(g, v): return False
    return unsafe_color_change(g, v)

def unsafe_color_change(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Color-change a vertex by applying Hadamards to all incident edges. Must be either a Z- or X- vertex
    NOTE: does not check if a vertex can be color-changed."""

    g.set_type(v, toggle_vertex(g.type(v)))
    for e in g.incident_edges(v):
        g.set_edge_type(e, toggle_edge(g.edge_type(e)))
    return True