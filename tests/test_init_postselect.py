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
from fractions import Fraction

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.circuit import Circuit
from pyzx.circuit.gates import InitAncilla, Measurement, PostSelect, Reset
from pyzx.utils import VertexType


STATE_EXPECTED = {
    '+': (VertexType.Z, Fraction(0)),
    '-': (VertexType.Z, Fraction(1)),
    '0': (VertexType.X, Fraction(0)),
    '1': (VertexType.X, Fraction(1)),
}


class TestInitAncilla(unittest.TestCase):
    """Tests for InitAncilla gate."""

    def test_states(self):
        """Test that each state maps to correct vertex type and phase."""
        for state, (expected_vtype, expected_phase) in STATE_EXPECTED.items():
            with self.subTest(state=state):
                gate = InitAncilla(0, state)
                vtype, phase = gate.get_vertex_info()
                self.assertEqual(vtype, expected_vtype)
                self.assertEqual(phase, expected_phase)

    def test_default_state(self):
        """Test default state is '+'."""
        self.assertEqual(InitAncilla(0).state, '+')

    def test_invalid_state(self):
        """Test that invalid state raises ValueError."""
        with self.assertRaises(ValueError):
            InitAncilla(0, state='invalid')

    def test_str(self):
        """Test string representation."""
        self.assertEqual(str(InitAncilla(0)), "InitAncilla(0)")
        self.assertEqual(str(InitAncilla(0, '0')), "InitAncilla(0, state='0')")

    def test_equality(self):
        """Test equality comparison."""
        self.assertEqual(InitAncilla(0), InitAncilla(0, '+'))
        self.assertNotEqual(InitAncilla(0, '+'), InitAncilla(0, '-'))
        self.assertNotEqual(InitAncilla(0), InitAncilla(1))


class TestPostSelect(unittest.TestCase):
    """Tests for PostSelect gate."""

    def test_states(self):
        """Test that each state maps to correct vertex type and phase."""
        for state, (expected_vtype, expected_phase) in STATE_EXPECTED.items():
            with self.subTest(state=state):
                gate = PostSelect(0, state)
                vtype, phase = gate.get_vertex_info()
                self.assertEqual(vtype, expected_vtype)
                self.assertEqual(phase, expected_phase)

    def test_default_state(self):
        """Test default state is '+'."""
        self.assertEqual(PostSelect(0).state, '+')

    def test_invalid_state(self):
        """Test that invalid state raises ValueError."""
        with self.assertRaises(ValueError):
            PostSelect(0, state='invalid')

    def test_str(self):
        """Test string representation."""
        self.assertEqual(str(PostSelect(0)), "PostSelect(0)")
        self.assertEqual(str(PostSelect(0, '1')), "PostSelect(0, state='1')")

    def test_equality(self):
        """Test equality comparison."""
        self.assertEqual(PostSelect(0), PostSelect(0, '+'))
        self.assertNotEqual(PostSelect(0, '+'), PostSelect(0, '-'))
        self.assertNotEqual(PostSelect(0), PostSelect(1))
        self.assertNotEqual(PostSelect(0), InitAncilla(0))


class TestReset(unittest.TestCase):
    """Tests for Reset gate."""

    def test_str(self):
        self.assertEqual(str(Reset(0)), "Reset(0)")
        self.assertEqual(str(Reset(3)), "Reset(3)")

    def test_equality(self):
        self.assertEqual(Reset(0), Reset(0))
        self.assertNotEqual(Reset(0), Reset(1))
        self.assertNotEqual(Reset(0), InitAncilla(0, '0'))

    def test_to_qasm(self):
        self.assertEqual(Reset(2).to_qasm(), "reset q[2];")

    def test_reposition(self):
        mask = [0, 5, 2, 3]
        g1 = Reset(1)
        g2 = g1.reposition(mask)
        self.assertEqual(g2.target, 5)
        self.assertEqual(g2.label, 5)

    def test_to_graph(self):
        """Test that Reset on an existing qubit produces ground + state vertices."""
        c = Circuit(1)
        c.add_gate(Reset(0))
        g = c.to_graph()

        # Effect vertex: Z spider connected to ground (discard).
        ground_verts = list(g.grounds())
        self.assertEqual(len(ground_verts), 1)
        self.assertEqual(g.type(ground_verts[0]), VertexType.Z)
        self.assertEqual(g.phase(ground_verts[0]), 0)

        # State vertex: X spider phase 0 (|0⟩ preparation).
        x_verts = [v for v in g.vertices() if g.type(v) == VertexType.X]
        self.assertEqual(len(x_verts), 1)
        self.assertEqual(g.phase(x_verts[0]), 0)


class TestMeasurementEquality(unittest.TestCase):
    """Tests for Measurement equality."""

    def test_same(self):
        self.assertEqual(Measurement(0, result_symbol="c[0]"),
                         Measurement(0, result_symbol="c[0]"))

    def test_different_target(self):
        self.assertNotEqual(Measurement(0, result_symbol="c[0]"),
                            Measurement(1, result_symbol="c[0]"))

    def test_different_result_symbol(self):
        self.assertNotEqual(Measurement(0, result_symbol="c[0]"),
                            Measurement(0, result_symbol="d[0]"))

    def test_different_result_bit(self):
        self.assertNotEqual(Measurement(0, result_bit=0),
                            Measurement(0, result_bit=1))


class TestReposition(unittest.TestCase):
    """Tests for repositioning InitAncilla/PostSelect gates."""

    def test_reposition(self):
        """Test that reposition updates both label and target."""
        mask = [0, 5, 2, 3]
        for gate_class in [InitAncilla, PostSelect]:
            with self.subTest(gate=gate_class.__name__):
                g1 = gate_class(1, '0')
                g2 = g1.reposition(mask)
                self.assertEqual(g2.label, 5)
                self.assertEqual(g2.target, 5)
                self.assertEqual(g2.state, '0')


class TestToGraph(unittest.TestCase):
    """Tests for converting InitAncilla/PostSelect to graph."""

    def test_to_graph(self):
        """Test circuit with InitAncilla and PostSelect converts to graph."""
        for state in STATE_EXPECTED:
            with self.subTest(state=state):
                c = Circuit(1)
                c.add_gate(InitAncilla(1, state))
                c.add_gate("CNOT", 0, 1)
                c.add_gate(PostSelect(1, state))
                g = c.to_graph()
                self.assertGreater(g.num_vertices(), 0)


if __name__ == '__main__':
    unittest.main()
