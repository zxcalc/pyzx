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

import unittest
import sys
from types import ModuleType
from typing import Optional

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from fractions import Fraction

from pyzx.graph import Graph
from pyzx.utils import (EdgeType, VertexType, get_h_box_label, set_h_box_label,
                        is_standard_hbox, hbox_has_complex_label)
from pyzx.rewrite_rules.hbox_cancel_rule import check_hbox_cancel, hbox_cancel
from pyzx.rewrite_rules.zero_hbox_rule import check_zero_hbox
from pyzx.rewrite_rules.copy_rule import check_copy
from pyzx.hsimplify import hbox_cancel_simp

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import compare_tensors
except ImportError:
    np = None


class TestHboxCancelRule(unittest.TestCase):
    """Tests for the H-box cancellation rule."""

    def test_check_hbox_cancel_adjacent_hboxes(self):
        """Test that check returns True for two adjacent H-boxes."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 2)
        g.set_phase(v2, 1)
        v3 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))  # Simple edge between H-boxes
        g.add_edge((v2, v3))
        g.set_inputs((v0,))
        g.set_outputs((v3,))

        self.assertTrue(check_hbox_cancel(g, v1))
        self.assertTrue(check_hbox_cancel(g, v2))

    def test_check_hbox_cancel_wrong_type(self):
        """Test that check returns False when vertex is not an H-box."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.Z, 0, 1)  # Z instead of H_BOX
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))

        self.assertFalse(check_hbox_cancel(g, v1))

    def test_check_hbox_cancel_wrong_phase(self):
        """Test that check returns False when phase is not 1."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, Fraction(1,2))
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))

        self.assertFalse(check_hbox_cancel(g, v1))

    def test_check_hbox_cancel_wrong_arity(self):
        """Test that check returns False when arity is not 2."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        v3 = g.add_vertex(VertexType.Z, 1, 1)  # Extra neighbor
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))
        g.add_edge((v1, v3))  # Makes v1 have arity 3

        self.assertFalse(check_hbox_cancel(g, v1))

    def test_check_hbox_cancel_no_match(self):
        """Test that check returns False for H-box with only simple edges and no adjacent H-box."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((v0, v1))  # Simple edge
        g.add_edge((v1, v2))  # Simple edge

        self.assertFalse(check_hbox_cancel(g, v1))

    def test_hbox_cancel_adjacent_simple_edges(self):
        """Test cancellation of two adjacent H-boxes with all simple edges."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 2)
        g.set_phase(v2, 1)
        v3 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))
        g.add_edge((v2, v3))
        g.set_inputs((v0,))
        g.set_outputs((v3,))

        result = hbox_cancel(g, v1)
        self.assertTrue(result)
        self.assertEqual(g.num_vertices(), 2)  # Only boundaries left
        self.assertEqual(g.num_edges(), 1)

        e = g.edge(v0, v3)
        self.assertEqual(g.edge_type(e), EdgeType.SIMPLE)

    def test_hbox_cancel_adjacent_mixed_edges(self):
        """Test cancellation of two adjacent H-boxes with mixed outer edges."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 2)
        g.set_phase(v2, 1)
        v3 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((v0, v1), EdgeType.HADAMARD)
        g.add_edge((v1, v2))
        g.add_edge((v2, v3))
        g.set_inputs((v0,))
        g.set_outputs((v3,))

        result = hbox_cancel(g, v1)
        self.assertTrue(result)
        self.assertEqual(g.num_vertices(), 2)

        e = g.edge(v0, v3)
        self.assertEqual(g.edge_type(e), EdgeType.HADAMARD)

    def test_hbox_cancel_adjacent_both_hadamard_outer(self):
        """Test cancellation of two adjacent H-boxes with both outer edges Hadamard."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 2)
        g.set_phase(v2, 1)
        v3 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((v0, v1), EdgeType.HADAMARD)
        g.add_edge((v1, v2))
        g.add_edge((v2, v3), EdgeType.HADAMARD)
        g.set_inputs((v0,))
        g.set_outputs((v3,))

        result = hbox_cancel(g, v1)
        self.assertTrue(result)
        self.assertEqual(g.num_vertices(), 2)

        e = g.edge(v0, v3)
        self.assertEqual(g.edge_type(e), EdgeType.SIMPLE)

    def test_check_hbox_cancel_hadamard_edge(self):
        """Test that check returns True for H-box with Hadamard edge."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((v0, v1), EdgeType.HADAMARD)
        g.add_edge((v1, v2))

        self.assertTrue(check_hbox_cancel(g, v1))

    def test_hbox_cancel_hadamard_edge_simple(self):
        """Test cancellation of H-box with one Hadamard edge."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((v0, v1), EdgeType.HADAMARD)
        g.add_edge((v1, v2))
        g.set_inputs((v0,))
        g.set_outputs((v2,))

        result = hbox_cancel(g, v1)
        self.assertTrue(result)
        self.assertEqual(g.num_vertices(), 2)

        e = g.edge(v0, v2)
        self.assertEqual(g.edge_type(e), EdgeType.SIMPLE)

    def test_hbox_cancel_both_hadamard_edges(self):
        """Test cancellation of H-box with both edges Hadamard."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((v0, v1), EdgeType.HADAMARD)
        g.add_edge((v1, v2), EdgeType.HADAMARD)
        g.set_inputs((v0,))
        g.set_outputs((v2,))

        result = hbox_cancel(g, v1)
        self.assertTrue(result)
        self.assertEqual(g.num_vertices(), 2)

        e = g.edge(v0, v2)
        self.assertEqual(g.edge_type(e), EdgeType.HADAMARD)

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_hbox_cancel_adjacent_preserves_semantics(self):
        """Test that cancellation of adjacent H-boxes preserves semantics."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 2)
        g.set_phase(v2, 1)
        v3 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))
        g.add_edge((v2, v3))
        g.set_inputs((v0,))
        g.set_outputs((v3,))

        g_copy = g.copy()
        hbox_cancel(g_copy, v1)

        self.assertTrue(compare_tensors(g, g_copy, preserve_scalar=True))

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_hbox_cancel_hadamard_edge_preserves_semantics(self):
        """Test that cancellation of H-box with Hadamard edge preserves semantics."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((v0, v1), EdgeType.HADAMARD)
        g.add_edge((v1, v2))
        g.set_inputs((v0,))
        g.set_outputs((v2,))

        g_copy = g.copy()
        hbox_cancel(g_copy, v1)

        self.assertTrue(compare_tensors(g, g_copy, preserve_scalar=True))

    def test_hbox_cancel_simp(self):
        """Regression test for issue #200."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.add_edge((v0, v1))
        v2 = g.add_vertex(VertexType.H_BOX, 0, 2)
        g.add_edge((v1, v2))
        v3 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((v2, v3))
        g.set_inputs((v0,))
        g.set_outputs((v3,))

        self.assertEqual(g.num_vertices(), 4)
        rewrites = hbox_cancel_simp(g)
        self.assertGreater(rewrites, 0)
        self.assertEqual(g.num_vertices(), 2)

    # Tests for H-box label helper functions.

    def test_get_h_box_label_with_complex_label(self):
        """Test get_h_box_label returns the stored complex label."""
        g = Graph()
        v = g.add_vertex(VertexType.H_BOX, 0, 0)
        g.set_vdata(v, 'label', 1+2j)
        self.assertEqual(get_h_box_label(g, v), 1+2j)

    def test_get_h_box_label_phase_fallback(self):
        """Test get_h_box_label converts phase to complex when no label set."""
        g = Graph()
        v = g.add_vertex(VertexType.H_BOX, 0, 0)
        g.set_phase(v, 0)  # exp(0) = 1
        self.assertAlmostEqual(get_h_box_label(g, v), 1, places=10)
        g.set_phase(v, Fraction(1, 2))  # exp(i*pi/2) = i
        self.assertAlmostEqual(get_h_box_label(g, v), 1j, places=10)
        g.set_phase(v, 1)  # exp(i*pi) = -1
        self.assertAlmostEqual(get_h_box_label(g, v), -1, places=10)

    def test_set_h_box_label(self):
        """Test set_h_box_label stores the complex label."""
        g = Graph()
        v = g.add_vertex(VertexType.H_BOX, 0, 0)
        set_h_box_label(g, v, 3+4j)
        self.assertEqual(g.vdata(v, 'label'), 3+4j)

    def test_is_standard_hbox_with_label(self):
        """Test is_standard_hbox with label=-1."""
        g = Graph()
        v = g.add_vertex(VertexType.H_BOX, 0, 0)
        set_h_box_label(g, v, -1)
        self.assertTrue(is_standard_hbox(g, v))
        set_h_box_label(g, v, 2+3j)
        self.assertFalse(is_standard_hbox(g, v))

    def test_is_standard_hbox_with_phase(self):
        """Test is_standard_hbox with legacy phase."""
        g = Graph()
        v = g.add_vertex(VertexType.H_BOX, 0, 0)
        g.set_phase(v, 1)
        self.assertTrue(is_standard_hbox(g, v))
        g.set_phase(v, Fraction(1, 2))
        self.assertFalse(is_standard_hbox(g, v))

    def test_hbox_has_complex_label(self):
        """Test hbox_has_complex_label detection."""
        g = Graph()
        v = g.add_vertex(VertexType.H_BOX, 0, 0)
        g.set_phase(v, 1)
        self.assertFalse(hbox_has_complex_label(g, v))
        set_h_box_label(g, v, 1j)
        self.assertTrue(hbox_has_complex_label(g, v))

    # Tests for rewrite rules with H-box labels.

    def test_check_hbox_cancel_with_standard_label(self):
        """Test that hbox_cancel works with standard label (-1)."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        set_h_box_label(g, v1, -1)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 2)
        set_h_box_label(g, v2, -1)
        v3 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))
        g.add_edge((v2, v3))

        self.assertTrue(check_hbox_cancel(g, v1))
        self.assertTrue(check_hbox_cancel(g, v2))

    def test_check_hbox_cancel_with_nonstandard_label(self):
        """Test that hbox_cancel doesn't apply to non-standard labels."""
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        set_h_box_label(g, v1, 1+2j)
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))

        self.assertFalse(check_hbox_cancel(g, v1))

    def test_check_zero_hbox_with_label(self):
        """Test that zero_hbox detects label=1 (all-ones tensor)."""
        g = Graph()
        v = g.add_vertex(VertexType.H_BOX, 0, 0)
        set_h_box_label(g, v, 1)
        self.assertTrue(check_zero_hbox(g, v))
        set_h_box_label(g, v, -1)
        self.assertFalse(check_zero_hbox(g, v))

    def test_copy_rule_standard_hbox(self):
        """Test that copy rule applies to standard H-boxes."""
        g = Graph()
        # X spider with phase 0 connected to standard H-box
        v = g.add_vertex(VertexType.X, 0, 0)
        g.set_phase(v, 0)
        h = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(h, 1)  # Standard Hadamard
        z = g.add_vertex(VertexType.Z, 0, 2)
        g.add_edge((v, h))
        g.add_edge((h, z))

        self.assertTrue(check_copy(g, v))

    def test_copy_rule_nonstandard_hbox(self):
        """Test that copy rule doesn't apply to non-standard H-boxes."""
        g = Graph()
        # X spider with phase 0 connected to non-standard H-box
        v = g.add_vertex(VertexType.X, 0, 0)
        g.set_phase(v, 0)
        h = g.add_vertex(VertexType.H_BOX, 0, 1)
        set_h_box_label(g, h, 2+3j)  # Non-standard label
        z = g.add_vertex(VertexType.Z, 0, 2)
        g.add_edge((v, h))
        g.add_edge((h, z))

        self.assertFalse(check_copy(g, v))

    def test_copy_rule_standard_hbox_with_label(self):
        """Test that copy rule applies to H-boxes with label=-1."""
        g = Graph()
        v = g.add_vertex(VertexType.X, 0, 0)
        g.set_phase(v, 0)
        h = g.add_vertex(VertexType.H_BOX, 0, 1)
        set_h_box_label(g, h, -1)  # Standard Hadamard via label
        z = g.add_vertex(VertexType.Z, 0, 2)
        g.add_edge((v, h))
        g.add_edge((h, z))

        self.assertTrue(check_copy(g, v))


class TestParHboxAvgRule(unittest.TestCase):
    """Tests for the average rule (A) from arXiv:1805.02175."""

    def _make_avg_graph(self, a, b, use_hadamard_not=False):
        """Build a graph with two H-boxes connected through a NOT gate.

        Structure: boundary -> Z-spider -> {H_a, H_b} -> NOT(X or Z) gate
        """
        g = Graph()
        inp = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        z = g.add_vertex(VertexType.Z, 0, 1)
        ha = g.add_vertex(VertexType.H_BOX, -1, 2)
        hb = g.add_vertex(VertexType.H_BOX, 1, 2)
        set_h_box_label(g, ha, a)
        set_h_box_label(g, hb, b)
        g.add_edge((inp, z), EdgeType.SIMPLE)
        g.add_edge((z, ha), EdgeType.SIMPLE)
        g.add_edge((z, hb), EdgeType.SIMPLE)
        if use_hadamard_not:
            not_gate = g.add_vertex(VertexType.Z, 0, 3, phase=1)
            g.add_edge((ha, not_gate), EdgeType.HADAMARD)
            g.add_edge((hb, not_gate), EdgeType.HADAMARD)
        else:
            not_gate = g.add_vertex(VertexType.X, 0, 3, phase=1)
            g.add_edge((ha, not_gate), EdgeType.SIMPLE)
            g.add_edge((hb, not_gate), EdgeType.SIMPLE)
        g.set_inputs((inp,))
        g.set_outputs(())
        return g, ha, hb, not_gate

    def _make_expected_graph(self, avg_label):
        """Build the semantically expected RHS graph for tensor comparison."""
        g = Graph()
        inp = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        h = g.add_vertex(VertexType.H_BOX, 0, 1)
        set_h_box_label(g, h, avg_label)
        g.add_edge((inp, h), EdgeType.SIMPLE)
        g.set_inputs((inp,))
        g.set_outputs(())
        g.scalar.add_power(2)
        return g

    def test_match_basic(self):
        """Test that the matcher finds a valid average rule match."""
        from pyzx.rewrite_rules.par_hbox_rule import match_par_hbox_avg
        g, ha, hb, not_gate = self._make_avg_graph(2+3j, 1-2j)
        matches = match_par_hbox_avg(g)
        self.assertEqual(len(matches), 1)
        h1, h2, ng = matches[0]
        self.assertEqual(ng, not_gate)
        self.assertSetEqual({h1, h2}, {ha, hb})

    def test_match_hadamard_not(self):
        """Test matching with a Z-spider NOT gate via Hadamard edges."""
        from pyzx.rewrite_rules.par_hbox_rule import match_par_hbox_avg
        g, ha, hb, not_gate = self._make_avg_graph(1+1j, -1-1j,
                                                     use_hadamard_not=True)
        matches = match_par_hbox_avg(g)
        self.assertEqual(len(matches), 1)

    def test_no_match_without_not(self):
        """Test that two H-boxes without a NOT gate are not matched."""
        from pyzx.rewrite_rules.par_hbox_rule import match_par_hbox_avg
        g = Graph()
        inp = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        z = g.add_vertex(VertexType.Z, 0, 1)
        ha = g.add_vertex(VertexType.H_BOX, -1, 2)
        hb = g.add_vertex(VertexType.H_BOX, 1, 2)
        set_h_box_label(g, ha, 2+0j)
        set_h_box_label(g, hb, 3+0j)
        g.add_edge((inp, z), EdgeType.SIMPLE)
        g.add_edge((z, ha), EdgeType.SIMPLE)
        g.add_edge((z, hb), EdgeType.SIMPLE)
        g.set_inputs((inp,))
        matches = match_par_hbox_avg(g)
        self.assertEqual(len(matches), 0)

    def test_no_match_different_neighbors(self):
        """Test no match when H-boxes have different Z-spider neighbours."""
        from pyzx.rewrite_rules.par_hbox_rule import match_par_hbox_avg
        g = Graph()
        z1 = g.add_vertex(VertexType.Z, 0, 0)
        z2 = g.add_vertex(VertexType.Z, 1, 0)
        ha = g.add_vertex(VertexType.H_BOX, 0, 1)
        hb = g.add_vertex(VertexType.H_BOX, 1, 1)
        set_h_box_label(g, ha, 1+0j)
        set_h_box_label(g, hb, 2+0j)
        not_gate = g.add_vertex(VertexType.X, 0.5, 2, phase=1)
        g.add_edge((z1, ha), EdgeType.SIMPLE)
        g.add_edge((z2, hb), EdgeType.SIMPLE)
        g.add_edge((ha, not_gate), EdgeType.SIMPLE)
        g.add_edge((hb, not_gate), EdgeType.SIMPLE)
        matches = match_par_hbox_avg(g)
        self.assertEqual(len(matches), 0)

    @unittest.skipUnless(np, "numpy not installed")
    def test_tensor_simple_not(self):
        """Test that the average rule preserves the tensor (X-spider NOT)."""
        from pyzx.rewrite_rules.par_hbox_rule import simp_par_hbox_avg
        a, b = 0.3+0.7j, 0.5+0.4j
        g, _, _, _ = self._make_avg_graph(a, b)
        expected = self._make_expected_graph((a + b) / 2)
        t_before = g.to_tensor(preserve_scalar=True)
        simp_par_hbox_avg(g)
        t_after = g.to_tensor(preserve_scalar=True)
        self.assertTrue(compare_tensors(t_before, t_after, preserve_scalar=True))
        self.assertTrue(compare_tensors(g, expected, preserve_scalar=True))

    @unittest.skipUnless(np, "numpy not installed")
    def test_tensor_hadamard_not(self):
        """Test that the average rule preserves the tensor (Z-spider NOT)."""
        from pyzx.rewrite_rules.par_hbox_rule import simp_par_hbox_avg
        a, b = -1+2j, 3-1j
        g, _, _, _ = self._make_avg_graph(a, b, use_hadamard_not=True)
        expected = self._make_expected_graph((a + b) / 2)
        t_before = g.to_tensor(preserve_scalar=True)
        simp_par_hbox_avg(g)
        t_after = g.to_tensor(preserve_scalar=True)
        self.assertTrue(compare_tensors(t_before, t_after, preserve_scalar=True))
        self.assertTrue(compare_tensors(g, expected, preserve_scalar=True))

    @unittest.skipUnless(np, "numpy not installed")
    def test_tensor_multiple_shared_neighbors(self):
        """Test with H-boxes sharing multiple Z-spider neighbours."""
        from pyzx.rewrite_rules.par_hbox_rule import simp_par_hbox_avg
        a, b = 2+1j, -1+3j
        g = Graph()
        b0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        b1 = g.add_vertex(VertexType.BOUNDARY, 1, 0)
        z1 = g.add_vertex(VertexType.Z, 0, 1)
        z2 = g.add_vertex(VertexType.Z, 1, 1)
        ha = g.add_vertex(VertexType.H_BOX, 0, 2)
        hb = g.add_vertex(VertexType.H_BOX, 1, 2)
        set_h_box_label(g, ha, a)
        set_h_box_label(g, hb, b)
        not_gate = g.add_vertex(VertexType.X, 0.5, 3, phase=1)
        g.add_edge((b0, z1), EdgeType.SIMPLE)
        g.add_edge((b1, z2), EdgeType.SIMPLE)
        g.add_edge((z1, ha), EdgeType.SIMPLE)
        g.add_edge((z1, hb), EdgeType.SIMPLE)
        g.add_edge((z2, ha), EdgeType.SIMPLE)
        g.add_edge((z2, hb), EdgeType.SIMPLE)
        g.add_edge((ha, not_gate), EdgeType.SIMPLE)
        g.add_edge((hb, not_gate), EdgeType.SIMPLE)
        g.set_inputs((b0, b1))
        g.set_outputs(())
        t_before = g.to_tensor(preserve_scalar=True)
        simp_par_hbox_avg(g)
        t_after = g.to_tensor(preserve_scalar=True)
        self.assertTrue(compare_tensors(t_before, t_after, preserve_scalar=True))

    @unittest.skipUnless(np, "numpy not installed")
    def test_tensor_standard_hboxes(self):
        """Test average rule with standard H-boxes (label -1)."""
        from pyzx.rewrite_rules.par_hbox_rule import simp_par_hbox_avg
        a, b = -1+0j, -1+0j
        g, _, _, _ = self._make_avg_graph(a, b)
        t_before = g.to_tensor(preserve_scalar=True)
        simp_par_hbox_avg(g)
        t_after = g.to_tensor(preserve_scalar=True)
        self.assertTrue(compare_tensors(t_before, t_after, preserve_scalar=True))


if __name__ == '__main__':
    unittest.main()
