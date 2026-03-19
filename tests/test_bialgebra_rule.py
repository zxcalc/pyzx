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


import itertools
import unittest
import sys
from fractions import Fraction
from types import ModuleType
from typing import Optional

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.graph import Graph
from pyzx.symbolic import new_var
from pyzx.utils import VertexType
from pyzx.rewrite_rules.bialgebra_rule import check_bialgebra, unsafe_bialgebra

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import compare_tensors
except ImportError:
    np = None


class TestBialgebraApplyZX(unittest.TestCase):
    """Tests for applying the bialgebra rule to Z-X pairs."""

    def _make_zx_bialgebra_graph(self, d_z, d_x, z_phase, x_phase):
        """Build a graph with a Z spider of degree d_z connected to an
        X spider of degree d_x via a simple edge.  Each spider gets
        (d-1) boundary neighbours plus the Z-X edge."""
        g = Graph()
        z = g.add_vertex(VertexType.Z, 0, 1, phase=z_phase)
        x = g.add_vertex(VertexType.X, 1, 1, phase=x_phase)
        g.add_edge((z, x))
        ins = []
        for i in range(d_z - 1):
            b = g.add_vertex(VertexType.BOUNDARY, i, 0)
            g.add_edge((b, z))
            ins.append(b)
        outs = []
        for i in range(d_x - 1):
            b = g.add_vertex(VertexType.BOUNDARY, i, 2)
            g.add_edge((x, b))
            outs.append(b)
        g.set_inputs(tuple(ins))
        g.set_outputs(tuple(outs))
        return g, z, x

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_zx_bialgebra_preserves_semantics(self):
        """The bialgebra rule must preserve the tensor (including scalar)
        for all Pauli phase combinations and spider degrees."""
        for d_z, d_x in itertools.product(range(2, 6), repeat=2):
            for z_phase, x_phase in [(0, 0), (1, 0), (0, 1), (1, 1)]:
                with self.subTest(d_z=d_z, d_x=d_x,
                                  z_phase=z_phase, x_phase=x_phase):
                    g, z, x = self._make_zx_bialgebra_graph(
                        d_z, d_x, z_phase, x_phase)
                    g_orig = g.copy()
                    self.assertTrue(check_bialgebra(g, z, x))
                    unsafe_bialgebra(g, z, x)
                    self.assertTrue(
                        compare_tensors(g, g_orig, preserve_scalar=True),
                        "Bialgebra changed the scalar")

    def test_symbolic_pauli_scalar(self):
        """Bialgebra with symbolic Boolean phases must track the phase
        product in the scalar, not silently drop it."""
        a = new_var('a', is_bool=True)
        b = new_var('b', is_bool=True)
        g, z, x = self._make_zx_bialgebra_graph(3, 3, a, b)
        self.assertTrue(check_bialgebra(g, z, x))
        unsafe_bialgebra(g, z, x)
        self.assertEqual(g.scalar.phase, a * b)

    def test_symbolic_zero_preserves_type(self):
        """Bialgebra with one symbolic phase and one concrete zero must
        leave the scalar phase as a Fraction, not convert to Poly."""
        a = new_var('a', is_bool=True)
        g, z, x = self._make_zx_bialgebra_graph(3, 3, a, 0)
        unsafe_bialgebra(g, z, x)
        self.assertIsInstance(g.scalar.phase, (Fraction, int))


if __name__ == '__main__':
    unittest.main()
