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

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
from pyzx.graph import Graph
from pyzx.circuit import Circuit
from pyzx.circuit.qasmparser import qasm
from fractions import Fraction
from pyzx.generate import cliffordT
from pyzx.simplify import *
from pyzx.simplify import supplementarity_simp

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors
except ImportError:
    np = None

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

    def test_teleport_reduce(self):
        """Tests whether teleport_reduce preserves semantics on a set of circuits that have been broken before."""
        for i,s in enumerate([qasm_1,qasm_2,qasm_3,qasm_4]):
            with self.subTest(i=i):
                c = qasm(s)
                g = c.to_graph()
                c2 = Circuit.from_graph(teleport_reduce(g))
                self.assertTrue(c.verify_equality(c2))

    def test_to_graph_like_introduce_boundary_vertices(self):
        c = qasm(qasm_5)
        g = c.to_graph()
        to_graph_like(g)
        self.assertTrue(compare_tensors(c,g))


qasm_1 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
x q[2];
ccx q[0], q[2], q[1];
x q[2];
ccx q[2], q[1], q[0];
cx q[2], q[0];
x q[2];
ccx q[0], q[2], q[1];
ccx q[0], q[2], q[1];
"""

qasm_2 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
ccx q[0], q[1], q[2];
ccx q[0], q[1], q[2];
ccx q[1], q[0], q[2];
x q[0];
ccx q[1], q[0], q[2];
ccx q[2], q[1], q[0];
ccx q[2], q[1], q[0];
ccx q[1], q[0], q[2];
"""

qasm_3 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
ccx q[1], q[2], q[0];
x q[0];
x q[1];
ccx q[1], q[0], q[2];
ccx q[1], q[0], q[2];
ccx q[1], q[0], q[2];
ccx q[0], q[1], q[2];
ccx q[0], q[2], q[1];
"""

qasm_4 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
ccx q[1], q[2], q[0];
x q[1];
ccx q[2], q[1], q[0];
ccx q[2], q[1], q[0];
ccx q[0], q[1], q[2];
ccx q[0], q[2], q[1];
ccx q[2], q[0], q[1];
cx q[1], q[2];
"""

qasm_5 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
h q[0];
h q[1];
cz q[0],q[1];
"""


if __name__ == '__main__':
    unittest.main()
