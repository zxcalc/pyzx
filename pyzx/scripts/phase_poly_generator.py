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

import argparse
import os
from ..utils import make_into_list
from .. import generate

description = (
    "Generates random phase polynomial circuits and stores them as QASM files."
)

if __name__ == "__main__":
    print("Please call this as python -m pyzx phasepoly ...")
    exit()

parser = argparse.ArgumentParser(description=description)
parser.add_argument("folder", help="The folder where the QASM files should be stored.")
parser.add_argument(
    "-q",
    "--n_qubits",
    nargs="+",
    default=9,
    type=int,
    help="The number of qubits participating in the circuit.",
)
parser.add_argument(
    "-m",
    "--n_maps",
    default=1,
    type=int,
    help="The number of circuits to be generated.",
)


def main(args):
    parser.add_argument(
        "-p",
        "--n_phase_gadgets",
        nargs="+",
        default=1,
        type=int,
        help="The number of phase gadgets to be generated in the circuit.",
    )
    args = parser.parse_args(args)
    folder = args.folder
    os.makedirs(folder, exist_ok=True)

    n_qubits = make_into_list(args.n_qubits)
    n_maps = args.n_maps
    n_gadgets = make_into_list(args.n_phase_gadgets)

    for q in n_qubits:
        for p in n_gadgets:
            dest_folder = os.path.join(folder, str(q) + "qubits", str(p) + "gadgets")
            os.makedirs(dest_folder, exist_ok=True)
            for i in range(n_maps):
                filename = "Original" + str(i) + ".qasm"
                dest_file = os.path.join(dest_folder, filename)
                circuit = generate.phase_poly_from_gadgets(q, p)
                with open(dest_file, "w") as f:
                    f.write(circuit.to_qasm())


def main_old(args):
    parser.add_argument(
        "-d",
        "--n_cnots",
        nargs="+",
        default=1,
        type=int,
        help="The number of CNOTs per layer in the generated circuit.",
    )
    parser.add_argument(
        "-p",
        "--n_phase_layers",
        nargs="+",
        default=1,
        type=int,
        help="The number of phase layers in the generated circuit.",
    )
    args = parser.parse_args(args)
    if args.n_cnots is None:
        parser.error(
            message="Please specify the number of CNOT gates to be generated with the -d flag."
        )
    folder = args.folder
    os.makedirs(folder, exist_ok=True)

    n_qubits = make_into_list(args.n_qubits)
    n_maps = args.n_maps
    n_cnots = make_into_list(args.n_cnots)
    n_phase_layers = make_into_list(args.n_phase_layers)

    for q in n_qubits:
        for p in n_phase_layers:
            for n in n_cnots:
                dest_folder = os.path.join(
                    folder, str(q) + "qubits", str(p) + "layers" + str(n) + "cnots"
                )
                os.makedirs(dest_folder, exist_ok=True)
                for i in range(n_maps):
                    filename = "Original" + str(i) + ".qasm"
                    dest_file = os.path.join(dest_folder, filename)
                    circuit = generate.phase_poly(q, p, n)
                    with open(dest_file, "w") as f:
                        f.write(circuit.to_qasm())
