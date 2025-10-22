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


__all__ = [
        'check_lcomp',
        'lcomp']


from typing import Tuple, List, Dict

from fractions import Fraction

from pyzx.utils import (EdgeType, VertexType, phase_is_pauli, phase_is_clifford)
from pyzx.graph.base import BaseGraph, VT, ET


def check_lcomp(
        g: BaseGraph[VT,ET],
        v: VT
        ) -> bool:
    """Checks if a given vertex can be simplified using the local complementation rule.

    :param g: An instance of a ZX-graph.
    :param v: An instance of a ZX-vertex.
    """

    types = g.types()

    if not (v in g.vertices()): return False

    vt = types[v]
    va = g.phase(v)

    if vt != VertexType.Z: return False
    if not phase_is_clifford(va) or phase_is_pauli(va): return False

    if g.is_ground(v):
        return False

    if not (all(g.edge_type(e) == EdgeType.HADAMARD for e in g.incident_edges(v))): return False

    vn = list(g.neighbors(v))

    if not all(types[n] == VertexType.Z for n in vn): return False

    return True


def lcomp(g: BaseGraph[VT,ET], v: VT) -> bool:
    if check_lcomp(g,v):
        return unsafe_lcomp(g, v)
    return False


def unsafe_lcomp(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Performs a local complementation based rewrite rule on the given graph with the
    given ``matches`` returned from ``match_lcomp(_parallel)``. See "Graph Theoretic
    Simplification of Quantum Circuits using the ZX calculus" (arXiv:1902.03178)
    for more details on the rewrite"""
    etab: Dict[Tuple[VT,VT],List[int]] = dict()
    rem: List[VT] = []

    vn = list(g.neighbors(v))

    a = g.phase(v)
    rem.append(v)
    #if pi/2, then scalar = pi/4
    #if 3pi/2, then scalar = 7pi/4
    g.scalar.add_phase(Fraction(3,2) * a - Fraction(1,2))
    n = len(vn)
    g.scalar.add_power((n-2)*(n-1)//2)

    for i in range(n):
        if not g.is_ground(vn[i]):
            g.add_to_phase(vn[i], -a)
        for j in range(i+1, n):
            e = (vn[i], vn[j])
            he = etab.get(e, [0,0])[1]
            etab[e] = [0, he+1]

    g.add_edge_table(etab)
    g.remove_vertices(rem)
    g.remove_isolated_vertices()

    return True
