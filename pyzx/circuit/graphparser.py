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

from . import Circuit
from ..graph import Graph

def graph_to_circuit(g, split_phases=True):
    c = Circuit(g.qubit_count())
    qs = g.qubits()
    rs = g.rows()
    ty = g.types()
    phases = g.phases()
    rows = {}
    for v in g.vertices():
        if v in g.inputs: continue
        r = g.row(v)
        if r in rows: rows[r].append(v)
        else: rows[r] = [v]
    for r in sorted(rows.keys()):
        for v in rows[r]:
            q = qs[v]
            phase = phases[v]
            t = ty[v]
            neigh = [w for w in g.neighbours(v) if rs[w]<r]
            if len(neigh) != 1:
                raise TypeError("Graph doesn't seem circuit like: multiple parents")
            n = neigh[0]
            if qs[n] != q:
                raise TypeError("Graph doesn't seem circuit like: cross qubit connections")
            if g.edge_type(g.edge(n,v)) == 2:
                c.add_gate("HAD", q)
            if t == 0: #vertex is an output
                continue
            if phase!=0 and not split_phases:
                if t == 1: c.add_gate("ZPhase", q, phase=phase)
                else: c.add_gate("XPhase", q, phase=phase)
            elif t == 1 and phase.denominator == 2:
                c.add_gate("S", q, adjoint=(phase.numerator==3))
            elif t == 1 and phase.denominator == 4:
                if phase.numerator in (1,7): c.add_gate("T", q, adjoint=(phase.numerator==7))
                if phase.numerator in (3,5):
                    c.add_gate("Z", q)
                    c.add_gate("T", q, adjoint=(phase.numerator==3))
            elif phase == 1:
                if t == 1: c.add_gate("Z", q)
                else: c.add_gate("NOT", q)
            elif phase != 0:
                if t == 1: c.add_gate("ZPhase", q, phase=phase)
                else: c.add_gate("XPhase", q, phase=phase)

            neigh = [w for w in g.neighbours(v) if rs[w]==r and w<v]
            for n in neigh:
                t2 = ty[n]
                q2 = qs[n]
                if t == t2:
                    if g.edge_type(g.edge(v,n)) != 2:
                        raise TypeError("Invalid vertical connection between vertices of the same type")
                    if t == 1: c.add_gate("CZ", q2, q)
                    else: c.add_gate("CX", q2, q)
                else:
                    if g.edge_type(g.edge(v,n)) != 1:
                        raise TypeError("Invalid vertical connection between vertices of different type")
                    if t == 1: c.add_gate("CNOT", q, q2)
                    else: c.add_gate("CNOT", q2, q)
    return c


def circuit_to_graph(c, compress_rows=True, backend=None):
    """Turns the circuit into a ZX-Graph.
    If ``compress_rows`` is set, it tries to put single qubit gates on different qubits,
    on the same row."""
    g = Graph(backend)
    qs = {}
    rs = {}
    for i in range(c.qubits):
        v = g.add_vertex(0,i,0)
        g.inputs.append(v)
        qs[i] = v
        rs[i] = 1

    labels = {i:i for i in range(c.qubits)}

    for gate in c.gates:
        if gate.name == 'InitAncilla':
            l = gate.label
            if l in labels:
                raise ValueError("Ancilla label {} already in use".format(str(l)))
            q = len(labels)
            labels[l] = q
            r = max(rs.values())
            for i in rs: rs[i] = r
            rs[l] = r+1
            v = g.add_vertex(1, q, r)
            qs[l] = v
        elif gate.name == 'PostSelect':
            l = gate.label
            if l not in labels:
                raise ValueError("PostSelect label {} is not in use".format(str(l)))
            v = g.add_vertex(1, labels[l], rs[l])
            g.add_edge((qs[l],v),1)
            r = max(rs.values())
            for i in rs: rs[i] = r+1
            del qs[l]
            del rs[l]
            del labels[l]
        else:
            if not compress_rows: #or not isinstance(gate, (ZPhase, XPhase, HAD)):
                r = max(rs.values())
                for i in rs: rs[i] = r
            gate.to_graph(g,labels, qs,rs)
            if not compress_rows: # or not isinstance(gate, (ZPhase, XPhase, HAD)):
                r = max(rs.values())
                for i in rs: rs[i] = r

    r = max(rs.values())
    for l, o in labels.items():
        v = g.add_vertex(0,o,r)
        g.outputs.append(v)
        g.add_edge((qs[l],v))

    return g