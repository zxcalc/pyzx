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
from fractions import Fraction
import itertools
import json
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.graph import Graph
from pyzx.utils import EdgeType, VertexType
from pyzx.generate import identity

import numpy as np
from pyzx.tensor import compare_tensors



class TestGraphBasicMethods(unittest.TestCase):

    def test_empty_graph(self):
        g = Graph()
        self.assertEqual(g.num_vertices(),0)
        self.assertEqual(g.num_edges(),0)

    def test_add_remove_vertices(self):
        g = Graph()
        v = g.add_vertex()
        self.assertEqual(g.num_vertices(),1)
        g.add_vertices(3)
        self.assertEqual(g.num_vertices(),4)
        g.remove_vertex(v)
        self.assertEqual(g.num_vertices(),3)

    def test_edges(self):
        g = Graph()
        v1, v2, v3 = g.add_vertices(3)
        g.add_edge((v1,v2))
        self.assertEqual(g.num_edges(),1)
        self.assertTrue(g.connected(v1,v2))
        self.assertTrue(v2 in g.neighbors(v1))
        self.assertEqual(g.vertex_degree(v1), 1)
        self.assertFalse(g.connected(v1,v3))
        e = g.edge(v1,v2)
        self.assertEqual(g.edge_type(e),EdgeType.SIMPLE)
        g.set_edge_type(e,EdgeType.HADAMARD)
        self.assertEqual(g.edge_type(e),EdgeType.HADAMARD)
        g.remove_edge(e)
        self.assertEqual(g.num_edges(),0)
        self.assertFalse(g.connected(v1,v2))

    def test_set_attributes(self):
        g = Graph()
        v = g.add_vertex()
        self.assertEqual(g.phase(v),0)
        g.set_phase(v,1)
        self.assertEqual(g.phase(v),1)
        self.assertEqual(g.type(v),VertexType.BOUNDARY)
        g.set_type(v,VertexType.X)
        self.assertEqual(g.type(v),VertexType.X)
        self.assertFalse(g.is_ground(v))
        g.set_ground(v)
        self.assertTrue(g.is_ground(v))
        g.set_row(v,3)
        self.assertEqual(g.row(v),3)
        g.set_qubit(v,2)
        self.assertEqual(g.qubit(v),2)

    def test_add_edge_table_same_type(self):
        g = Graph()
        v1, v2 = g.add_vertices(2)
        g.set_type(v1,VertexType.Z)
        g.set_type(v2,VertexType.Z)
        etab = {(v1,v2):[2,0]}
        g.add_edge_table(etab)
        self.assertTrue(g.connected(v1,v2))
        self.assertEqual((g.phase(v1),g.phase(v2)),(0,0))
        g.remove_edge(g.edge(v1,v2))
        self.assertFalse(g.connected(v1,v2))
        etab = {(v1,v2):[0,2]}
        g.add_edge_table(etab)
        self.assertFalse(g.connected(v1,v2))
        etab = {(v1,v2): [1,1]}
        g.add_edge_table(etab)
        self.assertEqual(g.edge_type(g.edge(v1,v2)),EdgeType.SIMPLE)
        self.assertTrue((g.phase(v1)==1  and g.phase(v2)==0) or (g.phase(v1)==0 and g.phase(v2)==1))

    def test_add_edge_table_different_type(self):
        g = Graph()
        v1, v2 = g.add_vertices(2)
        g.set_type(v1,VertexType.Z)
        g.set_type(v2,VertexType.X)
        etab = {(v1,v2):[0,2]}
        g.add_edge_table(etab)
        self.assertTrue(g.connected(v1,v2))
        self.assertEqual((g.phase(v1),g.phase(v2)),(0,0))
        g.remove_edge(g.edge(v1,v2))
        self.assertFalse(g.connected(v1,v2))
        etab = {(v1,v2):[2,0]}
        g.add_edge_table(etab)
        self.assertFalse(g.connected(v1,v2))
        etab = {(v1,v2): [1,1]}
        g.add_edge_table(etab)
        self.assertEqual(g.edge_type(g.edge(v1,v2)),EdgeType.HADAMARD)
        self.assertTrue((g.phase(v1)==1  and g.phase(v2)==0) or (g.phase(v1)==0 and g.phase(v2)==1))

    def test_copy(self):
        g = Graph()
        v1, v2 = g.add_vertices(2)
        g.add_edge((v1,v2),EdgeType.HADAMARD)
        g2 = g.copy()
        self.assertEqual(g.num_vertices(),g2.num_vertices())
        self.assertEqual(g.num_edges(),g2.num_edges())
        v1, v2 = list(g2.vertices())
        self.assertEqual(g.edge_type(g.edge(v1,v2)),EdgeType.HADAMARD)

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_remove_isolated_vertex_preserves_semantics(self):
        g = Graph()
        v = g.add_vertex(VertexType.Z,0,0)
        g2 = g.copy()
        g2.remove_isolated_vertices()
        self.assertTrue(compare_tensors(g,g2,preserve_scalar=True))
        self.assertAlmostEqual(g2.scalar.to_number(),2)
        g.set_phase(v,Fraction(1))
        g2 = g.copy()
        g2.remove_isolated_vertices()
        self.assertTrue(compare_tensors(g,g2))
        self.assertAlmostEqual(g2.scalar.to_number(),0)

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_remove_isolated_pair_preserves_semantics(self):
        for i,j in itertools.product([VertexType.Z,VertexType.X],repeat=2):
            for k in [EdgeType.SIMPLE, EdgeType.HADAMARD]:
                for phase1, phase2 in itertools.product([0,1,2],[0,4,5]):
                    with self.subTest(i=i,j=j,k=k,phase1=phase1,phase2=phase2):
                        g = Graph()
                        v = g.add_vertex(i,0,0,phase=phase1)
                        w = g.add_vertex(j,1,0,phase=phase2)
                        g.add_edge((v,w),k)
                        g2 = g.copy()
                        g2.remove_isolated_vertices()
                        self.assertEqual(g2.num_vertices(),0)
                        self.assertTrue(compare_tensors(g,g2))

class TestGraphCircuitMethods(unittest.TestCase):

    def setUp(self):
        """Sets up a two qubit circuit containing a single CNOT with some phases."""
        self.graph = Graph()
        g = self.graph
        i1 = g.add_vertex(VertexType.BOUNDARY,0,0) #add_vertex(type,qubit_index,row_index,phase=0)
        i2 = g.add_vertex(VertexType.BOUNDARY,1,0)
        g.set_inputs((i1,i2))
        v = g.add_vertex(VertexType.Z,0,1,Fraction(1,2))
        w = g.add_vertex(VertexType.X,1,1,Fraction(1,1))
        o1 = g.add_vertex(VertexType.BOUNDARY,0,2)
        o2 = g.add_vertex(VertexType.BOUNDARY,1,2)
        g.set_outputs((o1, o2))
        g.add_edges([(i1,v),(i2,w),(v,w),(v,o1),(w,o2)])
        self.i1, self.i2, self.v, self.w, self.o1, self.o2 = i1, i2, v, w, o1, o2

    def test_qubit_index_and_depth(self):
        g = self.graph
        self.assertEqual(g.depth(),2)
        self.assertEqual(g.qubit_count(),2)

    def test_adjoint(self):
        g = self.graph
        adj = g.adjoint()
        self.assertEqual(g.num_vertices(),adj.num_vertices())
        self.assertEqual(g.num_edges(),adj.num_edges())
        self.assertEqual(g.depth(), adj.depth())
        self.assertEqual(g.qubit_count(), adj.qubit_count())

        v = [i for i in g.vertices() if g.type(i)==VertexType.Z][0]
        w = [i for i in adj.vertices() if adj.type(i)==VertexType.Z][0]
        self.assertEqual(g.phase(v),(-adj.phase(v))%2)
        self.assertEqual(g.vertex_degree(v),adj.vertex_degree(w))

    def test_compose_basic(self):
        g = self.graph.copy()
        g.compose(g)
        self.assertEqual((g.num_inputs(),g.num_outputs()),(2,2))

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_compose_unitary(self):
        g = self.graph
        g.set_edge_type(g.edge(self.v,self.o1),EdgeType.HADAMARD)
        g2 = g.adjoint()
        g2.compose(g)
        self.assertTrue(compare_tensors(g2,identity(2), False))


test_graph = {'node_vertices': {
                   'v0': {'annotation': {'coord': [1.0, -1.0]},
                          'data': {'type': 'X', 'value': '\\pi'}},
                   'v1': {'annotation': {'coord': [2.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v10': {'annotation': {'coord': [6.0, -2.0]},
                           'data': {'type': 'X'}},
                   'v11': {'annotation': {'coord': [7.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v12': {'annotation': {'coord': [2.0, -2.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v13': {'annotation': {'coord': [3.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v14': {'annotation': {'coord': [4.0, -2.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v15': {'annotation': {'coord': [11.0, -1.0]},
                           'data': {'type': 'Z'}},
                   'v16': {'annotation': {'coord': [2.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v17': {'annotation': {'coord': [3.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v18': {'annotation': {'coord': [4.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v19': {'annotation': {'coord': [6.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v2': {'annotation': {'coord': [3.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v20': {'annotation': {'coord': [7.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v21': {'annotation': {'coord': [8.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v22': {'annotation': {'coord': [9.0, -4.15]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v23': {'annotation': {'coord': [10.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v24': {'annotation': {'coord': [11.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v25': {'annotation': {'coord': [13.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v26': {'annotation': {'coord': [16.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v27': {'annotation': {'coord': [3.0, -4.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v28': {'annotation': {'coord': [6.0, -4.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v29': {'annotation': {'coord': [6.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v3': {'annotation': {'coord': [4.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v30': {'annotation': {'coord': [7.0, -5.0]},
                           'data': {'type': 'X'}},
                   'v31': {'annotation': {'coord': [8.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v32': {'annotation': {'coord': [9.75, -4.975]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v33': {'annotation': {'coord': [2.0, -5.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v34': {'annotation': {'coord': [3.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v35': {'annotation': {'coord': [4.0, -5.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v36': {'annotation': {'coord': [1.0, -6.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v37': {'annotation': {'coord': [6.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v38': {'annotation': {'coord': [7.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v39': {'annotation': {'coord': [8.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v4': {'annotation': {'coord': [6.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v40': {'annotation': {'coord': [1.0, -6.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v41': {'annotation': {'coord': [2.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v42': {'annotation': {'coord': [3.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v43': {'annotation': {'coord': [4.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v44': {'annotation': {'coord': [9.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v45': {'annotation': {'coord': [10.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v46': {'annotation': {'coord': [11.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v47': {'annotation': {'coord': [12.0, -1.0]},
                           'data': {'type': 'Z'}},
                   'v48': {'annotation': {'coord': [12.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v49': {'annotation': {'coord': [13.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v5': {'annotation': {'coord': [7.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v50': {'annotation': {'coord': [13.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v51': {'annotation': {'coord': [14.0, -2.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v52': {'annotation': {'coord': [15.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v53': {'annotation': {'coord': [16.0, -2.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v54': {'annotation': {'coord': [17.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v55': {'annotation': {'coord': [14.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v56': {'annotation': {'coord': [15.0, -5.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v57': {'annotation': {'coord': [16.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v58': {'annotation': {'coord': [17.0, -5.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v59': {'annotation': {'coord': [1.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v6': {'annotation': {'coord': [8.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v60': {'annotation': {'coord': [1.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v61': {'annotation': {'coord': [16.0, -1.0]},
                           'data': {'type': 'Z'}},
                   'v62': {'annotation': {'coord': [17.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v63': {'annotation': {'coord': [9.75374984741211,
                                                    -4.166666793823242]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v7': {'annotation': {'coord': [9.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v8': {'annotation': {'coord': [10.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v9': {'annotation': {'coord': [5.0, -2.0]},
                          'data': {'type': 'Z'}}},
 'undir_edges': {'e0': {'src': 'v0', 'tgt': 'v59'},
                 'e1': {'src': 'v0', 'tgt': 'v1'},
                 'e10': {'src': 'v5', 'tgt': 'v6'},
                 'e11': {'src': 'v5', 'tgt': 'v20'},
                 'e12': {'src': 'v6', 'tgt': 'v7'},
                 'e13': {'src': 'v6', 'tgt': 'v21'},
                 'e14': {'src': 'v7', 'tgt': 'v8'},
                 'e15': {'src': 'v7', 'tgt': 'v22'},
                 'e16': {'src': 'v8', 'tgt': 'v15'},
                 'e17': {'src': 'v8', 'tgt': 'v23'},
                 'e18': {'src': 'v9', 'tgt': 'v14'},
                 'e19': {'src': 'v9', 'tgt': 'v10'},
                 'e2': {'src': 'v1', 'tgt': 'v2'},
                 'e20': {'src': 'v9', 'tgt': 'v16'},
                 'e21': {'src': 'v10', 'tgt': 'v11'},
                 'e22': {'src': 'v10', 'tgt': 'v27'},
                 'e23': {'src': 'v11', 'tgt': 'v49'},
                 'e24': {'src': 'v11', 'tgt': 'v18'},
                 'e25': {'src': 'v12', 'tgt': 'v59'},
                 'e26': {'src': 'v12', 'tgt': 'v13'},
                 'e27': {'src': 'v13', 'tgt': 'v14'},
                 'e28': {'src': 'v13', 'tgt': 'v23'},
                 'e29': {'src': 'v15', 'tgt': 'v47'},
                 'e3': {'src': 'v1', 'tgt': 'v16'},
                 'e30': {'src': 'v15', 'tgt': 'v25'},
                 'e31': {'src': 'v16', 'tgt': 'v41'},
                 'e32': {'src': 'v17', 'tgt': 'v42'},
                 'e33': {'src': 'v17', 'tgt': 'v27'},
                 'e34': {'src': 'v18', 'tgt': 'v43'},
                 'e35': {'src': 'v19', 'tgt': 'v37'},
                 'e36': {'src': 'v19', 'tgt': 'v29'},
                 'e37': {'src': 'v20', 'tgt': 'v28'},
                 'e38': {'src': 'v20', 'tgt': 'v38'},
                 'e39': {'src': 'v21', 'tgt': 'v31'},
                 'e4': {'src': 'v2', 'tgt': 'v3'},
                 'e40': {'src': 'v21', 'tgt': 'v39'},
                 'e41': {'src': 'v22', 'tgt': 'v44'},
                 'e42': {'src': 'v22', 'tgt': 'v63'},
                 'e43': {'src': 'v24', 'tgt': 'v34'},
                 'e44': {'src': 'v24', 'tgt': 'v45'},
                 'e45': {'src': 'v25', 'tgt': 'v55'},
                 'e46': {'src': 'v25', 'tgt': 'v61'},
                 'e47': {'src': 'v25', 'tgt': 'v52'},
                 'e48': {'src': 'v26', 'tgt': 'v57'},
                 'e49': {'src': 'v26', 'tgt': 'v62'},
                 'e5': {'src': 'v2', 'tgt': 'v17'},
                 'e50': {'src': 'v26', 'tgt': 'v54'},
                 'e51': {'src': 'v26', 'tgt': 'v46'},
                 'e52': {'src': 'v28', 'tgt': 'v30'},
                 'e53': {'src': 'v29', 'tgt': 'v35'},
                 'e54': {'src': 'v29', 'tgt': 'v30'},
                 'e55': {'src': 'v30', 'tgt': 'v31'},
                 'e56': {'src': 'v31', 'tgt': 'v32'},
                 'e57': {'src': 'v32', 'tgt': 'v50'},
                 'e58': {'src': 'v32', 'tgt': 'v63'},
                 'e59': {'src': 'v33', 'tgt': 'v60'},
                 'e6': {'src': 'v3', 'tgt': 'v4'},
                 'e60': {'src': 'v33', 'tgt': 'v34'},
                 'e61': {'src': 'v34', 'tgt': 'v35'},
                 'e62': {'src': 'v37', 'tgt': 'v43'},
                 'e63': {'src': 'v37', 'tgt': 'v38'},
                 'e64': {'src': 'v38', 'tgt': 'v39'},
                 'e65': {'src': 'v39', 'tgt': 'v44'},
                 'e66': {'src': 'v40', 'tgt': 'v60'},
                 'e67': {'src': 'v40', 'tgt': 'v41'},
                 'e68': {'src': 'v41', 'tgt': 'v42'},
                 'e69': {'src': 'v42', 'tgt': 'v43'},
                 'e7': {'src': 'v3', 'tgt': 'v18'},
                 'e70': {'src': 'v44', 'tgt': 'v45'},
                 'e71': {'src': 'v45', 'tgt': 'v46'},
                 'e72': {'src': 'v46', 'tgt': 'v48'},
                 'e73': {'src': 'v47', 'tgt': 'v49'},
                 'e74': {'src': 'v48', 'tgt': 'v50'},
                 'e75': {'src': 'v49', 'tgt': 'v51'},
                 'e76': {'src': 'v50', 'tgt': 'v55'},
                 'e77': {'src': 'v51', 'tgt': 'v52'},
                 'e78': {'src': 'v52', 'tgt': 'v53'},
                 'e79': {'src': 'v53', 'tgt': 'v54'},
                 'e8': {'src': 'v4', 'tgt': 'v5'},
                 'e80': {'src': 'v54', 'tgt': 'b1'},
                 'e81': {'src': 'v55', 'tgt': 'v56'},
                 'e82': {'src': 'v56', 'tgt': 'v57'},
                 'e83': {'src': 'v57', 'tgt': 'v58'},
                 'e84': {'src': 'v58', 'tgt': 'b3'},
                 'e85': {'src': 'v59', 'tgt': 'b0'},
                 'e86': {'src': 'v60', 'tgt': 'b2'},
                 'e9': {'src': 'v4', 'tgt': 'v19'}},
 'wire_vertices': {'b0': {'annotation': {'boundary': True,
                                         'coord': [0.0, -2.0],
                                         'input': 0}},
                   'b1': {'annotation': {'boundary': True,
                                         'coord': [18.0, -2.0],
                                         'output': 0}},
                   'b2': {'annotation': {'boundary': True,
                                         'coord': [0.0, -5.0],
                                         'input': 1}},
                   'b3': {'annotation': {'boundary': True,
                                         'coord': [18.0, -5.0],
                                         'output': 1}}}}


class TestGraphIO(unittest.TestCase):

    def test_load_json(self):
        js = json.dumps(test_graph)
        g = Graph.from_json(js)
        js2 = g.to_json()

    def test_load_tikz(self):
        js = json.dumps(test_graph)
        g = Graph.from_json(js)
        tikz = g.to_tikz()
        print(tikz)
        g2 = Graph.from_tikz(tikz, warn_overlap=False)

if __name__ == '__main__':
    unittest.main()
