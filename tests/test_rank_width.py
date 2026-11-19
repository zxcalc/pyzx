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
import cmath
import math
import random
import sys
import numpy as np
from fractions import Fraction

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

import pyzx as zx
from pyzx.rank_width import conv_uv, conv_vw, conv_naive
from pyzx.rank_width import generate_decomposition, tensorfy_rw_subtree, tensorfy_rw_subtree_exp2
from pyzx.tensor import tensorfy


class TestRankWidth(unittest.TestCase):
    @staticmethod
    def generate_graph(n, m):
        g = zx.Graph()
        for _ in range(n):
            g.add_vertex(zx.VertexType.Z, phase=Fraction(random.randint(0, 7), 4))
        while g.num_edges() < m:
            [u, v] = random.sample(range(n), k=2)
            if (u, v) not in g.edge_set() and (v, u) not in g.edge_set():
                g.add_edge((u, v), zx.EdgeType.HADAMARD)
        return g

    def check_amplitude(self, res, corr, info=''):
        if not np.allclose(res, corr):
            print(f'Amplitude mismatch: expected {corr}, found {res}')
            print(info)
            self.assertTrue(False)

    def check_graph_tensorfy(self, g, strategy='rw-auto'):
        res = tensorfy(g, strategy=strategy)
        corr = tensorfy(g, strategy='naive')
        self.check_amplitude(res, corr, str(g.edge_set()))

    def check_circuit_tensorfy(self, circ, state, effect, strategy='rw-auto'):
        g = circ.to_graph()
        g.apply_state(state)
        g.apply_effect(effect)
        self.check_graph_tensorfy(g, strategy=strategy)

    def test_convolution(self):
        r_u, r_v, r_w = 2, 3, 4
        Psi_v = np.random.random((2, 2 ** r_v)).astype(np.complex128)
        Psi_w = np.random.random((2, 2 ** r_w)).astype(np.complex128)
        E_vw = np.random.randint(2, size=(r_v, r_w)).astype(np.int8)
        E_vu = np.random.randint(2, size=(r_v, r_u)).astype(np.int8)
        E_wu = np.random.randint(2, size=(r_w, r_u)).astype(np.int8)
        corr = conv_naive(Psi_v, Psi_w, E_vw, E_vu, E_wu)
        res_vw = conv_vw(Psi_v, Psi_w, E_vw, E_vu, E_wu)
        res_uv = conv_uv(Psi_v, Psi_w, E_vw, E_vu, E_wu)
        self.check_amplitude(res_vw, corr, 'conv_vw')
        self.check_amplitude(res_uv, corr, 'conv_uv')

    def test_tensorfy_rw_one_edge(self):
        g = zx.Graph()
        g.add_vertex(zx.VertexType.Z, phase=0)
        g.add_vertex(zx.VertexType.Z, phase=1)
        g.add_edge((0, 1), zx.EdgeType.HADAMARD)
        self.check_graph_tensorfy(g)

    def test_tensorfy_rw_square(self):
        g = zx.Graph()
        for i in range(4):
            g.add_vertex(zx.VertexType.Z)
        for i in range(4):
            g.add_edge((i, (i + 1) % 4), zx.EdgeType.HADAMARD)
        self.check_graph_tensorfy(g)

    def test_tensorfy_rw_NOT(self):
        circ = zx.Circuit(1)
        circ.add_gate('NOT', 0)
        self.check_circuit_tensorfy(circ, '/', '/')

    def test_tensorfy_rw_T(self):
        circ = zx.Circuit(1)
        circ.add_gate('T', 0)
        self.check_circuit_tensorfy(circ, '/', '/')

    def test_tensorfy_rw_random_graph(self):
        for _ in range(10):
            g = self.generate_graph(10, 40)
            self.check_graph_tensorfy(g)

    def test_tensorfy_rw_random_circuit(self):
        n_qubits, n_gates = 10, 200
        basis_states = ['0', '1', '+', '-', '/']
        for _ in range(10):
            circ = zx.generate.CNOT_HAD_PHASE_circuit(qubits=n_qubits, depth=n_gates)
            state = ''.join(random.choice(basis_states) for _ in range(n_qubits))
            effect = ''.join(random.choice(basis_states) for _ in range(n_qubits))
            self.check_circuit_tensorfy(circ, state, effect)

    def test_tensorfy_rw_small_circuit(self):
        self.check_circuit_tensorfy(zx.generate.CNOT_HAD_PHASE_circuit(qubits=1, depth=0),
                                    '0', '0')
        self.check_circuit_tensorfy(zx.generate.CNOT_HAD_PHASE_circuit(qubits=1, depth=1, p_t=0.8),
                                    '+', '+')
        self.check_circuit_tensorfy(zx.generate.CNOT_HAD_PHASE_circuit(qubits=2, depth=0),
                                    '1-', '-1')
        self.check_circuit_tensorfy(zx.generate.CNOT_HAD_PHASE_circuit(qubits=2, depth=1),
                                    '--', '11')

    @staticmethod
    def complete_graph(n):
        """The complete graph on n T-spiders, connected by Hadamard edges."""
        g = zx.Graph()
        vs = [g.add_vertex(zx.VertexType.Z, phase=Fraction(1, 4)) for _ in range(n)]
        for i in range(n):
            for j in range(i + 1, n):
                g.add_edge((vs[i], vs[j]), zx.EdgeType.HADAMARD)
        return g

    @staticmethod
    def complete_graph_sum(n):
        """The value of complete_graph(n) times sqrt(2)^(number of edges): sum over the
        Hamming weight w of the spider assignment, which is all the value depends on."""
        return sum(math.comb(n, w) * cmath.exp(1j * math.pi * w / 4) * (-1) ** (w * (w - 1) // 2)
                   for w in range(n + 1))

    def test_tensorfy_rw_complete_graph(self):
        for n in range(2, 9):
            g = self.complete_graph(n)
            self.check_graph_tensorfy(g)
            expected = self.complete_graph_sum(n) / math.sqrt(2) ** (n * (n - 1) // 2)
            self.check_amplitude(tensorfy(g), expected, f'complete graph on {n} vertices')

    def test_tensorfy_rw_scalar_and_tensor_out_of_float_range(self):
        # Both the contracted tensor (about 2^-1146) and the scalar (sqrt(2)^2415) are
        # outside the float range, but their product is not (#575).
        n = 70
        g = self.complete_graph(n)
        g.scalar.add_power(n * (n - 1) // 2)
        res = complex(tensorfy(g))
        expected = self.complete_graph_sum(n)
        self.assertLessEqual(abs(res - expected), 1e-9 * abs(expected))

    def test_tensorfy_rw_large_scalar_without_decomposition(self):
        # A diagram that full_reduce removes completely, leaving only a scalar that
        # does not fit in a float on its own: sqrt(2)^2200 * 2^-1000 = 2^100.
        g = zx.Graph()
        g.scalar.add_power(2200)
        g.scalar.add_float(2.0 ** -1000)
        res = tensorfy(g)
        self.assertIsInstance(res, np.ndarray)
        self.check_amplitude(res, 2.0 ** 100)

    def test_tensorfy_rw_scalar_factors_out_of_float_range(self):
        # Not only the power of sqrt(2) can leave the float range: here 2200 legless
        # spiders with phase pi/2 contribute (1 + i)^2200 = 2^1100 and the power of
        # sqrt(2) gives 2^-1075.
        g = zx.Graph()
        for _ in range(2200):
            g.scalar.add_node(Fraction(1, 2))
        g.scalar.add_power(-2150)
        self.check_amplitude(tensorfy(g), 2.0 ** 25)

    def test_tensorfy_rw_large_scalar_not_preserved(self):
        # With preserve_scalar=False the scalar is ignored, so its size should not matter.
        for g in (self.complete_graph(1), self.complete_graph(6)):
            expected = tensorfy(g, preserve_scalar=False)
            g.scalar.add_power(5000)
            self.check_amplitude(tensorfy(g, preserve_scalar=False), expected)

    def test_tensorfy_rw_subtree_exp2_is_rescaled(self):
        # The contraction rescales the tensor at every step, so the largest real or
        # imaginary part of what it returns is in [0.5, 1), and putting the power of
        # two back gives the tensor of tensorfy_rw_subtree.
        # full_reduce removes the complete graphs on fewer than 3 vertices completely.
        graphs = [self.complete_graph(n) for n in range(3, 9)]
        graphs.append(zx.generate.CNOT_HAD_PHASE_circuit(qubits=4, depth=40).to_graph())
        for g in graphs:
            zx.simplify.full_reduce(g)
            decomp = generate_decomposition(g)
            self.assertIsNotNone(decomp)
            Psi, e, _, _, _ = tensorfy_rw_subtree_exp2(g, decomp)
            top = max(np.abs(Psi.real).max(), np.abs(Psi.imag).max())
            self.assertTrue(0.5 <= top < 1, f'largest part of the rescaled tensor is {top}')
            plain = tensorfy_rw_subtree(g, decomp)[0]
            self.assertTrue(np.array_equal(np.ldexp(Psi.real, e), plain.real))
            self.assertTrue(np.array_equal(np.ldexp(Psi.imag, e), plain.imag))


if __name__ == '__main__':
    unittest.main()
