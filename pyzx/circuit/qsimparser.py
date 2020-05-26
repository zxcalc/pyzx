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
from .gates import *
from fractions import Fraction

def parse_qsim(data: str) -> Circuit:
    """Produces a :class:`Circuit` based on a .qsim description of a circuit."""
    lines = data.strip().splitlines()

    try:
        qcount = int(lines.pop(0))
    except ValueError:
        raise ValueError('First line should be qubit count')

    gates: List[Gate] = []

    for l in lines:
        l = l.strip()
        if l == '': continue
        gdesc = l.split(' ')
        q = int(gdesc[2])
        if gdesc[1] == 'rz':
            phase = float(gdesc[3]) / math.pi
            gates.append(ZPhase(target = q, phase = Fraction(phase)))
        elif gdesc[1] == 'hz_1_2':
            gates.append(ZPhase(target = q, phase = Fraction(1,4)))
            gates.append(XPhase(target = q, phase = Fraction(1,2)))
            gates.append(ZPhase(target = q, phase = Fraction(-1,4)))
        elif gdesc[1] == 'x_1_2':
            gates.append(XPhase(target = q, phase = Fraction(1,2)))
        elif gdesc[1] == 'y_1_2':
            gates.append(XPhase(target = q, phase = Fraction(1,2)))
            gates.append(ZPhase(target = q, phase = Fraction(1,2)))
            gates.append(XPhase(target = q, phase = Fraction(-1,2)))
        elif gdesc[1] == 'fs':
            q1 = int(gdesc[3])
            theta = float(gdesc[4]) / math.pi
            phi = float(gdesc[5]) / math.pi
            gates.append(FSim(Fraction(theta), Fraction(phi), q, q1))

    c = Circuit(qcount)
    c.gates = gates
    return c