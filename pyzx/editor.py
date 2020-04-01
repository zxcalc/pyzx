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


import json
import os
from fractions import Fraction

javascript_location = '../js'
_d3_editor_id = 0

try:
	import ipywidgets as widgets
	from traitlets import Unicode, validate, Bool, Int, Float
	from IPython.display import display, HTML
	in_notebook = True
except ImportError:
	in_notebook = False

from .drawing import phase_to_s

__all__ = ['edit', 'help']

HELP_STRING = """To create an editor, call
> e = zx.editor.edit(g)
On a graph g. This will display the editor, and give you access to the underlying Python instance e.

Click on edges or vertices to select them. Drag a box or hold shift to select multiple vertices or edges.
Press delete or backspace to delete the current selection.
Double-click a vertex to choose its phase.
Ctrl-click on empty space to add a new vertex. The type of the vertex is determined by the box "Vertex type".
Click this box (or press the hotkey 'x') to change the adding type. 
Ctrl-drag between two vertices to add an edge between them. The type of edge is determined by the box "Edge type".
Click this box (or press the hotkey 'e') to change the adding type.

Your changes are automatically pushed onto the underlying graph instance g (which can also be accessed as e.graph).

When conversely you want to see a change of g made in the Python kernel reflected in the editor, call e.update().

Example usage:
In [0]: c = zx.Circuit(3)
        c.add_gate("TOF",0,1,2)
        g = c.to_basic_gates().to_graph()
        e = zx.editor_edit(g)
>>> Now the graph g is shown in the output of the cell.
In [1]: zx.spider_simp(g)
        e.update()
>>> Now the view of g in the editor above is updated.
"""

def help():
	print(HELP_STRING)

def load_js():
	if not in_notebook:
		raise Exception("This functionality is only supported in a Jupyter Notebook")
	with open(os.path.join(javascript_location,"zx_editor_widget.js")) as f:
		data1 = f.read()
	with open(os.path.join(javascript_location,"zx_editor_model.js")) as f:
		data2 = f.read()
	#"""<div style="overflow:auto">Loading scripts</div>
	text = """<script type="text/javascript">require.config({{ baseUrl: "{0}",paths: {{d3: "d3.v5.min"}} }});
				{1}
			</script>
			<script type="text/javascript">
				{2}
			</script>""".format(javascript_location,data1,data2)
	display(HTML(text))



# def phase_to_s(a):
#	 if not a: return ''
#	 if not isinstance(a, Fraction):
#		 a = Fraction(a)
#	 ns = '' if a.numerator == 1 else str(a.numerator)
#	 ds = '' if a.denominator == 1 else '/' + str(a.denominator)

#	 # unicode 0x03c0 = pi
#	 return ns + '\u03c0' + ds

def s_to_phase(s):
	if not s: return Fraction(0)
	s = s.replace('\u03c0', '')
	if s.find('/') != -1:
		a,b = s.split("/", 2)
		if not a: return Fraction(1,int(b))
		return Fraction(int(a),int(b))
	if not s: return Fraction(1)
	return Fraction(int(s))

def graph_to_json(g, scale):
	nodes = [{'name': int(v),
			  'x': (g.row(v) + 1) * scale,
			  'y': (g.qubit(v) + 2) * scale,
			  't': g.type(v),
			  'phase': phase_to_s(g.phase(v)) }
			 for v in g.vertices()]
	links = [{'source': int(g.edge_s(e)),
			  'target': int(g.edge_t(e)),
			  't': g.edge_type(e) } for e in g.edges()]
	return json.dumps({'nodes': nodes, 'links': links})



@widgets.register
class ZXEditorWidget(widgets.DOMWidget):
	_view_name = Unicode('ZXEditorView').tag(sync=True)
	_model_name = Unicode('ZXEditorModel').tag(sync=True)
	_view_module = Unicode('zx_editor').tag(sync=True)
	_model_module = Unicode('zx_editor').tag(sync=True)
	_view_module_version = Unicode('0.1.0').tag(sync=True)
	_model_module_version = Unicode('0.1.0').tag(sync=True)
	
	graph_json = Unicode('{"nodes": [], "links": []}').tag(sync=True)
	graph_selected = Unicode('{"nodes": [], "links": []}').tag(sync=True)
	graph_id = Unicode('0').tag(sync=True)
	graph_width = Float(600.0).tag(sync=True)
	graph_height = Float(400.0).tag(sync=True)
	graph_node_size = Float(5.0).tag(sync=True)
	
	def __init__(self, graph, *args, **kwargs):
		super().__init__(*args,**kwargs)
		self.observe(self.handle_graph_change, 'graph_json')
		self.observe(self.selection_changed, 'graph_selected')
		self.graph = graph
		self.changes = []
	
	def update(self):
		self.graph_json = graph_to_json(self.graph, self.graph.scale)

	def selection_changed(self, change):
		js =json.loads(change['new'])
		self.js = js
		
	
	def handle_graph_change(self, change):
		try:
			js = json.loads(change['new'])
			scale = self.graph.scale
			marked = self.graph.vertex_set()
			for n in js["nodes"]:
				v = n["name"]
				r = float(n["x"])/scale -1
				q = float(n["y"])/scale -2
				t = int(n["t"])
				phase = s_to_phase(n["phase"])
				if v not in marked:
					self.graph.add_vertex(t, q, r, phase)
				else: 
					marked.remove(v)
					self.graph.set_position(v, q, r)
					self.graph.set_phase(v, phase)
					self.graph.set_type(v, t)
			self.graph.remove_vertices(marked)
			marked = self.graph.edge_set()
			for e in js["links"]:
				s = int(e["source"])
				t = int(e["target"])
				et = int(e["t"])
				if self.graph.connected(s,t):
					f = self.graph.edge(s,t)
					marked.remove(f)
					self.graph.set_edge_type(f, et)
				else:
					self.graph.add_edge((s,t),et)
			self.graph.remove_edges(marked)
		except Exception as e:
			self.excepts = e

	def to_graph(self, zh=True):
		return self.graph

			

_d3_editor_id = 0
def edit(g, scale=None):
	load_js()
	global _d3_editor_id
	_d3_editor_id += 1
	seq = _d3_editor_id

	if scale == None:
		scale = 800 / (g.depth() + 2)
		if scale > 50: scale = 50
		if scale < 20: scale = 20
	
	g.scale = scale
	
	node_size = 0.2 * scale
	if node_size < 2: node_size = 2

	w = (g.depth() + 2) * scale
	h = (g.qubit_count() + 3) * scale
	
	js = graph_to_json(g, scale)
	w = ZXEditorWidget(g, graph_json = js, graph_id = str(seq), 
					  graph_width=w, graph_height=h, graph_node_size=node_size)
	display(w)
	return w