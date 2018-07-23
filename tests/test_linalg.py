# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

import unittest
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.linalg import Mat2


class TestMat2(unittest.TestCase):

    def setUp(self):
        self.m1 = Mat2([[1,0],
                        [1,1]])
        self.m2 = Mat2([[1,1],
                        [1,1]])
        self.m3 = Mat2([[1,0,1,1,0],
                        [1,1,1,0,0],
                        [1,1,0,0,1],
                        [0,1,0,1,0],
                        [0,0,1,1,0]])
        self.m4 = Mat2([[1,0,1,0,0],
                        [0,1,1,0,0],
                        [1,1,0,0,1],
                        [0,1,0,1,0],
                        [0,0,0,1,1]])

    def test_matrix_multiplication(self):
        result = Mat2([[1,1],[0,0]])
        self.assertEqual(self.m1*self.m2, result)
        result = Mat2([[0,1],[0,1]])
        self.assertEqual(self.m2*self.m1, result)

    def test_gauss_makes_upper_triangular(self):
        self.m3.gauss()
        flagged = False
        for i in range(self.m3.rows()):
            for j in range(min(self.m3.cols(),i)):
                if self.m3.data[i][j] != 0: flagged = True
        self.assertFalse(flagged)

    def test_rank_of_matrix(self):
        self.assertEqual(self.m3.rank(),4)

    def test_non_full_rank_matrix_shouldnt_have_inverse(self):
        self.assertIsNone(self.m3.inverse())

    def test_inverse(self):
        inv = self.m4.inverse()
        self.assertEqual(inv*self.m4, Mat2.id(5))
        self.assertEqual(self.m4*inv, Mat2.id(5))

    def test_solve_inhomogeneous_equation(self):
        b = Mat2([[1],[1],[0],[0],[0]])
        x = self.m3.solve(b)
        self.assertEqual(self.m3*x, b)
        b = Mat2([[1],[0],[1],[1],[0]])
        x = self.m4.solve(b)
        self.assertEqual(self.m4*x, b)

    def test_factor(self):
        m0, m1 = self.m3.factor()
        self.assertEqual(m0.cols(),self.m3.rank())
        self.assertEqual(m1.rows(),self.m3.rank())
        self.assertEqual(m0*m1, self.m3)

if __name__ == '__main__':
    unittest.main()