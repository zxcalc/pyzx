import sys
import unittest
from fractions import Fraction

from pyzx.symbolic import Poly, VarRegistry, new_const, new_var, parse

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')


class TestSymbolicParsing(unittest.TestCase):
    """Unit tests for the symbolic expression parser in pyzx.symbolic."""

    def setUp(self):
        """Set up test fixtures with a variable registry and new_var function."""
        self.registry = VarRegistry()
        def test_new_var(name: str) -> Poly:
            return new_var(name, False, self.registry)
        self.new_var = test_new_var

    def test_basic_addition_subtraction(self):
        """Test basic addition and subtraction operations."""
        # Test addition
        result = parse("x + y", self.new_var)
        expected = self.new_var("x") + self.new_var("y")
        self.assertEqual(result, expected)

        # Test subtraction
        result = parse("x - y", self.new_var)
        expected = self.new_var("x") - self.new_var("y")
        self.assertEqual(result, expected)

        # Test chained operations
        result = parse("x + y - z", self.new_var)
        expected = self.new_var("x") + self.new_var("y") - self.new_var("z")
        self.assertEqual(result, expected)

    def test_unary_negation(self):
        """Test unary negation of terms."""
        # Test simple negation
        result = parse("-x", self.new_var)
        expected = -self.new_var("x")
        self.assertEqual(result, expected)

        # Test negation with coefficients
        result = parse("-2*x", self.new_var)
        expected = -new_const(2) * self.new_var("x")
        self.assertEqual(result, expected)

        # Test negation in expressions
        result = parse("-x + y", self.new_var)
        expected = -self.new_var("x") + self.new_var("y")
        self.assertEqual(result, expected)

        # Test negation with parentheses
        result = parse("-(x + y)", self.new_var)
        expected = -(self.new_var("x") + self.new_var("y"))
        self.assertEqual(result, expected)

    def test_exponentiation(self):
        """Test exponentiation operations."""
        # Test simple exponentiation
        result = parse("x^2", self.new_var)
        expected = self.new_var("x") ** 2
        self.assertEqual(result, expected)

        # Test higher powers
        result = parse("y^3", self.new_var)
        expected = self.new_var("y") ** 3
        self.assertEqual(result, expected)

        # Test exponentiation with coefficients
        result = parse("2*x^2", self.new_var)
        expected = new_const(2) * (self.new_var("x") ** 2)
        self.assertEqual(result, expected)

        # Test exponentiation with parentheses
        result = parse("(x + y)^2", self.new_var)
        expected = (self.new_var("x") + self.new_var("y")) ** 2
        self.assertEqual(result, expected)

    def test_parentheses_grouping(self):
        """Test parentheses for grouping expressions."""
        # Test basic grouping
        result = parse("(x + y) * z", self.new_var)
        expected = (self.new_var("x") + self.new_var("y")) * self.new_var("z")
        self.assertEqual(result, expected)

        # Test nested parentheses
        result = parse("((x + y) * z) + w", self.new_var)
        expected = ((self.new_var("x") + self.new_var("y")) * self.new_var("z")) + self.new_var("w")
        self.assertEqual(result, expected)

        # Test precedence with parentheses
        result = parse("2 * (x + y)", self.new_var)
        expected = new_const(2) * (self.new_var("x") + self.new_var("y"))
        self.assertEqual(result, expected)

    def test_implicit_multiplication(self):
        """Test implicit multiplication (juxtaposition)."""
        # Test coefficient with variable
        result = parse("2x", self.new_var)
        expected = new_const(2) * self.new_var("x")
        self.assertEqual(result, expected)

        # Test explicit multiplication of single-character variables
        result = parse("x*y", self.new_var)
        expected = self.new_var("x") * self.new_var("y")
        self.assertEqual(result, expected)

        # Test explicit multiplication with dot operator
        result = parse("x⋅y", self.new_var)
        expected = self.new_var("x") * self.new_var("y")
        self.assertEqual(result, expected)

        # Test coefficient with multi-character variable
        result = parse("3*output", self.new_var)
        expected = new_const(3) * self.new_var("output")
        self.assertEqual(result, expected)

        # Test that xy is treated as single variable (not x*y)
        result = parse("xy", self.new_var)
        expected = self.new_var("xy")
        self.assertEqual(result, expected)

        # Test coefficient with multi-character variable using implicit multiplication
        result = parse("3output", self.new_var)
        expected = new_const(3) * self.new_var("output")
        self.assertEqual(result, expected)

        # Test with parentheses
        result = parse("2(x + y)", self.new_var)
        expected = new_const(2) * (self.new_var("x") + self.new_var("y"))
        self.assertEqual(result, expected)

        # Test with exponentiation
        result = parse("2x^2", self.new_var)
        expected = new_const(2) * (self.new_var("x") ** 2)
        self.assertEqual(result, expected)

    def test_constant_numbers(self):
        """Test constant number support."""
        # Test simple decimal
        result = parse("1.5", self.new_var)
        expected = new_const(Fraction(1.5).limit_denominator())
        self.assertEqual(result, expected)

        # Test decimal with variable
        result = parse("2.5*x", self.new_var)
        expected = new_const(Fraction(2.5).limit_denominator()) * self.new_var("x")
        self.assertEqual(result, expected)

        # Test decimal in expression
        result = parse("1.5*x + 0.25*y", self.new_var)
        expected = (new_const(Fraction(1.5).limit_denominator()) * self.new_var("x") +
                   new_const(Fraction(0.25).limit_denominator()) * self.new_var("y"))
        self.assertEqual(result, expected)

        # Test pi with decimals
        result = parse("3.14159*pi", self.new_var)
        expected = new_const(Fraction(3.14159).limit_denominator()) * new_const(1)
        self.assertEqual(result, expected)

        # Test integer constant
        result = parse("42", self.new_var)
        expected = new_const(42)
        self.assertEqual(result, expected)

        # Test integer constant with variable
        result = parse("5*x + 7", self.new_var)
        expected = new_const(5) * self.new_var("x") + new_const(7)
        self.assertEqual(result, expected)

        # Test fractions
        result = parse("1/2*x + 3/4*y", self.new_var)
        expected = (new_const(Fraction(1, 2)) * self.new_var("x") +
                   new_const(Fraction(3, 4)) * self.new_var("y"))
        self.assertEqual(result, expected)

        # Test pi fractions
        result = parse("pi/4 + 2*pi/3", self.new_var)
        expected = (new_const(Fraction(1, 4)) + new_const(Fraction(2, 3)))
        self.assertEqual(result, expected)

    def test_dot_multiplication(self):
        """Test dot multiplication operator ⋅."""
        # Test simple dot multiplication
        result = parse("x⋅y", self.new_var)
        expected = self.new_var("x") * self.new_var("y")
        self.assertEqual(result, expected)

        # Test dot with coefficients
        result = parse("2⋅x", self.new_var)
        expected = new_const(2) * self.new_var("x")
        self.assertEqual(result, expected)

        # Test mixed multiplication operators
        result = parse("2⋅x*y", self.new_var)
        expected = new_const(2) * self.new_var("x") * self.new_var("y")
        self.assertEqual(result, expected)

        # Test dot with parentheses
        result = parse("x⋅(y + z)", self.new_var)
        expected = self.new_var("x") * (self.new_var("y") + self.new_var("z"))
        self.assertEqual(result, expected)

    def test_complex_expressions(self):
        """Test complex mathematical expressions combining all features."""
        # Test polynomial expression
        result = parse("2x^2 - 3x*y + y^2", self.new_var)
        expected = (new_const(2) * (self.new_var("x") ** 2) -
                   new_const(3) * self.new_var("x") * self.new_var("y") +
                   (self.new_var("y") ** 2))
        self.assertEqual(result, expected)

        # Test with decimals and parentheses
        result = parse("1.5(x + y)^2 - 0.5z", self.new_var)
        expected = (new_const(Fraction(1.5).limit_denominator()) * ((self.new_var("x") + self.new_var("y")) ** 2) -
                   new_const(Fraction(0.5).limit_denominator()) * self.new_var("z"))
        self.assertEqual(result, expected)

        # Test with pi and fractions
        result = parse("pi*r^2 + 1/2*h", self.new_var)
        expected = (new_const(1) * (self.new_var("r") ** 2) +
                   new_const(Fraction(1, 2)) * self.new_var("h"))
        self.assertEqual(result, expected)

        # Test with negative terms and grouping
        result = parse("-2(x - y)^2 + 3x*y", self.new_var)
        expected = (-new_const(2) * ((self.new_var("x") - self.new_var("y")) ** 2) +
                   new_const(3) * self.new_var("x") * self.new_var("y"))
        self.assertEqual(result, expected)

    def test_operator_precedence(self):
        """Test that operator precedence is handled correctly."""
        # Test multiplication before addition
        result = parse("2*x + 3*y", self.new_var)
        expected = new_const(2) * self.new_var("x") + new_const(3) * self.new_var("y")
        self.assertEqual(result, expected)

        # Test exponentiation before multiplication
        result = parse("2*x^2", self.new_var)
        expected = new_const(2) * (self.new_var("x") ** 2)
        self.assertEqual(result, expected)

        # Test parentheses override precedence
        result = parse("2*(x + y)^2", self.new_var)
        expected = new_const(2) * ((self.new_var("x") + self.new_var("y")) ** 2)
        self.assertEqual(result, expected)





if __name__ == '__main__':
    unittest.main()
