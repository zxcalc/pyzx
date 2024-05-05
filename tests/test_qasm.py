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
    from qiskit.qasm2 import dumps
    from qiskit.qasm3 import loads
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
                    c = Circuit.from_qasm(qasm)
                    pyzx_matrix = c.to_matrix()

                    for g in c.gates:
                        for b in g.to_basic_gates():
                            self.assertListEqual(b.to_basic_gates(), [b],
                                                 f"\n{gate}.to_basic_gates() contains non-basic gate")

                    # qiskit uses little-endian ordering
                    qiskit_qasm = setup + \
                        ", ".join([f"q[{i}]" for i in reversed(
                            range(num_qubits))]) + ";\n"
                    qc = QuantumCircuit.from_qasm_str(
                        qiskit_qasm) if qasm_version == 2 else loads(qiskit_qasm)
                    qiskit_matrix = quantum_info.Operator(qc).data
                    self.assertTrue(compare_tensors(pyzx_matrix, qiskit_matrix, False),
                                    f"Gate: {gate}\nqasm:\n{qasm}\npyzx_matrix:\n{pyzx_matrix}\nqiskit_matrix:\n{qiskit_matrix}")

                    s = c.to_qasm(qasm_version)
                    round_trip = Circuit.from_qasm(s)
                    self.assertEqual(c.qubits, round_trip.qubits)
                    self.assertListEqual(c.gates, round_trip.gates)

        # Test standard gates common to both OpenQASM 2 and 3.
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

        # Test standard gates added to OpenQASM 3.
        compare_gate_matrix_with_qiskit(['cphase'], 2, 1, [3])

        # Test standard gates removed from OpenQASM 3.
        compare_gate_matrix_with_qiskit(['sxdg'], 1, 0, [2])
        compare_gate_matrix_with_qiskit(['csx'], 2, 0, [2])
        compare_gate_matrix_with_qiskit(['cu1', 'rxx', 'rzz'], 2, 1, [2])
        compare_gate_matrix_with_qiskit(['cu3'], 2, 3, [2])

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

        c = Circuit.from_qasm(dumps(qc1))
        g = c.to_graph()
        full_reduce(g)
        qasm = extract_circuit(g).to_basic_gates().to_qasm()

        qc2 = QuantumCircuit().from_qasm_str(qasm)
        t2 = quantum_info.Operator(qc2).data

        self.assertTrue(compare_tensors(t1, t2))


if __name__ == '__main__':
    unittest.main()
