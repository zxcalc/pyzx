cimport cython

import math

import numpy as np
cimport numpy as np
from cpython cimport array
import array

TYPE = np.uint8
ctypedef np.uint8_t TYPE_t

cdef class Mat2:
    cpdef np.uint8_t[:,:] data
    def __init__(self, np.ndarray[TYPE_t, ndim=2] data):
        self.data = data
    
    cpdef get_data(self):
        return self.data
    
    def __str__(self):
        return "\n".join(str(list(r)) for r in self.data)
    
    cpdef Mat2 copy(self):
        return Mat2(np.asarray(self.data.copy()))
    
    cpdef Mat2 transpose(self):
        return Mat2(np.asarray(self.data).transpose().copy())
    
    cpdef int rows(self):
        return self.data.shape[0]
    
    cpdef int cols(self):
        return self.data.shape[1]
    
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cdef row_add(self, int r0, int r1):
        cdef int i
        cdef np.uint8_t[:] a, b
        a = self.data[r0]
        b = self.data[r1]
        for i in range(self.cols()):
            if a[i]:
                b[i] = 0 if b[i] else 1
    
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cdef col_add(self, int c0, int c1):
        cdef int i
        cdef np.uint8_t[:] d
        for i in range(self.rows()):
            d = self.data[i]
            if d[c0]:
                d[c1] = 0 if d[c1] else 1
    
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cpdef int gauss(self, int full_reduce=0, int blocksize=6):
        cdef int pivot_row, sec, i0, i1, r, p, r0, r1, rank, pcol, rows, cols
        cdef array.array pcols = array.array('i',[])
        cdef dict chunks
        cdef tuple t
        
        rows = self.rows()
        cols = self.cols()
        #pcols = array.array('i',[])
        pivot_row = 0
        for sec in range(math.ceil(float(cols) / blocksize)):
            i0 = sec * blocksize
            i1 = min(cols, (sec+1) * blocksize)
            # search for duplicate chunks of 'blocksize' bits and eliminate them
            chunks = dict()
            for r in range(pivot_row, rows):
                t = tuple(self.data[r][i0:i1])
                if not any(t): continue
                if t in chunks:
                    #print('hit (down)', r, chunks[t], t, i0, i1)
                    self.row_add(chunks[t], r)
                    #if x != None: x.row_add(chunks[t], r)
                    #if y != None: y.col_add(r, chunks[t])
                else:
                    chunks[t] = r
            p = i0
            while p < i1:
                for r0 in range(pivot_row, rows):
                    if self.data[r0][p] != 0:
                        if r0 != pivot_row:
                            self.row_add(r0, pivot_row)
                            #if x != None: x.row_add(r0, pivot_row)
                            #if y != None: y.col_add(pivot_row, r0)

                        for r1 in range(pivot_row+1, rows):
                            if pivot_row != r1 and self.data[r1][p] != 0:
                                self.row_add(pivot_row, r1)
                                #if x != None: x.row_add(pivot_row, r1)
                                #if y != None: y.col_add(r1, pivot_row)
                        if full_reduce: pcols.append(p)
                        pivot_row += 1
                        break
                p += 1
        rank = pivot_row
        if full_reduce:
            pivot_row -= 1
            for sec in range(math.ceil(float(cols) / blocksize) - 1, -1, -1):
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
                        #if x != None: x.row_add(chunks[t], r)
                        #if y != None: y.col_add(r, chunks[t])
                    else:
                        chunks[t] = r
                while len(pcols) and (i0 <= pcols[len(pcols)-1] < i1):
                    pcol = pcols.pop()
                    for r in range(0, pivot_row):
                        if self.data[r][pcol]:
                            self.row_add(pivot_row, r)
                            #if x != None: x.row_add(pivot_row, r)
                            #if y != None: y.col_add(r, pivot_row)
                    pivot_row -= 1
        return rank
    
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cpdef np.ndarray[TYPE_t,ndim=2] nullspace(self, int should_copy=1):
        """Returns a list of non-zero vectors that span the nullspace
        of the matrix. If the matrix has trivial kernel it returns the empty list."""
        cdef int cols, i, j
        cdef list nonpivots, pivots
        cdef Mat2 m
        cdef np.uint8_t[:] r
        cdef np.ndarray[TYPE_t,ndim=1] v
        cdef np.ndarray[TYPE_t,ndim=2] vectors
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
        vectors = np.ndarray([0,cols], dtype=TYPE)
        for i in nonpivots:
            v = np.zeros(cols,dtype=TYPE)
            v[i] = 1
            for r, j in zip(m.data, pivots):
                if r[i]: v[j] = 1
            vectors = np.insert(vectors, vectors.shape[0], v, 0)
        return vectors

# cpdef ident(n):
#     i = np.identity(n, TYPE)
#     return Mat2(i)
    
# @cython.boundscheck(False)
# @cython.wraparound(False)
# cdef Mat2 xi(Mat2 m, np.ndarray[TYPE_t,ndim=1] z):
#     cdef int rows, alpha, beta, gamma, v1,v2, i, j
#     cdef np.ndarray[TYPE_t, ndim=1] ra, rb, rab, rg, rag, rbg
#     cdef np.ndarray[TYPE_t, ndim=2] data
#     cdef np.uint8_t[:] r
#     rows = m.rows()
#     data = np.ndarray([0,m.cols()], dtype=TYPE)
#     for alpha in range(rows):
#         ra = np.asarray(m.data[alpha])
#         for beta in range(alpha+1, rows):
#             rb = np.asarray(m.data[beta])
#             rab = ra*rb
#             #rab = [i*j for i,j in zip(ra,rb)]
#             for gamma in range(beta+1, rows):
#                 rg = np.asarray(m.data[gamma])
#                 rag = ra*rg
#                 rbg = rb*rg
#                 #rag = [i*j for i,j in zip(ra,rg)]
#                 #rbg = [i*j for i,j in zip(rb,rg)]
                
#                 if z[alpha]:
#                     if not z[beta]:
#                         if not z[gamma]:
#                             data = np.insert(data, data.shape[0], rbg, 0)
#                             #data.append(rbg)
#                             continue
#                         data = np.insert(data, data.shape[0], (rbg+rab)%2, 0)
#                         #data.append([0 if v1==v2 else 1 for v1,v2 in zip(rbg,rab)])
#                         continue
#                     elif not z[gamma]:
#                         data = np.insert(data, data.shape[0], (rbg+rag)%2, 0)
#                         #data.append([0 if v1==v2 else 1 for v1,v2 in zip(rbg,rag)])
#                         continue
#                     else: #z[alpha], z[beta] and z[gamma] are all true
#                         data = np.insert(data, data.shape[0], (rbg+rab+rag)%2, 0)
#                         #r = [0 if v1==v2 else 1 for v1,v2 in zip(rab,rag)]
#                         #data.append([0 if v1==v2 else 1 for v1,v2 in zip(r,rbg)])
#                         continue
#                 elif z[beta]:
#                     if z[gamma]:
#                         data = np.insert(data, data.shape[0], (rab+rag)%2, 0)
#                         #data.append([0 if v1==v2 else 1 for v1,v2 in zip(rab,rag)])
#                         continue
#                     data = np.insert(data, data.shape[0], rag, 0)
#                     #data.append(rag)
#                     continue
#                 elif z[gamma]:
#                     data = np.insert(data, data.shape[0], rab, 0)
#                     #data.append(rab.copy())
#                     continue
#     for r in m.data: 
#         data = np.insert(data, data.shape[0], np.asarray(r).copy(), 0)
#         #data.append(r.copy())            
#     return Mat2(data)

# cdef class ToddReturn:
#     cpdef int a, b
#     cpdef np.uint8_t[:] z, y
#     def __init__(self, int a, int b, np.ndarray[TYPE_t, ndim=1] z, np.ndarray[TYPE_t, ndim=1] y):
#         self.a = a
#         self.b = b
#         self.z = z
#         self.y = y

# @cython.boundscheck(False)
# @cython.wraparound(False)
# cdef ToddReturn find_todd_match(Mat2 m):
#     cdef int rows, cols, a, b, i
#     cdef np.ndarray[TYPE_t,ndim=1] z, y, r
#     cdef np.ndarray[TYPE_t,ndim=2] options
#     cdef Mat2 bigm
#     rows = m.rows()
#     cols = m.cols()
#     for a in range(cols):
#         for b in range(a+1, cols):
#             z = np.zeros(rows, dtype=TYPE)
#             #z = [0]*rows
#             for i in range(rows):
#                 r = np.asarray(m.data[i])
#                 if r[a]:
#                     if not r[b]:
#                         z[i] = 1
#                 else:
#                     if r[b]:
#                         z[i] = 1
#             bigm = xi(m, z)
#             #print(bigm, '.')
#             options = bigm.nullspace(should_copy=0)
#             #print(bigm)
#             for y in options:
#                 if y[a] + y[b] == 1: return ToddReturn(a,b,z,y)

#     return ToddReturn(-1,-1,z,y)

# @cython.boundscheck(False)
# @cython.wraparound(False)
# cdef int remove_trivial_cols(Mat2 m):
#     cdef int newcols, should_break, a, b
#     while True:
#         newcols = m.rows()
#         for a in range(newcols):
#             if not any(m.data[a]):
#                 m.data = np.delete(m.data, a, 0)
#                 #m.data.pop(a)
#                 break
#             should_break = 0
#             for b in range(a+1, newcols):
#                 if np.alltrue(np.asarray(m.data[a]) == np.asarray(m.data[b])):
#                     m.data = np.delete(m.data, b, 0)
#                     m.data = np.delete(m.data, a, 0)
#                     #m.data.pop(b)
#                     #m.data.pop(a)
#                     should_break = 1
#                     break
#             if should_break: break
#         else: # Didn't break out of for-loop so didn't find any match
#             break
#     return newcols

# @cython.boundscheck(False)
# @cython.wraparound(False)
# cdef Mat2 do_todd_single(Mat2 m):
#     cdef int a, b, i
#     cdef np.ndarray[TYPE_t, ndim=1] z, y, 
#     cdef np.uint8_t[:] c
#     cdef ToddReturn treturn
#     #startcols = m.cols()
#     treturn = find_todd_match(m)
#     a = treturn.a
#     b = treturn.b
#     z = np.asarray(treturn.z)
#     y = np.asarray(treturn.y) 
#     if a == -1: return m
#     m = m.transpose()
#     #odd_y = sum(y) % 2
#     for i,c in enumerate(m.data):
#         if not y[i]: continue
#         for j in range(len(c)):
#             if z[j]: c[j] = 0 if c[j] else 1
#     if sum(y) % 2 == 1:
#         m.data = np.insert(m.data, m.data.shape[0], z, 0)
#         #m.data.append(z)
#     m.data = np.delete(m.data,b,0)
#     m.data = np.delete(m.data,a,0)
#     #m.data.pop(b)
#     #m.data.pop(a)
    
#     remove_trivial_cols(m)
                
#     return m.transpose()

# @cython.boundscheck(False)
# @cython.wraparound(False)
# cpdef Mat2 todd_iter(Mat2 m, int quiet=1):
#     cdef int oldcols, newcols
#     m = m.transpose()
#     remove_trivial_cols(m)
#     m = m.transpose()
#     oldcols = m.cols()
#     while True:
#         m = do_todd_single(m)
#         newcols = m.cols()
#         if oldcols == newcols:
#             return m
#         if not quiet: print(oldcols-newcols)
#         oldcols = newcols
        

# cpdef f():
#     cdef Mat2 a
#     cdef np.ndarray[TYPE_t, ndim=2] l
#     l = np.random.randint(2,size=[50,200],dtype="uint8")
#     a = Mat2(l)
#     #print(a.data[0][0])
#     a.gauss(full_reduce=True)

def do_gauss(m, full_reduce=0, blocksize=6):
    m = np.asarray(m,dtype=TYPE)
    a = Mat2(m)
    a.gauss(full_reduce,blocksize)
    return np.asarray(a.get_data()).tolist()