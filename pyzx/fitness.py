from pyzx.parity_maps import CNOT_tracker
from pyzx.linalg import Mat2

import numpy as np

def get_gate_count_fitness_func(mode, matrix, architecture, row=True, col=True, full_reduce=True):
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
    from pyzx.steiner_tree import gauss #Circular dependency
    matrix = matrix.data
    n_qubits = matrix.shape[0]

    def fitness_func(permutation):
        e = np.arange(len(permutation))
        row_perm = permutation if row else e
        col_perm = permutation if col else e
        circuit = CNOT_tracker(n_qubits)
        mat = Mat2(np.copy(matrix[row_perm][:, col_perm]))
        gauss(mode, mat, architecture=architecture, x=circuit, full_reduce=full_reduce)
        return circuit.count_cnots()

    return fitness_func
