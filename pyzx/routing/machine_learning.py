# PyZX - Python library for quantum circuit rewriting
#        and optimization using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


from multiprocessing import cpu_count
from multiprocessing.pool import Pool
from typing import Any, List, Optional, Tuple
import numpy as np


class GeneticAlgorithm:
    """
    A genetic algorithm for optimising permutations based on a fitness function.
    """
    def __init__(
        self,
        population_size: int,
        crossover_prob: float,
        mutation_prob: float,
        fitness_func,
        maximize: bool = False,
    ):
        """
        Creates and returns a genetic algorithm.

        :param population_size: Number of individuals in the population
        :param crossover_prob: Probability of crossover between individuals
        :param mutation_prob: Probability of mutation for an offspring
        :param fitness_func: Function to evaluate fitness of permutations
        :param maximize: True, Maximise the fitness, False, Minimise the Fitness, default False 
        """
        self.population_size = population_size
        self.negative_population_size = int(np.sqrt(population_size))
        self.crossover_prob = crossover_prob
        self.mutation_prob = mutation_prob
        self.fitness_func = fitness_func
        self._sort = lambda l: l.sort(key=lambda x: x[1], reverse=maximize)
        self.maximize = maximize
        self.n_qubits = 0
        self.population: List[Tuple[List[int], Any]] = []

    def _select(self):
        """
        Selects two parent indices from the population based on fitness-proportional selection.
        
        :return: A random two parent indices from the population
        """
        fitness_scores = [f for c, f in self.population]
        total_fitness = sum(fitness_scores)
        if self.maximize:
            selection_chance = [f / total_fitness for f in fitness_scores]
        else:
            max_fitness = max(fitness_scores) + 1
            adjusted_scores = [max_fitness - f for f in fitness_scores]
            adjusted_total = sum(adjusted_scores)
            selection_chance = [f / adjusted_total for f in adjusted_scores]
        return np.random.choice(
            self.population_size, size=2, replace=False, p=selection_chance
        )

    def _create_population(self, n):
        """
        Initialises the population with random permutations with size n and evaluates their fitness.
        Also creates a list of the weakest individuals - negative population.

        :param n: The size of the random permutation
        """
        population = [np.random.permutation(n) for _ in range(self.population_size)]
        self.population = [
            (list(chromosome), self.fitness_func(chromosome))
            for chromosome in population
        ]
        self._sort(self.population)
        self.negative_population = self.population[-self.negative_population_size :]

    def find_optimum(
        self, n_qubits, n_generations, initial_order=None, n_child=None, continued=False
    ):
        """
        Runs the genetic algorithm to find the best permutation over a number of generations.

        :param n_qubits: The number of qubits (number of elements in each permutation)
        :param n_generations: The number of generations
        :param initial_order: Initial permuation to start from, if None, creates population with the number of qubits, default None
        :param n_child: Number of children to generate per generation, default None
        :param continued: True, continue to previous population, default False
        :return: The best permutation
        """
        self.n_qubits = n_qubits
        partial_solution = False
        if not continued or not self.population:
            if initial_order is None:
                self._create_population(n_qubits)
            elif n_qubits < len(initial_order):
                self._create_population(initial_order[:n_qubits])
                partial_solution = True
            else:
                self._create_population(initial_order)

        if n_child is None:
            n_child = self.population_size

        for _ in range(n_generations):
            self._update_population(n_child)
        if partial_solution and initial_order is not None:
            return self.population[0] + initial_order[n_qubits:]
        return self.population[0][0]

    def _add_children(self, children):
        """
        Adds new children to the population and updates fitness scores.

        :param children: The children to be added to the population
        """
        n_child = len(children)
        self.population.extend(
            [(child, self.fitness_func(child)) for child in children]
        )
        self._sort(self.population)
        self.negative_population.extend(self.population[-n_child:])
        self.negative_population = [
            self.negative_population[i]
            for i in np.random.choice(
                self.negative_population_size + n_child,
                size=self.negative_population_size,
                replace=False,
            )
        ]
        self.population = self.population[: self.population_size]

    def _update_population(self, n_child: int):
        """
        Generates a new generation of children and integrates them into the population.

        :param n_child: The number of children
        """
        children = []
        # Create a child from weak parents to avoid local optima
        p1, p2 = np.random.choice(self.negative_population_size, size=2, replace=False)
        child = self._crossover(
            self.negative_population[p1][0], self.negative_population[p2][0]
        )
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
        """
        Performs ordered crossover between two parents.

        :param parent1: The first parent
        :param parent2: The second parent
        :return: The child of the 2 parents
        """
        crossover_start = np.random.choice(int(self.n_qubits / 2))
        crossover_length = np.random.choice(self.n_qubits - crossover_start)
        crossover_end = crossover_start + crossover_length
        child = -1 * np.ones_like(parent1)
        child[crossover_start:crossover_end] = parent1[crossover_start:crossover_end]
        child_idx = 0
        for parent_gen in parent2:
            if child_idx == crossover_start:  # skip over the parent1 part in child
                child_idx = crossover_end
            if parent_gen not in child:  # only add new genes
                child[child_idx] = parent_gen
                child_idx += 1
        return child

    def _mutate(self, parent):
        """
        Applies mutation by swapping two random elements in the permutation.

        :param parent: The parent to mutate
        :return: A mutated parent
        """
        gen1, gen2 = np.random.choice(len(parent), size=2, replace=False)
        _ = parent[gen1]
        parent[gen1] = parent[gen2]
        parent[gen2] = _
        return parent

class ParticleSwarmOptimization:
    """
    Optimizer based on the particle swarm optimization algorithm.
    """

    def __init__(
        self,
        swarm_size: int,
        step_func, # type 'StepFunction'
        s_best_crossover: float,
        p_best_crossover: float,
        mutation: float,
        maximize: bool = False,
        n_threads: Optional[int] = None,
    ):
        """
        Setup the optimizer

        :param swarm_size: Swarm size for the swarm optimization.
        :param step_function: The to progress the swarm.
        :param s_best_crossover: The crossover percentage with the best particle in the swarm. Must be between 0.0 and 1.0.
        :param p_best_crossover: The crossover percentage with the personal best of a particle. Must be between 0.0 and 1.0.
        :param mutation: The mutation percentage of a particle. Must be between 0.0 and 1.0.
        :param maximize: Whether to maximize the fitness function.
        :param n_threads: Number of threads to use for the optimization. If None, use all available threads.
        """
        self.step_func = step_func
        self.size = swarm_size
        self.s_crossover = s_best_crossover
        self.p_crossover = p_best_crossover
        self.mutation = mutation
        self.best_particle = None
        self.maximize = maximize
        self.swarm: List[Particle] = []
        self.pool: Optional[Pool] = None
        n_threads = (
            min(n_threads, cpu_count()) if n_threads is not None else cpu_count()
        )
        if n_threads > 1:
            self.pool = Pool(n_threads)

    def __getstate__(self):
        """
        Prepares the object state for pickling by removing non-serialisable fields.

        :return: The state dictionary
        """
        state = self.__dict__.copy()
        # Don't pickle baz
        # del state["fitness_func"]
        del state["pool"]
        return state

    def __setstate__(self, state):
        """
        Restores the object state after unpickling

        :param state: The state to be restored to the dictionary
        """
        self.__dict__.update(state)
        # Add baz back since it doesn't exist in the pickle
        # self.fitness_func = None
        self.pool = None

    def _create_swarm(self, n):
        """
        Initializes the swarm with random permutations.

        :param n: The number of qubits in a particle
        """

        self.swarm = [
            Particle(
                n,
                self.step_func,
                self.s_crossover,
                self.p_crossover,
                self.mutation,
                self.maximize,
                id=i,
            )
            for i in range(self.size)
        ]
        # Start with 1 particle with initial permutation
        self.swarm[0].current = np.arange(n)

    def find_optimum(self, n_qubits, n_steps, quiet=True, close_pool=True):
        """
        Creates a swarm of n-qubits and determines the optimum fitness solution for a given number of steps

        :param n_qubits: The number of qubits
        :param n_steps: The number of steps
        :param quiet: Whether to show updates on the iteration and fitness score as it iterates, default True
        :param close_pool: Whether to close and join the pool after finding the optimum, default True
        :return: The optimum solution for swarm
        """
        self._create_swarm(n_qubits)
        self.best_particle = self.swarm[0]
        for i in range(n_steps):
            self._update_swarm()
            if not quiet:
                print(
                    "PSO - Iteration",
                    i,
                    "best fitness:",
                    self.best_particle.best,
                    self.best_particle.best_point,
                )
        if close_pool and self.pool:
            self.pool.close()
            self.pool.join()
        return self.best_particle.best_solution

    @staticmethod
    def particle_update_func(args):
        """
        Update a single particle in the swarm using the current global best particle.

        :param args: Tuple of swarm_best and particle, where swarm_best is the current best performing particle and the particle is the particle to be updated
        :return: The next evolution of the particle
        """
        swarm_best, p = args
        p.step(swarm_best)
        return p

    def _update_swarm(self):
        """
        Update the state of all particles in the swarm, after updating the method finds the best particle in the swarm.
        """
        if self.pool is not None:
            self.swarm = self.pool.map(
                self.particle_update_func, [(self.best_particle, p) for p in self.swarm]
            )
        else:
            self.swarm = [
                self.particle_update_func((self.best_particle, p)) for p in self.swarm
            ]
        if self.maximize:
            top = max(
                self.swarm, key=lambda p: p.best if p.best is not None else -np.inf
            )
        else:
            top = min(
                self.swarm, key=lambda p: p.best if p.best is not None else np.inf
            )
        if self.best_particle is None or top.compare(self.best_particle.best):
            self.best_particle = top


class Particle:
    """
    Represents a single particle in a swarm.
    """
    def __init__(
        self,
        size,
        step_func,
        s_best_crossover,
        p_best_crossover,
        mutation,
        maximize=False,
        id=None,
    ):
        """
        Creates and returns a single particle.

        :param size: The number of qubits in the permutation space
        :param step_func: A callable that evaluates the current position and returns (new_position, solution, fitness)
        :param s_best_crossover: Proportion of genes inherited from the swarms best particle
        :param p_best_crossover: Proportion of genes inherited from the particles own best known position
        :param mutation: Mutation rate as a proportion of the permatation length
        :param maximize: True, Maximise the fitness, False, Minimise the fitness, default False 
        :param id: Id for the particle, default None
        """
        self.step_func = step_func
        self.size = size
        self.current = np.random.permutation(size)
        self.best_point = self.current
        self.best = None
        self.best_solution = None
        self.s_crossover = int(s_best_crossover * size)
        self.p_crossover = int(p_best_crossover * size)
        self.mutation = int(mutation * size)
        self.maximize = maximize
        self.id = id

    def compare(self, x):
        """
        Compare a new fitness score to the current best.

        :param x: New score to compare
        :return: True, if it is the better than the best score
        """
        if x is None:
            return True
        if self.maximize:
            return x < self.best
        else:
            return x > self.best

    def step(self, swarm_best):
        """
        Preform one optimisation step for the particle.

        :param swarm_best: The best particle in the swarm
        :return: True, a better solution was found, False, no better solution was found
        """
        new, solution, fitness = self.step_func(self.current)
        is_better = self.best is None or not self.compare(fitness)
        if is_better:
            self.best = fitness
            self.best_point = self.current
            self.best_solution = solution
        elif all([self.current[i] == n for i, n in enumerate(new)]):
            new = self._mutate(self.current)
            new = self._crossover(new, self.best_point, self.p_crossover)
            new = self._crossover(new, swarm_best.best_point, self.s_crossover)
            # Sanity check TODO can be removed!
            if any([i not in new for i in range(self.size)]):
                raise Exception(
                    "The new particle point is not a permutation anymore!"
                    + str(self.current)
                )
        self.current = new
        return is_better

    def _mutate(self, particle):
        """
        Randomly mutate the particle by permuting a subset of its genes.

        :param particle: The current particle permutation
        :return: A mutated particle permutation
        """
        new_particle = particle.copy()
        m_idxs = np.random.choice(self.size, size=self.mutation, replace=False)
        m_perm = np.random.permutation(self.mutation)
        for old_i, new_i in enumerate(m_perm):
            new_particle[m_idxs[old_i]] = particle[m_idxs[new_i]]
        return new_particle

    def _crossover(self, particle, best_particle, n):
        """
        Preform a crossover between this particle and the best current particle.

        :param particle: The current particle permutation
        :param best_particle: The highest scoring particle permutation
        :param n: The number of genes to crossover
        :return: A new mutated particle permutation resulting from the crossover
        """
        cross_idxs = np.random.choice(self.size, size=n, replace=False)
        new_particle = -1 * np.ones_like(particle)
        new_particle[cross_idxs] = best_particle[cross_idxs]
        idx = 0
        for i, gen in enumerate(new_particle):
            if gen == -1:  # skip over the parent1 part in child
                while particle[idx] in new_particle:
                    idx += 1
                    if idx == len(particle):
                        break
                if idx < len(particle):
                    new_particle[i] = particle[idx]
        return new_particle

if __name__ == "__main__":

    def fitness_func(chromosome):
        """
        Sample fitness function.

        :param chromosome: A list representing a permutation of indices
        :return: An integer representing a fitness score
        """
        t1 = 1
        t2 = 1
        size = len(chromosome)
        f1 = [chromosome[i] - i for i in range(size)]
        f2 = [size - g for g in f1]
        f1.sort()
        f2.sort()
        for i in range(1, size):
            t1 += int(f1[i] == f1[i - 1])
            t2 += int(f2[i] == f2[i - 1])
        return t1 + t2

    optimizer = GeneticAlgorithm(1000, 0.8, 0.2, fitness_func)
    optimizer.find_optimum(8, 300)
    print(optimizer.population)
