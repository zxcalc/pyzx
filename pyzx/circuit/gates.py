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

"""
This file contains the definition of commonly used
quantum gates for use in the Circuit class.
"""

import copy
import math
from fractions import Fraction

class InitAncilla:
    name = 'InitAncilla'
    def __init__(self, label):
        self.label = label

class PostSelect:
    name = 'PostSelect'
    def __init__(self, label):
        self.label = label


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

    def tcount(self):
        return 0

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
            bg = self.to_basic_gates()
            if len(bg) == 1:
                raise TypeError("Gate {} doesn't have a Quipper description".format(str(self)))
            return "\n".join(g.to_quipper() for g in bg)
        s = 'QGate["{}"]{}({!s})'.format(n,("*" if (hasattr(self,"adjoint") and self.adjoint) else ""),self.target)
        if hasattr(self, "control"):
            s += ' with controls=[+{!s}]'.format(self.control)
        s += ' with nocontrol'
        return s

    def to_qasm(self):
        n = self.qasm_name
        if n == 'undefined':
            bg = self.to_basic_gates()
            if len(bg) == 1:
                raise TypeError("Gate {} doesn't have a QASM description".format(str(self)))
            return "\n".join(g.to_qasm() for g in bg)
        if hasattr(self, "adjoint") and self.adjoint:
            n = self.qasm_name_adjoint

        args = []
        for a in ["ctrl1","ctrl2", "control", "target"]:
            if hasattr(self, a): args.append("q[{:d}]".format(getattr(self,a)))
        param = ""
        if hasattr(self, "printphase") and self.printphase:
            param = "({}*pi)".format(float(self.phase))
        return "{}{} {};".format(n, param, ", ".join(args))

    def to_qc(self):
        n = self.qc_name
        if hasattr(self, "adjoint") and self.adjoint:
            n += "*"
        if n == 'undefined':
            if isinstance(self, (ZPhase, XPhase)):
                bg = self.split_phases()
                if any(g.qc_name == 'undefined' for g in bg):
                    raise TypeError("Gate {} doesn't have a .qc description".format(str(self)))
            else: 
                bg = self.to_basic_gates()
                if len(bg) == 1:
                    raise TypeError("Gate {} doesn't have a .qc description".format(str(self)))
            return "\n".join(g.to_qc() for g in bg)
        args = []
        for a in ["ctrl1","ctrl2", "control", "target"]:
            if hasattr(self, a): args.append("q{:d}".format(getattr(self,a)))
        
        # if hasattr(self, "printphase") and self.printphase:
        #     args.insert(0, phase_to_s(self.phase))
        return "{} {}".format(n, " ".join(args))

    def graph_add_node(self, g, labels, qs, t, q, r, phase=0):
        v = g.add_vertex(t,labels[q],r,phase)
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

    def to_graph(self, g, labels, qs, rs):
        self.graph_add_node(g,labels, qs,1,self.target,rs[self.target],self.phase)
        rs[self.target] += 1

    def to_quipper(self):
        if not self.printphase:
            return super().to_quipper()
        return 'QRot["exp(-i%Z)",{!s}]({!s})'.format(math.pi*self.phase/2,self.target)

    def tcount(self):
        return 1 if self.phase.denominator > 2 else 0

    def split_phases(self):
        if not self.phase: return []
        if self.phase == 1: return [Z(self.target)]
        if self.phase.denominator == 2:
            if self.phase.numerator % 4 == 1:
                return [S(self.target)]
            else: return [S(self.target, adjoint=True)]
        elif self.phase.denominator == 4:
            gates = [] 
            n = self.phase.numerator % 8
            if n == 3 or n == 5:
                gates.append(Z(self.target))
                n = (n-4)%8
            if n == 1: gates.append(T(self.target))
            if n == 7: gates.append(T(self.target, adjoint=True))
            return gates
        else:
            return [self]


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

    def to_graph(self, g, labels, qs, rs):
        self.graph_add_node(g,labels, qs,2,self.target,rs[self.target],self.phase)
        rs[self.target] += 1

    def to_quipper(self):
        if not self.printphase:
            return super().to_quipper()
        return 'QRot["exp(-i%X)",{!s}]({!s})'.format(math.pi*self.phase/2,self.target)

    def tcount(self):
        return 1 if self.phase.denominator > 2 else 0

    def split_phases(self):
        if not self.phase: return []
        if self.phase == 1: return [NOT(self.target)]
        gates = [HAD(self.target)]
        if self.phase.denominator == 2:
            if self.phase.numerator % 4 == 1:
                gates.append(S(self.target))
            else: gates.append(S(self.target, adjoint=True))
        elif self.phase.denominator == 4:
            n = self.phase.numerator % 8
            if n == 3 or n == 5:
                gates.append(Z(self.target))
                n = (n-4)%8
            if n == 1: gates.append(T(self.target))
            if n == 7: gates.append(T(self.target, adjoint=True))
        else:
            gates.append(ZPhase(self.target, self.phase))
        gates.append(HAD(self.target))
        return gates

class NOT(XPhase):
    name = 'NOT'
    quippername = 'not'
    qasm_name = 'x'
    qc_name = 'X'
    printphase = False
    def __init__(self, target):
        super().__init__(target, phase = Fraction(1,1))

class HAD(Gate):
    name = 'HAD'
    quippername = 'H'
    qasm_name = 'h'
    qc_name = 'H'
    def __init__(self, target):
        self.target = target

    def to_graph(self, g, labels, qs, rs):
        v = g.add_vertex(1,labels[self.target],rs[self.target])
        g.add_edge((qs[self.target],v),2)
        qs[self.target] = v
        rs[self.target] += 1

class CNOT(Gate):
    name = 'CNOT'
    quippername = 'not'
    qasm_name = 'cx'
    qc_name = 'Tof'
    def __init__(self, control, target):
        self.target = target
        self.control = control
    def to_graph(self, g, labels, qs, rs):
        r = max(rs[self.target],rs[self.control])
        t = self.graph_add_node(g,labels, qs,2,self.target,r)
        c = self.graph_add_node(g,labels, qs,1,self.control,r)
        g.add_edge((t,c))
        rs[self.target] = r+1
        rs[self.control] = r+1
        g.scalar.add_power(1)

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

    def to_graph(self, g, labels, qs, rs):
        r = max(rs[self.target],rs[self.control])
        t = self.graph_add_node(g,labels, qs,1,self.target,r)
        c = self.graph_add_node(g,labels, qs,1,self.control,r)
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

    def to_graph(self, g, labels, qs, rs):
        for gate in self.to_basic_gates():
            gate.to_graph(g, labels, qs, rs)

    def tcount(self):
        return 1 if self.phase.denominator > 2 else 0


class CX(CZ):
    name = 'CX'
    quippername = 'X'
    qasm_name = 'undefined'
    qc_name = 'undefined'
    def to_graph(self, g, labels, qs, rs):
        r = max(rs[self.target],rs[self.control])
        t = self.graph_add_node(g,labels, qs,2,self.target,r)
        c = self.graph_add_node(g,labels, qs,2,self.control,r)
        g.add_edge((t,c),2)
        rs[self.target] = r+1
        rs[self.control] = r+1

    def to_basic_gates(self):
        return [HAD(self.control), CNOT(self.control,self.target), HAD(self.control)]

class SWAP(CZ):
    name = 'SWAP'
    quippername = 'undefined'
    qasm_name = 'undefined'

    def to_basic_gates(self):
        c1 = CNOT(self.control, self.target)
        c2 = CNOT(self.target, self.control)
        return [c1,c2,c1]

    def to_graph(self, g, labels, qs, rs):
        for gate in self.to_basic_gates():
            gate.to_graph(g, labels, qs,rs)

class Tofolli(Gate):
    name = 'Tof'
    quippername = 'not'
    qasm_name = 'ccx'
    qc_name = 'Tof'
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

    def tcount(self):
        return 7

    def reposition(self, mask):
        g = self.copy()
        g.target = mask[g.target]
        g.ctrl1 = mask[g.ctrl1]
        g.ctrl2 = mask[g.ctrl2]
        return g

    def to_basic_gates(self):
        c1,c2,t = self.ctrl1, self.ctrl2, self.target
        return [HAD(t),CNOT(c2,t), T(t,adjoint=True),
                CNOT(c1,t), T(t),CNOT(c2,t),T(t,adjoint=True),
                CNOT(c1,t), T(c2), T(t), CNOT(c1,c2),T(c1),
                T(c2,adjoint=True),CNOT(c1,c2),HAD(t)]
        #return [g.reposition(mask) for g in self.circuit_rep.gates]
    def to_graph(self, g, labels, qs, rs):
        for gate in self.to_basic_gates():
            gate.to_graph(g, labels, qs, rs)

    def to_quipper(self):
        s = 'QGate["{}"]({!s})'.format(self.quippername,self.target)
        s += ' with controls=[+{!s},+{!s}]'.format(self.ctrl1,self.ctrl2)
        s += ' with nocontrol'
        return s

class CCZ(Tofolli):
    name = 'CCZ'
    quippername = 'Z'
    qasm_name = 'ccz'
    qc_name = 'Z'
    def to_basic_gates(self):
        c1,c2,t = self.ctrl1, self.ctrl2, self.target
        return [CNOT(c2,t), T(t,adjoint=True),
                CNOT(c1,t), T(t),CNOT(c2,t),T(t,adjoint=True),
                CNOT(c1,t), T(c2), T(t), CNOT(c1,c2),T(c1),
                T(c2,adjoint=True),CNOT(c1,c2)]

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
    "InitAncilla": InitAncilla,
    "PostSelect": PostSelect
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