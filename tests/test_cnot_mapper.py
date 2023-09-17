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


import copy
import unittest
import sys
from typing import List, Optional

if __name__ == "__main__":
    sys.path.append("..")
    sys.path.append(".")
import numpy as np

from pyzx.linalg import Mat2, MatLike
from pyzx.routing.cnot_mapper import (
    CostMetric,
    gauss,
    ElimMode,
    FitnessFunction,
    sequential_gauss,
)
from pyzx.routing.architecture import (
    Architecture,
    architectures,
    dynamic_size_architectures,
    hamiltonian_path_architectures,
    create_architecture,
    SQUARE,
    FULLY_CONNECTED,
    IBMQ_SINGAPORE,
)
from pyzx.routing.parity_maps import CNOT_tracker
from pyzx.routing.machine_learning import GeneticAlgorithm
from pyzx.circuit import CNOT
from pyzx.extract import permutation_as_swaps
from pyzx.generate import build_random_parity_map
from pyzx.routing.steiner import steiner_gauss

SEED = 42


class TestSteiner(unittest.TestCase):
    def setUp(self) -> None:
        np.random.seed(SEED)
        self.n_tests = 1
        self.arch = create_architecture(
            SQUARE, n_qubits=9
        )  # Needs to have a square number of qubits to test the square architecture.
        self.n_qubits = self.arch.n_qubits
        depth = 16
        self.circuit = [CNOT_tracker(self.arch.n_qubits) for _ in range(self.n_tests)]
        self.matrix: List[Mat2] = [
            Mat2(build_random_parity_map(self.n_qubits, depth, self.circuit[i]))
            for i in range(self.n_tests)
        ]
        self.aggr_circ = CNOT_tracker(self.arch.n_qubits)
        for c in self.circuit:
            for g in c.gates:
                self.aggr_circ.add_gate(g)

    def assertGates(self, circuit, architecture=None):
        if architecture is None:
            architecture = self.arch
        for gate in circuit.gates:
            if hasattr(gate, "name") and gate.name == "CNOT":
                qubits = (gate.control, gate.target)
                edge = (
                    architecture.qubit2vertex(qubits[0]),
                    architecture.qubit2vertex(qubits[1]),
                )
                edges = list(architecture.graph.edges())
                edges += [tuple(reversed(edge)) for edge in edges]
                self.assertIn(edge, edges)

    def assertMat2Equal(self, m1: Mat2, m2: Mat2, triangle: bool = False):
        if triangle:
            self.assertListEqual(
                *[
                    [
                        m.data[i][j]
                        for i in range(self.n_qubits)
                        for j in range(self.n_qubits)
                        if i >= j
                    ]
                    for m in [m1, m2]
                ]
            )
        else:
            self.assertListEqual(m1.data, m2.data)

    def assertCircuitEquivalentMat2(self, circuit: CNOT_tracker, matrix: Mat2):
        self.assertMat2Equal(circuit.matrix, matrix)

    def assertCircuitEquivalent(self, c1: CNOT_tracker, c2: CNOT_tracker):
        self.assertMat2Equal(c1.matrix, c2.matrix)

    def assertIsPerm(self, l: List[int]):
        self.assertTrue(all([i in l for i in range(len(l))]))

    def test_all_cnots_valid(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                circuit = CNOT_tracker(self.arch.n_qubits)
                matrix = self.matrix[i].copy()
                _ = gauss(
                    ElimMode.STEINER_MODE,
                    matrix,
                    architecture=self.arch,
                    full_reduce=True,
                    y=circuit,
                )
                self.assertGates(circuit)

    def test_architectures(self):
        for i in range(self.n_tests):
            for name in architectures:
                # print("Testing", name)
                if name in dynamic_size_architectures:
                    if name not in hamiltonian_path_architectures:
                        # continue
                        # This is DENSITY and it gets in an infinite loop when building steiner trees!
                        architecture = create_architecture(name, n_qubits=self.n_qubits)
                    else:
                        try:
                            architecture = create_architecture(
                                name, n_qubits=self.n_qubits
                            )
                        except KeyError as e:
                            if name == SQUARE:
                                print(
                                    "WARNING! skipping SQUARE architecture due to non-square number of qubits:",
                                    self.n_qubits,
                                )
                                continue
                            else:
                                raise e
                elif name in hamiltonian_path_architectures:
                    architecture = create_architecture(name)
                else:
                    architecture = create_architecture(name)
                if self.n_qubits == architecture.n_qubits:
                    with self.subTest(i=i, arch=architecture.name):
                        self.do_gauss(
                            ElimMode.STEINER_MODE,
                            self.matrix[i],
                            architecture=architecture,
                        )

    def test_gauss_small(self):
        n_qubits = 2
        architecture = create_architecture(FULLY_CONNECTED, n_qubits=n_qubits)
        matrix = Mat2([[1, 1], [1, 0]])
        for mode in [ElimMode.GAUSS_MODE, ElimMode.STEINER_MODE]:
            with self.subTest(i=mode):
                mtx = matrix.copy()
                circuit = CNOT_tracker(n_qubits)
                _ = gauss(
                    mode,
                    mtx,
                    architecture=architecture,
                    full_reduce=False,
                    y=circuit,
                )
                self.assertGates(circuit)
                self.assertMat2Equal(circuit.matrix * matrix, mtx)

    def do_gauss(
        self,
        mode: ElimMode,
        mat: Mat2,
        full_reduce: bool = True,
        with_assert: bool = True,
        architecture: Optional[Architecture] = None,
    ):
        if architecture is None:
            architecture = self.arch
        circuit = CNOT_tracker(self.arch.n_qubits)
        matrix = mat.copy()
        rank = gauss(
            mode, matrix, architecture=architecture, full_reduce=full_reduce, y=circuit
        )
        if with_assert and mode == ElimMode.STEINER_MODE:
            self.assertGates(circuit, architecture)
        if with_assert and full_reduce:
            self.assertMat2Equal(circuit.matrix, mat)
        return circuit, matrix, rank

    def test_gauss(self) -> None:
        for i in range(self.n_tests):
            with self.subTest(i=i):
                for full_reduce in [False, True]:
                    matrices: List[Mat2] = []
                    ranks = []
                    circuits = []
                    for mode in [ElimMode.GAUSS_MODE, ElimMode.STEINER_MODE]:
                        circuit, matrix, rank = self.do_gauss(
                            mode,
                            self.matrix[i],
                            full_reduce=full_reduce,
                            with_assert=True,
                        )
                        circuits.append(circuit)
                        ranks.append(rank)
                        matrices.append(matrix)
                        if full_reduce:
                            self.assertCircuitEquivalent(circuit, self.circuit[i])
                    # self.assertEqual(*ranks)
                    if full_reduce:
                        self.assertMat2Equal(matrices[0], matrices[1])
                        self.assertCircuitEquivalent(circuits[0], circuits[1])
                    else:
                        self.assertMat2Equal(matrices[0], matrices[1], triangle=True)

    def test_initial_circuit(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                self.assertCircuitEquivalentMat2(self.circuit[i], self.matrix[i])

    def reverse_permutation(self, perm):
        return [perm.tolist().index(i) for i in range(len(perm))]

    def do_permuted_gauss(
        self,
        matrix: Mat2,
        perm_rows: List[int],
        perm_columns: List[int],
        mode=ElimMode.STEINER_MODE,
        full_reduce: bool = True,
        with_assert: bool = True,
    ):
        if with_assert:
            self.assertIsPerm(perm_rows)
            self.assertIsPerm(perm_columns)
        map = matrix.copy()
        map.permute_rows(perm_rows)
        map.permute_cols(perm_columns)
        circuit, map, rank = self.do_gauss(
            mode, map, full_reduce=full_reduce, with_assert=with_assert
        )
        return circuit, map, rank

    def test_permuted_gauss(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                perm_rows = list(np.random.permutation(self.n_qubits))
                perm_columns = list(np.random.permutation(self.n_qubits))
                self.do_permuted_gauss(self.matrix[i], perm_rows, perm_columns)

    def test_genetic_optimization(self):
        for i in range(1):  # Takes too long otherwise
            with self.subTest(i=i):
                population = 4
                crossover_prob = 0.8
                mutate_prob = 0.2
                n_iter = 4
                optimizer = GeneticAlgorithm(
                    population,
                    crossover_prob,
                    mutate_prob,
                    FitnessFunction(CostMetric.COUNT, self.matrix[i], ElimMode.STEINER_MODE, self.arch),
                )
                best_permutation = optimizer.find_optimum(self.n_qubits, n_iter)
                self.do_permuted_gauss(
                    self.matrix[i], best_permutation, best_permutation
                )

    def test_pso_optimization(self):
        modes = [
            ElimMode.STEINER_MODE,
            ElimMode.GENETIC_STEINER_MODE,
            ElimMode.PSO_STEINER_MODE,
        ]
        for p in range(1):  # Takes too long otherwise
            with self.subTest(i=p):
                order = np.random.permutation(self.n_tests)[: p + 1]
                matrices = [self.matrix[c] for c in order]
                for mode in modes:
                    for permute_input, permute_output in [
                        (i, j) for i in [True, False] for j in [True, False]
                    ]:
                        with self.subTest(i=(p, mode, permute_input, permute_output)):
                            circuits, perms, score = sequential_gauss(
                                [m.copy() for m in matrices],  # type: ignore # MatLike should be a valid ArrayLike
                                mode=mode,
                                architecture=self.arch,
                                full_reduce=True,
                                # Small values to keep the test fast
                                # It doesn't need to find an optimized solution, it only needs to do a non-trivial run
                                n_steps=4,
                                swarm_size=4,
                                population_size=4,
                                n_iterations=1,
                                input_perm=permute_input,
                                output_perm=permute_output,
                            )
                            if not permute_input:
                                self.assertListEqual(
                                    perms[0], [i for i in range(self.n_qubits)]
                                )
                            if not permute_output:
                                self.assertListEqual(
                                    perms[-1],
                                    [i for i in range(self.n_qubits)],
                                )
                            aggr_c = CNOT_tracker(self.n_qubits)
                            for circ in circuits:
                                for gate in circ.gates:
                                    aggr_c.add_gate(gate)

                            aggr_c2 = CNOT_tracker(self.n_qubits)
                            # Undo the initial permutation
                            for q1, q2 in permutation_as_swaps(
                                {k: v for k, v in enumerate(perms[0])}
                            ):
                                aggr_c2.add_gate(CNOT(q1, q2))
                                aggr_c2.add_gate(CNOT(q2, q1))
                                aggr_c2.add_gate(CNOT(q1, q2))
                            for circ in [self.circuit[i] for i in order]:
                                for gate in circ.gates:
                                    aggr_c2.add_gate(gate)
                            # Undo the initial permutation
                            for q1, q2 in permutation_as_swaps(
                                {v: k for k, v in enumerate(perms[-1])}
                            ):
                                aggr_c2.add_gate(CNOT(q1, q2))
                                aggr_c2.add_gate(CNOT(q2, q1))
                                aggr_c2.add_gate(CNOT(q1, q2))
                            self.assertCircuitEquivalent(aggr_c2, aggr_c)
                            for i in range(p):
                                with self.subTest(i=(i, mode)):
                                    # Check if all gates are allowed
                                    self.assertGates(circuits[i])
                                    # Check if the circuit is equivalent to the original matrix
                                    self.assertCircuitEquivalentMat2(
                                        circuits[i],
                                        matrices[i],
                                    )
                                    # Check if the circuit is equivalent to the extracted circuit given the optimized permutations
                                    c, _, _ = self.do_permuted_gauss(
                                        matrices[i].copy(), perms[i + 1], perms[i]  # type: ignore # MatLike should be a valid ArrayLike
                                    )
                                    self.assertCircuitEquivalent(circuits[i], c)
                                    # Check if their metrics are the same.
                                    self.assertEqual(
                                        circuits[i].count_cnots(), c.count_cnots()
                                    )
                                    self.assertEqual(
                                        circuits[i].cnot_depth(), c.cnot_depth()
                                    )

    @unittest.skip("This test fails because the steiner_gauss tries to find a steiner tree in a disconnected subgraph of the architecture")
    def test_small_steiner_gauss(self):
        """
        Small regression test for steiner_gauss
        """
        arch = create_architecture(IBMQ_SINGAPORE)

        print("Architecture qubit mapping")
        print(arch.qubit_map)

        n_qubits = arch.n_qubits
        c = CNOT_tracker(n_qubits)
        cnots = [
            (4, 17),
            (7, 10),
            (11, 9),
            (2, 14),
            (6, 19),
            (6, 11),
            (2, 11),
            (12, 19),
            (6, 4),
            (2, 0),
            (5, 19),
            (5, 15),
            (16, 1),
            (5, 11),
            (3, 18),
            (12, 11),
        ]
        for u, v in cnots:
            c.add_gate(CNOT(u, v))

        tracker = CNOT_tracker(n_qubits)
        steiner_gauss(c.matrix, arch, full_reduce=True, y=tracker)
        self.assertGates(tracker, architecture=arch)


if __name__ == "__main__":
    unittest.main()
