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
This module contains the implementation of the Euler decomposition

This rule acts on one edge, taken as an input of two vertices. The check function returns a boolean indicating whether
the rule can be applied to the given edge. The standard version of the applier will automatically
call the basic checker, while the unsafe version of the applier will assume that the given input is correct and will apply
the rule without running the check first.

This rewrite rule can be called using simplify.euler_expansion_rewrite.apply(g, v, w).
"""

__all__ = ['check_hadamard_edge',
           'euler_expansion',
           'unsafe_euler_expansion',]


from fractions import Fraction
from pyzx.utils import EdgeType, VertexType, vertex_is_zx, toggle_vertex
from pyzx.graph.base import BaseGraph, VT, ET, upair


def check_hadamard_edge(g: BaseGraph[VT, ET], v:VT, w:VT) -> bool:
    """Checks whether two vertices are hadamard edges."""
    if not (v in g.vertices() and w in g.vertices()): return False
    if not g.connected(v, w): return False
    return g.edge_type(g.edge(v, w)) == EdgeType.HADAMARD


def euler_expansion(g: BaseGraph[VT, ET], v:VT, w:VT) -> bool:
    """First checks if the rule can be applied, then expands the given Hadamard-edges
    into pi/2 phases using its Euler decomposition."""
    if check_hadamard_edge(g,v,w): return unsafe_euler_expansion(g,v,w)
    return False

def unsafe_euler_expansion(g: BaseGraph[VT, ET], v:VT, w:VT) -> bool:
    """Expands the given Hadamard-edges into pi/2 phases using its Euler decomposition."""
    types = g.types()
    phases = g.phases()
    etab = {}
    e = g.edge(v, w)

    v1, v2 = g.edge_st(e)
    if vertex_is_zx(types[v1]) and types[v1] == types[v2]:
        r = 0.5 * (g.row(v1) + g.row(v2))
        q = 0.5 * (g.qubit(v1) + g.qubit(v2))
        t = toggle_vertex(types[v1])
        v = g.add_vertex(t, q, r)
        etab[upair(v, v1)] = [1, 0]
        etab[upair(v, v2)] = [1, 0]
        if phases[v1] == Fraction(1, 2) or phases[v2] == Fraction(1, 2):
            g.add_to_phase(v1, Fraction(3, 2))
            g.add_to_phase(v2, Fraction(3, 2))
            g.set_phase(v, Fraction(3, 2))
            g.scalar.add_phase(Fraction(1, 4))
        else:
            g.add_to_phase(v1, Fraction(1, 2))
            g.add_to_phase(v2, Fraction(1, 2))
            g.set_phase(v, Fraction(1, 2))
            g.scalar.add_phase(Fraction(7, 4))
    else:
        r = 0.25 * g.row(v1) + 0.75 * g.row(v2)
        q = 0.25 * g.qubit(v1) + 0.75 * g.qubit(v2)
        w1 = g.add_vertex(VertexType.Z, q, r, Fraction(1, 2))
        etab[upair(v2, w1)] = [1, 0]
        r = 0.5 * g.row(v1) + 0.5 * g.row(v2)
        q = 0.5 * g.qubit(v1) + 0.5 * g.qubit(v2)
        w2 = g.add_vertex(VertexType.X, q, r, Fraction(1, 2))
        etab[upair(w1, w2)] = [1, 0]
        r = 0.75 * g.row(v1) + 0.25 * g.row(v2)
        q = 0.75 * g.qubit(v1) + 0.25 * g.qubit(v2)
        w3 = g.add_vertex(VertexType.Z, q, r, Fraction(1, 2))
        etab[upair(w2, w3)] = [1, 0]
        etab[upair(w3, v1)] = [1, 0]
        g.scalar.add_phase(Fraction(7, 4))

    g.add_edge_table(etab)
    g.remove_edge(e)

    return True
