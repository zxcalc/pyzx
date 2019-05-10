# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2019 - Aleks Kissinger, John van de Wetering,
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

import sys
from ..graph.graph import  Graph
#from pyzx.graph.base import BaseGraph # TODO fix the right graph import - one of many - right backend etc

import numpy as np

SQUARE = "square"
LINE = "line"
FULLY_CONNNECTED = "fully_connected"
CIRCLE = "circle"
IBM_QX2 = "ibm_qx2"
IBM_QX3 = "ibm_qx3"
IBM_QX4 = "ibm_qx4"
IBM_QX5 = "ibm_qx5"
IBM_Q20_TOKYO = "ibm_q20_tokyo"
RIGETTI_16Q_ASPEN = "rigetti_16q_aspen"
RIGETTI_8Q_AGAVE = "rigetti_8q_agave"

architectures = [SQUARE, CIRCLE, FULLY_CONNNECTED, LINE, IBM_QX4, IBM_QX2, IBM_QX3, IBM_QX5, IBM_Q20_TOKYO, RIGETTI_8Q_AGAVE, RIGETTI_16Q_ASPEN]
dynamic_size_architectures = [FULLY_CONNNECTED, LINE, CIRCLE, SQUARE]

debug = False

class Architecture():
    def __init__(self, name, coupling_graph=None, coupling_matrix=None, backend=None):
        """
        Class that represents the architecture of the qubits to be taken into account when routing.

        :param coupling_graph: a PyZX Graph representing the architecture, optional 
        :param coupling_matrix: a 2D numpy array representing the adjacency of the qubits, from which the Graph is created, optional
        :param backend: The PyZX Graph backend to be used when creating it from the adjacency matrix, optional
        """
        self.name = name
        if coupling_graph is None:
            self.graph = Graph(backend=backend)
        else:
            self.graph = coupling_graph

        if coupling_matrix is not None:
            # build the architecture graph
            n = coupling_matrix.shape[0]
            self.vertices = self.graph.add_vertices(n)
            edges = [(self.vertices[row], self.vertices[col]) for row in range(n) for col in range(n) if
                     coupling_matrix[row, col] == 1]
            self.graph.add_edges(edges)
        else:
            self.vertices = [v for v in self.graph.vertices()]
        self.pre_calc_distances()
        self.qubit_map = [i for i, v in enumerate(self.vertices)]
        self.n_qubits = len(self.vertices)

    def pre_calc_distances(self):
        self.distances = {"upper": [self.floyd_warshall(until, upper=True) for until, v in enumerate(self.vertices)],
                          "full": [self.floyd_warshall(until, upper=False) for until, v in enumerate(self.vertices)]}

    def to_quil_device(self):
        # Only required here
        import networkx as nx
        from pyquil.device import NxDevice
        edges = [edge for edge in self.graph.edges() if edge[0] in self.vertices]
        topology = nx.from_edgelist(edges)
        device = NxDevice(topology)
        return device

    def visualize(self, filename=None):
        import networkx as nx
        import matplotlib.pyplot as plt
        plt.switch_backend('agg')
        g = nx.Graph()
        g.add_nodes_from(self.vertices)
        g.add_edges_from(self.graph.edges())
        nx.draw(g, with_labels=True, font_weight='bold')
        if filename is None:
            filename = self.name + ".png"
        plt.savefig(filename)

    def floyd_warshall(self, exclude_excl, upper=True):
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
            for j, v1 in enumerate(vertices if upper else vertices[:i + 1]):
                for v2 in vertices if upper else vertices[: i + j + 1]:
                    if (v0, v1) in distances.keys():
                        if (v1, v2) in distances.keys():
                            if (v0, v2) not in distances.keys() or distances[(v0, v2)][0] > distances[(v0, v1)][0] + \
                                    distances[(v1, v2)][0]:
                                distances[(v0, v2)] = (distances[(v0, v1)][0] + distances[(v1, v2)][0],
                                                       distances[(v0, v1)][1] + distances[(v1, v2)][1])
                                if upper:
                                    distances[(v2, v0)] = (distances[(v0, v1)][0] + distances[(v1, v2)][0],
                                                       distances[(v2, v1)][1] + distances[(v1, v0)][1])
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
            options = [(node, v, *distances[(v, node)]) for node in nodes for v in (vertices + steiner_pnts) if
                       (v, node) in distances.keys()]
            best_option = min(options, key=lambda x: x[2])
            debug and print("Adding to tree: vertex ", best_option[0], "Edges ", best_option[3])
            vertices.append(best_option[0])
            edges.extend(best_option[3])
            steiner = [v for edge in best_option[3] for v in edge if v not in vertices]
            debug and print(steiner)
            steiner_pnts.extend(steiner)
            nodes.remove(best_option[0])
        edges = set(edges)  # remove duplicates
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
                # input("note it down")
                break
        yield None
        # Walk the tree bottom up to remove all ones.
        yield_count = 0
        while len(edges) > 0:
            # find leaf nodes:
            debug and print(vertices, steiner_pnts, edges)
            vs_to_consider = [vertex for vertex in vertices if vertex not in [e0 for e0, e1 in edges]] + \
                             [vertex for vertex in steiner_pnts if vertex not in [e0 for e0, e1 in edges]]
            yielded = False
            for v in vs_to_consider:
                # Get the edge that is connected to this leaf node
                for edge in [e for e in edges if e[1] == v]:
                    yield edge
                    edges.remove(edge)
                    yielded = True
                    yield_count += 1
                    # yield map(lambda i: self.qubit_map[i], edge)
            if not yielded:
                print("Infinite loop!", warning)
                warning += 1
            if yield_count > n_edges:
                print("Yielded more edges than existing again... This should not be possible!!", warning)
                warning += 1
            if warning > 10:
                print(state, edges, yield_count)
                # input("Note it down!")
                break
        yield None

def dynamic_size_architecture_name(base_name, n_qubits):
    return str(n_qubits) + "q-" + base_name

def connect_vertices_in_line(vertices):
    return [(vertices[i], vertices[i+1]) for i in range(len(vertices)-1)]

def connect_vertices_as_grid(width, height, vertices):
    if len(vertices) != width * height:
        raise KeyError("To make a grid, you need vertices exactly equal to width*height, but got %d=%d*%d." % (len(vertices), width, height))
    edges = connect_vertices_in_line(vertices)
    horizontal_lines = [vertices[i*width: (i+1)*width] for i in range(height)]
    for line1, line2 in zip(horizontal_lines, horizontal_lines[1:]):
        new_edges = [(v1, v2) for v1, v2 in zip(line1[:-1], reversed(line2[1:]))]
        edges.extend(new_edges)
    return edges

def create_line_architecture(n_qubits, backend=None, **kwargs):
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(n_qubits)
    edges = connect_vertices_in_line(vertices)
    graph.add_edges(edges)
    name = dynamic_size_architecture_name(LINE, n_qubits)
    return Architecture(name=name, coupling_graph=graph, backend=backend, **kwargs)

def create_circle_architecture(n_qubits, backend=None, **kwargs):
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(n_qubits)
    edges = connect_vertices_in_line(vertices)
    edges.append((vertices[-1], vertices[0]))
    graph.add_edges(edges)
    name = dynamic_size_architecture_name(CIRCLE, n_qubits)
    return Architecture(name=name, coupling_graph=graph, backend=backend, **kwargs)

def create_square_architecture(n_qubits, backend=None, **kwargs):
    # No floating point errors
    sqrt_qubits = 0
    for n in range(n_qubits):
        if n_qubits == n**2:
            sqrt_qubits = n
        if n**2 > n_qubits:
            break
    if sqrt_qubits == 0:
        raise KeyError("Sqaure architecture requires a square number of qubits, but got " + str(n_qubits))
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(n_qubits)
    edges = connect_vertices_as_grid(sqrt_qubits, sqrt_qubits, vertices)
    graph.add_edges(edges)
    name = dynamic_size_architecture_name(SQUARE, n_qubits)
    return Architecture(name=name, coupling_graph=graph, backend=backend, **kwargs)

"""
def create_9q_square_architecture(**kwargs):
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
    return Architecture(name=SQUARE_9Q, coupling_matrix=m, **kwargs)

def create_5q_line_architecture(**kwargs):
    m = np.array([
        [0, 1, 1, 0, 0],
        [1, 0, 1, 0, 0],
        [1, 1, 0, 1, 0],
        [0, 0, 1, 0, 1],
        [0, 0, 0, 1, 0]
    ])
    return Architecture(name=LINE_5Q, coupling_matrix=m, **kwargs)
"""
def create_ibm_qx2_architecture(**kwargs):
    m = np.array([
        [0, 1, 1, 0, 0],
        [1, 0, 1, 0, 0],
        [1, 1, 0, 1, 1],
        [0, 0, 1, 0, 1],
        [0, 0, 1, 1, 0]
    ])
    return Architecture(IBM_QX2, coupling_matrix=m, **kwargs)

def create_ibm_qx4_architecture(**kwargs):
    m = np.array([
        [0, 1, 1, 0, 0],
        [1, 0, 1, 0, 0],
        [1, 1, 0, 1, 1],
        [0, 0, 1, 0, 1],
        [0, 0, 1, 1, 0]
    ])
    return Architecture(IBM_QX4, coupling_matrix=m, **kwargs)

def create_ibm_qx3_architecture(**kwargs):
    m = np.array([
        #0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
        [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #0
        [1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #1
        [0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #2
        [0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #3
        [0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #4
        [1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0], #5
        [0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], #6
        [0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0], #7
        [0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0], #8
        [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0], #9
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0], #10
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0], #11
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0], #12
        [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0], #13
        [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1], #14
        [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0]  #15
    ])
    return Architecture(IBM_QX3, coupling_matrix=m, **kwargs)

def create_ibm_qx5_architecture(**kwargs):
    m = np.array([
        #0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
        [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], #0
        [1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0], #1
        [0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0], #2
        [0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0], #3
        [0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0], #4
        [0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0], #5
        [0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0], #6
        [0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0], #7
        [0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0], #8
        [0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0], #9
        [0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0], #10
        [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0], #11
        [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0], #12
        [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0], #13
        [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1], #14
        [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0]  #15
    ])
    return Architecture(IBM_QX5, coupling_matrix=m, **kwargs)

def create_ibm_q20_tokyo_architecture(backend=None, **kwargs):
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(20)
    edges = connect_vertices_as_grid(5, 4, vertices)
    cross_edges = [
        (1, 7), (2, 8),
        (3, 5), (4, 6),
        (6, 12), (7, 13),
        (8, 10), (9, 11),
        (11, 17), (12, 18),
        (13, 15), (14, 16)
    ]
    edges.extend([(vertices[v1], vertices[v2]) for v1, v2 in cross_edges])
    graph.add_edges(edges)
    return Architecture(name=IBM_Q20_TOKYO, coupling_graph=graph, backend=backend, **kwargs)

def create_rigetti_16q_aspen_architecture(backend=None, **kwargs):
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(16)
    edges = connect_vertices_in_line(vertices)
    extra_edges = [(0, 7), (8, 15), (15, 0)]
    edges += [(vertices[v1], vertices[v2]) for v1, v2 in extra_edges]
    graph.add_edges(edges)
    return Architecture(RIGETTI_16Q_ASPEN, coupling_graph=graph, backend=backend, **kwargs)

def create_rigetti_8q_agave_architecture(**kwargs):
    m = np.array([
        [0, 1, 0, 0, 0, 0, 0, 1],
        [1, 0, 1, 0, 0, 0, 0, 0],
        [0, 1, 0, 1, 0, 0, 0, 0],
        [0, 0, 1, 0, 1, 0, 0, 0],
        [0, 0, 0, 1, 0, 1, 0, 0],
        [0, 0, 0, 0, 1, 0, 1, 0],
        [0, 0, 0, 0, 0, 1, 0, 1],
        [1, 0, 0, 0, 0, 0, 1, 0]
    ])
    return Architecture(RIGETTI_8Q_AGAVE, coupling_matrix=m, **kwargs)

def create_fully_connected_architecture(n_qubits=None, **kwargs):
    if n_qubits is None:
        print("Warning: size is not given for the fully connected architecuture, using 9 as default.")
        n_qubits = 9
    m = np.ones(shape=(n_qubits, n_qubits))
    for i in range(n_qubits):
        m[i][i] = 0
    name = dynamic_size_architecture_name(FULLY_CONNNECTED, n_qubits)
    return Architecture(name, coupling_matrix=m, **kwargs)

def create_architecture(name, **kwargs):
    # Source Rigetti architectures: https://www.rigetti.com/qpu # TODO create the architectures from names in pyquil.list_quantum_computers() <- needs mapping
    # Source IBM architectures: http://iic.jku.at/files/eda/2018_tcad_mapping_quantum_circuit_to_ibm_qx.pdf​
    # IBM architectures are currently ignoring CNOT direction.
    if isinstance(name, Architecture):
        return name
    if name == SQUARE:
        return create_square_architecture(**kwargs)
    elif name == LINE:
        return create_line_architecture(**kwargs)
    elif name == FULLY_CONNNECTED:
        return create_fully_connected_architecture(**kwargs)
    elif name == CIRCLE:
        return create_circle_architecture(**kwargs)
    elif name == IBM_QX2:
        return create_ibm_qx2_architecture(**kwargs)
    elif name == IBM_QX3:
        return create_ibm_qx3_architecture(**kwargs)
    elif name == IBM_QX4:
        return create_ibm_qx4_architecture(**kwargs)
    elif name == IBM_QX5:
        return create_ibm_qx5_architecture(**kwargs)
    elif name == IBM_Q20_TOKYO:
        return create_ibm_q20_tokyo_architecture(**kwargs)
    elif name == RIGETTI_16Q_ASPEN:
        return create_rigetti_16q_aspen_architecture(**kwargs)
    elif name == RIGETTI_8Q_AGAVE:
        return create_rigetti_8q_agave_architecture(**kwargs)
    else:
        raise KeyError("name" + str(name) + "not recognized as architecture name. Please use one of", *architectures)

def colored_print_9X9(np_array):
    """
    Prints a 9x9 numpy array with colors representing their distance in a 9x9 square architecture
    :param np_array:  the array
    """
    if np_array.shape == (9,9):
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
    else:
        print(np_array)

if __name__ == '__main__':
    sys.path.append('..')
    n_qubits = 25
    for name in dynamic_size_architectures:
        arch = create_architecture(name, n_qubits=n_qubits)
        arch.visualize()

    arch = create_architecture(IBM_Q20_TOKYO)
    arch.visualize()