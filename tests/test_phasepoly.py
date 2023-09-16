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


from typing import List
import unittest
import sys, os

if __name__ == "__main__":
    sys.path.append("..")
    sys.path.append(".")
import numpy as np
from fractions import Fraction

from pyzx.routing import architecture
from pyzx.routing.architecture import create_architecture
from pyzx.routing.cnot_mapper import ElimMode
from pyzx.routing.parity_maps import CNOT_tracker, Parity
from pyzx.linalg import Mat2
from pyzx.routing.phase_poly import PhasePoly
from pyzx.circuit import Circuit, HAD, CNOT, ZPhase, XPhase
from pyzx.tensor import compare_tensors
from pyzx.extract import permutation_as_swaps

SEED = 42


class TestPhasePoly(unittest.TestCase):
    def setUp(self):
        np.random.seed(SEED)

        self.n_tests = 1
        self.n_qubits = 5
        name = architecture.LINE
        self.architecture = create_architecture(name, n_qubits=self.n_qubits)
        # Define some circuits to work with
        folder = "circuits/steiner/" + str(self.n_qubits) + "qubits/"
        try:
            cnot_options = next(os.walk(folder))
        except StopIteration:
            # There are no circuits to test with
            return
        n_cnots = cnot_options[1]
        self.circuit = []
        n_phase_layers = 5
        self.n_phase_layers = n_phase_layers

        def filename():
            return os.path.join(
                *[
                    folder,
                    n_cnots[np.random.choice(len(n_cnots))],
                    "Original" + str(np.random.choice(20)) + ".qasm",
                ]
            )

        for _ in range(self.n_tests):
            c = Circuit.from_qasm_file(filename())
            for _ in range(n_phase_layers):
                for i in range(self.n_qubits):
                    if (
                        np.random.choice(2, p=[0.2, 0.8]) == 1
                    ):  # Pick H gate with chance .2
                        phase = np.random.choice([1, -1]) * Fraction(
                            1, int(np.random.choice([1, 2, 4]))
                        )
                        c.add_gate(ZPhase(target=i, phase=phase))
                    else:
                        c.add_gate(HAD(target=i))
                c.add_circuit(Circuit.from_qasm_file(filename()))
            self.circuit.append(c)

    def assertGates(self, circuit):
        for gate in circuit.gates:
            if hasattr(gate, "name") and gate.name == "CNOT":
                edge = (gate.control, gate.target)
                self.assertTrue(
                    edge in self.architecture.graph.edges()
                    or tuple(reversed(edge)) in self.architecture.graph.edges()
                )

    def assertMat2Equal(self, m1, m2, triangle=False):
        if triangle:
            self.assertListEqual(
                *[
                    [
                        m.data[i, j]
                        for i in range(self.n_qubits)
                        for j in range(self.n_qubits)
                        if i >= j
                    ]
                    for m in [m1, m2]
                ]
            )
        else:
            self.assertNdArrEqual(m1.data, m2.data)

    def assertNdArrEqual(self, a1, a2):
        if isinstance(a1, list):
            if isinstance(a2, list):
                self.assertListEqual(a1, a2)
            else:
                self.assertListEqual(a1, a2.tolist())
        else:
            if isinstance(a2, list):
                self.assertListEqual(a1.tolist(), a2)
            else:
                self.assertListEqual(a1.tolist(), a2.tolist())

    def assertCircuitEquivalent(self, c1, c2):
        the_same = compare_tensors(c1, c2)
        self.assertTrue(the_same)

    def assertPhasePolyEqual(self, p1, p2):
        # self.assertDictEqual(p1.xphases, p2.xphases)
        self.assertDictEqual(p1.zphases, p2.zphases)
        self.assertListEqual(p1.out_par, p2.out_par)

    def assertPartitionEqual(self, sets, partitions: List[List[Parity]]):
        flat_partition = [p for subset in partitions for p in subset]
        # Are all sets partitioned?
        for s in sets:
            self.assertIn(s, flat_partition)
        extra_parities = []
        for p in flat_partition:
            if p not in sets:
                extra_parities.append(p)
        for p in extra_parities:
            self.assertTrue(p.count() == 1)
        # self.assertCountEqual(extra_parities, list(set(extra_parities))) # No duplicates
        # [self.assertIn(p, sets) for p in flat_partition]
        # Is every partition a set of independent parities?
        for pt in partitions:
            self.assertTrue(PhasePoly._independent(pt))

    def assertFinalParityEqual(self, c1, c2):
        old_cnots = CNOT_tracker(c1.qubits)
        new_cnots = CNOT_tracker(c1.qubits)
        for gate in c1.gates:
            if isinstance(gate, CNOT):
                old_cnots.row_add(gate.control, gate.target)
        for gate in c2.gates:
            if isinstance(gate, CNOT):
                new_cnots.row_add(gate.control, gate.target)
        self.assertCircuitEquivalent(old_cnots, new_cnots)
        return old_cnots, new_cnots

    """ Matroid partitioning is not a good algorithm
    def test_partitions(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                circuit = Circuit(self.circuit[i].qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    circuit.add_gate(gate)
                # Check if the phase poly is created properly
                phase_poly = PhasePoly.fromCircuit(circuit)
                # Check the partitions
                partitions = phase_poly.partition(skip_output_parities=False)
                self.assertPartitionEqual(phase_poly.all_parities, partitions)
    """

    def test_phase_poly_parity_creation(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                n_qubits = self.circuit[i].qubits
                circuit = Circuit(n_qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    circuit.add_gate(gate)
                # Check if the phase poly is created properly
                phase_poly = PhasePoly.fromCircuit(circuit)
                old_cnots = CNOT_tracker(n_qubits)
                for gate in circuit.gates:
                    if isinstance(gate, CNOT):
                        old_cnots.row_add(gate.control, gate.target)
                original_out_par = [
                    Parity(row) for row in old_cnots.matrix.data
                ]
                # Check if the output parities are the same
                self.assertListEqual(original_out_par, phase_poly.out_par)

    def test_phase_poly_phase_creation(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                n_qubits = self.circuit[i].qubits
                circuit = Circuit(n_qubits)
                had_phase = False
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    elif isinstance(gate, ZPhase) or isinstance(gate, XPhase):
                        had_phase = True
                    elif had_phase and isinstance(gate, CNOT):
                        break
                    circuit.add_gate(gate)
                # Check if the phase poly is created properly
                phase_poly = PhasePoly.fromCircuit(circuit)
                old_cnots = CNOT_tracker(n_qubits)
                for gate in circuit.gates:
                    if isinstance(gate, CNOT):
                        old_cnots.row_add(gate.control, gate.target)
                original_out_par = [
                    "".join([str(v) for v in row]) for row in old_cnots.matrix.data
                ]
                # Check if the output parities are the same
                self.assertListEqual(original_out_par, phase_poly.out_par)
                # Check if the original phase poly is the same
                phase_poly_parities = list(
                    phase_poly.zphases.keys()
                )  # + list(phase_poly.xphases.keys())
                for parity in phase_poly_parities:
                    # Check  if all phase poly parities are in the original
                    self.assertIn(parity, original_out_par)

    def test_phase_poly_routed(self):
        for i in range(self.n_tests):
            with self.subTest(i=i):
                c = Circuit(self.circuit[i].qubits)
                for gate in self.circuit[i].gates:
                    if isinstance(gate, HAD):
                        break
                    c.add_gate(gate)
                self.do_phase_poly(
                    c.copy(), ElimMode.STEINER_MODE, self.architecture, routed=True
                )

    def do_phase_poly(
        self, circuit, mode, architecture, routed=False, tensor_compare=False
    ):
        phase_poly = PhasePoly.fromCircuit(circuit)
        # TODO: test the other synthesis functions
        # for func in [phase_poly.matroid_synth, phase_poly.gray_synth, phase_poly.rec_gray_synth, phase_poly.Ariannes_synth]:
        for func in [phase_poly.Ariannes_synth]:
            with self.subTest(i=func):
                # Check the synthesized circuit
                new_circuit, initial_perm, output_perm = func(
                    mode=mode, architecture=architecture, full_reduce=True
                )
                if routed:
                    self.assertGates(new_circuit)
                adjusted_circuit = self.apply_perms(
                    new_circuit, initial_perm, output_perm
                )
                new_phase_poly = PhasePoly.fromCircuit(adjusted_circuit)
                # Check if the phasepolys are the same
                self.assertPhasePolyEqual(phase_poly, new_phase_poly)
                self.assertFinalParityEqual(circuit, adjusted_circuit)
                # Check if the circuits are the same
                self.assertCircuitEquivalent(adjusted_circuit, circuit)

    def test_tensor_compare(self):
        n_qubits = 2
        old_qubits = self.n_qubits
        self.n_qubits = n_qubits
        circuit = Circuit(n_qubits)
        n_cnots = 1
        for _ in range(n_cnots):
            circuit.add_gate("CNOT", *np.random.choice(n_qubits, 2, False))
        for i in range(self.n_qubits):
            phase = np.random.choice([1, -1]) * Fraction(
                1, int(np.random.choice([1, 2, 4]))
            )
            circuit.add_gate(ZPhase(target=i, phase=phase))
        for _ in range(n_cnots):
            circuit.add_gate("CNOT", *np.random.choice(n_qubits, 2, False))
        # for i in range(self.n_qubits):
        #    phase = np.random.choice([1,-1])*Fraction(1, int(np.random.choice([1,2,4])))
        #    circuit.add_gate(ZPhase(target=i, phase=phase))
        # for _ in range(n_cnots):
        #    circuit.add_gate("CNOT", *np.random.choice(n_qubits, 2, False))
        self.do_phase_poly(
            circuit.copy(),
            ElimMode.STEINER_MODE,
            None,
            routed=False,
            tensor_compare=True,
        )
        self.n_qubits = old_qubits

    def apply_perms(self, circuit, initial_perm, output_perm):
        adjusted_circuit = Circuit(self.n_qubits)
        # Undo the initial permutation
        for q1, q2 in permutation_as_swaps({v: k for k, v in enumerate(initial_perm)}):
            adjusted_circuit.add_gate(CNOT(q1, q2))
            adjusted_circuit.add_gate(CNOT(q2, q1))
            adjusted_circuit.add_gate(CNOT(q1, q2))
        # Do the circuit
        for gate in circuit.gates:
            adjusted_circuit.add_gate(gate)
        # Realise the output permutation
        for q1, q2 in permutation_as_swaps({k: v for k, v in enumerate(output_perm)}):
            adjusted_circuit.add_gate(CNOT(q1, q2))
            adjusted_circuit.add_gate(CNOT(q2, q1))
            adjusted_circuit.add_gate(CNOT(q1, q2))
        return adjusted_circuit


if __name__ == "__main__":
    print("Testing PhasePoly")
    unittest.main()
