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


import sys
import unittest

from pyzx.symbolic import Poly, Term, Var, degrevlex_leading, groebner_reduce

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


if __name__ == "__main__":
    unittest.main()
