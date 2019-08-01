# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

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

import random
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.tensor import compare_tensors
from pyzx.generate import cliffordT
from pyzx.simplify import *
from pyzx.extract import *
from pyzx.phasepoly import *
from pyzx.circuit import Circuit
from pyzx.optimize import *

SEED = 1337
random.seed(SEED)

def compare(a,b, scalar_accurate=True):
    if not compare_tensors(a, b,scalar_accurate):
        raise AssertionError("Not equal")

def do_tests(qubits, depth, iterations, test_clifford_graph=True):
    print("Starting test with circuits of {:d} qubits and {:d} depth. {:d} iterations".format(qubits, depth, iterations))
    try:
        for i in range(1, iterations+1):
            if i%25 == 0: print(i, end='.', flush=True)
            seed = random.randint(100000,500000)
            random.seed(seed)
            steps = []
            circ = cliffordT(qubits,depth,p_t=0.2)
            t = circ.to_tensor()
            g = circ.copy()
            clifford_simp(g,quiet=True)
            steps.append("clifford_simp")
            if test_clifford_graph: compare(t, g)
            
            c = streaming_extract(g)
            steps.append("streaming_extract")
            compare(t, c, False)

            c = c.to_basic_gates()
            steps.append("to_basic_gates")
            compare(t, c, False)

            c2, blocks = circuit_phase_polynomial_blocks(c, optimize=False)
            steps.append("phase_polynomial")
            compare(t, c2, False)

            c2, blocks = circuit_phase_polynomial_blocks(c, optimize=True)
            steps[-1] = "phase_polynomial_optimized"
            compare(t, c2, False)

            steps = []
            g = circ.copy()
            full_reduce(g, quiet=True)
            steps.append("full_reduce")
            if test_clifford_graph: compare(t, g)

            c = modified_extract(g)
            steps.append("modified_extract")
            compare(t,c,False)

            steps = []
            g = circ.copy()
            full_reduce(g, quiet=True)
            steps.append("full_reduce")
            c = streaming_extract(g).to_basic_gates()
            steps.append("streaming_extract")
            compare(t, c, False)

            c2, blocks = circuit_phase_polynomial_blocks(c, optimize=True)
            steps[-1] = "phase_polynomial_optimized"
            compare(t, c2, False)

            steps = []
            g = circ.copy()
            #to_gh(g)
            #id_simp(g,quiet=True)
            #spider_simp(g,quiet=True)
            g = teleport_reduce(g)
            steps.append("teleport_reduce")
            compare(t,g, False)
            #c1 = zx.Circuit.from_graph(g,split_phases=True).to_basic_gates()
            #c1 = zx.optimize.basic_optimization(c_opt).to_basic_gates()
            #self.c_opt = c_opt
            #c_id = c_orig.adjoint()
            #c_id.add_circuit(c_opt)
            #g = c_id.to_graph()
            #zx.simplify.full_reduce(g)
                        

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
do_tests(3, 80, 250, False)
do_tests(5, 40, 250, False)
do_tests(5, 120, 500, False)
do_tests(6, 400, 250, False)
