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

import warnings

from . import Circuit
from .gates import (Gate, InitAncilla, Measurement, PostSelect, Reset, TargetMapper,
                     ConditionalGate, ZPhase, XPhase, NOT, Z, S, T, SX)
from ..utils import EdgeType, VertexType, FloatInt, FractionLike, settings
from ..graph import Graph
from ..graph.base import BaseGraph, VT, ET
from ..symbolic import Poly, new_var

def _poly_phase_to_conditional_gate(
    phase: Poly, vertex_type: VertexType, qubit: int
) -> ConditionalGate | None:
    """Try to convert a symbolic Poly phase into a ConditionalGate.

    The polynomial must consist entirely of boolean variables from the
    same classical register (with names like ``reg[i]``). The function
    evaluates the polynomial at every possible bit assignment to find
    the unique assignment that produces a non-zero result, which gives
    both the condition value and the inner gate phase.

    Returns ``None`` when the polynomial cannot be interpreted as a
    condition — e.g. variables from different registers, non-boolean
    variables, complex coefficients, or more than one non-zero
    assignment (which would mean the phase is not a simple conditional).

    Both Z- and X-type vertices are supported as the conditional
    inner gate.
    """
    from fractions import Fraction
    from ..symbolic import Var
    import re
    # Collect all boolean variables across all terms.
    bit_pattern = re.compile(r'^(\w+)\[(\d+)\]$')
    reg_name: str | None = None
    bit_vars: dict[int, Var] = {}
    for _coeff, term in phase.terms:
        for var, _exp in term.vars:
            if not var.is_bool:
                return None
            m = bit_pattern.match(var.name)
            if m is None:
                return None
            name = m.group(1)
            idx = int(m.group(2))
            if reg_name is None:
                reg_name = name
            elif reg_name != name:
                return None  # Variables from different registers.
            bit_vars[idx] = var
    if reg_name is None or not bit_vars:
        return None
    reg_size = max(bit_vars.keys()) + 1
    # Evaluate the polynomial at each possible bit assignment.
    # A valid condition polynomial is non-zero for exactly one assignment.
    if reg_size > 16:
        warnings.warn(
            "Conditional gate extraction is O(2^n) in register size; "
            "register '{}' has {} bits ({} evaluations).".format(
                reg_name, reg_size, 1 << reg_size))
    cond_value: int | None = None
    inner_phase_value: Fraction | None = None
    for val in range(1 << reg_size):
        var_map: dict[Var, Fraction] = {}
        for idx, var in bit_vars.items():
            var_map[var] = Fraction((val >> idx) & 1)
        result = phase.substitute(var_map)
        # After full substitution, sum all constant coefficients and
        # reduce mod 2 since phases are in units of pi.
        total: Fraction = Fraction(0)
        for c, t in result.terms:
            if t.vars:
                return None  # Not fully substituted.
            if isinstance(c, complex):
                return None
            total += Fraction(c)
        total = total % 2
        if total == 0:
            continue
        if cond_value is not None:
            return None  # Non-zero for more than one assignment.
        cond_value = val
        inner_phase_value = Fraction(total).limit_denominator(settings.float_to_fraction_max_denominator)
    if cond_value is None or inner_phase_value is None:
        return None
    inner_phase = inner_phase_value
    if vertex_type == VertexType.Z:
        if inner_phase == 1:
            inner_gate: Gate = Z(qubit)
        elif inner_phase == Fraction(1, 2):
            inner_gate = S(qubit)
        elif inner_phase == Fraction(-1, 2) or inner_phase == Fraction(3, 2):
            inner_gate = S(qubit, adjoint=True)
        elif inner_phase == Fraction(1, 4):
            inner_gate = T(qubit)
        elif inner_phase == Fraction(-1, 4) or inner_phase == Fraction(7, 4):
            inner_gate = T(qubit, adjoint=True)
        else:
            inner_gate = ZPhase(qubit, inner_phase)
    elif vertex_type == VertexType.X:
        if inner_phase == 1:
            inner_gate = NOT(qubit)
        elif inner_phase == Fraction(1, 2):
            inner_gate = SX(qubit)
        elif inner_phase == Fraction(-1, 2) or inner_phase == Fraction(3, 2):
            inner_gate = SX(qubit, adjoint=True)
        else:
            inner_gate = XPhase(qubit, inner_phase)
    else:
        raise ValueError(
            "Unsupported vertex type {} for conditional gate "
            "extraction.".format(vertex_type))
    return ConditionalGate(reg_name, cond_value, inner_gate, reg_size)


def graph_to_circuit(g:BaseGraph[VT,ET], split_phases:bool=True) -> Circuit:
    inputs = g.inputs()
    qs = g.qubits()
    rs = g.rows()
    ty = g.types()
    phases = g.phases()
    rows: dict[FloatInt, list[VT]] = {}
    # Map (vertex_type, phase) → InitAncilla state string.
    _reverse_state_map: dict[tuple, str] = {
        (VertexType.Z, 0): '+',
        (VertexType.Z, 1): '-',
        (VertexType.X, 0): '0',
        (VertexType.X, 1): '1',
    }

    # ``g.inputs()``/``g.outputs()`` may include classical-bit
    # boundaries in addition to quantum boundaries (see
    # ``circuit_to_graph``), so counting boundaries directly would
    # inflate the extracted qubit count. Derive the qubit count from
    # the maximum qubit index used by either non-boundary vertices or
    # non-classical boundary vertices, so identity-only quantum wires
    # (with no on-wire vertices) are still counted when other wires
    # contain gates. Boundaries tagged with ``is_classical`` (set by
    # ``circuit_to_graph``) are excluded; internal vertices on the
    # same qubit indices as classical boundaries (e.g. the ``Z``/``X``
    # pair from ``DiscardBit``) are also excluded so hybrid graphs do
    # not inflate the qubit count.
    classical_qubits = {
        qs[v] for v in list(inputs) + list(g.outputs())
        if g.vdata(v, 'is_classical', False)
    }
    quantum_vertex_qubits = [
        qs[v] for v in g.vertices()
        if ty[v] != VertexType.BOUNDARY and qs[v] not in classical_qubits
    ]
    quantum_boundary_qubits = [
        qs[v] for v in list(inputs) + list(g.outputs())
        if qs[v] not in classical_qubits
    ]
    all_quantum_qubits = quantum_vertex_qubits + quantum_boundary_qubits
    c = Circuit(int(max(all_quantum_qubits)) + 1 if all_quantum_qubits else 0)

    for v in g.vertices():
        if v in inputs: continue
        r = g.row(v)
        if r in rows: rows[r].append(v)
        else: rows[r] = [v]
    for r in sorted(rows.keys()):
        for v in rows[r]:
            q = qs[v]
            if q in classical_qubits:
                # Vertices on classical-bit wires (e.g. the ``Z``/``X``
                # pair from ``DiscardBit``) are out of scope for the
                # quantum-gate extractor; skip them to avoid emitting
                # spurious gates on non-existent qubit indices.
                continue
            phase = phases[v]
            t = ty[v]
            neigh = [w for w in g.neighbors(v) if rs[w]<r]
            if len(neigh) == 0:
                # No backward neighbour: state preparation vertex.
                qi = int(q)
                if g.vdata(v, 'outcome_type') == 'reset_state':
                    # Tagged X(0) leaf: the |0⟩ prep half of a Reset.
                    c.add_gate(Reset(qi))
                    continue
                state = _reverse_state_map.get((t, phase))
                if state is not None:
                    c.add_gate(InitAncilla(qi, state))
                    continue
                raise TypeError("Graph doesn't seem circuit like: "
                                "vertex {} has no parents".format(v))
            if len(neigh) != 1:
                raise TypeError("Graph doesn't seem circuit like: multiple parents")
            n = neigh[0]
            if qs[n] != q:
                raise TypeError("Graph doesn't seem circuit like: cross qubit connections")
            if g.edge_type(g.edge(n,v)) == EdgeType.HADAMARD:
                c.add_gate("HAD", q)
            if t == VertexType.BOUNDARY: #vertex is an output
                continue
            # Outcome / discard leaves are tagged in vertex data;
            # check the tag first so the leaf is recognised even after
            # ``g.substitute_variables(...)`` has unwrapped its Poly
            # phase to a concrete Fraction/int.
            outcome_type = g.vdata(v, 'outcome_type')
            if outcome_type == 'reset_discard':
                continue
            if outcome_type == 'measurement':
                # Prefer the classical destination stored in vdata so
                # the round-trip is correct after the leaf's Poly phase
                # has been substituted to a concrete value (in which
                # case ``str(phase)`` would be e.g. ``'1'``).
                result_symbol = g.vdata(v, 'result_symbol')
                if result_symbol is None:
                    result_symbol = str(phase)
                c.add_gate(Measurement(int(q), result_symbol=result_symbol))
                continue
            if isinstance(phase, Poly):
                # Untagged Poly phase on the wire: conditional gate.
                cgate = _poly_phase_to_conditional_gate(phase, t, int(q))
                if cgate is not None:
                    c.add_gate(cgate)
                elif phase != 0:
                    gate_name = "ZPhase" if t == VertexType.Z else "XPhase"
                    c.add_gate(gate_name, q, phase=phase)
            elif phase!=0 and not split_phases:
                if t == VertexType.Z: c.add_gate("ZPhase", q, phase=phase)
                else: c.add_gate("XPhase", q, phase=phase)
            elif t == VertexType.Z and phase.denominator == 2:
                c.add_gate("S", q, adjoint=(phase.numerator==3))
            elif t == VertexType.Z and phase.denominator == 4:
                if phase.numerator in (1,7): c.add_gate("T", q, adjoint=(phase.numerator==7))
                if phase.numerator in (3,5):
                    c.add_gate("Z", q)
                    c.add_gate("T", q, adjoint=(phase.numerator==3))
            elif phase == 1:
                if t == VertexType.Z: c.add_gate("Z", q)
                else: c.add_gate("NOT", q)
            elif phase != 0:
                if t == VertexType.Z: c.add_gate("ZPhase", q, phase=phase)
                else: c.add_gate("XPhase", q, phase=phase)

            neigh = [w for w in g.neighbors(v) if rs[w]==r and w<v] # TODO: find a different way to do comparison of vertices
            for n in neigh:
                t2 = ty[n]
                q2 = qs[n]
                if t == t2:
                    if g.edge_type(g.edge(v,n)) != EdgeType.HADAMARD:
                        raise TypeError("Invalid vertical connection between vertices of the same type")
                    if t == VertexType.Z: c.add_gate("CZ", q2, q)
                    else: c.add_gate("CX", q2, q)
                else:
                    if g.edge_type(g.edge(v,n)) != EdgeType.SIMPLE:
                        raise TypeError("Invalid vertical connection between vertices of different type")
                    if t == VertexType.Z: c.add_gate("CNOT", q, q2)
                    else: c.add_gate("CNOT", q2, q)
    return c


def circuit_to_graph(
    c: Circuit,
    compress_rows:bool = True,
    backend: str | None =None,
    initialize_qubits: list[bool] | None = None,
    postselect_qubits: list[int] | None = None,
    elide_initial_resets: bool = False,
) -> BaseGraph:
    """Turns the circuit into a ZX-Graph.
    If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
    on the same row.

    ``initialize_qubits`` denotes whether each input should be connected to |0⟩,
    ``postselect_qubits`` denotes for each measurement whether it should be
    postselected to |0⟩ (0) or |1⟩ (1).

    ``elide_initial_resets`` (default False) skips emitting the discard
    chain for a ``Reset`` whose preceding wire is still an unmodified
    input boundary. Defaults to False because programmatically
    constructed circuits may have uninitialized inputs, where a
    leading ``Reset`` is not redundant (it traces out an unknown input
    and prepares |0⟩). Set to True only when those inputs are already
    represented in the PyZX model as explicit |0⟩ states, e.g. via
    ``Circuit.initialize_qubits(...)`` / ``Graph.apply_state(...)`` or
    equivalent initialization. This matches OpenQASM-style implicit
    |0⟩ inputs; otherwise eliding changes semantics by leaving an open
    input boundary connected and turning the leading ``Reset`` into a
    no-op instead of trace-out-and-reprepare. When the precondition
    holds, eliding avoids creating an ``input -> Z(0) -> X(_rN)``
    measurement-and-discard fragment plus a separate ``X(0)`` |0⟩ prep
    per qubit."""
    g = Graph(backend)
    q_mapper: TargetMapper = TargetMapper()
    c_mapper: TargetMapper = TargetMapper()
    inputs = []
    outputs = []
    measure_targets = set()
    reset_count = 0

    def _next_reset_var_name() -> str:
        # Allocate the lowest ``_rN`` not already in the graph's
        # variable registry. Scanning rather than blindly using
        # ``reset_count`` avoids aliasing a user-defined symbolic
        # phase that happens to share the ``_rN`` name (which would
        # also break ``drop_orphan_reset_discards``, which assumes the
        # reset variable is unique to its orphan leaf).
        nonlocal reset_count
        existing = g.var_registry.vars()
        while "_r{}".format(reset_count) in existing:
            reset_count += 1
        name = "_r{}".format(reset_count)
        reset_count += 1
        return name

    # Create input vertices
    for i in range(c.qubits):
        v = g.add_vertex(VertexType.BOUNDARY,i,0)
        inputs.append(v)
        q_mapper.add_label(i, 1)
        q_mapper.set_prev_vertex(i, v)
    for i in range(c.bits):
        qubit = i+c.qubits
        v = g.add_vertex(VertexType.BOUNDARY, qubit, 0)
        # Tag classical-bit boundaries so ``graph_to_circuit`` can
        # distinguish them from quantum input boundaries when deriving
        # the qubit count.
        g.set_vdata(v, 'is_classical', True)
        inputs.append(v)
        c_mapper.add_label(i, 1)
        c_mapper.set_qubit(i, qubit)
        c_mapper.set_prev_vertex(i, v)


    for gate in c.gates:
        if isinstance(gate, Measurement):
            measure_targets.add(gate.target)
        if isinstance(gate, InitAncilla):
            l = gate.label
            if l in q_mapper.labels():
                raise ValueError("Ancilla label {} already in use".format(str(l)))
            vtype, phase = gate.get_vertex_info()
            q_mapper.add_label(l, q_mapper.next_row_or_default(l, q_mapper.max_row() - 1))
            v = g.add_vertex(vtype, q_mapper.to_qubit(l), q_mapper.next_row(l), phase)
            q_mapper.set_prev_vertex(l, v)
            q_mapper.advance_next_row(l)
        elif isinstance(gate, Reset):
            # Model reset as an implicit measurement with a discarded
            # outcome, followed by fresh |0⟩ preparation. The Z(0)
            # spider + X(_rN) leaf mirrors the measurement pattern.
            # The unused boolean variable gives trace-out semantics:
            # summing over its two values is equivalent to discarding.
            l = gate.label
            q = q_mapper.to_qubit(l)
            # The qubit is being reused, so clear any pending measurement
            # marker. If the qubit is measured again later without a
            # subsequent reset, it will be re-added.
            measure_targets.discard(q)
            r = q_mapper.next_row(l)
            u = q_mapper.prev_vertex(l)
            if (elide_initial_resets
                    and g.type(u) == VertexType.BOUNDARY
                    and u in inputs
                    and g.vertex_degree(u) == 0):
                # Reset on a fresh qreg input wire is redundant under
                # OpenQASM's "qreg implicitly |0⟩" semantics: the wire
                # has no prior state to trace out. Skip emitting the
                # discard chain and leave the input boundary as the
                # prev_vertex, so the next gate connects to it directly.
                continue
            # Implicit measurement (discarded outcome).
            reset_var = new_var(
                name=_next_reset_var_name(),
                is_bool=True, registry=g.var_registry)
            meas_v = g.add_vertex(VertexType.Z, q, r, 0)
            g.add_edge((u, meas_v), EdgeType.SIMPLE)
            outcome_v = g.add_vertex(VertexType.X, q, r + 0.5, reset_var)
            g.add_edge((meas_v, outcome_v), EdgeType.SIMPLE)
            g.set_vdata(outcome_v, 'outcome_type', 'reset_discard')
            # Disconnected X(0) leaf: fresh |0⟩ prep for the new wire
            # segment. Tagged so graph_to_circuit can recognise it without
            # colliding with InitAncilla('0') or hand-built X(0) state
            # vertices.
            state_v = g.add_vertex(VertexType.X, q, r + 1, 0)
            g.set_vdata(state_v, 'outcome_type', 'reset_state')
            q_mapper.set_prev_vertex(l, state_v)
            q_mapper.set_next_row(l, r + 2)
        elif isinstance(gate, PostSelect):
            l = gate.label
            if l not in q_mapper.labels():
                raise ValueError("PostSelect label {} is not in use".format(str(l)))
            q = q_mapper.to_qubit(l)
            r = q_mapper.next_row(l)
            u = q_mapper.prev_vertex(l)
            q_mapper.set_next_row(l, r + 1)
            q_mapper.remove_label(l)
            vtype, phase = gate.get_vertex_info()
            v = g.add_vertex(vtype, q, r, phase)
            g.add_edge((u,v),EdgeType.SIMPLE)
        else:
            if not compress_rows: #or not isinstance(gate, (ZPhase, XPhase, HAD)):
                q_mapper.set_max_row(max(q_mapper.max_row(), c_mapper.max_row()))
                c_mapper.set_max_row(q_mapper.max_row())
                q_mapper.set_all_rows_to_max()
                c_mapper.set_all_rows_to_max()
            gate.to_graph(g, q_mapper, c_mapper)
            if not compress_rows: # or not isinstance(gate, (ZPhase, XPhase, HAD)):
                q_mapper.set_max_row(max(q_mapper.max_row(), c_mapper.max_row()))
                c_mapper.set_max_row(q_mapper.max_row())
                q_mapper.set_all_rows_to_max()
                c_mapper.set_all_rows_to_max()

    # Create output vertices
    r = max(q_mapper.max_row(), c_mapper.max_row())
    measure_vertices = []
    for mapper in (q_mapper, c_mapper):
        is_classical = mapper is c_mapper
        for l in mapper.labels():
            o = mapper.to_qubit(l)
            u = mapper.prev_vertex(l)
            if o not in measure_targets:
                v = g.add_vertex(VertexType.BOUNDARY, o, r)
                if is_classical:
                    g.set_vdata(v, 'is_classical', True)
                outputs.append(v)
                g.add_edge((u,v))
            else:
                # The on-wire vertex ``u`` is the Z(0) measurement
                # spider; the symbolic outcome lives on its tagged
                # X-leaf, which is what postselection needs to target.
                # Fall back to ``u`` itself for legacy representations
                # without the tagged leaf.
                leaf = next(
                    (n for n in g.neighbors(u)
                     if g.vdata(n, 'outcome_type') == 'measurement'),
                    u)
                measure_vertices.append(leaf)

    g.set_inputs(tuple(inputs))
    g.set_outputs(tuple(outputs))

    if initialize_qubits:
        # ``inputs`` contains the ``c.qubits`` quantum inputs first,
        # followed by ``c.bits`` classical-bit boundaries. Only the
        # quantum prefix should be initialised, so the state string is
        # padded with '/' for classical inputs (which ``apply_state``
        # treats as "leave as-is"); otherwise ``apply_state`` would
        # drop the trailing classical boundaries from ``g.inputs()``.
        assert len(initialize_qubits) == c.qubits, \
            "Length of init list must be equal to number of qubits!"
        state = "".join("0" if i else "/" for i in initialize_qubits)
        state += "/" * c.bits
        g.apply_state(state)

    if postselect_qubits:
        assert len(measure_vertices) == len(postselect_qubits), "Length of post_select list must be equal to number of measurements!"
        for i, v in enumerate(measure_vertices):
            g.set_phase(v, postselect_qubits[i])

    return g
