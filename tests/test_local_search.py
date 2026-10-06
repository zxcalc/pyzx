# PyZX - Python library for quantum circuit rewriting
#        and optimization using the ZX-calculus
# Copyright (C) 2026 - PyZX contributors

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import unittest

from pyzx.local_search.genetic import GeneticOptimizer, rand_lc, rand_pivot


class TestGeneticOptimizer(unittest.TestCase):
    def test_actions_are_independent_between_instances(self):
        first = GeneticOptimizer()
        second = GeneticOptimizer()
        original_order = list(first.actions)

        # mutate() shuffles actions. It must not reorder another optimizer.
        second.actions.reverse()
        self.assertEqual(first.actions, original_order)

        supplied_actions = [rand_pivot, rand_lc]
        custom = GeneticOptimizer(actions=supplied_actions)
        supplied_actions.reverse()
        self.assertEqual(custom.actions, original_order)
