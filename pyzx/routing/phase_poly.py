# PyZX - Python library for quantum circuit rewriting
#        and optimisation using the ZX-calculus
# Copyright (C) 2023 - Aleks Kissinger, John van de Wetering,
#                      and Arianne Meijer-van de Griend

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

import numpy as np
from fractions import Fraction
from typing import Callable, Dict, List, Set, Tuple, Union, Optional, Any
from enum import Enum

from ..circuit import Circuit, ZPhase, HAD, XPhase, CNOT
from ..graph.graph import Graph
from ..linalg import Mat2, MatLike
from ..routing.parity_maps import CNOT_tracker, Parity
from ..routing.cnot_mapper import sequential_gauss, ElimMode, gauss
from ..routing.steiner import steiner_reduce_column
from ..routing.architecture import create_architecture, FULLY_CONNECTED, Architecture
from ..utils import make_into_list, maxelements


class RoutingMethod(Enum):
    """
    Phase polynomial routing method to use in :func:`.route_phase_poly`.
    """

    MATROID = "matroid"
    """Routing method based on matroid partitioning. Commonly slower than
    :attr:`.RoutingMethod.GRAY` and :attr:`.RoutingMethod.MEIJER`."""

    GRAY = "GraySynth"
    """
    Routing method based on Gray synthesis (see arxiv.org/abs/1712.01859 ).
    """

    MEIJER = "meijer"
    """
    Routing method by Meijer and Duncan (see arxiv.org/abs/2004.06052 ).
    """

    GRAY_MEIJER = "GraySynth+Meijer"
    """
    Combination of :attr:`.RoutingMethod.GRAY` and :attr:`.RoutingMethod.MEIJER`, keeps the best result of both.
    """

    def __str__(self):
        return f"{self.value}"


class RootHeuristic(Enum):
    """
    Heuristics for choosing the root of a Steiner tree during phase polynomial routing.
    """

    RANDOM = "gauss"
    """Randomly choose a root."""

    EXHAUSTIVE = "exhaustive"
    """Try all possible roots and choose the one with the lowest cost."""

    ARITY = "arity"
    """Choose the root randomly between the nodes with highest arity."""

    RECURSIVE = "recursive"
    """Use an already-chosen root in a recursive call."""

    def __str__(self):
        return f"{self.value}"

    def to_function(
        self,
    ) -> Callable[[Architecture, Mat2, List[int], List[int], int, int, Any], List[int]]:
        if self == RootHeuristic.RANDOM:
            return random_root_heuristic  # type: ignore
        elif self == RootHeuristic.EXHAUSTIVE:
            return exhaustive_root_heuristic  # type: ignore
        elif self == RootHeuristic.ARITY:
            return arity_root_heuristic  # type: ignore
        elif self == RootHeuristic.RECURSIVE:
            return rec_root_heuristic  # type: ignore
        else:
            raise KeyError(f"The root heuristic '{self}' is not implemented")


class SplitHeuristic(Enum):
    """
    Heuristics for choosing nodes to split a circuit during phase polynomial routing.
    """

    RANDOM = "random"
    """Randomly pick a candidate."""

    ARITY = "arity"
    """Split the circuit on the nodes with highest arity."""

    COUNT = "count"
    """Split the circuit on all the candidate nodes."""

    def __str__(self):
        return f"{self.value}"

    def to_function(
        self,
    ) -> Callable[[Architecture, Mat2, List[int], List[int], Any], List[int]]:
        if self == SplitHeuristic.RANDOM:
            return random_split_heuristic  # type: ignore
        elif self == SplitHeuristic.ARITY:
            return arity_split_heuristic  # type: ignore
        elif self == SplitHeuristic.COUNT:
            return count_split_heuristic  # type: ignore
        else:
            raise KeyError(f"The split heuristic '{self}' is not implemented")


def route_phase_poly(
    circuit: Union[Circuit, "PhasePoly"],
    architecture: Architecture,
    method: RoutingMethod = RoutingMethod.GRAY_MEIJER,
    mode: ElimMode = ElimMode.STEINER_MODE,
    root_heuristic: RootHeuristic = RootHeuristic.RECURSIVE,
    split_heuristic: SplitHeuristic = SplitHeuristic.COUNT,
    **kwargs,
) -> Circuit:
    """
    Compile a circuit to an architecture with restricted connectivity.

    :param circuit: The circuit to compile.
    :param architecture: The target architecture.
    :param method: The routing method to use.
    :param mode: The elimination mode to use during the CNOT mapping step.
    :param split_heuristic: The heuristic to use for splitting the circuit into subcircuits.
    :param root_heuristic: The heuristic to use for finding the root of the circuit.
    :return: The compiled circuit.
    """
    if isinstance(circuit, Circuit):
        phase_poly = PhasePoly.fromCircuit(circuit)
    else:
        phase_poly = circuit
    new_circuit = None
    if method == RoutingMethod.MATROID:
        new_circuit = phase_poly.matroid_synth(mode, architecture, **kwargs)[0]
    elif method == RoutingMethod.MEIJER:
        new_circuit = phase_poly.Ariannes_synth(mode, architecture, **kwargs)[0]
    elif method == RoutingMethod.GRAY_MEIJER:
        circuit1 = phase_poly.Ariannes_synth(mode, architecture, **kwargs)[0]
        circuit2 = phase_poly.rec_gray_synth(
            mode,
            architecture,
            split_heuristic=split_heuristic,
            root_heuristic=root_heuristic,
            **kwargs,
        )[0]
        if circuit1.twoqubitcount() < circuit2.twoqubitcount():
            new_circuit = circuit1
        else:
            new_circuit = circuit2
    elif method == RoutingMethod.GRAY:
        new_circuit = phase_poly.rec_gray_synth(
            mode,
            architecture,
            split_heuristic=split_heuristic,
            root_heuristic=root_heuristic,
            **kwargs,
        )[0]
    else:
        raise KeyError(f"The routing method '{method}' is not supported")
    return new_circuit


def random_root_heuristic(
    architecture, matrix, cols_to_use, qubits, column, phase_qubit, **kwargs
):
    root = np.random.choice(qubits)
    return list(
        steiner_reduce_column(
            architecture,
            [row[column] for row in matrix.data],
            root,
            qubits,
            [i for i in range(architecture.n_qubits)],
            [],
            upper=True,
        )
    )


def exhaustive_root_heuristic(
    architecture, matrix, cols_to_use, qubits, column, phase_qubit, **kwargs
):
    cnots = None
    for root in qubits:
        # build a steiner tree
        # Steiner extract with that qubit as root
        possible_cnots = list(
            steiner_reduce_column(
                architecture,
                [row[column] for row in matrix.data],
                root,
                qubits,
                [i for i in range(architecture.n_qubits)],
                [],
                upper=True,
            )
        )
        if cnots is None or len(possible_cnots) < len(cnots):
            cnots = possible_cnots
    return cnots


def arity_root_heuristic(
    architecture, matrix, cols_to_use, qubits, column, phase_qubit, **kwargs
):
    iterator = (
        (qubit, arity) for qubit, arity in architecture.arities() if qubit in qubits
    )
    q, a = next(iterator)
    best_qubits = []
    best_arity = a
    while a == best_arity:
        best_qubits.append(q)
        q, a = next(iterator, (None, best_arity - 1))
    root = np.random.choice(best_qubits)
    return list(
        steiner_reduce_column(
            architecture,
            [row[column] for row in matrix.data],
            root,
            qubits,
            [i for i in range(architecture.n_qubits)],
            [],
            upper=True,
        )
    )


def rec_root_heuristic(
    architecture, matrix, cols_to_use, qubits, column, phase_qubit, **kwargs
):
    root = phase_qubit
    return list(
        steiner_reduce_column(
            architecture,
            [row[column] for row in matrix.data],
            root,
            qubits,
            [i for i in range(architecture.n_qubits)],
            [],
            upper=True,
        )
    )


def calculate_reward(architecture, matrix, cols_to_use, root):
    n_qubits = architecture.n_qubits
    all_cnots = 0
    for column in cols_to_use:
        qubits = [
            i
            for i in range(n_qubits)
            if sum([matrix.data[i][j] for j in cols_to_use]) == len(cols_to_use)
        ]
        cnots = list(
            steiner_reduce_column(
                architecture,
                [row[column] for row in matrix.data],
                root,
                qubits,
                [i for i in range(n_qubits)],
                [],
                upper=True,
            )
        )
        all_cnots += len(cnots)
    return 2 * n_qubits - all_cnots / (len(cols_to_use) + 1)


def random_split_heuristic(
    architecture: Architecture,
    matrix: Mat2,
    cols_to_use: List[int],
    qubits: List[int],
    **kwargs,
):
    return [np.random.choice(qubits)]


def arity_split_heuristic(architecture, matrix, cols_to_use, qubits, **kwargs):
    iterator = (
        (qubit, arity) for qubit, arity in architecture.arities() if qubit in qubits
    )
    q, a = next(iterator)
    best_qubits = []
    best_arity = a
    while a == best_arity:
        best_qubits.append(q)
        q, a = next(iterator, (None, best_arity - 1))
    return best_qubits


def count_split_heuristic(architecture, matrix, cols_to_use, qubits, **kwargs):
    return qubits


class PhasePoly:
    """
    A class representing a phase polynomial.
    """

    def __init__(
        self,
        zphase_dict: Dict[Parity, Fraction],
        out_parities: List[Parity],
    ):
        self.zphases = zphase_dict
        self.out_par = out_parities
        self.n_qubits = out_parities[0].n_qubits()
        self.all_parities = list(zphase_dict.keys())

    @staticmethod
    def fromCircuit(
        circuit,
        initial_qubit_placement=None,
        final_qubit_placement=None,
    ):
        zphases = {}
        current_parities = mat22partition(Mat2.id(circuit.qubits))
        if initial_qubit_placement is not None:
            current_parities = [
                Parity(row[i] for i in initial_qubit_placement)
                for row in current_parities
            ]
        for gate in circuit.gates:
            parity = current_parities[gate.target]
            if gate.name in ["CNOT", "CX"]:
                # Update current_parities
                control = current_parities[gate.control]
                current_parities[gate.target] = Parity(
                    (int(i) + int(j)) % 2 for i, j in zip(control, parity)
                )
            elif isinstance(gate, ZPhase):
                # Add the T rotation to the phases
                if parity in zphases:
                    zphases[parity] += gate.phase
                else:
                    zphases[parity] = gate.phase
            elif isinstance(gate, XPhase):
                raise Exception("XPhase gate not yet supported!")
            else:
                raise Exception("Gate not supported!", gate.name)

        def clamp(phase):
            new_phase = phase % 2
            if new_phase > 1:
                return new_phase - 2
            return new_phase

        zphases = {par: clamp(r) for par, r in zphases.items() if clamp(r) != 0}
        if final_qubit_placement is not None:
            current_parities = [current_parities[i] for i in final_qubit_placement]

        return PhasePoly(zphases, current_parities)

    def partition(self, skip_output_parities=True, optimize_parity_order=False):
        # Matroid partitioning based on wikipedia: https://en.wikipedia.org/wiki/Matroid_partitioning
        def add_edge(graph, vs_dict, node1, node2):
            v1 = [k for k, v in vs_dict.items() if v == node1][0]
            v2 = [k for k, v in vs_dict.items() if v == node2][0]
            graph.nedges += 1
            graph.graph[v1][v2] = 1

        partitions = []
        parities_to_partition = (
            self.all_parities
            if not skip_output_parities
            else [p for p in self.all_parities if p not in self.out_par]
        )
        for parity in parities_to_partition:
            graph = Graph()
            # Add current parity to the graph
            # Add each partition to the graph
            # Add each parity in the partition to the graph
            vs = graph.add_vertices(
                len(partitions) + sum([len(p) for p in partitions]) + 1
            )
            vs_dict = {
                i: node
                for i, node in zip(
                    vs, partitions + [e for p in partitions for e in p] + [parity]
                )
            }
            # Check which parities can be added to another partition
            for partition in partitions:
                # Check if the new parity can be added to the partition
                if self._independent(list(partition) + [parity]):
                    add_edge(graph, vs_dict, parity, partition)
                for p in partition:
                    # Check if p can be replaced with the new parity in the partition
                    for partition2 in partitions:
                        if partition2 != partition:
                            for p2 in partition2:
                                # Check if p2 can be replaced with p in their partitions
                                new_partition = [e for e in partition if e != p] + [p2]
                                if self._independent(new_partition):
                                    add_edge(graph, vs_dict, p2, p)
            # Find a path from the parity to a partition
            path = self._dfs([(parity, [parity])], graph, vs_dict, partitions)
            if path != []:
                # Apply those changes if such a path exists
                # Remember which partition to add the final element to
                p_idx = partitions.index(
                    path[-1]
                )  # Last element in the path is always a partition
                for p1, p2 in zip(path[:-1], path[1:]):
                    # Replace p2 with p1 in p1's partition
                    for partition in partitions:
                        if p1 in partition:
                            partition.pop(p1)
                            partition.append(p2)
                partitions[p_idx].append(path[-2])
            else:
                # Make a new partition if no such path exists.
                partitions.append([parity])
        ordered_partitions = []
        for partition in partitions:
            # Add identity parities to the partition if the set is not full yet.
            matrix = partition2mat2(partition)
            inv = inverse_hack(matrix)
            if inv is not None:
                matrix, _ = inv
            if optimize_parity_order:
                # Find a more optimal ordering of the parities
                parity_placement = self._place_parities(matrix)
            else:
                parity_placement = np.arange(self.n_qubits)
            partition = mat22partition(matrix)
            new_partition = [partition[i] for i in parity_placement]
            ordered_partitions.append(new_partition)
        return ordered_partitions

    def _order_partitions(self, partitions):
        n = len(partitions)
        numbered = {
            i: partition2mat2(partition) for i, partition in enumerate(partitions)
        }

        def cost_func(p1, p2):
            inv = inverse_hack(p1)
            if inv is not None:
                _, inv = inv
            else:
                inv = Mat2.id(p2.rows())
            c = CNOT_tracker(len(partitions[0]))
            (p2 * inv).gauss(full_reduce=True, y=c)
            return len(c.gates)

        path_costs = {
            (i, j): cost_func(p1, p2)
            for i, p1 in numbered.items()
            for j, p2 in numbered.items()
            if i != j
        }
        # start at the back
        new_partitions = [partitions[-1]]
        visited = []
        current = n - 1
        while len(visited) < n - 1:
            # Pick the partition that was not yet visited whose
            choice = min(
                [i for i in range(n) if i not in visited + [current]],
                key=lambda i: path_costs[(i, current)],
            )
            new_partitions = [mat22partition(numbered[choice])] + new_partitions
            visited += [current]
            current = choice
        return new_partitions

    def _place_parities(self, parities: Union[Mat2, MatLike]) -> List[int]:
        if isinstance(parities, Mat2):
            parities = parities.data
        permutation = [0] * self.n_qubits
        skipped_parities = []
        # Greedily map identity rows
        for i, parity in enumerate(parities):
            if parity.count(1) == 1:
                permutation[parity.index(1)] = i
            else:
                skipped_parities.append((i, parity))
        skipped_idxs = []
        deliberating = []
        for i in range(self.n_qubits):
            if permutation[i] is None:
                # Find the best parity in skipped_parities to place there
                pivoted_parities = [(j, p) for j, p in skipped_parities if p[i] == 1]
                if pivoted_parities:
                    # The parity with the least 1s has the most priority because it can probably not be placed elsewhere
                    pivoted_parities = sorted(
                        pivoted_parities, key=lambda parity: parity[1].count(1)
                    )
                    if len(pivoted_parities) == 1:
                        chosen = pivoted_parities[0]
                        permutation[i] = chosen[0]
                        skipped_parities.remove(chosen)
                    else:
                        # If there are multiple options, try them later
                        deliberating.append((i, pivoted_parities))
                else:
                    skipped_idxs.append(i)
        for i, pivoted_parities in deliberating:
            pivoted_parities = [p for p in pivoted_parities if p in skipped_parities]
            if pivoted_parities:
                chosen = pivoted_parities[0]
                permutation[i] = chosen[0]
                skipped_parities.remove(chosen)
            else:
                skipped_idxs.append(i)
        for i in skipped_idxs:
            permutation[i] = skipped_parities.pop()[0]
        return permutation

    def _dfs(self, nodes, graph, inv_vs_dict, partitions):
        # recursive dfs to find the shortest path
        if nodes == []:
            return []
        new_nodes = []
        for (node, path) in nodes:
            # For each node2 connected to node
            v = [k for k, v in inv_vs_dict.items() if v == node][0]
            for node2 in graph.graph[v].keys():
                # If it's a partition, we found a path
                next_node = inv_vs_dict[node2]
                if next_node not in path:  # Avoid loops!
                    new_path = path + [next_node]
                    if next_node in partitions:
                        return new_path
                    else:
                        new_nodes.append((next_node, new_path))
        return self._dfs(new_nodes, graph, inv_vs_dict, partitions)

    @staticmethod
    def _independent(partition: List[Parity]) -> bool:
        return inverse_hack(partition2mat2(partition)) is not None

    def matroid_synth(
        self,
        mode: ElimMode,
        architecture: Architecture,
        optimize_parity_order: bool = False,
        optimize_partition_order: bool = True,
        iterative_placement: bool = False,
        parity_permutation: bool = True,
        iterative_initial_placement: bool = False,
        **kwargs,
    ):
        kwargs["full_reduce"] = True
        n_qubits = (
            architecture.n_qubits if architecture is not None else len(self.out_par)
        )
        # Partition and order the parities
        partitions = self.partition(optimize_parity_order=optimize_parity_order) + [
            self.out_par
        ]
        if optimize_partition_order:
            partitions = self._order_partitions(partitions)
        # Make the parity sets into matrices
        matrices = [partition2mat2(partition) for partition in partitions]
        # The matrices to be computed need to first undo the previous parities and then obtain the new parities
        other_matrices = []
        prev_matrix = Mat2.id(n_qubits)
        for m in matrices:
            inv = inverse_hack(m)
            if inv is not None:
                new_matrix, inverse = inv
                other_matrices.append(new_matrix * prev_matrix)
                prev_matrix = inverse
            else:
                new_matrix = m
                other_matrices.append(new_matrix * prev_matrix)
                prev_matrix = Mat2.id(n_qubits)
        CNOT_circuits, perms, _ = sequential_gauss(
            [m.copy() for m in other_matrices],
            mode=mode,
            architecture=architecture,
            **kwargs,
        )
        zphases = list(self.zphases.keys())
        circuit = Circuit(n_qubits)
        # Keep track of the parities
        current_parities = Mat2(
            [
                [
                    Mat2.id(n_qubits).data[i][perms[0].index(j)]
                    for j in range(n_qubits)
                ]
                for i in range(n_qubits)
            ]
        )
        for c in CNOT_circuits:
            # Obtain the specified parity
            for gate in c.gates:
                # CNOTs have been mapped already, do not need to be adjusted!
                circuit.add_gate(gate)
                try:
                    current_parities.row_add(gate.control, gate.target)  # type: ignore
                except AttributeError:
                    pass
            # Place the rotations at each parity
            for target, p in enumerate(current_parities.data):
                parity = Parity(p)
                # Apply the phases at current parity if needed.
                if parity in zphases:
                    phase = self.zphases[parity]
                    gate = ZPhase(target=target, phase=phase)
                    zphases.remove(parity)
                    circuit.add_gate(gate)
        # Return the circuit
        return circuit, perms[0], perms[-1]

    def gray_synth(
        self, mode: ElimMode, architecture: Optional[Architecture], **kwargs
    ):
        kwargs["full_reduce"] = True
        arch: Architecture
        if architecture is None or mode == ElimMode.GAUSS_MODE:
            arch = create_architecture(FULLY_CONNECTED, n_qubits=len(self.out_par[0]))
        else:
            arch = architecture
            mode = (
                ElimMode.GAUSS_MODE
                if mode == ElimMode.GAUSS_MODE
                else ElimMode.STEINER_MODE
            )
        # Obtain the parities
        parities_to_reach = self.all_parities
        # TODO - Pick a good order
        # Make a matrix from the parities
        matrix = Mat2(
            [
                [1 if parity[i] else 0 for parity in parities_to_reach]
                for i in range(arch.n_qubits)
            ]
        )
        circuit = CNOT_tracker(arch.n_qubits)
        # For each column in the matrix Or while the matrix has columns
        cols_to_skip = []
        n_phases_placed = 0
        for col in [c for c in range(matrix.cols()) if c not in cols_to_skip]:
            if sum([row[col] for row in matrix.data]) == 1:
                # Add phase gates where needed
                qubit = [row[col] for row in matrix.data].index(1)
                circuit.add_gate(ZPhase(qubit, self.zphases[parities_to_reach[col]]))
                n_phases_placed += 1
                # Remove columns from the matrix if the corresponding parity was obtained
                cols_to_skip.append(col)
        for c in range(matrix.cols()):
            if c not in cols_to_skip:
                column = [int(row[c]) for row in matrix.data]
                # TODO - Pick a good qubit where the phase should be placed
                root = column.index(
                    1
                )  # Place the parity on the first qubit that has a 1
                # Steiner extract with that qubit as root
                nodes = [i for i in range(arch.n_qubits) if column[i] == 1]
                cnots = list(
                    steiner_reduce_column(
                        arch,
                        column,
                        root,
                        nodes,
                        [i for i in range(arch.n_qubits)],
                        [],
                        upper=True,
                    )
                )
                # For each returned CNOT:
                for target, control in cnots:
                    # Place the CNOT on the circuit
                    circuit.add_gate(CNOT(control, target))
                    # Adjust the matrix accordingly - reversed elementary row operations
                    matrix.row_add(target, control)
                    # Keep track of the parities in the circuit - normal elementary row operations
                    for col in [
                        c for c in range(matrix.cols()) if c not in cols_to_skip
                    ]:
                        if sum([row[col] for row in matrix.data]) == 1:
                            # Add phase gates where needed
                            qubit = [row[col] for row in matrix.data].index(1)
                            circuit.add_gate(
                                ZPhase(qubit, self.zphases[parities_to_reach[col]])
                            )
                            n_phases_placed += 1
                            # Remove columns from the matrix if the corresponding parity was obtained
                            cols_to_skip.append(col)
        # Calculate the final parity that needs to be added from the circuit and self.out_par
        self._obtain_final_parities(circuit, arch, mode, **kwargs)
        # Return the circuit
        return (
            circuit,
            [i for i in range(arch.n_qubits)],
            [i for i in range(arch.n_qubits)],
        )

    def rec_gray_synth(
        self,
        mode,
        architecture,
        root_heuristic: RootHeuristic = RootHeuristic.RECURSIVE,
        split_heuristic: SplitHeuristic = SplitHeuristic.COUNT,
        full=True,
        phase_qubit=None,
        **kwargs,
    ):
        kwargs["full_reduce"] = True
        if architecture is None or mode == ElimMode.GAUSS_MODE:
            architecture = create_architecture(
                FULLY_CONNECTED, n_qubits=len(self.out_par[0])
            )
            mode = ElimMode.GAUSS_MODE
        else:
            mode = (
                ElimMode.GAUSS_MODE
                if mode == ElimMode.GAUSS_MODE
                else ElimMode.STEINER_MODE
            )
        n_qubits = architecture.n_qubits
        # Obtain the parities
        parities_to_reach = self.all_parities
        # Make a matrix from the parities
        matrix = Mat2(
            [
                [1 if parity[i] else 0 for parity in parities_to_reach]
                for i in range(architecture.n_qubits)
            ]
        )
        circuit = CNOT_tracker(architecture.n_qubits)
        # Make a stack - aka use the python stack >^.^<
        def recurse(
            cols_to_use, qubits_to_use, phase_qubit
        ):  # Arguments from the original paper, steiner version might only use the first
            # Check for finished columns
            cols_to_use = self._check_columns(
                matrix, circuit, cols_to_use, parities_to_reach
            )
            if cols_to_use != []:
                # Find all qubits (rows) with only 1s on the allowed parities (cols_to_use)
                qubits = [
                    i
                    for i in range(n_qubits)
                    if sum([matrix.data[i][j] for j in cols_to_use]) == len(cols_to_use)
                ]
                if len(qubits) > 1 and phase_qubit is not None:
                    # Pick the column with the most 1s to extract the steiner tree with
                    column = max(
                        cols_to_use, key=lambda c: sum([row[c] for row in matrix.data])
                    )
                    # Pick a qubit as root using the given heuristic
                    cnots = root_heuristic.to_function()(
                        architecture,
                        matrix,
                        cols_to_use,
                        qubits,
                        column,
                        phase_qubit,
                        mode=mode,  # type: ignore
                        root_heuristic=RootHeuristic.RECURSIVE,
                        split_heuristic=SplitHeuristic.COUNT,
                    )
                    # For each returned CNOT:
                    for target, control in cnots:
                        # Place the CNOT on the circuit
                        circuit.add_gate(CNOT(control, target))
                        # Adjust the matrix accordingly - reversed elementary row operations
                        matrix.row_add(target, control)
                        # Keep track of the parities in the circuit - normal elementary row operations
                        cols_to_use = self._check_columns(
                            matrix, circuit, cols_to_use, parities_to_reach
                        )
                # After placing the cnots do recursion
                if len(cols_to_use) > 0:
                    # Choose a row to split on
                    if len(cols_to_use) == 1:
                        qubits = [
                            i
                            for i in range(n_qubits)
                            if sum([matrix.data[i][j] for j in cols_to_use]) == 1
                        ]
                    else:
                        # Ignore rows that are currently all 0s or all 1s
                        qubits = [
                            i
                            for i in range(n_qubits)
                            if sum([matrix.data[i][j] for j in cols_to_use])
                            not in [0, len(cols_to_use)]
                        ]
                    # Pick the one with the best connectivity everywhere
                    best_qubits = split_heuristic.to_function()(
                        architecture,
                        matrix,
                        cols_to_use,
                        qubits,
                        phase_qubit=phase_qubit,  # type: ignore
                    )
                    # Pick the qubit where the recursion split will be most skewed.
                    chosen_row = max(
                        best_qubits,
                        key=lambda q: max(
                            [
                                len(
                                    [
                                        col
                                        for col in cols_to_use
                                        if matrix.data[q][col] == i
                                    ]
                                )
                                for i in [1, 0]
                            ],
                            default=-1,
                        ),
                    )
                    # Split the column into 1s and 0s in that row
                    cols1 = [
                        col for col in cols_to_use if matrix.data[chosen_row][col] == 1
                    ]
                    cols0 = [
                        col for col in cols_to_use if matrix.data[chosen_row][col] == 0
                    ]
                    rec_list = [
                        (
                            cols1,
                            qubits_to_use,
                            phase_qubit if phase_qubit is not None else chosen_row,
                        ),
                        (cols0, qubits_to_use, phase_qubit),
                    ]
                    for args in rec_list:
                        recurse(*args)

        # Put the base case into the python stack
        recurse(
            [i for i in range(len(parities_to_reach))],
            [i for i in range(n_qubits)],
            phase_qubit,
        )
        if full:
            # Calculate the final parity that needs to be added from the circuit and self.out_par
            self._obtain_final_parities(circuit, architecture, mode, **kwargs)
        # Return the circuit
        return (
            circuit,
            [i for i in range(architecture.n_qubits)],
            [i for i in range(architecture.n_qubits)],
        )

    def Ariannes_synth(
        self,
        mode,
        architecture,
        full=True,
        zeroes_rec=False,
        neighbour_path=False,
        tie_break=False,
        **kwargs,
    ) -> Tuple[Circuit, Any, Any]:
        kwargs["full_reduce"] = True
        if not isinstance(architecture, Architecture):
            architecture = create_architecture(
                FULLY_CONNECTED, n_qubits=len(self.out_par[0])
            )
        n_qubits = architecture.n_qubits
        # Obtain the parities
        parities_to_reach = self.all_parities
        # Make a matrix from the parities
        parity_matrix = Mat2(
            [
                [1 if parity[i] else 0 for parity in parities_to_reach]
                for i in range(architecture.n_qubits)
            ]
        )
        circuit = CNOT_tracker(architecture.n_qubits)
        cols_to_reach = self._check_columns(
            parity_matrix,
            circuit,
            list(range(len(parities_to_reach))),
            parities_to_reach,
        )
        self.prev_rows: List[int] = []

        def place_cnot(control, target):
            # Place the CNOT on the circuit
            circuit.add_gate(CNOT(control, target))
            # Adjust the matrix accordingly - reversed elementary row operations
            parity_matrix.row_add(target, control)

        def base_recurse(cols_to_use, qubits_to_use):
            if qubits_to_use != [] and cols_to_use != []:
                # Select edge qubits
                vertices_to_use = [architecture.qubit2vertex(q) for q in qubits_to_use]
                vertices = architecture.non_cutting_vertices(vertices_to_use)
                qubits = [architecture.vertex2qubit(v) for v in vertices]

                # Pick the qubit where the recursion split will be most skewed.
                if zeroes_rec:
                    selection_criterium = lambda q: len(
                        [col for col in cols_to_use if parity_matrix.data[q][col] == 0]
                    )
                else:
                    selection_criterium = lambda q: max(
                        [
                            len(
                                [
                                    col
                                    for col in cols_to_use
                                    if parity_matrix.data[q][col] == i
                                ]
                            )
                            for i in [1, 0]
                        ],
                        default=-1,
                    )
                if tie_break:
                    chosen_row = self._tie_break(
                        qubits, maxelements(qubits, key=selection_criterium)
                    )
                else:
                    chosen_row = max(qubits, key=selection_criterium)
                # Split the column into 1s and 0s in that row
                cols1 = [
                    col
                    for col in cols_to_use
                    if parity_matrix.data[chosen_row][col] == 1
                ]
                cols0 = [
                    col
                    for col in cols_to_use
                    if parity_matrix.data[chosen_row][col] == 0
                ]
                base_recurse(cols0, [q for q in qubits_to_use if q != chosen_row])
                one_recurse(
                    cols1, [q for q in qubits_to_use if q != chosen_row], chosen_row
                )

        def one_recurse(cols_to_use, qubits_to_use, qubit):
            if cols_to_use != []:
                self._update_prev_rows([qubit])
                neighbors = [
                    q
                    for q in architecture.get_neighboring_qubits(qubit)
                    if q in qubits_to_use
                ]
                selection_criterium = lambda q: len(
                    [col for col in cols_to_use if parity_matrix.data[q][col] == 1]
                )
                indices = maxelements(neighbors, key=selection_criterium)
                if (
                    neighbour_path
                    and len(indices) > 1
                    and selection_criterium(neighbors[indices[0]]) == 0
                ):
                    # We will swap, pick the right direction to swap towards
                    # This is the neighbour with the shortest path (restricted to qubits_to_use) to a row with most ones.
                    directions = [
                        qubits_to_use[i]
                        for i in maxelements(qubits_to_use, key=selection_criterium)
                    ]  # All rows with most ones
                    path_criterium = lambda i: min(
                        directions,
                        key=lambda q: len(
                            architecture.shortest_path(neighbors[i], q, qubits_to_use)
                            or []
                        ),
                    )
                    indices = maxelements(indices, key=path_criterium, reverse=True)
                if tie_break and len(indices) > 1:
                    chosen_neighbors = self._tie_break(neighbors, indices)
                else:
                    chosen_neighbors = neighbors[indices[0]]

                # Place CNOTs if you still need to extract columns
                if (
                    sum([parity_matrix.data[chosen_neighbors][c] for c in cols_to_use])
                    != 0
                ):  # Check if adding the cnot is useful
                    place_cnot(qubit, chosen_neighbors)
                    # Might have changed the matrix.
                    cols_to_use = self._check_columns(
                        parity_matrix, circuit, cols_to_use, parities_to_reach
                    )
                else:  # Will never change the matrix
                    place_cnot(chosen_neighbors, qubit)
                    place_cnot(qubit, chosen_neighbors)
                    # Since the neighbors was all zeros, this is effectively a swap and no columns need to be checked.
                self._update_prev_rows([chosen_neighbors])
                # Split the column into 1s and 0s in that row
                cols0 = [
                    col for col in cols_to_use if parity_matrix.data[qubit][col] == 0
                ]
                cols1 = [
                    col for col in cols_to_use if parity_matrix.data[qubit][col] == 1
                ]
                base_recurse(cols0, qubits_to_use)
                one_recurse(cols1, qubits_to_use, qubit)

        base_recurse(cols_to_reach, [i for i in range(n_qubits)])

        if full:
            # Calculate the final parity that needs to be added from the circuit and self.out_par
            self._obtain_final_parities(circuit, architecture, mode, **kwargs)

        # Return the circuit
        return (
            circuit,
            [i for i in range(architecture.n_qubits)],
            [i for i in range(architecture.n_qubits)],
        )

    def _check_columns(
        self,
        parity_matrix: Mat2,
        circuit: Circuit,
        columns: List[int],
        parities_to_reach: List[Parity],
    ):
        """
        Check if any of the columns are finished (are phase gadgets over a single qubit)
        and add the corresponding phase gates to the circuit.
        """
        initial_cols = columns.copy()
        for col in initial_cols:
            column_data = [row[col] for row in parity_matrix.data]
            if sum(column_data) == 1:
                # Add phase gates where needed
                qubit = column_data.index(1)
                circuit.add_gate(ZPhase(qubit, self.zphases[parities_to_reach[col]]))
                # Remove columns from the parity_matrix if the corresponding parity was obtained
                columns.remove(col)
        return columns

    def _tie_break(self, qubits, indices):
        for i in indices:
            if qubits[i] not in self.prev_rows:
                return qubits[i] if not qubits[i] else qubits[i]
        return qubits[indices[0]] if not qubits[indices[0]] else qubits[indices[0]]

    def _update_prev_rows(self, qubits):
        # print("Updating prev rows:", self.prev_rows, qubits[0], end="\t")
        # if any(qubit in self.prev_rows for qubit in qubits):
        #    self.prev_rows = qubits
        # else:
        #    self.prev_rows += qubits
        index = max(
            [q for q in qubits if q in self.prev_rows],
            key=lambda q: self.prev_rows.index(q),
            default=-1,
        )
        if index == -1:
            self.prev_rows += qubits
        else:
            index += 2 - index % 2
            if index != len(self.prev_rows):
                self.prev_rows = self.prev_rows[index:] + qubits
            else:
                self.prev_rows = [qubits]
        # print(self.prev_rows)

    def _obtain_final_parities(
        self,
        circuit: CNOT_tracker,
        architecture: Architecture,
        mode: ElimMode,
        **kwargs,
    ):
        """
        Calculate the final parity that needs to be added from the circuit and self.out_par
        """
        current_parities = circuit.matrix
        output_parities = Mat2(
            [[1 if v else 0 for v in row] for row in self.out_par]
        )
        current_parities_inv = current_parities.inverse()
        if current_parities_inv is None:
            raise ValueError("The circuit parity is not invertible.")
        last_parities = output_parities * current_parities_inv
        # Do steiner-gauss to calculate necessary CNOTs and add those to the circuit.
        cnots = CNOT_tracker(architecture.n_qubits)
        gauss(mode, last_parities, architecture, y=cnots, **kwargs)
        for cnot in cnots.gates:
            circuit.add_gate(cnot)


def inverse_hack(matrix: Mat2) -> Optional[Tuple[Mat2, Mat2]]:
    m = matrix.copy()
    if matrix.rows() != matrix.cols():
        # Compute which columns are independent from the matrix
        rank = m.gauss(full_reduce=False)
        cols = []
        row = 0
        for col in range(m.cols()):
            if row >= m.rows() or m.data[row][col] == 0:
                cols.append(col)
            else:
                row += 1
        # Add those columns as rows to the matrix
        matrix = Mat2(
            matrix.data + [[1 if c == i else 0 for i in range(m.cols())] for c in cols]
        )
        m = matrix.copy()
    # Compute the inverse
    inv = Mat2.id(matrix.rows())
    rank = m.gauss(x=inv, full_reduce=True)
    if rank < matrix.rows():
        return None
    else:
        return matrix, inv


def partition2mat2(partition: List[Parity]) -> Mat2:
    return Mat2([parity.to_mat2_row() for parity in partition])


def mat22partition(m: Mat2) -> List[Parity]:
    return [Parity(p) for p in m.data]
