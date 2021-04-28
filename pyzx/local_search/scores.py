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
This module contains objective functions to guide local search over ZX-diagrams. The wgc method defines a measure of circuit complexity -- a weighted gate count where 2-qubit counts incur a higher cost. The g_wgc takes a ZX-diagram as input and optionally applies various optimizations before measuring the complexity of the circuit obtained via extraction.
"""

import sys
if __name__ == '__main__':
    sys.path.append('..')
from pyzx.extract import extract_circuit
from pyzx.simplify import full_reduce
from pyzx.optimize import basic_optimization

# Weighted gate count
def wgc(c, two_qb_weight=10):
    """A measure of the complexity of a given circuit. By default, 2-qubit
    gates are treated as 10X more costly than single-qubit gates"""

    c_tmp = c.to_basic_gates()
    total = len(c_tmp.gates)
    n2 = c_tmp.twoqubitcount()
    single_qubit_count = total - n2
    return two_qb_weight * n2 + single_qubit_count

# Weighted gate count of a ZX-diagram
def g_wgc(g, two_qb_weight=10, g_simplify=True, c_simplify=True):
    """A measure of the complexity of the circuit obtained from a a ZX-diagram
    upon extraction using the above measure of circuit complexity"""

    g_tmp = g.copy()
    if g_simplify:
        full_reduce(g_tmp)

    c = extract_circuit(g_tmp.copy()).to_basic_gates()

    if c_simplify:
        c = basic_optimization(c)

    return wgc(c, two_qb_weight=two_qb_weight)
