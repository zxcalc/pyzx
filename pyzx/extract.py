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

__all__ = ['extract_circuit']

from fractions import Fraction
import itertools

from .utils import EdgeType, VertexType, toggle_edge
from .linalg import Mat2, Z2
from .simplify import id_simp, tcount
from .rules import apply_rule, pivot, match_spider_parallel, spider
from .circuit import Circuit
from .circuit.gates import Gate, ParityPhase, CNOT, HAD, ZPhase, CZ, InitAncilla

from .graph.base import BaseGraph, VT, ET

from typing import List, Optional, Tuple, Dict, Set, Union


def bi_adj(g: BaseGraph[VT,ET], vs:List[VT], ws:List[VT]) -> Mat2:
	"""Construct a biadjacency matrix between the supplied list of vertices
	``vs`` and ``ws``."""
    return Mat2([[1 if g.connected(v,w) else 0 for v in vs] for w in ws])

def connectivity_from_biadj(
		g: BaseGraph[VT,ET], 
		m: Mat2, 
		left:List[VT], 
		right: List[VT], 
		edgetype:EdgeType.Type=EdgeType.HADAMARD):
	"""Replace the connectivity in ``g`` between the vertices in ``left`` and ``right``
	by the biadjacency matrix ``m``. The edges will be of type ``edgetype``."""
    for i in range(len(right)):
        for j in range(len(left)):
            if m.data[i][j] and not g.connected(right[i],left[j]):
                g.add_edge(g.edge(right[i],left[j]),edgetype)
            elif not m.data[i][j] and g.connected(right[i],left[j]):
                g.remove_edge(g.edge(right[i],left[j]))

def streaming_extract(
		g:BaseGraph[VT,ET], 
		optimize_czs:bool=True, 
		optimize_cnots:int=2, 
		quiet:bool=True
		) -> Circuit:
    print("This function is deprecated. Call extract_circuit() instead.")
    return extract_circuit(g, optimize_czs, optimize_cnots, quiet)

def permutation_as_swaps(perm:Dict[int,int]) -> List[Tuple[int,int]]:
    """Returns a series of swaps that realises the given permutation. 

    Args:
    	perm: A dictionary where both keys and values take values in 0,1,...,n."""
    swaps = []
    l = [perm[i] for i in range(len(perm))]
    pinv = {v:k for k,v in perm.items()}
    linv = [pinv[i] for i in range(len(pinv))]
    for i in range(len(perm)):
        if l[i] == i: continue
        t1 = l[i]
        t2 = linv[i]
        swaps.append((i,t2))
        #l[i] = i
        #linv[i] = i
        l[t2] = t1
        linv[t1] = t2
    return swaps


def column_optimal_swap(m: Mat2) -> Dict[int,int]:
    """Given a matrix m, tries to find a permutation of the columns such that
    there are as many ones on the diagonal as possible. 
    This reduces the number of row operations needed to do Gaussian elimination.
    """
    r, c = m.rows(), m.cols()
    connections:  Dict[int,Set[int]] = {i: set() for i in range(r)}
    connectionsr: Dict[int,Set[int]] = {j: set() for j in range(c)}

    for i in range(r):
            for j in range(c):
                if m.data[i][j]: 
                    connections[i].add(j)
                    connectionsr[j].add(i)

    target = _find_targets(connections, connectionsr)
    if target is None: target = dict()
    #target = {v:k for k,v in target.items()}
    left = list(set(range(c)).difference(target.values()))
    right = list(set(range(c)).difference(target.keys()))
    for i in range(len(left)):
        target[right[i]] = left[i]
    return target

def _find_targets(
		conn: Dict[int,Set[int]], 
		connr: Dict[int,Set[int]], 
		target:Dict[int,int]={}
		) -> Optional[Dict[int,int]]:
	"""Helper function for :func:`column_optimal_swap`.
	Recursively makes a choice for a permutation that places additional ones on the diagonal.
	Backtracks when it gets stuck in an unfavorable configuration."""
    target = target.copy()
    r = len(conn)
    c = len(connr)
    
    claimedcols = set(target.keys())
    claimedrows = set(target.values())
    
    while True:
        min_index = -1
        min_options = set(range(1000))
        for i in range(r):
            if i in claimedrows: continue
            s = conn[i] - claimedcols # The free columns
            if len(s) == 1:
                j = s.pop()
                target[j] = i
                claimedcols.add(j)
                claimedrows.add(i)
                break
            if len(s) == 0: return None # contradiction
            found_col = False
            for j in s:
                t = connr[j] - claimedrows
                if len(t) == 1: # j can only be connected to i
                    target[j] = i
                    claimedcols.add(j)
                    claimedrows.add(i)
                    found_col = True
                    break
            if found_col: break
            if len(s) < len(min_options):
                min_index = i
                min_options = s
        else: # Didn't find any forced choices
            if not (conn.keys() - claimedrows): # we are done
                return target
            if min_index == -1: raise ValueError("This shouldn't happen ever")
            # Start depth-first search
            tgt = target.copy()
            #print("backtracking on", min_index)
            for i2 in min_options:
                #print("trying option", i2)
                tgt[i2] = min_index
                new_target = _find_targets(conn, connr, tgt)
                if new_target: return new_target
            #print("Unsuccessful")
            return target


def xor_rows(l1: List[Z2], l2: List[Z2]) -> List[Z2]:
    return [0 if l1[i]==l2[i] else 1 for i in range(len(l1))]

def find_minimal_sums(m: Mat2) -> Optional[Tuple[int,...]]:
    """Returns a list of rows in m that can be added together to reduce one of the rows so that
    it only contains a single 1. Used in :func:`greedy_reduction`"""
    r = m.rows()
    d = m.data
    if any(sum(r)==1 for r in d): return tuple()
    combs:  Dict[Tuple[int,...],List[Z2]] = {(i,):d[i] for i in range(r)}
    combs2: Dict[Tuple[int,...],List[Z2]] = {}
    iterations = 0
    while True:
        combs2 = {}
        for index,l in combs.items():
            for k in range(max(index)+1,r):
                #Unrolled xor_rows(combs[index],d[k])
                row: List[Z2] = [0 if v1==v2 else 1 for v1,v2 in zip(combs[index],d[k])]
                #row = xor_rows(combs[index],d[k])
                if sum(row) == 1:
                    return (*index,k)
                combs2[(*index,k)] = row
                iterations += 1
            if iterations > 100000:
                return None
        if not combs2:
            return None
            #raise ValueError("Irreducible input has been given")
        combs = combs2

def greedy_reduction(m: Mat2) -> Optional[List[Tuple[int,int]]]:
    """Returns a list of tuples (r1,r2) that specify which row should be added to which other row
    in order to reduce one row of m to only contain a single 1. 
    Used in :func:`extract_circuit`"""
    indicest = find_minimal_sums(m)
    if indicest is None: return indicest
    indices = list(indicest)
    rows = {i:m.data[i] for i in indices}
    weights = {i: sum(r) for i,r in rows.items()}
    result = []
    while len(indices)>1:
        best = (-1,-1)
        reduction = -10000
        for i in indices:
            for j in indices:
                if j <= i: continue
                w = sum(xor_rows(rows[i],rows[j]))
                if weights[i] - w > reduction:
                    best = (j,i) # "Add row j to i"
                    reduction = weights[i] - w
                if weights[j] - w > reduction:
                    best = (i,j)
                    reduction = weights[j] - w
        result.append(best)
        control, target = best
        rows[target] = xor_rows(rows[control],rows[target])
        weights[target] = weights[target] - reduction
        indices.remove(control)
    return result

# O(N^3)
def max_overlap(cz_matrix: Mat2) -> Tuple[Tuple[int,int],List[int]]:
    """Given an adjacency matrix of qubit connectivity of a CZ circuit, returns:
    a) the rows which have the maximum inner product
    b) the list of common qubits between these rows.
    Used in :func:`extract_circuit` to more optimally place CZ gates. 
    """
    N = len(cz_matrix.data[0])

    max_inner_product = 0
    final_common_qbs = list()
    overlapping_rows = (-1,-1)
    for i in range(N):
        for j in range(i+1,N):
            inner_product = 0
            i_czs = 0
            j_czs = 0
            common_qbs = list()
            for k in range(N):
                i_czs += cz_matrix.data[i][k]
                j_czs += cz_matrix.data[j][k]

                if cz_matrix.data[i][k]!=0 and cz_matrix.data[j][k]!=0:
                    inner_product+=1
                    common_qbs.append(k)

            if inner_product > max_inner_product:
                max_inner_product = inner_product
                if i_czs < j_czs:
                    overlapping_rows = (j,i)
                else:
                    overlapping_rows = (i,j)
                final_common_qbs = common_qbs
    return (overlapping_rows,final_common_qbs)

def filter_duplicate_cnots(cnots: List[CNOT]) -> List[CNOT]:
	"""Cancels adjacent CNOT gates in a list of CNOT gates."""
    from .optimize import basic_optimization
    qubits = max([max(cnot.control,cnot.target) for cnot in cnots]) + 1
    c = Circuit(qubits)
    c.gates = cnots.copy() # type: ignore
    c = basic_optimization(c,do_swaps=False)
    return c.gates # type: ignore

def extract_circuit(
		g:BaseGraph[VT,ET], 
		optimize_czs:bool=True, 
		optimize_cnots:int=2, 
		quiet:bool=True
		) -> Circuit:
    """Given a graph put into semi-normal form by :func:`~pyzx.simplify.full_reduce`, 
    it extracts its equivalent set of gates into an instance of :class:`~pyzx.circuit.Circuit`.
    This function implements a more optimized version of the algorithm described in
    `There and back again: A circuit extraction tale <https://arxiv.org/abs/2003.01664>`_

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
            n = list(g.neighbours(v))[0]
            gadgets[n] = v
    
    qubit_map: Dict[VT,int] = dict()
    frontier = []
    for i,o in enumerate(g.outputs):
        v = list(g.neighbours(o))[0]
        if v in g.inputs: continue
        frontier.append(v)
        qubit_map[v] = i
        
    czs_saved = 0
    q: Union[float,int]
    
    while True:
        # preprocessing
        for v in frontier: # First removing single qubit gates
            q = qubit_map[v]
            b = [w for w in g.neighbours(v) if w in g.outputs][0]
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
            for w in list(g.neighbours(v)):
                if w in frontier:
                    cz_mat.data[qubit_map[v]][qubit_map[w]] = 1
                    cz_mat.data[qubit_map[w]][qubit_map[v]] = 1
                    g.remove_edge(g.edge(v,w))
        
        if optimize_czs:
            overlap_data = max_overlap(cz_mat)
            while len(overlap_data[1]) > 2: #there are enough common qubits to be worth optimising
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
        neighbour_set = set()
        for v in frontier.copy():
            d = [w for w in g.neighbours(v) if w not in g.outputs]
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
            neighbour_set.update(d)
        
        if not frontier: break # No more vertices to be processed. We are done.
        
        # First we check if there is a phase gadget in the way
        removed_gadget = False
        for w in neighbour_set:
            if w not in gadgets: continue
            for v in g.neighbours(w):
                if v in frontier:
                    apply_rule(g,pivot,[(w,v,[],[o for o in g.neighbours(v) if o in g.outputs])]) # type: ignore
                    frontier.remove(v)
                    del gadgets[w]
                    frontier.append(w)
                    qubit_map[w] = qubit_map[v]
                    removed_gadget = True
                    break
        if removed_gadget: # There was indeed a gadget in the way. Go back to the top
            continue
            
        neighbours = list(neighbour_set)
        m = bi_adj(g,neighbours,frontier)
        if all(sum(row)!=1 for row in m.data): # No easy vertex
            if optimize_cnots>1:
                 greedy_operations = greedy_reduction(m)
            else: greedy_operations = None
            if greedy_operations is not None:
                greedy = [CNOT(target,control) for control,target in greedy_operations]
                if (len(greedy)==1 or optimize_cnots<3) and not quiet: print("Found greedy reduction with", len(greedy), "CNOT")
                cnots = greedy
            if not greedy or (optimize_cnots == 3 and len(greedy)>1):
                perm = column_optimal_swap(m)
                perm = {v:k for k,v in perm.items()}
                neighbours2 = [neighbours[perm[i]] for i in range(len(neighbours))]
                m2 = bi_adj(g, neighbours2, frontier)
                if optimize_cnots > 0:
                    cnots = m2.to_cnots(optimize=True)
                else:
                    cnots = m2.to_cnots(optimize=False)
                cnots = filter_duplicate_cnots(cnots) # Since the matrix is not square, the algorithm sometimes introduces duplicates
                if greedy:
                    m3 = m2.copy()
                    for cnot in cnots:
                        m3.row_add(cnot.target,cnot.control)
                    reductions = sum(1 for row in m3.data if sum(row)==1)
                    if greedy and (len(cnots)/reductions > len(greedy)-0.1):
                        if not quiet: print("Found greedy reduction with", len(greedy), "CNOTs")
                        cnots = greedy
                    else:
                        neighbours = neighbours2
                        m = m2
                        if not quiet: print("Gaussian elimination with", len(cnots), "CNOTs")
            # We now have a set of CNOTs that suffice to extract at least one vertex.
            m2 = m.copy()
            for cnot in cnots:
                m2.row_add(cnot.target,cnot.control)
            extractable = set()
            for i, row in enumerate(m2.data):
                if sum(row) == 1:
                    extractable.add(i)
            # We now know which vertices are extractable, and hence the CNOTs on qubits that do not involved
            # these vertices aren't necessary.
            # So first, we get rid of all the CNOTs that happen in the Gaussian elimination after 
            # all the extractable vertices have become extractable
            m2 = m.copy()
            for count, cnot in enumerate(cnots):
                if sum(1 for row in m2.data if sum(row)==1) == len(extractable): #extractable rows equal to maximum
                    cnots = cnots[:count] # So we do not need the remainder of the CNOTs
                    break
                m2.row_add(cnot.target, cnot.control)
            # We now recalculate which vertices were extractable, because the deleted cnots
            # might have acted to swap this vertex around some.
            extractable = set()
            for i, row in enumerate(m2.data):
                if sum(row) == 1:
                    extractable.add(i)
            # And now we try to get rid of some more CNOTs, that can be commuted to the end of the CNOT circuit
            # without changing extractability.
            necessary_cnots = []
            blocked = {i:'A' for i in extractable} # 'A' stands for "blocked for All". 'R' for "blocked for Red", 'G' for "blocked for Green".
            for cnot in reversed(cnots):
                if cnot.target not in blocked and cnot.control not in blocked: continue #CNOT not needed
                should_add = False
                if cnot.target in blocked and blocked[cnot.target] != 'R': 
                    should_add = True
                    blocked[cnot.target] = 'A'
                if cnot.control in blocked and blocked[cnot.control] != 'G':
                    should_add = True
                    blocked[cnot.control] = 'A'
                if cnot.control in extractable: should_add = True
                if cnot.target in extractable: should_add = True
                if not should_add: continue
                necessary_cnots.append(cnot)
                if cnot.control not in blocked: blocked[cnot.control] = 'G' # 'G' stands for Green
                if cnot.target not in blocked: blocked[cnot.target] = 'R' # 'R' stands for Red
            if not quiet: print("Actual realization required", len(necessary_cnots), "CNOTs")
            cnots = []
            for cnot in reversed(necessary_cnots):
                m.row_add(cnot.target,cnot.control)
                cnots.append(CNOT(qubit_map[frontier[cnot.control]],qubit_map[frontier[cnot.target]]))
            #for cnot in cnots:
            #    m.row_add(cnot.target,cnot.control)
            #    c.add_gate("CNOT",qubit_map[frontier[cnot.control]],qubit_map[frontier[cnot.target]])
            connectivity_from_biadj(g,m,neighbours,frontier)
        else:
            if not quiet: print("Simple vertex")
            cnots = []
        good_verts = dict()
        for i, row in enumerate(m.data):
            if sum(row) == 1:
                v = frontier[i]
                w = neighbours[[j for j in range(len(row)) if row[j]][0]]
                good_verts[v] = w
        if not good_verts: raise Exception("No extractable vertex found. Something went wrong")
        hads = []
        for v,w in good_verts.items(): # Update frontier vertices
            hads.append(qubit_map[v])
            #c.add_gate("HAD",qubit_map[v])
            qubit_map[w] = qubit_map[v]
            b = [o for o in g.neighbours(v) if o in g.outputs][0]
            g.remove_vertex(v)
            g.add_edge(g.edge(w,b))
            frontier.remove(v)
            frontier.append(w)
        if not quiet: print("Vertices extracted:", len(good_verts))
        for cnot in cnots: c.add_gate(cnot)
        for h in hads: c.add_gate("HAD",h)
            
    if optimize_czs:
        if not quiet: print("CZ gates saved:", czs_saved)
    # Outside of loop. Finish up the permutation
    id_simp(g,quiet=True) # Now the graph should only contain inputs and outputs
    swap_map = {}
    leftover_swaps = False
    for q,v in enumerate(g.outputs): # Finally, check for the last layer of Hadamards, and see if swap gates need to be applied.
        inp = list(g.neighbours(v))[0]
        if inp not in g.inputs: 
            raise TypeError("Algorithm failed: Not fully reducable")
            return c
        if g.edge_type(g.edge(v,inp)) == 2:
            c.add_gate("HAD", q)
            g.set_edge_type(g.edge(v,inp),EdgeType.SIMPLE)
        q2 = g.inputs.index(inp)
        if q2 != q: leftover_swaps = True
        swap_map[q] = q2
    if leftover_swaps: 
        for t1, t2 in permutation_as_swaps(swap_map):
            c.add_gate("SWAP", t1, t2)
    # Since we were extracting from right to left, we reverse the order of the gates
    c.gates = list(reversed(c.gates))
    return c