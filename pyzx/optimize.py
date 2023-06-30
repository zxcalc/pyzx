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

"""This module implements several optimization methods on ``Circuit``\ s. 
The function :func:`basic_optimization` runs a set of back-and-forth gate commutation and cancellation routines.
:func:`phase_block_optimize` does phase polynomial optimization using the TODD algorithm,
and :func:`full_optimize` combines these two methods."""

from typing import overload, Tuple, List, Union, Dict, Set
from typing_extensions import Literal

from .circuit import Circuit
from .circuit.gates import Gate, ZPhase, XPhase, CNOT, CZ, ParityPhase, NOT, HAD, SWAP, S, Z
from .extract import permutation_as_swaps
from .todd import todd_simp

__all__ = ['full_optimize', 'basic_optimization', 'phase_block_optimize']

def full_optimize(circuit: Circuit, quiet:bool=True) -> Circuit:
    """Optimizes the circuit using first some basic commutation and cancellation rules,
    and then a dedicated phase polynomial optimization strategy involving the TODD algorithm.

    Args:
        circuit: Circuit to be optimized.
        quiet: Whether to print some progress indicators."""
    c = basic_optimization(circuit.to_basic_gates())
    c = phase_block_optimize(c, quiet=quiet)
    return basic_optimization(c.to_basic_gates())

def basic_optimization(circuit: Circuit, do_swaps:bool=True, quiet:bool=True) -> Circuit:
    """Optimizes the circuit using a strategy that involves delayed placement of gates
    so that more matches for gate cancellations are found. Specifically tries to minimize
    the number of Hadamard gates to improve the effectiveness 
    of phase-polynomial optimization techniques.

    Args:
        circuit: Circuit to be optimized.
        do_swaps: When set uses some rules transforming CNOT gates into SWAP gates. Generally leads to better results, but messes up architecture-aware placement of 2-qubit gates.
        quiet: Whether to print some progress indicators.
    """
    if not isinstance(circuit, Circuit):
        raise TypeError("Input must be a Circuit")
    o = Optimizer(circuit)
    return o.parse_circuit(do_swaps=do_swaps,quiet=quiet)

def toggle_element(l:list, e:object) -> None:
    if e in l: l.remove(e)
    else: l.append(e)

def swap_element(l:list, e1:object, e2:object) -> None:
    if e1 in l and e2 not in l:
        l.remove(e1)
        l.append(e2)
    elif e2 in l and e1 not in l:
        l.remove(e2)
        l.append(e1)

def stats(circ: Circuit) -> Tuple[int,int,int]:
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

class Optimizer(object):
    """Helper class that implements the optimizations of :func:`basic_optimization`.
    Works by doing alternating forward and backward 'passes' through a circuit.
    During a pass, we iteratively consume gates, while 
    keeping track of a stack of mutually commuting gates on each qubit.
    When the gate can be combined with a gate on the stack, this is done.
    If it doesn't combine, but commutes with the gates on the stack, it is added to the stack.
    If it doesn't commute, the stack is reset."""
    def __init__(self, circuit: Circuit) -> None:
        self.circuit: Circuit = circuit
        self.qubits: int = circuit.qubits
        self.minimize_czs: bool = False
        self.do_swaps: bool = True
    
    @overload
    def parse_circuit(self, 
            separate_correction:Literal[False]=False, 
            max_iterations:int=1000, 
            do_swaps:bool=True, 
            quiet:bool=True) -> Circuit: pass

    @overload
    def parse_circuit(self, 
            separate_correction:Literal[True], 
            max_iterations:int=1000, 
            do_swaps:bool=True, 
            quiet:bool=True) -> Tuple[Circuit, List[Gate]]: pass

    def parse_circuit(self, 
            separate_correction:bool=False, 
            max_iterations:int=1000, 
            do_swaps:bool=True, 
            quiet:bool=True
            ) -> Union[Circuit, Tuple[Circuit, List[Gate]]]:
        """Repeatedly does forward and backward passes trough the circuit, 
        until no more improvements are found.
        When ``separate_correction`` is True, it returns the list of NOT, Z and SWAP gates that is 
        has collected at the end separately.

        When ``do_swaps`` is set to False, it does not apply the rule 
        CNOT(r1,r2)CNOT(r2,r1) = CNOT(r1,r2)SWAP, so that the connectivity of the circuit is preserved,
        in case the circuit already had been mapped."""
        self.do_swaps = do_swaps
        self.minimize_czs = False
        self.circuit, correction = self.parse_forward()
        count = stats(self.circuit)
        for g in correction: self.circuit.gates.extend(g.to_basic_gates())
        i = 0
        while True:
            self.circuit.gates = list(reversed(self.circuit.gates))
            self.circuit, correction = self.parse_forward()
            for g in correction: self.circuit.gates.extend(g.to_basic_gates())
            self.circuit.gates = list(reversed(self.circuit.gates))
            self.circuit, correction = self.parse_forward()
            i += 1
            s = stats(self.circuit)
            if self.minimize_czs and (all(s1<=s2 for s1,s2 in zip(count,s)) or i>=max_iterations): break
            for g in correction: self.circuit.gates.extend(g.to_basic_gates())
            if not quiet:
                print(i, end='.')
            count = s
            self.minimize_czs = True
        for g in self.circuit.gates: g.index = 0
        if not separate_correction:
            for g in correction: self.circuit.gates.extend(g.to_basic_gates())
            return self.circuit
        else:
            return self.circuit, correction
    
    def parse_forward(self) -> Tuple[Circuit, List[Gate]]:
        """Does a single forward pass trough self.circuit.gates."""
        self.gates: Dict[int,List[Gate]] = {i:list() for i in range(self.qubits)}
        self.available: Dict[int,List[Gate]] = {i:list() for i in range(self.qubits)}
        self.availty = {i: 1 for i in range(self.qubits)}
        self.hadamards: List[int] = []
        self.nots: List[int] = []
        self.zs: List[int] = []
        self.permutation = {i:i for i in range(self.qubits)}
        self.gcount = 0
        for g in self.circuit.gates:
            self.parse_gate(g)
        for t in self.hadamards.copy():
            self.add_hadamard(t)
        for t in self.zs:
            z = Z(t)
            z.index = self.gcount
            self.gcount += 1
            self.gates[t].append(z)
        # for t in self.nots:
        #     n = NOT(t)
        #     #correction.append(n)
        #     n.index = self.gcount
        #     self.gcount += 1
        #     self.gates[t].append(n)
        
        c = Circuit(self.qubits)
        c.gates = self.topological_sort_gates()
        
        correction: List[Gate] = []
        for t in self.nots:
            n = NOT(t)
            correction.append(n)
            # n.index = self.gcount
            # self.gcount += 1
            # self.gates[t].append(n)
        swaps = permutation_as_swaps(self.permutation)
        for a,b in swaps:
            correction.append(SWAP(a,b))
            #c.gates.extend(SWAP(a,b).to_basic_gates())
        return c, correction

    def topological_sort_gates(self) -> List[Gate]:
        """self.gates is a a {qubit:[list of gates]} dictionary. This function consumes this dictionary and outputs a
        single list of gates, with the gates in the correct order.
        Note that 2-qubit gates are present in two entries in the dictionary and are identified with an ``index`` parameter."""
        output = []
        while any(self.gates.values()):
            available_indices: Set[int] = set()
            for q, gs in self.gates.items():
                while gs:
                    g = gs[0]
                    if g.name not in ('CZ', 'CNOT'):
                        output.append(gs.pop(0))
                    elif g.index in available_indices:
                        available_indices.remove(g.index)
                        q2 = g.target if q == g.control else g.control
                        self.gates[q2].remove(g)
                        output.append(gs.pop(0))
                    else:
                        ty = 1 if (g.name == 'CZ' or g.control == q) else 2
                        available_indices.add(g.index)
                        remove = []
                        for i, g2 in enumerate(gs[1:]):
                            if (ty == 1 and isinstance(g2, ZPhase)) or (ty == 2 and isinstance(g2, XPhase)):
                                output.append(g2)
                                remove.append(i)
                            elif g2.name not in ('CZ', 'CNOT'): break
                            elif ((ty == 1 and (g2.name == 'CZ' or g2.control == q)) or
                                  (ty == 2 and g2.name == 'CNOT' and g2.target == q)):
                                if g2.index in available_indices:
                                    available_indices.remove(g2.index)
                                    q2 = g2.target if q == g2.control else g2.control
                                    self.gates[q2].remove(g2)
                                    output.append(g2)
                                    remove.append(i)
                                else:
                                    available_indices.add(g2.index)
                            else:
                                break
                        for i in reversed(remove):
                            gs.pop(i+1)
                        break
        return output

    
    def add_hadamard(self, t: int) -> None:
        """Called by ``parse_gate`` to add a Hadamard gate to the output."""
        h = HAD(t)
        h.index = self.gcount
        self.gcount += 1
        self.gates[t].append(h)
        self.hadamards.remove(t)
        self.available[t] = list()
        self.availty[t] = 1
    
    def add_gate(self, t: int, g: Gate) -> None:
        """Helper function for ``add_cz`` and ``add_cnot`` to add a single qubit gate to the output."""
        g.index = self.gcount
        self.gcount += 1
        self.gates[t].append(g)
        self.available[t].append(g)
    
    def add_cz(self, cz: CZ) -> None:
        """Called by ``parse_gate`` to add a CZ gate to the output.
        Does some non-trivial logic to see whether the CZ-gate can be cancelled against a CNOT or CZ gate."""
        t1, t2 = cz.control, cz.target
        #We first try to find a matching CNOT gate
        found_match = False
        if self.minimize_czs:
            for c,t in [(t1,t2),(t2,t1)]:
                for g in self.available[c]:
                    if g.name == 'CNOT' and g.control == c and g.target == t:
                        if self.availty[t] == 2:
                            if g in self.available[t]: # The gate is also available on the target qubit
                                found_match = True
                                break
                            else:
                                continue
                        # There are Z-like gates blocking the CNOT from usage
                        # But if the CNOT can be passed all the way up to these Z-like gates
                        # Then we can commute the CZ gate next to the CNOT and hence use it.
                        for h in list(reversed(self.gates[t][:-len(self.available[t])])): # We start looking at the gates behind the Z-like gates
                            if h.name != 'CNOT' or h.target != t: # If any of those gates is not a CNOT of the right type, then we stop our search
                                break
                            if h == g: # But if all the previous gates are fine, than we can use this CNOT.
                                found_match = True
                                break
                        if found_match: break
                if found_match: break
        if found_match: #CNOT-CZ = (S* x id)CNOT (S x S)
            t,c = g.target, g.control
            if self.availty[t] == 2:
                self.availty[t] == 1
                self.available[t] = []
            self.gates[t].remove(g)
            self.gates[c].remove(g)
            self.available[c].remove(g)
            s1 = S(t, adjoint=True)
            s1.index = self.gcount
            self.gcount += 1
            if self.available[t]: # There are gates of non-commuting type on this qubit
                self.gates[t].insert(-len(self.available[t]),s1) # And hence we must insert these gates at
                self.gates[t].insert(-len(self.available[t]),g)  # the correct location
            else: 
                self.gates[t].append(s1)
                self.gates[t].append(g)
            s2 = S(t)
            s2.index = self.gcount
            self.gcount += 1
            self.gates[t].append(s2) # In contrast, these gates appear after the CNOT, necessarily on Z-like phases
            self.available[t].append(s2) # and hence can be added at the end of the list
            s3 = S(c)
            s3.index = self.gcount
            self.gcount += 1
            self.available[c].append(g)
            self.available[c].append(s3)
            self.gates[c].append(g)
            self.gates[c].append(s3)
            return

        if self.availty[t1] == 2:
            self.available[t1] = list()
            self.availty[t1] = 1
        if self.availty[t2] == 2:
            self.available[t2] = list()
            self.availty[t2] = 1

        found_match = False
        for g in reversed(self.available[t1]): # We try to find a CZ with the same control and target
            if g.name == 'CZ' and g.control == t1 and g.target == t2: # Here it is important that we have normalised all CZs
                found_match = True                                    # to have cz.control<cz.target
                break
        if found_match:
            if g not in self.available[t2]: # We still need to check if the CZ is actually available on the other qubit
                found_match = False
            else:
                self.available[t1].remove(g)
                self.gates[t1].remove(g)
                self.available[t2].remove(g)
                self.gates[t2].remove(g)

        if not found_match: # No cancellation found, so we just add the gate
            cz.index = self.gcount
            self.gcount += 1
            self.gates[t1].append(cz)
            self.gates[t2].append(cz)
            self.available[t1].append(cz)
            self.available[t2].append(cz)
    
    def add_cnot(self, cnot: CNOT) -> None:
        """Called by ``parse_gate`` to parse a CNOT gate.
        Does some non-trivial logic to see whether the CNOT gate can be cancelled against another CNOT gate on the same qubits."""
        c, t = cnot.control, cnot.target
        if self.availty[c] == 2:
            if self.availty[t] == 1: # Try to find anti-match
                found_match = False
                for g in reversed(self.available[c]):
                    if g.name == 'CNOT' and g.control == t and g.target == c:
                        found_match = True
                        break
                if found_match and self.do_swaps: # We do the CNOT(t,c)CNOT(c,t) = CNOT(c,t)SWAP(c,t) commutation
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
        if found_match: # We do CNOT(c,t)CNOT(c,t) = id
            if g not in self.available[t]:
                found_match = False
            else:
                self.available[c].remove(g)
                self.gates[c].remove(g)
                self.available[t].remove(g)
                self.gates[t].remove(g)
                
        if not found_match:
            cnot.index = self.gcount
            self.gcount += 1
            self.gates[c].append(cnot)
            self.gates[t].append(cnot)
            self.available[c].append(cnot)
            self.available[t].append(cnot)
    
    def parse_gate(self, g: Gate) -> None:
        """The main function of the optimization. It records whether a gate needs to be placed at the specified location
        'right now', or whether we can postpone the placement until hopefully it is cancelled against some future gate.
        Only supports ZPhase, HAD, CNOT and CZ gates. """
        g = g.copy()
        # If we have some SWAPs recorded we need to change the target/control of the gate accordingly
        g.target = next(i for i in self.permutation if self.permutation[i] == g.target)
        t = g.target
        if g.name in ('CZ', 'CNOT'):
            g.control = next(i for i in self.permutation if self.permutation[i] == g.control)

        if g.name == 'HAD':
            # If we have recorded a NOT or Z gate at the target location, we push it trough the Hadamard and change the type
            if t in self.nots and t not in self.zs:
                self.nots.remove(t)
                self.zs.append(t)
            elif t in self.zs and t not in self.nots:
                self.zs.remove(t)
                self.nots.append(t)
            # See whether we have a HAD-S-HAD situation
            # And turn it into a S*-HAD-S* situation
            if len(self.gates[t])>1 and self.gates[t][-2].name == 'HAD' and isinstance(self.gates[t][-1], ZPhase):
                    g2 = self.gates[t][-1]
                    if g2.phase.denominator == 2:
                        h = self.gates[t][-2]
                        zp = ZPhase(t, (-g2.phase)%2)
                        zp.index = self.gcount
                        self.gcount += 1
                        g2.phase = zp.phase
                        if g2.name == 'S' and g2.phase.numerator > 1:
                            g2.adjoint = True
                        self.gates[t].insert(-2,zp)
                        return
            toggle_element(self.hadamards, t)
        elif g.name == 'NOT':
            toggle_element(self.nots, t)
        elif isinstance(g, ZPhase):
            if t in self.zs: #Consume a Z gate into the phase gate
                g.phase = (g.phase+1)%2
                self.zs.remove(t)
            if g.phase == 0: return
            if t in self.nots: # Push the phase gate trough a NOT
                g.phase = (-g.phase)%2
            if g.phase == 1: # If the resulting phase is a pi, then we record it as a Z gate
                toggle_element(self.zs, t)
                return
            if g.name == 'S':                           # We might have changed the phase, and therefore
                g.adjoint = g.phase.numerator != 1      # Need to adjust whether the adjoint is true
            if t in self.hadamards: # We can't push a phase gate trough a HAD, so we actually place the HAD down
                self.add_hadamard(t)
            if self.availty[t] == 1 and any(isinstance(g2, ZPhase) for g2 in self.available[t]): # There is an available phase gate
                i = next(i for i,g2 in enumerate(self.available[t]) if isinstance(g2, ZPhase))   # That we can fuse with the new one
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
                if self.availty[t] == 2: # If previous gate was of X-type
                    self.availty[t] = 1  # We reset the available gates on this qubit
                    self.available[t] = list()
                self.add_gate(t, g)
        elif g.name == 'CZ':
            t1, t2 = g.control, g.target
            if t1 > t2: # Normalise so that always g.target<g.control (since CZs are symmetric anyway)
                g.target = t1
                g.control = t2
            # Push NOT gates trough the CZ
            if t1 in self.nots: 
                toggle_element(self.zs, t2)
            if t2 in self.nots:
                toggle_element(self.zs, t1)
            # If there are HADs on both targets, we cannot commute the CZ trough and we place the HADs
            if t1 in self.hadamards and t2 in self.hadamards:
                self.add_hadamard(t1)
                self.add_hadamard(t2)
            if t1 not in self.hadamards and t2 not in self.hadamards:
                self.add_cz(g)
            # Exactly one of t1 and t2 has a hadamard
            # So the CZ commutes trough and becomes a CNOT
            elif t1 in self.hadamards:
                cnot = CNOT(t2, t1)
                self.add_cnot(cnot)
            else:
                cnot = CNOT(t1, t2)
                self.add_cnot(cnot)
            
        elif g.name == 'CNOT':
            c, t = g.control, g.target
            # Commute NOTs and Zs trough the CNOT
            if c in self.nots:
                toggle_element(self.nots, t)
            if t in self.zs:
                toggle_element(self.zs, c)
            # If HADs are on both qubits, we commute the CNOT trough by switching target and control
            if c in self.hadamards and t in self.hadamards:
                g.control = t
                g.target = c
                self.add_cnot(g)
            elif c not in self.hadamards and t not in self.hadamards:
                self.add_cnot(g)
            # If there is a HAD on the target, the CNOT commutes trough to become a CZ
            elif t in self.hadamards:
                cz = CZ(c if c<t else t, c if c>t else t)
                self.add_cz(cz)
            else: # Only the control has a hadamard gate in front of it
                self.add_hadamard(c)
                self.add_cnot(g)
        
        else:
            raise TypeError("Unknown gate {}".format(str(g)))




def greedy_consume_gates(gates: Dict[int, List[Gate]], qubits: int) -> Tuple[List[Gate],List[HAD]]:
    """Tries to consume as many gates as possible into a phase-polynomial block, by pushing gates past hadamards to the beginning
    as long as that is possible. Used by :func:`phase_block_optimize`.

    ``gates`` should be a {qubits:[list of gates]} dictionary, while ``qubits`` is the amount of qubits in the circuit.
    Returns a tuple (list of gates, list of hadamards)."""
    
    block = [] # The output
    while True:
        had_blocked = dict() # a {qubit: HADgate} dictionary specifying when a HAD blocks further consuming of gates.
        to_be_appended = [] # List of gates that we will add to ``block``.
        available = []      # List of indices of 2-qubit gates to record whether they are available to be added on the other target.
        gatetype = {i: 0 for i in range(qubits)} # 0 = Z-type, 1 = X-type, the two sorts of commutation types.
        for q, gs in gates.items():
            if not gs: continue
            g = gs[0]
            if g.name == 'HAD': # If the first gate on this qubit is a HAD, we stop
                had_blocked[q] = g
                continue
            if isinstance(g, ZPhase) or g.name == 'CZ':
                gatetype[q] = 1
            else: # gate is a CNOT
                if g.control == q:
                    gatetype[q] = 1
                else:
                    gatetype[q] = 2
            for g in gs:
                if g.name == 'HAD': # Stop once we encounter a HAD
                    had_blocked[q] = g
                    break
                if isinstance(g, ZPhase) or g.name == 'CZ': # Z-type gates
                    if gatetype[q] == 1: # Z-type is available
                        if g.name == 'CZ':
                            if g.index in available: # Check whether the target on the other qubit is available
                                to_be_appended.append(g)
                            else: available.append(g.index) # Otherwise we postpone until we have checked that later on
                        else:
                            to_be_appended.append(g)
                    else:
                        break # We have encountered a gate of the wrong type, so we stop delving deeper
                else: #gate is CNOT
                    if (gatetype[q] == 1 and g.target == q) or (gatetype[q] == 2 and g.control == q): # wrong type
                        break
                    else:
                        if g.index in available: # Same 2-qubit gate logic as with CZ
                            to_be_appended.append(g)
                        else: available.append(g.index)
        for g in to_be_appended:
            block.append(g)
            gates[g.target].remove(g)
            if g.name in ('CZ', 'CNOT'):
                gates[g.control].remove(g)  
        if to_be_appended: # We added at least one gate, so we go to the top of the loop to try again.
            continue
        # We couldn't add any easy gates, so now we go looking for gates stuck behind a HAD.
        added_any = False
        candidates = []
        for q, had in had_blocked.items():
            i = gates[q].index(had)
            gs = gates[q][i+1:] # The gates appearing after the HAD
            if not gs: continue
            g = gs[0]
            if g.name == 'HAD': # Double Hadamard
                gates[q].remove(had)
                gates[q].remove(g)
                added_any = True
                break
            left_ty = gatetype[q] # The type of the gates to the left of the HAD. Note that this type must necessarily
                                  #  be the same for all gates, since otherwise it wouldn't be blocked by a HAD.
            if g.name == 'CZ' or isinstance(g, ZPhase) or (g.control == q):
                if gatetype[q] == 0: left_ty = 2 # If no gate is on the left of the HAD we set the type correspondingly.
                right_ty = 1
            else: 
                if gatetype[q] == 0: left_ty = 1
                right_ty = 2
            if left_ty == right_ty: continue # If the types are different, we can't commute things past the HAD into the phase-block.
            for g in gs:
                if g.name == 'HAD': break # If we encounter another HAD, we stop.
                if isinstance(g, ZPhase):
                    if right_ty == 1: continue # We can't commute a ZPhase past a HAD, but we can keep looking further
                    else: break # ZPhase is not of type X, so we must stop looking now.
                if g.name == 'CZ' or g.control == q: # CZ or CNOT with a control on this qubit
                    if right_ty == 2: break
                else:  # CNOT with target on this qubit
                    if right_ty == 1: break
                if g.index not in available:
                    if g.name == 'CNOT':  # We only need to check CNOTs, since CZs must already be in available 
                        available.append(g.index)  # (because otherwise they would be behind 2 HADs)
                else:
                    if g not in candidates:
                        candidates.append(g)
        if added_any: continue # Found double Hadamard

        for g in candidates:
            if g.name == 'CZ':
                if g.target in had_blocked and g.index > had_blocked[g.target].index: # CZ appears after the HAD.
                    q = g.target
                else:
                    q = g.control
                q2 = g.target if g.control == q else g.control
                if q2 in had_blocked and g.index > had_blocked[q2].index:
                    print(g, g.index)
                    raise Exception("CZ behind two Hadamard gates. This is not supposed to happen")
                cnot = CNOT(q2, q)
                cnot.index = g.index
                gates[q].remove(g)
                gates[q2].remove(g)
                block.append(cnot)
                added_any = True
            elif g.name == 'CNOT':
                if (g.target in had_blocked and g.index > had_blocked[g.target].index
                     and g.control in had_blocked and g.index > had_blocked[g.control].index):
                    cnot = CNOT(g.target, g.control)
                    cnot.index = g.index
                    gates[g.target].remove(g)
                    gates[g.control].remove(g)
                    block.append(cnot)
                    added_any = True
                elif g.target in had_blocked and g.index > had_blocked[g.target].index:
                    cz = CZ(g.control, g.target)
                    cz.index = g.index
                    gates[g.target].remove(g)
                    gates[g.control].remove(g)
                    block.append(cz)
                    added_any = True
                else: continue
        if added_any: continue
        else: break

    hadamards = []
    for gs in gates.values():
        if gs and gs[0].name == 'HAD':
            hadamards.append(gs.pop(0))
    return block, hadamards


def phase_block_optimize(circuit: Circuit, pre_optimize:bool=True, quiet:bool=True) -> Circuit:
    """Optimizes the given circuit, by cutting it into phase polynomial pieces, and
    using the `TODD algorithm <https://iopscience.iop.org/article/10.1088/2058-9565/aad604/meta>`_ 
    to optimize each of these phase polynomials. 
    The phase-polynomial circuits are then resynthesized using the 
    `parity network <https://iopscience.iop.org/article/10.1088/2058-9565/aad8ca/meta>`_ algorithm.
    
    Note:
        Only works with Clifford+T circuits. Will give wrong output when fed smaller rotation gates, or Toffoli-like gates.
        Depending on the number of qubits and T-gates this function can take a long time to run.
        It can be sped up somewhat by using the `TOpt implementation of TODD <https://github.com/Luke-Heyfron/TOpt>`_.
        If this is installed, point towards it using ``zx.settings.topt_command``, such as for instance 
        ``zx.settings.topt_command = ['wsl', '../TOpt']`` for running it in the Windows Subsystem for Linux.

    Args:
        circuit: The circuit to be optimized.
        pre_optimize: Whether to call :func:`basic_optimization` first.
        quiet: Whether to print some progress indicators. Helpful when execution time is long. 
    """
    qubits = circuit.qubits
    o = Optimizer(circuit)
    if pre_optimize:
        circuit, correction = o.parse_circuit(separate_correction=True, quiet=quiet)
    else:
        circuit = circuit.copy()
        correction = []
    permutation = {i:i for i in range(qubits)}
    nots = []
    for g in correction:
        if g.name == 'SWAP':
            a = permutation[g.control]
            b = permutation[g.target]
            permutation[g.control] = b
            permutation[g.target] = a
        elif g.name == 'NOT':
            nots.append(g)
        else:
            raise TypeError("Illegal correction {}".format(str(g)))

    permutation = {v:k for k,v in permutation.items()}

    gates = {i:list() for i in range(qubits)}

    for i, g in enumerate(circuit.gates):
        g = g.copy()
        g.index = i
        if g.name in ('CNOT', 'CZ'):
            gates[g.control].append(g)
            gates[g.target].append(g)
        elif g.name != 'HAD':
            if not isinstance(g, ZPhase):
                raise TypeError("Unknown gate {}. Maybe simplify the gates with circuit.to_basic_gates()?".format(str(g)))
            elif g.phase.denominator not in (1,2,4):
                raise TypeError("This method only works on Clifford+T circuits. This circuit contains a {}".format(str(g)))
            gates[g.target].append(g)
        else:
            gates[g.target].append(g)

    consumed = []

    block = []
    hadamards = []
    while any(gates.values()):
        if not quiet: print("new block")
        revgates = {i:list() for i in range(qubits)}
        i = 0
        for g in hadamards:
            g.index = i
            i += 1
            revgates[g.target].append(g)
        for g in reversed(block):
            g.index = i
            i += 1
            revgates[g.target].append(g)
            if g.name in ('CNOT', 'CZ'):
                revgates[g.control].append(g)

        revblock, had2 = greedy_consume_gates(revgates, qubits)
        if len(hadamards) != len(had2):
            raise Exception("Hadamards did not extract correctly")

        notparsed = []
        indices = set()
        for gs in revgates.values():
            for g in gs:
                if g.index not in indices:
                    indices.add(g.index)
                    notparsed.append(g)
        notparsed.sort(key=lambda g: g.index, reverse=True)

        consumed.extend(notparsed)
        consumed.extend(had2)

        newblock, hadamards = greedy_consume_gates(gates, qubits)
        block = list(reversed(revblock))
        block.extend(newblock)
        block, permute = todd_simp(block, qubits, quiet=quiet)
        inverse = {v:k for k,v in permute.items()}
        gates = {inverse[t]:gs for t,gs in gates.items()}
        indices = set()
        for gs in gates.values():
            for g in gs:
                if g.name in ('CNOT', 'CZ'):
                    if g.index in indices:
                        continue
                    indices.add(g.index)
                    g.control = inverse[g.control]
                g.target = inverse[g.target]
        for g in nots:
            g.target = inverse[g.target]
        permutation = {i: permutation[permute[i]] for i in range(qubits)}

    consumed.extend(block)
    consumed.extend(hadamards)
    consumed.extend(nots)
    for a,b in permutation_as_swaps(permutation):
        consumed.append(SWAP(a,b))
    for g in consumed: g.index = 0
    c = Circuit(qubits)
    c.gates = consumed
    return c
