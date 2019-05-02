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

