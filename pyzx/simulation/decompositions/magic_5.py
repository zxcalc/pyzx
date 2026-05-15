from . import Decomp, register_decomp, register_validity_checker
from ...graph.base import BaseGraph,VT,ET
from ...utils import EdgeType
from ..common import SumGraph, gen_catlike_term
from fractions import Fraction
from typing import List

@register_decomp(
    Decomp.MAGIC_5,
    alpha=0.3962406251803,
    reference="https://arxiv.org/abs/2202.09202"
)
def decompose(g:BaseGraph[VT,ET], verts:List[VT]) -> SumGraph:
    """Apply the magic5 decomposition to vertices verts of graph g"""
    g_A = gen_catlike_term(g, verts, 0,              Fraction(-1,2), Fraction(-1,4), EdgeType.SIMPLE,   EdgeType.SIMPLE,   True,  2, 0)
    g_B = gen_catlike_term(g, verts, 0,              0,              Fraction(-1,4), EdgeType.HADAMARD, EdgeType.HADAMARD, True,  3, Fraction(3,4))
    g_C = gen_catlike_term(g, verts, Fraction(1,2),  0,              Fraction(1,4),  EdgeType.HADAMARD, EdgeType.HADAMARD, False, 3, Fraction(1,4))
    
    return SumGraph([g_A, g_B, g_C])

@register_validity_checker(Decomp.MAGIC_5)
def check_valid(g:BaseGraph[VT,ET], verts:List[VT]) -> bool:
    assert len(verts) == 5, f"The magic5 decomposition acts on 5 spiders but {len(verts)} were specified."
    for v in verts: assert v in g.vertices(), f"Unable to apply magic5 as vertex {v} does not exist in graph {g}."
    return True
