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
from pyzx.rewrite_rules.hopf_rule import check_hopf, unsafe_hopf


class TestHopfRule(unittest.TestCase):
    """Regression tests for the Hopf rule on multigraphs with mixed parallel edges."""

    def test_hopf_same_color_with_extra_simple(self):
        """Two Z spiders with two HADAMARD edges plus one SIMPLE edge: Hopf
        removes only the HADAMARD pair, leaving the SIMPLE edge untouched."""
        g = Multigraph()
        g.set_auto_simplify(False)
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        g.add_edge((v1, v2), EdgeType.HADAMARD)
        g.add_edge((v1, v2), EdgeType.HADAMARD)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertTrue(check_hopf(g, v1, v2))
        self.assertTrue(unsafe_hopf(g, v1, v2))
        self.assertEqual(g.num_edges(v1, v2, EdgeType.HADAMARD), 0)
        self.assertEqual(g.num_edges(v1, v2, EdgeType.SIMPLE), 1)

    def test_hopf_different_color_with_extra_hadamard(self):
        """Z and X spiders with two SIMPLE edges plus one HADAMARD edge: Hopf
        removes only the SIMPLE pair, leaving the HADAMARD edge untouched."""
        g = Multigraph()
        g.set_auto_simplify(False)
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.X, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.HADAMARD)

        self.assertTrue(check_hopf(g, v1, v2))
        self.assertTrue(unsafe_hopf(g, v1, v2))
        self.assertEqual(g.num_edges(v1, v2, EdgeType.SIMPLE), 0)
        self.assertEqual(g.num_edges(v1, v2, EdgeType.HADAMARD), 1)


if __name__ == '__main__':
    unittest.main()
