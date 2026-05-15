import random
from ..decompositions import Decomp, apply_decomp
from . import Strategy, register_strategy
from ...graph.base import BaseGraph,VT,ET
from ..common import SumGraph
from ...simplify import tcount
from typing import List

@register_strategy(
    Strategy.CUT_RANDOM,
    reference=""
)
def decompose(g:BaseGraph[VT,ET]) -> List[BaseGraph[VT,ET]]: #todo - return a SumGraph rather than a List
    if tcount(g) == 0: return [g]
    gsum = cut_random_spider(g)
    gsum.reduce_scalar()
    output = []
    for h in gsum.graphs:
        if h.scalar.is_zero: continue
        output.extend(decompose(h))
    return output

def cut_random_spider(g:BaseGraph[VT,ET]) -> SumGraph:
    v = random.choice(list(g.vertices()))
    return apply_decomp(Decomp.CUT_VERTEX, g=g, v=v)
