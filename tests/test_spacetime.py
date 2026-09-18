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
import os
from fractions import Fraction
from types import ModuleType
from typing import Optional

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.circuit import Circuit
from pyzx.circuit.gates import CNOT, HAD, ZPhase, XPhase, ParityPhase, CCZ
from pyzx.spacetime import used_qubits, gate_duration, schedule_gates
from pyzx.spacetime import (
    get_timestep, get_delay, set_delay, has_time_data, time_extent,
    spacetime_metrics, time_slice,
)
from pyzx.utils import VertexType

np: Optional[ModuleType]
try:
    import numpy as np
except ImportError:
    np = None


def _example_circuit() -> Circuit:
    # depth-3 layering: {H0,H1} | CNOT(0,1) | Rz(1/4) on q0
    c = Circuit(2)
    c.add_gate(HAD(0))
    c.add_gate(HAD(1))
    c.add_gate(CNOT(0, 1))
    c.add_gate(ZPhase(0, Fraction(1, 4)))
    return c


class TestUsedQubits(unittest.TestCase):
    def test_one_and_two_qubit(self):
        self.assertEqual(used_qubits(HAD(3)), [3])
        self.assertEqual(used_qubits(CNOT(2, 5)), [2, 5])
        self.assertEqual(used_qubits(CNOT(5, 2)), [2, 5])

    def test_multi_qubit(self):
        self.assertEqual(used_qubits(ParityPhase(Fraction(1, 4), 0, 1, 3)), [0, 1, 3])
        self.assertEqual(used_qubits(CCZ(0, 1, 2)), [0, 1, 2])


class TestGateDuration(unittest.TestCase):
    def test_lookup_by_name_and_class(self):
        self.assertEqual(gate_duration(CNOT(0, 1), None), 0)
        self.assertEqual(gate_duration(CNOT(0, 1), {}), 0)
        self.assertEqual(gate_duration(CNOT(0, 1), {'CNOT': 4}), 4)
        self.assertEqual(gate_duration(CNOT(0, 1), {CNOT: 7}), 7)

    def test_negative_rejected(self):
        with self.assertRaises(ValueError):
            gate_duration(CNOT(0, 1), {'CNOT': -1})


class TestScheduleGates(unittest.TestCase):
    def test_pure_layering(self):
        c = _example_circuit()
        self.assertEqual(schedule_gates(c.gates), [(0, 0), (0, 0), (1, 0), (2, 0)])

    def test_durations_push_the_clock(self):
        c = _example_circuit()
        sched = schedule_gates(c.gates, {'CNOT': 3})
        # CNOT starts at 1 with delay 3; the next gate on q0 starts at 1+3 = 4.
        self.assertEqual(sched, [(0, 0), (0, 0), (1, 3), (4, 0)])

    def test_independent_gates_share_a_tick(self):
        c = Circuit(3)
        c.add_gate(XPhase(0, Fraction(1, 2)))
        c.add_gate(XPhase(1, Fraction(1, 2)))
        c.add_gate(XPhase(2, Fraction(1, 2)))
        self.assertEqual(schedule_gates(c.gates), [(0, 0), (0, 0), (0, 0)])


class TestParserAnnotation(unittest.TestCase):
    def test_opt_in_only(self):
        c = _example_circuit()
        g_plain = c.to_graph()
        self.assertFalse(has_time_data(g_plain))
        for v in g_plain.vertices():
            self.assertIsNone(get_timestep(g_plain, v))

    def test_annotation_present_with_durations(self):
        c = _example_circuit()
        g = c.to_graph(gate_durations={'CNOT': 3})
        self.assertTrue(has_time_data(g))
        # every non-boundary spider is timed
        for v in g.vertices():
            if g.type(v) != VertexType.BOUNDARY:
                self.assertIsNotNone(get_timestep(g, v))

    @unittest.skipUnless(np is not None, "numpy required")
    def test_annotation_does_not_change_semantics(self):
        c = _example_circuit()
        t_plain = c.to_graph().to_tensor()
        t_timed = c.to_graph(gate_durations={'CNOT': 3, 'HAD': 2}).to_tensor()
        self.assertTrue(np.allclose(t_plain, t_timed))

    def test_input_boundaries_at_zero(self):
        c = _example_circuit()
        g = c.to_graph(gate_durations={})
        for v in g.inputs():
            self.assertEqual(get_timestep(g, v), 0)


class TestMetrics(unittest.TestCase):
    def test_example_metrics(self):
        c = _example_circuit()
        g = c.to_graph(gate_durations={'CNOT': 3})
        m = spacetime_metrics(g)
        self.assertEqual(m['num_timesteps'], 3)      # start ticks {0, 1, 4}
        self.assertEqual(m['time_depth'], 5)         # ticks 0..4 inclusive
        self.assertEqual(m['total_delay'], 6)        # two CNOT spiders, delay 3 each
        self.assertEqual(m['spacetime_volume'], 9)   # 2+2+2+2+1

    def test_extent(self):
        c = _example_circuit()
        g = c.to_graph(gate_durations={'CNOT': 3})
        self.assertEqual(time_extent(g), (0, 4))

    def test_delayed_last_gate_depth_matches_volume(self):
        # A lone CNOT with delay 3 occupies ticks 0, 1, 2 on both qubits: the
        # wall-clock depth is 3 and so is the per-qubit volume.
        c = Circuit(2)
        c.add_gate(CNOT(0, 1))
        g = c.to_graph(gate_durations={'CNOT': 3})
        self.assertEqual(time_extent(g), (0, 2))
        m = spacetime_metrics(g)
        self.assertEqual(m['time_depth'], 3)
        self.assertEqual(m['spacetime_volume'], 6)

    def test_zeros_without_time_data(self):
        c = _example_circuit()
        g = c.to_graph()
        self.assertEqual(spacetime_metrics(g), {
            'num_timesteps': 0, 'time_depth': 0,
            'spacetime_volume': 0, 'total_delay': 0,
        })
        self.assertIsNone(time_extent(g))


class TestTimeSlice(unittest.TestCase):
    def test_single_timestep_slice_is_valid(self):
        c = _example_circuit()
        g = c.to_graph(gate_durations={'CNOT': 3})
        sl = time_slice(g, 1)
        # only the two CNOT spiders occupy tick 1
        non_boundary = [v for v in sl.vertices() if sl.type(v) != VertexType.BOUNDARY]
        self.assertEqual(len(non_boundary), 2)
        for v in non_boundary:
            t = get_timestep(sl, v)
            self.assertLessEqual(t, 1)
            self.assertGreaterEqual(t + get_delay(sl, v), 1)
        # dangling edges were closed off with boundaries
        self.assertTrue(len(sl.inputs()) > 0)
        self.assertTrue(len(sl.outputs()) > 0)

    def test_range_slice_contains_endpoints(self):
        c = _example_circuit()
        g = c.to_graph(gate_durations={'CNOT': 3})
        sl = time_slice(g, 0, 4)
        kept_ts = {get_timestep(sl, v) for v in sl.vertices()
                   if sl.type(v) != VertexType.BOUNDARY}
        self.assertIn(0, kept_ts)
        self.assertIn(4, kept_ts)

    def test_slice_excludes_gate_that_just_finished(self):
        # CNOT occupies ticks [1, 4); the Rz on q0 starts at 4.  A single-tick
        # slice at 4 must contain the Rz only, not the CNOT that ended there.
        c = _example_circuit()
        g = c.to_graph(gate_durations={'CNOT': 3})
        sl = time_slice(g, 4)
        non_boundary = [v for v in sl.vertices() if sl.type(v) != VertexType.BOUNDARY]
        self.assertEqual(len(non_boundary), 1)
        self.assertEqual(sl.phase(non_boundary[0]), Fraction(1, 4))

    def test_bad_range(self):
        c = _example_circuit()
        g = c.to_graph(gate_durations={})
        with self.assertRaises(ValueError):
            time_slice(g, 3, 1)

    def test_boundaries_ordered_by_qubit(self):
        # A window in the middle of the circuit cuts every qubit line; the
        # fresh boundaries must come out in qubit order, not edge-iteration
        # order, so the slice has a predictable input/output layout.
        c = Circuit(3)
        c.add_gate(HAD(0)); c.add_gate(HAD(1)); c.add_gate(HAD(2))
        c.add_gate(ParityPhase(Fraction(1, 4), 0, 1, 2))
        c.add_gate(HAD(0)); c.add_gate(HAD(1)); c.add_gate(HAD(2))
        g = c.to_graph(gate_durations={'CNOT': 4, 'ZPhase': 1})
        lo, hi = time_extent(g)
        sl = time_slice(g, lo + 1, hi - 1)
        in_qubits = [sl.qubit(v) for v in sl.inputs()]
        out_qubits = [sl.qubit(v) for v in sl.outputs()]
        self.assertEqual(in_qubits, sorted(in_qubits))
        self.assertEqual(out_qubits, sorted(out_qubits))

    @unittest.skipUnless(np is not None, "numpy required")
    def test_isolated_gadget_slice_reproduces_subcircuit(self):
        # When the window is exactly a sub-circuit, the slice + full_reduce is
        # tensor-equal to that sub-circuit (with boundaries in qubit order).
        import pyzx as zx
        only = Circuit(3)
        only.add_gate(ParityPhase(Fraction(1, 4), 0, 1, 2))
        g = only.to_graph(gate_durations={'CNOT': 4, 'ZPhase': 1})
        lo, hi = time_extent(g)
        sl = time_slice(g, lo, hi)
        zx.full_reduce(sl)
        self.assertTrue(zx.compare_tensors(sl, only.to_graph(), preserve_scalar=False))

    @unittest.skipUnless(np is not None, "numpy required")
    def test_full_range_slice_matches_original_tensor(self):
        c = _example_circuit()
        g = c.to_graph(gate_durations={'CNOT': 3})
        lo, hi = time_extent(g)
        sl = time_slice(g, lo - 1, hi + 1)
        # A slice that keeps every vertex reproduces the diagram (the global
        # scalar is deliberately not carried, so compare without it).
        self.assertEqual(sl.num_vertices(), g.num_vertices())
        self.assertEqual(sl.num_edges(), g.num_edges())
        t_g = g.to_tensor(preserve_scalar=False)
        t_sl = sl.to_tensor(preserve_scalar=False)
        self.assertTrue(np.allclose(t_g, t_sl))


class TestDrawSmoke(unittest.TestCase):
    def test_draw_matplotlib_show_time(self):
        try:
            import matplotlib
        except ImportError:
            self.skipTest("matplotlib required")
        matplotlib.use('Agg')
        from pyzx.drawing import draw_matplotlib
        c = _example_circuit()
        g = c.to_graph(gate_durations={'CNOT': 3})
        fig = draw_matplotlib(g, show_time=True)
        self.assertIsNotNone(fig)


if __name__ == '__main__':
    unittest.main()
