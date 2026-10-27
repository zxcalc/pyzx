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
import sys
import unittest
from random import randint, choice

import numpy as np

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx import generate
from pyzx.circuit import Circuit
from pyzx.graph import Graph
from pyzx.graph.base import BaseGraph
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
from pyzx.simulation.strategies.magic_cat import find_best_cat
from pyzx.simulation.strategies.lpmc3 import find_best_decomp


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

    def test_lone_phase_1(self) -> None:
        """
        Verify lone_phase_1 decomposition, by testing 5 random valid structures.
        Technically this is a family of infinite decompositions, only the first 10 are tested.
        Also verifies that validation checkers reject invalid parameters on last case.
        """
        for n in range(1, 11):
            for _ in range(5):
                g = Graph()
                outputs = []
                v = g.add_vertex(VertexType.Z, 0, 0, Fraction(2*randint(0, 4) + 1, 4))
                for i in range(randint(1, 3)):
                    under_v = g.add_vertex(VertexType.BOUNDARY, 1, i)
                    outputs.append(under_v)
                    g.add_edge((v, under_v), choice([EdgeType.SIMPLE, EdgeType.HADAMARD]))
                for i in range(n):
                    x = g.add_vertex(VertexType.Z, -1, i-1.5, Fraction(2*randint(0, 4) + 1, 4))
                    g.add_edge((v, x), EdgeType.HADAMARD)
                g.set_outputs(tuple(outputs))

                self.assertTrue(check_valid(Decomp.LONE_PHASE_1, g, v))
                gsum = apply_decomp(Decomp.LONE_PHASE_1, g, v)
                self.assertEqual(len(gsum.graphs), 2)
                self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))

        # Should crash when given wrong amount of vertices as input
        with self.assertRaises((TypeError, RuntimeError)):
            check_valid(Decomp.LONE_PHASE_1, g, v, x)

        g.set_phase(v, 0)
        # Should crash if any input vertex is not T-like
        with self.assertRaises((ValueError, RuntimeError)):
            check_valid(Decomp.LONE_PHASE_1, g, v)

        g.set_phase(v, Fraction(1, 4))
        g.set_type(v, VertexType.X)
        # Should crash if any input vertex is not green
        with self.assertRaises((ValueError, RuntimeError)):
            check_valid(Decomp.LONE_PHASE_1, g, v)

        # Should crash if it does not have the correct structure
        with self.assertRaises((ValueError, RuntimeError)):
            check_valid(Decomp.LONE_PHASE_1, g, x)

    def test_lone_phase_2(self) -> None:
        """
        Verify lone_phase_2 decomposition, by testing 5 random valid structures.
        Technically this is a family of infinite decompositions, only the first 10 are tested.
        Also verifies that validation checkers reject invalid parameters on last case.
        """
        for n in range(1, 11):
            for _ in range(5):
                g = Graph()
                outputs = []
                z1 = g.add_vertex(VertexType.Z, 0, 0, Fraction(2*randint(0, 4) + 1, 4))
                z2 = g.add_vertex(VertexType.Z, 0, 8, Fraction(2*randint(0, 4) + 1, 4))
                for i in range(randint(1, 3)):
                    b1 = g.add_vertex(VertexType.BOUNDARY, 2, i)
                    outputs.append(b1)
                    g.add_edge((z1, b1), choice([EdgeType.SIMPLE, EdgeType.HADAMARD]))
                for i in range(randint(1, 3)):
                    b2 = g.add_vertex(VertexType.BOUNDARY, 2, 8-i)
                    outputs.append(b2)
                    g.add_edge((z2, b2), choice([EdgeType.SIMPLE, EdgeType.HADAMARD]))
                for i in range(n):
                    x = g.add_vertex(VertexType.Z, -2, 2*i, Fraction(2*randint(0, 4) + 1, 4))
                    g.add_edges([(z1, x), (z2, x)], EdgeType.HADAMARD)
                g.set_outputs(tuple(outputs))

                self.assertTrue(check_valid(Decomp.LONE_PHASE_2, g, z1, z2))
                gsum = apply_decomp(Decomp.LONE_PHASE_2, g, z1, z2)
                self.assertEqual(len(gsum.graphs), 2)
                self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))

        # Should crash when given wrong amount of vertices as input
        with self.assertRaises((TypeError, RuntimeError)):
            check_valid(Decomp.LONE_PHASE_2, g, z1)

        g.set_phase(z1, 0)
        # Should crash if any input vertex is not T-like
        with self.assertRaises((ValueError, RuntimeError)):
            check_valid(Decomp.LONE_PHASE_2, g, z1, z2)

        g.set_phase(z1, Fraction(1, 4))
        g.set_type(z1, VertexType.X)
        # Should crash if any input vertex is not green
        with self.assertRaises((ValueError, RuntimeError)):
            check_valid(Decomp.LONE_PHASE_2, g, z1, z2)

        # Should crash if it does not have the correct structure
        with self.assertRaises((ValueError, RuntimeError)):
            check_valid(Decomp.LONE_PHASE_2, g, z2, x)

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

        # CAT_3 on vertex with degree != 3 (e.g. phase-0 Z spider with degree 4) should fail
        g_deg4 = Graph()
        v_deg4 = g_deg4.add_vertex(VertexType.Z, 0, 0, 0)
        for i in range(4):
            w = g_deg4.add_vertex(VertexType.Z, 1, i, 0)
            g_deg4.add_edge((v_deg4, w), EdgeType.HADAMARD)
        with self.assertRaises((ValueError, RuntimeError)):
            apply_decomp(Decomp.CAT_3, g_deg4, v_deg4)

        # CAT_3 on vertex with non-Pauli phase should also fail
        with self.assertRaises((ValueError, RuntimeError)):
            apply_decomp(Decomp.CAT_3, g, verts[0])

        # CUT_EDGE on non-existent edge should fail
        with self.assertRaises((AssertionError, RuntimeError)):
            apply_decomp(Decomp.CUT_EDGE, g, (verts[0], 99999))

        # CUT_WISHBONE on target vertex that is not a neighbour should fail
        g_wb = Graph()
        w0 = g_wb.add_vertex(VertexType.Z, 0, 0, 0)
        w1 = g_wb.add_vertex(VertexType.Z, 0, 1, 0)
        w2 = g_wb.add_vertex(VertexType.Z, 0, 2, 0)
        g_wb.add_edge((w0, w1))
        with self.assertRaises((AssertionError, ValueError, RuntimeError)):
            apply_decomp(Decomp.CUT_WISHBONE, g_wb, w1, [w2])

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
            # For the following 5 decompositions the alpha variable is variable, thus its value should be None
            if d in [Decomp.CAT_N,
                     Decomp.LONE_PHASE_1,
                     Decomp.LONE_PHASE_2,
                     Decomp.MULTI_CAT3_1,
                     Decomp.MULTI_CAT3_2]:
                self.assertIsNone(alpha)
            else:
                self.assertIsInstance(alpha, (int, float))


class TestSimulationStrategies(unittest.TestCase):
    """General tests verifying classical simulation strategies."""

    def _canonical_closed_circuit(self, n_qubits: int, depth: int = 1) -> BaseGraph:
        """Helper to create a closed Clifford+T diagram with known amplitude."""
        c = Circuit(n_qubits)
        for _ in range(depth):
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
        test_cases = [
            ("canonical_2q_d1", self._canonical_closed_circuit(2, depth=1)),
            ("canonical_3q_d1", self._canonical_closed_circuit(3, depth=1)),
            ("canonical_3q_d2", self._canonical_closed_circuit(3, depth=2)),
        ]
        # Also test on a random Clifford+T circuit with 6 T gates
        g_rand = generate.cliffordT(qubits=4, depth=20, p_t=0.3, seed=42)
        g_rand.apply_state("0" * 4)
        g_rand.apply_effect("0" * 4)
        test_cases.append(("clifford_t_4q", g_rand))

        for name, g in test_cases:
            with self.subTest(case=name):
                true_amp = g.to_tensor().flatten()[0]

                for strat in Strategy:
                    with self.subTest(strategy=strat.value):
                        amp = simulate(strat, g)
                        self.assertTrue(
                            np.isclose(true_amp, amp, atol=1e-10),
                            f"Strategy {strat} amplitude {amp} does not match true amplitude {true_amp}"
                        )

    def test_full_decompose_strategies(self) -> None:
        """Verify full_decompose returns empty scalar graphs summing to the true amplitude."""
        # Circuit with depth=2 has 8 T gates, exercising multi-term BSS and cat decompositions
        g = self._canonical_closed_circuit(3, depth=2)
        true_amp = g.to_tensor().flatten()[0]

        for strat in Strategy:
            with self.subTest(strategy=strat.value):
                terms: list[BaseGraph] = full_decompose(strat, g)
                self.assertIsInstance(terms, list)
                self.assertGreater(len(terms), 0)
                # BSS and MAGIC_CAT should decompose the 8 T gates into multiple terms
                if strat in (Strategy.BSS, Strategy.MAGIC_CAT):
                    self.assertGreater(len(terms), 1, f"Strategy {strat} should decompose into > 1 terms")
                # Sum of term scalars must match the true amplitude
                summed_amp = sum(h.scalar.to_number() for h in terms)
                self.assertTrue(
                    np.isclose(true_amp, summed_amp, atol=1e-10),
                    f"full_decompose {strat} terms sum {summed_amp} does not match {true_amp}"
                )

    def test_magic_cat_fallback_magic5(self) -> None:
        """Verify MAGIC_CAT uses MAGIC_5 fallback when no cat states are present and tcount >= 5."""
        c = Circuit(5)
        for i in range(5):
            c.add_gate("T", i)
        g = c.to_graph()
        g.apply_state("0" * 5)
        g.apply_effect("0" * 5)
        true_amp = g.to_tensor().flatten()[0]

        # Verify no cat states exist so MAGIC_5 fallback is triggered
        self.assertIsNone(find_best_cat(g))
        terms = full_decompose(Strategy.MAGIC_CAT, g)
        self.assertEqual(len(terms), 3)  # MAGIC_5 decomposes 5 T-spiders into 3 terms
        summed_amp = sum(h.scalar.to_number() for h in terms)
        self.assertTrue(np.isclose(true_amp, summed_amp, atol=1e-10))
        amp = simulate(Strategy.MAGIC_CAT, g)
        self.assertTrue(np.isclose(true_amp, amp, atol=1e-10))

    def test_find_best_cat_skips_invalid_cat_spider(self) -> None:
        """Regression test for find_best_cat: degree 3-6 Pauli spiders with non-cat neighbourhoods must be skipped."""
        g = Graph()
        # Non-cat degree-4 Pauli spider (connected to like-colour Z spiders with simple edges)
        v_non_cat = g.add_vertex(VertexType.Z, 0, 0, 0)
        for i in range(4):
            w = g.add_vertex(VertexType.Z, 1, i, 0)
            g.add_edge((v_non_cat, w), EdgeType.SIMPLE)

        # Real degree-4 cat state elsewhere in the graph
        v_real_cat = g.add_vertex(VertexType.Z, 2, 0, 0)
        for i in range(4):
            w = g.add_vertex(VertexType.Z, 3, i, 0)
            g.add_edge((v_real_cat, w), EdgeType.HADAMARD)

        best = find_best_cat(g)
        self.assertEqual(best, v_real_cat, f"find_best_cat should have skipped non-cat spider {v_non_cat} and returned {v_real_cat}")

    def test_find_best_decomp_finding_best_decomp(self):
        """
        Tests if find_best_decomp in lpmc3 strategy actually finds the best decomp.
        Also tests if these decomps get decomposed correctly.
        """
        # First we create all tests graphs, then we check correctness.
        expected_awnsers = []

        g_lp1 = Graph()
        v = g_lp1.add_vertex(VertexType.Z, 0, 0, Fraction(1, 4))
        under_v = g_lp1.add_vertex(VertexType.Z, 1, 0, Fraction(1, 4))
        g_lp1.add_edge((v, under_v), EdgeType.HADAMARD)
        for i in range(6):
            x = g_lp1.add_vertex(VertexType.Z, -1, i-1.5, Fraction(1, 4))
            g_lp1.add_edge((v, x), EdgeType.HADAMARD)
        expected_awnsers.append((Decomp.LONE_PHASE_1, g_lp1, [v]))

        g_lp2 = Graph()
        z1 = g_lp2.add_vertex(VertexType.Z, 0, 0, Fraction(1, 4))
        z2 = g_lp2.add_vertex(VertexType.Z, 0, 8, Fraction(1, 4))
        b1 = g_lp2.add_vertex(VertexType.Z, 2, 0, Fraction(1, 4))
        b2 = g_lp2.add_vertex(VertexType.Z, 2, 8, Fraction(1, 4))
        g_lp2.add_edges([(z1, b1), (z1, b2)], EdgeType.HADAMARD)
        for i in range(6):
            x = g_lp2.add_vertex(VertexType.Z, -2, 2*i, Fraction(1, 4))
            g_lp2.add_edges([(z1, x), (z2, x)], EdgeType.HADAMARD)
        expected_awnsers.append((Decomp.LONE_PHASE_2, g_lp2, [z1, z2]))

        g_mc31 = Graph()
        v = g_mc31.add_vertex(VertexType.Z, 0, 0, Fraction(1, 4))
        under_v = g_mc31.add_vertex(VertexType.Z, 1, 0, Fraction(1, 4))
        g_mc31.add_edge((v, under_v))
        for i in range(6):
            z = g_mc31.add_vertex(VertexType.Z, -1, i + 1)
            x = g_mc31.add_vertex(VertexType.Z, -2, i + 1, Fraction(1, 4))
            y = g_mc31.add_vertex(VertexType.Z, 0, i + 1, Fraction(1, 4))
            under_y = g_mc31.add_vertex(VertexType.Z, 1, i + 1, Fraction(1, 4))
            g_mc31.add_edges([(v, z), (z, x), (z, y), (y, under_y)], EdgeType.HADAMARD)
        expected_awnsers.append((Decomp.MULTI_CAT3_1, g_mc31, [v]))

        g_mc32 = Graph()
        z1 = g_mc32.add_vertex(VertexType.Z, 0, 0, Fraction(1, 4))
        z2 = g_mc32.add_vertex(VertexType.Z, 0, 8, Fraction(1, 4))
        b1 = g_mc32.add_vertex(VertexType.Z, 2, 0, Fraction(1, 4))
        b2 = g_mc32.add_vertex(VertexType.Z, 2, 8, Fraction(1, 4))
        g_mc32.add_edges([(z1, b1), (z1, b2)], EdgeType.HADAMARD)
        for i in range(6):
            v = g_mc32.add_vertex(VertexType.Z, -2, 2*i)
            y = g_mc32.add_vertex(VertexType.Z, -2, 2*i + 1, Fraction(1, 4))
            x = g_mc32.add_vertex(VertexType.Z, -4, 2*i, Fraction(1, 4))
            above_x = g_mc32.add_vertex(VertexType.Z, -6, 2*i, Fraction(1, 4))
            g_mc32.add_edges([(z1, v), (z2, v), (v, y), (v, x), (x, above_x)], EdgeType.HADAMARD)
        expected_awnsers.append((Decomp.MULTI_CAT3_2, g_mc32, [z1, z2]))

        for n, d in zip([3, 4, 5, 6], [Decomp.CAT_3, Decomp.CAT_4, Decomp.CAT_5, Decomp.CAT_6]):
            g_cat = Graph()
            v = g_cat.add_vertex(VertexType.Z, 0, 0)
            for i in range(n):
                x = g_cat.add_vertex(VertexType.Z, 2, i, Fraction(1, 4))
                y = g_cat.add_vertex(VertexType.Z, 4, i, Fraction(1, 4))
                g_cat.add_edges([(v, x), (x, y)], EdgeType.HADAMARD)
            expected_awnsers.append((d, g_cat, [v]))

        for d, g, vxs in expected_awnsers:
            vxs2, d2 = find_best_decomp(g)
            self.assertTrue(d == d2, msg=f"{d} is not {d2}")
            self.assertTrue(set(vxs) == set(vxs2))

            terms = full_decompose(Strategy.LP_MC3, g)
            found_val = sum(term.scalar.to_number() for term in terms)
            true_val = g.to_tensor()
            self.assertTrue(np.isclose(found_val, true_val))

        g_boring = Graph()
        vxs, d = find_best_decomp(g_boring)
        self.assertIsNone(vxs)
        self.assertIsNone(d)

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
