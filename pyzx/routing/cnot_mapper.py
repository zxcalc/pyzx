import numpy as np

from enum import Enum
from typing import Optional

from ..linalg import Mat2
from .architecture import (
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
    STEINER_MODE = "steiner"
    GENETIC_STEINER_MODE = "genetic_steiner"
    GENETIC_GAUSS_MODE = "genetic_gauss"
    PSO_GAUSS_MODE = "pso_gauss"
    PSO_STEINER_MODE = "pso_steiner"

    def __str__(self):
        return f"{self.value}"


genetic_elim_modes = [ElimMode.GENETIC_STEINER_MODE, ElimMode.GENETIC_GAUSS_MODE]
pso_elim_modes = [ElimMode.PSO_GAUSS_MODE, ElimMode.PSO_STEINER_MODE]
basic_elim_modes = [ElimMode.STEINER_MODE, ElimMode.GAUSS_MODE]
elim_modes = list(ElimMode)


class CompileMode(Enum):
    """
    Compilation modes for the cnot mapper procedures
    """

    QUIL_COMPILER = "quilc"
    NO_COMPILER = "not_compiled"
    TKET_COMPILER = "tket"

    def __str__(self):
        return f"{self.value}"


class Metric(Enum):
    """
    Metrics for the cnot mapper procedures
    """

    COMBINED_METRIC = "combined"
    DEPTH_METRIC = "depth"
    COUNT_METRIC = "count"

    def __str__(self):
        return f"{self.value}"


def depth_fitness_func(
    mode, matrix, architecture, row=True, col=True, full_reduce=True, **kwargs
):
    metric_func = lambda c: c.cnot_depth()
    return basic_fitness_func(
        Metric.DEPTH_METRIC, mode, matrix, architecture, row, col, full_reduce, **kwargs
    )


def cnot_fitness_func(
    mode, matrix, architecture, row=True, col=True, full_reduce=True, **kwargs
):
    metric_func = lambda c: c.count_cnots()
    return basic_fitness_func(
        Metric.COUNT_METRIC, mode, matrix, architecture, row, col, full_reduce, **kwargs
    )


def combined_fitness_func(
    mode, matrix, architecture, row=True, col=True, full_reduce=True, **kwargs
):
    metric_func = lambda c: c.cnot_depth() * 10000 + c.count_cnots()
    return basic_fitness_func(
        Metric.COMBINED_METRIC,
        mode,
        matrix,
        architecture,
        row,
        col,
        full_reduce,
        **kwargs,
    )


def basic_fitness_func(
    metric_func,
    mode,
    matrix,
    architecture,
    row=True,
    col=True,
    full_reduce=True,
    **kwargs,
):
    """
    Creates and returns a fitness function to be used for the genetic algorithm that uses CNOT gate count as fitness.

    :param mode: The type of Gaussian elimination to be used
    :param matrix: A Mat2 parity map to route.
    :param architecture: The architecture to take into account when routing
    :param row: Whether to find a row permutation
    :param col: Whether to find a column permutation
    :param full_reduce: Whether to fully reduce the matrix, thus rebuild the full circuit.
    :return: A fitness function that calculates the number of gates needed for a given permutation.
    """
    # n_qubits = len(matrix.data)

    # def fitness_func(permutation):
    #    row_perm = permutation if row else np.arange(len(matrix.data))
    #    col_perm = permutation if col else np.arange(len(matrix.data[0]))
    #    circuit = CNOT_tracker(n_qubits)
    #    mat = Mat2([[matrix.data[r][c] for c in col_perm] for r in row_perm])
    #    gauss(mode, mat, architecture=architecture, y=circuit, full_reduce=full_reduce, **kwargs)
    #    return metric_func(circuit)
    fitness_func = FitnessFunction(
        metric_func,
        matrix,
        mode,
        architecture,
        row=row,
        col=col,
        full_reduce=full_reduce,
        **kwargs,
    )
    return fitness_func


class FitnessFunction(object):
    def __init__(
        self,
        metric,
        matrix,
        mode,
        architecture,
        row=True,
        col=True,
        full_reduce=True,
        **kwargs,
    ):
        self.metric = metric
        self.matrix = matrix
        self.mode = mode
        self.architecture = architecture
        self.row = row
        self.col = col
        self.full_reduce = full_reduce
        self.n_qubits = architecture.n_qubits
        self.kwargs = kwargs

    def _make_function(self):
        if self.metric == Metric.COMBINED_METRIC:
            f = lambda c: c.cnot_depth() * 10000 + c.count_cnots()
        elif self.metric == Metric.COUNT_METRIC:
            f = lambda c: c.count_cnots()
        elif self.metric == Metric.DEPTH_METRIC:
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


class StepFunction:
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
            n_threads=1,
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
            n_threads=1,
            **kwargs,
        )
        # New initial placement is the final placement of the reverse pass.
        # new_perms[0] = perms[-1]
        return new_perms[-1], (circs, perms), score


def gauss(
    mode: Optional[ElimMode],
    matrix: Mat2,
    architecture=None,
    permutation=None,
    try_transpose: bool = False,
    **kwargs,
) -> int:
    """
    Performs gaussian elimination of type mode on Mat2 matrix on the given architecture, if needed.

    :param mode: Type of Gaussian elimination to be used
    :param matrix: Mat2 matrix to run the algorithm on
    :param architecture: Device architecture to take into account [optional]
    :param kwargs: Other arguments that can be given to the Mat2.gauss() function or parameters for the genetic algorithm.
    :return: The rank of the matrix. Mat2 matrix is transformed.
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
    matrix,
    mode=None,
    architecture=None,
    population_size=30,
    crossover_prob=0.8,
    mutate_prob=0.2,
    n_iterations=5,
    row=True,
    col=True,
    full_reduce=True,
    fitness_func=None,
    x=None,
    y=None,
    n_threads=None,
    **kwargs,
):
    """
    Finds an optimal permutation of the matrix to reduce the number of CNOT gates.

    :param matrix: Mat2 matrix to do gaussian elimination over
    :param population_size: For the genetic algorithm
    :param crossover_prob: For the genetic algorithm
    :param mutate_prob: For the genetic algorithm
    :param n_iterations: For the genetic algorithm
    :param row: If the rows should be permutedA
    :param col: If the columns should be permuted
    :param full_reduce: Whether to do full gaussian reduction
    :return: Best permutation found, list of CNOTS corresponding to the elimination.
    """
    if row or col:
        if fitness_func is None:
            fitness_func = combined_fitness_func(
                mode,
                matrix,
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
    return best_permutation, circuit, rank


def sequential_gauss(
    matrices,
    mode=None,
    architecture=None,
    fitness_func=None,
    input_perm=True,
    output_perm=True,
    swarm_size=15,
    n_steps=5,
    s_crossover=0.4,
    p_crossover=0.3,
    pso_mutation=0.2,
    n_threads=None,
    full_reduce=True,
    **kwargs,
):
    n_qubits = len(matrices[0].data)
    kwargs["full_reduce"] = full_reduce
    # print(mode)
    # print(*matrices, sep="\n\n")
    if mode in basic_elim_modes or mode is None:
        circuits = [CNOT_tracker(n_qubits) for _ in matrices]
        permutations = [np.arange(n_qubits) for _ in range(len(matrices) + 1)]
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
        current_perm = np.arange(n_qubits)  # [i for i in range(n_qubits)]
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
                n_threads=n_threads,
                **kwargs,
            )
            # if not col and not row:
            #    perm = current_perm
            circuits.append(circuit)  # Store the extracted circuit
            # Update the new permutation
            current_perm = perm
            if col:
                permutations.append(current_perm)  # Add optimized initial permutation
                if not row:
                    current_perm = np.arange(n_qubits)
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
                n_threads=n_threads,
                **kwargs,
            )

        step_func = StepFunction(
            matrices, new_mode, architecture, fitness_func, **kwargs
        )
        optimizer = ParticleSwarmOptimization(
            swarm_size=swarm_size,
            fitness_func=fitness_func,
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
