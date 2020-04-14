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

from ..graph import EdgeType, VertexType
from . import Circuit

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

    def _max_target(self):
        qubits = self.target
        if hasattr(self, "control"):
            qubits = max([qubits, self.control])
        return qubits

    def __add__(self, other):
        c = Circuit(self._max_target()+1)
        c.add_gate(self)
        c += other
        return c

    def __matmul__(self,other):
        c = Circuit(self._max_target()+1)
        c.add_gate(self)
        c2 = Circuit(other._max_target()+1)
        c2.add_gate(other)
        return c@c2

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

    def graph_add_node(self, g, labels, qs, t, q, r, phase=0, etype=EdgeType.SIMPLE):
        v = g.add_vertex(t,labels[q],r,phase)
        g.add_edge((qs[q],v), etype)
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
        self.graph_add_node(g,labels, qs, VertexType.Z,self.target,rs[self.target],self.phase)
        rs[self.target] += 1

    def to_quipper(self):
        if not self.printphase:
            return super().to_quipper()
        return 'QRot["exp(-i%Z)",{!s}]({!s})'.format(math.pi*self.phase/2,self.target)

    def to_emoji(self,strings):
        s = ''
        phase = self.phase % 2
        if phase == Fraction(1,2): s = ':Zp4:'
        elif phase == Fraction(1,4): s = ':Zp4:'
        elif phase == Fraction(1,1): s = ':Zp:'
        elif phase == Fraction(3,4): s = ':Z3p4:'
        elif phase == Fraction(5,4): s = ':Z5p4:'
        elif phase == Fraction(3,2): s = ':Z3p2:'
        elif phase == Fraction(7,4): s = ':Z7p4:'
        else: raise Exception("Unsupported phase " + str(phase))
        strings[self.target].append(s)

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
        self.graph_add_node(g,labels, qs, VertexType.X, self.target,rs[self.target],self.phase)
        rs[self.target] += 1

    def to_emoji(self,strings):
        s = ''
        phase = self.phase % 2
        if phase == Fraction(1,2): s = ':Xp4:'
        elif phase == Fraction(1,4): s = ':Xp4:'
        elif phase == Fraction(1,1): s = ':Xp:'
        elif phase == Fraction(3,4): s = ':X3p4:'
        elif phase == Fraction(5,4): s = ':X5p4:'
        elif phase == Fraction(3,2): s = ':X3p2:'
        elif phase == Fraction(7,4): s = ':X7p4:'
        else: raise Exception("Unsupported phase " + str(phase))
        strings[self.target].append(s)

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
        v = g.add_vertex(VertexType.Z, labels[self.target],rs[self.target])
        g.add_edge((qs[self.target],v), EdgeType.HADAMARD)
        qs[self.target] = v
        rs[self.target] += 1

    def to_emoji(self,strings):
        strings[self.target].append(':H_:')

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
        t = self.graph_add_node(g,labels, qs, VertexType.X, self.target,r)
        c = self.graph_add_node(g,labels, qs, VertexType.Z, self.control,r)
        g.add_edge((t,c))
        rs[self.target] = r+1
        rs[self.control] = r+1
        g.scalar.add_power(1)

    def to_emoji(self,strings):
        c,t = self.control, self.target
        mi = min([c,t])
        ma = max([c,t])
        r = max([len(s) for s in strings[mi:ma+1]])
        for s in (strings[mi:ma+1]): 
                s.extend([':W_:']*(r-len(s)))
        for i in range(mi+1,ma): strings[i].append(':Wud:')
        if c<t:
            strings[self.control].append(':Zd:')
            strings[self.target].append(':Xu:')
        else:
            strings[self.control].append(':Zu:')
            strings[self.target].append(':Xd:')

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
        t = self.graph_add_node(g,labels, qs, VertexType.Z, self.target,r)
        c = self.graph_add_node(g,labels, qs, VertexType.Z, self.control,r)
        g.add_edge((t,c), EdgeType.HADAMARD)
        rs[self.target] = r+1
        rs[self.control] = r+1
        g.scalar.add_power(1)

    def to_emoji(self,strings):
        c,t = self.control, self.target
        strings[t].append(':H_:')
        CNOT.to_emoji(self,strings)
        strings[t].append(':H_:')


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

    def _max_target(self):
        return max(self.targets)

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


class FSim(Gate):
    name = 'FSim'
    quippername = 'undefined'
    qasm_name = 'undefined'
    qc_name = 'undefined'
    qsim_name = 'fs'
    printphase = True
    def __init__(self, theta, phi, control, target):
        self.control = control
        self.target = target
        self.theta = theta
        self.phi = phi

    def __eq__(self, other):
        if self.index != other.index: return False
        if (isinstance(other, type(self)) and
            self.control == other.control and self.target == other.target and
            self.theta == other.theta and self.phi == other.phi):
            return True
        return False

    def __str__(self):
        return "FSim({!s}, {!s}, {!s}, {!s})".format(self.theta, self.phi, self.control, self.target)

    def reposition(self, mask):
        g = self.copy()
        g.targets = [mask[t] for t in g.targets]
        return g

    def to_basic_gates(self):
        # TODO
        #cnots = [CNOT(self.targets[i],self.targets[i+1]) for i in range(len(self.targets)-1)]
        #p = ZPhase(self.targets[-1], self.phase)
        return [self]

    def to_graph(self, g, labels, qs, rs):
        # TODO: this version assumes theta is always (pi/2)
        r = max(rs[self.target],rs[self.control])
        qmin = min(self.target,self.control)
        c0 = self.graph_add_node(g,labels, qs, VertexType.Z, self.control,r)
        t0 = self.graph_add_node(g,labels, qs, VertexType.Z, self.target,r)
        c = g.add_vertex(VertexType.Z, self.control, r+1)
        t = g.add_vertex(VertexType.Z, self.target, r+1)
        g.add_edge((c0, t))
        g.add_edge((t0, c))
        qs[self.control] = c
        qs[self.target] = t

        pg0 = g.add_vertex(VertexType.Z, qmin+0.5,r+2)
        pg1 = g.add_vertex(VertexType.Z, qmin+0.5,r+3)

        g.set_phase(c, Fraction(-1,2) * self.phi)
        g.set_phase(t, Fraction(-1,2) * self.phi)
        g.set_phase(pg1, (Fraction(1,2) * self.phi) - Fraction(1,2))

        g.add_edge((c, pg0), EdgeType.HADAMARD)
        g.add_edge((t, pg0), EdgeType.HADAMARD)
        g.add_edge((pg0, pg1), EdgeType.HADAMARD)

        #rs[self.target] = r+2
        #rs[self.control] = r+2

        for i in range(len(rs)):
             rs[i] = r+4

        g.scalar.add_power(1)

        # c1 = self.graph_add_node(g,labels, qs, VertexType.Z, self.control,r)
        # t1 = self.graph_add_node(g,labels, qs, VertexType.Z, self.target,r)
        # c2 = self.graph_add_node(g,labels, qs, VertexType.Z, self.control,r+1)
        # t2 = self.graph_add_node(g,labels, qs, VertexType.Z, self.target,r+1)
        
        # pg1 = g.add_vertex(VertexType.Z,qmin-0.5,r+1)
        # pg1b = g.add_vertex(VertexType.Z,qmin-1.5,r+1, phase=self.theta)
        # g.add_edge((c1,pg1),EdgeType.HADAMARD)
        # g.add_edge((t1,pg1),EdgeType.HADAMARD)
        # g.add_edge((pg1,pg1b),EdgeType.HADAMARD)

        # pg2 = g.add_vertex(VertexType.Z,qmin-0.5,r+2)
        # pg2b = g.add_vertex(VertexType.Z,qmin-1.5,r+2, phase=-self.theta)
        # g.add_edge((c1,pg2),EdgeType.HADAMARD)
        # g.add_edge((t1,pg2),EdgeType.HADAMARD)
        # g.add_edge((c2,pg2),EdgeType.HADAMARD)
        # g.add_edge((t2,pg2),EdgeType.HADAMARD)
        # g.add_edge((pg2,pg2b),EdgeType.HADAMARD)

        # if zh_form:
        #     hbox = g.add_vertex(VertexType.H_BOX,qmin-0.5,r+3, phase=self.phi)
        #     g.add_edge((c2,hbox),EdgeType.SIMPLE)
        #     g.add_edge((t2,hbox),EdgeType.SIMPLE)
        # else:
        #     half_phi = Fraction(1,2) * self.phi
        #     pg3 = g.add_vertex(VertexType.Z,qmin-0.5,r+3)
        #     pg3b = g.add_vertex(VertexType.Z,qmin-1.5,r+3, phase=half_phi)
        #     g.add_edge((c2,pg3),EdgeType.HADAMARD)
        #     g.add_edge((t2,pg3),EdgeType.HADAMARD)
        #     g.add_edge((pg3,pg3b),EdgeType.HADAMARD)
        #     g.set_phase(c2, -half_phi)
        #     g.set_phase(t2, -half_phi)

        # for i in range(len(rs)):
        #     rs[i] = r+5

        #h = g.add_vertex(VertexType.H_BOX, qmin + 0.5, r + 0.5)
        #g.add_edge((t,h),EdgeType.SIMPLE)
        #g.add_edge((c1,h),EdgeType.SIMPLE)
        #g.add_edge((c2,h),EdgeType.SIMPLE)
        
        #rs[self.target] = r+4
        #rs[self.control] = r+4

        # TODO
        #for gate in self.to_basic_gates():
        #    gate.to_graph(g, labels, qs, rs)

    def tcount(self):
        # TODO
        return 0 #1 if self.phase.denominator > 2 else 0

class CX(CZ):
    name = 'CX'
    quippername = 'X'
    qasm_name = 'undefined'
    qc_name = 'undefined'
    def to_graph(self, g, labels, qs, rs):
        r = max(rs[self.target],rs[self.control])
        t = self.graph_add_node(g,labels, qs,VertexType.X,self.target,r)
        c = self.graph_add_node(g,labels, qs,VertexType.X,self.control,r)
        g.add_edge((t,c),EdgeType.HADAMARD)
        rs[self.target] = r+1
        rs[self.control] = r+1
        g.scalar.add_power(1)

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

class CCZ(Gate):
    name = 'CCZ'
    quippername = 'Z'
    qasm_name = 'ccz'
    qc_name = 'Z'
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

    def _max_target(self):
        return max([self.target,self.ctrl1,self.ctrl2])

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
        return [CNOT(c2,t), T(t,adjoint=True),
                CNOT(c1,t), T(t),CNOT(c2,t),T(t,adjoint=True),
                CNOT(c1,t), T(c2), T(t), CNOT(c1,c2),T(c1),
                T(c2,adjoint=True),CNOT(c1,c2)]

    def to_graph(self, g, labels, qs, rs):
        # if basic_gates:
        #     for gate in self.to_basic_gates():
        #         gate.to_graph(g, labels, qs, rs)
        # else:
        r = max(rs[self.target],rs[self.ctrl1],rs[self.ctrl2])
        qmin = min(self.target,self.ctrl1,self.ctrl2)
        t = self.graph_add_node(g,labels, qs,VertexType.Z,self.target,r)
        c1 = self.graph_add_node(g,labels, qs,VertexType.Z,self.ctrl1,r)
        c2 = self.graph_add_node(g,labels, qs,VertexType.Z,self.ctrl2,r)
        h = g.add_vertex(3, qmin + 0.5, r + 0.5)
        g.add_edge((t,h),EdgeType.SIMPLE)
        g.add_edge((c1,h),EdgeType.SIMPLE)
        g.add_edge((c2,h),EdgeType.SIMPLE)
        rs[self.target] = r+1
        rs[self.ctrl1] = r+1
        rs[self.ctrl2] = r+1

    def to_quipper(self):
        s = 'QGate["{}"]({!s})'.format(self.quippername,self.target)
        s += ' with controls=[+{!s},+{!s}]'.format(self.ctrl1,self.ctrl2)
        s += ' with nocontrol'
        return s

class Tofolli(CCZ):
    name = 'Tof'
    quippername = 'not'
    qasm_name = 'ccx'
    qc_name = 'Tof'
    def to_basic_gates(self):
        c1,c2,t = self.ctrl1, self.ctrl2, self.target
        return [HAD(t), CNOT(c2,t), T(t,adjoint=True),
                CNOT(c1,t), T(t),CNOT(c2,t),T(t,adjoint=True),
                CNOT(c1,t), T(c2), T(t), CNOT(c1,c2),T(c1),
                T(c2,adjoint=True),CNOT(c1,c2), HAD(t)]

    def to_graph(self, g, labels, qs, rs):
        t = self.target
        HAD(t).to_graph(g, labels, qs, rs)
        CCZ.to_graph(self, g, labels, qs, rs)
        HAD(t).to_graph(g, labels, qs, rs)

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
