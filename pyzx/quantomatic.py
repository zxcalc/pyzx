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
    maker = RewriteMaker(rewriter)
    simproc = quanto.JSON_REWRITE_STEPS(maker.start, maker.get_step, maker.get_name)
    quanto.register_simproc(name, simproc)
    output.println("registered simproc " + name)

