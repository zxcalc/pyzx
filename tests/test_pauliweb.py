# PyZX - Python library for quantum circuit rewriting
#        and optimization using the ZX-calculus
# Copyright (C) 2024 - Aleks Kissinger and John van de Wetering

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
from pyzx.graph.multigraph import Multigraph
from pyzx.pauliweb import PauliWeb
from pyzx.utils import EdgeType, VertexType


class TestPauliWeb(unittest.TestCase):

    def test_add_edge_multigraph_mixed_parallels_raises(self):
        """``PauliWeb.add_edge`` labels edges by ordered vertex pair, which
        cannot distinguish mixed parallel edge types, so it must refuse to
        guess and raise ``ValueError`` instead of silently picking one."""
        g = Multigraph()
        g.set_auto_simplify(False)
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.HADAMARD)
        pw = PauliWeb(g)
        with self.assertRaises(ValueError):
            pw.add_edge((v1, v2), 'X')

    def test_add_edge_missing_edge_raises(self):
        """``PauliWeb.add_edge`` must reject a disconnected vertex pair. On the
        simple backend ``edge``/``edge_type`` return a canonical pair and type
        even when no edge exists, so without an explicit check the web would
        silently label a non-existent edge."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        pw = PauliWeb(g)
        with self.assertRaises(ValueError):
            pw.add_edge((v1, v2), 'X')

    def test_graph_with_errors_missing_edge_raises(self):
        """``graph_with_errors`` must raise a clear ``ValueError`` (not an
        opaque ``KeyError`` from ``remove_edge``) when the web references an
        edge that the underlying graph no longer contains."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        pw = PauliWeb(g)
        pw.add_edge((v1, v2), 'X')
        # Drop the edge the web references, so rebuilding the graph must fail.
        g.remove_edge(g.edge(v1, v2))
        with self.assertRaises(ValueError):
            pw.graph_with_errors()


if __name__ == '__main__':
    unittest.main()
