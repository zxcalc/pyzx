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

from pyzx.graph.multigraph import Multigraph
from pyzx.pauliweb import PauliWeb
from pyzx.utils import EdgeType, VertexType


class TestPauliWeb(unittest.TestCase):

    def test_add_edge_multigraph_mixed_parallels_uses_simple(self):
        """On a multigraph with mixed parallel edges, PauliWeb.add_edge falls
        back to the SIMPLE edge for its per-pair labelling."""
        g = Multigraph()
        g.set_auto_simplify(False)
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.HADAMARD)
        pw = PauliWeb(g)
        pw.add_edge((v1, v2), 'X')
        # Treated as a SIMPLE edge: both half-edges carry the same Pauli.
        self.assertEqual(pw[(v1, v2)], 'X')
        self.assertEqual(pw[(v2, v1)], 'X')


if __name__ == '__main__':
    unittest.main()
