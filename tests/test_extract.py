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
from pyzx.circuit.gates import CNOT, Measurement, Reset
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



    def test_extract_measurement_graph_raises(self):
        """Regression test for zxcalc/pyzx#420: extract_circuit should
        raise ValueError on reduced graphs from circuits with measurements."""
        import pyzx as zx
        c = zx.Circuit(1, bit_amount=1)
        c.add_gate(Measurement(0, result_bit=0))
        g = c.to_graph()
        simplify.full_reduce(g, quiet=True)
        with self.assertRaises(ValueError):
            extract_circuit(g)

    def test_extract_ground_vertex_raises(self):
        """extract_circuit should raise ValueError on graphs with ground
        vertices, even when input and output counts match."""
        import pyzx as zx
        from pyzx.utils import VertexType, EdgeType
        g = zx.Graph()
        inp = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        out = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        z = g.add_vertex(VertexType.Z, 0, 1)
        gnd = g.add_vertex(VertexType.Z, 0, 2, ground=True)
        g.add_edge((inp, z), EdgeType.SIMPLE)
        g.add_edge((z, gnd), EdgeType.SIMPLE)
        g.add_edge((z, out), EdgeType.SIMPLE)
        g.set_inputs((inp,))
        g.set_outputs((out,))
        self.assertTrue(g.is_hybrid())
        with self.assertRaises(ValueError) as ctx:
            extract_circuit(g)
        self.assertIn("ground", str(ctx.exception))


if __name__ == '__main__':
    unittest.main()
