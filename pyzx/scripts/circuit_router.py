# PyZX - Python library for quantum circuit rewriting
#        and optimisation using the ZX-calculus
# Copyright (C) 2019 - Aleks Kissinger, John van de Wetering,
#                      and Arianne Meijer-van de Griend

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

import sys, os
import time
import argparse
from typing import Any, Dict, Iterable, List, Union

from pyzx.routing.cnot_mapper import CompileMode, ElimMode, gauss, genetic_elim_modes, basic_elim_modes, pso_elim_modes, sequential_gauss, elim_modes
from pyzx.routing.parity_maps import CNOT_tracker

try:
    from pandas import DataFrame
except:
    DataFrame = None
    if __name__ == "__main__":
        print("Warning: could not import pandas. No performance data will be exported.")
sys.path.append("..")
import numpy as np


from ..linalg import CNOTMaker, Mat2
from ..graph import Graph
from ..simplify import teleport_reduce, interior_clifford_simp
from ..circuit import Circuit
from ..optimize import basic_optimization
from ..routing.architecture import (
    Architecture,
    architectures,
    SQUARE,
    dynamic_size_architectures,
    create_architecture,
)
from ..routing.machine_learning import ParticleSwarmOptimization
from ..drawing import draw
from ..utils import make_into_list, restricted_float

description = (
    "Compiles given qasm files or those in the given folder to a given architecture."
)

debug = False

from ..extract import bi_adj, connectivity_from_biadj, permutation_as_swaps


def create_dest_filename(
    original_file,
    outformat,
    population=None,
    iteration=None,
    crossover_prob=None,
    mutation_prob=None,
    index=None,
    pso_size=None,
    pso_step=None,
    pso_sco=None,
    pso_pco=None,
    pso_m=None,
):
    pop_ext = "" if population is None else "pop" + str(population)
    iter_ext = "" if iteration is None else "iter" + str(iteration)
    crosover_ext = "" if crossover_prob is None else "crossover" + str(crossover_prob)
    mutation_ext = "" if mutation_prob is None else "mutate" + str(mutation_prob)
    pso_ext = (
        "pso"
        + "_".join(
            [
                s + str(v)
                for s, v in zip(
                    ["swarm", "steps", "sco", "pco", "mut"],
                    [pso_size, pso_step, pso_sco, pso_pco, pso_m],
                )
            ]
        )
        if pso_size != None
        else ""
    )
    index_ext = "" if index is None else "(" + str(index) + ")"
    filename = os.path.basename(original_file)
    base_file, extension = os.path.splitext(filename)
    if outformat not in ("qasm", "qc", "quipper", "match"):
        print(
            "Unsupported circuit type {}. Please use qasm, qc or quipper".format(
                outformat
            )
        )
        return
    elif outformat != "match":
        extension = outformat

    new_filename = (
        "_".join(
            [
                part
                for part in [
                    base_file,
                    pop_ext,
                    iter_ext,
                    crosover_ext,
                    mutation_ext,
                    pso_ext,
                    index_ext,
                ]
                if part != ""
            ]
        )
        + extension
    )
    return new_filename


def read_circuit(source):
    if not os.path.exists(source):
        print("File {} does not exist".format(source))
        return
    return Circuit.load(source)


def simple_extract_no_gadgets(
    g,
    extract_cnots=None,
    quiet=True,
    initial_qubit_placement=None,
    allow_output_perm=False,
):
    if initial_qubit_placement is None:
        initial_qubit_placement = [i for i in range(g.qubit_count())]
    g.normalise()
    g = preprocess_graph(g)
    qs = g.qubits()  # We are assuming that these are objects that update...
    rs = g.rows()  # ...to reflect changes to the graph, so that when...
    ty = (
        g.types()
    )  # ... g.set_row/g.set_qubit is called, these things update directly to reflect that
    phases = g.phases()
    if extract_cnots is None:
        extract_cnots = lambda mat2, p, col=False: Mat2(
            [[mat2.data[i][j] for j in p] if col else mat2.data[i] for i in p]
        ).to_cnots()

    h = Graph()

    qindex = {}
    depth = 0
    for i in range(len(g.inputs)):
        v = h.add_vertex(0, i, depth)
        h.inputs.append(v)
        qindex[i] = v
    depth = 1

    def add_phase_gate(q, phase):
        nonlocal depth
        v = h.add_vertex(1, q, depth, phase)
        h.add_edge((qindex[q], v), 1)
        qindex[q] = v
        depth += 1
        return v

    def add_hadamard(q):
        nonlocal depth
        v = h.add_vertex(1, q, depth)
        h.add_edge((qindex[q], v), 2)
        qindex[q] = v
        depth += 1
        return v

    def add_cnot(ctrl, tgt):
        nonlocal depth
        v1 = h.add_vertex(1, ctrl, depth)
        v2 = h.add_vertex(2, tgt, depth)
        h.add_edges([(qindex[ctrl], v1), (qindex[tgt], v2), (v1, v2)], 1)
        qindex[ctrl] = v1
        qindex[tgt] = v2
        depth += 1
        return v1, v2

    leftrow = 1

    nodes = []  # Non phase-gadgets
    for v in g.vertices():  # Find which vertices are gadgets
        if rs[v] > 1:
            g.set_row(v, rs[v] + 20)
        if v in g.inputs or v in g.outputs:
            continue
        elif all(
            w in g.inputs or w in g.outputs or len(list(g.neighbours(w))) != 1
            for w in g.neighbours(v)
        ):  # regular vertex
            nodes.append(v)
    nodestotal = 19

    processed_targets = {}
    while True:
        left = [v for v in g.vertices() if rs[v] == leftrow]
        # fig = draw(g)
        # fig.savefig("test.png", dpi=720)
        # import matplotlib.pyplot as plt
        # plt.close(fig)
        for v in left:
            # First we add the gates to the circuit that can be processed now,
            # and we simplify the graph to represent this.
            q = qs[v]
            phase = phases[v]
            t = ty[v]
            if t != 1:
                raise TypeError("Only supports zx-diagrams in graph-like state")
            neigh = [w for w in g.neighbours(v) if rs[w] < leftrow]
            if len(neigh) != 1:
                raise TypeError("Graph doesn't seem circuit like: multiple parents")
            n = neigh[0]
            if qs[n] != q:
                raise TypeError(
                    "Graph doesn't seem circuit like: cross qubit connections"
                )
            if g.edge_type(g.edge(n, v)) == 2:
                add_hadamard(q)
                g.set_edge_type(g.edge(n, v), 1)
            # if t == 0: continue # it is an output
            if phase != 0:
                add_phase_gate(q, phase)
                g.set_phase(v, 0)

        neighbours = set()
        finished = set()
        for v in left.copy():  # Deal with frontier connected to outputs
            d = [w for w in g.neighbours(v) if rs[w] > leftrow]
            if any(w in g.outputs for w in d):
                if len(d) == 1:
                    finished.add(v)
                b = [w for w in d if w in g.outputs][0]
                q = qs[b]
                r = rs[b]
                w = g.add_vertex(1, q, r - 1)
                nodes.append(w)
                e = g.edge(v, b)
                et = g.edge_type(e)
                g.remove_edge(e)
                g.add_edge((v, w), 2)
                g.add_edge((w, b), 3 - et)
                d.remove(b)
                d.append(w)
            neighbours.update(d)

        # if not left: break  # We are done
        if len(finished) == g.qubit_count() or not left:
            break
        left.sort(key=lambda v: g.qubit(v))
        right = [
            w for w in neighbours if w in nodes
        ]  # Only get non-phase-gadget neighbours
        m = bi_adj(g, right, left)
        cnots = extract_cnots(m, initial_qubit_placement)
        for cnot in cnots:
            m.row_add(cnot.target, cnot.control)
            add_cnot(qs[left[cnot.control]], qs[left[cnot.target]])
        connectivity_from_biadj(g, m, right, left)
        good_verts = {}
        for i, row in enumerate(m.data):
            if sum(row) == 1:
                v = left[i]
                w = right[[j for j in range(len(m.data[i])) if m.data[i][j]][0]]
                is_connected = lambda v, l: any([g.connected(v, w) for w in l])
                if not is_connected(w, good_verts.values()):
                    good_verts[v] = w
        if not good_verts:
            print(m)
            print(left)
            print(right)
            print(nodes)
            raise Exception("No good match found")
        for v in left:
            if v not in good_verts:
                g.set_row(v, leftrow + 1)
            else:
                g.set_row(good_verts[v], leftrow + 1)
                g.set_qubit(good_verts[v], qs[v])
                if len(list(g.neighbours(v))) > 2:  # Gadgets are still connected to it
                    w = add_phase_gate(qs[v], 0)
                    processed_targets[v] = w
        leftrow += 1
        if leftrow >= nodestotal:
            nodestotal += 20
            for v in g.vertices():
                if rs[v] > leftrow:
                    g.set_row(v, rs[v] + 20)

    # We are done processing now. Time to deal with swaps.
    left.sort(key=lambda v: g.qubit(v))
    right = [w for v in left for w in g.neighbours(v) if rs[w] > leftrow]
    if not allow_output_perm:
        right.sort(key=lambda v: g.qubit(v))
        m = bi_adj(g, right, left)
        cnots = extract_cnots(m, initial_qubit_placement, col=True)  # Does Gauss
        for cnot in cnots:
            m.row_add(cnot.target, cnot.control)
            add_cnot(cnot.control, cnot.target)
        connectivity_from_biadj(g, m, right, left)  # Removes connections from g

        for i, w in enumerate(g.outputs):
            n = list(g.neighbours(w))[0]
            et = g.edge_type(g.edge(n, w))
            v = h.add_vertex(0, i, depth)
            h.outputs.append(v)
            h.add_edge((qindex[i], v), 3 - et)
            qindex[i] = v
        final_placement = [i for i in range(g.qubit_count())]
    else:
        final_placement = [g.qubit(r) for r in right]
        for q, l in enumerate(left):
            n = right[q]
            r = [v for v in g.outputs if n == list(g.neighbours(v))[0]][0]
            et = g.edge_type(g.edge(n, r))
            v = h.add_vertex(0, q, depth)
            h.outputs.append(v)
            h.add_edge((qindex[q], v), 3 - et)
            qindex[q] = v
    return h, final_placement


def preprocess_graph(g):
    g.normalise()
    for v in g.vertices():  # increase the row
        if v not in g.inputs:
            r = g.row(v)
            g.set_row(v, r + 2)
    for input in g.inputs:
        n = list(g.neighbours(input))[0]
        q = g.qubit(input)
        edge = g.edge(input, n)
        etype = g.edge_type(edge)
        v1 = g.add_vertex(1, q, 1)
        g.add_edge((input, v1), edgetype=1)
        if etype == 1:  # Normal edge -> add -o-H-o-H-
            v2 = g.add_vertex(1, q, 2)
            g.add_edge((v1, v2), edgetype=2)
            v1 = v2
            # else Hadamard edge -> add -o-
        g.add_edge((v1, n), edgetype=2)
        g.remove_edge(edge)
    for output in g.outputs:
        n = list(g.neighbours(output))[0]
        edge = g.edge(output, n)
        etype = g.edge_type(edge)
        r = g.row(output)
        g.set_row(output, r + 1)
        if etype == 2:  # Normal edge -> append -o-
            q = g.qubit(output)
            v1 = g.add_vertex(1, q, r)
            g.add_edge((n, v1), edgetype=2)
            g.add_edge((v1, output), edgetype=1)
            g.remove_edge(edge)
    g.normalise()
    return g


def route_circuit(
    c,
    architecture,
    mode=ElimMode.STEINER_MODE,
    dest_file=None,
    population=30,
    iterations=15,
    crossover_prob=0.8,
    mutation_prob=0.2,
    allow_output_perm=True,
    swarm_size=15,
    n_steps=10,
    s_crossover=0.4,
    p_crossover=0.3,
    pso_mutation=0.2,
):
    metric = lambda c: len(
        [
            gate
            for gate in c.gates
            if hasattr(gate, "name") and gate.name in ["CNOT", "CZ"]
        ]
    )
    if mode == CompileMode.QUIL_COMPILER:
        from pyzx.pyquil_circuit import PyQuilCircuit

        compiled_circuit = PyQuilCircuit.from_circuit(
            c, architecture
        )  # TODO fix this to include other gates aswell
        compiled_circuit.compile()
    else:
        g = c.to_graph()
        g = teleport_reduce(g)
        interior_clifford_simp(g)
        g = g.copy()  # reduces the number of gates when extracting.
        if type(architecture) == type(""):
            architecture = create_architecture(architecture)

        def gauss_func(m, permutation=None, col=False):
            cn = CNOTMaker()
            if False:  # mode == ElimMode.GAUSS_MODE:
                return m.to_cnots()
            if col:
                if permutation is None:
                    permutation = list(range(m.cols()))
                m = Mat2([[row[col] for col in permutation] for row in m.data])
                rank = gauss(
                    ElimMode.STEINER_MODE,
                    m,
                    architecture,
                    full_reduce=True,
                    x=cn,
                    permutation=permutation,
                )
            else:
                m = m.copy()
                if mode in genetic_elim_modes:
                    rank = gauss(
                        mode,
                        m,
                        architecture,
                        full_reduce=True,
                        x=cn,
                        permutation=permutation,
                        row=False,
                        col=True,
                        population_size=population,
                        crossover_prob=crossover_prob,
                        mutate_prob=mutation_prob,
                        n_iterations=iterations,
                    )
                else:
                    rank = gauss(
                        mode,
                        m,
                        architecture,
                        full_reduce=True,
                        x=cn,
                        permutation=permutation,
                    )
            # print(permutation)
            # print(len(cn.cnots), cn.cnots)
            return cn.cnots

        best_permutation = [i for i in range(g.qubit_count())]
        best_solution = None
        if allow_output_perm not in [True, False]:  # mode in genetic_elim_modes:

            def fitness(permutation):
                new_g = g.copy()
                compiled_g, _ = simple_extract_no_gadgets(
                    new_g,
                    gauss_func,
                    initial_qubit_placement=permutation.tolist(),
                    allow_output_perm=allow_output_perm,
                )
                compiled_circuit = Circuit.from_graph(compiled_g)
                compiled_circuit = basic_optimization(compiled_circuit, do_swaps=False)
                return metric(compiled_circuit)

            # Build a reversed circuit to find a new initial qubit placement.
            rev_c = Circuit(g.qubit_count())
            for gate in reversed(c.gates):
                rev_c.add_gate(gate)
            rev_g = rev_c.to_graph()
            rev_g = teleport_reduce(rev_g)
            interior_clifford_simp(rev_g)
            rev_g = rev_g.copy()  # reduces the number of gates when extracting.

            def step(permutation):
                new_g = g.copy()
                compiled_g, output_perm = simple_extract_no_gadgets(
                    new_g,
                    gauss_func,
                    initial_qubit_placement=permutation.tolist(),
                    allow_output_perm=allow_output_perm,
                )
                compiled_circuit = Circuit.from_graph(compiled_g)
                compiled_circuit = basic_optimization(compiled_circuit, do_swaps=False)
                solution = (permutation.tolist(), compiled_circuit, output_perm)
                new_g = rev_g.copy()
                compiled_g, output_perm = simple_extract_no_gadgets(
                    new_g,
                    gauss_func,
                    initial_qubit_placement=output_perm,
                    allow_output_perm=allow_output_perm,
                )
                # compiled_circuit = Circuit.from_graph(compiled_g)
                # compiled_circuit = basic_optimization(compiled_circuit, do_swaps=False)
                return np.asarray(output_perm), solution, metric(compiled_circuit)

            # optimizer = GeneticAlgorithm(population, crossover_prob, mutation_prob, fitness, quiet=False)
            optimizer = ParticleSwarmOptimization(
                swarm_size=swarm_size,
                fitness_func=fitness,
                step_func=step,
                s_best_crossover=s_crossover,
                p_best_crossover=p_crossover,
                mutation=pso_mutation,
            )
            best_solution = optimizer.find_optimum(
                architecture.n_qubits, n_steps, False
            )

        if best_solution is None:
            new_g = g.copy()
            compiled_g, final_placement = simple_extract_no_gadgets(
                new_g,
                gauss_func,
                initial_qubit_placement=best_permutation,
                allow_output_perm=allow_output_perm,
            )
            compiled_circuit = Circuit.from_graph(compiled_g)
            compiled_circuit = basic_optimization(compiled_circuit, do_swaps=False)
        else:
            best_permutation, compiled_circuit, final_placement = best_solution
        print("Permutation found!", best_permutation)
        print("Done extracting!", final_placement)
        # sanity checks.
        from ..tensor import compare_tensors

        print("Initial CNOT/CZ count:", metric(c))
        if allow_output_perm:
            compiled_circuit2 = Circuit.from_graph(compiled_circuit.to_graph())
            swap_map = {i: final_placement[i] for i, q in enumerate(best_permutation)}
            for t1, t2 in permutation_as_swaps(swap_map):
                compiled_circuit2.add_gate("CNOT", control=t1, target=t2)
                compiled_circuit2.add_gate("CNOT", control=t2, target=t1)
                compiled_circuit2.add_gate("CNOT", control=t1, target=t2)
            print(
                "Extract circuit equals initial circuit? (with appended swaps)",
                compare_tensors(c, compiled_circuit2),
            )  # check extraction procedure
        else:
            print(
                "Extract circuit equals initial circuit? (without appended swaps)",
                compare_tensors(c, compiled_circuit),
            )  # check extraction procedure
        qubit_lookup = {
            i: best_permutation.index(i) for i in range(len(best_permutation))
        }
        illegal_gates = [
            gate
            for gate in compiled_circuit.gates
            if hasattr(gate, "name")
            and (gate.name == "CNOT" or gate.name == "CZ")
            and not (
                architecture.graph.connected(
                    qubit_lookup[gate.target], qubit_lookup[gate.control] # type: ignore
                )
                or architecture.graph.connected(
                    qubit_lookup[gate.control], qubit_lookup[gate.target] # type: ignore
                )
            )
        ]
        print("All CNOT/CZ gates allowed in the architecture?", len(illegal_gates) == 0)
        if illegal_gates:
            print("Which ones?", illegal_gates)

    print("Final CNOT/CZ count:", metric(compiled_circuit))

    if dest_file is not None:
        print("Saving the resulting circuit.")
        compiled_qasm = compiled_circuit.to_qasm()
        with open(dest_file, "w") as f:
            f.write(compiled_qasm)
    return compiled_circuit


def batch_route_circuits(
    source,
    modes,
    architectures,
    n_qubits=None,
    populations=30,
    iterations=15,
    crossover_probs=0.8,
    mutation_probs=0.5,
    dest_folder=None,
    metrics_file=None,
    n_compile=1,
    allow_output_perm=True,
    swarm_size=15,
    n_steps=10,
    s_crossover=0.4,
    p_crossover=0.3,
    pso_mutation=0.2,
):
    modes = make_into_list(modes)
    architectures = make_into_list(architectures)
    populations = make_into_list(populations)
    iterations = make_into_list(iterations)
    crossover_probs = make_into_list(crossover_probs)
    mutation_probs = make_into_list(mutation_probs)
    swarm_size = make_into_list(swarm_size)
    n_steps = make_into_list(n_steps)
    s_crossover = make_into_list(s_crossover)
    p_crossover = make_into_list(p_crossover)
    pso_mutation = make_into_list(pso_mutation)
    if allow_output_perm == "y":
        allow_output_perm = True
    elif allow_output_perm == "n":
        allow_output_perm = False

    if os.path.isfile(source):
        source, file = os.path.split(source)
        files = [file]
    else:
        files = [
            f for f in os.listdir(source) if os.path.isfile(os.path.join(source, f))
        ]

    if not os.path.exists(source):
        raise IOError("Folder does not exist: " + source)
    if dest_folder is None:
        dest_folder = source
    else:
        os.makedirs(dest_folder, exist_ok=True)

    arch_iter = []
    circuits = {}
    metrics = []
    for architecture in architectures:
        if architecture in dynamic_size_architectures:
            if n_qubits is None:
                raise KeyError(
                    "Number of qubits not specified for architecture" + architecture
                )
            else:
                n_qubits = make_into_list(n_qubits)
                arch_iter.extend(
                    [create_architecture(architecture, n_qubits=q) for q in n_qubits]
                )
        else:
            arch_iter.append(create_architecture(architecture))
    for architecture in arch_iter:
        circuits[architecture.name] = {}
        for mode in modes:
            if mode == CompileMode.QUIL_COMPILER:
                n_compile_list = range(n_compile)
            else:
                n_compile_list = [None]
            new_dest_folder = os.path.join(dest_folder, architecture.name, mode)
            os.makedirs(new_dest_folder, exist_ok=True)
            if mode in genetic_elim_modes:
                pop_iter = populations
                iter_iter = iterations
                crossover_iter = crossover_probs
                mutation_iter = mutation_probs
                circuits[architecture.name][mode] = {}
            else:
                if mode == CompileMode.QUIL_COMPILER:
                    circuits[architecture.name][mode] = []
                pop_iter = [None]
                iter_iter = [None]
                crossover_iter = [None]
                mutation_iter = [None]
            if allow_output_perm in [True, False]:
                swarm_size = [None]
                n_steps = [None]
                p_crossover = [None]
                s_crossover = [None]
                pso_mutation = [None]
            for population in pop_iter:
                for iteration in iter_iter:
                    for crossover_prob in crossover_iter:
                        for mutation_prob in mutation_iter:
                            for swarm in swarm_size:
                                for steps in n_steps:
                                    for pco in p_crossover:
                                        for sco in s_crossover:
                                            for pso_m in pso_mutation:
                                                for file in files:
                                                    origin_file = os.path.join(
                                                        source, file
                                                    )
                                                    original_circuit = read_circuit(
                                                        origin_file
                                                    )
                                                    if original_circuit:
                                                        for i in n_compile_list:
                                                            dest_filename = (
                                                                create_dest_filename(
                                                                    origin_file,
                                                                    "match",
                                                                    population,
                                                                    iteration,
                                                                    crossover_prob,
                                                                    mutation_prob,
                                                                    i,
                                                                    swarm,
                                                                    steps,
                                                                    sco,
                                                                    pco,
                                                                    pso_m,
                                                                )
                                                            )
                                                            dest_file = os.path.join(
                                                                dest_folder,
                                                                architecture.name,
                                                                mode,
                                                                dest_filename,
                                                            )
                                                            original_circuit = (
                                                                read_circuit(
                                                                    origin_file
                                                                )
                                                            )
                                                            try:
                                                                start_time = time.time()
                                                                circuit = route_circuit(
                                                                    original_circuit,
                                                                    architecture,
                                                                    mode=mode,
                                                                    dest_file=dest_file,
                                                                    population=population,
                                                                    iterations=iteration,
                                                                    crossover_prob=crossover_prob,
                                                                    mutation_prob=mutation_prob,
                                                                    allow_output_perm=allow_output_perm,
                                                                    swarm_size=swarm,
                                                                    n_steps=steps,
                                                                    s_crossover=sco,
                                                                    p_crossover=pco,
                                                                    pso_mutation=pso_m,
                                                                )
                                                                end_time = time.time()
                                                                if (
                                                                    metrics_file
                                                                    is not None
                                                                ):
                                                                    metrics.append(
                                                                        make_metrics(
                                                                            circuit,
                                                                            origin_file,
                                                                            architecture.name,
                                                                            mode,
                                                                            dest_file,
                                                                            population,
                                                                            iteration,
                                                                            crossover_prob,
                                                                            mutation_prob,
                                                                            end_time
                                                                            - start_time,
                                                                            i,
                                                                        )
                                                                    )
                                                                if (
                                                                    mode
                                                                    in genetic_elim_modes
                                                                ):
                                                                    circuits[
                                                                        architecture.name
                                                                    ][mode][
                                                                        (
                                                                            population,
                                                                            iteration,
                                                                            crossover_prob,
                                                                            mutation_prob,
                                                                        )
                                                                    ] = circuit
                                                                elif (
                                                                    mode
                                                                    == CompileMode.QUIL_COMPILER
                                                                ):
                                                                    circuits[
                                                                        architecture.name
                                                                    ][mode].append(
                                                                        circuit
                                                                    )
                                                                else:
                                                                    circuits[
                                                                        architecture.name
                                                                    ][mode] = circuit
                                                            except KeyError as e:  # Should only happen with quilc
                                                                if (
                                                                    mode
                                                                    == CompileMode.QUIL_COMPILER
                                                                ):
                                                                    print(
                                                                        "\033[31mCould not compile",
                                                                        origin_file,
                                                                        "into",
                                                                        dest_file,
                                                                        end="\033[0m\n",
                                                                    )
                                                                else:
                                                                    raise e

    if len(metrics) > 0 and DataFrame != None:
        df = DataFrame(metrics)
        if os.path.exists(metrics_file):  # append to the file - do not overwrite!
            df.to_csv(
                metrics_file,
                columns=get_metric_header(),
                header=False,
                index=False,
                mode="a",
            )
        else:
            df.to_csv(metrics_file, columns=get_metric_header(), index=False)
    return circuits

def count_cnots_circuit(mode, circuit, n_compile=1, store_circuit_as=None):
    count = -1
    if mode == CompileMode.QUIL_COMPILER:
        from pyzx.pyquil_circuit import PyQuilCircuit

        if isinstance(circuit, PyQuilCircuit):
            count = (
                sum([circuit.compiled_cnot_count() for i in range(n_compile)])
                / n_compile
            )
    elif mode == CompileMode.NO_COMPILER:
        count = circuit.count_cnots()
    if store_circuit_as is not None:
        with open(store_circuit_as, "w") as f:
            f.write(circuit.to_qasm())
    return count


def get_metric_header():
    metrics = CNOT_tracker.get_metric_names()
    return (
        [
            "id",
            "architecture",
            "mode",
            "index",
            "population",
            "n_iterations",
            "crossover",
            "mutation",
        ]
        + metrics
        + ["time", "destination_file"]
    )


def make_metrics(
    circuit,
    id,
    architecture_name,
    mode,
    dest_file=None,
    population=None,
    iteration=None,
    crossover_prob=None,
    mutation_prob=None,
    passed_time=None,
    index=None,
):
    result = circuit.gather_metrics()
    result["id"] = id
    result["mode"] = mode
    result["architecture"] = architecture_name
    result["population"] = population
    result["n_iterations"] = iteration
    result["crossover"] = crossover_prob
    result["mutation"] = mutation_prob
    result["time"] = passed_time
    result["index"] = index
    result["destination_file"] = dest_file
    return result


def batch_map_cnot_circuits(
    source,
    modes,
    architectures,
    n_qubits=None,
    populations: Union[int, List[int]] = 30,
    iterations=15,
    crossover_probs=0.8,
    mutation_probs=0.5,
    dest_folder=None,
    metrics_file=None,
    n_compile=1,
) -> Dict[Architecture, Dict[ElimMode, Any]]:
    modes = make_into_list(modes)
    architectures = make_into_list(architectures)
    populations = make_into_list(populations)
    iterations = make_into_list(iterations)
    crossover_probs = make_into_list(crossover_probs)
    mutation_probs = make_into_list(mutation_probs)

    if os.path.isfile(source):
        source, file = os.path.split(source)
        files = [file]
    else:
        files = [
            f for f in os.listdir(source) if os.path.isfile(os.path.join(source, f))
        ]

    if not os.path.exists(source):
        raise IOError("Folder does not exist: " + source)
    if dest_folder is None:
        dest_folder = source
    else:
        os.makedirs(dest_folder, exist_ok=True)

    arch_iter = []
    circuits: Dict[Architecture, Dict[ElimMode, Any]] = {}
    metrics = []
    for architecture in architectures:
        if architecture in dynamic_size_architectures:
            if n_qubits is None:
                raise KeyError(
                    "Number of qubits not specified for architecture" + architecture
                )
            else:
                n_qubits = make_into_list(n_qubits)
                arch_iter.extend(
                    [create_architecture(architecture, n_qubits=q) for q in n_qubits]
                )
        else:
            arch_iter.append(create_architecture(architecture))
    for architecture in arch_iter:
        circuits[architecture.name] = {}
        for mode in modes:
            n_compile_list: Iterable[int]
            if mode == CompileMode.QUIL_COMPILER:
                n_compile_list = range(n_compile)
            else:
                n_compile_list = [0]
            new_dest_folder = os.path.join(dest_folder, architecture.name, mode)
            os.makedirs(new_dest_folder, exist_ok=True)
            if mode in genetic_elim_modes:
                pop_iter = populations
                iter_iter = iterations
                crossover_iter = crossover_probs
                mutation_iter = mutation_probs
                circuits[architecture.name][mode] = {}
            else:
                if mode == CompileMode.QUIL_COMPILER:
                    circuits[architecture.name][mode] = []
                pop_iter = [0]
                iter_iter = [0]
                crossover_iter = [0]
                mutation_iter = [0]

            for population in pop_iter:
                for iteration in iter_iter:
                    for crossover_prob in crossover_iter:
                        for mutation_prob in mutation_iter:
                            for file in files:
                                if os.path.splitext(file)[1].lower() == ".qasm":
                                    origin_file = os.path.join(source, file)
                                    for i in n_compile_list:
                                        dest_filename = create_dest_filename(
                                            origin_file,
                                            population,
                                            iteration,
                                            crossover_prob,
                                            mutation_prob,
                                            i,
                                        )
                                        dest_file = os.path.join(
                                            dest_folder,
                                            architecture.name,
                                            mode,
                                            dest_filename,
                                        )
                                        try:
                                            start_time = time.time()
                                            circuit = map_cnot_circuit(
                                                origin_file,
                                                architecture,
                                                mode=mode,
                                                dest_file=dest_file,
                                                population=population,
                                                iterations=iteration,
                                                crossover_prob=crossover_prob,
                                                mutation_prob=mutation_prob,
                                            )
                                            end_time = time.time()
                                            if metrics_file is not None:
                                                metrics.append(
                                                    make_metrics(
                                                        circuit,
                                                        origin_file,
                                                        architecture.name,
                                                        mode,
                                                        dest_file,
                                                        population,
                                                        iteration,
                                                        crossover_prob,
                                                        mutation_prob,
                                                        end_time - start_time,
                                                        i,
                                                    )
                                                )
                                            if mode in genetic_elim_modes:
                                                circuits[architecture.name][mode][
                                                    (
                                                        population,
                                                        iteration,
                                                        crossover_prob,
                                                        mutation_prob,
                                                    )
                                                ] = circuit
                                            elif mode == CompileMode.QUIL_COMPILER:
                                                circuits[architecture.name][
                                                    mode
                                                ].append(circuit)
                                            else:
                                                circuits[architecture.name][
                                                    mode
                                                ] = circuit
                                        except KeyError as e:  # Should only happen with quilc
                                            if mode == CompileMode.QUIL_COMPILER:
                                                print(
                                                    "\033[31mCould not compile",
                                                    origin_file,
                                                    "into",
                                                    dest_file,
                                                    end="\033[0m\n",
                                                )
                                            else:
                                                raise e

    if metrics_file is not None and len(metrics) > 0 and DataFrame is not None:
        df = DataFrame(metrics)
        print("Average gate count:", df["n_cnots"].mean())
        print("Average gate depth:", df["depth"].mean())
        if os.path.exists(metrics_file):  # append to the file - do not overwrite!
            df.to_csv(
                metrics_file,
                columns=get_metric_header(),
                header=False,
                index=False,
                mode="a",
            )
        else:
            df.to_csv(metrics_file, columns=get_metric_header(), index=False)
    return circuits


def map_cnot_circuit(
    file,
    architecture,
    mode=ElimMode.GENETIC_STEINER_MODE,
    dest_file=None,
    population=30,
    iterations=15,
    crossover_prob=0.8,
    mutation_prob=0.2,
    **kwargs,
):
    if type(architecture) == type(""):
        architecture = create_architecture(architecture)
    circuit = CNOT_tracker.from_qasm_file(file)
    matrix = circuit.matrix
    compiled_circuit = CNOT_tracker(circuit.n_qubits)
    if mode in basic_elim_modes:
        rank = gauss(
            mode, matrix, architecture, full_reduce=True, y=compiled_circuit, **kwargs
        )
    elif mode in genetic_elim_modes:
        rank = gauss(
            mode,
            matrix,
            architecture,
            full_reduce=True,
            y=compiled_circuit,
            population_size=population,
            crossover_prob=crossover_prob,
            mutate_prob=mutation_prob,
            n_iterations=iterations,
            **kwargs,
        )
    elif mode == CompileMode.QUIL_COMPILER:
        from pyzx.pyquil_circuit import PyQuilCircuit

        compiled_circuit = PyQuilCircuit.from_CNOT_tracker(circuit, architecture)
        compiled_circuit.compile()

    if dest_file is not None:
        compiled_qasm = compiled_circuit.to_qasm()
        with open(dest_file, "w") as f:
            f.write(compiled_qasm)
    return compiled_circuit


def sequential_map_cnot_circuits(
    source: os.PathLike,
    modes: Union[ElimMode, List[ElimMode]],
    architectures: Union[Architecture, List[Architecture]],
    n_qubits: Union[int, List[int], None] = None,
    populations=30,
    iterations=15,
    crossover_probs=0.8,
    mutation_probs=0.5,
    dest_folder=None,
    metrics_file=None,
    n_compile=1,
) -> Dict[str, Dict[ElimMode, Any]]:
    modes = make_into_list(modes)
    architectures = make_into_list(architectures)
    populations = make_into_list(populations)
    iterations = make_into_list(iterations)
    crossover_probs = make_into_list(crossover_probs)
    mutation_probs = make_into_list(mutation_probs)

    if os.path.isfile(source):
        source, file = os.path.split(source)
        files = [file]
    else:
        files = [
            f for f in os.listdir(source) if os.path.isfile(os.path.join(source, f))
        ]

    if not os.path.exists(source):
        raise IOError(f"Folder does not exist: {source}")
    if dest_folder is None:
        dest_folder = source
    else:
        os.makedirs(dest_folder, exist_ok=True)

    arch_iter = []
    circuits: Dict[str, Dict[ElimMode, Any]] = {}
    for architecture in architectures:
        if architecture in dynamic_size_architectures:
            if n_qubits is None:
                raise KeyError(
                    f"Number of qubits not specified for architecture {architecture}"
                )
            else:
                n_qubits = make_into_list(n_qubits)
                arch_iter.extend(
                    [create_architecture(architecture, n_qubits=q) for q in n_qubits]
                )
        else:
            arch_iter.append(create_architecture(architecture))
    for architecture in arch_iter:
        circuits[architecture.name] = {}
        for mode in modes:
            n_compile_list: Iterable[int]
            if mode == CompileMode.QUIL_COMPILER:
                n_compile_list = range(n_compile)
            else:
                n_compile_list = [0]
            new_dest_folder = os.path.join(dest_folder, architecture.name, str(mode))
            os.makedirs(new_dest_folder, exist_ok=True)
            if mode in genetic_elim_modes or mode in pso_elim_modes:
                pop_iter = populations
                iter_iter = iterations
                crossover_iter = crossover_probs
                mutation_iter = mutation_probs
                circuits[architecture.name][mode] = {}
            else:
                if mode == CompileMode.QUIL_COMPILER:
                    circuits[architecture.name][mode] = []
                pop_iter = [None]
                iter_iter = [None]
                crossover_iter = [None]
                mutation_iter = [None]

            for population in pop_iter:
                for iteration in iter_iter:
                    for crossover_prob in crossover_iter:
                        for mutation_prob in mutation_iter:
                            matrices = []
                            origin_file = None
                            for file in files:
                                if os.path.splitext(file)[1].lower() == ".qasm":
                                    origin_file = os.path.join(source, file)
                                    matrices.append(
                                        CNOT_tracker.from_qasm_file(origin_file).matrix
                                    )
                            for i in n_compile_list:
                                # dest_filename = create_dest_filename(origin_file, population, iteration, crossover_prob, mutation_prob, i)
                                # dest_file = os.path.join(dest_folder, architecture.name, mode, dest_filename)
                                try:
                                    print("Sequence length", len(matrices))
                                    start_time = time.time()
                                    circuits, permutations, score = sequential_gauss(
                                        matrices,
                                        architecture=architecture,
                                        mode=mode,
                                        population_size=population,
                                        n_iterations=iteration,
                                        crossover_prob=crossover_prob,
                                        mutate_prob=mutation_prob,
                                    ) # type: ignore
                                    end_time = time.time()
                                    print("score:", score)
                                    print("time (s):", end_time - start_time)
                                except KeyError as e:  # Should only happen with quilc
                                    if mode == CompileMode.QUIL_COMPILER:
                                        print(
                                            "\033[31mCould not compile",
                                            origin_file,
                                            end="\033[0m\n",
                                        )
                                    else:
                                        raise e

    return circuits

def main(args):
    parser = argparse.ArgumentParser(prog="pyzx router", description=description)
    parser.add_argument("QASM_source",nargs="+",help="The QASM file or folder with QASM files to be routed.")
    parser.add_argument("-m","--mode",nargs="+",dest="mode",default=ElimMode.STEINER_MODE,help="The mode specifying how to route. choose 'all' for using all modes.",choices=elim_modes + [CompileMode.QUIL_COMPILER, "all"])
    parser.add_argument("-a","--architecture",nargs="+",dest="architecture",default=SQUARE,choices=architectures,help="Which architecture it should run compile to.")
    parser.add_argument("-q","--qubits",nargs="+",default=None,type=int,help="The number of qubits for the architecture.")
    parser.add_argument("--output_perm",default="y",choices=["y", "n", "pso"],help="Whether the location of the output qubits can be different for the input location. Qubit locations can be optimized with pso.")
    # parser.add_argument("-f", "--full_reduce", dest="full_reduce", default=1, type=int, choices=[0,1], help="Full reduce")
    parser.add_argument("--population",nargs="+",default=30,type=int,help="The population size for the genetic algorithm.")
    parser.add_argument("--iterations",nargs="+",default=15,type=int,help="The number of iterations for the genetic algorithm.")
    parser.add_argument("--crossover_prob",nargs="+",default=0.8,type=restricted_float,help="The crossover probability for the genetic algorithm. Must be between 0.0 and 1.0.")
    parser.add_argument("--mutation_prob",nargs="+",default=0.2,type=restricted_float,help="The mutation probability for the genetic algorithm. Must be between 0.0 and 1.0.")
    # PSO args
    parser.add_argument("--swarm_size",nargs="+",default=15,type=int,help="The swarm size for the particle swarm optimizer.")
    parser.add_argument("--steps",nargs="+",default=10,type=int,help="The number of steps/iterations for the particle swarm optimizer.")
    parser.add_argument("--sco",nargs="+",default=0.4,type=restricted_float,help="The crossover percentage with the best particle in the swarm for the particle swarm optimizer. Must be between 0.0 and 1.0.")
    parser.add_argument("--pco",nargs="+",default=0.3,type=restricted_float,help="The crossover percentage with the personal best of a particle for the particle swarm optimizer. Must be between 0.0 and 1.0.")
    parser.add_argument("--mutation_perc",nargs="+",default=0.2,type=restricted_float,help="The mutation percentage of a particle for the particle swarm optimizer. Must be between 0.0 and 1.0.")
    # parser.add_argument("--perm", default="both", choices=["row", "col", "both"], help="Whether to find a single optimal permutation that permutes the rows, columns or both with the genetic algorithm.")
    parser.add_argument("--destination",help="Destination file or folder where the compiled circuit should be stored. Otherwise the source folder is used.")
    parser.add_argument("--metrics_csv",default=None,help="The location to store compiling metrics as csv, if not given, the metrics are not calculated. Only used when the source is a folder")
    parser.add_argument("--n_compile",default=1,type=int,help="How often to run the Quilc compiler, since it is not deterministic.")
    parser.add_argument("--subfolder", default=None,type=str,nargs="+",help="Possible subfolders from the main QASM source to compile from. Less typing when source folders are in the same folder. Can also be used for subfiles.")

    # args = parser.parse_args(args)
    args, unknown = parser.parse_known_args(args)
    if args.metrics_csv is not None and os.path.exists(args.metrics_csv):
        delete_csv = None
        text = input(
            "The given metrics file [%s] already exists. Do you want to overwrite it? (Otherwise it is appended) [y|n]"
            % args.metrics_csv
        )
        if text.lower() in ["y", "yes"]:
            delete_csv = True
        elif text.lower() in ["n", "no"]:
            delete_csv = False
        while delete_csv is None:
            text = input("Please answer yes or no.")
            if text.lower() in ["y", "yes"]:
                delete_csv = True
            elif text.lower() in ["n", "no"]:
                delete_csv = False
        if delete_csv:
            os.remove(args.metrics_csv)

    sources = make_into_list(args.QASM_source)
    if args.subfolder is not None:
        sources = [
            os.path.join(source, subfolder)
            for source in sources
            for subfolder in args.subfolder
            if os.path.isdir(source)
        ]
        # Remove non existing paths

    sources = [
        source
        for source in sources
        if os.path.exists(source)
        or print("Warning, skipping non-existing source:", source)
    ]
    sources = [s for s in sources if not s.endswith("py")]
    # print(sources)
    if "all" in args.mode:
        mode = elim_modes + [CompileMode.QUIL_COMPILER]
    else:
        mode = args.mode

    all_circuits = []
    for source in sources:
        print("Mapping qasm files in path:", source)
        circuits = batch_route_circuits(
            source,
            mode,
            args.architecture,
            n_qubits=args.qubits,
            populations=args.population,
            iterations=args.iterations,
            crossover_probs=args.crossover_prob,
            mutation_probs=args.mutation_prob,
            dest_folder=args.destination,
            metrics_file=args.metrics_csv,
            n_compile=args.n_compile,
            allow_output_perm=args.output_perm,
            swarm_size=args.swarm_size,
            n_steps=args.steps,
            s_crossover=args.sco,
            p_crossover=args.pco,
            pso_mutation=args.mutation_perc,
        )
        all_circuits.extend(circuits)


if __name__ == "__main__":
    print("Please call this as python -m pyzx router ...")
