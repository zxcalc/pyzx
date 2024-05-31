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
import numpy as np
from fractions import Fraction
from pyzx.graph.scalar import Scalar

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')


class TestScalar(unittest.TestCase):

    def test_initialization(self):
        scalar = Scalar()
        self.assertEqual(scalar.power2, 0)
        self.assertEqual(scalar.phase, Fraction(0))
        self.assertEqual(scalar.phasenodes, [])
        self.assertEqual(scalar.floatfactor, 1.0)
        self.assertFalse(scalar.is_unknown)
        self.assertFalse(scalar.is_zero)

    def test_copy(self):
        scalar = Scalar()
        scalar.power2 = 2
        scalar.phase = Fraction(1, 3)
        scalar.phasenodes = [Fraction(1, 2)]
        scalar.floatfactor = 2.0
        copied_scalar = scalar.copy()
        self.assertEqual(copied_scalar.power2, 2)
        self.assertEqual(copied_scalar.phase, Fraction(1, 3))
        self.assertEqual(copied_scalar.phasenodes, [Fraction(1, 2)])
        self.assertEqual(copied_scalar.floatfactor, 2.0)
        self.assertFalse(copied_scalar.is_unknown)
        self.assertFalse(copied_scalar.is_zero)

    def test_conjugate(self):
        scalar = Scalar()
        scalar.phase = Fraction(1, 3)
        scalar.phasenodes = [Fraction(1, 2), Fraction(3, 4)]
        scalar.floatfactor = 2.0 + 1.0j

        conjugated_scalar = scalar.conjugate()
        self.assertEqual(conjugated_scalar.phase, -Fraction(1, 3))
        self.assertEqual(conjugated_scalar.phasenodes, [-Fraction(1, 2), -Fraction(3, 4)])
        self.assertEqual(conjugated_scalar.floatfactor, 2.0 - 1.0j)
        self.assertAlmostEqual(conjugated_scalar.to_number(), scalar.to_number().conjugate())

    def test_to_number(self):
        scalar = Scalar()
        scalar.phase = Fraction(1, 4)
        scalar.phasenodes = [Fraction(1, 2)]
        scalar.floatfactor = 2.0
        scalar.power2 = 2
        number = scalar.to_number()
        expected_number = (np.exp(1j * np.pi * 0.25) * (1 + np.exp(1j * np.pi * 0.5)) * (2 ** 0.5) ** 2) * 2.0
        self.assertAlmostEqual(number.real, expected_number.real, places=5)
        self.assertAlmostEqual(number.imag, expected_number.imag, places=5)


if __name__ == '__main__':
    unittest.main()
