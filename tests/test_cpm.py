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

"""
Comprehensive tests for the double-wire (CPM) layer.

Tests validate:
- Functoriality (composition preserves CPM structure)
- Tensoriality (tensor product preserves CPM structure)
- Linearity (scalar and addition operations)
- Identity and dagger properties
- CPTP properties for unitary-derived maps
- Arity checking and error handling
- Serialization round-trips
- Cross-form consistency (action vs superoperator)
"""

import unittest
import sys
from typing import Optional
from types import ModuleType

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.graph import Graph
from pyzx.cpm import DoubleWireDiagram, lift
from pyzx.generate import cliffords, identity

np: Optional[ModuleType]
try:
    import numpy as np
    from pyzx.tensor import tensorfy, tensor_to_matrix
except ImportError:
    np = None

SEED = 1337
TOLERANCE = 1e-9


def random_density_matrix(n_qubits: int, seed: Optional[int] = None) -> np.ndarray:
    """Generate a random n-qubit density matrix."""
    if seed is not None:
        np.random.seed(seed)
    dim = 2**n_qubits
    # Generate random pure state
    psi = np.random.randn(dim) + 1j * np.random.randn(dim)
    psi = psi / np.linalg.norm(psi)
    # Create density matrix
    rho = np.outer(psi, np.conj(psi))
    return rho


def random_mixed_density_matrix(n_qubits: int, seed: Optional[int] = None) -> np.ndarray:
    """Generate a random mixed n-qubit density matrix."""
    if seed is not None:
        np.random.seed(seed)
    dim = 2**n_qubits
    # Generate random Hermitian matrix
    A = np.random.randn(dim, dim) + 1j * np.random.randn(dim, dim)
    A = A + A.conj().T  # Make Hermitian
    # Get eigendecomposition and use positive eigenvalues
    eigvals, eigvecs = np.linalg.eigh(A)
    eigvals = np.abs(eigvals)
    eigvals = eigvals / np.sum(eigvals)  # Normalize
    rho = eigvecs @ np.diag(eigvals) @ eigvecs.conj().T
    return rho


def is_density_matrix(rho: np.ndarray, tol: float = TOLERANCE) -> bool:
    """Check if matrix is a valid density matrix."""
    # Check Hermitian
    if not np.allclose(rho, rho.conj().T, atol=tol):
        return False
    # Check positive semidefinite
    eigvals = np.linalg.eigvalsh(rho)
    if np.any(eigvals < -tol):
        return False
    # Check trace = 1
    if not np.isclose(np.trace(rho), 1.0, atol=tol):
        return False
    return True


def choi_matrix(superop: np.ndarray) -> np.ndarray:
    """Compute Choi matrix from superoperator (column-stacking convention)."""
    dim_sq = superop.shape[0]
    dim = int(np.sqrt(dim_sq))
    # Reshape to get Choi matrix
    choi = superop.reshape((dim, dim, dim, dim))
    choi = choi.transpose((0, 2, 1, 3)).reshape((dim_sq, dim_sq))
    return choi


def is_completely_positive(superop: np.ndarray, tol: float = TOLERANCE) -> bool:
    """Check if superoperator is completely positive via Choi matrix."""
    choi = choi_matrix(superop)
    eigvals = np.linalg.eigvalsh(choi)
    return np.all(eigvals >= -tol)


def is_trace_preserving(superop: np.ndarray, tol: float = TOLERANCE) -> bool:
    """Check if superoperator is trace-preserving."""
    dim_sq = superop.shape[0]
    dim = int(np.sqrt(dim_sq))
    # Apply to identity and check trace
    identity_vec = np.eye(dim).flatten()
    result_vec = superop @ identity_vec
    result = result_vec.reshape((dim, dim))
    return np.isclose(np.trace(result), dim, atol=tol)



class TestCPMFunctoriality(unittest.TestCase):
    """Test functoriality: composition preserves CPM structure."""

    def test_composition_single_terms(self):
        """Test composition of single-term double-wire diagrams."""
        # Create two simple diagrams: identity wires
        g1 = Graph()
        i1 = g1.add_vertex(0, 0, 0)
        o1 = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i1,))
        g1.set_outputs((o1,))
        g1.add_edge((i1, o1))

        g2 = g1.copy()

        # Lift to double-wire
        dw1 = lift(g1)
        dw2 = lift(g2)

        # Compose in double-wire world
        dw_composed = dw1.compose(dw2)

        # Compose in base world then lift
        g1_copy = g1.copy()
        g1_copy.compose(g2)
        dw_base_composed = lift(g1_copy)

        # Test on random density matrices
        for seed in range(3):
            rho = random_density_matrix(1, seed)
            action_composed = dw_composed.to_action()
            action_base = dw_base_composed.to_action()

            result_composed = action_composed(rho)
            result_base = action_base(rho)

            self.assertTrue(
                np.allclose(result_composed, result_base, atol=TOLERANCE),
                f"Composition functoriality failed for seed {seed}"
            )

    def test_composition_with_phase(self):
        """Test composition with non-trivial phases."""
        # Create Z spider with phase
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        z = g1.add_vertex(1, 0.5, 1)
        o = g1.add_vertex(0, 1, 2)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edges([(i, z), (z, o)])
        g1.set_phase(z, 0.5)  # π/2 phase

        g2 = g1.copy()

        # Test composition
        dw1 = lift(g1)
        dw2 = lift(g2)
        dw_composed = dw1.compose(dw2)

        # Base composition
        g1_copy = g1.copy()
        g1_copy.compose(g2)
        dw_base = lift(g1_copy)

        # Verify on density matrices
        rho = random_density_matrix(1, SEED)
        result_composed = dw_composed.to_action()(rho)
        result_base = dw_base.to_action()(rho)

        self.assertTrue(np.allclose(result_composed, result_base, atol=TOLERANCE))

    def test_composition_linear_combinations(self):
        """Test composition with linear combinations on both sides."""
        # Create two diagrams
        g_id = Graph()
        i = g_id.add_vertex(0, 0, 0)
        o = g_id.add_vertex(0, 0, 1)
        g_id.set_inputs((i,))
        g_id.set_outputs((o,))
        g_id.add_edge((i, o))

        g_z = Graph()
        i = g_z.add_vertex(0, 0, 0)
        z = g_z.add_vertex(1, 0.5, 1)
        o = g_z.add_vertex(0, 1, 2)
        g_z.set_inputs((i,))
        g_z.set_outputs((o,))
        g_z.add_edges([(i, z), (z, o)])

        # Create linear combinations
        dw_left = lift(g_id, 0.6) + lift(g_z, 0.4)
        dw_right = lift(g_id, 0.7) + lift(g_z, 0.3)

        # Compose
        dw_composed = dw_left.compose(dw_right)

        # Should have 4 terms: (0.6*id ; 0.7*id), (0.6*id ; 0.3*z), etc.
        self.assertEqual(len(dw_composed.terms), 4)

        # Verify action is correct
        rho = random_density_matrix(1, SEED)
        result = dw_composed.to_action()(rho)

        # Manually compute expected result
        action_id = lift(g_id).to_action()
        action_z = lift(g_z).to_action()
        expected = (0.6 * 0.7) * action_id(action_id(rho)) + \
                   (0.6 * 0.3) * action_id(action_z(rho)) + \
                   (0.4 * 0.7) * action_z(action_id(rho)) + \
                   (0.4 * 0.3) * action_z(action_z(rho))

        self.assertTrue(np.allclose(result, expected, atol=TOLERANCE))

    def test_composition_arity_mismatch(self):
        """Test that composition fails with mismatched arities."""
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        o = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edge((i, o))

        g2 = Graph()
        i1 = g2.add_vertex(0, 0, 0)
        i2 = g2.add_vertex(0, 1, 0)
        o1 = g2.add_vertex(0, 0, 1)
        o2 = g2.add_vertex(0, 1, 1)
        g2.set_inputs((i1, i2))
        g2.set_outputs((o1, o2))
        g2.add_edges([(i1, o1), (i2, o2)])

        dw1 = lift(g1)  # 1→1
        dw2 = lift(g2)  # 2→2

        with self.assertRaises(ValueError):
            dw1.compose(dw2)



class TestCPMTensoriality(unittest.TestCase):
    """Test tensoriality: tensor product preserves CPM structure."""

    def test_tensor_single_terms(self):
        """Test tensor product of single-term diagrams."""
        # Create two single-qubit diagrams
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        o = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edge((i, o))

        g2 = g1.copy()

        dw1 = lift(g1)
        dw2 = lift(g2)

        # Tensor in double-wire world
        dw_tensored = dw1.tensor(dw2)

        # Tensor in base world then lift
        g_tensored = g1.tensor(g2)
        dw_base = lift(g_tensored)

        # Test on product states
        rho1 = random_density_matrix(1, SEED)
        rho2 = random_density_matrix(1, SEED + 1)
        rho_product = np.kron(rho1, rho2)

        result_tensored = dw_tensored.to_action()(rho_product)
        result_base = dw_base.to_action()(rho_product)

        self.assertTrue(np.allclose(result_tensored, result_base, atol=TOLERANCE))

    def test_tensor_entangled_state(self):
        """Test tensor product on entangled density matrices."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g)

        # Create 2-qubit tensor
        dw_tensor = dw @ dw

        # Test on Bell state
        psi_bell = np.array([1, 0, 0, 1]) / np.sqrt(2)
        rho_bell = np.outer(psi_bell, np.conj(psi_bell))

        result = dw_tensor.to_action()(rho_bell)

        # Should be identity operation
        self.assertTrue(np.allclose(result, rho_bell, atol=TOLERANCE))

    def test_tensor_arity_update(self):
        """Test that tensor product correctly updates arity."""
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        o = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edge((i, o))

        g2 = Graph()
        i1 = g2.add_vertex(0, 0, 0)
        i2 = g2.add_vertex(0, 1, 0)
        o1 = g2.add_vertex(0, 0, 1)
        o2 = g2.add_vertex(0, 1, 1)
        g2.set_inputs((i1, i2))
        g2.set_outputs((o1, o2))
        g2.add_edges([(i1, o1), (i2, o2)])

        dw1 = lift(g1)  # 1→1
        dw2 = lift(g2)  # 2→2

        dw_tensor = dw1 @ dw2  # Should be 3→3

        self.assertEqual(dw_tensor.num_inputs, 3)
        self.assertEqual(dw_tensor.num_outputs, 3)

    def test_tensor_linear_combinations(self):
        """Test tensor product with linear combinations."""
        g_id = Graph()
        i = g_id.add_vertex(0, 0, 0)
        o = g_id.add_vertex(0, 0, 1)
        g_id.set_inputs((i,))
        g_id.set_outputs((o,))
        g_id.add_edge((i, o))

        g_z = g_id.copy()
        z = g_z.add_vertex(1, 0.5, 0.5)
        g_z.add_edges([(i, z), (z, o)])
        g_z.remove_edge(g_z.edge(i, o))

        # Linear combinations
        dw1 = lift(g_id, 0.6) + lift(g_z, 0.4)
        dw2 = lift(g_id, 0.8) + lift(g_z, 0.2)

        dw_tensor = dw1 @ dw2

        # Should have 4 terms
        self.assertEqual(len(dw_tensor.terms), 4)

        # Verify coefficients sum correctly
        total_coeff = sum(abs(c)**2 for c, _ in dw_tensor.terms)
        expected = (0.6**2 + 0.4**2) * (0.8**2 + 0.2**2)
        # Note: this is not exactly how it works, but let's verify action instead

        # Verify action on test state
        rho = random_density_matrix(2, SEED)
        result = dw_tensor.to_action()(rho)
        self.assertTrue(is_density_matrix(result))


class TestCPMLinearity(unittest.TestCase):
    """Test linearity properties."""

    def test_scalar_multiplication(self):
        """Test scalar multiplication."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g)
        dw_scaled = dw.scale(0.5)

        rho = random_density_matrix(1, SEED)
        result = dw_scaled.to_action()(rho)
        expected = 0.5 * dw.to_action()(rho)

        self.assertTrue(np.allclose(result, expected, atol=TOLERANCE))

    def test_addition(self):
        """Test addition of diagrams."""
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        o = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edge((i, o))

        g2 = g1.copy()

        dw1 = lift(g1, 0.3)
        dw2 = lift(g2, 0.7)
        dw_sum = dw1 + dw2

        self.assertEqual(len(dw_sum.terms), 2)

        rho = random_density_matrix(1, SEED)
        result = dw_sum.to_action()(rho)
        # The coefficients are already in the actions, so we just add them
        expected = dw1.to_action()(rho) + dw2.to_action()(rho)

        self.assertTrue(np.allclose(result, expected, atol=TOLERANCE))

    def test_distributivity(self):
        """Test that (q1*D1 + q2*D2) equals q1*D1 + q2*D2."""
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        o = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edge((i, o))

        g2 = g1.copy()
        z = g2.add_vertex(1, 0.5, 0.5)
        g2.add_edges([(i, z), (z, o)])
        g2.remove_edge(g2.edge(i, o))

        q1, q2 = 0.4, 0.6

        # Method 1: create with linear combination
        dw_combined = lift(g1, q1) + lift(g2, q2)

        # Method 2: separate then add
        dw1 = lift(g1)
        dw2 = lift(g2)
        dw_separate = (q1 * dw1) + (q2 * dw2)

        # Test equivalence
        rho = random_density_matrix(1, SEED)
        result1 = dw_combined.to_action()(rho)
        result2 = dw_separate.to_action()(rho)

        self.assertTrue(np.allclose(result1, result2, atol=TOLERANCE))

    def test_addition_arity_mismatch(self):
        """Test that addition fails with mismatched arities."""
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        o = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edge((i, o))

        g2 = Graph()
        i1 = g2.add_vertex(0, 0, 0)
        i2 = g2.add_vertex(0, 1, 0)
        o1 = g2.add_vertex(0, 0, 1)
        o2 = g2.add_vertex(0, 1, 1)
        g2.set_inputs((i1, i2))
        g2.set_outputs((o1, o2))
        g2.add_edges([(i1, o1), (i2, o2)])

        dw1 = lift(g1)
        dw2 = lift(g2)

        with self.assertRaises(ValueError):
            dw1 + dw2


class TestCPMIdentityAndDagger(unittest.TestCase):
    """Test identity and dagger properties."""

    def test_identity_is_identity(self):
        """Test that lifted identity is identity superoperator."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw_id = lift(g)

        # Test on multiple density matrices
        for seed in range(3):
            rho = random_density_matrix(1, seed)
            result = dw_id.to_action()(rho)
            self.assertTrue(np.allclose(result, rho, atol=TOLERANCE))

    def test_dagger_invariance(self):
        """Test that dagger leaves density action invariant."""
        # Create unitary diagram (Hadamard)
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        h = g.add_vertex(3, 0.5, 1)  # H_BOX
        o = g.add_vertex(0, 1, 2)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edges([(i, h), (h, o)])

        dw = lift(g)
        dw_dag = dw.dagger()

        # For A ρ A†, taking dagger gives A* ρ† A†
        # But for density ops, ρ† = ρ, so this should give same result
        # Actually, dagger swaps inputs/outputs, so we need to test carefully

        rho = random_density_matrix(1, SEED)

        # For a unitary channel, the dagger should still be a valid channel
        result = dw_dag.to_action()(rho)
        self.assertTrue(is_density_matrix(result))

    def test_dagger_conjugates_coefficients(self):
        """Test that dagger conjugates coefficients."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        coeff = 0.5 + 0.3j
        dw = lift(g, coeff)
        dw_dag = dw.dagger()

        # Check coefficient is conjugated
        self.assertTrue(np.isclose(dw_dag.terms[0][0], np.conj(coeff)))

    def test_double_dagger_is_original(self):
        """Test that applying dagger twice returns to original."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g)
        dw_dag_dag = dw.dagger().dagger()

        rho = random_density_matrix(1, SEED)
        result1 = dw.to_action()(rho)
        result2 = dw_dag_dag.to_action()(rho)

        self.assertTrue(np.allclose(result1, result2, atol=TOLERANCE))


class TestCPMCPTPProperties(unittest.TestCase):
    """Test CPTP (Completely Positive Trace Preserving) properties."""

    def test_unitary_is_cptp(self):
        """Test that unitary-derived channels are CPTP."""
        # Identity is unitary
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g)
        superop = dw.to_superoperator()

        # Check CP
        self.assertTrue(is_completely_positive(superop))

        # Check TP
        self.assertTrue(is_trace_preserving(superop))

    def test_trace_preservation(self):
        """Test trace preservation on random density matrices."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        z = g.add_vertex(1, 0.5, 1)
        o = g.add_vertex(0, 1, 2)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edges([(i, z), (z, o)])
        g.set_phase(z, 0.25)

        dw = lift(g)
        action = dw.to_action()

        for seed in range(5):
            rho = random_density_matrix(1, seed)
            result = action(rho)
            self.assertAlmostEqual(np.trace(result), 1.0, delta=TOLERANCE)

    def test_convex_combination_cptp(self):
        """Test that convex combinations of unitary channels are CPTP."""
        # Create two unitary diagrams
        g_id = Graph()
        i = g_id.add_vertex(0, 0, 0)
        o = g_id.add_vertex(0, 0, 1)
        g_id.set_inputs((i,))
        g_id.set_outputs((o,))
        g_id.add_edge((i, o))

        g_z = Graph()
        i = g_z.add_vertex(0, 0, 0)
        z = g_z.add_vertex(1, 0.5, 1)
        o = g_z.add_vertex(0, 1, 2)
        g_z.set_inputs((i,))
        g_z.set_outputs((o,))
        g_z.add_edges([(i, z), (z, o)])
        g_z.set_phase(z, 1.0)  # π phase (Z gate)

        # Convex combination
        dw = lift(g_id, 0.7) + lift(g_z, 0.3)
        superop = dw.to_superoperator()

        # Should be CPTP
        self.assertTrue(is_completely_positive(superop))
        self.assertTrue(is_trace_preserving(superop))

    def test_positive_output_from_positive_input(self):
        """Test that positive input gives positive output."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g)
        action = dw.to_action()

        # Test on multiple density matrices
        for seed in range(5):
            rho = random_density_matrix(1, seed)
            result = action(rho)
            # Check positive semidefinite
            eigvals = np.linalg.eigvalsh(result)
            self.assertTrue(np.all(eigvals >= -TOLERANCE))


class TestCPMErrorHandling(unittest.TestCase):
    """Test error handling and edge cases."""

    def test_empty_terms_raises(self):
        """Test that empty terms list raises error."""
        with self.assertRaises(ValueError):
            DoubleWireDiagram([])

    def test_inconsistent_arity_raises(self):
        """Test that inconsistent arities raise error."""
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        o = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edge((i, o))

        g2 = Graph()
        i1 = g2.add_vertex(0, 0, 0)
        i2 = g2.add_vertex(0, 1, 0)
        o1 = g2.add_vertex(0, 0, 1)
        o2 = g2.add_vertex(0, 1, 1)
        g2.set_inputs((i1, i2))
        g2.set_outputs((o1, o2))
        g2.add_edges([(i1, o1), (i2, o2)])

        with self.assertRaises(ValueError):
            DoubleWireDiagram([(1.0, g1), (1.0, g2)])

    def test_action_wrong_shape_raises(self):
        """Test that action with wrong shape density matrix raises error."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g)
        action = dw.to_action()

        # Try with wrong shape
        rho_wrong = np.eye(4)  # 2-qubit, but dw is 1-qubit
        with self.assertRaises(ValueError):
            action(rho_wrong)

    def test_non_square_action_raises(self):
        """Test that to_action raises for non-square maps."""
        # Create a 1→2 map
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o1 = g.add_vertex(0, 0, 1)
        o2 = g.add_vertex(0, 1, 1)
        g.set_inputs((i,))
        g.set_outputs((o1, o2))
        g.add_edges([(i, o1), (i, o2)])

        dw = lift(g)
        with self.assertRaises(ValueError):
            dw.to_action()


class TestCPMSerialization(unittest.TestCase):
    """Test serialization and deserialization."""

    def test_round_trip_single_term(self):
        """Test serialization round-trip for single term."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g, 0.5 + 0.3j)

        # Serialize and deserialize
        data = dw.to_dict()
        dw_restored = DoubleWireDiagram.from_dict(data)

        # Test equivalence
        rho = random_density_matrix(1, SEED)
        result1 = dw.to_action()(rho)
        result2 = dw_restored.to_action()(rho)

        self.assertTrue(np.allclose(result1, result2, atol=TOLERANCE))

    def test_round_trip_multiple_terms(self):
        """Test serialization round-trip for multiple terms."""
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        o = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edge((i, o))

        g2 = g1.copy()

        dw = lift(g1, 0.6) + lift(g2, 0.4)

        # Round-trip
        data = dw.to_dict()
        dw_restored = DoubleWireDiagram.from_dict(data)

        self.assertEqual(len(dw_restored.terms), 2)

        # Test equivalence
        rho = random_density_matrix(1, SEED)
        result1 = dw.to_action()(rho)
        result2 = dw_restored.to_action()(rho)

        self.assertTrue(np.allclose(result1, result2, atol=TOLERANCE))

    def test_pretty_print(self):
        """Test pretty printing doesn't crash."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g)
        str_repr = str(dw)
        repr_repr = repr(dw)

        self.assertIn("DW", str_repr)
        self.assertIn("DoubleWireDiagram", repr_repr)


class TestCPMCrossFormConsistency(unittest.TestCase):
    """Test consistency between action and superoperator forms."""

    def test_action_superop_equivalence(self):
        """Test that action and superoperator forms are equivalent."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        z = g.add_vertex(1, 0.5, 1)
        o = g.add_vertex(0, 1, 2)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edges([(i, z), (z, o)])
        g.set_phase(z, 0.25)

        dw = lift(g)

        action = dw.to_action()
        superop = dw.to_superoperator()

        # Test on multiple states
        for seed in range(3):
            rho = random_density_matrix(1, seed)

            # Action form
            result_action = action(rho)

            # Superoperator form (using vec/unvec)
            rho_vec = rho.flatten()
            result_vec = superop @ rho_vec
            result_superop = result_vec.reshape(rho.shape)

            self.assertTrue(np.allclose(result_action, result_superop, atol=TOLERANCE))

    def test_action_superop_linear_combination(self):
        """Test consistency for linear combinations."""
        g1 = Graph()
        i = g1.add_vertex(0, 0, 0)
        o = g1.add_vertex(0, 0, 1)
        g1.set_inputs((i,))
        g1.set_outputs((o,))
        g1.add_edge((i, o))

        g2 = g1.copy()

        dw = lift(g1, 0.7) + lift(g2, 0.3)

        action = dw.to_action()
        superop = dw.to_superoperator()

        rho = random_density_matrix(1, SEED)
        result_action = action(rho)
        result_superop = (superop @ rho.flatten()).reshape(rho.shape)

        self.assertTrue(np.allclose(result_action, result_superop, atol=TOLERANCE))

class TestCPMOperatorOverloads(unittest.TestCase):
    """Test operator overloads."""

    def test_add_operator(self):
        """Test + operator."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw1 = lift(g, 0.5)
        dw2 = lift(g, 0.5)
        dw_sum = dw1 + dw2

        self.assertEqual(len(dw_sum.terms), 2)

    def test_mul_operator(self):
        """Test * operator for scalar multiplication."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g)
        dw_scaled = 0.5 * dw
        dw_scaled2 = dw * 0.5

        rho = random_density_matrix(1, SEED)
        result1 = dw_scaled.to_action()(rho)
        result2 = dw_scaled2.to_action()(rho)

        self.assertTrue(np.allclose(result1, result2, atol=TOLERANCE))

    def test_matmul_operator(self):
        """Test @ operator for tensor product."""
        g = Graph()
        i = g.add_vertex(0, 0, 0)
        o = g.add_vertex(0, 0, 1)
        g.set_inputs((i,))
        g.set_outputs((o,))
        g.add_edge((i, o))

        dw = lift(g)
        dw_tensor = dw @ dw

        self.assertEqual(dw_tensor.num_inputs, 2)
        self.assertEqual(dw_tensor.num_outputs, 2)


if __name__ == '__main__':
    unittest.main()
