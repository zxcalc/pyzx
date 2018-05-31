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

	def add_vertices(self, amount, vertex_data=None):
		for i in range(self.vindex, self.vindex + amount):
			self.graph[i] = dict()
			self.ty[i] = 0
			self.angle[i] = 0
		self.vindex += amount

	def add_vertex(self):
		self.add_vertices(1)

	def add_edges(self, edges, vertex_data=None):
		'''Takes either a list of (source, target) indices to add,
		or a (source, target):(normal_edge_count, hadamard_edge_count) dictionary'''
		if isinstance(edges, (list,set)):
			for s,t in edges:
				self.nedges += 1
				self.graph[s][t] = 1
				self.graph[t][s] = 1
			return
		if not isinstance(edges, dict):
			raise TypeError("Wrong type of edge list type " + str(type(edges)))
		for (v1,v2),(n1,n2) in edges.items():
			conn_type = self.graph.get(v1,{}).get(v2,0) #check whether they were connected
			if conn_type == 1: n1 += 1 #and add to the relevant edge count
			elif conn_type == 2: n2 += 2
			t1 = self.get_type(v1)
			t2 = self.get_type(v2)
			if t1 == t2: 		#types are equal, 
				n1 = bool(n1) 	#so normal edges fuse
				n2 = n2%2 		#while hadamard edges go modulo 2
				if n1 and n2:	#reduction rule for when both edges appear
					new_type = 1
					self.add_angle(v1,1) #add pi phase to one of the nodes
				else: new_type = 1 if n1 else (2 if n2 else 0)
			else:				#types are different
				n1 = n1%2		#so normal edges go modulo 2
				n2 = bool(n2)	#while hadamard edges fuse
				if n1 and n2:	#reduction rule for when both edges appear
					new_type = 2
					self.add_angle(v1,1) #add pi phase to one of the nodes
				else: new_type = 1 if n1 else (2 if n2 else 0)
			if new_type: #They are connected, so update the graph
				self.graph[s][t] = new_type
				self.graph[t][s] = new_type
				if not conn_type: self.nedges += 1 #they didn't used to be connected
			elif conn_type: #They were connected, but not anymore, so update the graph
				del self.graph[s][t]
				del self.graph[t][s]
				self.nedges -= 1

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
		return self.graph[v1][v2]

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