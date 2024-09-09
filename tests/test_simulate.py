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
from fractions import Fraction
import unittest
import sys
import random
from types import ModuleType
from typing import Optional

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
from pyzx.circuit import Circuit
from pyzx.graph import Graph, EdgeType, Scalar
from pyzx.simulate import (
    replace_magic_states,
    cut_vertex,
    cut_edge,
    gen_catlike_term
)
from pyzx.generate import cliffords
from pyzx.simplify import full_reduce

np: Optional[ModuleType]
try:
    import numpy as np
except ImportError:
    np = None

def rand_graph(qubits=5,depth=10):
    g = cliffords(qubits,depth)
    g.apply_state('0'*qubits)
    g.apply_effect('0'*qubits)
    return g
    
def round_complex(scalar,decimal_places):
    return round(scalar.real,decimal_places) + round(scalar.imag,decimal_places)*1j

@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestSimulate(unittest.TestCase):

    def test_magic_state_decomposition_is_correct(self):
        c = Circuit(6)
        for i in range(6):
            c.add_gate("T", i)
        g = c.to_graph()
        gsum = replace_magic_states(g)
        self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))
        
    def test_vertex_cut(self,repeats=20):
        for i in range(1,repeats):
            g = rand_graph() # generate random Clifford graph
            v_cut = random.randrange(len(g.vertices()))
            g0,g1 = cut_vertex(g,v_cut) # apply random vertex cut
            
            for g_i in (g,g0,g1): full_reduce(g_i)
            
            scal    = round_complex(g.scalar.to_number(),3) # the scalar from fully reducing g
            scalCut = round_complex(g0.scalar.to_number()+g1.scalar.to_number(),3) # the sum of scalars from the cut graph
            assert(scal == scalCut)
        
    def test_edge_cut(self,repeats=20):
        for i in range(1,repeats):
            g = rand_graph() # generate random Clifford graph
            rand_v = random.randrange(len(g.vertices()))
            rand_neigh = list(g.neighbors(rand_v))[random.randrange(len(g.neighbors(rand_v)))]
            e_cut = (rand_v,rand_neigh)  # apply random edge cut
            
            g0,g1 = cut_edge(g,e_cut)
            for g_i in (g,g0,g1): full_reduce(g_i)
            
            scal    = round_complex(g.scalar.to_number(),3) # the scalar from fully reducing g
            scalCut = round_complex(g0.scalar.to_number()+g1.scalar.to_number(),3) # the sum of scalars from the cut graph
            assert(scal == scalCut)

    def test_cat_decomp_scalar(self) -> None:
        """Test the scalars of generated cat-like terms are correct."""
        g = Graph()

        # Generate random scalar parameters
        phase = Fraction(np.random.randint(1, 10), np.random.randint(1, 10))
        power = np.random.randint(1, 10)
        positive = np.random.randint(0, 1)

        # Generate cat-like term with random scalar parameters
        G = gen_catlike_term(g, [],
                             Fraction(1, 1),
                             Fraction(1, 1),
                             Fraction(1, 1),
                             EdgeType.SIMPLE,
                             EdgeType.SIMPLE,
                             positive,
                             power,
                             phase,
                             False)

        # Create expected scalar
        s = Scalar()
        s.add_power(power)
        s.add_phase(phase)
        if not positive:
            s.add_phase(1)

        # Check if the scalar from generated term is correct
        self.assertTrue(np.allclose(G.scalar.to_number(), s.to_number()))


if __name__ == '__main__':
    unittest.main()
