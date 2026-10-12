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

"""Independent witness checks shared by the flow tests."""

import unittest
from fractions import Fraction
from typing import Dict, Optional, Set, Tuple

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.utils import VertexType


def assert_valid_flow(
    self: unittest.TestCase, graph: BaseGraph[VT, ET],
    result: Optional[Tuple[Dict[VT, int], Dict[VT, Set[VT]]]], pauli: bool,
    reverse: bool=False, include_ground_constraints: bool=False
) -> None:
    """Check correction parity and order independently of either solver."""
    self.assertIsNotNone(result)
    if result is None:
        return
    layers, corrections = result
    vertices = {v for v in graph.vertices()
                if graph.type(v) in (VertexType.Z, VertexType.X)}
    inputs = {v for b in graph.inputs() for v in graph.neighbors(b)} & vertices
    outputs = {v for b in graph.outputs() for v in graph.neighbors(b)} & vertices
    if reverse:
        inputs, outputs = outputs, inputs
    grounds = graph.grounds()
    self.assertEqual(set(layers), vertices)
    self.assertEqual(set(corrections), vertices - outputs - grounds)
    self.assertTrue(all(isinstance(layer, int) and layer >= 0 for layer in layers.values()))
    for v in outputs | grounds:
        self.assertEqual(layers[v], 0 if reverse else max(layers.values()))
    for u, correction in corrections.items():
        self.assertIsInstance(correction, set)
        self.assertLessEqual(correction, vertices)
        self.assertFalse(correction & inputs)
        for v in correction & outputs:
            if reverse:
                self.assertLess(layers[v], layers[u])
            else:
                self.assertGreater(layers[v], layers[u])
        odd = {v for v in vertices
               if len(set(graph.neighbors(v)) & correction) % 2}
        for v in vertices - outputs:
            if v in grounds and not include_ground_constraints:
                continue
            phase = graph.phase(v) % 2
            is_y = pauli and phase in (Fraction(1, 2), Fraction(3, 2))
            is_x = pauli and phase in (0, 1)
            coefficient = (v in odd) ^ (is_y and v in correction)
            self.assertEqual(coefficient, v == u)
            if not is_x and not is_y and v in correction and v not in grounds:
                self.assertNotEqual(u, v)
                if reverse:
                    self.assertLess(layers[v], layers[u])
                else:
                    self.assertGreater(layers[v], layers[u])
