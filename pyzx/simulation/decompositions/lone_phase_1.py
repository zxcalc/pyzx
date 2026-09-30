"""
The lone phase decomposition (decomposition 1) introduced in https://arxiv.org/pdf/2412.17182
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


def sort_neighbours(g: BaseGraph[VT, ET], v: VT) -> tuple[list[VT], list[VT]]:
    """returns two lists: one contianing the vertices called x_i in the paper, and the others"""
    xs, others = [], []
    for x in g.neighbors(v):
        if len(g.neighbors(x)) == 1 and \
            is_Tlike(g, x)[0] and \
            g.edge_type(g.edge(v, x)) == EdgeType.HADAMARD and \
            g.type(x) == VertexType.Z:
            xs.append(x)
        else:
            others.append(x)
    return xs, others


def get_alpha(g: BaseGraph[VT, ET], v: VT):
    n = len(sort_neighbours(g, v)[0])
    return 1/n


@register_decomp(
    Decomp.LONE_PHASE_1,
    alpha=None,  # dependant on n, alpha=1/n
    reference='https://arxiv.org/pdf/2412.17182'
)
def decompose(g: BaseGraph[VT, ET], v: VT) -> SumGraph:
    # vertex v is the vertex that is connected to all x_i's
    xs, others = sort_neighbours(g, v)
    n = len(xs)
    m = len(others)
    g_0 = g.clone()  # case a = 0
    g_1 = g.clone()  # case a = 1
    for a, g_a in enumerate([g_0, g_1]):
        g_a.scalar.add_phase(g.phase(v) * a)
        g_a.scalar.add_power(- n - m)
        for x in xs:
            g_a.scalar.add_node(g.phase(x) + a)
        g_a.remove_vertices(xs + [v])
        for i, vertex in enumerate(others):
            new_vertex = g_a.add_vertex(VertexType.Z, -1, i, phase=a)  # Location added to make testing easier
            if g.edge_type((v, vertex)) == EdgeType.SIMPLE:
                g_a.add_edge((vertex, new_vertex), EdgeType.HADAMARD)
            else:  # if edgetype is Hadamard:
                g_a.add_edge((vertex, new_vertex), EdgeType.SIMPLE)
    return SumGraph([g_0, g_1])


@register_validity_checker(Decomp.LONE_PHASE_1)
def check_valid(g: BaseGraph[VT, ET], v: VT) -> bool:
    if v not in g.vertices():
        raise ValueError(f'Vertex {v} does not exist in graph')
    elif not is_Tlike(g, v)[0]:
        raise ValueError(f'given vertex {v} should have a T-like phase')
    elif len(sort_neighbours(g, v)[0]) == 0:
        raise ValueError(f'Vertex {v} has no T-like phase gadgets connected with hadamard edges')
    return True
