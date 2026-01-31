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
import random
import sys
import os
from fractions import Fraction
from types import ModuleType
from typing import Optional

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
mydir = os.path.dirname(__file__)
from pyzx.generate import cliffordT, cliffords
from pyzx.simplify import clifford_simp
from pyzx.extract import extract_circuit
from pyzx.circuit import Circuit, PhaseGadget
from pyzx.circuit.gates import ParityPhase, FSim
from pyzx.utils import VertexType, EdgeType
from fractions import Fraction

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors
    import math
except ImportError:
    np = None

SEED = 1337


@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestCircuit(unittest.TestCase):

    def setUp(self):
        c = Circuit(3)
        c.add_gate("CNOT",0,1)
        c.add_gate("S",2)
        c.add_gate("CNOT",2,1)
        self.c = c

    def test_to_graph_and_back(self):
        g = self.c.to_graph()
        c2 = Circuit.from_graph(g)
        self.assertEqual(self.c.qubits, c2.qubits)
        self.assertListEqual(self.c.gates,c2.gates)

    def test_to_qasm_and_back(self):
        s = self.c.to_qasm()
        c2 = Circuit.from_qasm(s)
        self.assertEqual(self.c.qubits, c2.qubits)
        self.assertListEqual(self.c.gates,c2.gates)

    def test_to_qc_and_back(self):
        s = self.c.to_qc()
        c2 = Circuit.from_qc(s)
        self.assertEqual(self.c.qubits, c2.qubits)
        self.assertListEqual(self.c.gates,c2.gates)

    def test_to_quipper_and_back(self):
        s = self.c.to_quipper()
        c2 = Circuit.from_quipper(s)
        self.assertEqual(self.c.qubits, c2.qubits)
        self.assertListEqual(self.c.gates,c2.gates)

    def test_load_quipper_from_file(self):
        c1 = Circuit.from_quipper_file(os.path.join(mydir,"test_circuit.circuit"))
        c2 = Circuit.from_quipper_file(os.path.join(mydir,"test_circuit_nocontrol_noqubits.circuit"))
        self.assertEqual(c1.qubits, c2.qubits)
        self.assertListEqual(c2.gates,c2.gates)

    def test_cliffordT_preserves_graph_semantics(self):
        for i in range(1,5):
            with self.subTest(i):
                random.seed(SEED)
                g = cliffordT(i,20,0.2)
                c = Circuit.from_graph(g)
                g2 = c.to_graph()
                t = tensorfy(g,False)
                t2 = tensorfy(g2,False)
                self.assertTrue(compare_tensors(t,t2, False))

    def test_cliffordT_raises_exception_with_pcnot(self):
        self.assertRaises(ValueError, cliffordT, 1, 1, p_cnot=0.1)

    def test_cliffords_preserves_graph_semantics(self):
        random.seed(SEED)
        g = cliffords(5,30)
        c = Circuit.from_graph(g)
        g2 = c.to_graph()
        t = tensorfy(g,False)
        t2 = tensorfy(g2,False)
        self.assertTrue(compare_tensors(t,t2,False))

    def test_circuit_extract_preserves_semantics(self):
        random.seed(SEED)
        g = cliffordT(5, 70, 0.15)
        t = g.to_tensor(False)
        clifford_simp(g)
        c = extract_circuit(g)
        t2 = c.to_tensor(False)
        self.assertTrue(compare_tensors(t,t2,False))

    def test_two_qubit_gate_semantics(self):
        c = Circuit(2)
        c.add_gate("CNOT",0,1)
        cnot_matrix = np.array([[1,0,0,0],[0,1,0,0],[0,0,0,1],[0,0,1,0]])
        self.assertTrue(compare_tensors(c.to_matrix(),cnot_matrix))
        c = Circuit(2)
        c.add_gate("CZ",0,1)
        cz_matrix = np.array([[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,-1]])
        self.assertTrue(compare_tensors(c.to_matrix(),cz_matrix))

    def test_measurement_gate(self):
        c = Circuit(2)
        c1 = Circuit(2)
        c.add_gate("Measurement", 0)
        c1.add_gate("Measurement", 0, None)

        self.assertTrue(c.gates[0] == c1.gates[0])
        g = c.to_graph()
        g1 = c1.to_graph()
        self.assertTrue(len(g.vertices()) == len(g1.vertices()))


    def test_verify_equality_permutation_option(self):
        c1 = Circuit(2)
        c2 = Circuit(2)
        c2.add_gate("SWAP",0,1)
        self.assertTrue(c1.verify_equality(c2,up_to_swaps=True))
        self.assertFalse(c1.verify_equality(c2,up_to_swaps=False))

@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestPhaseGadgetGate(unittest.TestCase):
    def test_gate_creation(self):
        # PhaseGadget is a convenience function that returns ParityPhase with as_gadget=True.
        pg = PhaseGadget(Fraction(1, 4), 0, 1, 2)
        self.assertIsInstance(pg, ParityPhase)
        self.assertEqual(pg.name, 'ParityPhase')
        self.assertEqual(pg.phase, Fraction(1, 4))
        self.assertEqual(pg.targets, (0, 1, 2))
        self.assertTrue(pg.as_gadget)

    def test_as_gadget_parameter(self):
        # Test direct use of as_gadget parameter on ParityPhase.
        pp = ParityPhase(Fraction(1, 4), 0, 1, 2, as_gadget=True)
        self.assertTrue(pp.as_gadget)
        self.assertEqual(pp.phase, Fraction(1, 4))
        self.assertEqual(pp.targets, (0, 1, 2))

        # Default should be False.
        pp2 = ParityPhase(Fraction(1, 4), 0, 1, 2)
        self.assertFalse(pp2.as_gadget)

    def test_add_to_circuit(self):
        c = Circuit(3)
        c.add_gate("PhaseGadget", Fraction(1, 2), 0, 1, 2)
        self.assertIsInstance(c.gates[0], ParityPhase)
        self.assertEqual(c.gates[0].phase, Fraction(1, 2))
        self.assertEqual(c.gates[0].targets, (0, 1, 2))
        self.assertTrue(c.gates[0].as_gadget)

        c2 = Circuit(3)
        c2.add_gate(PhaseGadget(Fraction(1, 4), 0, 2))
        self.assertEqual(c2.gates[0].phase, Fraction(1, 4))
        self.assertEqual(c2.gates[0].targets, (0, 2))
        self.assertTrue(c2.gates[0].as_gadget)

    def test_to_graph_structure(self):
        c = Circuit(3)
        c.add_gate("PhaseGadget", Fraction(1, 4), 0, 1, 2)
        g = c.to_graph()

        leaf_candidates = [v for v in g.vertices()
                           if g.type(v) == VertexType.Z
                           and g.phase(v) == Fraction(1, 4)
                           and g.vertex_degree(v) == 1]

        self.assertEqual(len(leaf_candidates), 1, "Should find exactly one phase gadget leaf")
        leaf = leaf_candidates[0]

        hub = list(g.neighbors(leaf))[0]
        self.assertEqual(g.type(hub), VertexType.Z)
        self.assertEqual(g.phase(hub), 0)

        self.assertEqual(g.vertex_degree(hub), 4)

        self.assertEqual(g.edge_type(g.edge(leaf, hub)), EdgeType.HADAMARD)

        neighbors = list(g.neighbors(hub))
        neighbors.remove(leaf)
        for n in neighbors:
            self.assertEqual(g.edge_type(g.edge(hub, n)), EdgeType.HADAMARD)
            self.assertEqual(g.type(n), VertexType.Z)
            self.assertEqual(g.phase(n), 0)

    def test_extract_phase_gadget(self):
        c = Circuit(3)
        c.add_gate("PhaseGadget", Fraction(1, 4), 0, 1, 2)
        g = c.to_graph()

        c2 = extract_circuit(g)
        self.assertEqual(c.qubits, c2.qubits)

        self.assertTrue(compare_tensors(c.to_tensor(), c2.to_tensor(), False))

    def test_gadget_vs_basic_gates_semantics(self):
        # ParityPhase with as_gadget=True and as_gadget=False should have the same semantics.
        c_gadget = Circuit(3)
        c_gadget.add_gate(ParityPhase(Fraction(1, 4), 0, 1, 2, as_gadget=True))

        c_basic = Circuit(3)
        c_basic.add_gate(ParityPhase(Fraction(1, 4), 0, 1, 2, as_gadget=False))

        # The tensors should be equivalent.
        self.assertTrue(compare_tensors(c_gadget.to_tensor(), c_basic.to_tensor(), False))

    def test_parity_phase_copy_preserves_as_gadget(self):
        pp = ParityPhase(Fraction(1, 4), 0, 1, 2, as_gadget=True)
        pp_copy = pp.copy()
        self.assertTrue(pp_copy.as_gadget)
        self.assertEqual(pp_copy.phase, pp.phase)
        self.assertEqual(pp_copy.targets, pp.targets)

        pp2 = ParityPhase(Fraction(1, 4), 0, 1, 2, as_gadget=False)
        pp2_copy = pp2.copy()
        self.assertFalse(pp2_copy.as_gadget)

    def test_fsim_reposition(self):
        g = FSim(0, 1, Fraction(1, 2), Fraction(1, 4))
        g2 = g.reposition([2, 3, 0, 1])
        self.assertEqual(g2.control, 2)
        self.assertEqual(g2.target, 3)
        # Original should be unchanged.
        self.assertEqual(g.control, 0)
        self.assertEqual(g.target, 1)

if __name__ == '__main__':
    unittest.main()
