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
import math

from pyzx.graph import Graph
from pyzx.graph.multigraph import Multigraph
from pyzx.generate import cliffords
from pyzx.circuit import Circuit
from pyzx.utils import VertexType, set_h_box_label

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors, compose_tensors, adjoint, H_to_tensor
except ImportError:
    np = None

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
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i,o))
        t = tensorfy(g)
        id_array = np.array([[1,0],[0,1]])
        self.assertTrue(np.allclose(t,id_array))
        self.assertTrue(compare_tensors(t,id_array))

    def test_equality_of_id_zx_graph_to_id(self):
        g = Graph()
        i = g.add_vertex(0,0,0)
        o = g.add_vertex(0,0,2)
        g.set_inputs((i,))
        g.set_outputs((o,))
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
        g.set_inputs((i1, i2))
        g.set_outputs((o1, o2))
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
        g.set_inputs((i1, i2))
        g.set_outputs((o1, o2))
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
    
    def test_multigraph_auto_simplify_parallel_edges(self):
        g = Multigraph()
        g.set_auto_simplify(True)
        i1 = g.add_vertex(1,0,0)
        i2 = g.add_vertex(2,1,0)
        g.add_edges([(i1, i2)] * 3)
        self.assertTrue(compare_tensors(g, np.array([np.sqrt(2)**(-1)]), preserve_scalar=True))

    def test_multiedge_scalar(self):
        g = Multigraph()
        g.set_auto_simplify(False)
        i1 = g.add_vertex(1,0,0)
        i2 = g.add_vertex(2,1,0)
        g.add_edges([(i1, i2)] * 3)
        self.assertTrue(compare_tensors(g, np.array([np.sqrt(2)**(-1)]), preserve_scalar=True))

    def test_self_loop_scalar(self):
        g = Multigraph()
        g.set_auto_simplify(False)
        i1 = g.add_vertex(1,0,0)
        g.add_edge((i1, i1))
        self.assertTrue(compare_tensors(g, np.array([2]), preserve_scalar=True))
        g.add_edge((i1, i1), 2)
        self.assertTrue(compare_tensors(g, np.array([0]), preserve_scalar=True))

    def test_self_loop_state(self):
        g = Multigraph()
        g.set_auto_simplify(False)
        i0 = g.add_vertex(0,0,0)
        i1 = g.add_vertex(2,0,1)
        g.set_inputs((i0,))
        g.add_edge((i0, i1))
        self.assertTrue(compare_tensors(g, np.array([1,0])))
        g.add_edge((i1, i1), 2)
        self.assertTrue(compare_tensors(g, np.array([0,1])))

    def test_self_loop_and_parallel_edge_map(self):
        g = Multigraph()
        g.set_auto_simplify(False)
        i0 = g.add_vertex(0,0,0)
        i1 = g.add_vertex(2,0,1)
        i2 = g.add_vertex(1,0,2)
        i3 = g.add_vertex(0,0,3)
        g.set_inputs((i0,))
        g.set_outputs((i3,))
        g.add_edges([(i0, i1), (i1, i1)] + [(i1, i2)] * 2)
        g.add_edges([(i2, i2), (i2, i3)], 2)
        self.assertTrue(compare_tensors(g, np.array([[0,0],[1,0]])))

    def test_to_tensor_equivalent(self):
        g = Graph()
        g.add_vertex(VertexType.Z, phase=1)
        g1 = Graph()
        g1.add_vertex(VertexType.X, phase=1)
        self.assertTrue(g.to_tensor() == g1.to_tensor())

    def test_h_to_tensor_with_label(self):
        """Test H_to_tensor with explicit complex label."""
        t = H_to_tensor(2, 0, label=3+4j)
        expected = np.array([[1, 1], [1, 3+4j]])
        self.assertTrue(np.allclose(t, expected))

    def test_h_to_tensor_standard_hadamard(self):
        """Test H_to_tensor for standard Hadamard (label=-1 or phase=pi)."""
        t_label = H_to_tensor(2, 0, label=-1)
        t_phase = H_to_tensor(2, math.pi)
        expected = np.array([[1, 1], [1, -1]])
        self.assertTrue(np.allclose(t_label, expected))
        self.assertTrue(np.allclose(t_phase, expected))

    def test_tensorfy_hbox_with_complex_label(self):
        """Test tensorfy with H-box having complex label."""
        g = Graph()
        i = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        h = g.add_vertex(VertexType.H_BOX, 0, 1)
        o = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, h))
        g.add_edge((h, o))
        set_h_box_label(g, h, 1j)

        t = tensorfy(g)
        expected = np.array([[1, 1], [1, 1j]])
        self.assertTrue(np.allclose(t, expected))

    def test_tensorfy_hbox_with_standard_label(self):
        """Test tensorfy with H-box having standard label -1."""
        g = Graph()
        i = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        h = g.add_vertex(VertexType.H_BOX, 0, 1)
        o = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, h))
        g.add_edge((h, o))
        set_h_box_label(g, h, -1)

        t = tensorfy(g)
        expected = np.array([[1, 1], [1, -1]])
        self.assertTrue(np.allclose(t, expected))

    def test_tensorfy_hbox_phase_and_label_equivalence(self):
        """Test that phase=1 and label=-1 produce same tensor."""
        g1 = Graph()
        i1 = g1.add_vertex(VertexType.BOUNDARY, 0, 0)
        h1 = g1.add_vertex(VertexType.H_BOX, 0, 1)
        o1 = g1.add_vertex(VertexType.BOUNDARY, 0, 2)
        g1.set_inputs((i1,))
        g1.set_outputs((o1,))
        g1.add_edge((i1, h1))
        g1.add_edge((h1, o1))
        g1.set_phase(h1, 1)

        g2 = Graph()
        i2 = g2.add_vertex(VertexType.BOUNDARY, 0, 0)
        h2 = g2.add_vertex(VertexType.H_BOX, 0, 1)
        o2 = g2.add_vertex(VertexType.BOUNDARY, 0, 2)
        g2.set_inputs((i2,))
        g2.set_outputs((o2,))
        g2.add_edge((i2, h2))
        g2.add_edge((h2, o2))
        set_h_box_label(g2, h2, -1)

        self.assertTrue(compare_tensors(g1, g2, preserve_scalar=True))


if __name__ == '__main__':
    unittest.main()
