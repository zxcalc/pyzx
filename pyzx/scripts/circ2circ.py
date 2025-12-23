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


import os
import sys

from ..circuit import Circuit, determine_file_type
from .. import simplify
from .. import extract
from .. import optimize

description="""End-to-end circuit optimizer

For simple optimisation of a circuit run as
    python -m pyzx opt circuit.extension

This puts an optimised version of the circuit in the same directory and of the same file type.

If we want to specify the output location and type we can run
    python -m pyzx opt -d outputfile.qc -t qc inputfile.qasm
"""

import argparse
parser = argparse.ArgumentParser(prog="pyzx opt", description=description, formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('source',type=str,help='source circuit')
parser.add_argument('-d',type=str,help='destination for output file', dest='dest',default='')
parser.add_argument('-t',type=str,default='match', dest='outformat',
    help='Specify the output format (qasm, qc, quipper). By default matches the input')
parser.add_argument('-v',default=False, action='store_true', dest='verbose',
    help='Output verbose information')
parser.add_argument('-g',type=str,default='full', dest='simp', 
    help='ZX-simplifier to use. Options are full (default), cliff, or tele')
parser.add_argument('-p',default=False, action='store_true', dest='phasepoly',
    help='Whether to also run the phase-polynomial optimizer (default is false)')

def main(args):
    options = parser.parse_args(args)
    if not os.path.exists(options.source):
        print("File {} does not exist".format(options.source))
        return
    ctype = determine_file_type(options.source)
    if options.outformat == 'match':
        dtype = ctype
    elif options.outformat not in ('qasm', 'qc', 'quipper'):
        print("Unsupported circuit type {}. Please use qasm, qc or quipper".format(options.outformat))
        return
    else:
        dtype = options.outformat
    if not options.dest:
        base = os.path.splitext(options.source)[0]
        dest = base + "." + dtype
    else:
        dest = options.dest

    c = Circuit.load(options.source)
    if options.verbose:
        print("Starting circuit:")
        print(c.to_basic_gates().stats())
    g = c.to_graph()
    if options.verbose: print("Running simplification algorithm...")
    if options.simp == 'tele':
        g = simplify.teleport_reduce(g)
        c2 = Circuit.from_graph(g)
        c2 = c2.split_phase_gates()
    else:
        if options.simp == 'full':
            simplify.full_reduce(g)
        if options.simp == 'cliff':
            simplify.clifford_simp(g)
        if options.verbose: print("Extracting circuit...")
        c2 = extract.extract_circuit(g)
    if options.verbose: print("Optimizing...")
    if options.phasepoly:
        c3 = optimize.full_optimize(c2.to_basic_gates())
    else:
        c3 = optimize.basic_optimization(c2.to_basic_gates())
    c3 = c3.to_basic_gates()
    c3 = c3.split_phase_gates()
    if options.verbose: print(c3.stats())
    print("Writing output to {}".format(os.path.abspath(dest)))
    if dtype == 'qc': output = c3.to_qc()
    if dtype == 'qasm': output = c3.to_qasm()
    if dtype == 'quipper': output = c3.to_quipper()
    f = open(dest, 'w')
    f.write(output)
    f.close()
