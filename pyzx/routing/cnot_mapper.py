import numpy as np

from enum import Enum
from typing import List, Optional, Tuple

from pyzx.circuit import Circuit

from ..linalg import Mat2
from .architecture import (
    Architecture,
    create_fully_connected_architecture,
)
from .parity_maps import CNOT_tracker
from .machine_learning import GeneticAlgorithm, ParticleSwarmOptimization

from .steiner import rec_steiner_gauss as steiner_gauss


class ElimMode(Enum):
    """
    Row elimination modes for the cnot mapper procedures
    """

    GAUSS_MODE = "gauss"
    """Gaussian elimination, ignoring the architecture."""

    STEINER_MODE = "steiner"
    """Steiner tree based Gaussian elimination, optimizing the number of SWAPs
    operations required to synthesize the CNOTs on the restricted
    architecture."""

    GENETIC_GAUSS_MODE = "genetic_gauss"
    """Gauss elimination using a genetic algorithm to find the best row permutation."""

    GENETIC_STEINER_MODE = "genetic_steiner"
    """Steiner Gauss elimination using a genetic algorithm to find the best row permutation."""

    PSO_GAUSS_MODE = "pso_gauss"
    """Gauss elimination using Particle Swarm Optimization to find the best row permutation."""

    PSO_STEINER_MODE = "pso_steiner"
    """Steiner Gauss elimination using Particle Swarm Optimization to find the best row permutation."""

    def __str__(self):
        return f"{self.value}"


genetic_elim_modes = [ElimMode.GENETIC_STEINER_MODE, ElimMode.GENETIC_GAUSS_MODE]
pso_elim_modes = [ElimMode.PSO_GAUSS_MODE, ElimMode.PSO_STEINER_MODE]
basic_elim_modes = [ElimMode.STEINER_MODE, ElimMode.GAUSS_MODE]
elim_modes = list(ElimMode)


class CostMetric(Enum):
    """
    Metrics for the cost of the gates needed for a given permutation,
    used by the cnot mapper fitness functions.
    """

    COMBINED = "combined"
    """Count both the number of CNOTs and the depth of the circuit"""
    DEPTH = "depth"
    """Count the number of CNOTs in the circuit"""
    COUNT = "count"
    """Count the depth of the circuit"""

    def __str__(self):
        return f"{self.value}"


class FitnessFunction(object):
    """
    A fitness function that calculates the cost of the gates needed for a given permutation.
    """

    def __init__(
        self,
        metric: CostMetric,
        matrix: Mat2,
        mode: Optional[ElimMode],
        architecture: Optional[Architecture],
        row: bool = True,
        col: bool = True,
        full_reduce: bool = True,
        **kwargs,
    ):
        """
        Creates and returns a fitness function using the given metric.

        :param metric_func: The metric to use for the fitness function
        :param mode: The type of Gaussian elimination to be used
        :param matrix: A Mat2 parity map to route.
        :param architecture: The architecture to take into account when routing
        :param row: Whether to find a row permutation
        :param col: Whether to find a column permutation
        :param full_reduce: Whether to fully reduce the matrix, thus rebuild the full circuit.
        """
        self.metric = metric
        self.matrix = matrix
        self.mode = mode
        self.architecture = architecture
        self.row = row
        self.col = col
        self.full_reduce = full_reduce
        self.n_qubits = architecture.n_qubits if architecture else matrix.cols()
        self.kwargs = kwargs

    def _make_function(self):
        if self.metric == CostMetric.COMBINED:
            f = lambda c: c.cnot_depth() * 10000 + c.count_cnots()
        elif self.metric == CostMetric.COUNT:
            f = lambda c: c.count_cnots()
        elif self.metric == CostMetric.DEPTH:
            f = lambda c: c.cnot_depth()

        def fitness_func(permutation):
            row_perm = permutation if self.row else np.arange(len(self.matrix.data))
            col_perm = permutation if self.col else np.arange(len(self.matrix.data[0]))
            circuit = CNOT_tracker(self.n_qubits)
            mat = Mat2([[self.matrix.data[r][c] for c in col_perm] for r in row_perm])
            gauss(
                self.mode,
                mat,
                architecture=self.architecture,
                y=circuit,
                full_reduce=self.full_reduce,
                **self.kwargs,
            )
            return f(circuit)

        return fitness_func

    def __call__(self, permutation):
        f = self._make_function()
        return f(permutation)


def gauss(
    mode: Optional[ElimMode],
    matrix: Mat2,
    architecture: Optional[Architecture] = None,
    permutation: Optional[List[int]] = None,
    try_transpose: bool = False,
    **kwargs,
) -> int:
    """
    Performs architecture-aware Gaussian Elimination on a matrix.

    :param mode: Type of Gaussian elimination to be used, see :class:`ElimMode`.
    :param matrix: Target matrix to be reduced.
    :param architecture: Device architecture to take into account.
    :param permutation: If given, reduce a permuted version of the matrix.
    :param kwargs: Other arguments that can be given to the :meth:`Mat2.gauss` function or parameters for the genetic algorithm.
    :return: The rank of the matrix. :data:`matrix` is transformed inplace.
    """
    if try_transpose:
        matrix = matrix.transpose()
        if architecture is not None:
            architecture = architecture.transpose()
    if mode is None:
        mode = ElimMode.GAUSS_MODE

    if mode == ElimMode.GAUSS_MODE:
        # TODO - adjust to get the right gate locations for the given permutation.

        if permutation is not None:
            # print("\033[91m Warning: Permutation parameter with Gauss-Jordan elimination is not yet supported, it can be optimized with permuted_gauss(). \033[0m ")
            # return matrix.gauss(**kwargs)
            # Broken code that tries to implement this.
            matrix = Mat2([[row[i] for i in permutation] for row in matrix.data])
            old_x, old_y = None, None
            if "x" in kwargs:
                old_x = kwargs["x"]
            if "y" in kwargs:
                old_y = kwargs["y"]
            n_qubits = len(matrix.data)
            x = CNOT_tracker(n_qubits)
            kwargs["x"] = x
            kwargs["y"] = None
            rank = matrix.gauss(**kwargs)
            # for gate in x.gates:
            #    #c = permutation[gate.control]
            #    #t = permutation[gate.target]
            #    if old_x != None: old_x.row_add(c, t)
            #    if old_y != None: old_y.col_add(t, c)
            # return rank
        else:
            rank = matrix.gauss(**kwargs)
    elif mode == ElimMode.STEINER_MODE:
        if architecture is None:
            print(
                f"\033[91m Warning: Architecture is not given, assuming fully connected architecture of size {matrix.rows()}. \033[0m "
            )
            architecture = create_fully_connected_architecture(matrix.rows())
        if permutation is not None:
            matrix.permute_rows(permutation)
            matrix.permute_cols(permutation)
        steiner_gauss(matrix, architecture, **kwargs)
        try:
            len(matrix.data)
        except:
            print(
                "Failing length for matrix data:",
                matrix.data,
                "with type",
                type(matrix.data),
            )
        rank = 0  # TODO: The rank is not being computed here
    elif mode == ElimMode.GENETIC_STEINER_MODE:
        perm, circuit, rank = permuted_gauss(
            matrix,
            ElimMode.STEINER_MODE,
            architecture=architecture,
            permutation=permutation,
            **kwargs,
        )
        # return rank
    elif mode == ElimMode.GENETIC_GAUSS_MODE:
        perm, circuit, rank = permuted_gauss(
            matrix,
            ElimMode.GAUSS_MODE,
            architecture=architecture,
            permutation=permutation,
            **kwargs,
        )
    else:
        raise KeyError(f"Invalid elimination mode '{mode}'")
    if try_transpose:
        # TODO - fix x and y circuits... - Needed?
        # TODO pick which gauss version was chosen
        pass
    return rank


def permuted_gauss(
    matrix: Mat2,
    mode: Optional[ElimMode] = None,
    architecture: Optional[Architecture] = None,
    population_size: int = 30,
    crossover_prob: float = 0.8,
    mutate_prob: float = 0.2,
    n_iterations: int = 5,
    row: bool = True,
    col: bool = True,
    full_reduce: bool = True,
    fitness_func: Optional[FitnessFunction] = None,
    x=None,
    y=None,
    **kwargs,
) -> Tuple[List[int], Circuit, int]:
    """
    Applies gaussian elimination to the given matrix, finding an optimal
    permutation of the matrix to reduce the number of CNOT gates.

    :param matrix: Mat2 matrix to do gaussian elimination over
    :param mode: Elimination mode to use
    :param architecture: Architecture to take into account
    :param population_size: For the genetic algorithm
    :param crossover_prob: For the genetic algorithm
    :param mutate_prob: For the genetic algorithm
    :param n_iterations: For the genetic algorithm
    :param row: If the rows should be permutedA
    :param col: If the columns should be permuted
    :param full_reduce: Whether to do full gaussian reduction
    :param fitness_func: Optional fitness function to use
    :param x: Optional tracker for the row operations
    :param y: Optional tracker for the column operations
    :return: Best permutation found, list of CNOTS corresponding to the
        elimination.
    """
    if row or col:
        if fitness_func is None:
            fitness_func = FitnessFunction(
                CostMetric.COMBINED,
                matrix,
                mode,
                architecture,
                row=row,
                col=col,
                full_reduce=full_reduce,
                **kwargs,
            )
        optimizer = GeneticAlgorithm(
            population_size,
            crossover_prob,
            mutate_prob,
            fitness_func,
        )
        permsize = len(matrix.data) if row else len(matrix.data[0])
        best_permutation = optimizer.find_optimum(
            permsize, n_iterations, continued=True
        )
    else:
        best_permutation = np.arange(len(matrix.data))

    n_qubits = len(matrix.data)
    row_perm = best_permutation if row else np.arange(len(matrix.data))
    col_perm = best_permutation if col else np.arange(len(matrix.data[0]))
    if y is None:
        circuit = CNOT_tracker(n_qubits)
    else:
        circuit = y
    mat = Mat2([[matrix.data[r][c] for c in col_perm] for r in row_perm])
    circuit.row_perm = row_perm  # type: ignore
    circuit.col_perm = col_perm  # type: ignore
    rank = gauss(
        mode, mat, architecture, x=x, y=circuit, full_reduce=full_reduce, **kwargs
    )
    best_permutation = list(best_permutation)
    return best_permutation, circuit, rank


def sequential_gauss(
    matrices: list[Mat2],
    mode: Optional[ElimMode] = None,
    architecture: Optional[Architecture] = None,
    fitness_func: Optional[FitnessFunction] = None,
    input_perm: bool = True,
    output_perm: bool = True,
    swarm_size: int = 15,
    n_steps: int = 5,
    s_crossover: float = 0.4,
    p_crossover: float = 0.3,
    pso_mutation: float = 0.2,
    full_reduce: bool = True,
    **kwargs,
) -> Tuple[List[CNOT_tracker], List[List[int]], int]:
    """
    Applies architecture-aware Gaussian elimination to multiple matrices,
    sharing the optimization passes when using ParticleSwarmOptimization modes.

    :param matrix: List of matrices to do gaussian elimination over
    :param mode: Elimination mode to use
    :param architecture: Architecture to take into account
    :param fitness_func: Optional fitness function to use
    :param input_perm: Allow input permutation
    :param output_perm: Whether the location of the output qubits can be
        different for the input location. Qubit locations can be optimized with
        pso.
    :param swarm_size: Swarm size for the swarm optimization.
    :param n_steps: The number of iterations for the particle swarm optimization.
    :param s_crossover: The crossover percentage with the best particle in the swarm for the particle swarm optimizer. Must be between 0.0 and 1.0.
    :param p_crossover: The crossover percentage with the personal best of a particle for the particle swarm optimizer. Must be between 0.0 and 1.0.
    :param pso_mutation: The mutation percentage of a particle for the particle swarm optimizer. Must be between 0.0 and 1.0.
    :param full_reduce: Fully reduce the matrices
    :return: List of CNOT trackers corresponding to the eliminations, list of
        final permutations for each matrix, and the cost of the eliminations.
    """
    n_qubits = len(matrices[0].data)
    kwargs["full_reduce"] = full_reduce
    circuits: List[CNOT_tracker]
    permutations: List[List[int]] = []
    # print(mode)
    # print(*matrices, sep="\n\n")
    if mode in basic_elim_modes or mode is None:
        circuits = [CNOT_tracker(n_qubits) for _ in matrices]
        permutations = [list(range(n_qubits)) for _ in range(len(matrices) + 1)]
        for i, m in enumerate(matrices):
            gauss(mode, m, architecture=architecture, y=circuits[i], **kwargs)
    elif mode in genetic_elim_modes:
        col = input_perm
        if mode == ElimMode.GENETIC_GAUSS_MODE:
            new_mode = ElimMode.GAUSS_MODE
        else:
            new_mode = ElimMode.STEINER_MODE
        row = True
        circuits = []
        permutations = []
        current_perm = list(range(n_qubits))
        if not col:
            permutations.append(
                current_perm
            )  # Add initial permutation if it is not optimized
        for i, m in enumerate(matrices):
            # Adjust matrix according to current input perm.
            m = Mat2([[row[r] for r in current_perm] for row in m.data])
            if i == len(matrices) - 1:
                row = output_perm  # Last permutation is only optimized if the output qubit locations are flexible.
            perm, circuit, _ = permuted_gauss(
                m,
                new_mode,
                architecture=architecture,
                fitness_func=fitness_func,
                row=row,
                col=col,
                **kwargs,
            )
            # if not col and not row:
            #    perm = current_perm
            circuits.append(circuit)  # type: ignore # Store the extracted circuit
            # Update the new permutation
            current_perm = list(perm)  # type: ignore
            if col:
                permutations.append(current_perm)  # Add optimized initial permutation
                if not row:
                    current_perm = list(range(n_qubits))
            permutations.append(current_perm)  # Store the obtained permutation
            col = False  # Subsequent initial permutations are determined by the previous output permutation.
        # input("current perm - should be [0..] ")
    else:  # pso modes
        if mode == ElimMode.PSO_STEINER_MODE:
            new_mode = ElimMode.GENETIC_STEINER_MODE
        else:
            new_mode = ElimMode.GENETIC_GAUSS_MODE
        if not input_perm or not output_perm:
            # You cannot do subsequent passes to optimize the permutation, so pso is useless.
            return sequential_gauss(
                matrices,
                new_mode,
                architecture=architecture,
                fitness_func=fitness_func,
                input_perm=input_perm,
                output_perm=output_perm,
                **kwargs,
            )

        step_func = StepFunction(
            matrices, new_mode, architecture, fitness_func, **kwargs
        )
        optimizer = ParticleSwarmOptimization(
            swarm_size=swarm_size,
            step_func=step_func,
            s_best_crossover=s_crossover,
            p_best_crossover=p_crossover,
            mutation=pso_mutation,
        )
        best_solution = optimizer.find_optimum(
            architecture.n_qubits if architecture is not None else n_qubits,
            n_steps,
            quiet=True,
        )
        circuits, permutations = best_solution  # type: ignore # Assumes the PSO never returns None
    return (
        circuits,
        permutations,
        sum([c.cnot_depth() * 10000 + c.count_cnots() for c in circuits]),
    )

class StepFunction:
    """
    A step function for the PSO algorithm.
    """

    def __init__(self, matrices, mode, architecture, fitness_func, **kwargs):
        self.matrices = matrices
        self.mode = mode
        self.architecture = architecture
        self.fitness_func = fitness_func
        self.kwargs = kwargs
        self.rev_matrices = [
            Mat2(np.asarray(m.data).T.tolist()) for m in reversed(matrices)
        ]  # Reverse and transpose the parity matrices to create the reversed equivalent sequence

    def __call__(self, initial_perm):
        matrices = self.matrices
        new_mode = self.mode
        architecture = self.architecture
        fitness_func = self.fitness_func
        rev_matrices = self.rev_matrices
        kwargs = self.kwargs
        # Apply the original qubit placement
        ms = [
            Mat2([[row[i] for i in initial_perm] for row in m.data])
            if j == 0
            else Mat2([r for r in m.data])
            for j, m in enumerate(matrices)
        ]
        # Optimize the sequence
        circs, perms, score = sequential_gauss(
            ms,
            new_mode,
            architecture=architecture,
            fitness_func=fitness_func,
            input_perm=False,
            output_perm=True,
            **kwargs,
        )
        # Resulting permutation is the initial permutation of the reverse pass
        perms[0] = initial_perm
        ms = [
            Mat2([[row[i] for i in perms[-1]] for row in m.data])
            if j == 0
            else Mat2([r for r in m.data])
            for j, m in enumerate(rev_matrices)
        ]
        # Optimize the reverse sequences.
        _, new_perms, _ = sequential_gauss(
            ms,
            new_mode,
            architecture=architecture,
            fitness_func=fitness_func,
            input_perm=False,
            output_perm=True,
            **kwargs,
        )
        # New initial placement is the final placement of the reverse pass.
        # new_perms[0] = perms[-1]
        return new_perms[-1], (circs, perms), score
