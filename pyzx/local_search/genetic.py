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


"""
This module contains an implementation of a genetic algorithm. As with simulated annealing, the default goal of this approach is to reduce the 2-qubit count of a fully-simplified ZX-diagram (i.e., of that circuit obtained via extraction) (see demos/LocalSearch).

Mutants are represented as pairs of (ZX-diagram, circuit) to allow for mutation operators that act on either, though by default only the two two congruences defined in congruences.py (that act at the graph-level) are used. Tournament selection is used by default but other options are available. The default fitness function is a weighted gate count defined in scores.py.
"""

from tqdm import tqdm
import numpy as np
from random import shuffle
import random
from copy import deepcopy

from .scores import wgc
from .congruences import apply_rand_lc, apply_rand_pivot
import sys
if __name__ == '__main__':
    sys.path.append('..')
from pyzx.simplify import to_graph_like, full_reduce
from pyzx.extract import extract_circuit
from pyzx.optimize import basic_optimization


__all__ = ['GeneticOptimizer']


class Mutant:
    """A single mutant for evolving a population via a genetic algorithm. The state of
    a mutant is a (ZX-diagram, circuit) pair where each corresponds to the other. Used by :class: `GeneticOptimizer` to evolve population.
    
    Attributes:
        c_orig: The original circuit.
        c_curr: The current circuit after mutations.
        g_curr: The current graph representation.
        score: The fitness score of the mutant.
        dead: A flag indicating if no more actions can be applied.
    """

    def __init__(self, c, g):
        self.c_orig = c
        self.c_curr = c
        self.g_curr = g.copy()
        self.score = None
        self.dead = False # no more actions can be applied to it

def default_score(m):
    """
    Calculates the default fitness score for a mutant.

    :param m: A Mutant object.
    :return: The weighted gate count of the current circuit.
    """
    return wgc(m.c_curr)


# Action accept a circuit and corresponding graph, and return (success, (new_c, new_g)). This allows for actions that act on either of graphs and circuits.
def rand_pivot(c, g, reduce_prob=0.1):
    """
    Applies a random pivot to a mutant. One of the actions used to mutate population.

    :param c: The current circuit.
    :param g: The current graph.
    :param reduce_prob: Probability of applying full reduction.
    :return: A tuple (success, (new_c, new_g)) indicating the success of the operation
             and the new circuit and graph.
    """

    g_tmp = g.copy()
    apply_rand_pivot(g_tmp)

    g_fr = g_tmp.copy()
    full_reduce(g_fr)
    c_new = extract_circuit(g_fr.copy()).to_basic_gates()
    c_new = basic_optimization(c_new)
    if random.uniform(0, 1) < reduce_prob:
        g_tmp = g_fr.copy()
    return True, (c_new, g_tmp)

def rand_lc(c, g, reduce_prob=0.1):    
    """
    Applies a random local complementation to a mutant. One of the actions used to mutate candidates.

    :param c: The current circuit.
    :param g: The current graph.
    :param reduce_prob: Probability of applying full reduction.
    :return: A tuple (success, (new_c, new_g)) indicating the success of the operation
             and the new circuit and graph.
    """

    g_tmp = g.copy()
    apply_rand_lc(g_tmp)

    g_fr = g_tmp.copy()
    full_reduce(g_fr)
    c_new = extract_circuit(g_fr.copy()).to_basic_gates()
    c_new = basic_optimization(c_new)
    if random.uniform(0, 1) < reduce_prob:
        g_tmp = g_fr.copy()
    return True, (c_new, g_tmp)


class GeneticOptimizer():
    """Implements a genetic algorithm for evolving a population of (ZX-diagram, circuit) pairs.
    The primary functionality of this class is defined in the evolve method.

    Attributes:
        actions: A list of mutation functions.
        score: A function to calculate the fitness score."""

    def __init__(self, actions=[rand_pivot, rand_lc], score=default_score):
        self.actions = actions
        self.score = score # function that maps Mutant -> Double

    # TODO: multi-thread
    def mutate(self):
        """Applies a single mutation to each member of the current population"""

        for m in self.mutants:
            # Note: actions have to look for their own matches/subjects
            success = False
            shuffle(self.actions)
            for a in self.actions:
                success, (c_new, g_new) = a(m.c_curr, m.g_curr)
                if success:
                    m.c_curr = c_new.to_basic_gates()
                    m.g_curr = g_new.copy() # copy() to make vertices consecutive
                    m.score = self.score(m)
                    break
            if not success:
                m.dead = True

    def update_scores(self):
        """Updates the fitness scores of all mutants."""
        for m in self.mutants:
            m.score = self.score(m)

    def select(self, method="tournament"):
        """Selects the next generation of mutants based on the specified method

        :param method: The selection method to use. Options are:
            - "tournament": Randomly selects pairs of mutants and chooses the one with the better score.
            - "top_half": Selects the top half of mutants based on their scores and duplicates them.
            - "top_n": Selects the top N mutants and replicates them to form the next generation.

        :raises RuntimeError: If an unknown selection method is specified.
        """

        if method == "tournament":
            new_mutants = list()
            for _ in range(self.n_mutants):
                m1, m2 = random.sample(self.mutants, 2)
                if m1.dead:
                    new_mutants.append(m2)
                elif m1.score < m2.score: # Reminder: lower is better
                    new_mutants.append(m1)
                else:
                    new_mutants.append(m2)
            self.mutants = [deepcopy(m) for m in new_mutants]
        elif method == "top_half":
            ms_tmp = self.mutants.copy()
            ms_tmp = sorted(ms_tmp, key=lambda m: m.score)
            n = self.n_mutants // 2
            top_half = ms_tmp[:n]
            if self.n_mutants % 2 == 0:
                self.mutants = deepcopy(top_half) * 2
            else:
                self.mutants = deepcopy(top_half) * 2 + deepcopy([ms_tmp[0]])
        elif method == "top_n":
            n = 10
            ms_tmp = self.mutants.copy()
            ms_tmp = sorted(ms_tmp, key=lambda m: m.score)
            top_n = ms_tmp[:n]
            fact = self.n_mutants // n
            r = self.n_mutants - fact * n
            self.mutants = top_n * fact + top_n[:r]
            # Hack to not mess up memory addresses
            self.mutants = [deepcopy(m) for m in self.mutants]
        else:
            raise RuntimeError(f"[select] Unknown selection method {method}")


    def evolve(self, g, n_mutants, n_generations, quiet=True):
        """The primary functionality of GeneticOptimizer. Given an input ZX-diagram,
        searches the space of ZX-diagrams generated by the provided action set to minimize
        the supplied fitness function.

        :param g: The initial graph.
        :param n_mutants: Number of mutants in the population.
        :param n_generations: Number of generations to evolve.
        :param quiet: If True, suppresses progress output.
        :return: The optimized graph."""

        self.quiet = quiet
        _, _, g_opt = self._evolve(g, n_mutants, n_generations)
        return g_opt

    def _evolve(self, g, n_mutants, n_generations):
        """A helper function to _evolve that tracks fitness scores over the evolution"""

        self.n_mutants = n_mutants
        self.n_gens = n_generations

        self.g_orig = g.copy()
        to_graph_like(self.g_orig)
        self.c_orig = extract_circuit(self.g_orig.copy()).to_basic_gates()
        self.c_orig = basic_optimization(self.c_orig)

        self.mutants = [Mutant(self.c_orig, self.g_orig) for _ in range(self.n_mutants)]

        self.update_scores()
        best_mutant = min(self.mutants, key=lambda m: m.score)
        best_score = best_mutant.score

        gen_scores = [best_score]
        best_scores = [best_score]
        for i in tqdm(range(self.n_gens), desc="Generations", disable=self.quiet):
            n_unique_mutants = len(list(set([id(m) for m in self.mutants])))
            assert(n_unique_mutants == self.n_mutants)

            self.mutate()
            best_in_gen = min(self.mutants, key=lambda m: m.score)
            gen_scores.append(best_in_gen.score)
            if best_in_gen.score < best_score:
                best_mutant = deepcopy(best_in_gen)
                best_score = best_in_gen.score

            best_scores.append(best_score)
            if all([m.dead for m in self.mutants]):
                break

            self.select()

        return best_scores, gen_scores, best_mutant.g_curr
