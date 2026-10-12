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

import random
import unittest
import warnings
from fractions import Fraction
from itertools import combinations, permutations, product
from unittest.mock import patch

from pyzx.circuit import Circuit
from pyzx.flow import gflow, pauli_flow
from pyzx.graph import Graph
from pyzx.pauliweb import compute_pauli_webs
from pyzx.utils import EdgeType, VertexType
from tests.flow_test_utils import assert_valid_flow


def brute_force_pauli_flow(n, edges, inputs, outputs, labels):
    """Enumerate correction subsets and total orders using Pauli-flow axioms.

    No elimination, demand matrix, focusing assumption, or flow finder is used.
    For a fixed correction at u, record measured vertices that must follow u.
    Existence is then checked over every total order of measured vertices.
    Only used on graphs of at most three vertices.
    """
    vertices = set(range(n))
    measured = vertices - outputs
    available = sorted(vertices - inputs)
    neighbours: dict[int, set[int]] = {v: set() for v in vertices}
    for u, v in edges:
        neighbours[u].add(v)
        neighbours[v].add(u)
    choices: dict[int, list[set[int]]] = {u: [] for u in measured}
    for bits in product((False, True), repeat=len(available)):
        correction = {v for v, bit in zip(available, bits) if bit}
        odd = {v for v in vertices if len(neighbours[v] & correction) % 2}
        for u in measured:
            if labels[u] == 'XY' and (u in correction or u not in odd):
                continue
            if labels[u] == 'X' and u not in odd:
                continue
            if labels[u] == 'Y' and ((u in correction) == (u in odd)):
                continue
            future = set()
            for v in measured - {u}:
                if labels[v] == 'XY' and (v in correction or v in odd):
                    future.add(v)
                elif labels[v] == 'X' and v in odd:
                    future.add(v)
                elif labels[v] == 'Y' and ((v in correction) != (v in odd)):
                    future.add(v)
            choices[u].append(future)
    for order in permutations(measured):
        remaining = set(order)
        for u in order:
            remaining.remove(u)
            if not any(dependencies <= remaining for dependencies in choices[u]):
                break
        else:
            return True
    return False

def open_graph(phases, edges=(), inputs=(), outputs=(), backend='simple'):
    """Build a graph-like diagram with explicit boundary vertices."""
    graph = Graph(backend)
    vertices = [graph.add_vertex(VertexType.Z, phase=p) for p in phases]
    for u, v in edges:
        graph.add_edge((vertices[u], vertices[v]), EdgeType.HADAMARD)
    for side, setter in ((inputs, graph.set_inputs), (outputs, graph.set_outputs)):
        boundaries = []
        for i in side:
            b = graph.add_vertex(VertexType.BOUNDARY)
            graph.add_edge((vertices[i], b), EdgeType.SIMPLE)
            boundaries.append(b)
        setter(tuple(boundaries))
    return graph, vertices


class TestGFlow(unittest.TestCase):

    def test_exhaustive_three_vertex_pauli_flow(self):
        """Check every tiny graph, boundary assignment and XY/X/Y labelling."""
        phases = {'XY': Fraction(1, 4), 'X': Fraction(0), 'Y': Fraction(1, 2)}
        cases = 0
        for n in range(4):
            vertices = set(range(n))
            subsets = [{v for v in vertices if mask & (1 << v)}
                       for mask in range(1 << n)]
            possible_edges = list(combinations(range(n), 2))
            for edge_bits in product((False, True), repeat=len(possible_edges)):
                edges = [e for e, bit in zip(possible_edges, edge_bits) if bit]
                for inputs, outputs in product(subsets, repeat=2):
                    measured = sorted(vertices - outputs)
                    for labels_tuple in product(phases, repeat=len(measured)):
                        labels = dict(zip(measured, labels_tuple))
                        expected = brute_force_pauli_flow(
                            n, edges, inputs, outputs, labels)
                        graph, _ = open_graph(
                            [phases[labels.get(v, 'XY')] for v in range(n)],
                            edges, inputs, outputs)
                        with self.subTest(n=n, edges=edges, inputs=inputs,
                                          outputs=outputs, labels=labels):
                            result = pauli_flow(graph)
                            self.assertEqual(result is not None, expected)
                            if result is not None:
                                assert_valid_flow(self, graph, result, True)
                            if all(label == 'XY' for label in labels_tuple):
                                self.assertEqual(gflow(graph) is not None, expected)
                        cases += 1
        self.assertEqual(cases, 4233)

    def test_random_flow_equivalence(self):
        """Compare legacy existence and validate cubic witnesses and layers."""
        rng = random.Random(506)
        phases = (Fraction(0), Fraction(1, 4), Fraction(1, 2),
                  Fraction(1), Fraction(3, 2))
        for sample in range(80):
            values = [rng.choice(phases) for _ in range(rng.randrange(1, 10))]
            edges = [e for e in combinations(range(len(values)), 2)
                     if rng.random() < 0.35]
            inputs = [v for v in range(len(values)) if rng.random() < 0.25]
            outputs = [v for v in range(len(values)) if rng.random() < 0.4]
            graph, _ = open_graph(values, edges, inputs, outputs)
            for pauli, reverse in product((False, True), repeat=2):
                finder = pauli_flow if pauli else gflow
                with self.subTest(sample=sample, pauli=pauli, reverse=reverse):
                    result = finder(graph, reverse=reverse)
                    legacy = finder(graph, method="legacy", focus=True,
                                    reverse=reverse)
                    self.assertEqual(result is None, legacy is None)
                    self.assertEqual(finder(graph, reverse=reverse, layers_only=True),
                                     None if result is None else result[0])
                    if result is not None:
                        assert_valid_flow(self, graph, result, pauli, reverse)
                        assert_valid_flow(self, graph, legacy, pauli, reverse)

    def test_no_flow_rank_and_order_obstructions(self):
        cases = [
            (4, [(0, 2), (1, 2)], [0, 1], [2, 3]),
            (3, [(0, 2), (1, 2)], [0, 1], [2]),
            (2, [(0, 1)], [], []),
        ]
        for n, edges, inputs, outputs in cases:
            graph, _ = open_graph([Fraction(1, 4)] * n, edges, inputs, outputs)
            with self.subTest(edges=edges, inputs=inputs, outputs=outputs):
                self.assertIsNone(gflow(graph))

    def test_ground_constraints(self):
        """Grounds are processed resources with optional homogeneous rows."""
        for phase in (Fraction(1, 4), Fraction(1, 2)):
            graph, vertices = open_graph([Fraction(1, 4), phase, Fraction(1, 4)],
                                        [(0, 2), (1, 2)], inputs=[0], outputs=[2])
            graph.set_ground(vertices[1])
            for finder, pauli in ((gflow, False), (pauli_flow, True)):
                with self.subTest(phase=phase, pauli=pauli):
                    result = finder(graph)
                    assert_valid_flow(self, graph, result, pauli)
                    strict = finder(graph, include_ground_constraints=True)
                    self.assertEqual(strict is not None,
                                     pauli and phase == Fraction(1, 2))
                    self.assertEqual(
                        finder(graph, include_ground_constraints=True,
                               layers_only=True),
                        None if strict is None else strict[0])
                    if strict is not None:
                        assert_valid_flow(self, graph, strict, pauli,
                                          include_ground_constraints=True)
                    legacy = finder(graph, method="legacy", focus=True)
                    self.assertEqual(strict is None, legacy is None)
        graph, vertices = open_graph([Fraction(1, 4)] * 3, [(0, 2)],
                                    inputs=[0], outputs=[2])
        graph.set_ground(vertices[1])
        assert_valid_flow(self, graph, gflow(graph, include_ground_constraints=True),
                          False, include_ground_constraints=True)

    def test_method_options_and_empty_graph(self):
        """Method-specific options fail clearly instead of changing meaning."""
        for finder in (gflow, pauli_flow):
            graph = Graph()
            self.assertEqual(finder(graph), ({}, {}))
            self.assertEqual(finder(graph, layers_only=True), {})
            for focus in (False, True):
                self.assertEqual(finder(graph, method="legacy", focus=focus), ({}, {}))
                with self.assertRaisesRegex(ValueError, "focus.*legacy"):
                    finder(graph, focus=focus)
            with self.assertRaisesRegex(ValueError, "Unknown flow method"):
                finder(graph, method="unknown")
            with self.assertRaisesRegex(ValueError, "layers_only"):
                finder(graph, method="legacy", layers_only=True)
            with self.assertRaisesRegex(ValueError, "include_ground_constraints"):
                finder(graph, method="legacy", include_ground_constraints=False)
            with self.assertRaises(TypeError):
                finder(graph, misspelled_option=True)

    def test_legacy_unfocused_corrections(self):
        """The public legacy method retains its smaller unfocused corrections."""
        graph, vertices = open_graph([Fraction(1, 4)] * 4,
                                    [(0, 1), (1, 2), (2, 3)],
                                    inputs=[0], outputs=[3])
        short = gflow(graph, method="legacy", focus=False)
        focused = gflow(graph, method="legacy", focus=True)
        self.assertEqual(short[1][vertices[0]], {vertices[1]})
        self.assertEqual(focused[1][vertices[0]], {vertices[1], vertices[3]})
        assert_valid_flow(self, graph, focused, False)

    def test_deprecated_pauli_alias(self):
        graph, _ = open_graph([Fraction(1, 2)])
        for method in ("cubic", "legacy"):
            with warnings.catch_warnings(record=True) as notices:
                warnings.simplefilter("always", DeprecationWarning)
                result = gflow(graph, pauli=True, method=method)
            self.assertEqual(result, pauli_flow(graph, method=method))
            self.assertEqual(len(notices), 1)
            self.assertIs(notices[0].category, DeprecationWarning)
            self.assertEqual(notices[0].filename, __file__)
            self.assertIn("pauli_flow", str(notices[0].message))

    def test_backend_vertex_ids_and_no_mutation(self):
        for backend in ('simple', 'multigraph'):
            graph = Graph(backend)
            dummy = [graph.add_vertex(VertexType.Z) for _ in range(4)]
            u = graph.add_vertex(VertexType.X, phase=Fraction(1, 4))
            v = graph.add_vertex(VertexType.Z, phase=Fraction(1, 4))
            graph.remove_vertices(dummy)
            graph.add_edge((u, v), EdgeType.SIMPLE)
            a, b = [graph.add_vertex(VertexType.BOUNDARY) for _ in range(2)]
            graph.add_edge((a, u), EdgeType.HADAMARD)
            graph.add_edge((v, b), EdgeType.SIMPLE)
            graph.set_inputs((a,))
            graph.set_outputs((b,))
            before = graph.to_json()
            for finder, reverse in product((gflow, pauli_flow), (False, True)):
                result = finder(graph, reverse=reverse)
                assert_valid_flow(self, graph, result, finder is pauli_flow, reverse)
                self.assertEqual(before, graph.to_json())
                self.assertEqual(result, finder(graph, reverse=reverse))

    def test_pauli_web_integration(self):
        circuit = Circuit(2)
        circuit.add_gate('HAD', 0)
        circuit.add_gate('CNOT', 0, 1)
        circuit.add_gate('ZPhase', 1, phase=Fraction(1, 2))
        circuit.add_gate('ZPhase', 0, phase=Fraction(1, 4))
        graph = circuit.to_graph()
        before = graph.to_json()
        for backwards in (False, True):
            def checked_finder(g, include_ground_constraints=False, reverse=False):
                result = pauli_flow(g, include_ground_constraints=include_ground_constraints,
                                    reverse=reverse)
                assert_valid_flow(self, g, result, True, reverse,
                                  include_ground_constraints)
                return result
            with patch('pyzx.pauliweb.pauli_flow', side_effect=checked_finder) as finder:
                compute_pauli_webs(graph, backwards=backwards)
                finder.assert_called_once()
            self.assertEqual(before, graph.to_json())

    def test_long_chain(self):
        graph, _ = open_graph([Fraction(1, 4)] * 130,
                              [(v, v + 1) for v in range(129)],
                              inputs=[0], outputs=[129])
        result = gflow(graph)
        assert_valid_flow(self, graph, result, False)
        self.assertEqual(gflow(graph, layers_only=True), result[0])

    def test_pauli_y_diagonal_correction(self):
        graph, vertices = open_graph([Fraction(1, 4), Fraction(1, 4), Fraction(1, 2)],
                                    [(0, 1), (0, 2)], inputs=[0], outputs=[1])
        for method in ("cubic", "legacy"):
            result = pauli_flow(graph, method=method)
            self.assertEqual(result[1][vertices[0]], {vertices[1]})
            self.assertEqual(result[1][vertices[2]], {vertices[1], vertices[2]})
            assert_valid_flow(self, graph, result, True)

    def test_dense_rectangular_system_across_packed_word_boundaries(self):
        """Dense corrections retain coordinates beyond machine-word widths."""
        rng = random.Random(67)
        n = 67
        rows = [{i} for i in range(n)]
        for _ in range(12 * n):
            i, j = rng.sample(range(n), 2)
            rows[i] ^= rows[j]
        edges = [(i, n + j) for i, row in enumerate(rows) for j in row]
        edges.extend((i, 2 * n) for i, row in enumerate(rows) if 0 in row)
        graph, vertices = open_graph([Fraction(1, 4)] * (2 * n + 2), edges,
                                     inputs=range(n), outputs=range(n, 2 * n + 2))
        result = gflow(graph, method="cubic")
        assert_valid_flow(self, graph, result, False, False, False)
        if result is not None:
            self.assertTrue(any(vertices[2 * n - 1] in c for c in result[1].values()))
            self.assertEqual(gflow(graph, method="cubic", layers_only=True), result[0])

    def test_reverse_matches_swapped_boundaries(self):
        """Reverse swaps input/output roles and reverses layer numbering."""
        graph, _ = open_graph([Fraction(1, 4)] * 5,
                              [(0, 1), (1, 2), (2, 3), (3, 4)], inputs=[0], outputs=[4])
        reversed_result = gflow(graph, reverse=True)
        assert_valid_flow(self, graph, reversed_result, False, True, False)
        inputs, outputs = graph.inputs(), graph.outputs()
        graph.set_inputs(outputs)
        graph.set_outputs(inputs)
        swapped_result = gflow(graph)
        self.assertIsNotNone(swapped_result)
        if reversed_result is not None and swapped_result is not None:
            self.assertEqual(reversed_result[1], swapped_result[1])
            depth = max(swapped_result[0].values())
            self.assertEqual(reversed_result[0], {v: depth - d for v, d in swapped_result[0].items()})

    def test_phase_periodicity_and_input_exclusion(self):
        """Odd half-integer phases are Y, but inputs can never self-correct."""
        for phase in (Fraction(-3, 2), Fraction(-1, 2), Fraction(1, 2),
                      Fraction(3, 2), Fraction(5, 2)):
            graph, vertices = open_graph([phase])
            self.assertEqual(pauli_flow(graph), ({vertices[0]: 0}, {vertices[0]: {vertices[0]}}))
            self.assertIsNone(gflow(graph))
            graph, _ = open_graph([phase], inputs=[0])
            self.assertIsNone(pauli_flow(graph))
        for phase in (Fraction(-2), Fraction(-1), Fraction(0), Fraction(1), Fraction(2)):
            graph, _ = open_graph([phase, phase], [(0, 1)])
            assert_valid_flow(self, graph, pauli_flow(graph), True, False, False)
        for phase in (Fraction(-1, 4), Fraction(1, 4), Fraction(3, 4)):
            graph, _ = open_graph([phase])
            self.assertIsNone(pauli_flow(graph))

if __name__ == '__main__':
    unittest.main()
