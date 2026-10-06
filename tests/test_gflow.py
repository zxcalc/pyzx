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

from pyzx.gflow import gflow
from pyzx.graph import Graph
from pyzx.utils import EdgeType, VertexType


class TestGFlow(unittest.TestCase):

    def test_pauli_y_diagonal_correction(self):
        """A Pauli-Y vertex can use the diagonal of the demand matrix."""
        graph = Graph()
        xy = graph.add_vertex(VertexType.Z, 0, 1, phase=Fraction(1, 4))
        output = graph.add_vertex(VertexType.Z, 1, 1)
        y = graph.add_vertex(VertexType.Z, 2, 1, phase=Fraction(1, 2))
        graph.add_edge((xy, output), EdgeType.HADAMARD)
        graph.add_edge((xy, y), EdgeType.HADAMARD)

        input_boundary = graph.add_vertex(VertexType.BOUNDARY, 0, 0)
        output_boundary = graph.add_vertex(VertexType.BOUNDARY, 1, 2)
        graph.add_edge((input_boundary, xy), EdgeType.SIMPLE)
        graph.add_edge((output, output_boundary), EdgeType.SIMPLE)
        graph.set_inputs((input_boundary,))
        graph.set_outputs((output_boundary,))

        for focus in (False, True):
            with self.subTest(focus=focus):
                result = gflow(graph, focus=focus, pauli=True)
                self.assertIsNotNone(result)
                if result is None:
                    continue
                _, corrections = result
                self.assertEqual(corrections[xy], {output})
                self.assertEqual(corrections[y], {output, y})


if __name__ == '__main__':
    unittest.main()
