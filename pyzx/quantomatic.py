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

"""Implements methods for interacting with Quantomatic. This interaction works in both directions.
When working in Python with PyZX you can edit graphs in the following way::

    import pyzx as zx
    zx.quantomatic.quantomatic_location = "path/to/quantomatic/jar/file.jar"
    g = zx.generate.cliffordT(3,10,0.2)
    g2 = zx.quantomatic.edit_graph(g) # Opens Quantomatic with the graph g opened. Execution is blocked until Quantomatic is closed again.
    # If you have saved the qgraph file in quantomatic, then g2 should now contain your changes.


When running Quantomatic, you can invoke PyZX in the following ways::
    
    #This script generates a random clifford circuit in Quantomatic
    from quanto.util.Scripting import *
    import pyzx.quantomatic as zx
    g = zx.generate.cliffords(3,15)
    j = zx.graph_to_json(g)
    new_graph_from_json(j)

    #This script registers the PyZX clifford_simp simplifier as a simproc in Quantomatic
    from quanto.util.Scripting import *
    import pyzx.quantomatic as zx
    zx.output = output
    zx.register_python_simproc("clifford",zx.simplify.clifford_iter)

"""

import json

from .graph.graph import Graph
from .io import json_to_graph, graph_to_json
from . import simplify
from . import rules
from . import generate

try:
    import quanto.util.Scripting as quanto
except ImportError:
    quanto = None


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


if not quanto:
    import tempfile
    import os
    import subprocess

    quantomatic_location = None

    def edit_graph(g):
        if not quantomatic_location or not os.path.exists(quantomatic_location):
            print("Please point towards the Quantomatic jar file with quantomatic.quantomatic_location")
            return

        with tempfile.TemporaryDirectory() as tmpdirname:
            projectname = os.path.join(tmpdirname, "main.qgraph")
            with open(projectname,'w') as f:
                f.write(pyzx_qproject)
            js = graph_to_json(g)
            fname = os.path.join(tmpdirname, "pyzxgraph.qgraph")
            with open(fname,'w') as f:
                f.write(js)
            print("Opening Quantomatic...")
            subprocess.check_call(["java", "-jar",quantomatic_location, projectname, fname])
            print("Done")
            with open(fname, 'r') as f:
                js = f.read()
                g = json_to_graph(js)
        return g


pyzx_qproject = """
{"name":"PyZX",
"theory":{"name":"Red/green theory","core_name":"red_green",
"vertex_types":{
    "X":{"value":{"type":"angle_expr","latex_constants":true,"validate_with_core":false},
        "style":{"label":{"position":"inside","fg_color":[1.0,1.0,1.0]},"stroke_color":[0.0,0.0,0.0],"fill_color":[1.0,0.0,0.0],"shape":"circle","stroke_width":1},"default_data":{"type":"X","value":""}},
    "Z":{"value":{"type":"angle_expr","latex_constants":true,"validate_with_core":false},
        "style":{"label":{"position":"inside","fg_color":[0.0,0.0,0.0]},"stroke_color":[0.0,0.0,0.0],"fill_color":[0.0,0.800000011920929,0.0],"shape":"circle","stroke_width":1},"default_data":{"type":"Z","value":""}},
    "hadamard":{"value":{"type":"string","latex_constants":false,"validate_with_core":false},
        "style":{"label":{"position":"inside","fg_color":[0.0,0.20000000298023224,0.0]},"stroke_color":[0.0,0.0,0.0],"fill_color":[1.0,1.0,0.0],"shape":"rectangle","stroke_width":1},"default_data":{"type":"hadamard","value":""}},
    "var":{"value":{"type":"string","latex_constants":false,"validate_with_core":false},
        "style":{"label":{"position":"inside","fg_color":[0.0,0.0,0.0]},"stroke_color":[0.0,0.0,0.0],"fill_color":[0.6000000238418579,1.0,0.800000011920929],"shape":"rectangle","stroke_width":1},"default_data":{"type":"var","value":""}}
    },
"default_vertex_type":"Z",
"default_edge_type":"string",
"edge_types":{
    "string":{"value":{"type":"string","latex_constants":false,"validate_with_core":false},"style":{"stroke_color":[0.0,0.0,0.0],"stroke_width":1,"label":{"position":"center","fg_color":[0.0,0.0,1.0],"bg_color":[0.800000011920929,0.800000011920929,1.0,0.699999988079071]}},"default_data":{"type":"string","value":""}}}
    }
}"""