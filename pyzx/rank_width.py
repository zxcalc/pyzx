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
import pyzx as zx
from copy import deepcopy
from itertools import product
from typing import Tuple, List, Iterable
from math import sqrt, pi, log2

from .linalg import REF, rank_factorize, generalized_inverse
from .symbolic import Poly


def adjacency_matrix(g: zx.graph.base.BaseGraph, v_left: Iterable[int], v_right: Iterable[int]) -> np.ndarray:
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


def linear_decomposition(arr: Iterable):
    decomp = None
    for elem in arr:
        decomp = elem if decomp is None else [decomp, elem]
    return decomp


def calc_ranks(decomp, g: zx.graph.base.BaseGraph):
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


def rank_width(decomp, g: zx.graph.base.BaseGraph, calc_rs=True) -> int:
    def iterate(data):
        if isinstance(data[0], int):
            return data[1].rank()
        return max(data[1].rank(), iterate(data[0][0]), iterate(data[0][1]))

    if decomp is None:
        return 0
    return iterate(calc_ranks(decomp, g) if calc_rs else decomp)


def rank_score_flops(decomp, g: zx.graph.base.BaseGraph, calc_rs=True) -> float:
    def iterate(data):
        if isinstance(data[0], int):
            return 0
        score1 = iterate(data[0][0])
        score2 = iterate(data[0][1])
        r1, r2, r3 = data[0][0][1].rank(), data[0][1][1].rank(), data[1].rank()
        return score1 + score2 + 2 ** (r1 + r2 + r3 - max(r1, r2, r3))

    if decomp is None:
        return 0
    score = iterate(calc_ranks(decomp, g) if calc_rs else decomp)
    return log2(max(score, 1))


def greedy_linear_order(g: zx.graph.base.BaseGraph) -> List:
    """
    Linear rank-decomposition obtained by greedily taking the next vertex.
    :param g: BaseGraph - ZX diagram
    :return order: list - sequence of vertices for the linear rank-decomposition
    """
    n = g.num_vertices()
    if n == 0:
        return []
    vert = list(g.vertices())
    mat = adjacency_matrix(g, vert, vert)
    ref = REF(mat)
    ref.take(0)
    order = [vert[0]]
    for i in range(1, n):
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


def greedy_b2t_decomposition(g: zx.graph.base.BaseGraph):
    """
    Rank-decomposition built greedily from bottom to top.
    :param g: BaseGraph - ZX diagram
    :return decomp: Any - rank-decomposition
    """
    n = g.num_vertices()
    if n == 0:
        return None
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


def generate_decomposition(g: zx.graph.base.BaseGraph, strategy='rw-auto', verbose=False):
    """
    Generate rank-decomposition of a ZX diagram using a specific strategy.
    :param g: BaseGraph - ZX diagram
    :param strategy: str - type of strategy
    :param verbose: bool - print additional info
    :return decomp: Any - rank-decomposition
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


def mat_image(M: np.ndarray) -> np.ndarray:
    """
    Compute y = xM for all possible vectors x.
    :param M: binary matrix of shape (n, m)
    :return ys: np.ndarray of shape (2^n,) - list of vectors represented as int64
    """
    n, m = M.shape
    M_ints = M @ (1 << np.arange(m))
    ys = np.zeros(1, dtype=np.int64)
    for pos in range(n):
        ys = np.concatenate([ys, M_ints[pos] ^ ys])
    return ys


def apply_parity_map(Psi: np.ndarray, M: np.ndarray) -> np.ndarray:
    """
    Apply parity map M to state Psi.
    :param Psi: np.ndarray of shape (..., 2^n)
    :param M: binary matrix of shape (n, m)
    :return Phi: np.ndarray of shape (..., 2^m)
    """
    m = M.shape[1]
    ys = mat_image(M)
    Phi = np.zeros((Psi.shape[0], 2 ** m), dtype=Psi.dtype)
    np.add.at(Phi, (slice(None), ys), Psi) # type: ignore
    Phi /= sqrt(2) ** (M.sum() - m)
    return Phi


def phase_tensor(E: np.ndarray):
    """
    Generate P_{a,b} = (-1)^{<a, Eb>} / sqrt(2)^|E|.
    :param E: binary matrix of shape (n, m)
    :return P: np.ndarray of shape (2^{n+m},)
    """
    n, m = E.shape
    Eb = mat_image(E.T)
    aEb = np.zeros((1, 2 ** m), dtype=np.int8)
    for pos in range(n):
        aEb = np.vstack([aEb, aEb ^ ((Eb >> pos) & 1)])
    P = (-1) ** aEb.reshape(-1, order='F') / sqrt(2) ** E.sum()
    return P


def conv_naive(Psi_v: np.ndarray, Psi_w: np.ndarray,
               E_vw: np.ndarray, E_vu: np.ndarray, E_wu: np.ndarray) -> np.ndarray:
    """
    Perform convolution naively in 2^{r_u + r_v + r_w} time.
    :param Psi_v: np.ndarray of shape (2^{b_v}, 2^{r_v})
    :param Psi_w: np.ndarray of shape (2^{b_w}, 2^{r_w})
    :param E_vw: binary matrix of shape (r_v, r_w)
    :param E_vu: binary matrix of shape (r_v, r_u)
    :param E_wu: binary matrix of shape (r_w, r_u)
    :return Psi_u: np.ndarray of shape (2^{b_v + b_w}, 2^{r_u})
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


def conv_vw(Psi_v: np.ndarray, Psi_w: np.ndarray,
            E_vw: np.ndarray, E_vu: np.ndarray, E_wu: np.ndarray) -> np.ndarray:
    """
    Perform convolution in 2^{r_v + r_w} time:
      1. Compute Psi_v ⊗ Psi_w and multiply by the phase tensor for E_vw
      2. Apply parity map [E_vu; E_wu]
    :param Psi_v: np.ndarray of shape (2^{b_v}, 2^{r_v})
    :param Psi_w: np.ndarray of shape (2^{b_w}, 2^{r_w})
    :param E_vw: binary matrix of shape (r_v, r_w)
    :param E_vu: binary matrix of shape (r_v, r_u)
    :param E_wu: binary matrix of shape (r_w, r_u)
    :return Psi_u: np.ndarray of shape (2^{b_v + b_w}, 2^{r_u})
    """
    Psi_vw = np.kron(Psi_w, Psi_v)
    Psi_vw *= phase_tensor(E_vw)
    E = np.vstack([E_vu, E_wu])
    Psi_u = apply_parity_map(Psi_vw, E)
    return Psi_u


def conv_uv(Psi_v: np.ndarray, Psi_w: np.ndarray,
            E_vw: np.ndarray, E_vu: np.ndarray, E_wu: np.ndarray) -> np.ndarray:
    """
    Perform convolution in 2^{r_u + r_v} time:
      1. Apply parity map [E_vw^T, E_wu] to Psi_w
      2. Multiply by the phase tensor for E_vu
      3. Post-select with Psi_v and apply FT on the second part
    :param Psi_v: np.ndarray of shape (2^{b_v}, 2^{r_v})
    :param Psi_w: np.ndarray of shape (2^{b_w}, 2^{r_w})
    :param E_vw: binary matrix of shape (r_v, r_w)
    :param E_vu: binary matrix of shape (r_v, r_u)
    :param E_wu: binary matrix of shape (r_w, r_u)
    :return Psi_u: np.ndarray of shape (2^{b_v + b_w}, 2^{r_u})
    """
    r_u, r_v, r_w = E_vu.shape[1], E_vu.shape[0], E_wu.shape[0]
    E = np.hstack([E_vw.T, E_wu])
    Psi_vu = apply_parity_map(Psi_w, E).reshape((-1,) + (2,) * r_v + (2 ** r_u,), order='F')
    Psi_vu = (np.fft.fftn(Psi_vu, axes=tuple(range(1, r_v + 1)))
              .reshape((-1, 2 ** (r_v + r_u)), order='F')) / sqrt(2) ** r_v
    E2 = np.block([[np.eye(r_v), E_vu],
                   [np.zeros((r_u, r_v)), np.eye(r_u)]]).astype(np.int8)
    Psi_vu = apply_parity_map(Psi_vu, E2).reshape((-1, 2 ** r_v, 2 ** r_u), order='F')
    Psi_u = np.tensordot(Psi_v, Psi_vu, axes=(1, 1)).reshape((-1, 2 ** r_u), order='F')
    return Psi_u


def conv(Psi_v: np.ndarray, Psi_w: np.ndarray,
         E_vw: np.ndarray, E_vu: np.ndarray, E_wu: np.ndarray, verbose=False) -> Tuple[np.ndarray, bool]:
    """
    Convolution in time O(2^{r_u + r_v + r_w - max(r_u, r_v, r_w)}) by calling a suitable subroutine.
    :param Psi_v: np.ndarray of shape (2^{b_v}, 2^{r_v})
    :param Psi_w: np.ndarray of shape (2^{b_w}, 2^{r_w})
    :param E_vw: binary matrix of shape (r_v, r_w)
    :param E_vu: binary matrix of shape (r_v, r_u)
    :param E_wu: binary matrix of shape (r_w, r_u)
    :param verbose: bool
    :return Psi_u: np.ndarray of shape (2^{b_v + b_w}, 2^{r_u})
            swapped: bool
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


def tensorfy_rw_subtree(g: zx.graph.base.BaseGraph, subtree, verbose=False) -> Tuple[
    np.ndarray, np.ndarray, np.ndarray, List]:
    """
    Returns the simulated version of the subdiagram induced by the leaves from the subtree.
    :param g: BaseGraph - ZX diagram
    :param subtree: Any - subtree of the rank-decomposition
    :param verbose: bool - print additional info
    :return Psi_u: np.ndarray of shape (2^{b_u}, 2^{r_u}) - tensorfication of the subdiagram
            M_u: binary matrix of shape (r_u, n) - parity map to the rest of the graph
            S_u: boolean array - set of vertices in the subdiagram
            B_u: list - order of boundary vertices in the subdiagram
    """
    n = g.num_vertices()
    v_all = np.array(list(g.vertices()))
    v_id = {v: i for i, v in enumerate(g.vertices())}

    if isinstance(subtree, int):
        vt = g.type(subtree)
        if vt == zx.VertexType.BOUNDARY:
            et = g.edge_type(list(g.incident_edges(subtree))[0])
            nb = list(g.neighbors(subtree))[0]
            nbt = g.type(nb)
            is_had = (et == zx.EdgeType.SIMPLE) ^ (nbt == zx.VertexType.BOUNDARY and nb < subtree)
            if is_had:
                Psi_u = np.array([[1, 1], [1, -1]], dtype=np.complex128) / sqrt(2)
            else:
                Psi_u = np.eye(2, dtype=np.complex128)
            B_u = [subtree]
        elif vt == zx.VertexType.Z:
            phase = g.phase(subtree)
            if isinstance(phase, Poly):
                raise ValueError(f"Can't convert diagram with parameters to tensor: {str(phase)}")
            Psi_u = np.array([[1, np.exp(pi * 1j * phase)]])
            B_u = []
        else:
            raise ValueError(f'Invalid vertex type: {vt}')
        M_u = adjacency_matrix(g, [subtree], v_all)
        S_u = np.zeros(n, dtype=bool)
        S_u[v_id[subtree]] = True
        return Psi_u, M_u, S_u, B_u

    Psi_v, M_v, S_v, B_v = tensorfy_rw_subtree(g, subtree[0], verbose=verbose)
    Psi_w, M_w, S_w, B_w = tensorfy_rw_subtree(g, subtree[1], verbose=verbose)
    Cin_v = M_v[:, S_w]
    Cin_w = M_w[:, S_v]
    Cout = np.concatenate((M_v, M_w))
    Cout[:, S_v | S_w] = 0

    r_u, U, V = rank_factorize(Cout)
    r_v, r_w = M_v.shape[0], M_w.shape[0]
    U, V = U[:, :r_u], V[:r_u]
    E_vu, E_wu = U[:r_v], U[r_v:]
    M_u = V

    B = adjacency_matrix(g, v_all[S_v], v_all[S_w])
    Bg = generalized_inverse(B)
    E_vw = (Cin_v @ Bg @ Cin_w.T) % 2
    Psi_u, swapped = conv(Psi_v, Psi_w, E_vw, E_vu, E_wu, verbose=verbose)
    pw = Cout.sum() - U.sum() - V.sum() + r_u
    pw += Cin_v.sum() + Cin_w.sum() - E_vw.sum() - B.sum()
    Psi_u /= sqrt(2) ** pw

    S_u = S_v | S_w
    B_u = B_v + B_w if not swapped else B_w + B_v
    return Psi_u, M_u, S_u, B_u


def tensorfy_rw(g: zx.graph.base.BaseGraph, strategy='rw-auto', preserve_scalar=True, verbose=False) -> np.ndarray:
    """
    Evaluate the tensor diagram corresponding to g using the rank-width method.
    :param g: BaseGraph - ZX diagram
    :param strategy: str - rank-decomposition generation strategy
    :param preserve_scalar: bool - account for the diagram scalar
    :param verbose: bool - print additional info
    :return result: np.ndarray - tensor with |O| + |I| dimensions (output dimensions first)
    """
    g = g.copy()
    zx.full_reduce(g)
    decomp = generate_decomposition(g, strategy=strategy, verbose=verbose)
    if decomp is None:
        return np.array(g.scalar.to_number() ** preserve_scalar)
    result, _, _, boundary = tensorfy_rw_subtree(g, decomp, verbose=verbose)
    result *= g.scalar.to_number() ** preserve_scalar
    order = list(g.outputs()) + list(g.inputs())
    boundary_idx = {v: i for i, v in enumerate(boundary)}
    perm = [boundary_idx[v] for v in order]
    return result.reshape((2,) * len(order), order='F').transpose(perm)
