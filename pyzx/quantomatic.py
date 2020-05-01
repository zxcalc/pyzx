# PyZX - Python library for quantum circuit rewriting 
#		and optimisation using the ZX-calculus
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

"""
Implements methods for interacting with Quantomatic::

	import pyzx as zx
	zx.settings.quantomatic_location = "path/to/quantomatic/jar/file.jar"
	g = zx.generate.cliffordT(3,10,0.2)
	g2 = zx.quantomatic.edit_graph(g) # Opens Quantomatic with the graph g opened. Execution is blocked until Quantomatic is closed again.
	# If you have saved the qgraph file in quantomatic, then g2 should now contain your changes.

"""

import tempfile
import os
import subprocess

from .utils import settings
from .io import json_to_graph, graph_to_json
from .graph.base import BaseGraph

def edit_graph(g: BaseGraph) -> BaseGraph:
	"""Opens Quantomatic with the graph ``g`` loaded. When you are done editing the graph, 
	you save it in Quantomatic and close the executable. The resulting graph is returned by this function.
	Note that this function blocks until the Quantomatic executable is closed. For this function to work
	you must first set ``zx.quantomatic.quantomatic_location`` to point towards the Quantomatic .jar file."""
	if not settings.quantomatic_location or not os.path.exists(settings.quantomatic_location):
		raise Exception("Please point towards the Quantomatic jar file with pyzx.settings.quantomatic_location")

	with tempfile.TemporaryDirectory() as tmpdirname:
		projectname = os.path.join(tmpdirname, "main.qgraph")
		with open(projectname,'w') as f:
			f.write(pyzx_qproject)
		js = graph_to_json(g)
		fname = os.path.join(tmpdirname, "pyzxgraph.qgraph")
		with open(fname,'w') as f:
			f.write(js)
		print("Opening Quantomatic...")
		subprocess.check_call(["java", "-jar",settings.quantomatic_location, projectname, fname])
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