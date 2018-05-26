from . import *

class BaseGraph(object):
	'''Base class for the specific Graph classes with the methods that each Graph class should implement'''
	backend = 'None'

	def __str__(self):
		return "Graph({} vertices, {} edges)".format(
			    str(self.num_vertices()),str(self.num_edges()))

	def __repr__(self):
		return str(self)

	def copy(self, backend=None):
		'''Create a copy of the graph, with the given backend. Note the
		copy will have consecutive vertex indices, even if the original
		graph did not.
		'''
		if (backend == None):
			backend = type(self).backend
		g = Graph(backend = backend)

		g.add_vertices(self.num_vertices())
		ty = self.get_types()
		vtab = dict()
		i = 0
		for v in self.vertices():
			vtab[v] = i
			g.set_type(i, ty[v])
			i += 1
		g.add_edges([(vtab[self.edge_s(e)], vtab[self.edge_t(e)]) for e in self.edges()])
		return g


	def add_vertices(self, amount, vertex_data=None):
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def add_vertex(self):
		self.add_vertices(1)

	def add_edges(self, edges, vertex_data=None):
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def add_edge(self, edge, edge_data=None):
		if edge_data: self.add_edges([edge],[edge_data])
		else: self.add_edges([edge])

	def remove_vertices(self, vertices):
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def remove_vertex(self, vertex):
		self.remove_vertices([vertex])

	def remove_solo_vertices(self):
		'''Deletes all vertices that are not connected to any other vertex.
		Should be replaced by a faster alternative if available in the backend'''
		self.remove_vertices([v for v in self.vertices() if self.get_vertex_degree(v)==0])

	def remove_edges(self, edges):
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def remove_edge(self, edge):
		self.remove_edge([edge])

	def num_vertices(self):
		'''Returns the amount of vertices in the graph'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def num_edges(self):
		'''Returns the amount of edges in the graph'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def vertices(self):
		'''Iterator over all the vertices'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	# def verts_as_int(self, verts):
	# 	'''Takes a list of vertices and ensures they are represented as integers'''
	# 	raise NotImplementedError("Not implemented on backend " + type(self).backend)

	# def vert_as_int(self, vert):
	# 	return self.verts_as_int([vert])[0]

	def edges(self):
		'''Iterator that returns all the edge objects'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	# def edges_as_int(self, edges):
	# 	'''Takes a list of edges and ensures they are represented as integers'''
	# 	raise NotImplementedError("Not implemented on backend " + type(self).backend)

	# def edge_as_int(self, edge):
	# 	return self.edges_as_int([edge])[0]

	def edge_set(self):
		'''Returns the edges as a set. Should be overloaded if the backend
		supplies a cheaper version than this.'''
		return set(self.edges_as_int(self.edges()))

	def edge(self, s, t):
		'''Returns the edge with the given source/target'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def edge_st(self, edge):
		'''Returns a tuple of source/target of the given edge.'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def edge_s(self, edge):
		'''Returns the source of the given edge.'''
		return self.edge_st()[0]

	def edge_t(self, edge):
		'''Returns the target of the given edge.'''
		return self.edge_st()[1]

	def get_neighbours(self, vertex):
		'''Returns all neighbouring vertices of the given vertex'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def get_vertex_degree(self, vertex):
		'''Returns the degree of the given vertex'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def get_incident_edges(self, vertex):
		'''Returns all neighbouring edges of the given vertex.
		These should be integers'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def is_connected(self,v1,v2):
		'''Returns whether there v1 and v2 share an edge'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	# def is_equal(self,v1,v2):
	# 	'''Returns whether v1 and v2 represent the same vertex'''
	# 	raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def get_type(self, vertex):
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def get_types(self):
		'''Should return a list/dictionary/numpy.array such that the indices correspond
		to the vertices and return the types'''
		raise NotImplementedError("Not implemented on backend " + type(self).backend)

	def set_type(self, vertex, t):
		raise NotImplementedError("Not implemented on backend" + type(self).backend)

	# def add_attribute(self, attrib_name, default=0):
	# 	raise NotImplementedError("Not implemented on backend" + type(self).backend)

	def get_vdata(self, vertex, key, default=0):
		raise NotImplementedError("Not implemented on backend" + type(self).backend)

	def set_vdata(self, vertex, key, val):
		raise NotImplementedError("Not implemented on backend" + type(self).backend)