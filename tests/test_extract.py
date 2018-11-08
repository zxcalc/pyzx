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

SEED = 1337


@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestExtract(unittest.TestCase):

    # def test_clifford_extract(self):
    #     random.seed(SEED)
    #     tests = 0
    #     tries = 0
    #     while True:
    #         tries += 1
    #         circ = cliffords(5,70)
    #         clifford_simp(circ,quiet=True)
    #         circ.normalise()
    #         if circ.depth()>3: continue # It is not in normal form, so skip this one
    #         tests += 1
    #         with self.subTest(test=tests,tries=tries):
    #             t = tensorfy(circ)
    #             clifford_extract(circ,1,2)
    #             t2 = tensorfy(circ)
    #             self.assertTrue(compare_tensors(t,t2))
    #         if tests>5: break

    # def test_greedy_cut_extract(self):
    #     random.seed(SEED)
    #     for i in range(5):
    #         circ = cliffordT(4,50,0.1)
    #         clifford_simp(circ,quiet=True)
    #         circ.normalise()
    #         with self.subTest(i=i):
    #             t = tensorfy(circ)
    #             greedy_cut_extract(circ)
    #             t2 = tensorfy(circ)
    #             self.assertTrue(compare_tensors(t,t2))

    # def test_circuit_extract(self):
    #     random.seed(SEED)
    #     for i in range(5):
    #         circ = cliffordT(4,50,0.1)
    #         clifford_simp(circ,quiet=True)
    #         with self.subTest(i=i):
    #             t = tensorfy(circ)
    #             circuit_extract(circ)
    #             t2 = tensorfy(circ)
    #             self.assertTrue(compare_tensors(t,t2))

    def test_streaming_extract(self):
        random.seed(SEED)
        for i in range(5):
            circ = cliffordT(4,50,0.1)
            t = tensorfy(circ)
            clifford_simp(circ,quiet=True)
            with self.subTest(i=i):
                c = streaming_extract(circ)
                t2 = c.to_tensor()
                self.assertTrue(compare_tensors(t,t2))

if __name__ == '__main__':
    unittest.main()