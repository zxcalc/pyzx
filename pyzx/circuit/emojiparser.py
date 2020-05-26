# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
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

from typing import List

from . import Circuit

def circuit_to_emoji(c: Circuit, compress_rows:bool=True) -> str:
    """Turns the circuit into a ZX-Graph.
    If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
    on the same row."""
    strings: List[List[str]] = [list() for _ in range(c.qubits)]
    #for i in range(c.qubits):
    #    strings[i].append(':Wire_lr:')

    for gate in c.gates:
        if not compress_rows:
            r = max([len(s) for s in strings])
            for s in strings: 
                s.extend([':W_:']*(r-len(s)))
        if not hasattr(gate, "to_emoji"): raise TypeError("Gate {} cannot be converted to emoji".format(str(gate)))
        gate.to_emoji(strings) # type: ignore
        if not compress_rows:
            r = max([len(s) for s in strings])
            for s in strings: 
                s.extend([':W_:']*(r-len(s)))

    r = max([len(s) for s in strings])
    for s in strings: 
        s.extend([':W_:']*(r-len(s)))

    return "\n".join(["".join(s) for s in strings])