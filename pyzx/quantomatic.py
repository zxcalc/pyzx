"""Implements methods for interacting with Quantomatic.

Example scripts for Quantomatic::
    
    #This script generates a random clifford circuit in Quantomatic
    from quanto.util.Scripting import *
    from pyzx.io import graph_to_json
    from pyzx.generate import cliffords
    g = cliffords(3,15,keynames=('y','x'))
    j = graph_to_json(g)
    new_graph_from_json(j)

    #This script registers the PyZX clifford_simp simplifier as a simproc in Quantomatic
    from quanto.util.Scripting import *
    import pyzx.quantomatic as zx
    zx.output = output
    zx.register_python_simproc("clifford",zx.simplify.clifford_iter)

"""

import json
from fractions import Fraction

from .graph.graph import Graph
from .io import json_to_graph, graph_to_json
from . import simplify
from . import rules

try:
    import quanto.util.Scripting as quanto
except ImportError:
    print("Not running in Quantomatic")


class RewriteMaker(object):
    """Helper class for generating SimProcs that interact nicely between 
    Quantomatic and PyZX"""
    def __init__(self,rewriter):
        self.rewriter = rewriter
        self.steps = []
        self.names = []

    def start(self, js):
        self.steps = []
        self.names = []
        g = json_to_graph(js)
        for s,n in self.rewriter(g):
            self.steps.append(graph_to_json(s))
            self.names.append(n)

        return len(self.steps)

    def get_step(self, index):
        return self.steps[index]

    def get_name(self, index):
        return self.names[index]



def register_python_simproc(name, rewriter):
    """When called by Quantomatic, registers a Simproc implementing a PyZX
    simplification strategy

    :param str name: Name that the resulting simproc will have
    :param rewriter: Should be a method from :class:`~pyzx.simplify`
    """
    maker = RewriteMaker(rewriter)
    simproc = quanto.JSON_REWRITE_STEPS(maker.start, maker.get_step, maker.get_name)
    quanto.register_simproc(name, simproc)
    output.println("registered simproc " + name)

