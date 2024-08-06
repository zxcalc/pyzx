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


# Nothing in this file will make sense if you haven't read Section IV of
# https://journals.aps.org/prx/pdf/10.1103/PhysRevX.6.021043
# In particular the text below equation (10) and equation (11) itself.

import random
import math
sq2 = math.sqrt(2)
omega = (1+1j)/sq2
from fractions import Fraction
from typing import List, Optional, Dict, Tuple, Any

import numpy as np

from .utils import EdgeType, VertexType, toggle_vertex, toggle_edge, ave_pos
from . import simplify
from .circuit import Circuit
from .graph.base import BaseGraph,VT,ET
from .symbolic import Poly

MAGIC_GLOBAL = -(7+5*sq2)/(2+2j)
MAGIC_B60 = -16 + 12*sq2
MAGIC_B66 = 96 - 68*sq2
MAGIC_E6 = 10 - 7*sq2
MAGIC_O6 = -14 + 10*sq2
MAGIC_K6 = 7 - 5*sq2
MAGIC_PHI = 10 - 7*sq2

class SumGraph(object):
    """Container class for a sum of ZX-diagrams"""
    graphs: List[BaseGraph]
    def __init__(self, graphs:Optional[List[BaseGraph]]=None) -> None:
        if graphs is not None:
            self.graphs = graphs
        else:
            self.graphs = []
            
    def to_tensor(self) -> np.ndarray:
        if not self.graphs: return np.zeros((1,1))
        t = self.graphs[0].to_tensor(True)
        for i in range(len(self.graphs)-1):
            t = t + self.graphs[i+1].to_tensor(True)
        return t

    def to_matrix(self) -> np.ndarray:
        if not self.graphs: return np.zeros((1,1))
        t = self.graphs[0].to_matrix(True)
        for i in range(len(self.graphs)-1):
            t = t + self.graphs[i+1].to_matrix(True)
        return t

    def full_reduce(self, quiet:bool=True) -> None:
        terms = []
        for i, g in enumerate(self.graphs):
            if not quiet:
                print("Graph {:d}:".format(i))
            simplify.full_reduce(g, quiet=quiet)
            if not g.scalar.is_zero: terms.append(g)
            elif not quiet: print("Graph {:d} is zero".format(i))
        self.graphs = terms

    def reduce_scalar(self, quiet:bool=True) -> None:
        terms = []
        for i, g in enumerate(self.graphs):
            if not quiet:
                print("Graph {:d}:".format(i))
            simplify.reduce_scalar(g, quiet=quiet)
            if not g.scalar.is_zero: terms.append(g)
            elif not quiet: print("Graph {:d} is zero".format(i))
        self.graphs = terms

    def inner_product_with_random_state(self) -> complex:
        """All the graphs should be Clifford states with same amount of outputs.
        We compose them with a random equatorial Clifford effect,
        and we calculate the resulting inner product. 
        Used in the norm estimation algorithm of
        https://arxiv.org/pdf/1808.00128.pdf"""
        terms = self.graphs
        if len(terms) == 0: return 0.0
        q = terms[0].num_outputs()
        # We want to compose g with a random equatorial Clifford effect.
        # In the ZX-calculus this consists of random k*pi/2 phases
        # with connections being a Erdos-Renyi random graph with probability 1/2.
        # We make these spiders by replacing the outputs of the graphs.
        # Generate the data for a random equatorial Clifford effect
        phases = [Fraction(random.randint(0,3),2) for _ in range(q)]
        connections = [(i1,i2) for i1 in range(q) for i2 in range(i1+1,q) if random.random() > 0.5]
        
        val: complex = 0
        for g in terms:
            g = g.copy()
            vs = g.outputs()
            for i, v in enumerate(vs):
                g.set_type(v, VertexType.Z)
                g.set_phase(v, phases[i])
            g.set_outputs(())
            g.add_edges([(vs[i1],vs[i2]) for (i1,i2) in connections],EdgeType.HADAMARD)
            g.scalar.add_power(len(connections))
            # Now that we have composed g with a right sort of effect, 
            # we need to calculate the value of the resulting inner product.
            # Since the diagram is a scalar, full_reduce() will completely annihilate it.
            simplify.full_reduce(g)
            g.remove_isolated_vertices()
            if g.num_vertices() != 0: raise Exception("Diagram wasn't fully reduced")
            val += g.scalar.to_number()
        return val

    def estimate_norm(self, epsilon:float=0.05) -> float:
        """Uses the algorithm of https://arxiv.org/pdf/1808.00128.pdf (p.22)
        to estimate the norm squared of this state."""
        count = int(4*(1/epsilon)**2)
        total = 0.0
        for _ in range(count):
            val = self.inner_product_with_random_state()
            total += abs(val)**2
        return total/count

    def post_select(self, qubits: Dict[int, str]) -> 'SumGraph':
        """Outputs a new GraphSum, where for every term we replace the post-selected
        outputs by an effects. The argument ``qubits`` should be ``{q1:e1, q2:e2,...}``
        where the ``e1,e2,`` etc. are in the set ``{'0', '1', '+', '-'}``."""
        terms = []
        for g in self.graphs:
            g = g.copy()
            outputs = g.outputs()
            for qubit, effect in qubits.items():
                v = outputs[qubit]
                g.set_type(v,VertexType.Z)
                g.scalar.add_power(-1)
                if effect in ('0', '1'): #Push a Hadamard gate out of the spider
                    e = list(g.incident_edges(v))[0]
                    et = g.edge_type(e)
                    g.set_edge_type(e,toggle_edge(et))
                if effect in ('1', '-'):
                    g.set_phase(v,1)
            g.set_outputs(tuple(v for i,v in enumerate(outputs) if i not in qubits))
            terms.append(g)
        return SumGraph(terms)

    def sample(self, 
        qubits: List[int], 
        post_selected:Optional[Dict[int,str]]=None, 
        amount:int=10, 
        epsilon:float=0.05, 
        quiet:bool=True) -> List[List[Tuple[int,int]]]:
        """Implements the weak simulation algorithm of https://arxiv.org/pdf/1808.00128.pdf.
        ``qubits`` should be a list of qubit numbers from which measurement outcomes in the 
        computational basis are to be sampled. ``post_selected`` should be in the format of
        :method:`post_select`. ``amount`` dictates the amount of samples to be taken.
        ``epsilon`` is the error used in the norm estimation.

        Example: ``gsum.sample([1,2,3], {5:'+', 6:'0'}, 20)``
        """
        if post_selected is not None: gsum = self.post_select(post_selected)
        else: gsum = self
        gsum.full_reduce()

        qubit_map = {q:q for q in qubits}
        if post_selected is not None:
            for q in qubits: #If we post-select, this changes which qubit points to which output
                qubit_map[q] -= sum(1 for v in post_selected if v<q)
        norm = gsum.estimate_norm(epsilon)
        if not quiet: print("Estimated original norm:", norm)
        if norm < 0.01 and not quiet: 
            print("Norm very close to zero. Possibly post-selected to zero probability event?")
        probs : Dict[str,float] = {}
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
                    if temp is not None: current = temp
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
                

                

def calculate_path_sum(g: BaseGraph[VT,ET]) -> complex:
    """Input should be a fully reduced scalar graph-like Clifford+T ZX-diagram. 
    Calculates the scalar it represents."""
    if g.num_vertices() < 2: return g.to_tensor().flatten()[0]
    phases = g.phases()
    prefactor = 0
    variable_dict : Dict[VT,int] = dict()
    variables: List[int] = [] # Contains the phases of each of the variables
    czs = []
    xors = dict()
    for v in g.vertices():
        if v in variable_dict: continue
        if not phases[v]: continue #It is the axle of a phase gadget, ignore it
        if g.vertex_degree(v) == 1: # Probably phase gadget
            w = list(g.neighbors(v))[0]
            if not phases[w]: # It is indeed a phase gadget
                targets = set()
                for t in g.neighbors(w):
                    if t == v: continue
                    if t not in variable_dict:
                        variable_dict[t] = len(variables)
                        phase_t = phases[t]
                        if isinstance(phase_t, Poly):
                            raise NotImplementedError("Symbolic phases not supported")
                        variables.append(int(float(phase_t*4)))
                    targets.add(variable_dict[t])
                prefactor += len(targets)-1
                phase_v = phases[v]
                if isinstance(phase_v, Poly):
                    raise NotImplementedError("Symbolic phases not supported")
                xors[frozenset(targets)] = int(float(phase_v*4))
                continue
        variable_dict[v] = len(variables)
        phase_v = phases[v]
        if isinstance(phase_v, Poly):
            raise NotImplementedError("Symbolic phases not supported")
        variables.append(int(float(phase_v*4)))
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
    for tgts, phase in xors.items():
        c.add_gate("ParityPhase", Fraction(phase,4), *list(tgts))
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

def find_stabilizer_decomp(g: BaseGraph[VT,ET]) -> List[BaseGraph[VT,ET]]:
    if simplify.tcount(g) == 0: return [g]
    gsum = replace_magic_states(g, True)
    gsum.reduce_scalar()
    output = []
    for h in gsum.graphs:
        if h.scalar.is_zero: continue
        output.extend(find_stabilizer_decomp(h))
    return output

def max_terms_needed(g: BaseGraph[VT,ET]) -> int:
    """Returns the maximum amount of stabilizer terms that g could be split in
    by :func:``find_stabilizer_decomp``."""
    v = simplify.tcount(g)
    count = 7**(v//6)
    v -= 6*(v//6)
    if v == 5: return count*8
    if v in (4,3): return count*4
    if v in (2,1): return count*2
    return count


def replace_magic_states(g: BaseGraph[VT,ET], pick_random:Any=False) -> SumGraph:
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
    ranking: Dict[VT, int] = dict()
    inputs = g.inputs()
    outputs = g.outputs()
    for v in g.vertices():
        if not phases[v] or phases[v].denominator != 4: continue

        ### begin AK changes ....
        deg = g.vertex_degree(v)
        if g.vertex_degree(v) == 1:
            w = list(g.neighbors(v))[0]
            if g.type(w) == VertexType.Z:
                gadgets.append(v)
                deg = g.vertex_degree(w)-1

        if any(w in inputs or w in outputs for w in g.neighbors(v)):
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
        candidates = random.sample(list(ranking.keys()),num_replace)

    graphs = []
    if num_replace == 6:
        replace_functions = [replace_B60, replace_B66, replace_E6, replace_O6, replace_K6, replace_phi1, replace_phi2]
    elif num_replace == 2:
        replace_functions = [replace_2_S, replace_2_N]
    else:
        replace_functions = [replace_1_0, replace_1_1]

    for func in replace_functions:
        h = func(g.copy(), candidates)
        if num_replace == 6: h.scalar.add_float(MAGIC_GLOBAL)
        graphs.append(h)

    return SumGraph(graphs)

def replace_B60(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_B60)
    g.scalar.add_power(-6)
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
    return g

def replace_B66(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_B66)
    g.scalar.add_power(-6)
    g.scalar.add_phase(Fraction(1))
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        g.add_to_phase(v,Fraction(1))
    return g

def replace_E6(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_E6)
    g.scalar.add_power(4)
    g.scalar.add_phase(Fraction(1,2))
    av = 0.0
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        g.add_to_phase(v, Fraction(1,2))
        av += g.row(v)
    w = g.add_vertex(VertexType.Z,-1,av/6,Fraction(1))
    g.add_edges([(v,w) for v in verts],EdgeType.HADAMARD)
    return g

def replace_O6(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_O6)
    g.scalar.add_power(4)
    g.scalar.add_phase(Fraction(1,2))
    av = 0.0
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        g.add_to_phase(v, Fraction(1,2))
        av += g.row(v)
    w = g.add_vertex(VertexType.Z,-1,av/6,Fraction(0))
    g.add_edges([(v,w) for v in verts],EdgeType.HADAMARD)
    return g

def replace_K6(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_K6)
    g.scalar.add_power(5)
    g.scalar.add_phase(Fraction(1,4))
    av = 0.0
    for v in verts:
        g.add_to_phase(v,Fraction(-1,4))
        av += g.row(v)
    w = g.add_vertex(VertexType.Z,-1,av/6,Fraction(3,2))
    g.add_edges([(v,w) for v in verts],EdgeType.SIMPLE)
    return g

def replace_phi1(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_float(MAGIC_PHI)
    g.scalar.add_power(9)
    g.scalar.add_phase(Fraction(3,2))
    w6 = g.add_vertex(VertexType.Z,-1, g.row(verts[5])+0.5, Fraction(1))
    g.add_to_phase(verts[5],Fraction(-1,4))
    g.add_edge((verts[5],w6))
    ws = []
    for v in verts[:-1]:
        g.add_to_phase(v,Fraction(-1,4))
        w = g.add_vertex(VertexType.Z,-1, g.row(v)+0.5)
        g.add_edges([(w6,w),(v,w)],EdgeType.HADAMARD)
        ws.append(w)
    w1,w2,w3,w4,w5 = ws
    g.add_edges([(w1,w3),(w1,w4),(w2,w4),(w2,w5),(w3,w5)],EdgeType.HADAMARD)
    return g

def replace_phi2(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    v1,v2,v3,v4,v5,v6 = verts
    verts = [v1,v2,v4,v5,v6,v3]
    return replace_phi1(g,verts)


def replace_2_S(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    w = g.add_vertex(VertexType.Z,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, Fraction(1,2))
    g.add_edges([(verts[0],w),(verts[1],w)],EdgeType.SIMPLE)
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g


def replace_2_N(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_phase(Fraction(1,4))
    w = g.add_vertex(VertexType.Z,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, Fraction(1,1))
    g.add_edges([(verts[0],w),(verts[1],w)],EdgeType.HADAMARD)
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g

def replace_1_0(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_power(-1)
    w = g.add_vertex(VertexType.Z,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, 0)
    g.add_edge((verts[0],w),EdgeType.HADAMARD)
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g

def replace_1_1(g: BaseGraph[VT,ET], verts: List[VT]) -> BaseGraph[VT,ET]:
    g.scalar.add_phase(Fraction(1,4))
    g.scalar.add_power(-1)
    w = g.add_vertex(VertexType.Z,g.qubit(verts[0])-0.5, g.row(verts[0])-0.5, Fraction(1,1))
    g.add_edge((verts[0],w),EdgeType.HADAMARD) 
    for v in verts: g.add_to_phase(v,Fraction(-1,4))
    return g

def cut_vertex(g,v):
    """Applies the ``cutting'' decomposition to a vertex, as used in, for example: https://arxiv.org/pdf/2403.10964."""
    g  = g.clone()
    g0 = g.clone()
    g1 = g.clone()
    g0.remove_vertex(v)
    g1.remove_vertex(v)

    n = len(g.neighbors(v))
    g0.scalar.add_power(-n)
    g1.scalar.add_power(-n)
    g1.scalar.add_phase(g.phase(v)) # account for e^(i*pi*alpha) on right branch
    
    vtype = toggle_vertex(g.type(v))

    for i in g.neighbors(v):
        etype = g.edge_type((v,i)) # maintain edge type
        qubit = ave_pos(g.qubit(v),g.qubit(i),1/2)
        row   = ave_pos(g.row(v),g.row(i),1/2)
        
        newV = g0.add_vertex(vtype,qubit,row,0) # add and connect the new vertices
        g0.add_edge((newV,i),etype)
        newV = g1.add_vertex(vtype,qubit,row,1)
        g1.add_edge((newV,i),etype)

    return (g0,g1)

def cut_edge(g,e,ty=1):
    """Applies the ``cutting'' decomposition to an edge, as used in, for example: https://arxiv.org/pdf/2403.10964. The type ty decides whether to cut with Z- branches or X- branches."""
    g  = g.clone()
    g0 = g.clone()
    g1 = g.clone()
    g0.remove_edge(e)
    g1.remove_edge(e)

    etype = g.edge_type(e)

    g0.scalar.add_power(-2)
    g1.scalar.add_power(-2)

    x0,x1 = g.row(e[0]), g.row(e[1])
    y0,y1 = g.qubit(e[0]), g.qubit(e[1])

    qubit1 = ave_pos(y0,y1,1/3)
    row1   = ave_pos(x0,x1,1/3)
    qubit2 = ave_pos(y0,y1,2/3)
    row2   = ave_pos(x0,x1,2/3)
    
    v = g0.add_vertex(ty=ty,qubit=qubit1,row=row1,phase=0)
    g0.add_edge((v,e[0]),1)
    v = g0.add_vertex(ty=ty,qubit=qubit2,row=row2,phase=0)
    g0.add_edge((v,e[1]),etype)

    v = g1.add_vertex(ty=ty,qubit=qubit1,row=row1,phase=1)
    g1.add_edge((v,e[0]),1)
    v = g1.add_vertex(ty=ty,qubit=qubit2,row=row2,phase=1)
    g1.add_edge((v,e[1]),etype)
    
    return (g0,g1)

def cut_wishbone(g,v,neighs,ph):
    """Applies the ``wishbone cut'' (or ``separator cut'') decomposition to vertex v of graph g, pulling out the neighbours ``neighs'' and a phase ``ph'', as used in: [PAPER UPCOMING]."""
    g = g.clone()
    
    for i in neighs:
        if not i in g.neighbors(v):
            raise ValueError("Attempted illegal wishbone cut. Vertex " + str(i) + " is not a neighbor of target vertex " + str(v) + ".")
    
    neighs_left  = set(g.neighbors(v)).symmetric_difference(neighs)
    neighs_right = neighs
    
    phase_left  = g.phase(v) - ph
    phase_right = ph
    
    v_left  = g.add_vertex(qubit=g.qubit(v),row=g.row(v)-0.5,ty=g.type(v),phase=phase_left)
    v_right = g.add_vertex(qubit=g.qubit(v),row=g.row(v)+0.5,ty=g.type(v),phase=phase_right)
    
    for i in neighs_left:  g.add_edge((v_left,i),g.edge_type((v,i)))
    for i in neighs_right: g.add_edge((v_right,i),g.edge_type((v,i)))
    
    g.remove_vertex(v)
    
    #--
    
    gLeft  = g.clone()
    gRight = g.clone()
    
    gRight.add_to_phase(v_left,1)
    gRight.add_to_phase(v_right,1)
    
    return (gLeft,gRight)
