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


import math
import itertools
import sys
from typing import Any, Dict, Iterator, List, Set, Tuple, Optional, Union
from typing_extensions import Literal

from pyzx.graph.base import BaseGraph
if __name__ == '__main__':
    sys.path.append('..')
from ..graph.graph import Graph
#from pyzx.graph.base import BaseGraph # TODO fix the right graph import - one of many - right backend etc

import numpy as np

SQUARE = "square"
LINE = "line"
FULLY_CONNECTED = "fully_connected"
CIRCLE = "circle"
IBM_QX2 = "ibm_qx2"
IBM_QX3 = "ibm_qx3"
IBM_QX4 = "ibm_qx4"
IBM_QX5 = "ibm_qx5"
IBM_Q20_TOKYO = "ibm_q20_tokyo"
RIGETTI_19Q_ACORN = "rigetti_19q_acorn"
RIGETTI_16Q_ASPEN = "rigetti_16q_aspen"
RIGETTI_8Q_AGAVE = "rigetti_8q_agave"
REC_ARCH = "recursive_architecture"
SYCAMORE_LIKE = "sycamore_like"
IBMQ_POUGHKEEPSIE = "ibmq_poughkeepsie"
IBMQ_SINGAPORE = "ibmq_singapore"
IBMQ_BOEBLINGEN  = "ibmq_boeblingen"
GOOGLE_SYCAMORE = "google_sycamore"
IBM_ROCHESTER = "ibm_rochester"
DENSITY = "dynamic_density"

architectures = [SQUARE, CIRCLE, FULLY_CONNECTED, LINE, DENSITY, IBM_QX4, IBM_QX2, IBM_QX3, 
                IBM_QX5, IBM_Q20_TOKYO, RIGETTI_8Q_AGAVE, RIGETTI_16Q_ASPEN, RIGETTI_19Q_ACORN, 
                REC_ARCH, SYCAMORE_LIKE, IBMQ_POUGHKEEPSIE, IBMQ_BOEBLINGEN, IBMQ_SINGAPORE, 
                GOOGLE_SYCAMORE, IBM_ROCHESTER] # List of available architectures
dynamic_size_architectures = [FULLY_CONNECTED, LINE, CIRCLE, SQUARE, DENSITY]
hamiltonian_path_architectures = [FULLY_CONNECTED, LINE, CIRCLE, SQUARE, IBM_QX4, IBM_QX2, IBM_QX3, 
                IBM_QX5, IBM_Q20_TOKYO, RIGETTI_8Q_AGAVE, RIGETTI_16Q_ASPEN, 
                IBMQ_POUGHKEEPSIE]

class Architecture():
    """
    Class that represents the architecture of the qubits to be taken into account when routing.
    """

    def __init__(self, name: str, coupling_graph: Optional[BaseGraph]=None, coupling_matrix=None, backend: Optional[str]=None, qubit_map: Optional[List[int]] = None, reduce_order: Optional[List[int]]=None, **kwargs):
        """
        Class that represents the architecture of the qubits to be taken into account when routing.

        :param coupling_graph: a PyZX Graph representing the architecture, optional 
        :param coupling_matrix: a 2D numpy array representing the adjacency of the qubits, from which the Graph is created, optional
        :param backend: The PyZX Graph backend to be used when creating it from the adjacency matrix, optional
        :param reduce_order: A list of integers representing the order in which the qubits should be scanned for some operations (e.g. steiner tree reduction), optional
        :param qubit_map: A qubit placement mapping list such that qubit_map[logical_qubit] = graph_node
        """
        self.name = name
        if coupling_graph is None:
            self.graph = Graph(backend=backend)
        else:
            self.graph = coupling_graph

        if coupling_matrix is not None:
            # build the architecture graph
            n = coupling_matrix.shape[0]
            self.graph.add_vertices(n)
            edges = [(row, col) for row in range(n) for col in range(n) if
                     coupling_matrix[row, col] == 1]
            self.graph.add_edges(edges)
        self.vertices = list(self.graph.vertices())

        if qubit_map is not None:
            self.qubit_map = qubit_map
        elif reduce_order is not None:
            # No qubit map given, but there is a reduce order, so assuming a default i-i mapping.
            self.qubit_map = list(range(len(reduce_order)))
        else:
            self.qubit_map = self._place_qubits()
        for q,v in enumerate(self.qubit_map):
            self.graph.set_qubit(v, q)
            
        # Set qubit indices to each element of the graph
        for i, v in enumerate(self.graph.vertices()):
            if self.graph.qubit(v) < 0: # Defaults to -1
                self.graph.set_qubit(v, i)

        # Pre-calculated distances between all pairs of qubits in the architecture
        # See :func:`pre_calc_distances` for more details
        self.distances: Optional[Dict[Literal["upper", "full"], List[Dict[Tuple[int,int], Tuple[int,List[Tuple[int,int]]]]]]] = None

        self.n_qubits = len(self.vertices)
        self.reduce_order = self._get_reduce_order() if reduce_order is None else reduce_order
        self._non_cutting_vertices: Dict[Tuple[int, ...], List[int]] = {}

    def qubit2vertex(self, qubit: int) -> int:
        """Get the internal graph vertex index for a logical architecture qubit."""
        return self.qubit_map[qubit]

    def vertex2qubit(self, vertex: int) -> int:
        """Get the logical architecture qubit for an internal graph vertex index."""
        return int(self.graph.qubit(vertex))

    def pre_calc_distances(self) -> Dict[Literal["upper", "full"], List[Dict[Tuple[int,int], Tuple[int,List[Tuple[int,int]]]]]]:
        """
        Pre-calculates the distances between all pairs of qubits in the architecture.

        :return: The computed distances. distances["upper"|"full"][until][(v1,v2)] contains the distance between v1 and v2, and the shortest path, where
            upper|full indicates whether to consider bidirectional edges or not (respectively),
            until indicates the number of qubits to consider, for "full" the distance is calculated only between qubits with index <= until),
            and for "upper" the distance is calculated only between qubits with index >= until)
        """
        return {"upper": [self.floyd_warshall(self.vertices[until:], upper=True) for until, v in enumerate(self.vertices)],
                "full": [self.floyd_warshall(self.vertices[:until+1], upper=False) for until, v in enumerate(self.vertices)]}

    def _get_reduce_order(self) -> List[int]:
        """
        Determines reduction order by iteratively removing the largest labelled leaf node.

        :return: A descending list of the qubits that have been stored as leaf nodes
        """
        vertices = list(sorted(self.vertices, reverse=True, key=self.vertex2qubit)) # sort qubits from large to small
        # Pick leaf with largest label every time.
        reduce_order = []
        while vertices:
            all_cutting = self._is_cutting(vertices) # Get which vertices are cutting
            # All False indices correspond to a leaf, we want the first one
            leaf = all_cutting.index(False)
            # Which logical qubit is stored in the leaf node?
            reduce_order.append(self.vertex2qubit(vertices[leaf]))
            del vertices[leaf]

        return reduce_order

    def _place_qubits(self, start_vertex=None) -> List[int]:
        """
        Label the graph using depth-first traversal (DFT) with post-order labeling, starting at the start_vertex or the highest index node if none given.
        
        :param start_vertex: Starting node for traversal, if None start at highest index node, default None
        :return: Ordered list of qubit placements
        """
        # If no start_vertex is given, start at the node with the highest index
        if start_vertex is None:
            start_vertex = max(self.vertices)

        visited = []
        # If logical qubit q is stored in physical qubit n, then qubit_map[q]=n
        qubit_map = []
        # DFT relabelling
        def dft(current):
            visited.append(current) # Mark node as visited
            # Find the neighbors of current.
            neighbors = self.get_neighboring_vertices(current)
            # For all neighbors not yet visited do dft
            for n in sorted(neighbors, reverse=True): # Sorting should make it follow the old placements as close as possible
                if n not in visited:
                    dft(n)
            # Label current node
            qubit_map.append(current)
        dft(start_vertex)
        return qubit_map
        
    def _non_cutting_vertices_hash(self, subgraph: List[int]) -> Tuple[int, ...]:
        """
        Converts a list of vertices, representing a subgraph, to a sorted tuple.
        
        :param subgraph: A list of vertex location within the subgraph
        :return: A sorted tuple of the given subgraph vertices 
        """
        return tuple(sorted(subgraph))

    def pre_calc_non_cutting_vertices(self):
        """
        Adds to a dictionary all non-cutting vertices for every possible subset of qubits.
        
        Raises:
            NotImplementedError: Function is not yet complete
        """
        # TODO refactor using vertex2qubit() and qubit2vertex() and proper naming to make a difference between qubits and vertices
        raise NotImplementedError("pre calculation non cutting vertices")

        qubits = [i for i in range(self.n_qubits)]
        def collect_non_cutting(qubits: List[int]) -> List[Tuple[List[int], List[int]]]:
            if qubits == []:
                return []
            vertices = [self.vertices[q] for q in qubits]
            is_cutting = self._is_cutting(vertices)
            non_cutting = [q for i,q  in enumerate(qubits) if not is_cutting[i] ]
            all_non_cutting = [(qubits, non_cutting)]
            for qubit in non_cutting:
                subgraph = [q for q in qubits if q != qubit]
                all_non_cutting += collect_non_cutting(subgraph)
            return all_non_cutting
        self._non_cutting_vertices = {}
        for subgraph, non_cutting in collect_non_cutting(qubits):
            hash = self._non_cutting_vertices_hash(subgraph)
            self._non_cutting_vertices[hash] = non_cutting
    
    def non_cutting_vertices(self, subgraph_vertices: List[int], pre_calc: bool=False) -> List[int]:
        """
        Find the non-cutting vertices for this subgraph.

        :param subgraph_vertices: A list of vertex location within the subgraph
        :param pre_calc: If true, calls :func:`~architecture.Architecture.pre_calc_non_cutting_vertices`, default False
        :return: A list of non-cutting qubits
        """
        hash = self._non_cutting_vertices_hash(subgraph_vertices)
        if hash in self._non_cutting_vertices.keys():
            pass
        elif hash == []:
            self._non_cutting_vertices[hash] = []
        elif pre_calc:
            self.pre_calc_non_cutting_vertices()
        else:
            subgraph_cutting = self._is_cutting(vertices=[self.vertices[i] for i in subgraph_vertices])
            self._non_cutting_vertices[hash] = [subgraph_vertices[i] for i, cutting in enumerate(subgraph_cutting) if not cutting]

        return self._non_cutting_vertices[hash]


    def _is_cutting(self, vertices: Optional[List[int]]=None) -> List[bool]:
        """
        Find the articulation points in a subgraph, these are the cutting vertices which if removed would cut the graph.

        :param vertices: An optional list of vertex locations within the graph, default None
        :return: A corresponding list showcasing which vertices are articulation points
        """
        # algorithm from https://courses.cs.washington.edu/courses/cse421/04su/slides/artic.pdf and https://www.geeksforgeeks.org/articulation-points-or-cut-vertices-in-a-graph/ 
        if vertices is None:
            vertices = self.vertices
        number_of_nodes = len(vertices)
        discovery_times = [-1]*number_of_nodes
        lows: List[int] = [len(vertices)*2]*number_of_nodes
        index_lookup = {self.vertices[v]:i for i, v in enumerate(vertices)}
        self.dfs_counter = 0
        edges = [e for e in self.graph.edges() if e[0] in vertices and e[1] in vertices]
        edges += [(v2, v1) for v1, v2 in edges]
        cutting = [False] * number_of_nodes
        parent = [-1] * number_of_nodes
        def dfs(vertex):
            v = index_lookup[vertex]
            self.dfs_counter += 1
            discovery_times[v] = self.dfs_counter
            lows[v] = discovery_times[v]
            children = 0
            for edge in [e for e in edges if e[0] == vertex]:
                vertex2 = edge[1]
                v2 = index_lookup[vertex2]
                if discovery_times[v2] == -1: # Not visited yet
                    parent[v2] = v
                    children += 1
                    dfs(vertex2)
                    lows[v] = min(lows[v], lows[v2])
                    if parent[v] == -1 and children > 1:
                        cutting[v] = True
                    if parent[v] != -1 and lows[v2] >= discovery_times[v]:
                        cutting[v] = True
                elif v2 != parent[v]:
                    lows[v] = min(lows[v], discovery_times[v2])
        for vertex in vertices:
            v = index_lookup[vertex]
            if discovery_times[v] == -1:
                dfs(vertex)
        del self.dfs_counter
        return cutting
                    
    def get_neighboring_qubits(self, qubit: int) -> Set[int]:
        """
        Given a qubit, finds all neighboring qubits in the graph.

        :param qubit: Location of qubit index within the graph
        :return: A set of all related qubit indices
        """
        vertex = self.qubit2vertex(qubit)
        return set(self.vertex2qubit(q) for q in self.get_neighboring_vertices(vertex))

    def get_neighboring_vertices(self, vertex: int) -> Set[int]:
        """
        From a given vertex location, finds all neighboring vertices in the graph.

        :param vertex: Location of vertex within the graph
        :return: A set of all neighboring vertices
        """
        return set(self.graph.neighbors(vertex))

    def to_quil_device(self):
        """
        Convert the graph to a PyQuil NxDevive object.

        :return: A NxDevice object relating to the graphs topology representing this architecture
        """
        # Only required here
        import networkx as nx
        from pyquil.device import NxDeviceA
        edges = [edge for edge in self.graph.edges() if edge[0] in self.vertices]
        topology = nx.from_edgelist(edges)
        device = NxDevice(topology)
        return device

    def visualize(self, filename=None):
        """
        Visualise the graph and save it as a png image file.

        :param filename: The filename of the image to be saved, default None
        """
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

    def floyd_warshall(self, subgraph_vertices: List[int], upper: bool=True, rec_vertices: List[int]=[]) -> Dict[Tuple[int,int], Tuple[int,List[Tuple[int,int]]]]:
        """
        Implementation of the Floyd-Warshall algorithm to calculate the all-pair distances in a given graph.

        :param subgraph_vertices: Subset of vertices to consider
        :param upper: Whether use bidirectional edges or only ordered edges (src, tgt) such that src > tgt, default True
        :param rec_vertices: A subgraph for which edges are considered undirected, as if the `upper` flag was set
        :return: A dict with for each pair of qubits in the graph, a tuple with their distance and the corresponding shortest path
        """
        # https://en.wikipedia.org/wiki/Floyd%E2%80%93Warshall_algorithm
        distances = {}
        vertices = subgraph_vertices if subgraph_vertices is not None else self.vertices
        for edge in self.graph.edges():
            src, tgt = self.graph.edge_st(edge)
            if src in vertices and tgt in vertices:
                if upper or (src in rec_vertices and tgt in rec_vertices):
                    distances[(src, tgt)] = (1, [(src, tgt)])
                    distances[(tgt, src)] = (1, [(tgt, src)])
                elif self.vertex2qubit(src) > self.vertex2qubit(tgt):
                    distances[(src, tgt)] = (1, [(src, tgt)])
                else:
                    distances[(tgt, src)] = (1, [(tgt, src)])
        for v in vertices:
            distances[(v, v)] = (0, [])
        for v0 in vertices+vertices:
            for v1 in vertices:
                for v2 in vertices:
                    # Consider the path v0 -> v1 -> v2 as a shortest path candidate for v0 -> v2
                    if (v0, v1) in distances.keys() and (v1, v2) in distances.keys():
                        if (v0, v2) not in distances.keys() or distances[(v0, v2)][0] > distances[(v0, v1)][0] + distances[(v1, v2)][0]:
                            # There is a path v0 -> v1 -> v2 that is either the first one we see, or the shortest one yet
                            distances[(v0, v2)] = (distances[(v0, v1)][0] + distances[(v1, v2)][0],
                                                distances[(v0, v1)][1] + distances[(v1, v2)][1])
                            if upper:
                                distances[(v2, v0)] = (distances[(v0, v1)][0] + distances[(v1, v2)][0],
                                                distances[(v2, v1)][1] + distances[(v1, v0)][1])
        return distances

    def shortest_path(self, start_qubit: int, end_qubit: int, qubits_to_use: Optional[List[int]]=None) -> Optional[List[int]]:
        """
        Find the shortest path between two qubits in the graph using breadth-first search (BFS)
        
        :param start_qubit: Location of the start qubit index within the graph
        :param end_qubit: Location of the end qubit index within the graph
        :param qubits_to_use: An optional list of qubit indicies to be traversed along the path, default None
        :return: An optional list showcasing the path from the start_qubit to the end_qubit
        """
        if qubits_to_use is None:
            nodes = self.vertices
        else: 
            nodes = [self.qubit2vertex(n) for n in qubits_to_use]
        start = self.qubit2vertex(start_qubit)
        end = self.qubit2vertex(end_qubit)

        queue = [(start, [start])] 
        visited = [start]
  
        while queue != []: 
            
            node, path = queue.pop() 
            if node == end:
                return path
            edges = [edge for edge in self.graph.edges() if node in edge]
            neighbors = [n for edge in edges for n in edge if n != node and n in nodes]
            for new_node in neighbors: 
                if new_node not in visited: 
                    queue.append((new_node, path + [new_node]))
                    visited.append(new_node)
        return None

    def steiner_tree(self, start_qubit: int, qubits_to_use: List[int], upper: bool=True) -> Iterator[Optional[Tuple[int,int]]]:
        """
        Approximates the steiner tree given the architecture, a root qubit and the other qubits that should be present.
        This is done using the pre-calculated all-pairs shortest distance and Prim's algorithm for creating a minimum spanning tree.

        :param start_qubit: The index of the root qubit to be used
        :param qubits_to_use: The indices of the other qubits that should be present in the steiner tree
        :param upper: Whether to consider only the nodes 
            the steiner tree is used for creating an upper triangular matrix or a full reduction.
        :yields: First yields all edges from the tree top-to-bottom, finished with None, then yields all edges from the tree bottom-up, finished with None.
        """
        # Approximated by calculating the all-pairs shortest paths and then solving the minimum spanning tree over the subset of vertices and their respective shortest paths.
        # https://en.wikipedia.org/wiki/Steiner_tree_problem#Approximating_the_Steiner_tree

        # The all-pairs shortest paths are pre-calculated and the minimum spanning tree is solved with Prim's algorithm
        # https://en.wikipedia.org/wiki/Prim%27s_algorithm

        # returns an iterator that walks the steiner tree, yielding (adj_node, leaf) pairs. If the walk is finished, it yields None
        if self.distances is None:
            self.distances = self.pre_calc_distances()
        root = self.qubit2vertex(start_qubit)
        target_nodes = set(self.qubit2vertex(q) for q in qubits_to_use)

        # Check that all nodes are valid and that there are no duplicates
        assert all(n >= root if upper else n <= root for n in target_nodes)
        assert len(qubits_to_use) == len(set(qubits_to_use))
        
        # The vertices and edges of the generated tree
        tree_vertices: Set[int] = {root}
        edges: Set[Tuple[int,int]] = set()
        # Map with all distances between nodes with index <= root (if not upper) or index >= root (if upper), and the corresponding shortest paths
        distances: Dict[Tuple[int,int], Tuple[int,List[Tuple[int,int]]]] = self.distances["upper"][root] if upper else self.distances["full"][root]
        # Nodes that are not yet in the tree
        remaining_nodes = set(n for n in target_nodes if n != root)
        # Non-target nodes added to the tree
        steiner_pnts: Set[int] = set()

        while remaining_nodes:
            # Each candidate is a tuple of (tree node, candidate, distance, path)
            candidates = []
            for node in remaining_nodes:
                for v in tree_vertices.union(steiner_pnts):
                    if (v, node) not in distances.keys():
                        # The nodes are not connected in the considered subgraph
                        continue
                    dist, path = distances[(v, node)]
                    candidates.append((node, v, dist, path))
            if not candidates:
                raise ValueError("The considered subgraph is not connected")
            best_option = min(candidates, key=lambda x: x[2])
            new_node = best_option[0]
            new_path = best_option[3]

            # Add the target node and all intermediary vertices to the three
            tree_vertices.add(new_node)
            edges.update(new_path)
            for _u,v in new_path:
                if v not in tree_vertices:
                    tree_vertices.add(v)
                    steiner_pnts.add(v)
            remaining_nodes.remove(new_node)
        edges = set(edges)  # remove duplicates
            
        # Compute all the edges of the steiner tree in BFS order, starting from the root
        visited = {root}
        queue = [root] 
        generated_edges: List[Tuple[int,int]] = []
        
        while queue != []:
            node = queue.pop(0)
            neighbors = [v for v in self.graph.neighbors(node) if v in tree_vertices and v not in visited]

            for v in neighbors:
                queue.append(v)
                visited.add(v)
                edge = (self.vertex2qubit(node), self.vertex2qubit(v))
                generated_edges.append(edge)
                yield edge
        yield None
        
        # Now go through the tree in reverse order
        for edge in generated_edges[::-1]:
            yield edge
        yield None

    def rec_steiner_tree(self, start_qubit, terminal_qubits, usable_qubits, rec_qubits, upper=True):
        """
        Build a Steiner tree with recursive constraints for given qubits, connecting all terminal qubits using the min number of edges.
        
        :param start_qubit: Location of the start qubit index within the graph
        :param terminal_qubits: List of qubit indicies within the graph that must be included in the tree
        :param usable_qubits: List of all qubit indicies within the graph that can be used to build the tree
        :param rec_qubits: list of qubit indicies within the graph where edges are treated as undirected
        :param upper: Whether use bidirectional edges or only ordered edges (src, tgt) such that src > tgt, default True
        :yeilds: Pairs of qubit indices representing edges in the Steiner tree, yeilds None to signal end of top-down phase and next phase, then yeild None to signal completion
        """
        if not all([q in usable_qubits for q in terminal_qubits]):
            raise Exception("Terminals not in the subgraph")
        # Builds the steiner tree with start as root, contains at least nodes and at most useable_nodes
        start = self.qubit2vertex(start_qubit)
        usable_nodes = [self.qubit2vertex(i) for i in usable_qubits]
        nodes = [self.qubit2vertex(i) for i in terminal_qubits]
        rec_nodes = [self.qubit2vertex(i) for i in rec_qubits]
        # Calculate all-pairs shortest path
        distances = self.floyd_warshall(usable_nodes, upper=upper, rec_vertices=rec_nodes)
        # Build the spanning tree of shortest paths with root start, containing at least nodes
        vertices = [start]
        edges = []
        steiner_pnts = []
        while nodes != []:
            options = [(node, v, *distances[(v, node)]) for node in nodes for v in (vertices + steiner_pnts) if
                        (v, node) in distances.keys()]
            if options == []:
                raise ValueError("The considered subgraph is not connected")
            best_option = min(options, key=lambda x: x[2])
            vertices.append(best_option[0])
            edges += best_option[3]
            steiner = [v for edge in best_option[3] for v in edge if v not in vertices]
            steiner_pnts += steiner
            nodes.remove(best_option[0])
        edges = list(set(edges)) #removes duplicates

        vs = {start} # Start with the root
        n_edges = len(edges)
        yielded_edges = set()
        while len(yielded_edges) < n_edges:
            es = [e for e in edges for v in vs if e[0] == v] # Find all vertices connected to previously yielded vertices
            old_vs = [v for v in vs]
            for edge in es: # yield the corresponding edges.
                yield (self.vertex2qubit(edge[0]), self.vertex2qubit(edge[1]))
                vs.add(edge[1])
                yielded_edges.add(edge)
            [vs.remove(v) for v in old_vs]
        yield None # Signal next phase
        # Walk the tree bottom up to remove all ones.
        while len(edges) > 0:
            # find leaf nodes:
            vs_to_consider = [vertex for vertex in vertices if vertex not in [e0 for e0, e1 in edges]] + \
                                [vertex for vertex in steiner_pnts if vertex not in [e0 for e0, e1 in edges]]
            for v in vs_to_consider:
                # Get the edge that is connected to this leaf node
                for edge in [e for e in edges if e[1] == v]:
                    yield (self.vertex2qubit(edge[0]), self.vertex2qubit(edge[1])) # yield it
                    edges.remove(edge) # Remove it from the steiner tree
        yield None # Signal done

    def transpose(self):
        """
        Returns a transposed copy of the architecture with reversed qubit mapping.
        """
        # TODO make a transposed copy of self
        qubit_map = list(reversed(self.qubit_map))
        arch = Architecture(self.name + "_transpose", coupling_graph=self.graph, qubit_map=qubit_map)
        return arch
        
    def arities(self) -> List[Tuple[int, int]]:
        """
        Returns a list of tuples (i, arity) where i is the index of each node and arity is the number of neighbors,
        sorted by decreasing arity.
        """
        arities = [(i, len(self.graph.neighbors(v))) for i,v in enumerate(self.vertices)]
        arities.sort(key=lambda p: p[1], reverse=True)
        return arities

def dynamic_size_architecture_name(base_name: str, n_qubits: int) -> str:
    """
    Creates an architecture name by prefixing with qubit count.
    
    :param base_name: Base name of the architechture
    :param n_qubits: Number of qubits
    :return: A string concatination of the number of qubits and the base name
    """
    return str(n_qubits) + "q-" + base_name

def connect_vertices_in_line(vertices: List[int]) -> List[Tuple[int, int]]:
    """
    Connects a list of vertices in a straight line.
    
    :param vertices: List of vertex indicies within the graph
    :return: A list of edges connecting each vertex
    """
    return [(vertices[i], vertices[i+1]) for i in range(len(vertices)-1)]

def connect_vertices_as_grid(width: int, height: int, vertices: List[int]) -> List[Tuple[int,int]]:
    """
    Connects vertices into a grid, with layout specified by width and height, vertices length much be equal to width * height. 
    
    :param width: Width of the grid, number of columns
    :param height: Height of the grid, number of rows
    :param vertices: List of vertex indicies within the graph, length must equal width * height
    :return: A list of edges forming a 2D grid structure
    """
    if len(vertices) != width * height:
        raise KeyError("To make a grid, you need vertices exactly equal to width*height, but got %d=%d*%d." % (len(vertices), width, height))
    edges = connect_vertices_in_line(vertices)
    horizontal_lines = [vertices[i*width: (i+1)*width] for i in range(height)]
    for line1, line2 in zip(horizontal_lines, horizontal_lines[1:]):
        new_edges = [(v1, v2) for v1, v2 in zip(line1[:-1], reversed(line2[1:]))]
        edges.extend(new_edges)
    return edges

def create_line_architecture(n_qubits, backend=None, **kwargs):
    """
    Creates a linear architecture of connected qubits.
    
    :param n_qubits: Number of qubits
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: A linear architecture
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(n_qubits)
    edges = connect_vertices_in_line(vertices)
    graph.add_edges(edges)
    name = dynamic_size_architecture_name(LINE, n_qubits)
    return Architecture(name=name, coupling_graph=graph, backend=backend, **kwargs)

def create_circle_architecture(n_qubits, backend=None, **kwargs):
    """
    Creates a circular architecture where qubits form a closed loop.
    
    :param n_qubits: Number of qubits
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: A circular architecture
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(n_qubits)
    edges = connect_vertices_in_line(vertices)
    edges.append((vertices[-1], vertices[0]))
    graph.add_edges(edges)
    name = dynamic_size_architecture_name(CIRCLE, n_qubits)
    return Architecture(name=name, coupling_graph=graph, backend=backend, **kwargs)

def create_square_architecture(n_qubits, backend=None, **kwargs):
    """
    Creates a square (2D) architecture of qubits, number of qubits must be a perfect square.
    
    :param n_qubits: Number of qubits
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: A square (2D) architecture
    """
    # No floating point errors
    sqrt_qubits = math.floor(math.sqrt(n_qubits))
    if sqrt_qubits**2 != n_qubits:
        raise KeyError("Square architecture requires a square number of qubits, but got " + str(n_qubits))
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
    """
    Creates the IBM QX2 architecture based on its standard 5-qubit coupling map.
    
    :param **kwargs: Additional arguments passed
    :return: The IBM QX2 architecture
    """
    m = np.array([
        [0, 1, 1, 0, 0],
        [1, 0, 1, 0, 0],
        [1, 1, 0, 1, 1],
        [0, 0, 1, 0, 1],
        [0, 0, 1, 1, 0]
    ])
    return Architecture(IBM_QX2, coupling_matrix=m, **kwargs)

def create_ibm_qx4_architecture(**kwargs):
    """
    Creates the IBM QX2 architecture based on its standard 5-qubit coupling map.
    
    :param **kwargs: Additional arguments passed
    :return: The IBM QX4 architecture
    """
    m = np.array([
        [0, 1, 1, 0, 0],
        [1, 0, 1, 0, 0],
        [1, 1, 0, 1, 1],
        [0, 0, 1, 0, 1],
        [0, 0, 1, 1, 0]
    ])
    return Architecture(IBM_QX4, coupling_matrix=m, **kwargs)

def create_ibm_qx3_architecture(**kwargs):
    """
    Creates the IBM QX3 architecture based on its standard 16-qubit coupling map.
    
    :param **kwargs: Additional arguments passed
    :return: The IBM QX3 architecture
    """
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
    """
    Creates the IBM QX5 architecture based on its standard 16-qubit coupling map.
    
    :param **kwargs: Additional arguments passed
    :return: The IBM QX5 architecture
    """
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
    """
    Creates the IBM Q20 Tokyo architecture with a 5*4 grid plus cross connections.
    
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: The IBM Q20 Tokyo 20-qubit architecture
    """
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

def create_ibmq_poughkeepsie(backend=None, **kwargs):
    """
    Creates the IBM Q Poughkeepsie architecture, consisting of 20 qubits connected in a linear chain with a few additional cross-connections.
    
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: The IBM Q Poughkeepsie 20-qubit architecture
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(20)
    edges = connect_vertices_in_line(vertices)
    cross_edges = [
        (0,5), (7,1), (5,14), (10,19)
    ]
    edges.extend([(vertices[v1], vertices[v2]) for v1, v2 in cross_edges])
    graph.add_edges(edges)
    return Architecture(name=IBMQ_POUGHKEEPSIE, coupling_graph=graph, backend=backend, **kwargs)

def create_ibmq_singapore(backend=None, name=None, **kwargs):
    """
    Creates the IBM Q Singapore architecture with a modified linear structure and cross-links.
    
    :param backend: Backend associated with the architecture, default None
    :param name: Custom architecture name. If not provided, uses IBMQ Boeblingen name. Default None
    :param **kwargs: Additional arguments passed
    :return: The IBM Q Singapore 20-qubit architecture
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(20)
    edges = connect_vertices_in_line([v for i, v in enumerate(vertices) if i not in [3, 15]])
    cross_edges = [(1,11), (3, 4), (5, 10), (9,14), (15, 16), (8,18)]
    edges.extend([(vertices[v1], vertices[v2]) for v1, v2 in cross_edges])
    graph.add_edges(edges)
    if name is not None:
        return Architecture(name=IBMQ_BOEBLINGEN, coupling_graph=graph, backend=backend, **kwargs)
    return Architecture(name=IBMQ_SINGAPORE, coupling_graph=graph, backend=backend, **kwargs)

def create_rigetti_19q_acorn_architecture(backend=None, **kwargs):
    """
    Creates the Rigetti 19Q Acorn architecture, a 20-node graph.
    
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: The Rigetti 19Q Acorn qubit architecture
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(20)
    edges = connect_vertices_in_line([vertices[i] for i in range(20) if i != 8])
    extra_edges = [(8,9), (0,18), (2,16), (4,14), (6, 12)]
    edges += [(vertices[v1], vertices[v2]) for v1, v2 in extra_edges]
    graph.add_edges(edges)
    return Architecture(RIGETTI_19Q_ACORN, coupling_graph=graph, backend=backend, **kwargs)


def create_rigetti_16q_aspen_architecture(backend=None, **kwargs):
    """
    Creates the Rigetti 16Q Aspen architecture, a 16-node graph.
    
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: The Rigetti 16Q Aspen qubit architecture
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(16)
    edges = connect_vertices_in_line(vertices)
    extra_edges = [(0, 7), (8, 15), (15, 0)]
    edges += [(vertices[v1], vertices[v2]) for v1, v2 in extra_edges]
    graph.add_edges(edges)
    return Architecture(RIGETTI_16Q_ASPEN, coupling_graph=graph, backend=backend, **kwargs)

def create_sycamore_like(backend=None, **kwargs):
    """
    Creates a Sycamore-like architecture inspired by Google's Sycamore topology, a 20-qubit architecture.
    
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: A Sycamore-like qubit architecture
    """
    graph = Graph(backend=backend)
    vertices = list(graph.add_vertices(20))
    line = vertices[:1]+vertices[2:4]+vertices[5:13]+vertices[14:17]+vertices[18:]
    edges = connect_vertices_in_line(line)
    extra_edges = [(1,2),(2,6), (4,5), (4,14),(5,12), (6,11), (7,10), (13,14), (12,16), (11,18), (10,17), (17,18)]
    edges += [(vertices[v1], vertices[v2]) for v1, v2 in extra_edges]
    graph.add_edges(edges)
    return Architecture(SYCAMORE_LIKE, coupling_graph=graph, backend=backend, **kwargs)

def create_rigetti_8q_agave_architecture(**kwargs):
    """
    Creates the Rigetti 8Q Agave architecture, an 8-qubit architecture using tghe standard Rigetti Agave coupling map.
    
    :param **kwargs: Additional arguments passed
    :return: A Rigetti 8Q Agave 8-qubit architecture
    """
    
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

def create_recursive_architecture(**kwargs):
    """
    Creates a 9-qubit recursive architecture.
    
    :param **kwargs: Additional arguments passed
    :return: A Recursive 9-qubit architecture
    """
    m = np.array([
        #0  1  2  3  4  5  6  7  8
        [0, 0, 1, 0, 0, 0, 0, 0, 0],#0
        [0, 0, 1, 0, 0, 0, 0, 0, 0],#1
        [1, 1, 0, 0, 0, 0, 0, 1, 0],#2
        [0, 0, 0, 0, 0, 1, 0, 0, 0],#3
        [0, 0, 0, 0, 0, 1, 0, 0, 0],#4
        [0, 0, 0, 1, 1, 0, 0, 1, 0],#5
        [0, 0, 0, 0, 0, 0, 0, 1, 0],#6
        [0, 0, 1, 0, 0, 1, 1, 0, 1],#7
        [0, 0, 0, 0, 0, 0, 0, 1, 0] #8
    ])
    return Architecture(name=REC_ARCH, coupling_matrix=m, **kwargs)

def create_fully_connected_architecture(n_qubits=None, **kwargs):
    """
    Creates a fully connected architecture where each where each qubit is connected to every other qubit.
    
    :param n_qubits: The number of qubits, if None 9 is used, default None
    :param **kwargs: Additional arguments passed
    :return: A fully connected 9-qubit architechture
    """
    if n_qubits is None:
        print("Warning: size is not given for the fully connected architecuture, using 9 as default.")
        n_qubits = 9
    m = np.ones(shape=(n_qubits, n_qubits))
    for i in range(n_qubits):
        m[i][i] = 0
    name = dynamic_size_architecture_name(FULLY_CONNECTED, n_qubits)
    return Architecture(name, coupling_matrix=m, **kwargs)

def create_dynamic_density_hamiltonian_architecture(n_qubits, density_prob=0.1, backend=None, **kwargs):
    """
    Creates a randomly connected architecture with user-defined edge density.
    
    :param n_qubits: The number of qubits
    :param density_prob: Probability for each possible edge to be included, default 0.1
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: A graph-based architecture with specified qubit count and edge density
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(n_qubits)
    edges = connect_vertices_in_line(vertices)
    n_edges = int(density_prob*n_qubits*(n_qubits-1)/2) - n_qubits+1 # Number of edges still to add.
    if n_edges > 0:
        possible_edges = [(v1, v2) for i, v1 in enumerate(vertices) for v2 in vertices[i+2:]]
        indices = np.random.choice(len(possible_edges), n_edges, replace=False)
        edges.extend([possible_edges[i] for i in indices])
    graph.add_edges(edges)
    name = dynamic_size_architecture_name(DENSITY+str(density_prob), n_qubits)
    return Architecture(name=name, coupling_graph=graph, backend=backend, **kwargs)

def create_dynamic_density_tree_architecture(n_qubits, density_prob=0.1, backend=None, **kwargs):
    """
    Creates a random tree-based architecture with additional edges to control density.
    
    :param n_qubits: The number of qubits
    :param density_prob: Probability for each possible edge to be included, default 0.1
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: A tree-structured qubit architecture with optional extra edges
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(n_qubits)
    edges = []
    # Pick a random root
    indices = [i for i in range(len(vertices))]
    index = np.random.choice(indices)
    root = vertices[index]
    indices.remove(index)
    # Create the tree
    stack = [root]
    while stack != []:
        parent = stack.pop(0)
        if indices != []:
            if len(indices) == 1:
                n_children = 1
            else:
                p = [0.]
                x = 0.5
                while len(p) < len(indices)-1:
                    p.append(x)
                    x = x/2
                p.append(x*2)
                n_children = np.random.choice(len(indices), p=p) # Ensure that the parent has at least 1 child
            child_indices = np.random.choice(indices, n_children, replace=False)
            children = [vertices[child] for child in child_indices]
            edges += [(parent, child) for child in children]
            [indices.remove(i) for i in child_indices]
            stack += children
    n_edges = int(density_prob*n_qubits*(n_qubits-1)/2) - len(edges) # Number of edges still to add.
    if n_edges > 0:
        possible_edges = [(v1, v2) for i, v1 in enumerate(vertices) for v2 in vertices[i+1:] if (v1,v2) not in edges and v1!=v2 and (v2,v1) not in edges]
        indices = np.random.choice(len(possible_edges), n_edges, replace=False)
        edges.extend([possible_edges[i] for i in indices])
    graph.add_edges(edges)
    # Make the coupling graph and adjust the numbering
    name = dynamic_size_architecture_name(DENSITY+str(density_prob), n_qubits)
    arch = Architecture(name=name, coupling_graph=graph, **kwargs)
    return arch

def create_dynamic_density_architecture(n_qubits, density_prob=0.1, backend=None, **kwargs):
    """
    Creates a randomly connected architecture with specified edge density, ensuring full connectivity.
    
    :param n_qubits: The number of qubits
    :param density_prob: Probability for each possible edge to be included, default 0.1
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: A connected, random-density qubit architecture
    """
    # Generate a random graph by adding each possible edge with probability density_prob
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(n_qubits)
    for v,u in itertools.combinations(vertices, 2):
        if np.random.rand() < density_prob:
            graph.add_edge(v,u)
    # Make sure it is connected
    to_explore = set(vertices)
    explored = set()
    while to_explore:
        # Pick a random root
        root = np.random.choice(tuple(to_explore))
        if explored:
            # Add an edge to the explored component
            v = np.random.choice(tuple(explored))
            graph.add_edge(root, v)
        to_explore.remove(root)
        explored.add(root)
        # Mark the connected component as explored
        queue = [root]
        while queue:
            v = queue.pop(0)
            for u in v.neighbors:
                if u in to_explore:
                    to_explore.remove(u)
                    explored.add(u)
                    queue.append(u)
    name = dynamic_size_architecture_name(DENSITY+str(density_prob), n_qubits)
    arch = Architecture(name=name, coupling_graph=graph, **kwargs)
    return arch

def create_ibm_rochester(backend=None, **kwargs):
    """
    Creates the IBM Rochester architecture, a 53-qubit architecture.
    
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: A IBM Rochester 53-qubit architecture
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(53)
    edges = connect_vertices_in_line([vertices[i] for i in range(53) if i not in [7, 14, 17,30,37, 40]])
    extra_edges = [(7, 8), (7,20), (14,15), (14,44), (17,18), (17, 28), (0,22), (30,31), (30,42), (37, 38), (40,41), (40,51)]
    edges += [(vertices[v1], vertices[v2]) for v1, v2 in extra_edges]
    graph.add_edges(edges)
    return Architecture(IBM_ROCHESTER, coupling_graph=graph, backend=backend, **kwargs)

def create_google_sycamore(backend=None, **kwargs):
    """
    Creates the Google Sycamore architecture, a 53-qubit architecture.
    
    :param backend: Backend associated with the architecture, default None
    :param **kwargs: Additional arguments passed
    :return: A Google Sycamore 53-qubit architecture
    """
    graph = Graph(backend=backend)
    vertices = graph.add_vertices(53)
    edges = connect_vertices_in_line([vertices[i] for i in range(53) if i not in [6,12,31,32,47,50]])
    extra_edges = []
    extra_edges += list(zip([0,1,4],[10,9,8]))
    extra_edges += list(zip(range(10, 5, -1),range(14,19)))
    extra_edges += list(zip(range(12,19),list(range(29,23, -1)) +[21]))
    extra_edges += list(zip(list(range(29,24, -1)), list(range(34,39))))
    extra_edges += list(zip(list(range(33,38)), [32] + list(range(43,39, -1))))
    extra_edges += list(zip(list(range(42,38, -1)), [45,46,48,47]))
    extra_edges += list(zip([45,46],[50,51]))
    extra_edges += list(zip([1,6,21,33,47,50,12,32,31],[4,7,24,38, 48,51,13,43,33]))
    edges += [(vertices[v1], vertices[v2]) for v1, v2 in extra_edges]
    graph.add_edges(edges)
    arch = Architecture(GOOGLE_SYCAMORE, coupling_graph=graph, backend=backend, **kwargs)
    return arch

def create_architecture(name: Union[str, Architecture], **kwargs) -> Architecture:
    """
    Creates an architecture from a name.

    :param name: The name of the architecture, see :py:data:`pyzx.routing.architectures` for the available constants.
    :param kwargs: Additional arguments to pass to the architecture constructor.
    :return: The architecture.
    """
    # Source Rigetti architectures: https://www.rigetti.com/qpu
    # TODO create the architectures from names in pyquil.list_quantum_computers() <- needs mapping
    # Source IBM architectures: http://iic.jku.at/files/eda/2018_tcad_mapping_quantum_circuit_to_ibm_qx.pdf​
    # IBM architectures are currently ignoring CNOT direction.
    if isinstance(name, Architecture):
        return name
    arch_dict: Dict[str, Any] = {}
    arch_dict[SQUARE] = create_square_architecture
    arch_dict[LINE] = create_line_architecture
    arch_dict[FULLY_CONNECTED] = create_fully_connected_architecture
    arch_dict[CIRCLE] = create_circle_architecture
    arch_dict[DENSITY] = create_dynamic_density_tree_architecture
    arch_dict[IBM_QX2] = create_ibm_qx2_architecture
    arch_dict[IBM_QX3] = create_ibm_qx3_architecture
    arch_dict[IBM_QX4] = create_ibm_qx4_architecture
    arch_dict[IBM_QX5] = create_ibm_qx5_architecture
    arch_dict[IBM_Q20_TOKYO] = create_ibm_q20_tokyo_architecture
    arch_dict[IBMQ_POUGHKEEPSIE] = create_ibmq_poughkeepsie
    arch_dict[IBMQ_SINGAPORE] = create_ibmq_singapore
    arch_dict[IBMQ_BOEBLINGEN] = lambda **kwargs : create_ibmq_singapore(name=IBMQ_BOEBLINGEN, **kwargs)
    arch_dict[IBM_ROCHESTER] = create_ibm_rochester
    arch_dict[RIGETTI_8Q_AGAVE] = create_rigetti_8q_agave_architecture
    arch_dict[RIGETTI_16Q_ASPEN] = create_rigetti_16q_aspen_architecture
    arch_dict[RIGETTI_19Q_ACORN] = create_rigetti_19q_acorn_architecture
    arch_dict[SYCAMORE_LIKE] = create_sycamore_like
    arch_dict[GOOGLE_SYCAMORE] = create_google_sycamore
    arch_dict[REC_ARCH] = create_recursive_architecture

    if name in arch_dict.keys():
        return arch_dict[name](**kwargs)
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
    n_qubits = 25
    for name in dynamic_size_architectures:
        arch = create_architecture(name, n_qubits=n_qubits)
        arch.visualize()

    arch = create_architecture(IBM_Q20_TOKYO)
    arch.visualize()
