# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
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

__all__ = ['cnots','cliffords', 'cliffordT', 'identity', 'CNOT_HAD_PHASE_circuit']

import random
from fractions import Fraction

from typing import Optional, List

from .utils import EdgeType, VertexType, FloatInt
from .graph import Graph
from .graph.base import BaseGraph
from .circuit import Circuit

# TODO: This file needs some cleanup, as probably all functions should just return a Circuit instead of a Graph


def identity(qubits: int, depth: FloatInt=1,backend:Optional[str]=None) -> BaseGraph:
    """Generates a :func:`pyzx.graph.Graph` representing an identity circuit.

    Args:
        qubits: number of qubits (i.e. parallel lines of the Graph)
        depth: at which row the output vertices should be placed
        backend: the backend to use for the output graph
    """
    g = Graph(backend)
    for i in range(qubits):
        v = g.add_vertex(VertexType.BOUNDARY,i,0)
        w = g.add_vertex(VertexType.BOUNDARY,i,depth)
        g.inputs.append(v)
        g.outputs.append(w)
        g.add_edge((v,w))

    return g


def CNOT_HAD_PHASE_circuit(
        qubits: int, 
        depth: int, 
        p_had: float = 0.2, 
        p_t: float = 0.2, 
        clifford:bool=False
        ) -> Circuit:
    """Construct a Circuit consisting of CNOT, HAD and phase gates. 
    The default phase gate is the T gate, but if ``clifford=True``\ , then
    this is replaced by the S gate.

    Args:
        qubits: number of qubits of the circuit
        depth: number of gates in the circuit
        p_had: probability that each gate is a Hadamard gate
        p_t: probability that each gate is a T gate (or if ``clifford`` is set, S gate)
        clifford: when set to True, the phase gates are S gates instead of T gates.

    Returns:
        A random circuit consisting of Hadamards, CNOT gates and phase gates.

    """
    p_cnot = 1-p_had-p_t
    c = Circuit(qubits)
    for _ in range(depth):
        r = random.random()
        if r > 1-p_had:
            c.add_gate("HAD",random.randrange(qubits))
        elif r > 1-p_had-p_t:
            if not clifford: c.add_gate("T",random.randrange(qubits))
            else: c.add_gate("S",random.randrange(qubits))
        else:
            tgt = random.randrange(qubits)
            while True:
                ctrl = random.randrange(qubits)
                if ctrl!=tgt: break
            c.add_gate("CNOT",tgt,ctrl)
    return c


def cnots(qubits: int, depth: int, backend:Optional[str]=None) -> BaseGraph:
    """Generates a circuit consisting of randomly placed CNOT gates.
    
    Args:
    qubits: Amount of qubits in circuit
    depth: Depth of circuit
    backend: When given, should be one of the possible :ref:`graph_api` backends.
    
    Returns:
        Instance of graph of the given backend
    """
    # initialise and add input row

    q: List[int] = list(range(qubits))                          # qubit index, initialised with input
    r: int = 1                                                  # current rank
    ty: List[VertexType.Type] = [VertexType.BOUNDARY] * qubits  # types of vertices
    qs: List[int] = list(range(qubits))                         # tracks qubit indices of vertices
    rs: List[int] = [0] * qubits                                # tracks rank of vertices
    v = qubits                                                  # next vertex to add
    es = []                                                     # edges to add

    # initial row of Z
    for i in range(qubits):
        es.append((q[i], v))
        q[i] = v
        rs.append(r)
        qs.append(i)
        ty.append(VertexType.Z)
        v += 1
    r += 1

    # random CNOTs
    for i in range(depth):
        c = random.randint(0, qubits-1)
        t = random.randint(0, qubits-2)
        if t >= c: t += 1
        es += [(q[c], v), (q[t], v+1), (v, v+1)]
        q[c] = v
        q[t] = v+1
        rs += [r,r]
        qs += [c,t]
        ty += [VertexType.Z, VertexType.X]
        v += 2
        r += 1

    # final row of Z
    for i in range(qubits):
        es.append((q[i], v))
        q[i] = v
        rs.append(r)
        qs.append(i)
        ty.append(VertexType.Z)
        v += 1
    r += 1

    # outputs
    qs += list(range(qubits))
    rs += [r] * qubits
    ty += [VertexType.BOUNDARY] * qubits
    es += [(q[i], v+i) for i in range(qubits)]
    v += qubits

    g = Graph(backend)

    for i in range(v):
        g.add_vertex(ty[i],qs[i],rs[i])

    g.add_edges(es)

    for i in range(qubits):
        g.inputs.append(i)
        g.outputs.append(v-i-1)

    g.scalar.add_power(depth)
    return g

def accept(p: float) -> bool:
    return p>random.random()

def random_phase(add_t: bool) -> Fraction:
    if add_t:
        return Fraction(random.randint(1,8),4)
    return Fraction(random.randint(1,4),2)

def cliffordT(
        qubits: int, 
        depth: int, 
        p_t:Optional[float]=None, 
        p_s:Optional[float]=None, 
        p_hsh:Optional[float]=None, 
        p_cnot:Optional[float]=None, 
        backend:Optional[str]=None
        ) -> BaseGraph:
    """Generates a circuit consisting of randomly placed Clifford+T gates. Optionally, take
    probabilities of adding T, S, HSH, and CNOT. If probabilities for only a subset of gates
    is given, any remaining probability will be uniformly distributed among the remaining
    gates.

    :param qubits: Amount of qubits in circuit.
    :param depth: Depth of circuit.
    :param p_t: Probability that each gate is a T-gate.
    :param p_s: Probability that each gate is a S-gate.
    :param p_hsh: Probability that each gate is a HSH-gate.
    :param p_cnot: Probability that each gate is a CNOT-gate.
    :param backend: When given, should be one of the possible :ref:`graph_api` backends.
    :rtype: Instance of graph of the given backend.
    """
    g = Graph(backend)
    qs = list(range(qubits))  # tracks qubit indices of vertices
    v = 0                     # next vertex to add
    r = 0                     # current row

    num = 0.0
    rest = 1.0
    if p_t is None: num += 1.0
    else: rest -= p_t
    if p_s is None: num += 1.0
    else: rest -= p_s
    if p_hsh is None: num += 1.0
    else: rest -= p_hsh
    if p_cnot is None: num += 1.0
    else: rest -= p_cnot

    if rest < 0: raise ValueError("Probabilities are >1.")

    if p_t is None: p_t = rest / num
    if p_s is None: p_s = rest / num
    if p_hsh is None: p_hsh = rest / num
    if p_cnot is None: p_cnot = rest / num

    #p_s = (1 - p_t) / 3.0
    #p_hsh = (1 - p_t) / 3.0
    #p_cnot = (1 - p_t) / 3.0
    

    for i in range(qubits):
        g.add_vertex(VertexType.BOUNDARY,i,r)
        g.inputs.append(v)
        v += 1
    r += 1

    for i in range(qubits):
        g.add_vertex(VertexType.Z,i,r)
        g.add_edge((qs[i], v))
        qs[i] = v
        v += 1
    r += 1

    for i in range(2, depth+2):
        p = random.random()
        q0 = random.randrange(qubits)

        g.add_vertex(VertexType.Z,q0,r)
        g.add_edge((qs[q0], v))
        qs[q0] = v
        v += 1
        r += 1

        if p > 1 - p_cnot:
            # apply CNOT gate
            q1 = random.randrange(qubits-1)
            if q1 >= q0: q1 += 1

            g.add_vertex(VertexType.X,q1,r-1)
            g.add_edge((qs[q1], v))
            g.add_edge((v-1,v))
            g.scalar.add_power(1)
            qs[q1] = v
            v += 1
        elif p > 1 - p_cnot - p_hsh:
            # apply HSH gate
            g.set_type(v-1, VertexType.X)
            g.set_phase(v-1, Fraction(1,2))
        elif p > 1 - p_cnot - p_hsh - p_s:
            # apply S gate
            g.set_phase(v-1, Fraction(1,2))
        else:
            # apply T gate
            g.set_phase(v-1, Fraction(1,4))

    for i in range(qubits):
        g.add_vertex(VertexType.Z,i,r)
        g.add_edge((qs[i], v))
        qs[i] = v
        v += 1
    r += 1

    for i in range(qubits):
        g.add_vertex(VertexType.BOUNDARY,i,r)
        g.add_edge((qs[i], v))
        g.outputs.append(v)
        v += 1

    return g



def cliffords(
        qubits: int, 
        depth: int, 
        no_hadamard:bool=False,
        t_gates:bool=False,
        backend:Optional[str]=None):
    """Generates a circuit consisting of randomly placed Clifford gates.
    Uses a different approach to generating Clifford circuits then :func:`cliffordT`.

    :param qubits: Amount of qubits in circuit.
    :param depth: Depth of circuit.
    :param no_hadamard: Whether hadamard edges are allowed to be placed.
    :param backend: When given, should be one of the possible :ref:`graph_api` backends.
    :rtype: Instance of graph of the given backend.
    """

    #randomness parameters
    p_two_qubit = 0.4 #whether to add a edge between two qubits
    p_cnot = 1 #0.4 # whether to CNOT or to CZ
    p_phase = 0.6 #probability of adding a phase to a node
    p_had = 0.2 # probability of adding a hadamard on a qubit

    # initialise and add input row

    q = list(range(qubits))   # qubit index, initialised with input
    r = 1                     # current rank
    ty: List[VertexType.Type] = [VertexType.BOUNDARY] * qubits         # types of vertices
    qs = list(range(qubits))  # tracks qubit indices of vertices
    rs = [0] * qubits         # tracks rank of vertices
    v = qubits                # next vertex to add
    es1 = [] # normal edges to add
    es2 = [] # hadamard edges to add
    phases = {}

    # initial row of Z
    for i in range(qubits):
        es1.append((q[i], v))
        q[i] = v
        rs.append(r)
        qs.append(i)
        ty.append(1)
        v += 1
    r += 1

    # random gates
    for i in range(depth):
        c = random.randint(0, qubits-1)
        t = random.randint(0, qubits-2)
        if t >= c: t += 1
        if accept(p_two_qubit):
            if no_hadamard or accept(p_cnot): 
                es1.append((v, v+1))
                ty += [VertexType.Z, VertexType.X]
            else: 
                es2.append((v,v+1))
                typ: VertexType.Type = random.choice([VertexType.Z, VertexType.X])
                ty += [typ, typ]
            if accept(p_phase): phases[v] = random_phase(t_gates)
            if accept(p_phase): phases[v+1] = random_phase(t_gates)
        else:
            phases[v] = random_phase(t_gates)
            phases[v+1] = random_phase(t_gates)
            ty += [VertexType.Z, VertexType.X]
        
        if not no_hadamard and accept(p_had): es2.append((q[c],v))
        else: es1.append((q[c],v))
        if not no_hadamard and accept(p_had): es2.append((q[t],v+1))
        else: es1.append((q[t],v+1))

        q[c] = v
        q[t] = v+1
        
        rs += [r,r]
        qs += [c,t]
        v += 2
        r += 1

    # final row of Z
    for i in range(qubits):
        es1.append((q[i], v))
        q[i] = v
        rs.append(r)
        qs.append(i)
        ty.append(VertexType.Z)
        v += 1
    r += 1

    # outputs
    qs += list(range(qubits))
    rs += [r] * qubits
    ty += [VertexType.BOUNDARY] * qubits
    es1 += [(q[i], v+i) for i in range(qubits)]
    v += qubits

    g = Graph(backend)
    

    for i in range(v):
        g.add_vertex(ty[i],qs[i], rs[i])
    for w, phase in phases.items():
        g.set_phase(w,phase)

    g.add_edges(es1, EdgeType.SIMPLE)
    g.add_edges(es2, EdgeType.HADAMARD)

    for i in range(qubits):
        g.inputs.append(i)
        g.outputs.append(v-i-1)
    return g



def circuit_identity_phasepoly() -> Circuit:
    """Returns a 4-qubit circuit that is equal to the identity, provable by phase polynomial reductions."""
    c = Circuit(4)
    c.add_gate("ParityPhase",Fraction(1,4),0,1,2,3)
    for i in range(4):
        c.add_gate("ZPhase",i, Fraction(3,4))
        for j in range(i+1,4):
            c.add_gate("ParityPhase", Fraction(5,4),i,j)
            for k in range(j+1,4):
                c.add_gate("ParityPhase", Fraction(7,4),i,j,k)

    return c


def circuit_identity_commuting_controls(alpha:Fraction,beta:Fraction) -> Circuit:
    """Returns the circuit UVU*V* where U=NCZ(2beta) and V=CX(2alpha).
    Since these operations commute this circuit is equal to the identity.
    See page 13 of https://arxiv.org/pdf/1705.11151.pdf for more details."""
    cb = Circuit(2) 
    cb.add_gate("NOT",0)
    cb.add_gate("ZPhase",0,beta)
    cb.add_gate("ZPhase",1,beta)
    cb.add_gate("ParityPhase", -beta, 0, 1)
    cb.add_gate("NOT",0)

    ca = Circuit(2)
    ca.add_gate("ZPhase", 1, Fraction(3,2))
    ca.add_gate("XPhase", 1, Fraction(3,2))
    ca.add_gate("ZPhase",0,alpha)
    ca.add_gate("ZPhase",1,alpha)
    ca.add_gate("ParityPhase", -alpha, 0, 1)
    ca.add_gate("XPhase", 1, Fraction(1,2))
    ca.add_gate("ZPhase", 1, Fraction(1,2))

    c = cb.copy()
    c.add_circuit(ca)
    c.add_circuit(cb.adjoint())
    c.add_circuit(ca.adjoint())
    
    return c


def circuit_identity_two_qubit1() -> Circuit:
    """This returns the first nontrivial circuit identity from Selinger & Bian.
    See https://www.mathstat.dal.ca/~xbian/talks/slide_cliffordt2.pdf"""
    c = Circuit(2)
    c.add_gate("NOT",0)
    c.add_gate("T",1,adjoint=True)
    c.add_gate("S",1,adjoint=True)
    c.add_gate("HAD",1)
    c.add_gate("T",1,adjoint=True)
    c.add_gate("CNOT",0,1)
    c.add_gate("NOT",0)
    c.add_gate("T",1)
    c.add_gate("HAD",1)
    c.add_gate("S",1)
    c.add_gate("T",1)
    c.add_gate("CNOT",0,1)
    c.add_circuit(c)
    return c

def circuit_identity_two_qubit2() -> Circuit:
    """This returns the second nontrivial circuit identity from Selinger & Bian.
    See https://www.mathstat.dal.ca/~xbian/talks/slide_cliffordt2.pdf"""
    c = Circuit(2)
    c.add_gate("CNOT",0,1)
    c.add_gate("NOT",0)
    c.add_gate("T",1)
    c.add_gate("HAD",1)
    c.add_gate("T",1)
    c.add_gate("HAD",1)
    c.add_gate("T",1,adjoint=True)
    c.add_gate("CNOT",0,1)
    c.add_gate("NOT",0)
    c.add_gate("T",1)
    c.add_gate("HAD",1)
    c.add_gate("T",1,adjoint=True)
    c.add_gate("HAD",1)
    c.add_gate("T",1,adjoint=True)
    c.add_circuit(c)
    return c
