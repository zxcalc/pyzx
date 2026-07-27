# PyZX - Python library for quantum circuit rewriting
#        and optimization using the ZX-calculus
# Copyright (C) 2026 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


import itertools
import unittest
import sys

from pyzx import EdgeType

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.graph import Graph
from pyzx.utils import VertexType
from pyzx.rewrite_rules.wrules_bzw import (
    check_bialgebra_zw_forward, check_bialgebra_zw_reverse
)


class TestCheckForwardBialgebraZW(unittest.TestCase):
    """Tests for check_bialgebra_zw_forward."""

    @staticmethod
    def __prepare_bialgebra_zw_graph():
        g = Graph()

        i0 = g.add_vertex(qubit=0, row=0)
        i1 = g.add_vertex(qubit=1, row=0)
        wi0 = g.add_vertex(ty=VertexType.W_INPUT, qubit=0, row=1)
        wi1 = g.add_vertex(ty=VertexType.W_INPUT, qubit=1, row=1)
        wo0 = g.add_vertex(ty=VertexType.W_OUTPUT, qubit=0, row=2)
        wo1 = g.add_vertex(ty=VertexType.W_OUTPUT, qubit=1, row=2)
        z0 = g.add_vertex(ty=VertexType.Z, qubit=0, row=3)
        z1 = g.add_vertex(ty=VertexType.Z, qubit=1, row=3)
        o0 = g.add_vertex(qubit=0, row=4)
        o1 = g.add_vertex(qubit=1, row=4)

        g.add_edge((i0, wi0))
        g.add_edge((i1, wi1))
        g.add_edge((wi0, wo0))
        g.add_edge((wi1, wo1))
        for w, z in itertools.product([wo0, wo1], [z0, z1]):
            g.add_edge((w, z))
        g.add_edge((z0, o0))
        g.add_edge((z1, o1))

        return g, (wo0,wo1), (z0,z1)

    def test_zw_pairs_phase_free(self):
        """Z-W pair with zero phases should match."""
        g, ws, zs = self.__prepare_bialgebra_zw_graph()

        self.assertTrue(check_bialgebra_zw_forward(g, ws, zs))

    def test_zw_pairs_phase_nonzero(self):
        """Z-W pair with nonzero phases should not match."""
        g, ws, zs = self.__prepare_bialgebra_zw_graph()

        g.set_phase(zs[0], 1)

        self.assertFalse(check_bialgebra_zw_forward(g, ws, zs))

    def test_zw_pairs_missing_edge(self):
        """Z-W pair not connected by a complete (2,2)-bipartite pattern should not match."""
        g, ws, zs = self.__prepare_bialgebra_zw_graph()

        g.remove_edge(g.edge(ws[0], zs[1]))

        self.assertFalse(check_bialgebra_zw_forward(g, ws, zs))

    def test_zw_pairs_hadamard_edge(self):
        """Z-W pair not connected by a complete (2,2)-bipartite pattern of SIMPLE edges should not match."""
        g, ws, zs = self.__prepare_bialgebra_zw_graph()

        g.set_edge_type(g.edge(ws[0], zs[1]), EdgeType.HADAMARD)

        self.assertFalse(check_bialgebra_zw_forward(g, ws, zs))

class TestCheckReverseBialgebraZW(unittest.TestCase):
    """Tests for check_bialgebra_zw_reverse."""

    @staticmethod
    def __prepare_bialgebra_zw_graph():
        g = Graph()

        i0 = g.add_vertex(qubit=0, row=0)
        i1 = g.add_vertex(qubit=1, row=0)
        z = g.add_vertex(ty=VertexType.Z, qubit=0.5, row=1)
        wi = g.add_vertex(ty=VertexType.W_INPUT, qubit=0.5, row=2)
        wo = g.add_vertex(ty=VertexType.W_OUTPUT, qubit=0.5, row=3)
        o0 = g.add_vertex(qubit=0, row=4)
        o1 = g.add_vertex(qubit=1, row=4)

        g.add_edge((i0, z))
        g.add_edge((i1, z))
        g.add_edge((z, wi))
        g.add_edge((wi, wo))
        g.add_edge((wo, o0))
        g.add_edge((wo, o1))

        return g, z, wi, wo

    def test_zw_pair_phase_free(self):
        """Z-W pair with zero phase should match."""
        g, z, wi, wo = self.__prepare_bialgebra_zw_graph()
        self.assertTrue(check_bialgebra_zw_reverse(g, wo, z))

    def test_zw_pair_phase_nonzero(self):
        """Z-W pair with nonzero phases should not match."""
        g, z, wi, wo = self.__prepare_bialgebra_zw_graph()

        g.set_phase(z, 1)

        self.assertFalse(check_bialgebra_zw_reverse(g, wo, z))

    def test_zw_pair_missing_edge(self):
        """Z-W pair not connected through a W_INPUT should not match."""
        g, z, wi, wo = self.__prepare_bialgebra_zw_graph()

        g.remove_edge(g.edge(wi, z))

        self.assertFalse(check_bialgebra_zw_reverse(g, wo, z))

if __name__ == '__main__':
    unittest.main()
