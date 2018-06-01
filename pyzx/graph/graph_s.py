from fractions import Fraction
from .base import BaseGraph

class GraphS(BaseGraph):
	'''Base class for the specific Graph classes with the methods that each Graph class should implement'''
	backend = 'simple'

	def __init__(self):
		self.graph = dict()
		self.ty = dict()
		self.angle = dict()
		self.vdata = dict()
		self.vindex = 0
		self.nedges = 0

	def add_vertices(self, amount):
		for i in range(self.vindex, self.vindex + amount):
			self.graph[i] = dict()
			self.ty[i] = 0
			self.angle[i] = 0
		self.vindex += amount

	def add_vertex(self):
		self.add_vertices(1)

	def add_edges(self, edges, edgetype=1):
		'''Adds a list of (source,target) edges'''
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
			self.vdata.pop(v,None)
			del self.angle[v]

	def remove_vertex(self, vertex):
		self.remove_vertices([vertex])

	def remove_solo_vertices(self):
		'''Deletes all vertices that are not connected to any other vertex.'''
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

	def edges(self):
		for v0,adj in self.graph.items():
			for v1 in adj:
				if v1 > v0: yield (v0,v1)

	def edge(self, s, t):
		return (s,t) if s < t else (t,s)

	def edge_set(self):
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

	def get_edge_type(self, v1,v2):
		return self.graph.get(v1,{}).get(v2,0)

	def get_type(self, vertex):
		return self.ty[vertex]

	def get_types(self):
		return self.ty

	def set_type(self, vertex, t):
		self.ty[vertex] = t

	def get_vdata(self, v, key, default=0):
		if v in self.vdata:
			return self.vdata[v].get(key,default)
		else:
			return default

	def set_vdata(self, v, key, val):
		if v in self.vdata:
			self.vdata[v][key] = val
		else:
			self.vdata[v] = {key:val}

	def get_angle(self, vertex):
		return self.angle.get(vertex,Fraction(1))

	def set_angle(self, vertex, angle):
		self.angle[vertex] = angle % 2

	def add_angle(self, vertex, angle):
		self.angle[vertex] = (self.angle.get(vertex,Fraction(1)) + angle) % 2

	def get_angles(self):
		return self.angle