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

import os
from typing import List, Union, Optional, Iterator, Dict

import numpy as np

from .gates import Gate, gate_types, ZPhase, XPhase, CZ, XCX, CNOT, HAD, SWAP, CCZ, Tofolli, Measurement

from ..graph.base import BaseGraph
from ..utils import EdgeType

CircuitLike = Union['Circuit', Gate]

# Note that many of the method of Circuit contain inline imports. These are
# there to prevent circular imports.

__all__ = ['Circuit', 'id']

class Circuit(object):
    """Class for representing quantum circuits.

    This class is mostly just a wrapper for a list of gates with methods for converting
    between different representations of a quantum circuit.

    The methods in this class that convert a specification of a circuit into an instance of this class,
    generally do not check whether the specification is well-defined. If a bad input is given,
    the behaviour is undefined."""
    def __init__(self, qubit_amount: int, name: str = '', bit_amount: Optional[int] = None) -> None:
        self.qubits: int        = qubit_amount
        self.bits: int = 0 if bit_amount is None else bit_amount
        self.gates:  List[Gate] = []
        self.name:   str        = name

    ### BASIC FUNCTIONALITY


    def __str__(self) -> str:
        return "Circuit({!s} qubits, {!s} bits, {!s} gates)".format(self.qubits,self.bits,len(self.gates))

    def __repr__(self) -> str:
        return str(self)

    def copy(self) -> 'Circuit':
        c = Circuit(self.qubits, self.name, self.bits)
        c.gates = [g.copy() for g in self.gates]
        return c

    def adjoint(self) -> 'Circuit':
        c = Circuit(self.qubits, self.name + 'Adjoint', self.bits)
        for g in reversed(self.gates):
            c.gates.append(g.to_adjoint())
        return c


    def verify_equality(self, other: 'Circuit', up_to_swaps: bool = False) -> bool:
        """Composes the other circuit with the adjoint of this circuit, and tries to reduce
        it to the identity using :func:`simplify.full_reduce``. If successful returns True,
        if not returns None.

        Note:
            A successful reduction to the identity is strong evidence that the two
            circuits are equal, if this function is not able to reduce the graph to the identity
            this does not prove anything.

        Args:
            other: the circuit to compare equality to.
            up_to_swaps: if set to True, only checks equality up to a permutation of the qubits.

        """
        if self.bits or other.bits:
            # TODO once full_gnd_reduce is merged
            raise NotImplementedError("The equality verification does not support hybrid circuits.")

        from ..simplify import full_reduce
        c = self.adjoint()
        c.add_circuit(other)
        g = c.to_graph()
        full_reduce(g)
        if (g.num_vertices() == self.qubits*2 and
                all(g.edge_type(e) == EdgeType.SIMPLE for e in g.edges())):
            if up_to_swaps:
                return True
            else:
                return all(g.connected(v,w) for v,w in zip(g.inputs(),g.outputs()))
        else:
            return False

    def add_gate(self, gate: Union[Gate,str], *args, **kwargs) -> None:
        """Adds a gate to the circuit. ``gate`` can either be
        an instance of a :class:`Gate`, or it can be the name of a gate,
        in which case additional arguments should be given.

        Example::

            circuit.add_gate("CNOT", 1, 4) # adds a CNOT gate with control 1 and target 4
            circuit.add_gate("ZPhase", 2, phase=Fraction(3,4)) # Adds a ZPhase gate on qubit 2 with phase 3/4
        """
        if isinstance(gate, str):
            gate_class = gate_types[gate]
            gate = gate_class(*args, **kwargs)
        self.gates.append(gate)

    def prepend_gate(self, gate, *args, **kwargs):
        """The same as add_gate, but adds the gate to the start of the circuit, not the end.
        """
        if isinstance(gate, str):
            gate_class = gates.gate_types[gate]
            gate = gate_class(*args, **kwargs)
        self.gates.insert(0, gate)

    def add_gates(self, gates: str, qubit: int) -> None:
        """Adds a series of single qubit gates on the same qubit.
        ``gates`` should be a space-separated string of gatenames.

        Example::

            circuit.add_gates("S T H T H", 1)
        """
        for g in gates.split(" "):
            self.add_gate(g, qubit)

    def add_circuit(self, circ: 'Circuit', mask: Optional[List[int]]=None, bit_mask: Optional[List[int]]=None) -> None:
        """Adds the gate of another circuit to this one. If ``mask`` is not given,
        then they must have the same amount of qubits and they are mapped one-to-one.
        If mask is given then it must be a list specifying to which qubits the qubits
        in the given circuit correspond. Similarly, if ``bit_mask`` is not given,
        then they must have the same amount of bits.

        Example::

            c1 = Circuit(qubit_amount=4)
            c2 = Circuit(qubit_amount=2)
            c2.add_gate("CNOT",0,1)
            c1.add_circuit(c2, mask=[0,3]) # Now c1 has a CNOT from the first to the last qubit

        If the circuits have the same amount of qubits then it can also be called as an operator::

            c1 = Circuit(2)
            c2 = Circuit(2)
            c1 += c2

        """
        if mask is None and bit_mask is None:
            if self.qubits != circ.qubits:
                raise TypeError("Amount of qubits do not match")
            if self.bits != circ.bits:
                raise TypeError("Amount of bits do not match")
            self.gates.extend([g.copy() for g in circ.gates])
            return
        if mask is None:
            mask = list(range(self.qubits))
        if bit_mask is None:
            bit_mask = list(range(self.bits))
        if len(mask) != circ.qubits:
            raise TypeError("Mask size does not match qubits")
        if len(bit_mask) != circ.bits:
            raise TypeError("Bit mask size does not match bits")
        for gate in circ.gates:
            g = gate.reposition(mask, bit_mask)
            self.add_gate(g)

    def tensor(self, other: CircuitLike) -> 'Circuit':
        """Takes the tensor product of two Circuits. Places the second one below the first.
        Can also be done as an operator: `circuit1 @ circuit2`."""
        if isinstance(other,Gate):
            c2 = Circuit(other._max_target()+1)
            c2.add_gate(other)
            other = c2
        if not isinstance(other,Circuit):
            raise Exception("Cannot tensor type", type(other), "to Circuit")
        c = Circuit(self.qubits + other.qubits)
        c.gates = [g.copy() for g in self.gates]
        mask = [i+self.qubits for i in range(other.qubits)]
        bit_mask = [i+self.bits for i in range(other.bits)]
        c.gates.extend([g.reposition(mask, bit_mask) for g in other.gates])
        return c

    def to_basic_gates(self) -> 'Circuit':
        """Returns a new circuit with every gate expanded in terms of X/Z phases, Hadamards
        and the 2-qubit gates CNOT, CZ, CX."""
        c = Circuit(self.qubits, name=self.name, bit_amount=self.bits)
        for g in self.gates:
            c.gates.extend(g.to_basic_gates())
        return c

    def split_phase_gates(self) -> 'Circuit':
        c = Circuit(self.qubits, name=self.name)
        for g in self.gates:
            if isinstance(g, (ZPhase, XPhase)):
                c.gates.extend(g.split_phases())
            else:
                c.add_gate(g)
        return c

    ### OPERATORS

    def __iadd__(self, other: CircuitLike) -> 'Circuit':
        if isinstance(other, Circuit):
            self.add_circuit(other)
            if other.qubits > self.qubits:
                self.qubits = other.qubits
        elif isinstance(other, Gate):
            self.add_gate(other)
            if other._max_target() + 1 > self.qubits:
                self.qubits = other._max_target() + 1
        else:
            raise Exception("Cannot add object of type", type(other), "to Circuit")
        return self

    def __add__(self, other: CircuitLike) -> 'Circuit':
        c = self.copy()
        c += other
        return c

    def __len__(self) -> int:
        return len(self.gates)

    def __iter__(self) -> Iterator[Gate]:
        return iter(self.gates)

    def __matmul__(self, other: CircuitLike) -> 'Circuit':
        return self.tensor(other)


    ### MATRIX EMULATION (FOR E.G. Mat2.gauss)

    def row_add(self, q0: int, q1: int):
        self.add_gate("CNOT", q0, q1)

    def col_add(self, q0: int, q1: int):
        self.prepend_gate("CNOT", q1, q0)


    ### CONVERSION METHODS


    @staticmethod
    def from_graph(g:BaseGraph, split_phases:bool=True) -> 'Circuit':
        """Produces a :class:`Circuit` containing the gates of the given ZX-graph.
        If the ZX-graph is not circuit-like then the behaviour of this function
        is undefined.
        ``split_phases`` governs whether nodes with phases should be split into
        Z,S, and T gates or if generic ZPhase/XPhase gates should be used."""
        from .graphparser import graph_to_circuit
        return graph_to_circuit(g, split_phases=split_phases)

    def to_graph(self, zh:bool=False, compress_rows:bool=True, backend:Optional[str]=None) -> BaseGraph:
        """Turns the circuit into a ZX-Graph.
        If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
        on the same row."""
        from .graphparser import circuit_to_graph

        return circuit_to_graph(self if zh else self.to_basic_gates(),
            compress_rows, backend)

    def to_tensor(self, preserve_scalar:bool=True) -> np.ndarray:
        """Returns a numpy tensor describing the circuit."""
        return self.to_graph().to_tensor(preserve_scalar)
    def to_matrix(self, preserve_scalar=True) -> np.ndarray:
        """Returns a numpy matrix describing the circuit."""
        return self.to_graph().to_matrix(preserve_scalar)

    def to_emoji(self) -> str:
        """Converts circuit into a representation that can be copy-pasted
        into the ZX-calculus Discord server."""
        from .emojiparser import circuit_to_emoji
        return circuit_to_emoji(self)

    @staticmethod
    def load(circuitfile: str) -> 'Circuit':
        """Tries to detect the circuit description language from the filename and its contents,
        and then tries to load the file into a circuit."""
        from .quipperparser import quipper_center_block

        ext = determine_file_type(circuitfile)
        if ext == 'qc':
            return Circuit.from_qc_file(circuitfile)
        if ext == 'qasm':
            return Circuit.from_qasm_file(circuitfile)
        if ext == 'qsim':
            return Circuit.from_qsim_file(circuitfile)
        if ext == 'qgraph':
            raise TypeError(".qgraph files are not Circuits. Please load them as graphs using json_to_graph")
        if ext == 'quipper':
            return Circuit.from_quipper_file(circuitfile)
        raise TypeError("Couldn't determine filetype")

    @staticmethod
    def from_qc(s: str) -> 'Circuit':
        from .qcparser import parse_qc
        return parse_qc(s)

    @staticmethod
    def from_qc_file(fname: str) -> 'Circuit':
        """Produces a :class:`Circuit` based on a .qc description of a circuit.
        If a Toffoli gate with more than 2 controls is encountered, ancilla qubits are added.
        Currently up to 5 controls are supported."""
        from .qcparser import parse_qc
        with open(fname, 'r') as f:
            data = f.read()
        c = parse_qc(data)
        c.name = os.path.basename(fname)
        return c

    @staticmethod
    def from_qsim_file(fname: str) -> 'Circuit':
        """Produces a :class:`Circuit` based on a .qc description of a circuit.
        If a Toffoli gate with more than 2 controls is encountered, ancilla qubits are added.
        Currently up to 5 controls are supported."""
        from .qsimparser import parse_qsim
        with open(fname, 'r') as f:
            data = f.read()
        c = parse_qsim(data)
        c.name = os.path.basename(fname)
        return c

    @staticmethod
    def from_quipper(s: str) -> 'Circuit':
        """Produces a :class:`Circuit` based on a Quipper ASCII description of a circuit.
        Currently measurement instructions are not supported and are discarded."""
        from .quipperparser import parse_quipper_block
        text = s.strip()
        lines = text.splitlines()
        if text.find('Subroutine') == -1:
            c = parse_quipper_block(lines)
            return c
        else:
            raise TypeError("Subroutines are not supported")

    @staticmethod
    def from_quipper_file(fname: str) -> 'Circuit':
        """Produces a :class:`Circuit` based on a Quipper ASCII description of a circuit.
        Currently measurement instructions are not supported and are discarded."""
        from .quipperparser import parse_quipper_block, quipper_center_block
        try:
            with open(fname, 'r') as f:
                text = f.read().strip()
                lines = text.splitlines()
            if text.find('Subroutine') == -1:
                c = parse_quipper_block(lines)
                c.name = os.path.basename(fname)
                return c
            else:
                raise TypeError("Subroutines are not supported")
        except:
            return quipper_center_block(fname)

    @staticmethod
    def from_qasm(s: str) -> 'Circuit':
        """Produces a :class:`Circuit` based on a QASM input string.
        It ignores all the non-unitary instructions like measurements in the file.
        It currently doesn't support custom gates that have parameters."""
        from .qasmparser import QASMParser
        p = QASMParser()
        return p.parse(s)

    @staticmethod
    def from_qasm_file(fname: str) -> 'Circuit':
        """Produces a :class:`Circuit` based on a QASM description of a circuit.
        It ignores all the non-unitary instructions like measurements in the file.
        It currently doesn't support custom gates that have parameters."""
        from .qasmparser import QASMParser
        p = QASMParser()
        with open(fname, 'r') as f:
            c = p.parse(f.read())
        c.name = os.path.basename(fname)
        return c

    def to_quipper(self) -> str:
        """Produces a Quipper ASCII description of the circuit."""
        s = "Inputs: " + ", ".join("{!s}:Qbit".format(i) for i in range(self.qubits)) + "\n"
        for g in self.gates:
            s += g.to_quipper() + "\n"
        s += "Outputs: " + ", ".join("{!s}:Qbit".format(i) for i in range(self.qubits))
        return s

    def to_qasm(self) -> str:
        """Produces a QASM description of the circuit."""
        s = """OPENQASM 2.0;\ninclude "qelib1.inc";\n"""
        s += "qreg q[{!s}];\n".format(self.qubits)
        for g in self.gates:
            s += g.to_qasm() + "\n"
        return s

    def to_qc(self) -> str:
        """Produces a .qc description of the circuit."""
        s = ".v " + " ".join("q{:d}".format(i) for i in range(self.qubits))
        s += "\n\nBEGIN\n"
        c = self.split_phase_gates()
        for g in c.gates:
            s += g.to_qc() + "\n"
        s += "END\n"
        return s



    ### STAT FUNCTIONS


    def tcount(self) -> int:
        """Returns the amount of T-gates necessary to implement this circuit."""
        return sum(g.tcount() for g in self.gates)
        #return sum(1 for g in self.gates if isinstance(g, (ZPhase, XPhase, ParityPhase)) and g.phase.denominator >= 4)

    def twoqubitcount(self) -> int:
        """Returns the amount of 2-qubit gates necessary to implement this circuit."""
        c = self.to_basic_gates()
        return sum(1 for g in c.gates if g.name in ('CNOT','CZ'))

    def stats(self, depth: bool = False) -> str:
        """Returns statistics on the amount of gates in the circuit, separated into different classes
        (such as amount of T-gates, two-qubit gates, Hadamard gates)."""
        d = self.stats_dict(depth)
        s = """Circuit {} on {} qubits with {} gates.
        {} is the T-count
        {} Cliffords among which
        {} 2-qubit gates ({} CNOT, {} other) and
        {} Hadamard gates.""".format(d["name"], d["qubits"], d["gates"],
                d["tcount"], d["clifford"], d["twoqubit"], d["cnot"], d["twoqubit"] - d["cnot"], d["had"])
        if d["measurement"] > 0:
            s += "\nThere are {} measurement gates".format(d["measurement"])
        if d["other"] > 0:
            s += "\nThere are {} gates of a different type".format(d["other"])
        if depth:
            s += "\nThe circuit depth is {}".format(d["depth"])
            s += "\nThe circuit depth if no CZs are possible is {}".format(d["depth_cz"])
        return s

    def stats_dict(self, depth: bool = False) -> dict:
        """Returns a dictionary containing statistics on the amount of gates in the circuit,
        separated into different classes (such as amount of T-gates, two-qubit gates, Hadamard gates)."""
        total = 0
        tcount = 0
        twoqubit = 0
        hadamard = 0
        clifford = 0
        measurement = 0
        other = 0
        cnot = 0
        for g in self.gates:
            total += 1
            tcount += g.tcount()
            if isinstance(g, (ZPhase, XPhase)):
                if g.phase.denominator <= 2: clifford += 1
            elif isinstance(g, HAD):
                hadamard += 1
                clifford += 1
            elif isinstance(g, (CZ, XCX, CNOT)):
                twoqubit += 1
                clifford += 1
                if isinstance(g, CNOT): cnot += 1
            elif isinstance(g, Measurement):
                measurement += 1
            else:
                other += 1
        d : Dict[str, Union[str,int]] = dict()
        d["name"] = self.name
        d["qubits"] = self.qubits
        d["gates"] = total
        d["tcount"] = tcount
        d["clifford"] = clifford
        d["twoqubit"] = twoqubit
        d["cnot"] = cnot
        d["had"] = hadamard
        d["measurement"] = measurement
        d["other"] = other
        d["depth"] = 0
        d["depth_cz"] = 0
        if depth:
            c = Circuit(self.qubits)
            c.gates = [basic_gate for g in self.gates for basic_gate in g.to_basic_gates()]
            d["depth"] = c.depth()
            basic_no_cz = []
            for g in c.gates:
                if isinstance(g, CZ):
                    basic_no_cz.extend([HAD(g.target), CNOT(g.control, g.target), HAD(g.target)])
                else:
                    basic_no_cz.append(g)
            c.gates = basic_no_cz
            d["depth_cz"] = c.depth()
        return d

    def depth(self) -> int:
        min_depth = [0] * self.qubits
        for g in self.gates:
            if isinstance(g, (ZPhase, XPhase, HAD)):
                min_depth[g.target] += 1
            elif isinstance(g, (CZ, CNOT, SWAP)):
                gate_depth = max(min_depth[g.target], min_depth[g.control]) + 1
                min_depth[g.target] = gate_depth
                min_depth[g.control] = gate_depth
            elif isinstance(g, (CCZ, Tofolli)):
                gate_depth = max(min_depth[g.target], min_depth[g.ctrl1], min_depth[g.ctrl2]) + 1
                min_depth[g.target] = gate_depth
                min_depth[g.ctrl1] = gate_depth
                min_depth[g.ctrl2] = gate_depth
        return max(min_depth)


def determine_file_type(circuitfile: str) -> str:
        """Tries to figure out in which format the file is given (quipper, qasm or qc)"""
        fname = circuitfile
        ext = os.path.splitext(fname)[-1]
        if ext in ('.qc', '.tfc'):
            return "qc"
        if ext.find('qasm') != -1:
            return "qasm"
        if ext == '.qgraph':
            return "qgraph"
        if ext == '.qsim':
            return 'qsim'
        if ext.find('quip') != -1:
            return "quipper"
        f = open(fname, 'r')
        data = f.read(128)
        f.close()
        if data.startswith('Inputs:'):
            return "quipper"
        if data.find('.v') != -1 or data.find('.i') != -1 or data.find('.o') != -1:
            return "qc"
        if data.find('QASM') != -1:
            return "qasm"

        raise TypeError("Couldn't determine circuit format.")


def id(n: int) -> Circuit:
    return Circuit(n)
