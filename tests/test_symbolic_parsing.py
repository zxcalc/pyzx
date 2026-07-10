import sys
import unittest
import pyzx as zx

from fractions import Fraction
from pyzx.symbolic import Poly, Term, Var, VarRegistry, new_const, new_var, parse
 
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

        # Test pi symbol
        result = parse("π", self.new_var)
        expected = new_const(1)
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

    def test_subscripted_variables(self):
        """Test that subscripted variable names like c[0] can be parsed."""
        result = parse("c[0]", self.new_var)
        expected = self.new_var("c[0]")
        self.assertEqual(result, expected)

        # Multiple subscripted variables.
        result = parse("c[0] + c[1]", self.new_var)
        expected = self.new_var("c[0]") + self.new_var("c[1]")
        self.assertEqual(result, expected)

        # Mixed plain and subscripted variables.
        result = parse("x + c[2]", self.new_var)
        expected = self.new_var("x") + self.new_var("c[2]")
        self.assertEqual(result, expected)

        # Coefficient with subscripted variable.
        result = parse("3*c[0]", self.new_var)
        expected = new_const(3) * self.new_var("c[0]")
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

    def test_division(self):
        """Test division by a constant, including of symbolic expressions."""
        # Division of a variable by an integer.
        result = parse("x/2", self.new_var)
        expected = self.new_var("x") / 2
        self.assertEqual(result, expected)

        # Negated variable divided by an integer.
        result = parse("-x/4", self.new_var)
        expected = -self.new_var("x") / 4
        self.assertEqual(result, expected)

        # Division binds at the same level as multiplication, left to right.
        result = parse("2*x/4", self.new_var)
        expected = new_const(2) * self.new_var("x") / 4
        self.assertEqual(result, expected)

        # Division of a parenthesized expression.
        result = parse("(x + y)/2", self.new_var)
        expected = (self.new_var("x") + self.new_var("y")) / 2
        self.assertEqual(result, expected)

        # Division of a power.
        result = parse("x^2/2", self.new_var)
        expected = (self.new_var("x") ** 2) / 2
        self.assertEqual(result, expected)

        # Division by an integer yields an exact Fraction coefficient.
        result = parse("x/2", self.new_var)
        self.assertEqual(result.terms[0][0], Fraction(1, 2))

    def test_constant_fractions_remain_exact(self):
        """Adding general division must not turn `1/2` or `pi/4` into floats."""
        for expr, expected in [("1/2", Fraction(1, 2)), ("pi/4", Fraction(1, 4)),
                               ("2*pi/3", Fraction(2, 3)), ("2pi/4", Fraction(1, 2))]:
            result = parse(expr, self.new_var)
            self.assertEqual(result, new_const(expected))
            self.assertIsInstance(result.terms[0][0], Fraction)

    def test_division_by_zero_raises(self):
        """Division by any constant that evaluates to zero must raise.
        """
        from pyzx.symbolic import Poly
        with self.assertRaises(ZeroDivisionError):
            self.new_var("x") / 0
        with self.assertRaises(ZeroDivisionError):
            self.new_var("x") / new_const(0)
        with self.assertRaises(ZeroDivisionError):
            self.new_var("x") / Poly([])
        with self.assertRaises(ZeroDivisionError):
            Poly([]) / 0
        with self.assertRaises(ZeroDivisionError):
            Poly([]) / new_const(0)
        for expr in ["x/0", "(x-x)/0", "(1-1)/0", "0/0"]:
            with self.assertRaises(ZeroDivisionError,
                                   msg=f"expected {expr!r} to raise"):
                parse(expr, self.new_var)

    def test_chained_division_is_left_associative(self):
        """`x/2/3` must parse as `(x/2)/3`, not `x/(2/3)`.
        """
        for expr, expected in [
                ("x/2/3", Fraction(1, 6)),
                ("x/2/4", Fraction(1, 8)),
                ("1/2/3", Fraction(1, 6)),
        ]:
            result = parse(expr, self.new_var)
            self.assertEqual(result.terms[0][0], Fraction(expected),
                             msg=f"{expr!r} coefficient")
        result = parse("(x+y)/2/3", self.new_var)
        expected_poly = (self.new_var("x") + self.new_var("y")) / 6
        self.assertEqual(result, expected_poly)

    def test_division_by_decimal_uses_limit_denominator(self):
        """Decimal divisors go through `Fraction.limit_denominator`, so `x/2.5`
        divides by `Fraction(5, 2)` and yields `2/5 x` exactly (not `0.4 x`)."""
        result = parse("x/2.5", self.new_var)
        expected = self.new_var("x") / Fraction(5, 2)
        self.assertEqual(result, expected)
        self.assertEqual(result.terms[0][0], Fraction(2, 5))
        self.assertIsInstance(result.terms[0][0], Fraction)

    def test_division_by_non_constant_rejected(self):
        """Divisors must be constants; the grammar accepts them syntactically
        but `Poly.__truediv__` and `parse` should refuse to evaluate."""
        with self.assertRaises(ValueError):
            self.new_var("x") / self.new_var("y")
        with self.assertRaises(ValueError):
            self.new_var("x") / (self.new_var("y") + 1)
        for expr in ["x/y", "x/(y+1)", "x^2/x", "(x+1)/(x+1)", "x/(2*y)"]:
            with self.assertRaises(ValueError, msg=f"expected {expr!r} to be rejected"):
                parse(expr, self.new_var)

    def test_division_by_complex_constant(self):
        """`Poly.__truediv__` accepts complex divisors (symmetric with `__mul__`,
        for the `Scalar`-side use case), yielding `complex` coefficients. This
        path is only reachable via the Python API; the grammar has no complex
        literal."""
        x = self.new_var("x")
        divisor = 2 + 3j
        result = x / divisor
        self.assertEqual(len(result.terms), 1)
        coeff = result.terms[0][0]
        self.assertIsInstance(coeff, complex)
        self.assertEqual(coeff, 1 / divisor)

    def test_pi_rejected_in_divisor(self):
        """`pi` is a phase marker (== 1), and allowing it as a divisor silently results
        in `x/pi == x`. Reject at parse time."""
        for expr in ["x/pi", "x/(pi)", "x/pi^2", "x/(2*pi)", "x/(pi+1)", "x/(pi/2)"]:
            with self.assertRaises(ValueError, msg=f"expected {expr!r} to be rejected"):
                parse(expr, self.new_var)
        # Check that `pi` in the dividend or as a multiplicative factor is still fine.
        self.assertEqual(parse("pi/2", self.new_var), new_const(Fraction(1, 2)))
        self.assertEqual(parse("pi*x/2", self.new_var), self.new_var("x") / 2)


class TestBooleanIdempotency(unittest.TestCase):

    def test_term_mul_bool_idempotent(self):
        """Multiplying a boolean variable by itself must reduce a^2 to a."""
        a = Var('a', is_bool=True)
        t = Term([(a, 1)])
        self.assertEqual(t * t, t)

    def test_poly_mul_bool_idempotent(self):
        """a * a must equal a for boolean variable a."""
        a = new_var('a', is_bool=True)
        self.assertEqual(a * a, a)

    def test_poly_bool_annihilation(self):
        """a * (1 + a) must be zero for boolean a, since a^2 = a."""
        a = new_var('a', is_bool=True)
        self.assertEqual(a * (1 + a), Poly([]))


class TestPolyConjugate(unittest.TestCase):

    def test_conjugate_real_coefficients(self):
        self.assertEqual(Poly([(3, Term([]))]).conjugate(), Poly([(3, Term([]))]))
        self.assertEqual(Poly([(Fraction(1, 2), Term([]))]).conjugate(), Poly([(Fraction(1, 2), Term([]))]))
        self.assertEqual(Poly([(2.5, Term([]))]).conjugate(), Poly([(2.5, Term([]))]))

    def test_conjugate_complex_coefficients(self):
        p = Poly([((3+2j), Term([]))])
        result = p.conjugate()
        self.assertEqual(len(result.terms), 1)
        self.assertEqual(result.terms[0][0], (3-2j))

        var = Var('x')
        p = Poly([((1+2j), Term([(var, 1)])), ((3-4j), Term([]))])
        result = p.conjugate()
        coeffs = {t: c for c, t in result.terms}
        self.assertEqual(coeffs[Term([(var, 1)])], (1-2j))
        self.assertEqual(coeffs[Term([])], (3+4j))

    def test_conjugate_pure_imaginary(self):
        p = Poly([(2j, Term([]))])
        self.assertEqual(p.conjugate().terms[0][0], -2j)

class TestSymbolicBooleanRewrite(unittest.TestCase):

    def test_t_injection_reduces_correctly(self):
        """T injection should reduce to phase pi/4 regardless of measurement result."""

        circ = zx.qasm("""
OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
creg c[1];
reset q[1];
h q[1];
t q[1];
cx q[0],q[1];
measure q[1] -> c[0];
if (c==1) s q[0];
""")
        g = circ.to_graph()
        zx.full_reduce(g)
        # The leading `reset` on a fresh input leaves an orphan discard
        # component with a fresh boolean phase that `full_reduce` does not
        # remove. Drop it so only the injected phase remains.
        zx.drop_orphan_reset_discards(g)

        phases = g.phases()
        non_zero = {v: p for v, p in phases.items() if p != 0}
        self.assertEqual(len(non_zero), 1, f"Expected 1 non-zero phase, got {non_zero}")

        actual_phase = list(non_zero.values())[0]
        self.assertEqual(actual_phase, Fraction(1, 4), f"Expected Fraction(1,4), got {actual_phase}")



if __name__ == '__main__':
    unittest.main()
