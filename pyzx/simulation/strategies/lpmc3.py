"""
Apply available lone phase decompositions, multicat3 decompositions,
cat decomposions, magic state decompostion, and cut in order of ascending alpha
"""

from ..decompositions import Decomp, apply_decomp, check_valid, lone_phase_1, lone_phase_2, multicat3_1, multicat3_2
from . import Strategy, register_strategy
from ...graph.base import BaseGraph, VT, ET
from ..common import SumGraph
from ...simplify import tcount
from .magic_cat import apply_fallback


@register_strategy(
    Strategy.LP_MC3,  # LonePhase_MultiCat3
    reference='https://arxiv.org/pdf/2412.17182'
)
def decompose(g: BaseGraph[VT, ET]) -> list[BaseGraph[VT, ET]]:
    if tcount(g) == 0:
        return [g]
    gsum = replace_states(g)
    gsum.full_reduce()
    output = []
    for h in gsum.graphs:
        if h.scalar.is_zero:
            continue
        else:
            hs = decompose(h)
            output.extend(hs)
    return output


def replace_states(g: BaseGraph[VT, ET]) -> SumGraph:
    vs, decomp = find_best_decomp(g)
    if decomp:
        return apply_decomp(decomp, g, *vs)
    else:
        return apply_fallback(g)


def find_best_decomp(g: BaseGraph[VT, ET]) -> tuple[list[VT] | None, Decomp | None]:
    """
    Returns (vertices, decomp): the decomposition, the input vertices of that decomposition.
    Returns (None, None) if not like Lone_phase, multicat or cat like,
        indicating magic5, magic2 or cut should be used instead.
    """
    best_alpha = 100
    best_decomp = (None, None)
    for v1 in g.vertices():
        for get_alpha, decomp in [(lone_phase_1.get_alpha, Decomp.LONE_PHASE_1),
                                  (multicat3_1.get_alpha, Decomp.MULTI_CAT3_1)]:
            try:
                check_valid(decomp, g, v1)  # crashes if invalid
                alpha = get_alpha(g, v1)
                if alpha < best_alpha:
                    best_alpha = alpha
                    best_decomp = ([v1], decomp)
            except ValueError:
                pass

        for get_alpha2, decomp2 in [(multicat3_2.get_alpha, Decomp.MULTI_CAT3_2),
                                  (lone_phase_2.get_alpha, Decomp.LONE_PHASE_2)]:
            for v2 in g.vertices():
                if v1 == v2:
                    continue
                try:
                    check_valid(decomp2, g, v1, v2)  # crashes if invalid
                    alpha = get_alpha2(g, v1, v2)
                    if alpha < best_alpha:
                        best_alpha = alpha
                        best_decomp = ([v1, v2], decomp2)
                except ValueError:
                    pass

        for deg, alpha, decomp3 in [(3, 1/3, Decomp.CAT_3),
                                   (4, 1/4, Decomp.CAT_4),
                                   (5, 0.3169925001442, Decomp.CAT_5),
                                   (6, 0.2641604167859, Decomp.CAT_6)]:
            if alpha < best_alpha and deg == g.vertex_degree(v1):
                try:
                    check_valid(Decomp.CAT_N, g, v1)
                    best_alpha = alpha
                    best_decomp = ([v1], decomp3)
                except ValueError:
                    pass

    return best_decomp
