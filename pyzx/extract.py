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

__all__ = ['extract_circuit', 'extract_simple', 'graph_to_swaps', 'extract_clifford_normal_form',
           'lookahead_extract_base', 'lookahead_full', 'lookahead_fast', 'lookahead_extract']

from fractions import Fraction
import itertools

from .utils import EdgeType, VertexType, toggle_edge
from .linalg import Mat2, Z2
from .simplify import id_simp, tcount, full_reduce, is_graph_like, pivot_simp
from .rewrite_rules import *
from .circuit import Circuit
from .circuit.gates import Gate, ParityPhase, CNOT, HAD, ZPhase, XPhase, CZ, XCX, SWAP, InitAncilla

from .graph.base import BaseGraph, VT, ET

from typing import List, Optional, Tuple, Dict, Set, Union, Iterator


def bi_adj(g: BaseGraph[VT,ET], vs:List[VT], ws:List[VT]) -> Mat2:
    """Construct a biadjacency matrix between the supplied list of vertices
    ``vs`` and ``ws``."""
    return Mat2([[1 if g.connected(v,w) else 0 for v in vs] for w in ws])

def connectivity_from_biadj(
        g: BaseGraph[VT,ET], 
        m: Mat2, 
        left:List[VT], 
        right: List[VT], 
        edgetype:EdgeType=EdgeType.HADAMARD):
    """Replace the connectivity in ``g`` between the vertices in ``left`` and ``right``
    by the biadjacency matrix ``m``. The edges will be of type ``edgetype``."""
    for i in range(len(right)):
        for j in range(len(left)):
            if m.data[i][j] and not g.connected(right[i],left[j]):
                g.add_edge((right[i],left[j]),edgetype)
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


def find_minimal_sums(m: Mat2, reversed_search=False) -> Optional[Tuple[int, ...]]:
    """Returns a list of rows in m that can be added together to reduce one of the rows so that
    it only contains a single 1. Used in :func:`greedy_reduction`"""
    r = m.rows()
    d = m.data
    if any(sum(r) == 1 for r in d):
        return tuple()
    combs:  Dict[Tuple[int, ...], List[Z2]] = {(i,): d[i] for i in range(r)}
    combs2: Dict[Tuple[int, ...], List[Z2]] = {}
    iterations = 0
    while True:
        combs2 = {}
        for index, l in combs.items():
            max_index: int = max(index)
            rr: range = range(max_index + 1, r) if not reversed_search else range(r - 1, max_index, -1)
            for k in rr:
                # Unrolled xor_rows(combs[index],d[k])
                row: List[Z2] = [0 if v1 == v2 else 1 for v1, v2 in zip(combs[index], d[k])]
                # row = xor_rows(combs[index],d[k])
                if sum(row) == 1:
                    return (*index, k)
                combs2[(*index, k)] = row
                iterations += 1
            if iterations > 100000:
                return None
        if not combs2:
            return None
            # raise ValueError("Irreducible input has been given")
        combs = combs2


def greedy_reduction(m: Mat2) -> Optional[List[Tuple[int, int]]]:
    """Returns a list of tuples (r1,r2) that specify which row should be added to which other row
    in order to reduce one row of m to only contain a single 1. 
    Used in :func:`extract_circuit` and :func:`lookahead_extract_base`"""
    indicest = find_minimal_sums(m)
    if indicest is None: return indicest
    indices = list(indicest)
    rows = {i:m.data[i] for i in indices}
    weights: Dict[int,int] = {i: sum(r) for i,r in rows.items()}
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


def flat_indices(m: Mat2, indices: List[int]) -> Tuple[List[Tuple[int, int]], int]:
    """Given a matrix and a list of row indices that have to be added together,
    returns a list of row operations and the index of the row that would end up with
    the sum of the input rows.

    When transformed into CNOTs, the depth of the circuit is log_2(len(indices)).

    If the list of indices is empty, returns ([], -1)"""
    if len(indices) == 0:
        return [], -1
    rows = {i: m.data[i] for i in indices}
    weights: Dict[int,int] = {i: sum(r) for i, r in rows.items()}
    result = []
    next_indices = []
    while len(indices) > 1:
        best = (-1, -1)
        reduction = -10000
        for i in indices:
            for j in indices:
                if j <= i: continue
                w = sum(xor_rows(rows[i], rows[j]))
                if weights[i] - w > reduction:
                    best = (j, i)  # "Add row j to i"
                    reduction = weights[i] - w
                if weights[j] - w > reduction:
                    best = (i, j)
                    reduction = weights[j] - w
        result.append(best)
        control, target = best
        rows[target] = xor_rows(rows[control], rows[target])
        weights[target] = weights[target] - reduction
        indices.remove(control)
        indices.remove(target)
        next_indices.append(target)
        if len(indices) <= 1:
            if len(indices) == 1:
                next_indices.append(indices[0])
            indices = next_indices
            next_indices = []
    return result, indices[0]


def greedy_reduction_flat(m: Mat2) -> Optional[List[Tuple[int, int]]]:
    """Returns a list of tuples (r1,r2) that specify which row should be added to which other row
    in order to reduce one row of m to only contain a single 1.
    In contrast to :func:`greedy_reduction`, it performs the brute-force search starting with the
    highest indices, and places the row operations in such a way that the resulting depth is log_2
    of the number of rows that have to be added together.
    Used in :func:`lookahead_extract_base`"""
    indicest = find_minimal_sums(m, True)
    if indicest is None: return indicest
    return flat_indices(m, list(indicest))[0]


def find_2_minimal_sums(m: Mat2) -> Optional[Tuple[Tuple[int, ...], Tuple[int, ...]]]:
    """Returns two lists of rows in m that can be added together to reduce two of the rows so that
    they only contains a single 1. Used in :func:`greedy_two_reduction`"""
    r = m.rows()
    d = m.data
    combs:  Dict[Tuple[int, ...], List[Z2]] = {(i,): d[i] for i in range(r)}
    combs2: Dict[Tuple[int, ...], List[Z2]]
    sum1: Optional[Tuple[int, ...]] = None
    iterations = 0
    while True:
        combs2 = {}
        for index, l in combs.items():
            for k in range(max(index)+1, r):
                row: List[Z2] = [0 if v1 == v2 else 1 for v1, v2 in zip(combs[index], d[k])]
                if sum(row) == 1:
                    if sum1 is None:
                        sum1 = (*index, k)
                    else:
                        return sum1, (*index, k)
                combs2[(*index, k)] = row
                iterations += 1
            if iterations > 100000:
                return None
        if not combs2:
            return None
        combs = combs2


def greedy_two_reduction(m: Mat2) -> Optional[List[Tuple[int, int]]]:
    """Returns a list of tuples (r1,r2) that specify which row should be added to which other row
    in order to reduce two rows (instead of one as the other greedy reductions) of m to only contain a single 1.
    Used in :func:`lookahead_extract`"""
    indicest = find_2_minimal_sums(m)
    if indicest is None:
        return indicest
    s1 = set(indicest[0])
    s2 = set(indicest[1])

    if s2.issubset(s1):
        s3 = s2
        s2 = s1
        s1 = s3
    if s1.issubset(s2):
        res0, r0 = flat_indices(m, list(s1))
        res1, r1 = flat_indices(m, list(s2.difference(s1)))
        res0.extend(res1)
        if r1 == -1:
            # Should never happen
            print("Got the same sets: {}, {}".format(s1, s2))
            return None
        res0.append((r0, r1))
        return res0

    res0, r0 = flat_indices(m, list(s1.intersection(s2)))
    res1, r1 = flat_indices(m, list(s1.difference(s2)))
    res2, r2 = flat_indices(m, list(s2.difference(s1)))
    res0.extend(res1)
    res0.extend(res2)
    if r0 != -1:
        res0.append((r0, r1))
        res0.append((r0, r2))
    return res0


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
    if not cnots: return cnots  # Nothing to do if the list is empty
    qubits = max([max(cnot.control,cnot.target) for cnot in cnots]) + 1
    c = Circuit(qubits)
    c.gates = cnots.copy() # type: ignore
    c = basic_optimization(c,do_swaps=False)
    return c.gates # type: ignore


def remove_extra_cnots(cnots_to_apply: List[CNOT], mat: Mat2) -> List[CNOT]:
    """Remove redundant CNOTs and return a list of only the necessary ones"""
    cnots = cnots_to_apply.copy()
    m2 = mat.copy()
    for cnot in cnots:
        m2.row_add(cnot.target, cnot.control)
    extractable = set()
    for i, row in enumerate(m2.data):
        if sum(row) == 1:
            extractable.add(i)
    # We now know which vertices are extractable, and hence the CNOTs on qubits that do not involve
    # these vertices aren't necessary.
    # So first, we get rid of all the CNOTs that happen in the Gaussian elimination after
    # all the extractable vertices have become extractable
    m2 = mat.copy()
    for count, cnot in enumerate(cnots):
        if sum(1 for row in m2.data if sum(row) == 1) == len(extractable):  # extractable rows equal to maximum
            cnots = cnots[:count]  # So we do not need the remainder of the CNOTs
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
    # 'A' stands for "blocked for All". 'R' for "blocked for Red", 'G' for "blocked for Green".
    blocked = {i: 'A' for i in extractable}
    for cnot in reversed(cnots):
        if cnot.target not in blocked and cnot.control not in blocked:
            continue  # CNOT not needed
        should_add = False
        if cnot.target in blocked and blocked[cnot.target] != 'R':
            should_add = True
            blocked[cnot.target] = 'A'
        if cnot.control in blocked and blocked[cnot.control] != 'G':
            should_add = True
            blocked[cnot.control] = 'A'
        if cnot.control in extractable:
            should_add = True
        if cnot.target in extractable:
            should_add = True
        if not should_add:
            continue
        necessary_cnots.append(cnot)
        if cnot.control not in blocked:
            blocked[cnot.control] = 'G'  # 'G' stands for Green
        if cnot.target not in blocked:
            blocked[cnot.target] = 'R'  # 'R' stands for Red

    return list(reversed(necessary_cnots))


def apply_cnots(g: BaseGraph[VT, ET], c: Circuit, frontier: List[VT], qubit_map: Dict[VT, int],
                cnots: List[CNOT], m: Mat2, neighbors: List[VT]) -> int:
    """Adds the list of CNOTs to the circuit, modifying the graph, frontier, and qubit map as needed.
    Returns the number of vertices that end up being extracted"""
    if len(cnots) > 0:
        cnots2 = cnots
        cnots = []
        for cnot in cnots2:
            m.row_add(cnot.target, cnot.control)
            cnots.append(CNOT(qubit_map[frontier[cnot.control]], qubit_map[frontier[cnot.target]]))
        connectivity_from_biadj(g, m, neighbors, frontier)

    good_verts = dict()
    for i, row in enumerate(m.data):
        if sum(row) == 1:
            v = frontier[i]
            w = neighbors[[j for j in range(len(row)) if row[j]][0]]
            good_verts[v] = w
    if not good_verts:
        raise Exception("No extractable vertex found. Something went wrong")
    hads = []
    outputs = g.outputs()
    for v, w in good_verts.items():  # Update frontier vertices
        hads.append(qubit_map[v])
        # c.add_gate("HAD",qubit_map[v])
        qubit_map[w] = qubit_map[v]
        b = [o for o in g.neighbors(v) if o in outputs][0]
        g.remove_vertex(v)
        g.add_edge((w, b))
        frontier.remove(v)
        frontier.append(w)

    for cnot in cnots:
        c.add_gate(cnot)
    for h in hads:
        c.add_gate("HAD", h)

    return len(good_verts)


def clean_frontier(g: BaseGraph[VT, ET], c: Circuit, frontier: List[VT],
                   qubit_map: Dict[VT, int], optimize_czs: bool = True) -> int:
    """Remove single qubit gates from the frontier and any CZs between the vertices in the frontier
    Returns the number of CZs saved if `optimize_czs` is True; otherwise returns 0"""
    phases = g.phases()
    czs_saved = 0
    outputs = g.outputs()
    for v in frontier:  # First removing single qubit gates
        q = qubit_map[v]
        b = [w for w in g.neighbors(v) if w in outputs][0]
        e = g.edge(v, b)
        if g.edge_type(e) == EdgeType.HADAMARD:
            c.add_gate("HAD", q)
            g.set_edge_type(e, EdgeType.SIMPLE)
        if phases[v]:
            c.add_gate("ZPhase", q, phases[v])
            g.set_phase(v, 0)
    # And now on to CZ gates
    cz_mat = Mat2([[0 for i in range(len(outputs))] for j in range(len(outputs))])
    for v in frontier:
        for w in list(g.neighbors(v)):
            if w in frontier:
                cz_mat.data[qubit_map[v]][qubit_map[w]] = 1
                cz_mat.data[qubit_map[w]][qubit_map[v]] = 1
                g.remove_edge(g.edge(v, w))

    if optimize_czs:
        overlap_data = max_overlap(cz_mat)
        while len(overlap_data[1]) > 2:  # there are enough common qubits to be worth optimizing
            i, j = overlap_data[0][0], overlap_data[0][1]
            czs_saved += len(overlap_data[1]) - 2
            c.add_gate("CNOT", i, j)
            for qb in overlap_data[1]:
                c.add_gate("CZ", j, qb)
                cz_mat.data[i][qb] = 0
                cz_mat.data[j][qb] = 0
                cz_mat.data[qb][i] = 0
                cz_mat.data[qb][j] = 0
            c.add_gate("CNOT", i, j)
            overlap_data = max_overlap(cz_mat)

    for i in range(len(outputs)):
        for j in range(i + 1, len(outputs)):
            if cz_mat.data[i][j] == 1:
                c.add_gate("CZ", i, j)

    return czs_saved


def neighbors_of_frontier(g: BaseGraph[VT, ET], frontier: List[VT]) -> Set[VT]:
    """Returns the set of neighbors of the frontier. When collecting the vertices, it also checks if the vertices
    of the frontier are connected correctly to the inputs.
    If a frontier vertex is only connected to an input, it is removed from the frontier.
    If a frontier vertex is connected to an input and some other vertices, it is disconnected from the input via a new
    spider."""
    qs = g.qubits()
    rs = g.rows()
    neighbor_set = set()
    inputs = g.inputs()
    outputs = g.outputs()
    for v in frontier.copy():
        d = [w for w in g.neighbors(v) if w not in outputs]
        if any(w in inputs for w in d):  # frontier vertex v is connected to an input
            if len(d) == 1:  # Only connected to input, remove from frontier
                frontier.remove(v)
                continue
            # We disconnect v from the input b via a new spider
            b = [w for w in d if w in inputs][0]
            q = qs[b]
            r = rs[b]
            w = g.add_vertex(VertexType.Z, q, r + 1)
            e = g.edge(v, b)
            et = g.edge_type(e)
            g.remove_edge(e)
            g.add_edge((v, w), EdgeType.HADAMARD)
            g.add_edge((w, b), toggle_edge(et))
            d.remove(b)
            d.append(w)
        neighbor_set.update(d)
    return neighbor_set


def remove_gadget(g: BaseGraph[VT, ET], frontier: List[VT], qubit_map: Dict[VT, int],
                  neighbor_set: Set[VT], gadgets: Dict[VT, VT]) -> bool:
    """Removes a gadget that is attached to a frontier vertex. Returns True if such gadget was found, False otherwise"""
    removed_gadget = False
    outputs = g.outputs()
    for w in neighbor_set:
        if w not in gadgets: continue
        for v in g.neighbors(w):
            if v in frontier:
                apply_rule(g, pivot, [((w, v), ([], [o for o in g.neighbors(v) if o in outputs]))])  # type: ignore
                simplify.
                frontier.remove(v)
                del gadgets[w]
                frontier.append(w)
                qubit_map[w] = qubit_map[v]
                removed_gadget = True
                break
    return removed_gadget


def extract_circuit(
        g: BaseGraph[VT, ET],
        optimize_czs: bool = True,
        optimize_cnots: int = 2,
        up_to_perm: bool = False,
        quiet: bool = True
        ) -> Circuit:
    """Given a graph put into semi-normal form by :func:`~pyzx.simplify.full_reduce`, 
    it extracts its equivalent set of gates into an instance of :class:`~pyzx.circuit.Circuit`.
    This function implements a more optimized version of the algorithm described in
    `There and back again: A circuit extraction tale <https://arxiv.org/abs/2003.01664>`_

    Args:
        g: The ZX-diagram graph to be extracted into a Circuit.
        optimize_czs: Whether to try to optimize the CZ-subcircuits by exploiting overlap between the CZ gates
        optimize_cnots: (0,1,2,3) Level of CNOT optimization to apply.
        up_to_perm: If true, returns a circuit that is equivalent to the given graph up to a permutation of the inputs.
        quiet: Whether to print detailed output of the extraction process.

    Warning:
        Note that this function changes the graph `g` in place. 
        In particular, if the extraction fails, the modified `g` shows 
        how far the extraction got. If you want to keep the original `g`
        then input `g.copy()` into `extract_circuit`.
    """

    gadgets = {}
    inputs = g.inputs()
    outputs = g.outputs()

    c = Circuit(len(outputs))

    if not is_graph_like(g):
        raise ValueError("Input graph is not graph-like. Try running full_reduce first")

    for v in g.vertices():
        if g.vertex_degree(v) == 1 and v not in inputs and v not in outputs:
            n = list(g.neighbors(v))[0]
            gadgets[n] = v

    qubit_map: Dict[VT,int] = dict()
    frontier = []
    for i, o in enumerate(outputs):
        v = list(g.neighbors(o))[0]
        if v in inputs:
            continue
        frontier.append(v)
        qubit_map[v] = i

    czs_saved = 0
    q: Union[float, int]
    
    while True:
        # preprocessing
        czs_saved += clean_frontier(g, c, frontier, qubit_map, optimize_czs)
        
        # Now we can proceed with the actual extraction
        # First make sure that frontier is connected in correct way to inputs
        neighbor_set = neighbors_of_frontier(g, frontier)
        
        if not frontier:
            break  # No more vertices to be processed. We are done.
        
        # First we check if there is a phase gadget in the way
        if remove_gadget(g, frontier, qubit_map, neighbor_set, gadgets):
            # There was a gadget in the way. Go back to the top
            continue
            
        neighbors = list(neighbor_set)
        m = bi_adj(g, neighbors, frontier)
        if all(sum(row) != 1 for row in m.data):  # No easy vertex
            if optimize_cnots > 1:
                greedy_operations = greedy_reduction(m)
            else:
                greedy_operations = None

            if greedy_operations is not None:
                greedy = [CNOT(target, control) for control, target in greedy_operations]
                if (len(greedy) == 1 or optimize_cnots < 3) and not quiet:
                    print("Found greedy reduction with", len(greedy), "CNOT")
                cnots = greedy

            if greedy_operations is None or (optimize_cnots == 3 and len(greedy) > 1):
                perm = column_optimal_swap(m)
                perm = {v: k for k, v in perm.items()}
                neighbors2 = [neighbors[perm[i]] for i in range(len(neighbors))]
                m2 = bi_adj(g, neighbors2, frontier)
                if optimize_cnots > 0:
                    cnots = m2.to_cnots(optimize=True)
                else:
                    cnots = m2.to_cnots(optimize=False)
                # Since the matrix is not square, the algorithm sometimes introduces duplicates
                cnots = filter_duplicate_cnots(cnots)

                if greedy_operations is not None:
                    m3 = m2.copy()
                    for cnot in cnots:
                        m3.row_add(cnot.target,cnot.control)
                    reductions = sum(1 for row in m3.data if sum(row) == 1)
                    if greedy and (len(cnots)/reductions > len(greedy)-0.1):
                        if not quiet: print("Found greedy reduction with", len(greedy), "CNOTs")
                        cnots = greedy
                    else:
                        neighbors = neighbors2
                        m = m2
                        if not quiet: print("Gaussian elimination with", len(cnots), "CNOTs")
            # We now have a set of CNOTs that suffice to extract at least one vertex.
        else:
            if not quiet: print("Simple vertex")
            cnots = []

        extracted = apply_cnots(g, c, frontier, qubit_map, cnots, m, neighbors)
        if not quiet: print("Vertices extracted:", extracted)
            
    if optimize_czs:
        if not quiet: print("CZ gates saved:", czs_saved)
    # Outside of loop. Finish up the permutation
    id_simp(g)  # Now the graph should only contain inputs and outputs
    # Since we were extracting from right to left, we reverse the order of the gates
    c.gates = list(reversed(c.gates))
    return graph_to_swaps(g, up_to_perm) + c


def extract_simple(g: BaseGraph[VT, ET], up_to_perm: bool = True) -> Circuit:
    """A simplified circuit extractor that works on graphs with a causal flow (e.g. graphs arising
    from circuits via spider fusion).

    Args:
        g: The graph to extract
        up_to_perm: If true, returns a circuit that is equivalent to the given graph up to a permutation of the inputs.
    """
    
    progress = True
    outputs = g.outputs()
    circ = Circuit(len(outputs))
    while progress:
        progress = False
        
        for q, o in enumerate(outputs):
            if g.vertex_degree(o) != 1:
                raise ValueError("Bad output degree")
            v = list(g.neighbors(o))[0]
            e = g.edge(o, v)
            
            if g.edge_type(e) == EdgeType.HADAMARD:
                progress = True
                circ.prepend_gate(HAD(q))
                g.set_edge_type(e, EdgeType.SIMPLE)
            elif (g.type(v) == VertexType.Z or g.type(v) == VertexType.X) and g.vertex_degree(v) == 2:
                ns = list(g.neighbors(v))
                w = ns[0] if ns[1] == o else ns[1]
                progress = True

                if g.phase(v) != 0:
                    gate = (ZPhase(q, g.phase(v)) if g.type(v) == VertexType.Z else
                            XPhase(q, g.phase(v)))
                    circ.prepend_gate(gate)

                g.add_edge((w,o), edgetype=g.edge_type(g.edge(w,v)))
                g.remove_vertex(v)
                
        if progress: continue
        
        for q1,o1 in enumerate(outputs):
            for q2,o2 in enumerate(outputs):
                if o1 == o2: continue
                v1 = list(g.neighbors(o1))[0]
                v2 = list(g.neighbors(o2))[0]
                if g.connected(v1,v2):
                    if ((g.type(v1) == g.type(v2) and g.edge_type(g.edge(v1,v2)) == EdgeType.SIMPLE) or
                        (g.type(v1) != g.type(v2) and g.edge_type(g.edge(v1,v2)) == EdgeType.HADAMARD)):
                        raise ValueError("ZX diagram is not unitary")
                    
                    if g.type(v1) == VertexType.Z and g.type(v2) == VertexType.X:
                        # CNOT
                        progress = True
                        circ.prepend_gate(CNOT(control=q1,target=q2))
                        g.remove_edge(g.edge(v1,v2))
                    elif g.type(v1) == VertexType.Z and g.type(v2) == VertexType.Z:
                        # CZ
                        progress = True
                        circ.prepend_gate(CZ(control=q1,target=q2))
                        g.remove_edge(g.edge(v1,v2))
                    elif g.type(v1) == VertexType.X and g.type(v2) == VertexType.X:
                        # conjugate CZ
                        progress = True
                        circ.prepend_gate(XCX(control=q1, target=q2))
                        g.remove_edge(g.edge(v1,v2))

    return graph_to_swaps(g, up_to_perm) + circ


def graph_to_swaps(g: BaseGraph[VT, ET], no_swaps: bool = False) -> Circuit:
    """This function expects a graph like circuit as input. Converts a graph containing only normal and Hadamard edges (i.e., no vertices other than
    inputs and outputs) into a circuit of Hadamard and SWAP gates. If 'no_swaps' is True, only add
    Hadamards where needed"""
    swap_map = {}
    leftover_swaps = False
    inputs = g.inputs()
    outputs = g.outputs()

    if not is_graph_like(g):
        raise ValueError("Input graph is not graph-like")

    c = Circuit(len(inputs))

    for q,v in enumerate(outputs): # check for a last layer of Hadamards, and see if swap gates need to be applied.
        inp = list(g.neighbors(v))[0]
        if inp not in inputs: 
            raise TypeError("Algorithm failed: Graph is not fully reduced")
            return c
        if g.edge_type(g.edge(v,inp)) == EdgeType.HADAMARD:
            c.prepend_gate(HAD(q))
            g.set_edge_type(g.edge(v,inp),EdgeType.SIMPLE)
        q2 = inputs.index(inp)
        if q2 != q: leftover_swaps = True
        swap_map[q] = q2
    if not no_swaps and leftover_swaps:
        for t1, t2 in permutation_as_swaps(swap_map):
            c.prepend_gate(SWAP(t1, t2))
    return c


def extract_clifford_normal_form(g: BaseGraph[VT,ET]) -> Circuit:
    """Given a Clifford graph, extracts a circuit that follows the normal form described in
    *Graph-theoretic Simplification of Quantum Circuits with the ZX-calculus* (https://arxiv.org/abs/1902.03178).
    That is, a circuit consisting of layers Had-Phase-CZ-CNOT-Had-CZ-Phase-Had.
    """
    # We prepare the circuit in the same way as we do in simplify.to_clifford_normal_form_graph()
    # To make it foolproof, we process it in the desired way first.
    full_reduce(g)
    g.normalize()
    # At this point the only vertices g should have are those directly connected to an input or an output (and not both).
    if any([((g.phase(v)*4) % 2 != 0) for v in g.vertices()]):  # If any phase is not a multiple of 1/2, then this will fail.
        raise ValueError("Specified graph is not Clifford.")
    
    inputs = list(g.inputs())
    outputs = list(g.outputs())
    v_inputs = [list(g.neighbors(i))[0] for i in inputs] # input vertices should have a unique spider neighbor
    v_outputs = [list(g.neighbors(o))[0] for o in outputs] # input vertices should have a unique spider neighbor

    if len(inputs) != len(outputs):
        raise ValueError("Number of input wires does not match number of output wires. Currently only unitary Clifford extraction is supported.")
    if len(v_inputs) != len(inputs) or len(v_inputs) != len(v_outputs):
        raise ValueError("Something has gone wrong with simplifying the Clifford diagram to the graph normal form.")
    
    c = Circuit(len(inputs))

    for q in range(len(inputs)):
        if g.edge_type(g.edge(inputs[q],v_inputs[q])) == EdgeType.HADAMARD:
            c.add_gate(HAD(q))

    for q in range(len(inputs)):
        phase = g.phase(v_inputs[q])
        if phase != 0:
            c.add_gate(ZPhase(q,phase))

    for q1 in range(len(inputs)):
        for q2 in range(q1+1, len(inputs)):
            if g.connected(v_inputs[q1],v_inputs[q2]):
                c.add_gate(CZ(q1,q2))

    adj = bi_adj(g, v_outputs, v_inputs)
    for cnot in adj.to_cnots(use_log_blocksize=True):
        c.add_gate(cnot)

    for q in range(len(outputs)):
        c.add_gate(HAD(q))

    for q1 in range(len(outputs)):
        for q2 in range(q1+1, len(outputs)):
            if g.connected(v_outputs[q1],v_outputs[q2]):
                c.add_gate(CZ(q1,q2))

    for q in range(len(outputs)):
        phase = g.phase(v_outputs[q])
        if phase != 0:
            c.add_gate(ZPhase(q,phase))

    for q in range(len(outputs)):
        if g.edge_type(g.edge(outputs[q],v_outputs[q])) == EdgeType.HADAMARD:
            c.add_gate(HAD(q))

    return c


class LookaheadNode:
    """
    A class for the lookahead extraction.

    Performs most operations recursively, such as expanding nodes,
    picking next roots, and finding optimal nodes.

    Supports two structures:
        - for CNOT optimisation, each node holds the part of the circuit that it creates
        - for depth optimisation, only the leaves hold circuits

    The correct order of operations for a root is:
    root.expand -> root.get_finished -> root.next_nodes, as used in lookahead_extract_base
    """

    def __init__(self,
                 g: BaseGraph[VT, ET],
                 c: Circuit,
                 frontier: List[VT],
                 qubit_map: Dict[VT, int],
                 gadgets: Dict[VT, VT],
                 opt_depth: bool,
                 hard_limit: int,
                 ext_count: int = 0):
        self.g: BaseGraph[VT, ET] = g
        self.c: Circuit = c
        self.frontier: List[VT] = frontier
        self.qubit_map: Dict[VT, int] = qubit_map
        self.gadgets: Dict[VT, VT] = gadgets
        self.children: List['LookaheadNode'] = []
        self.expanded: bool = False
        self.ext_count: int = ext_count
        self.collected: bool = False
        self.opt_depth: bool = opt_depth
        self.d: int = -1
        self.total_d: int = -1
        self.finished_children: Optional[List[int]] = None
        self.hard_limit: int = hard_limit

    def update_hard_limit(self, new_limit: int):
        self.hard_limit = new_limit
        for child in self.children:
            child.update_hard_limit(new_limit)

    def mark_expanded(self):
        """
        Free the memory once the node is expanded.
        """
        self.expanded = True
        self.g = None
        if self.opt_depth:
            self.c = None
        self.frontier = None
        self.qubit_map = None
        self.gadgets = None

    def stats(self):
        """
        Returns the number of nodes, leaves, and maximum depth
        """
        if len(self.children) == 0:
            return 1, 1, 0
        depth = 0
        nodes = 1
        leaves = 0
        for child in self.children:
            c_n, c_l, c_d = child.stats()
            if c_d > depth:
                depth = c_d
            nodes += c_n
            leaves += c_l
        return nodes, leaves, depth + 1

    def optimal(self, rp: 'RootPicker', d: int = -1):
        """
        Computes the stats for leaves (number of 2 qubit gates or depth) to determine the best nodes.

        Args:
            rp: RootPicker, used to collect the leaves and filter the best ones
            d: for CNOT optimisation only, the total number of two qubit gates of the parent nodes, up to root
        """
        if self.collected:
            # Already checked, not interested in it
            return
        if not self.opt_depth:
            if self.d == -1:
                self.d = get_optimize_value(self.c, False)
            if d == -1:
                d = 0
            d = d + self.d
            self.total_d = d
        if len(self.children) == 0:
            if self.opt_depth:
                if self.total_d == -1:
                    self.total_d = get_optimize_value(self.c, True)
                d = self.total_d
            if -1 < self.hard_limit <= d:
                return
            rp.add_leaf(self, Fraction(d, self.ext_count))
            return
        for child in self.children:
            child.optimal(rp, d)

    def next_nodes(self, min_extracted: int, rp: 'RootPicker', prev_circ: Optional[Circuit] = None, d: int = -1):
        """
        Used to find the next roots. Looks for nodes that fit the parameters, then searches their leaves.

        Args:
            min_extracted: minimum number of vertices extracted for a node to be considered a root
            rp: RootPicker to collect the possible roots and best leaves
            prev_circ: for CNOT optimisation, collect the circuit starting from the root up to the node to assign
            to the node in case it is selected as a next root
            d: for CNOT optimisation, the total number of two qubit gates starting from the root
        """
        if len(self.children) == 0 or self.ext_count > min_extracted:
            rp.add_possible_root(self, prev_circ, d)
            self.optimal(rp, d)
            return
        if not self.opt_depth:
            if self.d == -1:
                self.d = get_optimize_value(self.c, False)
            prev_circ = self.c if prev_circ is None else prev_circ + self.c
            d = self.d if d == -1 else d + self.d
            self.total_d = d
        for child in self.children:
            child.next_nodes(min_extracted, rp, prev_circ, d)

    def __has_finished(self) -> bool:
        """
        For CNOT optimisation, check which children of a node has finished leaves
        """
        if self.collected:
            return False
        if not self.expanded:
            if len(self.frontier) == 0:
                return True
            return False
        for i, child in enumerate(self.children):
            fin = child.__has_finished()
            if fin:
                if self.finished_children is None:
                    self.finished_children = []
                self.finished_children.append(i)
        return self.finished_children is not None

    def __collect_finished_cnot(self, best_c: Optional[Circuit], best_d: int,
                                c: Circuit, up_to_perm: bool) -> Tuple[Optional[Circuit], int]:
        """
        Find the best fully extracted circuits in the CNOT optimisation case
        """
        c = c + self.c
        if not self.expanded:
            self.collected = True
            id_simp(self.g)
            c.gates = list(reversed(c.gates))
            c = graph_to_swaps(self.g, up_to_perm) + c
            d = get_optimize_value(c, self.opt_depth, True)
            if d < best_d or best_d == -1:
                best_c = c
                best_d = d
        else:
            if self.finished_children is None:
                raise AssertionError("LookaheadNode.__collect_finished_cnot was called before " +
                                     "LookaheadNode.__has_finished")
            for i in self.finished_children:
                best_c, best_d = self.children[i].__collect_finished_cnot(best_c, best_d, c, up_to_perm)
            self.finished_children = None
        return best_c, best_d

    def __collect_finished_depth(self, best_c: Optional[Circuit], best_d: int,
                                 up_to_perm: bool) -> Tuple[Optional[Circuit], int]:
        """
        Find the best fully extracted circuits in the depth optimisation case
        """
        if not self.expanded and not self.collected and len(self.frontier) == 0:
            self.collected = True
            id_simp(self.g)
            self.c.gates = list(reversed(self.c.gates))
            self.c = graph_to_swaps(self.g, up_to_perm) + self.c
            d = get_optimize_value(self.c, self.opt_depth, True)
            if d < best_d or best_d == -1:
                best_c = self.c
                best_d = d
        elif self.children is not None:
            for child in self.children:
                best_c, best_d = child.__collect_finished_depth(best_c, best_d, up_to_perm)
        return best_c, best_d

    def get_finished(self, best_c: Optional[Circuit], best_d: int, up_to_perm: bool) -> Tuple[Optional[Circuit], int]:
        """
        Find the best fully extracted circuits in the CNOT optimisation case

        Args:
            best_c: best circuit up to this point
            best_d: best two qubit count/depth up to this point
            up_to_perm: return an equivalent circuit up to a permutation of inputs

        Returns:
            best_c, best_d updated with any finished leaves found
        """
        if self.opt_depth:
            return self.__collect_finished_depth(best_c, best_d, up_to_perm)
        if self.__has_finished():
            return self.__collect_finished_cnot(best_c, best_d, Circuit(self.c.qubits), up_to_perm)
        return best_c, best_d

    def can_expand(self):
        if not self.expanded:
            if len(self.frontier) == 0:
                return False
            if self.d == -1:  # Should only be the case for the initial root
                return True
            if self.total_d >= self.hard_limit > -1:
                return False
            return True
        for child in self.children:
            if child.can_expand():
                return True
        return False

    def branch_child(self) -> 'LookaheadNode':
        child = LookaheadNode(self.g.clone(), self.c.copy() if self.opt_depth else Circuit(self.c.qubits),
                              self.frontier.copy(), self.qubit_map.copy(), self.gadgets.copy(), self.opt_depth,
                              self.hard_limit, self.ext_count)
        self.children.append(child)
        return child

    def apply_cnots(self, cnots: List[CNOT], m: Mat2, neighbors: List[VT]):
        self.ext_count += apply_cnots(self.g, self.c, self.frontier, self.qubit_map, cnots, m, neighbors)

    def expand(self, limit: int, max_depth: int, algorithms: List[int]):
        if max_depth == 0:
            return
        if self.total_d >= self.hard_limit > -1:
            return
        while not self.expanded and self.ext_count < limit and len(self.frontier) != 0:
            self.d = -1
            clean_frontier(self.g, self.c, self.frontier, self.qubit_map)

            # Now we can proceed with the actual extraction
            # First make sure that frontier is connected in correct way to inputs
            neighbor_set = neighbors_of_frontier(self.g, self.frontier)

            if not self.frontier:
                break  # No more vertices to be processed. We are done.

            # First we check if there is a phase gadget in the way
            if remove_gadget(self.g, self.frontier, self.qubit_map, neighbor_set, self.gadgets):
                # There was a gadget in the way. Go back to the top
                continue

            neighbors = list(neighbor_set)
            m = bi_adj(self.g, neighbors, self.frontier)

            cnots: List[CNOT] = []
            if all(sum(row) != 1 for row in m.data):  # No easy vertex

                qubits = self.c.qubits
                branches: List[List[CNOT]] = []
                for alg in algorithms:
                    # Try different algorithms to get distinct sets of CNOTs that can be used
                    cnots_opt = self.apply_operation(alg, m, neighbors)
                    if cnots_opt is None:
                        continue
                    should_append = True
                    for i in range(len(branches)):
                        if compare_cnots(cnots_opt, branches[i], qubits):  # Same result when applying CNOTs
                            should_append = False
                            if len(cnots_opt) < len(branches[i]):
                                branches[i] = cnots_opt
                            break
                    if should_append:
                        branches.append(cnots_opt)

                if len(branches) == 0:
                    raise Exception("All steps returned impossible")
                elif len(branches) == 1:  # No need to branch
                    cnots = branches[0]
                else:  # Branch and go to children
                    for cnots_opt in branches:
                        child = self.branch_child()
                        child.apply_cnots(cnots_opt, m.copy(), neighbors)
                    self.mark_expanded()
                    break

            self.apply_cnots(cnots, m, neighbors)

        for child in self.children:
            child.expand(limit, max_depth - 1, algorithms)

    def apply_operation(self, operation_id: int, m: Mat2, neighbors: List[VT]) -> Optional[List[CNOT]]:
        """
        Apply one of the possible operations to the current node to obtain a list of CNOTs
        """
        cnots: List[CNOT]

        if operation_id == 0:
            perm = column_optimal_swap(m)
            perm = {v: k for k, v in perm.items()}
            neighbors2 = [neighbors[perm[i]] for i in range(len(neighbors))]
            m2 = bi_adj(self.g, neighbors2, self.frontier)
            cnots = m2.to_cnots(optimize=False, use_log_blocksize=True)
            cnots = filter_duplicate_cnots(
                cnots)  # Since the matrix is not square, the algorithm sometimes introduces duplicates

        elif operation_id == 1:
            greedy_operations = greedy_reduction(m)
            if greedy_operations is None:
                return None
            cnots = [CNOT(target, control) for control, target in greedy_operations]

        elif operation_id == 2:
            greedy_operations = greedy_reduction_flat(m)
            if greedy_operations is None:
                return None
            cnots = [CNOT(target, control) for control, target in greedy_operations]

        elif operation_id == 3:
            greedy_operations = greedy_two_reduction(m)
            if greedy_operations is None:
                return None
            cnots = [CNOT(target, control) for control, target in greedy_operations]

        else:
            raise Exception("Unknown extraction step: {}".format(operation_id))

        cnots_opt = remove_extra_cnots(cnots, m)
        return cnots_opt


class RootPicker:
    """
    Class for picking the next roots that correspond to the best k leaves.
    """
    def __init__(self, k: int):
        self.k: int = k
        self.nodes: List[Optional[Tuple[LookaheadNode, Optional[Circuit], int]]] = []
        self.best: List[Tuple[LookaheadNode, Fraction, int]] = []

    def add_possible_root(self, n: LookaheadNode, c: Optional[Circuit], d: int):
        """
        Add a node that satisfies the conditions for being a root in the next step
        For CNOT optimisation, include the circuit up to this node
        """
        # First, remove any of the previous nodes that we do not need
        # This will let the garbage collector to clean the unnecessary nodes
        if len(self.nodes) > 0:
            s = set()
            for p in self.best:
                s.add(p[2])
            for i in range(len(self.nodes)):
                if i not in s:
                    self.nodes[i] = None
        # Add the new node
        self.nodes.append((n, c, d))

    def add_leaf(self, n: LookaheadNode, d: Fraction):
        """
        Add a leaf to the list of the best k leaves. It is assigned to the last possible root added.

        Args:
            n: the leaf
            d: the metric for comparison (two qubit count or depth divided by the number of vertices extracted)
        """
        if len(self.nodes) == 0:
            raise AssertionError("Adding leaf without any possible root")
        i = 0
        while i < len(self.best) and d >= self.best[i][1]:
            i += 1
        if i == self.k:
            return
        self.best.insert(i, (n, d, len(self.nodes) - 1))
        if len(self.best) > self.k:
            self.best.pop()

    def get_next_roots(self) -> List[Optional[LookaheadNode]]:
        """
        Pick the roots that correspond to the best k leaves added

        The type needs Optional to match the type in `lookahead_extract_base`, which allows nodes to be removed from
        the list early.
        """
        if len(self.nodes) == 0:
            return []
        s = set()
        for p in self.best:
            s.add(p[2])
        nodes: List[Optional[LookaheadNode]] = []
        for i in s:
            entry = self.nodes[i]
            if entry is None:
                # Does not happen, needed for type checking
                raise AssertionError("RootPicker removed a root that was still needed")
            else:
                n = entry[0]
                if entry[1] is not None:
                    n.c = entry[1] + n.c
                    if n.d != -1:
                        n.d = entry[2] + n.d
                nodes.append(n)
        return nodes


def lookahead_extract_base(
        g: BaseGraph[VT, ET],
        steps: int = -1,  # ideal number of steps to look ahead
        depth_limit: int = 7,  # maximum depth os the lookahead tree
        min_extract: int = 5,  # minimum extracted vertices at each step, improves performance
        nodes_kept: int = 4,   # keep the best 'nodes_kept' nodes when advancing to the next step
        hard_limit: int = -1,  # do not consider circuits where the comparison metric is over this
        algorithms: Optional[List[int]] = None,  # always include 0, pick any from 1, 2, 3
        optimize_for_depth: bool = False,  # optimize for depth instead of two qubit gates
        compare_basic: bool = True,  # use the default extractions and pick the best
        up_to_perm: bool = False  # return an equivalent circuit up to an input permutation
        ) -> Optional[Circuit]:
    """
    Main method for the lookahead extraction. Uses different methods to produce CNOTS and extract vertices,
    simulates a few steps in advance, and picks the best results.

    Args:
        g: the graph to transform into a circuit
        steps: the number of vertices to extract before comparing different results; should generally vary with the number of qubits in the graph
        depth_limit: the maximum depth of the search tree, to stop from memory problems in some edge cases; negative values remove the constrint
        min_extract: the minimum number of vertices extracted for a node to be considered as a root for the next step
        nodes_kept: instead of only considering the best result when looking ahead, consider the best 'nodes_kept' results and pick the nodes that correspond to each result to be roots in the next step
        hard_limit: stop the search when reaching 'hard_limit' two qubit gates/depth
        algorithms: the different algorithms to use in the search; always include 0, other possibilities are 1, 2, 3; the length of this list gives the branching factor of the search tree
        optimize_for_depth: if set to false (default), optimize for the number of two qubit gates; if set to true, optimize for depth
        compare_basic: perform the standard extractions and pick the best between the standard and the result of the lookahead extraction
        up_to_perm: if set to true, returns a circuit that corresponds to the graph up to a permutation of th inputs

    Returns:
        A circuit that corresponds to the given graph, with two qubit count / depth less than 'hard_limit'; None if no such circuit was found
    """

    if steps < 1:
        steps = len(g.inputs()) * 3
    if depth_limit < 1:
        depth_limit = -1
    if min_extract < 0:
        min_extract = 0
    if nodes_kept < 1:
        nodes_kept = 1
    if hard_limit < 0:
        hard_limit = -1
    if algorithms is None:
        algorithms = [0, 1, 2]

    best_c = None
    best_d = hard_limit

    if compare_basic:
        # Perform the basic extractions and pick the best result
        c1 = extract_circuit(g.clone(), optimize_cnots=1, up_to_perm=up_to_perm)
        d1 = get_optimize_value(c1, optimize_for_depth, True)
        if best_d > d1 or best_d == -1:
            best_c = c1
            best_d = d1
        c1 = extract_circuit(g.clone(), optimize_cnots=3, up_to_perm=up_to_perm)
        d1 = get_optimize_value(c1, optimize_for_depth, True)
        if best_d > d1 or best_d == -1:
            best_c = c1
            best_d = d1
        hard_limit = best_d

    gadgets = {}
    inputs = g.inputs()
    outputs = g.outputs()
    for v in g.vertices():
        if g.vertex_degree(v) == 1 and v not in inputs and v not in outputs:
            n = list(g.neighbors(v))[0]
            gadgets[n] = v

    qubit_map: Dict[VT, int] = dict()
    frontier = []
    for i, o in enumerate(outputs):
        v = list(g.neighbors(o))[0]
        if v in inputs:
            continue
        frontier.append(v)
        qubit_map[v] = i

    roots: List[Optional[LookaheadNode]] =\
        [LookaheadNode(g, Circuit(len(inputs)), frontier, qubit_map, gadgets, optimize_for_depth, hard_limit)]

    while len(roots) > 0:
        rp = RootPicker(nodes_kept)
        for i in range(len(roots)):
            root = roots[i]
            if root is None:
                continue  # Never happens, but creates problems with type checker
            if root.hard_limit > hard_limit:
                root.update_hard_limit(hard_limit)
            if root.can_expand():
                new_limit = root.ext_count + steps
                prev_extracted = root.ext_count
                root.expand(new_limit, depth_limit, algorithms)
                best_c, best_d = root.get_finished(best_c, best_d, up_to_perm)
                if best_d < hard_limit:
                    hard_limit = best_d
                    root.update_hard_limit(hard_limit)
                root.next_nodes(prev_extracted + min_extract, rp)
            # Allow unneeded nodes to be removed to free memory
            roots[i] = None
        roots = rp.get_next_roots()

    return best_c


def get_optimize_value(c: Circuit, optimize_for_depth: bool, expand_to_basic: bool = False) -> int:
    """ Computes the two qubit count or the depth for the circuit. """
    if expand_to_basic:
        c = c.to_basic_gates()
    if not optimize_for_depth:
        d = 0
        for gate in c.gates:
            if isinstance(gate, (CNOT, CZ)):
                d += 1
        return d
    return c.depth()


def cnots_to_xor_list(cnots: List[CNOT], size: int) -> List[Set[int]]:
    sets = [{i} for i in range(size)]
    for c in cnots:
        for i in sets[c.target]:
            if i in sets[c.control]:
                sets[c.control].remove(i)
            else:
                sets[c.control].add(i)
    return sets


def compare_cnots(c1: List[CNOT], c2: List[CNOT], size: int) -> bool:
    """ Checks if two sets of cnots give the same results """
    s1 = cnots_to_xor_list(c1, size)
    s2 = cnots_to_xor_list(c2, size)
    for index in range(size):
        if s1[index] != s2[index]:
            return False
    return True


def lookahead_fast(g: BaseGraph[VT, ET], optimize_for_depth: bool = False, up_to_perm: bool = False) -> Circuit:
    """
    A lookahead extraction with relatively fast results. For details see :func:`lookahead_extract_base`
    """
    c = lookahead_extract_base(g, 4 * len(g.inputs()), 8, 5, 4, -1, [0, 1], optimize_for_depth, False, up_to_perm)
    if c is None:
        raise AssertionError("Lookahead extraction with no hard limit returned None")
    return c


def lookahead_extract(g: BaseGraph[VT, ET], optimize_for_depth: bool = False, up_to_perm: bool = False) -> Circuit:
    """
        A lookahead extraction with recommended parameters. For details see :func:`lookahead_extract_base`
    """
    qubits = len(g.inputs())
    c = lookahead_extract_base(g.clone(), 4 * qubits, 8, 0, 4, -1, [0, 1], optimize_for_depth, True, up_to_perm)
    if c is None:
        raise AssertionError("Lookahead extraction with no hard limit returned None")
    d = get_optimize_value(c, optimize_for_depth, True)
    c1 = lookahead_extract_base(g, 4 * qubits, 8, 5, 4, d, [0, 3], optimize_for_depth, False, up_to_perm)
    if c1 is not None:
        d1 = get_optimize_value(c1, optimize_for_depth, True)
        if d1 < d:
            c = c1
    return c


def lookahead_full(g: BaseGraph[VT, ET], optimize_for_depth: bool = False, up_to_perm: bool = False) -> Circuit:
    """
        A lookahead extraction which compares a number of possible extractions and returns the best result.
        Can take a very long time for large circuits. For details see :func:`lookahead_extract_base`
    """
    qubits = len(g.inputs())
    c = lookahead_extract_base(g.clone(), 3 * qubits, 7, qubits, 4, -1,
                               [0, 1, 3], optimize_for_depth, True, up_to_perm)
    if c is None:
        raise AssertionError("Lookahead extraction with no hard limit returned None")
    d = get_optimize_value(c, optimize_for_depth, True)
    c1 = lookahead_extract_base(g.clone(), 4 * qubits, 8, 0, 4, d, [0, 1], optimize_for_depth, False, up_to_perm)
    if c1 is not None:
        d1 = get_optimize_value(c1, optimize_for_depth, True)
        if d1 < d:
            c = c1
            d = d1
    c1 = lookahead_extract_base(g.clone(), 4 * qubits, 8, 5, 4, d, [0, 2], optimize_for_depth, False, up_to_perm)
    if c1 is not None:
        d1 = get_optimize_value(c1, optimize_for_depth, True)
        if d1 < d:
            c = c1
            d = d1
    c1 = lookahead_extract_base(g, 4 * qubits, 8, 5, 4, d, [0, 3], optimize_for_depth, False, up_to_perm)
    if c1 is not None:
        d1 = get_optimize_value(c1, optimize_for_depth, True)
        if d1 < d:
            c = c1
    return c
