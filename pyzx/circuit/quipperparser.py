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

import math
from fractions import Fraction

from . import Circuit

def parse_quipper_block(lines):
    start = lines[0]
    end = lines[-1]
    gates = lines[1:-1]
    if not start.startswith("Inputs: "):
        raise TypeError("File does not start correctly: " + start)
    if start.endswith(','): start = start[:-1]
    inputs = start[8:].split(",")
    
    for i in inputs:
        n, t = i.split(":")
        if t.strip() != "Qbit":
            raise TypeError("Unsupported type " + t)

    c = Circuit(len(inputs))
    for gate in gates:
        if gate.startswith("Comment"): continue
        if gate.startswith("QInit0"):
            t = int(gate[gate.find('(')+1:gate.find(')')])
            if t>=c.qubits: c.qubits = t+1
            continue
        if gate.startswith("QTerm0"): continue
        if gate.startswith("QRot"):
            i = gate.find("exp(")
            if gate[i+4:i+8] == '-i%Z':
                gtype = "ZPhase"
            elif gate[i+4:i+8] == '-i%X':
                gtype = "XPhase"
            else:
                raise TypeError("Unsupported expression: " + gate) 
            f = gate[gate.find(',')+1: gate.find(']')]
            try:
                f = float(f)
            except ValueError:
                raise TypeError("Unsupported expression: " + gate)
            phase = Fraction(f/math.pi)
            target = gate[gate.rfind('(')+1:gate.rfind(')')]
            try: 
                target = int(target)
            except ValueError:
                raise TypeError("Unsupported expression: "+ gate)
            c.add_gate(gtype, target, 2*phase)
            continue
        elif not gate.startswith("QGate"):
            raise TypeError("Unsupported expression: " + gate)
        l = gate.split("with")
        g = l[0]
        gname = g[g.find('[')+2:g.find(']')-1]
        target = int(g[g.find('(')+1:g.find(')')])
        adjoint = g.find("*")!=-1
        if len(l) == 2 and l[1].find('nocontrol')!=-1: #no controls
            if gname == "H": c.add_gate("HAD", target)
            elif gname == "not": c.add_gate("NOT", target)
            elif gname == "Z": c.add_gate("Z", target)
            elif gname == "S": c.add_gate("S", target, adjoint=adjoint)
            elif gname == "T": c.add_gate("T", target, adjoint=adjoint)
            else:
                raise TypeError("Unsupported gate: " + gname)
            continue
        elif len(l) > 3: raise TypeError("Unsupported expression: " + gate)
        ctrls = l[1]
        ctrls = ctrls[ctrls.find('[')+1:ctrls.find(']')]
        if ctrls.find(',')!=-1:
            if ctrls.count(',') != 1: raise TypeError("Maximum two controls on gate allowed: " + gate)
            if gname not in ("not", "Z"): raise TypeError("Two controls only allowed on 'not' and 'Z': "+ gate)
            c1, c2 = ctrls.split(',',1)
            ctrl1 = int(c1.strip()[1:])
            ctrl2 = int(c2.strip()[1:])
            nots = []
            if c1.find('+') == -1:
                nots.append(ctrl1)
            if c2.find('+') == -1:
                nots.append(ctrl2)
            #if ctrl1.find('+') == -1 or ctrl2.find('+') == -1: raise TypeError("Unsupported controls: " + ctrls)
            for t in nots: c.add_gate("NOT", t)
            if gname == "not": c.add_gate("TOF", ctrl1, ctrl2, target)
            elif gname == "Z": c.add_gate("CCZ", ctrl1, ctrl2, target)
            for t in nots: c.add_gate("NOT", t)
            continue
        elif ctrls.find('+')==-1:
            raise TypeError("Unsupported control: " + ctrls)
        ctrl = int(ctrls[1:])
        if gname == "not": c.add_gate("CNOT", ctrl, target)
        elif gname == "Z": c.add_gate("CZ", ctrl, target)
        elif gname == "X": c.add_gate("CX", ctrl, target)
        else:
            raise TypeError("Unsupported controlled gate: " + gname)
    return c

def quipper_center_block(fname):
    """Function to load the PF files of the NRSCM paper."""
    f = open(fname, 'r')
    text = f.read()
    f.close()
    i = text.find('Subroutine: "C"')
    if i == -1: 
        i = text.find('Subroutine: "S1"')
        if i == -1: raise Exception("Not a valid format")
        text = text[i:].strip()
    else:
        j = text.find('Subroutine: "R"',i)
        if j == -1: raise Exception("Not a valid format")
        text = text[i:j].strip()
    lines = text.splitlines()[3:]
    return parse_quipper_block(lines)