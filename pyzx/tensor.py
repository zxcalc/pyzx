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

"""This module provides methods for converting ZX-graphs into numpy tensors
and using these tensors to test semantic equality of ZX-graphs.
This module is not meant as an efficient quantum simulator.
Due to the way the tensor is calculated it can only handle
circuits of small size before running out of memory on a regular machine.
Currently, it can reliably transform 9 qubit circuits into tensors.
If the ZX-diagram is not circuit-like, but instead has nodes with high degree,
it will run out of memory even sooner."""

__all__ = ['tensorfy', 'compare_tensors', 'compose_tensors',
            'adjoint', 'is_unitary','tensor_to_matrix',
            'find_scalar_correction']

import itertools
from math import pi, sqrt

from typing import Optional

from .symbolic import Poly


import numpy as np
np.set_printoptions(suppress=True)

# typing imports
from typing import TYPE_CHECKING, List, Dict, Union
from .utils import FractionLike, FloatInt, VertexType, EdgeType, get_z_box_label
if TYPE_CHECKING:
    from .graph.base import BaseGraph, VT, ET
    from .circuit import Circuit
TensorConvertible = Union[np.ndarray, 'Circuit', 'BaseGraph']

def Z_box_to_tensor(arity: int, parameter: complex) -> np.ndarray:
    m = np.zeros([2]*arity, dtype = complex)
    if arity == 0:
        m[()] = 1 + parameter
        return m
    m[(0,)*arity] = 1
    m[(1,)*arity] = parameter
    return m

def Z_to_tensor(arity: int, phase: float) -> np.ndarray:
    return Z_box_to_tensor(arity, np.exp(1j*phase))

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

def W_to_tensor(arity: int) -> np.ndarray:
    m = np.zeros([2]*arity,dtype=complex)
    if arity == 0:
        return m
    for i in range(arity):
        index = [0,]*arity
        index[i] = 1
        m[tuple(index)] = 1
    return m

def pop_and_shift(verts, indices):
    res = [indices[v].pop() for v in verts if v in indices]
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
    if g.is_hybrid():
        raise ValueError("Hybrid graphs are not supported.")
    rows = g.rows()
    phases = g.phases()
    types = g.types()
    depth = g.depth()
    verts_row: Dict[FloatInt, List['VT']] = {}
    for v in g.vertices():
        r = rows[v]
        if r in verts_row: verts_row[r].append(v)
        else: verts_row[r] = [v]

    inputs = g.inputs()
    outputs = g.outputs()
    if not inputs and not outputs:
        if any(g.type(v)==VertexType.BOUNDARY for v in g.vertices()):
            raise ValueError("Diagram contains BOUNDARY-type vertices, but has no inputs or outputs set. Perhaps call g.auto_detect_io() first?")

    had = 1/sqrt(2)*np.array([[1,1],[1,-1]])
    id2 = np.identity(2)
    tensor = np.array(1.0,dtype='complex128')
    qubits = len(inputs)
    for i in range(qubits): tensor = np.tensordot(tensor,id2,axes=0)
    inputs = tuple(inputs)
    indices = {}
    for i, v in enumerate(inputs):
        indices[v] = [1 + 2*i]

    for i,r in enumerate(sorted(verts_row.keys())):
        for v in sorted(verts_row[r]):
            neigh = list(itertools.chain.from_iterable(
                set(g.edge_st(e)) - {v} for e in g.incident_edges(v)
            ))
            self_loops = [e for e in g.incident_edges(v) if g.edge_s(e) == g.edge_t(e)]
            d = len(neigh) + len(self_loops) * 2
            if v in inputs:
                if types[v] != VertexType.BOUNDARY: raise ValueError("Wrong type for input:", v, types[v])
                continue # inputs already taken care of
            if v in outputs:
                if d != 1: raise ValueError("Weird output")
                if types[v] != VertexType.BOUNDARY: raise ValueError("Wrong type for output:",v, types[v])
                d += 1
                t = id2
            else:
                p = phases[v]
                if isinstance(p, Poly):
                    raise ValueError(f"Can't convert diagram with parameters to tensor: {str(p)}")
                phase = pi*p
                if types[v] == VertexType.Z:
                    t = Z_to_tensor(d,phase)
                elif types[v] == VertexType.X:
                    t = X_to_tensor(d,phase)
                elif types[v] == VertexType.H_BOX:
                    t = H_to_tensor(d,phase)
                elif types[v] == VertexType.W_INPUT or types[v] == VertexType.W_OUTPUT:
                    if phase != 0: raise ValueError("Phase on W node")
                    t = W_to_tensor(d)
                elif types[v] == VertexType.Z_BOX:
                    if phase != 0: raise ValueError("Phase on Z box")
                    label = get_z_box_label(g, v)
                    t = Z_box_to_tensor(d, label)
                else:
                    raise ValueError("Vertex %s has non-ZXH type but is not an input or output" % str(v))
            for sl in self_loops:
                if g.edge_type(sl) == EdgeType.HADAMARD:
                    t = np.tensordot(t,had)
                elif g.edge_type(sl) == EdgeType.SIMPLE:
                    t = np.trace(t)
                else:
                    raise NotImplementedError(f"Tensor contraction with {repr(sl)} self-loops is not implemented.")
            nn = list(filter(lambda n: rows[n]<r or (rows[n]==r and n<v), neigh)) # TODO: allow ordering on vertex indices?
            ety = {n:g.edge_type(g.edge(v,n)) for n in nn}
            nn.sort(key=lambda n: ety[n])
            for n in nn:
                if ety[n] == EdgeType.HADAMARD:
                    t = np.tensordot(t,had,(0,0)) # Hadamard edges are moved to the last index of t
            contr = pop_and_shift(nn,indices) #the last indices in contr correspond to hadamard contractions
            tensor = np.tensordot(tensor,t,axes=(contr,list(range(len(t.shape)-len(contr),len(t.shape)))))
            indices[v] = list(range(len(tensor.shape)-d+len(contr), len(tensor.shape)))

            if not preserve_scalar and i % 10 == 0:
                if np.abs(tensor).max() < 10**-6: # Values are becoming too small
                    tensor *= 10**4 # So scale all the numbers up
    perm = []
    for o in outputs:
        perm.append(indices[o][0])
    for i in range(len(inputs)):
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
                row.append(t[tuple(a)])
        rows.append(row)
    return np.array(rows)

def compare_tensors(t1: TensorConvertible,t2: TensorConvertible, preserve_scalar: bool=False) -> bool:
    """Returns true if ``t1`` and ``t2`` represent equal tensors.
    When `preserve_scalar` is False (the default), equality is checked up to nonzero rescaling.

    Example: To check whether two ZX-graphs `g1` and `g2` are semantically the same you would do::

        compare_tensors(g1,g2) # True if g1 and g2 represent the same linear map up to nonzero scalar

    """
    from .circuit import Circuit

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

def find_scalar_correction(t1: TensorConvertible, t2:TensorConvertible) -> complex:
    """Returns the complex number ``z`` such that ``t1 = z*t2``.

    Warning:
        This function assumes that ``compare_tensors(t1,t2,preserve_scalar=False)`` is True,
        i.e. that ``t1`` and ``t2`` indeed are equal up to global scalar.
        If they aren't, this function returns garbage.

    """
    if not isinstance(t1, np.ndarray):
        t1 = t1.to_tensor(preserve_scalar=True)
    if not isinstance(t2, np.ndarray):
        t2 = t2.to_tensor(preserve_scalar=True)

    epsilon = 10**-14
    for i,a in enumerate(t1.flat):
        if abs(a)>epsilon:
            if abs(t2.flat[i])<epsilon: return 0
            return a/t2.flat[i]

    return 0


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
    return compare_tensors(adj.to_tensor(), identity(len(g.inputs()),2).to_tensor(), False)
