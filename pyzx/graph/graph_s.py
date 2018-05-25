from .base import BaseGraph

class GraphS(BaseGraph):
	'''Base class for the specific Graph classes with the methods that each Graph class should implement'''
	backend = 'simple'

	def __init__(self):
		super().__init__()
		self.graph = dict()
		self.ty = dict()
		self.vindex = 0
		self.nedges = 0

	def add_vertices(self, amount, vertex_data=None):
		for i in range(self.vindex, self.vindex + amount):
			self.graph[i] = dict()
			self.ty[i] = 0
		self.vindex += amount

	def add_vertex(self):
		self.add_vertices(1)

	def add_edges(self, edges, vertex_data=None):
		for s,t in edges:
			self.nedges += 1
			self.graph[s][t] = True
			self.graph[t][s] = True

	def add_edge(self, edge, edge_data=None):
		if edge_data: self.add_edges([edge],[edge_data])
		else: self.add_edges([edge])

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

	def remove_vertex(self, vertex):
		self.remove_vertices([vertex])

	def remove_solo_vertices(self):
		'''Deletes all vertices that are not connected to any other vertex.
		Should be replaced by a faster alternative if available in the backend'''
		self.remove_vertices([v for v in self.vertices() if self.get_vertex_degree(v)==0])

	def remove_edges(self, edges):
		for s,t in edges:
			self.nedges -= 1
			del self.graph[s][t]
			del self.graph[t][s]

	def remove_edge(self, edge):
		self.remove_edge([edge])

	def num_vertices(self):
		return len(self.graph)

	def num_edges(self):
		return self.nedges

	def vertices(self):
		return self.graph.keys()

	# def verts_as_int(self, verts):
	# 	'''Takes a list of vertices and ensures they are represented as integers'''
	# 	raise NotImplementedError("Not implemented on backend" + backend)

	# def vert_as_int(self, vert):
	# 	return self.verts_as_int([vert])[0]

	def edges(self):
		for v0,adj in self.graph.items():
			for v1 in adj:
				if v1 > v0: yield (v0,v1)

	# def edges_as_int(self, edges):
	# 	'''Takes a list of edges and ensures they are represented as integers'''
	# 	raise NotImplementedError("Not implemented on backend" + backend)

	# def edge_as_int(self, edge):
	# 	return self.edges_as_int([edge])[0]

	def edge_set(self):
		'''Returns a set of indices of edges. Should be overloaded if the backend
		supplies a cheaper version than this.'''
		return set(self.edges())

	def edge_st(self, edge):
		return edge

	def get_neighbours(self, vertex):
		return self.graph[vertex].keys()

	def get_vertex_degree(self, vertex):
		return len(self.graph[vertex])

	def get_incident_edges(self, vertex):
		return [(vertex, v1) if v1 > vertex else (v1, vertex) for v1 in self.graph[vertex]]

	def is_connected(self,v1,v2):
		return v2 in self.graph[v1]

	# def is_equal(self,v1,v2):
	# 	'''Returns whether v1 and v2 represent the same vertex'''
	# 	raise NotImplementedError("Not implemented on backend" + backend)

	def get_type(self, vertex):
		return self.ty[vertex]

	def get_types(self):
		return self.ty

	def set_type(self, vertex, t):
		self.ty[vertex] = t