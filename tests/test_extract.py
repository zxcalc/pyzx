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
import json
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

mydir = os.path.dirname(__file__)

try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors
except ImportError:
    np = None

from pyzx.graph import Graph
from pyzx.circuit import Circuit
from pyzx.circuit.gates import CNOT
from pyzx.generate import cliffordT, cliffords
from pyzx.simplify import clifford_simp
from pyzx.extract import extract_circuit, extract_simple
from pyzx.flow import cflow, full_cflow

SEED = 1337


@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestExtract(unittest.TestCase):

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
        
    def test_extract_simple_phase_poly_synth(self):
        with open(os.path.join(mydir,"test_phase_gadget_graph.json"), 'r') as file:
            g_json = json.load(file)
        g = Graph.from_json(g_json)
        self.assertTrue(cflow(g) is None)
        self.assertTrue(full_cflow(g) is not None)
        c = extract_circuit(g.copy())
        c2 = extract_simple(g.copy(), synth_phase_polys=True)
        self.assertTrue(c.verify_equality(c2))


if __name__ == '__main__':
    unittest.main()