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

from .circuit import Circuit, ZPhase, CNOT, CZ, ParityPhase, NOT, HAD, SWAP, S, Z
from .extract import permutation_as_swaps

def toggle_element(l, e):
    if e in l: l.remove(e)
    else: l.append(e)

def swap_element(l, e1, e2):
    if e1 in l and e2 not in l:
        l.remove(e1)
        l.append(e2)
    elif e2 in l and e1 not in l:
        l.remove(e2)
        l.append(e1)

def stats(circ):
    two_qubit = 0
    had = 0
    non_pauli = 0
    for g in circ.gates:
        if g.name in ('CZ', 'CNOT'):
            two_qubit += 1
        elif g.name == 'HAD':
            had += 1
        elif g.name != 'NOT' and g.phase != 1:
            non_pauli += 1
    return had, two_qubit, non_pauli

class Optimizer:
    def __init__(self, circuit):
        self.circuit = circuit
        self.qubits = circuit.qubits
        self.minimize_czs = False
    
    def parse_circuit(self, max_iterations=1000):
        self.minimize_czs = False
        self.circuit = self.parse_forward()
        count = stats(self.circuit)
        i = 0
        while True:
            self.circuit.gates = list(reversed(self.circuit.gates))
            self.circuit = self.parse_forward()
            self.circuit.gates = list(reversed(self.circuit.gates))
            self.circuit = self.parse_forward()
            i += 1
            s = stats(self.circuit)
            if self.minimize_czs and (all(s1<=s2 for s1,s2 in zip(count,s)) or i>=max_iterations): break
            count = s
            self.minimize_czs = True
        for g in self.circuit.gates: g.index = 0
        return self.circuit
    
    def parse_forward(self):
        self.gates = {i:list() for i in range(self.qubits)}
        self.available = {i:list() for i in range(self.qubits)}
        self.availty = {i: 1 for i in range(self.qubits)}
        self.hadamards = []
        self.nots = []
        self.zs = []
        self.permutation = {i:i for i in range(self.qubits)}
        self.gcount = 0
        for g in self.circuit.gates:
            self.parse_gate(g)
            #if any(gs!=list(sorted(gs,key=lambda g: g.index)) for gs in self.gates.values()):
            #    print("Errawrrr")
            #    for gs in self.gates.values():
            #        print([g.index for g in gs])
        for t in self.hadamards.copy():
            self.add_hadamard(t)
        for t in self.zs:
            z = Z(t)
            z.index = self.gcount
            self.gcount += 1
            self.gates[t].append(z)
        for t in self.nots:
            n = NOT(t)
            n.index = self.gcount
            self.gcount += 1
            self.gates[t].append(n)
        
        c = Circuit(self.qubits)
        #indices = []
        for gs in self.gates.values():
            for g in gs:
                if g not in c.gates:
                    c.gates.append(g)
#                 if g.index not in indices:
#                     indices.append(g.index)
#                     c.gates.append(g)
        c.gates.sort(key = lambda g: g.index)
        swaps = permutation_as_swaps(self.permutation)
        for a,b in swaps:
            c.gates.extend(SWAP(a,b).to_basic_gates())
        return c
    
    def add_hadamard(self, t):
        h = HAD(t)
        h.index = self.gcount
        self.gates[t].append(h)
        self.gcount += 1
        self.hadamards.remove(t)
        self.available[t] = list()
        self.availty[t] = 1
    
    def add_gate(self, t, g):
        g.index = self.gcount
        self.gcount += 1
        self.gates[t].append(g)
        self.available[t].append(g)
    
    def add_cz(self, cz):
        t1, t2 = cz.control, cz.target
        #We first try to find a matching CNOT gate
        found_match = False
        if self.minimize_czs:
            for c,t in [(t1,t2),(t2,t1)]:
                for g in self.available[c]:
                    if g.name == 'CNOT' and g.control == c and g.target == t:
                        if self.availty[t] == 2:
                            if g in self.available[t]:
                                found_match = True
                                break
                            else:
                                continue
                        for h in list(reversed(self.gates[t][:-len(self.available[t])])):
                            if h == g:
                                found_match = True
                                break
                            if h.name != 'CNOT' or h.target != t:
                                break
                        if found_match: break
                if found_match: break
        if found_match: #CNOT-CZ = (S* x id)CNOT (S x S)
            #print("Match!")
            #print(cz, g)
            t,c = g.target, g.control
            #print(self.available[t], self.available[c])
            #print(self.gates[t], self.gates[c])
            if self.availty[t] == 2:
                self.availty[t] == 1
                self.available[t] = []
            self.gates[t].remove(g)
            self.gates[c].remove(g)
            self.available[c].remove(g)
            s1 = S(t, adjoint=True)
            if self.available[t]:
                s1.index = self.available[t][0].index-0.3
                g.index = self.available[t][0].index-0.2
                self.gates[t].insert(-len(self.available[t]),s1)
                self.gates[t].insert(-len(self.available[t]),g)
            else: 
                s1.index = self.gcount
                self.gcount += 1
                self.gates[t].append(s1)
                g.index = self.gcount
                self.gcount += 1
                self.gates[t].append(g)
            s2 = S(t)
            s2.index = self.gcount
            self.gcount += 1
            self.gates[t].append(s2)
            self.available[t].append(s2)
            s3 = S(c)
            s3.index = self.gcount
            self.gcount += 1
            self.available[c].append(g)
            self.available[c].append(s3)
            self.gates[c].append(g)
            self.gates[c].append(s3)
            #print(self.available[t], self.available[c])
            #print(self.gates[t], self.gates[c])
            #print([g.index for g in self.gates[t]], [g.index for g in self.gates[c]])
            return
        if self.availty[t1] == 2:
            self.available[t1] = list()
            self.availty[t1] = 1
        if self.availty[t2] == 2:
            self.available[t2] = list()
            self.availty[t2] = 1
        found_match = False
        for g in reversed(self.available[t1]):
            if g.name == 'CZ' and g.control == t1 and g.target == t2:
                found_match = True
                break
        if found_match:
            if g not in self.available[t2]:
                found_match = False
            else:
                self.available[t1].remove(g)
                self.gates[t1].remove(g)
                self.available[t2].remove(g)
                self.gates[t2].remove(g)
                #self.detect_available(t1)
                #self.detect_available(t2)
        if not found_match:
            cz.index = self.gcount
            self.gcount += 1
            self.gates[t1].append(cz)
            self.gates[t2].append(cz)
            self.available[t1].append(cz)
            self.available[t2].append(cz)
    
    def add_cnot(self, cnot):
        c, t = cnot.control, cnot.target
        if self.availty[c] == 2:
            if self.availty[t] == 1: # Try to find anti-match
                found_match = False
                for g in reversed(self.available[c]):
                    if g.name == 'CNOT' and g.control == t and g.target == c:
                        found_match = True
                        break
                if found_match: # We're adding a swap gate
                    #print("swap gate boom")
                    if g in self.available[t]:
                        self.gates[c].remove(g)
                        self.gates[t].remove(g)
                        self.availty[c] = 1
                        self.availty[t] = 2
                        cnot.index = self.gcount
                        self.gcount += 1
                        self.gates[c].append(cnot)
                        self.gates[t].append(cnot)
                        self.available[c] = [cnot]
                        self.available[t] = [cnot]
                        a = self.permutation[c]
                        b = self.permutation[t]
                        self.permutation[c] = b
                        self.permutation[t] = a
                        swap_element(self.hadamards, t, c)
                        swap_element(self.nots, t, c)
                        swap_element(self.zs, t, c)
                        return
                
            self.available[c] = list()
            self.availty[c] = 1
        if self.availty[t] == 1:
            self.available[t] = list()
            self.availty[t] = 2
        found_match = False
        for g in reversed(self.available[c]):
            if g.name == 'CNOT' and g.control == c and g.target == t:
                found_match = True
                break
        if found_match:
            if g not in self.available[t]:
                found_match = False
            else:
                self.available[c].remove(g)
                self.gates[c].remove(g)
                self.available[t].remove(g)
                self.gates[t].remove(g)
                self.detect_available(c)
                self.detect_available(t)
                
        if not found_match:
            cnot.index = self.gcount
            self.gcount += 1
            self.gates[c].append(cnot)
            self.gates[t].append(cnot)
            self.available[c].append(cnot)
            self.available[t].append(cnot)
    
    def detect_available(self, t):
        pass
    
    def parse_gate(self, g):
        g = g.copy()
        g.target = next(i for i in self.permutation if self.permutation[i] == g.target)
        t = g.target
        if g.name in ('CZ', 'CNOT'):
            g.control = next(i for i in self.permutation if self.permutation[i] == g.control)
        if g.name == 'HAD':
            if t in self.nots and t not in self.zs:
                self.nots.remove(t)
                self.zs.append(t)
            elif t in self.zs and t not in self.nots:
                self.zs.remove(t)
                self.nots.append(t)
            if len(self.gates[t])>1 and self.gates[t][-2].name == 'HAD' and isinstance(self.gates[t][-1], ZPhase):
                    g2 = self.gates[t][-1]
                    if g2.phase.denominator == 2:
                        h = self.gates[t][-2]
                        zp = ZPhase(t, (-g2.phase)%2)
                        zp.index = h.index-0.5
                        self.gcount += 1
                        g2.phase = zp.phase
                        self.gates[t].insert(-2,zp)
                        return
            toggle_element(self.hadamards, t)
        elif g.name == 'NOT':
            toggle_element(self.nots, t)
        elif isinstance(g, ZPhase):
            if t in self.zs:
                g.phase = (g.phase+1)%2
                self.zs.remove(t)
            if g.phase == 0: return
            if t in self.nots:
                g.phase = (-g.phase)%2
            if g.phase == 1:
                toggle_element(self.zs, t)
                return
            if t in self.hadamards:
                self.add_hadamard(t)
            if self.availty[t] == 1 and any(isinstance(g2, ZPhase) for g2 in self.available[t]):
                i = next(i for i,g2 in enumerate(self.available[t]) if isinstance(g2, ZPhase))
                g2 = self.available[t].pop(i)
                self.gates[t].remove(g2)
                phase = (g.phase+g2.phase)%2
                if phase == 1:
                    toggle_element(self.zs, t)
                    return
                if phase != 0:
                    p = ZPhase(t, phase)
                    self.add_gate(t,p)
            else:
                if self.availty[t] == 2:
                    self.availty[t] = 1
                    self.available[t] = list()
                self.add_gate(t, g)
        elif g.name == 'CZ':
            t1, t2 = g.control, g.target
            if t1 > t2:
                g.target = t1
                g.control = t2
            if t1 in self.nots:
                toggle_element(self.zs, t2)
            if t2 in self.nots:
                toggle_element(self.zs, t1)
            if t1 in self.hadamards and t2 in self.hadamards:
                self.add_hadamard(t1)
                self.add_hadamard(t2)
            if t1 not in self.hadamards and t2 not in self.hadamards:
                self.add_cz(g)
            # Exactly one of t1 and t2 has a hadamard
            elif t1 in self.hadamards:
                cnot = CNOT(t2, t1)
                self.add_cnot(cnot)
            else:
                cnot = CNOT(t1, t2)
                self.add_cnot(cnot)
            
        elif g.name == 'CNOT':
            c, t = g.control, g.target
            if c in self.nots:
                toggle_element(self.nots, t)
            if t in self.zs:
                toggle_element(self.zs, c)
            if c in self.hadamards and t in self.hadamards:
                g.control = t
                g.target = c
                self.add_cnot(g)
            elif c not in self.hadamards and t not in self.hadamards:
                self.add_cnot(g)
            elif t in self.hadamards:
                cz = CZ(c if c<t else t, c if c>t else t)
                self.add_cz(cz)
            else: # Only the control has a hadamard gate in front of it
                self.add_hadamard(c)
                self.add_cnot(g)
        
        else:
            raise TypeError("Unknown gate {}".format(str(g)))