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

# Nothing in this file will make sense if you haven't read Section IV of
# https://journals.aps.org/prx/pdf/10.1103/PhysRevX.6.021043
# In particular the text below equation (10) and equation (11) itself.

import random
import math
sq2 = math.sqrt(2)
omega = (1+1j)/sq2
from fractions import Fraction
import itertools

try:
    import numpy as np
except:
    np = None

from . import simplify
from .circuit import Circuit
from .graph import Graph

MAGIC_GLOBAL = -(7+5*sq2)/(2+2j)
MAGIC_B60 = -16 + 12*sq2
MAGIC_B66 = 96 - 68*sq2
MAGIC_E6 = 10 - 7*sq2
MAGIC_O6 = -14 + 10*sq2
MAGIC_K6 = 7 - 5*sq2
MAGIC_PHI = 10 - 7*sq2

class SumGraph(object):
    """Container class for a sum of ZX-diagrams"""
    def __init__(self, graphs=None):
        if graphs:
            self.graphs = graphs
        else:
            self.graphs = []
            
    def to_tensor(self):
        if not self.graphs: return 0
        t = self.graphs[0].to_tensor(True)
        for i in range(len(self.graphs)-1):
            t = t + self.graphs[i+1].to_tensor(True)
        return t

    def to_matrix(self):
        if not self.graphs: return 0
        t = self.graphs[0].to_matrix(True)
        for i in range(len(self.graphs)-1):
            t = t + self.graphs[i+1].to_matrix(True)
        return t

    def full_reduce(self, quiet=True):
        terms = []
        for i, g in enumerate(self.graphs):
            if not quiet:
                print("Graph {:d}:".format(i))
            simplify.full_reduce(g, quiet=quiet)
            if not g.scalar.is_zero: terms.append(g)
            elif not quiet: print("Graph {:d} is zero".format(i))
        self.graphs = terms

    def reduce_scalar(self, quiet=True):
        terms = []
        for i, g in enumerate(self.graphs):
            if not quiet:
                print("Graph {:d}:".format(i))
            simplify.reduce_scalar(g, quiet=quiet)
            if not g.scalar.is_zero: terms.append(g)
            elif not quiet: print("Graph {:d} is zero".format(i))
        self.graphs = terms

    def inner_product_with_random_state(self):
        """All the graphs should be Clifford states with same amount of outputs.
        We compose them with a random equatorial Clifford effect,
        and we calculate the resulting inner product. 
        Used in the norm estimation algorithm of
        https://arxiv.org/pdf/1808.00128.pdf"""
        terms = self.graphs
        if len(terms) == 0: return 0.0
        q = len(terms[0].outputs)
        # We want to compose g with a random equatorial Clifford effect.
        # In the ZX-calculus this consists of random k*pi/2 phases
        # with connections being a Erdos-Renyi random graph with probability 1/2.
        # We make these spiders by replacing the outputs of the graphs.
        # Generate the data for a random equatorial Clifford effect
        phases = [Fraction(random.randint(0,3),2) for _ in range(q)]
        connections = [(i1,i2) for i1 in range(q) for i2 in range(i1+1,q) if random.random() > 0.5]
        
        val = 0
        for g in terms:
            g = g.copy()
            vs = g.outputs.copy()
            for i, v in enumerate(vs):
                g.set_type(v, 1)
                g.set_phase(v, phases[i])
            g.outputs = []
            g.add_edges([(vs[i1],vs[i2]) for (i1,i2) in connections],2)
            g.scalar.add_power(len(connections))
            # Now that we have composed g with a right sort of effect, 
            # we need to calculate the value of the resulting inner product.
            # Since the diagram is a scalar, full_reduce() will completely annihilate it.
            simplify.full_reduce(g)
            g.remove_isolated_vertices()
            if g.num_vertices() != 0: raise Exception("Diagram wasn't fully reduced")
            val += g.scalar.to_number()
        return val

    def estimate_norm(self, epsilon=0.05):
        """Uses the algorithm of https://arxiv.org/pdf/1808.00128.pdf (p.22)
        to estimate the norm squared of this state."""
        count = int(4*(1/epsilon)**2)
        total = 0
        for _ in range(count):
            val = self.inner_product_with_random_state()
            total += abs(val)**2
        return total/count

    def post_select(self, qubits):
        """Outputs a new GraphSum, where for every term we replace the post-selected
        outputs by an effects. The argument ``qubits`` should be ``{q1:e1, q2:e2,...}``
        where the ``e1,e2,`` etc. are in the set ``{'0', '1', '+', '-'}``."""
        terms = []
        for g in self.graphs:
            g = g.copy()
            for qubit, effect in qubits.items():
                v = g.outputs[qubit]
                g.set_type(v,1)
                g.scalar.add_power(-1)
                if effect in ('0', '1'): #Push a Hadamard gate out of the spider
                    e = list(g.incident_edges(v))[0]
                    et = g.edge_type(e)
                    g.set_edge_type(e,3-et)
                if effect in ('1', '-'):
                    g.set_phase(v,1)
            g.outputs = [v for i,v in enumerate(g.outputs) if i not in qubits]
            terms.append(g)
        return SumGraph(terms)

    def sample(self, qubits, post_selected=None, amount = 10, epsilon=0.05, quiet=True):
        """Implements the weak simulation algorithm of https://arxiv.org/pdf/1808.00128.pdf.
        ``qubits`` should be a list of qubit numbers from which measurement outcomes in the 
        computational basis are to be sampled. ``post_selected`` should be in the format of
        :func:`~SumGraph.post_select`. ``amount`` dictates the amount of samples to be taken.
        ``epsilon`` is the error used in the norm estimation.

        Example: ``gsum.sample([1,2,3], {5:'+', 6:'0'}, 20)``
        """
        if post_selected: gsum = self.post_select(post_selected)
        else: gsum = self
        gsum.full_reduce()

        qubit_map = {q:q for q in qubits}
        for q in qubits: #If we post-select, this changes which qubit points to which output
            qubit_map[q] -= sum(1 for v in post_selected if v<q)
        norm = gsum.estimate_norm(epsilon)
        if not quiet: print("Estimated original norm:", norm)
        if norm < 0.01 and not quiet: 
            print("Norm very close to zero. Possibly post-selected to zero probability event?")
        probs = {}
        outputs = []
        for i in range(amount):
            if not quiet: print("Sample", i)
            prevprob = 1.0
            path = '' # which qubits have which outcomes in this 'run'
            output = []
            current = gsum
            qubit_map2 = {q:qubit_map[q] for q in qubits}
            for q in qubits:
                path += str(q)
                temp = None
                if path not in probs:
                    temp = current.post_select({qubit_map2[q]:'0'})
                    temp.full_reduce()
                    norm2 = temp.estimate_norm(epsilon)
                    probs[path] = (norm2/norm)/prevprob
                    if not quiet: print("New prob:", "path", path, "norm", norm2, "prob", probs[path])
                prob = probs[path]
                val = int(random.random() > prob) # Actually make a sample
                output.append((q,val))
                path += str(val)

                if val == 0:
                    if temp != None: current = temp
                    else: current = current.post_select({qubit_map2[q]:'0'})
                    prevprob *= prob
                else:
                    current = current.post_select({qubit_map2[q]:'1'})
                    prevprob *= 1-prob
                for h in qubits:
                    if h>q: qubit_map2[h] -= 1
            if not quiet: print(output)

            outputs.append(output)
        return outputs
                

                

def calculate_path_sum(g):
    """Input should be a fully reduced scalar graph-like Clifford+T ZX-diagram. 
    Calculates the scalar it represents."""
    if g.num_vertices() < 2: return g.to_tensor().flatten()[0]
    phases = g.phases()
    prefactor = 0
    variable_dict = dict()
    variables = [] # Contains the phases of each of the variables
    czs = []
    xors = dict()
    for v in g.vertices():
        if v in variable_dict: continue
        if not phases[v]: continue #It is the axle of a phase gadget, ignore it
        if g.vertex_degree(v) == 1: # Probably phase gadget
            w = list(g.neighbours(v))[0]
            if not phases[w]: # It is indeed a phase gadget
                targets = set()
                for t in g.neighbours(w):
                    if t == v: continue
                    if t not in variable_dict:
                        variable_dict[t] = len(variables)
                        variables.append(int(phases[t]*4))
                    targets.add(variable_dict[t])
                prefactor += len(targets)-1
                xors[frozenset(targets)] = int(phases[v]*4)
                continue
        variable_dict[v] = len(variables)
        variables.append(int(phases[v]*4))
    verts = sorted(list(variable_dict.keys()), key=lambda x: variable_dict[x])
    n = len(verts)
    for i in range(n):
        v = verts[i]
        for j in range(i+1,n):
            w = verts[j]
            if g.connected(v,w):
                czs.append((i,j))
                prefactor += 1

    c = Circuit(n)
    for i in range(n):
        c.add_gate("ZPhase",i,phase=Fraction(variables[i],4))
    for targets, phase in xors.items():
        c.add_gate("ParityPhase", Fraction(phase,4), *list(targets))
    for i,j in czs:
        c.add_gate("CZ", i,j)
    g2 = c.to_graph()
    g2.apply_state("+"*n)
    g2.apply_effect("+"*n)
    g2.scalar.add_power(2*n)
    val = g2.to_tensor().flatten()[0]
    return g.scalar.to_number()*val*(sq2**(-prefactor))
    # variables = np.array(variables)
    # xors = [(np.array([int(k in xor) for k in range(n)]),phase) for xor,phase in xors.items()]
    # print(n,len(czs),len(xors))
    
    # results = [0]*8
    # for bitstring in itertools.product([0,1],repeat=n):
    #     val = np.dot(variables,bitstring)
    #     val += sum(phase*(np.dot(bitstring,xor)%2) for xor,phase in xors)
    #     val += 4*sum(1 for i,j in czs if bitstring[i] and bitstring[j])
    #     try: results[val % 8] += 1
    #     except: print(val)
    # print(results)
    # r = results
    # return g.scalar.to_number()*sq2**(-prefactor)*(r[0]-r[4]+omega*(r[1]-r[5]) +1j*(r[2]-r[6]) + 1j*omega*(r[3]-r[7]))

def find_stabilizer_decomp(g):
    if simplify.tcount(g) == 0: return [g]
    gsum = replace_magic_states(g, True)
    gsum.reduce_scalar()
    output = []
    for h in gsum.graphs:
        if h.scalar.is_zero: continue
        output.extend(find_stabilizer_decomp(h))
    return output

def max_terms_needed(g):
    """Returns the maximum amount of stabilizer terms that g could be split in
    by :func:``find_stabilizer_decomp``."""
    v = simplify.tcount(g)
    count = 7**(v//6)
    v -= 6*(v//6)
    if v == 5: return count*8
    if v in (4,3): return count*4
    if v in (2,1): return count*2
    return count


def replace_magic_states(g, pick_random=False):
    """This function takes in a ZX-diagram in graph-like form 
    (all spiders fused, only Z spiders, only H-edges between spiders),
    and splits it into a sum over smaller diagrams by using the magic
    state decomposition of Bravyi, Smith, and Smolin (2016), PRX 6, 021043.
    """
    g = g.copy() # We copy here, so that the vertex labels we get will be the same ones if we copy the graph again
    phases = g.phases()

    # First we find 6 T-like spiders
    boundary = []
    internal = []
    gadgets = []
    ranking = dict()
    for v in g.vertices():
        if not phases[v] or phases[v].denominator != 4: continue

        ### begin AK changes ....
        deg = g.vertex_degree(v)
        if g.vertex_degree(v) == 1:
            w = list(g.neighbours(v))[0]
            if g.type(w) == 1:
                gadgets.append(v)
                deg = g.vertex_degree(w)-1

        if any(w in g.inputs or w in g.outputs for w in g.neighbours(v)):
            boundary.append(v)
        else:
            internal.append(v)
        ranking[v] = deg
        ### ... end AK changes

    if len(ranking) >= 6: num_replace = 6
    elif len(ranking) >= 2: num_replace = 2
    elif len(ranking) == 1: num_replace = 1
    else: raise Exception("No magic states to replace")

    if not pick_random:
        candidates = sorted(ranking.keys(), key=lambda v: ranking[v], reverse=True)[:num_replace]
    else:
        if not isinstance(pick_random,bool):
            random.seed(pick_random)
        candidates = random.sample(ranking.keys(),num_replace)

    graphs = []
    if num_replace == 6:
        replace_functions = [replace_B60, replace_B66, replace_E6, replace_O6, replace_K6, replace_phi1, replace_phi2]
    if num_replace == 2:
        replace_functions = [replace_2_S, replace_2_N]
    if num_replace == 1:
        replace_functions = [replace_1_0, replace_1_1]
    for func in replace_functions:
        h = func(g.copy(), candidates)
        if num_replace == 6: h.scalar.add_float(MAGIC_GLOBAL)
        graphs.append(h)

    return SumGraph(graphs)

def replace_B60(g, verts):
    g.scalar.add_float(MAGIC_B60)
    g.scalar.add_power(-6)
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
    return g

def replace_B66(g, verts):
    g.scalar.add_float(MAGIC_B66)
    g.scalar.add_power(-6)
    g.scalar.add_phase(Fraction(1))
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        g.add_to_phase(v,Fraction(1))
    return g

def replace_E6(g, verts):
    g.scalar.add_float(MAGIC_E6)
    g.scalar.add_power(4)
    g.scalar.add_phase(Fraction(1,2))
    av = 0
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        g.add_to_phase(v, Fraction(1,2))
        av += g.row(v)
    w = g.add_vertex(1,-1,av/6,Fraction(1))
    g.add_edges([(v,w) for v in verts],2)
    return g

def replace_O6(g, verts):
    g.scalar.add_float(MAGIC_O6)
    g.scalar.add_power(4)
    g.scalar.add_phase(Fraction(1,2))
    av = 0
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        g.add_to_phase(v, Fraction(1,2))
        av += g.row(v)
    w = g.add_vertex(1,-1,av/6,Fraction(0))
    g.add_edges([(v,w) for v in verts],2)
    return g

def replace_K6(g, verts):
    g.scalar.add_float(MAGIC_K6)
    g.scalar.add_power(5)
    g.scalar.add_phase(Fraction(1,4))
    av = 0
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        av += g.row(v)
    w = g.add_vertex(1,-1,av/6,Fraction(3,2))
    g.add_edges([(v,w) for v in verts],1)
    return g

def replace_phi1(g, verts):
    g.scalar.add_float(MAGIC_PHI)
    g.scalar.add_power(9)
    g.scalar.add_phase(Fraction(3,2))
    w6 = g.add_vertex(1,-1, g.row(verts[5])+0.5, Fraction(1))
    g.add_to_phase(verts[5],Fraction(-1,4))
    g.add_edge((verts[5],w6))
    ws = []
    for v in verts[:-1]:
        g.add_to_phase(v,Fraction(-1,4))
        w = g.add_vertex(1,-1, g.row(v)+0.5)
        g.add_edges([(w6,w),(v,w)],2)
        ws.append(w)
    w1,w2,w3,w4,w5 = ws
    g.add_edges([(w1,w3),(w1,w4),(w2,w4),(w2,w5),(w3,w5)],2)
    return g

def replace_phi2(g, verts):
    v1,v2,v3,v4,v5,v6 = verts
    verts = [v1,v2,v4,v5,v6,v3]
    return replace_phi1(g,verts)


def replace_2_S(g, verts):
    w = g.add_vertex(1,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, Fraction(1,2))
    g.add_edges([(verts[0],w),(verts[1],w)],1)
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g


def replace_2_N(g, verts):
    g.scalar.add_phase(Fraction(1,4))
    w = g.add_vertex(1,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, Fraction(1,1))
    g.add_edges([(verts[0],w),(verts[1],w)],2)
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g

def replace_1_0(g, verts):
    g.scalar.add_power(-1)
    w = g.add_vertex(1,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, 0)
    g.add_edge((verts[0],w),2)
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g

def replace_1_1(g, verts):
    g.scalar.add_phase(Fraction(1,4))
    g.scalar.add_power(-1)
    w = g.add_vertex(1,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, Fraction(1,1))
    g.add_edge((verts[0],w),2) 
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g