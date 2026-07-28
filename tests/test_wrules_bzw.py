# PyZX - Python library for quantum circuit rewriting
#        and optimization using the ZX-calculus
# Copyright (C) 2026 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


import itertools
import unittest
import sys
from fractions import Fraction

from pyzx import EdgeType, compare_tensors

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.graph import Graph
from pyzx.utils import VertexType
from pyzx.rewrite_rules.wrules_bzw import (
    check_bialgebra_zw_reverse, check_bialgebra_zw_forward, apply_bialgebra_zw_reverse, apply_bialgebra_zw_forward
)

def prepare_bialgebra_zw_reverse_graph(qubits, phase):
    """Prepare a zx-graph on which the reverse BZW rule can be applied."""
    g = Graph()
    wos = []
    zs = []
    for q in range(qubits):
        i = g.add_vertex(qubit=q, row=0)
        wi = g.add_vertex(ty=VertexType.W_INPUT, qubit=q, row=1)
        wo = g.add_vertex(ty=VertexType.W_OUTPUT, qubit=q, row=2)
        z = g.add_vertex(ty=VertexType.Z, qubit=q, row=3)
        g.set_phase(z, phase)
        o = g.add_vertex(qubit=q, row=4)

        wos.append(wo)
        zs.append(z)

        g.add_edge((i, wi))
        g.add_edge((wi, wo), EdgeType.W_IO)
        g.add_edge((z, o))

    for wo, z in itertools.product(wos, zs):
        g.add_edge((wo, z))

    g.auto_detect_io()
    return g, wos, zs

def prepare_bialgebra_zw_forward_graph(qubits, phase):
    """Prepare a zx-graph on which the forward BZW rule can be applied.
    This is the expansion of a single edge up to a complete (m,n)-bipartite subgraph."""

    g = Graph()
    average_qubit = (qubits - 1) / 2
    z = g.add_vertex(ty=VertexType.Z, qubit=average_qubit, row=1)
    g.set_phase(z, phase)
    wi = g.add_vertex(ty=VertexType.W_INPUT, qubit=average_qubit, row=2)
    wo = g.add_vertex(ty=VertexType.W_OUTPUT, qubit=average_qubit, row=3)

    g.add_edge((z, wi))
    g.add_edge((wi, wo), EdgeType.W_IO)

    for q in range(qubits):
        i = g.add_vertex(qubit=q, row=0)
        g.add_edge((i, z))
        o = g.add_vertex(qubit=q, row=4)
        g.add_edge((wo, o))

    g.auto_detect_io()
    return g, z, wi, wo

class TestCheckReverseBialgebraZW(unittest.TestCase):
    """Tests for check_bialgebra_zw_reverse and apply_bialgebra_zw_reverse."""

    def test_base_case(self):
        """ZW-pattern of base case should match."""
        g, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 2, phase = 0)

        self.assertTrue(check_bialgebra_zw_reverse(g, wos, zs))

    def test_base_case_4_qubits(self):
        """ZW-pattern with 4 qubits should match."""
        g, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 4, phase = 0)

        self.assertTrue(check_bialgebra_zw_reverse(g, wos, zs))

    def test_identical_phases(self):
        """ZW-pattern where Z-spiders have identical phases should match."""
        g, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 3, phase = 1)

        self.assertTrue(check_bialgebra_zw_reverse(g, wos, zs))

    def test_non_pauli_phase(self):
        """ZW-pattern where Z-spiders have non-pauli phases should match."""
        g, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 3, phase = Fraction(1, 4))

        self.assertTrue(check_bialgebra_zw_reverse(g, wos, zs))

    def test_different_phases(self):
        """ZW-pattern where Z-spiders have different phases should not match."""
        g, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 3, phase = 0)
        g.set_phase(zs[0], 1)

        self.assertFalse(check_bialgebra_zw_reverse(g, wos, zs))

    def test_incomplete_bipartite_pattern(self):
        """ZW-pattern that is incomplete bipartite should not match."""
        g, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 2, phase = 0)
        g.remove_edge(g.edge(wos[0], zs[1]))

        self.assertFalse(check_bialgebra_zw_reverse(g, wos, zs))

    def test_complete_bipartite_subpattern(self):
        """ZW-pattern with a complete (3,3)-bipartite pattern but a subpattern requested should not match."""
        g, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 3, phase = 0)

        self.assertFalse(check_bialgebra_zw_reverse(g, wos[:2], zs[:2]))

    def test_hadamard_edge(self):
        """ZW-pattern with a Hadamard edge in the complete bipartite pattern should not match."""
        g, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 2, phase = 0)
        g.set_edge_type(g.edge(wos[0], zs[1]), EdgeType.HADAMARD)

        self.assertFalse(check_bialgebra_zw_reverse(g, wos, zs))

    def test_extra_neighbour(self):
        """ZW-pattern with two extra neighbours beyond the complete bipartite pattern should not match."""
        g, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 3, phase = 0)
        extra = g.add_vertex(qubit=4, row=0)
        g.add_edge( (zs[0], extra) )

        self.assertFalse(check_bialgebra_zw_reverse(g, wos, zs))

    def test_equivalence_phase_free(self):
        """ZW-pattern with zero phase should reduce to an equivalent graph."""
        g_start, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 3, phase = 0)
        g_final = g_start.copy()
        apply_bialgebra_zw_reverse(g_final, wos, zs)

        self.assertTrue(compare_tensors(g_start, g_final, preserve_scalar=True))

    def test_equivalence_nonzero_phase(self):
        """ZW-pattern with non-zero phase should reduce to an equivalent graph."""
        g_start, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 3, phase = 1)
        g_final = g_start.copy()
        apply_bialgebra_zw_reverse(g_final, wos, zs)

        self.assertTrue(compare_tensors(g_start, g_final, preserve_scalar=True))

    def test_inequivalence_different_qubits(self):
        """ZW-pattern and WZ-edge with different number of qubits should not be equivalent."""
        g_start, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 3, phase = 0)
        g_final, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 2, phase = 0)

        self.assertFalse(compare_tensors(g_start, g_final, preserve_scalar=True))

    def test_inequivalence_different_phase(self):
        """ZW-pattern and WZ-edge with different phases should not be equivalent."""
        g_start, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 3, phase = 0)
        g_final, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 3, phase = 1)

        self.assertFalse(compare_tensors(g_start, g_final, preserve_scalar=True))

    def test_equivalence_inversion_reverse_forward(self):
        """Applying the reverse rule followed by the forward rule should preserve equivalence"""
        g_start, wos, zs = prepare_bialgebra_zw_reverse_graph(qubits = 4, phase = 0)
        g_final = g_start.copy()
        apply_bialgebra_zw_reverse(g_final, wos, zs)
        single_z = next(v for v in g_final.vertices() if g_final.type(v) == VertexType.Z)
        single_w = next(v for v in g_final.vertices() if g_final.type(v) == VertexType.W_OUTPUT)
        apply_bialgebra_zw_forward(g_final, single_w, single_z)

        self.assertTrue(compare_tensors(g_start, g_final))

class TestCheckForwardBialgebraZW(unittest.TestCase):
    """Tests for check_bialgebra_zw_forward and apply_bialgebra_zw_forward."""

    def test_base_case(self):
        """WZ-edge with zero phase should match."""
        g, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 2, phase = 0)

        self.assertTrue(check_bialgebra_zw_forward(g, wo, z))

    def test_base_case_4_qubits(self):
        """WZ-edge with zero phase should match."""
        g, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 4, phase = 0)

        self.assertTrue(check_bialgebra_zw_forward(g, wo, z))

    def test_base_case_nonzero_phase(self):
        """WZ-edge with nonzero phase should match."""
        g, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 3, phase = 1)

        self.assertTrue(check_bialgebra_zw_forward(g, wo, z))

    def test_non_pauli_phase(self):
        """WZ-edge with non-pauli phase should match."""
        g, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 3, phase = Fraction(1, 4))

        self.assertTrue(check_bialgebra_zw_forward(g, wo, z))

    def test_missing_edge(self):
        """WZ-edge not connected through a W_INPUT should not match."""
        g, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 3, phase = 0)
        g.remove_edge(g.edge(wi, z))

        self.assertFalse(check_bialgebra_zw_forward(g, wo, z))

    def test_equivalence_phase_free(self):
        """WZ-edge with a zero phase should reduce to an equivalent graph."""
        g_start, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 3, phase = 0)
        g_final = g_start.copy()
        apply_bialgebra_zw_forward(g_final, z, wo)

        self.assertTrue(compare_tensors(g_start, g_final, preserve_scalar=True))

    def test_equivalence_nonzero_phase(self):
        """Z-W pattern with identical non-zero phases should reduce to an equivalent graph."""
        g_start, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 3, phase = 1)
        g_final = g_start.copy()
        apply_bialgebra_zw_forward(g_final, z, wo)

        self.assertTrue(compare_tensors(g_start, g_final, preserve_scalar=True))

    def test_equivalence_inversion_forward_reverse(self):
        """Applying the forward rule followed by the reverse rule should preserve equivalence"""
        g_start, z, wi, wo = prepare_bialgebra_zw_forward_graph(qubits = 4, phase = 0)
        g_final = g_start.copy()
        apply_bialgebra_zw_forward(g_final, z, wo)
        wos = list(v for v in g_final.vertices() if g_final.type(v) == VertexType.W_OUTPUT)
        zs = list(v for v in g_final.vertices() if g_final.type(v) == VertexType.Z)
        apply_bialgebra_zw_reverse(g_final, wos, zs)

        self.assertTrue(compare_tensors(g_start, g_final))

if __name__ == '__main__':
    unittest.main()
