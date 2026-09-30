"""
The multi-|cat_3> decomposition (decomposition 2) introduced in https://arxiv.org/pdf/2412.17182
"""

from . import Decomp, register_decomp, register_validity_checker
from ...graph.base import BaseGraph, VT, ET
from ...utils import EdgeType, VertexType
from ..common import SumGraph
from fractions import Fraction


def is_Tlike(g: BaseGraph[VT, ET], v: VT) -> tuple[bool, int]:
    phase = g.phase(v)
    if isinstance(phase, (int, Fraction)) and (phase * 4) % 2 == 1:
        return (True, (phase * 4 - 1) // 2)
    else:
        return (False, 1)


def sort_neighbours(g: BaseGraph[VT, ET], v: VT) -> tuple[list[VT], list[VT], list[VT], list[VT]]:
    """returns four lists: xs and ys as in the paper, zs (the vertex connecting xi and yi), and others"""
    xs, ys, zs, others = [], [], [], []
    for z in g.neighbors(v):
        if len(g.neighbors(z)) != 3 or g.phase(z) % 1 != 0:
            others.append(z)
            continue
        xy = list(g.neighbors(z))
        xy.remove(v)
        if not is_Tlike(g, xy[0])[0] or not is_Tlike(g, xy[1])[0] or\
            any([g.type(vertex) != VertexType.Z for vertex in [xy[0], xy[1], z]]) or\
            any([g.edge_type(edge) != EdgeType.HADAMARD for edge in [g.edge(v, z), g.edge(z, xy[0]), g.edge(z, xy[1])]]):
            others.append(z)
        elif len(g.neighbors(xy[0])) == 1:  # so first item of xy is x
            xs.append(xy[0])
            ys.append(xy[1])
            zs.append(z)
        elif len(g.neighbors(xy[1])) == 1:  # so second item of xy is x
            xs.append(xy[1])
            ys.append(xy[0])
            zs.append(z)
        else:
            others.append(z)
    return xs, ys, zs, others


def get_alpha(g: BaseGraph[VT, ET], v: VT):
    n = len(sort_neighbours(g, v)[0])
    return 1/(2*n + 1)


@register_decomp(
    Decomp.MULTI_CAT3_1,
    alpha=None,  # dependant on n, alpha=1/(2n + 1)
    reference='https://arxiv.org/pdf/2412.17182'
)
def decompose(g: BaseGraph[VT, ET], v: VT) -> SumGraph:
    xs, ys, zs, others = sort_neighbours(g, v)
    n = len(xs)
    m = len(others)
    g_0 = g.clone()  # case a = 0
    g_1 = g.clone()  # case a = 1
    for a, g_a in enumerate([g_0, g_1]):
        g_a.scalar.add_phase(a * (g.phase(v)))
        g_a.scalar.add_power(-n - m)
        g_a.remove_vertices(xs + zs + [v])
        for x, y, z in zip(xs, ys, zs):
            k = is_Tlike(g, x)[1]
            l = is_Tlike(g, y)[1]
            b = g.phase(z) % 2
            if (a + b) % 2 == 1:
                g_a.scalar.add_phase(Fraction(2*k + 1, 4))
                g_a.set_phase(y, Fraction(l - k, 2))
            else:
                g_a.set_phase(y, Fraction(l + k + 1, 2))
        for i, vertex in enumerate(others):
            new_vertex = g_a.add_vertex(VertexType.Z, -1, i, phase=a)  # location added to make testing easier
            if g.edge_type(g.edge(v, vertex)) == EdgeType.SIMPLE:
                g_a.add_edge((vertex, new_vertex), EdgeType.HADAMARD)
            else:  # if edgetype is Hadamard:
                g_a.add_edge((vertex, new_vertex), EdgeType.SIMPLE)
    return SumGraph([g_0, g_1])


@register_validity_checker(Decomp.MULTI_CAT3_1)
def check_valid(g: BaseGraph[VT, ET], v: VT) -> bool:
    if v not in g.vertices():
        raise ValueError(f'Vertex {v} does not exist in graph')
    elif is_Tlike(g, v)[0] or g.type(v) != VertexType.Z:
        raise ValueError(f'given vertex {v} should be green and with phase pi/4')
    elif len(sort_neighbours(g, v)[0]) in (0, 1):  # not allowed 1, otherwise alpha = 1/0
        raise ValueError(f'Vertex {v} has no cat3\'s connected to it')
    return True
