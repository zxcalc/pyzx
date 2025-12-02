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


import json
import os
from fractions import Fraction
import traceback

from typing import Optional, List, Tuple, Set, Dict, Any, Union

import pyperclip # type: ignore # Needed for clipboard actions

from .utils import VertexType
from .utils import settings, get_mode, phase_to_s, FloatInt
from .drawing import matrix_to_latex
from .graph import Scalar
from .graph.graph import GraphS
from .rewrite_rules import rules
from . import tikz

from .rewrite_rules.editor_actions import MATCHES_VERTICES, MATCHES_EDGES, operations, operations_to_js

if get_mode() == 'notebook':
	import ipywidgets as widgets
	from traitlets import Unicode, validate, Bool, Int, Float
	from IPython.display import display, HTML
else:
	# Make some dummy classes to prevent errors with the definition
	# of ZXEditorWidget
	class DOMWidget(object):
		pass
	class Unicode(object): # type: ignore
		def __init__(self,*args,**kwargs):
			pass
		def tag(self, sync=False):
			pass
	class Float(Unicode): # type: ignore
		pass
	class widgets(object): # type: ignore
		register = lambda x: x
		DOMWidget = DOMWidget

__all__ = ['edit', 'help']

HELP_STRING = """To create an editor, call `e = zx.editor.edit(g)` on a graph g. 
This will display the editor, and give you access to 
the underlying Python instance e. Your changes are automatically pushed onto 
the underlying graph instance g (which can also be accessed as e.graph).
Adding the optional argument `zx.editor.edit(g,show_matrix=True)` will
also display the matrix the diagram represents beneath the editor.

Click on edges or vertices to select them. 
Drag a box or hold shift to select multiple vertices or edges.
Press delete or backspace to delete the current selection.
Double-click a vertex to choose its phase.
Ctrl-click (Command-click for mac users) on empty space to add a new vertex. 
The type of the vertex is determined by the box "Vertex type".
Click this box (or press the hotkey 'x') to change the adding type. 
Ctrl-drag between two vertices to add an edge between them. 
The type of edge is determined by the box "Edge type".
Click this box (or press the hotkey 'e') to change the adding type.

When you have a selection, the buttons below the graph light up to denote that 
a rewrite rule can be applied to some of the vertices or edges in this selection.
Press Ctrl+C to copy the selection as tikz code onto the clipboard.
Press Ctrl+V to paste a ZX-diagram on the clipboard (specified as tikz) into the editor.
Press Ctrl+Z to undo an action and Ctrl+Shift+Z to redo an undo'd action.

In order to reflect a change done on g in the Python kernel in the editor itself,
call e.update().
Example:
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

def load_js() -> None:
	if get_mode() != 'notebook':
		raise Exception(ERROR_STRING)
	if not widgets.__version__.startswith('7'):
		raise Exception("The editor is only supported with ipywidgets>=7.5,<8. Upgrade or downgrade your install before using it.")
	with open(os.path.join(settings.javascript_location,"zx_editor_widget.js")) as f:
		data1 = f.read()
	with open(os.path.join(settings.javascript_location,"zx_editor_model.js")) as f:
		data2 = f.read()
	#"""<div style="overflow:auto">Loading scripts</div>
	text = """<script type="text/javascript">{0}
				{1}
			</script>
			<script type="text/javascript">
				{2}
			</script>""".format(settings.d3_load_string,data1,data2)
	display(HTML(text))

def s_to_phase(s: str, t:VertexType=VertexType.Z) -> Fraction:
	if not s: 
		if t!= VertexType.H_BOX: return Fraction(0)
		else: return Fraction(1)
	s = s.replace('\u03c0', '')
	if s.find('/') != -1:
		a,b = s.split("/", 2)
		if not a: return Fraction(1,int(b))
		if a == '-': a = '-1'
		return Fraction(int(a),int(b))
	if not s: return Fraction(1)
	return Fraction(int(s))

def graph_to_json(g: GraphS, scale:FloatInt, verts:Optional[List[int]]=None,edges:Optional[List[Tuple[int,int]]]=None) -> str:
	if verts is None:
		verts = list(g.vertices())
	if edges is None:
		edges = list(g.edges())
	nodes = [{'name': int(v),
			  'x': (g.row(v) + 1) * scale,
			  'y': (g.qubit(v) + 2) * scale,
			  't': g.type(v),
			  'phase': phase_to_s(g.phase(v),g.type(v)) }
			 for v in verts]
	links = [{'source': int(g.edge_s(e)),
			  'target': int(g.edge_t(e)),
			  't': g.edge_type(e) } for e in edges]
	scalar = g.scalar.to_json()
	return json.dumps({'nodes': nodes, 'links': links, 'scalar': scalar})


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
	
	def __init__(
			self, 
			graph: GraphS, 
			show_matrix:bool=False, 
			show_scalar:bool=False,
			*args, **kwargs
			) -> None:
		super().__init__(*args,**kwargs)
		self.observe(self._handle_graph_change, 'graph_json')
		self.observe(self._selection_changed, 'graph_selected')
		self.observe(self._apply_operation, 'button_clicked')
		self.observe(self._perform_action, 'action')
		self.graph = graph
		self.show_matrix = show_matrix
		self.show_scalar = show_scalar
		self.undo_stack: List[Tuple[str,str]] = [('initial',str(self.graph_json))]
		self.undo_position: int = 1
		self.halt_callbacks: bool = False
		self.snapshots: List[GraphS] = []
		self.msg: List[str] = []
		self.output = widgets.Output()
		self.scalar_view = widgets.Label()
		self.matrix_view = widgets.Label()
		self._update_matrix()
	
	def update(self) -> None:
		self.graph_json = graph_to_json(self.graph, self.graph.scale) # type: ignore

	def _update_matrix(self):
		if self.show_scalar:
			s = self.graph.scalar.to_latex()
			if s == '': s = '1'
			self.scalar_view.value = "Scalar: " + s
		if not self.show_matrix: return
		try:
			self.graph.auto_detect_io()
		except TypeError:
			self.matrix_view.value = "Couldn't parse inputs or outputs"
			return
		if self.graph.num_inputs() > 4 or self.graph.num_outputs() > 4:
			self.matrix_view.value = "Matrix too large to show"
			return
		try:
			m = self.graph.to_matrix()
		except ValueError:
			return
		self.matrix_view.value = matrix_to_latex(m)

	def _parse_selection(self) -> Tuple[Set[int],Set[Tuple[int,int]]]:
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
			g.remove_edges(rem_edges)
			g.remove_vertices(rem_verts)
			g.add_edge_table(etab)
			
			#if check_isolated_vertices: g.remove_isolated_vertices()
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
			self._selection_changed(None)
		except Exception as e:
			with self.output: print(traceback.format_exc())

	def _perform_action(self, change):
		try:
			action = change['new']
			if action == '': return
			elif action == 'undo': self.undo()
			elif action == 'redo': self.redo()
			elif action == 'snapshot': self.make_snapshot()
			elif action == 'tikzit': self.open_tikzit()
			elif action == 'paste': self.paste()
			elif action == 'copy': self.copy_to_clipboard()
			else: raise ValueError("Unknown action '{}'".format(action))
			self.action = ''
		except Exception as e:
			with self.output: print(traceback.format_exc())


	def _undo_stack_add(self, description: str, js: str) -> None:
		self.undo_stack = self.undo_stack[:len(self.undo_stack)-self.undo_position+1]
		self.undo_position = 1
		self.undo_stack.append((description,js))
		self.msg.append("Adding to undo stack: " + description)

	def undo(self) -> None:
		if self.undo_position == len(self.undo_stack): return
		self.undo_position += 1
		description, js = self.undo_stack[len(self.undo_stack)-self.undo_position]
		self.msg.append("Undo {}: {:d}-{:d}".format(description,len(self.undo_stack),self.undo_position))
		self.halt_callbacks = True
		self.graph_selected = '{"nodes": [], "links": []}'
		self.graph_from_json(json.loads(js))
		self.update()
		self.halt_callbacks = False

	def redo(self) -> None:
		if self.undo_position == 1: return
		self.undo_position -= 1
		description, js = self.undo_stack[len(self.undo_stack)-self.undo_position]
		self.msg.append("Redo {}: {:d}-{:d}".format(description,len(self.undo_stack),self.undo_position))
		self.halt_callbacks = True
		self.graph_selected = '{"nodes": [], "links": []}'
		self.graph_from_json(json.loads(js))
		self.update()
		self.halt_callbacks = False

	def paste(self) -> None:
		v = pyperclip.paste()
		try:
			g = tikz.tikz_to_graph(v,warn_overlap=False,ignore_nonzx=True)
		except ValueError as e:
			self.msg.append("Tried loading tikz from clipboard, but failed:")
			self.msg.append(str(e))
			return
		self.msg.append("Copied graph from clipboard")
		minrow = min([g.row(v) for v in g.vertices()], default=0)
		minqub = min([g.qubit(v) for v in g.vertices()], default=0)
		if minrow > 0: minrow = 0
		if minqub > 0: minqub = 0
		minrow = minrow - 0.3
		minqub = minqub - 0.3
		g = g.translate(-minrow,-minqub)
		self.halt_callbacks = True
		verts, edges = self.graph.merge(g)
		# self.graph_selected = '{"nodes": [], "links": []}'
		# js = graph_to_json(g, self.graph.scale) # type: ignore
		# self.graph_from_json(json.loads(js))
		self._undo_stack_add("paste",graph_to_json(self.graph,self.graph.scale)) # type: ignore
		self.update()
		self.graph_selected = graph_to_json(self.graph,self.graph.scale,verts,[]) # type: ignore
		self.halt_callbacks = False
		# self._selection_changed(None)

	def copy_to_clipboard(self) -> None:
		selection = json.loads(self.graph_selected)
		verts = [n["name"] for n in selection["nodes"]]
		g = self.graph.subgraph_from_vertices(verts)
		tz = g.to_tikz()
		self.msg.append("Copying graph to clipboard")
		pyperclip.copy(tz)
		

	def make_snapshot(self) -> None:
		self.snapshots.append(self.graph.copy()) # type: ignore

	def open_tikzit(self) -> None:
		seq = self.snapshots + [self.graph]
		tz = tikz.to_tikz_sequence(seq) # type: ignore
		try:
			tikz.tikzit(tz)
		except Exception as e:
			with self.output: print(e)

	def graph_from_json(self, js: Dict[str,Any]) -> None:
		try:
			scale = self.graph.scale # type: ignore
			marked: Union[Set[int],Set[Tuple[int,int]]] = self.graph.vertex_set()
			for n in js["nodes"]:
				v = n["name"]
				r = float(n["x"])/scale -1
				q = float(n["y"])/scale -2
				t = int(n["t"])
				phase = s_to_phase(n["phase"], t) # type: ignore
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
					self.graph.add_edge((s,t),et) # type: ignore
			self.graph.remove_edges(marked)
			if 'scalar' in js:
				self.graph.scalar = Scalar.from_json(js['scalar'])
			self._update_matrix()
		except Exception as e:
			with self.output: print(traceback.format_exc())
	
	def _handle_graph_change(self, change):
		"""Called whenever the graph in the editor is modified."""
		if self.halt_callbacks: return
		self.msg.append("Handling graph change")
		try:
			js = json.loads(change['new'])
			js['scalar'] = self.graph.scalar.to_json()
			self.graph_from_json(js)
			self._undo_stack_add(self.last_operation, json.dumps(js))
		except Exception as e:
			with self.output: print(traceback.format_exc())
		

	def to_graph(self, zh:bool=True) -> GraphS:
		return self.graph

			

_d3_editor_id = 0

def edit(
		g: GraphS, 
		scale:Optional[FloatInt]=None, 
		show_matrix:bool=False,
		show_scalar:bool=False,
		show_errors:bool=True) -> ZXEditorWidget:
	"""Start an instance of an ZX-diagram editor on a given graph ``g``.
	Only usable in a Jupyter Notebook. 
	When this function is called it displays a Jupyter Widget that allows
	you to modify a pyzx Graph instance in the Notebook itself.
	This function returns an instance of the editor widget, so it should be called like::

		e = zx.editor.edit(g)

	Usage:
		Ctrl-click on empty space to add vertices.
		Ctrl-drag between vertices to add edges.
		Use the "Vertex type" and "Edge type" buttons to toggle which type of
		vertex or edge to add.
		Drag with left-mouse to make a selection.
		Left-drag on a vertex to move it.
		Delete or backspace removes the selection.
		Ctrl-Z and Ctrl-Shift-Z undoes and redoes the last action.
		With a part of the graph selected, click one of the action buttons
		beneath the graph to perform a ZX-calculus rewrite.
		Click "Save snapshot" to store the current graph into ``e.snapshots``.
		Click "Load in tikzit" to open all snapshots in Tikzit.
		Point ``zx.settings.tikzit_location`` to a Tikzit executable to use this function.

	Args:
		g: The Graph instance to edit
		scale: What size the vertices should have (ideally somewhere between 20 and 50)
		show_matrix: When True, displays the linear map the Graph implements beneath the editor
		show_scalar: When True, displays ``g.scalar`` beneath the editor.
		show_errors: When True, prints Exceptions beneath the editor
	
	"""
	load_js()
	global _d3_editor_id
	_d3_editor_id += 1
	seq = _d3_editor_id

	if scale is None:
		scale = 800 / (g.depth() + 2)
		if scale > 50: scale = 50
		if scale < 20: scale = 20
	
	g.scale = scale # type: ignore
	
	node_size = 0.2 * scale
	if node_size < 2: node_size = 2

	w = max([(g.depth() + 2) * scale, 400])
	h = max([(g.qubit_count() + 3) * scale + 30, 200])
	
	js = graph_to_json(g, scale)


	w = ZXEditorWidget(
					g, show_matrix,show_scalar,
					graph_json = js, graph_id = str(seq), 
					graph_width=w, graph_height=h, 
					graph_node_size=node_size,
					graph_buttons = operations_to_js()
					)
	display(w)
	if show_scalar:
		display(w.scalar_view)
	if show_matrix:
		display(w.matrix_view)
	if show_errors: display(w.output)
	return w
