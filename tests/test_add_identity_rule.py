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

from pyzx.graph.multigraph import Multigraph
from pyzx.utils import EdgeType, VertexType
from pyzx.rewrite_rules.add_identity_rule import check_edge, add_Z_identity


class TestAddIdentityRule(unittest.TestCase):

    def test_check_edge_rejects_mixed_parallels(self):
        """check_edge rejects vertex pairs with mixed parallel edges, since
        the rule has no canonical edge to act on."""
        g = Multigraph()
        g.set_auto_simplify(False)
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.HADAMARD)
        self.assertFalse(check_edge(g, v1, v2))

    def test_check_edge_accepts_parallel_same_type(self):
        """check_edge accepts parallel edges of the same type (only mixed
        types are ambiguous)."""
        g = Multigraph()
        g.set_auto_simplify(False)
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        self.assertTrue(check_edge(g, v1, v2))

    def test_safe_add_Z_identity_skips_ambiguous(self):
        """The safe `add_Z_identity` should be a no-op on ambiguous parallels."""
        g = Multigraph()
        g.set_auto_simplify(False)
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.HADAMARD)
        verts_before = g.num_vertices()
        self.assertFalse(add_Z_identity(g, v1, v2))
        self.assertEqual(g.num_vertices(), verts_before)

    def test_check_edge_rejects_w_io(self):
        """check_edge rejects vertex pairs joined by W_IO edges, since the rule
        only operates on SIMPLE/HADAMARD edges."""
        g = Multigraph()
        g.set_auto_simplify(False)
        w_in = g.add_vertex(VertexType.W_INPUT, 0, 0)
        w_out = g.add_vertex(VertexType.W_OUTPUT, 0, 1)
        g.add_edge((w_in, w_out), EdgeType.W_IO)
        self.assertFalse(check_edge(g, w_in, w_out))

    def test_check_edge_rejects_self_loop(self):
        """check_edge rejects self-loops, since `unsafe_add_Z_identity` assumes
        two distinct vertices."""
        g = Multigraph()
        g.set_auto_simplify(False)
        v = g.add_vertex(VertexType.Z, 0, 0)
        g.add_edge((v, v), EdgeType.SIMPLE)
        self.assertFalse(check_edge(g, v, v))
        self.assertFalse(add_Z_identity(g, v, v))


if __name__ == '__main__':
    unittest.main()
