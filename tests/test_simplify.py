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

from pyzx.graph import Graph
from fractions import Fraction
from pyzx.generate import cliffordT
from pyzx.simplify import *
from pyzx.simplify import supplementarity_simp

SEED = 1337

@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestSimplify(unittest.TestCase):

    def setUp(self):
        random.seed(SEED)
        self.circuits = []
        self.circuits.append(cliffordT(3,20,0.3))
        self.circuits.append(cliffordT(3,10,0.1))
        self.circuits.append(cliffordT(4,30,0.3))
        self.circuits.append(cliffordT(5,50,0.08))
        self.circuits.append(cliffordT(4,80,0.1))

    def func_test(self, func, prepare=None):
        for i,c in enumerate(self.circuits):
            with self.subTest(i=i, func=func.__name__):
                if prepare:
                    for f in prepare: f(c,quiet=True)
                t = tensorfy(c)
                func(c, quiet=True)
                t2 = tensorfy(c)
                self.assertTrue(compare_tensors(t,t2))
                del t, t2

    def test_spider_simp(self):
        self.func_test(spider_simp)

    def test_id_simp(self):
        self.func_test(id_simp)

    def test_to_gh(self):
        self.func_test(to_gh)

    def test_pivot_simp(self):
        self.func_test(pivot_simp,prepare=[spider_simp,to_gh,spider_simp])

    def test_lcomp_simp(self):
        self.func_test(lcomp_simp,prepare=[spider_simp,to_gh,spider_simp])

    def test_clifford_simp(self):
        self.func_test(clifford_simp)

    def test_supplementarity_simp(self):
        g = Graph()
        v = g.add_vertex(1,0,0,phase=Fraction(1,4))
        w = g.add_vertex(1,1,0,phase=Fraction(7,4))
        g.add_edge((v,w),2)
        vs = []
        for i in range(3):
            h = g.add_vertex(1,i,2,Fraction(1))
            vs.append(h)
            g.add_edges([(v,h),(w,h)],2)
        t = g.to_tensor()
        i = supplementarity_simp(g,quiet=True)
        self.assertEqual(i,1)
        self.assertTrue(compare_tensors(t,g.to_tensor()))


if __name__ == '__main__':
    unittest.main()