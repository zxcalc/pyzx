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
import random
import subprocess
import sys
from fractions import Fraction
from itertools import combinations, permutations, product
from unittest.mock import patch

from pyzx.circuit import Circuit
from pyzx import gflow as compatibility_gflow
from pyzx.flow import gflow, pauli_flow, _find_incremental_flow
from pyzx.graph import Graph
from pyzx.pauliweb import compute_pauli_webs
from pyzx.utils import EdgeType, VertexType
from tests.benchmark_flow import make_flow_graph


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

    def assert_valid_flow(self, graph, result, pauli, reverse, focus):
        """Check correction parity and order independently of either solver."""
        self.assertIsNotNone(result)
        if result is None:
            return
        layers, corrections = result
        vertices = {v for v in graph.vertices()
                    if graph.type(v) in (VertexType.Z, VertexType.X)}
        inputs = {v for b in graph.inputs() for v in graph.neighbors(b)} & vertices
        outputs = {v for b in graph.outputs() for v in graph.neighbors(b)} & vertices
        if reverse:
            inputs, outputs = outputs, inputs
        grounds = graph.grounds()
        self.assertEqual(set(layers), vertices)
        self.assertEqual(set(corrections), vertices - outputs - grounds)
        self.assertTrue(all(isinstance(layer, int) and layer >= 0 for layer in layers.values()))
        for v in outputs | grounds:
            self.assertEqual(layers[v], 0 if reverse else max(layers.values()))
        for u, correction in corrections.items():
            self.assertIsInstance(correction, set)
            self.assertLessEqual(correction, vertices)
            self.assertFalse(correction & inputs)
            for v in correction & outputs:
                if reverse:
                    self.assertLess(layers[v], layers[u])
                else:
                    self.assertGreater(layers[v], layers[u])
            odd = {v for v in vertices
                   if len(set(graph.neighbors(v)) & correction) % 2}
            for v in vertices - outputs:
                if v in grounds and not focus:
                    continue
                phase = graph.phase(v) % 2
                is_y = pauli and phase in (Fraction(1, 2), Fraction(3, 2))
                is_x = pauli and phase in (0, 1)
                coefficient = (v in odd) ^ (is_y and v in correction)
                self.assertEqual(coefficient, v == u)
                if not is_x and not is_y and v in correction and v not in grounds:
                    self.assertNotEqual(u, v)
                    if reverse:
                        self.assertLess(layers[v], layers[u])
                    else:
                        self.assertGreater(layers[v], layers[u])

    def test_exhaustive_three_vertex_pauli_flow(self):
        """Compare every tiny open graph and labelling with the definition."""
        phases = {'XY': Fraction(1, 4), 'X': Fraction(0), 'Y': Fraction(1, 2)}
        for n in range(4):
            vertices = set(range(n))
            subsets = [{v for v in vertices if mask & (1 << v)} for mask in range(1 << n)]
            possible_edges = list(combinations(range(n), 2))
            for edge_bits in product((False, True), repeat=len(possible_edges)):
                edges = [e for e, bit in zip(possible_edges, edge_bits) if bit]
                for inputs in subsets:
                    for outputs in subsets:
                        measured = sorted(vertices - outputs)
                        for labels_tuple in product(phases, repeat=len(measured)):
                            labels = dict(zip(measured, labels_tuple))
                            expected = brute_force_pauli_flow(n, edges, inputs, outputs, labels)
                            graph, _ = open_graph(
                                [phases[labels.get(v, 'XY')] for v in range(n)],
                                edges, inputs, outputs)
                            for focus in (False, True):
                                with self.subTest(n=n, edges=edges, inputs=inputs,
                                                  outputs=outputs, labels=labels,
                                                  focus=focus):
                                    result = pauli_flow(graph, focus=focus, method="incremental")
                                    self.assertEqual(result is not None, expected)
                                    layers = pauli_flow(graph, focus=focus, method="incremental",
                                                        layers_only=True)
                                    self.assertEqual(layers is not None, expected)
                                    self.assertEqual(layers, None if result is None else result[0])
                                    if result is not None:
                                        self.assert_valid_flow(graph, result, True, False, focus)
                                    # All-XY patterns also exercise ordinary gflow.
                                    if all(label == 'XY' for label in labels_tuple):
                                        ordinary = gflow(graph, focus=focus, method="incremental")
                                        self.assertEqual(ordinary is not None, expected)
                                        self.assertEqual(
                                            gflow(graph, focus=focus, method="incremental", layers_only=True),
                                            None if ordinary is None else ordinary[0])
                                        if ordinary is not None:
                                            self.assert_valid_flow(graph, ordinary, False, False, focus)

    def test_large_pauli_flow(self):
        """A fixed mixed-Pauli example gives valid full and layers-only results."""
        graph = make_flow_graph()
        self.assertEqual(graph.num_vertices(), 228)
        self.assertEqual(graph.num_edges(), 1655 + 28)
        self.assertEqual(len(graph.inputs()), 14)
        self.assertEqual(len(graph.outputs()), 14)
        before = graph.to_json()
        result = pauli_flow(graph, focus=True, method="incremental")
        self.assert_valid_flow(graph, result, True, False, True)
        self.assertEqual(pauli_flow(graph, focus=True, method="incremental", layers_only=True),
                         result[0])
        self.assertIsNone(gflow(graph, focus=True, method="incremental"))
        self.assertEqual(graph.to_json(), before)

    def test_rectangular_dependent_and_zero_columns(self):
        """Surplus outputs can supply dependent/zero columns and nonunique solutions."""
        graph, vertices = open_graph([Fraction(1, 4)] * 6,
                                    [(0, 3), (1, 3), (0, 4), (1, 4), (1, 5)],
                                    inputs=[0, 1], outputs=[2, 3, 4, 5])
        result = gflow(graph)
        self.assert_valid_flow(graph, result, False, False, False)
        self.assertIsNotNone(result)
        if result is not None:
            self.assertGreater(len(result[1][vertices[0]]), 1)
            self.assertTrue(all(vertices[2] not in c for c in result[1].values()))

    def test_no_flow_rank_and_order_obstructions(self):
        """A singular demand, too many inputs, and a forced cycle all fail."""
        cases = [
            (4, [(0, 2), (1, 2)], [0, 1], [2, 3]),  # Equal nonzero rows.
            (3, [(0, 2), (1, 2)], [0, 1], [2]),     # More inputs than outputs.
            (2, [(0, 1)], [], []),                  # Invertible M, cyclic order.
        ]
        for n, edges, inputs, outputs in cases:
            graph, _ = open_graph([Fraction(1, 4)] * n, edges, inputs, outputs)
            for focus in (False, True):
                with self.subTest(edges=edges, inputs=inputs, outputs=outputs, focus=focus):
                    self.assertIsNone(gflow(graph, focus=focus))

    def test_pivots_can_arrive_out_of_row_order(self):
        """Arbitrary output-column order must not affect existence or validity."""
        # Independent columns with first nonzero row indices 1, 0, 2.
        supports = ({1}, {0, 1, 2}, {2})
        for column_order in permutations(supports):
            edges = [(row, 3 + j) for j, support in enumerate(column_order) for row in support]
            graph, _ = open_graph([Fraction(1, 4)] * 6, edges,
                                  inputs=[0, 1, 2], outputs=[3, 4, 5])
            with self.subTest(column_order=column_order):
                full = gflow(graph, method="incremental")
                self.assert_valid_flow(graph, full, False, False, False)
                self.assertEqual(gflow(graph, method="incremental", layers_only=True), full[0])

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
        result = gflow(graph, method="incremental")
        self.assert_valid_flow(graph, result, False, False, False)
        if result is not None:
            self.assertTrue(any(vertices[2 * n - 1] in c for c in result[1].values()))
            self.assertEqual(gflow(graph, method="incremental", layers_only=True), result[0])

    def test_unequal_io_rank_deficient_system(self):
        """Extra outputs alone do not ensure the existence of a right inverse."""
        graph, _ = open_graph([Fraction(1, 4)] * 5, [(0, 2), (1, 2)],
                              inputs=[0, 1], outputs=[2, 3, 4])
        for focus in (False, True):
            self.assertIsNone(gflow(graph, focus=focus))

    def test_pauli_vertices_remove_order_obstruction(self):
        """X correctors can be used before they are processed, including mutually."""
        for phases in ([Fraction(0), Fraction(0)], [Fraction(1, 4), Fraction(0)]):
            graph, _ = open_graph(phases, [(0, 1)])
            self.assertIsNone(gflow(graph, pauli=False))
            self.assert_valid_flow(graph, gflow(graph, pauli=True), True, False, False)

    def test_gflow_module_import_compatibility(self):
        """Historical imports retain the canonical functions and their options."""
        self.assertIs(compatibility_gflow.gflow, gflow)
        self.assertIs(compatibility_gflow.pauli_flow, pauli_flow)
        # Check a fresh import, without this test module's explicit imports.
        result = subprocess.run(
            [sys.executable, "-c",
             "import pyzx as zx\n"
             "from pyzx.flow import gflow, pauli_flow\n"
             "assert zx.gflow.gflow is gflow\n"
             "assert zx.gflow.pauli_flow is pauli_flow\n"],
            capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_pauli_flow_entry_point(self):
        """The explicit API preserves the existing Pauli-flow mode."""
        graph, _ = open_graph([Fraction(1, 2)])
        self.assertIsNone(gflow(graph))
        for method in ("cubic", "incremental", "legacy"):
            with self.subTest(method=method):
                result = pauli_flow(graph, method=method)
                self.assertEqual(result, gflow(graph, pauli=True, method=method))
                self.assert_valid_flow(graph, result, True, False, False)

    def test_incremental_finder_uses_explicit_measurements(self):
        """Explicit X/Y assignments apply even to non-Clifford phases."""
        graph, vertices = open_graph([Fraction(1, 4)] * 2, [(0, 1)])
        before = graph.to_json()
        self.assertIsNone(_find_incremental_flow(graph, {v: "XY" for v in vertices}))
        result = _find_incremental_flow(graph, {v: "X" for v in vertices})
        self.assertEqual(result, ({v: 0 for v in vertices},
                                 {vertices[0]: {vertices[1]}, vertices[1]: {vertices[0]}}))
        self.assertEqual(before, graph.to_json())

        isolated, (v,) = open_graph([Fraction(1, 4)])
        self.assertIsNone(_find_incremental_flow(isolated, {v: "X"}))
        self.assertEqual(_find_incremental_flow(isolated, {v: "Y"}),
                         ({v: 0}, {v: {v}}))

    def test_incremental_finder_uses_ground_measurement_assignment(self):
        """A ground's explicit Y diagonal can satisfy its homogeneous row."""
        graph, (u, ground, output) = open_graph(
            [Fraction(1, 4)] * 3, [(0, 2), (1, 2)], inputs=[0], outputs=[2])
        graph.set_ground(ground)
        measurements = {u: "XY", ground: "XY", output: "XY"}
        self.assertIsNone(_find_incremental_flow(graph, measurements, focus=True))
        measurements[ground] = "Y"
        self.assertEqual(_find_incremental_flow(graph, measurements, focus=True),
                         ({ground: 1, output: 1, u: 0}, {u: {ground, output}}))
        self.assertEqual(_find_incremental_flow(graph, measurements, focus=False),
                         ({ground: 1, output: 1, u: 0}, {u: {output}}))

    def test_phase_periodicity_and_input_exclusion(self):
        """Odd half-integer phases are Y, but inputs can never self-correct."""
        for phase in (Fraction(-3, 2), Fraction(-1, 2), Fraction(1, 2),
                      Fraction(3, 2), Fraction(5, 2)):
            graph, vertices = open_graph([phase])
            self.assertEqual(gflow(graph, pauli=True), ({vertices[0]: 0}, {vertices[0]: {vertices[0]}}))
            self.assertIsNone(gflow(graph, pauli=False))
            graph, _ = open_graph([phase], inputs=[0])
            self.assertIsNone(gflow(graph, pauli=True))
        for phase in (Fraction(-2), Fraction(-1), Fraction(0), Fraction(1), Fraction(2)):
            graph, _ = open_graph([phase, phase], [(0, 1)])
            self.assert_valid_flow(graph, gflow(graph, pauli=True), True, False, False)
        for phase in (Fraction(-1, 4), Fraction(1, 4), Fraction(3, 4)):
            graph, _ = open_graph([phase])
            self.assertIsNone(gflow(graph, pauli=True))

    def test_disconnected_components(self):
        """Every measured component must have flow; isolated Y is admissible."""
        graph, vertices = open_graph([Fraction(1, 4)] * 4 + [Fraction(1, 2)],
                                    [(0, 1), (2, 3)], inputs=[0, 2], outputs=[1, 3])
        self.assert_valid_flow(graph, gflow(graph, pauli=True), True, False, False)
        graph.set_phase(vertices[-1], Fraction(1, 4))
        self.assertIsNone(gflow(graph, pauli=True))

    def test_grounds_focus_distinction(self):
        """An output correction touching a ground is excluded only when focused."""
        graph, vertices = open_graph([Fraction(1, 4)] * 3, [(0, 2), (1, 2)],
                                    inputs=[0], outputs=[2])
        graph.set_ground(vertices[1])
        self.assert_valid_flow(graph, gflow(graph, focus=False), False, False, False)
        self.assertIsNone(gflow(graph, focus=True))

    def test_only_outputs_and_boundary_wire(self):
        """No measurements requires no corrections, even with overlapping I/O."""
        graph, vertices = open_graph([Fraction(1, 4)] * 2, inputs=[0], outputs=[0, 1])
        self.assertEqual(gflow(graph), ({v: 0 for v in vertices}, {}))
        graph = Graph()
        a, b = [graph.add_vertex(VertexType.BOUNDARY) for _ in range(2)]
        graph.add_edge((a, b), EdgeType.SIMPLE)
        graph.set_inputs((a,))
        graph.set_outputs((b,))
        self.assertEqual(gflow(graph), ({}, {}))

    def test_focused_ground_does_not_require_its_own_right_inverse_column(self):
        """An isolated ground gives a zero M row but no unsatisfiable unit RHS."""
        graph, vertices = open_graph([Fraction(1, 4)] * 3, [(0, 2)],
                                    inputs=[0], outputs=[2])
        graph.set_ground(vertices[1])
        result = gflow(graph, focus=True)
        self.assert_valid_flow(graph, result, False, False, True)
        if result is not None:
            self.assertEqual(result[1], {vertices[0]: {vertices[2]}})

    def test_reverse_matches_swapped_boundaries(self):
        """Reverse swaps input/output roles and reverses layer numbering."""
        graph, _ = open_graph([Fraction(1, 4)] * 5,
                              [(0, 1), (1, 2), (2, 3), (3, 4)], inputs=[0], outputs=[4])
        reversed_result = gflow(graph, reverse=True)
        self.assert_valid_flow(graph, reversed_result, False, True, False)
        inputs, outputs = graph.inputs(), graph.outputs()
        graph.set_inputs(outputs)
        graph.set_outputs(inputs)
        swapped_result = gflow(graph)
        self.assertIsNotNone(swapped_result)
        if reversed_result is not None and swapped_result is not None:
            self.assertEqual(reversed_result[1], swapped_result[1])
            depth = max(swapped_result[0].values())
            self.assertEqual(reversed_result[0], {v: depth - d for v, d in swapped_result[0].items()})

    def test_backend_spider_types_vertex_ids_and_no_mutation(self):
        """Support X spiders and sparse IDs without changing the input diagram."""
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
            for focus, reverse, pauli in product((False, True), repeat=3):
                with self.subTest(backend=backend, focus=focus, reverse=reverse, pauli=pauli):
                    result = gflow(graph, focus, reverse, pauli)
                    self.assert_valid_flow(graph, result, pauli, reverse, focus)
                    self.assertEqual(before, graph.to_json())
                    # Deterministic for repeated calls on the same graph.
                    self.assertEqual(result, gflow(graph, focus, reverse, pauli))

    def test_pauli_web_integration(self):
        """Validate the actual finder witness used to construct Pauli webs."""
        circuit = Circuit(2)
        circuit.add_gate('HAD', 0)
        circuit.add_gate('CNOT', 0, 1)
        circuit.add_gate('ZPhase', 1, phase=Fraction(1, 2))
        circuit.add_gate('ZPhase', 0, phase=Fraction(1, 4))
        graph = circuit.to_graph()
        before = graph.to_json()
        for backwards in (False, True):
            def checked_finder(g, focus=False, reverse=False):
                result = pauli_flow(g, focus=focus, reverse=reverse)
                self.assert_valid_flow(g, result, True, reverse, focus)
                return result
            with patch('pyzx.pauliweb.pauli_flow', side_effect=checked_finder) as finder:
                compute_pauli_webs(graph, backwards=backwards)
                finder.assert_called_once()
            self.assertEqual(before, graph.to_json())

    def test_random_flow_equivalence(self):
        """Compare existence and validate cubic witnesses in every API mode."""
        rng = random.Random(506)
        phases = (Fraction(0), Fraction(1, 4), Fraction(1, 2),
                  Fraction(1), Fraction(3, 2))
        for sample in range(160):
            graph = Graph()
            vertices = [graph.add_vertex(VertexType.Z, phase=rng.choice(phases))
                        for _ in range(rng.randrange(1, 10))]
            for i, v in enumerate(vertices):
                for w in vertices[:i]:
                    if rng.random() < 0.35:
                        graph.add_edge((v, w), EdgeType.HADAMARD)
            boundaries = []
            for probability in (0.25, 0.4):
                side = []
                for v in vertices:
                    if rng.random() < probability:
                        b = graph.add_vertex(VertexType.BOUNDARY)
                        graph.add_edge((b, v), EdgeType.SIMPLE)
                        side.append(b)
                boundaries.append(tuple(side))
            graph.set_inputs(boundaries[0])
            graph.set_outputs(boundaries[1])
            for pauli in (False, True):
                for reverse in (False, True):
                    for focus in (False, True):
                        with self.subTest(sample=sample, pauli=pauli,
                                          reverse=reverse, focus=focus):
                            result = gflow(graph, focus, reverse, pauli)
                            incremental = gflow(graph, focus, reverse, pauli,
                                                method="incremental")
                            legacy = gflow(graph, focus, reverse, pauli, method="legacy")
                            self.assertEqual(result is None, legacy is None)
                            self.assertEqual(result, incremental)
                            self.assertEqual(
                                gflow(graph, focus, reverse, pauli, method="incremental", layers_only=True),
                                None if incremental is None else incremental[0])
                            if incremental is not None:
                                self.assert_valid_flow(graph, incremental, pauli, reverse, focus)
                            if result is not None:
                                self.assert_valid_flow(graph, result, pauli, reverse, focus)

    def test_layers_only_entry_points_and_empty_graph(self):
        """The keyword returns layers directly, and None alone denotes no flow."""
        graph, _ = open_graph([Fraction(1, 4)] * 3, [(0, 1), (1, 2)],
                              inputs=[0], outputs=[2])
        for method in ("cubic", "incremental"):
            for finder in (gflow, pauli_flow):
                with self.subTest(method=method, finder=finder.__name__):
                    full = finder(graph, method=method)
                    self.assertEqual(full, finder(graph, method=method, layers_only=False))
                    layers = finder(graph, method=method, layers_only=True)
                    self.assertIsInstance(layers, dict)
                    self.assertEqual(layers, full[0])
                    self.assertEqual(finder(Graph(), method=method, layers_only=True), {})
            isolated_y, _ = open_graph([Fraction(1, 2)])
            self.assertIsNone(gflow(isolated_y, method=method, layers_only=True))
            self.assertEqual(pauli_flow(isolated_y, method=method, layers_only=True),
                             gflow(isolated_y, pauli=True, method=method, layers_only=True))
        for finder in (gflow, pauli_flow):
            with self.assertRaisesRegex(ValueError, "layers_only"):
                finder(graph, method="legacy", layers_only=True)
        with self.assertRaisesRegex(ValueError, "layers_only"):
            gflow(graph, pauli=True, method="legacy", layers_only=True)

    def test_layers_only_ground_constraints_and_explicit_assignments(self):
        """Skipping witnesses retains explicit labels and homogeneous ground rows."""
        graph, (u, ground, output) = open_graph(
            [Fraction(1, 4)] * 3, [(0, 2), (1, 2)], inputs=[0], outputs=[2])
        graph.set_ground(ground)
        before = graph.to_json()
        measurements = {u: "XY", ground: "Y", output: "XY"}
        for focus in (False, True):
            with self.subTest(focus=focus):
                full = _find_incremental_flow(graph, measurements, focus=focus)
                self.assertIsNotNone(full)
                self.assertEqual(
                    _find_incremental_flow(graph, measurements, focus=focus,
                                           layers_only=True), full[0])
                blocked = measurements.copy()
                blocked[ground] = "XY"
                self.assertIsNone(_find_incremental_flow(
                    graph, blocked, focus=True, layers_only=True))
        self.assertEqual(before, graph.to_json())

    def test_grounds(self):
        """Ground constraints follow PyZX's focus flag convention."""
        graph = Graph()
        u = graph.add_vertex(VertexType.Z, phase=Fraction(1, 4))
        ground = graph.add_vertex(VertexType.Z, ground=True)
        graph.add_edge((u, ground), EdgeType.HADAMARD)
        for focus in (False, True):
            result = gflow(graph, focus=focus)
            self.assertEqual(result is None, gflow(graph, focus=focus, method="legacy") is None)
            self.assert_valid_flow(graph, result, False, False, focus)

    def test_incremental_is_default_for_balanced_and_unbalanced_graphs(self):
        """Boundary balance does not change the cubic backend."""
        for outputs in ([2], [1, 2]):
            graph, _ = open_graph([Fraction(1, 4)] * 3,
                                  [(0, 1), (1, 2)], inputs=[0], outputs=outputs)
            with self.subTest(outputs=outputs):
                result = gflow(graph)
                self.assertEqual(result, gflow(graph, method="incremental"))
                self.assert_valid_flow(graph, result, False, False, False)

    def test_long_chain(self):
        """Incrementally unlocked columns preserve focusing across 129 layers."""
        graph = Graph()
        vertices = [graph.add_vertex(VertexType.Z, phase=Fraction(1, 4))
                    for _ in range(130)]
        for u, v in zip(vertices, vertices[1:]):
            graph.add_edge((u, v), EdgeType.HADAMARD)
        for v, setter in ((vertices[0], graph.set_inputs),
                          (vertices[-1], graph.set_outputs)):
            b = graph.add_vertex(VertexType.BOUNDARY)
            graph.add_edge((v, b), EdgeType.SIMPLE)
            setter((b,))
        self.assert_valid_flow(graph, gflow(graph, method="incremental"), False, False, False)
        self.assert_valid_flow(graph, gflow(graph), False, False, False)
        full = gflow(graph, method="incremental")
        self.assertEqual(gflow(graph, method="incremental", layers_only=True), full[0])

    def test_empty_and_isolated(self):
        """Empty graphs and diagonal-only Y corrections need no graph edges."""
        graph = Graph()
        self.assertEqual(gflow(graph), ({}, {}))
        v = graph.add_vertex(VertexType.Z, phase=Fraction(1, 2))
        self.assertIsNone(gflow(graph))
        self.assertEqual(gflow(graph, pauli=True), ({v: 0}, {v: {v}}))
        with self.assertRaises(ValueError):
            gflow(graph, method="unknown")

    def test_pauli_y_diagonal_correction(self):
        """A Pauli-Y vertex can use the diagonal of the demand matrix."""
        graph = Graph()
        xy = graph.add_vertex(VertexType.Z, 0, 1, phase=Fraction(1, 4))
        output = graph.add_vertex(VertexType.Z, 1, 1)
        y = graph.add_vertex(VertexType.Z, 2, 1, phase=Fraction(1, 2))
        graph.add_edge((xy, output), EdgeType.HADAMARD)
        graph.add_edge((xy, y), EdgeType.HADAMARD)

        input_boundary = graph.add_vertex(VertexType.BOUNDARY, 0, 0)
        output_boundary = graph.add_vertex(VertexType.BOUNDARY, 1, 2)
        graph.add_edge((input_boundary, xy), EdgeType.SIMPLE)
        graph.add_edge((output, output_boundary), EdgeType.SIMPLE)
        graph.set_inputs((input_boundary,))
        graph.set_outputs((output_boundary,))

        for focus in (False, True):
            with self.subTest(focus=focus):
                result = gflow(graph, focus=focus, pauli=True)
                self.assertIsNotNone(result)
                if result is None:
                    continue
                _, corrections = result
                self.assertEqual(corrections[xy], {output})
                self.assertEqual(corrections[y], {output, y})



if __name__ == '__main__':
    unittest.main()
