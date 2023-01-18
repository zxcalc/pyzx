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


usage_string = """python -m pyzx command [args]
Run one of the scripts supplied with PyZX.

The options for command are:
    opt       -- Optimize a circuit using PyZX
    tikz      -- Convert a circuit into a Tikz file
    router    -- Map any circuit onto restricted architectures
    cnots     -- Generate random CNOT circuits 

For help on the arguments for these commands run for instance 'python -m pyzx opt --help'
"""

import argparse
from . import circ2circ
from . import circ2tikz
from . import circuit_router
from . import cnot_generator
   
def main(argv):
    parser = argparse.ArgumentParser(prog="PyZX", description="PyZX commandline interface",
                                     usage=usage_string)
    parser.add_argument('command', help='Command to run')
    if len(argv) == 1:
        parser.print_help()
        exit(1)
    args = parser.parse_args(argv[1:2])
    if args.command not in ('opt', 'tikz', 'router', 'cnots'):
        print("Unrecognized command '{}'".format(args.command))
        parser.print_help()
        exit(1)

    if args.command == 'opt':
        circ2circ.main(argv[2:])
    if args.command == 'tikz':
        circ2tikz.main(argv[2:])
    if args.command == 'router':
        circuit_router.main(argv[2:])
    if args.command == 'cnots':
        cnot_generator.main(argv[2:])