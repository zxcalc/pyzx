# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
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


import random
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

import numpy as np

from pyzx.tensor import compare_tensors
from pyzx.generate import CNOT_HAD_PHASE_circuit
from pyzx.simplify import clifford_simp, full_reduce, reduce_scalar
from pyzx.simulate import calculate_path_sum
from pyzx.circuit import Circuit

SEED = 1337
random.seed(SEED)


def compare(a,b):
    try:
        if not compare_tensors(a, b):
            raise AssertionError("Not equal")
    except (ValueError, MemoryError): pass


def do_tests(qubits, depth, iterations):
    print("Starting test with circuits of {:d} qubits and {:d} depth. {:d} iterations".format(qubits, depth, iterations))
    try:
        for i in range(1, iterations+1):
            if i%25 == 0: print(i, end='.', flush=True)
            seed = random.randint(100000,500000)
            random.seed(seed)
            c = CNOT_HAD_PHASE_circuit(qubits,depth,p_had=0.1, p_t=0.3)
            g = c.to_graph()
            g.apply_state(''.join(random.choice('+-01') for _ in range(qubits)))
            g.apply_effect(''.join(random.choice('+-01') for _ in range(qubits)))
            t = g.to_tensor()
            g2 = g.copy()
            clifford_simp(g2,quiet=True)
            steps = ["clifford_simp"]
            compare(t, g2)

            g2 = g.copy()
            full_reduce(g2,quiet=True)
            steps = ["full_reduce"]
            compare(t, g2)

            val = calculate_path_sum(g2)
            steps.append("calculate_path_sum")
            compare(t,np.array([val]))

            g2 = g.copy()
            steps = ["clifford_simp", "reduce_scalar"]
            clifford_simp(g2,quiet=True)
            reduce_scalar(g2,quiet=True)
            compare(t,g2)
            
     
    except AssertionError:
        print("Unequality for circuit with seed {:d}, qubits {:d} and depth {:d}".format(seed, qubits, depth))
        print("It went wrong at step {} with total sequence {}".format(steps[-1],str(steps)))
    except Exception as e:
        print("An exception occured for circuit with seed {:d}, qubits {:d} and depth {:d}".format(seed, qubits, depth))
        print("It went wrong at step {} with total sequence {}".format(steps[-1],str(steps)))
        raise e
    else:
        print("\nTests finished successfully")

do_tests(3, 20, 500)
do_tests(3, 50, 500)
do_tests(4,70,500)
do_tests(5, 100, 250)
do_tests(10, 100, 250)
