import igraph as ig

from .base import BaseGraph

class GraphIG(BaseGraph):
	backend = 'igraph'
	def __init__(self):
		self.graph = ig.Graph(directed=False)
		self.graph.vs['_a'] = None
		self.graph.vs['_t'] = None
		self.graph.es['_t'] = None

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

	def edge(self, s, t):
		return self.graph.es[s,t][0].index

	def edge_set(self):
		return set(range(len(self.graph.es)))

	def edge_st(self, edge):
		edge = self.graph.es[edge]
		return (edge.source, edge.target)

	def edge_s(self, edge):
		edge = self.graph.es[edge]
		return edge.source

	def edge_t(self, edge):
		edge = self.graph.es[edge]
		return edge.target

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

	def get_type(self, v):
		t = self.graph.vs[v]['_t']
		return t if t != None else 0

	def get_types(self):
		return self.graph.vs['_t']

	def set_type(self, v, t):
		self.graph.vs[v]['_t'] = t

	def get_vdata_keys(self, v):
		return [a for a in self.graph.vertex_attributes() if a != '_a' and a != '_t']

	def get_vdata(self, v, key, default=0):
		try:
			val = self.graph.vs[v][key]
			if not val: val = default
		except KeyError:
			val = default
		return val

	def set_edge_type(self, e, t):
		self.graph.es[e]['_t'] = t

	def get_edge_type(self, e):
		t = self.graph.es[e]['_t']
		return 1 if t == None else t

	def set_vdata(self, v, key, val):
		self.graph.vs[v][key] = val

	def get_angle(self, vertex):
		a = self.graph.vs[vertex]['_a']
		return a if a != None else 0

	def set_angle(self, vertex, angle):
		self.graph.vs[vertex]['_a'] = angle % 2

	def get_angles(self):
		return [a if a != None else 0 for a in self.graph.vs['_a']]