# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

import unittest
import random
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors
except ImportError:
    np = None

from pyzx.generate import cliffordT, cliffords
from pyzx.simplify import clifford_simp
from pyzx.extract import streaming_extract
from pyzx.circuit import Circuit

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

    def test_cliffordT_preserves_graph_semantics(self):
        random.seed(SEED)
        g = cliffordT(4,20,0.2)
        c = Circuit.from_graph(g)
        g2 = c.to_graph()
        t = tensorfy(g,False)
        t2 = tensorfy(g2,False)
        self.assertTrue(compare_tensors(t,t2, False))

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
        clifford_simp(g, quiet=True)
        c = streaming_extract(g)
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

if __name__ == '__main__':
    unittest.main()