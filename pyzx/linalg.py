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

import math

class Mat2(object):
    """A matrix over Z2, with methods for multiplication, primitive row and column
    operations, Gaussian elimination, rank, and epi-mono factorisation."""
    
    @staticmethod
    def id(n):
        return Mat2([[1 if i == j else 0
            for j in range(n)] 
              for i in range(n)])

    def __init__(self, data):
        self.data = data
    def __mul__(self, m):
        return Mat2([[sum(self.data[i][k] * m.data[k][j] for k in range(len(m.data))) % 2
                      for j in range(len(m.data[0]))] for i in range(len(self.data))])
    def __eq__(self, other):
        if not isinstance(other, Mat2): return False
        if self.rows() != other.rows() or self.cols() != other.cols(): return False
        return all(self.data[i][j] == other.data[i][j] for i in range(len(self.data)) for j in range(len(self.data[i])))
    def __str__(self):
        return "\n".join("[ " + 
            "  ".join(str(value) for value in row) +
            " ]" for row in self.data)
    def __repr__(self):
        return str(self)
    def copy(self):
        return Mat2([row.copy() for row in self.data])
    def transpose(self):
        return Mat2([[self.data[i][j] for i in range(self.rows())] for j in range(self.cols())])
    def rows(self):
        return len(self.data)
    def cols(self):
        return len(self.data[0]) if (len(self.data) != 0) else 0
    def row_add(self, r0, r1):
        """Add r0 to r1"""
        row1 = self.data[r0]
        row2 = self.data[r1]
        for i, v in enumerate(row1):
            if v:
                row2[i] = 0 if row2[i] else 1
        # for i in range(len(row1)): row1[i] = (row)
        # for i in range(self.cols()):
        #     self.data[r1][i] = (self.data[r0][i] + self.data[r1][i]) % 2
    def col_add(self, c0, c1):
        """Add r0 to r1"""
        for i in range(self.rows()):
            d = self.data[i]
            if d[c0]:
                d[c1] = 0 if d[c1] else 1
            #self.data[i][c1] = (self.data[i][c0] + self.data[i][c1]) % 2
    def row_swap(self, r0, r1):
        """Swap the rows r0 and r1"""
        r = self.data[r0]
        self.data[r0] = self.data[r1]
        self.data[r1] = r
    def col_swap(self, c0, c1):
        """Swap the columns c0 and c1"""
        for r in range(self.rows()):
            v = self.data[r][c0]
            self.data[r][c0] = self.data[r][c1]
            self.data[r][c1] = v

    
    def gauss(self, full_reduce=False, x=None, y=None, blocksize=6):
        """Compute the echelon form. Returns the number of non-zero rows in the result, i.e.
        the rank of the matrix.

        The parameter 'full_reduce' determines whether to compute the full row-reduced form,
        useful e.g. for matrix inversion and CNOT circuit synthesis.

        The parameter 'blocksize' gives the size of the blocks in a block matrix for
        performing Patel/Markov/Hayes optimisation, see:

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


        pcols = []
        pivot_row = 0
        for sec in range(math.ceil(self.cols() / blocksize)):
            i0 = sec * blocksize
            i1 = min(self.cols(), (sec+1) * blocksize)

            # search for duplicate chunks of 'blocksize' bits and eliminate them
            chunks = dict()
            for r in range(pivot_row, self.rows()):
                t = tuple(self.data[r][i0:i1])
                if not any(t): continue
                if t in chunks:
                    #print('hit (down)', r, chunks[t], t, i0, i1)
                    self.row_add(chunks[t], r)
                    if x != None: x.row_add(chunks[t], r)
                    if y != None: y.col_add(r, chunks[t])
                else:
                    chunks[t] = r

            p = i0
            while p < i1:
                try:
                    r0 = next(i for i in range(pivot_row, self.rows()) if self.data[i][p] != 0)
                    if r0 != pivot_row:
                        self.row_add(r0, pivot_row)
                        if x != None: x.row_add(r0, pivot_row)
                        if y != None: y.col_add(pivot_row, r0)

                    for r1 in range(pivot_row+1, self.rows()):
                        if pivot_row != r1 and self.data[r1][p] != 0:
                            self.row_add(pivot_row, r1)
                            if x != None: x.row_add(pivot_row, r1)
                            if y != None: y.col_add(r1, pivot_row)
                    if full_reduce: pcols.append(p)
                    pivot_row += 1
                except StopIteration:
                    pass
                p += 1
        
        rank = pivot_row

        if full_reduce:
            pivot_row -= 1

            for sec in range(math.ceil(self.cols() / blocksize) - 1, -1, -1):
                i0 = sec * blocksize
                i1 = min(self.cols(), (sec+1) * blocksize)

                # search for duplicate chunks of 'blocksize' bits and eliminate them
                chunks = dict()
                for r in range(pivot_row, -1, -1):
                    t = tuple(self.data[r][i0:i1])
                    if not any(t): continue
                    if t in chunks:
                        #print('hit (up)', r, chunks[t], t, i0, i1)
                        self.row_add(chunks[t], r)
                        if x != None: x.row_add(chunks[t], r)
                        if y != None: y.col_add(r, chunks[t])
                    else:
                        chunks[t] = r

                while len(pcols) != 0 and i0 <= pcols[-1] < i1:
                    pcol = pcols.pop()
                    for r in range(0, pivot_row):
                        if self.data[r][pcol] != 0:
                            self.row_add(pivot_row, r)
                            if x != None: x.row_add(pivot_row, r)
                            if y != None: y.col_add(r, pivot_row)
                    pivot_row -= 1

        return rank

    def rank(self):
        """Returns the rank of the matrix."""
        m = self.copy()
        return m.gauss()

    def factor(self):
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

    def inverse(self):
        """Returns the inverse of m is invertible and None otherwise."""
        if self.rows() != self.cols(): return None
        m = self.copy()
        inv = Mat2.id(self.rows())
        rank = m.gauss(x=inv, full_reduce=True)
        if rank < self.rows(): return None
        else: return inv

    def solve(self, b):
        """Return a vector x such that M * x = b, or None if there is no solution."""
        m = self.copy()
        x = b.copy()
        rank = m.gauss(x=x, full_reduce=True)

        # check for inconsistencies, i.e. zero LHS with non-zero RHS
        i = x.rows() - 1
        while i > rank - 1:
            if x.data[i][0] != 0:
                return None
            i -= 1
        if x.rows() > m.cols():
            x.data[0] = x.data[0][:m.cols()]
        else:
            x.data[0] = x.data[0] + [[0]]*(m.cols()-x.rows())
        return x

    def nullspace(self, should_copy=True):
        """Returns a list of non-zero vectors that span the nullspace
        of the matrix. If the matrix has trivial kernel it returns the empty list."""
        if should_copy:
            m = self.copy()
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
        vectors = []
        for n in nonpivots:
            v = [0]*cols
            v[n] = 1
            for r, p in zip(m.data, pivots):
                if r[n]: v[p] = 1
            vectors.append(v)
        return vectors

    def to_cnots(self, optimize=False):
        """Returns a list of CNOTs that implements the matrix as a reversible circuit of qubits."""
        if not optimize:
            cn = CNOTMaker()
            self.copy().gauss(full_reduce=True,x=cn, blocksize=5)
        else:
            best = 1000000
            best_cn = None
            for size in range(1,self.rows()):
                cn = CNOTMaker()
                self.copy().gauss(full_reduce=True,x=cn, blocksize=size)
                if len(cn.cnots) < best:
                    best = len(cn.cnots)
                    best_cn = cn
            cn = best_cn
        return cn.cnots # list(reversed(cn.cnots)) 

from .circuit import CNOT
class CNOTMaker:
    def __init__(self):
        self.cnots = []
    def row_add(self, r1, r2):
        self.cnots.append(CNOT(r2,r1))



def xor_rows(l1, l2):
    return [0 if l1[i]==l2[i] else 1 for i in range(len(l1))]

def find_minimal_sums(m):
    """Returns a list of rows in m that can be added together to reduce one of the rows so that
    it only contains a single 1. Used in :func:`greedy_reduction`"""
    r = m.rows()
    d = m.data
    if any(sum(r)==1 for r in d): return []
    combs = {(i,):d[i] for i in range(r)}
    combs2 = {}
    iterations = 0
    while True:
        combs2 = {}
        for index,l in combs.items():
            for k in range(max(index)+1,r):
                #Unrolled xor_rows(combs[index],d[k])
                row = [0 if v1==v2 else 1 for v1,v2 in zip(combs[index],d[k])]
                #row = xor_rows(combs[index],d[k])
                if sum(row) == 1:
                    return (*index,k)
                combs2[(*index,k)] = row
                iterations += 1
            if iterations > 100000:
                return None
        if not combs2:
            return None
            #raise ValueError("Irreducible input has been given")
        combs = combs2

def greedy_reduction(m):
    """Returns a list of tuples (r1,r2) that specify which row should be added to which other row
    in order to reduce one row of m to only contain a single 1. 
    Used in :func:`extract.streaming_extract`"""
    indices = find_minimal_sums(m)
    if not isinstance(indices, (list,tuple)): return indices
    indices = list(indices)
    rows = {i:m.data[i] for i in indices}
    weights = {i: sum(r) for i,r in rows.items()}
    result = []
    while len(indices)>1:
        best = (-1,-1)
        reduction = -10000
        for i in indices:
            for j in indices:
                if j <= i: continue
                w = sum(xor_rows(rows[i],rows[j]))
                if weights[i] - w > reduction:
                    best = (j,i) # "Add row j to i"
                    reduction = weights[i] - w
                if weights[j] - w > reduction:
                    best = (i,j)
                    reduction = weights[j] - w
        result.append(best)
        control, target = best
        rows[target] = xor_rows(rows[control],rows[target])
        weights[target] = weights[target] - reduction
        indices.remove(control)
    return result



def column_optimal_swap(m):
    qubits = min([m.rows(), m.cols()])
    connections = {i: set() for i in range(qubits)}
    connectionsr= {j: set() for j in range(qubits)}

    for i in range(qubits):
            for j in range(qubits):
                if m.data[i][j]: 
                    connections[i].add(j)
                    connectionsr[j].add(i)

    target = _find_targets(connections, connectionsr)
    target = {v:k for k,v in target.items()}
    left = list(set(range(qubits)).difference(target.keys()))
    right = list(set(range(qubits)).difference(target.values()))
    for i in range(len(left)):
        target[left[i]] = right[i]
    return target


def _find_targets(conn, connr, target={}):
    target = target.copy()
    qubits = len(conn)
    claimedr = set(target.values())
    claimed = set(target.keys())
    
    while True:
        min_index = -1
        min_options = set(range(1000))
        for i in range(qubits):
            if i in claimed: continue
            s = conn[i] - claimedr
            for i2 in s.copy(): # Go trough the possible options
                for j1 in (connr[i2] - claimed): 
                    if j1 != i and j1 in target and i in connr[target[j1]]: # i connected to j2
                        #This is not allowed
                        #print("not allowed1:", i, i2)
                        s.remove(i2)
                        break
            if len(s) == 0: return None # No possible options, start backtracking
            if len(s) == 1:
                j = s.pop()
                #print("forced1", i,j)
                target[i] = j
                claimed.add(i)
                claimedr.add(j)
                break
            should_break = False
            for i2 in s:
                t = connr[i2] - claimed
                for i1 in t.copy():
                    for j1 in connr[i2]:
                        if j1 != i1 and j1 in target and i1 in connr[target[j1]]: 
                            #print("not allowed2:", i1, j1)
                            t.remove(i1)
                            break
                if len(t) == 0: return None
                if len(t) == 1: # we must connect them together
                    i1 = t.pop()
                    #print("forced2", i1,i2)
                    target[i1] = i2
                    claimed.add(i1)
                    claimedr.add(i2)
                    should_break = True
                    break
            if should_break: break
            if len(s) < len(min_options):
                min_index = i
                min_options = s
        else: # No forced decisions
            if not (conn.keys() - claimed): # we are done
                return target
            if min_index == -1: raise ValueError("This shouldn't happen ever")
            # Start depth-first search
            tgt = target.copy()
            #print("backtracking on", min_index)
            for i2 in min_options:
                #print("trying option", i2)
                tgt[min_index] = i2
                r = _find_targets(conn, connr, tgt)
                if r: return r
            #print("Unsuccessful")
            return target
            