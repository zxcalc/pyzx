from pyquil import Program, get_qc
from pyquil.gates import CNOT
from pyquil.quil import Pragma
from pyquil.api import LocalQVMCompiler

from pyzx.parity_maps import CNOT_tracker
from pyzx.circuit import Circuit

class PyQuilCircuit(CNOT_tracker):

    def __init__(self, architecture):
        """
        Class to represent a PyQuil program to run on/be compiled for the given architecture
        Currently, it assumes the architecture given by create_9x9_square_architecture()

        :param architecture: The Architecture object to adhere to
        """

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
        self.program += CNOT(q0, q1)
        super().col_add(q0, q1)

    def compiled_cnot_count(self):
        return len(self.compile().split('CZ')) - 1

    def to_qasm(self):
        if self.compiled_program is None:
            return super().to_qasm()
        wirings = self.compiled_program.split('REWIRING')
        row_perm_str = "[" + wirings[1].split(')')[0].split('(')[1] + "]"
        col_perm_str = "[" + wirings[2].split(')')[0].split('(')[1] + "]"
        gates = [s.split()[:2] for s in self.compiled_program.split('CZ')[1:]]
        gates = [(int(d) for d in reversed(g)) for g in gates]
        circuit = Circuit(self.n_qubits)
        for gate in gates:
            circuit.add_gate("CNOT", gate[0], gate[1])
        qasm = circuit.to_qasm()
        initial_perm = "// Initial wiring: " + row_perm_str
        end_perm = "// Resulting wiring: " + col_perm_str
        return '\n'.join([initial_perm, end_perm, qasm])

    def compile(self):
        """
        Compiles the circuit/program for created quantum computer
        :return: A string that describes the compiled program in quil
        """
        try:
            ep = self.qc.compile(self.program)
            self.retries = 0
            self.compiled_program = ep.program
            return self.compiled_program
        except KeyError as e:
            print('Oops, retrying to compile.', self.retries)
            if self.retries < self.max_retries:
                self.retries += 1
                return self.compile()
            else:
                raise e
