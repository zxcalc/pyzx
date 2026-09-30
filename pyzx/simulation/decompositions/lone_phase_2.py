"""
The fourth decomposition introduced in https://arxiv.org/pdf/2412.17182
"""

from . import Decomp, register_decomp, register_validity_checker
from ...graph.base import BaseGraph, VT, ET
from ...utils import EdgeType, VertexType
from ..common import SumGraph
from fractions import Fraction


def is_Tlike(g: BaseGraph[VT, ET], v: VT) -> tuple[bool, int]:
    if (g.phase(v) * 4) % 2 == 1:
        return (True, ((g.phase(v) * 4) - 1) // 2)
    else:
        return (False, None)


def sort_neighbours(g: BaseGraph[VT, ET], y1: VT, y2: VT) -> tuple[list[VT], list[VT], list[VT]]:
    """returns three lists: xs (as in the paper), other neighbours of y1, and other neighbours of y2"""
    xs, y1_others, y2_others = [], [], []
    for x in g.neighbors(y1):
        if x not in g.neighbors(y2) or len(g.neighbors(x)) != 2 or not is_Tlike(g, x)[0] or g.type(x) != VertexType.Z or\
            g.edge_type((x, y1)) != EdgeType.HADAMARD or g.edge_type((x, y2)) != EdgeType.HADAMARD:
            y1_others.append(x)
        else:
            xs.append(x)

    for x in g.neighbors(y2):
        if x not in xs:
            y2_others.append(x)

    return xs, y1_others, y2_others


def get_alpha(g: BaseGraph[VT, ET], v1: VT, v2: VT):
    n = len(sort_neighbours(g, v1, v2)[0])
    return 1/(n + 2)


@register_decomp(
    Decomp.LONE_PHASE_2,
    alpha=None,  # dependant on n, alpha=1/(n + 2)
    reference='https://arxiv.org/pdf/2412.17182'
)
def decompose(g: BaseGraph[VT, ET], y1: VT, y2: VT) -> SumGraph:
    xs, y1_others, y2_others = sort_neighbours(g, y1, y2)
    n = len(xs)
    g_0 = g.clone()  # case a = 0
    g_1 = g.clone()  # case a = 1
    for a, g_a in enumerate([g_0, g_1]):
        g_a.scalar.add_power(-2*n)
        for x in xs:
            g_a.scalar.add_node(g.phase(x) + a)
        g_a.remove_vertices(xs + [y1, y2])
        k = is_Tlike(g, y2)[1]
        l = is_Tlike(g, y1)[1]
        g_a.scalar.add_phase(Fraction(a * (2*k + 1), 4))
        v = g_a.add_vertex(VertexType.Z, (g.qubit(y1) + g.qubit(y2))/2, (g.row(y1) + g.row(y2))/2, Fraction(k + l + 1 - a*(2*k + 1), 2))
        for other in y1_others:
            g_a.add_edge((v, other), edgetype=(g.edge_type((y1, other))))
        for other in y2_others:
            pi_phase = g_a.add_vertex(VertexType.Z, (g.qubit(y2) + g.qubit(other))/2, (g.row(y2) + g.row(other))/2, a)
            g_a.add_edge((pi_phase, v), EdgeType.HADAMARD)
            if g.edge_type((other, y2)) == EdgeType.SIMPLE:
                g_a.add_edge((pi_phase, other), EdgeType.HADAMARD)
            else:  # if edgetype was Hadamard
                g_a.add_edge((pi_phase, other))
    return SumGraph([g_0, g_1])


@register_validity_checker(Decomp.LONE_PHASE_2)
def check_valid(g: BaseGraph[VT, ET], y1: VT, y2: VT) -> bool:
    if y1 == y2:
        raise ValueError(f'Vertices should be distict, {y1} was given twice')
    if y2 in g.neighbors(y1):
        raise ValueError(f'Given vertices {y1} and {y2} were neighbours, which is not allowed')
    for y in [y1, y2]:
        if y not in g.vertices():
            raise ValueError(f'Vertex {y} does not exist in graph')
        elif not is_Tlike(g, y)[0] or g.type(y) != VertexType.Z:
            raise ValueError(f'given vertex {y} should be and T-like')
    if len(sort_neighbours(g, y1, y2)[0]) == 0:
        raise ValueError(f'Vertices {y1} and {y2} don\'t have lone_phase_2 structure')
    return True
