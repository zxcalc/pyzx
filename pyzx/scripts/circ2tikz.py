# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
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

from ..circuit import Circuit
from ..simplify import id_simp
from .. import tikz

def to_tikz(source, target):
    circ = Circuit.load(source)
    print("Converting circuit with {:d} gates to TikZ".format(len(circ.gates)))
    g = circ.to_graph()
    id_simp(g,quiet=True)
    tikz_output = tikz.to_tikz(g)
    print("Output file: ", os.path.abspath(target))
    f = open(target, 'w')
    f.write(tikz_output)
    f.close()

helpstring = """usage: pyzx tikz source [dest]

Script for converting circuits into tikz files.

positional arguments:
   source       File containing circuit
   dest         Desired output location for TikZ file

The default value for dest is to put a .tikz file of the same name in the folder of source.
"""

def main(args):
    if not args:
        print(helpstring)
    elif len(args) == 1:
        source = args[0]
        if not os.path.exists(source):
            print("File '{}' does not exist".format(source))
        else:
            basename = os.path.splitext(source)[0]
            target = basename+".tikz"
            to_tikz(source, target)
    else:
        source = args[0]
        target = args[1]
        to_tikz(source, target)

