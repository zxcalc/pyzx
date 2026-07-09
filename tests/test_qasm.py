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
from pyzx.simplify import full_reduce, drop_orphan_reset_discards
from pyzx.extract import extract_circuit
from pyzx.circuit import Circuit
from pyzx.symbolic import Poly
from pyzx.utils import VertexType
from fractions import Fraction
from tests import (
    STEANE_X_STABILISER_QASM,
    discard_leaves,
    prep_leaves,
    measurement_leaves,
)

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

stim: Optional[ModuleType]
try:
    import stim  # type: ignore[no-redef,import]
except ImportError:
    stim = None


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

    def test_custom_gates_with_parameters(self):
        """A parametrised custom gate is instantiated by binding its argument.

        Regression test for issue #469.
        """
        from pyzx.circuit.qasmparser import QASMParser
        s1 = """
        OPENQASM 2.0;
        include "qelib1.inc";
        gate phase_kick(theta) q {
            rz(theta) q;
            x q;
            rz(-theta) q;
            x q;
        }
        qreg q[3];
        phase_kick(pi/4) q[2];
        """
        s2 = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[3];
        rz(pi/4) q[2];
        x q[2];
        rz(-pi/4) q[2];
        x q[2];
        """
        p = QASMParser()
        c1 = p.parse(s1)
        c2 = p.parse(s2)
        self.assertEqual(c1.qubits, c2.qubits)
        self.assertListEqual(c1.gates, c2.gates)

    def test_custom_gates_with_multiple_parameters(self):
        """A custom gate with several parameters and a linear body expression."""
        from pyzx.circuit.qasmparser import QASMParser
        s1 = """
        OPENQASM 2.0;
        include "qelib1.inc";
        gate mygate(a, b) p, q {
            rz(a) p;
            rx(2*b) q;
            cx p, q;
        }
        qreg r[2];
        mygate(pi/4, pi/8) r[0], r[1];
        """
        s2 = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg r[2];
        rz(pi/4) r[0];
        rx(pi/4) r[1];
        cx r[0], r[1];
        """
        p = QASMParser()
        c1 = p.parse(s1)
        c2 = p.parse(s2)
        self.assertListEqual(c1.gates, c2.gates)

    def test_custom_gate_with_divided_parameter(self):
        """A parametrised custom gate whose body divides a parameter."""
        from pyzx.circuit.qasmparser import QASMParser
        s1 = """
        OPENQASM 2.0;
        include "qelib1.inc";
        gate halfrot(theta) q {
            rz(theta/2) q;
        }
        qreg q[1];
        halfrot(pi/2) q[0];
        """
        s2 = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        rz(pi/4) q[0];
        """
        p = QASMParser()
        c1 = p.parse(s1)
        c2 = p.parse(s2)
        self.assertListEqual(c1.gates, c2.gates)

    def test_custom_gate_parameter_count_mismatch(self):
        """Calling a parametrised custom gate with the wrong arity errors."""
        from pyzx.circuit.qasmparser import QASMParser
        s = """
        OPENQASM 2.0;
        include "qelib1.inc";
        gate phase_kick(theta) q {
            rz(theta) q;
        }
        qreg q[1];
        phase_kick(pi/4, pi/2) q[0];
        """
        with self.assertRaises(TypeError):
            QASMParser().parse(s)

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
        """Smoke test: the QASM ``reset`` parser path emits the same
        discard+prep structure as the ``Reset`` gate API.

        Detailed structural assertions live in
        ``test_init_postselect.TestReset.test_to_graph``; this test
        only verifies the QASM entry point produces a discard leaf
        and a prep leaf.
        """
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        reset q[0];
        """)
        g = c.to_graph(elide_initial_resets=False)
        self.assertEqual(len(discard_leaves(g)), 1)
        self.assertEqual(len(prep_leaves(g)), 1)

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

    def test_elide_initial_resets_toggle(self):
        """``elide_initial_resets`` controls emission of the discard
        chain for leading resets on unmodified input wires.

        With elision off, both reset-discard and reset-state leaves
        are emitted (one of each per leading reset). With elision on,
        neither appears, no ``_rN`` symbolic phases survive anywhere,
        and inputs are preserved with no extra "inner" boundaries.

        This is a structural test only: it does not exercise the
        OpenQASM-style implicit |0⟩ semantics that justify enabling
        the flag (which would require ``Circuit.initialize_qubits`` /
        ``Graph.apply_state`` to fix the input as |0⟩).
        """
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        reset q[0];
        reset q[1];
        h q[0];
        """)
        g_keep = c.to_graph(elide_initial_resets=False)
        g_elide = c.to_graph(elide_initial_resets=True)

        # Elision off: one discard + one prep leaf per leading reset.
        self.assertEqual(len(discard_leaves(g_keep)), 2)
        self.assertEqual(len(prep_leaves(g_keep)), 2)

        # Elision on: no chain leaves, no `_rN` phases, fewer vertices.
        self.assertLess(g_elide.num_vertices(), g_keep.num_vertices())
        self.assertEqual(discard_leaves(g_elide), [])
        self.assertEqual(prep_leaves(g_elide), [])
        for v in g_elide.vertices():
            p = g_elide.phase(v)
            if isinstance(p, Poly):
                self.assertNotIn('_r', str(p))

        # Inputs are preserved with no inner BOUNDARY vertices.
        self.assertEqual(len(g_elide.inputs()), 2)
        boundaries = [v for v in g_elide.vertices()
                      if g_elide.type(v) == VertexType.BOUNDARY]
        self.assertEqual(len(boundaries),
                         len(g_elide.inputs()) + len(g_elide.outputs()))

    def test_initial_reset_elided_mid_circuit_kept(self):
        """With ``elide_initial_resets=True`` the initial reset is elided,
        but a subsequent mid-circuit reset (after intervening gates)
        still emits its ``_rN`` discard leaf."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        reset q[0];
        h q[0];
        reset q[0];
        """)
        g = c.to_graph(elide_initial_resets=True)

        # Exactly one reset-discard leaf survives (the mid-circuit one).
        self.assertEqual(len(discard_leaves(g)), 1)

    def test_drop_orphan_reset_discards_removes_leading_chains(self):
        """``drop_orphan_reset_discards`` removes the
        ``boundary -- Z(0) -- X(_rN)`` orphan components that
        ``elide_initial_resets=False`` leaves behind."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[3];
        reset q[0];
        reset q[1];
        reset q[2];
        h q[0];
        cx q[0], q[1];
        cx q[0], q[2];
        """)
        g = c.to_graph(elide_initial_resets=False)
        before_inputs = len(g.inputs())
        self.assertEqual(len(discard_leaves(g)), 3)

        removed = drop_orphan_reset_discards(g)
        self.assertEqual(removed, 3)
        self.assertEqual(len(g.inputs()), before_inputs - 3)

        # No reset-discard leaves left.
        self.assertEqual(discard_leaves(g), [])
        # No symbolic _rN phases left anywhere.
        for v in g.vertices():
            p = g.phase(v)
            if isinstance(p, Poly):
                self.assertNotIn('_r', str(p))
        # The associated _rN names are also gone from the registry.
        self.assertFalse(
            any(name.startswith('_r') for name in g.var_registry.vars()))

    def test_drop_orphan_reset_discards_matches_apply_state(self):
        """After cleanup, the non-elided graph's tensor matches the
        elided graph with |0⟩ applied to each leading-reset input,
        including the global scalar."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        reset q[0];
        reset q[1];
        h q[0];
        cx q[0], q[1];
        """)
        g_keep = c.to_graph(elide_initial_resets=False)
        drop_orphan_reset_discards(g_keep)

        g_elide = c.to_graph(elide_initial_resets=True)
        g_elide.apply_state('00')

        self.assertTrue(compare_tensors(g_keep, g_elide, preserve_scalar=True))

    def test_drop_orphan_reset_discards_preserves_mid_circuit(self):
        """Mid-circuit reset discards are not orphans and must be kept."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        reset q[0];
        h q[0];
        reset q[0];
        h q[0];
        """)
        g = c.to_graph(elide_initial_resets=False)
        removed = drop_orphan_reset_discards(g)
        # Only the leading reset is an orphan; the mid-circuit reset is
        # connected to the live wire and must remain.
        self.assertEqual(removed, 1)
        self.assertEqual(len(discard_leaves(g)), 1)

    def test_drop_orphan_reset_discards_no_op_when_elided(self):
        """Cleanup is a no-op when there are no orphan components."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        reset q[0];
        reset q[1];
        h q[0];
        cx q[0], q[1];
        """)
        g = c.to_graph(elide_initial_resets=True)
        before = (g.num_vertices(), g.num_edges(), len(g.inputs()))
        removed = drop_orphan_reset_discards(g)
        after = (g.num_vertices(), g.num_edges(), len(g.inputs()))
        self.assertEqual(removed, 0)
        self.assertEqual(before, after)

    def test_drop_orphan_reset_discards_keeps_var_used_in_z_box_label(self):
        """If a ``_rN`` is also referenced by a Z-box label, the orphan
        must be preserved so the variable is not deleted from the
        registry while still in use."""
        from pyzx.symbolic import Term
        from pyzx.utils import set_z_box_label
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        reset q[0];
        h q[0];
        """)
        g = c.to_graph(elide_initial_resets=False)
        # Find the orphan's `_rN` Var and reuse it on a Z_BOX label.
        discards = discard_leaves(g)
        self.assertEqual(len(discards), 1)
        phase = g.phase(discards[0])
        assert isinstance(phase, Poly)
        orphan_var = next(iter(phase.free_vars()))
        zbox = g.add_vertex(VertexType.Z_BOX, 0, 100)
        set_z_box_label(g, zbox, Poly([(1, Term([(orphan_var, 1)]))]))

        before_vars = set(g.var_registry.vars())
        removed = drop_orphan_reset_discards(g)
        self.assertEqual(removed, 0)
        self.assertIn(orphan_var.name, g.var_registry.vars())
        self.assertEqual(set(g.var_registry.vars()), before_vars)

    def test_drop_orphan_reset_discards_after_full_reduce_steane(self):
        """End-to-end: cleanup must work after ``full_reduce`` on the
        Steane X-stabiliser circuit.

        ``full_reduce`` rewrites the leading
        ``boundary -- Z(0) -- X(_rN)`` orphan chain into
        ``boundary -[H]- Z(_rN)`` (X-leaf flipped to Z-leaf, Z(0)
        identity removed). The matcher must recognise this collapsed
        shape, otherwise the orphans remain after cleanup. Mid-circuit
        reset discards (already absorbed by ``full_reduce`` into the
        live graph) must not be touched.

        Equivalence is asserted by comparing the post-``full_reduce``
        cleanup against running the cleanup before ``full_reduce``,
        with classical-outcome variables frozen to ``0`` so the result
        is a numerical tensor.
        """
        # Prepend leading resets on all 8 qubits to the shared Steane
        # X-stabiliser fixture (which itself emits no leading resets).
        steane_qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[8];
        creg c[3];
        reset q[0]; reset q[1]; reset q[2]; reset q[3];
        reset q[4]; reset q[5]; reset q[6]; reset q[7];
        """ + "\n".join(
            line for line in STEANE_X_STABILISER_QASM.splitlines()
            if line.strip() and not line.strip().startswith((
                'OPENQASM', 'include', 'qreg', 'creg'))
        )
        c = Circuit.from_qasm(steane_qasm)

        # Chain emitted, full_reduce, then cleanup.
        g_after = c.to_graph(elide_initial_resets=False)
        full_reduce(g_after)
        # 8 leading reset_discard leaves survive full_reduce; the 3
        # mid-circuit ones are absorbed by full_reduce.
        self.assertEqual(len(discard_leaves(g_after)), 8)
        removed = drop_orphan_reset_discards(g_after)
        self.assertEqual(removed, 8,
            "cleanup must remove all 8 leading orphans after full_reduce")
        self.assertEqual(discard_leaves(g_after), [])
        # 8 leading qreg input boundaries gone; 3 classical-bit inputs remain.
        self.assertEqual(len(g_after.inputs()), 3)
        # All ``_rN`` variables associated with the leading resets must be
        # gone from the registry; any ``_rN`` absorbed into nearby phases
        # by full_reduce stays in the registry but never appears as a
        # discard leaf.
        leading_var_names = {f'_r{i}' for i in range(8)}
        self.assertFalse(
            leading_var_names.intersection(g_after.var_registry.vars()))

        # Cleanup before full_reduce: must produce the same tensor.
        g_before = c.to_graph(elide_initial_resets=False)
        drop_orphan_reset_discards(g_before)
        full_reduce(g_before)

        # Freeze classical outcome variables so tensors are numerical.
        def freeze_classical(g):
            var_map = {}
            for v in g.vertices():
                p = g.phase(v)
                if isinstance(p, Poly):
                    for fv in p.free_vars():
                        var_map[fv.name] = Fraction(0)
            for fv in g.scalar.free_vars():
                var_map[fv.name] = Fraction(0)
            if var_map:
                g.substitute_variables(var_map, in_place=True)

        freeze_classical(g_after)
        freeze_classical(g_before)
        self.assertTrue(
            compare_tensors(g_after, g_before, preserve_scalar=True),
            "post-full_reduce cleanup must produce same tensor as "
            "pre-full_reduce cleanup")

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

    def test_reset_circuit_tensorize(self):
        """Tensor extraction must produce ``H |0⟩⟨0| H`` for
        ``HAD - Reset - HAD`` once the reset's ``_rN`` is fixed to 0.

        Substituting ``_r=0`` selects the |0⟩-outcome branch, so the
        whole circuit collapses to a rank-1 outer product proportional
        to |+⟩⟨+|; pyzx's tensor convention leaves the ``[[1,1],[1,1]]``
        scalar.
        """
        from pyzx.circuit.gates import Reset, HAD
        c = Circuit(1)
        c.gates = [HAD(0), Reset(0), HAD(0)]
        g = c.to_graph()
        # tensorfy rejects symbolic phases, so substitute the reset's
        # _rN boolean to a concrete value first.
        for v in list(g.vertices()):
            p = g.phase(v)
            if hasattr(p, 'terms'):
                g.set_phase(v, Fraction(0))
        t = g.to_tensor()
        expected = np.array([[1, 1], [1, 1]], dtype=complex)
        np.testing.assert_allclose(t, expected, atol=1e-9)


    def test_measure_reset_graph_round_trip(self):
        """Test that measure+reset survives a circuit-graph-circuit round-trip."""
        from pyzx.circuit.gates import Measurement, Reset
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[1];
        h q[0];
        cx q[0], q[1];
        measure q[0] -> c[0];
        reset q[0];
        h q[0];
        """)
        g = c1.to_graph()

        # Verify vdata tags on the intermediate graph.
        self.assertEqual(len(measurement_leaves(g)), 1)
        self.assertEqual(len(discard_leaves(g)), 1)

        c2 = graph_to_circuit(g)

        # Classical-bit boundaries must not inflate the qubit count.
        self.assertEqual(c2.qubits, c1.qubits)

        measurements = [gt for gt in c2.gates if isinstance(gt, Measurement)]
        resets = [gt for gt in c2.gates if isinstance(gt, Reset)]
        self.assertEqual(len(measurements), 1)
        self.assertEqual(measurements[0].target, 0)
        self.assertEqual(measurements[0].result_symbol, "c[0]")
        self.assertEqual(len(resets), 1)
        self.assertEqual(resets[0].target, 0)

    def test_empty_circuit_with_creg_qubit_count(self):
        """An empty circuit with both ``qreg`` and ``creg`` round-trips
        without inflating the extracted qubit count.

        With no non-boundary vertices, ``graph_to_circuit`` falls back
        to counting input boundaries; classical-bit boundaries tagged
        via ``vdata('is_classical')`` must be excluded.
        """
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[3];
        """)
        g = c1.to_graph()
        c2 = graph_to_circuit(g)
        self.assertEqual(c2.qubits, c1.qubits)

    def test_identity_wire_qubit_count(self):
        """A circuit with an identity-only quantum wire round-trips
        without dropping the unused qubit.

        ``graph_to_circuit`` must consider non-classical boundary
        vertices when deriving the qubit count; otherwise an untouched
        highest-index qubit (e.g. ``q[1]`` in a 2-qubit circuit with a
        single gate on ``q[0]``) would be missing from the extracted
        circuit.
        """
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        rx(pi/2) q[0];
        """)
        g = c1.to_graph()
        c2 = graph_to_circuit(g)
        self.assertEqual(c2.qubits, c1.qubits)

    def test_reset_var_avoids_existing_name(self):
        """``circuit_to_graph`` must allocate ``_rN`` reset variable
        names that do not collide with names already in the graph's
        variable registry.

        If the circuit already contains a measurement or other phase
        using ``_r0``, the reset variable counter must skip past it;
        otherwise the reset outcome would alias the existing variable,
        change semantics, and confuse
        :func:`drop_orphan_reset_discards`, which assumes the reset
        variable is unique to its orphan leaf.
        """
        from pyzx.circuit.gates import Measurement, Reset
        from pyzx.circuit.graphparser import circuit_to_graph
        # A measurement registers its ``result_symbol`` as a Boolean
        # variable in ``g.var_registry``. Pick the same name the reset
        # counter would otherwise use first, to prove the counter
        # skips past it.
        c = Circuit(1, bit_amount=1)
        c.gates = [
            Measurement(0, result_symbol='_r0'),
            Reset(0),
        ]
        g = circuit_to_graph(c)
        names = g.var_registry.vars()
        self.assertIn('_r0', names)
        self.assertIn('_r1', names)
        # The reset-discard leaf phase must be ``_r1``, not ``_r0``.
        from tests import discard_leaves
        leaves = discard_leaves(g)
        self.assertEqual(len(leaves), 1)
        leaf_phase = g.phase(leaves[0])
        self.assertEqual(str(leaf_phase), '_r1',
            "reset variable aliased the existing _r0 phase")

    def test_discardbit_does_not_inflate_qubit_count(self):
        """A circuit with ``DiscardBit`` (which creates Z/X internal
        vertices on the classical-bit wire) must round-trip without
        inflating the extracted qubit count, and must not emit
        spurious quantum gates on the classical-wire qubit indices.
        """
        from pyzx.circuit.gates import DiscardBit, InitAncilla
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[1];
        h q[0];
        measure q[0] -> c[0];
        """)
        c1.gates.append(DiscardBit(0))
        g = c1.to_graph()
        c2 = graph_to_circuit(g)
        self.assertEqual(c2.qubits, c1.qubits,
            "DiscardBit's classical-wire vertices inflated qubit count")
        # Should not emit InitAncilla on a classical-wire qubit index.
        bogus = [gt for gt in c2.gates
                 if isinstance(gt, InitAncilla) and gt.label >= c1.qubits]
        self.assertEqual(bogus, [],
            "DiscardBit's classical-wire X(0) was mis-extracted as a "
            "quantum InitAncilla")

    def test_postselect_qubits_targets_outcome_leaf(self):
        """``postselect_qubits`` must fix the symbolic measurement
        outcome by setting the phase on the X-leaf (where the outcome
        symbol lives), not on the on-wire Z(0) measurement spider."""
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        creg c[1];
        h q[0];
        measure q[0] -> c[0];
        """)
        c.postselect_qubits([1])
        g = c.to_graph()

        # The on-wire Z(0) measurement spider must keep phase 0;
        # the postselect value lives on the tagged X-leaf.
        leaves = measurement_leaves(g)
        self.assertEqual(len(leaves), 1)
        leaf = leaves[0]
        self.assertEqual(g.phase(leaf), 1,
            "postselect_qubits did not fix the X-leaf outcome phase")
        # The leaf's on-wire Z(0) parent should still be Z(0), not Z(1).
        z_parents = [n for n in g.neighbors(leaf)
                     if g.type(n) == VertexType.Z]
        self.assertEqual(len(z_parents), 1)
        self.assertEqual(g.phase(z_parents[0]), 0,
            "postselect_qubits incorrectly set the on-wire Z spider phase")

    def test_outcome_tags_respected_after_substitution(self):
        """Tagged outcome leaves round-trip even after the Poly phase
        on the leaf has been substituted to a concrete value.

        ``graph_to_circuit`` must consult the ``outcome_type`` vdata
        before falling back to phase-shape extraction; otherwise a
        substituted ``_rN=1`` reset-discard leaf would be mis-extracted
        as a ``NOT`` gate, and a substituted measurement leaf would
        stop round-tripping as ``Measurement``.
        """
        from pyzx.circuit.gates import Measurement, Reset
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        creg c[1];
        h q[0];
        measure q[0] -> c[0];
        reset q[0];
        h q[0];
        """)
        g = c1.to_graph()

        # Substitute every symbolic phase to 1, so reset_discard and
        # measurement leaves both have phase 1 (which would otherwise
        # match the X(1) -> NOT extraction rule).
        for v in list(g.vertices()):
            p = g.phase(v)
            if hasattr(p, 'terms'):
                g.set_phase(v, Fraction(1))

        c2 = graph_to_circuit(g)
        # No spurious NOT gate from the substituted leaves.
        not_gates = [gt for gt in c2.gates if type(gt).__name__ == 'NOT']
        self.assertEqual(not_gates, [],
            "tagged leaves were mis-extracted as NOT after substitution")
        # Reset and Measurement still recovered with the correct
        # classical destination (read from vdata, not from the
        # substituted phase, which would otherwise yield "1").
        self.assertEqual(
            len([gt for gt in c2.gates if isinstance(gt, Reset)]), 1)
        measurements = [gt for gt in c2.gates if isinstance(gt, Measurement)]
        self.assertEqual(len(measurements), 1)
        self.assertEqual(measurements[0].result_symbol, "c[0]")

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

    def test_steane_encoding_stabiliser_measurement(self):
        """Steane code X-stabiliser measurement circuit.

        8 qubits (7 data + 1 ancilla), 3 classical bits, using resets and
        measurements but no feedforward.

        See diagram: https://github.com/zxcalc/pyzx/pull/403#issuecomment-3970410722
        Code from: https://github.com/tqec/tqec/blob/steane-code-demo/examples/pyzx-steane/steane_code.qasm
        """
        from pyzx.circuit.gates import Measurement, Reset

        qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[8];
        creg c[3];
        reset q[0];
        reset q[1];
        reset q[2];
        reset q[3];
        reset q[4];
        reset q[5];
        reset q[6];
        reset q[7];
        h q[0];
        cx q[0], q[1];
        cx q[0], q[2];
        cx q[0], q[3];
        cx q[0], q[4];
        h q[0];
        measure q[0] -> c[0];
        reset q[0];
        h q[0];
        cx q[0], q[1];
        cx q[0], q[2];
        cx q[0], q[5];
        cx q[0], q[6];
        h q[0];
        measure q[0] -> c[1];
        reset q[0];
        h q[0];
        cx q[0], q[1];
        cx q[0], q[3];
        cx q[0], q[5];
        cx q[0], q[7];
        h q[0];
        measure q[0] -> c[2];
        """

        c = Circuit.from_qasm(qasm)
        self.assertEqual(c.qubits, 8)

        measurements = [g for g in c.gates if isinstance(g, Measurement)]
        resets = [g for g in c.gates if isinstance(g, Reset)]
        # 8 initial resets + 2 mid-circuit resets (between stabiliser rounds).
        self.assertEqual(len(resets), 10)
        self.assertEqual(len(measurements), 3)

        # Convert to graph.
        g = c.to_graph()
        # 8 qubit inputs + 3 classical inputs = 11.
        self.assertEqual(len(g.inputs()), 11)
        # 7 data qubit outputs + 3 classical outputs = 10.
        # (q[0] is consumed by the final measurement, so no output for it.)
        self.assertEqual(len(g.outputs()), 10)

        # QASM round-trip.
        qasm_out = c.to_qasm()
        c2 = Circuit.from_qasm(qasm_out)
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

    def test_measure_graph_json_round_trip(self):
        """Test that measurement phases survive a graph JSON round-trip.

        Measurement gates produce symbolic Poly phases like c[0] which
        must be correctly serialised and deserialised by the JSON layer.
        """
        from pyzx.graph.jsonparser import graph_to_json, json_to_graph
        from pyzx.symbolic import Poly

        qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[2];
        h q[0];
        h q[1];
        measure q[0] -> c[0];
        measure q[1] -> c[1];
        """
        g1 = Circuit.from_qasm(qasm).to_graph()

        # Collect the symbolic phases before the round-trip.
        poly_phases_before = {
            v: g1.phase(v) for v in g1.vertices()
            if isinstance(g1.phase(v), Poly) and g1.phase(v) != 0
        }
        self.assertTrue(len(poly_phases_before) > 0,
                        "Graph should contain at least one Poly phase")

        # Round-trip through JSON.
        g2 = json_to_graph(graph_to_json(g1))

        # The round-tripped graph must have the same number of vertices,
        # edges, and matching Poly phase strings.
        self.assertEqual(g1.num_vertices(), g2.num_vertices())
        self.assertEqual(g1.num_edges(), g2.num_edges())

        poly_phases_after = {
            v: g2.phase(v) for v in g2.vertices()
            if isinstance(g2.phase(v), Poly) and g2.phase(v) != 0
        }
        self.assertEqual(
            {v: str(p) for v, p in poly_phases_before.items()},
            {v: str(p) for v, p in poly_phases_after.items()})

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

    def test_parse_if_single_bit(self):
        """Test parsing a single-bit conditional gate."""
        from pyzx.circuit.gates import ConditionalGate, NOT
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        creg c[1];
        if(c==1) x q[0];
        """)
        self.assertEqual(len(c.gates), 1)
        gate = c.gates[0]
        self.assertIsInstance(gate, ConditionalGate)
        self.assertEqual(gate.condition_register, "c")
        self.assertEqual(gate.condition_value, 1)
        self.assertIsInstance(gate.inner_gate, NOT)
        self.assertEqual(gate.inner_gate.target, 0)
        self.assertEqual(gate.register_size, 1)

    def test_parse_if_multi_bit(self):
        """Test parsing a conditional gate with a multi-bit register."""
        from pyzx.circuit.gates import ConditionalGate, ZPhase
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        creg c[3];
        if(c==5) rz(pi) q[0];
        """)
        self.assertEqual(len(c.gates), 1)
        gate = c.gates[0]
        self.assertIsInstance(gate, ConditionalGate)
        self.assertEqual(gate.condition_register, "c")
        self.assertEqual(gate.condition_value, 5)
        self.assertIsInstance(gate.inner_gate, ZPhase)
        self.assertEqual(gate.register_size, 3)

    def test_parse_if_zero_condition(self):
        """Test parsing if (c == 0), which negates all bits."""
        from pyzx.circuit.gates import ConditionalGate
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        creg c[2];
        if(c==0) z q[0];
        """)
        self.assertEqual(len(c.gates), 1)
        gate = c.gates[0]
        self.assertIsInstance(gate, ConditionalGate)
        self.assertEqual(gate.condition_value, 0)
        self.assertEqual(gate.register_size, 2)

    def test_conditional_gate_to_graph_z(self):
        """Test that a conditional Z gate creates a vertex with symbolic boolean phase."""
        from pyzx.circuit.gates import ConditionalGate, Measurement, Z
        from pyzx.symbolic import Poly
        c = Circuit(1)
        c.gates = [
            Measurement(0, result_symbol="c[0]"),
            ConditionalGate("c", 1, Z(0), 1),
        ]
        g = c.to_graph()
        # Find vertices with symbolic phases.
        sym_verts = [v for v in g.vertices() if isinstance(g.phase(v), Poly)]
        # Should have at least 2: the measurement outcome and the conditional gate.
        self.assertGreaterEqual(len(sym_verts), 2)

    def test_conditional_gate_to_graph_negated(self):
        """Test that if(c==0) round-trips through graph extraction."""
        from pyzx.circuit.gates import ConditionalGate, Z
        from pyzx.circuit.graphparser import graph_to_circuit
        from pyzx.symbolic import Poly
        c1 = Circuit(1)
        c1.gates = [ConditionalGate("c", 0, Z(0), 1)]
        g = c1.to_graph()
        sym_verts = [v for v in g.vertices() if isinstance(g.phase(v), Poly)]
        self.assertEqual(len(sym_verts), 1)
        # Extract back and verify the condition is recovered.
        c2 = graph_to_circuit(g)
        cond_gates = [gt for gt in c2.gates if isinstance(gt, ConditionalGate)]
        self.assertEqual(len(cond_gates), 1)
        self.assertEqual(cond_gates[0].condition_register, "c")
        self.assertEqual(cond_gates[0].condition_value, 0)

    def test_conditional_gate_multi_bit_graph_extraction(self):
        """Test that multi-bit Z conditions (including 0-bits) round-trip through graph."""
        from pyzx.circuit.gates import ConditionalGate, Z
        from pyzx.circuit.graphparser import graph_to_circuit
        # if(c==1) with a 2-bit register: bit 0 set, bit 1 clear.
        c1 = Circuit(1)
        c1.gates = [ConditionalGate("c", 1, Z(0), 2)]
        g = c1.to_graph()
        c2 = graph_to_circuit(g)
        cond_gates = [gt for gt in c2.gates if isinstance(gt, ConditionalGate)]
        self.assertEqual(len(cond_gates), 1)
        self.assertEqual(cond_gates[0].condition_value, 1)
        self.assertEqual(cond_gates[0].register_size, 2)
        # if(c==0) with a 2-bit register: both bits clear.
        c3 = Circuit(1)
        c3.gates = [ConditionalGate("c", 0, Z(0), 2)]
        g = c3.to_graph()
        c4 = graph_to_circuit(g)
        cond_gates = [gt for gt in c4.gates if isinstance(gt, ConditionalGate)]
        self.assertEqual(len(cond_gates), 1)
        self.assertEqual(cond_gates[0].condition_value, 0)
        self.assertEqual(cond_gates[0].register_size, 2)

    def test_conditional_gate_qasm_round_trip(self):
        """Test that conditional gates survive a QASM round-trip."""
        from pyzx.circuit.gates import ConditionalGate
        qasm_in = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[1];
        h q[0];
        measure q[0] -> c[0];
        if(c==1) x q[1];
        """
        c1 = Circuit.from_qasm(qasm_in)
        qasm_out = c1.to_qasm()
        self.assertIn("if(c==1)", qasm_out)
        self.assertIn("creg c[1]", qasm_out)
        c2 = Circuit.from_qasm(qasm_out)
        self.assertEqual(len(c1.gates), len(c2.gates))
        for g1, g2 in zip(c1.gates, c2.gates):
            self.assertEqual(type(g1), type(g2))

    def test_conditional_gate_graph_extraction(self):
        """Test that a conditional gate round-trips through the graph."""
        from pyzx.circuit.gates import ConditionalGate, Z
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit(1)
        c1.gates = [ConditionalGate("c", 1, Z(0), 1)]
        g = c1.to_graph()
        c2 = graph_to_circuit(g)
        cond_gates = [gt for gt in c2.gates if isinstance(gt, ConditionalGate)]
        self.assertEqual(len(cond_gates), 1)
        self.assertEqual(cond_gates[0].condition_register, "c")
        self.assertEqual(cond_gates[0].condition_value, 1)

    def test_conditional_gate_x_type_graph_extraction(self):
        """Test that conditional X-type gates (NOT, XPhase) round-trip through the graph."""
        from pyzx.circuit.gates import ConditionalGate, NOT, XPhase
        from pyzx.circuit.graphparser import graph_to_circuit
        # Conditional NOT: phase 1 should recover as NOT.
        c1 = Circuit(1)
        c1.gates = [ConditionalGate("c", 1, NOT(0), 1)]
        g = c1.to_graph()
        c2 = graph_to_circuit(g)
        cond_gates = [gt for gt in c2.gates if isinstance(gt, ConditionalGate)]
        self.assertEqual(len(cond_gates), 1)
        self.assertEqual(cond_gates[0].condition_register, "c")
        self.assertEqual(cond_gates[0].condition_value, 1)
        self.assertIsInstance(cond_gates[0].inner_gate, NOT)
        # Conditional XPhase with a non-Clifford phase falls back to XPhase.
        c3 = Circuit(1)
        c3.gates = [ConditionalGate("c", 1, XPhase(0, Fraction(1, 4)), 1)]
        g = c3.to_graph()
        c4 = graph_to_circuit(g)
        cond_gates = [gt for gt in c4.gates if isinstance(gt, ConditionalGate)]
        self.assertEqual(len(cond_gates), 1)
        self.assertIsInstance(cond_gates[0].inner_gate, XPhase)
        self.assertEqual(cond_gates[0].inner_gate.phase, Fraction(1, 4))

    def test_qec_measure_conditional_correction(self):
        """End-to-end test: measure + conditional Pauli correction (QEC pattern)."""
        from pyzx.circuit.gates import ConditionalGate, Measurement
        qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[3];
        creg c[1];
        cx q[0],q[1];
        cx q[0],q[2];
        h q[0];
        measure q[0] -> c[0];
        if(c==1) z q[1];
        if(c==1) z q[2];
        """
        c = Circuit.from_qasm(qasm)
        # 2 CNOTs + 1 HAD + 1 measure + 2 conditional gates = 6.
        self.assertEqual(len(c.gates), 6)
        self.assertIsInstance(c.gates[3], Measurement)
        self.assertIsInstance(c.gates[4], ConditionalGate)
        self.assertIsInstance(c.gates[5], ConditionalGate)

        # Convert to graph and back.
        g = c.to_graph()
        qasm_out = c.to_qasm()
        c2 = Circuit.from_qasm(qasm_out)
        self.assertEqual(len(c.gates), len(c2.gates))

    def test_conditional_unsupported_gate(self):
        """Test that unsupported conditional gates raise NotImplementedError."""
        from pyzx.circuit.gates import ConditionalGate, HAD
        c = Circuit(1)
        c.gates = [ConditionalGate("c", 1, HAD(0), 1)]
        with self.assertRaises(NotImplementedError):
            c.to_graph()

    def test_conditional_gate_with_spaces(self):
        """Test that if statement parsing tolerates whitespace variations."""
        from pyzx.circuit.gates import ConditionalGate
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        creg c[1];
        if ( c == 1 ) x q[0];
        """)
        self.assertEqual(len(c.gates), 1)
        self.assertIsInstance(c.gates[0], ConditionalGate)

    def test_parse_if_braced_block_qasm3(self):
        """Test parsing OpenQASM 3 braced if-block with multiple gates."""
        from pyzx.circuit.gates import ConditionalGate, NOT, Z
        c = Circuit.from_qasm("""
        OPENQASM 3;
        include "stdgates.inc";
        qubit[2] q;
        bit[1] c;
        if (c == 1) { x q[0]; z q[1]; }
        """)
        self.assertEqual(len(c.gates), 2)
        self.assertIsInstance(c.gates[0], ConditionalGate)
        self.assertIsInstance(c.gates[1], ConditionalGate)
        self.assertIsInstance(c.gates[0].inner_gate, NOT)
        self.assertIsInstance(c.gates[1].inner_gate, Z)
        self.assertEqual(c.gates[0].inner_gate.target, 0)
        self.assertEqual(c.gates[1].inner_gate.target, 1)

    def test_parse_if_braced_block_qasm2(self):
        """Test that braced if-blocks also work in OpenQASM 2."""
        from pyzx.circuit.gates import ConditionalGate
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[1];
        if(c==1) { x q[0]; z q[1]; }
        """)
        self.assertEqual(len(c.gates), 2)
        for gate in c.gates:
            self.assertIsInstance(gate, ConditionalGate)
            self.assertEqual(gate.condition_register, "c")
            self.assertEqual(gate.condition_value, 1)

    def test_parse_if_braced_single_gate(self):
        """Test that a braced if-block with a single gate works."""
        from pyzx.circuit.gates import ConditionalGate, NOT
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        creg c[1];
        if(c==1) { x q[0]; }
        """)
        self.assertEqual(len(c.gates), 1)
        self.assertIsInstance(c.gates[0], ConditionalGate)
        self.assertIsInstance(c.gates[0].inner_gate, NOT)

    def test_parse_if_nested_braces_rejected(self):
        """Nested if-blocks should raise a clear error."""
        with self.assertRaises(TypeError) as ctx:
            Circuit.from_qasm("""
            OPENQASM 2.0;
            include "qelib1.inc";
            qreg q[1];
            creg c[1];
            if(c==1) { if(c==0) { x q[0]; } }
            """)
        self.assertIn("Nested if-blocks", str(ctx.exception))

    def test_expand_if_blocks_static_method(self):
        """_expand_if_blocks is a static method callable on the parser class."""
        from pyzx.circuit.qasmparser import QASMParser
        result = QASMParser._expand_if_blocks(
            "if (c==1) { x q[0]; z q[1]; }")
        self.assertIn("if (c==1) x q[0]", result)
        self.assertIn("if (c==1) z q[1]", result)
        self.assertNotIn("{", result)

    def test_creg_declaration_for_result_bit(self):
        """Measurement with result_bit should produce a creg declaration."""
        from pyzx.circuit.gates import Measurement
        c = Circuit(2)
        c.gates = [Measurement(0, result_bit=0), Measurement(1, result_bit=2)]
        qasm = c.to_qasm()
        self.assertIn("creg c[3]", qasm)

    def test_invalid_result_symbol_rejected(self):
        """Measurement with result_symbol missing '[' should raise in to_qasm."""
        from pyzx.circuit.gates import Measurement
        m = Measurement(0, result_symbol="bad_name")
        with self.assertRaises(TypeError) as ctx:
            m.to_qasm()
        self.assertIn("not a valid QASM", str(ctx.exception))

    def test_conditional_value_out_of_range(self):
        """Condition value exceeding register capacity should raise ValueError."""
        from pyzx.circuit.gates import ConditionalGate, Z
        with self.assertRaises(ValueError) as ctx:
            ConditionalGate("c", 5, Z(0), 2)  # 5 >= 2^2
        self.assertIn("out of range", str(ctx.exception))
        # Boundary: 3 fits in 2 bits, 4 does not.
        ConditionalGate("c", 3, Z(0), 2)  # should not raise
        with self.assertRaises(ValueError):
            ConditionalGate("c", 4, Z(0), 2)
        with self.assertRaises(ValueError):
            ConditionalGate("c", -1, Z(0), 2)

    def test_measurement_result_bit_variable_name(self):
        """Measurement with result_bit should create a c[i] variable matching ConditionalGate."""
        from pyzx.circuit.gates import Measurement, ConditionalGate, Z
        from pyzx.symbolic import Poly
        c = Circuit(2, bit_amount=1)
        c.gates = [
            Measurement(0, result_bit=0),
            ConditionalGate("c", 1, Z(1), 1),
        ]
        g = c.to_graph()
        # Both should use the same variable name "c[0]".
        sym_phases = [g.phase(v) for v in g.vertices()
                      if isinstance(g.phase(v), Poly)]
        var_names = set()
        for p in sym_phases:
            for _, term in p.terms:
                for var, _ in term.vars:
                    var_names.add(var.name)
        self.assertEqual(var_names, {"c[0]"})

    def test_measure_not_extracted_as_conditional(self):
        """Measurement X spiders must not be misidentified as conditional gates."""
        from pyzx.circuit.gates import ConditionalGate, Measurement, Z
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit(2)
        c1.gates = [
            Measurement(0, result_symbol="c[0]"),
            ConditionalGate("c", 1, Z(0), 1),
        ]
        g = c1.to_graph()
        c2 = graph_to_circuit(g)
        # Only the Z-type conditional should be extracted; the measurement
        # X spider should NOT become a second ConditionalGate.
        cond_gates = [gt for gt in c2.gates if isinstance(gt, ConditionalGate)]
        self.assertEqual(len(cond_gates), 1)
        self.assertEqual(cond_gates[0].condition_value, 1)

    def test_conditional_s_graph_round_trip(self):
        """Test that conditional S gate preserves phase through graph."""
        from pyzx.circuit.gates import ConditionalGate, S
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit(1)
        c1.gates = [ConditionalGate("c", 1, S(0), 1)]
        g = c1.to_graph()
        c2 = graph_to_circuit(g)
        cond_gates = [gt for gt in c2.gates if isinstance(gt, ConditionalGate)]
        self.assertEqual(len(cond_gates), 1)
        self.assertIsInstance(cond_gates[0].inner_gate, S)
        self.assertEqual(cond_gates[0].inner_gate.phase, Fraction(1, 2))

    def test_conditional_sdg_qasm_round_trip(self):
        """Test that conditional sdg survives QASM round-trip."""
        from pyzx.circuit.gates import ConditionalGate, S
        c1 = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        creg c[1];
        if(c==1) sdg q[0];
        """)
        qasm_out = c1.to_qasm()
        self.assertIn("sdg", qasm_out)
        c2 = Circuit.from_qasm(qasm_out)
        self.assertEqual(len(c2.gates), 1)
        self.assertIsInstance(c2.gates[0], ConditionalGate)
        self.assertIsInstance(c2.gates[0].inner_gate, S)
        self.assertTrue(c2.gates[0].inner_gate.adjoint)

    def test_conditional_broadcast_over_register(self):
        """Test that if(c==1) x q; broadcasts over the entire register."""
        from pyzx.circuit.gates import ConditionalGate
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[3];
        creg c[1];
        if(c==1) x q;
        """)
        self.assertEqual(len(c.gates), 3)
        for i, gate in enumerate(c.gates):
            self.assertIsInstance(gate, ConditionalGate)
            self.assertEqual(gate.inner_gate.target, i)

    def test_conditional_unknown_register_error(self):
        """Test that referencing an undeclared creg raises TypeError."""
        with self.assertRaises(TypeError) as ctx:
            Circuit.from_qasm("""
            OPENQASM 2.0;
            include "qelib1.inc";
            qreg q[1];
            if(c==1) x q[0];
            """)
        self.assertIn("Unknown classical register", str(ctx.exception))

    def test_conditional_multi_bit_partial_value_graph_round_trip(self):
        """Test if(c==2) with 2-bit register (bit 1 set, bit 0 clear)."""
        from pyzx.circuit.gates import ConditionalGate, Z
        from pyzx.circuit.graphparser import graph_to_circuit
        c1 = Circuit(1)
        c1.gates = [ConditionalGate("c", 2, Z(0), 2)]
        g = c1.to_graph()
        c2 = graph_to_circuit(g)
        cond_gates = [gt for gt in c2.gates if isinstance(gt, ConditionalGate)]
        self.assertEqual(len(cond_gates), 1)
        self.assertEqual(cond_gates[0].condition_value, 2)
        self.assertEqual(cond_gates[0].register_size, 2)

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

    def test_hththt_t_injection_feedforward(self):
        """HTHTHT... circuit with T gates implemented via injection.

        This is the T-injection protocol example from tqec/tqec#708: prepare an
        ancilla in |T>, CNOT with the data qubit, measure the ancilla, and
        conditionally apply S-dagger. Three rounds are performed.
        """
        from pyzx.circuit.gates import ConditionalGate, Measurement, Reset

        qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[1];
        h q[0];
        reset q[1];
        h q[1];
        t q[1];
        cx q[0],q[1];
        h q[1];
        measure q[1] -> c[0];
        if(c==1) sdg q[0];
        h q[0];
        reset q[1];
        h q[1];
        t q[1];
        cx q[0],q[1];
        h q[1];
        measure q[1] -> c[0];
        if(c==1) sdg q[0];
        h q[0];
        reset q[1];
        h q[1];
        t q[1];
        cx q[0],q[1];
        h q[1];
        measure q[1] -> c[0];
        if(c==1) sdg q[0];
        """

        # Parse.
        c = Circuit.from_qasm(qasm)
        self.assertEqual(c.qubits, 2)

        # Count gate types.
        measurements = [g for g in c.gates if isinstance(g, Measurement)]
        conditionals = [g for g in c.gates if isinstance(g, ConditionalGate)]
        resets = [g for g in c.gates if isinstance(g, Reset)]
        self.assertEqual(len(measurements), 3)
        self.assertEqual(len(conditionals), 3)
        self.assertEqual(len(resets), 3)

        # Each conditional should be sdg on q[0].
        for cg in conditionals:
            self.assertEqual(cg.condition_register, "c")
            self.assertEqual(cg.condition_value, 1)
            self.assertEqual(cg.inner_gate.target, 0)

        # Convert to graph.
        g = c.to_graph()
        self.assertEqual(len(g.inputs()), 3)   # 2 qubits + 1 classical bit
        self.assertEqual(len(g.outputs()), 2)  # q[0] + c[0]; q[1] consumed by measurement

        # QASM round-trip.
        qasm_out = c.to_qasm()
        c2 = Circuit.from_qasm(qasm_out)
        self.assertEqual(len(c.gates), len(c2.gates))
        for g1, g2 in zip(c.gates, c2.gates):
            self.assertEqual(type(g1), type(g2))

    def test_hththt_algorithmic(self):
        """HTHTHT... with T gates at the algorithmic level.

        The tqec compiler inserts injection circuitry downstream, so the QASM
        specifies only the high-level gates.  The ZX graph should be a line of
        alternating Hadamard edges and Z spiders, with each T gate appearing
        as a Z(pi/4) spider.

        See: https://github.com/zxcalc/pyzx/pull/403#issuecomment-3970410722
        """
        from fractions import Fraction
        from pyzx.utils import VertexType, EdgeType

        qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[1];
        h q[0];
        t q[0];
        h q[0];
        t q[0];
        h q[0];
        t q[0];
        """
        c = Circuit.from_qasm(qasm)
        self.assertEqual(c.qubits, 1)
        self.assertEqual(len(c.gates), 6)

        g = c.to_graph()

        # Structure: boundary -- H -- Z(0) -- Z(pi/4) -- H -- Z(0) -- ...
        # 2 boundaries + 3 identity Z spiders (from HAD) + 3 T spiders.
        self.assertEqual(g.num_vertices(), 8)

        boundaries = [v for v in g.vertices()
                      if g.type(v) == VertexType.BOUNDARY]
        z_spiders = [v for v in g.vertices()
                     if g.type(v) == VertexType.Z]
        self.assertEqual(len(boundaries), 2)
        self.assertEqual(len(z_spiders), 6)

        # Three of the Z spiders should carry the T-gate phase pi/4.
        t_spiders = [v for v in z_spiders
                     if g.phase(v) == Fraction(1, 4)]
        self.assertEqual(len(t_spiders), 3)

        # The graph should contain Hadamard edges (the H gates).
        h_edges = [e for e in g.edges()
                   if g.edge_type(e) == EdgeType.HADAMARD]
        self.assertGreaterEqual(len(h_edges), 3)

        # QASM round-trip.
        qasm_out = c.to_qasm()
        c2 = Circuit.from_qasm(qasm_out)
        self.assertEqual(len(c.gates), len(c2.gates))


@unittest.skipUnless(stim, "stim needs to be installed for this to run")
class TestStimQASMInterop(unittest.TestCase):
    """Test loading Stim-generated QASMs into PyZX.

    Stim can export circuits to QASM via circuit.to_qasm().  These tests
    verify that PyZX can parse the resulting QASM for a range of QEC
    circuits.  See tqec/tqec#708 for context.

    QASM 2 with skip_dets_and_obs=True is the primary interop path.
    QASM 3 works when Stim does not use its MR subroutine definition.
    """

    def _load_stim_qasm2(self, stim_circuit):
        """Export a Stim circuit to QASM 2, parse it in PyZX, and return
        the PyZX Circuit."""
        qasm = stim_circuit.to_qasm(
            open_qasm_version=2, skip_dets_and_obs=True)
        return Circuit.from_qasm(qasm)

    def test_bell_pair_measurement(self):
        c_stim = stim.Circuit("H 0\nCNOT 0 1\nM 0 1")
        c = self._load_stim_qasm2(c_stim)
        self.assertEqual(c.qubits, 2)
        self.assertEqual(len(c.gates), 4)

    def test_measure_reset_reuse(self):
        c_stim = stim.Circuit("H 0\nM 0\nR 0\nH 0\nM 0")
        c = self._load_stim_qasm2(c_stim)
        self.assertEqual(c.qubits, 1)
        self.assertEqual(len(c.gates), 5)

    def test_entangle_measure_reset_cycle(self):
        c_stim = stim.Circuit(
            "H 0\nCNOT 0 1\nM 0 1\nR 0 1\n"
            "H 0\nCNOT 0 1\nM 0 1")
        c = self._load_stim_qasm2(c_stim)
        self.assertEqual(c.qubits, 2)
        self.assertEqual(len(c.gates), 10)

    def test_mr_combined_gate(self):
        """Stim's MR (combined measure-reset) decomposes to separate
        measure + reset on a single line in QASM 2."""
        c_stim = stim.Circuit("H 0\nCNOT 0 1\nMR 0\nH 0\nM 0 1")
        c = self._load_stim_qasm2(c_stim)
        self.assertEqual(c.qubits, 2)
        self.assertEqual(len(c.gates), 7)

    def test_surface_code_d3(self):
        c_stim = stim.Circuit.generated(
            "surface_code:rotated_memory_z",
            rounds=2, distance=3,
            after_clifford_depolarization=0,
            after_reset_flip_probability=0,
            before_measure_flip_probability=0,
            before_round_data_depolarization=0)
        c = self._load_stim_qasm2(c_stim)
        # d=3 rotated surface code uses 9 data + 8 ancilla = 17 qubits,
        # but Stim may allocate more. Just check it parses and round-trips.
        self.assertGreater(c.qubits, 0)
        g = c.to_graph()
        self.assertGreater(len(list(g.vertices())), 0)
        # QASM round-trip.
        c2 = Circuit.from_qasm(c.to_qasm())
        self.assertEqual(len(c.gates), len(c2.gates))

    def test_surface_code_d5(self):
        c_stim = stim.Circuit.generated(
            "surface_code:rotated_memory_z",
            rounds=3, distance=5,
            after_clifford_depolarization=0,
            after_reset_flip_probability=0,
            before_measure_flip_probability=0,
            before_round_data_depolarization=0)
        c = self._load_stim_qasm2(c_stim)
        self.assertGreater(c.qubits, 0)
        g = c.to_graph()
        self.assertGreater(len(list(g.vertices())), 0)

    def test_repetition_code(self):
        c_stim = stim.Circuit.generated(
            "repetition_code:memory",
            rounds=3, distance=3,
            after_clifford_depolarization=0,
            after_reset_flip_probability=0,
            before_measure_flip_probability=0,
            before_round_data_depolarization=0)
        c = self._load_stim_qasm2(c_stim)
        self.assertGreater(c.qubits, 0)
        g = c.to_graph()
        self.assertGreater(len(list(g.vertices())), 0)

    def test_colour_code(self):
        c_stim = stim.Circuit.generated(
            "color_code:memory_xyz",
            rounds=2, distance=3,
            after_clifford_depolarization=0,
            after_reset_flip_probability=0,
            before_measure_flip_probability=0,
            before_round_data_depolarization=0)
        c = self._load_stim_qasm2(c_stim)
        self.assertGreater(c.qubits, 0)
        g = c.to_graph()
        self.assertGreater(len(list(g.vertices())), 0)

    def test_qasm3_without_mr(self):
        """QASM 3 works when Stim uses separate M + R (not MR)."""
        c_stim = stim.Circuit(
            "H 0\nCNOT 0 1\nM 0\nR 0\nH 0\nM 0 1")
        qasm3 = c_stim.to_qasm(
            open_qasm_version=3, skip_dets_and_obs=True)
        c = Circuit.from_qasm(qasm3)
        self.assertEqual(c.qubits, 2)
        self.assertEqual(len(c.gates), 7)

    def test_qasm3_mr_subroutine_fails(self):
        """QASM 3 with Stim's MR subroutine definition is not supported."""
        c_stim = stim.Circuit("H 0\nMR 0\nH 0\nM 0")
        qasm3 = c_stim.to_qasm(
            open_qasm_version=3, skip_dets_and_obs=True)
        # Stim emits `def mr(qubit q0) -> bit { ... }` which PyZX
        # cannot parse.
        with self.assertRaises((TypeError, ValueError)):
            Circuit.from_qasm(qasm3)


if __name__ == '__main__':
    unittest.main()
