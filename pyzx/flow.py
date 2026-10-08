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

from fractions import Fraction
from typing import Dict, Set, Tuple, Optional, Literal, Mapping, Union, overload

from .linalg import Mat2
from .graph.base import BaseGraph, VT, ET
from .utils import phase_is_clifford, phase_is_pauli, vertex_is_zx


_Measurement = Literal["XY", "X", "Y"]
_Layers = Dict[VT, int]
_Flow = Tuple[_Layers[VT], Dict[VT, Set[VT]]]
_Result = Optional[Union[_Flow[VT], _Layers[VT]]]


@overload
def gflow(
    g: BaseGraph[VT, ET], focus: bool=False, reverse: bool=False, pauli: bool=False,
    *, method: str="cubic", layers_only: Literal[False]=False
) -> Optional[_Flow[VT]]: ...


@overload
def gflow(
    g: BaseGraph[VT, ET], focus: bool=False, reverse: bool=False, pauli: bool=False,
    *, method: str="cubic", layers_only: Literal[True]
) -> Optional[_Layers[VT]]: ...


@overload
def gflow(
    g: BaseGraph[VT, ET], focus: bool=False, reverse: bool=False, pauli: bool=False,
    *, method: str="cubic", layers_only: bool
) -> _Result[VT]: ...


def gflow(
    g: BaseGraph[VT, ET], focus: bool=False, reverse: bool=False, pauli: bool=False,
    *, method: str="cubic", layers_only: bool=False
) -> _Result[VT]:
    r"""Find gflow with every spider interpreted as an XY measurement.

    :param g: A graph-like ZX diagram.
    :param focus: Require focused corrections, including constraints on grounds.
    :param reverse: Reverse the roles of inputs and outputs.
    :param pauli: Compatibility alias for :func:`pauli_flow` when ``True``.
        Use that entry point for new Pauli-flow calls.
    :param method: ``cubic`` (default) and ``incremental`` both use incremental
        column elimination; ``legacy`` retains the previous finder.
    :param layers_only: Skip correction-coordinate tracking and return only
        layers when ``True``. Supported by ``cubic`` and ``incremental``.
    :return: ``(layers, corrections)`` by default, a layer dictionary with
        ``layers_only=True``, or ``None`` if no flow exists. An empty graph
        has flow and gives an empty dictionary in layers-only mode.

    Incremental elimination returns focused corrections even when
    ``focus=False``. That mode omits ground rows; ``focus=True`` keeps their
    homogeneous constraints. Corrections and layers can differ from legacy.
    Ordinary order runs from smaller to larger layers; reverse mode inverts
    numbering.

    Spider phases do not affect XY assignments. With ``pauli=True``, delegate
    to :func:`pauli_flow`, which infers X and Y assignments from phases.
    """
    if pauli:
        return pauli_flow(g, focus=focus, reverse=reverse, method=method,
                          layers_only=layers_only)
    if method == "legacy":
        if layers_only:
            raise ValueError("layers_only is not supported by the legacy finder")
        return _gflow_legacy(g, focus=focus, reverse=reverse, pauli=False)
    if method not in ("cubic", "incremental"):
        raise ValueError("Unknown flow method: " + method)

    measurements: Dict[VT, _Measurement] = {
        v: "XY" for v in g.vertices() if vertex_is_zx(g.type(v))
    }
    return _find_incremental_flow(g, measurements, focus=focus, reverse=reverse,
                                  layers_only=layers_only)


@overload
def pauli_flow(
    g: BaseGraph[VT, ET], focus: bool=False, reverse: bool=False,
    *, method: str="cubic", layers_only: Literal[False]=False
) -> Optional[_Flow[VT]]: ...


@overload
def pauli_flow(
    g: BaseGraph[VT, ET], focus: bool=False, reverse: bool=False,
    *, method: str="cubic", layers_only: Literal[True]
) -> Optional[_Layers[VT]]: ...


@overload
def pauli_flow(
    g: BaseGraph[VT, ET], focus: bool=False, reverse: bool=False,
    *, method: str="cubic", layers_only: bool
) -> _Result[VT]: ...


def pauli_flow(
    g: BaseGraph[VT, ET], focus: bool=False, reverse: bool=False,
    *, method: str="cubic", layers_only: bool=False
) -> _Result[VT]:
    r"""Find Pauli flow for XY, X, and Y measurements.

    Infer measurement types from spider phases: Pauli phases give X,
    half-integer Clifford phases give Y, and other phases give XY.
    Other measurement types are not supported.

    :param g: A graph-like ZX diagram.
    :param focus: Require focused corrections, including ground constraints.
    :param reverse: Reverse the roles of inputs and outputs.
    :param method: ``cubic`` (default) and ``incremental`` both use incremental
        column elimination; ``legacy`` retains the previous finder.
    :param layers_only: Skip correction-coordinate tracking and return only
        layers when ``True``. Supported by ``cubic`` and ``incremental``.
    :return: ``(layers, corrections)`` by default, a layer dictionary with
        ``layers_only=True``, or ``None`` if no flow exists. An empty graph
        has flow and gives an empty dictionary in layers-only mode.

    Incremental elimination returns focused corrections even when
    ``focus=False``. That mode omits ground rows; ``focus=True`` keeps their
    homogeneous constraints. Corrections and layers can differ from legacy.
    Ordinary order runs from smaller to larger layers; reverse mode inverts
    numbering.
    """
    if method == "legacy":
        if layers_only:
            raise ValueError("layers_only is not supported by the legacy finder")
        return _gflow_legacy(g, focus=focus, reverse=reverse, pauli=True)
    if method not in ("cubic", "incremental"):
        raise ValueError("Unknown flow method: " + method)

    measurements: Dict[VT, _Measurement] = {}
    for v in g.vertices():
        if not vertex_is_zx(g.type(v)):
            continue
        phase = g.phase(v) % 2
        if phase_is_pauli(phase):
            measurements[v] = "X"
        elif phase_is_clifford(phase):
            measurements[v] = "Y"
        else:
            measurements[v] = "XY"
    return _find_incremental_flow(g, measurements, focus=focus, reverse=reverse,
                                  layers_only=layers_only)


def _find_incremental_flow(
    g: BaseGraph[VT, ET], measurements: Mapping[VT, _Measurement],
    focus: bool=False, reverse: bool=False, *, layers_only: bool=False
) -> _Result[VT]:
    r"""Find focused flow from explicit XY/X/Y assignments.

    ``measurements`` assigns every ZX spider, including outputs and grounds,
    in graph vertex order. Assignments are authoritative; phases are not read.

    For XY/X/Y, the Mitosek--Backens order-demand matrix N consists only of
    zero rows and an identity subblock. Order constraints therefore just
    forbid individual unprocessed XY correction coordinates. This permits
    incremental column elimination without constructing a global right inverse,
    kernel basis or kernel-adjustment system. General XZ/YZ order demands
    cannot be handled by this simple column-availability rule.

    Each candidate column is inserted at most once; each new pivot updates
    each unsolved RHS at most once. Packed integer vectors give O(n^3) bit
    work and O(n^2) matrix bits. See https://arxiv.org/abs/2410.23439 for M/N.

    With ``layers_only=True``, residual reduction and layer construction are
    identical, but no correction-coordinate vectors or sets are constructed.
    """
    vertices = list(measurements)
    vertex_set = set(vertices)
    inputs = {v for b in g.inputs() for v in g.neighbors(b) if v in vertex_set}
    outputs = {v for b in g.outputs() for v in g.neighbors(b) if v in vertex_set}
    if reverse:
        inputs, outputs = outputs, inputs
    processed = outputs | (g.grounds() & vertex_set)
    paulis = {v for v in vertices if measurements[v] in ("X", "Y")}
    ys = {v for v in vertices if measurements[v] == "Y"}

    rows = [v for v in vertices if v not in (outputs if focus else processed)]
    row_index = {v: i for i, v in enumerate(rows)}
    columns = [v for v in vertices if v not in inputs]
    column_index = {v: j for j, v in enumerate(columns)}
    demand = []
    for v in columns:
        bits = 0
        for w in g.neighbors(v):
            if w in row_index:
                bits |= 1 << row_index[w]
        if v in ys and v in row_index:
            bits |= 1 << row_index[v]
        demand.append(bits)

    residual = [1 << i for i in range(len(rows))]
    solutions = [] if layers_only else [0] * len(rows)
    active = [i for i, v in enumerate(rows) if v not in processed]
    # Each entry is (pivot bit, transformed M column, correction coordinates).
    # Coordinates stay zero in layers-only mode.
    # Later basis vectors have zero entries at every earlier pivot.
    basis: list[tuple[int, int, int]] = []
    # N only selects XY coordinates: outputs and X/Y correctors are available
    # now; each non-input XY column is added after its vertex is processed.
    # Keep every demand row, including already solved ones, to retain focusing.
    pending = [column_index[v] for v in columns if v in processed or v in paulis]
    inserted = set(pending)
    layers = {v: 0 for v in processed}
    corrections: Dict[VT, Set[VT]] = {}
    depth = 0
    while active:
        for j in pending:
            vector = demand[j]
            combination = 0 if layers_only else 1 << j
            for pivot, column, coordinates in basis:
                if vector & pivot:
                    vector ^= column
                    if not layers_only:
                        combination ^= coordinates
            if not vector:
                continue
            pivot = vector & -vector
            basis.append((pivot, vector, combination))
            for i in active:
                if residual[i] & pivot:
                    residual[i] ^= vector
                    if not layers_only:
                        solutions[i] ^= combination

        solved = [i for i in active if not residual[i]]
        if not solved:
            return None
        depth += 1
        pending = []
        for i in solved:
            v = rows[i]
            layers[v] = depth
            if not layers_only:
                correction = set()
                bits = solutions[i]
                while bits:
                    bit = bits & -bits
                    correction.add(columns[bit.bit_length() - 1])
                    bits ^= bit
                corrections[v] = correction
            if v in column_index and column_index[v] not in inserted:
                j = column_index[v]
                inserted.add(j)
                pending.append(j)
        active = [i for i in active if residual[i]]

    layers = {v: layer if reverse else depth - layer for v, layer in layers.items()}
    return layers if layers_only else (layers, corrections)


def _gflow_legacy(
    g: BaseGraph[VT, ET], focus: bool=False, reverse: bool=False, pauli: bool=False
) -> Optional[Tuple[Dict[VT, int], Dict[VT, Set[VT]]]]:
    r"""Compute the gflow of a diagram in graph-like form.

    :param g: A graphlike ZX diagram.
    :param focus: Compute the focussed gflow
    :param reverse: Reverse the roles of inputs and outputs
    :param pauli: Compute the Pauli flow, restricted to {XY, X, Y} measurements

    Based on algorithm by Perdrix and Mhalla.
    See dx.doi.org/10.1007/978-3-540-70575-8_70

    Slightly extended to allow searching for Pauli flow with measurement planes {XY, X, Y}.

    Here is the pseudocode it is based on:
    ```
    input : An open graph
    output: A generalised flow

    gFlow (V,Gamma,In,Out) =
    begin
      for all v in Out do
        l(v) := 0
      end
      return gFlowaux (V,Gamma,In,Out,1)
    end

    gFlowaux (V,Gamma,In,Out,k) =
    begin
      C := {}
      for all u in V \\ Out do
        Solve in F2 : Gamma[V \\ Out, Out \\ In] * I[X] = I[{u}]
        if there is a solution X0 then
          C := C union {u}
          g(u) := X0
          l(u) := k
        end
      end
      if C = {} then
        return (Out = V,(g,l))
      else
        return gFlowaux (V, Gamma, In, Out union C, k + 1)
      end
    end
    ```
    """
    l: Dict[VT, int] = {}
    gflow: Dict[VT, Set[VT]] = {}
    ty = g.types()

    vertices: Set[VT] = set(v for v in g.vertices() if vertex_is_zx(ty[v]))
    pattern_inputs: Set[VT] = set()
    pattern_outputs: Set[VT] = set()
    pauli_x: Set[VT] = set()
    pauli_y: Set[VT] = set()

    for inp in g.inputs():
        pattern_inputs |= set(n for n in g.neighbors(inp) if vertex_is_zx(ty[n]))
    for outp in g.outputs():
        pattern_outputs |= set(n for n in g.neighbors(outp) if vertex_is_zx(ty[n]))

    if reverse:
        pattern_inputs, pattern_outputs = pattern_outputs, pattern_inputs

    if pauli:
        for v in vertices:
            p = g.phase(v) % 2
            if phase_is_pauli(p):
                pauli_x.add(v)
            elif phase_is_clifford(p):
                pauli_y.add(v)

    processed: Set[VT] = pattern_outputs.copy() | g.grounds()
    non_outputs = list(vertices.difference(pattern_outputs))
    zerovec = Mat2.zeros(len(non_outputs), 1)
    for v in processed:
        l[v] = 0

    k: int = 1
    while True:
        correct: Set[VT] = set()

        # a list of nodes that can currently be used in the correction set of the next node
        # Keep candidate v when its column in the current flow-demand matrix
        # is nonzero on an unprocessed row. This can arise either from a graph
        # edge or, for Pauli-Y, from the diagonal coefficient M[v, v] = 1.
        candidates = [
            v
            for v in (processed | pauli_x | pauli_y).difference(pattern_inputs)
            if focus
            or (v in pauli_y and v not in processed)
            or any(w not in processed for w in g.neighbors(v))
        ]

        if focus:
            clean = non_outputs
        else:
            clean = [v for v in vertices
                        if v not in processed and
                        ((v in pauli_y and v in candidates)
                         or any(w in candidates for w in g.neighbors(v)))]

        # compute the "flow-demand matrix", which is essentially the bi-adjacency matrix from
        # "clean" to "candidates", which additionally relates every Y-measured node to
        # itself.
        m = Mat2([[1 if g.connected(v,w) or (v==w and v in pauli_y) else 0
                   for v in candidates] for w in clean])

        for index, u in enumerate(clean):
            if not focus or (
                u not in processed
                and (
                    (u in pauli_y and u in candidates)
                    or any(w in candidates for w in g.neighbors(u))
                )
            ):
                vu = zerovec.copy()
                vu.data[index][0] = 1
                x = m.solve(vu)
                if x:
                    correct.add(u)
                    gflow[u] = {candidates[i] for i in range(x.rows()) if x.data[i][0]}
                    l[u] = k

        if not correct:
            if len(vertices) == len(processed):
                return {v: i if reverse else k - i - 1 for v,i in l.items()}, gflow
            return None
        else:
            processed.update(correct)
            k += 1
