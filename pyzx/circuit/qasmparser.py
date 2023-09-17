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


import math
import re
from fractions import Fraction
from typing import List, Dict, Tuple, Optional

from . import Circuit
from .gates import Gate, qasm_gate_table, ZPhase, XPhase, CRZ, YPhase, NOT
from ..utils import settings


class QASMParser(object):
    """Class for parsing QASM source files into circuit descriptions."""

    def __init__(self) -> None:
        self.qasm_version:int = settings.default_qasm_version
        self.gates: List[Gate] = []
        self.custom_gates: Dict[str,Circuit] = {}
        self.registers: Dict[str,Tuple[int,int]] = {}
        self.qubit_count: int = 0
        self.circuit: Optional[Circuit] = None

    def parse(self, s: str, strict:bool=True) -> Circuit:
        self.gates = []
        self.custom_gates = {}
        self.registers = {}
        self.qubit_count = 0
        self.circuit = None
        lines = s.splitlines()
        r = []
        #strip comments
        for s in lines:
            if s.find("//")!=-1:
                t = s[0:s.find("//")].strip()
            else: t = s.strip()
            if t: r.append(t)

        match = re.fullmatch(r"OPENQASM ([23])(\.\d+)?;", r[0])
        if match and match.group(1):
            self.qasm_version = int(match.group(1))
            r.pop(0)
        elif strict:
            raise TypeError("File does not start with supported OPENQASM descriptor.")

        if self.qasm_version == 2 and r[0].startswith('include "qelib1.inc";') or \
                self.qasm_version == 3 and r[0].startswith('include "stdgates.inc";'):
            r.pop(0)
        elif strict:
            raise TypeError("File is not importing standard library")

        data = "\n".join(r)
        # Strip the custom command definitions from the normal commands
        while True:
            i = data.find("gate ")
            if i == -1: break
            j = data.find("}", i)
            self.parse_custom_gate(data[i:j+1])
            data = data[:i] + data[j+1:]
        #parse the regular commands
        commands = [s.strip() for s in data.split(";") if s.strip()]
        for c in commands:
            self.gates.extend(self.parse_command(c, self.registers))

        circ = Circuit(self.qubit_count)
        circ.gates = self.gates
        self.circuit = circ
        return self.circuit

    def parse_custom_gate(self, data: str) -> None:
        data = data[5:]
        spec, body = data.split("{",1)
        if "(" in spec:
            i = spec.find("(")
            j = spec.find(")")
            if spec[i+1:j].strip():
                raise TypeError("Arguments for custom gates are currently"
                                " not supported: {}".format(data))
            spec = spec[:i] + spec[j+1:]
        spec = spec.strip()
        if " " in spec:
            name, args = spec.split(" ",1)
            name = name.strip()
            args = args.strip()
        else:
            raise TypeError("Custom gate specification doesn't have any "
                            "arguments: {}".format(data))
        registers : Dict[str,Tuple[int,int]] = {}
        qubit_count = 0
        for a in args.split(","):
            a = a.strip()
            if a in registers:
                raise TypeError("Duplicate variable name: {}".format(data))
            registers[a] = (qubit_count,1)
            qubit_count += 1

        body = body[:-1].strip()
        commands = [s.strip() for s in body.split(";") if s.strip()]
        circ = Circuit(qubit_count)
        for c in commands:
            for g in self.parse_command(c, registers):
                circ.add_gate(g)
        self.custom_gates[name] = circ

    def extract_command_name(self, c: str) -> List[str]:
        if self.qasm_version == 3:
            # Convert some OpenQASM 3 commands into OpenQASM 2 format.
            c = re.sub(r"^bit\[(\d+)] (\w+)$", r"creg \2[\1]", c)
            c = re.sub(r"^qubit\[(\d+)] (\w+)$", r"qreg \2[\1]", c)
            c = re.sub(r"^(\w+)\[(\d+)] = measure (\w+)\[(\d+)]$", r"measure \3[\4] -> \1[\2]", c)
        return c.split(" ",1)

    def parse_command(self, c: str, registers: Dict[str,Tuple[int,int]]) -> List[Gate]:
        gates: List[Gate] = []
        name, rest = self.extract_command_name(c)
        if name in ("barrier","creg","measure", "id"): return gates
        if name in ("opaque", "if"):
            raise TypeError("Unsupported operation {}".format(c))
        args = [s.strip() for s in rest.split(",") if s.strip()]
        if name == "qreg":
            regname, sizep = args[0].split("[",1)
            size = int(sizep[:-1])
            registers[regname] = (self.qubit_count, size)
            self.qubit_count += size
            return gates
        qubit_values = []
        is_range = False
        dim = 1
        for a in args:
            if "[" in a:
                regname, valp = a.split("[",1)
                val = int(valp[:-1])
                if regname not in registers: raise TypeError("Invalid register {}".format(regname))
                qubit_values.append([registers[regname][0]+val])
            else:
                if is_range:
                    if registers[a][1] != dim:
                        raise TypeError("Error in parsing {}: Register sizes do not match".format(c))
                else:
                    dim = registers[a][1]
                is_range = True
                s = registers[a][0]
                qubit_values.append(list(range(s,s + dim)))
        if is_range:
            for i in range(len(qubit_values)):
                if len(qubit_values[i]) != dim:
                    qubit_values[i] = [qubit_values[i][0]]*dim
        for j in range(dim):
            argset = [q[j] for q in qubit_values]
            if name in self.custom_gates:
                circ = self.custom_gates[name]
                if len(argset) != circ.qubits:
                    raise TypeError("Argument amount does not match gate spec: {}".format(c))
                for g in circ.gates:
                    gates.append(g.reposition(argset))
                continue
            if name in ('x', 'z', 's', 't', 'h', 'sdg', 'tdg'):
                if name in ('sdg', 'tdg'):
                    g = qasm_gate_table[name](argset[0],adjoint=True) # type: ignore # mypy can't handle -
                else: g = qasm_gate_table[name](argset[0]) # type: ignore # - Gate subclasses with different numbers of parameters
                gates.append(g)
                continue
            if name.startswith(('rx', 'ry', 'rz', 'p', 'u1', 'crz')):
                i = name.find('(')
                j = name.find(')')
                if i == -1 or j == -1: raise TypeError("Invalid specification {}".format(name))
                valp = name[i+1:j]
                # try:
                #     phasep = float(valp)/math.pi
                # except ValueError:
                #     if valp.find('pi') == -1: raise TypeError("Invalid specification {}".format(name))
                #     valp = valp.replace('pi', '')
                #     valp = valp.replace('*','')
                #     try: phasep = float(valp)
                #     except: raise TypeError("Invalid specification {}".format(name))
                # phase = Fraction(phasep).limit_denominator(100000000)
                phase = self.parse_phase_arg(valp)
                if name.startswith('rx'): gates.append(XPhase(argset[0],phase=phase))
                elif name.startswith('crz'): gates.append(CRZ(argset[0],argset[1],phase=phase))
                elif self.qasm_version == 2 and name.startswith('rz') or \
                        name.startswith('p') or name.startswith('u1'):
                    gates.append(ZPhase(argset[0],phase=phase))
                elif self.qasm_version == 3 and name.startswith('rz'):
                    gates.append(ZPhase(argset[0],phase=phase/2))
                    gates.append(NOT(argset[0]))
                    gates.append(ZPhase(argset[0],phase=-phase/2))
                    gates.append(NOT(argset[0]))
                elif name.startswith('ry'): gates.append(YPhase(argset[0],phase=phase))
                else: raise TypeError("Invalid specification {}".format(name))
                continue
            if name.startswith('u2') or name.startswith('u3'): # see https://arxiv.org/pdf/1707.03429.pdf
                i = name.find('(')
                j = name.find(')')
                if i == -1 or j == -1: raise TypeError("Invalid specification {}".format(name))
                vals = name[i+1:j].split(',')
                phases = [self.parse_phase_arg(val) for val in vals]
                if name.startswith('u2'):
                    if len(phases) != 2: raise TypeError("Invalid specification {}".format(name))
                    gates.append(ZPhase(argset[0],phase=(phases[1]-Fraction(1,2))%2))
                    gates.append(XPhase(argset[0],phase=Fraction(1,2)))
                    gates.append(ZPhase(argset[0],phase=(phases[0]+Fraction(1,2))%2))
                    continue
                else:
                    # See equation (5) of https://arxiv.org/pdf/1707.03429.pdf
                    if len(phases) != 3: raise TypeError("Invalid specification {}".format(name))
                    gates.append(ZPhase(argset[0],phase=phases[2]))
                    gates.append(XPhase(argset[0],phase=Fraction(1,2)))
                    gates.append(ZPhase(argset[0],phase=(phases[0]+1)%2))
                    gates.append(XPhase(argset[0],phase=Fraction(1,2)))
                    gates.append(ZPhase(argset[0],phase=(phases[1]+3)%2))
                    continue
            if name in ('cx', 'CX', 'cz', 'ch', 'swap'):
                g = qasm_gate_table[name](control=argset[0],target=argset[1]) # type: ignore
                gates.append(g)
                continue
            if name in ('ccx', 'ccz'):
                g = qasm_gate_table[name](ctrl1=argset[0],ctrl2=argset[1],target=argset[2]) # type: ignore
                gates.append(g)
                continue
            raise TypeError("Unknown gate name: {}".format(c))
        return gates

    def parse_phase_arg(self, val):
        try:
            phase = float(val)/math.pi
        except ValueError:
            if val.find('pi') == -1: raise TypeError("Invalid specification {}".format(val))
            try:
                val = val.replace('pi', '')
                val = val.replace('*','')
                if val.find('/') != -1:
                    n, d = val.split('/',1)
                    n = n.strip()
                    if not n: n = 1
                    elif n == '-': n = -1
                    else: n = int(n)
                    d = int(d.strip())
                    phase = Fraction(n,d)
                else:
                    val = val.strip()
                    if not val: phase = 1
                    elif val == '-': phase = -1
                    else: phase = float(val)
            except: raise TypeError("Invalid specification {}".format(val))
        phase = Fraction(phase).limit_denominator(100000000)
        return phase


def qasm(s: str) -> Circuit:
    """Parses a string representing a program in QASM, and outputs a `Circuit`."""
    p = QASMParser()
    return p.parse(s, strict=False)

