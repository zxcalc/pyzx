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


import numpy as np

class GeneticAlgorithm():

    def __init__(self, population_size, crossover_prob, mutation_prob, fitness_func, maximize=False):
        self.population_size = population_size
        self.negative_population_size = int(np.sqrt(population_size))
        self.crossover_prob = crossover_prob
        self.mutation_prob = mutation_prob
        self.fitness_func = fitness_func
        self._sort = lambda l: l.sort(key=lambda x:x[1], reverse=maximize)
        self.maximize = maximize
        self.n_qubits = 0
        self.population = None

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

    def find_optimum(self, n_qubits, n_generations, initial_order=None, n_child=None, continued=False):
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

        for _ in range(n_generations):
            self._update_population(n_child)
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
    optimizer.find_optimum(8, 300)
    print(optimizer.population)

