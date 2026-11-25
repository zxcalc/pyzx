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
import json
from fractions import Fraction
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

mydir = os.path.dirname(__file__)

try:
    import numpy as np
    from pyzx_cflow.tensor import tensorfy, compare_tensors
except ImportError:
    np = None

from pyzx_cflow.graph import Graph
from pyzx_cflow.circuit import Circuit
from pyzx_cflow.circuit.gates import CNOT
from pyzx_cflow.generate import cliffordT, cliffords
from pyzx_cflow.simplify import clifford_simp
from pyzx_cflow.extract import extract_circuit, extract_simple
from pyzx_cflow.flow import cflow, full_cflow, gflow
from pyzx_cflow.utils import EdgeType, VertexType

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

    def test_full_cflow_gadget_cycle(self):
        """Tests that full_cflow rejects phase gadgets whose order relations form a cycle through three gadgets."""
        g = Graph()
        ins = [g.add_vertex(VertexType.BOUNDARY,q,0) for q in range(3)]
        a = [g.add_vertex(VertexType.Z,q,1) for q in range(3)]
        b = [g.add_vertex(VertexType.Z,q,2) for q in range(3)]
        outs = [g.add_vertex(VertexType.BOUNDARY,q,3) for q in range(3)]
        g.set_inputs(tuple(ins))
        g.set_outputs(tuple(outs))
        for q in range(3):
            g.add_edges([(ins[q],a[q]),(b[q],outs[q])])
            g.add_edge((a[q],b[q]),EdgeType.HADAMARD)
        gadgets = []
        for q in range(3):
            base = g.add_vertex(VertexType.Z,q+0.5,1)
            leaf = g.add_vertex(VertexType.Z,q+0.5,2,Fraction(1,4))
            g.add_edges([(base,leaf),(base,a[q]),(base,b[(q+1)%3])],EdgeType.HADAMARD)
            gadgets.append((base,leaf))
        self.assertTrue(full_cflow(g) is None)
        for i,gadget in enumerate(gadgets):
            with self.subTest(i=i):
                g2 = g.clone()
                g2.remove_vertices(gadget)
                self.assertTrue(full_cflow(g2) is not None)


    def test_gflow_none(self):
        """Tests that gflow returns None for a diagram without gflow rather than looping."""
        g = Graph()
        ins = [g.add_vertex(VertexType.BOUNDARY,q,0) for q in range(2)]
        a = [g.add_vertex(VertexType.Z,q,1) for q in range(2)]
        b = g.add_vertex(VertexType.Z,0,2)
        out = g.add_vertex(VertexType.BOUNDARY,0,3)
        g.set_inputs(tuple(ins))
        g.set_outputs((out,))
        g.add_edges([(ins[0],a[0]),(ins[1],a[1]),(b,out)])
        g.add_edges([(a[0],b),(a[1],b)],EdgeType.HADAMARD)
        self.assertTrue(gflow(g) is None)
        g.remove_vertices([ins[1],a[1]])
        g.set_inputs((ins[0],))
        self.assertTrue(gflow(g) is not None)


if __name__ == '__main__':
    unittest.main()