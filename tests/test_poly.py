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

from pyzx.symbolic import (Poly, Term, Var, degrevlex_leading, groebner_basis,
                           groebner_reduce, s_polynomial)

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

        self.assertEqual(degrevlex_leading(p, [x, y, z]), t1)
        self.assertEqual(degrevlex_leading(p, [x, z, y]), t2)
        self.assertEqual(degrevlex_leading(p, [y, x, z]), t1)
        self.assertEqual(degrevlex_leading(p, [y, z, x]), t3)
        self.assertEqual(degrevlex_leading(p, [z, x, y]), t3)
        self.assertEqual(degrevlex_leading(p, [z, y, x]), t3)

    def test_s_polynomial(self):
        """Verify S-polynomial computation of two polynomials."""

        x, y, z = Var("x"), Var("y"), Var("z")
        vars = [x, y, z]

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
        self.assertEqual(s_polynomial(f, g, vars), expected)

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
        self.assertEqual(s_polynomial(f, g, vars), expected)

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
        self.assertEqual(s_polynomial(f, g, vars), expected)

    def test_groebner_reduce(self):
        """Gröbner basis reduction works correctly on a set of polynomials."""

        x, y, z = Var("x"), Var("y"), Var("z")
        vars = [x, y, z]
        
        basis = [
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
        self.assertEqual(groebner_reduce(p, basis, vars), expected)

        # xy -> z
        p = Poly([(1, Term([(x, 1), (y, 1)]))])
        expected = Poly([(1, Term([(z, 1)]))])
        self.assertEqual(groebner_reduce(p, basis, vars), expected)

        # y^2 -> xz
        p = Poly([(1, Term([(y, 2)]))])
        expected = Poly([(1, Term([(x, 1), (z, 1)]))])
        self.assertEqual(groebner_reduce(p, basis, vars), expected)

        # z^2 -> 1
        p = Poly([(1, Term([(z, 2)]))])
        expected = Poly([(1, Term([]))])
        self.assertEqual(groebner_reduce(p, basis, vars), expected)

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
        self.assertEqual(groebner_reduce(p, basis, vars), expected)

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
        self.assertEqual(groebner_reduce(p, basis, vars), expected)

    def test_groebner_basis(self):
        """Verify property of Gröbner basis of a set of polynomials."""

        w, x, y, z = Var("w"), Var("x"), Var("y"), Var("z")
        vars = [w, x, y, z]

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

        basis = groebner_basis(polys, vars)

        # Each input and output polynomial should reduce to 0 under the basis
        for poly in set(polys) | set(basis):
            self.assertEqual(groebner_reduce(poly, basis, vars), 0)

        # Each S-polynomial should reduce to 0 under the basis
        for f, g in itertools.combinations(basis, 2):
            s = s_polynomial(f, g, vars)
            self.assertEqual(groebner_reduce(s, basis, vars), 0)

if __name__ == "__main__":
    unittest.main()
