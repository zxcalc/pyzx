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
import numpy as np
from fractions import Fraction

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

import pyzx as zx
from pyzx.rank_width import conv_uv, conv_vw, conv_naive
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


if __name__ == '__main__':
    unittest.main()
