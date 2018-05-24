class BaseGraph(object):
	'''Base class for the specific Graph classes with the methods that each Graph class should implement'''
	backend = 'None'
	def __init__(self):
		self.raw = None

	def add_vertices(self, amount, vertex_data=None):
		raise NotImplementedError("Not implemented on backend" + backend)

	def add_vertex(self):
		self.add_vertices(1)

	def add_edges(self, edges, vertex_data=None):
		raise NotImplementedError("Not implemented on backend" + backend)

	def add_edge(self, edge, edge_data=None):
		if edge_data: self.add_edges([edge],[edge_data])
	else: self.add_edges([edge])

	def remove_vertices(self, vertices):
		raise NotImplementedError("Not implemented on backend" + backend)

	def remove_vertex(self, vertex):
		self.remove_vertices([vertex])

	def remove_solo_vertices(self):
		'''Deletes all vertices that are not connected to any other vertex'''
		raise NotImplementedError("Not implemented on backend" + backend)

	def remove_edges(self, edges):
		raise NotImplementedError("Not implemented on backend" + backend)

	def remove_edge(self, edge):
		self.remove_edge([edge])

	def vertices(self):
		'''Iterator over all the vertices'''
		raise NotImplementedError("Not implemented on backend" + backend)

	def edges(self):
		'''Iterator over all the edges'''
		raise NotImplementedError("Not implemented on backend" + backend)

	def edge_st(self, edge):
		'''Returns a tuple of source/target of the given edge'''
		raise NotImplementedError("Not implemented on backend" + backend)

	def get_neighbours(self, vertex):
		'''Returns all neighbouring vertices of the given vertex'''
		raise NotImplementedError("Not implemented on backend" + backend)

	def get_incident_edges(self, vertex):
		'''Returns all neighbouring edges of the given vertex'''
		raise NotImplementedError("Not implemented on backend" + backend)

	def is_connected(self,v1,v2):
		'''Returns whether there v1 and v2 share an edge'''
		raise NotImplementedError("Not implemented on backend" + backend)

	def get_type(self, vertex):
		raise NotImplementedError("Not implemented on backend" + backend)

	def set_type(self, vertex, t):
		raise NotImplementedError("Not implemented on backend" + backend)