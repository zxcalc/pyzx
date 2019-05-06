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

usage_string = """python -m pyzx command [args]
Run one of the scripts supplied with PyZX.

The options for command are:
    opt    -- Optimise a circuit using PyZX
    tikz   -- Convert a circuit into a Tikz file
    mapper -- Map CNOT circuits onto restricted architectures

For help on the arguments for these commands run for instance 'python -m pyzx opt --help'
"""

if __name__ == '__main__':
    import sys
    import argparse
    try:
        from .scripts import circ2circ
        from .scripts import circ2tikz
        from .scripts import cnot_mapper
        from .scripts import circuit_router
    except SystemError:
        print("Please run as a module by using 'python -m pyzx'")
        exit(1)
    
    parser = argparse.ArgumentParser(prog="PyZX", description="PyZX commandline interface",
                                     usage=usage_string)
    parser.add_argument('command', help='Command to run')
    if len(sys.argv) == 1:
        parser.print_help()
        exit(1)
    args = parser.parse_args(sys.argv[1:2])
    if args.command not in ('opt', 'tikz', 'mapper', 'router'):
        print("Unrecognized command '{}'".format(args.command))
        parser.print_help()
        exit(1)

    if args.command == 'opt':
        circ2circ.main(sys.argv[2:])
    if args.command == 'tikz':
        circ2tikz.main(sys.argv[2:])
    if args.command == 'mapper':
        cnot_mapper.main(sys.argv[2:])
    if args.command == 'router':
        circuit_router.main(sys.argv[2:])

