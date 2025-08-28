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
from types import ModuleType
from typing import Optional
from fractions import Fraction

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
from pyzx.circuit import Circuit
from pyzx.circuit.gates import CNOT
from pyzx.generate import cliffordT
from pyzx.simplify import clifford_simp
from pyzx.extract import extract_circuit
from pyzx import simplify

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors
except ImportError:
    np = None


SEED = 1337


@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestExtract(unittest.TestCase):

    def test_simple_extract(self):
        c = Circuit(1)
        c.add_gate("HAD", 0)
        c.add_gate("ZPhase", 0, phase= Fraction(1,4))

        g = c.to_graph()
        
        simplify.full_reduce(g,quiet=True)

        c2 = extract_circuit(g)
        self.assertListEqual(c.gates, c2.gates)
        self.assertTrue(c.verify_equality(c2))

    def test_extract_not_graph_like(self):
        c = Circuit(1)
        c.add_gate("HAD", 0)
        c.add_gate("ZPhase", 0, phase=1/4)

        g = c.to_graph()
        

        with self.assertRaises(ValueError) as context:
            c = extract_circuit(g)
        self.assertTrue("Input graph is not graph-like. Try running full_reduce first" in str(context.exception))



    def test_extract_circuit(self):
        random.seed(SEED)
        for i in range(5):
            circ = cliffordT(4,50,0.1)
            t = tensorfy(circ,False)
            clifford_simp(circ,quiet=True)
            with self.subTest(i=i):
                c = extract_circuit(circ)
                t2 = c.to_tensor(False)
                self.assertTrue(compare_tensors(t,t2,False))

    def test_cz_optimize_extract(self):
        qb_no = 8
        c = Circuit(qb_no)
        for i in range(qb_no):
            for j in range(i+1,qb_no):
                c.add_gate("CZ",i,j)

        g = c.to_graph()
        clifford_simp(g,quiet=True)
        c2 = extract_circuit(g)
        cnot_count = 0
        for gate in c2.gates:
            if isinstance(gate, CNOT):
                cnot_count+=1
        self.assertTrue(cnot_count==4)
        self.assertTrue(c.verify_equality(c2))
        


if __name__ == '__main__':
    unittest.main()