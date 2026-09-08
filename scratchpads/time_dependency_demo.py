"""Hands-on demo of the 1+1D time-dependency feature (branch: time-dependency).

Run from the repo root:

    python scratchpads/time_dependency_demo.py

It prints the schedule, the per-spider (timestep, delay) tags, the space-time
cost metrics, and two time-slices; and it writes four PNGs next to this file:

    td_demo_plain.png        - the circuit graph, no time info
    td_demo_show_time.png    - same graph, show_time=True (squiggly wires)
    td_demo_slice_window.png - the time-slice covering the ParityPhase window
    td_demo_slice_reduced.png- that slice after full_reduce: a phase gadget
"""

import os
import sys
from fractions import Fraction

# Allow running this file directly (python scratchpads/time_dependency_demo.py)
# from anywhere, even without `pip install -e .`, by putting the repo root first
# on the import path.
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

import matplotlib
matplotlib.use("Agg")

import pyzx as zx
from pyzx.circuit import Circuit
from pyzx.circuit.gates import CNOT, HAD, ZPhase, ParityPhase
from pyzx.circuit.scheduling import schedule_gates, used_qubits
from pyzx.drawing import draw_matplotlib
from pyzx.graph.time import (
    get_timestep, get_delay, has_time_data, time_extent, spacetime_metrics,
    time_slice,
)
from pyzx.utils import VertexType

HERE = os.path.dirname(os.path.abspath(__file__))


def save(fig, name):
    path = os.path.join(HERE, name)
    fig.savefig(path, dpi=140, bbox_inches="tight")
    print("  wrote", path)


def rule(title):
    print("\n" + "=" * 70 + "\n" + title + "\n" + "=" * 70)


# ---------------------------------------------------------------------------
# 1. Build a circuit: a prep layer, a 3-qubit ParityPhase, a final layer.
#    ParityPhase expands to a CNOT ladder + Rz + reverse ladder, so a
#    contiguous slice of time will be exactly a phase-gadget subcircuit.
# ---------------------------------------------------------------------------
c = Circuit(3)
c.add_gate(HAD(0)); c.add_gate(HAD(1)); c.add_gate(HAD(2))
c.add_gate(ParityPhase(Fraction(1, 4), 0, 1, 2))
c.add_gate(HAD(0)); c.add_gate(HAD(2))

basic = c.to_basic_gates()

rule("1. gates and the qubits they touch")
for i, g in enumerate(basic.gates):
    print(f"  [{i:2d}] {str(g):<22} qubits={used_qubits(g)}")

# ---------------------------------------------------------------------------
# 2. Greedy ASAP schedule. HAD instantaneous, CNOT takes 4 ticks, Rz takes 1.
# ---------------------------------------------------------------------------
gate_durations = {"HAD": 0, "CNOT": 4, "ZPhase": 1}

rule("2. schedule_gates  (gate_durations = %s)" % gate_durations)
sched = schedule_gates(basic.gates, gate_durations)
for i, (g, (t, d)) in enumerate(zip(basic.gates, sched)):
    print(f"  [{i:2d}] {str(g):<22} timestep={t:<3} delay={d}")

# ---------------------------------------------------------------------------
# 3. circuit_to_graph WITH and WITHOUT gate_durations.
# ---------------------------------------------------------------------------
g_plain = c.to_graph()
g = c.to_graph(gate_durations=gate_durations)

rule("3. graph annotation")
print("  has_time_data(no gate_durations) :", has_time_data(g_plain))
print("  has_time_data(gate_durations)    :", has_time_data(g))
try:
    import numpy as np
    print("  tensors equal (semantics unchanged):",
          np.allclose(g_plain.to_tensor(), g.to_tensor()))
except ImportError:
    print("  (numpy not installed - skipping tensor check)")

rule("4. per-spider (timestep, delay)")
print(f"  {'vertex':>6}  {'type':<9} {'qubit':>5} {'row':>5} {'timestep':>9} {'delay':>6}")
for v in sorted(g.vertices()):
    ty = VertexType(g.type(v)).name
    print(f"  {v:>6}  {ty:<9} {g.qubit(v):>5} {str(g.row(v)):>5} "
          f"{str(get_timestep(g, v)):>9} {get_delay(g, v):>6}")

# ---------------------------------------------------------------------------
# 5. Space-time cost metrics.
# ---------------------------------------------------------------------------
rule("5. cost metrics")
print("  time_extent      :", time_extent(g))
for k, val in spacetime_metrics(g).items():
    print(f"  {k:<17}: {val}")

# ---------------------------------------------------------------------------
# 6. time_slice: single tick, and the whole ParityPhase window.
# ---------------------------------------------------------------------------
lo, hi = time_extent(g)
# the ParityPhase spiders are everything strictly between the two HAD layers
para_start = min(t for (t, d), gt in zip(sched, basic.gates)
                 if gt.name in ("CNOT", "ZPhase"))
para_stop = max(t + d for (t, d), gt in zip(sched, basic.gates)
                if gt.name in ("CNOT", "ZPhase"))

rule(f"6a. time_slice(g, {para_start}, {para_stop})  -- the phase-gadget window")
sl = time_slice(g, para_start, para_stop)
print("  vertices kept   :", sl.num_vertices(), " edges:", sl.num_edges())
print("  inputs          :", sl.inputs())
print("  outputs         :", sl.outputs())
for v in sorted(sl.vertices()):
    if sl.type(v) == VertexType.BOUNDARY:
        continue
    print(f"    v{v}: ts={get_timestep(sl, v)} delay={get_delay(sl, v)} "
          f"phase={sl.phase(v)}")

rule("6b. time_slice(g, %d)  -- a single mid-gadget tick" % (para_start + 1))
sl1 = time_slice(g, para_start + 1)
print("  non-boundary spiders in the slice:",
      [v for v in sl1.vertices() if sl1.type(v) != VertexType.BOUNDARY])

# ---------------------------------------------------------------------------
# 7. Drawings.
# ---------------------------------------------------------------------------
rule("7. drawings")
save(draw_matplotlib(g, labels=True, figsize=(9, 3)), "td_demo_plain.png")
save(draw_matplotlib(g, labels=True, show_time=True, figsize=(9, 3)),
     "td_demo_show_time.png")
save(draw_matplotlib(sl, labels=True, show_time=True, figsize=(7, 3)),
     "td_demo_slice_window.png")

sl_reduced = sl.copy()
zx.full_reduce(sl_reduced)
save(draw_matplotlib(sl_reduced, labels=True, figsize=(6, 3)),
     "td_demo_slice_reduced.png")
print("\n  The window slice full_reduces to a single 3-legged phase gadget with")
print("  phase", [sl_reduced.phase(v) for v in sl_reduced.vertices()
                  if sl_reduced.phase(v) != 0], "-> the ParityPhase(1/4) it came from.")
