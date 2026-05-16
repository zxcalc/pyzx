"""
Apply the 2-to-2 decomposition shown on page 5 of https://arxiv.org/pdf/2202.09202.
"""

from . import Decomp, register_decomp, register_validity_checker
from ...graph.base import BaseGraph,VT,ET
from ..common import SumGraph, sq2
from ...utils import VertexType, EdgeType
from typing import List
from fractions import Fraction

@register_decomp(
    Decomp.MAGIC_2,
    alpha=0.5,
    reference="https://arxiv.org/pdf/2202.09202, https://arxiv.org/pdf/2109.01076"
)
def decompose(g:BaseGraph[VT,ET], verts:List[VT]) -> SumGraph:
    graphs = []
    replace_functions = [replace_2_S, replace_2_N]

    for func in replace_functions:
        h = func(g.copy(), verts)
        graphs.append(h)

    return SumGraph(graphs)

@register_validity_checker(Decomp.MAGIC_2)
def check_valid(g:BaseGraph[VT,ET], verts:List[VT]) -> bool:
    assert len(verts)==2, f"Invalid application of magic2 decomposition. Expected 2 vertices but {len(verts)} were specified."
    assert all(v in g.vertices() for v in verts), f"Invalid application of magic2 decomposition. One or more vertex among {verts} is not a valid vertex in {g}."
    return True

def replace_2_S(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    w = g.add_vertex(VertexType.Z,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, Fraction(1,2))
    g.add_edges([(verts[0],w),(verts[1],w)],EdgeType.SIMPLE)
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g


def replace_2_N(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_phase(Fraction(1,4))
    w = g.add_vertex(VertexType.Z,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, Fraction(1,1))
    g.add_edges([(verts[0],w),(verts[1],w)],EdgeType.HADAMARD)
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g