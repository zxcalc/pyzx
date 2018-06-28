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
    
    def gauss(self, x=None, y=None):
        """Compute the row reduced form, but don't bother sorting the rows into upper triangular.
        Returns the set of rows which contain a pivot.

        Contains two convenience parameters for saving the primitive row operations. Suppose
        the row-reduced form of m is computed as:

        g * m = m'

        Then, x --> g * x and y --> y * g^-1.
        """
        p = 0
        r = 0
        pivot_rows = set()
        while p < self.cols():
            try:
                r0 = next(i for i in range(self.rows()) if self.data[i][p] != 0 and not i in pivot_rows)
                for r1 in range(self.rows()):
                    if r0 != r1 and self.data[r1][p] != 0:
                        self.row_add(r0, r1)
                        if x != None: x.row_add(r0, r1)
                        if y != None: y.col_add(r1, r0)
                pivot_rows.add(r0)
            except StopIteration:
                pass
            p += 1
        return pivot_rows

    def rank(self):
        """Returns the rank of the matrix."""
        m = self.copy()
        return len(m.gauss()) # count the number of pivot rows

    def factor(self):
        """Produce a factorisation m = m0 * m1, where

        m0.cols() = m1.rows() = m.rank()
        """
        
        # identity matrix
        m0 = Mat2.id(self.rows())
        
        # copy of m (aka self)
        m1 = self.copy()
        
        # produce m1 := g * m and m0 := g^-1. Hence, m0 * m1 = m.
        keep = m1.gauss(y = m0)
        
        # throw away zero rows in m1, and their corresponding column in m0
        m1 = Mat2([m1.data[i] for i in range(m1.rows()) if i in keep])
        m0 = Mat2([[row[i] for i in range(len(row)) if i in keep] for row in m0.data])
        return (m0, m1)
