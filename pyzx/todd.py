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


"""This module implements the Third Order Duplicate and Destroy algorithm
from Luke E Heyfron and Earl T Campbell 2019 Quantum Sci. Technol. 4 015004
available at http://iopscience.iop.org/article/10.1088/2058-9565/aad604/meta"""


def xi(m, z):
    rows = m.rows()
    data = []
    for alpha in range(rows):
        ra = m.data[alpha]
        for beta in range(alpha+1, rows):
            rb = m.data[beta]
            rab = [i*j for i,j in zip(ra,rb)]
            for gamma in range(beta+1, rows):
                rg = m.data[gamma]
                rag = [i*j for i,j in zip(ra,rg)]
                rbg = [i*j for i,j in zip(rb,rg)]
                
                if z[alpha]:
                    if not z[beta]:
                        if not z[gamma]:
                            data.append(rbg)
                            continue
                        data.append([0 if v1==v2 else 1 for v1,v2 in zip(rbg,rab)])
                        continue
                    elif not z[gamma]:
                        data.append([0 if v1==v2 else 1 for v1,v2 in zip(rbg,rag)])
                        continue
                    else: #z[alpha], z[beta] and z[gamma] are all true
                        r = [0 if v1==v2 else 1 for v1,v2 in zip(rab,rag)]
                        data.append([0 if v1==v2 else 1 for v1,v2 in zip(r,rbg)])
                        continue
                elif z[beta]:
                    if z[gamma]:
                        data.append([0 if v1==v2 else 1 for v1,v2 in zip(rab,rag)])
                        continue
                    data.append(rag)
                    continue
                elif z[gamma]:
                    data.append(rab.copy())
                    continue
    for r in m.data: data.append(r.copy())            
    return Mat2(data)

def find_todd_match(m):
    rows = m.rows()
    cols = m.cols()
    for a in range(cols):
        for b in range(a+1, cols):
            z = [0]*rows
            for i in range(rows):
                r = m.data[i]
                if r[a]:
                    if not r[b]:
                        z[i] = 1
                else:
                    if r[b]:
                        z[i] = 1
            bigm = xi(m, z)
            #print(bigm, '.')
            options = bigm.nullspace(should_copy=False)
            #print(bigm)
            for y in options:
                if y[a] + y[b] == 1: return a,b,z,y

    return -1,-1,None,None

def full_todd(m):
    startcols = m.cols()
    a,b,z,y = find_todd_match(m)
    if not z: return m, 0
    m = m.transpose()
    #odd_y = sum(y) % 2
    for i,c in enumerate(m.data):
        if not y[i]: continue
        for j in range(len(c)):
            if z[j]: c[j] = 0 if c[j] else 1
    if sum(y) % 2 == 1:
        m.data.append(z)
    m.data.pop(b)
    m.data.pop(a)
    while True:
        newcols = m.rows()
        for a in range(newcols):
            if not any(m.data[a]):
                m.data.pop(a)
                break
            should_break = False
            for b in range(a+1, newcols):
                if m.data[a] == m.data[b]:
                    m.data.pop(b)
                    m.data.pop(a)
                    should_break = True
                    break
            if should_break: break
        else: # Didn't break out of for-loop so didn't find any match
            break
                
    return m.transpose(), startcols - newcols

def todd_iter(m, quiet=True):
    while True:
        m, reduced = full_todd(m)
        if not reduced:
            return m
        if not quiet: print(reduced, end='.')

