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

import unittest
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors
except ImportError:
    np = None

from pyzx.circuit import Circuit
from pyzx.simulate import replace_magic_states

@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestSimulate(unittest.TestCase):

    def test_magic_state_decomposition_is_correct(self):
        c = Circuit(6)
        for i in range(6):
            c.add_gate("T",i)
        g = c.to_graph()
        gsum = replace_magic_states(g)
        self.assertTrue(np.allclose(g.to_tensor(),gsum.to_tensor()))

if __name__ == '__main__':
    unittest.main()