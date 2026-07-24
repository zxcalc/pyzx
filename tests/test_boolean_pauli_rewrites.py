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
    return compare_tensors(
        g1.substitute_variables(subs),
        g2.substitute_variables(subs),
        preserve_scalar=True,
    )


class TestBooleanPauliRewrites(unittest.TestCase):

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
