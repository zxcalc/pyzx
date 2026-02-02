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
from pyzx.utils import EdgeType, VertexType
from pyzx.rewrite_rules.hbox_cancel_rule import check_hbox_cancel, hbox_cancel
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

if __name__ == '__main__':
    unittest.main()
