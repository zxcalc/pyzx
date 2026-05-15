# Moved from pyzx/simulate.py

import random
import math
sq2 = math.sqrt(2)
#omega = (1+1j)/sq2
from fractions import Fraction
from typing import List, Optional, Dict, Tuple, Any

import numpy as np

from ..utils import EdgeType, FractionLike, VertexType, toggle_vertex, toggle_edge, ave_pos
from .. import simplify
from ..circuit import Circuit
from ..graph.base import BaseGraph,VT,ET
from ..symbolic import Poly

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
            simplify.full_reduce(g)
            if not g.scalar.is_zero: terms.append(g)
            elif not quiet: print("Graph {:d} is zero".format(i))
        self.graphs = terms

    def reduce_scalar(self, quiet:bool=True) -> None:
        terms = []
        for i, g in enumerate(self.graphs):
            if not quiet:
                print("Graph {:d}:".format(i))
            simplify.reduce_scalar(g)
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

def gen_catlike_term(g_initial: BaseGraph[VT, ET],
                     vertices: List[VT],
                     ph_base: FractionLike,
                     ph_central: FractionLike,
                     ph_appendix: FractionLike,
                     eType_base: EdgeType,
                     eType_appendix: EdgeType,
                     scal_positive: bool,
                     scal_power: int,
                     scal_phase: FractionLike,
                     pi_case: bool = False) -> BaseGraph[VT, ET]:
    """Insert a term from a cat or magic5 decomposition into a graph.

    Used for constructing graph terms with local structure of the form of the
    right-hand side terms of the cat (and magic5) decompositions seen in
    https://arxiv.org/pdf/2202.09202.

    For example, consider the magic5 decomposition in this above paper. Here,
    we exchange 5 T-spiders (verts) of our graph (gInit) for three catlike
    terms.

    The third and final such term has:
        - Phase pi/2 on each of the 5 outgoing edges,
        i.e. ph_base=Fraction(1, 2)
        - Phase 0 on the inner central spider to which the others are
        connected, i.e. ph_central=0
        - Phase pi/4 on the outstanding one-legged 'appendix' spider,
        i.e. ph_appendix=Fraction(1, 4)
        - Hadamard edges connecting each of the outgoing spiders to the inner
        central spider, i.e. eType_base=EdgeType.HADAMARD
        - Hadamard edge connecting the appendix spider to the central spider,
        i.e. eType_appendix=EdgeType.HADAMARD.
        - A negative sign on the scalar factor, i.e. scal_positive=False
        - A sqrt(2)^3 factor in its scalar, i.e. scal_power=3
        - An e^{i*pi/4} factor in its scalar, i.e. scal_phase=Fraction(1, 4)

    The `pi_case` parameter is used to handle the case where the phase of the
    Clifford spider in the state being decomposed is pi.
    """
    g = g_initial.clone()

    # Handle central phase for pi case
    if pi_case:
        ph_central += 1

    # Add the scalar factor
    g.scalar.add_power(scal_power)
    g.scalar.add_phase(scal_phase if scal_positive else scal_phase + 1)

    # Add the central and appendix vertices
    new_v1 = g.add_vertex(qubit=-1, row=-1, ty=VertexType.Z, phase=ph_central)
    new_v2 = g.add_vertex(qubit=-2, row=-1, ty=VertexType.Z, phase=ph_appendix)

    # Connect the appendix vertex to the central vertex
    g.add_edge((new_v1, new_v2), eType_appendix)

    # Connect the central vertex to the outgoing vertices
    # and give each outgoing vertex the appropriate phase
    for i, v in enumerate(vertices):
        phase_change = ph_base
        # Handle pi case. We make an arbitrary choice of the last vertex
        # as where to apply the correction.
        if pi_case and i == len(vertices) - 1:
            phase_change -= Fraction(1, 2)
            phase_change *= -1
        # Subtracting pi/4 and adding ph_base is equivalent to
        # unfusing, decomposing, then refusing.
        phase_change -= Fraction(1, 4)

        g.add_to_phase(v, phase_change)
        g.add_edge((v, new_v1), eType_base)

    return g

def check_catn(g: BaseGraph[VT, ET], vertex: VT, n: int) -> bool:
    """Ensure cat `n` decomposition is applicable to a vertex of graph `g`."""
    if n not in (3, 4, 5, 6):
        raise NotImplementedError(f'Cat {n} decomposition not implemented. '
                         + 'Try cat3, cat4, cat5, or cat6 instead.')

    if vertex not in g.vertices():
        raise ValueError(f'Vertex {vertex} does not exist in graph')

    phase = g.phase(vertex)
    if phase % 1 != 0:
        raise ValueError(f'The cat {n} decomposition function can only be '
                         + 'applied to a phaseless or pi-phase spider, but '
                         + f'specified vertex has phase {phase}')
    neighbors = g.neighbors(vertex)
    if len(neighbors) != n:
        raise ValueError(f'The cat {n} decomposition acts on a degree {n} '
                         + 'spider, but specified vertex has degree '
                         + str(len(neighbors)))

    vertex_type = g.type(vertex)
    for neighbor in neighbors:
        neighbor_type = g.type(neighbor)
        edge_type = g.edge_type(g.edge(vertex, neighbor))
        if (
          (edge_type != EdgeType.HADAMARD
           or neighbor_type != vertex_type)
          and
          (edge_type != EdgeType.SIMPLE
           or neighbor_type != toggle_vertex(vertex_type))
          ):
            raise ValueError(
                f'The cat {n} decomposition must act on a spider with {n} '
                + 'opposite colour neighbours '
                + '(or like-coloured with Hadamard edges).')

    return True