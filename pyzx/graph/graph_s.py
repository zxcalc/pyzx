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

from fractions import Fraction
from .base import BaseGraph

class GraphS(BaseGraph):
	"""Purely Pythonic implementation of :class:`~graph.base.BaseGraph`."""
	backend = 'simple'

	#The documentation of what these methods do 
	#can be found in base.BaseGraph
	def __init__(self):
		BaseGraph.__init__(self)
		self.graph = dict()
		self._vindex = 0
		self.nedges = 0
		self.ty = dict()
		self._phase = dict()
		self._qindex = dict()
		self._maxq = -1
		self._rindex = dict()
		self._maxr = -1

		self.inputs = []
		self.outputs = []
		self._vdata = dict()
		

	def vindex(self): return self._vindex
	def depth(self): 
		if self._rindex: self._maxr = max(self._rindex.values())
		else: self._maxr = -1
		return self._maxr
	def qubit_count(self): 
		if self._qindex: self._maxq = max(self._qindex.values())
		else: self._maxq = -1
		return self._maxq + 1

	def add_vertices(self, amount):
		for i in range(self._vindex, self._vindex + amount):
			self.graph[i] = dict()
			self.ty[i] = 0
			self._phase[i] = 0
		self._vindex += amount
		return range(self._vindex - amount, self._vindex)

	def add_edges(self, edges, edgetype=1):
		for s,t in edges:
			self.nedges += 1
			self.graph[s][t] = edgetype
			self.graph[t][s] = edgetype

	def remove_vertices(self, vertices):
		for v in vertices:
			vs = list(self.graph[v])
			# remove all edges
			for v1 in vs:
				self.nedges -= 1
				del self.graph[v][v1]
				del self.graph[v1][v]
			# remove the vertex
			del self.graph[v]
			del self.ty[v]
			del self._phase[v]
			try: del self._qindex[v]
			except: pass
			try: del self._rindex[v]
			except: pass
			try: del self.phase_index[v]
			except: pass
			self._vdata.pop(v,None)

	def remove_vertex(self, vertex):
		self.remove_vertices([vertex])

	def remove_edges(self, edges):
		for s,t in edges:
			self.nedges -= 1
			del self.graph[s][t]
			del self.graph[t][s]

	def remove_edge(self, edge):
		self.remove_edges([edge])

	def num_vertices(self):
		return len(self.graph)

	def num_edges(self):
		return self.nedges

	def vertices(self):
		return self.graph.keys()

	def vertices_in_range(self, start, end):
		"""Returns all vertices with index between start and end
		that only have neighbours whose indices are between start and end"""
		for v in self.graph.keys():
			if not start<v<end: continue
			if all(start<v2<end for v2 in self.graph[v]):
				yield v

	def edges(self):
		for v0,adj in self.graph.items():
			for v1 in adj:
				if v1 > v0: yield (v0,v1)

	def edges_in_range(self, start, end, safe=False):
		"""like self.edges, but only returns edges that belong to vertices 
		that are only directly connected to other vertices with 
		index between start and end.
		If safe=True then it also checks that every neighbour is only connected to vertices with the right index"""
		if not safe:
			for v0,adj in self.graph.items():
				if not (start<v0<end): continue
				#verify that all neighbours are in range
				if all(start<v1<end for v1 in adj):
					for v1 in adj:
						if v1 > v0: yield (v0,v1)
		else:
			for v0,adj in self.graph.items():
				if not (start<v0<end): continue
				#verify that all neighbours are in range, and that each neighbour
				# is only connected to vertices that are also in range
				if all(start<v1<end for v1 in adj) and all(all(start<v2<end for v2 in self.graph[v1]) for v1 in adj):
					for v1 in adj:
						if v1 > v0:
							yield (v0,v1)

	def edge(self, s, t):
		return (s,t) if s < t else (t,s)
	def edge_set(self):
		return set(self.edges())
	def edge_st(self, edge):
		return edge

	def neighbours(self, vertex):
		return self.graph[vertex].keys()

	def vertex_degree(self, vertex):
		return len(self.graph[vertex])

	def incident_edges(self, vertex):
		return [(vertex, v1) if v1 > vertex else (v1, vertex) for v1 in self.graph[vertex]]

	def connected(self,v1,v2):
		return v2 in self.graph[v1]

	def edge_type(self, e):
		v1,v2 = e
		try:
			return self.graph[v1][v2]
		except KeyError:
			return 0

	def set_edge_type(self, e, t):
		v1,v2 = e
		self.graph[v1][v2] = t
		self.graph[v2][v1] = t

	def type(self, vertex):
		return self.ty[vertex]
	def types(self):
		return self.ty
	def set_type(self, vertex, t):
		self.ty[vertex] = t

	def phase(self, vertex):
		return self._phase.get(vertex,Fraction(1))
	def phases(self):
		return self._phase
	def set_phase(self, vertex, phase):
		self._phase[vertex] = Fraction(phase) % 2
	def add_to_phase(self, vertex, phase):
		self._phase[vertex] = (self._phase.get(vertex,Fraction(1)) + phase) % 2

	def qubit(self, vertex):
		return self._qindex.get(vertex,-1)
	def qubits(self):
		return self._qindex
	def set_qubit(self, vertex, q):
		if q > self._maxq: self._maxq = q
		self._qindex[vertex] = q

	def row(self, vertex):
		return self._rindex.get(vertex, -1)
	def rows(self):
		return self._rindex
	def set_row(self, vertex, r):
		if r > self._maxr: self._maxr = r
		self._rindex[vertex] = r

	def vdata_keys(self, vertex):
		return self._vdata.get(vertex, {}).keys()
	def vdata(self, vertex, key, default=0):
		if vertex in self._vdata:
			return self._vdata[vertex].get(key,default)
		else:
			return default
	def set_vdata(self, vertex, key, val):
		if vertex in self._vdata:
			self._vdata[vertex][key] = val
		else:
			self._vdata[vertex] = {key:val}