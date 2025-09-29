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

# This file contains circuit simulation routine based on the Fedor's thesis at
# the University of Oxford.
# The method's complexity depends on the cut-rank structure of the ZX diagram.
# Additionally, several heuristics were implemented for finding good rank-decompositions.

import numpy as np
from numpy.typing import NDArray
from copy import deepcopy
from itertools import product
from typing import Tuple, List, Iterable, Union
from math import sqrt, pi, log2

from .simplify import full_reduce
from .graph import VertexType, EdgeType
from .graph.base import BaseGraph
from .linalg import REF, rank_factorise, generalised_inverse
from .symbolic import Poly


def adjacency_matrix(g: BaseGraph,
                     v_left: Iterable[int],
                     v_right: Iterable[int]) -> NDArray[np.int8]:
    """
    Compute the adjacency matrix between two subsets of graph vertices.

    Args:
        g: graph
        v_left: left subset
        v_right: right subset

    Returns:
        binary matrix of shape (|v_left|, |v_right|)
    """
    left_id = {u: i for i, u in enumerate(v_left)}
    right_id = {v: i for i, v in enumerate(v_right)}
    n, m = len(left_id), len(right_id)
    mat = np.zeros((n, m), dtype=np.int8)
    for e in g.edge_set():
        u, v = e[0], e[1]
        if u in left_id and v in right_id:
            mat[left_id[u]][right_id[v]] = 1
        if v in left_id and u in right_id:
            mat[left_id[v]][right_id[u]] = 1
    return mat


def linear_decomposition(order: Iterable) -> Union[List, int, None]:
    """
    Join the elements of the order into a linear rank-decomposition.

    Args:
        order: sequence of roots

    Returns:
        linear rank-decomposition
    """
    decomp = None
    for elem in order:
        decomp = elem if decomp is None else [decomp, elem]
    return decomp


def calc_ranks(decomp: Union[List, int, None],
               g: BaseGraph) -> Union[List, Tuple, None]:
    """
    Calculate cut-ranks for each edge of the rank-decomposition.

    Args:
        decomp: rank-decomposition
        g: ZX diagram

    Returns:
        rank-decomposition with cut-ranks and additional info
    """
    if decomp is None:
        return None
    v_all = list(g.vertices())
    v_id = {v: i for i, v in enumerate(v_all)}
    mat = adjacency_matrix(g, v_all, v_all)

    def iterate(elem):
        if isinstance(elem, int):
            ref = REF(mat)
            ref.take(v_id[elem])
            leaves = {v_id[elem]}
            return elem, ref, leaves
        child1, ref1, leaves1 = iterate(elem[0])
        child2, ref2, leaves2 = iterate(elem[1])
        if len(leaves1) >= len(leaves2):
            ref = deepcopy(ref1)
            for j in leaves2:
                ref.take(j)
        else:
            ref = deepcopy(ref2)
            for j in leaves1:
                ref.take(j)
        return [(child1, ref1, leaves1), (child2, ref2, leaves2)], ref, leaves1 | leaves2

    result = iterate(decomp)
    assert result[2] == set(range(g.num_vertices()))
    return result


def rank_width(decomp: Union[List, int, None],
               g: BaseGraph,
               calc_rs: bool = True) -> int:
    """
    Calculate the width of a rank-decomposition.

    Args:
        decomp: rank-decomposition
        g: ZX diagram
        calc_rs: whether calculating cut-ranks is necessary

    Returns:
        rank-decomposition width
    """

    def iterate(data):
        if data is None:
            return 0
        if isinstance(data[0], int):
            return data[1].rank()
        return max(data[1].rank(), iterate(data[0][0]), iterate(data[0][1]))

    return iterate(calc_ranks(decomp, g) if calc_rs else decomp)


def rank_score_flops(decomp: Union[List, int, None],
                     g: BaseGraph,
                     calc_rs: bool = True) -> float:
    """
    Calculate the contraction complexity of a rank-decomposition.

    Args:
        decomp: rank-decomposition
        g: ZX diagram
        calc_rs: whether calculating cut-ranks is necessary

    Returns:
        log2(flops)
    """

    def iterate(data):
        if data is None or isinstance(data[0], int):
            return 0
        score1 = iterate(data[0][0])
        score2 = iterate(data[0][1])
        r1, r2, r3 = data[0][0][1].rank(), data[0][1][1].rank(), data[1].rank()
        return score1 + score2 + 2 ** (r1 + r2 + r3 - max(r1, r2, r3))

    score = iterate(calc_ranks(decomp, g) if calc_rs else decomp)
    return log2(max(score, 1))


def greedy_linear_order(g: BaseGraph) -> List[int]:
    """
    Linear rank-decomposition obtained by greedily taking the next vertex.

    Args:
        g: ZX diagram

    Returns:
        sequence of vertices for the greedy-linear rank-decomposition
    """
    n = g.num_vertices()
    vert = list(g.vertices())
    mat = adjacency_matrix(g, vert, vert)
    ref = REF(mat)
    order = []
    for i in range(n):
        min_r, min_u = n, -1
        for u in ref.pivot_cols:
            cur_ref = deepcopy(ref)
            cur_ref.take(u)
            r = cur_ref.rank()
            if r < min_r:
                min_r = r
                min_u = u
        if min_u == -1:
            min_u = ref.taken.index(False)
        order.append(vert[min_u])
        ref.take(min_u)
    return order


def greedy_b2t_decomposition(g: BaseGraph) -> Union[List, int, None]:
    """
    Rank-decomposition built greedily from bottom to top.

    Args:
        g: ZX diagram

    Returns:
        rank-decomposition
    """
    n = g.num_vertices()
    vert = list(g.vertices())
    mat = adjacency_matrix(g, vert, vert)
    refs = []
    for i in range(n):
        ref = REF(mat)
        ref.take(i)
        refs.append(ref)
    decomps = [vert[i] for i in range(n)]
    leaves = [{i} for i in range(n)]
    loc = list(range(n))
    refs_next = dict()
    edges: List = [set() for _ in range(n)]
    for i in range(n):
        for j in refs[i].pivot_cols:
            ref = deepcopy(refs[i])
            ref.take(j)
            refs_next[(i, j)] = refs_next[(j, i)] = ref
            edges[i].add(j)
            edges[j].add(i)

    while refs_next:
        min_rank, i, j = min((ref.rank(), i, j) for (i, j), ref in refs_next.items())
        refs[loc[i]] = refs_next[(i, j)]
        refs.pop(loc[j])
        decomps[loc[i]] = [decomps[loc[i]], decomps[loc[j]]]
        decomps.pop(loc[j])
        leaves[loc[i]] |= leaves[loc[j]]
        leaves.pop(loc[j])
        loc[j] = -1
        for k in range(j + 1, n):
            if loc[k] != -1:
                loc[k] -= 1
        edges_i = edges[i].copy()
        for k in edges_i:
            refs_next.pop((i, k))
            refs_next.pop((k, i))
            edges[i].remove(k)
            edges[k].remove(i)
        edges_j = edges[j].copy()
        for k in edges_j:
            refs_next.pop((j, k))
            refs_next.pop((k, j))
            edges[j].remove(k)
            edges[k].remove(j)
        for k in range(n):
            if loc[k] == -1 or k == i:
                continue
            if (set(refs[loc[i]].pivot_cols) & leaves[loc[k]] or
                    set(refs[loc[k]].pivot_cols) & leaves[loc[i]]):
                i1, i2 = (i, k) if len(leaves[loc[i]]) > len(leaves[loc[k]]) else (k, i)
                ref = deepcopy(refs[loc[i1]])
                for leaf in leaves[loc[i2]]:
                    ref.take(leaf)
                refs_next[(i1, i2)] = refs_next[(i2, i1)] = ref
                edges[i1].add(i2)
                edges[i2].add(i1)

    return linear_decomposition(decomps)


def generate_decomposition(g: BaseGraph,
                           strategy: str = 'rw-auto',
                           verbose: bool = False) -> Union[List, int, None]:
    """
    Generate rank-decomposition of a ZX diagram using a specific strategy.

    Args:
        g: ZX diagram
        strategy: type of strategy
        verbose: print additional info

    Returns:
        rank-decomposition
    """
    if strategy == 'rw-greedy-b2t':
        decomp = greedy_b2t_decomposition(g)
    elif strategy == 'rw-greedy-linear':
        decomp = linear_decomposition(greedy_linear_order(g))
    elif strategy == 'rw-auto':
        decomp1 = greedy_b2t_decomposition(g)
        decomp2 = linear_decomposition(greedy_linear_order(g))
        decomps = [decomp1, decomp2]
        scores = [rank_score_flops(decomp, g) for decomp in decomps]
        pos = scores.index(min(scores))
        return decomps[pos]
    else:
        raise ValueError('Unknown rank-decomposition strategy')
    if verbose:
        width, score = rank_width(decomp, g), rank_score_flops(decomp, g)
        print(f'Rank-decomposition ({strategy}) has width {width} and score {score:.3f}')
    return decomp


def mat_image(M: NDArray[np.int8]) -> NDArray[np.int64]:
    """
    Compute y = xM for all possible vectors x.

    Args:
        M: binary matrix of shape (n, m)

    Returns:
        np.ndarray of shape (2^n,) -- list of vectors represented as int64
    """
    n, m = M.shape
    M_ints = M @ (1 << np.arange(m))
    ys = np.zeros(1, dtype=np.int64)
    for pos in range(n):
        ys = np.concatenate([ys, M_ints[pos] ^ ys])
    return ys


def apply_parity_map(Psi: NDArray[np.complex128],
                     M: NDArray[np.int8]) -> NDArray[np.complex128]:
    """
    Apply parity map M to state Psi.

    Args:
        Psi: np.ndarray of shape (..., 2^n)
        M: binary matrix of shape (n, m)

    Returns:
        np.ndarray of shape (..., 2^m)
    """
    m = M.shape[1]
    ys = mat_image(M)
    Phi = np.zeros((Psi.shape[0], 2 ** m), dtype=Psi.dtype)
    np.add.at(Phi, (slice(None), ys), Psi)  # type: ignore
    Phi /= sqrt(2) ** (M.sum() - m)
    return Phi


def phase_tensor(E: NDArray[np.int8]) -> NDArray[np.complex128]:
    """
    Generate P_{a,b} = (-1)^{<a, Eb>} / sqrt(2)^|E|.

    Args:
        E: binary matrix of shape (n, m)

    Returns:
        np.ndarray of shape (2^{n+m},)
    """
    n, m = E.shape
    Eb = mat_image(E.T)
    aEb = np.zeros((1, 2 ** m), dtype=np.int8)
    for pos in range(n):
        aEb = np.vstack([aEb, aEb ^ ((Eb >> pos) & 1)])
    P = (-1) ** aEb.reshape(-1, order='F') / sqrt(2) ** E.sum()
    return P


def conv_naive(Psi_v: NDArray[np.complex128],
               Psi_w: NDArray[np.complex128],
               E_vw: NDArray[np.int8],
               E_vu: NDArray[np.int8],
               E_wu: NDArray[np.int8]) -> NDArray[np.complex128]:
    """
    Perform convolution naively in 2^{r_u + r_v + r_w} time.

    Args:
        Psi_v: np.ndarray of shape (2^{b_v}, 2^{r_v})
        Psi_w: np.ndarray of shape (2^{b_w}, 2^{r_w})
        E_vw: binary matrix of shape (r_v, r_w)
        E_vu: binary matrix of shape (r_v, r_u)
        E_wu: binary matrix of shape (r_w, r_u)

    Returns:
        np.ndarray of shape (2^{b_v + b_w}, 2^{r_u})
    """
    r_u, r_v, r_w = E_vu.shape[1], E_vu.shape[0], E_wu.shape[0]
    Psi_v = Psi_v.reshape((-1,) + (2,) * r_v, order='F')
    Psi_w = Psi_w.reshape((-1,) + (2,) * r_w, order='F')
    Psi_u_hat = np.zeros((Psi_v.shape[0], Psi_w.shape[0]) + (2,) * r_u, dtype=Psi_v.dtype)
    for i in range(Psi_v.shape[0]):
        for j in range(Psi_w.shape[0]):
            for x in product(range(2), repeat=r_u):
                for a in product(range(2), repeat=r_v):
                    for b in product(range(2), repeat=r_w):
                        phase = np.dot(a, E_vu @ x) + np.dot(b, E_wu @ x) + np.dot(a, E_vw @ b)
                        Psi_u_hat[i][j][x] += Psi_v[i][a] * Psi_w[j][b] * (-1) ** phase
    Psi_u = np.fft.fftn(Psi_u_hat, axes=tuple(range(2, r_u + 2)))
    Psi_u /= sqrt(2) ** (E_vw.sum() + E_vu.sum() + E_wu.sum() + r_u)
    return Psi_u.reshape((-1, 2 ** r_u), order='F')


def conv_vw(Psi_v: NDArray[np.complex128],
            Psi_w: NDArray[np.complex128],
            E_vw: NDArray[np.int8],
            E_vu: NDArray[np.int8],
            E_wu: NDArray[np.int8]) -> NDArray[np.complex128]:
    """
    Perform convolution in 2^{r_v + r_w} time:
      1. Compute Psi_v ⊗ Psi_w and multiply by the phase tensor for E_vw
      2. Apply parity map [E_vu; E_wu]

    Args:
        Psi_v: np.ndarray of shape (2^{b_v}, 2^{r_v})
        Psi_w: np.ndarray of shape (2^{b_w}, 2^{r_w})
        E_vw: binary matrix of shape (r_v, r_w)
        E_vu: binary matrix of shape (r_v, r_u)
        E_wu: binary matrix of shape (r_w, r_u)

    Returns:
        np.ndarray of shape (2^{b_v + b_w}, 2^{r_u})
    """
    Psi_vw = np.kron(Psi_w, Psi_v).astype(np.complex128)
    Psi_vw *= phase_tensor(E_vw)
    E = np.vstack([E_vu, E_wu])
    Psi_u = apply_parity_map(Psi_vw, E)
    return Psi_u


def conv_uv(Psi_v: NDArray[np.complex128],
            Psi_w: NDArray[np.complex128],
            E_vw: NDArray[np.int8],
            E_vu: NDArray[np.int8],
            E_wu: NDArray[np.int8]) -> NDArray[np.complex128]:
    """
    Perform convolution in 2^{r_u + r_v} time:
      1. Apply parity map [E_vw^T, E_wu] to Psi_w
      2. Multiply by the phase tensor for E_vu
      3. Post-select with Psi_v and apply FT on the second part

    Args:
        Psi_v: np.ndarray of shape (2^{b_v}, 2^{r_v})
        Psi_w: np.ndarray of shape (2^{b_w}, 2^{r_w})
        E_vw: binary matrix of shape (r_v, r_w)
        E_vu: binary matrix of shape (r_v, r_u)
        E_wu: binary matrix of shape (r_w, r_u)

    Returns:
        np.ndarray of shape (2^{b_v + b_w}, 2^{r_u})
    """
    r_u, r_v, r_w = E_vu.shape[1], E_vu.shape[0], E_wu.shape[0]
    E = np.hstack([E_vw.T, E_wu])
    Psi_vu = apply_parity_map(Psi_w, E).reshape((-1,) + (2,) * r_v + (2 ** r_u,), order='F')
    Psi_vu_hat = (np.fft.fftn(Psi_vu, axes=tuple(range(1, r_v + 1)))
                  .reshape((-1, 2 ** (r_v + r_u)), order='F') / sqrt(2) ** r_v).astype(np.complex128)
    E2 = np.block([[np.eye(r_v), E_vu],
                   [np.zeros((r_u, r_v)), np.eye(r_u)]]).astype(np.int8)
    Psi_vu_hat = apply_parity_map(Psi_vu_hat, E2).reshape((-1, 2 ** r_v, 2 ** r_u), order='F')
    Psi_u = np.tensordot(Psi_v, Psi_vu_hat, axes=(1, 1)).reshape((-1, 2 ** r_u), order='F')
    return Psi_u


def conv(Psi_v: NDArray[np.complex128],
         Psi_w: NDArray[np.complex128],
         E_vw: NDArray[np.int8],
         E_vu: NDArray[np.int8],
         E_wu: NDArray[np.int8],
         verbose: bool = False) -> Tuple[NDArray[np.complex128], bool]:
    """
    Convolution in time O(2^{r_u + r_v + r_w - max(r_u, r_v, r_w)}) by calling a suitable subroutine.

    Args:
        Psi_v: np.ndarray of shape (2^{b_v}, 2^{r_v})
        Psi_w: np.ndarray of shape (2^{b_w}, 2^{r_w})
        E_vw: binary matrix of shape (r_v, r_w)
        E_vu: binary matrix of shape (r_v, r_u)
        E_wu: binary matrix of shape (r_w, r_u)
        verbose: bool

    Returns:
        tuple (Psi_u, swapped) where

        - Psi_u is np.ndarray of shape (2^{b_v + b_w}, 2^{r_u})
        - swapped indicates whether boundary dimensions were swapped
    """
    r_u, r_v, r_w = E_vu.shape[1], E_vu.shape[0], E_wu.shape[0]
    if verbose:
        print('conv', r_u, r_v, r_w)
    r_max = max(r_u, r_v, r_w)
    if r_u == r_max:
        return conv_vw(Psi_v, Psi_w, E_vw, E_vu, E_wu), False
    elif r_v == r_max:
        return conv_uv(Psi_w, Psi_v, E_vw.T, E_wu, E_vu), True
    else:
        return conv_uv(Psi_v, Psi_w, E_vw, E_vu, E_wu), False


def tensorfy_rw_subtree(g: BaseGraph,
                        subtree: Union[List, int],
                        verbose: bool = False) -> Tuple[
    NDArray[np.complex128], NDArray[np.int8], NDArray[np.bool_], List[int]]:
    """
    Returns the simulated version of the subdiagram induced by the leaves from the subtree.

    Args:
        g: ZX diagram
        subtree: subtree of the rank-decomposition
        verbose: print additional info

    Returns:
        tuple (Psi_u, M_u, S_u, B_u) where

        - Psi_u (np.ndarray of shape (2^{b_u}, 2^{r_u})) is the tensorfication of the subdiagram
        - M_u (binary matrix of shape (r_u, n)) is the parity map to the rest of the graph
        - S_u is the set of vertices in the subdiagram
        - B_u is the order of boundary vertices in the subdiagram
    """
    n = g.num_vertices()
    v_all = np.array(list(g.vertices()))
    v_id = {v: i for i, v in enumerate(g.vertices())}

    if isinstance(subtree, int):
        vt = g.type(subtree)
        if vt == VertexType.BOUNDARY:
            et = g.edge_type(list(g.incident_edges(subtree))[0])
            nb = list(g.neighbors(subtree))[0]
            nbt = g.type(nb)
            is_had = (et == EdgeType.SIMPLE) ^ (nbt == VertexType.BOUNDARY and nb < subtree)
            if is_had:
                Psi_u = np.array([[1, 1], [1, -1]], dtype=np.complex128) / sqrt(2)
            else:
                Psi_u = np.eye(2, dtype=np.complex128)
            B_u = [subtree]
        elif vt == VertexType.Z:
            phase = g.phase(subtree)
            if isinstance(phase, Poly):
                raise ValueError(f"Can't convert diagram with parameters to tensor: {str(phase)}")
            Psi_u = np.array([[1, np.exp(pi * 1j * phase)]])
            B_u = []
        else:
            raise ValueError(f'Invalid vertex type: {vt}')
        M_u = adjacency_matrix(g, [subtree], v_all)
        S_u = np.zeros(n, dtype=np.bool_)
        S_u[v_id[subtree]] = True
        return Psi_u, M_u, S_u, B_u

    Psi_v, M_v, S_v, B_v = tensorfy_rw_subtree(g, subtree[0], verbose=verbose)
    Psi_w, M_w, S_w, B_w = tensorfy_rw_subtree(g, subtree[1], verbose=verbose)
    Cin_v = M_v[:, S_w]
    Cin_w = M_w[:, S_v]
    Cout = np.concatenate((M_v, M_w))
    Cout[:, S_v | S_w] = 0

    U, _, V = rank_factorise(Cout)
    r_u, r_v, r_w = V.shape[0], M_v.shape[0], M_w.shape[0]
    E_vu, E_wu = U[:r_v], U[r_v:]
    M_u = V

    B = adjacency_matrix(g, v_all[S_v], v_all[S_w])
    Bg = generalised_inverse(B)
    E_vw = (Cin_v @ Bg @ Cin_w.T) % 2
    Psi_u, swapped = conv(Psi_v, Psi_w, E_vw, E_vu, E_wu, verbose=verbose)
    pw = Cout.sum() - U.sum() - V.sum() + r_u
    pw += Cin_v.sum() + Cin_w.sum() - E_vw.sum() - B.sum()
    Psi_u /= sqrt(2) ** pw

    S_u = S_v | S_w  # type: ignore
    B_u = B_v + B_w if not swapped else B_w + B_v
    return Psi_u, M_u, S_u, B_u


def tensorfy_rw(g: BaseGraph,
                strategy: str = 'rw-auto',
                preserve_scalar: bool = True,
                verbose: bool = False) -> NDArray[np.complex128]:
    """
    Evaluate the tensor diagram corresponding to g using the rank-width method.

    Args:
        g: ZX diagram
        strategy: rank-decomposition strategy
        preserve_scalar: whether to account for the diagram scalar
        verbose: print additional info

    Returns:
        Numpy tensor having (num_outputs + num_inputs) dimensions (output dimensions first)
    """
    g = g.copy()
    full_reduce(g)
    decomp = generate_decomposition(g, strategy=strategy, verbose=verbose)
    if decomp is None:
        return np.array(g.scalar.to_number() ** preserve_scalar)
    result, _, _, boundary = tensorfy_rw_subtree(g, decomp, verbose=verbose)
    result *= g.scalar.to_number() ** preserve_scalar
    order = list(g.outputs()) + list(g.inputs())
    boundary_idx = {v: i for i, v in enumerate(boundary)}
    perm = [boundary_idx[v] for v in order]
    return result.reshape((2,) * len(order), order='F').transpose(perm)
