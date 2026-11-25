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


import itertools
import sys
import unittest

from pyzx.symbolic import GroebnerBasis, Poly, Term, Var

if __name__ == "__main__":
    sys.path.append("..")
    sys.path.append(".")


class TestPoly(unittest.TestCase):
    def test_degrevlex_leading_term(self):
        """Leading term of a polynomial in degree reverse lexicographic order works with respect to various variable orderings."""

        x, y, z = Var("x"), Var("y"), Var("z")

        t1 = (1, Term([(x, 2), (y, 2)]))
        t2 = (2, Term([(x, 2), (y, 1), (z, 1)]))
        t3 = (3, Term([(y, 1), (z, 3)]))
        t4 = (-1, Term([(x, 1), (y, 1), (z, 1)])) # Smaller degree -- should never be largest
        p = Poly([t1, t2, t3, t4])

        self.assertEqual(GroebnerBasis([], [x, y, z]).degrevlex_leading(p), t1)
        self.assertEqual(GroebnerBasis([], [x, z, y]).degrevlex_leading(p), t2)
        self.assertEqual(GroebnerBasis([], [y, x, z]).degrevlex_leading(p), t1)
        self.assertEqual(GroebnerBasis([], [y, z, x]).degrevlex_leading(p), t3)
        self.assertEqual(GroebnerBasis([], [z, x, y]).degrevlex_leading(p), t3)
        self.assertEqual(GroebnerBasis([], [z, y, x]).degrevlex_leading(p), t3)

    def test_s_polynomial(self):
        """Verify S-polynomial computation of two polynomials."""

        x, y, z = Var("x"), Var("y"), Var("z")
        basis = GroebnerBasis([], [x, y, z])
        # Leading monomials share factors
        f = Poly([
            (2, Term([(x, 2)])),
            (2, Term([(y, 1)])),
        ])  # 2x^2 + 2y
        g = Poly([
            (2, Term([(x, 1), (y, 1)])),
            (2, Term([(z, 1)])),
        ])  # 2xy + 2z
        expected = Poly([
            (-1, Term([(x, 1), (z, 1)])),
            (1, Term([(y, 2)])),
        ])  # -xz + y^2
        self.assertEqual(basis.s_polynomial(f, g), expected)

        # Leading monomial of g divides leading monomial of f
        f = Poly([
            (2, Term([(x, 2), (y, 1)])),
            (4, Term([(z, 1)])),
        ])  # 2x^2y + 4z
        g = Poly([
            (4, Term([(x, 1), (y, 1)])),
            (8, Term([(z, 2)])),
        ])  # 4xy + 8z^2
        expected = Poly([
            (-2, Term([(x, 1), (z, 2)])),
            (2, Term([(z, 1)])),
        ])  # -2xz^2 + 2z
        self.assertEqual(basis.s_polynomial(f, g), expected)

        # Coprime leading monomials
        f = Poly([
            (2, Term([(x, 1)])),
            (4, Term([(y, 1)])),
        ])  # 2x + 4y
        g = Poly([
            (4, Term([(y, 1)])),
            (4, Term([(z, 1)])),
        ])  # 4y + 4z
        expected = Poly([
            (2, Term([(y, 2)])),
            (-1, Term([(x, 1), (z, 1)])),
        ])  # 2y^2 - xz
        self.assertEqual(basis.s_polynomial(f, g), expected)

    def test_groebner_reduce(self):
        """Gröbner basis reduction works correctly on a set of polynomials."""

        x, y, z = Var("x"), Var("y"), Var("z")

        # Directly set the basis instead of relying on GroebnerBasis.__init__
        # We only want to test the reduction function, not the basis creation
        basis = GroebnerBasis([], [x, y, z])
        basis.basis = [
            Poly([
                (1, Term([(x, 2)])),
                (-1, Term([(y, 1)])),
            ]), # x^2 - y
            Poly([
                (1, Term([(x, 1), (y, 1)])),
                (-1, Term([(z, 1)])),
            ]), # xy - z
            Poly([
                (1, Term([(y, 2)])),
                (-1, Term([(x, 1), (z, 1)])),
            ]), # y^2 - xz
            Poly([
                (1, Term([(z, 2)])),
                (-1, Term([])),
            ]), # z^2 - 1
        ]

        # x^2 -> y
        p = Poly([(1, Term([(x, 2)]))])
        expected = Poly([(1, Term([(y, 1)]))])
        self.assertEqual(basis.reduce(p), expected)

        # xy -> z
        p = Poly([(1, Term([(x, 1), (y, 1)]))])
        expected = Poly([(1, Term([(z, 1)]))])
        self.assertEqual(basis.reduce(p), expected)

        # y^2 -> xz
        p = Poly([(1, Term([(y, 2)]))])
        expected = Poly([(1, Term([(x, 1), (z, 1)]))])
        self.assertEqual(basis.reduce(p), expected)

        # z^2 -> 1
        p = Poly([(1, Term([(z, 2)]))])
        expected = Poly([(1, Term([]))])
        self.assertEqual(basis.reduce(p), expected)

        # x^2 + xy + y^2 + z^2 -> xz + y + z + 1
        p = Poly([
            (1, Term([(x, 2)])),
            (1, Term([(x, 1), (y, 1)])),
            (1, Term([(y, 2)])),
            (1, Term([(z, 2)])),
        ])
        expected = Poly([
            (1, Term([(y, 1)])),
            (1, Term([(z, 1)])),
            (1, Term([(x, 1), (z, 1)])),
            (1, Term([])),
        ])
        self.assertEqual(basis.reduce(p), expected)

        # 2x^2y + 3xy^2 - 4z^2 -> 2xz + 3yz - 4
        p = Poly([
            (2, Term([(x, 2), (y, 1)])),
            (3, Term([(x, 1), (y, 2)])),
            (-4, Term([(z, 2)])),
        ])
        expected = Poly([
            (2, Term([(x, 1), (z, 1)])),
            (3, Term([(y, 1), (z, 1)])),
            (-4, Term([])),
        ])
        self.assertEqual(basis.reduce(p), expected)

    def test_groebner_basis(self):
        """Verify property of Gröbner basis of a set of polynomials."""

        w, x, y, z = Var("w"), Var("x"), Var("y"), Var("z")
        polys = [
            Poly([
                (1, Term([(x, 2)])),
                (1, Term([(y, 2)])),
                (-1, Term([(z, 1)])),
            ]), # x^2 + y^2 - z
            Poly([
                (1, Term([(x, 1), (y, 1)])),
                (1, Term([(z, 2)])),
                (-1, Term([(w, 1)])),
            ]), # xy + z^2 - w
            Poly([
                (1, Term([(w, 1), (x, 1)])),
                (1, Term([(y, 1), (z, 1)])),
                (-1, Term([])),
            ]), # wx + yz - 1
            Poly([
                (1, Term([(w, 1), (z, 1)])),
                (-1, Term([(y, 1)])),
                (1, Term([(x, 1)])),
            ]), # wz - y + x
        ]

        basis = GroebnerBasis(polys, [w, x, y, z])

        # Each input and output polynomial should reduce to 0 under the basis
        for poly in set(polys) | set(basis.basis):
            self.assertEqual(basis.reduce(poly), 0)

        # Each S-polynomial should reduce to 0 under the basis
        for f, g in itertools.combinations(basis.basis, 2):
            s = basis.s_polynomial(f, g)
            self.assertEqual(basis.reduce(s), 0)

if __name__ == "__main__":
    unittest.main()
