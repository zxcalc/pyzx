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
from pyzx.circuit.gates import XPhase, SX, HAD, ZPhase, CNOT, NOT
from pyzx.optimize import full_optimize, basic_optimization


class TestXPhaseOptimization(unittest.TestCase):
    """Test that XPhase and SX gates work with the optimizer. See issue #215."""

    def test_xphase_to_basic_gates(self):
        """XPhase.to_basic_gates() returns normalized XPhase (XPhase is a basic gate)."""
        xp = XPhase(0, Fraction(1, 4))
        basic = xp.to_basic_gates()
        self.assertEqual(len(basic), 1)
        self.assertIsInstance(basic[0], XPhase)
        self.assertEqual(basic[0].phase, Fraction(1, 4))

    def test_xphase_to_basic_gates_with_float(self):
        """XPhase with float phase normalizes to Fraction."""
        xp = XPhase(0, 0.25)
        basic = xp.to_basic_gates()
        self.assertEqual(len(basic), 1)
        self.assertIsInstance(basic[0], XPhase)
        self.assertEqual(basic[0].phase, Fraction(1, 4))

    def test_xphase_to_basic_gates_zero(self):
        """XPhase with phase 0 returns empty list (identity)."""
        xp = XPhase(0, 0)
        basic = xp.to_basic_gates()
        self.assertEqual(len(basic), 0)

    def test_xphase_to_basic_gates_one(self):
        """XPhase with phase 1 returns NOT gate."""
        xp = XPhase(0, 1)
        basic = xp.to_basic_gates()
        self.assertEqual(len(basic), 1)
        self.assertIsInstance(basic[0], NOT)

    def test_sx_to_basic_gates(self):
        """SX.to_basic_gates() returns normalized XPhase (SX is XPhase with phase 1/2)."""
        sx = SX(0)
        basic = sx.to_basic_gates()
        self.assertEqual(len(basic), 1)
        self.assertIsInstance(basic[0], XPhase)
        self.assertEqual(basic[0].phase, Fraction(1, 2))

    def test_not_to_basic_gates(self):
        n = NOT(0)
        basic = n.to_basic_gates()
        self.assertEqual(len(basic), 1)
        self.assertIs(basic[0], n)

    def test_full_optimize_with_xphase(self):
        c = Circuit(2)
        c.add_gate(CNOT(0, 1))
        c.add_gate(XPhase(0, Fraction(1, 4)))
        c.add_gate(HAD(1))
        c.add_gate(XPhase(1, Fraction(1, 2)))
        c.add_gate(CNOT(1, 0))

        optimized = full_optimize(c)
        self.assertIsNotNone(optimized)
        self.assertGreater(len(optimized.gates), 0)

    def test_full_optimize_with_sx(self):
        c = Circuit(2)
        c.add_gate(SX(0))
        c.add_gate(SX(1))
        c.add_gate(CNOT(0, 1))

        optimized = full_optimize(c)
        self.assertIsNotNone(optimized)
        self.assertGreater(len(optimized.gates), 0)

    def test_basic_optimization_with_xphase(self):
        c = Circuit(2)
        c.add_gate(XPhase(0, Fraction(1, 4)))
        c.add_gate(CNOT(0, 1))
        c.add_gate(XPhase(1, Fraction(1, 2)))

        optimized = basic_optimization(c.to_basic_gates())
        self.assertIsNotNone(optimized)

    def test_issue_215_pyzx_example(self):
        """Regression test for issue #215: XPhase gate from pyzx.circuit example."""
        c = Circuit(1)
        c.add_gate('XPhase', 0, phase=3/4)  # Use float as in original issue
        optimized = full_optimize(c.to_basic_gates())
        self.assertIsNotNone(optimized)

    def test_issue_215_qasm_example(self):
        """Regression test for issue #215: QASM with rx gates.

        Note: This circuit contains non-Clifford+T gates, so we use basic_optimization.
        """
        qasm = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
h q[0];
h q[1];
h q[2];
cx q[0],q[2];
rz(pi*1.79986) q[2];
cx q[0],q[2];
cx q[0],q[1];
cx q[1],q[2];
rz(pi*-3.59973) q[2];
cx q[1],q[2];
cx q[0],q[1];
rx(pi*0.545344) q[2];
rz(pi*-5.39959) q[1];
rx(pi*0.545344) q[0];
rx(pi*0.545344) q[1];
"""
        c = Circuit.from_qasm(qasm)
        optimized = basic_optimization(c.to_basic_gates())
        self.assertIsNotNone(optimized)


if __name__ == '__main__':
    unittest.main()
