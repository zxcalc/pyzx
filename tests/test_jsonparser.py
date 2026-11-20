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
from fractions import Fraction
import json
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.graph import Graph
from pyzx.graph.diff import GraphDiff
from pyzx.graph.scalar import Scalar
from pyzx.graph.jsonparser import graph_to_dict, dict_to_graph, string_to_phase
from pyzx.utils import EdgeType, VertexType, set_h_box_label, get_h_box_label, hbox_has_complex_label
from pyzx.symbolic import Poly, new_var


class TestGraphIO(unittest.TestCase):

    def test_load_multigraph_preserve_parallel_edges(self):
        g = Graph('multigraph')
        g.set_auto_simplify(False)
        v = g.add_vertex(VertexType.Z, 0, 0)
        w = g.add_vertex(VertexType.X, 0, 1)
        x = g.add_vertex(VertexType.X, 0, 2)
        g.add_edge((v,w))
        g.add_edge((v,w))
        g.add_edge((w,x))
        g.add_edge((w,x),EdgeType.HADAMARD)

        d = g.to_dict()
        g2 = Graph.from_json(d)
        self.assertTrue(g2.backend,'multigraph')
        self.assertFalse(g2.get_auto_simplify())
        self.assertEqual(g.num_edges(), g2.num_edges())

        js = json.dumps(d)
        g3 = Graph.from_json(js)
        self.assertTrue(g3.backend,'multigraph')
        self.assertFalse(g3.get_auto_simplify())
        self.assertEqual(g.num_edges(), g3.num_edges())

    def test_load_tikz(self):
        g = Graph('multigraph')
        g.set_auto_simplify(False)
        v = g.add_vertex(VertexType.Z, 0, 0)
        w = g.add_vertex(VertexType.X, 0, 1)
        x = g.add_vertex(VertexType.X, 0, 2)
        g.add_edge((v,w))
        g.add_edge((v,w))
        g.add_edge((w,x))
        g.add_edge((w,x),EdgeType.HADAMARD)

        tikz = g.to_tikz()
        g2 = Graph.from_tikz(tikz, warn_overlap=False)

    def test_dict_to_graph_scalar_roundtrip(self):
        g = Graph()
        v = g.add_vertex(VertexType.Z, 0, 0)
        w = g.add_vertex(VertexType.X, 0, 1)
        x = g.add_vertex(VertexType.Z, 0, 2)
        g.add_edge((v, w))
        g.add_edge((w, x), EdgeType.HADAMARD)

        g.scalar.power2 = 3
        g.scalar.phase = Fraction(1, 4)
        g.scalar.floatfactor = 2.5
        normalized_scalar = Scalar.from_json(g.scalar.to_dict())

        d = graph_to_dict(g)

        g2 = dict_to_graph(d)
        self.assertEqual(g2.scalar, normalized_scalar)

        js = json.dumps(d)
        d2 = json.loads(js)
        g3 = dict_to_graph(d2)
        self.assertEqual(g3.scalar, normalized_scalar)

    def test_zbox_label_roundtrip(self):
        g = Graph()
        v1 = g.add_vertex(VertexType.Z_BOX, 0, 0)
        v2 = g.add_vertex(VertexType.Z_BOX, 0, 1)
        v3 = g.add_vertex(VertexType.Z_BOX, 0, 2)

        poly_label = new_var('alpha', is_bool=False, registry=g.var_registry) + Fraction(1, 2)
        g.set_vdata(v1, 'label', Fraction(3, 4))
        g.set_vdata(v2, 'label', poly_label)
        g.set_vdata(v3, 'label', 2.5 + 1.3j)
        g.set_vdata(v1, 'name', 'my vertex')
        g.set_vdata(v2, 'custom', 42)

        d = graph_to_dict(g)
        g2 = dict_to_graph(d)

        self.assertEqual(g2.vdata(v1, 'label'), Fraction(3, 4))
        self.assertEqual(g2.vdata(v2, 'label'), poly_label)
        self.assertEqual(g2.vdata(v3, 'label'), 2.5 + 1.3j)
        self.assertEqual(g2.vdata(v1, 'name'), 'my vertex')
        self.assertEqual(g2.vdata(v2, 'custom'), 42)

        js = json.dumps(d)
        d2 = json.loads(js)
        g3 = dict_to_graph(d2)

        self.assertEqual(g3.vdata(v1, 'label'), Fraction(3, 4))
        self.assertEqual(g3.vdata(v2, 'label'), poly_label)
        self.assertEqual(g3.vdata(v3, 'label'), 2.5 + 1.3j)
        self.assertEqual(g3.vdata(v1, 'name'), 'my vertex')
        self.assertEqual(g3.vdata(v2, 'custom'), 42)

    def test_hbox_label_roundtrip(self):
        """Test JSON round-trip for H-box complex labels."""
        g = Graph()
        v1 = g.add_vertex(VertexType.H_BOX, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        v3 = g.add_vertex(VertexType.H_BOX, 0, 2)

        set_h_box_label(g, v1, -1)  # Standard Hadamard
        set_h_box_label(g, v2, 1j)  # Complex label
        set_h_box_label(g, v3, 2.5 + 1.3j)  # Another complex label

        d = graph_to_dict(g)
        g2 = dict_to_graph(d)

        self.assertTrue(hbox_has_complex_label(g2, v1))
        self.assertTrue(hbox_has_complex_label(g2, v2))
        self.assertTrue(hbox_has_complex_label(g2, v3))
        self.assertEqual(get_h_box_label(g2, v1), -1)
        self.assertEqual(get_h_box_label(g2, v2), 1j)
        self.assertEqual(get_h_box_label(g2, v3), 2.5 + 1.3j)

        js = json.dumps(d)
        d2 = json.loads(js)
        g3 = dict_to_graph(d2)

        self.assertTrue(hbox_has_complex_label(g3, v1))
        self.assertTrue(hbox_has_complex_label(g3, v2))
        self.assertTrue(hbox_has_complex_label(g3, v3))
        self.assertEqual(get_h_box_label(g3, v1), -1)
        self.assertEqual(get_h_box_label(g3, v2), 1j)
        self.assertEqual(get_h_box_label(g3, v3), 2.5 + 1.3j)

    def test_hbox_label_tikz_roundtrip(self):
        """Test tikz round-trip for H-box complex labels."""
        g = Graph()
        v1 = g.add_vertex(VertexType.H_BOX, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        v3 = g.add_vertex(VertexType.H_BOX, 0, 2)

        set_h_box_label(g, v1, -1)  # Standard Hadamard
        set_h_box_label(g, v2, 1j)  # Complex label
        set_h_box_label(g, v3, 2.5+1.3j)  # Another complex label

        tikz = g.to_tikz()
        g2 = Graph.from_tikz(tikz, warn_overlap=False)

        # Find corresponding vertices in g2 by position.
        v1_new = [v for v in g2.vertices() if g2.row(v) == 0][0]
        v2_new = [v for v in g2.vertices() if g2.row(v) == 1][0]
        v3_new = [v for v in g2.vertices() if g2.row(v) == 2][0]

        # Standard Hadamard (-1) exports as empty and imports as legacy phase=1.
        # Check semantic equivalence rather than format preservation.
        self.assertAlmostEqual(get_h_box_label(g2, v1_new), -1, places=10)
        # Non-standard labels should preserve exact format.
        self.assertTrue(hbox_has_complex_label(g2, v2_new))
        self.assertTrue(hbox_has_complex_label(g2, v3_new))
        self.assertEqual(get_h_box_label(g2, v2_new), 1j)
        self.assertEqual(get_h_box_label(g2, v3_new), 2.5+1.3j)

class TestGraphDiff(unittest.TestCase):

    def test_scalar_change_roundtrip(self):
        g1 = Graph()
        g2 = g1.clone()
        g2.scalar.power2 = 3
        g2.scalar.phase = Fraction(1, 4)
        g2.scalar.phasenodes = [Fraction(1, 2)]
        g2.scalar.sum_of_phases = {Fraction(3, 4): 2}
        g2.scalar.floatfactor = 2.5 + 1.5j

        diff = GraphDiff(g1, g2)
        roundtripped_diff = GraphDiff.from_json(diff.to_json())

        self.assertEqual(diff.apply_diff(g1).scalar, g2.scalar)
        self.assertEqual(roundtripped_diff.changed_scalar, g2.scalar)
        applied = roundtripped_diff.apply_diff(g1)
        self.assertEqual(applied.scalar, g2.scalar)
        self.assertIsNot(applied.scalar, roundtripped_diff.changed_scalar)

    def test_unchanged_scalar_is_omitted(self):
        g = Graph()
        diff = GraphDiff(g, g.clone())

        self.assertIsNone(diff.changed_scalar)
        self.assertNotIn("changed_scalar", diff.to_dict())

        legacy_diff = GraphDiff.from_json(diff.to_json())
        self.assertIsNone(legacy_diff.changed_scalar)
        self.assertEqual(legacy_diff.apply_diff(g).scalar, g.scalar)

class TestStringToPhase(unittest.TestCase):

    def test_numeric_expression_parses_to_fraction(self):
        """Numeric strings that miss the fast path return a Fraction, not a constant Poly (issue #471)."""
        for s, expected in [("(1)*1/4", Fraction(1, 4)),
                            ("(3*pi)*1/4", Fraction(3, 4)),
                            ("(-3)*1/2", Fraction(-3, 2)),
                            ("1/2+1/4", Fraction(3, 4))]:
            with self.subTest(s=s):
                phase = string_to_phase(s)
                self.assertEqual(phase, expected)
                self.assertIsInstance(phase, Fraction)

    def test_symbolic_expression_parses_to_poly(self):
        g = Graph()
        phase = string_to_phase("alpha + 1/2", g)
        self.assertIsInstance(phase, Poly)
        self.assertEqual(len(phase.free_vars()), 1)

    def test_cancelling_symbolic_expression_parses_to_fraction(self):
        g = Graph()
        phase = string_to_phase("alpha - alpha", g)
        self.assertEqual(phase, 0)
        self.assertIsInstance(phase, Fraction)

    def test_parsed_numeric_phase_works_as_dict_key(self):
        """Phases are used as dict keys (e.g. in Scalar.from_json), so equal phases must hash equally."""
        d = {string_to_phase("(1)*1/4"): 1}
        self.assertIn(Fraction(1, 4), d)

    def test_numeric_phase_as_scalar_dict_key(self):
        """Phases are used as dict keys in Scalar.sum_of_phases, so a numeric phase
        parsed from JSON must hash equally to the Fraction it denotes (issue #471)."""
        scalar = Scalar.from_json(json.dumps(
            {"power2": 0, "phase": "(1)*1/4", "sum_of_phases": {"(1)*3/4": 2}}))
        self.assertIsInstance(scalar.phase, Fraction)
        self.assertEqual(scalar.phase, Fraction(1, 4))
        self.assertEqual(scalar.sum_of_phases.get(Fraction(3, 4)), 2)

    def test_graph_diff_phases_round_trip(self):
        """GraphDiff.from_json also parses phases with string_to_phase; numeric
        phases must come back as Fraction and symbolic ones as Poly."""
        g1 = Graph()
        v1 = g1.add_vertex(VertexType.Z, 0, 0)
        v2 = g1.add_vertex(VertexType.X, 0, 1)
        g2 = g1.clone()
        g2.set_phase(v1, Fraction(3, 4))
        g2.set_phase(v2, new_var('alpha', is_bool=False, registry=g2.var_registry) + Fraction(1, 2))
        diff = GraphDiff.from_json(GraphDiff(g1, g2).to_json())
        self.assertIsInstance(diff.changed_phases[v1], Fraction)
        self.assertEqual(diff.changed_phases[v1], Fraction(3, 4))
        self.assertIsInstance(diff.changed_phases[v2], Poly)
        applied = diff.apply_diff(g1.clone())
        self.assertEqual(applied.phase(v1), Fraction(3, 4))
        self.assertEqual(applied.phase(v2), g2.phase(v2))


if __name__ == '__main__':
    unittest.main()
