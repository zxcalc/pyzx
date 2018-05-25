import igraph as ig

from .base import BaseGraph

class GraphIG(BaseGraph):
	backend = 'igraph'
	def __init__(self):
		super().__init__()
		self.graph = ig.Graph()

	def add_vertices(self, amount, vertex_data=None):
		self.graph.add_vertices(amount)

	def add_edges(self, edges, edge_data=None):
		self.graph.add_edges(edges)

	def remove_vertices(self, vertices):
		self.graph.delete_vertices(vertices)

	def remove_solo_vertices(self):
		self.graph.vs.select(_degree=0).delete()

	def remove_edges(self, edges):
		self.graph.delete_edges(edges)

	def num_vertices(self):
		return len(self.graph.vs)

	def num_edges(self):
		return len(self.graph.es)

	def vertices(self):
		'''Iterator over all the vertices'''
		return range(len(self.graph.vs))

	# def verts_as_int(self, verts):
	# 	return [(v if isinstance(v,int) else v.index) for v in verts]

	def edges(self):
		'''Iterator over all the edges'''
		return range(len(self.graph.es))

	def edge_set(self):
		return set(range(len(self.graph.es)))

	def edge_st(self, edge):
		'''Returns a tuple of source/target of the given edge'''
		edge = self.graph.es[edge]
		return (edge.source, edge.target)
		if type(edge)==int:
			edge = self.graph.es[edge]
		return (edge.source, edge.target)


	def get_neighbours(self, vertex):
		'''Returns a tuple of source/target of the given edge'''
		#if isinstance(vertex, int): 
		return self.graph.neighbors(vertex)
		#return vertex.neighbors()

	def get_vertex_degree(self, vertex):
		'''Returns all neighbouring vertices of the given vertex'''
		return self.graph.degree(vertex)

	def get_incident_edges(self, vertex):
		return self.graph.incident(vertex, mode=ig.ALL)

	def is_connected(self,v1,v2):
		return self.graph.are_connected(v1,v2)

	# def is_equal(self,v1,v2):
	# 	'''Returns whether v1 and v2 represent the same vertex'''
	# 	return v1 == v2
	# 	if isinstance(v1,int):
	# 		if isinstance(v2,int):
	# 			return v1 == v2
	# 		return v1 == v2.index
	# 	if isinstance(v2,int):
	# 		return v1.index == v2
	# 	return v1.index == v2.index

	def get_type(self, v):
		return self.graph.vs[v]['t']
		#if isinstance(v, int):
		#	return self.graph.vs[v]['t']
		#else:
		#	return v['t']

	def get_types(self):
		return self.graph.vs['t']

	def set_type(self, v, t):
		self.graph.vs[v]['t'] = t
		#if isinstance(v, int):
		#	self.graph.vs[v]['t'] = t
		#else:
		#	v['t'] = t