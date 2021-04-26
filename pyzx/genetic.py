from tqdm import tqdm # type: ignore
import numpy as np
from random import shuffle
import random
from copy import deepcopy

from .scores import wgc
from .simplify import to_graph_like, full_reduce
from .extract import extract_circuit
from .optimize import basic_optimization
from .congruences import apply_rand_lc, apply_rand_pivot


__all__ = ['GeneticOptimizer']


class Mutant:
    def __init__(self, c, g):
        self.c_orig = c
        self.c_curr = c
        self.g_curr = g.copy()
        self.score = None
        self.dead = False # no more actions can be applied to it

def default_score(m):
    return wgc(m.c_curr)


# Action accept a circuit and corresponding graph, and return (success, (new_c, new_g)). This allows for actions that act on either of graphs and circuits.
def rand_pivot(c, g, reduce_prob=0.1):
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
    def __init__(self, actions=[rand_pivot, rand_lc], score=default_score):
        self.actions = actions
        self.score = score # function that maps Mutant -> Double

    # TODO: multi-thread
    def mutate(self):
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
        for m in self.mutants:
            m.score = self.score(m)

    def select(self, method="tournament"):
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
        self.quiet = quiet
        _, _, g_opt = self._evolve(g, n_mutants, n_generations)
        return g_opt

    def _evolve(self, g, n_mutants, n_generations):
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
