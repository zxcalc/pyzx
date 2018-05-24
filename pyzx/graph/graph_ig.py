import igraph as ig

from .base import BaseGraph

class GraphGT(BaseGraph):
	backend = 'igraph'
	def __init__(self):
		super().__init__(self)
		self.graph = ig.Graph()

    def add_vertices(self, amount, vertex_data=None):
		self.graph.add_vertices(amount)

	def add_edges(self, edges, vertex_data=None):
		self.graph.add_edges(edges)

	def remove_vertices(self, vertices):
		self.graph.delete_vertices(vertices)

	def remove_solo_vertices(self):
		self.graph.vs.select(_degree=0).delete()

	def remove_edges(self, edges):
		self.graph.delete_edges(edges)

	def vertices(self):
		'''Iterator over all the vertices'''
		return self.graph.vertices()

	def edges(self):
		'''Iterator over all the edges'''
		return self.graph.edges()

	def edge_st(self, edge):
		'''Returns a tuple of source/target of the given edge'''
		return (edge.source, edge.target)

	def get_neighbours(self, vertex):
		'''Returns a tuple of source/target of the given edge'''
		return vertex.neighbors()

	def get_incident_edges(self, vertex):
		return self.graph.incident(vertex, mode=ig.ALL)

	def is_connected(self,v1,v2):
		return self.graph.are_connected(v1,v2)

	def get_type(self, v):
        if isinstance(v, int):
            return self.graph.vs[v]['t']
        else:
            return v['t']

	def set_type(self, v, t):
        if isinstance(v, int):
            self.graph.vs[v]['t'] = t
        else:
            v['t'] = t

    