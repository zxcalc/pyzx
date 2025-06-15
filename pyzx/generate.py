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

__all__ = [
    "cnots",
    "cliffords",
    "cliffordT",
    "cliffordTmeas",
    "identity",
    "CNOT_HAD_PHASE_circuit",
    "phase_poly",
    "phase_poly_approximate",
    "phase_poly_from_gadgets",
    "qft",
]

import random, types
from fractions import Fraction

from typing import Optional, List, Set, Union
from typing_extensions import Literal

import numpy as np
from pyzx.circuit.gates import CNOT, ZPhase
from pyzx.linalg import Mat2, MatLike

from pyzx.routing.parity_maps import CNOT_tracker, Parity
from pyzx.routing.phase_poly import PhasePoly, mat22partition

from .utils import EdgeType, VertexType, FloatInt, FractionLike, vertex_is_w, set_z_box_label
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
    inputs = []
    outputs = []
    for i in range(qubits):
        v = g.add_vertex(VertexType.BOUNDARY,i,0)
        w = g.add_vertex(VertexType.BOUNDARY,i,depth)
        inputs.append(v)
        outputs.append(w)
        g.add_edge((v,w))
    g.set_inputs(tuple(inputs))
    g.set_outputs(tuple(outputs))

    return g

def spider(
    typ:Union[Literal["Z"], Literal["X"], Literal["H"], Literal["W"], Literal["ZBox"], VertexType],
    inputs: int,
    outputs: int,
    phase:Optional[Union[FractionLike, complex]]=None,
    ) -> BaseGraph:
    """Returns a Graph containing a single spider of the specified type 
    and with the specified number of inputs and outputs."""
    if typ == "Z": typ = VertexType.Z
    elif typ == "X": typ = VertexType.X
    elif typ == "H": typ = VertexType.H_BOX
    elif typ == "W": typ = VertexType.W_OUTPUT
    elif typ == "ZBox": typ = VertexType.Z_BOX
    else:
        if not isinstance(typ, int):
            raise TypeError("Wrong type for spider type: " + str(typ))
    if phase is None:
        phase = 1 if typ == VertexType.Z_BOX else 0
    g = Graph()
    if vertex_is_w(typ):
        if inputs != 1:
            raise ValueError("Wrong number of inputs for W node: " + str(inputs))
        v_in = g.add_vertex(VertexType.W_INPUT, (outputs-1)/2, 0.8)
        v_out = g.add_vertex(VertexType.W_OUTPUT, (outputs-1)/2, 1)
        g.add_edge((v_in, v_out), EdgeType.W_IO)
    elif typ == VertexType.Z_BOX:
        v_in = g.add_vertex(typ, (inputs-1)/2, 1)
        set_z_box_label(g, v_in, phase)
        v_out = v_in
    else:
        assert isinstance(phase, (int, Fraction))
        v_in = g.add_vertex(typ, (inputs-1)/2, 1, phase)
        v_out = v_in
    inp = []
    outp = []
    for i in range(inputs):
        v = g.add_vertex(VertexType.BOUNDARY,i,0)
        inp.append(v)
    for i in range(outputs):
        v = g.add_vertex(VertexType.BOUNDARY,i,2)
        outp.append(v)
    for w in inp:
        g.add_edge((v_in, w))
    for w in outp:
        g.add_edge((v_out, w))

    g.set_inputs(tuple(inp))
    g.set_outputs(tuple(outp))

    return g


def CNOT_HAD_PHASE_circuit(
        qubits: int,
        depth: int,
        p_had: float = 0.2,
        p_t: float = 0.2,
        clifford:bool=False,
        seed:Optional[int]=None
        ) -> Circuit:
    """Construct a Circuit consisting of CNOT, HAD and phase gates.
    The default phase gate is the T gate, but if ``clifford=True``\\ , then
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
    rand: Union[random.Random, types.ModuleType]
    if (seed is not None): rand = random.Random(seed)
    else: rand = random
    p_cnot = 1-p_had-p_t
    c = Circuit(qubits)
    for _ in range(depth):
        r = rand.random()
        if r > 1-p_had:
            c.add_gate("HAD",rand.randrange(qubits))
        elif r > 1-p_had-p_t:
            if not clifford: c.add_gate("T",rand.randrange(qubits))
            else: c.add_gate("S",rand.randrange(qubits))
        else:
            tgt = rand.randrange(qubits)
            while True:
                ctrl = rand.randrange(qubits)
                if ctrl!=tgt: break
            c.add_gate("CNOT",tgt,ctrl)
    return c


def cnots(qubits: int, depth: int, backend:Optional[str]=None, seed:Optional[int]=None) -> BaseGraph:
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
    ty: List[VertexType] = [VertexType.BOUNDARY] * qubits  # types of vertices
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
    rand: Union[random.Random, types.ModuleType]
    if (seed is not None): rand = random.Random(seed)
    else: rand = random
    for i in range(depth):
        c = rand.randint(0, qubits-1)
        t = rand.randint(0, qubits-2)
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

    inputs = []
    outputs = []
    for i in range(qubits):
        inputs.append(i)
        outputs.append(v-i-1)

    g.set_inputs(tuple(inputs))
    g.set_outputs(tuple(outputs))

    g.scalar.add_power(depth)
    return g

def accept(p: float, rand:Union[random.Random,types.ModuleType]=random) -> bool:
    return p>rand.random()

def random_phase(add_t: bool, rand:Union[random.Random,types.ModuleType]=random) -> Fraction:
    if add_t: return Fraction(rand.randint(1,8),4)
    return Fraction(rand.randint(1,4),2)

def cliffordTmeas(
        qubits: int, 
        depth: int, 
        p_t:Optional[float]=None, 
        p_s:Optional[float]=None, 
        p_hsh:Optional[float]=None, 
        p_cnot:Optional[float]=None, 
        p_meas:Optional[float]=None, 
        backend:Optional[str]=None,
        seed:Optional[int]=None
        ) -> BaseGraph:
    """Generates a circuit consisting of randomly placed Clifford+T gates. Optionally, take
    probabilities of adding T, S, HSH, CNOT, and measurements.
    If probabilities for only a subset of gates is given, any remaining probability will be
    uniformly distributed among the remaining gates.

    :param qubits: Amount of qubits in circuit.
    :param depth: Depth of circuit.
    :param p_t: Probability that each gate is a T-gate.
    :param p_s: Probability that each gate is a S-gate.
    :param p_hsh: Probability that each gate is a HSH-gate.
    :param p_cnot: Probability that each gate is a CNOT-gate.
    :param p_meas: Probability that each gate is a measurement.
    :param backend: When given, should be one of the possible :ref:`graph_api` backends.
    :rtype: Instance of graph of the given backend.
    """
    g = Graph(backend)
    qs = list(range(qubits))  # tracks qubit indices of vertices
    v = 0                     # next vertex to add
    r = 0                     # current row
    
    rand: Union[random.Random, types.ModuleType]
    if (seed is not None): rand = random.Random(seed)
    else: rand = random

    num = 0.0
    rest = 1.0
    if p_t is None: num += 1.0
    else: rest -= p_t
    if p_s is None: num += 1.0
    else: rest -= p_s
    if p_hsh is None: num += 1.0
    else: rest -= p_hsh
    if p_cnot is None: num += 1.0 if qubits > 1 else 0.0
    else: rest -= p_cnot
    if p_meas is None: num += 1.0
    else: rest -= p_meas

    if rest < 0: raise ValueError("Probabilities are >1.")

    if p_t is None: p_t = rest / num
    if p_s is None: p_s = rest / num
    if p_hsh is None: p_hsh = rest / num
    if p_cnot is None: p_cnot = rest / num if qubits > 1 else 0.0
    if p_meas is None: p_meas = rest / num

    if p_cnot > 0 and qubits <= 1: raise ValueError("Cannot have p_cnot > 0 with a single qubit.")

    #p_s = (1 - p_t) / 3.0
    #p_hsh = (1 - p_t) / 3.0
    #p_cnot = (1 - p_t) / 3.0

    inputs = []
    outputs = []

    for i in range(qubits):
        g.add_vertex(VertexType.BOUNDARY,i,r)
        inputs.append(v)
        v += 1
    r += 1

    for i in range(qubits):
        g.add_vertex(VertexType.Z,i,r)
        g.add_edge((qs[i], v))
        qs[i] = v
        v += 1
    r += 1

    for i in range(2, depth+2):
        p = rand.random()
        q0 = rand.randrange(qubits)

        g.add_vertex(VertexType.Z,q0,r)
        g.add_edge((qs[q0], v))
        qs[q0] = v
        v += 1
        r += 1

        if p > 1 - p_cnot:
            # apply CNOT gate
            q1 = rand.randrange(qubits-1)
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
        elif p > 1 - p_cnot - p_hsh - p_s - p_meas:
            # apply a measurement
            g.set_ground(v-1)
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
        outputs.append(v)
        v += 1

    g.set_inputs(tuple(inputs))
    g.set_outputs(tuple(outputs))

    return g

def cliffordT(
        qubits: int,
        depth: int,
        p_t:Optional[float]=None,
        p_s:Optional[float]=None,
        p_hsh:Optional[float]=None,
        p_cnot:Optional[float]=None,
        backend:Optional[str]=None,
        seed:Optional[int]=None
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
    return cliffordTmeas(qubits, depth, p_t, p_s, p_hsh, p_cnot, 0, backend, seed)

def cliffords(
        qubits: int, 
        depth: int, 
        no_hadamard:bool=False,
        t_gates:bool=False,
        backend:Optional[str]=None,
        seed:Optional[int]=None
        ):
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
    ty: List[VertexType] = [VertexType.BOUNDARY] * qubits         # types of vertices
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
        ty.append(VertexType.Z)
        v += 1
    r += 1

    # random gates
    rand: Union[random.Random, types.ModuleType]
    if (seed is not None): rand = random.Random(seed)
    else: rand = random
    for i in range(depth):
        c = rand.randint(0, qubits-1)
        t = rand.randint(0, qubits-2)
        if t >= c: t += 1
        if accept(p_two_qubit,rand):
            if no_hadamard or accept(p_cnot,rand): 
                es1.append((v, v+1))
                ty += [VertexType.Z, VertexType.X]
            else: 
                es2.append((v,v+1))
                typ: VertexType = rand.choice([VertexType.Z, VertexType.X])
                ty += [typ, typ]
            if accept(p_phase,rand): phases[v] = random_phase(t_gates,rand)
            if accept(p_phase,rand): phases[v+1] = random_phase(t_gates,rand)
        else:
            phases[v] = random_phase(t_gates,rand)
            phases[v+1] = random_phase(t_gates,rand)
            ty += [VertexType.Z, VertexType.X]
        
        if not no_hadamard and accept(p_had,rand): es2.append((q[c],v))
        else: es1.append((q[c],v))
        if not no_hadamard and accept(p_had,rand): es2.append((q[t],v+1))
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

    inputs = []
    outputs = []

    for i in range(qubits):
        inputs.append(i)
        outputs.append(v-qubits+i)

    g.set_inputs(tuple(inputs))
    g.set_outputs(tuple(outputs))

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



def phase_poly(n_qubits: int, n_phase_layers: int, cnots_per_layer: int) -> Circuit:
    """
    Create a random phase polynomial circuit.

    :param n_qubits: Number of qubits in the circuit.
    :param n_phase_layers: Number of layers of phase gates.
    :param cnots_per_layer: Number of CNOTs in each layer.
    :return: A random phase polynomial circuit.
    """
    c = CNOT_tracker(n_qubits)
    for _ in range(n_phase_layers):
        build_random_parity_map(n_qubits, cnots_per_layer, circuit=c)
        for i in range(n_qubits):
            phase = Fraction(
                np.random.choice([1, -1]), int(np.random.choice([1, 2, 4]))
            )
            c.add_gate(ZPhase(target=i, phase=phase))
    return c


def phase_poly_approximate(n_qubits: int, n_CNOTs: int, n_phases: int) -> Circuit:
    """
    Create a random phase polynomial circuit with an exact number of CNOT gates.

    :param n_qubits: Number of qubits in the circuit.
    :param n_CNOTs: Number of CNOTs in the circuit.
    :param n_phases: Target of phase gates in the circuit. The actual number of phase gates may be slightly different.
    :return: A random phase polynomial circuit.
    """
    c = CNOT_tracker(n_qubits)
    cnot_count = 0
    p = n_phases / (n_CNOTs + n_phases)
    while cnot_count < n_CNOTs:
        target = np.random.randint(n_qubits)
        if np.random.rand() < p:
            phase = np.random.choice([1, -1]) * Fraction(
                1, int(np.random.choice([1, 2, 4]))
            )
            c.add_gate(ZPhase(target=target, phase=phase))
        else:
            control = np.random.choice([i for i in range(n_qubits) if i != target])
            c.add_gate(CNOT(control, target))
            cnot_count += 1
    return c


def phase_poly_from_gadgets(n_qubits: int, n_gadgets: int) -> Circuit:
    """
    Create a random phase polynomial circuit from a set of phase gadgets.

    :param n_qubits: Number of qubits in the circuit.
    :param n_gadgets: Number of phase gadgets to generate.
    :return: A random phase polynomial circuit.
    """
    parities: Set[Parity] = set()
    if n_gadgets > 2**n_qubits:
        n_gadgets = n_qubits ^ 3
    if n_qubits < 26:
        for integer in np.random.choice(
            2**n_qubits - 1, replace=False, size=n_gadgets
        ):
            parities.add(Parity(integer + 1, n_qubits))
    elif n_qubits < 64:
        while len(parities) < n_gadgets:
            parities.add(Parity(np.random.randint(1, 2**n_qubits), n_qubits))
    else:
        while len(parities) < n_gadgets:
            par: Parity = Parity([])
            while not par.count():
                par = Parity(
                    np.random.choice([False, True], n_qubits, replace=True), n_qubits
                )
            parities.add(par)
    zphase_dict = {p: Fraction(1, 4) for p in parities}
    out_parities = mat22partition(Mat2.id(n_qubits))
    phase_poly = PhasePoly(zphase_dict, out_parities)
    return phase_poly.rec_gray_synth("gauss", architecture=None)[0]


def build_random_parity_map(qubits: int, n_cnots: int, circuit=None) -> MatLike:
    """
    Builds a random parity map.

    :param qubits: The number of qubits that participate in the parity map
    :param n_cnots: The number of CNOTs in the parity map
    :param circuit: A (list of) circuit object(s) that implements a row_add() method to add the generated CNOT gates [optional]
    :return: a 2D numpy array that represents the parity map.
    """
    if circuit is None:
        circuit = []
    if not isinstance(circuit, list):
        circuit = [circuit]
    g = cnots(qubits=qubits, depth=n_cnots)
    c = Circuit.from_graph(g)
    matrix = Mat2.id(qubits)
    for gate in c.gates:
        if not hasattr(gate, "control") or not hasattr(gate, "target"):
            continue
        matrix.row_add(gate.control, gate.target)
        for c in circuit:
            c.row_add(gate.control, gate.target)
    return matrix.data


def qft(qubits: int) -> Circuit:
    """Returns a quantum Fourier transform circuit

    This returns the unoptimised Fourier transform circuit. This is the version with O(n^2) gates
    which reverses the order of logical qubits."""
    c = Circuit(qubits)

    for i in range(qubits):
        c.add_gate('H', i)
        for j in range(i+1, qubits):
            c.add_gate('CPhase', j, i, Fraction(1, 2**(j-i+1)))
    return c
