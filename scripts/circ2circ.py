import os
import sys
sys.path.append('.')
import pyzx as zx

import argparse
parser = argparse.ArgumentParser(description="End-to-end circuit optimizer")
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

def main(options):
    if not os.path.exists(options.source):
        print("File {} does not exist".format(options.source))
        return
    ctype = zx.circuit.determine_file_type(options.source)
    if options.outformat == 'match':
        dtype = ctype
    elif options.outformat not in ('qasm', 'qc', 'quipper'):
        print("Unsupported circuit type {}. Please use qasm, qc or quipper".format(options.outformat))
        return
    else:
        dtype = options.outformat
    if not options.dest:
        base = os.path.splitext(options)[0]
        dest = base + "." + dtype
    else:
        dest = options.dest

    c = zx.Circuit.load(options.source)
    if options.verbose:
        print("Starting circuit:")
        print(c.stats())
    g = c.to_graph()
    if options.verbose: print("Running simplification algorithm...")
    if options.simp == 'tele':
        g = zx.simplify.teleport_reduce(g,quiet=(not options.verbose))
        c2 = zx.Circuit.from_graph(g)
        c2 = c2.split_phase_gates()
    else:
        if options.simp == 'full':
            zx.simplify.full_reduce(g,quiet=(not options.verbose))
        if options.simp == 'cliff':
            zx.simplify.cliff_simp(g,quiet=(not options.verbose))
        if options.verbose: print("Extracting circuit...")
        c2 = zx.extract.streaming_extract(g)
    if options.verbose: print("Optimizing...")
    if options.phasepoly:
        c3 = zx.optimize.full_optimize(c2.to_basic_gates())
    else:
        c3 = zx.optimize.basic_optimization(c2.to_basic_gates())
    c3 = c3.to_basic_gates()
    c3 = c3.split_phase_gates()
    if options.verbose: print(c3.stats())
    print("Writing output to {}".format(dest))
    if dtype == 'qc': output = c3.to_qc()
    if dtype == 'qasm': output = c3.to_qasm()
    if dtype == 'quipper': output = c3.to_quipper()
    f = open(dest, 'w')
    f.write(output)
    f.close()

if __name__ == '__main__':
    options = parser.parse_args()
    main(options)