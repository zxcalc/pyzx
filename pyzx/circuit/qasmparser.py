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


import math
import re
from fractions import Fraction

from . import Circuit
from .gates import (
    CCZ, CHAD, CNOT, ConditionalGate, CPhase, CRX, CRY, CRZ, CSWAP, CSX, CU, CU3, CY, CZ,
    Gate, HAD, Measurement, NOT, Reset, RXX, RZZ, S, SWAP, SX,
    T, Tofolli, U2, U3, XPhase, Y, YPhase, Z, ZPhase, qasm_gate_table
)
from ..symbolic import Var, new_var, parse as parse_symbolic_expr, parse_phase_list
from ..utils import settings


class QASMParser(object):
    """Class for parsing QASM source files into circuit descriptions."""

    def __init__(self) -> None:
        self.qasm_version: int = settings.default_qasm_version
        self.gates: list[Gate] = []
        self.custom_gates: dict[str, Circuit] = {}
        self.parametrized_gates: dict[str, tuple[list[str], list[str], list[str]]] = {}
        self._param_subst: dict[str, Fraction] | None = None
        self.registers: dict[str, tuple[int, int]] = {}
        self.cregisters: dict[str, int] = {}
        self.qubit_count: int = 0
        self.bit_count: int = 0
        self.circuit: Circuit | None = None

    def parse(self, s: str, strict:bool=True) -> Circuit:
        self.gates = []
        self.custom_gates = {}
        self.parametrized_gates = {}
        self._param_subst = None
        self.registers = {}
        self.cregisters = {}
        self.qubit_count = 0
        self.bit_count = 0
        self.circuit = None
        lines = s.splitlines()
        r = []
        #strip comments
        for s in lines:
            if s.find("//")!=-1:
                t = s[0:s.find("//")].strip()
            else: t = s.strip()
            if t: r.append(t)

        match = re.fullmatch(r"OPENQASM ([23])(\.\d+)?;", r[0])
        if match and match.group(1):
            self.qasm_version = int(match.group(1))
            r.pop(0)
        elif strict:
            raise TypeError("File does not start with supported OPENQASM descriptor.")

        if self.qasm_version == 2 and r[0].startswith('include "qelib1.inc";') or \
                self.qasm_version == 3 and r[0].startswith('include "stdgates.inc";'):
            r.pop(0)
        elif strict:
            raise TypeError("File is not importing standard library")

        data = "\n".join(r)
        # Strip the custom command definitions from the normal commands.
        gate_decl = re.compile(r"\bgate ")
        while True:
            m = gate_decl.search(data)
            if m is None: break
            i = m.start()
            j = data.find("}", i)
            self.parse_custom_gate(data[i:j+1])
            data = data[:i] + data[j+1:]
        data = self._expand_if_blocks(data)
        # Parse the regular commands.
        commands = [s.strip() for s in data.split(";") if s.strip()]
        for c in commands:
            self.gates.extend(self.parse_command(c, self.registers))

        self.bit_count = sum(self.cregisters.values())
        circ = Circuit(self.qubit_count, bit_amount=self.bit_count)
        circ.gates = self.gates
        self.circuit = circ
        return self.circuit

    @staticmethod
    def _expand_if_blocks(s: str) -> str:
        """Expand braced if-blocks into flat if-statements.

        E.g. ``if (c==1) { x q[0]; z q[1]; }`` becomes
        ``if (c==1) x q[0]; if (c==1) z q[1];``

        This is done before semicolon-splitting so that the braces do
        not break the command boundaries.  Nested if-blocks (e.g.
        ``if (c==1) { if (c==0) { x q[0]; } }``) are rejected.
        """
        pattern = re.compile(r'if\s*\([^)]*\)\s*\{')
        while True:
            m = pattern.search(s)
            if m is None:
                break
            prefix = m.group()          # e.g. "if (c==1) {"
            condition = prefix[:prefix.rfind('{')].strip()  # "if (c==1)"
            brace_start = m.end()
            try:
                brace_end = s.index('}', brace_start)
            except ValueError:
                raise TypeError(
                    "Unterminated if-block (missing closing '}}') near: "
                    "{}".format(s[m.start():m.start() + 80].strip()))
            body = s[brace_start:brace_end]
            # Reject nested if-blocks.
            if '{' in body:
                raise TypeError(
                    "Nested if-blocks are not supported: {}".format(
                        s[m.start():brace_end + 1].strip()))
            inner_cmds = [c.strip() for c in body.split(';') if c.strip()]
            expanded = '; '.join(condition + ' ' + c for c in inner_cmds) + ';'
            s = s[:m.start()] + expanded + s[brace_end + 1:]
        return s

    def parse_custom_gate(self, data: str) -> None:
        data = data[5:]
        spec, body = data.split("{",1)
        params: list[str] = []
        if "(" in spec:
            i = spec.find("(")
            j = spec.find(")")
            params = [p.strip() for p in spec[i+1:j].split(",") if p.strip()]
            spec = spec[:i] + spec[j+1:]
        spec = spec.strip()
        if " " in spec:
            name, args = spec.split(" ",1)
            name = name.strip()
            args = args.strip()
        else:
            raise TypeError("Custom gate specification doesn't have any "
                            "arguments: {}".format(data))
        qubit_args: list[str] = []
        for a in args.split(","):
            a = a.strip()
            if a in qubit_args or a in params:
                raise TypeError("Duplicate variable name: {}".format(data))
            qubit_args.append(a)

        body = body[:-1].strip()
        commands = [s.strip() for s in body.split(";") if s.strip()]
        if params:
            self.parametrized_gates[name] = (params, qubit_args, commands)
            return
        registers = {a: (k, 1) for k, a in enumerate(qubit_args)}
        circ = Circuit(len(qubit_args))
        for c in commands:
            for g in self.parse_command(c, registers):
                circ.add_gate(g)
        self.custom_gates[name] = circ

    def _instantiate_parametrized_gate(
            self, name: str, phases: list[Fraction], c: str) -> Circuit:
        """Instantiate a custom gate with parameters by binding its arguments.
        """
        params, qubit_args, commands = self.parametrized_gates[name]
        if len(phases) != len(params):
            raise TypeError(
                "Parameter amount does not match gate spec: {}".format(c))
        registers = {a: (k, 1) for k, a in enumerate(qubit_args)}
        circ = Circuit(len(qubit_args))
        saved = self._param_subst
        self._param_subst = dict(zip(params, phases))
        try:
            for cmd in commands:
                for g in self.parse_command(cmd, registers):
                    circ.add_gate(g)
        finally:
            self._param_subst = saved
        return circ

    def extract_command_parts(self, c: str) -> tuple[str, list[Fraction], list[str]]:
        if self.qasm_version == 3:
            # Convert some OpenQASM 3 commands into OpenQASM 2 format.
            c = re.sub(r"^bit\[(\d+)] (\w+)$", r"creg \2[\1]", c)
            c = re.sub(r"^qubit\[(\d+)] (\w+)$", r"qreg \2[\1]", c)
            c = re.sub(r"^(\w+)\[(\d+)] = measure (\w+)\[(\d+)]$", r"measure \3[\4] -> \1[\2]", c)
        left_bracket = c.find('(')
        phases: list[Fraction] = []
        if left_bracket == -1:
            name, rest = (c.split(" ", 1) + [""])[:2]
        else:
            # Delegate paren matching and top-level comma splitting to the symbolic grammar.
            try:
                vals, offset = parse_phase_list(c[left_bracket:])
            except Exception as exc:
                raise TypeError(
                    "Invalid phase list in {}: {}".format(c, exc)) from exc
            phases = [self.parse_phase_arg(v) for v in vals if v]
            name = c[:left_bracket]
            rest = c[left_bracket + offset:].lstrip()
        args = [s.strip() for s in rest.split(",") if s.strip()]
        return name, phases, args

    def parse_command(self, c: str, registers: dict[str, tuple[int, int]]) -> list[Gate]:
        gates: list[Gate] = []
        # Handle `if (creg == val) gate args;` before extract_command_parts,
        # because the parentheses in `if(...)` confuse the phase parser.
        if_match = re.match(r'if\s*\(\s*(\w+)\s*==\s*(\d+)\s*\)\s*(.*)', c)
        if if_match:
            reg_name = if_match.group(1)
            cond_val = int(if_match.group(2))
            inner_cmd = if_match.group(3)
            if reg_name not in self.cregisters:
                raise TypeError("Unknown classical register '{}'".format(reg_name))
            reg_size = self.cregisters[reg_name]
            inner_gates = self.parse_command(inner_cmd, registers)
            for ig in inner_gates:
                gates.append(ConditionalGate(reg_name, cond_val, ig, reg_size))
            return gates
        name, phases, args = self.extract_command_parts(c)
        if name in ("barrier", "id"): return gates
        if name == "creg":
            regname, sizep = args[0].split("[", 1)
            size = int(sizep[:-1])
            self.cregisters[regname] = size
            return gates
        if name == "measure":
            # Strip all spaces so we can split on '->' regardless of spacing.
            raw = args[0].replace(' ', '')
            target, result_bit = raw.split('->')
            if '[' in target:
                # Single qubit: measure q[0] -> c[0];
                regname, target_idx = target.split('[', 1)
                if regname not in registers:
                    raise TypeError("Invalid register {}".format(regname))
                target_qbit = registers[regname][0] + int(target_idx[:-1])
                result_reg_name, result_idx = result_bit.split('[', 1)
                result_index = int(result_idx[:-1])
                if result_reg_name not in self.cregisters:
                    raise TypeError("Undeclared classical register {}".format(
                        result_reg_name))
                if result_index >= self.cregisters[result_reg_name]:
                    raise TypeError(
                        "Index {} out of range for classical register {} "
                        "of size {}".format(
                            result_index, result_reg_name,
                            self.cregisters[result_reg_name]))
                gate = Measurement(target_qbit, result_symbol="{}[{}]".format(result_reg_name, result_index))
                gates.append(gate)
            else:
                # Register broadcast: measure q -> c.
                if target not in registers:
                    raise TypeError("Invalid register {}".format(target))
                if result_bit not in self.cregisters:
                    raise TypeError("Undeclared classical register {}".format(
                        result_bit))
                start, size = registers[target]
                if size > self.cregisters[result_bit]:
                    raise TypeError(
                        "Quantum register {} (size {}) is larger than "
                        "classical register {} (size {})".format(
                            target, size, result_bit,
                            self.cregisters[result_bit]))
                for i in range(size):
                    gate = Measurement(start + i, result_symbol="{}[{}]".format(result_bit, i))
                    gates.append(gate)
            return gates
        if name == "reset":
            # Reset initializes a qubit to |0⟩ state.
            # In OpenQASM: `reset q[0];` or `reset q;` (for entire register)
            for a in args:
                if "[" in a:
                    regname, valp = a.split("[", 1)
                    val = int(valp[:-1])
                    if regname not in registers:
                        raise TypeError("Invalid register {}".format(regname))
                    qubit = registers[regname][0] + val
                    gates.append(Reset(qubit))
                else:
                    if a not in registers:
                        raise TypeError("Invalid register {}".format(a))
                    start, size = registers[a]
                    for i in range(size):
                        gates.append(Reset(start + i))
            return gates
        if name in ("opaque",):
            raise TypeError("Unsupported operation {}".format(c))
        if name == "qreg":
            regname, sizep = args[0].split("[",1)
            size = int(sizep[:-1])
            registers[regname] = (self.qubit_count, size)
            self.qubit_count += size
            return gates
        qubit_values = []
        is_range = False
        dim = 1
        for a in args:
            if "[" in a:
                # Split at the first '[' to handle multi-character register names
                regname, valp = a.split("[",1)
                # Remove the trailing ']' before converting to int
                val = int(valp[:-1])
                if regname not in registers:
                    raise TypeError("Invalid register {}".format(regname))
                qubit_values.append([registers[regname][0]+val])
            else:
                if is_range:
                    if registers[a][1] != dim:
                        raise TypeError("Error in parsing {}: Register sizes do not match".format(c))
                else:
                    dim = registers[a][1]
                is_range = True
                s = registers[a][0]
                qubit_values.append(list(range(s,s + dim)))
        if is_range:
            for i in range(len(qubit_values)):
                if len(qubit_values[i]) != dim:
                    qubit_values[i] = [qubit_values[i][0]]*dim
        custom_circ: Circuit | None = None
        if name in self.parametrized_gates:
            custom_circ = self._instantiate_parametrized_gate(name, phases, c)
        elif name in self.custom_gates:
            custom_circ = self.custom_gates[name]
        for j in range(dim):
            argset = [q[j] for q in qubit_values]
            gtype = qasm_gate_table.get(name)
            if custom_circ is not None:
                if len(argset) != custom_circ.qubits:
                    raise TypeError("Argument amount does not match gate spec: {}".format(c))
                for g in custom_circ.gates:
                    gates.append(g.reposition(argset))
            elif gtype in (NOT, Y, Z, HAD):
                if len(phases) != 0: raise TypeError("Invalid specification {}".format(c))
                g = gtype(argset[0])
                gates.append(g)
            elif gtype in (S, T, SX):
                if len(phases) != 0: raise TypeError("Invalid specification {}".format(c))
                g = gtype(argset[0], adjoint=(name in ('sdg', 'tdg', 'sxdg')))
                gates.append(g)
            elif gtype in (XPhase, YPhase, ZPhase):
                if len(phases) != 1: raise TypeError("Invalid specification {}".format(c))
                g = gtype(argset[0], phase=phases[0])
                gates.append(g)
            elif gtype is U2:
                if len(phases) != 2: raise TypeError("Invalid specification {}".format(c))
                gates.append(gtype(argset[0], phases[0], phases[1]))
            elif gtype is U3:
                if len(phases) != 3: raise TypeError("Invalid specification {}".format(c))
                gates.append(gtype(argset[0], phases[0], phases[1], phases[2]))
            elif gtype in (CNOT, CY, CZ, CHAD, CSX, SWAP):
                if len(phases) != 0: raise TypeError("Invalid specification {}".format(c))
                g = gtype(control=argset[0],target=argset[1])
                gates.append(g)
            elif gtype in (CRX, CRY, CRZ, CPhase, RXX, RZZ):
                if len(phases) != 1: raise TypeError("Invalid specification {}".format(c))
                g = gtype(argset[0], argset[1], phase=phases[0])
                gates.append(g)
            elif gtype in (Tofolli, CCZ, CSWAP):
                if len(phases) != 0: raise TypeError("Invalid specification {}".format(c))
                g = gtype(ctrl1=argset[0], ctrl2=argset[1], target=argset[2])
                gates.append(g)
            elif gtype is CU3:
                if len(phases) != 3: raise TypeError("Invalid specification {}".format(c))
                g = gtype(control=argset[0], target=argset[1], theta=phases[0], phi=phases[1], rho=phases[2])
                gates.append(g)
            elif gtype is CU:
                if len(phases) != 4: raise TypeError("Invalid specification {}".format(c))
                g = gtype(control=argset[0], target=argset[1], theta=phases[0], phi=phases[1], rho=phases[2], gamma=phases[3])
                gates.append(g)
            else:
                raise TypeError("Invalid specification: {}".format(c))
        return gates

    def parse_phase_arg(self, val):
        val = val.strip()
        if self._param_subst is not None:
            bound = self._bind_phase_parameters(val)
            if bound is not None:
                return bound
        try:
            poly = parse_symbolic_expr(val, lambda n: new_var(n, False))
        except Exception as exc:
            raise TypeError("Invalid specification {}: {}".format(val, exc))
        if poly.free_vars():
            raise TypeError(
                "Phase expression {!r} contains unbound variables".format(val))
        const: int | float | complex | Fraction = \
            poly.terms[0][0] if poly.terms else 0
        if isinstance(const, complex):
            raise TypeError("Phase expression {!r} is not real".format(val))
        if 'pi' not in val:
            # Value without ``pi`` is in radians; normalise by pi.
            const = float(const) / math.pi
        return Fraction(const).limit_denominator(
            settings.float_to_fraction_max_denominator)

    def _bind_phase_parameters(self, val: str) -> Fraction | None:
        """Resolve a gate-body phase expression that uses bound parameters.

        Only expressions the symbolic grammar accepts are supported. Otherwise,
        ``TypeError`` is raised.
        """
        assert self._param_subst is not None
        names = self._param_subst
        if not names or not re.search(
                r'\b(' + '|'.join(re.escape(n) for n in names) + r')\b', val):
            return None
        try:
            poly = parse_symbolic_expr(val, lambda n: new_var(n, False))
            result = poly.substitute({Var(n): v for n, v in names.items()})
        except Exception as exc:
            raise TypeError(
                "Unsupported parametrized gate-body phase {!r}: {}".format(
                    val, exc)) from exc
        if result.free_vars():
            raise TypeError(
                "Parametrized gate-body phase {!r} does not reduce to a "
                "constant after binding {}".format(val, dict(names)))
        const: int | float | complex | Fraction = \
            result.terms[0][0] if result.terms else 0
        if isinstance(const, complex):
            raise TypeError(
                "Parametrized gate-body phase {!r} bound to a non-real "
                "value".format(val))
        return Fraction(const).limit_denominator(
            settings.float_to_fraction_max_denominator)


def qasm(s: str) -> Circuit:
    """Parses a string representing a program in QASM, and outputs a `Circuit`."""
    p = QASMParser()
    return p.parse(s, strict=False)
