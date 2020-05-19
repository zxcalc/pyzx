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

__all__ = ['tensorfy', 'compare_tensors', 'compose_tensors', 'adjoint', 'is_unitary']

from math import pi, sqrt


import numpy as np
np.set_printoptions(suppress=True)

# typing imports
from typing import TYPE_CHECKING, List, Dict, Union
from .utils import FractionLike, FloatInt
if TYPE_CHECKING:
    from .graph.base import BaseGraph, VT, ET
    from .circuit import Circuit
TensorConvertible = Union[np.ndarray, 'Circuit', 'BaseGraph']

def Z_to_tensor(arity: int, phase: float) -> np.ndarray:
    m = np.zeros([2]*arity, dtype = complex)
    if arity == 0:
        m[()] = 1 + np.exp(1j*phase)
        return m
    m[(0,)*arity] = 1
    m[(1,)*arity] = np.exp(1j*phase)
    return m

def X_to_tensor(arity: int, phase: float) -> np.ndarray:
    m = np.ones(2**arity, dtype = complex)
    if arity == 0:
        m[()] = 1 + np.exp(1j*phase)
        return m
    for i in range(2**arity):
        if bin(i).count("1")%2 == 0: 
            m[i] += np.exp(1j*phase)
        else:
            m[i] -= np.exp(1j*phase)
    return np.power(np.sqrt(0.5),arity)*m.reshape([2]*arity)

def H_to_tensor(arity: int, phase: float) -> np.ndarray:
    m = np.ones(2**arity, dtype = complex)
    if phase != 0: m[-1] = np.exp(1j*phase)
    return m.reshape([2]*arity)

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

def tensorfy(g: 'BaseGraph[VT,ET]', preserve_scalar:bool=True) -> np.ndarray:
    """Takes in a Graph and outputs a multidimensional numpy array
    representing the linear map the ZX-diagram implements.
    Beware that quantum circuits take exponential memory to represent."""
    rows = g.rows()
    phases = g.phases()
    types = g.types()
    depth = g.depth()
    verts_row: Dict[FloatInt, List['VT']] = {}
    for v in g.vertices():
        r = rows[v]
        if r in verts_row: verts_row[r].append(v)
        else: verts_row[r] = [v]
    
    had = 1/sqrt(2)*np.array([[1,1],[1,-1]])
    id2 = np.identity(2)
    tensor = np.array(1.0,dtype='complex128')
    qubits = len(g.inputs)
    for i in range(qubits): tensor = np.tensordot(tensor,id2,axes=0)
    inputs = sorted(g.inputs,key=g.qubit)
    indices = {}
    for i, v in enumerate(inputs):
        indices[v] = [1 + 2*i]
    
    for i,r in enumerate(sorted(verts_row.keys())):
        for v in sorted(verts_row[r]):
            neigh = list(g.neighbours(v))
            d = len(neigh)
            if v in g.inputs:
                if types[v] != 0: raise ValueError("Wrong type for input:", v, types[v])
                continue # inputs already taken care of
            if v in g.outputs: 
                #print("output")
                if d != 1: raise ValueError("Weird output")
                if types[v] != 0: raise ValueError("Wrong type for output:",v, types[v])
                d += 1
                t = id2
            else:
                phase = pi*phases[v]
                if types[v] == 1:
                    t = Z_to_tensor(d,phase)
                elif types[v] == 2:
                    t = X_to_tensor(d,phase)
                elif types[v] == 3:
                    t = H_to_tensor(d,phase)
                else:
                    raise ValueError("Non-ZXH internal vertex", v)
            nn = list(filter(lambda n: rows[n]<r or (rows[n]==r and n<v), neigh)) # type: ignore # TODO: allow ordering on vertex indices?
            ety = {n:g.edge_type(g.edge(v,n)) for n in nn}
            nn.sort(key=lambda n: ety[n]) 
            for n in nn:
                if ety[n] == 2: #Hadamard edge
                    t = np.tensordot(t,had,(0,0)) # Hadamard edges are moved to the last index of t
            contr = pop_and_shift(nn,indices) #the last indices in contr correspond to hadamard contractions
            tensor = np.tensordot(tensor,t,axes=(contr,list(range(len(t.shape)-len(contr),len(t.shape)))))
            indices[v] = list(range(len(tensor.shape)-d+len(contr), len(tensor.shape)))
            
            if not preserve_scalar and i % 10 == 0:
                if np.abs(tensor).max() < 10**-6: # Values are becoming too small
                    tensor *= 10**4 # So scale all the numbers up
    perm = []
    for o in sorted(g.outputs,key=g.qubit):
        perm.append(indices[o][0])
    for i in range(len(g.inputs)):
        perm.append(i)

    tensor = np.transpose(tensor,perm)
    if preserve_scalar: tensor *= g.scalar.to_number()
    return tensor

def tensor_to_matrix(t: np.ndarray, inputs: int, outputs: int) -> np.ndarray:
    """Takes a tensor generated by ``tensorfy`` and turns it into a matrix.
    The ``inputs`` and ``outputs`` arguments specify the final shape of the matrix:
    2^(outputs) x 2^(inputs)"""
    rows = []
    for r in range(2**outputs):
        if outputs == 0:
            o = []
        else:
            o = [int(i) for i in bin(r)[2:].zfill(outputs)]
        row = []
        if inputs == 0:
            row.append(t[tuple(o)])
        else:
            for c in range(2**inputs):
                a = o.copy()
                a.extend([int(i) for i in bin(c)[2:].zfill(inputs)])
                #print(a)
                #print(t[tuple(a)])
                row.append(t[tuple(a)])
        rows.append(row)
    return np.array(rows)

def compare_tensors(t1: TensorConvertible,t2: TensorConvertible, preserve_scalar: bool=True) -> bool:
    """Returns true if ``t1`` and ``t2`` are tensors equal up to a nonzero number.
    If `preserve_scalar` is False, then equality is checked up to a nonzero number.
    If one of t1 or t2 is a ``Circuit``, then equality is always checked up to a nonzero number.

    Example: To check whether two ZX-graphs are semantically the same you would do::

        t1 = tensorfy(g1)
        t2 = tensorfy(g2)
        compare_tensors(t1,t2) # True if g1 and g2 represent the same circuit
    """
    from .circuit import Circuit

    if isinstance(t1, Circuit) or isinstance(t2, Circuit):
        preserve_scalar = False

    if not isinstance(t1, np.ndarray):
        t1 = t1.to_tensor(preserve_scalar)
    if not isinstance(t2, np.ndarray):
        t2 = t2.to_tensor(preserve_scalar)
    if np.allclose(t1,t2): return True
    if preserve_scalar: return False # We do not check for equality up to scalar
    epsilon = 10**-14
    for i,a in enumerate(t1.flat):
        if abs(a)>epsilon: 
            if abs(t2.flat[i])<epsilon: return False
            break
    else:
        raise ValueError("Tensor is too close to zero")
    return np.allclose(t1/a,t2/t2.flat[i])


def compose_tensors(t1: np.ndarray, t2: np.ndarray) -> np.ndarray:
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
    contr2 = [q+i for i in range(q)]
    contr1 = [i for i in range(q)]
    t = np.tensordot(t1,t2,axes=(contr1,contr2))
    transp = []
    for i in range(q):
        transp.append(q+i)
    for i in range(q):
        transp.append(i)
    return np.transpose(t,transp)


def adjoint(t: np.ndarray) -> np.ndarray:
    """Returns the adjoint of the tensor as if it were representing
    a circuit::

        t = tensorfy(circ)
        tadj = tensorfy(circ.adjoint())
        compare_tensors(adjoint(t),tadj) # This is True

    """
    
    q = len(t.shape)//2
    transp = []
    for i in range(q):
        transp.append(q+i)
    for i in range(q):
        transp.append(i)
    return np.transpose(t.conjugate(),transp)


def is_unitary(g: 'BaseGraph') -> bool:
    """Returns whether the given ZX-graph is equal to a unitary (up to a number)."""
    from .generate import identity # Imported here to prevent circularity
    adj = g.adjoint()
    adj.compose(g)
    return compare_tensors(adj.to_tensor(), identity(len(g.inputs),2).to_tensor(), False)