from .simplify import is_graph_like, spider_simp, id_simp
from fractions import Fraction
from .d3 import draw_d3
from .graph.base import EdgeType, VertexType
from .extract import connectivity_from_biadj, bi_adj

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
    "remove_LC_pivot"
]

def is_graph_state(g, states):
    """Check if the graph is a graph state."""

    if not is_graph_like(g, strict=True):
        return False
    
    for v in states:
        if g.phase(v) % Fraction(1, 2) != 0:
            return False
    
    for v in states:
        get_bound(g,v, states)

    return True

def local_comp_SH(g, v, states):

    assert is_graph_state(g, states), "Graph is not graph-like"

    bound = get_bound(g, v, states)
    neighbors = [x for x in g.neighbors(v) if x in states]

    a = g.phases()[v]

    assert a == 0 and g.edge_type(g.edge(bound, v)) == EdgeType.HADAMARD, "This LC must be applied with a SH ending"

    for x in neighbors:
        g.add_to_phase(x, Fraction(1, 2))

    for x in neighbors:
        for y in neighbors:
            if x >= y:
                continue
            connected = g.connected(x, y)
            if connected == 0:
                g.add_edge(edge_pair={x,y}, edgetype=EdgeType.HADAMARD)
            else:
                g.remove_edge((x, y))

def local_comp_HS(g, v, states):

    assert is_graph_state(g, states), "Graph is not graph-like"

    bound = get_bound(g, v, states)
    neighbors = [x for x in g.neighbors(v) if x in states]

    a = g.phases()[v]

    assert a == Fraction(1,2) and g.edge_type(g.edge(bound, v)) == EdgeType.HADAMARD, "This LC must be applied with a HS ending"

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
                g.add_edge(edge_pair={x,y}, edgetype=EdgeType.HADAMARD)
            else:
                g.remove_edge((x, y))

def pivot(g, x, y, states):
    A = [x for x in g.neighbors(x) if x in states] + [x]
    B = [y for y in g.neighbors(y) if y in states] + [y]

    edge_x = g.edge(x, get_bound(g, x, states))
    type_x = g.edge_type(edge_x)
    edge_y = g.edge(y, get_bound(g, y, states))
    type_y = g.edge_type(edge_y)

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
    for i in range(len(A)):
        for y in range(len(B)):
            if A[i] == B[y]:
                continue
            elif g.connected(A[i], B[y]) == False:
                g.add_edge((A[i], B[y]), edgetype=EdgeType.HADAMARD)
            else:
                g.remove_edge(g.edge(A[i], B[y]))

def fix_input_output(g, states):

    assert is_graph_like(g)

    for v in states:
        bound = [x for x in g.neighbors(v) if x not in states]
        if len(bound) > 1:
            # print("Vertex:", v, "Phase:", g.phase(v), "Type:", g.types()[v])
            for i in range(len(bound) - 1):
                type = g.edge_type(g.edge(bound[i], v))
                new = g.add_vertex(VertexType.Z)
                states.append(new)
                if type == EdgeType.HADAMARD:
                    g.add_edge((bound[i], new), EdgeType.SIMPLE)
                    g.add_edge((new, v), EdgeType.HADAMARD)
                else:
                    g.add_edge((bound[i], new), EdgeType.HADAMARD)
                    g.add_edge((new, v), EdgeType.HADAMARD)
                g.remove_edge((bound[i], v))

def conjugate_out_paulis(g, states):
    for v in states:

        bound = get_bound(g, v, states)

        a = g.phase(v)
        row = g.row(bound) -1

        if a > Fraction(1, 2):
            type = g.edge_type(g.edge(bound, v))
            if type == EdgeType.HADAMARD:
                new = g.add_vertex(VertexType.X, phase = 1)
                g.set_qubit(new, g.qubit(v))
                
                g.set_row(new, row)
                g.add_edge((bound, new), EdgeType.SIMPLE)
                g.add_edge((new, v), EdgeType.HADAMARD)
                g.remove_edge((bound, v))
                g.set_phase(v, a - 1)
            else:
                new = g.add_vertex(VertexType.Z, phase = 1)
                g.set_qubit(new, g.qubit(v))
                g.set_row(new, row)
                g.add_edge((bound, new), EdgeType.SIMPLE)
                g.add_edge((new, v), EdgeType.SIMPLE)
                g.remove_edge((bound, v))
                g.set_phase(v, a - 1)

        # spider_simp(g, matchf = lambda edge: g.edge_s(edge) not in states)
        spider_simp(g, matchf = lambda x: x not in states)
        id_simp(g, matchf = lambda x: x not in states)

def get_bound(g, s, states):
    bounds = [x for x in g.neighbors(s) if x not in states]
    assert len(bounds) == 1, "Vertex {} has {} boundary vertex: {}".format(s, len(bounds), bounds)
    return bounds[0]

def normalize_graph_state(g, states):
    assert is_graph_state(g, states), "Graph is not graph-state"

    for i in range(len(states)):
        g.set_qubit(states[i],i)
        g.set_row(states[i], (i % 2)*4 )
        buond = get_bound(g, states[i], states)
        g.set_qubit(buond, i)
        g.set_row(buond, 10)

def conjugate_in_paulis(g, states):
    go_on = True
    while go_on:
        go_on = False
        for v in states:
            bound = get_bound(g, v, states)
            bound_type = g.types()[bound]
            if bound_type != VertexType.BOUNDARY:
                go_on = True
                a = g.phase(bound)
                assert a == 1, "Must be Pauli to conjugate in"
                edge_type = g.edge_type(g.edge(v, bound))
                if edge_type == EdgeType.HADAMARD and bound_type == VertexType.X or edge_type == EdgeType.SIMPLE and bound_type == VertexType.Z:
                    g.add_to_phase(v, 1)
                elif edge_type == EdgeType.HADAMARD and bound_type == VertexType.Z or edge_type == EdgeType.SIMPLE and bound_type == VertexType.X:
                    for x in g.neighbors(v):
                        if x in states:
                            g.add_to_phase(x, 1)

                new_bound = get_bound(g, bound, states)
                g.remove_vertex(bound)
                g.add_edge({v, new_bound}, edge_type)

# check that after local complementing there is only one LC gate H or S on each state
def assert_intermediate(g, states):
    for v in states:
        edge = g.edge(v, get_bound(v, states))
        if g.phase(v) != 0 and g.edge_type(edge) == EdgeType.HADAMARD:
            return False
    
    return True

def state_to_circuit(g, states):
    ins = g.inputs()
    print(ins)

    for i in range(len(ins)):
        g.set_qubit(ins[i], i)
        g.set_row(ins[i],0)

    outs = g.outputs()
    for i in range(len(outs)):
        g.set_qubit(outs[i],i)
        g.set_row(outs[i], 8)

    # g.set_row(0,0)
    for x in states:
        bound = get_bound(g, x, states)
        g.set_qubit(x, g.qubit(bound))
        if bound in ins:
            g.set_row(x, 3)
        else: 
            g.set_row(x, 6)

def remove_unitaries_input(g, states):
    ins = g.inputs()
    for v in states:
        bound = get_bound(g, v, states)
        if bound in ins:
            g.set_phase(v, 0)
            e = g.edge(v, bound)
            g.set_edge_type(e, EdgeType.SIMPLE)

        for e in g.edge_set():
            v,w = e
            if v in states and w in states:
                b1 = get_bound(g, v, states)
                b2 = get_bound(g, w, states)
                if b1 in ins and b2 in ins:
                    g.remove_edge(e)

def remove_HS(g, states, quiet=True):
    """
    Remove all HS local cliffords from the graph state.
    """
    go_on = True
    while go_on:
        go_on = False
        for v in states:
            if g.phase(v) == Fraction(1, 2) and g.edge_type(g.edge(get_bound(g,v, states), v)) == EdgeType.HADAMARD:
                    local_comp_HS(g, v, states)
                    conjugate_out_paulis(g, states)
                    go_on = True
                    if not quiet: draw_d3(g,labels=True, scale=65)
                    break   
            

def to_canonical_form(g, states, quiet=True):
    """
    Transform the graph state to a canonical form.
    """
    go_on = True
    while go_on:
        go_on = False
        for v in states:
            edge = g.edge(v, get_bound(g, v, states))
            if g.edge_type(edge) == EdgeType.HADAMARD:
                neigh = [x for x in g.neighbors(v) if x in states]
                for x in neigh:
                    # edge_x = g.edge(x, get_bound(x, states))
                    if x < v:
                        pivot(g, v, x, states)
                        if g.phases()[x] == Fraction(1,2): 
                            local_comp_SH(g, x, states)
                            conjugate_out_paulis(g, states)
                        if not quiet: print("Pivoted on:", v, x)
                        if not quiet: draw_d3(g,labels=True, scale=65)
                        go_on = True
                        break

def remove_LC_pivot(g, states, pivots):
    """
    Remove all local complementations from the graph state.
    """
    go_on = True
    while go_on:
        for v in pivots:
            go_on = False
            if g.phases()[v] != 0:
                vin = [x for x in g.neighbors(v) if x in states]
                vin = vin[0]
                local_comp_HS(g, vin, states)
                go_on = True