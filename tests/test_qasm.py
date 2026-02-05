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
import os
import sys
from types import ModuleType
from typing import Optional

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
from pyzx.simplify import full_reduce
from pyzx.extract import extract_circuit
from pyzx.circuit import Circuit
from fractions import Fraction

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import compare_tensors
    import math
except ImportError:
    np = None

try:
    from qiskit import quantum_info, transpile
    from qiskit.circuit import QuantumCircuit
    from qiskit.qasm2 import dumps as dumps2
    from qiskit.qasm3 import loads as loads3, dumps as dumps3
except ImportError:
    QuantumCircuit = None


@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestQASM(unittest.TestCase):

    def test_parser_state_reset(self):
        from pyzx.circuit.qasmparser import QASMParser
        s = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        h q[0];
        """
        p = QASMParser()
        c1 = p.parse(s)
        c2 = p.parse(s)
        self.assertEqual(c2.qubits, 1)
        self.assertEqual(len(c2.gates), 1)
        self.assertTrue(c1.verify_equality(c2))

    def test_parse_qasm3(self):
        qasm3 = Circuit.from_qasm("""
        OPENQASM 3;
        include "stdgates.inc";
        qubit[3] q;
        cx q[0], q[1];
        s q[2];
        cx q[2], q[1];
        """)
        c = Circuit(3)
        c.add_gate("CNOT", 0, 1)
        c.add_gate("S", 2)
        c.add_gate("CNOT", 2, 1)
        self.assertEqual(c.qubits, qasm3.qubits)
        self.assertListEqual(c.gates, qasm3.gates)


    def test_parse_qasm3_long_creg(self):
        qasm3 = Circuit.from_qasm("""
        OPENQASM 3;
        include "stdgates.inc";
        qubit[3] q1;
        cx q1[0], q1[1];
        s q1[2];
        cx q1[2], q1[1];
        """)
        c = Circuit(3)
        c.add_gate("CNOT", 0, 1)
        c.add_gate("S", 2)
        c.add_gate("CNOT", 2, 1)
        self.assertEqual(c.qubits, qasm3.qubits)
        self.assertListEqual(c.gates, qasm3.gates)

    def test_load_qasm_from_file(self):
        c = Circuit(1)
        c.add_gate("YPhase", 0, Fraction(1, 4))
        c1 = Circuit.from_qasm_file(os.path.join(os.path.dirname(__file__), "ry.qasm"))
        self.assertEqual(c1.qubits, c.qubits)
        self.assertListEqual(c1.gates,c.gates)

    def test_broadcasting(self):
        """Test that broadcasting is handled correctly.

        If any arguments of a gate are quantum registers instead of qubits, it is a shorthand for broadcasting
        over the qubits of the register."""
        c1 = Circuit.from_qasm("""
        OPENQASM 3;
        include "stdgates.inc";
        qubit[1] q0;
        qubit[3] q1;
        cx q0[0], q1;
        """)
        c2 = Circuit(4)
        c2.add_gate("CNOT", 0, 1)
        c2.add_gate("CNOT", 0, 2)
        c2.add_gate("CNOT", 0, 3)
        self.assertEqual(c1.qubits, c2.qubits)
        self.assertListEqual(c1.gates, c2.gates)

    def test_catch_broadcasting_error(self):
        """Test that all registers are of the same length when broadcasting."""
        with self.assertRaises(TypeError) as context:
            Circuit.from_qasm("""
            OPENQASM 3;
            include "stdgates.inc";
            qubit[1] q0;
            qubit[2] q1;
            qubit[3] q2;
            ccx q0[0], q1, q2;
            """)
        self.assertTrue("Register sizes do not match" in str(context.exception))

    def test_p_same_as_rz(self):
        """Test that the `p` gate is identical to the `rz` gate.

        In the OpenQASM 3 spec, they differ by a global phase. However,
        they are treated in pyzx identically, since the global phase doesn't
        matter.
        """
        p_qasm = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        p(pi/2) q[0];
        """)
        rz_qasm = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        rz(pi/2) q[0];
        """)
        self.assertEqual(p_qasm.qubits, rz_qasm.qubits)
        self.assertListEqual(p_qasm.gates, rz_qasm.gates)

    def test_cp_differs_from_crz(self):
        """Test that the `cp` gate and the `crz` gates are different.

        The difference in phase between `p` and `rz` matters when the gates are
        controlled.
        """
        crz_qasm = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        crz(pi/2) q[0],q[1];
        """)
        cp_qasm = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        cp(pi/2) q[0],q[1];
        """)
        crz_t = crz_qasm.to_matrix()
        cp_t = cp_qasm.to_matrix()
        self.assertFalse(compare_tensors(crz_t, cp_t, False))

    def test_rzz(self):
        """Regression test for issue #158.

        The qiskit transpiler may rewrite `crz` into `rz` and `rzz` in some
        situations. The following circuits should be equivalent."""
        before = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        crz(pi/2) q[0],q[1];
        """)

        after = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        rz(pi/4) q[1];
        rzz(-pi/4) q[0],q[1];
        """)
        self.assertTrue(compare_tensors(
            before.to_matrix(), after.to_matrix(), True))

    def test_custom_gates(self):
        from pyzx.circuit.qasmparser import QASMParser
        s1 = """
        OPENQASM 2.0;
        include "qelib1.inc";
        gate majority a,b,c {
            cx c,b;
            cx c,a;
            ccx a,b,c;
        }
        qreg q[3];
        majority q[0],q[1],q[2];
        """
        s2 = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[3];
        cx q[2],q[1];
        cx q[2],q[0];
        ccx q[0],q[1],q[2];
        """
        p = QASMParser()
        c1 = p.parse(s1)
        c2 = p.parse(s2)
        self.assertEqual(c1.qubits, c2.qubits)
        self.assertListEqual(c1.gates, c2.gates)

    @unittest.skipUnless(QuantumCircuit, "qiskit needs to be installed for this test")
    def test_qasm_qiskit_semantics(self):
        """Verify/document qasm gate semantics when imported into pyzx.

        pyzx's implementation of qasm gates differs from qiskit in global
        phases which are not significant, but which has sometimes led to user
        confusion. This unit test documents those differences.
        """

        def compare_gate_matrix_with_qiskit(gates, num_qubits: int, num_angles: int, qasm_versions=None):
            for gate in gates:
                for qasm_version in qasm_versions if qasm_versions else [2, 3]:
                    header = "OPENQASM 2.0;\ninclude \"qelib1.inc\";\n" if qasm_version == 2 \
                        else "OPENQASM 3;\ninclude \"stdgates.inc\";\n"
                    params = "" if num_angles == 0 else "({})".format(
                        ",".join(["pi/2"] * num_angles))
                    setup = header + f"qreg q[{num_qubits}];\n{gate}{params} "
                    qasm = setup + \
                        ", ".join(
                            [f"q[{i}]" for i in range(num_qubits)]) + ";\n"
                    pyzx_circuit = Circuit.from_qasm(qasm)
                    pyzx_matrix = pyzx_circuit.to_matrix()

                    for g in pyzx_circuit.gates:
                        for b in g.to_basic_gates():
                            self.assertListEqual(b.to_basic_gates(), [b],
                                                 f"\n{gate}.to_basic_gates() contains non-basic gate")

                    # qiskit uses little-endian ordering
                    qiskit_qasm = setup + \
                        ", ".join([f"q[{i}]" for i in reversed(
                            range(num_qubits))]) + ";\n"
                    qc = QuantumCircuit.from_qasm_str(qiskit_qasm) if qasm_version == 2 else loads3(qiskit_qasm)
                    qiskit_matrix = quantum_info.Operator(qc).data

                    # Check that pyzx and qiskit produce the same tensor from the same qasm, modulo qubit endianness.
                    self.assertTrue(compare_tensors(pyzx_matrix, qiskit_matrix, False),
                                    f"Gate: {gate}\nqasm:\n{qasm}\npyzx_matrix:\n{pyzx_matrix}\nqiskit_matrix:\n{qiskit_matrix}")

                    # Check internal round-trip (pyzx to qasm to pyzx) results in the same circuit.
                    qasm_from_pyzx = pyzx_circuit.to_qasm(qasm_version)
                    pyzx_round_trip = Circuit.from_qasm(qasm_from_pyzx)
                    self.assertEqual(pyzx_circuit.qubits, pyzx_round_trip.qubits)
                    self.assertListEqual(pyzx_circuit.gates, pyzx_round_trip.gates)

                    # Check external round-trip (pyzx to qasm to qiskit to qasm to pyzx) results in the same circuit.
                    # Note that the endianness is reversed when going out and again when coming back in, so the overall
                    # result is no change.
                    qiskit_from_qasm = (QuantumCircuit.from_qasm_str(qasm_from_pyzx) if qasm_version == 2
                                        else loads3(qasm_from_pyzx))
                    pyzx_from_qiskit = Circuit.from_qasm(dumps2(qiskit_from_qasm) if qasm_version == 2
                                                         else dumps3(qiskit_from_qasm))
                    self.assertEqual(pyzx_circuit.qubits, pyzx_from_qiskit.qubits)
                    self.assertListEqual(pyzx_circuit.gates, pyzx_from_qiskit.gates)

        # Test standard gates common to both qelib1.inc (OpenQASM 2) and stdgates.inc (OpenQASM 3).
        compare_gate_matrix_with_qiskit(
            ['x', 'y', 'z', 'h', 's', 'sdg', 't', 'tdg', 'sx'], 1, 0)
        compare_gate_matrix_with_qiskit(['u1', 'p', 'rx', 'ry', 'rz'], 1, 1)
        compare_gate_matrix_with_qiskit(['u2'], 1, 2)
        compare_gate_matrix_with_qiskit(['u3'], 1, 3)
        compare_gate_matrix_with_qiskit(
            ['cx', 'CX', 'cy', 'cz', 'ch', 'swap'], 2, 0)
        compare_gate_matrix_with_qiskit(['crx', 'cry', 'crz', 'cp'], 2, 1)
        # 'ccz' not tested because not a standard qasm gate
        compare_gate_matrix_with_qiskit(['ccx', 'cswap'], 3, 0)
        compare_gate_matrix_with_qiskit(['cu'], 2, 4)

        # Test standard gates added to stdgates.inc.
        compare_gate_matrix_with_qiskit(['cphase'], 2, 1, [3])

        # Test standard gates removed from stdgates.inc.
        compare_gate_matrix_with_qiskit(['sxdg'], 1, 0, [2])
        compare_gate_matrix_with_qiskit(['csx'], 2, 0, [2])
        compare_gate_matrix_with_qiskit(['cu1', 'rxx', 'rzz'], 2, 1, [2])
        compare_gate_matrix_with_qiskit(['cu3'], 2, 3, [2])
        compare_gate_matrix_with_qiskit(['u'], 1, 3, [2])

        # Test native OpenQASM 3 gate.
        compare_gate_matrix_with_qiskit(['U'], 1, 3, [3])

    @unittest.skipUnless(QuantumCircuit, "qiskit needs to be installed for this test")
    def test_qiskit_transpile_pyzx_optimization_round_trip(self):
        """Regression test for issue #102.

        Transpile a circuit in qiskit, simplify it using pyzx, and verify that
        it produces the same unitary in qiskit.
        """
        qc = QuantumCircuit(4)
        qc.ccx(2, 1, 0)
        qc.ccz(0, 1, 2)
        qc.h(1)
        qc.ccx(1, 2, 3)
        qc.t(1)
        qc.ccz(0, 1, 2)
        qc.h(1)
        qc.t(0)
        qc.ccz(2, 1, 0)
        qc.s(1)
        qc.ccx(2, 1, 0)
        qc.crz(0.2*np.pi, 0, 1)
        qc.rz(0.8*np.pi, 1)
        qc.cry(0.4*np.pi, 2, 1)
        qc.crx(0.02*np.pi, 2, 0)

        qc1 = transpile(qc)
        t1 = quantum_info.Operator(qc1).data

        # Test round-trip for OpenQASM 2.
        c2 = Circuit.from_qasm(dumps2(qc1))
        g2 = c2.to_graph()
        full_reduce(g2)
        qasm2 = extract_circuit(g2).to_basic_gates().to_qasm(2)

        qc2 = QuantumCircuit().from_qasm_str(qasm2)
        t2 = quantum_info.Operator(qc2).data

        self.assertTrue(compare_tensors(t1, t2))

        # Test round-trip for OpenQASM 3.
        c3 = Circuit.from_qasm(dumps3(qc1))
        g3 = c3.to_graph()
        full_reduce(g3)
        qasm3 = extract_circuit(g3).to_basic_gates().to_qasm(3)

        qc3 = loads3(qasm3)
        t3 = quantum_info.Operator(qc3).data

        self.assertTrue(compare_tensors(t1, t3))

    def test_reset_single_qubit(self):
        """Test that 'reset' command is parsed for a single qubit."""
        from pyzx.circuit.gates import Reset
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        reset q[0];
        h q[0];
        """)
        self.assertEqual(c.qubits, 2)
        self.assertEqual(len(c.gates), 2)
        self.assertIsInstance(c.gates[0], Reset)
        self.assertEqual(c.gates[0].target, 0)

    def test_reset_entire_register(self):
        """Test that 'reset' command broadcasts over entire register."""
        from pyzx.circuit.gates import Reset
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[3];
        reset q;
        """)
        self.assertEqual(c.qubits, 3)
        self.assertEqual(len(c.gates), 3)
        for i, gate in enumerate(c.gates):
            self.assertIsInstance(gate, Reset)
            self.assertEqual(gate.target, i)

    def test_reset_openqasm3(self):
        """Test that 'reset' command works with OpenQASM 3."""
        from pyzx.circuit.gates import Reset
        c = Circuit.from_qasm("""
        OPENQASM 3;
        include "stdgates.inc";
        qubit[2] q;
        reset q[1];
        x q[1];
        """)
        self.assertEqual(c.qubits, 2)
        self.assertEqual(len(c.gates), 2)
        self.assertIsInstance(c.gates[0], Reset)
        self.assertEqual(c.gates[0].target, 1)

    def test_reset_to_graph(self):
        """Test that reset creates appropriate vertices when converted to graph."""
        from pyzx.utils import VertexType
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        reset q[0];
        """)
        g = c.to_graph()

        # Effect vertex: Z spider connected to ground (discard).
        ground_verts = list(g.grounds())
        self.assertEqual(len(ground_verts), 1)
        self.assertEqual(g.type(ground_verts[0]), VertexType.Z)

        # State vertex: X spider phase 0 (|0⟩ preparation).
        x_vertices = [v for v in g.vertices() if g.type(v) == VertexType.X]
        self.assertEqual(len(x_vertices), 1)
        self.assertEqual(g.phase(x_vertices[0]), 0)

    def test_reset_to_graph_has_output(self):
        """Test that a qubit has an output boundary after reset."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        reset q[0];
        h q[0];
        """)
        g = c.to_graph()
        self.assertEqual(len(g.inputs()), 1)
        self.assertEqual(len(g.outputs()), 1)

    def test_measure_reset_has_output(self):
        """Test that a qubit has an output after measure followed by reset."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        creg c[1];
        h q[0];
        measure q[0] -> c[0];
        reset q[0];
        x q[0];
        """)
        g = c.to_graph()
        # 1 qubit + 1 classical bit.
        self.assertEqual(len(g.inputs()), 2)
        # q[0] after reset+x gets output, c[0] gets pass-through output.
        self.assertEqual(len(g.outputs()), 2)

    def test_measure_reset_measure_no_output(self):
        """Test that a qubit ending with measurement has no output boundary."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[1];
        h q[0];
        measure q[0] -> c[0];
        reset q[0];
        h q[0];
        measure q[0] -> c[0];
        """)
        g = c.to_graph()
        # 2 qubits + 1 classical bit.
        self.assertEqual(len(g.inputs()), 3)
        # q[0] ends with a measurement (no output), q[1] and c[0] get outputs.
        self.assertEqual(len(g.outputs()), 2)

    def test_reset_qasm_round_trip(self):
        """Test that reset survives a QASM round-trip."""
        from pyzx.circuit.gates import Reset
        qasm_in = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        h q[0];
        reset q[0];
        cx q[0],q[1];
        """
        c1 = Circuit.from_qasm(qasm_in)
        qasm_out = c1.to_qasm()
        c2 = Circuit.from_qasm(qasm_out)
        self.assertEqual(len(c1.gates), len(c2.gates))
        for g1, g2 in zip(c1.gates, c2.gates):
            self.assertEqual(type(g1), type(g2))
            if isinstance(g1, Reset):
                self.assertEqual(g1.target, g2.target)


    def test_measure_register_broadcast(self):
        """Test that 'measure q -> c' broadcasts over entire register."""
        from pyzx.circuit.gates import Measurement
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[3];
        creg c[3];
        h q[0];
        h q[1];
        h q[2];
        measure q -> c;
        """)
        self.assertEqual(c.qubits, 3)
        self.assertEqual(len(c.gates), 6)
        for i in range(3):
            gate = c.gates[3 + i]
            self.assertIsInstance(gate, Measurement)
            self.assertEqual(gate.target, i)


    def test_graph_to_circuit_reset(self):
        """Test that graph_to_circuit recovers Reset gates."""
        from pyzx.circuit.gates import Reset
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        h q[0];
        reset q[0];
        x q[0];
        """)
        g = c1.to_graph()
        c2 = graph_to_circuit(g)

        # The extracted circuit should contain a Reset gate.
        reset_gates = [gt for gt in c2.gates if isinstance(gt, Reset)]
        self.assertEqual(len(reset_gates), 1)
        self.assertEqual(reset_gates[0].target, 0)


    def test_issue_345_circuit1_measure_reset(self):
        """End-to-end test for issue #345 circuit 1 (Steane code with reset).

        Verifies the full workflow: QASM with measure+reset parses, converts
        to a valid ZX-graph, and round-trips through QASM.
        """
        qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[8];
        creg c[1];
        h q[0];
        cx q[0],q[1];
        cx q[0],q[2];
        cx q[0],q[3];
        cx q[0],q[4];
        h q[0];
        measure q[0] -> c[0];
        reset q[0];
        h q[0];
        cx q[0],q[1];
        cx q[0],q[2];
        cx q[0],q[5];
        cx q[0],q[6];
        h q[0];
        measure q[0] -> c[0];
        reset q[0];
        h q[0];
        cx q[0],q[1];
        cx q[0],q[3];
        cx q[0],q[5];
        cx q[0],q[7];
        h q[0];
        measure q[0] -> c[0];
        """
        # Parse.
        c = Circuit.from_qasm(qasm)
        self.assertEqual(c.qubits, 8)

        # Convert to graph.
        g = c.to_graph()
        # 8 qubits + 1 classical bit.
        self.assertEqual(len(g.inputs()), 9)
        # q[0] ends with measurement (no reset after); 7 qubit + 1 classical output.
        self.assertEqual(len(g.outputs()), 8)

        # QASM round-trip.
        c2 = Circuit.from_qasm(c.to_qasm())
        self.assertEqual(len(c.gates), len(c2.gates))
        for g1, g2 in zip(c.gates, c2.gates):
            self.assertEqual(type(g1), type(g2))

    def test_issue_345_circuit2_ancilla_measure(self):
        """End-to-end test for issue #345 circuit 2 (Steane code, no reset).

        Uses three separate ancilla qubits instead of resetting one qubit.
        Verifies that QASM with multiple registers and measurements parses
        and converts to a valid ZX-graph.
        """
        qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg ancilla[3];
        qreg data[7];
        creg bits[3];
        h ancilla[0];
        cx ancilla[0],data[0];
        cx ancilla[0],data[1];
        cx ancilla[0],data[2];
        cx ancilla[0],data[3];
        h ancilla[0];
        measure ancilla[0] -> bits[0];
        h ancilla[1];
        cx ancilla[1],data[0];
        cx ancilla[1],data[1];
        cx ancilla[1],data[4];
        cx ancilla[1],data[5];
        h ancilla[1];
        measure ancilla[1] -> bits[1];
        h ancilla[2];
        cx ancilla[2],data[0];
        cx ancilla[2],data[2];
        cx ancilla[2],data[4];
        cx ancilla[2],data[6];
        h ancilla[2];
        measure ancilla[2] -> bits[2];
        """
        # Parse.
        c = Circuit.from_qasm(qasm)
        self.assertEqual(c.qubits, 10)

        # Convert to graph.
        g = c.to_graph()
        # 10 qubits + 3 classical bits.
        self.assertEqual(len(g.inputs()), 13)
        # Ancilla qubits 0-2 are measured (no output), data qubits 3-9 and
        # 3 classical bits get outputs.
        self.assertEqual(len(g.outputs()), 10)

        # QASM round-trip.
        c2 = Circuit.from_qasm(c.to_qasm())
        self.assertEqual(len(c.gates), len(c2.gates))
        for g1, g2 in zip(c.gates, c2.gates):
            self.assertEqual(type(g1), type(g2))

    def test_measure_multi_register_offset(self):
        """Measure on a register that is not the first declared uses
        the correct global qubit index."""
        from pyzx.circuit.gates import Measurement
        qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg data[4];
        qreg anc[2];
        creg c[2];
        measure anc[0] -> c[0];
        measure anc[1] -> c[1];
        """
        c = Circuit.from_qasm(qasm)
        measurements = [g for g in c.gates if isinstance(g, Measurement)]
        self.assertEqual(len(measurements), 2)
        # anc[0] is global qubit 4, anc[1] is global qubit 5.
        self.assertEqual(measurements[0].target, 4)
        self.assertEqual(measurements[1].target, 5)

    def test_measure_qasm_round_trip(self):
        """Test that measure survives a QASM round-trip."""
        from pyzx.circuit.gates import Measurement
        qasm_in = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[2];
        h q[0];
        h q[1];
        measure q[0] -> c[0];
        measure q[1] -> c[1];
        """
        c1 = Circuit.from_qasm(qasm_in)
        self.assertEqual(c1.bits, 2)
        qasm_out = c1.to_qasm()
        self.assertIn("creg c[2]", qasm_out)
        c2 = Circuit.from_qasm(qasm_out)
        self.assertEqual(c2.bits, 2)
        self.assertEqual(len(c1.gates), len(c2.gates))
        for g1, g2 in zip(c1.gates, c2.gates):
            self.assertEqual(type(g1), type(g2))
            if isinstance(g1, Measurement):
                self.assertEqual(g1.target, g2.target)

    def test_circuit_bits_from_creg(self):
        """Test that Circuit.bits reflects declared classical registers."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg a[3];
        creg b[2];
        measure q[0] -> a[0];
        measure q[1] -> b[1];
        """)
        self.assertEqual(c.bits, 5)

    def test_measure_undeclared_creg(self):
        """Test that measure into an undeclared classical register raises."""
        with self.assertRaises(TypeError) as ctx:
            Circuit.from_qasm("""
            OPENQASM 2.0;
            include "qelib1.inc";
            qreg q[1];
            measure q[0] -> c[0];
            """)
        self.assertIn("Undeclared classical register", str(ctx.exception))

    def test_measure_creg_index_out_of_range(self):
        """Test that an out-of-range classical index raises."""
        with self.assertRaises(TypeError) as ctx:
            Circuit.from_qasm("""
            OPENQASM 2.0;
            include "qelib1.inc";
            qreg q[1];
            creg c[1];
            measure q[0] -> c[1];
            """)
        self.assertIn("out of range", str(ctx.exception))

    def test_measure_broadcast_undeclared_creg(self):
        """Test that broadcast measure into an undeclared creg raises."""
        with self.assertRaises(TypeError) as ctx:
            Circuit.from_qasm("""
            OPENQASM 2.0;
            include "qelib1.inc";
            qreg q[2];
            measure q -> c;
            """)
        self.assertIn("Undeclared classical register", str(ctx.exception))

    def test_measure_broadcast_creg_too_small(self):
        """Test that broadcast measure into a too-small creg raises."""
        with self.assertRaises(TypeError) as ctx:
            Circuit.from_qasm("""
            OPENQASM 2.0;
            include "qelib1.inc";
            qreg q[3];
            creg c[2];
            measure q -> c;
            """)
        self.assertIn("is larger than", str(ctx.exception))

    def test_classical_bits_in_c_mapper(self):
        """Classical bit labels should be in c_mapper, not q_mapper."""
        from pyzx.circuit.graphparser import circuit_to_graph
        c = Circuit(2, bit_amount=1)
        g = circuit_to_graph(c)
        # 2 quantum inputs + 1 classical input = 3 inputs.
        self.assertEqual(len(g.inputs()), 3)
        # All wires are straight-through, so 3 outputs.
        self.assertEqual(len(g.outputs()), 3)

    def test_classical_bits_output_positions(self):
        """Classical output boundaries should have the right qubit positions."""
        from pyzx.circuit.graphparser import circuit_to_graph
        c = Circuit(2, bit_amount=2)
        g = circuit_to_graph(c)
        self.assertEqual(len(g.inputs()), 4)
        self.assertEqual(len(g.outputs()), 4)
        # Output boundary qubits should be 0, 1, 2, 3.
        output_qubits = sorted(g.qubit(v) for v in g.outputs())
        self.assertEqual(output_qubits, [0, 1, 2, 3])

    def test_measurement_ground_mode_with_result_bit(self):
        """Measurement with result_bit in ground mode should use c_mapper."""
        from pyzx.circuit.gates import Measurement
        from pyzx.circuit.graphparser import circuit_to_graph
        c = Circuit(1, bit_amount=1)
        c.gates = [Measurement(0, result_bit=0)]
        g = circuit_to_graph(c)
        # 1 quantum input + 1 classical input = 2 inputs.
        self.assertEqual(len(g.inputs()), 2)
        # Measurement consumes the qubit (no quantum output), but
        # the classical bit still gets an output boundary.
        self.assertEqual(len(g.outputs()), 1)

    def test_measurement_ground_mode_graph_structure(self):
        """Ground-mode measurement should create correct graph structure."""
        from pyzx.circuit.gates import Measurement
        from pyzx.circuit.graphparser import circuit_to_graph
        from pyzx.utils import VertexType
        c = Circuit(1, bit_amount=1)
        m = Measurement(0, result_bit=0)
        c.gates = [m]
        g = circuit_to_graph(c)
        # Count vertex types.
        types = [g.type(v) for v in g.vertices()]
        n_boundary = types.count(VertexType.BOUNDARY)
        # 1 quantum input + 1 classical input + 1 classical output = 3.
        self.assertEqual(n_boundary, 3)

    def test_measurement_ground_mode_direct(self):
        """Directly test to_graph_ground with c_mapper labels."""
        from pyzx.circuit.gates import Measurement, TargetMapper
        from pyzx.utils import VertexType
        from pyzx.graph import Graph
        g = Graph()
        q_mapper = TargetMapper()
        c_mapper = TargetMapper()
        # Set up one quantum wire and one classical wire.
        q_in = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        c_in = g.add_vertex(VertexType.BOUNDARY, 1, 0)
        q_mapper.add_label(0, 1)
        q_mapper.set_prev_vertex(0, q_in)
        c_mapper.add_label(0, 1)
        c_mapper.set_qubit(0, 1)
        c_mapper.set_prev_vertex(0, c_in)
        # Call to_graph_ground directly.
        m = Measurement(0, result_bit=0)
        m.to_graph_ground(g, q_mapper, c_mapper)
        # Should not crash, and the graph should have vertices.
        self.assertGreater(len(list(g.vertices())), 2)

if __name__ == '__main__':
    unittest.main()
