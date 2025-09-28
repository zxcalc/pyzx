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
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.linalg import Mat2, rank_factorize, generalized_inverse


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

    def test_rank_factorize(self):
        A = np.array([[1, 1, 1, 1, 1],
                      [1, 1, 1, 1, 1],
                      [0, 1, 0, 0, 1],
                      [1, 0, 1, 1, 0]], dtype=np.int8)
        r, U, V = rank_factorize(A)
        assert r == 2
        assert ((U[:, :r] @ V[:r]) % 2 == A).all()

    def test_generalized_inverse(self):
        A = np.array([[1, 1, 1, 0],
                      [1, 1, 1, 1],
                      [1, 1, 1, 1]], dtype=np.int8)
        B = generalized_inverse(A)
        assert ((A @ B @ A) % 2 == A).all()

if __name__ == '__main__':
    unittest.main()