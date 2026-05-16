"""
The cat5 state decomposition introduced in https://arxiv.org/pdf/2202.09202.
"""

from . import Decomp, register_decomp, register_validity_checker
from ...graph.base import BaseGraph,VT,ET
from ...utils import EdgeType
from ..common import SumGraph, gen_catlike_term, check_catn
from fractions import Fraction

@register_decomp(
    Decomp.CAT_5,
    alpha=0.3169925001442,
    reference="https://arxiv.org/abs/2202.09202"
)
def decompose(g:BaseGraph[VT,ET], v:VT) -> SumGraph:
    """Apply the cat5 decomposition to a vertex v of graph g."""
    # Generate the terms of the decomposition
    neighbors = list(g.neighbors(v))
    pi_case = g.phase(v) == 1
    g_A = gen_catlike_term(g, neighbors,
                           0, Fraction(-1, 2), 0,
                           EdgeType.SIMPLE, EdgeType.HADAMARD,
                           True,  -2, 0, pi_case=pi_case)
    g_B = gen_catlike_term(g, neighbors,
                           0, 0, 0,
                           EdgeType.HADAMARD, EdgeType.SIMPLE,
                           True,  -1, Fraction(3, 4), pi_case=pi_case)
    g_C = gen_catlike_term(g, neighbors,
                           Fraction(1, 2), 0, 0,
                           EdgeType.HADAMARD, EdgeType.SIMPLE,
                           False, -1, Fraction(1, 4), pi_case=pi_case)
    # Remove the decomposed vertices from the terms
    g_A.remove_vertex(v)
    g_B.remove_vertex(v)
    g_C.remove_vertex(v)

    return SumGraph([g_A, g_B, g_C])

@register_validity_checker(Decomp.CAT_5)
def check_valid(g:BaseGraph[VT,ET], v:VT) -> bool:
    check_catn(g, v, 5)
    return True
