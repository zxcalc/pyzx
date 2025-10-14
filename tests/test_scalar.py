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
from pyzx.symbolic import Poly, new_var

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')


class TestScalar(unittest.TestCase):

    def test_initialization(self):
        scalar = Scalar()
        self.assertEqual(scalar.power2, 0)
        self.assertEqual(scalar.phase, Fraction(0))
        self.assertEqual(scalar.phasenodes, [])
        self.assertEqual(scalar.sum_of_phases, {})
        self.assertEqual(scalar.floatfactor, 1.0)
        self.assertFalse(scalar.is_unknown)
        self.assertFalse(scalar.is_zero)

    def test_copy(self):
        scalar = Scalar()
        scalar.power2 = 2
        scalar.phase = Fraction(1, 3)
        scalar.phasenodes = [Fraction(1, 2)]
        scalar.sum_of_phases = {Fraction(1, 4): 2, Fraction(3, 4): -1}
        scalar.floatfactor = 2.0
        copied_scalar = scalar.copy()
        self.assertEqual(copied_scalar.power2, 2)
        self.assertEqual(copied_scalar.phase, Fraction(1, 3))
        self.assertEqual(copied_scalar.phasenodes, [Fraction(1, 2)])
        self.assertEqual(copied_scalar.sum_of_phases, {Fraction(1, 4): 2, Fraction(3, 4): -1})
        self.assertEqual(copied_scalar.floatfactor, 2.0)
        self.assertFalse(copied_scalar.is_unknown)
        self.assertFalse(copied_scalar.is_zero)
        # Ensure deep copy - modifying one doesn't affect the other
        scalar.sum_of_phases[Fraction(1, 8)] = 3
        self.assertNotIn(Fraction(1, 8), copied_scalar.sum_of_phases)

    def test_conjugate(self):
        scalar = Scalar()
        scalar.phase = Fraction(1, 3)
        scalar.phasenodes = [Fraction(1, 2), Fraction(3, 4)]
        scalar.sum_of_phases = {Fraction(1, 4): 2, Fraction(3, 4): -1}
        scalar.floatfactor = 2.0 + 1.0j

        conjugated_scalar = scalar.conjugate()
        self.assertEqual(conjugated_scalar.phase, -Fraction(1, 3))
        self.assertEqual(conjugated_scalar.phasenodes, [-Fraction(1, 2), -Fraction(3, 4)])
        self.assertEqual(conjugated_scalar.sum_of_phases, {-Fraction(1, 4): 2, -Fraction(3, 4): -1})
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

    def test_multiply_sum_of_phases_basic(self):
        """Test basic functionality of multiply_sum_of_phases"""
        scalar = Scalar()
        phases_dict = {Fraction(1, 4): 2, Fraction(1, 2): -1}
        scalar.multiply_sum_of_phases(phases_dict)
        expected = {Fraction(1, 4): 2, Fraction(1, 2): -1}
        self.assertEqual(scalar.sum_of_phases, expected)

    def test_multiply_sum_of_phases_distributive(self):
        """Test distributive property: (a*e^ip1)(b*e^ip2) = (a*b)*e^i(p1+p2)"""
        scalar = Scalar()
        # First add some phases: 2*e^(i*pi/4) + 3*e^(i*pi/2)
        scalar.sum_of_phases = {Fraction(1, 4): 2, Fraction(1, 2): 3}
        # Multiply by: 1*e^(i*pi/3) + 2*e^(i*pi/6)
        new_phases = {Fraction(1, 3): 1, Fraction(1, 6): 2}
        scalar.multiply_sum_of_phases(new_phases)

        # Expected result using distributive law:
        # (2*e^(i*pi/4) + 3*e^(i*pi/2)) * (1*e^(i*pi/3) + 2*e^(i*pi/6))
        # = 2*1*e^(i*pi*(1/4+1/3)) + 2*2*e^(i*pi*(1/4+1/6)) + 3*1*e^(i*pi*(1/2+1/3)) + 3*2*e^(i*pi*(1/2+1/6))
        expected = {
            Fraction(7, 12): 2,  # 1/4 + 1/3 = 7/12
            Fraction(5, 12): 4,  # 1/4 + 1/6 = 5/12
            Fraction(5, 6): 3,   # 1/2 + 1/3 = 5/6
            Fraction(2, 3): 6    # 1/2 + 1/6 = 2/3
        }
        self.assertEqual(scalar.sum_of_phases, expected)

    def test_multiply_sum_of_phases_modulo_2(self):
        """Test that terms with same phase are combined correctly with modulo 2"""
        scalar = Scalar()
        scalar.sum_of_phases = {Fraction(1, 4): 2, Fraction(1, 2): 3}
        new_phases = {Fraction(7, 4): 1, Fraction(1, 2): 1}
        scalar.multiply_sum_of_phases(new_phases)

        # Calculate expected result using distributive law with modulo 2:
        # (2*e^(i*pi/4) + 3*e^(i*pi/2)) * (1*e^(i*pi*7/4) + 1*e^(i*pi/2))
        # =2*e^(i*pi*(1/4+7/4)) + 2*e^(i*pi*(1/4+1/2)) + 3*e^(i*pi*(1/2+7/4)) + 3*e^(i*pi*(1/2+1/2))
        # With modulo 2: 1/4+7/4=8/4=2→0, 1/4+1/2=3/4, 1/2+7/4=9/4→1/4, 1/2+1/2=1
        expected = {
            0: 2,              # from 1/4 + 7/4 = 8/4 = 2 = 0 (mod 2)
            Fraction(3, 4): 2, # from 1/4 + 1/2 = 3/4
            Fraction(1, 4): 3, # from 1/2 + 7/4 = 9/4 = 1/4 (mod 2)
            1: 3               # from 1/2 + 1/2 = 1
        }
        self.assertEqual(scalar.sum_of_phases, expected)

    def test_multiply_sum_of_phases_combining_terms(self):
        """Test that terms with the same phase are properly combined"""
        scalar = Scalar()
        scalar.sum_of_phases = {Fraction(-1, 4): 2, Fraction(1, 2): 3}
        # Multiply by phases that will create overlapping terms
        new_phases = {Fraction(3, 4): 1, Fraction(3, 2): -1}
        scalar.multiply_sum_of_phases(new_phases)
        # Expected result:
        # (2*e^(-i*pi/4) + 3*e^(i*pi/2)) * (1*e^(i*pi*3/4) - 1*e^(i*pi*3/2))
        # = 2*e^(i*pi(-1/4+3/4)) - 2*e^(i*pi(-1/4+3/2)) + 3*e^(i*pi(1/2+3/4)) - 3*e^(i*pi(1/2+3/2))
        # = 2*e^(i*pi*1/2) - 2*e^(i*pi*5/4) + 3*e^(i*pi*5/4) - 3*e^(i*pi*2)
        # = 2*e^(i*pi*1/2) + (3-2)*e^(i*pi*5/4) - 3*e^(i*pi*0)
        expected = {
            Fraction(1, 2): 2,
            Fraction(5, 4): 1,
            0: -3
        }
        self.assertEqual(scalar.sum_of_phases, expected)

    def test_to_number_with_sum_of_phases(self):
        """Test to_number method works correctly with sum_of_phases"""
        scalar = Scalar()
        scalar.sum_of_phases = {Fraction(1, 4): 1, Fraction(1, 2): 2}
        expected = np.exp(1j * np.pi * 0.25) + 2 * np.exp(1j * np.pi * 0.5)
        result = scalar.to_number()
        self.assertAlmostEqual(result.real, expected.real, places=10)
        self.assertAlmostEqual(result.imag, expected.imag, places=10)

    def test_to_number_combined_factors(self):
        """Test to_number with combination of phase, phasenodes, and sum_of_phases"""
        scalar = Scalar()
        scalar.phase = Fraction(1, 8)
        scalar.power2 = 1
        scalar.phasenodes = [Fraction(1, 2)]
        scalar.sum_of_phases = {Fraction(1, 4): 1, Fraction(1, 3): 2}
        scalar.floatfactor = 2.5

        # Expected calculation:
        # val = e^(i*pi/8) * (1 + e^(i*pi/2)) * (1*e^(i*pi/4) + 2*e^(i*pi/3)) * sqrt(2) * 2.5
        phase_val = np.exp(1j * np.pi / 8)
        phasenodes_val = 1 + np.exp(1j * np.pi / 2)
        sum_phases_val = np.exp(1j * np.pi / 4) + 2 * np.exp(1j * np.pi / 3)
        expected = phase_val * phasenodes_val * sum_phases_val * np.sqrt(2) * 2.5

        result = scalar.to_number()
        self.assertAlmostEqual(result.real, expected.real, places=10)
        self.assertAlmostEqual(result.imag, expected.imag, places=10)

    def test_add_spider_pair_generic_case(self):
        """Test add_spider_pair generic case that uses sum_of_phases"""
        scalar = Scalar()
        p1 = Fraction(1, 3)  # Non-Clifford phase
        p2 = Fraction(2, 5)  # Non-Clifford phase
        scalar.add_spider_pair(p1, p2)
        # Should add: 2^(-1) * (1 + e^(i*pi*p1) + e^(i*pi*p2) - e^(i*pi*(p1+p2)))
        self.assertEqual(scalar.power2, -1)
        expected_sum = {0: 1, p1: 1, p2: 1, (p1 + p2) % 2: -1}
        self.assertEqual(scalar.sum_of_phases, expected_sum)

    def test_add_spider_pair_pauli_cases(self):
        """Test add_spider_pair with Pauli phases (0 and 1)"""
        # Case 1: p1 = 0
        scalar1 = Scalar()
        scalar1.add_spider_pair(0, Fraction(1, 3))
        self.assertEqual(scalar1.power2, 1)
        self.assertEqual(scalar1.phase, 0)
        self.assertEqual(scalar1.sum_of_phases, {})
        self.assertEqual(scalar1.phasenodes, [])

        # Case 2: p1 = 1
        scalar2 = Scalar()
        scalar2.add_spider_pair(1, Fraction(1, 3))
        self.assertEqual(scalar2.power2, 1)
        self.assertEqual(scalar2.phase, Fraction(1, 3))  # 1 * 1/3 = 1/3
        self.assertEqual(scalar2.sum_of_phases, {})
        self.assertEqual(scalar2.phasenodes, [])

    def test_add_spider_pair_clifford_cases(self):
        """Test add_spider_pair with Clifford phases"""
        # Test with p1 = 1/2 (Clifford but not Pauli)
        scalar = Scalar()
        p1 = Fraction(1, 2)
        p2 = Fraction(1, 3)
        scalar.add_spider_pair(p1, p2)
        expected_phase = (Fraction(3,2) * p1 - Fraction(1,2)) % 2  # 3/4 - 1/2 = 1/4
        expected_node = (p2 - p1) % 2
        self.assertEqual(scalar.phase, expected_phase)
        self.assertEqual(scalar.phasenodes, [expected_node])

        # Test with p1 = 3/2 (also Clifford but not Pauli)
        scalar = Scalar()
        p1 = Fraction(3, 2)
        scalar.add_spider_pair(p1, p2)
        expected_phase = (Fraction(3,2) * p1 - Fraction(1,2)) % 2  # 9/4 - 1/2 = 7/4
        expected_node = (p2 - p1) % 2
        self.assertEqual(scalar.phase, expected_phase)
        self.assertEqual(scalar.phasenodes, [expected_node])

    def test_mult_with_scalar_sum_of_phases(self):
        """Test that mult_with_scalar properly handles sum_of_phases"""
        scalar1 = Scalar()
        scalar1.sum_of_phases = {Fraction(1, 4): 2}
        scalar2 = Scalar()
        scalar2.sum_of_phases = {Fraction(1, 3): 3}
        scalar1.mult_with_scalar(scalar2)
        expected_sum_of_phases = {Fraction(1, 4) + Fraction(1, 3): 2 * 3}
        self.assertEqual(scalar1.sum_of_phases, expected_sum_of_phases)

    def test_serialization(self):
        """Test to_dict and from_json"""
        scalar = Scalar()
        scalar.phase = Fraction(1, 4)
        scalar.power2 = 2
        scalar.sum_of_phases = {Fraction(1, 8): 3, Fraction(3, 8): -2}
        scalar.floatfactor = 1.5

        # Test to_dict
        d = scalar.to_dict()
        self.assertIn("sum_of_phases", d)
        self.assertEqual(d["sum_of_phases"], {"1/8": 3, "3/8": -2})

        # Test round-trip serialization
        json_str = scalar.to_json()
        restored_scalar = Scalar.from_json(json_str)

        self.assertEqual(restored_scalar.phase, scalar.phase)
        self.assertEqual(restored_scalar.power2, scalar.power2)
        self.assertEqual(restored_scalar.sum_of_phases, scalar.sum_of_phases)
        self.assertEqual(restored_scalar.floatfactor, scalar.floatfactor)

    def test_sum_of_phases_zero_handling(self):
        """Test that zero coefficients are handled properly"""
        scalar = Scalar()
        # Start with some phases
        scalar.sum_of_phases = {Fraction(1, 4): 1, Fraction(1, 2): 3}

        # Multiply by phases that will create zero coefficients
        new_phases = {Fraction(1, 4): -1, Fraction(1, 2): 3}  # This creates terms that might cancel
        scalar.multiply_sum_of_phases(new_phases)
        # Verify no zero coefficients remain
        for coeff in scalar.sum_of_phases.values():
            self.assertNotEqual(coeff, 0, "Zero coefficients should be removed or handled properly")

    def test_conjugate_preserves_sum_of_phases_structure(self):
        """Test that conjugate properly negates all phases in sum_of_phases"""
        scalar = Scalar()
        original_phases = {Fraction(1, 4): 2, Fraction(3, 8): -1, 0: 5}
        scalar.sum_of_phases = original_phases.copy()
        conjugated = scalar.conjugate()

        # All phases should be negated
        expected_conjugated_phases = {-phase: coeff for phase, coeff in original_phases.items()}
        self.assertEqual(conjugated.sum_of_phases, expected_conjugated_phases)

        # Verify mathematical correctness
        self.assertAlmostEqual(conjugated.to_number(), scalar.to_number().conjugate())

    def test_scalar_poly_phase_arithmetic(self):
        """Test that Poly phases work correctly in scalar arithmetic operations"""
        x = new_var('x', False)

        # Test phase addition in add_phase
        scalar = Scalar()
        scalar.phase = x + Fraction(1, 4)
        scalar.add_phase(Fraction(1, 8))  # Should add to existing phase
        expected_phase = (x + Fraction(1, 4) + Fraction(1, 8)) % 2
        self.assertEqual(scalar.phase, expected_phase)

        # Test that Poly phases work in sum_of_phases arithmetic
        scalar.sum_of_phases = {x: 1, x + Fraction(1, 2): 2}
        scalar.multiply_sum_of_phases({Fraction(1, 4): 1})

        expected = {
            (x + Fraction(1, 4)) % 2: 1,
            (x + Fraction(1, 2) + Fraction(1, 4)) % 2: 2
        }
        self.assertEqual(scalar.sum_of_phases, expected)

    def test_add_spider_pair_with_poly_phases(self):
        """Test add_spider_pair with symbolic Poly phases"""
        x = new_var('x', False)
        y = new_var('y', False)

        scalar = Scalar()
        scalar.add_spider_pair(x, y)

        # Should use generic case and create sum_of_phases
        self.assertEqual(scalar.power2, -1)
        expected_sum = {0: 1, x: 1, y: 1, (x + y) % 2: -1}
        self.assertEqual(scalar.sum_of_phases, expected_sum)

    def test_add_spider_pair_with_pauli_poly(self):
        """Test add_spider_pair with one Poly phase being Pauli (0 or 1)"""
        x = new_var('x', False)
        y = new_var('y', True)  # y is a Boolean variable, i.e., Pauli

        scalar1 = Scalar()
        scalar1.add_spider_pair(x, y)
        self.assertEqual(scalar1.power2, 1)
        self.assertEqual(scalar1.phase, x*y)
        self.assertEqual(scalar1.sum_of_phases, {})
        self.assertEqual(scalar1.phasenodes, [])

    def test_add_spider_pair_mixed_fraction_poly(self):
        """Test add_spider_pair with one Fraction and one Poly phase"""
        x = new_var('x', False)

        scalar = Scalar()
        p1 = Fraction(1, 3)  # Fraction phase
        p2 = x + Fraction(1, 4)  # Poly phase

        scalar.add_spider_pair(p1, p2)

        # Should use generic case since neither is Pauli/Clifford
        self.assertEqual(scalar.power2, -1)
        expected_sum = {0: 1, p1: 1, p2: 1, (p1 + p2) % 2: -1}
        self.assertEqual(scalar.sum_of_phases, expected_sum)

    def test_multiply_sum_of_phases_with_poly(self):
        """Test multiply_sum_of_phases with Poly objects"""
        x = new_var('x', False)
        y = new_var('y', False)
        scalar = Scalar()
        scalar.sum_of_phases = {x: 2, Fraction(1, 4): 3}
        # Multiply with phases containing Poly
        new_phases = {y: 1, x: -1}
        scalar.multiply_sum_of_phases(new_phases)
        # Expected result using distributive law:
        # (2*e^(i*pi*x) + 3*e^(i*pi/4)) * (1*e^(i*pi*y) - 1*e^(i*pi*x))
        expected = {
            (x + y) % 2: 2,
            (2*x) % 2: -2,
            (Fraction(1, 4) + y) % 2: 3,
            (Fraction(1, 4) + x) % 2: -3
        }
        self.assertEqual(scalar.sum_of_phases, expected)

    def test_mixed_fraction_and_poly_phases(self):
        """Test mixing Fraction and Poly phases in sum_of_phases"""
        x = new_var('x', False)

        scalar = Scalar()
        # Mix Fraction and Poly phases
        scalar.sum_of_phases = {
            Fraction(1, 4): 2,          # Pure fraction
            x: 3,                       # Pure poly
            x + Fraction(1, 2): -1      # Mixed poly + fraction
        }

        # Test multiplication preserves mixed types
        new_phases = {Fraction(1, 8): 1, x: 2}
        scalar.multiply_sum_of_phases(new_phases)

        # Should handle all combinations correctly
        self.assertIsInstance(scalar.sum_of_phases, dict)
        # Verify we have terms of different types
        has_fraction = any(isinstance(phase, Fraction) for phase in scalar.sum_of_phases.keys())
        has_poly = any(isinstance(phase, Poly) for phase in scalar.sum_of_phases.keys())
        self.assertTrue(has_fraction or has_poly)  # Should have at least one type
        expected = {
            (Fraction(1, 4) + Fraction(1, 8)) % 2: 2,          # From Fraction * Fraction
            (Fraction(1, 4) + x) % 2: 4,                       # From Fraction * Poly
            (x + Fraction(1, 8)) % 2: 3,                       # From Poly * Fraction
            (x + x) % 2: 6,                                    # From Poly * Poly
            (x + Fraction(1, 2) + Fraction(1, 8)) % 2: -1,     # From Mixed * Fraction
            (x + Fraction(1, 2) + x) % 2: -2                   # From Mixed * Poly
        }
        self.assertEqual(scalar.sum_of_phases, expected)

    def test_poly_phase_modular_arithmetic(self):
        """Test that Poly phases respect modular arithmetic correctly"""
        x = new_var('x', False)
        scalar = Scalar()
        # Test that (x + 2) % 2 = x for symbolic phases
        large_poly_phase = x + 2  # Should reduce to x
        scalar.sum_of_phases = {large_poly_phase: 1}
        # Multiply to trigger modular reduction
        scalar.multiply_sum_of_phases({0: 1})
        expected_reduced_phase = large_poly_phase % 2
        self.assertIn(expected_reduced_phase, scalar.sum_of_phases)

    def test_scalar_conjugate_with_poly(self):
        """Test conjugation with Poly phases"""
        x = new_var('x', False)
        scalar = Scalar()
        scalar.phase = x + Fraction(1, 4)
        scalar.sum_of_phases = {x: 2, x + Fraction(1, 2): -1}
        scalar.phasenodes = [x]
        conjugated = scalar.conjugate()
        # All phases should be negated
        self.assertEqual(conjugated.phase, -(x + Fraction(1, 4)))
        expected_conjugated_phases = {-x: 2, -(x + Fraction(1, 2)): -1}
        self.assertEqual(conjugated.sum_of_phases, expected_conjugated_phases)
        self.assertEqual(conjugated.phasenodes, [-x])

    def test_mult_with_scalar_poly_phases(self):
        """Test mult_with_scalar with Poly phases"""
        x = new_var('x', False)
        y = new_var('y', False)

        scalar1 = Scalar()
        scalar1.phase = x
        scalar1.sum_of_phases = {y: 2}

        scalar2 = Scalar()
        scalar2.phase = Fraction(1, 8)
        scalar2.sum_of_phases = {x + y: 3}

        scalar1.mult_with_scalar(scalar2)

        # Check that phases are added
        expected_phase = (x + Fraction(1, 8)) % 2
        self.assertEqual(scalar1.phase, expected_phase)

        # Check sum_of_phases multiplication using distributive property
        expected_sum = {(y + x + y) % 2: 6}  # 2 * 3
        self.assertEqual(scalar1.sum_of_phases, expected_sum)

    def test_serialization_with_poly_phases(self):
        """Test serialization and deserialization with Poly phases"""
        x = new_var('x', False)
        y = new_var('y', False)

        scalar = Scalar()
        scalar.phase = x + Fraction(1, 4)
        scalar.sum_of_phases = {x: 2, y + Fraction(1, 2): -1}
        scalar.phasenodes = [y]
        scalar.power2 = 1
        scalar.floatfactor = 2.0

        # Test to_dict works with Poly phases
        d = scalar.to_dict()
        self.assertIn("sum_of_phases", d)
        self.assertIn("phase", d)

        # Test to_json works with Poly phases
        json_str = scalar.to_json()
        self.assertIsInstance(json_str, str)
        self.assertIn("x", json_str)  # Should contain the variable name

        # Test full round-trip serialization with Poly phases
        restored_scalar = Scalar.from_json(json_str)

        # Compare the restored scalar with the original
        self.assertEqual(restored_scalar.phase, scalar.phase)
        self.assertEqual(restored_scalar.power2, scalar.power2)
        self.assertEqual(restored_scalar.floatfactor, scalar.floatfactor)
        self.assertEqual(restored_scalar.sum_of_phases, scalar.sum_of_phases)
        self.assertEqual(restored_scalar.phasenodes, scalar.phasenodes)

    def test_string_representations_with_poly(self):
        """Test string representations work with Poly phases"""
        x = new_var('x', False)

        scalar = Scalar()
        scalar.phase = x
        scalar.sum_of_phases = {x + Fraction(1, 4): 2}
        scalar.power2 = 1

        # Test __str__ doesn't crash with Poly
        str_repr = str(scalar)
        self.assertIsInstance(str_repr, str)
        self.assertIn('x', str_repr)  # Should contain the variable name

        # Test to_latex doesn't crash with Poly
        latex_repr = scalar.to_latex()
        self.assertIsInstance(latex_repr, str)

        # Test to_unicode doesn't crash with Poly
        unicode_repr = scalar.to_unicode()
        self.assertIsInstance(unicode_repr, str)



if __name__ == '__main__':
    unittest.main()
