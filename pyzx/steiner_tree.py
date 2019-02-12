import sys
sys.path.append('../')
from pyzx.graph.graph import  Graph
from pyzx.linalg import Mat2, column_optimal_swap
from pyzx.generate import cnots as generate_cnots
from pyzx.circuit import Circuit as PyzxCircuit
from pyzx.machine_learning import GeneticAlgorithm
#from pyzx.graph.base import BaseGraph # TODO fix the right graph import - one of many - right backend etc
import numpy as np

from pyquil import Program, get_qc
from pyquil.gates import *
from pyquil.quil import Pragma

from scipy.stats import describe

debug = False

class Architecture():

    def __init__(self, graph=None, adjacency_matrix=None, backend=None):
        """
        Class that represents the architecture of the qubits to be taken into account when routing.
        
        :param graph: a PyZX Graph representing the architecture, optional 
        :param adjacency_matrix: a 2D numpy array representing the adjacency of the qubits, from which the Graph is created, optional
        :param backend: The PyZX Graph backend to be used when creating it from the adjacency matrix, optional
        """
        if graph is None:
            self.graph = Graph(backend=backend)
        else:
            self.graph = graph

        if adjacency_matrix is not None:
            # build the architecture graph
            n = adjacency_matrix.shape[0]
            self.vertices = self.graph.add_vertices(n)
            edges = [(self.vertices[row], self.vertices[col]) for row in range(n) for col in range(n) if adjacency_matrix[row, col] == 1]
            self.graph.add_edges(edges)
        else:
            self.vertices = [v for v in self.graph.vertices()]
        self.pre_calc_distances()
        self.qubit_map = [i for i,v in enumerate(self.vertices)]

    def pre_calc_distances(self):
        self.distances = {"upper": [self.FloydWarshall(until, upper=True) for until, v in enumerate(self.vertices)],
                          "full": [self.FloydWarshall(until, upper=False) for until, v in enumerate(self.vertices)]}

    def FloydWarshall(self, exclude_excl, upper=True):
        """
        Implementation of the Floyd-Warshall algorithm to calculate the all-pair distances in a given graph
        
        :param exclude_excl: index up to which qubit should be excluded from the distances
        :param upper: whether use bidirectional edges or only ordered edges (src, tgt) such that src > tgt, default True
        :return: a dict with for each pair of qubits in the graph, a tuple with their distance and the corresponding shortest path
        """
        # https://en.wikipedia.org/wiki/Floyd%E2%80%93Warshall_algorithm
        distances = {}
        vertices = self.vertices[exclude_excl:] if upper else self.vertices[:exclude_excl + 1]
        for edge in self.graph.edges():
            src, tgt = self.graph.edge_st(edge)
            if src in vertices and tgt in vertices:
                if upper:
                    distances[(src, tgt)] = (1, [(src, tgt)])
                    distances[(tgt, src)] = (1, [(tgt, src)])
                elif src > tgt:
                    distances[(src, tgt)] = (1, [(src, tgt)])
                else:
                    distances[(tgt, src)] = (1, [(tgt, src)])
        for v in vertices:
            distances[(v, v)] = (0, [])
        for i, v0 in enumerate(vertices):
            for j, v1 in enumerate(vertices if upper else vertices[:i+1]):
                for v2 in vertices if upper else vertices[: i+j+1]:
                    if (v0, v1) in distances.keys():
                        if (v1, v2) in distances.keys():
                            if (v0, v2) not in distances.keys() or distances[(v0,v2)][0] > distances[(v0, v1)][0] + distances[(v1, v2)][0]:
                                distances[(v0, v2)] = (distances[(v0, v1)][0] + distances[(v1, v2)][0], distances[(v0, v1)][1] + distances[(v1, v2)][1])
        return distances

    def steiner_tree(self, start, nodes, upper=True):
        """
        Approximates the steiner tree given the architecture, a root qubit and the other qubits that should be present.
        This is done using the pre-calculated all-pairs shortest distance and Prim's algorithm for creating a minimum spanning tree
        :param start: The index of the root qubit to be used
        :param nodes: The indices of the other qubits that should be present in the steiner tree
        :param upper: Whether the steiner tree is used for creating an upper triangular matrix or a full reduction.
        :yields: First yields all edges from the tree top-to-bottom, finished with None, then yields all edges from the tree bottom-up, finished with None.
        """
        # Approximated by calculating the all-pairs shortest paths and then solving the mininum spanning tree over the subset of vertices and their respective shortest paths.
        # https://en.wikipedia.org/wiki/Steiner_tree_problem#Approximating_the_Steiner_tree

        # The all-pairs shortest paths are pre-calculated and the mimimum spanning tree is solved with Prim's algorithm
        # https://en.wikipedia.org/wiki/Prim%27s_algorithm

        # returns an iterator that walks the steiner tree, yielding (adj_node, leaf) pairs. If the walk is finished, it yields None
        state = [start, [n for n in nodes]]
        root = start
        # TODO deal with qubit mapping
        vertices = [root]
        edges = []
        debug and print(root, upper, nodes)
        distances = self.distances["upper"][root] if upper else self.distances["full"][root]
        steiner_pnts = []
        while nodes != []:
            options = [(node, v, *distances[(v, node)]) for node in nodes for v in (vertices + steiner_pnts) if (v, node) in distances.keys()]
            best_option = min(options, key=lambda x: x[2])
            debug and print("Adding to tree: vertex ",best_option[0], "Edges ", best_option[3])
            vertices.append(best_option[0])
            edges.extend(best_option[3])
            steiner = [v for edge in best_option[3] for v in edge if v not in vertices]
            debug and print(steiner)
            steiner_pnts.extend(steiner)
            nodes.remove(best_option[0])
        edges = set(edges) # remove duplicates
        if debug:
            print("edges:", edges)
            print("nodes:", vertices)
            print("steiner points:", steiner_pnts)
        # First go through the tree to find and remove zeros
        state += [[e for e in edges], [v for v in vertices], [s for s in steiner_pnts]]
        vs = {root}
        n_edges = len(edges)
        yielded_edges = set()
        debug_count = 0
        yield_count = 0
        warning = 0
        while len(yielded_edges) < n_edges:
            es = [e for e in edges for v in vs if e[0] == v]
            old_vs = [v for v in vs]
            yielded = False
            for edge in es:
                yield edge
                vs.add(edge[1])
                if edge in yielded_edges:
                    print("DOUBLE yielding! - should not be possible!")
                yielded_edges.add(edge)
                yielded = True
                yield_count += 1
            [vs.remove(v) for v in old_vs]
            if not yielded:
                debug and print("leaf!")
                debug_count += 1
                if debug_count > len(vertices):
                    print("infinite loop!", warning)
                    warning += 1
            if yield_count > len(edges):
                print("Yielded more edges than existing... This should not be possible!", warning)
                warning += 1
            if warning > 5:
                print(state, yielded_edges)
                #input("note it down")
                break
        yield None
        # Walk the tree bottom up to remove all ones.
        yield_count = 0
        while len(edges) > 0:
            # find leaf nodes:
            debug and print(vertices, steiner_pnts, edges)
            vs_to_consider = [vertex for vertex in vertices if vertex not in [e0 for e0, e1 in edges]] + \
                             [vertex for vertex in steiner_pnts if vertex not in [e0 for e0,e1 in edges]]
            yielded = False
            for v in vs_to_consider:
                # Get the edge that is connected to this leaf node
                for edge in [e for e in edges if e[1] == v]:
                    yield edge
                    edges.remove(edge)
                    yielded = True
                    yield_count += 1
                    #yield map(lambda i: self.qubit_map[i], edge)
            if not yielded:
                print("Infinite loop!", warning)
                warning += 1
            if yield_count > n_edges:
                print("Yielded more edges than existing again... This should not be possible!!", warning)
                warning += 1
            if warning > 10:
                print(state, edges, yield_count)
                #input("Note it down!")
                break
        yield None

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

def gauss(mode, matrix, architecture, **kwargs):
    if mode == "GAUSS":
        return matrix.gauss(**kwargs)
    elif mode == "STEINER":
        return steiner_gauss(matrix, architecture, **kwargs)


def steiner_tree_main():
    """
    Small test script to test the steiner_gauss
    :return: 
    """
    arch = create_9x9_square_architecture()
    # Test the architecture creation
    print("Distances")
    for mode in ["upper", "full"]:
        for i, dist_dict in enumerate(arch.distances[mode]):
            print(mode, i)
            for k,v in dist_dict.items():
                print(k, ":", v[0], v[1])
    # Test the steiner tree creation
    print("Steiner tree")
    gen = arch.steiner_tree(2, [2,5,7], upper=True)
    print("top -> bottom")
    next_node = next(gen)
    while next_node is not None:
        print(next_node)
        v1, v2 = next_node
        next_node = next(gen)
    # second run
    print("bottom -> top")
    next_node = next(gen)
    while next_node is not None:
        print(next_node)
        v1, v2 = next_node
        next_node = next(gen)

    # Create a random matrix
    print("-- matrix generation")
    test_mat = build_random_parity_map(9, 10)

    # Reduce it with the different methods
    for mode in ["GAUSS", "STEINER"]:
        print("-- matrix decomposition", mode)
        for full_reduce in [False, True]:
            matrix = Mat2(np.copy(test_mat))
            rank = gauss(mode, matrix, architecture=arch, full_reduce=full_reduce)
            print(rank)
            print(matrix.data)


class PyQuilCircuit():

    def __init__(self, architecture):
        """
        Class to represent a PyQuil program to run on/be compiled for the given architecture
        Currently, it assumes the architecture given by create_9x9_square_architecture()
        
        :param architecture: The Architecture object to adhere to
        """
        self.qc = get_qc('9q-square-qvm')
        self.program = Program()
        self.mapping = [0,1,2,5,4,3,6,7,8]
        self.n_cnots = 0
        self.retries = 0
        self.max_retries = 5
        self.matrix = Mat2(np.identity(9))

    def row_add(self, q0, q1):
        """
        Adds a CNOT gate between the given qubit indices q0 and q1
        :param q0: 
        :param q1: 
        """
        self.program += CNOT(self.mapping[q0], self.mapping[q1])
        self.n_cnots += 1
        self.matrix.row_add(q0, q1)

    def compile(self):
        """
        Compiles the circuit/program for created quantum computer
        :return: A string that describes the compiled program in quil
        """
        try:
            ep = self.qc.compile(self.program)
            self.retries = 0
            return ep.program
        except KeyError as e:
            print('Oops, retrying to compile.')
            if self.retries < self.max_retries:
                self.retries += 1
                return self.compile()
            else:
                raise e

def build_random_parity_map(qubits, depth, circuit=None):
    """
    Builds a random parity map.
    
    :param qubits: The number of qubits that participate in the parity map
    :param depth: The number of CNOTs in the parity map
    :param circuit: A (list of) circuit object(s) that implements a row_add() method to add the generated CNOT gates
    :return: a 2D numpy array that represents the parity map.
    """
    if circuit is None:
        circuit = []
    if not isinstance(circuit, list):
        circuit = [circuit]
    g = generate_cnots(qubits=qubits, depth=depth)
    c = PyzxCircuit.from_graph(g)
    matrix = Mat2(np.identity(qubits))
    for gate in c.gates:
        matrix.row_add(gate.control, gate.target)
        for c in circuit:
            c.row_add(gate.control, gate.target)
    return matrix.data

def swap(l, i, j):
    """
    Swaps the elements in index i and j of list l
    :param l: the list
    :param i: one index
    :param j: another index
    :return: the list with swapped elements
    """
    _ = l[i]
    l[i] = l[j]
    l[j] = _
    return l

def colored_print(np_array):
    """
    Prints a 9x9 numpy array with colors representing their distance in a 9x9 square architecture
    :param np_array:  the array
    """
    CRED = '\033[91m '
    CEND = '\033[0m '
    CGREEN = '\33[32m '
    CYELLOW = '\33[33m '
    CBLUE = '\33[34m '
    CWHITE = '\33[37m '
    CVIOLET = '\33[35m '
    color = [CBLUE, CGREEN, CVIOLET, CYELLOW, CRED]
    layout = [[0,1,2,3,2,1,2,3,4],
              [1,0,1,2,1,2,3,2,3],
              [2,1,0,1,2,3,4,3,2],
              [3,2,1,0,1,2,3,2,1],
              [2,1,2,1,0,1,2,1,2],
              [1,2,3,2,1,0,1,2,3],
              [2,3,4,3,2,1,0,1,2],
              [3,2,3,2,1,2,1,0,1],
              [4,3,2,1,2,3,2,1,0]]
    for i, l in enumerate(layout):
        print('[', ', '.join([(color[c] + '1' if v ==1 else CWHITE + '0') for c, v in zip(l, np_array[i])]), CEND, ']')

def quick_reorder(matrix, architecture):
    """
    Uses heuristics to reorder the matrix such that it better fits the architecture of a quantum computer
    :param matrix: The matrix
    :param architecture: The architecture
    :return: The rewiring before and after the calculation. Represented in the matrix as row and column reordering, respectively.
    """
    verbose = False
    in_qubits, out_qubits = matrix.shape
    expected_order = [i for i in range(in_qubits)]
    new_order = [i for i in range(matrix.shape[1])]
    # remove 0 on the diagonal
    for i in range(min(in_qubits, out_qubits)):
        if matrix[expected_order][:, new_order][i][i] == 0:
            new_i = [j for j,v in enumerate(matrix[expected_order][:, new_order][i, :]) if v==1][0]
            swap(new_order, i, new_i)

    verbose and print('all 1 diagonal')
    verbose and colored_print(matrix[expected_order][:, new_order])
    # move identity row-columns - unused qubits
    pivot = min(in_qubits, out_qubits) - 1
    identities = []
    for i in reversed(range(min(in_qubits, out_qubits))):
        if sum(matrix[expected_order][:, new_order][i, :]) == 1 and sum(matrix[expected_order][:, new_order][:, i]) == 1:
            swap(expected_order, i, pivot)
            swap(new_order, i, pivot)
            pivot -= 1
            identities += [i]
    verbose and print('identity out')
    verbose and print(expected_order, new_order, identities)
    cnots = []
    # identify single CNOT and move closer - creates smaller steiner trees
    for i in range(pivot + 1):
        verbose and colored_print(matrix[expected_order][:, new_order])
        col = matrix[expected_order][:, new_order][:, i]
        rows = [j for j in range(len(col)) if col[j]==1 and j != i]
        upper_distances = [(v[0], k[1]) for k, v in architecture.distances['upper'][i].items() if k[0] == i and k[1] != i]
        full_distances = [(v[0], k[1]) for k,v in architecture.distances['full'][i].items() if k[0]==i and k[1] != i]
        all_distances = upper_distances + full_distances
        all_distances.sort(key=lambda x:x[0])
        skipped = []
        r = 0
        verbose and print(i, rows)
        while r < min(len(rows), 2):
            row = rows[r]
            if row in skipped:
                r += 1
            else:
                _, new_row = all_distances.pop(0)
                if new_row in rows:
                    skipped.append(new_row)
                elif new_row < out_qubits - len(identities):
                    if new_row > 0 or sum(matrix[expected_order][:, new_order][:, new_row]) == 1:
                        swap(expected_order, row, new_row)
                        swap(new_order, row, new_row)
                        cnots += [(i, row, new_row)]
                        verbose and print(i, row, new_row)
                        r += 1
                    else:
                        verbose and print(matrix[expected_order][:, new_order])
                else:
                    verbose and print('not', new_row)
    verbose and print(expected_order, new_order, cnots)
    verbose and colored_print(matrix[expected_order][:, new_order])
    verbose and input('press enter')
    return expected_order, new_order

def create_9x9_square_architecture(**kwargs):
    m = np.array([
        [0, 1, 0, 0, 0, 1, 0, 0, 0],
        [1, 0, 1, 0, 1, 0, 0, 0, 0],
        [0, 1, 0, 1, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 1, 0, 0, 0, 1],
        [0, 1, 0, 1, 0, 1, 0, 1, 0],
        [1, 0, 0, 0, 1, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 1, 0, 1, 0],
        [0, 0, 0, 0, 0, 0, 1, 0, 1],
        [0, 0, 0, 1, 0, 0, 0, 1, 0]
    ])
    return Architecture(adjacency_matrix=m, **kwargs)

def create_fully_connected_architecture(size, **kwargs):
    m = np.ones(shape=size)
    for i in range(min(*size)):
        m[i][i] = 0
    return Architecture(adjacency_matrix=m, **kwargs)

def get_steiner_fitness(matrix, architecture):
    def fitness_func(permutation):
        circuit = PyQuilCircuit(architecture)
        mat = Mat2(np.copy(matrix[permutation][:, permutation]))
        steiner_gauss(mat, architecture=architecture, x=circuit, full_reduce=True)
        return circuit.n_cnots
    return fitness_func

def pyquil_main():
    arch = create_9x9_square_architecture()
    n_compile = 10
    n_maps = 10
    pause = input("Pause every map? [y|N]") == 'y'
    for depth in [3, 10, 20, 30, 40, 50][2:4]:
        pyquil_gates = []
        gates = []
        gates2 = []
        ord_gates = []
        stolen_gates = []
        genetic_gates = []

        pyquil_gates_circuit = []
        gates_circuit = []
        gates2_circuit = []
        for i in range(n_maps):
            pyquil_circuit = PyQuilCircuit(arch)
            test_mat = build_random_parity_map(9, depth, pyquil_circuit)
            print('')
            colored_print(test_mat)
            expected_order, new_order = quick_reorder(test_mat, arch)
            print(expected_order, new_order)
            reordered_mat = test_mat[expected_order][:, new_order]
            colored_print(reordered_mat)

            print('No decomposition')
            pyquil_gates_circuit.append(len([x for x in pyquil_circuit.program.instructions if hasattr(x, 'name') and x.name=='CNOT']))
            best_rewiring = 10000
            best_program = ""
            for _ in range(n_compile):
                print(_, sep=" ", end=' ', flush=True)
                compiled_program = pyquil_circuit.compile()
                n_gates = len(compiled_program.split('CZ'))-1
                #print(len(pyquil_circuit2.compile().split('CZ'))-1, n_gates)
                pyquil_gates.append(n_gates)
                if n_gates < best_rewiring:
                    best_rewiring = n_gates
                    best_program = compiled_program
            #print(best_program)

            print('\nOriginal decomposition')
            circuit = PyQuilCircuit(arch)
            matrix = Mat2(np.copy(test_mat))
            matrix.gauss(full_reduce=True, x=circuit)
            gates_circuit.append(len([x for x in circuit.program.instructions if x.name=='CNOT']))
            for _ in range(n_compile):
                print(_, sep=" ", end=' ', flush=True)
                compiled_program = circuit.compile()
                gates.append(len(compiled_program.split('CZ'))-1)

            print('\nSteiner decomposition')
            circuit2 = PyQuilCircuit(arch)
            matrix2 = Mat2(np.copy(test_mat))
            steiner_gauss(matrix2, architecture=arch, x=circuit2, full_reduce=True)
            gates2_circuit.append(len([x for x in circuit2.program.instructions if x.name == 'CNOT']))
            for _ in range(1):
                print(_, sep=" ", end=' ', flush=True)
                compiled_program2 = circuit2.compile()
                gates2.append(len(compiled_program2.split('CZ'))-1)
            print('\nOrdered steiner')
            circuit3 = PyQuilCircuit(arch)
            matrix3 = Mat2(np.copy(reordered_mat))
            steiner_gauss(matrix3, architecture=arch, x=circuit3, full_reduce=True)
            ord_gates.append(len([x for x in circuit3.program.instructions if x.name == 'CNOT']))

            print('\nGenetic ordered steiner')
            circuit4 = PyQuilCircuit(arch)
            population = 50
            crossover_prob = 0.8
            mutate_prob = 0.2
            n_iter = 100
            optimizer = GeneticAlgorithm(population, crossover_prob, mutate_prob, get_steiner_fitness(test_mat, arch))
            best_permutation = optimizer.find_optimimum(9, n_iter)
            print(best_permutation)
            gen_mat = test_mat[best_permutation][:, best_permutation]
            colored_print(gen_mat)
            matrix4 = Mat2(np.copy(gen_mat))
            steiner_gauss(matrix4, architecture=arch, x=circuit4, full_reduce=True)
            genetic_gates.append(circuit4.n_cnots)

            print('\nStolen ordered steiner')
            circuit3 = PyQuilCircuit(arch)
            expected_order = [int(x) for x in best_program.split("REWIRING")[1][4:21].split(" ")]
            new_order = [int(x) for x in best_program.split("REWIRING")[2][4:21].split(" ")]
            reordered_mat = test_mat[expected_order][:, new_order]
            #print(expected_order, new_order)
            #colored_print(reordered_mat)
            expected_order = [expected_order.index(i) for i in range(len(expected_order))]
            new_order = [new_order.index(i) for i in range(len(new_order))]
            reordered_mat = test_mat[expected_order][:, new_order]
            #print(expected_order, new_order)
            #colored_print(reordered_mat)

            expected_order, new_order = quick_reorder(reordered_mat, arch)
            reordered_mat = reordered_mat[expected_order][:, new_order]
            #print(expected_order, new_order)
            #colored_print(reordered_mat)
            matrix3 = Mat2(np.copy(reordered_mat))
            steiner_gauss(matrix3, architecture=arch, x=circuit3, full_reduce=True)
            stolen_gates.append(len([x for x in circuit3.program.instructions if x.name == 'CNOT']))
            if pause:
                print(ord_gates[-1], pyquil_gates[-n_compile:], gates2_circuit[-1], gates[-n_compile:], genetic_gates[-1])
                input('press enter')

        print('\n\nResults for depth:', depth)

        print('No decomposition')
        print('\tOriginal instruction count:', describe(pyquil_gates_circuit))
        print('\tCompiled:', describe(pyquil_gates))
        print('Original decomposition')
        print('\tOriginal instruction count:', describe(gates_circuit))
        print('\tCompiled:', describe(gates))
        print('Steiner decomposition')
        print('\tOriginal instruction count:', describe(gates2_circuit))
        print('\tCompiled:', describe(gates2))
        print('Ordered steiner')
        print('\tcount:', describe(ord_gates))
        print('Genetic Ordered steiner')
        print('\tcount:', describe(genetic_gates))
        print('Stolen order with steiner')
        print('\tcount:', describe(stolen_gates))
        input('press enter')

if __name__ == '__main__':
    mode = "quil"
    if mode == "quil":
        pyquil_main()
    elif mode == "test":
        steiner_tree_main()

