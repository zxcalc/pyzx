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


"""This module implements the Third Order Duplicate and Destroy algorithm
from Luke E Heyfron and Earl T Campbell 2019 Quantum Sci. Technol. 4 015004
available at http://iopscience.iop.org/article/10.1088/2058-9565/aad604/meta"""

from __future__ import print_function

from fractions import Fraction
import subprocess
import tempfile
import time
import random

import numpy as np

from .circuit import T, S, Z, ZPhase, CZ, CNOT, ParityPhase
from .linalg import Mat2, column_optimal_swap
from .extract import permutation_as_swaps
from .phasepoly import parity_network

TOPT_LOCATION = None
USE_REED_MULLER = False


class ParityPolynomial:
    """Class used to represent phase polynomials in the standard
    ParityPhase view. For example: x1@x2 + 3x2 + 5x1@x2@x3"""
    def __init__(self,qubits, poly=None):
        self.qubits = qubits
        if poly:
            self.terms = poly.terms.copy()
        else: self.terms = {}
    
    def copy(self):
        return type(self)(self.qubits, self)
    
    def __str__(self):
        l = []
        for t in sorted(self.terms.keys()):
            val = self.terms[t]
            l.append("{!s}{}".format(val if val!=1 else "", "@".join("x{:d}".format(v) for v in sorted(list(t)))))
        return " + ".join(l)
    
    def __repr__(self):
        return str(self)
    
    def add_term(self, term, value):
        term = tuple(sorted(term))
        if term in self.terms:
            self.terms[term] = (self.terms[term] + value) % 8
        else: self.terms[term] = value % 8
        if not self.terms[term]:
            del self.terms[term]
    
    def add_polynomial(self, poly):
        for term, val in poly.terms.items():
            self.add_term(term, val)
    
    def __add__(self, other):
        p = self.copy()
        p.add_polynomial(other)
        return p
    
    def to_par_matrix(self):
        """Converts the phase polynomial into a parity matrix."""
        cols = []
        for par, val in self.terms.items():
            col = [1 if i in par else 0 for i in range(self.qubits)]
            for i in range(val): cols.append(col)
        return Mat2(cols).transpose()

class ParitySingle:
    """Class used for representing a single parity expression
    like x1@x2@x4"""
    def __init__(self,startval):
        self.par = {startval}
    
    def __str__(self):
        return "@".join("x{:d}".format(i) for i in sorted(self.par))
    
    def __repr__(self):
        return str(self)
    
    def add_par(self, other):
        self.par.symmetric_difference_update(other.par)


class MultiLinearPoly:
    """Class for representing phase polynomials in the multilinear formalism.
    For example: x1 + x2 + 2x1x2 + 4x1x2x3"""
    def __init__(self):
        self.l = {}
        self.q = {}
        self.c = set()
    
    def add_parity(self, par, subtract=False):
        p = []
        mult = -1 if subtract else 1
        for i,v in enumerate(par):
            if v: p.append(i)
        for a in range(len(p)):
            v1 = p[a]
            if v1 not in self.l: self.l[v1] = mult
            else: self.l[v1] = (self.l[v1] + mult) % 8
            
            for b in range(a+1, len(p)):
                v2 = p[b]
                if (v1,v2) not in self.q: self.q[(v1,v2)] = 1 if subtract else 3
                else: self.q[(v1,v2)] = (self.q[(v1,v2)] - mult) % 4
                    
                for c in range(b+1, len(p)):
                    v3 = p[c]
                    if (v1,v2,v3) not in self.c: self.c.add((v1,v2,v3))
                    else: self.c.remove((v1,v2,v3))
    
    def add_par_matrix(self, a, subtract=False):
        for col in a.transpose().data:
            self.add_parity(col,subtract=subtract)
    
    def to_clifford(self):
        """Returns the phase polynomial in terms of Clifford Z-rotations 
        and CZs. If the phase polyomial is not Clifford it raises an ValueError."""
        gates = []
        for t, v in self.l.items():
            if v == 2:
                gates.append(S(t,adjoint=False))
            elif v == 4:
                gates.append(Z(t))
            elif v == 6:
                gates.append(S(t,adjoint=True))
            elif v != 0:
                raise ValueError("PhasePoly is not Clifford")
        for (t1,t2), v in self.q.items():
            if v == 2:
                gates.append(CZ(t1,t2))
            elif v != 0:
                raise ValueError("PhasePoly is not Clifford")
        if self.c:
            raise ValueError("PhasePoly is not Clifford")
        return gates


def par_matrix_to_gates(a):
    """Convert a parity matrix into T gates and ParityPhase gates."""
    gates = []
    phase = Fraction(1,4)
    for col in a.transpose().data:
        targets = [i for i,v in enumerate(col) if v]
        if len(targets) == 1:
            gates.append(T(targets[0]))
        else:
            gates.append(ParityPhase(phase, *targets))
    return gates

def phase_gates_to_poly(gates, qubits):
    """Convert a CNOT+T+CZ circuit into a phase polynomial representation
    using :class:`ParityPolynomial`."""
    phase_poly = ParityPolynomial(qubits)
    expression_polys = []
    for i in range(qubits):
        expression_polys.append(ParitySingle(i))
    
    for g in gates:
        if isinstance(g, ZPhase):
            par = expression_polys[g.target].par
            phase_poly.add_term(par, int(g.phase*4))
        elif isinstance(g, CZ):
            tgt, ctrl = g.target, g.control
            par1 = expression_polys[tgt].par
            par2 = expression_polys[ctrl].par
            phase_poly.add_term(par1, 2)
            phase_poly.add_term(par2, 2)
            phase_poly.add_term(par1.symmetric_difference(par2), 6)
        elif isinstance(g, CNOT):
            tgt, ctrl = g.target, g.control
            expression_polys[tgt].add_par(expression_polys[ctrl])
        else:
            raise TypeError("Unknown gate type {}".format(str(g)))
    
    return phase_poly, expression_polys



def xi(m, z):
    """Constructs the \chi matrix from the TOpt paper."""
    arr = np.asarray(m.data)
    rows = m.rows()
    data = []
    for alpha in range(rows):
        ra = arr[alpha]
        for beta in range(alpha+1, rows):
            rb = arr[beta]
            rab = ra*rb
            for gamma in range(beta+1, rows):
                rg = arr[gamma]
                if z[alpha]:
                    rbg = rb*rg
                    if not z[beta]:
                        if not z[gamma]:
                            data.append(rbg.tolist())
                            continue
                        data.append(((rbg+rab)%2).tolist())
                        continue
                    elif not z[gamma]:
                        rag = ra*rg
                        data.append(((rbg+rag)%2).tolist())
                        continue
                    else: #z[alpha], z[beta] and z[gamma] are all true
                        rag = ra*rg
                        data.append(((rab+rag+rbg)%2).tolist())
                        continue
                elif z[beta]:
                    rag = ra*rg
                    if z[gamma]:
                        data.append(((rab+rag)%2).tolist())
                        continue
                    data.append(rag.tolist())
                    continue
                elif z[gamma]:
                    data.append(rab.tolist())
                    continue
    for r in m.data: data.append(r.copy())            
    return Mat2(data)


def find_todd_match(m):
    """Tries to find a match for the TODD algorithm given a parity matrix."""
    rows = m.rows()
    cols = m.cols()
    for a in range(cols):
        for b in range(a+1, cols):
            z = [0]*rows
            for i in range(rows):
                r = m.data[i]
                if r[a]:
                    if not r[b]:
                        z[i] = 1
                else:
                    if r[b]:
                        z[i] = 1
            bigm = xi(m, z)
            #print(bigm, '.')
            options = bigm.nullspace(should_copy=False)
            #print(bigm)
            for y in options:
                if y[a] + y[b] == 1: return a,b,z,y

    return -1,-1,None,None


def remove_trivial_cols(m):
    """Remove duplicate and zero columns in parity matrix.
    NOTE: the transpose of the matrix should be supplied
    so that the columns are actually the rows."""
    while True:
        newcols = m.rows()
        for a in range(newcols):
            if not any(m.data[a]):
                m.data.pop(a)
                break
            should_break = False
            for b in range(a+1, newcols):
                if m.data[a] == m.data[b]:
                    m.data.pop(b)
                    m.data.pop(a)
                    should_break = True
                    break
            if should_break: break
        else: # Didn't break out of for-loop so didn't find any match
            break
    return newcols

def do_todd_single(m):
    """Find a single TODD match and apply it to the matrix."""
    startcols = m.cols()
    a,b,z,y = find_todd_match(m)
    if not z: return m, 0
    m = m.transpose()
    #odd_y = sum(y) % 2
    for i,c in enumerate(m.data):
        if not y[i]: continue
        for j in range(len(c)):
            if z[j]: c[j] = 0 if c[j] else 1
    if sum(y) % 2 == 1:
        m.data.append(z)
    m.data.pop(b)
    m.data.pop(a)
    
    newcols = remove_trivial_cols(m)
                
    return m.transpose(), startcols - newcols

def todd_iter(m, quiet=True):
    """Keep finding TODD matches until nothing is found anymore.
    If TOPT_LOCATION is given it uses the TOpt implementation of TODD. """
    m = m.transpose()
    remove_trivial_cols(m)
    random.shuffle(m.data) # Randomly shuffle the columns
    m = m.transpose()
    if not m.cols() or not m.rows():
        return m
    if TOPT_LOCATION:
        return call_topt(m, quiet=quiet)
    while True:
        m, reduced = do_todd_single(m)
        if not reduced:
            return m
        if not quiet: print(reduced, end='.')

def call_topt(m, quiet=True):
    """Calls and parses the output of the TOpt implementation of TODD."""
    if not quiet:
        print("TOpt: ", end="")
    t_start = m.cols()
    s = "\n".join(" ".join(str(i) for i in r) for r in m.data)
    with tempfile.NamedTemporaryFile(suffix='.gsm') as f:
        f.write(s.encode('ascii'))
        f.flush()
        time.sleep(0.01)
        if USE_REED_MULLER:
            out = subprocess.check_output([TOPT_LOCATION, "gsm",f.name, "-a", "rm"])
        else:
            out = subprocess.check_output([TOPT_LOCATION, "gsm",f.name])
        out = out.decode()
        #print(out)
    rows = out[out.find("Output gate"):out.find("Successful")].strip().splitlines()[2:]
    i = out.find("Total time")
    t = out[i+10: out.find("s",i)]
    if not quiet:
        print(t)
    data = []
    try:
        for row in rows:
            data.append([int(i) for i in row])
    except ValueError:
        print(out)
        print(rows)
        raise
    m2 = Mat2(data)
    if USE_REED_MULLER:
        m = m2.transpose()
        remove_trivial_cols(m)
        m2 = m.transpose()
    t_end = m2.cols()
    if t_end < t_start:
        if not quiet: print("Found reduction: ", t_start - t_end)
        # print("Start:")
        # print(m)
        # print("End:")
        # print(m2)
        #print(out)
    return m2


def todd_simp(gates, qubits, quiet=True):
    """Run the TODD algorithm on a CNOT+CZ+T set of gates and 
    apply the necessary Clifford corrections. Uses the 
    CNOT parity algorithm from https://arxiv.org/pdf/1712.01859.pdf
    to synthesize the necessary parities."""
    phase_poly, parity_polys = phase_gates_to_poly(gates, qubits)
    #print(phase_poly)
    #print(parity_polys)
    m = phase_poly.to_par_matrix()
    m2 = todd_iter(m,quiet=quiet)

    newgates = []
    parities = []
    for col in m2.transpose().data:
        if sum(col) == 1:
            newgates.append(T(next(i for i in range(qubits) if col[i])))
        else:
            parities.append(col)

    p = MultiLinearPoly()
    p.add_par_matrix(m,False)
    p.add_par_matrix(m2,True)
    newgates.extend(p.to_clifford())

    cnots = parity_network(qubits, parities)
    m = Mat2.id(qubits)
    for cnot in cnots:
        m.row_add(cnot.control, cnot.target)
    data = []
    for p in parity_polys:
        l = [int(i in p.par) for i in range(qubits)]
        data.append(l)
    target_matrix = Mat2(data) * m.inverse()
    #perm = column_optimal_swap(target_matrix.transpose())
    perm = {i:i for i in range(qubits)}
    swaps = permutation_as_swaps(perm)
    for a,b in swaps:
        target_matrix.row_swap(a,b)
    gates = target_matrix.to_cnots(optimize=True)
    for gate in reversed(gates):
        cnots.append(CNOT(gate.target,gate.control))

    m = Mat2.id(qubits)
    for i, cnot in enumerate(cnots):
        newgates.append(cnot)
        m.row_add(cnot.control, cnot.target)
        for par in parities:
            if par in m.data: # The parity checks out, so put a phase here
                newgates.append(T(m.data.index(par)))
                parities.remove(par)
                break

    if parities:
        raise ValueError("Still phases left on the stack")

    return newgates, {v:k for k,v in perm.items()}


def todd_on_graph(g):
    """Runs the TODD algorithm on a graph. The variables are determined
    by looking at which vertices have phase gadgets attached to them.
    Note that this produces graphs that can only be transformed into circuits
    using ancilla qubits."""
    gadgets = {}
    t_nodes = []
    for v in g.vertices():
        if v not in g.inputs and v not in g.outputs and len(list(g.neighbours(v)))==1:
            if g.phase(v) != 0 and g.phase(v).denominator != 4: continue
            n = list(g.neighbours(v))[0]
            tgts = frozenset(set(g.neighbours(n)).difference({v}))
            gadgets[tgts] = (n,v)
        if g.phase(v) != 0 and g.phase(v).denominator == 4:
            t_nodes.append(v)
    
    if not gadgets:
        print("No phase gadgets found")
        return
    variables = set()
    for par in gadgets.keys():
        variables.update(par)
    
    for v in variables:
        if v in t_nodes:
            gadgets[frozenset({v})] = (v,v)
    
    targets = list(variables)
    n = len(targets)

    cols = []
    for par, (_,v) in gadgets.items():
        col = [0]*n
        for t in par:
            col[targets.index(t)] = 1
        phase = g.phase(v)
        for i in range(phase.numerator): cols.append(col)
    parmatrix = Mat2(cols).transpose()
    m2 = todd_iter(parmatrix)
    
    newgadgets = []
    phases = dict()
    for col in m2.transpose().data:
        if sum(col) == 1:
            i = next(i for i,a in enumerate(col) if a)
            v = targets[i]
            if v in t_nodes:
                phases[v] = Fraction(1,4)
            else:
                phases[v] = g.phase(v) + Fraction(1,4)
        else:
            newgadgets.append(frozenset([targets[i] for i,a in enumerate(col) if a]))
    
    p = zx.todd.MultiLinearPoly()
    p.add_par_matrix(parmatrix,False)
    p.add_par_matrix(m2,True)
    correction = p.to_clifford()
    add_czs = {}
    for clif in correction:
        if isinstance(clif, ZPhase):
            v = targets[clif.target]
            if v in phases:
                phases[v] += clif.phase
            else:
                if v in t_nodes:
                    phases[v] = clif.phase
                else:
                    phases[v] = g.phase(v) + clif.phase
        elif clif.name == 'CZ':
            v1,v2 = targets[clif.control], targets[clif.target]
            add_czs[(v1,v2)] = (0,1)
        else:
            raise ValueError("Unknown clifford correction:", str(clif))
    
    for v in targets:
        if v in phases:
            g.set_phase(v, phases[v])
        else:
            if v in t_nodes:
                g.set_phase(v, 0)
    g.add_edge_table(add_czs)
    
    rs = g.rows()
    positions = set()
    for gadget, (n,v) in gadgets.items():
        if len(gadget) == 1: continue # T-node
        if gadget in newgadgets:
            positions.add(rs[v])
            g.set_phase(v, Fraction(1,4))
            newgadgets.remove(gadget)
        else:
            g.remove_vertices((n,v))
    
    edges = []
    for par in newgadgets:
        pos = sum(rs[t] for t in par)/len(par) + 0.5
        while pos in positions: pos += 0.5
        n = g.add_vertex(1, -1, pos)
        v = g.add_vertex(1, -2, pos, phase=Fraction(1,4))
        edges.append((n,v))
        positions.add(pos)
        for t in par: edges.append((n,t))
    g.add_edges(edges, 2)