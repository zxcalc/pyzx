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
from pyzx.graph.multigraph import Multigraph
from pyzx.symbolic import new_var
from pyzx.utils import EdgeType, VertexType, set_h_box_label
from pyzx.rewrite_rules.bialgebra_rule import (
    check_bialgebra, check_bialgebra_reduce, bialgebra, unsafe_bialgebra,
)

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import compare_tensors
except ImportError:
    np = None


class TestCheckBialgebraZX(unittest.TestCase):
    """Tests for check_bialgebra with Z-X spider pairs."""

    def test_zx_pair_phase_free(self):
        """Z-X pair with zero phases should match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.X, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertTrue(check_bialgebra(g, v1, v2))
        self.assertTrue(check_bialgebra(g, v2, v1))

    def test_zx_pair_pauli_phases(self):
        """Z-X pair with Pauli (pi) phases should match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.X, 0, 1)
        g.set_phase(v2, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertTrue(check_bialgebra(g, v1, v2))

    def test_zx_pair_non_pauli_phase(self):
        """Z-X pair with non-Pauli phase should not match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        g.set_phase(v1, Fraction(1, 4))
        v2 = g.add_vertex(VertexType.X, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertFalse(check_bialgebra(g, v1, v2))

    def test_same_type_pair(self):
        """Two Z spiders should not match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertFalse(check_bialgebra(g, v1, v2))

    def test_hadamard_edge(self):
        """Z-X pair connected by Hadamard edge should not match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.X, 0, 1)
        g.add_edge((v1, v2), EdgeType.HADAMARD)

        self.assertFalse(check_bialgebra(g, v1, v2))

    def test_deleted_vertex(self):
        """Deleted vertices should not match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.X, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.remove_vertex(v2)

        self.assertFalse(check_bialgebra(g, v1, v2))


class TestCheckBialgebraXH(unittest.TestCase):
    """Tests for check_bialgebra with X-H (X spider and H-box) pairs."""

    def test_xh_pair_standard_hbox_phase(self):
        """X spider (phase 0) with standard H-box (phase 1) should match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.X, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v2, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertTrue(check_bialgebra(g, v1, v2))
        self.assertTrue(check_bialgebra(g, v2, v1))

    def test_xh_pair_standard_hbox_label(self):
        """X spider with standard H-box (label=-1) should match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.X, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        set_h_box_label(g, v2, -1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertTrue(check_bialgebra(g, v1, v2))

    def test_xh_pair_nonstandard_hbox(self):
        """X spider with non-standard H-box should not match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.X, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        set_h_box_label(g, v2, 2+3j)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertFalse(check_bialgebra(g, v1, v2))

    def test_xh_pair_x_has_phase(self):
        """X spider with non-zero phase and H-box should not match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.X, 0, 0)
        g.set_phase(v1, 1)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v2, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertFalse(check_bialgebra(g, v1, v2))

    def test_xh_pair_hbox_wrong_phase(self):
        """X spider with H-box having non-standard phase should not match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.X, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v2, Fraction(1, 2))
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertFalse(check_bialgebra(g, v1, v2))

    def test_zh_pair_does_not_match(self):
        """Z spider with H-box should not match (only X-H is supported)."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v2, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertFalse(check_bialgebra(g, v1, v2))

    def test_xh_pair_hadamard_edge(self):
        """X-H pair connected by Hadamard edge should not match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.X, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        g.set_phase(v2, 1)
        g.add_edge((v1, v2), EdgeType.HADAMARD)

        self.assertFalse(check_bialgebra(g, v1, v2))


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

    def test_safe_bialgebra_applies(self):
        """Safe bialgebra should apply to a valid Z-X pair."""
        g, z, x = self._make_zx_bialgebra_graph(3, 3, 0, 0)
        self.assertTrue(bialgebra(g, z, x))
        self.assertFalse(z in g.vertices())
        self.assertFalse(x in g.vertices())

    def test_safe_bialgebra_rejects_invalid(self):
        """Safe bialgebra should reject same-type pair."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 0, 1)
        g.add_edge((v1, v2), EdgeType.SIMPLE)

        self.assertFalse(bialgebra(g, v1, v2))

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_zx_bialgebra_preserves_semantics(self):
        """Z-X bialgebra must preserve the tensor (including scalar)
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


class TestBialgebraApplyXH(unittest.TestCase):
    """Tests for applying the bialgebra rule to X-H pairs."""

    def _make_xh_bialgebra_graph(self, d_x, d_h):
        """Build a graph with a phase-free X spider of degree d_x
        connected to a standard H-box of degree d_h via a simple edge.
        Each vertex gets (d-1) boundary neighbours plus the X-H edge."""
        g = Graph()
        x = g.add_vertex(VertexType.X, 0, 1)
        h = g.add_vertex(VertexType.H_BOX, 1, 1)
        g.set_phase(h, 1)
        g.add_edge((x, h))
        ins = []
        for i in range(d_x - 1):
            b = g.add_vertex(VertexType.BOUNDARY, i, 0)
            g.add_edge((b, x))
            ins.append(b)
        outs = []
        for i in range(d_h - 1):
            b = g.add_vertex(VertexType.BOUNDARY, i, 2)
            g.add_edge((h, b))
            outs.append(b)
        g.set_inputs(tuple(ins))
        g.set_outputs(tuple(outs))
        return g, x, h

    def test_safe_bialgebra_xh_applies(self):
        """Safe bialgebra should apply to a valid X-H pair."""
        g, x, h = self._make_xh_bialgebra_graph(3, 3)
        self.assertTrue(bialgebra(g, x, h))
        self.assertFalse(x in g.vertices())
        self.assertFalse(h in g.vertices())

    def test_safe_bialgebra_xh_label(self):
        """Safe bialgebra should apply to X-H pair using label=-1."""
        g = Graph()
        b0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.X, 0, 1)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 2)
        set_h_box_label(g, v2, -1)
        b1 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((b0, v1), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v2, b1), EdgeType.SIMPLE)

        self.assertTrue(bialgebra(g, v1, v2))

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_xh_bialgebra_preserves_semantics(self):
        """X-H bialgebra must preserve the tensor (including scalar)
        for all degree combinations."""
        for d_x, d_h in itertools.product(range(2, 6), repeat=2):
            with self.subTest(d_x=d_x, d_h=d_h):
                g, x, h = self._make_xh_bialgebra_graph(d_x, d_h)
                g_orig = g.copy()
                unsafe_bialgebra(g, x, h)
                self.assertTrue(
                    compare_tensors(g, g_orig, preserve_scalar=True),
                    "Bialgebra changed the scalar")

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_xh_bialgebra_reversed_args(self):
        """X-H bialgebra with arguments in H,X order should preserve
        the tensor."""
        g, x, h = self._make_xh_bialgebra_graph(3, 3)
        g_orig = g.copy()
        unsafe_bialgebra(g, h, x)
        self.assertTrue(compare_tensors(g, g_orig, preserve_scalar=True))


class TestBialgebraParallelEdgePositions(unittest.TestCase):
    """Tests that parallel-edge vertices get distinct positions.

    These tests use Multigraph with auto-simplify off, since the default
    GraphS backend does not support true parallel edges."""

    def test_parallel_edges_between_matched_pair(self):
        """Parallel edges between the matched spiders should produce
        offset vertex pairs with distinct positions."""
        g = Multigraph()
        g.set_auto_simplify(False)
        z = g.add_vertex(VertexType.Z, 0, 0)
        x = g.add_vertex(VertexType.X, 0, 2)
        b_in = g.add_vertex(VertexType.BOUNDARY, 0, -1)
        b_out = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((b_in, z))
        for _ in range(3):
            g.add_edge((z, x))
        g.add_edge((x, b_out))

        verts_before = set(g.vertices())
        self.assertTrue(bialgebra(g, z, x))
        new_verts = [v for v in g.vertices() if v not in verts_before
                     and g.type(v) != VertexType.BOUNDARY]
        positions = [(g.qubit(v), g.row(v)) for v in new_verts]
        self.assertEqual(len(set(positions)), len(positions),
                         f"Overlapping positions: {positions}")

    def test_parallel_edges_to_third_vertex(self):
        """Regression test for zxcalc/zxlive#306: applying bialgebra
        to a pair where one spider has parallel edges to a third vertex
        must not produce overlapping vertices."""
        g = Multigraph()
        g.set_auto_simplify(False)
        v0 = g.add_vertex(VertexType.Z, qubit=-3.0, row=-2.5)
        v1 = g.add_vertex(VertexType.Z, qubit=-1.75, row=-1.0)
        v2 = g.add_vertex(VertexType.X, qubit=-1.75, row=-3.0)
        for q, r in [(-3, -5), (-1.75, -5), (-3, 0.75),
                      (-1.75, 0.75), (-0.5, 0.5), (-0.25, -2)]:
            g.add_vertex(VertexType.BOUNDARY, qubit=q, row=r)
        # Edges matching zxlive#306 test case (v0-v2 has 2 parallel edges).
        g.add_edge((v0, 3))
        g.add_edge((v0, v2))
        g.add_edge((v0, v2))
        g.add_edge((v0, 5))
        g.add_edge((v1, v2))
        g.add_edge((v1, 6))
        g.add_edge((v1, 7))
        g.add_edge((v2, 4))
        g.add_edge((v2, 8))

        self.assertTrue(bialgebra(g, v1, v2))
        non_boundary = [v for v in g.vertices()
                        if g.type(v) != VertexType.BOUNDARY]
        positions = [(g.qubit(v), g.row(v)) for v in non_boundary]
        self.assertEqual(len(set(positions)), len(positions),
                         f"Overlapping positions: {positions}")


class TestCheckBialgebraReduce(unittest.TestCase):
    """Tests for check_bialgebra_reduce."""

    def test_reduce_valid(self):
        """Valid bialgebra reduce configuration should match."""
        g = Graph()
        # Z spider connected to X spider, with neighbours of matching types.
        x1 = g.add_vertex(VertexType.X, 0, 0)
        x2 = g.add_vertex(VertexType.X, 1, 0)
        v1 = g.add_vertex(VertexType.Z, 0.5, 1)
        v2 = g.add_vertex(VertexType.X, 0.5, 2)
        z1 = g.add_vertex(VertexType.Z, 0, 3)
        z2 = g.add_vertex(VertexType.Z, 1, 3)
        g.add_edge((x1, v1), EdgeType.SIMPLE)
        g.add_edge((x2, v1), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v2, z1), EdgeType.SIMPLE)
        g.add_edge((v2, z2), EdgeType.SIMPLE)

        self.assertTrue(check_bialgebra_reduce(g, v1, v2))

    def test_reduce_xh_valid(self):
        """Valid X-H bialgebra reduce configuration should match."""
        g = Graph()
        # H-boxes connected to X spider, with X neighbours of H-box.
        h1 = g.add_vertex(VertexType.H_BOX, 0, 0)
        g.set_phase(h1, 1)
        h2 = g.add_vertex(VertexType.H_BOX, 1, 0)
        g.set_phase(h2, 1)
        v1 = g.add_vertex(VertexType.X, 0.5, 1)
        v2 = g.add_vertex(VertexType.H_BOX, 0.5, 2)
        g.set_phase(v2, 1)
        x1 = g.add_vertex(VertexType.X, 0, 3)
        x2 = g.add_vertex(VertexType.X, 1, 3)
        g.add_edge((h1, v1), EdgeType.SIMPLE)
        g.add_edge((h2, v1), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v2, x1), EdgeType.SIMPLE)
        g.add_edge((v2, x2), EdgeType.SIMPLE)

        self.assertTrue(check_bialgebra_reduce(g, v1, v2))

    def test_reduce_boundary_neighbour(self):
        """Bialgebra reduce should not match when a neighbour is a boundary."""
        g = Graph()
        b0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.Z, 0, 1)
        v2 = g.add_vertex(VertexType.X, 0, 2)
        b1 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((b0, v1), EdgeType.SIMPLE)
        g.add_edge((v1, v2), EdgeType.SIMPLE)
        g.add_edge((v2, b1), EdgeType.SIMPLE)

        self.assertFalse(check_bialgebra_reduce(g, v1, v2))


if __name__ == '__main__':
    unittest.main()
