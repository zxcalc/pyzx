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

"""1+1D space-time information attached to the spiders of a ZX-diagram.

A graph produced by :func:`~pyzx.circuit.graphparser.circuit_to_graph` with a
``gate_durations`` argument carries, per vertex, two pieces of vertex data
(:meth:`~pyzx.graph.base.BaseGraph.vdata`):

``timestep``
    integer tick at which the operation that created the spider starts.

``delay``
    integer duration of that operation, ``0`` for an instantaneous gate.  The
    next operation on the same qubit starts at least ``max(delay, 1)`` ticks
    later.

This module has the helpers to read and write those, the space-time cost
metrics of a circuit-as-diagram, and :func:`time_slice` to cut out the
sub-diagram living in a window of timesteps.
"""

from __future__ import annotations

from typing import Optional

from .base import BaseGraph, VT, ET
from ..utils import VertexType

__all__ = [
    'TIMESTEP_KEY', 'DELAY_KEY',
    'get_timestep', 'set_timestep', 'get_delay', 'set_delay',
    'has_time_data', 'time_extent', 'spacetime_metrics', 'time_slice',
]

TIMESTEP_KEY = 'timestep'
DELAY_KEY = 'delay'


def get_timestep(g: BaseGraph[VT, ET], v: VT,
                 default: Optional[int] = None) -> Optional[int]:
    """Return the ``timestep`` vertex data of ``v``, or ``default`` if unset."""
    return g.vdata(v, TIMESTEP_KEY, default)


def set_timestep(g: BaseGraph[VT, ET], v: VT, t: int) -> None:
    """Set the ``timestep`` vertex data of ``v``."""
    g.set_vdata(v, TIMESTEP_KEY, int(t))


def get_delay(g: BaseGraph[VT, ET], v: VT, default: int = 0) -> int:
    """Return the ``delay`` (duration) vertex data of ``v``, ``default`` if unset."""
    return g.vdata(v, DELAY_KEY, default)


def set_delay(g: BaseGraph[VT, ET], v: VT, d: int) -> None:
    """Set the ``delay`` (duration) vertex data of ``v``."""
    if int(d) < 0:
        raise ValueError("delay must be non-negative, got {}".format(d))
    g.set_vdata(v, DELAY_KEY, int(d))


def has_time_data(g: BaseGraph[VT, ET]) -> bool:
    """Return whether any vertex of ``g`` carries a ``timestep``."""
    return any(get_timestep(g, v) is not None for v in g.vertices())


def time_extent(g: BaseGraph[VT, ET]) -> Optional[tuple[int, int]]:
    """Return ``(first_tick, last_tick)`` spanned by the timed spiders of ``g``.

    Boundary vertices are ignored, so the extent covers the operations only.
    ``last_tick`` accounts for delays: it is ``max(timestep + delay)``.  Returns
    ``None`` if no non-boundary vertex carries a ``timestep``.
    """
    starts = []
    ends = []
    for v in g.vertices():
        if g.type(v) == VertexType.BOUNDARY:
            continue
        t = get_timestep(g, v)
        if t is None:
            continue
        starts.append(t)
        ends.append(t + get_delay(g, v))
    if not starts:
        return None
    return (min(starts), max(ends))


def spacetime_metrics(g: BaseGraph[VT, ET]) -> dict[str, int]:
    """Space-time cost metrics of ``g``, viewed as a scheduled circuit.

    Only non-boundary vertices carrying a ``timestep`` contribute.  Returns a
    dict with:

    ``num_timesteps``
        number of distinct start ticks on which an operation begins (parallel
        layers).
    ``time_depth``
        wall-clock span ``last_tick - first_tick + 1`` (see :func:`time_extent`).
    ``spacetime_volume``
        sum over every occupied tick of the number of distinct qubits active on
        that tick.  An operation occupies ticks ``[timestep, timestep + max(delay, 1))``.
    ``total_delay``
        sum of all ``delay`` values.

    All four are ``0`` when ``g`` has no time data.
    """
    data = []  # (timestep, delay, qubit)
    for v in g.vertices():
        if g.type(v) == VertexType.BOUNDARY:
            continue
        t = get_timestep(g, v)
        if t is None:
            continue
        data.append((t, get_delay(g, v), g.qubit(v)))

    if not data:
        return {
            'num_timesteps': 0,
            'time_depth': 0,
            'spacetime_volume': 0,
            'total_delay': 0,
        }

    starts = {t for t, _, _ in data}
    first = min(starts)
    last = max(t + d for t, d, _ in data)

    active: dict[int, set] = {}
    for t, d, q in data:
        for tick in range(t, t + max(d, 1)):
            active.setdefault(tick, set()).add(q)

    return {
        'num_timesteps': len(starts),
        'time_depth': last - first + 1,
        'spacetime_volume': sum(len(qs) for qs in active.values()),
        'total_delay': sum(d for _, d, _ in data),
    }


def time_slice(g: BaseGraph[VT, ET], start: int,
               stop: Optional[int] = None) -> BaseGraph[VT, ET]:
    """Return the sub-diagram of ``g`` living in a window of timesteps.

    With ``stop=None`` the window is the single timestep ``start``; otherwise it
    is the inclusive range ``[start, stop]``.  A spider is kept when its occupied
    interval ``[timestep, timestep + delay]`` intersects the window; spiders
    without a ``timestep`` are dropped.

    Every edge from a kept spider to a dropped one is reconnected to a fresh
    ``BOUNDARY`` vertex, so the result is a valid ZX-diagram (with inputs and
    outputs set) that can be reasoned about on its own -- for instance compared
    against a phase gadget.  The new boundary is registered as an input when the
    dropped neighbour lies before the window and as an output otherwise.  Inputs
    and outputs are ordered by qubit (then row), so the diagram has the same
    boundary order a circuit on those qubits would.

    The returned graph has the same backend as ``g``.  Vertex data is copied;
    the scalar is not.
    """
    if stop is None:
        stop = start
    if stop < start:
        raise ValueError("time_slice: stop ({}) must be >= start ({})".format(stop, start))

    def kept(v: VT) -> bool:
        t = get_timestep(g, v)
        if t is None:
            return False
        return t <= stop and t + get_delay(g, v) >= start

    h = g.__class__()

    vmap: dict[VT, VT] = {}
    for v in g.vertices():
        if not kept(v):
            continue
        w = h.add_vertex(g.type(v), g.qubit(v), g.row(v), g.phase(v),
                         ground=g.is_ground(v))
        for k in g.vdata_keys(v):
            h.set_vdata(w, k, g.vdata(v, k))
        vmap[v] = w

    inputs = [vmap[v] for v in g.inputs() if v in vmap]
    outputs = [vmap[v] for v in g.outputs() if v in vmap]

    for e in g.edges():
        s, t = g.edge_st(e)
        et = g.edge_type(e)
        s_in, t_in = s in vmap, t in vmap
        if s_in and t_in:
            h.add_edge((vmap[s], vmap[t]), et)
        elif s_in or t_in:
            inside, outside = (s, t) if s_in else (t, s)
            b = h.add_vertex(VertexType.BOUNDARY, g.qubit(outside), g.row(outside))
            h.add_edge((vmap[inside], b), et)
            ot = get_timestep(g, outside)
            if ot is not None and ot < start:
                inputs.append(b)
            else:
                outputs.append(b)

    by_qubit_row = lambda b: (h.qubit(b), h.row(b))
    h.set_inputs(tuple(sorted(inputs, key=by_qubit_row)))
    h.set_outputs(tuple(sorted(outputs, key=by_qubit_row)))
    return h
