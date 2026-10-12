# PyZX - Python library for quantum circuit rewriting 
#        and optimization using the ZX-calculus
# Copyright (C) 2021 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from fractions import Fraction
from types import ModuleType
from typing import Optional
import unittest
import sys

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.circuit import Circuit
from pyzx.graph import Graph
from pyzx.utils import EdgeType, VertexType
from pyzx.simulation import (
    Decomp,
    Strategy,
    apply_decomp,
    check_valid,
    get_alpha,
    get_decomp_spec,
    get_reference,
    simulate,
    full_decompose,
    get_strategy_spec
)

np: Optional[ModuleType]
try:
    import numpy as np
except ImportError:
    np = None


@unittest.skipUnless(np, "numpy needs to be installed for simulation tests to run")
class TestSimulationDecompositions(unittest.TestCase):
    """General tests verifying mathematical correctness and validity of all stabiliser decompositions."""

    def test_bss_decomposition(self) -> None:
        """Verify Bravyi-Smith-Smolin (BSS) decomposition on 6 T-spiders."""
        c = Circuit(6)
        for i in range(6):
            c.add_gate("T", i)
        g = c.to_graph()
        verts = [v for v in g.vertices() if g.type(v) == VertexType.Z]
        self.assertEqual(len(verts), 6)
        self.assertTrue(check_valid(Decomp.BSS, g, verts))

        gsum = apply_decomp(Decomp.BSS, g, verts)
        self.assertEqual(len(gsum.graphs), 7)
        self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))

    def test_magic2_decomposition(self) -> None:
        """Verify magic2 decomposition on 2 T-spiders."""
        c = Circuit(2)
        c.add_gate("T", 0)
        c.add_gate("T", 1)
        g = c.to_graph()
        verts = [v for v in g.vertices() if g.type(v) == VertexType.Z]
        self.assertEqual(len(verts), 2)
        self.assertTrue(check_valid(Decomp.MAGIC_2, g, verts))

        gsum = apply_decomp(Decomp.MAGIC_2, g, verts)
        self.assertEqual(len(gsum.graphs), 2)
        self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))

    def test_magic5_decomposition(self) -> None:
        """Verify magic5 decomposition on 5 T-spiders."""
        c = Circuit(5)
        for i in range(5):
            c.add_gate("T", i)
        g = c.to_graph()
        verts = [v for v in g.vertices() if g.type(v) == VertexType.Z]
        self.assertEqual(len(verts), 5)
        self.assertTrue(check_valid(Decomp.MAGIC_5, g, verts))

        gsum = apply_decomp(Decomp.MAGIC_5, g, verts)
        self.assertEqual(len(gsum.graphs), 3)
        self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))

    def test_cut_edge_decomposition(self) -> None:
        """Verify edge cutting decomposition on simple and Hadamard edges."""
        c = Circuit(2)
        c.add_gate("CNOT", 0, 1)
        g = c.to_graph()

        for e in list(g.edges()):
            self.assertTrue(check_valid(Decomp.CUT_EDGE, g, e, VertexType.Z))
            self.assertTrue(check_valid(Decomp.CUT_EDGE, g, e, VertexType.X))

            gsum_z = apply_decomp(Decomp.CUT_EDGE, g, e, VertexType.Z)
            self.assertEqual(len(gsum_z.graphs), 2)
            self.assertTrue(np.allclose(g.to_tensor(), gsum_z.to_tensor()))

            gsum_x = apply_decomp(Decomp.CUT_EDGE, g, e, VertexType.X)
            self.assertEqual(len(gsum_x.graphs), 2)
            self.assertTrue(np.allclose(g.to_tensor(), gsum_x.to_tensor()))

    def test_cut_vertex_decomposition(self) -> None:
        """Verify vertex cutting decomposition on Z and X spiders."""
        c = Circuit(2)
        c.add_gate("T", 0)
        c.add_gate("CNOT", 0, 1)
        g = c.to_graph()

        for v in g.vertices():
            if g.type(v) in (VertexType.Z, VertexType.X):
                self.assertTrue(check_valid(Decomp.CUT_VERTEX, g, v))
                gsum = apply_decomp(Decomp.CUT_VERTEX, g, v)
                self.assertEqual(len(gsum.graphs), 2)
                self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))

    def test_cut_wishbone_decomposition(self) -> None:
        """Verify wishbone (separator) cutting decomposition."""
        g = Graph()
        v0 = g.add_vertex(VertexType.Z, 0, 0, 0)
        v1 = g.add_vertex(VertexType.Z, 0, 1, Fraction(1, 4))
        v2 = g.add_vertex(VertexType.Z, 0, 2, 0)
        v3 = g.add_vertex(VertexType.Z, 0, 3, 0)
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))
        g.add_edge((v1, v3))
        g.set_inputs((v0,))
        g.set_outputs((v2, v3))

        self.assertTrue(check_valid(Decomp.CUT_WISHBONE, g, v1, [v0], Fraction(1, 4)))
        gsum = apply_decomp(Decomp.CUT_WISHBONE, g, v1, [v0], Fraction(1, 4))
        self.assertEqual(len(gsum.graphs), 2)
        self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))

    def test_cat_decompositions(self) -> None:
        """Verify cat_3, cat_4, cat_5, cat_6 and cat_n decompositions on canonical cat states."""
        cat_decomps = [
            (3, Decomp.CAT_3, 2),
            (4, Decomp.CAT_4, 2),
            (5, Decomp.CAT_5, 3),
            (6, Decomp.CAT_6, 3),
        ]

        for n, decomp, expected_terms in cat_decomps:
            with self.subTest(n=n, decomp=decomp.value):
                g = Graph()
                v_center = g.add_vertex(VertexType.Z, 1, 0, 0)
                outputs = []
                for i in range(n):
                    w = g.add_vertex(VertexType.Z, 2, i, Fraction(1, 4))
                    g.add_edge((v_center, w), EdgeType.HADAMARD)
                    b = g.add_vertex(VertexType.BOUNDARY, 3, i)
                    g.add_edge((w, b), EdgeType.SIMPLE)
                    outputs.append(b)
                g.set_outputs(tuple(outputs))

                # Verify specific cat decomp
                self.assertTrue(check_valid(decomp, g, v_center))
                gsum = apply_decomp(decomp, g, v_center)
                self.assertEqual(len(gsum.graphs), expected_terms)
                self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))

                # Verify generic CAT_N dispatcher
                self.assertTrue(check_valid(Decomp.CAT_N, g, v_center))
                gsum_n = apply_decomp(Decomp.CAT_N, g, v_center)
                self.assertEqual(len(gsum_n.graphs), expected_terms)
                self.assertTrue(np.allclose(g.to_tensor(), gsum_n.to_tensor()))

    def test_decompositions_validity_checkers_reject_invalid(self) -> None:
        """Verify that validation checkers reject invalid parameters."""
        c = Circuit(2)
        c.add_gate("T", 0)
        c.add_gate("T", 1)
        g = c.to_graph()
        verts = [v for v in g.vertices() if g.type(v) == VertexType.Z]

        # BSS expects 6 vertices, giving 2 should fail
        with self.assertRaises((AssertionError, RuntimeError)):
            apply_decomp(Decomp.BSS, g, verts)

        # MAGIC_5 expects 5 vertices, giving 2 should fail
        with self.assertRaises((AssertionError, RuntimeError)):
            apply_decomp(Decomp.MAGIC_5, g, verts)

        # MAGIC_2 expects 2 vertices, giving 1 should fail
        with self.assertRaises((AssertionError, RuntimeError)):
            apply_decomp(Decomp.MAGIC_2, g, verts[:1])

        # CAT_3 on vertex with degree != 3 should fail
        with self.assertRaises((ValueError, RuntimeError)):
            apply_decomp(Decomp.CAT_3, g, verts[0])

        # CUT_EDGE on non-existent edge should fail
        with self.assertRaises((AssertionError, RuntimeError)):
            apply_decomp(Decomp.CUT_EDGE, g, (verts[0], 99999))

        # CUT_VERTEX on boundary vertex should fail
        boundary_v = [v for v in g.vertices() if g.type(v) == VertexType.BOUNDARY][0]
        with self.assertRaises((AssertionError, RuntimeError)):
            apply_decomp(Decomp.CUT_VERTEX, g, boundary_v)

    def test_decomp_metadata(self) -> None:
        """Verify all Decomp enum entries have valid specifications, alphas, and references."""
        for d in Decomp:
            spec = get_decomp_spec(d)
            self.assertIsNotNone(spec, f"Decomp {d} should have a registered spec")
            self.assertIsNotNone(spec.fn, f"Decomp {d} should have a registered function")
            # Ensure get_alpha and get_reference execute without error
            alpha = get_alpha(d)
            ref = get_reference(d)
            self.assertIsInstance(ref, str)
            if d != Decomp.CAT_N:
                self.assertTrue(alpha is None or isinstance(alpha, (int, float)))


@unittest.skipUnless(np, "numpy needs to be installed for simulation tests to run")
class TestSimulationStrategies(unittest.TestCase):
    """General tests verifying classical simulation strategies."""

    def _canonical_closed_circuit(self, n_qubits: int, depth: int = 4) -> Graph:
        """Helper to create a closed Clifford+T diagram with known amplitude."""
        c = Circuit(n_qubits)
        for i in range(n_qubits):
            c.add_gate("HAD", i)
            c.add_gate("T", i)
        for i in range(n_qubits - 1):
            c.add_gate("CNOT", i, i + 1)
        c.add_gate("T", 0)
        g = c.to_graph()
        g.apply_state("0" * n_qubits)
        g.apply_effect("0" * n_qubits)
        return g

    def test_simulate_strategies_correctness(self) -> None:
        """Verify BSS, CUT_RANDOM, and MAGIC_CAT strategies compute exact scalar amplitude."""
        for n_qubits in [2, 3]:
            with self.subTest(n_qubits=n_qubits):
                g = self._canonical_closed_circuit(n_qubits)
                true_amp = g.to_tensor().flatten()[0]

                for strat in [Strategy.BSS, Strategy.CUT_RANDOM, Strategy.MAGIC_CAT]:
                    with self.subTest(strategy=strat.value):
                        amp = simulate(strat, g)
                        self.assertTrue(
                            np.isclose(true_amp, amp, atol=1e-10),
                            f"Strategy {strat} amplitude {amp} does not match true amplitude {true_amp}"
                        )

    def test_full_decompose_strategies(self) -> None:
        """Verify full_decompose returns empty scalar graphs summing to the true amplitude."""
        g = self._canonical_closed_circuit(2)
        true_amp = g.to_tensor().flatten()[0]

        for strat in [Strategy.BSS, Strategy.CUT_RANDOM, Strategy.MAGIC_CAT]:
            with self.subTest(strategy=strat.value):
                terms = full_decompose(strat, g)
                self.assertIsInstance(terms, list)
                self.assertGreater(len(terms), 0)
                # Sum of term scalars must match the true amplitude
                summed_amp = sum(h.scalar.to_number() for h in terms)
                self.assertTrue(
                    np.isclose(true_amp, summed_amp, atol=1e-10),
                    f"full_decompose {strat} terms sum {summed_amp} does not match {true_amp}"
                )

    def test_strategy_metadata(self) -> None:
        """Verify all Strategy enum entries have valid specifications and references."""
        for s in Strategy:
            spec = get_strategy_spec(s)
            self.assertIsNotNone(spec, f"Strategy {s} should have a registered spec")
            self.assertIsNotNone(spec.fn, f"Strategy {s} should have a registered function")
            ref = get_reference(s)
            self.assertIsInstance(ref, str)


if __name__ == '__main__':
    unittest.main()
