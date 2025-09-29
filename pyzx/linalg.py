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

import math
import numpy as np
from galois import GF2
from typing import Union, Any, Tuple, List, Optional, Dict, cast
from typing_extensions import Literal

from .circuit.gates import CNOT

try:
    from .linalg_c import do_gauss as gauss_fast # type: ignore
except ImportError:
   gauss_fast = None

Z2 = Literal[0,1]
MatLike = List[List[Z2]]

class Mat2(object):
    """A matrix over Z2, with methods for multiplication, primitive row and column
    operations, Gaussian elimination, rank, and epi-mono factorisation."""
    
    @staticmethod
    def id(n: int) -> 'Mat2':
        return Mat2([[1 if i == j else 0
            for j in range(n)] 
              for i in range(n)])
    @staticmethod
    def zeros(m:int, n: int) -> 'Mat2':
        return Mat2([[0
            for j in range(n)] 
              for i in range(m)])
    @staticmethod
    def unit_vector(d: int, i: int) -> 'Mat2':
        return Mat2([[1 if j == i else 0] for j in range(d)])

    def __init__(self, data: MatLike):
        self.data: MatLike = data
    def __mul__(self, m: 'Mat2') -> 'Mat2':
        return Mat2([[cast(Z2, sum(self.data[i][k] * m.data[k][j] for k in range(len(m.data))) % 2)
                      for j in range(len(m.data[0]))] for i in range(len(self.data))])
    def __eq__(self, other: object) -> bool:
        if not isinstance(other, Mat2): return False
        if self.rows() != other.rows() or self.cols() != other.cols(): return False
        return all(self.data[i][j] == other.data[i][j] for i in range(len(self.data)) for j in range(len(self.data[i])))
    def __str__(self) -> str:
        return "\n".join("[ " + 
            "  ".join(str(value) for value in row) +
            " ]" for row in self.data)
    def __repr__(self) -> str:
        return str(self)
    def __getitem__(self, key: Tuple[Union[int,slice],Union[int,slice]]) -> Union['Mat2',Z2]:
        # For a pair of indices: if either is a slice, return the
        # selected sub-matrix. Otherwise, return the selected element.
        if isinstance(key,tuple):
            rs,cs = key
            if isinstance(rs,slice) or isinstance(cs,slice):
                if not isinstance(rs,slice): rs = slice(rs,rs+1)
                if not isinstance(cs,slice): cs = slice(cs,cs+1)
                return Mat2([row[cs] for row in self.data[rs]])
            else:
                return self.data[rs][cs]
        else:
            raise IndexError("Expected a pair of indices/slices.")
    def __setitem__(self, key, val):
        # For a pair of indices: if either is a slice, expect a Mat2
        # and overwrite the selected sub-matrix. Otherwise, expect
        # Z2 and overwrite the selected element.
        if isinstance(key,tuple):
            rs,cs = key

            if isinstance(val,Mat2):
                d = val.data
            else:
                d = [[val]]

            if isinstance(rs,slice):
                rr = range(*rs.indices(self.rows()))
            else:
                rr = range(rs,rs+1)

            if isinstance(cs,slice):
                cr = range(*cs.indices(self.cols()))
            else:
                cr = range(cs,cs+1)

            for i,iin in enumerate(rr):
                for j,jin in enumerate(cr):
                    self.data[iin][jin] = d[i][j]
        else:
            raise IndexError("Expected a pair of indices/slices.")
            

    def copy(self) -> 'Mat2':
        return Mat2([list(row) for row in self.data])
    def transpose(self) -> 'Mat2':
        return Mat2([[self.data[i][j] for i in range(self.rows())] for j in range(self.cols())])
    def rows(self) -> int:
        return len(self.data)
    def cols(self) -> int:
        return len(self.data[0]) if (len(self.data) != 0) else 0
    def row_add(self, r0: int, r1: int) -> None:
        """Add r0 to r1"""
        row1 = self.data[r0]
        row2 = self.data[r1]
        for i, v in enumerate(row1):
            if v:
                row2[i] = 0 if row2[i] else 1
    def col_add(self, c0: int, c1: int) -> None:
        """Add r0 to r1"""
        for i in range(self.rows()):
            d = self.data[i]
            if d[c0]:
                d[c1] = 0 if d[c1] else 1
    def row_swap(self, r0: int, r1: int) -> None:
        """Swap the rows r0 and r1"""
        r = self.data[r0]
        self.data[r0] = self.data[r1]
        self.data[r1] = r
    def col_swap(self, c0: int, c1: int) -> None:
        """Swap the columns c0 and c1"""
        for r in range(self.rows()):
            v = self.data[r][c0]
            self.data[r][c0] = self.data[r][c1]
            self.data[r][c1] = v
    
    def permute_rows(self, p: List[int]) -> None:
        """Permute the rows of the matrix according to the permutation p."""
        self.data = [self.data[i] for i in p]
    def permute_cols(self, p: List[int]) -> None:
        """Permute the columns of the matrix according to the permutation p."""
        self.data = [[self.data[i][j] for j in p] for i in range(self.rows())]
    
    def gauss(self, full_reduce:bool=False, x:Any=None, y:Any=None, blocksize:int=6, pivot_cols:List[int]=[]) -> int:
        """Compute the echelon form. Returns the number of non-zero rows in the result, i.e.
        the rank of the matrix.

        The parameter 'full_reduce' determines whether to compute the full row-reduced form,
        useful e.g. for matrix inversion and CNOT circuit synthesis.

        The parameter 'blocksize' gives the size of the blocks in a block matrix for
        performing Patel/Markov/Hayes optimization, see:

        K. Patel, I. Markov, J. Hayes. Optimal Synthesis of Linear Reversible
        Circuits. QIC 2008

        If blocksize is given as self.cols(), then
        this is equivalent to just eliminating duplicate rows before doing normal
        Gaussian elimination.

        Contains two convenience parameters for saving the primitive row operations. Suppose
        the row-reduced form of m is computed as:

        g * m = m'

        Then, x --> g * x and y --> y * g^-1.

        Note x and y need not be matrices. x can be any object that implements the method
        row_add(), and y any object that implements col_add().
        """

        rows = self.rows()
        cols = self.cols()
        #pivot_cols = []
        pivot_row = 0
        for sec in range(math.ceil(cols / blocksize)):
            i0 = sec * blocksize
            i1 = min(cols, (sec+1) * blocksize)

            # search for duplicate chunks of 'blocksize' bits and eliminate them
            chunks: Dict[Tuple[Z2,...],int] = dict()
            for r in range(pivot_row, rows):
                t = tuple(self.data[r][i0:i1])
                if not any(t): continue
                if t in chunks:
                    #print('hit (down)', r, chunks[t], t, i0, i1)
                    self.row_add(chunks[t], r)
                    if x is not None: x.row_add(chunks[t], r)
                    if y is not None: y.col_add(r, chunks[t])
                else:
                    chunks[t] = r

            p = i0
            while p < i1:
                for r0 in range(pivot_row, rows):
                    if self.data[r0][p] != 0:
                        if r0 != pivot_row:
                            self.row_add(r0, pivot_row)
                            if x is not None: x.row_add(r0, pivot_row)
                            if y is not None: y.col_add(pivot_row, r0)

                        for r1 in range(pivot_row+1, rows):
                            # TODO: remove pivot_row != r1 and test
                            if pivot_row != r1 and self.data[r1][p] != 0:
                                self.row_add(pivot_row, r1)
                                if x is not None: x.row_add(pivot_row, r1)
                                if y is not None: y.col_add(r1, pivot_row)
                        #if full_reduce:
                        pivot_cols.append(p)
                        pivot_row += 1
                        break
                p += 1
        
        rank = pivot_row

        if full_reduce:
            pivot_row -= 1
            pivot_cols1 = pivot_cols.copy()

            for sec in range(math.ceil(cols / blocksize) - 1, -1, -1):
                i0 = sec * blocksize
                i1 = min(cols, (sec+1) * blocksize)

                # search for duplicate chunks of 'blocksize' bits and eliminate them
                chunks = dict()
                for r in range(pivot_row, -1, -1):
                    t = tuple(self.data[r][i0:i1])
                    if not any(t): continue
                    if t in chunks:
                        #print('hit (up)', r, chunks[t], t, i0, i1)
                        self.row_add(chunks[t], r)
                        if x is not None: x.row_add(chunks[t], r)
                        if y is not None: y.col_add(r, chunks[t])
                    else:
                        chunks[t] = r

                while len(pivot_cols1) != 0 and i0 <= pivot_cols1[-1] < i1:
                    pcol = pivot_cols1.pop()
                    for r in range(0, pivot_row):
                        if self.data[r][pcol] != 0:
                            self.row_add(pivot_row, r)
                            if x is not None: x.row_add(pivot_row, r)
                            if y is not None: y.col_add(r, pivot_row)
                    pivot_row -= 1

        return rank

    def rank(self) -> int:
        """Returns the rank of the matrix."""
        m = self.copy()
        return m.gauss()

    def factor(self) -> Tuple['Mat2','Mat2']:
        """Produce a factorisation m = m0 * m1, where

        m0.cols() = m1.rows() = m.rank()
        """
        
        # identity matrix
        m0 = Mat2.id(self.rows())
        
        # copy of m (aka self)
        m1 = self.copy()
        
        # produce m1 := g * m and m0 := g^-1. Hence, m0 * m1 = m.
        rank = m1.gauss(y = m0)
        
        # throw away zero rows in m1, and their corresponding columns in m0
        m0 = Mat2([[row[i] for i in range(rank)] for row in m0.data])
        m1 = Mat2([m1.data[i] for i in range(rank)])
        return (m0, m1)

    def inverse(self) -> Optional['Mat2']:
        """Returns the inverse of m is invertible and None otherwise."""
        if self.rows() != self.cols(): return None
        m = self.copy()
        inv = Mat2.id(self.rows())
        rank = m.gauss(x=inv, full_reduce=True)
        if rank < self.rows(): return None
        else: return inv

    def solve(self, b: 'Mat2') -> Optional['Mat2']:
        """Return a vector x such that M * x = b, or None if there is no solution."""
        m = self.copy()
        b1 = b.copy()
        rank = m.gauss(x=b1, full_reduce=True)

        # check for inconsistencies and set x to a
        #  particular solution
        x = Mat2.zeros(m.cols(),1)
        for i,row in enumerate(m.data):
            got_pivot = False
            for j,v in enumerate(row):
                if v != 0:
                    got_pivot = True
                    x.data[j][0] = b1.data[i][0]
                    break
            # zero LHS with non-zero RHS = no solutions
            if not got_pivot and b1.data[i][0] != 0:
                return None
        return x

        # i = b1.rows() - 1
        # while i > rank - 1:
        #     if b1.data[i][0] != 0:
        #         return None
        #     i -= 1
        # if x.rows() > m.cols():
        #     x.data = x.data[:m.cols()]
        # else:
        #     x.data = x.data + [[0]]*(m.cols()-x.rows())
        # return x

    def nullspace(self, should_copy:bool=True) -> List[List[Z2]]:
        """Returns a list of non-zero vectors that span the nullspace
        of the matrix. If the matrix has trivial kernel it returns the empty list."""
        if gauss_fast:
            data = gauss_fast(self.data,1)
            m = Mat2(data)
        elif should_copy:
            m = self.copy()
            m.gauss(full_reduce=True)
        else:
            m = self
            m.gauss(full_reduce=True)
        cols = self.cols()
        nonpivots = list(range(cols))
        pivots = []
        for i, r in enumerate(m.data):
            for j in range(cols):
                if r[j]:
                    nonpivots.remove(j)
                    pivots.append(j)
                    break
        vectors:List[List[Z2]] = []
        for n in nonpivots:
            v:List[Z2] = [0]*cols
            v[n] = 1
            for r, p in zip(m.data, pivots):
                if r[n]: v[p] = 1
            vectors.append(v)
        return vectors

    def to_cnots(self, optimize: bool = False, use_log_blocksize: bool = False) -> List[CNOT]:
        """Returns a list of CNOTs that implements the matrix as a reversible circuit of qubits."""
        cn: Optional[CNOTMaker]
        if not optimize:
            cn = CNOTMaker()
            blocksize = 5
            if use_log_blocksize:
                blocksize = int(math.log2(self.rows()))
            self.copy().gauss(full_reduce=True,x=cn, blocksize=blocksize)
        else:
            best = 1000000
            best_cn = None
            for size in range(1,self.rows() + 1):
                cn = CNOTMaker()
                assert cn is not None
                self.copy().gauss(full_reduce=True,x=cn, blocksize=size)
                if len(cn.cnots) < best:
                    best = len(cn.cnots)
                    best_cn = cn
            cn = best_cn
        assert cn is not None
        return cn.cnots # list(reversed(cn.cnots)) 


class CNOTMaker(object):
    def __init__(self) -> None:
        self.cnots: List[CNOT] = []
    def row_add(self, r1:int, r2:int) -> None:
        self.cnots.append(CNOT(r2,r1))


BASE = 64


class REF:
    """
    A class to efficiently compute cut-ranks for multiple partitions.
    It stores the row echelon form of the adjacency matrix, allowing fast row addition and column deletion.
    Primitive row operations are optimised using int64 arithmetic.
    Initially, all vertices are in the right part.
    The function take(v) moves a vertex to the left, and rank() returns the cut-rank.
    """

    def __init__(self, graph):
        self.n = len(graph)
        self.N = (self.n + BASE - 1) // BASE * BASE
        self.taken = [False] * self.N
        self.graph = np.hstack([graph, np.zeros((self.n, self.N - self.n), dtype=graph.dtype)])
        self.graph = np.packbits(self.graph, axis=-1, bitorder='little').view(np.uint64)
        self.mat = []
        self.pivot_cols = []

    def _add_row(self, row_arr, start_col=0):
        pivot_row = 0
        for col in range(start_col, self.N):
            if self.taken[col]:
                continue
            while pivot_row < len(self.pivot_cols) and self.pivot_cols[pivot_row] < col:
                pivot_row += 1
            col_loc, col_rem = divmod(col, BASE)
            if (row_arr[col_loc] >> np.uint64(col_rem)) & np.uint64(1):
                if pivot_row < len(self.pivot_cols) and self.pivot_cols[pivot_row] == col:
                    row_arr ^= self.mat[pivot_row]
                else:
                    self.mat.insert(pivot_row, row_arr)
                    self.pivot_cols.insert(pivot_row, col)
                    break

    def take(self, col):
        """
        Move a vertex from the right part to the left in O(n^2) time.
        :param col: vertex id
        """
        self.taken[col] = True
        if col in self.pivot_cols:
            pivot_row = self.pivot_cols.index(col)
            self.pivot_cols.pop(pivot_row)
            row_arr = self.mat[pivot_row]
            self.mat.pop(pivot_row)
            self._add_row(row_arr, col + 1)
        self._add_row(self.graph[col])

    def rank(self):
        """
        Cut-rank of the partition, computed in O(1) time.
        """
        return len(self.pivot_cols)


def rank_factorize(A: np.ndarray) -> Tuple[int, np.ndarray, np.ndarray]:
    """
    Rank factorisation of a matrix over GF(2).
    :param A: binary matrix of shape (n, m)
    :return r: int - rk(A)
            L: binary matrix of shape (n, n) - invertible matrix whose first r columns represent the first factor
            R: binary matrix of shape (m, m) - invertible matrix whose first r rows represent the second factor
    """
    assert len(A.shape) == 2 and A.dtype == np.int8
    n, m = A.shape
    A1 = A.copy()
    L, R = np.eye(n, dtype=np.int8), np.eye(m, dtype=np.int8)
    pivots = []
    r = 0
    for j in range(m):
        if A1[r:, j].any():
            pivots.append(j)
            i = r + np.where(A1[r:, j])[0][0]
            A1[[r, i]] = A1[[i, r]]
            L[:, [r, i]] = L[:, [i, r]]
            for k in range(r + 1, n):
                if A1[k, j]:
                    A1[k] ^= A1[r]
                    L[:, r] ^= L[:, k]
            r += 1
    for i, j in list(enumerate(pivots))[::-1]:
        for k in range(i - 1, -1, -1):
            if A1[k, j]:
                A1[k] ^= A1[i]
                L[:, i] ^= L[:, k]
    for i, j in enumerate(pivots):
        for k in range(j + 1, m):
            if A1[i, k]:
                A1[:, k] ^= A1[:, j]
                R[j] ^= R[k]
    for i, j in enumerate(pivots):
        A1[:, [i, j]] = A1[:, [j, i]]
        R[[i, j]] = R[[j, i]]
    return A1.sum(), L, R


def generalized_inverse(A: np.ndarray) -> np.ndarray:
    """
    Compute the generalised inverse of a matrix over GF(2).
    :param A: binary matrix of shape (n, m)
    :return A^g: binary matrix of shape (m, n) - a matrix satisfying A * A^g * A = A
    """
    r, U, V = rank_factorize(A)
    return (np.linalg.inv(GF2(V))[:, :r] @ np.linalg.inv(GF2(U))[:r]) == 1
