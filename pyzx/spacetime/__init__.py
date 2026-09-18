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

"""Optional 1+1D space-time annotation of circuits as ZX-diagrams.

Passing ``gate_durations`` to :meth:`~pyzx.circuit.Circuit.to_graph` schedules
the gates as soon as possible in discrete integer time
(:mod:`pyzx.spacetime.scheduling`) and tags every spider of the resulting graph
with ``timestep`` and ``delay`` vertex data.  :mod:`pyzx.spacetime.timing` reads
that data back, computes space-time cost metrics, and extracts the sub-diagram
living in a window of timesteps.  Without ``gate_durations`` nothing in PyZX
changes.

Everything here is accessed as ``pyzx.spacetime.<name>``; see the
``demos/SpacetimeCircuits.ipynb`` notebook for a walkthrough.
"""

from .scheduling import used_qubits, gate_duration, schedule_gates
from .timing import (
    TIMESTEP_KEY, DELAY_KEY,
    get_timestep, set_timestep, get_delay, set_delay,
    has_time_data, time_extent, spacetime_metrics, time_slice,
)

__all__ = [
    'used_qubits', 'gate_duration', 'schedule_gates',
    'TIMESTEP_KEY', 'DELAY_KEY',
    'get_timestep', 'set_timestep', 'get_delay', 'set_delay',
    'has_time_data', 'time_extent', 'spacetime_metrics', 'time_slice',
]
