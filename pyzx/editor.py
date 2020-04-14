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
import traceback

from .graph import EdgeType, VertexType, toggle_edge, vertex_is_zx, toggle_vertex

try:
	import ipywidgets as widgets
	from traitlets import Unicode, validate, Bool, Int, Float
	from IPython.display import display, HTML
	in_notebook = True
except ImportError:
	in_notebook = False
	# Make some dummy classes to prevent errors with the definition
	# of ZXEditorWidget
	class DOMWidget(object):
		pass
	class Unicode(object):
		def __init__(self,*args,**kwargs):
			pass
		def tag(self, sync=False):
			pass
	class Float(Unicode):
		pass
	class widgets(object):
		register = lambda x: x
		DOMWidget = DOMWidget

from .drawing import phase_to_s

from . import rules

__all__ = ['edit', 'help']

HELP_STRING = """To create an editor, call `e = zx.editor.edit(g)` on a graph g. 
This will display the editor, and give you access to 
the underlying Python instance e. Your changes are automatically pushed onto 
the underlying graph instance g (which can also be accessed as e.graph).

Click on edges or vertices to select them. 
Drag a box or hold shift to select multiple vertices or edges.
Press delete or backspace to delete the current selection.
Double-click a vertex to choose its phase.
Ctrl-click on empty space to add a new vertex. 
The type of the vertex is determined by the box "Vertex type".
Click this box (or press the hotkey 'x') to change the adding type. 
Ctrl-drag between two vertices to add an edge between them. 
The type of edge is determined by the box "Edge type".
Click this box (or press the hotkey 'e') to change the adding type.

When you have a selection, the buttons below the graph light up to denote that 
a rewrite rule can be applied to some of the vertices or edges in this selection.

In order to reflect a change done on g in the Python kernel in the editor itself,
call e.update().

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

ERROR_STRING = """This functionality is only supported in a Jupyter Notebook.
If you are running this in a Jupyter notebook, then you probably don't have ipywidgets installed.
Run %%pip install ipywidgets in a cell in your notebook to install the correct package.
"""

# We default to importing d3 from a CDN
d3_load_string = 'require.config({paths: {d3: "https://d3js.org/d3.v5.min"} });'
# However, if we are working in the pyzx directory itself, we can use the copy of d3
# local to pyzx, which doesn't require an internet connection
# We only do this if we believe we are running in the PyZX directory itself.

javascript_location = os.path.join(os.path.dirname(__file__), 'js')
relpath = os.path.relpath(javascript_location, os.getcwd())
if relpath.count('..') <= 1: # We are *probably* working in the PyZX directory
	javascript_location = os.path.relpath(javascript_location, os.getcwd())
	d3_load_string = 'require.config({{baseUrl: "{}",paths: {{d3: "d3.v5.min"}} }});'.format(
						javascript_location.replace('\\','/'))
	# TODO: This will fail if Jupyter is started in the parent directory of pyzx, while
	# the notebook is not in the pyzx directory

def load_js():
	if not in_notebook:
		raise Exception(ERROR_STRING)
	with open(os.path.join(javascript_location,"zx_editor_widget.js")) as f:
		data1 = f.read()
	with open(os.path.join(javascript_location,"zx_editor_model.js")) as f:
		data2 = f.read()
	#"""<div style="overflow:auto">Loading scripts</div>
	text = """<script type="text/javascript">{0}
				{1}
			</script>
			<script type="text/javascript">
				{2}
			</script>""".format(d3_load_string,data1,data2)
	display(HTML(text))

_d3_editor_id = 0

# def phase_to_s(a):
#	 if not a: return ''
#	 if not isinstance(a, Fraction):
#		 a = Fraction(a)
#	 ns = '' if a.numerator == 1 else str(a.numerator)
#	 ds = '' if a.denominator == 1 else '/' + str(a.denominator)

#	 # unicode 0x03c0 = pi
#	 return ns + '\u03c0' + ds

def s_to_phase(s, t=1):
	if not s: 
		if t!= VertexType.H_BOX: return Fraction(0)
		else: return Fraction(1)
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
			  'phase': phase_to_s(g.phase(v),g.type(v)) }
			 for v in g.vertices()]
	links = [{'source': int(g.edge_s(e)),
			  'target': int(g.edge_t(e)),
			  't': g.edge_type(e) } for e in g.edges()]
	return json.dumps({'nodes': nodes, 'links': links})



def colour_change_matcher(g, vertexf):
	if vertexf != None: candidates = set([v for v in g.vertices() if vertexf(v)])
	else: candidates = g.vertex_set()
	types = g.types()

	m = []
	while len(candidates) > 0:
		v = candidates.pop()
		if types[v] == VertexType.X:
			m.append(v)

	return m

def colour_change(g, matches):
	for v in matches:
		g.set_type(v, VertexType.Z)
		for e in g.incident_edges(v):
			et = g.edge_type(e)
			g.set_edge_type(e, toggle_edge(et))
	return ({}, [],[],False)

def copy_matcher(g, vertexf=None):
	if vertexf != None: candidates = set([v for v in g.vertices() if vertexf(v)])
	else: candidates = g.vertex_set()
	phases = g.phases()
	types = g.types()
	m = []

	while len(candidates) > 0:
		v = candidates.pop()
		if phases[v] not in (0,1) or not vertex_is_zx(types[v]) or g.vertex_degree(v) != 1:
                    continue
		w = list(g.neighbours(v))[0]
		e = g.edge(v,w)
		et = g.edge_type(e)
		if ((types[w] != types[v] and et==EdgeType.HADAMARD) or
			(types[w] == types[v] and et==EdgeType.SIMPLE)):
			continue
		neigh = [n for n in g.neighbours(w) if n != v]
		m.append((v,w,et,phases[v],phases[w],neigh))
		candidates.discard(w)
		candidates.difference_update(neigh)

	return m

def apply_copy(g, matches):
	rem = []
	types = g.types()
	for v,w,t,a,alpha, neigh in matches:
		rem.append(v)
		rem.append(w)
		g.scalar.add_power(1)
		
		if a: g.scalar.add_phase(alpha)
		for n in neigh: 
			r = g.row(n)
			vt = types[v] if t == EdgeType.SIMPLE else toggle_vertex(types[v])
			u = g.add_vertex(vt, g.qubit(n)-0.8, r, a)
			e = g.edge(n,w)
			et = g.edge_type(e)
			g.add_edge((n,u), et)
	return ({}, rem, [], True)

MATCHES_VERTICES = 1
MATCHES_EDGES = 2

operations = {
	"spider": {"text": "fuse spiders", 
			   "tooltip": "Fuses connected spiders of the same colour",
			   "matcher": rules.match_spider_parallel, 
			   "rule": rules.spider, 
			   "type": MATCHES_EDGES},
	"colour": {"text": "change colour", 
			   "tooltip": "Changes X spiders into Z spiders by pushing out Hadamards",
			   "matcher": colour_change_matcher, 
			   "rule": colour_change, 
			   "type": MATCHES_VERTICES},
	"rem_id": {"text": "remove identity", 
			   "tooltip": "Removes a 2-ary phaseless spider",
			   "matcher": rules.match_ids_parallel, 
			   "rule": rules.remove_ids, 
			   "type": MATCHES_VERTICES},
	"copy": {"text": "copy 0/pi spider", 
			   "tooltip": "Copies a single-legged spider with a 0/pi phase through its neighbour",
			   "matcher": copy_matcher, 
			   "rule": apply_copy, 
			   "type": MATCHES_VERTICES},
	"lcomp": {"text": "local complementation", 
			   "tooltip": "Deletes a spider with a pi/2 phase by performing a local complementation on its neighbours",
			   "matcher": rules.match_lcomp_parallel, 
			   "rule": rules.lcomp, 
			   "type": MATCHES_VERTICES},
	"pivot": {"text": "pivot", 
			   "tooltip": "Deletes a pair of spiders with 0/pi phases by performing a pivot",
			   "matcher": lambda g, matchf: rules.match_pivot_parallel(g, matchf, check_edge_types=True), 
			   "rule": rules.pivot, 
			   "type": MATCHES_EDGES}
}


def operations_to_js():
	global operations
	return json.dumps({k:{"active":False, "text":v["text"], "tooltip":v["tooltip"]} for k,v in operations.items()})


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

	graph_buttons  = Unicode('{empty: false}').tag(sync=True)
	button_clicked = Unicode('').tag(sync=True)
	last_operation = Unicode('').tag(sync=True)
	action 		   = Unicode('').tag(sync=True)
	
	def __init__(self, graph, *args, **kwargs):
		super().__init__(*args,**kwargs)
		self.observe(self._handle_graph_change, 'graph_json')
		self.observe(self._selection_changed, 'graph_selected')
		self.observe(self._apply_operation, 'button_clicked')
		self.observe(self._perform_action, 'action')
		self.graph = graph
		self.undo_stack = [('initial',str(self.graph_json))]
		self.undo_position = 1
		self.halt_callbacks = False
		self.msg = []
		self.output = widgets.Output()
	
	def update(self):
		self.graph_json = graph_to_json(self.graph, self.graph.scale)

	def _parse_selection(self):
		"""Helper function for `_selection_changed` and `_apply_operation`."""
		selection = json.loads(self.graph_selected)
		g = self.graph
		vertex_set = set([n["name"] for n in selection["nodes"]])
		edge_set = set([g.edge(e["source"],e["target"]) for e in selection["links"]])
		edge_set.update([g.edge(v,w) for v in vertex_set for w in vertex_set if g.connected(v,w)])
		return vertex_set, edge_set

	def _selection_changed(self, change):
		"""Is called when the selection in the editor changes.
		Updates the action buttons so that the correct ones are active."""
		try:
			vertex_set, edge_set = self._parse_selection()
			g = self.graph
			js = json.loads(self.graph_buttons)
			for op_id, data in operations.items():
				if data["type"] == MATCHES_EDGES:
					matches = data["matcher"](g, lambda e: e in edge_set)
				else: matches = data["matcher"](g, lambda v: v in vertex_set)
				js[op_id]["active"] = (len(matches) != 0)
			self.graph_buttons = json.dumps(js)
		except Exception as e:
			with self.output: print(traceback.format_exc())

	def _apply_operation(self, change):
		"""called when one of the action buttons is clicked. 
		Performs the action on the selection."""
		try:
			op = change['new']
			if not op: return
			vertex_set, edge_set = self._parse_selection()
			g = self.graph
			data = operations[op]
			if data["type"] == MATCHES_EDGES:
				matches = data["matcher"](g, lambda e: e in edge_set)
			else: matches = data["matcher"](g, lambda v: v in vertex_set)
			# Apply the rule
			etab, rem_verts, rem_edges, check_isolated_vertices = data["rule"](g, matches)
			g.add_edge_table(etab)
			g.remove_vertices(rem_verts)
			g.remove_edges(rem_edges)
			if check_isolated_vertices: g.remove_isolated_vertices()
			# Remove stuff from the selection
			selection = json.loads(self.graph_selected)
			selection["nodes"] = [v for v in selection["nodes"] if v["name"] not in rem_verts]
			selection["links"] = [e for e in selection["links"] if (
										(e["source"], e["target"]) not in rem_edges 
										and e["source"] not in rem_verts
										and e["target"] not in rem_verts)]
			self.graph_selected = json.dumps(selection)
			self.button_clicked = ''
			self.update()
		except Exception as e:
			with self.output: print(traceback.format_exc())

	def _perform_action(self, change):
		try:
			action = change['new']
			if action == '': return
			elif action == 'undo': self.undo()
			elif action == 'redo': self.redo()
			else: raise ValueError("Unknown action '{}'".format(action))
			self.action = ''
		except Exception as e:
			with self.output: print(traceback.format_exc())


	def undo_stack_add(self, description, js):
		self.undo_stack = self.undo_stack[:len(self.undo_stack)-self.undo_position+1]
		self.undo_position = 1
		self.undo_stack.append((description,js))
		self.msg.append("Adding to undo stack: " + description)

	def undo(self):
		if self.undo_position == len(self.undo_stack): return
		self.undo_position += 1
		description, js = self.undo_stack[len(self.undo_stack)-self.undo_position]
		self.msg.append("Undo {}: {:d}-{:d}".format(description,len(self.undo_stack),self.undo_position))
		self.halt_callbacks = True
		self.graph_selected = '{"nodes": [], "links": []}'
		self.graph_from_json(json.loads(js))
		self.update()
		self.halt_callbacks = False

	def redo(self):
		if self.undo_position == 1: return
		self.undo_position -= 1
		description, js = self.undo_stack[len(self.undo_stack)-self.undo_position]
		self.msg.append("Redo {}: {:d}-{:d}".format(description,len(self.undo_stack),self.undo_position))
		self.halt_callbacks = True
		self.graph_selected = '{"nodes": [], "links": []}'
		self.graph_from_json(json.loads(js))
		self.update()
		self.halt_callbacks = False

	def graph_from_json(self, js):
		try:
			scale = self.graph.scale
			marked = self.graph.vertex_set()
			for n in js["nodes"]:
				v = n["name"]
				r = float(n["x"])/scale -1
				q = float(n["y"])/scale -2
				t = int(n["t"])
				phase = s_to_phase(n["phase"], t)
				if v not in marked:
					self.graph.add_vertex_indexed(v)
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
			with self.output: print(traceback.format_exc())
	
	def _handle_graph_change(self, change):
		"""Called whenever the graph in the editor is modified."""
		if self.halt_callbacks: return
		self.msg.append("Handling graph change")
		try:
			js = json.loads(change['new'])
			self.graph_from_json(js)
			self.undo_stack_add(self.last_operation, change['new'])
		except Exception as e:
			with self.output: print(traceback.format_exc())
		

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

	w = max([(g.depth() + 2) * scale, 400])
	h = max([(g.qubit_count() + 3) * scale + 30, 200])
	
	js = graph_to_json(g, scale)


	w = ZXEditorWidget(g, graph_json = js, graph_id = str(seq), 
					  graph_width=w, graph_height=h, graph_node_size=node_size,
					  graph_buttons = operations_to_js())
	display(w)
	return w
