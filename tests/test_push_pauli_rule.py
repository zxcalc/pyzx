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
import sys
from types import ModuleType
from typing import Optional

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from fractions import Fraction

from pyzx.graph import Graph
from pyzx.utils import EdgeType, VertexType
from pyzx.rewrite_rules.push_pauli_rule import check_pauli, pauli_push

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import compare_tensors
except ImportError:
    np = None


class TestPushPauliRule(unittest.TestCase):

    def test_check_pauli_same_type_had_edge(self):
        """Z-Z with Hadamard edge matches."""
        g = Graph()
        v = g.add_vertex(VertexType.Z, 0, 0)
        g.set_phase(v, Fraction(1, 4))
        w = g.add_vertex(VertexType.Z, 0, 1)
        g.set_phase(w, 1)
        b0 = g.add_vertex(VertexType.BOUNDARY, 0, -1)
        b1 = g.add_vertex(VertexType.BOUNDARY, 0, 2)
        g.add_edge((b0, v))
        g.add_edge((v, w), EdgeType.HADAMARD)
        g.add_edge((w, b1))

        self.assertTrue(check_pauli(g, v, w))

    def test_check_pauli_rejects_non_pauli_phase(self):
        """Phase 1/2 is not Pauli, should reject."""
        g = Graph()
        v = g.add_vertex(VertexType.Z, 0, 0)
        w = g.add_vertex(VertexType.Z, 0, 1)
        g.set_phase(w, Fraction(1, 2))
        g.add_edge((v, w), EdgeType.HADAMARD)

        self.assertFalse(check_pauli(g, v, w))

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_pauli_push_degree2_preserves_tensor(self):
        """Degree-2 Pauli push preserves the tensor."""
        g = Graph()
        b0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v = g.add_vertex(VertexType.Z, 0, 1)
        g.set_phase(v, Fraction(1, 4))
        w = g.add_vertex(VertexType.Z, 0, 2)
        g.set_phase(w, 1)
        b1 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        g.add_edge((b0, v))
        g.add_edge((v, w), EdgeType.HADAMARD)
        g.add_edge((w, b1))
        g.set_inputs((b0,))
        g.set_outputs((b1,))

        g_orig = g.copy()
        self.assertTrue(pauli_push(g, v, w))
        self.assertTrue(compare_tensors(g_orig, g))

    @unittest.skipUnless(np, "numpy needs to be installed for this to run")
    def test_pauli_push_degree3_preserves_tensor(self):
        """Degree >2 Pauli push preserves the tensor."""
        g = Graph()
        b0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        v = g.add_vertex(VertexType.Z, 0, 1)
        g.set_phase(v, Fraction(1, 4))
        w = g.add_vertex(VertexType.X, 0, 2)
        g.set_phase(w, 1)
        b1 = g.add_vertex(VertexType.BOUNDARY, 0, 3)
        b2 = g.add_vertex(VertexType.BOUNDARY, 1, 2)
        g.add_edge((b0, v))
        g.add_edge((v, w))
        g.add_edge((w, b1))
        g.add_edge((w, b2))
        g.set_inputs((b0,))
        g.set_outputs((b1, b2))

        g_orig = g.copy()
        self.assertTrue(pauli_push(g, v, w))
        self.assertTrue(compare_tensors(g_orig, g))


if __name__ == '__main__':
    unittest.main()
