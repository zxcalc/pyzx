"""
Apply available cat decompositions (cat3 to cat6) in order of ascending alpha, with magic5 as a fallback if no such cat states exist, as per https://arxiv.org/pdf/2202.09202.
"""

import random
from ..decompositions import Decomp, apply_decomp
from . import Strategy, register_strategy
from ...graph.base import BaseGraph,VT,ET
from ..common import SumGraph
from ...simplify import tcount
from typing import List

@register_strategy(
    Strategy.MAGIC_CAT,
    reference="https://arxiv.org/pdf/2202.09202"
)
def decompose(g:BaseGraph[VT,ET]) -> List[BaseGraph[VT,ET]]: #todo - return a SumGraph rather than a List
    if tcount(g) == 0: return [g]
    gsum = replace_states(g)
    gsum.full_reduce()
    output = []
    for h in gsum.graphs:
        if h.scalar.is_zero: continue
        output.extend(decompose(h))
    return output

def replace_states(g:BaseGraph[VT,ET]) -> SumGraph:
    """Find and apply decomposition in this order of preference: cat4, cat6, cat5, cat3, magic5."""
    v = find_best_cat(g)
    if (v is not None): return apply_decomp(Decomp.CAT_N, g=g, v=v)
    else: return apply_fallback(g)

def find_best_cat(g:BaseGraph[VT,ET]) -> int|None:
    """Returns the best cat state vertex in graph g. (Ranked by alpha of cats 4 to 6.) Returns None if none are found."""
    for deg in [4,6,5,3]:
        for v in g.vertices():
            if g.phase(v) not in (0,1): continue # Find next Pauli (0 or pi phase) spider
            if g.vertex_degree(v) == deg: return v
    return None

def apply_fallback(g:BaseGraph[VT,ET]) -> SumGraph:
    """Applies magic5 to a random set of 5 T-spiders, or if fewer than 5 remain uses magic2 or vertex cut instead."""
    if tcount(g) >= 5: # Apply magic5
        vs = []
        for v in g.vertices():
            if g.phase(v) in (0.25,0.75,1.25,1.75): vs.append(v)
            if len(vs) == 5: return apply_decomp(Decomp.MAGIC_5, g=g, verts=vs)
    elif tcount(g) >= 2: # Apply magic2
        vs = []
        for v in g.vertices():
            if g.phase(v) in (0.25,0.75,1.25,1.75): vs.append(v)
            if len(vs) == 2: return apply_decomp(Decomp.MAGIC_2, g=g, verts=vs)
    else: # Apply vertex cut
        for v in g.vertices():
            if g.phase(v) in (0.25,0.75,1.25,1.75): return apply_decomp(Decomp.CUT_VERTEX, g=g, v=v)
    return SumGraph([g])