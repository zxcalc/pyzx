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
from ..routing.parity_maps import CNOT_tracker
from ..generate import build_random_parity_map

description = "Generates random CNOT circuits and stores them as QASM files."

if __name__ == "__main__":
    print("Please call this as python -m pyzx cnots ...")
    exit()

parser = argparse.ArgumentParser(description=description)
parser.add_argument(
    "folder", help="The QASM file or folder with QASM files to be routed."
)
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
parser.add_argument(
    "-d",
    "--n_cnots",
    nargs="+",
    default=None,
    type=int,
    help="The number of CNOTs in the generated circuit.",
)


def main(args):
    args = parser.parse_args()
    if args.n_cnots is None:
        parser.error(
            message="Please specify the number of CNOT gates to be generated with the -d flag."
        )
    folder = args.folder
    os.makedirs(folder, exist_ok=True)

    n_qubits = make_into_list(args.n_qubits)
    n_maps = args.n_maps
    n_cnots = make_into_list(args.n_cnots)

    for q in n_qubits:
        for n in n_cnots:
            dest_folder = os.path.join(folder, str(q) + "qubits", str(n))
            os.makedirs(dest_folder, exist_ok=True)
            for i in range(n_maps):
                filename = "Original" + str(i) + ".qasm"
                dest_file = os.path.join(dest_folder, filename)
                circuit = CNOT_tracker(q)
                build_random_parity_map(q, n, circuit)
                with open(dest_file, "w") as f:
                    f.write(circuit.to_qasm())
