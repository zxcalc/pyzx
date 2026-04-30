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
import sys
from types import ModuleType
from typing import Optional

from pyzx import VertexType

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
from pyzx.graph import Graph
from pyzx.circuit import Circuit
from pyzx.circuit.qasmparser import qasm
from fractions import Fraction
from pyzx.generate import cliffordT
from pyzx.simplify import *
from pyzx.simplify import supplementarity_simp, to_clifford_normal_form_graph, copy_simp
from pyzx import compare_tensors
from pyzx.generate import cliffordT

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors
except ImportError:
    np = None

SEED = 1337


@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestSimplify(unittest.TestCase):

    def setUp(self):
        random.seed(SEED)
        self.circuits = []
        self.circuits.append(cliffordT(3,20,0.3))
        self.circuits.append(cliffordT(3,10,0.1))
        # self.circuits.append(cliffordT(4,30,0.3))
        # self.circuits.append(cliffordT(5,50,0.08))
        # self.circuits.append(cliffordT(4,80,0.1))

    def func_test(self, func, prepare=None):
        for i,c in enumerate(self.circuits):
            with self.subTest(i=i):
                if prepare:
                    for f in prepare: f(c)
                t = tensorfy(c)
                func(c)
                t2 = tensorfy(c)
                self.assertTrue(compare_tensors(t,t2))
                del t, t2

    def test_spider_simp(self):
        self.func_test(spider_simp)
        

    def test_spider_simp_removes_preexisting_self_loops(self):
        """Regression test for issue #352.

        Test that spider_simp removes pre-existing self-loops in multigraphs."""
        from pyzx.graph.multigraph import Multigraph
        from pyzx import VertexType, EdgeType

        g = Multigraph()
        g.set_auto_simplify(False)
        g.add_vertex(VertexType.BOUNDARY, row=0)
        g.add_vertex(VertexType.X, row=1)
        g.set_inputs([0])
        g.add_edge((0, 1), EdgeType.SIMPLE)
        g.add_edge((1, 1), EdgeType.SIMPLE)

        self.assertTrue(g.connected(1, 1))
        spider_simp(g)
        self.assertFalse(g.connected(1, 1))

    def test_spider_simp_removes_self_loops_created_during_fusion(self):
        """Regression test for issue #352.

        Test that spider_simp removes self-loops created during spider fusion."""
        from pyzx.graph.multigraph import Multigraph
        from pyzx import VertexType, EdgeType

        g = Multigraph()
        g.set_auto_simplify(False)
        b = g.add_vertex(VertexType.BOUNDARY, row=0)
        v0 = g.add_vertex(VertexType.Z, row=1)
        v1 = g.add_vertex(VertexType.Z, row=2)
        g.add_edge((b, v0), EdgeType.SIMPLE)
        g.add_edge((v0, v1), EdgeType.SIMPLE)
        g.add_edge((v1, v1), EdgeType.HADAMARD)
        g.set_inputs([b])

        self.assertTrue(g.connected(v1, v1))
        spider_simp(g)

        for v in g.vertices():
            self.assertFalse(g.connected(v, v))

    def test_id_simp(self):
        self.func_test(id_simp)

    def test_to_gh(self):
        self.func_test(to_gh)

    def test_pivot_simp(self):
        self.func_test(pivot_simp,prepare=[spider_simp,to_gh,spider_simp])

    def test_lcomp_simp(self):
        self.func_test(lcomp_simp,prepare=[spider_simp,to_gh,spider_simp])

    def test_clifford_simp(self):
        self.func_test(clifford_simp)

    def test_supplementarity_simp(self):
        g = Graph()
        v = g.add_vertex(1,0,0,phase=Fraction(1,4))
        w = g.add_vertex(1,1,0,phase=Fraction(7,4))
        g.add_edge((v,w),2)
        vs = []
        for i in range(3):
            h = g.add_vertex(1,i,2,Fraction(1))
            vs.append(h)
            g.add_edges([(v,h),(w,h)],2)
        t = g.to_tensor()
        i = supplementarity_simp(g)
        self.assertEqual(i,1)
        self.assertTrue(compare_tensors(t,g.to_tensor()))

    def test_teleport_reduce(self):
        """Tests whether teleport_reduce preserves semantics on a set of circuits that have been broken before."""
        for i,s in enumerate([qasm_1,qasm_2,qasm_3,qasm_4,qasm_5]):
            with self.subTest(i=i):
                c = qasm(s)
                g = c.to_graph()
                c2 = Circuit.from_graph(teleport_reduce(g))
                self.assertTrue(c.verify_equality(c2))

    def test_to_graph_like_introduce_boundary_vertices(self):
        c = qasm(qasm_5)
        g = c.to_graph()
        to_graph_like(g)
        self.assertTrue(compare_tensors(c,g))

    def test_full_reduce_with_h_box(self):
        """Test that calls to :func:`full_reduce` with a graph containing H-boxes raises an error.
        This is a common mistake made by users (e.g., see issues #161 and #200).
        """
        g = Graph()
        v0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v1 = g.add_vertex(VertexType.H_BOX, 0, 1)
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((v0, v1))
        g.add_edge((v1, v2))

        with self.assertRaises(ValueError) as context:
            full_reduce(g)
        self.assertTrue("Input graph is not a ZX-diagram" in str(context.exception))

    def test_full_reduce_scalar(self):
        """Test that checks whether a scalar is correctly removed from a graph using full_reduce.
        """

        from pyzx import Graph, full_reduce 
        g = Graph()
        g.add_vertex(ty=VertexType.Z, phase=0.5)
        g.add_vertex(ty=VertexType.Z, phase=1)
        g.add_edge((0, 1))

        full_reduce(g)

        g1 = Graph()
        g1.add_vertex(ty=VertexType.Z, phase=1)

        full_reduce(g1)
        
        self.assertTrue(g.num_vertices() == 0)
        self.assertTrue(g1.num_vertices() == 0)


    def test_to_clifford_normal_form_graph(self):
        for _ in range(10):
            g = cliffordT(4, 20, p_t=0)
            g0 = g.copy()
            to_clifford_normal_form_graph(g)
            self.assertTrue(compare_tensors(g0, g, preserve_scalar=True))
    
    def test_copy_simp(self):
        g = Graph() 

        v0 = g.add_vertex(VertexType.Z, 0, 0)
        v1 = g.add_vertex(VertexType.X, 0, 1)
        g.add_edge((v0, v1))
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((v1, v2))
        v3 = g.add_vertex(VertexType.BOUNDARY, 1, 3)
        g.add_edge((v1, v3))

        g1 = g.copy()
        to_gh(g1)
        copy_simp(g1)

        g1.auto_detect_io()
        g.auto_detect_io()

        self.assertFalse(g.num_vertices() != g1.num_vertices())
        self.assertTrue(g1.num_vertices() == 4)
        self.assertTrue(compare_tensors(g1.to_tensor(),g.to_tensor()))

    
    def test_copy_simp_full_reduce(self):
        g = Graph() 

        v0 = g.add_vertex(VertexType.Z, 0, 0)
        v1 = g.add_vertex(VertexType.X, 0, 1)
        g.add_edge((v0, v1))
        v2 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((v1, v2))
        v3 = g.add_vertex(VertexType.BOUNDARY, 1, 3)
        g.add_edge((v1, v3))

        g1 = g.copy()
        to_gh(g)
        copy_simp(g)

        full_reduce(g1)
        g.auto_detect_io()
        g1.auto_detect_io()

        self.assertTrue(g.num_vertices() == g1.num_vertices())
        self.assertTrue(compare_tensors(g1.to_tensor(),g.to_tensor()))

    def test_measurement_outcomes_survive_reduction(self):
        """Symbolic measurement outcomes must survive full_reduce.

        Regression test for tqec/tqec#528. In a circuit with mid-circuit
        resets, the measurement outcome must be on a separate leaf off the
        qubit wire so that the subsequent reset traces out only the
        post-measurement quantum state, not the classical result.
        """
        # Steane X-stabiliser measurement circuit: 3 stabiliser rounds
        # with mid-circuit resets after the first two measurements.
        steane_qasm = """
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[8];
        creg c[3];
        h q[0];
        cx q[0], q[1]; cx q[0], q[2]; cx q[0], q[3]; cx q[0], q[4];
        h q[0];
        measure q[0] -> c[0];
        reset q[0];
        h q[0];
        cx q[0], q[1]; cx q[0], q[2]; cx q[0], q[5]; cx q[0], q[6];
        h q[0];
        measure q[0] -> c[1];
        reset q[0];
        h q[0];
        cx q[0], q[1]; cx q[0], q[3]; cx q[0], q[5]; cx q[0], q[7];
        h q[0];
        measure q[0] -> c[2];
        """
        c = Circuit.from_qasm(steane_qasm)
        g = c.to_graph()
        full_reduce(g)

        # Collect measurement-outcome vertices by phase label, keeping
        # all matches so duplicate labels can be detected.
        outcome_verts: dict = {}
        for v in g.vertices():
            p = g.phase(v)
            if isinstance(p, (int, float)):
                continue
            ps = str(p)
            if ps in ('0', '1', '1/2') or ps.startswith('_r'):
                continue
            outcome_verts.setdefault(ps, []).append(v)

        for label in ('c[0]', 'c[1]', 'c[2]'):
            self.assertEqual(len(outcome_verts.get(label, [])), 1,
                f"expected exactly one outcome vertex for {label}, "
                f"got {len(outcome_verts.get(label, []))}")
        self.assertEqual(sorted(outcome_verts.keys()), ['c[0]', 'c[1]', 'c[2]'],
            "full_reduce destroyed measurement outcome phases")

        # Verify stabiliser connectivity: each outcome spider should
        # be connected (via Z neighbours) to exactly the data qubits
        # of the corresponding Steane X-stabiliser.
        expected_data_qubits = {
            'c[0]': {1, 2, 3, 4},
            'c[1]': {1, 2, 5, 6},
            'c[2]': {1, 3, 5, 7},
        }
        output_qubit = {v: int(g.qubit(v)) for v in g.outputs()}
        for label, vs in outcome_verts.items():
            v = vs[0]
            data_qubits = set()
            for n in g.neighbors(v):
                if g.type(n) == VertexType.BOUNDARY and n in g.inputs():
                    continue  # Ancilla input, not a data qubit.
                # Follow through to the output boundary to find the qubit.
                for nn in g.neighbors(n):
                    if nn in output_qubit:
                        data_qubits.add(output_qubit[nn])
            self.assertEqual(data_qubits, expected_data_qubits[label],
                f"{label} stabiliser has wrong data-qubit connectivity")

    def test_measurement_outcomes_survive_minimal_ancilla(self):
        """Minimal measure-reset-measure pattern keeps both outcomes.

        Two-qubit reduction of tqec/tqec#528: ``q[0]`` is reused as a
        parity-check ancilla against the data qubit ``q[1]``, so both
        outcomes are entangled with the data wire and must survive
        ``full_reduce``.
        """
        c = Circuit.from_qasm("""
        OPENQASM 2.0;
        include "qelib1.inc";
        qreg q[2];
        creg c[2];
        h q[0];
        cx q[0], q[1];
        measure q[0] -> c[0];
        reset q[0];
        h q[0];
        cx q[0], q[1];
        measure q[0] -> c[1];
        """)
        g = c.to_graph()
        full_reduce(g)

        # Both c[0] and c[1] must appear in a remaining symbolic phase
        # (possibly XOR-combined in a single Poly, e.g. ``c[0] + c[1]``,
        # since the CNOT couples the outcomes).
        joined = " | ".join(
            str(g.phase(v)) for v in g.vertices()
            if not isinstance(g.phase(v), (int, float))
            and not str(g.phase(v)).startswith('_r')
        )
        self.assertIn('c[0]', joined,
            "full_reduce destroyed c[0] outcome phase")
        self.assertIn('c[1]', joined,
            "full_reduce destroyed c[1] outcome phase")


qasm_1 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
x q[2];
ccx q[0], q[2], q[1];
x q[2];
ccx q[2], q[1], q[0];
cx q[2], q[0];
x q[2];
ccx q[0], q[2], q[1];
ccx q[0], q[2], q[1];
"""

qasm_2 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
ccx q[0], q[1], q[2];
ccx q[0], q[1], q[2];
ccx q[1], q[0], q[2];
x q[0];
ccx q[1], q[0], q[2];
ccx q[2], q[1], q[0];
ccx q[2], q[1], q[0];
ccx q[1], q[0], q[2];
"""

qasm_3 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
ccx q[1], q[2], q[0];
x q[0];
x q[1];
ccx q[1], q[0], q[2];
ccx q[1], q[0], q[2];
ccx q[1], q[0], q[2];
ccx q[0], q[1], q[2];
ccx q[0], q[2], q[1];
"""

qasm_4 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
ccx q[1], q[2], q[0];
x q[1];
ccx q[2], q[1], q[0];
ccx q[2], q[1], q[0];
ccx q[0], q[1], q[2];
ccx q[0], q[2], q[1];
ccx q[2], q[0], q[1];
cx q[1], q[2];
"""

qasm_5 = """OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
h q[0];
h q[1];
cz q[0],q[1];
"""


if __name__ == '__main__':
    unittest.main()
