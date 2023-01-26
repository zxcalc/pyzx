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


from typing import Any, Dict, Iterable, List, Optional, Union
from pyzx.generate import cnots as generate_cnots
from pyzx.circuit import Circuit, Gate, gate_types, CNOT
from pyzx.linalg import Z2, Mat2, MatLike

import numpy as np

class CNOT_tracker(Circuit):
    """
    A circuit-like object that keeps track of row and column operations
    applied during Gauss elimination via CNOT gates.
    """

    matrix: Mat2
    """The qubit parity matrix computed from the CNOT gates."""

    row_perm: np.ndarray
    """The row permutation of the qubit parity matrix."""

    col_perm: np.ndarray
    """The column permutation of the qubit parity matrix."""

    def __init__(self, n_qubits: int, **kwargs):
        super().__init__(n_qubits, **kwargs)
        self.matrix = Mat2(np.identity(n_qubits, dtype=np.int32).tolist())
        self.row_perm = np.arange(n_qubits)
        self.col_perm = np.arange(n_qubits)
        self.n_qubits = n_qubits

    def count_cnots(self) -> int:
        """Returns the number of CNOT gates in the tracker."""
        return len(
            [g for g in self.gates if hasattr(g, "name") and g.name in ["CNOT", "CZ"]]
        )

    def cnot_depth(self) -> int:
        """Returns the CNOT/CZ depth of the tracked circuit."""
        depth = 1
        previous_gates: List[int] = []
        for g in self.gates:
            if hasattr(g, "name") and g.name in ["CNOT", "CZ"]:
                if g.control in previous_gates or g.target in previous_gates:  # type: ignore # Overlapping gate
                    # Start a new CNOT layer
                    previous_gates = []
                    depth += 1
                else:
                    previous_gates += [g.control, g.target]  # type: ignore
        return depth

    def row_add(self, q0: int, q1: int):
        """Track a row addition operation on the matrix"""
        self.add_gate("CNOT", q0, q1)
        self.matrix.row_add(q0, q1)

    def add_gate(self, gate: Union[Gate,str], *args, **kwargs):
        if isinstance(gate, CNOT):
            self.row_add(gate.control, gate.target)
        else:
            super().add_gate(gate, *args, **kwargs)

    def col_add(self, q0: int, q1: int):
        """Track a column addition operation on the matrix"""
        self.prepend_gate("CNOT", q1, q0)
        self.matrix.col_add(q0, q1)

    @staticmethod
    def get_metric_names() -> List[str]:
        """Metric names for the CNOT tracker."""
        return ["n_cnots", "depth"]

    def gather_metrics(self) -> Dict[str, int]:
        """Gather metrics for the CNOT tracker."""
        metrics = {}
        metrics["n_cnots"] = self.count_cnots()
        metrics["depth"] = self.cnot_depth()
        return metrics

    def prepend_gate(self, gate: Union[Gate, str], *args, **kwargs):
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
        self.gates.insert(0, gate)

    def to_qasm(self) -> str:
        qasm = super().to_qasm()
        initial_perm = "// Initial wiring: " + str(self.row_perm)
        end_perm = "// Resulting wiring: " + str(self.col_perm)
        return "\n".join([initial_perm, end_perm, qasm])

    @staticmethod
    def from_circuit(circuit: Circuit) -> "CNOT_tracker":
        new_circuit = CNOT_tracker(circuit.qubits, name=circuit.name)
        new_circuit.gates = circuit.gates
        new_circuit.update_matrix()
        return new_circuit

    def update_matrix(self):
        """Rebuilds the parity matrix from the gates in the circuit."""
        self.matrix = Mat2.id(self.n_qubits)
        for gate in self.gates:
            if hasattr(gate, "name") and gate.name == "CNOT":
                self.matrix.row_add(gate.control, gate.target) # type: ignore
            else:
                print(
                    "Warning: CNOT tracker can only be used for circuits with only CNOT gates!"
                )

    @staticmethod
    def from_qasm_file(fname: str) -> "CNOT_tracker":
        circuit = Circuit.from_qasm_file(fname)
        return CNOT_tracker.from_circuit(circuit)


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
    g = generate_cnots(qubits=qubits, depth=n_cnots)
    c = Circuit.from_graph(g)
    matrix = Mat2.id(qubits)
    for gate in c.gates:
        if not hasattr(gate, "control") or not hasattr(gate, "target"):
            continue
        matrix.row_add(gate.control, gate.target)  # type: ignore
        for c in circuit:
            c.row_add(gate.control, gate.target)  # type: ignore
    return matrix.data

class Parity:
    """
    A set of qubits XORed together.
    """
    parity: List[bool]

    def __init__(self, par: Union[str, int, Iterable[Any]], n_qubits: Optional[int] = None):
        if isinstance(par, int):
            self.parity = [bool(par & (1 << i)) for i in reversed(range(par.bit_length()))]
        elif isinstance(par, str):
            self.parity = [p != "0" for p in par]
        else:
            self.parity = [bool(x) for x in par]
        if n_qubits is not None and len(self.parity) < n_qubits:
            self.parity += [False] * (n_qubits - len(self.parity))

    def count(self) -> int:
        """Returns the number of qubits interacting in the parity."""
        return sum(self.parity)

    def n_qubits(self) -> int:
        """Returns the total number of qubits."""
        return len(self.parity)
    
    def to_mat2_row(self) -> List[Z2]:
        return [1 if b else 0 for b in self.parity]

    def __str__(self):
        return "".join(["1" if p else "0" for p in self.parity])

    def __repr__(self):
        return "Parity(" + str(self) + ")"

    def __len__(self):
        return len(self.parity)

    def __iter__(self):
        return iter(self.parity)

    def __getitem__(self, i):
        return self.parity[i]

    def __set_item__(self, i, v):
        self.parity[i] = v

    def __eq__(self, other):
        if isinstance(other, Parity):
            return self.parity == other.parity
        if isinstance(other, str):
            return str(self) == other
        return False

    def __hash__(self):
        return hash(str(self))