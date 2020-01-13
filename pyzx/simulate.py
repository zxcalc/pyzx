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
        for i, g in enumerate(self.graphs):
            if not quiet:
                print("Graph {:d}:".format(i))
            simplify.full_reduce(g, quiet=quiet)

    def reduce_scalar(self, quiet=True):
        for i, g in enumerate(self.graphs):
            if not quiet:
                print("Graph {:d}:".format(i))
            simplify.reduce_scalar(g, quiet=quiet)

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

    if len(ranking) < 6:
        raise Exception("Not enough T states to split. Need at least 6")

    if not pick_random:
        candidates = sorted(ranking.keys(), key=lambda v: ranking[v], reverse=True)[:6]
    else:
        if not isinstance(pick_random,bool):
            random.seed(pick_random)
        candidates = random.sample(ranking.keys(),6)
    # if len(internal) >= 6:
    #     candidates = internal[:6]
    # else:
    #     candidates = internal.copy()
    #     candidates.extend(boundary[:6-len(candidates)])
    # if len(candidates) < 6:
    #     candidates.extend(gadgets[:6-len(candidates)])

    graphs = []
    replace_functions = [replace_B60, replace_B66, replace_E6, replace_O6, replace_K6, replace_phi1, replace_phi2]
    for func in replace_functions:
        h = func(g.copy(), candidates)
        h.scalar.add_float(MAGIC_GLOBAL)
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