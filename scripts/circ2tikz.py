import os
import sys
sys.path.append('.')
import pyzx as zx

def to_tikz(source, target):
    circ = zx.Circuit.load(source)
    print("Converting circuit with {:d} gates to TikZ".format(len(circ.gates)))
    g = circ.to_graph()
    zx.simplify.id_simp(g,quiet=True)
    tikz = zx.drawing.to_tikz(g)
    print("Output file: ", os.path.abspath(target))
    f = open(target, 'w')
    f.write(tikz)
    f.close()

helpstring = """usage: circ2tikz source [dest]
Script for converting circuits into tikz files.
Arguments:
source:      File containing circuit
dest:        Desired output location for TikZ file

The default value for dest is to put a .tikz file of the same name in the folder of source.
"""

if __name__ == '__main__':
    arguments = sys.argv[1:]
    if not arguments:
        print(helpstring)
    elif len(arguments) == 1:
        source = arguments[0]
        if not os.path.exists(source):
            print("File '{}' does not exist".format(source))
        else:
            basename = os.path.splitext(source)[0]
            target = basename+".tikz"
            to_tikz(source, target)
    else:
        source = arguments[0]
        target = arguments[1]
        to_tikz(source, target)