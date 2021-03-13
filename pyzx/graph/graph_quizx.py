# PyZX - Python library for quantum circuit rewriting
#       and optimization using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#   http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# type: ignore

from fractions import Fraction
from typing import Tuple, Dict, Any
from .base import BaseGraph
from ..utils import VertexType, EdgeType, FractionLike, FloatInt

try:
    import libquizx
except ImportError:
    print("quizx bindings not available")
    libquizx = None




class GraphQV(BaseGraph[int,Tuple[int,int]]):
    """Rust implementation of :class:`~graph.base.BaseGraph`, based on quizx::vec_graph::Graph."""
    backend = 'quizx-vec'

    #The documentation of what these methods do
    #can be found in base.BaseGraph
    def __init__(self):
        BaseGraph.__init__(self)
        self._g: Any = libquizx.VecGraph()
        self._vdata: Dict[int,Any] = dict()


    # n.b. we use python iterators to avoid issues with rust lifetimes

    class VIter:
        def __init__(self, g):
            self.v = 0
            self.g = g._g

        def __iter__(self): return self

        def __next__(self):
            v = self.v
            self.v += 1
            if v >= self.g.vindex():
                raise StopIteration
            else:
                if self.g.contains_vertex(v): return v
                else: return next(self)

    class EIter:
        def __init__(self, g, nhd=False):
            self.v = 0
            self.n = 0
            self.g = g._g
            self.nhd = nhd

        def __iter__(self): return self

        def __next__(self):
            if self.v >= self.g.vindex(): raise StopIteration
            if self.g.contains_vertex(self.v):
                if self.n < self.g.degree(self.v):
                    n = self.n
                    self.n += 1
                    v1 = self.g.neighbor_at(self.v, n)
                    if self.nhd:
                        return v1
                    else:
                        if self.v < v1: return (self.v, v1)
                        else: return next(self)

            if self.nhd: raise StopIteration
            self.n = 0
            self.v += 1
            return next(self)

    def vindex(self): return self._g.vindex()

    def depth(self):
        return max((self._g.row(v) for v in self._g.vertices()), default=-1)

    def qubit_count(self):
        return max((self._g.qubit(v)+1 for v in self._g.vertices()), default=-1)

    def add_vertices(self, amount):
        index_before = self._g.vindex()
        for i in range(0, amount):
            self._g.add_vertex(VertexType.BOUNDARY, 0, 0, (0, 1))
        return range(index_before, self._g.vindex())

    # TODO
    # def add_vertex_indexed(self, index):
    #     """Adds a vertex that is guaranteed to have the chosen index (i.e. 'name').
    #     If the index isn't available, raises a ValueError.
    #     This method is used in the editor to support undo, which requires vertices
    #     to preserve their index."""
    #     if index in self.graph: raise ValueError("Vertex with this index already exists")
    #     if index >= self._vindex: self._vindex = index+1
    #     self.graph[index] = dict()
    #     self.ty[index] = VertexType.BOUNDARY
    #     self._phase[index] = 0

    def add_edges(self, edges, edgetype=EdgeType.SIMPLE, smart=False):
        for e in edges:
            self._g.add_edge(e, edgetype)

    def remove_vertices(self, vertices):
        for v in vertices:
            self._g.remove_vertex(v)

    def remove_vertex(self, vertex):
        self._g.remove_vertex(vertex)

    def remove_edges(self, edges):
        for e in edges:
            self._g.remove_edge(e)

    def remove_edge(self, edge):
        self._g.remove_edge(edge)

    def num_vertices(self):
        return self._g.num_vertices()

    def num_edges(self):
        return self._g.num_edges()

    def vertices(self):
        return GraphQV.VIter(self)

    def vertices_in_range(self, start, end):
        """Returns all vertices with index between start and end
        that only have neighbours whose indices are between start and end"""
        for v in self.vertices():
            if not start<v<end: continue
            if all(start<v2<end for v2 in self.graph[v]):
                yield v

    def edges(self):
        return GraphQV.EIter(self)

    #def edges_in_range(self, start, end, safe=False):
    #    """like self.edges, but only returns edges that belong to vertices
    #    that are only directly connected to other vertices with
    #    index between start and end.
    #    If safe=True then it also checks that every neighbour is only connected to vertices with the right index"""
    #    if not safe:
    #        for v0,adj in self.graph.items():
    #            if not (start<v0<end): continue
    #            #verify that all neighbours are in range
    #            if all(start<v1<end for v1 in adj):
    #                for v1 in adj:
    #                    if v1 > v0: yield (v0,v1)
    #                    else:
    #                        for v0,adj in self.graph.items():
    #                            if not (start<v0<end): continue
    #            #verify that all neighbours are in range, and that each neighbour
    #            # is only connected to vertices that are also in range
    #            if all(start<v1<end for v1 in adj) and all(all(start<v2<end for v2 in self.graph[v1]) for v1 in adj):
    #                for v1 in adj:
    #                    if v1 > v0:
    #                        yield (v0,v1)

    def edge(self, s, t):
        return (s,t) if s < t else (t,s)

    def edge_set(self):
        return set(self.edges())

    def edge_st(self, edge):
        return edge

    def vertex_degree(self, vertex):
        return self._g.degree(vertex)

    def neighbors(self, vertex):
        it = GraphQV.EIter(self, nhd=True)
        it.v = vertex
        return it

    def incident_edges(self, vertex):
        return map(
            lambda n: (vertex, n) if vertex < n else (n, vertex),
            self.neighbors(vertex)
        )

    def connected(self,v1,v2):
        return self._g.connected(v1, v2)

    def edge_type(self, e):
        return self._g.edge_type(e)

    def set_edge_type(self, e, t):
        self._g.set_edge_type(e, t)

    def type(self, vertex):
        return self._g.vertex_type(vertex)

    def types(self):
        d = dict()
        for v in self._g.vertices():
            d[v] = self._g.vertex_type(v)
        return d

    def set_type(self, vertex, t):
        self._g.set_vertex_type(vertex, t)

    def phase(self, vertex):
        p = self._g.phase(vertex)
        return Fraction(p[0], p[1])

    def phases(self):
        d = dict()
        for v in self._g.vertices():
            d[v] = self._g.phase(v)
        return d

    def set_phase(self, vertex, phase):
        p = Fraction(phase)
        self._g.set_phase(vertex, (p.numerator, p.denominator))

    def add_to_phase(self, vertex, phase):
        p = Fraction(phase)
        self._g.add_to_phase(vertex, (p.numerator, p.denominator))

    def qubit(self, vertex):
        return self._g.qubit(vertex)

    def qubits(self):
        d = dict()
        for v in self._g.vertices():
            d[v] = self._g.qubit(v)
        return d

    def set_qubit(self, vertex, q):
        self._g.set_qubit(vertex, q)

    def row(self, vertex):
        return self._g.row(vertex)

    def rows(self):
        d = dict()
        for v in self._g.vertices():
            d[v] = self._g.row(v)
        return d

    def set_row(self, vertex, r):
        self._g.set_row(vertex, r)

    def vdata_keys(self, vertex):
        return self._vdata.get(vertex, {}).keys()

    def vdata(self, vertex, key, default=0):
        if vertex in self._vdata:
            return self._vdata[vertex].get(key,default)
        else:
            return default

    def set_vdata(self, vertex, key, val):
        if vertex in self._vdata:
            self._vdata[vertex][key] = val
        else:
            self._vdata[vertex] = {key:val}

