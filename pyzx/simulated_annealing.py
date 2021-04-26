from tqdm import tqdm # type: ignore
import random
import math
import numpy as np

from .congruences import uniform_weights, apply_rand_lc, apply_rand_pivot
from .simplify import full_reduce
from .scores import g_wgc

__all__ = ['anneal']

# simulated annealing
def anneal(g, iters=1000,
           temp=25,
           cool=0.005,
           score=g_wgc,
           cong_ps=[0.5, 0.5],
           lc_select=uniform_weights,
           pivot_select=uniform_weights,
           full_reduce_prob=0.1,
           reset_prob=0.0,
           quiet=False
):
    g_best = g.copy()
    sz = score(g_best)
    sz_best = sz

    best_scores = list()

    for i in tqdm(range(iters), desc="annealing...", disable=quiet):

        g1 = g.copy()

        cong_method = np.random.choice(["LC", "PIVOT"], 1, p=cong_ps)[0]

        if cong_method == "PIVOT":
            apply_rand_pivot(g1, weight_func=pivot_select)
        else:
            apply_rand_lc(g1, weight_func=lc_select)

        # probabilistically full_reduce:
        if random.uniform(0, 1) < full_reduce_prob:
            full_reduce(g1)
        sz1 = score(g1)

        best_scores.append(sz_best)

        if temp != 0: temp *= 1.0 - cool

        if sz1 < sz or \
            (temp != 0 and random.random() < math.exp((sz - sz1)/temp)):

            sz = sz1
            g = g1.copy()
            if sz < sz_best:
                g_best = g.copy()
                sz_best = sz
        elif random.uniform(0, 1) < reset_prob:
            g = g_best.copy()

    return g_best, best_scores
