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
from fractions import Fraction
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors, compose_tensors, adjoint
except ImportError:
    np = None

from pyzx.graph import Graph
from pyzx.generate import cliffords
from pyzx.circuit import Circuit

SEED = 1337

@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestTensor(unittest.TestCase):

    def test_scalar_difference(self):
        array = np.array([[0,1],[1,0]])
        scalar = 0.75 + 3j
        self.assertFalse(compare_tensors(scalar*array,array,True))
    def test_scalar_difference_ignore(self):
        array = np.array([[0,1],[1,0]])
        scalar = 0.75 + 3j
        self.assertTrue(compare_tensors(scalar*array,array,False))

    def test_trivial_inequality(self):
        array = np.array([[1,0],[0,1]])
        array2= np.array([[0,1],[1,0]])
        self.assertFalse(compare_tensors(array, array2))

    def test_id_graph(self):
        g = Graph()
        i = g.add_vertex(0,0,0)
        o = g.add_vertex(0,0,1)
        g.inputs.append(i)
        g.outputs.append(o)
        g.add_edge((i,o))
        t = tensorfy(g)
        id_array = np.array([[1,0],[0,1]])
        self.assertTrue(np.allclose(t,id_array))
        self.assertTrue(compare_tensors(t,id_array))

    def test_equality_of_id_zx_graph_to_id(self):
        g = Graph()
        i = g.add_vertex(0,0,0)
        o = g.add_vertex(0,0,2)
        g.inputs.append(i)
        g.outputs.append(o)
        g2 = g.copy()
        g.add_edge((i,o))
        v = g2.add_vertex(1,0,1)
        g2.add_edges([(i,v),(v,o)])
        tensor1 = tensorfy(g)
        tensor2 = tensorfy(g2)
        self.assertTrue(compare_tensors(tensor1,tensor2))

    def test_inequality_id_and_swap(self):
        g = Graph()
        i1 = g.add_vertex(0,0,0)
        i2 = g.add_vertex(0,1,0)
        o1 = g.add_vertex(0,0,1)
        o2 = g.add_vertex(0,1,1)
        g.inputs = [i1, i2]
        g.outputs = [o1, o2]
        g2 = g.copy()
        g.add_edges([(i1,o2),(i2,o1)])
        g2.add_edges([(i1,o1),(i2,o2)])
        id_id = tensorfy(g2)
        swap = tensorfy(g)
        self.assertFalse(compare_tensors(id_id,swap))

    def test_three_cnots_is_swap(self):
        g = Graph()
        i1 = g.add_vertex(0,0,0)
        i2 = g.add_vertex(0,1,0)
        o1 = g.add_vertex(0,0,1)
        o2 = g.add_vertex(0,1,1)
        g.inputs = [i1, i2]
        g.outputs = [o1, o2]
        g.add_edges([(i1,o2),(i2,o1)])
        swap = tensorfy(g)
        c = Circuit(2)
        c.add_gate("CNOT",0,1)
        c.add_gate("CNOT",1,0)
        c.add_gate("CNOT",0,1)
        three_cnots = tensorfy(c.to_graph())
        self.assertTrue(compare_tensors(swap,three_cnots))

    def test_compose(self):
        random.seed(SEED)
        circ1 = cliffords(3,15)
        circ2 = cliffords(3,20)
        t1 = tensorfy(circ1)
        t2 = tensorfy(circ2)
        comp1 = compose_tensors(t1,t2)
        circ1.compose(circ2)
        comp2 = tensorfy(circ1)
        self.assertTrue(compare_tensors(comp1,comp2))

    def test_adjoint(self):
        random.seed(SEED)
        circ = cliffords(3, 16)
        t = tensorfy(circ)
        t_adj = adjoint(t)
        circ_adj = tensorfy(circ.adjoint())
        self.assertTrue(compare_tensors(t_adj,circ_adj))


if __name__ == '__main__':
    unittest.main()