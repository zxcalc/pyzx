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

from .circuit import Circuit, HAD, ZPhase, CNOT, CZ, S, NOT, Z
from .linalg import Mat2

def circuit_phase_polynomial_blocks(circuit, optimize=False, quiet=True):
        """Tries to moves gates around such that as many ZPhase, CZ and CNOT gates 
        are together, so that the resulting circuit can be seen as a sequence of 
        phase polynomials separated by Hadamard gates. Returns a tuple ``circuit, partition`` where
        the ``partition`` is a list, the odd elements of which are phase polynomials.

        If optimize is True then :func:`optimize_block` is called on every phase polynomial block to
        optimize the gate count."""
        gates = {i:list() for i in range(circuit.qubits)}
        for g in circuit.gates:
            if isinstance(g,ZPhase):
                gates[g.target].append(ZPhase(g.target,g.phase))
            elif isinstance(g, NOT):
                if gates[g.target] and isinstance(gates[g.target][-1], HAD):
                    gates[g.target].pop()
                else:
                    gates[g.target].append(HAD(g.target))
                gates[g.target].append(Z(g.target))
                gates[g.target].append(HAD(g.target))
            elif isinstance(g, HAD):
                if gates[g.target] and isinstance(gates[g.target][-1], HAD):
                    gates[g.target].pop()
                else: gates[g.target].append(g)
            elif isinstance(g, CZ):
                if gates[g.control]: g1 = gates[g.control][-1]
                else: g1 = None
                if gates[g.target]: g2 = gates[g.target][-1]
                else: g2 = None
                if g1 and g2 and isinstance(g1, CZ) and isinstance(g2, CZ) and g.target in (g1.control, g1.target) and g.control in (g2.control, g2.target):
                    gates[g.control].pop()
                    gates[g.target].pop()
                else:
                    gates[g.control].append(g)
                    gates[g.target].append(g)
            elif isinstance(g, CNOT): # We need to convert this CNOT to a CZ by adding hadamards at the control
                cz = CZ(g.control, g.target)
                if gates[g.control]: g1 = gates[g.control][-1]
                else: g1 = None
                if gates[g.target]: g2 = gates[g.target][-1]
                else: g2 = None
                if g1 and g2 and isinstance(g1, CZ) and isinstance(g2, CZ) and g.target in (g1.control, g1.target) and g.control in (g2.control, g2.target):
                    gates[g.control].pop()
                    gates[g.target].pop()
                    gates[g.control].append(S(g.control))
                    gates[g.control].append(cz)
                    #gates[g.control].extend([S(g.control),cz])
                    gates[g.target].append(S(g.target))
                    gates[g.target].append(HAD(g.target))
                    gates[g.target].append(cz)
                    gates[g.target].append(HAD(g.target))
                    gates[g.target].append(S(g.target,adjoint=True))
                    #gates[g.target].extend([S(g.target),HAD(g.target),cz,HAD(g.target),S(g.target,adjoint=True)])
                    continue
                if g2 and isinstance(g2, HAD):
                    gates[g.target].pop()
                else:
                    gates[g.target].append(HAD(g.target))
                if g1 and g2 and isinstance(g1, CZ) and isinstance(g2, CZ) and g.target in (g1.control, g1.target) and g.control in (g2.control, g2.target):
                    gates[g.control].pop()
                    gates[g.target].pop()
                else:
                    gates[g.control].append(cz)
                    gates[g.target].append(cz)
                gates[g.target].append(HAD(g.target))
            else:
                raise TypeError("Unsupported gate {!s}. Make sure you are in GH+CNOT form.".format(g))
        partition = []
        while any(gates.values()): # We keep parsing until all the gates have been consumed
            had_layer = []
            l = []
            claimed_qubits = set()
            #print("before", gates)
            for q, gs in gates.items(): # Push a layer of hadamards back
                if q not in claimed_qubits and gs and isinstance(gs[0], HAD):
                    claimed_qubits.add(q)
                    if len(gs) >= 3 and isinstance(gs[1], CZ) and isinstance(gs[2], HAD): #H-CZ-H
                        g = gs[1]
                        q2 = g.control if g.target==q else g.target
                        #print(q, q2, gs, gates[q2])
                        if q2 in claimed_qubits:
                            had_layer.append(gs[0])
                            gs.pop(0)
                        else:
                            if isinstance(gates[q2][0], HAD):
                                had_layer.append(gates[q2][0])
                                gates[q2].pop(0)
                                claimed_qubits.add(q2)
                            index = gates[q2].index(CZ(q2,q))
                            for i in range(index):
                                if isinstance(gates[q2][i], HAD): # Can't consume CZ gate now, HAD in the way
                                    #print("nopenope")
                                    had_layer.append(gs[0])
                                    gs.pop(0)
                                    break
                            else:
                                #print("yesyes")
                                l.append(CNOT(q2,q)) #H-CZ-H = CNOT
                                claimed_qubits.add(q2)
                                gs.pop(0)
                                gs.pop(0)
                                gs.pop(0)
                                gates[q2].pop(index)
                    else:
                        had_layer.append(gs[0])
                        gs.pop(0)
            
            if had_layer: partition.append(had_layer)
            #print("after", gates)
            while True: # We keep adding gates to this phase polynomial block, until we can't any more.
                conns = []
                for q in range(circuit.qubits):
                    phases = []
                    for i,g in enumerate(gates[q]):
                        if isinstance(g, CZ):
                            q2 = g.control if g.target==q else g.target
                            conns.append((q,q2))
                        elif isinstance(g, HAD):
                            break
                        elif isinstance(g, ZPhase):
                            phases.append(i)
                    for i in reversed(phases):
                        l.append(gates[q].pop(i))
                for i,j in conns.copy():
                    if (j,i) in conns and (i,j) in conns:
                        g = CZ(i,j)
                        l.append(g)
                        gates[i].remove(g)
                        gates[j].remove(g)
                        conns.remove((i,j))
                        conns.remove((j,i))
                
                moved_gates = False
                hadamard_blocked = []
                conns = []
                for q in range(circuit.qubits):
                    if gates[q] and isinstance(gates[q][0],HAD):
                        hadamard_blocked.append(q)
                    else:
                        for g in gates[q]:
                            if isinstance(g,CZ):
                                q2 = g.control if g.target==q else g.target
                                conns.append((q,q2))
                            elif isinstance(g,HAD):
                                break

                for q in hadamard_blocked:
                    remove = []
                    for i,g in enumerate(gates[q][1:]):
                        if isinstance(g, CZ):
                            q2 = g.control if g.target==q else g.target
                            if q2 in hadamard_blocked: continue
                            if (q2,q) not in conns: continue
                            #print("cnot", q,q2)
                            l.append(CNOT(q2,q))
                            gates[q2].remove(CZ(q2,q))
                            conns.remove((q2,q))
                            remove.append(i)
                            moved_gates = True
                        elif isinstance(g, HAD): break
                    for i in reversed(remove):
                        gates[q].pop(i+1)
                for q in range(circuit.qubits):
                    if len(gates[q]) >= 2 and isinstance(gates[q][0], HAD) and isinstance(gates[q][1], HAD): #double hadamard gate
                        gates[q].pop(0)
                        gates[q].pop(0)
                        moved_gates = True
                if not moved_gates: break
            
            if l: 
                if optimize:
                    l = optimize_block(l, circuit.qubits, quiet=quiet)
                partition.append(l)
            
        c2 = Circuit(circuit.qubits)
        for gs in partition: c2.gates.extend(gs)
        return c2, partition



def optimize_block(block, qubit_count, quiet=True):
    q = qubit_count
    #First we construct the phase polynomial
    variables = ['x{:03d}'.format(i) for i in range(q)]
    phase_poly = BoolPolynomial()
    expression_polys = []
    for i in range(q):
        p = BoolPolynomial()
        p.add_term(variables[i],1)
        expression_polys.append(p)

    for g in block:
        if isinstance(g, ZPhase):
            terms = expression_polys[g.target].terms
            if len(terms) == 1:
                term = list(terms.keys())[0]
            else:
                term = "({})".format("+".join(t[0] for t in terms.keys()))
            phase_poly.add_term(term, g.phase)
        elif isinstance(g, CZ):
            tgt, ctrl = g.target, g.control
            phase_poly.add_polynomial(expression_polys[tgt]*expression_polys[ctrl])
        elif isinstance(g, CNOT):
            tgt, ctrl = g.target, g.control
            expression_polys[tgt].add_polynomial(expression_polys[ctrl])

#     print(phase_poly)
    #for p in expression_polys:
    #    print(p)
    
    # Then we extract the parities for the CZs and phases
    simple_phases = []
    czs = []
    parities = []
    for t, phase in phase_poly.terms.items():
        if len(t) == 2:
            czs.append((variables.index(t[0]),variables.index(t[1])))
            continue
        t = t[0]
        if '+' in t:
            l = []
            for v in variables:
                l.append(int(v in t[1:-1].split('+')))
            parities.append((l,phase))
        else: simple_phases.append((variables.index(t), phase))
    
    czs = set(czs)
    
    #print(simple_phases)
    #print(czs)
    #print(parities)
    
    # We try to make our cnots more efficient
    cnots = parity_network(q, [par for par,phase in parities])
    #print("parity network cnots", cnots)
    m = Mat2.id(q)
    for cnot in cnots:
        m.row_add(cnot.control, cnot.target)
    #print(m)
    data = []
    # for v in variables:
    #     l = [int((v,) in p.terms) for p in expression_polys]
    #     data.append(l)
    for p in expression_polys:
        l = [int((v,) in p.terms) for v in variables]
        data.append(l)
    #print(Mat2(data))
    target_matrix = Mat2(data) * m.inverse()
    #print("target matrix")
    #print(target_matrix)
    gates = target_matrix.to_cnots(optimize=True)
    for gate in reversed(gates):
        cnots.append(CNOT(gate.target,gate.control))
    #cnots = cnots + target_matrix.to_cnots(optimize=True)
    old_cnots = [g for g in block if isinstance(g,CNOT)]

    if len(cnots) >= len(old_cnots):
        cnots = old_cnots
    else:
        if not quiet: print("Optimized cnot count: {!s} -> {!s} ".format(len(old_cnots),len(cnots)))

    # Now we try to find good locations to put our CZs and phases, keeping track of the parities
    # that the CNOTs are creating
    m = Mat2.id(q)
    cz_sites = {(0,r1,r2):[(r1,r2)] for r1 in range(q) for r2 in range(q) if r1<r2}
    cz_parities = list(cz_sites.values())
    phase_locations = []
    for i, cnot in enumerate(cnots):
        m.row_add(cnot.control, cnot.target)
        for par, phase in parities:
            if par in m.data: # The parity checks out, so put a phase here
                phase_locations.append((i+1,m.data.index(par),phase))
                parities.remove((par,phase))
                break
        for r1 in range(q):
            for r2 in range(r1+1, q):
                if any(m.data[r1][j] and m.data[r2][j] for j in range(q)):
                    continue
                l = set([(min([j1,j2]),max([j1,j2])) for j1 in range(q) if m.data[r1][j1] for j2 in range(q) if m.data[r2][j2]])
                if l not in cz_parities:
                    cz_sites[(i+1,r1,r2)] = l
                    cz_parities.append(l)
                    
    old_cz_count = sum(1 for g in block if isinstance(g,CZ))
    new_czs = []
    # We put our CZs in locations that greedily reduce the amount of parities we need to include.
    while czs:
        best = len(czs)
        choice = None
        for loc, l in cz_sites.items():
            score = len(czs.symmetric_difference(l))
            if score < best:
                best = score
                choice = loc
        if not choice:
            print(":(")
            print(czs)
        new_czs.append(choice)
        czs.symmetric_difference_update(cz_sites[choice])
    if not quiet and old_cz_count != 0: print("Old cz count: ", old_cz_count, ". New cz count: ", len(new_czs))
    
    # We construct the new sequence of gates
    # First the gates that appear before the CNOTs
    new_block = []
    for loc, phase in simple_phases:
        new_block.append(ZPhase(loc,phase))
    for j, loc, phase in phase_locations:
        if j!=0: continue
        new_block.append(ZPhase(loc,phase))
    for j, r1, r2 in new_czs:
        if j!=0: continue
        new_block.append(CZ(r1,r2))

    # And then the gates that appear in between the CNOTs
    for i, cnot in enumerate(cnots):
        new_block.append(cnot)
        for j, loc, phase in phase_locations:
            if j!=i+1: continue
            new_block.append(ZPhase(loc,phase))
        for j, r1, r2 in new_czs:
            if j!=i+1: continue
            new_block.append(CZ(r1,r2))
    
    return new_block



class Polynomial:
    def __init__(self,poly=None):
        if poly:
            self.terms = poly.terms.copy()
        else: self.terms = {}
    
    def copy(self):
        return type(self)(self)
    
    def __str__(self):
        l = []
        for t in sorted(self.terms.keys()):
            val = self.terms[t]
            l.append("{!s}{}".format(val if val!=1 else "", "".join(str(v) for v in sorted(list(t)))))
        return " + ".join(l)
    
    def __repr__(self):
        return str(self)
    
    def add_term(self, term, value):
        if isinstance(term, str):
            term = (term, )
        term = tuple(sorted(term))
        if term in self.terms:
            if self.terms[term] == -value:
                del self.terms[term]
            else: self.terms[term] += value
        else: self.terms[term] = value
    
    def add_polynomial(self, poly):
        for term in poly.terms:
            self.add_term(term, poly.terms[term])
    
    def __add__(self, other):
        p = self.copy()
        p.add_polynomial(other)
        return p
    
    def mult_by_term(self, term, value):
        if value == 0:
            return type(self)() # Zero polynomial
        p = type(self)()
        for t in self.terms:
            s = set()
            s.update(t)
            s.update(term)
            p.add_term(tuple(sorted(list(s))), self.terms[t]*value)
        return p
    
    def mult_by_polynomial(self, poly):
        p = type(self)()
        for term, value in poly.terms.items():
            p.add_polynomial(self.mult_by_term(term,value))
        self.terms = p.terms
    
    def __mul__(self, other):
        p = self.copy()
        p.mult_by_polynomial(other)
        return p
    
    def __rmul__(self,other):
        p = self.copy()
        for t in p.terms:
            p.terms[t] *= other
        return p

class BoolPolynomial(Polynomial):
    def add_term(self, term, value):
        val = value%2
        if not val: return
        if isinstance(term, str):
            term = (term, )
        term = tuple(sorted(term))
        if term in self.terms:
            self.terms[term] = (self.terms[term] + val)%2
            if not self.terms[term]:
                del self.terms[term]
        else: self.terms[term] = val


def parity_network(n, S):
    # See page 14 of https://arxiv.org/pdf/1712.01859.pdf
    c = [] # List of cnots
    Q = [] # stack
    Q.append((S,list(range(n)),-1))
    while Q:
        S, I, i = Q.pop()
        if not S or not I: continue
        if i != -1:
            while True:
                for j in range(n):
                    if j==i: continue
                    if all(y[j] for y in S):
                        c.append(CNOT(j,i))
                        for (Sp,Ip,ip) in (Q+[(S,I,i)]):
                            for y in Sp:
                                y[j] = (y[i]+y[j])%2
                        break
                else:
                    break
        j = max(I, key=lambda j: max([len([y for y in S if y[j]==0]),len([y for y in S if y[j]==1])]))
        S0 = [y.copy() for y in S if y[j]==0]
        S1 = [y.copy() for y in S if y[j]==1]
        Iprime = [jp for jp in I if jp!=j]
        if i == -1:
            Q.append((S1,Iprime,j))
        else:
            Q.append((S1,[jp for jp in I if jp!=i],i))
        Q.append((S0,Iprime, i))
    return c