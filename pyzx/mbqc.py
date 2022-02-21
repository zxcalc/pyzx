from . import Graph
from .graph.base import BaseGraph
from .utils import VertexType, EdgeType, FractionLike

from fractions import Fraction
from typing import List, Tuple


def cluster_state(m: int, n: int, inputs: List[Tuple[int,int]]=[]) -> BaseGraph:
    """Build a cluster state m qubits tall and n qubits wide. Optionally, give a list of grid positions
    which serve as inputs."""
    g = Graph()
    vs = [[g.add_vertex(VertexType.Z, qubit=2*q,row=2*r) for r in range(n)] for q in range(m)]
    inp = []
    outp = []
    for q in range(m):
        for r in range(n):
            if q < m-1: g.add_edge((vs[q][r], vs[q+1][r]), edgetype=EdgeType.HADAMARD)
            if r < n-1: g.add_edge((vs[q][r], vs[q][r+1]), edgetype=EdgeType.HADAMARD)
            o = g.add_vertex(VertexType.BOUNDARY, qubit=2*q-0.8, row=2*r+0.8)
            g.add_edge((vs[q][r], o))
            outp.append(o)
            
            if (q,r) in inputs:
                i = g.add_vertex(VertexType.BOUNDARY, qubit=2*q+0.8, row=2*r-0.8)
                g.add_edge((vs[q][r], i))
                inp.append(i)

    g.set_inputs(tuple(inp))
    g.set_outputs(tuple(outp))
    return g

def measure(g:BaseGraph, pos:Tuple[int,int], t:VertexType.Type=VertexType.Z, phase:FractionLike=0):
    """Measure the qubit at the given grid position, basis, and phase."""
    q = 2*pos[0]-0.8
    r = 2*pos[1]+0.8
    found = False
    if not isinstance(phase, Fraction): phase = Fraction(phase)
    outputs = list(g.outputs())
    for v in g.vertices():
        if g.qubit(v) == q and g.row(v) == r:
            found = True
            if v in outputs:
                outputs.remove(v)
                g.set_type(v, t)
                g.set_phase(v, phase)
            else:
                raise ValueError("Already measured")
    g.set_outputs(tuple(outputs))
    if not found:
        raise ValueError("Couldn't find a qubit at that position")

def apply_pauli(g:BaseGraph, pos:Tuple[int,int], t:VertexType.Type=VertexType.Z, phase:FractionLike=1):
    """Measure the qubit at the given grid position, basis, and phase."""

    if phase == 0:
        return
    elif phase != 1:
        raise ValueError("Phase should be 0 or 1")

    q = 2*pos[0]-0.8
    r = 2*pos[1]+0.8
    found = False
    outputs = g.outputs()
    verts = list(g.vertices())

    for v in verts:
        if g.qubit(v) == q and g.row(v) == r:
            found = True
            if v in outputs:
                ns = list(g.neighbors(v))
                if len(ns) == 1:
                    w = ns[0]
                    if t == g.type(w):
                        g.add_to_phase(w, 1)
                    else:
                        if t == VertexType.X:
                            g.remove_edge((v, w))
                            c = g.add_vertex(VertexType.X, qubit=q+0.4, row=r-0.4, phase=1)
                            g.add_edge((w, c))
                            g.add_edge((c, v))
                        else:
                            ns = [n for n in g.neighbors(w) if n != v]
                            if len(ns) == 1 and g.type(ns[0]) == VertexType.Z:
                                w1 = ns[0]
                                g.set_phase(w, -g.phase(w))
                                g.add_to_phase(w1, 1)
                            else:
                                raise ValueError("Can't perform a Z correction here")
                else:
                    raise ValueError("Expected a single neighbor for boundary vertex")
            else:
                raise ValueError("Already measured")

    if not found:
        raise ValueError("Couldn't find a qubit at that position")
