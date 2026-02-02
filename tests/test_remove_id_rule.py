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
import sys

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.graph import Graph
from pyzx.utils import EdgeType, VertexType
from pyzx.rewrite_rules.remove_id_rule import check_remove_id, remove_id


class TestWNodeRemoveId(unittest.TestCase):

    def create_w_node_pair(self, g, q, r):
        w_in = g.add_vertex(VertexType.W_INPUT, q, r)
        w_out = g.add_vertex(VertexType.W_OUTPUT, q, r + 0.5)
        g.add_edge((w_in, w_out), EdgeType.W_IO)
        return w_in, w_out

    def test_w_node_remove_id_disallowed(self):
        g = Graph()

        v1 = g.add_vertex(VertexType.Z, 0, 0)
        w_in, w_out = self.create_w_node_pair(g, 0, 1)
        v2 = g.add_vertex(VertexType.Z, 0, 3)
        v3 = g.add_vertex(VertexType.Z, 1, 2)

        g.add_edge((v1, w_in), EdgeType.SIMPLE)
        g.add_edge((w_out, v2), EdgeType.SIMPLE)
        g.add_edge((w_out, v3), EdgeType.SIMPLE)  # w_out has degree 3

        self.assertFalse(check_remove_id(g, w_in))
        self.assertFalse(check_remove_id(g, w_out))

        self.assertFalse(remove_id(g, w_out))
        self.assertEqual(g.num_vertices(), 5)

    def test_w_node_remove_id_simple_edge(self):
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        w_in, w_out = self.create_w_node_pair(g, 0, 1)
        v2 = g.add_vertex(VertexType.Z, 0, 3)

        g.add_edge((v1, w_in), EdgeType.SIMPLE)
        g.add_edge((w_out, v2), EdgeType.SIMPLE)

        self.assertTrue(check_remove_id(g, w_in))
        self.assertTrue(check_remove_id(g, w_out))

        self.assertTrue(remove_id(g, w_in))
        self.assertEqual(g.num_vertices(), 2)
        self.assertEqual(g.num_edges(), 1)

        e = g.edge(v1, v2)
        self.assertEqual(g.edge_type(e), EdgeType.SIMPLE)

    def test_w_node_remove_id_hadamard_edge(self):
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        w_in, w_out = self.create_w_node_pair(g, 0, 1)
        v2 = g.add_vertex(VertexType.Z, 0, 3)

        g.add_edge((v1, w_in), EdgeType.SIMPLE)
        g.add_edge((w_out, v2), EdgeType.HADAMARD)

        self.assertTrue(remove_id(g, w_in))

        e = g.edge(v1, v2)
        self.assertEqual(g.edge_type(e), EdgeType.HADAMARD)


if __name__ == '__main__':
    unittest.main()
