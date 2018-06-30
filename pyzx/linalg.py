class Mat2:
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
    def __str__(self):
        return "\n".join("[ " + 
            "  ".join(str(value) for value in row) +
            " ]" for row in self.data)
    def __repr__(self):
        return str(self)
    def copy(self):
        return Mat2([row.copy() for row in self.data])
    def rows(self):
        return len(self.data)
    def cols(self):
        return len(self.data[0]) if (len(self.data) != 0) else 0
    def row_add(self, r0, r1):
        """Add r0 to r1"""
        for i in range(self.cols()):
            self.data[r1][i] = (self.data[r0][i] + self.data[r1][i]) % 2
    def col_add(self, c0, c1):
        """Add r0 to r1"""
        for i in range(self.rows()):
            self.data[i][c1] = (self.data[i][c0] + self.data[i][c1]) % 2
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

    
    def gauss(self, reduce=False, x=None, y=None):
        """Compute the echelon form. Returns the number of non-zero rows in the result, i.e.
        the rank of the matrix.

        The parameter 'reduce' determines whether to compute the full row-reduced form, useful
        e.g. for matrix inversion.

        Contains two convenience parameters for saving the primitive row operations. Suppose
        the row-reduced form of m is computed as:

        g * m = m'

        Then, x --> g * x and y --> y * g^-1.

        Note x and y need not be matrices. x can be any object that implements the methods
        row_swap() and row_add(), and y any object that implements col_swap() and col_add().
        """
        p = 0
        r = 0
        pivot_row = 0
        while p < self.cols():
            try:
                r0 = next(i for i in range(pivot_row, self.rows()) if self.data[i][p] != 0)
                if r0 != pivot_row:
                    self.row_swap(r0, pivot_row)
                    if x != None: x.row_swap(r0, pivot_row)
                    if y != None: y.col_swap(r0, pivot_row)

                for r1 in range(pivot_row+1, self.rows()):
                    if pivot_row != r1 and self.data[r1][p] != 0:
                        self.row_add(pivot_row, r1)
                        if x != None: x.row_add(pivot_row, r1)
                        if y != None: y.col_add(r1, pivot_row)
                pivot_row += 1
            except StopIteration:
                pass
            p += 1
        return pivot_row

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
