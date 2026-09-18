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

"""Greedy as-soon-as-possible (ASAP) scheduling of circuit gates in discrete time.

This assigns every gate of a :class:`~pyzx.circuit.Circuit` an integer
*timestep* (the tick it starts on) and an integer *delay* (its duration, with
``0`` meaning instantaneous).  :func:`~pyzx.circuit.graphparser.circuit_to_graph`
uses this, when given a ``gate_durations`` argument, to annotate the spiders of
the resulting ZX-diagram with 1+1D space-time information.

See :mod:`pyzx.spacetime.timing` for reading that information back off a graph, for
the space-time cost metrics, and for extracting a time-slice sub-diagram.
"""

from __future__ import annotations

from typing import Mapping, Sequence

from ..circuit.gates import Gate

__all__ = ['used_qubits', 'gate_duration', 'schedule_gates']

# Attributes on Gate subclasses that name a *qubit* (not a classical bit) the
# gate acts on.  Multi-qubit parity gates additionally expose a ``targets`` list,
# handled separately.  ``result_bit`` / ``condition_register`` are classical and
# deliberately excluded.
_QUBIT_ATTRS = ('target', 'control', 'ctrl1', 'ctrl2')


def used_qubits(gate: Gate) -> list[int]:
    """Return the sorted list of qubit indices ``gate`` acts on.

    Covers every gate in :mod:`pyzx.circuit.gates`: single- and two-qubit gates
    expose ``target`` / ``control`` / ``ctrl1`` / ``ctrl2``; multi-qubit parity
    gates expose a ``targets`` list.
    """
    qubits: set[int] = set()
    targets = getattr(gate, 'targets', None)
    if targets is not None:
        qubits.update(int(q) for q in targets)
    for attr in _QUBIT_ATTRS:
        val = getattr(gate, attr, None)
        if isinstance(val, int) and not isinstance(val, bool):
            qubits.add(val)
    return sorted(qubits)


def gate_duration(gate: Gate,
                  gate_durations: Mapping[object, int] | None) -> int:
    """Look up the integer duration of ``gate`` in ``gate_durations``.

    ``gate_durations`` may be keyed by gate class (e.g. ``pyzx.circuit.gates.CNOT``)
    or by gate name (e.g. ``"CNOT"``); the class key wins when both are present.
    A gate that appears in neither has duration ``0`` (instantaneous).  Negative
    durations are rejected.
    """
    if gate_durations is None:
        return 0
    dur = gate_durations.get(type(gate))
    if dur is None:
        dur = gate_durations.get(gate.name, 0)
    dur = int(dur)
    if dur < 0:
        raise ValueError(
            "gate_durations values must be non-negative, got {} for gate {}".format(
                dur, gate.name))
    return dur


def schedule_gates(gates: Sequence[Gate],
                   gate_durations: Mapping[object, int] | None = None,
                   ) -> list[tuple[int, int]]:
    """Greedily schedule ``gates`` as soon as possible in discrete integer time.

    Returns a list parallel to ``gates`` of ``(timestep, delay)`` pairs, where
    ``timestep`` is the tick the gate starts on and ``delay`` is its duration
    (``0`` for an instantaneous gate).

    Each qubit carries an integer clock, initially ``0``.  A gate starts at the
    maximum clock over the qubits it touches; afterwards those clocks advance by
    ``max(duration, 1)``.  The ``max(..., 1)`` guarantees that two causally
    ordered gates always land on distinct, increasing timesteps even when every
    duration is ``0``, so the schedule is a well-defined dependency layering in
    that case.

    ``gate_durations`` maps a gate class or gate name to a non-negative integer
    duration; unlisted gates are instantaneous.  ``gate_durations=None`` is
    treated the same as ``{}`` here (pure layering); the distinction only matters
    to :func:`~pyzx.circuit.graphparser.circuit_to_graph`, which skips annotation
    entirely for ``None``.
    """
    clocks: dict[int, int] = {}
    schedule: list[tuple[int, int]] = []
    for gate in gates:
        qubits = used_qubits(gate)
        dur = gate_duration(gate, gate_durations)
        start = max((clocks.get(q, 0) for q in qubits), default=0)
        schedule.append((start, dur))
        advance = start + max(dur, 1)
        for q in qubits:
            clocks[q] = advance
    return schedule
