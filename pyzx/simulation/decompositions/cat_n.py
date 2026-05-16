"""
This will apply the appropriate cat_n state decomposition from https://arxiv.org/pdf/2202.09202 for any n in (3,4,5,6),
determined by the degree of the sepcified spider.
"""

from . import Decomp, register_decomp, register_validity_checker, cat_3, cat_4, cat_5, cat_6
from ...graph.base import BaseGraph,VT,ET
from ..common import SumGraph, check_catn

@register_decomp(
    Decomp.CAT_N,
    alpha=None,
    reference="https://arxiv.org/abs/2202.09202"
)
def decompose(g:BaseGraph[VT,ET], v:VT) -> SumGraph:
    """Apply the appropriate cat_n decomposition to vertex v based on its degree."""
    match g.vertex_degree(v):
        case 3: return cat_3.decompose(g=g,v=v)
        case 4: return cat_4.decompose(g=g,v=v)
        case 5: return cat_5.decompose(g=g,v=v)
        case 6: return cat_6.decompose(g=g,v=v)
    raise ValueError(f"Invalid vertex degree for cat{g.vertex_degree(v)} decomposition.")

@register_validity_checker(Decomp.CAT_N)
def check_valid(g:BaseGraph[VT,ET], v:VT) -> bool:
    assert v in g.vertices(), f"Vertex {v} not in graph {g}."
    check_catn(g, v, g.vertex_degree(v))
    return True
