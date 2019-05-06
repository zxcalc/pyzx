
from pyzx.graph.graph import  Graph
#from pyzx.graph.base import BaseGraph # TODO fix the right graph import - one of many - right backend etc
import numpy as np

from pyquil import Program, get_qc
from pyquil.gates import *

debug = False

class Architecture():

    def __init__(self, graph=None, adjacency_matrix=None, backend=None):
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
        # https://en.wikipedia.org/wiki/Floyd%E2%80%93Warshall_algorithm
        self.distances = {"upper": [self.FloydWarshall(until, upper=True) for until, v in enumerate(self.vertices)],
                          "full": [self.FloydWarshall(until, upper=False) for until, v in enumerate(self.vertices)]}

    def FloydWarshall(self, exclude_excl, upper=True):
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
        # Approximated by calculating the all-pairs shortest paths and then solving the mininum spanning tree over the subset of vertices and their respective shortest paths.
        # https://en.wikipedia.org/wiki/Steiner_tree_problem#Approximating_the_Steiner_tree

        # The all-pairs shortest paths are pre-calculated and the mimimum spanning tree is solved with Prim's algorithm
        # https://en.wikipedia.org/wiki/Prim%27s_algorithm

        # returns an iterator that walks the steiner tree, yielding (adj_node, leaf) pairs. If the walk is finished, it yields None
        root = start
        # TODO deal with qubit mapping
        #root = self.qubit_map.index(start)
        #nodes = [self.qubit_map.index(node) for node in nodes]
        vertices = [root]
        edges = []
        #mode = "forward" if upper else "backward"
        debug and print(root, upper, nodes)
        distances = self.distances["upper"][root] if upper else self.distances["full"][root]
        while nodes != []:
            options = [(node, v, *distances[(v, node)]) for node in nodes for v in vertices if (v, node) in distances.keys()]
            best_option = min(options, key=lambda x: x[2])
            vertices.append(best_option[0])
            edges.extend(best_option[3])
            nodes.remove(best_option[0])
        edges = set(edges)
        steiner_pnts = list(set([i for edge in edges for i in edge if i not in vertices]))
        if debug:
            print("edges:", edges)
            print("nodes:", vertices)
            print("steiner points:", steiner_pnts)
        # First go through the tree to find and remove zeros
        vs = {root}
        while len(vs) > 0:
            es = [e for e in edges for v in vs if e[0] == v]
            old_vs = [v for v in vs]
            for edge in es:
                yield edge
                vs.add(edge[1])
            [vs.remove(v) for v in old_vs]
        yield None
        # Walk the tree bottom up to remove all ones.
        while len(edges) > 0:
            # find leaf nodes:
            debug and print(vertices, steiner_pnts, edges)
            vs_to_consider = [vertex for vertex in vertices if vertex not in [e0 for e0, e1 in edges]] + \
                             [vertex for vertex in steiner_pnts if vertex not in [e0 for e0,e1 in edges]]
            for v in vs_to_consider:
                # Get the edge that is connected to this leaf node
                for edge in [e for e in edges if e[1] == v]:
                    yield edge
                    edges.remove(edge)
                    #yield map(lambda i: self.qubit_map[i], edge)
        yield None

global add_count
def gauss(matrix, architecture, full_reduce=False, x=None, y=None):
    global add_count
    add_count = 0
    def row_add(c0, c1):
        global add_count
        add_count += 1
        matrix.row_add(c0, c1)
        debug and print("Reducing", c0, c1)
        if x != None: x.row_add(c0, c1)
        if y != None: y.row_add(c1, c0)
    rows = matrix.rows()
    cols = matrix.cols()
    p_cols = []
    def steiner_reduce_upper(col, root, nodes):
        steiner_tree = architecture.steiner_tree(root, nodes, True)
        # Remove all zeros
        next_check = next(steiner_tree)
        debug and print("Step 1: remove zeros")
        zeros = []
        while next_check is not None:
            s0, s1 = next_check
            if matrix.data[s0, col] == 0:  # s1 is a new steiner point or root = 0
                zeros.append(next_check)
            next_check = next(steiner_tree)
        while zeros != []:
            s0, s1 = zeros.pop(-1)
            if matrix.data[s0, col] == 0:
                row_add(s1, s0)
                debug and print(matrix.data[s0, col], matrix.data[s1, col])
        # Reduce stuff
        debug and print("Step 2: remove ones")
        next_add = next(steiner_tree)
        while next_add is not None:
            s0, s1 = next_add
            row_add(s0, s1)
            debug and print("next")
            next_add = next(steiner_tree)
            debug and print(next_add)
        debug and print("Step 3: profit")

    def steiner_reduce_full(col, root, nodes):
        steiner_tree = architecture.steiner_tree(root, nodes, False)
        # Remove all zeros
        next_check = next(steiner_tree)
        debug and print("deal with zero root")
        if next_check is not None and matrix.data[next_check[0], col] == 0: #root is zero
            print("WARNING : Root is 0 => reducing non-pivot column", matrix.data)
        debug and print("Step 1: remove zeros", matrix.data[:,c])
        while next_check is not None:
            s0, s1 = next_check
            if matrix.data[s1, col] == 0:  # s1 is a new steiner point
                row_add(s0, s1)
            next_check = next(steiner_tree)
        # Reduce stuff
        debug and print("Step 2: remove ones", matrix.data[:,c])
        next_add = next(steiner_tree)
        while next_add is not None:
            s0, s1 = next_add
            row_add(s0, s1)
            next_add = next(steiner_tree)
        debug and print("Step 3: profit", matrix.data[:,c])
    pivot = 0
    for c in range(cols):
        nodes = [r for r in range(pivot, rows) if pivot==r or matrix.data[r][c] == 1]
        steiner_reduce_upper(c, pivot, nodes)
        if matrix.data[pivot][c] == 1:
            p_cols.append(c)
            pivot += 1
    print("Upper triangle form", matrix.data)
    rank = pivot
    debug and print(p_cols)
    if full_reduce:
        pivot -= 1
        for c in reversed(p_cols):
            debug and print(pivot, matrix.data[:,c])
            nodes = {r for r in range(0, pivot+1) if r==pivot or matrix.data[r][c] == 1}
            if len(nodes) > 1:
                steiner_reduce_full(c, pivot, list(nodes))
            pivot -= 1
            #[steiner_reduce_full(*n) for n in nodes]
            #steiner_reduce(c, nodes, False)
    print("ADD COUNT:", add_count)
    return rank



def steiner_tree_main():
    debug = False
    # small test script to see if the code works as intended
    #m = np.array([[0,1,0,1], [1, 0, 1, 0], [0,1,0,1], [1, 0, 1, 0]]) # square
    #m = np.array([[0,1, 0,0,0], [1,0,1,0,0], [0,1,0,1,0], [0,0,1,0,1], [0,0,0,1,0]]) # line with 5 points
    m = np.array([
        [0,1,0,0,0,1,0,0,0],
        [1,0,1,0,1,0,0,0,0],
        [0,1,0,1,0,0,0,0,0],
        [0,0,1,0,1,0,0,0,1],
        [0,1,0,1,0,1,0,1,0],
        [1,0,0,0,1,0,1,0,0],
        [0,0,0,0,0,1,0,1,0],
        [0,0,0,0,0,0,1,0,1],
        [0,0,0,1,0,0,0,1,0]
    ])
    #m = np.ones_like(m)
    arch = Architecture(adjacency_matrix=m)
    print("Distances")
    for mode in ["upper", "full"]:
        for i, dist_dict in enumerate(arch.distances[mode]):
            print(mode, i)
            for k,v in dist_dict.items():
                print(k, ":", v[0], v[1])
    print("Steiner tree")
    gen = arch.steiner_tree(1, [2,6])
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

    print("-- matrix generation")
    test_mat = None
    inv = None
    while test_mat is None:
        try:
            test_mat = np.random.randint(low=0, high=2, size=m.shape)
            inv = np.linalg.inv(test_mat)
            u,s,vh = np.linalg.svd(test_mat, full_matrices=True)
        except:
            print("No inverse - try again")
            test_mat = None
    print(test_mat)
    print(inv)
    print("Rank =", np.linalg.matrix_rank(test_mat))
    #print(u)
    #print(s)
    #print(vh)

    print("-- Original matrix decomposition")
    from pyzx.linalg import Mat2
    full_reduce = True
    matrix = Mat2(np.copy(test_mat))
    print(matrix.data)
    rank = matrix.gauss(full_reduce=full_reduce)
    print("rank", rank)
    print(matrix.data)


    print("-- Steiner matrix decomposition")
    matrix = Mat2(np.copy(test_mat))
    print(matrix.data)
    rank = gauss(matrix, arch, full_reduce=full_reduce)
    print("rank", rank)
    print(matrix.data)

    matrix = Mat2(np.copy(test_mat))
    print(len(matrix.to_cnots(True)))

class PyQuilCircuit():

    def __init__(self, architecture):
        self.qc = get_qc('9q-square-qvm')
        self.program = Program()
        self.mapping = [0,1,2,5,4,3,6,7,8]

    def add_row(self, q0, q1):
        self.program += CNOT(self.mapping[q0], self.mapping[q1])

def pyquil_main():
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
    # m = np.ones_like(m)
    arch = Architecture(adjacency_matrix=m)
    test_mat = no.array([[0, 1, 0, 0, 1, 1, 1, 1, 1],
       [1, 0, 0, 1, 1, 0, 0, 1, 0],
       [0, 1, 1, 0, 0, 1, 1, 1, 0],
       [0, 1, 0, 1, 0, 0, 0, 0, 0],
       [0, 1, 0, 1, 0, 1, 1, 0, 1],
       [1, 1, 1, 0, 1, 0, 0, 0, 0],
       [0, 1, 0, 0, 1, 1, 0, 1, 0],
       [1, 0, 0, 0, 1, 0, 0, 0, 0],
       [0, 0, 1, 1, 1, 0, 1, 1, 1]])


if __name__ == '__main__':
    pyquil_main()
