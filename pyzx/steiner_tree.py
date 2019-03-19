import sys
sys.path.append('../')
from pyzx.linalg import Mat2
from pyzx.architecture import create_fully_connected_architecture
from pyzx.parity_maps import CNOT_tracker
from pyzx.machine_learning import GeneticAlgorithm
from pyzx.fitness import get_gate_count_fitness_func as get_fitness_func
import numpy as np
debug = False

# ELIMINATION MODES:
GAUSS_MODE = "gauss"
STEINER_MODE = "steiner"
GENETIC_STEINER_MODE = "genetic_steiner"
GENETIC_GAUSS_MODE = "genetic_gauss"
# COMPILE MODES
QUIL_COMPILER = "quilc"
NO_COMPILER = "not_compiled"


def gauss(mode, matrix, architecture=None, **kwargs):
    """
    Performs gaussian elimination of type mode on Mat2 matrix on the given architecture, if needed.

    :param mode: Type of Gaussian elimination to be used
    :param matrix: Mat2 matrix to run the algorithm on
    :param architecture: Device architecture to take into account [optional]
    :param kwargs: Other arguments that can be given to the Mat2.gauss() function or parameters for the genetic algorithm.
    :return: The rank of the matrix. Mat2 matrix is transformed.
    """
    if mode == GAUSS_MODE:
        return matrix.gauss(**kwargs)
    elif mode == STEINER_MODE:
        if architecture is None:
            print(
                "\033[91m Warning: Architecture is not given, assuming fully connected architecture of size matrix.shape[0]. \033[0m ")
            architecture = create_fully_connected_architecture(matrix.data.shape[0])
        return steiner_gauss(matrix, architecture, **kwargs)
    elif mode == GENETIC_STEINER_MODE:
        perm, cnots, rank = permutated_gauss(matrix, STEINER_MODE, architecture=architecture, **kwargs)
        return rank
    elif mode == GENETIC_GAUSS_MODE:
        perm, cnots, rank = permutated_gauss(matrix, GAUSS_MODE, architecture=architecture, **kwargs)
        return rank

def steiner_gauss(matrix, architecture, full_reduce=False, x=None, y=None):
    """
    Performs Gaussian elimination that is constraint bij the given architecture
    
    :param matrix: PyZX Mat2 matrix to be reduced
    :param architecture: The Architecture object to conform to
    :param full_reduce: Whether to fully reduce or only create an upper triangular form
    :param x: 
    :param y: 
    :return: Rank of the given matrix
    """
    def row_add(c0, c1):
        matrix.row_add(c0, c1)
        debug and print("Reducing", c0, c1)
        if x != None: x.row_add(c0, c1)
        if y != None: y.col_add(c1, c0)
    def steiner_reduce(col, root, nodes, upper):
        steiner_tree = architecture.steiner_tree(root, nodes, upper)
        # Remove all zeros
        next_check = next(steiner_tree)
        debug and print("Step 1: remove zeros")
        if upper:
            zeros = []
            while next_check is not None:
                s0, s1 = next_check
                if matrix.data[s0, col] == 0:  # s1 is a new steiner point or root = 0
                    zeros.append(next_check)
                next_check = next(steiner_tree)
            while len(zeros) > 0:
                s0, s1 = zeros.pop(-1)
                if matrix.data[s0, col] == 0:
                    row_add(s1, s0)
                    debug and print(matrix.data[s0, col], matrix.data[s1, col])
        else:
            debug and print("deal with zero root")
            if next_check is not None and matrix.data[next_check[0], col] == 0:  # root is zero
                print("WARNING : Root is 0 => reducing non-pivot column", matrix.data)
            debug and print("Step 1: remove zeros", matrix.data[:, c])
            while next_check is not None:
                s0, s1 = next_check
                if matrix.data[s1, col] == 0:  # s1 is a new steiner point
                    row_add(s0, s1)
                next_check = next(steiner_tree)
        # Reduce stuff
        debug and print("Step 2: remove ones")
        next_add = next(steiner_tree)
        while next_add is not None:
            s0, s1 = next_add
            row_add(s0, s1)
            next_add = next(steiner_tree)
            debug and print(next_add)
        debug and print("Step 3: profit")

    rows = matrix.rows()
    cols = matrix.cols()
    p_cols = []
    pivot = 0
    for c in range(cols):
        nodes = [r for r in range(pivot, rows) if pivot==r or matrix.data[r][c] == 1]
        steiner_reduce(c, pivot, nodes, True)
        if matrix.data[pivot][c] == 1:
            p_cols.append(c)
            pivot += 1
    debug and print("Upper triangle form", matrix.data)
    rank = pivot
    debug and print(p_cols)
    if full_reduce:
        pivot -= 1
        for c in reversed(p_cols):
            debug and print(pivot, matrix.data[:,c])
            nodes = [r for r in range(0, pivot+1) if r==pivot or matrix.data[r][c] == 1]
            if len(nodes) > 1:
                steiner_reduce(c, pivot, nodes, False)
            pivot -= 1
    return rank

def permutated_gauss(matrix, mode=None, architecture=None, population_size=30, crossover_prob=0.8, mutate_prob=0.2, n_iterations=50,
                     row=True, col=True, full_reduce=True, fitness_func=None, x=None, y=None):
    """
    Finds an optimal permutation of the matrix to reduce the number of CNOT gates.
    
    :param matrix: Mat2 matrix to do gaussian elimination over
    :param population_size: For the genetic algorithm
    :param crossover_prob: For the genetic algorithm
    :param mutate_prob: For the genetic algorithm
    :param n_iterations: For the genetic algorithm
    :param row: If the rows should be permutated
    :param col: If the columns should be permutated
    :param full_reduce: Whether to do full gaussian reduction
    :return: Best permutation found, list of CNOTS corresponding to the elimination.
    """
    if fitness_func is None:
        fitness_func =  get_fitness_func(mode, matrix, architecture, row=row, col=col, full_reduce=full_reduce)
    optimizer = GeneticAlgorithm(population_size, crossover_prob, mutate_prob, fitness_func)
    best_permutation = optimizer.find_optimimum(architecture.n_qubits, n_iterations, continued=True)

    n_qubits=matrix.data.shape[0]
    no_perm = np.arange(len(best_permutation))
    row_perm = best_permutation if row else no_perm
    col_perm = best_permutation if col else no_perm
    if y is None:
        circuit = CNOT_tracker(n_qubits)
    else:
        circuit = y
    mat = Mat2(np.copy(matrix.data[row_perm][:, col_perm]))
    circuit.row_perm = row_perm
    circuit.col_perm = col_perm
    rank = gauss(mode, mat, architecture, x=x, y=circuit, full_reduce=full_reduce)
    return best_permutation, circuit.count_cnots(), rank

def count_cnots_mat2(mode, matrix, compile_mode=None, architecture=None, n_compile=1, store_circuit_as=None, **kwargs):
    if compile_mode == QUIL_COMPILER:
        from pyzx.pyquil_circuit import PyQuilCircuit
        circuit = PyQuilCircuit(architecture)
    else:
        circuit = CNOT_tracker(matrix.data.shape[0])
    mat = Mat2(np.copy(matrix.data))
    gauss(mode, mat, architecture=architecture, y=circuit, **kwargs)
    return count_cnots_circuit(compile_mode, circuit, n_compile, store_circuit_as)

def count_cnots_circuit(mode, circuit, n_compile=1, store_circuit_as=None):
    count = -1
    if mode == QUIL_COMPILER:
        from pyzx.pyquil_circuit import PyQuilCircuit
        if isinstance(circuit, PyQuilCircuit):
            count = sum([circuit.compiled_cnot_count() for i in range(n_compile)])/n_compile
    elif mode == NO_COMPILER:
        count = circuit.count_cnots()
    if store_circuit_as is not None:
        with open(store_circuit_as, 'w') as f:
            f.write(circuit.to_qasm())
    return count

if __name__ == '__main__':
    import argparse
    from pyzx.architecture import architectures, SQUARE_9Q, create_architecture
    from pyzx.parity_maps import CNOT_tracker

    def restricted_float(x):
        x = float(x)
        if x < 0.0 or x > 1.0:
            raise argparse.ArgumentTypeError("%r not in range [0.0, 1.0]." % (x,))
        return x

    parser = argparse.ArgumentParser(description="Compiles a given qasm file to a given architecture.")
    parser.add_argument("QASM_file", help="The QASM file to be routed.")
    parser.add_argument("-m", "--mode", dest="mode", default=STEINER_MODE, help="The mode specifying how to route.", choices=[STEINER_MODE, GAUSS_MODE, GENETIC_STEINER_MODE, GENETIC_GAUSS_MODE])
    parser.add_argument("-a", "--architecture", dest="architecture", default=SQUARE_9Q, choices=architectures, help="Which architecture it should run compile to.")
    #parser.add_argument("-f", "--full_reduce", dest="full_reduce", default=1, type=int, choices=[0,1], help="Full reduce")
    parser.add_argument("--population", default=30, type=int, help="The population size for the genetic algorithm.")
    parser.add_argument("--iterations", default=15, type=int, help="The number of iterations for the genetic algorithm.")
    parser.add_argument("--crossover_prob", default=0.8, type=restricted_float, help="The crossover probability for the genetic algorithm. Must be between 0.0 and 1.0.")
    parser.add_argument("--mutation_prob", default=0.2, type=restricted_float, help="The mutation probability for the genetic algorithm. Must be between 0.0 and 1.0.")
    #parser.add_argument("--perm", default="both", choices=["row", "col", "both"], help="Whether to find a single optimal permutation that permutes the rows, columns or both with the genetic algorithm.")
    parser.add_argument("--destination", default=None, help="Destination file where the compiled circuit should be stored. Prints the compiled QASM if not specified.")

    args = parser.parse_args()
    #print(args)
    circuit = CNOT_tracker.from_qasm_file(args.QASM_file)
    matrix = circuit.matrix
    architecture = create_architecture(args.architecture)
    compiled_circuit = CNOT_tracker(circuit.n_qubits)
    if args.mode in [GAUSS_MODE, STEINER_MODE]:
        rank = gauss(args.mode, matrix, architecture, full_reduce=True, y=compiled_circuit)
    elif args.mode in [GENETIC_GAUSS_MODE, GENETIC_STEINER_MODE]:
        rank = gauss(args.mode, matrix, architecture, full_reduce=True, y=compiled_circuit,
                     population_size=args.population, crossover_prob=args.crossover_prob, mutate_prob=args.mutation_prob,
                     n_iterations=args.iterations)

    print("Compiled circuit has", compiled_circuit.count_cnots(), "CNOT gates.", "\n\n")
    compiled_qasm = compiled_circuit.to_qasm()
    if args.destination is None:
        print(compiled_qasm)
    else:
        with open(args.destination, "w") as f:
            f.write(compiled_qasm)
