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
from fractions import Fraction

from pyzx.graph import Graph
from pyzx.utils import EdgeType, VertexType
from pyzx.symbolic import new_var
from pyzx.simplify import gadget_simp, teleport_reduce
from pyzx.rewrite_rules.push_pauli_rule import unsafe_pauli_push
from pyzx.rewrite_rules.pivot_rule import unsafe_pivot
from pyzx.tensor import compare_tensors


def tensors_match(g1, g2, **subs):
    """True iff `g1` and `g2` give the same tensor after substituting `subs`."""
    t1 = g1.substitute_variables(subs).to_tensor()
    t2 = g2.substitute_variables(subs).to_tensor()
    return compare_tensors(t1, t2, preserve_scalar=True)


class TestBooleanPauliRewrites(unittest.TestCase):

    def test_gadget_simp(self):
        """`gadget_simp` must preserve the tensor for a boolean axel."""
        g = Graph()
        c = new_var('c', is_bool=True, registry=g.var_registry)
        b0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        b1 = g.add_vertex(VertexType.BOUNDARY, 0, 4)
        t = g.add_vertex(VertexType.Z, 0, 2)
        n = g.add_vertex(VertexType.Z, 1, 2, phase=c)
        v = g.add_vertex(VertexType.Z, 2, 2, phase=Fraction(1, 4))
        g.add_edge((b0, t)); g.add_edge((t, b1))
        g.add_edge((t, n), EdgeType.HADAMARD); g.add_edge((n, v), EdgeType.HADAMARD)
        g.set_inputs((b0,)); g.set_outputs((b1,))

        orig = g.copy()
        gadget_simp(g)
        for c_val in (0, 1):
            self.assertTrue(tensors_match(g, orig, c=c_val),
                            f"gadget_simp drifted at c={c_val}")

    def test_teleport_reduce(self):
        """`teleport_reduce` must commute with substitution for a boolean axel.

        Two phase gadgets sharing parity {target}: boolean axel `c` and
        constant pi axel, both with T leaves.
        """
        def build(c_val=None):
            g = Graph()
            c = (new_var('c', is_bool=True, registry=g.var_registry)
                 if c_val is None else Fraction(c_val))
            b0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
            b1 = g.add_vertex(VertexType.BOUNDARY, 0, 4)
            t = g.add_vertex(VertexType.Z, 0, 2)
            n1 = g.add_vertex(VertexType.Z, 1, 2, phase=c)
            v1 = g.add_vertex(VertexType.Z, 2, 2, phase=Fraction(1, 4))
            n2 = g.add_vertex(VertexType.Z, -1, 2, phase=Fraction(1))
            v2 = g.add_vertex(VertexType.Z, -2, 2, phase=Fraction(1, 4))
            g.add_edge((b0, t)); g.add_edge((t, b1))
            g.add_edge((t, n1), EdgeType.HADAMARD); g.add_edge((n1, v1), EdgeType.HADAMARD)
            g.add_edge((t, n2), EdgeType.HADAMARD); g.add_edge((n2, v2), EdgeType.HADAMARD)
            g.set_inputs((b0,)); g.set_outputs((b1,))
            return g

        g_tel = teleport_reduce(build())
        for c_val in (0, 1):
            ref = teleport_reduce(build(c_val))
            got = g_tel.substitute_variables({'c': Fraction(c_val)})
            self.assertTrue(compare_tensors(ref.to_tensor(), got.to_tensor()),
                            f"teleport_reduce drifted at c={c_val}")

    def test_unsafe_pauli_push(self):
        """`unsafe_pauli_push` must preserve the tensor for a boolean Pauli."""
        g = Graph()
        c = new_var('c', is_bool=True, registry=g.var_registry)
        b0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        b1 = g.add_vertex(VertexType.BOUNDARY, 0, 4)
        v = g.add_vertex(VertexType.Z, 0, 1, phase=Fraction(1, 4))
        w = g.add_vertex(VertexType.X, 0, 3, phase=c)
        g.add_edge((b0, v)); g.add_edge((v, w)); g.add_edge((w, b1))
        g.set_inputs((b0,)); g.set_outputs((b1,))

        orig = g.copy()
        unsafe_pauli_push(g, v, w)
        for c_val in (0, 1):
            self.assertTrue(tensors_match(g, orig, c=c_val),
                            f"unsafe_pauli_push drifted at c={c_val}")

    def test_unsafe_pivot(self):
        """`unsafe_pivot` must preserve the tensor for boolean pivot phases."""
        g = Graph()
        c1 = new_var('c1', is_bool=True, registry=g.var_registry)
        c2 = new_var('c2', is_bool=True, registry=g.var_registry)
        b0 = g.add_vertex(VertexType.BOUNDARY, 0, 0)
        b1 = g.add_vertex(VertexType.BOUNDARY, 0, 4)
        v0 = g.add_vertex(VertexType.Z, 0, 2, phase=c1)
        v1 = g.add_vertex(VertexType.Z, 0, 2.5, phase=c2)
        g.add_edge((b0, v0), EdgeType.HADAMARD)
        g.add_edge((v0, v1), EdgeType.HADAMARD)
        g.add_edge((v1, b1), EdgeType.HADAMARD)
        g.set_inputs((b0,)); g.set_outputs((b1,))

        orig = g.copy()
        unsafe_pivot(g, v0, v1)
        for c1v in (0, 1):
            for c2v in (0, 1):
                self.assertTrue(tensors_match(g, orig, c1=c1v, c2=c2v),
                                f"unsafe_pivot drifted at c1={c1v}, c2={c2v}")


if __name__ == '__main__':
    unittest.main()
