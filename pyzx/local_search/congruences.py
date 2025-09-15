# PyZX - Python library for quantum circuit rewriting
#        and optimisation using the ZX-calculus
# Copyright (C) 2021 - Aleks Kissinger and John van de Wetering

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
This module contains two congruences (i.e., non-simplification rewrite rules) for exploring the space of equivalent ZX-diagrams. The two congruences defined here are based on the graph-theoretic notions of local complementation and pivoting. The methods lc_cong and pivot_cong take a ZX-diagram and subjects over which to apply the rewrite rule as parameters. The methods `apply_rand_lc` and `apply_rand_pivot` select these subjects probabilistically.
"""


import numpy as np
import itertools
from fractions import Fraction

from ..rewrite_rules.rules import apply_rule, lcomp

import sys
if __name__ == '__main__':
    sys.path.append('..')
from pyzx.utils import VertexType, EdgeType

### Utilities
def toggle_edge(g, v1, v2):
    """
    Utility function that toggles the connectivity between two spiders in a graph-like ZX-diagram.

    :param g: Graph where the operation is applied.
    :param v1: First vertex to toggle.
    :param v2: Second vertex to toggle
    """
    if g.connected(v1, v2):
        g.remove_edge(g.edge(v1, v2))
    else:
        g.add_edge((v1, v2), edgetype=EdgeType.HADAMARD)

def toggle_subset_connectivity(g, vs1, vs2):
    """
    Utility function that toggles the connectivity between two subsets of spiders in a graph-like ZX-diagram.

    :param g: Graph where the operation is applied.
    :param vs1: First subset of vertices to be toggled.
    :param vs2: Second subset of vertices to be toggled.

    """
    for v1 in vs1:
        for v2 in vs2:
            toggle_edge(g, v1, v2)

def uniform_weights(g, elts):
    """
    Assigns uniform weights to elements for selection.
    Used as weight function for random local complementation and random pivoting functions.

    :param g: Graph context for the operation.
    :param elts: Elements to assign weights to.
    :return: List of uniform weights.
    """
    return [1 / len(elts)] * len(elts)

def unfuse(g, v):
    """
    For a Z-spider with a phase and neighbors that are both BOUNDARY and Z, unfuse the phase
    in the form of a new spider that holds the connectivity to the boundaries. Note that v will
    maintain its connectivity to any Z spiders (just not boundaries).

    :param g: Graph where the operation is applied.
    :param v: Vertex to unfuse.
    :return: New vertex created during unfusion.
    """
    v_phase = g.phase(v)
    bs = [v for v in g.neighbors(v) if g.type(v) == VertexType.BOUNDARY]

    # we could enforce the following to ensure graph-likeness, but not necessary
    # assert(len(bs) < 2)

    new_v = g.add_vertex(
        ty=VertexType.Z,
        phase=v_phase)

    # unfuse the phase
    g.set_phase(v, phase=0)
    g.add_edge((v, new_v), edgetype=EdgeType.SIMPLE)

    # transfer over the boundary connectivity to the new spider
    for b in bs:
        e = g.edge(v, b)
        b_edge_type = g.edge_type(e)
        g.remove_edge(e)
        g.add_edge((new_v, b), edgetype=b_edge_type)

    # return the reference to the new vertex
    return new_v




### Local Complementation
def is_lc_vertex(g, v):
    """Checks if a spider in a ZX-diagram is a valid subject for local complementation.

    :param g: Graph where the check is performed.
    :param v: Vertex to check.
    :return: True if valid, False otherwise.
    """
    # don't want to apply LC to a single-degree spider because it will only result in a growing chain
    if g.vertex_degree(v) < 2 or g.type(v) != VertexType.Z:
        return False

    # TODO: no I/O vertices for now. note that they are included in degree count
    for n in g.neighbors(v):
        if g.type(n) == VertexType.BOUNDARY:
            return False

    return True


# Assumes that v is a Z-spider (green)
def lc_cong(g, v):
    """Applies local complementation at a provided spider in a ZX-diagram. Assumes v is a Z spider.

    :param g: Graph where the operation is applied.
    :param v: Vertex to apply local complementation.
    """
    # FIXME: not gracefully handling if on boundary. If on boundary, sohuld just add on same qubit rather than add a gadget
    ns = [n for n in g.neighbors(v) if g.type(n) == VertexType.Z]

    # complement edges between neighbors
    # TODO: use add_edge_table
    for n1, n2 in itertools.combinations(ns, 2):
        toggle_edge(g, n1, n2)

    # add pi/2 to all neighbors
    for n in ns:
        g.add_to_phase(n, Fraction(1, 2))

    # add gadget (and transfer over the phase)
    new_v = g.add_vertex(
        ty=VertexType.Z,
        phase=g.phase(v) + Fraction(1, 2),
        qubit=g.qubit(v)-1,
        row=g.row(v)
    )
    g.set_phase(v, phase=Fraction(1, 2))
    g.add_edge((v, new_v), edgetype=EdgeType.HADAMARD)


def lc_cong2(g, v):
    """Applies local complementation at a provided spider in a ZX-diagram.

    :param g: Graph where the operation is applied.
    :param v: Vertex to apply local complementation.
    """
    p = g.phase(v)
    if p != Fraction(1,2) and p != Fraction(-1,2):
        v1 = g.add_vertex(
                ty=VertexType.Z,
                phase=g.phase(v) + Fraction(1, 2),
                qubit=g.qubit(v)-2,
                row=g.row(v))
        v2 = g.add_vertex(
                ty=VertexType.Z,
                qubit=g.qubit(v)-1,
                row=g.row(v))
        g.add_edge((v1, v2), edgetype=EdgeType.HADAMARD)
        g.add_edge((v2, v), edgetype=EdgeType.HADAMARD)
        g.set_phase(v, Fraction(-1,2))
    # apply_rule(g, lcomp, [[v, list(g.neighbors(v))]])



def apply_rand_lc(g, weight_func=uniform_weights):
    """Applies local complementation to randomly selected spider.

    :param g: Graph where the operation is applied.
    :param weight_func: Function to determine weights for selection.    
    """

    lc_vs = [v for v in g.vertices() if is_lc_vertex(g, v)]
    weights = weight_func(g, lc_vs)
    lc_v = np.random.choice(lc_vs, 1, p=weights)[0]
    lc_cong2(g, lc_v)



### Pivoting


# TODO: May want to add some additional cases when we know it's not useful (as in the LC case)
def is_pivot_edge(g, e):
    """
    Checks if a given edge in a ZX-diagram is a suitable candidate for pivoting
    
    :param g: Graph where the check is performed.
    :param e: Edge to check.
    :return: True if suitable, False otherwise.
    """

    v1, v2 = g.edge_st(e)
    return g.type(v1) == VertexType.Z and g.type(v2) == VertexType.Z

def pivot_cong(g, v1, v2):
    """
    Applies pivoting to two connected spiders

    :param g: Graph where the operation is applied.
    :param v1: First vertex.
    :param v2: Second vertex.
    """

    # get the three subsets
    nhd1 = list(g.neighbors(v1))
    nhd2 = list(g.neighbors(v2))
    assert(all([g.type(v) in [VertexType.Z, VertexType.BOUNDARY] for v in nhd1]))
    assert(all([g.type(v) in [VertexType.Z, VertexType.BOUNDARY] for v in nhd2]))
    vs1 = [v for v in nhd1 if g.type(v) == VertexType.Z]
    bs1 = [v for v in nhd1 if g.type(v) == VertexType.BOUNDARY]
    vs2 = [v for v in nhd2 if g.type(v) == VertexType.Z]
    bs2 = [v for v in nhd2 if g.type(v) == VertexType.BOUNDARY]

    shared_ns = list(set(vs1) & set(vs2))
    nhd1_only = list(set(vs1) - set(vs2 + [v2]))
    nhd2_only = list(set(vs2) - set(vs1 + [v1]))

    # toggle connectivity between the three subsets
    toggle_subset_connectivity(g, shared_ns, nhd1_only)
    toggle_subset_connectivity(g, shared_ns, nhd2_only)
    toggle_subset_connectivity(g, nhd1_only, nhd2_only)

    # add pi to all the shared neighbors
    for n in shared_ns:
        g.add_to_phase(n, 1)

    # for v1 and v2, pull out phases along hadamards and swap (while maintaining any I/O)
    new_v1 = unfuse(g, v1)
    new_v2 = unfuse(g, v2)

    g.remove_edge(g.edge(v1, new_v1))
    g.remove_edge(g.edge(v2, new_v2))
    g.add_edge((v1, new_v2), edgetype=EdgeType.HADAMARD)
    g.add_edge((v2, new_v1), edgetype=EdgeType.HADAMARD)




def apply_rand_pivot(g, weight_func=uniform_weights):
    """
    Applies pivoting to a randomly selected pair of connected spiders.

    :param g: Graph where the operation is applied.
    :param weight_func: Function to determine weights for selection. Default is uniform weights.
    """

    # assumes len(candidates) != 0
    candidates = [e for e in g.edges() if is_pivot_edge(g, e)]
    weights = weight_func(g, candidates)
    e_idx = np.random.choice(len(candidates), 1, p=weights)[0]
    e = candidates[e_idx]
    v1, v2 = g.edge_st(e)
    pivot_cong(g, v1, v2)
