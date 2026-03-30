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
from fractions import Fraction

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

import pyzx as zx
from pyzx.graph import Graph
from pyzx.symbolic import Poly, Term, Var, new_var
from pyzx.graph.scalar import Scalar
from pyzx.utils import VertexType, get_z_box_label, set_z_box_label


class TestGraphSubstitute(unittest.TestCase):
    """Tests for BaseGraph.substitute_variables() method (Issue #359)."""

    def test_substitute_single_variable(self):
        """Test substituting a single variable in a vertex phase."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.Z, 1, 0)
        g.add_edge((v1, v2))

        theta = new_var('theta', is_bool=False, registry=g.var_registry)
        g.set_phase(v1, theta)

        g_subst = g.substitute_variables({'theta': Fraction(1, 4)})

        # Original should be unchanged.
        self.assertIsInstance(g.phase(v1), Poly)

        # Substituted graph should have a numeric phase.
        phase = g_subst.phase(v1)
        self.assertEqual(phase, Fraction(1, 4))

    def test_substitute_multiple_variables(self):
        """Test substituting multiple variables."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)
        v2 = g.add_vertex(VertexType.X, 1, 0)
        g.add_edge((v1, v2))

        theta = new_var('theta', is_bool=False, registry=g.var_registry)
        phi = new_var('phi', is_bool=False, registry=g.var_registry)

        g.set_phase(v1, theta)
        g.set_phase(v2, phi)

        g_subst = g.substitute_variables({'theta': Fraction(1, 2), 'phi': Fraction(3, 4)})

        self.assertEqual(g_subst.phase(v1), Fraction(1, 2))
        self.assertEqual(g_subst.phase(v2), Fraction(3, 4))

    def test_substitute_partial(self):
        """Test partial substitution (only some variables)."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)

        theta = new_var('theta', is_bool=False, registry=g.var_registry)
        phi = new_var('phi', is_bool=False, registry=g.var_registry)

        g.set_phase(v1, theta + phi)

        g_subst = g.substitute_variables({'theta': Fraction(1, 4)})

        # Result should still be a Poly with phi.
        phase = g_subst.phase(v1)
        self.assertIsInstance(phase, Poly)
        free_vars = phase.free_vars()
        self.assertEqual(len(free_vars), 1)
        self.assertEqual(list(free_vars)[0].name, 'phi')

    def test_substitute_in_place(self):
        """Test in_place=True modifies the original graph."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)

        theta = new_var('theta', is_bool=False, registry=g.var_registry)
        g.set_phase(v1, theta)

        result = g.substitute_variables({'theta': Fraction(1, 2)}, in_place=True)

        # Original graph should be modified.
        self.assertIs(result, g)
        self.assertEqual(g.phase(v1), Fraction(1, 2))

    def test_substitute_no_matching_variables(self):
        """Test substituting when no variables match."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)

        theta = new_var('theta', is_bool=False, registry=g.var_registry)
        g.set_phase(v1, theta)

        g_subst = g.substitute_variables({'phi': Fraction(1, 4)})  # phi doesn't exist
        self.assertIsInstance(g_subst.phase(v1), Poly)  # still has theta

    def test_substitute_with_symbolic(self):
        """Test substituting one symbolic variable with another expression."""
        g = Graph()
        v1 = g.add_vertex(VertexType.Z, 0, 0)

        theta = new_var('theta', is_bool=False, registry=g.var_registry)
        g.set_phase(v1, theta)

        phi = new_var('phi', is_bool=False, registry=g.var_registry)
        two_phi = Poly([(2, Term([(list(phi.free_vars())[0], 1)]))])

        g_subst = g.substitute_variables({'theta': two_phi})

        phase = g_subst.phase(v1)
        self.assertEqual(phase, two_phi)


class TestZBoxLabelSubstitute(unittest.TestCase):
    """Tests for substitution into Z-box labels (stored as vdata)."""

    def test_substitute_z_box_label(self):
        """Test that symbolic Z-box labels are substituted."""
        g = Graph()
        v = g.add_vertex(VertexType.Z_BOX, 0, 0)
        alpha = new_var('alpha', is_bool=False, registry=g.var_registry)
        set_z_box_label(g, v, alpha)

        g_subst = g.substitute_variables({'alpha': 2+3j})
        v_subst = list(g_subst.vertices())[0]
        self.assertEqual(get_z_box_label(g_subst, v_subst), 2+3j)

    def test_substitute_z_box_label_symbolic(self):
        """Test substituting one symbolic variable for another in a Z-box label."""
        g = Graph()
        v = g.add_vertex(VertexType.Z_BOX, 0, 0)
        alpha = new_var('alpha', is_bool=False, registry=g.var_registry)
        set_z_box_label(g, v, alpha)

        beta = new_var('beta', is_bool=False, registry=g.var_registry)
        g_subst = g.substitute_variables({'alpha': beta})
        v_subst = list(g_subst.vertices())[0]
        label = get_z_box_label(g_subst, v_subst)
        self.assertIsInstance(label, Poly)
        self.assertEqual(len(label.free_vars()), 1)
        self.assertEqual(list(label.free_vars())[0].name, 'beta')

    def test_substitute_z_box_label_not_poly(self):
        """Test that concrete Z-box labels are left unchanged."""
        g = Graph()
        v = g.add_vertex(VertexType.Z_BOX, 0, 0)
        set_z_box_label(g, v, 2+3j)

        g_subst = g.substitute_variables({'anything': 0.5})
        v_subst = list(g_subst.vertices())[0]
        self.assertEqual(get_z_box_label(g_subst, v_subst), 2+3j)


class TestPolySubstitute(unittest.TestCase):
    """Tests for Poly.substitute() with symbolic values."""

    def test_substitute_poly_for_variable(self):
        """Test substituting a Poly for a variable."""
        x = Var('x')
        y = Var('y')
        # p = x + 1
        p = Poly([(1, Term([(x, 1)])), (1, Term([]))])
        y_poly = Poly([(1, Term([(y, 1)]))])
        result = p.substitute({x: y_poly})
        expected = Poly([(1, Term([(y, 1)])), (1, Term([]))])
        self.assertEqual(result, expected)
        for c, _ in result.terms:
            self.assertNotIsInstance(c, Poly)

    def test_substitute_sum_for_variable(self):
        """Test substituting a multi-term Poly expands correctly."""
        x = Var('x')
        y = Var('y')
        z = Var('z')
        # p = x^2
        p = Poly([(1, Term([(x, 2)]))])
        yz = Poly([(1, Term([(y, 1)])), (1, Term([(z, 1)]))])
        result = p.substitute({x: yz})
        # (y+z)^2 = y^2 + 2yz + z^2
        expected = Poly([
            (1, Term([(y, 2)])),
            (2, Term([(y, 1), (z, 1)])),
            (1, Term([(z, 2)])),
        ])
        self.assertEqual(result, expected)

    def test_substitute_preserves_unmatched_variables(self):
        """Test that variables not in var_map are left alone."""
        x = Var('x')
        y = Var('y')
        z = Var('z')
        # p = x * y
        p = Poly([(1, Term([(x, 1), (y, 1)]))])
        z_poly = Poly([(1, Term([(z, 1)]))])
        result = p.substitute({x: z_poly})
        # Should get z * y.
        expected = Poly([(1, Term([(y, 1), (z, 1)]))])
        self.assertEqual(result, expected)


class TestScalarSubstitute(unittest.TestCase):
    """Tests for Scalar.substitute_variables() method."""

    def test_scalar_substitute_phase(self):
        """Test substituting in scalar.phase."""
        var = Var('alpha')
        phase = Poly([(1, Term([(var, 1)]))])

        s = Scalar()
        s.phase = phase

        var_map = {var: Fraction(1, 4)}
        s_subst = s.substitute_variables(var_map)

        self.assertEqual(s_subst.phase, Fraction(1, 4))

    def test_scalar_substitute_phasenodes(self):
        """Test substituting in scalar.phasenodes."""
        var = Var('beta')
        phase = Poly([(1, Term([(var, 1)]))])

        s = Scalar()
        s.phasenodes = [phase, Fraction(1, 2)]

        var_map = {var: Fraction(3, 4)}
        s_subst = s.substitute_variables(var_map)

        self.assertEqual(len(s_subst.phasenodes), 2)
        self.assertEqual(s_subst.phasenodes[0], Fraction(3, 4))
        self.assertEqual(s_subst.phasenodes[1], Fraction(1, 2))

    def test_scalar_substitute_sum_of_phases(self):
        """Test substituting in scalar.sum_of_phases keys."""
        var = Var('gamma')
        phase_key = Poly([(1, Term([(var, 1)]))])

        s = Scalar()
        s.sum_of_phases = {phase_key: 3}

        var_map = {var: Fraction(1, 2)}
        s_subst = s.substitute_variables(var_map)

        self.assertEqual(len(s_subst.sum_of_phases), 1)
        self.assertIn(Fraction(1, 2), s_subst.sum_of_phases)
        self.assertEqual(s_subst.sum_of_phases[Fraction(1, 2)], 3)

    def test_scalar_substitute_preserves_other_fields(self):
        """Test that substitution preserves non-phase fields."""
        var = Var('delta')
        phase = Poly([(1, Term([(var, 1)]))])

        s = Scalar()
        s.phase = phase
        s.power2 = 5
        s.floatfactor = 2.0 + 1.0j

        var_map = {var: Fraction(0)}
        s_subst = s.substitute_variables(var_map)

        self.assertEqual(s_subst.power2, 5)
        self.assertEqual(s_subst.floatfactor, 2.0 + 1.0j)


class TestSubstituteFromCircuit(unittest.TestCase):
    """Tests for substituting variables in graphs created from circuits."""

    def test_substitute_circuit_zphase(self):
        """Test substituting in a circuit with parameterized ZPhase gate."""
        from pyzx.circuit import Circuit
        from pyzx.circuit.gates import ZPhase

        c = Circuit(1)
        theta = new_var('theta', is_bool=False)
        c.add_gate(ZPhase(0, theta))

        g = c.to_graph()
        g_subst = g.substitute_variables({'theta': Fraction(1, 4)})

        found_phase = False
        for v in g_subst.vertices():
            if g_subst.type(v) == VertexType.Z:
                phase = g_subst.phase(v)
                if phase == Fraction(1, 4):
                    found_phase = True
                    break
        self.assertTrue(found_phase, "Expected to find a Z spider with phase 1/4")


if __name__ == '__main__':
    unittest.main()
