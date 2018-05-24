import graph_tool.all as gt

from .base import BaseGraph

class GraphGT(BaseGraph):
	backend = 'graph_tool'
	def __init__(self):
		super().__init__(self)
		self.graph = gt.Graph(directed=False)
		self.graph.set_fast_edge_removal()
    	self.graph.vp.type = self.graph.new_vertex_property('int')

    def add_vertices(self, amount, vertex_data=None):
		self.graph.add_vertex(amount)

	def add_edges(self, edges, vertex_data=None):
		self.graph.add_edge_list(edges)

	def remove_vertices(self, vertices):
		for v in reversed(sorted(vertices)):
			self.graph.remove_vertex(v,fast=True)

	def remove_vertex(self, vertex):
		self.graph.remove_vertex(v)

	def remove_edges(self, edges):
		for e in edges:
			self.graph.remove_edge(e)

	def vertices(self):
		'''Iterator over all the vertices'''
		return self.graph.vertices()

	def edges(self):
		'''Iterator over all the edges'''
		return self.graph.edges()

	def edge_st(self, edge):
		'''Returns a tuple of source/target of the given edge'''
		return (edge.source(), edge.target())

	def get_neighbours(self, vertex):
		'''Returns a tuple of source/target of the given edge'''
		return vertex.all_neighbors()

	def get_incident_edges(self, vertex):
		return vertex.all_edges()

	def is_connected(self,v1,v2):
		return bool(self.graph.edge(v1, 2))

	def get_type(self, vertex):
		return self.graph.vp.type[vertex]

	def set_type(self, vertex, t):
		self.graph.vp.type[vertex] = t