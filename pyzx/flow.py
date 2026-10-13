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
import warnings
from typing import Dict, List, Set, Tuple, Optional, Literal, Mapping, Union, overload

from .linalg import Mat2
from .graph.base import BaseGraph, VT, ET
from .utils import phase_is_clifford, phase_is_pauli, vertex_is_zx


_Measurement = Literal["XY", "X", "Y"]
_Layers = Dict[VT, int]
_Flow = Tuple[_Layers[VT], Dict[VT, Set[VT]]]
_Result = Optional[Union[_Flow[VT], _Layers[VT]]]


@overload
def gflow(
    g: BaseGraph[VT, ET], focus: Optional[bool]=None, reverse: bool=False,
    pauli: bool=False, *, method: Literal["cubic", "legacy"]="cubic",
    include_ground_constraints: Optional[bool]=None,
    layers_only: Literal[False]=False
) -> Optional[_Flow[VT]]: ...


@overload
def gflow(
    g: BaseGraph[VT, ET], focus: Optional[bool]=None, reverse: bool=False,
    pauli: bool=False, *, method: Literal["cubic", "legacy"]="cubic",
    include_ground_constraints: Optional[bool]=None,
    layers_only: Literal[True]
) -> Optional[_Layers[VT]]: ...


@overload
def gflow(
    g: BaseGraph[VT, ET], focus: Optional[bool]=None, reverse: bool=False,
    pauli: bool=False, *, method: Literal["cubic", "legacy"]="cubic",
    include_ground_constraints: Optional[bool]=None,
    layers_only: bool
) -> _Result[VT]: ...


def gflow(
    g: BaseGraph[VT, ET], focus: Optional[bool]=None, reverse: bool=False,
    pauli: bool=False, *, method: Literal["cubic", "legacy"]="cubic",
    include_ground_constraints: Optional[bool]=None,
    layers_only: bool=False
) -> _Result[VT]:
    r"""Find gflow with every spider interpreted as an XY measurement.

    :param g: A graph-like ZX diagram.
    :param focus: Applies to legacy finder only. Ensure returned flow is
        focused when ``True``.
    :param reverse: Reverse the roles of inputs and outputs.
    :param pauli: Deprecated alias for :func:`pauli_flow` when ``True``.
    :param method: ``cubic`` (default) or ``legacy``.
    :param include_ground_constraints: Applies to cubic finder only. Keep
        ground rows in the correction equations when ``True``. Defaults to
        ``False``.
    :param layers_only: Cubic only. Return layers without correction sets.
    :return: ``(layers, corrections)`` by default, a layer dictionary with
        ``layers_only=True``, or ``None`` if no flow exists. An empty graph
        has flow and gives an empty dictionary in layers-only mode.

    The cubic finder always returns focused flow. The ground constraints of
    focused conditions are controlled separately. The legacy finder can
    return unfocused corrections with ``focus=False``. Correction sets and
    layers can differ between methods. Reverse mode inverts numbering of
    layers in the partial order.

    Spider phases do not affect XY assignments. With ``pauli=True``, issue a
    ``DeprecationWarning`` and delegate to :func:`pauli_flow`.
    """
    if pauli:
        warnings.warn(
            "pyzx.flow.gflow(..., pauli=True) is deprecated. "
            "Use pyzx.flow.pauli_flow(...) instead.",
            DeprecationWarning, stacklevel=2,
        )
        return pauli_flow(g, focus=focus, reverse=reverse, method=method,
                          include_ground_constraints=include_ground_constraints,
                          layers_only=layers_only)
    _check_method_options(method, focus, include_ground_constraints, layers_only)
    if method == "legacy":
        return _gflow_legacy(g, focus=False if focus is None else focus,
                             reverse=reverse, pauli=False)
    measurements: Dict[VT, _Measurement] = {
        v: "XY" for v in g.vertices() if vertex_is_zx(g.type(v))
    }
    return _find_cubic_flow(
        g, measurements, reverse=reverse,
        include_ground_constraints=(False if include_ground_constraints is None
                                    else include_ground_constraints),
        layers_only=layers_only,
    )


@overload
def pauli_flow(
    g: BaseGraph[VT, ET], focus: Optional[bool]=None, reverse: bool=False,
    *, method: Literal["cubic", "legacy"]="cubic",
    include_ground_constraints: Optional[bool]=None,
    layers_only: Literal[False]=False
) -> Optional[_Flow[VT]]: ...


@overload
def pauli_flow(
    g: BaseGraph[VT, ET], focus: Optional[bool]=None, reverse: bool=False,
    *, method: Literal["cubic", "legacy"]="cubic",
    include_ground_constraints: Optional[bool]=None,
    layers_only: Literal[True]
) -> Optional[_Layers[VT]]: ...


@overload
def pauli_flow(
    g: BaseGraph[VT, ET], focus: Optional[bool]=None, reverse: bool=False,
    *, method: Literal["cubic", "legacy"]="cubic",
    include_ground_constraints: Optional[bool]=None,
    layers_only: bool
) -> _Result[VT]: ...


def pauli_flow(
    g: BaseGraph[VT, ET], focus: Optional[bool]=None, reverse: bool=False,
    *, method: Literal["cubic", "legacy"]="cubic",
    include_ground_constraints: Optional[bool]=None,
    layers_only: bool=False
) -> _Result[VT]:
    r"""Find Pauli flow for XY, X, and Y measurements.

    Infer measurement types from spider phases: Pauli phases give X,
    half-integer Clifford phases give Y, and other phases give XY.
    Other measurement types are not supported.

    :param g: A graph-like ZX diagram.
    :param focus: Applies to legacy finder only. Ensure returned flow is
        focused when ``True``.
    :param reverse: Reverse the roles of inputs and outputs.
    :param method: ``cubic`` (default) or ``legacy``.
    :param include_ground_constraints: Applies to cubic finder only. Keep
        ground rows in the correction equations when ``True``. Defaults to
        ``False``.
    :param layers_only: Cubic only. Return layers without correction sets.
    :return: ``(layers, corrections)`` by default, a layer dictionary with
        ``layers_only=True``, or ``None`` if no flow exists. An empty graph
        has flow and gives an empty dictionary in layers-only mode.

    The cubic finder always returns focused flow. The ground constraints of
    focused conditions are controlled separately. The legacy finder can
    return unfocused corrections with ``focus=False``. Correction sets and
    layers can differ between methods. Reverse mode inverts numbering of
    layers in the partial order.
    """
    _check_method_options(method, focus, include_ground_constraints, layers_only)
    if method == "legacy":
        return _gflow_legacy(g, focus=False if focus is None else focus,
                             reverse=reverse, pauli=True)
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
    return _find_cubic_flow(
        g, measurements, reverse=reverse,
        include_ground_constraints=(False if include_ground_constraints is None
                                    else include_ground_constraints),
        layers_only=layers_only,
    )


def _check_method_options(
    method: str, focus: Optional[bool], include_ground_constraints: Optional[bool],
    layers_only: bool
) -> None:
    """Validate backend options; None distinguishes omission from False."""
    if method not in ("cubic", "legacy"):
        raise ValueError(f"Unknown flow method: {method!r}")
    if method == "cubic" and focus is not None:
        raise ValueError(
            "focus is only supported by the legacy finder; "
            "use include_ground_constraints for cubic ground constraints"
        )
    if method == "legacy":
        if include_ground_constraints is not None:
            raise ValueError("include_ground_constraints is only supported by cubic")
        if layers_only:
            raise ValueError("layers_only is not supported by the legacy finder")


def _find_cubic_flow(
    g: BaseGraph[VT, ET], measurements: Mapping[VT, _Measurement],
    reverse: bool=False, *, include_ground_constraints: bool=False,
    layers_only: bool=False
) -> _Result[VT]:
    r"""Find focused flow from explicit XY/X/Y assignments.

    ``measurements`` assigns every ZX spider, including outputs and grounds,
    in graph vertex order. Assignments are authoritative; phases are not read.

    For XY/X/Y, the Mitosek--Backens order-demand matrix N consists only of
    zero rows and an identity subblock. Order constraints therefore just
    forbid individual unprocessed XY correction coordinates. This permits
    column elimination without constructing a global right inverse,
    kernel basis or kernel-adjustment system. General XZ/YZ order demands
    cannot be handled by this simple column-availability rule.

    Each candidate column is inserted at most once; each new pivot updates
    each unsolved RHS at most once. Packed integer vectors give O(n^3) bit
    work and O(n^2) matrix bits. See https://doi.org/10.1088/1751-8121/ae2999
    for M/N.

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

    excluded_rows = outputs if include_ground_constraints else processed
    rows = [v for v in vertices if v not in excluded_rows]
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
    basis: List[Tuple[int, int, int]] = []
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
