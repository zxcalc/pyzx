"""
The third decomposition introduced in https://arxiv.org/pdf/2412.17182
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


def sort_neighbours(g: BaseGraph[VT, ET], z1: VT, z2: VT) -> tuple[list[VT], list[VT], list[VT], list[VT], list[VT]]:
    """
    returns 5 lists: xs and ys as in the paper, vs (the vertex connecting xi, yi, z1 and z2),
    the other neigbours of z1, and the other neigbours of z2
    """
    xs, ys, vs, z1_others, z2_others = [], [], [], [], []
    for v in g.neighbors(z1):
        if v not in g.neighbors(z2) or len(g.neighbors(v)) != 4 or g.phase(v) % 1 != 0:
            z1_others.append(v)
            continue
        xy = list(g.neighbors(v))
        xy.remove(z1)
        xy.remove(z2)

        if not is_Tlike(g, xy[0])[0] or not is_Tlike(g, xy[1])[0] or\
            any([g.type(vertex) != VertexType.Z for vertex in [xy[0], xy[1], v]]) or\
            any([g.edge_type(edge) != EdgeType.HADAMARD for edge in [g.edge(z1, v), g.edge(z2, v), g.edge(xy[0], v), g.edge(xy[1], v)]]):
            z1_others.append(v)
        elif len(g.neighbors(xy[0])) == 1:  # so first item of xy is y
            xs.append(xy[1])
            ys.append(xy[0])
            vs.append(v)
        elif len(g.neighbors(xy[1])) == 1:  # so second item of xy is y
            xs.append(xy[0])
            ys.append(xy[1])
            vs.append(v)
        else:
            z1_others.append(v)

    for v in g.neighbors(z2):
        if v not in vs:
            z2_others.append(v)
    return xs, ys, vs, z1_others, z2_others


def get_alpha(g: BaseGraph[VT, ET], v1: VT, v2: VT):
    n = len(sort_neighbours(g, v1, v2)[0])
    return 1/(2*n - 2)


@register_decomp(
    Decomp.MULTI_CAT3_2,
    alpha=None,  # dependant on n, alpha=1/(2n - 2)
    reference='https://arxiv.org/pdf/2412.17182'
)
def decompose(g: BaseGraph[VT, ET], z1: VT, z2: VT) -> SumGraph:
    xs, ys, vs, z1_others, z2_others = sort_neighbours(g, z1, z2)
    n = len(xs)
    g_0 = g.clone()  # case a = 0
    g_1 = g.clone()  # case a = 1
    for a, g_a in enumerate([g_0, g_1]):
        g_a.scalar.add_power(-2*n)
        g_a.remove_vertices(ys + vs + [z1, z2])
        for x, y, v in zip(xs, ys, vs):
            k = is_Tlike(g, y)[1]
            l = is_Tlike(g, x)[1]
            b = g.phase(v) % 2
            if (a + b) % 2 == 1:
                g_a.scalar.add_phase(Fraction((2*k + 1), 4))
                g_a.set_phase(x, Fraction(l - k, 2))
            else:
                g_a.set_phase(x, Fraction(l + k + 1, 2))
        k = is_Tlike(g, z2)[1]
        l = is_Tlike(g, z1)[1]
        g_a.scalar.add_phase(Fraction(a * (2*k + 1), 4))
        v = g_a.add_vertex(VertexType.Z, (g.qubit(z1) + g.qubit(z2))/2, (g.row(z1) + g.row(z2))/2, Fraction(k + l + 1 - a*(2*k + 1), 2))
        for other in z1_others:
            g_a.add_edge((v, other), edgetype=(g.edge_type(g.edge(z1, other))))
        for other in z2_others:
            pi_phase = g_a.add_vertex(VertexType.Z, (g.qubit(z2) + g.qubit(other))/2, (g.row(z2) + g.row(other))/2, a)
            g_a.add_edge((pi_phase, v), EdgeType.HADAMARD)
            if g.edge_type(g.edge(other, z2)) == EdgeType.SIMPLE:
                g_a.add_edge((pi_phase, other), EdgeType.HADAMARD)
            else:  # if edgetype was Hadamard
                g_a.add_edge((pi_phase, other))
    return SumGraph([g_0, g_1])


@register_validity_checker(Decomp.MULTI_CAT3_2)
def check_valid(g: BaseGraph[VT, ET], z1: VT, z2: VT) -> bool:
    if z1 == z2:
        raise ValueError(f'Vertices should be distict, {z1} was given twice')
    for z in [z1, z2]:
        if z not in g.vertices():
            raise ValueError(f'Vertex {z} does not exist in graph')
        elif not is_Tlike(g, z) or g.type(z) != VertexType.Z:
            raise ValueError(f'given vertex {z} should be green and with phase pi/4')
    if len(sort_neighbours(g, z1, z2)[0]) in (0, 1):  # 1 not allowed, otherwise alpha = 1/0
        raise ValueError(f'Verteces {z1} and {z2} don\'t have decomposition 3 structure')
    return True
