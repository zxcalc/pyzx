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

"""Large Pauli-flow correctness test on a 200-spider graph.

This larger graph is kept outside standard unittest discovery because of its
size. Run the test explicitly from the repository root with:

    python -m unittest tests.large_flow_test
"""

import json
import unittest
from fractions import Fraction
from pathlib import Path

from pyzx.flow import pauli_flow
from pyzx.graph import Graph
from pyzx.utils import EdgeType, VertexType
from tests.flow_test_utils import assert_valid_flow


class TestLargeFlow(unittest.TestCase):

    def test_large_pauli_flow(self):
        data = json.loads((Path(__file__).parent / "data/large_flow_graph.json").read_text())
        graph = Graph()
        vertices = [graph.add_vertex(VertexType.Z, phase=Fraction(1, 4))
                    for _ in data["neighbours"]]
        for v in data["x_vertices"]:
            graph.set_phase(vertices[v], Fraction(0))
        for v in data["y_vertices"]:
            graph.set_phase(vertices[v], Fraction(1, 2))
        for u, row in enumerate(data["neighbours"]):
            for v in row:
                graph.add_edge((vertices[u], vertices[v]), EdgeType.HADAMARD)
        for side, setter in (("inputs", graph.set_inputs), ("outputs", graph.set_outputs)):
            boundaries = []
            for v in data[side]:
                b = graph.add_vertex(VertexType.BOUNDARY)
                graph.add_edge((vertices[v], b), EdgeType.SIMPLE)
                boundaries.append(b)
            setter(tuple(boundaries))
        self.assertEqual(graph.num_vertices(), 228)
        self.assertEqual(graph.num_edges(), 1683)
        before = graph.to_json()

        result = pauli_flow(graph)
        assert_valid_flow(self, graph, result, True)
        layers = pauli_flow(graph, layers_only=True)
        self.assertEqual(layers, result[0])
        self.assertEqual(graph.to_json(), before)


if __name__ == '__main__':
    unittest.main()
