"""
Apply the decomposition strategy introduced in Kissinger and van de Wetering 2021 (https://arxiv.org/pdf/2109.01076), recursively
applying the BSS decomposition to random sets of 6 T-spiders and, when the T-count falls below 6, using either the magic_2 or
vertex cutting decomposition as a fallback.
"""

import random
from ..decompositions import Decomp, apply_decomp
from . import Strategy, register_strategy
from ...graph.base import BaseGraph,VT,ET
from ..common import SumGraph
from ...utils import VertexType
from ...simplify import tcount
from typing import Any, Dict, List

@register_strategy(
    Strategy.BSS,
    reference="https://arxiv.org/abs/2109.01076"
)
def decompose(g:BaseGraph[VT,ET]) -> List[BaseGraph[VT,ET]]: #todo - return a SumGraph rather than a List
    """Apply the Kissinger and van de Wetering (2021) decomposition strategy based on BSS with a Magic2 and vertex cutting fallback when T-count < 6."""
    if tcount(g) == 0: return [g]
    gsum = replace_magic_states(g, True)
    gsum.full_reduce()
    output = []
    for h in gsum.graphs:
        if h.scalar.is_zero: continue
        output.extend(decompose(h))
    return output

def replace_magic_states(g: BaseGraph[VT,ET], pick_random:Any=False) -> SumGraph:
    """This function takes in a ZX-diagram in graph-like form 
    (all spiders fused, only Z spiders, only H-edges between spiders),
    and splits it into a sum over smaller diagrams by using the magic
    state decomposition of Bravyi, Smith, and Smolin (2016), PRX 6, 021043.
    """
    #g = g.copy() # We copy here, so that the vertex labels we get will be the same ones if we copy the graph again # MS: I think this is no longer needed as we use .clone() elsewhere now which avoids this problem
    phases = g.phases()

    # First we find 6 T-like spiders
    boundary = []
    internal = []
    gadgets = []
    ranking: Dict[VT, int] = dict()
    inputs = g.inputs()
    outputs = g.outputs()
    for v in g.vertices():
        if not phases[v] or phases[v].denominator != 4: continue

        ### begin AK changes ....
        deg = g.vertex_degree(v)
        if g.vertex_degree(v) == 1:
            w = list(g.neighbors(v))[0]
            if g.type(w) == VertexType.Z:
                gadgets.append(v)
                deg = g.vertex_degree(w)-1

        if any(w in inputs or w in outputs for w in g.neighbors(v)):
            boundary.append(v)
        else:
            internal.append(v)
        ranking[v] = deg
        ### ... end AK changes

    if len(ranking) >= 6: num_replace = 6
    elif len(ranking) >= 2: num_replace = 2
    elif len(ranking) == 1: num_replace = 1
    else: raise Exception("No magic states to replace")

    if not pick_random:
        candidates = sorted(ranking.keys(), key=lambda v: ranking[v], reverse=True)[:num_replace]
    else:
        if not isinstance(pick_random,bool):
            random.seed(pick_random)
        candidates = random.sample(list(ranking.keys()),num_replace)

    if num_replace == 6:
        return apply_decomp(Decomp.BSS, g=g, verts=candidates)
    elif num_replace == 2:
        return apply_decomp(Decomp.MAGIC_2, g=g, verts=candidates)
    else:
        return apply_decomp(Decomp.CUT_VERTEX, g=g, v=candidates[0])
