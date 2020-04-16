# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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