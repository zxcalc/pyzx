import unittest
from fractions import Fraction
import sys
sys.path.append('..')

try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors
except ImportError:
    np = None

from pyzx.graph import Graph


@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestTensor(unittest.TestCase):

    def test_scalar_difference(self):
        array = np.array([[0,1],[1,0]])
        scalar = 0.75 + 3j
        self.assertTrue(compare_tensors(scalar*array,array))

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

if __name__ == '__main__':
    unittest.main()