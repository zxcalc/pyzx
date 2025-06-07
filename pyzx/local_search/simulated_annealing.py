# PyZX - Python library for quantum circuit rewriting
#        and optimisation using the ZX-calculus
# Copyright (C) 2021 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


from tqdm import tqdm
import random
import math
import numpy as np

from .congruences import uniform_weights, apply_rand_lc, apply_rand_pivot
from .scores import g_wgc
import sys
if __name__ == '__main__':
    sys.path.append('..')
from pyzx.simplify import full_reduce


"""
This module contains an implementation of simulated annealing over ZX-diagrams. Equivalent ZX-diagrams are generated using the congruences defined in congruences.py. The default energy function is defined in scores.py. The default goal of this approach is to reduce the 2-qubit count of a fully-simplified ZX-diagram (i.e., of that circuit obtained via extraction).
"""


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
    """
    Performs simulated annealing over ZX-diagram to minimize energy function.

    Equivalent ZX-diagrams are generated using congruences from `congruences.py`. Default goal is to reduce the 2-qubit count of a fully-simplified ZX-diagram.

    :param g: Initial ZX-diagram to optimize.
    :param iters: Number of iterations to perform (default is 1000).
    :param temp: Initial temperature for annealing (default is 25).
    :param cool: Cooling rate for temperature reduction (default is 0.005).
    :param score: Function to evaluate the energy of a diagram (default is `g_wgc`).
    :param cong_ps: Probabilities for selecting congruence methods (default is [0.5, 0.5]).
    :param lc_select: Function to select vertices for local complementation (default is `uniform_weights`).
    :param pivot_select: Function to select edges for pivoting (default is `uniform_weights`).
    :param full_reduce_prob: Probability of applying full reduction (default is 0.1).
    :param reset_prob: Probability of resetting to the best state (default is 0.0).
    :param quiet: If True, suppresses progress output (default is False).
    :return: A tuple containing the best ZX-diagram found and a list of best scores over iterations.
    """

    g_best = g.copy()
    sz = score(g_best)
    sz_best = sz

    best_scores = list()

    for i in tqdm(range(iters), desc="annealing...", disable=quiet):

        g1 = g.copy()

        # cong_method = np.random.choice(["LC", "PIVOT"], 1, p=cong_ps)[0]
        cong_method = "PIVOT"

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
