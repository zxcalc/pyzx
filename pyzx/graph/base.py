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

import abc

class DocstringMeta(abc.ABCMeta):
    """Metaclass that allows docstring 'inheritance'"""

    def __new__(mcls, classname, bases, cls_dict):
        cls = abc.ABCMeta.__new__(mcls, classname, bases, cls_dict)
        mro = cls.__mro__[1:]
        for name, member in cls_dict.items():
            if not getattr(member, '__doc__'):
                for base in mro:
                    try:
                        member.__doc__ = getattr(base, name).__doc__
                        break
                    except AttributeError:
                        pass
        return cls

class BaseGraph(object):
	"""Base class for letting graph backends interact with PyZX.
	For a backend to work with PyZX, there should be a class that implements
	all the methods of this class. For implementations of this class see 
	:class:`~graph.graph_s.GraphS` or :class `~graph.graph_ig.GraphIG`."""
	__metaclass__ = DocstringMeta
	backend = 'None'

	def __str__(self):
		return "Graph({} vertices, {} edges)".format(
			    str(self.num_vertices()),str(self.num_edges()))

	def __repr__(self):
		return str(self)

	def copy(self, backend=None):
		"""Create a copy of the graph. Optionally, the 'backend' parameter can be given
		to create a copy of the graph with a given backend. If it is omitted, the copy
		will have the same backend.

		Note the copy will have consecutive vertex indices, even if the original
		graph did not.
		"""
		from .graph import Graph #imported here to prevent circularity
		if (backend == None):
			backend = type(self).backend
		g = Graph(backend = backend)

		g.add_vertices(self.num_vertices())
		ty = self.types()
		an = self.phases()
		vtab = dict()
		for i,v in enumerate(self.vertices()):
			vtab[v] = i
			g.set_type(i, ty[v])
			g.set_phase(i, an[v])
			for k in self.vdata_keys(v):
				g.set_vdata(i, k, self.vdata(v, k))
		
		etab = {e:(vtab[self.edge_s(e)],vtab[self.edge_t(e)]) for e in self.edges()}
		g.add_edges(etab.values())
		for e,(s,t) in etab.items():
			g.set_edge_type(g.edge(s,t), self.edge_type(e))
		return g

	def vindex(self):
		"""The index given to the next vertex added to the graph. It should always
		be equal to max(g.vertices()) + 1."""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def depth(self):
		"""Returns the value of the highest row number given to a vertex.
		This is -1 when no rows have been set."""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def qubit_count(self):
		"""Returns the value of the highest qubit index given to a vertex.
		This is -1 when no qubit indices have been set."""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def add_vertices(self, amount):
		"""Add the given amount of vertices, and return the indices of the
		new vertices added to the graph, namely: range(g.vindex() - amount, g.vindex())"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def add_vertex(self, ty=0, qubit=-1, row=-1, phase=0):
		"""Add a single vertex to the graph and return its index.
		The optional parameters allow you to respectively set
		the type, qubit index, row index and phase of the vertex."""
		v = self.add_vertices(1)[0]
		if ty: self.set_type(v, ty)
		if qubit!=-1: self.set_qubit(v, qubit)
		if row!=-1: self.set_row(v, row)
		if phase: self.set_phase(v, phase)
		return v

	def add_edges(self, edges, edgetype=1):
		"""Adds a list of edges to the graph. 
		If edgetype is 1 (the default), these will be regular edges.
		If edgetype is 2, these edges will be Hadamard edges."""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def add_edge(self, edge, edgetype=1):
		"""Adds a single edge of the given type (1=regular, 2=Hadamard edge)"""
		self.add_edges([edge], edgetype)

	def add_edge_table(self, etab):
		"""Takes a dictionary mapping (source,target) --> (#edges, #h-edges) specifying that
		#edges regular edges must be added between source and target and $h-edges Hadamard edges.
		The method selectively adds or removes edges to produce that ZX diagram which would 
		result from adding (#edges, #h-edges), and then removing all parallel edges using Hopf/spider laws."""
		add = ([],[]) # list of edges and h-edges to add
		remove = []   # list of edges to remove
		#add_pi_phase = []
		for (v1,v2),(n1,n2) in etab.items():
			conn_type = self.edge_type(self.edge(v1,v2))
			if conn_type == 1: n1 += 1 #and add to the relevant edge count
			elif conn_type == 2: n2 += 1
			
			t1 = self.type(v1)
			t2 = self.type(v2)
			if t1 == t2: 		#types are equal,
				n1 = bool(n1) 	#so normal edges fuse
				n2 = n2%2 		#while hadamard edges go modulo 2
				if n1 != 0 and n2 != 0:  #reduction rule for when both edges appear
					new_type = 1
					self.add_to_phase(v1, 1)
					#add_pi_phase.append(v1)
				elif n1 != 0: new_type = 1
				elif n2 != 0: new_type = 2
				else: new_type = 0
			else:				#types are different
				n1 = n1%2		#so normal edges go modulo 2
				n2 = bool(n2)	#while hadamard edges fuse
				if n1 != 0 and n2 != 0:  #reduction rule for when both edges appear
					new_type = 2
					self.add_to_phase(v1, 1)
					#add_pi_phase.append(v1)
				elif n1 != 0: new_type = 1
				elif n2 != 0: new_type = 2
				else: new_type = 0
			if new_type != 0: # They should be connected, so update the graph
				if conn_type == 0: #new edge added
					add[new_type-1].append((v1,v2))
				elif conn_type != new_type: #type of edge has changed
					self.set_edge_type(self.edge(v1,v2), new_type)
			elif conn_type != 0: #They were connected, but not anymore, so update the graph
				remove.append(self.edge(v1,v2))

		self.remove_edges(remove)
		self.add_edges(add[0],1)
		self.add_edges(add[1],2)

	def remove_vertices(self, vertices):
		"""Removes the list of vertices from the graph"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def remove_vertex(self, vertex):
		"""Removes the given vertex from the graph"""
		self.remove_vertices([vertex])

	def remove_isolated_vertices(self):
		"""Deletes all vertices that are not connected to any other vertex.
		Should be replaced by a faster alternative if available in the backend"""
		self.remove_vertices([v for v in self.vertices() if self.vertex_degree(v)==0])

	def remove_edges(self, edges):
		"""Removes the list of edges from the graph"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def remove_edge(self, edge):
		"""Removes the given edge from the graph"""
		self.remove_edge([edge])

	def num_vertices(self):
		"""Returns the amount of vertices in the graph"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def num_edges(self):
		"""Returns the amount of edges in the graph"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def vertices(self):
		"""Iterator over all the vertices"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def edges(self):
		"""Iterator that returns all the edges. Output type depends on implementation in backend"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def vertex_set(self):
		"""Returns the vertices of the graph as a Python set. 
		Should be overloaded if the backend supplies a cheaper version than this."""
		return set(self.vertices())

	def edge_set(self):
		"""Returns the edges of the graph as a Python set. 
		Should be overloaded if the backend supplies a cheaper version than this."""
		return set(self.edges())

	def edge(self, s, t):
		"""Returns the edge object with the given source/target"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def edge_st(self, edge):
		"""Returns a tuple of source/target of the given edge."""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)
	def edge_s(self, edge):
		"""Returns the source of the given edge."""
		return self.edge_st(edge)[0]
	def edge_t(self, edge):
		"""Returns the target of the given edge."""
		return self.edge_st(edge)[1]

	def neighbours(self, vertex):
		"""Returns all neighbouring vertices of the given vertex"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def vertex_degree(self, vertex):
		"""Returns the degree of the given vertex"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def incident_edges(self, vertex):
		"""Returns all neighbouring edges of the given vertex."""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def connected(self,v1,v2):
		"""Returns whether vertices v1 and v2 share an edge"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def edge_type(self, e):
		"""Returns the type of the given edge:
		1 if it is regular, 2 if it is a Hadamard edge, 0 if the edge is not in the graph"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)
	def set_edge_type(self, e, t):
		"""Sets the type of the given edge."""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def type(self, vertex):
		"""Returns the type of the given vertex:
		0 if it is a boundary, 1 if is a Z node, 2 if it a X node"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)
	def types(self):
		"""Returns a mapping of vertices to their types"""
		raise NotImplementedError("Not implemented on backend " + type(self).backend)
	def set_type(self, vertex, t):
		"""Sets the type of the given vertex to t"""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	
	def phase(self, vertex):
		"""Returns the phase value of the given vertex"""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	def phases(self):
		"""Returns a mapping of vertices to their phase values"""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	def set_phase(self, vertex, phase):
		"""Sets the phase of the vertex to the given value"""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	def add_to_phase(self, vertex, phase):
		"""Add the given phase to the phase value of the given vertex"""
		self.set_phase(vertex,self.phase(vertex)+phase)

	def qubit(self, vertex):
		"""Returns the qubit index associated to the vertex. 
		If no index has been set, returns -1."""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	def qubits(self):
		"""Returns a mapping of vertices to their qubit index"""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	def set_qubit(self, vertex, q):
		"""Sets the qubit index associated to the vertex."""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)

	def row(self, vertex):
		"""Returns the row that the vertex is positioned at. 
		If no row has been set, returns -1."""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	def rows(self):
		"""Returns a mapping of vertices to their row index"""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	def set_row(self, vertex, r):
		"""Sets the row the vertex should be positioned at."""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)

	def set_position(self, vertex, q, r):
		self.set_qubit(vertex, q)
		self.set_row(vertex, r)

	def vdata_keys(self, vertex):
		"""Returns an iterable of the vertex data key names.
		Used e.g. in making a copy of the graph in a backend-independent way."""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	def vdata(self, vertex, key, default=0):
		"""Returns the data value of the given vertex associated to the key.
		If this key has no value associated with it, it returns the default value."""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)
	def set_vdata(self, vertex, key, val):
		"""Sets the vertex data associated to key to val"""
		raise NotImplementedError("Not implemented on backend" + type(self).backend)