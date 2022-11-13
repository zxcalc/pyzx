# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import unittest
import random
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

try:
    import numpy as np
    from pyzx.tensor import tensorfy, compare_tensors, tensor_to_matrix
except ImportError:
    np = None

from pyzx.circuit import Circuit
from fractions import Fraction
SEED = 1337

@unittest.skipUnless(np, "numpy needs to be installed for this to run")
class TestCircuit(unittest.TestCase):
    def setUp(self):
        c = Circuit(1)
        c.add_gate("YPhase", 0, Fraction(1, 4))
        self.c = c
    def test_to_qasm_and_back(self):
        s = self.c.to_qasm()
        c1 = Circuit.from_qasm(s)
        self.assertEqual(self.c.qubits, c1.qubits)
        self.assertListEqual(self.c.gates,c1.gates)

    def test_load_qasm_from_file(self):
        c1 = Circuit.from_qasm_file("ry.qasm")
        self.assertEqual(c1.qubits, self.c.qubits)
        self.assertListEqual(c1.gates,self.c.gates)

    def test_ry_preserves_graph_semantics(self):
        g = self.c.to_graph()
        t = tensor_to_matrix(tensorfy(g, False), 1, 1)
        expected_t = np.asarray([[np.cos(np.pi/8), np.sin(np.pi/8)], [-np.sin(np.pi/8), np.cos(np.pi/8)]])
        self.assertTrue(compare_tensors(t, expected_t, False))
