"""Hands-on demo of the 1+1D time-dependency feature (branch: time-dependency).

Run from the repo root (or anywhere -- it puts the repo on sys.path):

    python scratchpads/time_dependency_demo.py

It prints the greedy ASAP schedule, the per-spider (timestep, delay) tags, the
space-time cost metrics, and three uses of ``time_slice`` -- including one that
shows a time cut returns *everything* in the window (not a hand-picked logical
block) and one where the window really is a sub-circuit and the slice
reproduces it (checked with ``compare_tensors``).  It also checks that a timed
graph behaves exactly like an untimed one under simplification and extraction.

PNGs are written next to this file:

    td_demo_plain.png          - the circuit graph, no time info
    td_demo_show_time.png      - same graph, show_time=True (squiggly wires, t/Δ labels)
    td_demo_slice_window.png   - the [start, stop] slice of the ParityPhase span
    td_demo_gadget_reduced.png - an isolated phase gadget, sliced and full_reduced
"""

import os
import sys
from fractions import Fraction

# Allow running this file directly from anywhere without `pip install -e .`.
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
DURATIONS = {"HAD": 0, "CNOT": 4, "ZPhase": 1}


def save(fig, name):
    path = os.path.join(HERE, name)
    fig.savefig(path, dpi=140, bbox_inches="tight")
    print("  wrote", name)


def rule(title):
    print("\n" + "=" * 72 + "\n" + title + "\n" + "=" * 72)


def n_spiders(graph):
    return sum(1 for v in graph.vertices() if graph.type(v) != VertexType.BOUNDARY)


# ---------------------------------------------------------------------------
# The circuit: a prep layer of Hadamards, a 3-qubit ParityPhase, a short final
# layer.  ParityPhase expands to a CNOT ladder + Rz + reverse ladder.
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
# 2. Greedy ASAP schedule.
# ---------------------------------------------------------------------------
rule(f"2. schedule_gates   gate_durations = {DURATIONS}")
sched = schedule_gates(basic.gates, DURATIONS)
for i, (g, (t, d)) in enumerate(zip(basic.gates, sched)):
    print(f"  [{i:2d}] {str(g):<22} timestep={t:<3} delay={d}")
print("  note: HAD(2) at t=14 runs concurrently with the last CNOT(0,1),")
print("        and HAD(0) at t=18 lands exactly at the end of the CNOT ladder.")

# ---------------------------------------------------------------------------
# 3. Annotation is opt-in and semantics-preserving.
# ---------------------------------------------------------------------------
g_plain = c.to_graph()
g = c.to_graph(gate_durations=DURATIONS)

rule("3. annotation")
print("  has_time_data(no gate_durations) :", has_time_data(g_plain))
print("  has_time_data(gate_durations)    :", has_time_data(g))
print("  same tensor (semantics unchanged):",
      zx.compare_tensors(g_plain, g, preserve_scalar=False))

rule("4. per-spider (timestep, delay)")
print(f"  {'vertex':>6}  {'type':<9} {'qubit':>5} {'row':>5} {'timestep':>9} {'delay':>6}")
for v in sorted(g.vertices()):
    print(f"  {v:>6}  {VertexType(g.type(v)).name:<9} {g.qubit(v):>5} {str(g.row(v)):>5} "
          f"{str(get_timestep(g, v)):>9} {get_delay(g, v):>6}")

rule("5. space-time cost metrics")
print("  time_extent      :", time_extent(g))
for k, val in spacetime_metrics(g).items():
    print(f"  {k:<17}: {val}")

# ---------------------------------------------------------------------------
# 6a. time_slice returns EVERYTHING scheduled in the window.
#     The ParityPhase's own gates span ticks [1, 18].  Slicing that window also
#     picks up HAD(2) (t=14) and HAD(0) (t=18), which are scheduled inside it,
#     so the slice is the gadget *followed by* H on qubits 0 and 2 -- not a
#     bare phase gadget.  We check this with compare_tensors.
# ---------------------------------------------------------------------------
para = [(t, d) for (t, d), gt in zip(sched, basic.gates)
        if gt.name in ("CNOT", "ZPhase")]
start = min(t for t, _ in para)
stop = max(t + d for t, d in para)

rule(f"6a. time_slice(g, {start}, {stop})  -- the CNOT-ladder / Rz time span")
sl = time_slice(g, start, stop)
print(f"  kept {n_spiders(sl)} non-boundary spiders; "
      f"inputs {sl.inputs()} outputs {sl.outputs()}")

sl_red = sl.copy()
zx.full_reduce(sl_red)

gadget = Circuit(3)
gadget.add_gate(ParityPhase(Fraction(1, 4), 0, 1, 2))
gadget_then_h = gadget.copy()
gadget_then_h.add_gate(HAD(0)); gadget_then_h.add_gate(HAD(2))

print("  slice == bare ParityPhase(1/4,0,1,2)        :",
      zx.compare_tensors(sl_red, gadget.to_graph(), preserve_scalar=False))
print("  slice == ParityPhase(1/4,0,1,2) then H0, H2 :",
      zx.compare_tensors(sl_red, gadget_then_h.to_graph(), preserve_scalar=False))
print("  -> a time cut returns whatever is IN the window: the CNOT ladder / Rz")
print("     PLUS the two Hadamards scheduled concurrently at t=14 and t=18, so")
print("     it is 'gadget then H0, H2', not a bare phase gadget.")

# ---------------------------------------------------------------------------
# 6b. A single tick inside the ladder.
# ---------------------------------------------------------------------------
rule(f"6b. time_slice(g, {start + 1})  -- one tick")
sl1 = time_slice(g, start + 1)
print("  non-boundary spiders:",
      [v for v in sl1.vertices() if sl1.type(v) != VertexType.BOUNDARY],
      f"(the first CNOT's two spiders, interval [1, 5] covers tick {start + 1})")

# ---------------------------------------------------------------------------
# 6c. When the window IS exactly a sub-circuit, the slice reproduces it.
#     A circuit that is ONLY the phase gadget: slice its whole time extent,
#     full_reduce, and confirm the linear map with compare_tensors.
# ---------------------------------------------------------------------------
rule("6c. an isolated phase gadget -- slice reproduces the sub-circuit")
only = Circuit(3)
only.add_gate(ParityPhase(Fraction(1, 4), 0, 1, 2))
g_only = only.to_graph(gate_durations=DURATIONS)
lo, hi = time_extent(g_only)
sl_only = time_slice(g_only, lo, hi)
sl_only_red = sl_only.copy()
zx.full_reduce(sl_only_red)
nz = [sl_only_red.phase(v) for v in sl_only_red.vertices() if sl_only_red.phase(v) != 0]
print(f"  time_extent {(lo, hi)}; slice full_reduces to {n_spiders(sl_only_red)} "
      f"spiders, non-zero phases {nz}")
print("  slice == ParityPhase(1/4,0,1,2) (tensor)    :",
      zx.compare_tensors(sl_only_red, only.to_graph(), preserve_scalar=False))
print("  (note: the reduced form still has 5 internal spiders and a degree-2")
print("   phase spider -- 'is it a gadget' is a tensor check, not a shape check.)")

# ---------------------------------------------------------------------------
# 7. A timed graph is an ordinary graph: rules / extraction / tensors agree.
# ---------------------------------------------------------------------------
rule("7. compatibility with the rest of PyZX")
a = c.to_graph(gate_durations=DURATIONS)
b = c.to_graph()
zx.clifford_simp(a, quiet=True)
zx.clifford_simp(b, quiet=True)
print("  clifford_simp(timed) vs clifford_simp(untimed):")
print("    same vertex count :", a.num_vertices() == b.num_vertices())
print("    same tensor       :", zx.compare_tensors(a, b, preserve_scalar=False))
circ_out = zx.extract_circuit(a.copy())
print("  extract_circuit(timed) == original circuit  :",
      zx.compare_tensors(circ_out, c, preserve_scalar=False))
still = sum(1 for v in a.vertices() if get_timestep(a, v) is not None)
print(f"  spiders still carrying a timestep after simplification: {still}/{a.num_vertices()}")

# ---------------------------------------------------------------------------
# 8. Drawings.
# ---------------------------------------------------------------------------
rule("8. drawings")
save(draw_matplotlib(g, labels=True, figsize=(9, 3)), "td_demo_plain.png")
save(draw_matplotlib(g, labels=True, show_time=True, figsize=(9, 3)), "td_demo_show_time.png")
save(draw_matplotlib(sl, labels=True, show_time=True, figsize=(7, 3)), "td_demo_slice_window.png")
save(draw_matplotlib(sl_only_red, labels=True, figsize=(5, 3)), "td_demo_gadget_reduced.png")
