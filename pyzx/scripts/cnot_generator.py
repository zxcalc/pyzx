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
import argparse
import os
from ..utils import make_into_list
from ..parity_maps import build_random_parity_map, CNOT_tracker

description = "Generates random CNOT circuits and stores them as QASM files."

if __name__ == '__main__':
    print("Please call this as python -m pyzx cnots ...")
    exit()

parser = argparse.ArgumentParser(description=description)
parser.add_argument("folder", help="The QASM file or folder with QASM files to be routed.")
parser.add_argument("-q", "--n_qubits", nargs='+', default=9, type=int, help="The number of qubits participating in the circuit.")
parser.add_argument("-m", "--n_maps", default=1, type=int, help="The number of circuits to be generated.")
parser.add_argument("-d", "--n_cnots", nargs='+', default=None, type=int, help="The number of CNOTs in the generated circuit.")

def main(args):
    args = parser.parse_args()
    if args.n_cnots is None:
        parser.error(message="Please specify the number of CNOT gates to be generated with the -d flag.")
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