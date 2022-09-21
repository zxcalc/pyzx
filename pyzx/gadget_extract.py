# type: ignore

# NOTE: this is experimental code, and not fully implemented. Do not expect it to extract circuits.

from .utils import EdgeType, VertexType, toggle_edge
from .linalg import Mat2, Z2
from .simplify import id_simp, tcount
from .rules import apply_rule, pivot, match_spider_parallel, spider
from .circuit import Circuit
from .circuit.gates import Gate, ParityPhase, CNOT, HAD, ZPhase, XPhase, CZ, CX, SWAP, InitAncilla
from .graph.base import BaseGraph, VT, ET, FractionLike

from typing import List, Optional, Tuple, Dict, Set, Union, Iterator

def is_clifford(g: BaseGraph[VT, ET], v: VT):
    return g.phase(v).denominator <= 2

def is_gadget(g: BaseGraph[VT, ET], v: VT):
    for n in g.neighbors(v):
        if g.type(n) == VertexType.Z and g.vertex_degree(n) == 1:
            return True
    return False

def lc_boundary(g: BaseGraph[VT, ET], q: int, c: Circuit):
    o = g.outputs()[q]
    v = next(g.neighbors(o)) # frontier and qubit q
    nhd = [w for w in g.neighbors(v) if w != o]
    for i in range(len(nhd)):
        g.add_to_phase(nhd[i], Fraction(-1,2))
        for j in range(i+1, len(nhd)):
            g.add_edge_smart(g.edge(nhd[i],nhd[j]), EdgeType.HADAMARD)
    c.prepend_gate(XPhase(Fraction(1,2)))


def gadgetize(g: BaseGraph[VT, ET]):
    verts = list(g.vertices())
    for v in verts:
        if g.type(v) == VertexType.Z and g.vertex_degree(v) > 1 and not is_clifford(g, v):
            r = g.row(v)
            q = g.qubit(v)
            v1 = g.add_vertex(VertexType.Z, qubit = -1, row = r+1)
            v2 = g.add_vertex(VertexType.Z, qubit = -2, row = r+1)
            g.add_edge((v, v1), EdgeType.HADAMARD)
            g.add_edge((v1, v2), EdgeType.HADAMARD)
            g.set_phase(v2, g.phase(v))
            g.set_phase(v, 0)


def remove_h(g: BaseGraph[VT, ET], c: Circuit):
    for q, o in enumerate(g.outputs()):
        e = next(g.incident_edges(o))
        if g.edge_type(e) == EdgeType.HADAMARD:
            c.prepend_gate(HAD(q))
            g.set_edge_type(e, EdgeType.SIMPLE)


def remove_phases(g: BaseGraph[VT, ET], c: Circuit):
    for q, o in enumerate(g.outputs()):
        v = next(g.neighbors(o)) # frontier spider
        if g.type(v) != VertexType.Z: continue
        p = g.phase(v)
        if p != 0:
            c.prepend_gate(ZPhase(p))
            g.set_phase(v, 0)

def remove_czs(g: BaseGraph[VT, ET], c: Circuit):
    outs = g.outputs()
    for i in range(len(outs)):
        v = next(g.neighbors(outs[i]))
        if g.type(v) != VertexType.Z: continue
        for j in range(i+1, len(outs)):
            w = next(g.neighbors(outs[j]))
            if g.type(w) != VertexType.Z: continue
            if g.connected(v, w):
                g.remove_edge(g.edge(v,w))
                c.prepend_gate(CZ(i, j))

def solve_gadget(g: BaseGraph[VT, ET], gd: VT):
    frontier = set(next(g.neighbors(o)) for o in g.ouputs())
    s = set(n for n in g.neighbors(gd) if g.degree(n) != 1 and not n in frontier)
    for f in frontier: s += g.neighbors(f)
    fr = list(frontier)
    nhd = list(s)
    bi_adj = Mat2([[1 if g.connected(fr[i], nhd[j]) else 0
        for i in range(len(fr))]
            for j in range(len(nhd))])
    gd_vec = Mat2([[1 if g.connected(gd, nhd[j]) else 0] for i in range(len(nhd))])
    sln = bi_adj.solve(gd_vec)
    if sln != None:
        return [fr[i] for i in range(len(fr)) if sln[i] == 1]
    else:
        return None

def clean_frontier(g: BaseGraph[VT, ET], c: Circuit):
    found_cliff = True
    while found_cliff:
        found_cliff = False
        remove_h(g, c)
        remove_phases(g, c)
        remove_czs(g, c)
        for o in g.outputs():
            v = next(g.neighbors(0))
            if g.type(v) != VertexType.Z: continue
            for n in g.neighbors(v):
                if g.type(n) == VertexType.Z and is_clifford(g, n) and not is_gadget(g, n):
                    found_cliff = True
                    break
            if found_cliff: break # break all the way out to while loop


def gadget_extract(g: BaseGraph[VT, ET]) -> Circuit:
    c = Circuit(g.num_outputs())
    gadgetize(g)
    clean_frontier(g, c)
    return c
