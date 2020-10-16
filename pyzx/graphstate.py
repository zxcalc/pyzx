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
    for q in range(m):
        for r in range(n):
            if q < m-1: g.add_edge((vs[q][r], vs[q+1][r]), edgetype=EdgeType.HADAMARD)
            if r < n-1: g.add_edge((vs[q][r], vs[q][r+1]), edgetype=EdgeType.HADAMARD)
            o = g.add_vertex(VertexType.BOUNDARY, qubit=2*q-0.5, row=2*r+0.5)
            g.add_edge((vs[q][r], o))
            g.outputs.append(o)
            
            if (q,r) in inputs:
                i = g.add_vertex(VertexType.BOUNDARY, qubit=2*q+0.5, row=2*r-0.5)
                g.add_edge((vs[q][r], i))
                g.inputs.append(i)
    return g

def measure(g:BaseGraph, pos:Tuple[int,int], t:VertexType.Type=VertexType.Z, phase:FractionLike=0):
    """Measure the qubit at the given grid position, basis, and phase."""
    q = 2*pos[0]-0.5
    r = 2*pos[1]+0.5
    found = False
    if not isinstance(phase, Fraction): phase = Fraction(phase)
    for v in g.vertices():
        if g.qubit(v) == q and g.row(v) == r:
            found = True
            if v in g.outputs:
                g.outputs.remove(v)
                g.set_type(v, t)
                g.set_phase(v, phase)
            else:
                raise ValueError("Already measured")
    if not found:
        raise ValueError("Couldn't find a qubit at that position")
