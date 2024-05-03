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


import unittest
import sys
from types import ModuleType
from typing import Optional

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')
from pyzx.circuit import Circuit
from pyzx.simulate import replace_magic_states

np: Optional[ModuleType]
try:
    import numpy as np
except ImportError:
    np = None


@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestSimulate(unittest.TestCase):

    def test_magic_state_decomposition_is_correct(self):
        c = Circuit(6)
        for i in range(6):
            c.add_gate("T", i)
        g = c.to_graph()
        gsum = replace_magic_states(g)
        self.assertTrue(np.allclose(g.to_tensor(), gsum.to_tensor()))


if __name__ == '__main__':
    unittest.main()
