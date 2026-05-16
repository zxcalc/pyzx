"""
The Bravyi-Smith-Smolin decomposition introduced in https://arxiv.org/abs/1506.01396 and applied with ZX-Calculus in https://arxiv.org/abs/2109.01076.
"""

from . import Decomp, register_decomp, register_validity_checker
from ...graph.base import BaseGraph,VT,ET
from ..common import SumGraph, sq2
from ...utils import VertexType, EdgeType
from typing import List
from fractions import Fraction

MAGIC_GLOBAL = -(7+5*sq2)/(2+2j)
MAGIC_B60 = -16 + 12*sq2
MAGIC_B66 = 96 - 68*sq2
MAGIC_E6 = 10 - 7*sq2
MAGIC_O6 = -14 + 10*sq2
MAGIC_K6 = 7 - 5*sq2
MAGIC_PHI = 10 - 7*sq2

@register_decomp(
    Decomp.BSS,
    alpha=0.4678924870096,
    reference="https://arxiv.org/abs/1506.01396, https://arxiv.org/abs/2109.01076"
)
def decompose(g:BaseGraph[VT,ET], verts:List[VT]) -> SumGraph:
    """This function takes in a ZX-diagram in graph-like form 
    (all spiders fused, only Z spiders, only H-edges between spiders),
    and splits it into a sum over smaller diagrams by using the magic
    state decomposition of Bravyi, Smith, and Smolin (2016), PRX 6, 021043.
    """
    graphs = []
    replace_functions = [replace_B60, replace_B66, replace_E6, replace_O6, replace_K6, replace_phi1, replace_phi2]

    for func in replace_functions:
        h = func(g.copy(), verts)
        h.scalar.add_float(MAGIC_GLOBAL)
        graphs.append(h)

    return SumGraph(graphs)

@register_validity_checker(Decomp.BSS)
def check_valid(g:BaseGraph[VT,ET], verts:List[VT]) -> bool:
    assert len(verts)==6, f"Invalid application of BSS decomposition. Expected 6 vertices but {len(verts)} were specified."
    assert all(v in g.vertices() for v in verts), f"Invalid application of BSS decomposition. One or more vertex among {verts} is not a valid vertex in {g}."
    assert all(g.type(v)==VertexType.Z for v in verts), f"Invalid application of BSS decomposition. Specified vertices {verts} are not all Z-spiders."
    return True

def replace_B60(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_B60)
    g.scalar.add_power(-6)
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
    return g

def replace_B66(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_B66)
    g.scalar.add_power(-6)
    g.scalar.add_phase(Fraction(1))
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        g.add_to_phase(v,Fraction(1))
    return g

def replace_E6(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_E6)
    g.scalar.add_power(4)
    g.scalar.add_phase(Fraction(1,2))
    av = 0.0
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        g.add_to_phase(v, Fraction(1,2))
        av += g.row(v)
    w = g.add_vertex(VertexType.Z,-1,av/6,Fraction(1))
    g.add_edges([(v,w) for v in verts],EdgeType.HADAMARD)
    return g

def replace_O6(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_O6)
    g.scalar.add_power(4)
    g.scalar.add_phase(Fraction(1,2))
    av = 0.0
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        g.add_to_phase(v, Fraction(1,2))
        av += g.row(v)
    w = g.add_vertex(VertexType.Z,-1,av/6,Fraction(0))
    g.add_edges([(v,w) for v in verts],EdgeType.HADAMARD)
    return g

def replace_K6(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_K6)
    g.scalar.add_power(5)
    g.scalar.add_phase(Fraction(1,4))
    av = 0.0
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        av += g.row(v)
    w = g.add_vertex(VertexType.Z,-1,av/6,Fraction(3,2))
    g.add_edges([(v,w) for v in verts],EdgeType.SIMPLE)
    return g

def replace_phi1(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_PHI)
    g.scalar.add_power(9)
    g.scalar.add_phase(Fraction(3,2))
    w6 = g.add_vertex(VertexType.Z,-1, g.row(verts[5])+0.5, Fraction(1))
    g.add_to_phase(verts[5],Fraction(-1,4))
    g.add_edge((verts[5],w6))
    ws = []
    for v in verts[:-1]:
        g.add_to_phase(v,Fraction(-1,4))
        w = g.add_vertex(VertexType.Z,-1, g.row(v)+0.5)
        g.add_edges([(w6,w),(v,w)],EdgeType.HADAMARD)
        ws.append(w)
    w1,w2,w3,w4,w5 = ws
    g.add_edges([(w1,w3),(w1,w4),(w2,w4),(w2,w5),(w3,w5)],EdgeType.HADAMARD)
    return g

def replace_phi2(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    v1,v2,v3,v4,v5,v6 = verts
    verts = [v1,v2,v4,v5,v6,v3]
    return replace_phi1(g,verts)