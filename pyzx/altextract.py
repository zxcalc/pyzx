from fractions import Fraction
import itertools
import math

from .utils import EdgeType, VertexType, toggle_edge
from .linalg import Mat2, Z2
from .simplify import id_simp, tcount
from .rules import apply_rule, pivot, match_spider_parallel, spider
from .circuit import Circuit
from .circuit.gates import Gate, ParityPhase, CNOT, HAD, ZPhase, CZ, InitAncilla
from .routing.parity_maps import CNOT_tracker
from .graph.base import BaseGraph, VT, ET

from typing import List, Optional, Tuple, Dict, Set, Union

from .extract import bi_adj, connectivity_from_biadj, max_overlap, greedy_reduction, find_minimal_sums, xor_rows, column_optimal_swap

def alt_extract_circuit(
        g:BaseGraph[VT,ET], 
        optimize_czs:bool=True, 
        optimize_cnots:int=2, 
        quiet:bool=True
        ) -> Circuit:
    """
    Experiments with the extractor. (not ready for primetime :)


    Args:
        g: The ZX-diagram graph to be extracted into a Circuit.
        optimize_czs: Whether to try to optimize the CZ-subcircuits by exploiting overlap between the CZ gates
        optimize_cnots: (0,1,2,3) Level of CNOT optimization to apply.
        quiet: Whether to print detailed output of the extraction process.
    """
    qs = g.qubits() # We are assuming that these are objects that update...
    rs = g.rows()   # ...to reflect changes to the graph, so that when...
    ty = g.types()  # ... g.set_row/g.set_qubit is called, these things update directly to reflect that
    phases = g.phases()
    c = Circuit(g.qubit_count())

    gadgets = {}
    for v in g.vertices():
        if g.vertex_degree(v) == 1 and v not in g.inputs and v not in g.outputs:
            n = list(g.neighbors(v))[0]
            gadgets[n] = v
    
    qubit_map: Dict[VT,int] = dict()
    frontier = []
    for i,o in enumerate(g.outputs):
        v = list(g.neighbors(o))[0]
        if v in g.inputs: continue
        frontier.append(v)
        qubit_map[v] = i
        
    czs_saved = 0
    q: Union[float,int]
    
    while True:
        # preprocessing

        for v in frontier: # First removing single qubit gates
            q = qubit_map[v]
            b = [w for w in g.neighbors(v) if w in g.outputs][0]
            e = g.edge(v,b)
            if g.edge_type(e) == 2: # Hadamard edge
                c.add_gate("HAD",q)
                g.set_edge_type(e,1)
            if phases[v]: 
                c.add_gate("ZPhase", q, phases[v])
                g.set_phase(v,0)

        for v in frontier:
            for w in list(g.neighbors(v)):
                if w in frontier:
                    g.add_to_phase(v, Fraction(1,2))
                    g.add_to_phase(w, Fraction(1,2))
                    g.remove_edge(g.edge(v,w))
                    c.add_gate("CZ",g.qubit(v),g.qubit(w))
        
        # Now we can proceed with the actual extraction
        # First make sure that frontier is connected in correct way to inputs
        neighbor_set = set()
        for v in frontier.copy():
            d = [w for w in g.neighbors(v) if w not in g.outputs]
            if any(w in g.inputs for w in d): #frontier vertex v is connected to an input
                if len(d) == 1: # Only connected to input, remove from frontier
                    frontier.remove(v)
                    continue
                # We disconnect v from the input b via a new spider
                b = [w for w in d if w in g.inputs][0]
                q = qs[b]
                r = rs[b]
                w = g.add_vertex(1,q,r+1)
                e = g.edge(v,b)
                et = g.edge_type(e)
                g.remove_edge(e)
                g.add_edge(g.edge(v,w),2)
                g.add_edge(g.edge(w,b),toggle_edge(et))
                d.remove(b)
                d.append(w)
            neighbor_set.update(d)
        
        if not frontier: break # No more vertices to be processed. We are done.
        
        # First we check if there is a phase gadget in the way
        removed_gadget = False
        for w in neighbor_set:
            if w not in gadgets: continue
            for v in g.neighbors(w):
                if v in frontier:
                    apply_rule(g,pivot,[(w,v,[],[o for o in g.neighbors(v) if o in g.outputs])]) # type: ignore
                    frontier.remove(v)
                    del gadgets[w]
                    frontier.append(w)
                    qubit_map[w] = qubit_map[v]
                    removed_gadget = True
                    break
        if removed_gadget: # There was indeed a gadget in the way. Go back to the top
            continue
            
        neighbors = list(neighbor_set)
        m = bi_adj(g,neighbors,frontier)
        cnots = CNOT_tracker(g.qubit_count())
        m1 = m.copy()
        blocksize = max(math.floor(math.log(g.qubit_count(),2))-1, 1)
        m1.gauss(full_reduce=True, y=cnots, blocksize=blocksize)
        connectivity_from_biadj(g,m,neighbors,frontier)

        good_verts = dict()
        for i, row in enumerate(m1.data):
            if sum(row) == 1:
                v = frontier[i]
                w = neighbors[[j for j in range(len(row)) if row[j]][0]]
                good_verts[v] = w
        
        #if not quiet: print("good_verts:", good_verts)
        if not good_verts: #raise Exception("No extractable vertex found. Something went wrong")
            break
        hads = []
        for v,w in good_verts.items(): # Update frontier vertices
            hads.append(qubit_map[v])
            #c.add_gate("HAD",qubit_map[v])
            qubit_map[w] = qubit_map[v]
            b = [o for o in g.neighbors(v) if o in g.outputs][0]
            g.remove_vertex(v)
            g.add_edge(g.edge(w,b))
            frontier.remove(v)
            frontier.append(w)
        if not quiet: print("Vertices extracted:", len(good_verts))
        #for cnot in cnots: c.add_gate(cnot)
        c.add_circuit(cnots)
        for h in hads: c.add_gate("HAD",h)
    return c
    # TODO: finalise