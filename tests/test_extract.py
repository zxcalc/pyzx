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

from pyzx.circuit import Circuit
from pyzx.circuit.gates import CNOT
from pyzx.generate import cliffordT, cliffords
from pyzx.simplify import clifford_simp
from pyzx.extract import extract_circuit

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

    def test_cz_optimise_extract(self):
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