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

import os

#Note that many of the method of Circuit contain inline imports. These are there to prevent circular imports.

__all__ = ['Circuit', 'id']

class Circuit(object):
    """Class for representing quantum circuits.

    This class is mostly just a wrapper for a list of gates with methods for converting
    between different representations of a quantum circuit.

    The methods in this class that convert a specification of a circuit into an instance of this class,
    generally do not check whether the specification is well-defined. If a bad input is given, 
    the behaviour is undefined."""
    def __init__(self, qubit_amount, name=''):
        self.qubits = qubit_amount
        self.gates = []
        self.name = name


    ### BASIC FUNCTIONALITY


    def __str__(self):
        return "Circuit({!s} qubits, {!s} gates)".format(self.qubits,len(self.gates))

    def __repr__(self):
        return str(self)

    def copy(self):
        c = Circuit(self.qubits, self.name)
        c.gates = [g.copy() for g in self.gates]
        return c

    def adjoint(self):
        c = Circuit(self.qubits, self.name + 'Adjoint')
        for g in reversed(self.gates):
            c.gates.append(g.to_adjoint())
        return c


    def verify_equality(self, other):
        """Composes the other circuit with the adjoint of this circuit, and tries to reduce
        it to the identity using :func:`simplify.full_reduce``. If successful returns True,
        if not returns None. 

        Note that while a successful reduction to the identity is strong evidence that the two
        circuits are equal, if this function is not able to reduce the graph to the identity
        this does not prove anything. """
        from ..simplify import full_reduce
        c = self.adjoint()
        c.add_circuit(other)
        g = c.to_graph()
        full_reduce(g)
        if g.num_vertices() == self.qubits*2:
            return True
        else:
            return False

    def add_gate(self, gate, *args, **kwargs):
        """Adds a gate to the circuit. ``gate`` can either be 
        an instance of a :class:`Gate`, or it can be the name of a gate,
        in which case additional arguments should be given.

        Example::
            
            circuit.add_gate("CNOT", 1, 4) # adds a CNOT gate with control 1 and target 4
            circuit.add_gate("ZPhase", 2, phase=Fraction(3,4)) # Adds a ZPhase gate on qubit 2 with phase 3/4
        """
        from .gates import gate_types
        if isinstance(gate, str):
            gate_class = gate_types[gate]
            gate = gate_class(*args, **kwargs)
        self.gates.append(gate)

    def add_gates(self, gates, qubit):
        """Adds a series of single qubit gates on the same qubit.
        ``gates`` should be a space-separated string of gatenames.

        Example::

            circuit.add_gates("S T H T H", 1)
        """
        for g in gates.split(" "):
            self.add_gate(g, qubit)

    def add_circuit(self, circ, mask=None):
        """Adds the gate of another circuit to this one. If ``mask`` is not given,
        then they must have the same amount of qubits and they are mapped one-to-one.
        If mask is given then it must be a list specifying to which qubits the qubits
        in the given circuit correspond. 

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
        if not mask:
            if self.qubits != circ.qubits: raise TypeError("Amount of qubits do not match")
            self.gates.extend([g.copy() for g in circ.gates])
            return
        elif len(mask) != circ.qubits: raise TypeError("Mask size does not match qubits")
        for gate in circ.gates:
            g = gate.reposition(mask)
            self.add_gate(g)

    def tensor(self, other):
        """Takes the tensor product of two Circuits. Places the second one below the first.
        Can also be done as an operator: `circuit1 @ circuit2`."""
        from .gates import Gate
        if isinstance(other,Gate):
            c2 = Circuit(other._max_target()+1)
            c2.add_gate(other)
            other = c2
        if not isinstance(other,Circuit):
            raise Exception("Cannot tensor type", type(other), "to Circuit")
        c = Circuit(self.qubits + other.qubits)
        c.gates = [g.copy() for g in self.gates]
        mask = [i+self.qubits for i in range(other.qubits)]
        c.gates.extend([g.reposition(mask) for g in other.gates])
        return c

    def to_basic_gates(self):
        """Returns a new circuit with every gate expanded in terms of X/Z phases, Hadamards
        and the 2-qubit gates CNOT, CZ, CX."""
        c = Circuit(self.qubits, name=self.name)
        for g in self.gates:
            c.gates.extend(g.to_basic_gates())
        return c

    def split_phase_gates(self):
        from .gates import ZPhase, XPhase
        c = Circuit(self.qubits, name=self.name)
        for g in self.gates:
            if isinstance(g, (ZPhase, XPhase)):
                c.gates.extend(g.split_phases())
            else:
                c.add_gate(g)
        return c

    ### OPERATORS

    def __iadd__(self, other):
        from .gates import Gate
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

    def __add__(self, other):
        c = self.copy()
        c += other
        return c

    def __len__(self):
        return len(self.gates)

    def __iter__(self):
        return iter(self.gates)

    def __matmul__(self, other):
        return self.tensor(other)



    ### CONVERSION METHODS


    @staticmethod
    def from_graph(g, split_phases=True):
        """Produces a :class:`Circuit` containing the gates of the given ZX-graph.
        If the ZX-graph is not circuit-like then the behaviour of this function
        is undefined.
        ``split_phases`` governs whether nodes with phases should be split into
        Z,S, and T gates or if generic ZPhase/XPhase gates should be used."""
        from .graphparser import graph_to_circuit
        return graph_to_circuit(g, split_phases=split_phases)

    def to_graph(self, zh=False, compress_rows=True, backend=None):
        """Turns the circuit into a ZX-Graph.
        If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
        on the same row."""
        from .graphparser import circuit_to_graph

        return circuit_to_graph(self if zh else self.to_basic_gates(),
            compress_rows, backend)

    def to_tensor(self, preserve_scalar=True):
        """Returns a numpy tensor describing the circuit."""
        return self.to_graph().to_tensor(preserve_scalar)
    def to_matrix(self, preserve_scalar=True):
        """Returns a numpy matrix describing the circuit."""
        return self.to_graph().to_matrix(preserve_scalar)

    @staticmethod
    def load(circuitfile):
        """Tries to detect the circuit description language from the filename and its contents,
        and then tries to load the file into a circuit."""
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
            try:
                return Circuit.from_quipper_file(circuitfile)
            except:
                return quipper_center_block(circuitfile)
        raise TypeError("Couldn't determine filetype")

    @staticmethod
    def from_qc_file(fname):
        """Produces a :class:`Circuit` based on a .qc description of a circuit.
        If a Tofolli gate with more than 2 controls is encountered, ancilla qubits are added.
        Currently up to 5 controls are supported."""
        from .qcparser import parse_qc
        with open(fname, 'r') as f:
            data = f.read()
        return parse_qc(data)

    @staticmethod
    def from_qsim_file(fname):
        """Produces a :class:`Circuit` based on a .qc description of a circuit.
        If a Tofolli gate with more than 2 controls is encountered, ancilla qubits are added.
        Currently up to 5 controls are supported."""
        from .qsimparser import parse_qsim
        with open(fname, 'r') as f:
            data = f.read()
        return parse_qsim(data)

    @staticmethod
    def from_quipper_file(fname):
        """Produces a :class:`Circuit` based on a Quipper ASCII description of a circuit."""
        from .quipperparser import parse_quipper_block
        with open(fname, 'r') as f:
            text = f.read().strip()
            lines = text.splitlines()
        if text.find('Subroutine') == -1:
            c = parse_quipper_block(lines)
            c.name = os.path.basename(fname)
            return c
        else:
            raise TypeError("Subroutines are not supported")

    @staticmethod
    def from_qasm_file(fname):
        """Produces a :class:`Circuit` based on a QASM description of a circuit.
        It ignores all the non-unitary instructions like measurements in the file. 
        It currently doesn't support custom gates that have parameters."""
        from .qasmparser import QASMParser
        p = QASMParser()
        with open(fname, 'r') as f:
            c = p.parse(f.read())
        c.name = os.path.basename(fname)
        return c

    def to_quipper(self):
        """Produces a Quipper ASCII description of the circuit."""
        s = "Inputs: " + ", ".join("{!s}:Qbit".format(i) for i in range(self.qubits)) + "\n"
        for g in self.gates:
            s += g.to_quipper() + "\n"
        s += "Outputs: " + ", ".join("{!s}:Qbit".format(i) for i in range(self.qubits))
        return s

    def to_qasm(self):
        """Produces a QASM description of the circuit."""
        s = """OPENQASM 2.0;\ninclude "qelib1.inc";\n"""
        s += "qreg q[{!s}];\n".format(self.qubits)
        for g in self.gates:
            s += g.to_qasm() + "\n"
        return s

    def to_qc(self):
        """Produces a .qc description of the circuit."""
        s = ".v " + " ".join("q{:d}".format(i) for i in range(self.qubits))
        s += "\n\nBEGIN\n"
        c = self.split_phase_gates()
        for g in c.gates:
            s += g.to_qc() + "\n"
        s += "END\n"
        return s


    ### STAT FUNCTIONS


    def tcount(self):
        """Returns the amount of T-gates necessary to implement this circuit."""
        return sum(g.tcount() for g in self.gates)
        #return sum(1 for g in self.gates if isinstance(g, (ZPhase, XPhase, ParityPhase)) and g.phase.denominator >= 4)
    
    def twoqubitcount(self):
        """Returns the amount of 2-qubit gates necessary to implement this circuit."""
        c = self.to_basic_gates()
        return sum(1 for g in c.gates if g.name in ('CNOT','CZ'))

    def stats(self):
        """Returns statistics on the amount of gates in the circuit, separated into different classes 
        (such as amount of T-gates, two-qubit gates, Hadamard gates)."""
        from .gates import ZPhase, XPhase, CZ,CX,CNOT, HAD
        total = 0
        tcount = 0
        twoqubit = 0
        hadamard = 0
        clifford = 0
        other = 0
        for g in self.gates:
            total += 1
            tcount += g.tcount()
            if isinstance(g, (ZPhase, XPhase)):
                if g.phase.denominator <= 2: clifford += 1
            elif isinstance(g, HAD):
                hadamard += 1
                clifford += 1
            elif isinstance(g, (CZ,CX, CNOT)):
                twoqubit += 1
                clifford += 1
            else:
                other += 1
        s = """Circuit {} on {} qubits with {} gates.
        {} is the T-count
        {} Cliffords among which 
        {} 2-qubit gates and {} Hadamard gates.""".format(self.name, self.qubits, total, 
                tcount, clifford, twoqubit, hadamard)
        if other > 0:
            s += "\nThere are {} gates of a different type".format(other)
        return s


def determine_file_type(circuitfile):
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


def id(n):
    return Circuit(n)