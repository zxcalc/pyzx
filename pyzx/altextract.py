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


# permute the rows of "m" such that as many rows as possible have
# 1s in position given by "pos"
# TODO: this can be done in poly-time with graph matching algo
# (e.g. Hopcroft-Karp)
def ones_in_pos(m, pos):
    winner = -1

    perm = None
    for p in itertools.permutations(range(m.rows())):
        score = sum(m[p[i],pos[i]] for i in range(m.rows()))
        if score > winner:
            winner = score
            perm = p
        if score == m.rows():
            break
    m1 = m.copy()

    for i in range(m.rows()):
        m[perm[i],:] = m1[i,:]

# produce a parity matrix that extracts all of the extractable
# vertices in convenient places and ignores the rest
def compute_row_ops(m):
    ops = Mat2.id(m.rows())
    m1 = m.copy()
    m1.gauss(full_reduce=True,x=ops)
    #extr_rows = [r for r,row in enumerate(m1.data) if sum(row)==1]

    # keep only the rows corresponding to extractable verts
    #ops_rows = []
    ops_rows = [ops.data[r]
                   for r,row in enumerate(m1.data)
                   if sum(row)==1]
    #ops_rows.sort(key=lambda row: sum(row), reverse=False)
    ops_rows.sort(reverse=True)
    #ops_rows = ops_rows[0:2]
    ops = Mat2(ops_rows)


    # for r,row in enumerate(m1.data):
    #     if sum(row)==1:
    #         ops_rows.append(ops.data[r])
    # ops = Mat2(ops_rows)
    # ops = Mat2([ops.data[r]
    #               for r,row in enumerate(m1.data)
    #               if sum(row)==1])
    # list.sort(ops.data, reverse=True)
    
    # find pivot columns
    pivot_cols = []
    ops.copy().gauss(pivot_cols=pivot_cols)
    #ones_in_pos(ops,pivot_cols)

    # augment ops by adding unit vectors for all non-pivot columns
    ops2 = Mat2.id(m.rows())
    for r in range(ops.rows()):
        ops2[pivot_cols[r],:] = ops[r,:]
    return ops2


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

        # And now on to CZ gates
        cz_mat = Mat2([[0 for i in range(g.qubit_count())] for j in range(g.qubit_count())])
        for v in frontier:
            for w in list(g.neighbors(v)):
                if w in frontier:
                    cz_mat.data[qubit_map[v]][qubit_map[w]] = 1
                    cz_mat.data[qubit_map[w]][qubit_map[v]] = 1
                    g.remove_edge(g.edge(v,w))

        if optimize_czs:
            overlap_data = max_overlap(cz_mat)
            while len(overlap_data[1]) > 2: #there are enough common qubits to be worth optimizing
                i,j = overlap_data[0][0], overlap_data[0][1]
                czs_saved += len(overlap_data[1])-2
                c.add_gate("CNOT",i,j)
                for qb in overlap_data[1]:
                    c.add_gate("CZ",j,qb)
                    cz_mat.data[i][qb]=0
                    cz_mat.data[j][qb]=0
                    cz_mat.data[qb][i]=0
                    cz_mat.data[qb][j]=0
                c.add_gate("CNOT",i,j)
                overlap_data = max_overlap(cz_mat)

        for i in range(g.qubit_count()):
            for j in range(i+1,g.qubit_count()):
                if cz_mat.data[i][j]==1:
                    c.add_gate("CZ",i,j)
        
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
        ops = compute_row_ops(m)
        m1 = ops * m


        cnots = None
        blocksize = math.ceil(math.log(g.qubit_count(),2)) * 2
        winner = -1
        for bs in range(1,blocksize):
            cnots1 = CNOT_tracker(g.qubit_count())
            ops.copy().gauss(full_reduce=True,
                y=cnots1, blocksize=bs)
            if winner == -1 or len(cnots1.gates) < winner:
                cnots = cnots1

        #return m, ops

        connectivity_from_biadj(g,m1,neighbors,frontier)

        good_verts = dict()
        for i, row in enumerate(m1.data):
            if sum(row) == 1:
                v = frontier[i]
                w = neighbors[[j for j in range(len(row)) if row[j]][0]]
                good_verts[v] = w
        
        #if not quiet: print("good_verts:", good_verts)
        if not good_verts: #raise Exception("No extractable vertex found. Something went wrong")
            print("No extractable vertex found. Something went wrong")
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