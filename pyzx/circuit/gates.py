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

"""
This file contains the definition of commonly used
quantum gates for use in the Circuit class.
"""

import copy
import math
from fractions import Fraction
from typing import Dict, List, Optional, Type, ClassVar, TypeVar, Generic, Set

from ..utils import EdgeType, VertexType, FractionLike
from ..graph.base import BaseGraph, VT, ET

# We need this type variable so that the subclasses of Gate return the correct type for functions like copy()
Tvar = TypeVar('Tvar', bound='Gate')

class TargetMapper(Generic[VT]):
    """
    This class is used to map the target parameters of a gate to rows, qubits, and vertices
    when converting them into a graph. Used by :func:`~pyzx.circuit.gates.Gate.to_graph`.
    """
    _qubits: Dict[int, int]
    _rows: Dict[int, int]
    _prev_vs: Dict[int, VT]

    def __init__(self):
        self._qubits = {}
        self._rows = {}
        self._prev_vs = {}

    def labels(self) -> Set[int]:
        """
        Returns the mapped labels.
        """
        return set(self._qubits.keys())

    def to_qubit(self, l: int) -> int:
        """
        Maps a label to the qubit id in the graph.
        """
        return self._qubits[l]

    def set_qubit(self, l: int, q: int) -> None:
        """
        Sets the qubit id for a label.
        """
        self._qubits[l] = q

    def next_row(self, l: int) -> int:
        """
        Returns the next free row in the label's qubit.
        """
        return self._rows[l]

    def set_next_row(self, l: int, row: int) -> None:
        """
        Sets the next free row in the label's qubit.
        """
        self._rows[l] = row

    def advance_next_row(self, l: int) -> None:
        """
        Advances the next free row in the label's qubit by one.
        """
        self._rows[l] += 1

    def shift_all_rows(self, n: int) -> None:
        """
        Shifts all 'next rows' by n.
        """
        for l in self._rows.keys():
            self._rows[l] += n

    def set_all_rows(self, n: int) -> None:
        """
        Set the value of all 'next rows'.
        """
        for l in self._rows.keys():
            self._rows[l] = n
    
    def max_row(self) -> int:
        """
        Returns the highest 'next row' number.
        """
        return max(self._rows.values(), default=0)

    def prev_vertex(self, l: int) -> VT:
        """
        Returns the previous vertex in the label's qubit.
        """
        return self._prev_vs[l]

    def set_prev_vertex(self, l: int, v: VT) -> None:
        """
        Sets the previous vertex in the label's qubit.
        """
        self._prev_vs[l] = v

    def add_label(self, l: int) -> None:
        """
        Adds a tracked label.

        :raises: ValueError if the label is already tracked.
        """
        if l in self._qubits:
            raise ValueError("Label {} already in use".format(str(l)))
        q = len(self._qubits)
        self.set_qubit(l, q)
        r = self.max_row()
        self.set_all_rows(r)
        self.set_next_row(l, r+1)

    def remove_label(self, l: int) -> None:
        """
        Removes a tracked label.

        :raises: ValueError if the label is not tracked.
        """
        if l not in self._qubits:
            raise ValueError("Label {} not in use".format(str(l)))
        self.set_all_rows(self.max_row()+1)
        del self._qubits[l]
        del self._rows[l]
        del self._prev_vs[l]

class Gate(object):
    """Base class for representing quantum gates."""
    name:               ClassVar[str] = "BaseGate"
    qasm_name:          ClassVar[str] = 'undefined'
    qasm_name_adjoint:  ClassVar[str] = 'undefined'
    qc_name:            ClassVar[str] = 'undefined'
    quipper_name:       ClassVar[str] = 'undefined'
    print_phase:        ClassVar[bool] = False
    index = 0
    def __str__(self) -> str:
        attribs = []
        if hasattr(self, "control"): attribs.append(str(self.control))
        if hasattr(self, "target"): attribs.append(str(self.target))
        if hasattr(self, "phase") and self.print_phase:
            attribs.append("phase={!s}".format(self.phase))
        return "{}{}({})".format(
                        self.name,
                        ("*" if (hasattr(self,"adjoint") and self.adjoint) else ""),
                        ",".join(attribs))

    def __repr__(self) -> str:
        return str(self)

    def __eq__(self, other: object) -> bool:
        if type(self) != type(other): return False
        for a in ["target","control","phase","adjoint"]:
            if hasattr(self,a):
                if not hasattr(other,a): return False
                if getattr(self,a) != getattr(other,a): return False
            elif hasattr(other,a): return False
        assert isinstance(other, Gate)
        if self.index != other.index: return False
        return True

    def _max_target(self) -> int:
        qubits = self.target        # type: ignore # due to ParityPhase
        if hasattr(self, "control"):
            qubits = max([qubits, self.control])
        return qubits

    def __add__(self, other):
        from . import Circuit
        c = Circuit(self._max_target()+1)
        c.add_gate(self)
        c += other
        return c

    def __matmul__(self,other):
        from . import Circuit
        c = Circuit(self._max_target()+1)
        c.add_gate(self)
        c2 = Circuit(other._max_target()+1)
        c2.add_gate(other)
        return c@c2

    def copy(self: Tvar) -> Tvar:
        return copy.copy(self)

    def to_adjoint(self: Tvar) -> Tvar:
        g = self.copy()
        if hasattr(g, "phase"):
            g.phase = -g.phase
        if hasattr(g, "adjoint"):
            g.adjoint = not g.adjoint
        return g

    def tcount(self) -> int:
        return 0

    def reposition(self: Tvar, mask: List[int], bit_mask: Optional[List[int]] = None) -> Tvar:
        g = self.copy()
        if hasattr(g, "target"):
            g.target = mask[g.target]
        if hasattr(g, "control"):
            g.control = mask[g.control]
        return g

    def to_basic_gates(self) -> List['Gate']:
        return [self]

    def to_quipper(self) -> str:
        n = self.quipper_name
        if n == 'undefined':
            bg = self.to_basic_gates()
            if len(bg) == 1:
                raise TypeError("Gate {} doesn't have a Quipper description".format(str(self)))
            return "\n".join(g.to_quipper() for g in bg)
        s = 'QGate["{}"]{}({!s})'.format(n,
                                         ("*" if (hasattr(self,"adjoint") and self.adjoint) else ""),
                                         self.target) # type: ignore # due to ParityPhase
        if hasattr(self, "control"):
            s += ' with controls=[+{!s}]'.format(self.control)
        s += ' with nocontrol'
        return s

    def to_qasm(self) -> str:
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
        if hasattr(self, "phase") and self.print_phase:
            param = "({}*pi)".format(float(self.phase))
        return "{}{} {};".format(n, param, ", ".join(args))

    def to_qc(self) -> str:
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
        
        # if hasattr(self, "phase") and self.print_phase:
        #     args.insert(0, phase_to_s(self.phase))
        return "{} {}".format(n, " ".join(args))

    def to_graph(self, g: BaseGraph[VT,ET], q_mapper: TargetMapper[VT], c_mapper: TargetMapper[VT]) -> None:
        """
        Add the converted gate to the graph.

        :param g: The graph to add the gate to.
        :param q_mapper: A mapper for qubit labels.
        :param c_mapper: A mapper for bit labels.
        """
        raise NotImplementedError("to_graph() must be implemented by each Gate subclass.")

    def graph_add_node(self, 
                g: BaseGraph[VT,ET], 
                mapper: TargetMapper[VT],
                t: VertexType.Type, 
                l: int, r: int, 
                phase: FractionLike=0, 
                etype: EdgeType.Type=EdgeType.SIMPLE,
                ground: bool = False) -> VT:
        v = g.add_vertex(t, mapper.to_qubit(l), r, phase, ground)
        g.add_edge(g.edge(mapper.prev_vertex(l), v), etype)
        mapper.set_prev_vertex(l, v)
        return v

class ZPhase(Gate):
    name = 'ZPhase'
    qasm_name = 'rz'
    quipper_name = 'ZPhase'
    print_phase = True
    def __init__(self, target: int, phase: FractionLike) -> None:
        self.target = target
        self.phase = phase

    def to_graph(self, g, q_mapper, _c_mapper):
        self.graph_add_node(g,q_mapper, VertexType.Z, self.target, q_mapper.next_row(self.target), self.phase)
        q_mapper.advance_next_row(self.target)

    def to_quipper(self):
        if not self.print_phase:
            return super().to_quipper()
        return 'QRot["exp(-i%Z)",{!s}]({!s})'.format(math.pi*self.phase/2,self.target)

    def to_emoji(self,strings: List[List[str]]) -> None:
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

    def split_phases(self) -> List['ZPhase']:
        if not self.phase: return []
        if self.phase == 1: return [Z(self.target)]
        if self.phase.denominator == 2:
            if self.phase.numerator % 4 == 1:
                return [S(self.target)]
            else: return [S(self.target, adjoint=True)]
        elif self.phase.denominator == 4:
            gates: List['ZPhase'] = [] 
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
    quipper_name = 'Z'
    print_phase = False
    def __init__(self, target: int) -> None:
        super().__init__(target, Fraction(1,1))

class S(ZPhase):
    name = 'S'
    qasm_name = 's'
    qasm_name_adjoint = 'sdg'
    qc_name = 'S'
    quipper_name = 'S'
    print_phase = False
    def __init__(self, target: int, adjoint:bool=False) -> None:
        super().__init__(target, Fraction(1,2)*(-1 if adjoint else 1))
        self.adjoint = adjoint

class T(ZPhase):
    name = 'T'
    qasm_name = 't'
    qasm_name_adjoint = 'tdg'
    qc_name = 'T'
    quipper_name = 'T'
    print_phase = False
    def __init__(self, target: int, adjoint:bool=False) -> None:
        super().__init__(target, Fraction(1,4)*(-1 if adjoint else 1))
        self.adjoint = adjoint

class XPhase(Gate):
    name = 'XPhase'
    qasm_name = 'rx'
    quipper_name = 'XPhase'
    print_phase = True
    def __init__(self, target: int, phase: FractionLike=0) -> None:
        self.target = target
        self.phase = phase

    def to_graph(self, g, q_mapper, _c_mapper):
        self.graph_add_node(g, q_mapper, VertexType.X, self.target, q_mapper.next_row(self.target), self.phase)
        q_mapper.advance_next_row(self.target)

    def to_emoji(self,strings: List[List[str]]) -> None:
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
        if not self.print_phase:
            return super().to_quipper()
        return 'QRot["exp(-i%X)",{!s}]({!s})'.format(math.pi*self.phase/2,self.target)

    def tcount(self):
        return 1 if self.phase.denominator > 2 else 0

    def split_phases(self) -> List[Gate]:
        if not self.phase: return []
        if self.phase == 1: return [NOT(self.target)]
        gates: List[Gate] = [HAD(self.target)]
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

class SX(XPhase):
    name = 'SX'
    qasm_name = 'sx'
    qasm_name_adjoint = 'sxdg'
    def __init__(self, target: int, adjoint:bool=False) -> None:
        super().__init__(target, Fraction(1,2)*(-1 if adjoint else 1))
        self.adjoint = adjoint

class CSX(Gate):
    name = 'CSX'
    qasm_name = 'csx'
    def __init__(self, control: int, target: int) -> None:
        self.target = target
        self.control = control

    def to_basic_gates(self):
        return [HAD(self.target)] + \
               CPhase(self.control,self.target,Fraction(1,2)).to_basic_gates() + \
               [HAD(self.target)]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class YPhase(Gate):
    name = 'YPhase'
    qasm_name = 'ry'
    quipper_name = 'YPhase'
    print_phase = True
    def __init__(self, target: int, phase: FractionLike=0) -> None:
        self.target = target
        self.phase = phase

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, YPhase): return False
        if self.index != other.index: return False
        if self.target == other.target and self.phase == other.phase:
            return True
        return False

    def __str__(self) -> str:
        return 'QRot["exp(-i%Y)",{!s}]({!s})'.format(math.pi*self.phase/2,self.target)

    def to_basic_gates(self):
        return [ZPhase(self.target, Fraction(1,2)), XPhase(self.target, -self.phase), ZPhase(self.target, -Fraction(1,2))]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

    def tcount(self):
        return 1 if self.phase.denominator > 2 else 0

class Y(YPhase):
    name = 'Y'
    qasm_name = 'y'
    qc_name = 'Y'
    quipper_name = 'Y'
    print_phase = False
    def __init__(self, target: int) -> None:
        super().__init__(target, phase = Fraction(1,1))

class CY(Gate):
    name = 'CY'
    qasm_name = 'cy'
    def __init__(self, control: int, target: int) -> None:
        self.target = target
        self.control = control

    def to_basic_gates(self):
        return [S(self.target,adjoint=True),
                CNOT(self.control,self.target),
                S(self.target)]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class NOT(XPhase):
    name = 'NOT'
    qasm_name = 'x'
    qc_name = 'X'
    quipper_name = 'not'
    print_phase = False
    def __init__(self, target: int) -> None:
        super().__init__(target, phase = Fraction(1,1))

class HAD(Gate):
    name = 'HAD'
    qasm_name = 'h'
    qc_name = 'H'
    quipper_name = 'H'
    def __init__(self, target: int) -> None:
        self.target = target

    def to_graph(self, g, q_mapper, _c_mapper):
        v = g.add_vertex(VertexType.Z, q_mapper.to_qubit(self.target), q_mapper.next_row(self.target))
        g.add_edge((q_mapper.prev_vertex(self.target),v), EdgeType.HADAMARD)
        q_mapper.set_prev_vertex(self.target, v)
        q_mapper.advance_next_row(self.target)

    def to_emoji(self,strings: List[List[str]]) -> None:
        strings[self.target].append(':H_:')

class CNOT(Gate):
    name = 'CNOT'
    qasm_name = 'cx'
    qc_name = 'Tof'
    quipper_name = 'not'
    def __init__(self, control: int, target: int) -> None:
        self.target = target
        self.control = control
    def to_graph(self, g, q_mapper, _c_mapper):
        r = max(q_mapper.next_row(self.target), q_mapper.next_row(self.control))
        t = self.graph_add_node(g, q_mapper, VertexType.X, self.target, r)
        c = self.graph_add_node(g, q_mapper, VertexType.Z, self.control, r)
        g.add_edge((t,c))
        q_mapper.set_next_row(self.target, r+1)
        q_mapper.set_next_row(self.control, r+1)
        g.scalar.add_power(1)

    def to_emoji(self,strings: List[List[str]]) -> None:
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
    qasm_name = 'cz'
    qc_name = 'Z'
    quipper_name = 'Z'
    def __init__(self, control: int, target: int) -> None:
        self.target = target
        self.control = control
    def __eq__(self,other: object) -> bool:
        if not isinstance(other, CZ): return False
        if not type(self) == type(other): return False
        if self.index != other.index: return False
        if (
            (self.target == other.target and self.control == other.control) or
            (self.target == other.control and self.control == other.target)):
            return True
        return False

    def to_graph(self, g, q_mapper, _c_mapper):
        r = max(q_mapper.next_row(self.target), q_mapper.next_row(self.control))
        t = self.graph_add_node(g, q_mapper, VertexType.Z, self.target, r)
        c = self.graph_add_node(g, q_mapper, VertexType.Z, self.control, r)
        g.add_edge((t,c), EdgeType.HADAMARD)
        q_mapper.set_next_row(self.target, r+1)
        q_mapper.set_next_row(self.control, r+1)
        g.scalar.add_power(1)

    def to_emoji(self,strings: List[List[str]]) -> None:
        c,t = self.control, self.target
        strings[t].append(':H_:')
        CNOT(c,t).to_emoji(strings)
        strings[t].append(':H_:')


class XCX(CZ):
    '''This class represents the X-controlled-X gate.'''
    name = 'XCX'
    qasm_name = 'undefined'
    qc_name = 'undefined'
    quipper_name = 'X'
    def to_graph(self, g, q_mapper, _c_mapper):
        r = max(q_mapper.next_row(self.target), q_mapper.next_row(self.control))
        t = self.graph_add_node(g, q_mapper, VertexType.X, self.target, r)
        c = self.graph_add_node(g, q_mapper, VertexType.X, self.control, r)
        g.add_edge((t,c), EdgeType.HADAMARD)
        q_mapper.set_next_row(self.target, r+1)
        q_mapper.set_next_row(self.control, r+1)
        g.scalar.add_power(1)

    def to_basic_gates(self):
        return [HAD(self.control), CNOT(self.control,self.target), HAD(self.control)]

class SWAP(CZ):
    name = 'SWAP'
    qasm_name = 'swap'
    qc_name = 'undefined'
    quipper_name = 'undefined'
    def to_basic_gates(self):
        c1 = CNOT(self.control, self.target)
        c2 = CNOT(self.target, self.control)
        return [c1,c2,c1]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class CRX(Gate):
    name = 'CRX'
    qasm_name = 'crx'
    print_phase = True
    def __init__(self, control: int, target: int, phase: FractionLike) -> None:
        self.target = target
        self.control = control
        self.phase = phase

    def to_basic_gates(self):
        return [ZPhase(self.target,Fraction(1,2)),
                CNOT(self.control,self.target)] + \
               U3(self.target,-self.phase/2,0,0).to_basic_gates() + \
               [CNOT(self.control,self.target)] + \
               U3(self.target,self.phase/2,Fraction(-1,2),0).to_basic_gates()

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class CRY(Gate):
    name = 'CRY'
    qasm_name = 'cry'
    print_phase = True
    def __init__(self, control: int, target: int, phase: FractionLike) -> None:
        self.target = target
        self.control = control
        self.phase = phase

    def to_basic_gates(self):
        return YPhase(self.target,self.phase/2).to_basic_gates() + \
               [CNOT(self.control,self.target)] + \
               YPhase(self.target,-self.phase/2).to_basic_gates() + \
               [CNOT(self.control,self.target)]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class CRZ(Gate):
    name = 'CRZ'
    qasm_name = 'crz'
    print_phase = True
    def __init__(self, control: int, target: int, phase: FractionLike) -> None:
        self.target = target
        self.control = control
        self.phase = phase

    def to_basic_gates(self):
        phase1 = self.phase / 2
        phase2 = -self.phase / 2
        try:
            phase1 = Fraction(phase1) % 2
            phase2 = Fraction(phase2) % 2
        except Exception:
            pass
        return [ZPhase(self.target, phase1),
                CNOT(self.control, self.target),
                ZPhase(self.target, phase2),
                CNOT(self.control, self.target)]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class RXX(Gate):
    name = 'RXX'
    qasm_name = 'rxx'
    print_phase = True
    def __init__(self, control: int, target: int, phase: FractionLike) -> None:
        self.target = target
        self.control = control
        self.phase = phase

    def to_basic_gates(self):
        return U3(self.control,Fraction(1,2),self.phase,0).to_basic_gates() + \
               [HAD(self.target),
                CNOT(self.control,self.target),
                ZPhase(self.target,-self.phase),
                CNOT(self.control,self.target),
                HAD(self.target)] + \
               U2(self.control,Fraction(-1,1),(Fraction(1,1)-self.phase)%2).to_basic_gates()

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class RZZ(Gate):
    name = 'RZZ'
    qasm_name = 'rzz'
    print_phase = True
    def __init__(self, control: int, target: int, phase: FractionLike) -> None:
        self.target = target
        self.control = control
        self.phase = phase

    def to_basic_gates(self):
        return [CNOT(control=self.control,target=self.target),
                ZPhase(self.target,phase=self.phase),
                CNOT(control=self.control,target=self.target)]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class CPhase(CRZ):
    name = 'CPhase'
    qasm_name = 'cp'

    def to_basic_gates(self):
        phase1 = self.phase / 2
        phase2 = -self.phase / 2
        try:
            phase1 = Fraction(phase1) % 2
            phase2 = Fraction(phase2) % 2
        except Exception:
            pass
        return [ZPhase(self.control, phase1),
                CNOT(self.control, self.target),
                ZPhase(self.target, phase2),
                CNOT(self.control, self.target),
                ZPhase(self.target, phase1)]

class CHAD(Gate):
    name = 'CHAD'
    qasm_name = 'ch'
    quipper_name = 'undefined'

    def __init__(self, control: int, target: int) -> None:
        self.target = target
        self.control = control

    def to_basic_gates(self):
        return [HAD(self.target),S(self.target,adjoint=True),
                CNOT(self.control,self.target),
                HAD(self.target),T(self.target),
                CNOT(self.control,self.target),
                T(self.target),HAD(self.target),S(self.target),NOT(self.target),S(self.control)]


    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class ParityPhase(Gate):
    name = 'ParityPhase'
    print_phase = True
    def __init__(self, phase: FractionLike, *targets: int):
        self.targets = targets
        self.phase = phase

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, ParityPhase): return False
        if self.index != other.index: return False
        if set(self.targets) == set(other.targets) and self.phase == other.phase:
            return True
        return False

    def __str__(self) -> str:
        return "ParityPhase({!s}, {!s})".format(self.phase, ", ".join(str(t) for t in self.targets))

    def _max_target(self) -> int:
        return max(self.targets)

    def reposition(self, mask, bit_mask = None):
        g = self.copy()
        g.targets = [mask[t] for t in g.targets]
        return g

    def to_basic_gates(self):
        cnots = [CNOT(self.targets[i],self.targets[i+1]) for i in range(len(self.targets)-1)]
        p = ZPhase(self.targets[-1], self.phase)
        return cnots + [p] + list(reversed(cnots))

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

    def tcount(self):
        return 1 if self.phase.denominator > 2 else 0


class FSim(Gate):
    name = 'FSim'
    qsim_name = 'fs'
    print_phase = True
    def __init__(self, control:int, target:int, theta:FractionLike, phi:FractionLike):
        self.control = control
        self.target = target
        self.theta = theta
        self.phi = phi

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, FSim): return False
        if self.index != other.index: return False
        if (self.control == other.control and self.target == other.target and
            self.theta == other.theta and self.phi == other.phi):
            return True
        return False

    def __str__(self) -> str:
        return "FSim({!s}, {!s}, {!s}, {!s})".format(self.control, self.target, self.theta, self.phi)

    def reposition(self, mask, bit_mask = None):
        g = self.copy()
        g.targets = [mask[t] for t in g.targets]
        return g

    def to_basic_gates(self):
        # TODO
        #cnots = [CNOT(self.targets[i],self.targets[i+1]) for i in range(len(self.targets)-1)]
        #p = ZPhase(self.targets[-1], self.phase)
        return [self]

    def to_graph(self, g, q_mapper, _c_mapper):
        # TODO: this version assumes theta is always (pi/2)
        r = max(q_mapper.next_row(self.target), q_mapper.next_row(self.control))
        qmin = min(self.target,self.control)
        c0 = self.graph_add_node(g, q_mapper, VertexType.Z, self.control,r)
        t0 = self.graph_add_node(g, q_mapper, VertexType.Z, self.target,r)
        c = g.add_vertex(VertexType.Z, self.control, r+1)
        t = g.add_vertex(VertexType.Z, self.target, r+1)
        g.add_edge((c0, t))
        g.add_edge((t0, c))
        q_mapper.set_prev_vertex(self.control, c)
        q_mapper.set_prev_vertex(self.target, t)

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

        q_mapper.shift_all_rows(4)
        g.scalar.add_power(1)

        # c1 = self.graph_add_node(g, q_mapper, VertexType.Z, self.control,r)
        # t1 = self.graph_add_node(g, q_mapper, VertexType.Z, self.target,r)
        # c2 = self.graph_add_node(g, q_mapper, VertexType.Z, self.control,r+1)
        # t2 = self.graph_add_node(g, q_mapper, VertexType.Z, self.target,r+1)
        
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

        # q_mapper.shift_all_rows(5)

        #h = g.add_vertex(VertexType.H_BOX, qmin + 0.5, r + 0.5)
        #g.add_edge((t,h),EdgeType.SIMPLE)
        #g.add_edge((c1,h),EdgeType.SIMPLE)
        #g.add_edge((c2,h),EdgeType.SIMPLE)
        
        #rs[self.target] = r+4
        #rs[self.control] = r+4

        # TODO
        #for gate in self.to_basic_gates():
        #    gate.to_graph(g, q_mapper, c_mapper)

    def tcount(self):
        # TODO
        return 0 #1 if self.phase.denominator > 2 else 0

class CCZ(Gate):
    name = 'CCZ'
    qasm_name = 'ccz'
    qc_name = 'Z'
    quipper_name = 'Z'
    def __init__(self, ctrl1: int, ctrl2: int, target: int):
        self.target = target
        self.ctrl1 = ctrl1
        self.ctrl2 = ctrl2
    def __str__(self) -> str:
        return "{}(c1={!s},c2={!s},t={!s})".format(self.name,self.ctrl1,self.ctrl2,self.target)
    def __eq__(self, other: object) -> bool:
        if not isinstance(other, CCZ): return False
        if self.index != other.index: return False
        if set([self.target,self.ctrl1,self.ctrl2]) == set([other.target,other.ctrl1,other.ctrl2]):
            return True
        return False

    def _max_target(self):
        return max([self.target,self.ctrl1,self.ctrl2])

    def tcount(self):
        return 7

    def reposition(self, mask, bit_mask = None):
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

    def to_graph(self, g, q_mapper, _c_mapper):
        # if basic_gates:
        #     for gate in self.to_basic_gates():
        #         gate.to_graph(g, q_mapper, c_mapper)
        # else:
        r = max(q_mapper.next_row(self.target), q_mapper.next_row(self.ctrl1), q_mapper.next_row(self.ctrl2))
        qmin = min(self.target,self.ctrl1,self.ctrl2)
        t = self.graph_add_node(g, q_mapper, VertexType.Z, self.target, r)
        c1 = self.graph_add_node(g, q_mapper, VertexType.Z, self.ctrl1, r)
        c2 = self.graph_add_node(g, q_mapper, VertexType.Z, self.ctrl2, r)
        h = g.add_vertex(VertexType.H_BOX, qmin + 0.5, r + 0.5)
        g.add_edge((t,h),EdgeType.SIMPLE)
        g.add_edge((c1,h),EdgeType.SIMPLE)
        g.add_edge((c2,h),EdgeType.SIMPLE)
        q_mapper.set_next_row(self.target, r+1)
        q_mapper.set_next_row(self.ctrl1, r+1)
        q_mapper.set_next_row(self.ctrl2, r+1)

    def to_quipper(self):
        s = 'QGate["{}"]({!s})'.format(self.quipper_name,self.target)
        s += ' with controls=[+{!s},+{!s}]'.format(self.ctrl1,self.ctrl2)
        s += ' with nocontrol'
        return s

class Tofolli(CCZ):
    name = 'Tof'
    qasm_name = 'ccx'
    qc_name = 'Tof'
    quipper_name = 'not'

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, Tofolli): return False
        if self.index != other.index: return False
        if self.target != other.target: return False
        if set([self.ctrl1,self.ctrl2]) == set([other.ctrl1,other.ctrl2]):
            return True
        return False

    def to_basic_gates(self):
        c1,c2,t = self.ctrl1, self.ctrl2, self.target
        return [HAD(t), CNOT(c2,t), T(t,adjoint=True),
                CNOT(c1,t), T(t),CNOT(c2,t),T(t,adjoint=True),
                CNOT(c1,t), T(c2), T(t), CNOT(c1,c2),T(c1),
                T(c2,adjoint=True),CNOT(c1,c2), HAD(t)]

    def to_graph(self, g, q_mapper, c_mapper):
        t = self.target
        HAD(t).to_graph(g, q_mapper, c_mapper)
        CCZ.to_graph(self, g, q_mapper, c_mapper)
        HAD(t).to_graph(g, q_mapper, c_mapper)

class CSWAP(CCZ):
    name = 'CSWAP'
    qasm_name = 'cswap'

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, CSWAP): return False
        if self.index != other.index: return False
        if self.ctrl1 != other.ctrl1: return False
        if set([self.ctrl2,self.target]) == set([other.ctrl2,other.target]):
            return True
        return False

    def to_basic_gates(self):
        c, t1, t2 = self.ctrl1, self.ctrl2, self.target
        return [CNOT(control=t2,target=t1)] + \
               Tofolli(c,t1,t2).to_basic_gates() + \
               [CNOT(control=t2,target=t1)]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class U2(Gate):  # See https://arxiv.org/pdf/1707.03429.pdf
    name = 'U2'
    qasm_name = 'u2'
    print_phase = True
    def __init__(self, target: int, theta: FractionLike, phi: FractionLike) -> None:
        self.target = target
        self.theta = theta
        self.phi = phi

    def to_basic_gates(self):
        return [ZPhase(self.target,phase=(self.phi-Fraction(1,2))%2),
                XPhase(self.target,phase=Fraction(1,2)),
                ZPhase(self.target,phase=(self.theta+Fraction(1,2))%2)]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class U3(Gate):  # See equation (5) of https://arxiv.org/pdf/1707.03429.pdf
    name = 'U3'
    qasm_name = 'u3'
    print_phase = True
    def __init__(self, target: int, theta: FractionLike, phi: FractionLike, rho: FractionLike) -> None:
        self.target = target
        self.theta = theta
        self.phi = phi
        self.rho = rho

    def to_basic_gates(self):
        return [ZPhase(self.target,phase=self.rho),
                XPhase(self.target,phase=Fraction(1,2)),
                ZPhase(self.target,phase=(self.theta+1)%2),
                XPhase(self.target,phase=Fraction(1,2)),
                ZPhase(self.target,phase=(self.phi+3)%2)]

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class CU3(Gate):
    name = 'CU3'
    qasm_name = 'cu3'
    print_phase = True

    def __init__(self, control: int, target: int, theta: FractionLike, phi: FractionLike, rho: FractionLike) -> None:
        self.control = control
        self.target = target
        self.theta = theta
        self.phi = phi
        self.rho = rho

    def to_basic_gates(self):
        return [ZPhase(self.control,phase=(self.rho+self.phi)/2),
                ZPhase(self.target, phase=(self.rho-self.phi)/2),
                CNOT(self.control,self.target)] + \
               U3(self.target,-self.theta/2,0,-(self.phi+self.rho)/2).to_basic_gates() + \
               [CNOT(self.control, self.target)] + \
               U3(self.target,self.theta/2,self.phi,0).to_basic_gates()

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)


class CU(Gate):
    name = 'CU'
    qasm_name = 'cu'
    print_phase = True

    def __init__(self, control: int, target: int, theta: FractionLike, phi: FractionLike, rho: FractionLike,
            gamma: FractionLike) -> None:
        self.control = control
        self.target = target
        self.theta = theta
        self.phi = phi
        self.rho = rho
        self.gamma = gamma

    def to_basic_gates(self):
        return [ZPhase(self.control,phase=self.gamma)] + \
               CU3(self.control,self.target,self.theta,self.phi,self.rho).to_basic_gates()

    def to_graph(self, g, q_mapper, c_mapper):
        for gate in self.to_basic_gates():
            gate.to_graph(g, q_mapper, c_mapper)

class InitAncilla(Gate):
    name = 'InitAncilla'
    def __init__(self, label):
        self.label = label

class PostSelect(Gate):
    name = 'PostSelect'
    def __init__(self, label):
        self.label = label

    def to_graph(self, g, labels, qs, _cs, rs, _crs):
        v = g.add_vertex(VertexType.Z, self.label, 0)

class DiscardBit(Gate):
    name = 'DiscardBit'
    def __init__(self, target):
        self.target = target

    def reposition(self, _mask, bit_mask = None):
        g = self.copy()
        g.target = bit_mask[g.target]
        return g

    def to_graph(self, g, _q_mapper, c_mapper):
        r = c_mapper.next_row(self.target)
        self.graph_add_node(g,
            c_mapper,
            VertexType.Z,
            self.target,
            r,
            ground=True)
        u = g.add_vertex(VertexType.X, c_mapper.to_qubit(self.target), r+1)
        c_mapper.set_prev_vertex(self.target, u)
        c_mapper.set_next_row(self.target, r+2)

class Measurement(Gate):
    target: int
    result_bit: Optional[int]

    quipper_name = 'measure'
    # This gate has special syntax in qasm: https://qiskit.github.io/openqasm/language/insts.html

    def __init__(self, target: int, result_bit: Optional[int]) -> None:
        self.target = target
        self.result_bit = result_bit

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, Measurement): return False
        if self.target != other.target: return False
        if self.result_bit != other.result_bit: return False
        return False

    def reposition(self, mask, bit_mask = None):
        g = self.copy()
        g.target = mask[self.target]
        if self.result_bit is not None and bit_mask is not None:
            g.result_bit = bit_mask[self.result_bit]
        return g

    def to_graph(self, g, q_mapper, c_mapper):
        # Discard previous bit value
        if self.result_bit is not None:
            DiscardBit(self.result_bit).to_graph(g, q_mapper, c_mapper)
        # Qubit measurement
        r = q_mapper.next_row(self.target)
        if self.result_bit is None:
            r = max(r, c_mapper.next_row(self.result_bit))
        v = self.graph_add_node(g,
            q_mapper,
            VertexType.Z,
            self.target,
            r,
            ground=True)
        q_mapper.set_next_row(self.target, r+1)
        # Classical result
        if self.result_bit is not None:
            u = self.graph_add_node(g,
                c_mapper,
                VertexType.X,
                self.result_bit,
                r)
            g.add_edge(g.edge(v,u), EdgeType.SIMPLE)
            c_mapper.set_next_row(self.result_bit, r+1)

gate_types: Dict[str,Type[Gate]] = {
    "XPhase": XPhase,
    "NOT": NOT,
    "SX": SX,
    "CSX": CSX,
    "YPhase": YPhase,
    "Y": Y,
    "CY": CY,
    "ZPhase": ZPhase,
    "CPhase": CPhase,
    "CP": CPhase,
    "Z": Z,
    "S": S,
    "T": T,
    "CNOT": CNOT,
    "CZ": CZ,
    "ParityPhase": ParityPhase,
    "XCX": XCX,
    "SWAP": SWAP,
    "CSWAP": CSWAP,
    "CRZ": CRZ,
    "HAD": HAD,
    "H": HAD,
    "CHAD": CHAD,
    "TOF": Tofolli,
    "CCZ": CCZ,
    "U2": U2,
    "U3": U3,
    "CU3": CU3,
    "CU": CU,
    "CRX": CRX,
    "CRY": CRY,
    "RZZ": RZZ,
    "RXX": RXX,
    "FSim": FSim,
    "InitAncilla": InitAncilla,
    "PostSelect": PostSelect,
    "DiscardBit": DiscardBit,
    "Measurement": Measurement,
}

qasm_gate_table: Dict[str, Type[Gate]] = {
    "x": NOT,
    "y": Y,
    "z": Z,
    "s": S,
    "t": T,
    "sdg": S,
    "tdg": T,
    "sx": SX,
    "sxdg": SX,
    "csx": CSX,
    "h": HAD,
    "rx": XPhase,
    "ry": YPhase,
    "rz": ZPhase,
    "cp": CPhase,
    "cphase": CPhase,
    "cu1": CPhase,
    "p": ZPhase,
    "u1": ZPhase,
    "u2": U2,
    "u3": U3,
    "cu3": CU3,
    "cu": CU,
    "cx": CNOT,
    "CX": CNOT,  # needed for backwards compatibility with older versions of qiskit
    "cy": CY,
    "cz": CZ,
    "ch": CHAD,
    "crx": CRX,
    "cry": CRY,
    "crz": CRZ,
    "rxx": RXX,
    "rzz": RZZ,
    "ccx": Tofolli,
    "ccz": CCZ,
    "swap": SWAP,
    "cswap": CSWAP,
    "measure": Measurement,
}
