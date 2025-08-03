"""
Graph states MODULE
"""


__all__ = [
    "is_graph_state",
    "conjugate_out_paulis",
    "get_bound",
    "normalize_graph_state",
    "local_comp_HS",
    "pivot",
    "local_comp_SH",
    "fix_input_output",
    "conjugate_in_paulis",
    "assert_intermediate",
    "state_to_circuit",
    "remove_unitaries_input",
    "remove_HS",
    "to_canonical_form",
    "remove_LC_pivot",
    "to_RRREF",
    "remove_pivot_edges",
]


from .simplify import is_graph_like, spider_simp, id_simp
from fractions import Fraction
from .d3 import draw_d3
from .graph.base import ET, VT, BaseGraph, EdgeType, VertexType
from .extract import connectivity_from_biadj, bi_adj
from typing import List, Tuple


def is_graph_state(g: BaseGraph[VT,ET], 
                   states: List[VT]) -> bool:
    """Check if the graph is a graph state."""

    if not is_graph_like(g, strict=True):
        return False
    
    for v in states:
        if g.phase(v) % Fraction(1, 2) != 0:
            return False
    
    for v in states:
        get_bound(g,v, states)

    return True

def local_comp_SH(
    g: BaseGraph[VT, ET],
    v: VT,
    states: List[VT]
) -> None:
    """
    Perform a local complementation with SH ending on vertex v.

    Args:
        g: The graph.
        v: The vertex to apply the local complementation to.
        states: The list of state vertices.
    """
    if not is_graph_state(g, states):
        raise ValueError("Graph is not graph-like")

    bound = get_bound(g, v, states)
    neighbors = [x for x in g.neighbors(v) if x in states]

    a = g.phases()[v]

    if not (a == 0 and g.edge_type(g.edge(bound, v)) == EdgeType.HADAMARD):
        raise ValueError("This LC must be applied with a SH ending")

    for x in neighbors:
        g.add_to_phase(x, Fraction(1, 2))

    for x in neighbors:
        for y in neighbors:
            if x >= y:
                continue
            connected = g.connected(x, y)
            if connected == 0:
                g.add_edge(edge_pair={x, y}, edgetype=EdgeType.HADAMARD)
            else:
                g.remove_edge((x, y))

def local_comp_HS(
    g: BaseGraph[VT, ET], 
    v: VT, 
    states: List[VT]
) -> None:
    """
    Perform a local complementation with HS ending on vertex v.

    Args:
        g: The graph.
        v: The vertex to apply the local complementation to.
        states: The list of state vertices.
    """
    if not is_graph_state(g, states):
        raise ValueError("Graph is not graph-like")

    bound = get_bound(g, v, states)
    neighbors = [x for x in g.neighbors(v) if x in states]

    a = g.phases()[v]

    if not (a == Fraction(1, 2) and g.edge_type(g.edge(bound, v)) == EdgeType.HADAMARD):
        raise ValueError("This LC must be applied with a HS ending")

    g.add_to_phase(v, 1)
    g.set_edge_type(g.edge(bound, v), EdgeType.SIMPLE)
    for x in neighbors:
        g.add_to_phase(x, 1)
            
    for x in neighbors:
        g.add_to_phase(x, Fraction(1, 2))

    for x in neighbors:
        for y in neighbors:
            if x >= y:
                continue
            connected = g.connected(x, y)
            if connected == 0:
                g.add_edge(edge_pair={x, y}, edgetype=EdgeType.HADAMARD)
            else:
                g.remove_edge((x, y))

def pivot(g: BaseGraph[VT, ET], x: VT, y: VT, states: List[VT]) -> None:
    """
    Perform a pivot operation between vertices x and y in the graph state.
    
    Args:
        g: The graph to operate on
        x: First vertex for pivot operation
        y: Second vertex for pivot operation
        states: List of state vertices
        
    Raises:
        ValueError: If the graph is not in a valid state for pivoting
    """
    if not is_graph_state(g, states):
        raise ValueError("Graph is not a valid graph state")
    
    A = [neighbor for neighbor in g.neighbors(x) if neighbor in states] + [x]
    B = [neighbor for neighbor in g.neighbors(y) if neighbor in states] + [y]

    edge_x = g.edge(x, get_bound(g, x, states))
    type_x = g.edge_type(edge_x)
    edge_y = g.edge(y, get_bound(g, y, states))
    type_y = g.edge_type(edge_y)

    # Flip edge types
    if type_x == EdgeType.SIMPLE:
        type_x = EdgeType.HADAMARD
    else:
        type_x = EdgeType.SIMPLE

    if type_y == EdgeType.SIMPLE:
        type_y = EdgeType.HADAMARD
    else:
        type_y = EdgeType.SIMPLE

    g.set_edge_type(edge_x, type_x)
    g.set_edge_type(edge_y, type_y)

    g.set_phase(x, g.phase(x) + 1)
    g.set_phase(y, g.phase(y) + 1)

    conjugate_out_paulis(g, states)
    
    # Add/remove edges between A and B sets
    for i in range(len(A)):
        for j in range(len(B)):
            if A[i] == B[j]:
                continue
            elif not g.connected(A[i], B[j]):
                g.add_edge((A[i], B[j]), edgetype=EdgeType.HADAMARD)
            else:
                g.remove_edge(g.edge(A[i], B[j]))

def fix_input_output(g: BaseGraph[VT, ET], states: List[VT]) -> None:
    """
    Fix input/output connections by ensuring each state vertex has exactly one boundary connection.
    
    Args:
        g: The graph to fix
        states: List of state vertices (will be modified in-place)
        
    Raises:
        ValueError: If the graph is not graph-like
    """
    if not is_graph_like(g):
        raise ValueError("Graph is not graph-like")

    for v in states:
        bound = [x for x in g.neighbors(v) if x not in states]
        if len(bound) > 1:
            # print("Vertex:", v, "Phase:", g.phase(v), "Type:", g.types()[v])
            for i in range(len(bound) - 1):
                edge_type = g.edge_type(g.edge(bound[i], v))
                new = g.add_vertex(VertexType.Z)
                states.append(new)
                if edge_type == EdgeType.HADAMARD:
                    g.add_edge((bound[i], new), EdgeType.SIMPLE)
                    g.add_edge((new, v), EdgeType.HADAMARD)
                else:
                    g.add_edge((bound[i], new), EdgeType.HADAMARD)
                    g.add_edge((new, v), EdgeType.HADAMARD)
                g.remove_edge((bound[i], v))

def conjugate_out_paulis(g: BaseGraph[VT, ET], states: List[VT]) -> None:
    """
    Conjugate out Pauli operators from the graph state.
    
    Args:
        g: The graph to operate on
        states: List of state vertices
    """
    for v in states:

        bound = get_bound(g, v, states)

        a = g.phase(v)
        row = g.row(bound) - 1

        if a > Fraction(1, 2):
            edge_type = g.edge_type(g.edge(bound, v))
            if edge_type == EdgeType.HADAMARD:
                new = g.add_vertex(VertexType.X, phase=1)
                g.set_qubit(new, g.qubit(v))
                g.set_row(new, row)
                g.add_edge((bound, new), EdgeType.SIMPLE)
                g.add_edge((new, v), EdgeType.HADAMARD)
                g.remove_edge((bound, v))
                g.set_phase(v, a - 1)
            else:
                new = g.add_vertex(VertexType.Z, phase=1)
                g.set_qubit(new, g.qubit(v))
                g.set_row(new, row)
                g.add_edge((bound, new), EdgeType.SIMPLE)
                g.add_edge((new, v), EdgeType.SIMPLE)
                g.remove_edge((bound, v))
                g.set_phase(v, a - 1)

        # spider_simp(g, matchf = lambda edge: g.edge_s(edge) not in states)
        spider_simp(g, matchf = lambda x: x not in states)
        id_simp(g, matchf = lambda x: x not in states)

def get_bound(g: BaseGraph[VT, ET], s: VT, states: List[VT]) -> VT:
    """
    Get the boundary vertex connected to state vertex s.
    
    Args:
        g: The graph
        s: The state vertex
        states: List of all state vertices
        
    Returns:
        The boundary vertex connected to s
        
    Raises:
        ValueError: If the vertex doesn't have exactly one boundary vertex
    """
    bounds = [x for x in g.neighbors(s) if x not in states]
    if len(bounds) != 1:
        raise ValueError(f"Vertex {s} has {len(bounds)} boundary vertices: {bounds}, expected exactly 1")
    return bounds[0]

def normalize_graph_state(g: BaseGraph[VT, ET], states: List[VT]) -> None:
    """
    Normalize the graph state by setting proper qubit and row assignments.
    
    Args:
        g: The graph to normalize
        states: List of state vertices
        
    Raises:
        ValueError: If the graph is not a valid graph state
    """
    if not is_graph_state(g, states):
        raise ValueError("Graph is not a valid graph state")

    for i in range(len(states)):
        g.set_qubit(states[i], i)
        g.set_row(states[i], (i % 2) * 4)
        bound = get_bound(g, states[i], states)
        g.set_qubit(bound, i)
        g.set_row(bound, 10)

def conjugate_in_paulis(g: BaseGraph[VT, ET], states: List[VT]) -> None:
    """
    Conjugate in Pauli operators to the graph state.
    
    Args:
        g: The graph to operate on
        states: List of state vertices
        
    Raises:
        ValueError: If a non-Pauli vertex is encountered that should be conjugated in
    """
    go_on = True
    while go_on:
        go_on = False
        for v in states:
            bound = get_bound(g, v, states)
            bound_type = g.types()[bound]
            if bound_type != VertexType.BOUNDARY:
                go_on = True
                a = g.phase(bound)
                if a != 1:
                    raise ValueError(f"Vertex {bound} must be Pauli (phase=1) to conjugate in, but has phase={a}")
                
                edge_type = g.edge_type(g.edge(v, bound))
                if (edge_type == EdgeType.HADAMARD and bound_type == VertexType.X or 
                    edge_type == EdgeType.SIMPLE and bound_type == VertexType.Z):
                    g.add_to_phase(v, 1)
                elif (edge_type == EdgeType.HADAMARD and bound_type == VertexType.Z or 
                      edge_type == EdgeType.SIMPLE and bound_type == VertexType.X):
                    for x in g.neighbors(v):
                        if x in states:
                            g.add_to_phase(x, 1)

                new_bound = get_bound(g, bound, states)
                g.remove_vertex(bound)
                g.add_edge({v, new_bound}, edge_type)

def assert_intermediate(g: BaseGraph[VT, ET], states: List[VT]) -> bool:
    """
    Check that after local complementing there is only one LC gate H or S on each state.
    
    Args:
        g: The graph to check
        states: List of state vertices
        
    Returns:
        True if the intermediate condition is satisfied, False otherwise
    """
    for v in states:
        edge = g.edge(v, get_bound(g, v, states))
        if g.phase(v) != 0 and g.edge_type(edge) == EdgeType.HADAMARD:
            return False
    
    return True

def state_to_circuit(g: BaseGraph[VT, ET], states: List[VT]) -> None:
    """
    Convert graph state to circuit representation by setting qubit and row positions.
    
    Args:
        g: The graph to convert
        states: List of state vertices
    """
    ins = g.inputs()
    print(ins)

    for i in range(len(ins)):
        g.set_qubit(ins[i], i)
        g.set_row(ins[i], 0)

    outs = g.outputs()
    for i in range(len(outs)):
        g.set_qubit(outs[i], i)
        g.set_row(outs[i], 8)

    for x in states:
        bound = get_bound(g, x, states)
        g.set_qubit(x, g.qubit(bound))
        if bound in ins:
            g.set_row(x, 3)
        else: 
            g.set_row(x, 6)

def remove_unitaries_input(g: BaseGraph[VT, ET], states: List[VT]) -> None:
    """
    Remove unitary operations from input vertices.
    
    Args:
        g: The graph to modify
        states: List of state vertices
    """
    ins = g.inputs()
    for v in states:
        bound = get_bound(g, v, states)
        if bound in ins:
            g.set_phase(v, 0)
            e = g.edge(v, bound)
            g.set_edge_type(e, EdgeType.SIMPLE)

    for e in g.edge_set():
        v, w = e
        if v in states and w in states:
            b1 = get_bound(g, v, states)
            b2 = get_bound(g, w, states)
            if b1 in ins and b2 in ins:
                g.remove_edge(e)

def remove_HS(g: BaseGraph[VT, ET], states: List[VT], quiet: bool = True) -> None:
    """
    Remove all HS local Clifford operations from the graph state.
    
    Args:
        g: The graph to modify
        states: List of state vertices
        quiet: If False, display intermediate steps
    """
    go_on = True
    while go_on:
        go_on = False
        for v in states:
            if (g.phase(v) == Fraction(1, 2) and 
                g.edge_type(g.edge(get_bound(g, v, states), v)) == EdgeType.HADAMARD):
                local_comp_HS(g, v, states)
                conjugate_out_paulis(g, states)
                go_on = True
                if not quiet:
                    draw_d3(g, labels=True, scale=65)
                break

def to_canonical_form(g: BaseGraph[VT, ET], states: List[VT], quiet: bool = True) -> None:
    """
    Transform the graph state to a canonical form.
    
    Args:
        g: The graph to transform
        states: List of state vertices
        quiet: If False, display intermediate steps and print pivot operations
    """
    go_on = True
    while go_on:
        go_on = False
        for v in states:
            edge = g.edge(v, get_bound(g, v, states))
            if g.edge_type(edge) == EdgeType.HADAMARD:
                neigh = [x for x in g.neighbors(v) if x in states]
                for x in neigh:
                    if x < v:
                        pivot(g, v, x, states)
                        if g.phases()[x] == Fraction(1, 2): 
                            local_comp_SH(g, x, states)
                            conjugate_out_paulis(g, states)
                        if not quiet:
                            print("Pivoted on:", v, x)
                            draw_d3(g, labels=True, scale=65)
                        go_on = True
                        break

def remove_LC_pivot(g: BaseGraph[VT, ET], states: List[VT], pivots: List[VT]) -> None:
    """
    Remove local complementation pivot operations.
    
    Args:
        g: The graph to modify
        states: List of state vertices
        pivots: List of pivot vertices
    """
    go_on = True
    while go_on:
        go_on = False
        for v in pivots:
            if g.phases()[v] != 0:
                vin = [x for x in g.neighbors(v) if x in states]
                if not vin:
                    raise ValueError(f"Pivot vertex {v} has no neighbors in states")
                vin = vin[0]
                local_comp_HS(g, vin, states)
                go_on = True
                break

def to_RRREF(g: BaseGraph[VT, ET], states: List[VT]) -> List[VT]:
    """
    Transform the graph state to a reduced row echelon form.
    
    Args:
        g: The graph to transform
        states: List of state vertices
        
    Returns:
        List of pivot vertices
    """
    ins = [x for x in states if get_bound(g, x, states) in g.inputs()]
    outs = [x for x in states if get_bound(g, x, states) in g.outputs()]

    mat = bi_adj(g, ins, outs)
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

    connectivity_from_biadj(g, mat, ins, outs)
  
    return pivots

def remove_pivot_edges(g: BaseGraph[VT, ET], states: List[VT], pivots: List[VT]) -> None:
    """
    Remove edges between pivot vertices.
    
    Args:
        g: The graph to modify
        states: List of state vertices (unused but kept for consistency)
        pivots: List of pivot vertices
    """
    for x in pivots:
        for y in pivots:
            if x != y and g.connected(x, y):
                g.remove_edge(g.edge(x, y))




