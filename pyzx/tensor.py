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

__all__ = ['tensorfy', 'compare_tensors', 'compose_tensors', 'adjoint']

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
        #indices[i] = [qubits + g.qubit(i)]
        indices[i] = [1 + 2*g.qubit(i)]
    
    for i,r in enumerate(sorted(verts_row.keys())):
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
            
            if i % 10 == 0:
                if np.abs(tensor).max() < 10**-6: # Values are becoming too small
                    tensor *= 10**4 # So scale all the numbers up
            #print(indices)
            #print(tensor)
    
    perm = []
    for i,o in enumerate(sorted(g.outputs,key=g.qubit)):
        if len(indices[o]) != 1: raise ValueError("Weird output")
        perm.append(i)
        perm.append(indices[o][0])
    
    tensor = np.transpose(tensor,perm)
        
    return tensor


def compare_tensors(t1,t2):
    """Returns true if ``t1`` and ``t2`` are tensors equal up to a nonzero number.

    Example: To check whether two ZX-graphs are semantically the same you would do::

        t1 = tensorfy(g1)
        t2 = tensorfy(g2)
        compare_tensors(t1,t2) # True if g1 and g2 represent the same circuit
    """
    epsilon = 10**-14
    if np.allclose(t1,t2): return True
    for i,a in enumerate(t1.flat):
        if abs(a)>epsilon: 
            if abs(t2.flat[i])<epsilon: return False
            break
    else:
        raise ValueError("Tensor is too close to zero")
    return np.allclose(t1/a,t2/t2.flat[i])


def compose_tensors(t1,t2):
    """Returns a tensor that is the result of composing the tensors together as if they
    were representing circuits::

        t1 = tensorfy(circ1)
        t2 = tensorfy(circ2)
        circ1.compose(circ2)
        t3 = tensorfy(circ1)
        t4 = compose_tensors(t1,t2)
        compare_tensors(t3,t4) # This is True

    """

    if len(t1.shape) != len(t2.shape):
        raise TypeError("Tensors represent circuits of different amount of qubits, "
                        "{!s} vs {!s}".format(len(t1.shape)//2,len(t2.shape)//2))
    q = len(t1.shape)//2
    contr1 = [2*i+1 for i in range(q)]
    contr2 = [2*i for i in range(q)]
    t = np.tensordot(t1,t2,axes=(contr1,contr2))
    transp = []
    for i in range(q):
        transp.append(i)
        transp.append(q+i)
    return np.transpose(t,transp)


def adjoint(t):
    """Returns the adjoint of the tensor as if it were representing
    a circuit::

        t = tensorfy(circ)
        tadj = tensorfy(circ.adjoint())
        compare_tensors(adjoint(t),tadj) # This is True

    """
    
    q = len(t.shape)//2
    transp = []
    for i in range(q):
        transp.append(2*i+1)
        transp.append(2*i)
    return np.transpose(t.conjugate(),transp)