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

__all__ = ['tensorfy']

try:
    import numpy as np
    np.set_printoptions(suppress=True)
except:
    np = None
from math import pi, sqrt


def Z_to_tensor(arity, phase):
    m = np.zeros([2]*arity, dtype = complex)
    m[(0,)*arity] = 1
    m[(1,)*arity] = np.exp(1j*phase)
    return m

def X_to_tensor(arity, phase):
    m = np.ones(2**arity, dtype = complex)
    for i in range(2**arity):
        if bin(i).count("1")%2 == 0: 
            m[i] += np.exp(1j*phase)
        else:
            m[i] -= np.exp(1j*phase)
    return np.power(np.sqrt(0.5),arity)*m.reshape([2]*arity)

#S = Z_to_tensor(2,0.5*np.pi)
#Xphase = X_to_tensor(2,0.5*np.pi)

#had = np.sqrt(2)*np.exp(-1j*0.25*np.pi) * (S @ Xphase @ S)
#print(had)


def pop_and_shift(verts, indices):
    res = []
    for v in verts:
        res.append(indices[v].pop())
    for i in sorted(res,reverse=True):
        for w,l in indices.items():
            l2 = []
            for j in l:
                if j>i: l2.append(j-1)
                else: l2.append(j)
            indices[w] = l2
    return res


def tensorfy(g):
    """Takes in a Graph and outputs a multidimensional numpy array
    representing the linear map the ZX-diagram implements.
    Beware that quantum circuits take exponential memory to represent."""
    rows = g.rows()
    phases = g.phases()
    types = g.types()
    depth = g.depth()
    verts_row = {}
    for v in g.vertices():
        r = rows[v]
        if r in verts_row: verts_row[r].append(v)
        else: verts_row[r] = [v]
    
    had = 1/sqrt(2)*np.mat([[1,1],[1,-1]])
    id2 = np.identity(2)
    tensor = np.identity(2)
    qubits = g.qubit_count()
    for i in range(qubits-1): tensor = np.tensordot(tensor,id2,axes=0)
    inputs = sorted(g.inputs,key=g.qubit)
    indices = {}
    for i in inputs:
        indices[i] = [qubits + g.qubit(i)]
    
    for r in sorted(verts_row.keys()):
        if r == 0: continue #inputs already taken care of
        for v in sorted(verts_row[r]):
            neigh = list(g.neighbours(v))
            d = len(neigh)
            if v in g.outputs: 
                #print("output")
                if d != 1: raise ValueError("Weird output")
                d += 1
                t = id2
            else:
                phase = pi*phases[v]
                t = Z_to_tensor(d,phase) if types[v] == 1 else X_to_tensor(d,phase)
            nn = list(filter(lambda n: rows[n]<r or (rows[n]==r and n<v), neigh))
            ety = {n:g.edge_type(g.edge(v,n)) for n in nn}
            nn.sort(key=lambda n: ety[n])
            for n in nn:
                if ety[n] == 2: #Hadamard edge
                    t = np.tensordot(t,had,(0,0)) # Hadamard edges are moved to the last index of t
            #print(neigh, nn)
            contr = pop_and_shift(nn,indices) #the last indices in contr correspond to hadamard contractions
            #print(contr)
            tensor = np.tensordot(tensor,t,axes=(contr,list(range(len(t.shape)-len(contr),len(t.shape)))))
            indices[v] = list(range(len(tensor.shape)-d+len(contr), len(tensor.shape)))
            #print(indices)
            #print(tensor)
    
    perm = list(range(qubits))
    for o in sorted(g.outputs,key=g.qubit):
        if len(indices[o]) != 1: raise ValueError("Weird output")
        perm.append(indices[o][0])
    
    tensor = np.transpose(tensor,perm)
        
    return tensor


def compare_tensors(t1,t2):
    epsilon = 10**-10
    if np.allclose(t1,t2): return True
    for i,a in enumerate(t1.flat):
        if abs(a)>epsilon: 
            if abs(t2.flat[i])<epsilon: return False
            break
    else:
        raise ValueError("Tensor is too close to zero")
    return np.allclose(t1/a,t2/t2.flat[i])