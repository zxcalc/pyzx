
import unittest
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
import numpy as np

from pyzx.linalg import Mat2
from pyzx.compiler import gauss, STEINER_MODE, GENETIC_STEINER_MODE, GAUSS_MODE, GENETIC_GAUSS_MODE
from pyzx.architecture import create_square_architecture
from pyzx.parity_maps import CNOT_tracker, build_random_parity_map
from pyzx.machine_learning import GeneticAlgorithm
from pyzx.fitness import get_gate_count_fitness_func

SEED = 42

class TestSteiner(unittest.TestCase):

    def setUp(self):
        self.n_qubits = 9
        self.n_tests = 5
        self.arch = create_square_architecture(n_qubits=self.n_qubits)
        depth = 20
        self.circuit = [CNOT_tracker(self.arch.n_qubits) for _ in range(self.n_tests)]
        np.random.seed(SEED)
        self.matrix = [build_random_parity_map(self.n_qubits, depth, self.circuit[i]) for i in range(self.n_tests)]

    def assertGates(self, circuit):
        for gate in circuit.gates:
            if hasattr(gate, "name") and gate.name == "CNOT":
                edge = (gate.control, gate.target)
                self.assertTrue(edge in self.arch.graph.edges() or tuple(reversed(edge)) in self.arch.graph.edges())

    def assertMat2Equal(self, m1, m2, triangle=False):
        if triangle:
            self.assertListEqual(*[[m.data[i, j] for i in range(self.n_qubits) for j in range(self.n_qubits) if i >= j] for m in [m1, m2]])
        else:
            self.assertNdArrEqual(m1.data, m2.data)

    def assertMat2EqualNdArr(self, mat, ndarr):
        self.assertNdArrEqual(mat.data, ndarr)

    def assertNdArrEqual(self, a1, a2):
        self.assertListEqual(a1.tolist(), a2.tolist())

    def assertCircuitEquivalentNdArr(self, circuit, ndarr):
        self.assertMat2EqualNdArr(circuit.matrix, ndarr)

    def assertCircuitEquivalent(self, c1, c2):
        self.assertMat2Equal(c1.matrix, c2.matrix)

    def assertIsPerm(self, l):
        self.assertTrue(all([i in l for i in range(len(l))]))

    def test_full_shortest_path(self):
        # Get the stored distances
        full = self.arch.distances["full"]
        # check shortest path between two bits in the architecture
        for root in range(self.n_qubits):
            for v1 in range(root+1):
                for v2 in range(v1, root+1):
                    distance, path = full[root][(v2, v1)]
                    self.assertEqual(distance, len(path))

    def test_upper_shortest_path(self):
        upper = self.arch.distances["upper"]
        for root in range(self.n_qubits):
            for v1 in range(root, self.n_qubits):
                for v2 in range(root, self.n_qubits):
                    distance, path = upper[root][(v1, v2)]
                    self.assertEqual(distance, len(path))

    def test_all_cnots_valid(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                circuit = CNOT_tracker(self.arch.n_qubits)
                matrix = Mat2(np.copy(self.matrix[i]))
                _ = gauss(STEINER_MODE, matrix, architecture=self.arch, full_reduce=True, y=circuit)
                self.assertGates(circuit)

    def do_gauss(self, mode, array, full_reduce=True, with_assert=True):
        circuit = CNOT_tracker(self.arch.n_qubits)
        matrix = Mat2(np.copy(array))
        rank = gauss(mode, matrix, architecture=self.arch, full_reduce=full_reduce, y=circuit)
        with_assert and mode == STEINER_MODE and self.assertGates(circuit)
        with_assert and full_reduce and self.assertCircuitEquivalentNdArr(circuit, array)
        return circuit, matrix, rank

    def test_gauss(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                for full_reduce in [False, True]:
                    matrices = []
                    ranks = []
                    circuits = []
                    for mode in [GAUSS_MODE, STEINER_MODE]:
                        circuit, matrix, rank = self.do_gauss(mode, self.matrix[i], full_reduce=full_reduce, with_assert=True)
                        circuits.append(circuit)
                        ranks.append(rank)
                        matrices.append(matrix.data)
                        full_reduce and self.assertCircuitEquivalent(circuit, self.circuit[i])
                    self.assertEqual(*ranks)
                    if full_reduce:
                        self.assertMat2Equal(*matrices)
                        self.assertCircuitEquivalent(*circuits)
                    else:
                        self.assertMat2Equal(*matrices, triangle=True)

    def test_initial_circuit(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                self.assertCircuitEquivalentNdArr(self.circuit[i], self.matrix[i])

    def reverse_permutation(self, perm):
        return [perm.tolist().index(i) for i in range(len(perm))]

    def do_permutated_gaus(self, array, perm1, perm2, mode=STEINER_MODE, full_reduce=True, with_assert=True):
        with_assert and self.assertIsPerm(perm1)
        with_assert and self.assertIsPerm(perm2)
        reordered_array = array[perm1][:, perm2]
        undo_perm1 = self.reverse_permutation(perm1)
        undo_perm2 = self.reverse_permutation(perm2)
        with_assert and self.assertNdArrEqual(array, reordered_array[undo_perm1][:, undo_perm2])
        circuit, matrix, rank = self.do_gauss(mode, reordered_array, full_reduce=full_reduce, with_assert=with_assert)
        with_assert and self.assertNdArrEqual(circuit.matrix.data[undo_perm1][:, undo_perm2], array)
        return circuit, matrix, rank

    def test_permutated_gauss(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                perm = np.random.permutation(self.n_qubits)
                perm2 = np.random.permutation(self.n_qubits)
                self.do_permutated_gaus(self.matrix[i], perm, perm)
                self.do_permutated_gaus(self.matrix[i], perm, perm2)

    def test_genetic_optimization(self):
        for i in range(1): # Takes too long otherwise
            with self.subTest(i=i):
                population = 50
                crossover_prob = 0.8
                mutate_prob = 0.2
                n_iter = 100
                optimizer = GeneticAlgorithm(population, crossover_prob, mutate_prob, get_gate_count_fitness_func(STEINER_MODE, Mat2(self.matrix[i]), self.arch))
                best_permutation = optimizer.find_optimimum(self.n_qubits, n_iter)
                self.do_permutated_gaus(self.matrix[i], best_permutation, best_permutation)

if __name__ == '__main__':
    unittest.main()