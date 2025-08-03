"""
Graph states MODULE
"""


__all__ = [
    "GraphState",
    "is_graph_state",
]


from .simplify import is_graph_like, spider_simp, id_simp
from fractions import Fraction
from .d3 import draw_d3
from .graph.base import ET, VT, BaseGraph, EdgeType, VertexType
from .extract import connectivity_from_biadj, bi_adj
from typing import List, Tuple, Dict

class GraphState:
    """
    A class representing a graph state.
    
    It is a wrapper for BaseGraph and provides additional functionality for graph state operations.
    """

    def __init__(self, graph: BaseGraph[VT, ET], states: List[VT]):
        """
        Initialize a GraphState.
        
        Args:
            graph: The underlying graph
            states: List of state vertices
        """
        self._graph = graph
        self._states = states
        self._bound: Dict[VT, VT] = {}
        self._update_bounds()

    def _update_bounds(self) -> None:
        """Update the mapping from state vertices to their boundary vertices."""
        for v in self._states:
            bounds = [x for x in self._graph.neighbors(v) if x not in self._states]
            if len(bounds) == 1:
                self._bound[v] = bounds[0]

    def validate(self) -> bool:
        """
        Validate if this is a proper graph state.
        
        Returns:
            True if valid graph state, False otherwise
        """
        if not is_graph_like(g, strict=True):
            return False
        
        for v in self._states:
            if self._graph.phase(v) % Fraction(1, 2) != 0:
                return False
        
        for v in self._states:
            self.get_bound(v)

        return True
    
    def get_states(self) -> List[VT]:
        """
        Get the list of state vertices.
        
        Returns:
            List of state vertices
        """
        return self._states
    
    def get_bound(self, s: VT) -> VT:
        """
        Get the boundary vertex connected to state vertex s.
        
        Args:
            s: The state vertex
        
        Returns:
            The boundary vertex connected to s
            
        Raises:
            ValueError: If the vertex doesn't have exactly one boundary vertex
        """
        if s in self._bound:
            return self._bound[s]
        
        bounds = [x for x in self._graph.neighbors(s) if x not in self._states]
        if len(bounds) != 1:
            raise ValueError(f"Vertex {s} has {len(bounds)} boundary vertices: {bounds}, expected exactly 1")
        
        self._bound[s] = bounds[0]
        return bounds[0]

    def local_comp_SH(self, v: VT) -> None:
        """
        Perform a local complementation with SH ending on vertex v.

        Args:
            v: The vertex to apply the local complementation to.
            
        Raises:
            ValueError: If the graph is not a valid graph state or LC conditions not met
        """
        if not self.validate():
            raise ValueError("Graph is not a valid graph state")

        bound = self.get_bound(v)
        neighbors = [x for x in self._graph.neighbors(v) if x in self._states]

        a = self._graph.phase(v)

        if not (a == 0 and self._graph.edge_type(self._graph.edge(bound, v)) == EdgeType.HADAMARD):
            raise ValueError("This LC must be applied with a SH ending")

        for x in neighbors:
            self._graph.add_to_phase(x, Fraction(1, 2))

        for x in neighbors:
            for y in neighbors:
                if x >= y:
                    continue
                connected = self._graph.connected(x, y)
                if connected == 0:
                    self._graph.add_edge(edge_pair={x, y}, edgetype=EdgeType.HADAMARD)
                else:
                    self._graph.remove_edge((x, y))

    def local_comp_HS(self, v: VT) -> None:
        """
        Perform a local complementation with HS ending on vertex v.

        Args:
            v: The vertex to apply the local complementation to.
            
        Raises:
            ValueError: If the graph is not a valid graph state or LC conditions not met
        """
        if not self.validate():
            raise ValueError("Graph is not a valid graph state")

        bound = self.get_bound(v)
        neighbors = [x for x in self._graph.neighbors(v) if x in self._states]

        a = self._graph.phase(v)

        if not (a == Fraction(1, 2) and self._graph.edge_type(self._graph.edge(bound, v)) == EdgeType.HADAMARD):
            raise ValueError("This LC must be applied with a HS ending")

        self._graph.add_to_phase(v, 1)
        self._graph.set_edge_type(self._graph.edge(bound, v), EdgeType.SIMPLE)
        for x in neighbors:
            self._graph.add_to_phase(x, 1)
                
        for x in neighbors:
            self._graph.add_to_phase(x, Fraction(1, 2))

        for x in neighbors:
            for y in neighbors:
                if x >= y:
                    continue
                connected = self._graph.connected(x, y)
                if connected == 0:
                    self._graph.add_edge(edge_pair={x, y}, edgetype=EdgeType.HADAMARD)
                else:
                    self._graph.remove_edge((x, y))

    def pivot(self, x: VT, y: VT) -> None:
        """
        Perform a pivot operation between vertices x and y in the graph state.
        
        Args:
            x: First vertex for pivot operation
            y: Second vertex for pivot operation
            
        Raises:
            ValueError: If the graph is not in a valid state for pivoting
        """
        if not self.validate():
            raise ValueError("Graph is not a valid graph state")
        
        A = [neighbor for neighbor in self._graph.neighbors(x) if neighbor in self._states] + [x]
        B = [neighbor for neighbor in self._graph.neighbors(y) if neighbor in self._states] + [y]

        edge_x = self._graph.edge(x, self.get_bound(x))
        type_x = self._graph.edge_type(edge_x)
        edge_y = self._graph.edge(y, self.get_bound(y))
        type_y = self._graph.edge_type(edge_y)

        # Flip edge types
        if type_x == EdgeType.SIMPLE:
            type_x = EdgeType.HADAMARD
        else:
            type_x = EdgeType.SIMPLE

        if type_y == EdgeType.SIMPLE:
            type_y = EdgeType.HADAMARD
        else:
            type_y = EdgeType.SIMPLE

        self._graph.set_edge_type(edge_x, type_x)
        self._graph.set_edge_type(edge_y, type_y)

        self._graph.set_phase(x, self._graph.phase(x) + 1)
        self._graph.set_phase(y, self._graph.phase(y) + 1)

        self.conjugate_out_paulis()
        
        # Add/remove edges between A and B sets
        for i in range(len(A)):
            for j in range(len(B)):
                if A[i] == B[j]:
                    continue
                elif not self._graph.connected(A[i], B[j]):
                    self._graph.add_edge((A[i], B[j]), edgetype=EdgeType.HADAMARD)
                else:
                    self._graph.remove_edge(self._graph.edge(A[i], B[j]))

    def fix_input_output(self) -> None:
        """
        Fix input/output connections by ensuring each state vertex has exactly one boundary connection.
        
        Raises:
            ValueError: If the graph is not graph-like
        """
        if not is_graph_like(self._graph):
            raise ValueError("Graph is not graph-like")

        for v in self._states:
            bound = [x for x in self._graph.neighbors(v) if x not in self._states]
            if len(bound) > 1:
                # print("Vertex:", v, "Phase:", g.phase(v), "Type:", g.types()[v])
                for i in range(len(bound) - 1):
                    edge_type = self._graph.edge_type(self._graph.edge(bound[i], v))
                    new = self._graph.add_vertex(VertexType.Z)
                    self._states.append(new)
                    if edge_type == EdgeType.HADAMARD:
                        self._graph.add_edge((bound[i], new), EdgeType.SIMPLE)
                        self._graph.add_edge((new, v), EdgeType.HADAMARD)
                    else:
                        self._graph.add_edge((bound[i], new), EdgeType.HADAMARD)
                        self._graph.add_edge((new, v), EdgeType.HADAMARD)
                    self._graph.remove_edge((bound[i], v))
        
        self._update_bounds()

    def conjugate_out_paulis(self) -> None:
        """
        Conjugate out Pauli operators from the graph state.
        """
        for v in self._states:
            bound = self.get_bound(v)
            a = self._graph.phase(v)
            row = self._graph.row(bound) - 1

            if a > Fraction(1, 2):
                edge_type = self._graph.edge_type(self._graph.edge(bound, v))
                if edge_type == EdgeType.HADAMARD:
                    new = self._graph.add_vertex(VertexType.X, phase=1)
                    self._graph.set_qubit(new, self._graph.qubit(v))
                    self._graph.set_row(new, row)
                    self._graph.add_edge((bound, new), EdgeType.SIMPLE)
                    self._graph.add_edge((new, v), EdgeType.HADAMARD)
                    self._graph.remove_edge((bound, v))
                    self._graph.set_phase(v, a - 1)
                else:
                    new = self._graph.add_vertex(VertexType.Z, phase=1)
                    self._graph.set_qubit(new, self._graph.qubit(v))
                    self._graph.set_row(new, row)
                    self._graph.add_edge((bound, new), EdgeType.SIMPLE)
                    self._graph.add_edge((new, v), EdgeType.SIMPLE)
                    self._graph.remove_edge((bound, v))
                    self._graph.set_phase(v, a - 1)

            spider_simp(self._graph, matchf=lambda x: x not in self._states)
            id_simp(self._graph, matchf=lambda x: x not in self._states)

    def normalize(self) -> None:
        """
        Normalize the graph state by setting proper qubit and row assignments.
        
        Raises:
            ValueError: If the graph is not a valid graph state
        """
        if not self.validate():
            raise ValueError("Graph is not a valid graph state")

        for i in range(len(self._states)):
            self._graph.set_qubit(self._states[i], i)
            self._graph.set_row(self._states[i], (i % 2) * 4)
            bound = self.get_bound(self._states[i])
            self._graph.set_qubit(bound, i)
            self._graph.set_row(bound, 10)

    def conjugate_in_paulis(self) -> None:
        """
        Conjugate in Pauli operators to the graph state.
        
        Raises:
            ValueError: If a non-Pauli vertex is encountered that should be conjugated in
        """
        go_on = True
        while go_on:
            go_on = False
            for v in self._states:
                bound = self.get_bound(v)
                bound_type = self._graph.types()[bound]
                if bound_type != VertexType.BOUNDARY:
                    go_on = True
                    a = self._graph.phase(bound)
                    if a != 1:
                        raise ValueError(f"Vertex {bound} must be Pauli (phase=1) to conjugate in, but has phase={a}")
                    
                    edge_type = self._graph.edge_type(self._graph.edge(v, bound))
                    if (edge_type == EdgeType.HADAMARD and bound_type == VertexType.X or 
                        edge_type == EdgeType.SIMPLE and bound_type == VertexType.Z):
                        self._graph.add_to_phase(v, 1)
                    elif (edge_type == EdgeType.HADAMARD and bound_type == VertexType.Z or 
                          edge_type == EdgeType.SIMPLE and bound_type == VertexType.X):
                        for x in self._graph.neighbors(v):
                            if x in self._states:
                                self._graph.add_to_phase(x, 1)

                    new_bound = get_bound(self._graph, bound, self._states)
                    self._graph.remove_vertex(bound)
                    self._graph.add_edge({v, new_bound}, edge_type)
                    break
        
        self._update_bounds()

    def assert_intermediate(self) -> bool:
        """
        Check that after local complementing there is only one LC gate H or S on each state.
        
        Returns:
            True if the intermediate condition is satisfied, False otherwise
        """
        for v in self._states:
            edge = self._graph.edge(v, self.get_bound(v))
            if self._graph.phase(v) != 0 and self._graph.edge_type(edge) == EdgeType.HADAMARD:
                return False
        
        return True

    def to_circuit(self) -> None:
        """
        Convert graph state to circuit representation by setting qubit and row positions.
        """
        ins = self._graph.inputs()
        print(ins)

        for i in range(len(ins)):
            self._graph.set_qubit(ins[i], i)
            self._graph.set_row(ins[i], 0)

        outs = self._graph.outputs()
        for i in range(len(outs)):
            self._graph.set_qubit(outs[i], i)
            self._graph.set_row(outs[i], 8)

        for x in self._states:
            bound = self.get_bound(x)
            self._graph.set_qubit(x, self._graph.qubit(bound))
            if bound in ins:
                self._graph.set_row(x, 3)
            else: 
                self._graph.set_row(x, 6)

    def remove_unitaries_input(self) -> None:
        """
        Remove unitary operations from input vertices.
        """
        ins = self._graph.inputs()
        for v in self._states:
            bound = self.get_bound(v)
            if bound in ins:
                self._graph.set_phase(v, 0)
                e = self._graph.edge(v, bound)
                self._graph.set_edge_type(e, EdgeType.SIMPLE)

        for e in self._graph.edge_set():
            v, w = e
            if v in self._states and w in self._states:
                b1 = self.get_bound(v)
                b2 = self.get_bound(w)
                if b1 in ins and b2 in ins:
                    self._graph.remove_edge(e)

    def remove_HS(self, quiet: bool = True) -> None:
        """
        Remove all HS local Clifford operations from the graph state.
        
        Args:
            quiet: If False, display intermediate steps
        """
        go_on = True
        while go_on:
            go_on = False
            for v in self._states:
                if (self._graph.phase(v) == Fraction(1, 2) and 
                    self._graph.edge_type(self._graph.edge(self.get_bound(v), v)) == EdgeType.HADAMARD):
                    self.local_comp_HS(v)
                    self.conjugate_out_paulis()
                    go_on = True
                    if not quiet:
                        draw_d3(self._graph, labels=True, scale=65)
                    break

    def to_canonical_form(self, quiet: bool = True) -> None:
        """
        Transform the graph state to a canonical form.
        
        Args:
            quiet: If False, display intermediate steps and print pivot operations
        """
        go_on = True
        while go_on:
            go_on = False
            for v in self._states:
                edge = self._graph.edge(v, self.get_bound(v))
                if self._graph.edge_type(edge) == EdgeType.HADAMARD:
                    neigh = [x for x in self._graph.neighbors(v) if x in self._states]
                    for x in neigh:
                        if x < v:
                            self.pivot(v, x)
                            if self._graph.phase(x) == Fraction(1, 2): 
                                self.local_comp_SH(x)
                                self.conjugate_out_paulis()
                            if not quiet:
                                print("Pivoted on:", v, x)
                                draw_d3(self._graph, labels=True, scale=65)
                            go_on = True
                            break

    def remove_LC_pivot(self, pivots: List[VT]) -> None:
        """
        Remove local complementation pivot operations.
        
        Args:
            pivots: List of pivot vertices
        """
        go_on = True
        while go_on:
            go_on = False
            for v in pivots:
                if self._graph.phase(v) != 0:
                    vin = [x for x in self._graph.neighbors(v) if x in self._states]
                    if not vin:
                        raise ValueError(f"Pivot vertex {v} has no neighbors in states")
                    vin = vin[0]
                    self.local_comp_HS(vin)
                    go_on = True
                    break

    def to_RRREF(self) -> List[VT]:
        """
        Transform the graph state to a reduced row echelon form.
        
        Returns:
            List of pivot vertices
        """
        ins = [x for x in self._states if self.get_bound(x) in self._graph.inputs()]
        outs = [x for x in self._states if self.get_bound(x) in self._graph.outputs()]

        mat = bi_adj(self._graph, ins, outs)
        mat = mat.transpose()

        print(mat)

        mat.gauss(full_reduce=True)
        pivots = []
        for i in range(mat.rows()):
            for j in range(mat.cols()):
                if mat[i, j] != 0:
                    pivots.append(j)
                    break

        pivots = [outs[j] for j in pivots]
        mat = mat.transpose()

        connectivity_from_biadj(self._graph, mat, ins, outs)
      
        return pivots

    def remove_pivot_edges(self, pivots: List[VT]) -> None:
        """
        Remove edges between pivot vertices.
        
        Args:
            pivots: List of pivot vertices
        """
        for x in pivots:
            for y in pivots:
                if x != y and self._graph.connected(x, y):
                    self._graph.remove_edge(self._graph.edge(x, y))





