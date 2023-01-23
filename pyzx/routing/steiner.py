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

from typing import List, Tuple, Optional

from .architecture import Architecture
from ..linalg import Mat2

debug = False

def steiner_gauss(matrix: Mat2, architecture: Architecture, full_reduce=False, x=None, y=None):
    """
    Performs Gaussian elimination that is constraint by the given architecture
    
    :param matrix: PyZX Mat2 matrix to be reduced
    :param architecture: The Architecture object to conform to
    :param full_reduce: Whether to fully reduce or only create an upper triangular form
    :param x: 
    :param y: 
    :return: Rank of the given matrix
    """

    def row_add(c0, c1):
        matrix.row_add(c0, c1)
        if debug:
            print("Reducing", c0, c1)
        if x != None: x.row_add(c0, c1)
        if y != None: y.col_add(c1, c0)

    def steiner_reduce(col: int, root: int, nodes: List[int], upper: bool):
        steiner_tree = architecture.steiner_tree(root, nodes, upper)
        # Remove all zeros
        next_check = next(steiner_tree)
        if upper:
            zeros = []
            while next_check is not None:
                s0, s1 = next_check
                if matrix[s0, col] == 0:  # s1 is a new steiner point or root = 0
                    zeros.append(next_check)
                next_check = next(steiner_tree)
            while len(zeros) > 0:
                s0, s1 = zeros.pop(-1)
                if matrix[s0, col] == 0:
                    row_add(s1, s0)
                    if debug:
                        print(matrix[s0, col], matrix[s1, col])
            if next_check is not None and matrix[next_check[0], col] == 0:  # root is zero
                print("WARNING : Root is 0 => reducing non-pivot column", matrix.data)
            if debug:
                print("Step 1: remove zeros", matrix[:, col])
            while next_check is not None:
                s0, s1 = next_check
                if matrix[s1, col] == 0:  # s1 is a new steiner point
                    row_add(s0, s1)
                next_check = next(steiner_tree)
        # Reduce stuff
        if debug:
            print("Step 2: remove ones")
        next_add = next(steiner_tree)
        while next_add is not None:
            s0, s1 = next_add
            row_add(s0, s1)
            next_add = next(steiner_tree)
            if debug:
                print(next_add)
        if debug:
            print("Step 3: profit")

    rows = matrix.rows()
    cols = matrix.cols()
    p_cols = []
    pivot = 0
    current_row = 0

    for current_row in range(rows):
        found_pivot = False
        nodes = []
        while not found_pivot and pivot < cols:
            nodes = [r for r in range(current_row,rows)
                       if matrix[r,pivot] == 1]
            if len(nodes) > 0:
                p_cols.append(pivot)
                found_pivot = True
            else:
                pivot += 1
        # no more pivots left
        if not found_pivot: break

        if nodes[0] != current_row:
            nodes.insert(0,current_row)
        steiner_reduce(pivot, current_row, nodes, True)
        pivot+=1



    # for c in range(cols):
    #     nodes = [r for r in range(pivot, rows) if pivot==r or matrix[r,c] == 1]
    #     steiner_reduce(c, pivot, nodes, True)
    #     if matrix[pivot,c] == 1:
    #         p_cols.append(c)
    #         pivot += 1

    if debug:
        print("Upper triangle form", matrix)
    rank = len(p_cols)
    if debug:
        print(p_cols)

    if full_reduce:
        for current_row in reversed(range(len(p_cols))):
            pivot = p_cols[current_row]
            nodes = [r for r in range(0, current_row) if matrix[r,pivot] == 1]
            if len(nodes) > 0:
                nodes.append(current_row)
                steiner_reduce(pivot, current_row, nodes, False)

    # if full_reduce:
    #     pivot -= 1
    #     for c in reversed(p_cols):
    #         debug and print(pivot, matrix[:,c])
    #         nodes = [r for r in range(0, pivot+1) if r==pivot or matrix[r,c] == 1]
    #         if len(nodes) > 1:
    #             steiner_reduce(c, pivot, nodes, False)
    #         pivot -= 1
    return rank

def rec_steiner_gauss(matrix: Mat2, architecture: Architecture, full_reduce: bool=False, x=None, y=None, permutation=None, **kwargs):
    """
    Performs Gaussian elimination that is constraint bij the given architecture according to https://arxiv.org/pdf/1904.00633.pdf
    Only works on full rank, square matrices.
    
    :param matrix: PyZX Mat2 matrix to be reduced
    :param architecture: The Architecture object to conform to
    :param full_reduce: Whether to fully reduce or only create an upper triangular form
    :param x: 
    :param y: 
    """
    if permutation is None:
        permutation = [i for i in range(matrix.rows())]
    else:
        matrix.permute_cols(permutation)

    def row_add(c0, c1):
        matrix.row_add(c0, c1)
        if debug:
            print("Reducing", c0, c1)
        if x != None: x.row_add(c0, c1)
        if y != None: y.col_add(c1, c0)

    def steiner_reduce(col, root, nodes, usable_nodes, rec_nodes, upper):
        if not all([q in usable_nodes for q in nodes]):
            raise Exception("Terminals not in the subgraph "+ str(upper) + str((col, root, nodes, usable_nodes, rec_nodes)))
        generator = steiner_reduce_column(architecture, [row[col] for row in matrix.data], root, nodes, usable_nodes, rec_nodes, upper)
        cnot = next(generator, None)
        tree_nodes = []
        while cnot is not None:
            if cnot[0] not in usable_nodes+rec_nodes or cnot[1] not in usable_nodes + rec_nodes:
                raise Exception("Steiner tree not sticking to constraints")
            tree_nodes.extend(cnot)
            row_add(*cnot)
            cnot = next(generator, None)
        return tree_nodes

    def rec_step(qubit_removal_order):
        # size, p_cols and pivot is needed if the matrix isn't square or of full rank
        size = len(qubit_removal_order)
        # Order the rows and columns to be ascending.
        pivots = list(sorted(qubit_removal_order))
        for pivot_idx, c in enumerate(pivots):
            # Get all the nodes in the row below the diagonal (rows[i:]) where the entry equals 1 or it is the diagonal
            nodes = [r for r in pivots[pivot_idx:] if c==r or matrix.data[r][c] == 1] 
            # Perform the steiner_reduce on the current column (c) with root rows2[pivot] and you can use the full matrix
            steiner_reduce(c, c, nodes, pivots[pivot_idx:], [], True)
        #Quick check upper triangular form - should never be printing!
        if not all([all([matrix.data[i][j]== 0 for j in range(0, i)]) for i in range(size)]):
            print("This should never be printed. If you read this, there is a bug in pyzx/routing/steiner.py")
            print()
            print("not upper triangular form?")
            for row in matrix.data:
                print(row)
            print("--------")
        # Full reduce requires the recursion
        if full_reduce:
            # We precalculated the maximal leafs in R (in the qubit_removal_order)
            for i, c in enumerate(qubit_removal_order):
                # Vertices we can still use steiner trees
                usable_nodes = qubit_removal_order[i:] # = R

                # Pick the maximal vertex k in R: k = max(usable_nodes)
                # Pick the maximal leaf k' in R: k' = cols[i] = c
                # Let W be the set of vertices in the shortest path from k' to k (inclusive)
                path = architecture.shortest_path(c, max(usable_nodes))#, usable_nodes) 
                if path is None:
                    raise ValueError(f"The architecture is not connected using when considering nodes 0..{max(usable_nodes)}")
                rec_qubits = [architecture.vertex2qubit(v) for v in path]

                # Apply steiner up:
                # Pick the nodes of the steiner tree: all rows with a 1 in column c or the pivot row (diagonal)
                nodes = [r for r in usable_nodes if (r==c or matrix.data[r][c] == 1)]

                if len(nodes) > 1: # Otherwise it is the diagonal, which is trivial/done
                    steiner_reduce(c, c, nodes, usable_nodes, rec_qubits, False)

                # Do recursion on the recursive nodes that were allowed to break the the upper triangular form.
                if len(rec_qubits) > 1: # Trivial otherwise
                    rec_step(list(reversed(rec_qubits)))#[n for n in rows if n in rec_qubits])

    # The qubit order is the order in which the spanning tree R is traversed
    rec_step(architecture.reduce_order)


def steiner_reduce_column(architecture: Architecture, col: List[int], root: int, nodes: List[int], usable_nodes: List[int], rec_nodes, upper: bool):
    steiner_tree = architecture.rec_steiner_tree(root, nodes, usable_nodes, rec_nodes, upper)
    # Remove all zeros
    next_check = next(steiner_tree)
    if debug:
        print("Step 1: remove zeros")
    if upper:
        zeros = []
        while next_check is not None:
            s0, s1 = next_check
            if col[s0] == 0:  # s1 is a new steiner point or root = 0
                zeros.append(next_check)
            next_check = next(steiner_tree)
        while len(zeros) > 0:
            s0, s1 = zeros.pop(-1)
            if col[s0] == 0:
                col[s0] = (col[s1]+col[s0])%2
                yield s1, s0
                if debug:
                    print(col[s0], col[s1])
    else:
        if debug:
            print("deal with zero root")
        if next_check is not None and col[next_check[0]] == 0:  # root is zero
            print("WARNING : Root is 0 => reducing non-pivot column", col)
        if debug:
            print("Step 1: remove zeros", col)
        while next_check is not None:
            s0, s1 = next_check
            if col[s1] == 0:  # s1 is a new steiner point
                col[s1] = (col[s1]+col[s0])%2
                yield s0, s1
            next_check = next(steiner_tree)
    # Reduce stuff
    if debug:
        print("Step 2: remove ones")
    next_add = next(steiner_tree)
    while next_add is not None:
        s0, s1 = next_add
        col[s1] = (col[s1]+col[s0])%2
        yield s0, s1
        next_add = next(steiner_tree)
        if debug:
            print(next_add)
    if debug:
        print("Step 3: profit")
