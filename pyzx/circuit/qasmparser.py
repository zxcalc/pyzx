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
from .gates import qasm_gate_table

class QASMParser(object):
    """Class for parsing QASM source files into circuit descriptions."""
    def __init__(self):
        self.gates = []
        self.customgates = {}
        self.registers = {}
        self.qubit_count = 0
        self.circuit = None

    def parse(self, s):
        lines = s.splitlines()
        r = []
        #strip comments
        for s in lines:
            if s.find("//")!=-1:
                t = s[0:s.find("//")].strip()
            else: t = s.strip()
            if t: r.append(t)
        if not r[0].startswith("OPENQASM"):
            raise TypeError("File does not start with OPENQASM descriptor")
        if not r[1].startswith('include "qelib1.inc";'):
            raise TypeError("File is not importing standard library")
        data = "\n".join(r[2:])
        # Strip the custom command definitions from the normal commands
        while True:
            i = data.find("gate ")
            if i == -1: break
            j = data.find("}", i)
            self.parse_custom_gate(data[i:j+1])
            data = data[:i] + data[j+1:]
        #parse the regular commands
        commands = [s.strip() for s in data.split(";") if s.strip()]
        gates = []
        for c in commands:
            self.gates.extend(self.parse_command(c, self.registers))

        circ = Circuit(self.qubit_count)
        circ.gates = self.gates
        self.circuit = circ
        return self.circuit

    def parse_custom_gate(self, data):
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
        registers = {}
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
        self.customgates[name] = circ

    def parse_command(self, c, registers):
        gates = []
        name, rest = c.split(" ",1)
        if name in ("barrier","creg","measure", "id"): return gates
        if name in ("opaque", "if"):
            raise TypeError("Unsupported operation {}".format(c))
        args = [s.strip() for s in rest.split(",") if s.strip()]
        if name == "qreg":
            regname, size = args[0].split("[",1)
            size = int(size[:-1])
            registers[regname] = (self.qubit_count, size)
            self.qubit_count += size
            return gates
        qubit_values = []
        is_range = False
        dim = 1
        for a in args:
            if "[" in a:
                regname, val = a.split("[",1)
                val = int(val[:-1])
                if not regname in registers: raise TypeError("Invalid register {}".format(regname))
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
            if name in self.customgates:
                circ = self.customgates[name]
                if len(argset) != circ.qubits:
                    raise TypeError("Argument amount does not match gate spec: {}".format(c))
                for g in circ.gates:
                    gates.append(g.reposition(argset))
                continue
            if name in ("x", "z", "s", "t", "h", "sdg", "tdg"):
                if name in ("sdg", "tdg"): g = qasm_gate_table[name](argset[0],adjoint=True)
                else: g = qasm_gate_table[name](argset[0])
                gates.append(g)
                continue
            if name.startswith("rx") or name.startswith("rz"):
                i = name.find('(')
                j = name.find(')')
                if i == -1 or j == -1: raise TypeError("Invalid specification {}".format(name))
                val = name[i+1:j]
                try:
                    phase = float(val)/math.pi
                except ValueError:
                    if val.find('pi') == -1: raise TypeError("Invalid specification {}".format(name))
                    val = val.replace('pi', '')
                    val = val.replace('*','')
                    try: phase = float(val)
                    except: raise TypeError("Invalid specification {}".format(name))
                phase = Fraction(phase).limit_denominator(100000000)
                if name.startswith('rx'): g = XPhase(argset[0],phase=phase)
                else: g = ZPhase(argset[0],phase=phase)
                gates.append(g)
                continue
            if name in ("cx","CX","cz"):
                g = qasm_gate_table[name](control=argset[0],target=argset[1])
                gates.append(g)
                continue
            if name in ("ccx", "ccz"):
                g = qasm_gate_table[name](ctrl1=argset[0],ctrl2=argset[1],target=argset[2])
                gates.append(g)
                continue
            raise TypeError("Unknown gate name: {}".format(c))
        return gates
