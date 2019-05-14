# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2019 - Aleks Kissinger, John van de Wetering,
#                      and Arianne Meijer-van de Griend

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

import numpy as np


def make_fitness_func(func, **func_args):
    """
    Creates and returns a fitness function to be used for the genetic algorithm that uses CNOT gate count as fitness.

    :param func: a function determining the fitness of a single permutation
    :param func_args: extra arguments for the fitness function
    :return: A fitness function that only requires a permutation.
    """
    def fitness_func(permutation):
        return func(permutation=permutation, **func_args)

    return fitness_func

class GeneticAlgorithm():

    def __init__(self, population_size, crossover_prob, mutation_prob, fitness_func, maximize=False, quiet=True):
        self.population_size = population_size
        self.negative_population_size = int(np.sqrt(population_size))
        self.crossover_prob = crossover_prob
        self.mutation_prob = mutation_prob
        self.fitness_func = fitness_func
        self._sort = lambda l: l.sort(key=lambda x:x[1], reverse=maximize)
        self.maximize = maximize
        self.n_qubits = 0
        self.population = None
        self.quiet=quiet

    def _select(self):
        fitness_scores = [f for c,f in self.population]
        total_fitness = sum(fitness_scores)
        if self.maximize:
            selection_chance = [f/total_fitness for f in fitness_scores]
        else:
            max_fitness = max(fitness_scores) + 1
            adjusted_scores = [max_fitness - f for f in fitness_scores]
            adjusted_total = sum(adjusted_scores)
            selection_chance = [ f/adjusted_total for f in adjusted_scores]
        return np.random.choice(self.population_size, size=2, replace=False, p=selection_chance)

    def _create_population(self, n):
        self.population = [np.random.permutation(n) for _ in range(self.population_size)]
        self.population = [(chromosome, self.fitness_func(chromosome)) for chromosome in self.population]
        self._sort(self.population)
        self.negative_population = self.population[-self.negative_population_size:]

    def find_optimimum(self, n_qubits, n_generations, initial_order=None, n_child=None, continued=False):
        self.n_qubits = n_qubits
        partial_solution = False
        if not continued or self.population is None:
            if initial_order is None:
                self._create_population(n_qubits)
            elif n_qubits < len(initial_order):
                self._create_population(initial_order[:n_qubits])
                partial_solution = True
            else:
                self._create_population(initial_order)

        if n_child is None:
            n_child = self.population_size
            
        for i in range(n_generations):
            self._update_population(n_child)
            (not self.quiet) and print("Iteration", i, "best fitness:", [p[1] for p in self.population[:5]])
        if partial_solution:
            return self.population[0] + initial_order[n_qubits:]
        return self.population[0][0]

    def _add_children(self, children):
        n_child = len(children)
        self.population.extend([(child, self.fitness_func(child)) for child in children])
        self._sort(self.population)
        self.negative_population.extend(self.population[-n_child:])
        self.negative_population = [self.negative_population[i] for i in np.random.choice(self.negative_population_size + n_child, size=self.negative_population_size, replace=False)]
        self.population = self.population[:self.population_size]

    def _update_population(self, n_child):
        children = []
        # Create a child from weak parents to avoid local optima
        p1, p2 = np.random.choice(self.negative_population_size, size=2, replace=False)
        child = self._crossover(self.negative_population[p1][0], self.negative_population[p2][0])
        children.append(child)
        for _ in range(n_child):
            if np.random.random() < self.crossover_prob:
                p1, p2 = self._select()
                child = self._crossover(self.population[p1][0], self.population[p2][0])
                if np.random.random() < self.mutation_prob:
                    child = self._mutate(child)
                children.append(child)
        self._add_children(children)

    def _crossover(self, parent1, parent2):
        crossover_start = np.random.choice(int(self.n_qubits/2))
        crossover_length = np.random.choice(self.n_qubits-crossover_start)
        crossover_end = crossover_start + crossover_length
        child = -1*np.ones_like(parent1)
        child[crossover_start:crossover_end] = parent1[crossover_start: crossover_end]
        child_idx = 0
        for parent_gen in parent2:
            if child_idx == crossover_start: # skip over the parent1 part in child
                child_idx = crossover_end
            if parent_gen not in child: # only add new genes
                child[child_idx] = parent_gen
                child_idx += 1
        return child

    def _mutate(self, parent):
        gen1, gen2 = np.random.choice(len(parent), size=2, replace=False)
        _ = parent[gen1]
        parent[gen1] = parent[gen2]
        parent[gen2] = _
        return parent

class ParticleSwarmOptimization():

    def __init__(self, swarm_size, fitness_func, step_func, s_best_crossover, p_best_crossover, mutation, maximize=False):
        self.fitness_func = fitness_func
        self.step_func = step_func
        self.size = swarm_size
        self.s_crossover = s_best_crossover
        self.p_crossover = p_best_crossover
        self.mutation = mutation
        self.best_particle = None
        self.maximize = maximize

    def _create_swarm(self, n):
        self.swarm = [Particle(n, self.fitness_func, self.step_func, self.s_crossover, self.p_crossover, self.mutation, self.maximize, id=i) 
                        for i in range(self.size)]
        if self.maximize:
            self.best_particle = max(self.swarm, key=lambda p: p.best)
        else:
            self.best_particle = min(self.swarm, key=lambda p: p.best)

    def find_optimimum(self, n_qubits, n_steps, quiet=True):
        self._create_swarm(n_qubits)
        (not quiet) and print("Initial best fitness:", self.best_particle.best, self.best_particle.best_point)
        for i in range(n_steps):
            self._update_swarm()
            (not quiet) and print("Iteration", i, "best fitness:", self.best_particle.best, self.best_particle.best_point)
        return self.best_particle.best_point

    def _update_swarm(self):
        for p in self.swarm:
            if p.step(self.best_particle.best) and self.best_particle.compare(p.best):
                #print(p.best, self.best_particle.best)
                self.best_particle = p

class Particle():

    def __init__(self, size, fitness_func, step_func, s_best_crossover, p_best_crossover, mutation, maximize=False, id=None):
        self.fitness_func = fitness_func
        self.step_func = step_func
        self.size = size
        self.current = np.random.permutation(size)
        self.best_point = self.current
        self.best = fitness_func(self.current)
        self.s_crossover = int(s_best_crossover*size)
        self.p_crossover = int(p_best_crossover*size)
        self.mutation = int(mutation*size)
        self.maximize = maximize
        self.id = id
    
    def compare(self, x):
        if self.maximize:
            return x > self.best
        else:
            return x < self.best 

    def step(self, swarm_best):
        new = self.step_func(self.current)
        if all([self.current[i] == n for i, n in enumerate(new)]):
            new = self._mutate(self.current)
            new = self._crossover(new, self.best, self.p_crossover)
            new = self._crossover(new, swarm_best, self.s_crossover)
        fitness = self.fitness_func(new)
        self.current = new
        is_better = self.compare(fitness)
        if is_better:
            self.best = fitness
            self.best_point = new
        return is_better

    def _mutate(self, particle):
        new = particle.copy()
        m_idxs = np.random.choice(self.size, size=self.mutation, replace=False)
        m_perm = np.random.permutation(self.mutation)
        for old, new in enumerate(m_perm):
            new[m_idxs[old]] = particle[new]
        return new

    def _crossover(self, particle, best_particle, n):
        cross_idxs = np.random.choice(self.size, size=n, replace=False)
        new = -1*np.ones_like(particle)
        new[cross_idxs] = best_particle[cross_idxs]
        idx = 0
        for i, gen in enumerate(new):
            if gen == -1: # skip over the parent1 part in child
                while(particle[idx] in new):
                    idx += 1
                new[i] = particle[idx]
        return new


if __name__ == '__main__':
    def fitness_func(chromosome):
        t1 = 1
        t2 = 1
        size = len(chromosome)
        f1 = [chromosome[i]-i for i in range(size)]
        f2 = [size - g for g in f1]
        f1.sort()
        f2.sort()
        for i in range(1, size):
            t1 += int(f1[i] == f1[i-1])
            t2 += int(f2[i] == f2[i-1])
        return t1 + t2


    optimizer = GeneticAlgorithm(1000, 0.8, 0.2, fitness_func)
    optimizer.find_optimimum(8, 300)
    print(optimizer.population)

