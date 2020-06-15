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

from typing import Dict

from . import Circuit
from .gates import *

def parse_qc(data: str) -> Circuit:
    """Produces a :class:`Circuit` based on a .qc description of a circuit.
    If a Tofolli gate with more than 2 controls is encountered, ancilla qubits are added.
    Currently up to 5 controls are supported."""
    preamble = data[:data.find("BEGIN")].strip().splitlines()
    labels: Dict[str,int] = {}
    for l in preamble:
        if l.startswith('#'): continue
        if l.startswith('.'):
            for v in l[2:].replace(',',' ').strip().split():
                s = v.strip()
                if s not in labels: labels[s] = len(labels)
        else:
            raise TypeError("Unknown Expression: " + l)

    ancillas: Dict[int,int] = {}
    gates: List[Gate] = []
    qcount = len(labels)

    for l in data[data.find("BEGIN")+6:data.find("END")].splitlines():
        if l.startswith('#'): continue
        l = l.strip()
        if not l: continue
        try: gname, targetstr = l.split(' ',1)
        except ValueError:
            raise ValueError("Couldn't parse line {}".format(l))
        gname = gname.strip().lower()
        targets = [labels[v.strip()] for v in targetstr.replace(',',' ').strip().split(' ') if v.strip()]
        if len(targets) == 1:
            t = targets[0]
            if gname in ('tof', 't1', 'not', 'x'): gates.append(NOT(t))
            elif gname == 'z': gates.append(Z(t))
            elif gname in ('s', 'p'): gates.append(S(t))
            elif gname in ('s*', 'p*'): gates.append(S(t,adjoint=True))
            elif gname == 't': gates.append(T(t))
            elif gname == 't*': gates.append(T(t,adjoint=True))
            elif gname == 'h': gates.append(HAD(t))
            else:
                raise TypeError("Unknown gate with single target: " + l)
        elif len(targets) == 2:
            c,t = targets
            if gname in ('cnot', 'tof', 't2'):
                gates.append(CNOT(c,t))
            elif gname in ('cz', 'z'):
                gates.append(CZ(c,t))
            else:
                raise TypeError("Unknown gate with control: " + l)
        elif len(targets) == 3:
            c1,c2,t = targets
            if gname in ('t3', 'tof'):
                gates.append(Tofolli(c1,c2,t))
            elif gname in ('ccz', 'z'):
                gates.append(CCZ(c1,c2,t))
            else:
                raise TypeError("Unknown gate with control: " + l)
        else:
            if gname not in ('t4', 't5', 't6', 't7', 'tof'):
                raise TypeError("Unknown gate with multiple controls: " + l)
            *ctrls, t = targets
            if len(ctrls) > 6: raise TypeError("No more than 5 ctrls supported")
            while len(ancillas) < len(ctrls) - 2:
                ancillas[len(ancillas)] = qcount
                qcount += 1
            gates.append(Tofolli(ctrls[0],ctrls[1],ancillas[0]))
            if len(ctrls) == 3:
                gates.append(Tofolli(ctrls[2],ancillas[0],t))
            else:
                gates.append(Tofolli(ctrls[2],ctrls[3],ancillas[1]))
                if len(ctrls) == 4:
                    gates.append(Tofolli(ancillas[0],ancillas[1],t))
                elif len(ctrls) == 5:
                    gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[2]))
                    gates.append(Tofolli(ctrls[4],ancillas[2],t))
                    gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[2]))
                else: # len(ctrls) == 6
                    gates.append(Tofolli(ctrls[4],ctrls[5],ancillas[2]))
                    gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[3]))
                    gates.append(Tofolli(ancillas[2],ancillas[3],t))
                    gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[3]))
                    gates.append(Tofolli(ctrls[4],ctrls[5],ancillas[2]))
                gates.append(Tofolli(ctrls[2],ctrls[3],ancillas[1]))
            gates.append(Tofolli(ctrls[0],ctrls[1],ancillas[0]))

    circ = Circuit(qcount)
    circ.gates = gates
    return circ