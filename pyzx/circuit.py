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

import os
from fractions import Fraction
import copy
import math

from .graph import Graph
from .drawing import phase_to_s

__all__ = ['Circuit']

class Circuit(object):
    """Class for representing quantum circuits.

    This class is mostly just a wrapper for a list of gates with methods for converting
    between different representations of a quantum circuit.

    The methods in this class that convert a specification of a circuit into an instance of this class,
    generally do not check whether the specification is well-defined. If a bad input is given, 
    the behaviour is undefined."""
    def __init__(self, qubit_amount, name=''):
        self.qubits = qubit_amount
        self.gates = []
        self.name = name

    def __str__(self):
        return "Circuit({!s} qubits, {!s} gates)".format(self.qubits,len(self.gates))

    def __repr__(self):
        return str(self)

    def copy(self):
        c = Circuit(self.qubits, self.name)
        c.gates = self.gates.copy()
        return c

    def adjoint(self):
        c = Circuit(self.qubits, self.name + 'Adjoint')
        for g in reversed(self.gates):
            c.gates.append(g.to_adjoint())
        return c

    @staticmethod
    def from_graph(g, split_phases=True):
        """Produces a :class:`Circuit` containing the gates of the given ZX-graph.
        If the ZX-graph is not circuit-like then the behaviour of this function
        is undefined.
        ``split_phases`` governs whether nodes with phases should be split into
        Z,S, and T gates or if generic ZPhase/XPhase gates should be used."""
        c = Circuit(g.qubit_count())
        qs = g.qubits()
        rs = g.rows()
        ty = g.types()
        phases = g.phases()
        rows = {}
        for v in g.vertices():
            if v in g.inputs: continue
            r = g.row(v)
            if r in rows: rows[r].append(v)
            else: rows[r] = [v]
        for r in sorted(rows.keys()):
            for v in rows[r]:
                q = qs[v]
                phase = phases[v]
                t = ty[v]
                neigh = [w for w in g.neighbours(v) if rs[w]<r]
                if len(neigh) != 1:
                    raise TypeError("Graph doesn't seem circuit like: multiple parents")
                n = neigh[0]
                if qs[n] != q:
                    raise TypeError("Graph doesn't seem circuit like: cross qubit connections")
                if g.edge_type(g.edge(n,v)) == 2:
                    c.add_gate("HAD", q)
                if t == 0: #vertex is an output
                    continue
                if phase!=0 and not split_phases:
                    if t == 1: c.add_gate("ZPhase", q, phase=phase)
                    else: c.add_gate("XPhase", q, phase=phase)
                elif t == 1 and phase.denominator == 2:
                    c.add_gate("S", q, adjoint=(phase.numerator==3))
                elif t == 1 and phase.denominator == 4:
                    if phase.numerator in (1,7): c.add_gate("T", q, adjoint=(phase.numerator==7))
                    if phase.numerator in (3,5):
                        c.add_gate("Z", q)
                        c.add_gate("T", q, adjoint=(phase.numerator==3))
                elif phase == 1:
                    if t == 1: c.add_gate("Z", q)
                    else: c.add_gate("NOT", q)
                elif phase != 0:
                    if t == 1: c.add_gate("ZPhase", q, phase=phase)
                    else: c.add_gate("XPhase", q, phase=phase)

                neigh = [w for w in g.neighbours(v) if rs[w]==r and w<v]
                for n in neigh:
                    t2 = ty[n]
                    q2 = qs[n]
                    if t == t2:
                        if g.edge_type(g.edge(v,n)) != 2:
                            raise TypeError("Invalid vertical connection between vertices of the same type")
                        if t == 1: c.add_gate("CZ", q2, q)
                        else: c.add_gate("CX", q2, q)
                    else:
                        if g.edge_type(g.edge(v,n)) != 1:
                            raise TypeError("Invalid vertical connection between vertices of different type")
                        if t == 1: c.add_gate("CNOT", q, q2)
                        else: c.add_gate("CNOT", q2, q)
        return c

    @staticmethod
    def from_quipper_file(fname):
        """Produces a :class:`Circuit` based on a Quipper ASCII description of a circuit."""
        f = open(fname, 'r')
        text = f.read()
        lines = text.splitlines()
        f.close()
        if text.find('Subroutine') == -1:
            c = parse_quipper_block(lines)
            c.name = os.path.basename(fname)
            return c
        else:
            raise TypeError("Subroutines are not supported")
        

    @staticmethod
    def from_qasm_file(fname):
        """Produces a :class:`Circuit` based on a QASM description of a circuit.
        It ignores all the non-unitary instructions like measurements in the file. 
        It currently doesn't support custom gates that have parameters."""
        f = open(fname, 'r')
        s = f.read()
        f.close()
        p = QASMParser()
        c = p.parse(s)
        c.name = os.path.basename(fname)
        return c

    @staticmethod
    def from_qc_file(fname):
        """Produces a :class:`Circuit` based on a .qc description of a circuit.
        If a Tofolli gate with more than 2 controls is encountered, ancilla qubits are added.
        Currently up to 5 controls are supported."""
        f = open(fname, 'r')
        data = f.read()
        f.close()
        preamble = data[:data.find("BEGIN")].strip().splitlines()
        labels = {}
        for l in preamble:
            if l.startswith('#'): continue
            if l.startswith('.'):
                for v in l[2:].replace(',',' ').strip().split():
                    s = v.strip()
                    if s not in labels: labels[s] = len(labels)
            else:
                raise TypeError("Unknown Expression: " + l)

        ancillas = {}
        gates = []
        qcount = len(labels)

        for l in data[data.find("BEGIN")+6:data.find("END")].splitlines():
            if l.startswith('#'): continue
            gname, targets = l.split(' ',1)
            gname = gname.strip().lower()
            targets = [labels[v.strip()] for v in targets.replace(',',' ').strip().split(' ') if v.strip()]
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
                if gname not in ('t4', 't5', 't6', 'tof'):
                    raise TypeError("Unknown gate with multiple controls: " + l)
                *ctrls, t = targets
                if len(ctrls) > 5: raise TypeError("No more than 5 ctrls supported")
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
                    else:
                        gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[2]))
                        gates.append(Tofolli(ctrls[4],ancillas[2],t))
                        gates.append(Tofolli(ancillas[0],ancillas[1],ancillas[2]))
                    gates.append(Tofolli(ctrls[2],ctrls[3],ancillas[1]))
                gates.append(Tofolli(ctrls[0],ctrls[1],ancillas[0]))

        c = Circuit(qcount)
        c.gates = gates
        return c

    @staticmethod
    def load(fname):
        """Tries to detect the circuit description language from the filename and its contents,
        and then tries to load the file into a circuit."""
        ext = os.path.splitext(fname)[-1]
        if ext in ('.qc', '.tfc'):
            return Circuit.from_qc_file(fname)
        if ext.find('qasm') != -1:
            return Circuit.from_qasm_file(fname)
        if ext == '.qgraph':
            raise TypeError(".qgraph files are not Circuits. Please load them as graphs using json_to_graph")
        if ext.find('quip') != -1:
            return Circuit.from_quipper_file(fname)
        f = open(fname, 'r')
        data = f.read(128)
        f.close()
        if data.startswith('Inputs:'):
            return Circuit.from_quipper_file(fname)
        if data.find('.v') != -1 or data.find('.i') != -1 or data.find('.o') != -1:
            return Circuit.from_qc_file(fname)
        if data.find('QASM') != -1:
            return Circuit.from_qasm_file(fname)

        raise TypeError("Couldn't determine filetype")

    def to_basic_gates(self):
        """Returns a new circuit with every gate expanded in terms of X/Z phases, Hadamards
        and the 2-qubit gates CNOT, CZ, CX."""
        c = Circuit(self.qubits, name=self.name)
        for g in self.gates:
            c.gates.extend(g.to_basic_gates())
        return c

    def split_phase_gates(self):
        c = Circuit(self.qubits, name=self.name)
        for g in self.gates:
            if isinstance(g, (ZPhase, XPhase)):
                if not g.phase: continue
                if g.phase == 1:
                    if isinstance(g, ZPhase): c.add_gate("Z", g.target)
                    else: c.add_gate("NOT", g.target)
                    continue
                if isinstance(g, XPhase):
                    c.add_gate("HAD", g.target)
                if g.phase.denominator == 2:
                    if g.phase.numerator % 4 == 1:
                        c.add_gate("S", g.target)
                    else: c.add_gate("S", g.target, adjoint=True)
                elif g.phase.denominator == 4:   
                    n = g.phase.numerator % 8
                    if n == 3 or n == 5:
                        c.add_gate("Z", g.target)
                        n = (n-4)%8
                    if n == 1: c.add_gate("T", g.target)
                    if n == 7: c.add_gate("T", g.target, adjoint=True)
                if isinstance(g, XPhase):
                    c.add_gate("HAD", g.target) 
            else:
                c.add_gate(g)
        return c

    def to_graph(self, compress_rows=True, backend=None):
        """Turns the circuit into a ZX-Graph.
        If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
        on the same row."""
        g = Graph(backend)
        qs = []
        rs = [0]*self.qubits
        for i in range(self.qubits):
            v = g.add_vertex(0,i,rs[i])
            g.inputs.append(v)
            qs.append(v)
            rs[i] += 1

        for gate in self.gates:
            gate.to_graph(g,qs,rs)
            if compress_rows and not isinstance(gate, (ZPhase, XPhase, HAD)):
                r = max(rs)
                rs = [r]*self.qubits

        r = max(rs)
        for o in range(self.qubits):
            v = g.add_vertex(0,o,r)
            g.outputs.append(v)
            g.add_edge((qs[o],v))

        return g

    def to_quipper(self):
        """Produces a Quipper ASCII description of the circuit."""
        s = "Inputs: " + ", ".join("{!s}Qbit".format(i) for i in range(self.qubits)) + "\n"
        for g in self.gates:
            s += g.to_quipper() + "\n"
        s += "Outputs: " + ", ".join("{!s}Qbit".format(i) for i in range(self.qubits))
        return s

    def to_qasm(self):
        """Produces a QASM description of the circuit."""
        s = """OPENQASM 2.0;\ninclude "qelib1.inc";\n"""
        s += "qreg q[{!s}];\n".format(self.qubits)
        for g in self.gates:
            s += g.to_qasm() + "\n"
        return s

    def to_qc(self):
        """Produces a .qc description of the circuit."""
        s = ".v " + " ".join("q{:d}".format(i) for i in range(self.qubits))
        s += "\n\nBEGIN\n"
        for g in self.gates:
            s += g.to_qc() + "\n"
        s += "END\n"
        return s


    def to_tensor(self):
        """Returns a tensor describing the circuit."""
        return self.to_graph().to_tensor()
                    

    def add_gate(self, gate, *args, **kwargs):
        """Adds a gate to the circuit. ``gate`` can either be 
        an instance of a :class:`Gate`, or it can be the name of a gate,
        in which case additional arguments should be given.

        Example::
            
            circuit.add_gate("CNOT", 1, 4) # adds a CNOT gate with target 1 and control 4
            circuit.add_gate("ZPhase", 2, phase=Fraction(3,4)) # Adds a ZPhase gate on qubit 2 with phase 3/4
        """
        if isinstance(gate, str):
            gate_class = gate_types[gate]
            gate = gate_class(*args, **kwargs)
        self.gates.append(gate)

    def add_circuit(self, circ, mask=None):
        """Adds the gate of another circuit to this one. If ``mask`` is not given,
        then they must have the same amount of qubits and they are mapped one-to-one.
        If mask is given then it must be a list specifying to which qubits the qubits
        in the given circuit correspond. 

        Example::

            c1 = Circuit(qubit_amount=4)
            c2 = Circuit(qubit_amount=2)
            c2.add_gate("CNOT",0,1)
            c1.add_circuit(c2, mask=[0,3]) # Now c1 has a CNOT from the first to the last qubit

        """
        if not mask:
            if self.qubits != circ.qubits: raise TypeError("Amount of qubits do not match")
            self.gates.extend(circ.gates)
            return
        elif len(mask) != circ.qubits: raise TypeError("Mask size does not match qubits")
        for gate in circ.gates:
            g = gate.reposition(mask)
            self.add_gate(g)

    def tcount(self):
        return sum(1 for g in self.gates if isinstance(g, (ZPhase, XPhase, ParityPhase)) and g.phase.denominator >= 4)
    
    def stats(self):
        """Returns statistics on the amount of gates in the circuit, separated into different classes 
        (such as amount of T-gates, two-qubit gates, Hadamard gates)."""
        total = 0
        tgates = 0
        twoqubit = 0
        hadamard = 0
        clifford = 0
        other = 0
        for g in self.gates:
            total += 1
            if isinstance(g, (ZPhase, XPhase)):
                if g.phase.denominator >= 4: tgates += 1
                else: clifford += 1
            elif isinstance(g, HAD):
                hadamard += 1
                clifford += 1
            elif isinstance(g, (CZ,CX, CNOT)):
                twoqubit += 1
                clifford += 1
            else:
                other += 1
        s = """Circuit {} on {} qubits with {} gates.
        {} T-like gates
        {} Cliffords among which 
        {} 2-qubit gates and {} Hadamard gates.""".format(self.name, self.qubits, total, 
                tgates, clifford, twoqubit, hadamard)
        if other > 0:
            s += "\nThere are {} gates of a different type".format(other)
        return s

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
            phase = Fraction(f/math.pi).limit_denominator()
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
                if not regname in registers: raise TypeError("Unvalid register {}".format(regname))
                qubit_values.append([registers[regname][0]+val])
            else:
                if is_range:
                    if registers[a][1] != dim:
                        raise TypeError("Error in parsing {}: Register sizes do not mach".format(c))
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



class Gate(object):
    """Base class for representing quantum gates."""
    index = 0
    def __str__(self):
        attribs = []
        if hasattr(self, "control"): attribs.append(str(self.control))
        if hasattr(self, "target"): attribs.append(str(self.target))
        if hasattr(self, "phase") and self.printphase: attribs.append("phase={!s}".format(self.phase))
        return "{}{}({})".format(self.name,("*" if (hasattr(self,"adjoint") and self.adjoint) else ""), ",".join(attribs))

    def __repr__(self):
        return str(self)

    def __eq__(self, other):
        if type(self) != type(other): return False
        for a in ["target","control","phase","adjoint"]:
            if hasattr(self,a):
                if not hasattr(other,a): return False
                if getattr(self,a) != getattr(other,a): return False
            elif hasattr(other,a): return False
        if self.index != other.index: return False
        return True

    def copy(self):
        return copy.copy(self)

    def to_adjoint(self):
        g = self.copy()
        if hasattr(g, "phase"):
            g.phase = -g.phase
        if hasattr(g, "adjoint"):
            g.adjoint = not g.adjoint
        return g

    def reposition(self, mask):
        g = self.copy()
        if hasattr(g, "target"):
            g.target = mask[g.target]
        if hasattr(g, "control"):
            g.control = mask[g.control]
        return g

    def to_basic_gates(self):
        return [self]

    def to_quipper(self):
        n = self.name if not hasattr(self, "quippername") else self.quippername
        if n == 'undefined':
            raise TypeError("Gate {} doesn't have a Quipper description".format(str(self)))
        s = 'QGate["{}"]{}({!s})'.format(n,("*" if (hasattr(self,"adjoint") and self.adjoint) else ""),self.target)
        if hasattr(self, "control"):
            s += ' with controls=[+{!s}]'.format(self.control)
        s += ' with nocontrol'
        return s

    def to_qasm(self):
        n = self.qasm_name
        if n == 'undefined':
            raise TypeError("Gate {} doesn't have a QASM description".format(str(self)))
        if hasattr(self, "adjoint") and self.adjoint:
            n = self.qasm_name_adjoint

        args = []
        for a in ["ctrl1","ctrl2", "control", "target"]:
            if hasattr(self, a): args.append("q[{:d}]".format(getattr(self,a)))
        param = ""
        if hasattr(self, "printphase") and self.printphase:
            param = "({})".format(phase_to_s(self.phase))
        return "{}{} {};".format(n, param, ", ".join(args))

    def to_qc(self):
        n = self.qc_name
        if hasattr(self, "adjoint") and self.adjoint:
            n += "*"
        if n == 'undefined':
            raise TypeError("Gate {} doesn't have a .qc description".format(str(self)))
        args = []
        for a in ["ctrl1","ctrl2", "control", "target"]:
            if hasattr(self, a): args.append("q{:d}".format(getattr(self,a)))
        
        # if hasattr(self, "printphase") and self.printphase:
        #     args.insert(0, phase_to_s(self.phase))
        return "{} {}".format(n, " ".join(args))

    def graph_add_node(self, g, qs, t, q, r, phase=0):
        v = g.add_vertex(t,q,r,phase)
        g.add_edge((qs[q],v))
        qs[q] = v
        return v

class ZPhase(Gate):
    name = 'ZPhase'
    printphase = True
    qasm_name = 'rz'
    qc_name = 'undefined'
    def __init__(self, target, phase):
        self.target = target
        self.phase = phase
        self.name 

    def to_graph(self, g, qs, rs):
        self.graph_add_node(g,qs,1,self.target,rs[self.target],self.phase)
        rs[self.target] += 1

    def to_quipper(self):
        if not self.printphase:
            return super().to_quipper()
        return 'QRot["exp(-i%Z)",{!s}]({!s})'.format(math.pi*self.phase/2,self.target)


class Z(ZPhase):
    name = 'Z'
    qasm_name = 'z'
    qc_name = 'Z'
    printphase = False
    def __init__(self, target):
        super().__init__(target, Fraction(1,1))

class S(ZPhase):
    name = 'S'
    qasm_name = 's'
    qasm_name_adjoint = 'sdg'
    qc_name = 'S'
    printphase = False
    def __init__(self, target, adjoint=False):
        super().__init__(target, Fraction(1,2)*(-1 if adjoint else 1))
        self.adjoint = adjoint

class T(ZPhase):
    name = 'T'
    qasm_name = 't'
    qasm_name_adjoint = 'tdg'
    qc_name = 'T'
    printphase = False
    def __init__(self, target, adjoint=False):
        super().__init__(target, Fraction(1,4)*(-1 if adjoint else 1))
        self.adjoint = adjoint

class XPhase(Gate):
    name = 'XPhase'
    printphase = True
    qasm_name = 'rx'
    qc_name = 'undefined'
    def __init__(self, target, phase=0):
        self.target = target
        self.phase = phase

    def to_graph(self, g, qs, rs):
        self.graph_add_node(g,qs,2,self.target,rs[self.target],self.phase)
        rs[self.target] += 1

    def to_quipper(self):
        if not self.printphase:
            return super().to_quipper()
        return 'QRot["exp(-i%X)",{!s}]({!s})'.format(math.pi*self.phase/2,self.target)


class NOT(XPhase):
    name = 'NOT'
    quippername = 'not'
    qasm_name = 'x'
    qc_name = 'X'
    printphase = False
    def __init__(self, target):
        super().__init__(target, phase = Fraction(1,1))


class CNOT(Gate):
    name = 'CNOT'
    quippername = 'not'
    qasm_name = 'cx'
    qc_name = 'Tof'
    def __init__(self, control, target):
        self.target = target
        self.control = control
    def to_graph(self, g, qs, rs):
        r = max(rs[self.target],rs[self.control])
        t = self.graph_add_node(g,qs,2,self.target,r)
        c = self.graph_add_node(g,qs,1,self.control,r)
        g.add_edge((t,c))
        rs[self.target] = r+1
        rs[self.control] = r+1

class CZ(Gate):
    name = 'CZ'
    quippername = 'Z'
    qasm_name = 'cz'
    qc_name = 'Z'
    def __init__(self, control, target):
        self.target = target
        self.control = control
    def __eq__(self,other):
        if self.index != other.index: return False
        if (isinstance(other, type(self)) and (
            (self.target == other.target and self.control == other.control) or
            (self.target == other.control and self.control == other.target))):
            return True
        return False

    def to_graph(self, g, qs, rs):
        r = max(rs[self.target],rs[self.control])
        t = self.graph_add_node(g,qs,1,self.target,r)
        c = self.graph_add_node(g,qs,1,self.control,r)
        g.add_edge((t,c),2)
        rs[self.target] = r+1
        rs[self.control] = r+1


class ParityPhase(Gate):
    name = 'ParityPhase'
    quippername = 'undefined'
    qasm_name = 'undefined'
    qc_name = 'undefined'
    printphase = True
    def __init__(self, phase, *targets):
        self.targets = targets
        self.phase = phase

    def __eq__(self, other):
        if self.index != other.index: return False
        if isinstance(other, type(self)) and set(self.targets) == set(other.targets) and self.phase == other.phase:
            return True
        return False

    def __str__(self):
        return "ParityPhase({!s}, {!s})".format(self.phase, ", ".join(str(t) for t in self.targets))

    def reposition(self, mask):
        g = self.copy()
        g.targets = [mask[t] for t in g.targets]
        return g

    def to_basic_gates(self):
        cnots = [CNOT(self.targets[i],self.targets[i+1]) for i in range(len(self.targets)-1)]
        p = ZPhase(self.targets[-1], self.phase)
        return cnots + [p] + list(reversed(cnots))

    def to_graph(self, g, qs, rs):
        for gate in self.to_basic_gates():
            gate.to_graph(g, qs, rs)


class CX(CZ):
    name = 'CX'
    quippername = 'X'
    qasm_name = 'undefined'
    def to_graph(self, g, qs, rs):
        r = max(rs[self.target],rs[self.control])
        t = self.graph_add_node(g,qs,2,self.target,r)
        c = self.graph_add_node(g,qs,2,self.control,r)
        g.add_edge((t,c),2)
        rs[self.target] = r+1
        rs[self.control] = r+1

class SWAP(CZ):
    name = 'SWAP'
    quippername = 'undefined'
    qasm_name = 'undefined'

    def to_basic_gates(self):
        c1 = CNOT(self.control, self.target)
        c2 = CNOT(self.target, self.control)
        return [c1,c2,c1]

    def to_graph(self, g, qs, rs):
        for gate in self.to_basic_gates():
            gate.to_graph(g,qs,rs)

class HAD(Gate):
    name = 'HAD'
    quippername = 'H'
    qasm_name = 'h'
    def __init__(self, target):
        self.target = target

    def to_graph(self,g, qs, rs):
        v = g.add_vertex(1,self.target,rs[self.target])
        g.add_edge((qs[self.target],v),2)
        qs[self.target] = v
        rs[self.target] += 1

class Tofolli(Gate):
    name = 'Tof'
    quippername = 'not'
    qasm_name = 'ccx'
    def __init__(self, ctrl1, ctrl2, target):
        self.target = target
        self.ctrl1 = ctrl1
        self.ctrl2 = ctrl2
    def __str__(self):
        return "{}(c1={!s},c2={!s},t={!s})".format(self.name,self.ctrl1,self.ctrl2,self.target)
    def __eq__(self, other):
        if self.index != other.index: return False
        if type(self) != type(other): return False
        if (self.target == other.target and 
            ((self.ctrl1 == other.ctrl1 and self.ctrl2 == other.ctrl2) or
             (self.ctrl1 == other.ctrl2 and self.ctrl2 == other.ctrl1))): return True
        return False

    def reposition(self, mask):
        g = self.copy()
        g.target = mask[g.target]
        g.ctrl1 = mask[g.ctrl1]
        g.ctrl2 = mask[g.ctrl2]
        return g

    def to_basic_gates(self):
        mask = [self.ctrl1, self.ctrl2, self.target]
        return [g.reposition(mask) for g in self.circuit_rep.gates]

    def to_graph(self, g, qs, rs):
        for gate in self.to_basic_gates():
            gate.to_graph(g, qs, rs)

    def to_quipper(self):
        s = 'QGate["{}"]({!s})'.format(self.quippername,self.target)
        s += ' with controls=[+{!s},+{!s}]'.format(self.ctrl1,self.ctrl2)
        s += ' with nocontrol'
        return s


class CCZ(Tofolli):
    name = 'CCZ'
    quippername = 'Z'
    qasm_name = 'ccz'

gate_types = {
    "XPhase": XPhase,
    "NOT": NOT,
    "ZPhase": ZPhase,
    "Z": Z,
    "S": S,
    "T": T,
    "CNOT": CNOT,
    "CZ": CZ,
    "ParityPhase": ParityPhase,
    "CX": CX,
    "SWAP": SWAP,
    "HAD": HAD,
    "TOF": Tofolli,
    "CCZ": CCZ,
}

qasm_gate_table = {
    "x": NOT,
    "z": Z,
    "s": S,
    "t": T,
    "sdg": S,
    "tdg": T,
    "h": HAD,
    "cx": CNOT,
    "CX": CNOT,
    "cz": CZ,
    "ccx": Tofolli,
    "ccz": CCZ,
}

QASM_TOFOLLI = """OPENQASM 2.0;
include "qelib1.inc";

gate ccx a,b,c
{
h c;
cx b,c; tdg c;
cx a,c; t c;
cx b,c; tdg c;
cx a,c; t b; t c; h c;
cx a,b; t a; tdg b;
cx a,b;
}

qreg q[3];
ccx q[0], q[1], q[2];
"""

QASM_CCZ = """OPENQASM 2.0;
include "qelib1.inc";

gate ccx a,b,c
{
cx b,c; tdg c;
cx a,c; t c;
cx b,c; tdg c;
cx a,c; t b; t c; h c;
cx a,b; t a; tdg b;
cx a,b;
h c;
}

qreg q[3];
ccx q[0], q[1], q[2];
"""

Tofolli.circuit_rep = QASMParser().parse(QASM_TOFOLLI)
CCZ.circuit_rep = QASMParser().parse(QASM_CCZ)