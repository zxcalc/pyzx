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

from pyquil import Program, get_qc
from pyquil.gates import CNOT
from pyquil.quil import Pragma
from pyquil.api import LocalQVMCompiler
from pyquil.parser import parse as parse_quil
from pyquil.quilbase import Pragma, Gate

from pyzx.routing.parity_maps import CNOT_tracker
from pyzx.circuit import Circuit

class PyQuilCircuit(CNOT_tracker):

    def __init__(self, architecture, **kwargs):
        """
        Class to represent a PyQuil program to run on/be compiled for the given architecture
        Currently, it assumes the architecture given by create_9x9_square_architecture()

        :param architecture: The Architecture object to adhere to
        """

        super().__init__(**kwargs)
        self.qc = get_qc('9q-square-qvm')
        device = architecture.to_quil_device()
        compiler = LocalQVMCompiler(endpoint=self.qc.compiler.endpoint, device=device)
        self.qc.device = device
        self.qc.compiler = compiler
        self.n_qubits = architecture.n_qubits
        self.program = Program()
        super().__init__(self.n_qubits)
        self.retries = 0
        self.max_retries = 5
        self.compiled_program = None

    def row_add(self, q0, q1):
        """
        Adds a CNOT gate between the given qubit indices q0 and q1
        :param q0: 
        :param q1: 
        """
        self.program += CNOT(q0, q1)
        super().row_add(q0, q1)

    def col_add(self, q0, q1):
        # TODO prepend the CNOT!
        self.program += CNOT(q1, q0)
        super().col_add(q0, q1)

    def count_cnots(self):
        if self.compiled_program is None:
            return super().count_cnots()
        else:
            return self.compiled_cnot_count()

    def compiled_cnot_count(self):
        if self.compiled_program is None:
            self.compile()
        return len([g for g in self.compiled_program if isinstance(g, Gate) and g.name == "CZ"])

    def to_qasm(self):
        if self.compiled_program is None:
            return super().to_qasm()
        circuit = Circuit(self.n_qubits)
        comments = []
        for g in self.compiled_program:
            if isinstance(g, Pragma):
                wiring = " ".join(["//", g.command, "["+g.freeform_string[2:-1]+"]"])
                comments.append(wiring)
            elif isinstance(g, Gate):
                if g.name == "CZ":
                    circuit.add_gate("CZ", g.qubits[0].index, g.qubits[1].index)
                elif g.name == "RX":
                    circuit.add_gate("XPhase", g.qubits[0].index, g.params[0])
                elif g.name == "RZ":
                    circuit.add_gate("ZPhase", g.qubits[0].index, g.params[0])
                else:
                    print("Unsupported gate found!", g)

        qasm = circuit.to_qasm()
        return '\n'.join(comments+[qasm])


    def update_program(self):
        self.program = Program()
        for gate in self.gates:
            if hasattr(gate, "name") and gate.name == "CNOT":
                self.program += CNOT(gate.control, gate.target)
            else:
                print("Warning: PyquilCircuit can only be used for circuits with only CNOT gates for now.")

    @staticmethod
    def from_CNOT_tracker(circuit, architecture):
        new_circuit = PyQuilCircuit(architecture, n_qubits=circuit.qubits, name=circuit.name)
        new_circuit.gates = circuit.gates
        new_circuit.update_matrix()
        new_circuit.update_program()
        return new_circuit

    def compile(self):
        """
        Compiles the circuit/program for created quantum computer
        :return: A string that describes the compiled program in quil
        """
        try:
            ep = self.qc.compile(self.program)
            self.retries = 0
            self.compiled_program = parse_quil(ep.program)
            return ep.program
        except KeyError as e:
            print('Oops, retrying to compile.', self.retries)
            if self.retries < self.max_retries:
                self.retries += 1
                return self.compile()
            else:
                raise e
