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
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors
except ImportError:
    np = None

try:
    import quimb as qu
    import quimb.tensor as qtn
except ImportError:
    qu = None

from pyzx.graph import Graph
from pyzx.utils import EdgeType, VertexType
from pyzx.quimb import to_quimb_tensor

@unittest.skipUnless(np, "numpy needs to be installed for this to run")
@unittest.skipUnless(qu, "quimb needs to be installed for this to run")
class TestMapping(unittest.TestCase):
    def test_id_tensor(self):
        g = Graph()
        x = g.add_vertex(VertexType.BOUNDARY)
        y = g.add_vertex(VertexType.BOUNDARY)
        g.add_edge(g.edge(x, y), edgetype = EdgeType.SIMPLE)
        
        tn = to_quimb_tensor(g)
        self.assertTrue((tn & qtn.Tensor(data = [0, 1], inds = ("0",)) 
                            & qtn.Tensor(data = [0, 1], inds = ("1",)))
                        .contract(output_inds = ()) == 1)
        self.assertTrue((tn & qtn.Tensor(data = [1, 0], inds = ("0",)) 
                            & qtn.Tensor(data = [1, 0], inds = ("1",)))
                        .contract(output_inds = ()) == 1)
    
    def test_hadamard_tensor(self):
        g = Graph()
        x = g.add_vertex(VertexType.BOUNDARY)
        y = g.add_vertex(VertexType.BOUNDARY)
        g.add_edge(g.edge(x, y), edgetype = EdgeType.HADAMARD)
        
        tn = to_quimb_tensor(g)
        self.assertTrue(abs((tn & qtn.Tensor(data = [1, 0], inds = ("0",)) 
                            & qtn.Tensor(data = [1 / np.sqrt(2), 1 / np.sqrt(2)], inds = ("1",)))
                        .contract(output_inds = ()) - 1) < 1e-9)
        self.assertTrue(abs((tn & qtn.Tensor(data = [0, 1], inds = ("0",)) 
                            & qtn.Tensor(data = [1 / np.sqrt(2), -1 / np.sqrt(2)], inds = ("1",)))
                        .contract(output_inds = ()) - 1) < 1e-9)
    
    def test_xor_tensor(self):
        g = Graph()
        x = g.add_vertex(VertexType.BOUNDARY)
        y = g.add_vertex(VertexType.BOUNDARY)
        v = g.add_vertex(VertexType.Z)
        z = g.add_vertex(VertexType.BOUNDARY)

        g.add_edge(g.edge(x, v), edgetype = EdgeType.HADAMARD)
        g.add_edge(g.edge(y, v), edgetype = EdgeType.HADAMARD)
        g.add_edge(g.edge(v, z), edgetype = EdgeType.HADAMARD)
        tn = to_quimb_tensor(g)
        
        for x in range(2):
            for y in range(2):
                for z in range(2):
                    self.assertTrue(abs((tn &
                            qtn.Tensor(data = [1 - x, x], inds = ("0",)) &
                            qtn.Tensor(data = [1 - y, y], inds = ("1",)) &
                            qtn.Tensor(data = [1 - z, z], inds = ("3",))).contract(output_inds = ()) - 
                            ((x ^ y) == z) / np.sqrt(2)) < 1e-9)
    
    def test_phases_tensor(self):
        # This diagram represents a 1-input 1-output Z-spider of phase pi/2,
        # but written using two Z-spiders of phases pi/6 and pi/3 that are
        # connected by a simple edge.
        g = Graph()
        x = g.add_vertex(VertexType.BOUNDARY)
        v = g.add_vertex(VertexType.Z, phase = 1. / 6.)
        w = g.add_vertex(VertexType.Z, phase = 1. / 3.)
        y = g.add_vertex(VertexType.BOUNDARY)
        
        g.add_edge(g.edge(x, v), edgetype = EdgeType.SIMPLE)
        g.add_edge(g.edge(v, w), edgetype = EdgeType.SIMPLE)
        g.add_edge(g.edge(w, y), edgetype = EdgeType.SIMPLE)
        tn = to_quimb_tensor(g)
        
        self.assertTrue(abs((tn & qtn.Tensor(data = [1, 0], inds = ("0",)) 
                            & qtn.Tensor(data = [1, 0], inds = ("3",)))
                        .contract(output_inds = ()) - 1) < 1e-9)
        self.assertTrue(abs((tn & qtn.Tensor(data = [0, 1], inds = ("0",)) 
                            & qtn.Tensor(data = [0, 1j], inds = ("3",)))
                        .contract(output_inds = ()) + 1) < 1e-9)

if __name__ == '__main__':
    unittest.main()

