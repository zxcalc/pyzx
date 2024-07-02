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

import itertools
from collections import Counter
from fractions import Fraction
from typing import Tuple, Dict, Set, Any

from .base import BaseGraph

from ..utils import VertexType, EdgeType, FractionLike, FloatInt, vertex_is_zx_like, vertex_is_z_like, set_z_box_label, get_z_box_label

class Edge:
    """A structure for storing the number of simple and number of Hadamard edges
    between two vertices"""
    s: int
    h: int
    w_io: int

    def __init__(self, s: int=0, h: int=0, w_io: int=0):
        self.s = s
        self.h = h
        self.w_io = w_io

    def add(self, s: int=0, h: int=0, w_io: int=0):
        self.s += s
        self.h += h
        self.w_io += w_io
        if self.s < 0 or self.h < 0:
            raise ValueError('Cannot have negative edges')
        if self.w_io not in (0,1):
            raise ValueError('Invalid number of W-IO edges')
        if self.w_io == 1 and self.s + self.h > 0:
            raise ValueError('Cannot have W-IO edge and other edges')

    def remove(self, s: int=0, h: int=0, w_io: int=0):
        self.add(s=-s, h=-h, w_io=-w_io)

    def is_empty(self) -> bool:
        return self.s == 0 and self.h == 0 and self.w_io == 0

    def get_edge_count(self, ty: EdgeType) -> int:
        if ty == EdgeType.SIMPLE: return self.s
        elif ty == EdgeType.HADAMARD: return self.h
        else: return self.w_io

class Multigraph(BaseGraph[int,Tuple[int,int,EdgeType]]):
    """Purely Pythonic multigraph implementation of :class:`~graph.base.BaseGraph`."""
    backend = 'multigraph'

    #The documentation of what these methods do
    #can be found in base.BaseGraph
    def __init__(self) -> None:
        BaseGraph.__init__(self)
        self.graph: Dict[int,Dict[int,Edge]]   = dict()
        self._auto_simplify: bool                       = True
        self._vindex: int                               = 0
        self.nedges: int                                = 0
        self.ty: Dict[int,VertexType]              = dict()
        self._phase: Dict[int, FractionLike]            = dict()
        self._qindex: Dict[int, FloatInt]               = dict()
        self._maxq: FloatInt                            = -1
        self._rindex: Dict[int, FloatInt]               = dict()
        self._maxr: FloatInt                            = -1
        self._grounds: Set[int]                         = set()

        self._vdata: Dict[int,Any]                      = dict()
        self._inputs: Tuple[int, ...]                   = tuple()
        self._outputs: Tuple[int, ...]                  = tuple()

    def clone(self) -> 'Multigraph':
        cpy = Multigraph()
        for v, d in self.graph.items():
            cpy.graph[v] = d.copy()
        cpy._vindex = self._vindex
        cpy.nedges = self.nedges
        cpy.ty = self.ty.copy()
        cpy._phase = self._phase.copy()
        cpy._qindex = self._qindex.copy()
        cpy._maxq = self._maxq
        cpy._rindex = self._rindex.copy()
        cpy._maxr = self._maxr
        cpy._vdata = self._vdata.copy()
        cpy.scalar = self.scalar.copy()
        cpy._inputs = tuple(list(self._inputs))
        cpy._outputs = tuple(list(self._outputs))
        cpy.track_phases = self.track_phases
        cpy.phase_index = self.phase_index.copy()
        cpy.phase_master = self.phase_master
        cpy.phase_mult = self.phase_mult.copy()
        cpy.max_phase_index = self.max_phase_index
        return cpy

    def set_auto_simplify(self, s: bool):
        """Automatically remove parallel edges as edges are added"""
        self._auto_simplify = s

    def multigraph(self):
        return False

    def vindex(self): return self._vindex
    def depth(self):
        if self._rindex: self._maxr = max(self._rindex.values())
        else: self._maxr = -1
        return self._maxr
    def qubit_count(self):
        if self._qindex: self._maxq = max(self._qindex.values())
        else: self._maxq = -1
        return self._maxq + 1

    def inputs(self):
        return self._inputs

    def num_inputs(self):
        return len(self._inputs)

    def set_inputs(self, inputs):
        self._inputs = inputs

    def outputs(self):
        return self._outputs

    def num_outputs(self):
        return len(self._outputs)

    def set_outputs(self, outputs):
        self._outputs = outputs

    def add_vertices(self, amount):
        for i in range(self._vindex, self._vindex + amount):
            self.graph[i] = dict()
            self.ty[i] = VertexType.BOUNDARY
            self._phase[i] = 0
        self._vindex += amount
        return range(self._vindex - amount, self._vindex)
    def add_vertex_indexed(self, v):
        """Adds a vertex that is guaranteed to have the chosen index (i.e. 'name').
        If the index isn't available, raises a ValueError.
        This method is used in the editor to support undo, which requires vertices
        to preserve their index."""
        if v in self.graph: raise ValueError("Vertex with this index already exists")
        if v >= self._vindex: self._vindex = v+1
        self.graph[v] = dict()
        self.ty[v] = VertexType.BOUNDARY
        self._phase[v] = 0

    def add_edges(self, edge_pairs, edgetype=EdgeType.SIMPLE):
        for ep in edge_pairs: self.add_edge(ep, edgetype)

    def add_edge(self, edge_pair, edgetype=EdgeType.SIMPLE):
        self.nedges += 1
        s,t = edge_pair
        if not t in self.graph[s]:
            e = Edge()
            self.graph[s][t] = e
            self.graph[t][s] = e
        else:
            e = self.graph[s][t]

        if edgetype == EdgeType.SIMPLE: e.add(s=1)
        elif edgetype == EdgeType.HADAMARD: e.add(h=1)
        else: e.add(w_io=1)

        if self._auto_simplify:
            t1 = self.ty[s]
            t2 = self.ty[t]
            if (vertex_is_zx_like(t1) and vertex_is_zx_like(t2)):
                if s == t: # turn self-loops in pi phases
                    e.s = 0
                    if e.h % 2 == 1:
                        if t1 == VertexType.Z_BOX:
                            set_z_box_label(self, s, get_z_box_label(self, s) * -1)
                        else:
                            self.add_to_phase(s, 1)
                    self.scalar.add_power(-e.h)
                    e.h = 0
                else: # apply spider and hopf to merge/cancel parallel edges
                    if t1 == t2:
                        e.s = 1 if e.s > 0 else 0
                        self.scalar.add_power(-2 * (e.h - (e.h % 2)))
                        e.h = e.h % 2
                    else:
                        e.h = 1 if e.h > 0 else 0
                        self.scalar.add_power(-2 * (e.s - (e.s % 2)))
                        e.s = e.s % 2
            if e.is_empty():
                del self.graph[s][t]
                del self.graph[t][s]

        return (s,t, edgetype) if s <= t else (t,s,edgetype)

    def remove_vertices(self, vertices):
        for v in vertices:
            vs = list(self.graph[v])
            # remove all edges
            for v1 in vs:
                e = self.graph[v][v1]
                self.nedges -= e.s + e.h
                del self.graph[v][v1]
                if v != v1: del self.graph[v1][v]
            # remove the vertex
            del self.graph[v]
            del self.ty[v]
            del self._phase[v]
            if v in self._inputs:
                self._inputs = tuple(u for u in self._inputs if u != v)
            if v in self._outputs:
                self._outputs = tuple(u for u in self._outputs if u != v)
            try: del self._qindex[v]
            except: pass
            try: del self._rindex[v]
            except: pass
            try: del self.phase_index[v]
            except: pass
            self._grounds.discard(v)
            self._vdata.pop(v,None)
        self._vindex = max(self.vertices(),default=0) + 1

    def remove_vertex(self, vertex):
        self.remove_vertices([vertex])

    def remove_edges(self, edges):
        for e in edges:
            self.remove_edge(e)

    def remove_edge(self, edge):
        s,t,ty = edge
        e = self.graph[s][t]
        if ty == EdgeType.SIMPLE: e.remove(s=1)
        elif ty == EdgeType.HADAMARD: e.remove(h=1)
        else: e.remove(w_io=1)

        if e.is_empty():
            del self.graph[s][t]
            if s != t: del self.graph[t][s]

        self.nedges -= 1

    def num_vertices(self):
        return len(self.graph)

    def num_edges(self):
        return self.nedges
        #return len(self.edge_set())

    def vertices(self):
        return self.graph.keys()

    def vertices_in_range(self, start, end):
        """Returns all vertices with index between start and end
        that only have neighbours whose indices are between start and end"""
        for v in self.graph.keys():
            if not start<v<end: continue
            if all(start<v2<end for v2 in self.graph[v]):
                yield v

    def edges(self, s=None, t=None):
        if s == None:
            for v0,adj in self.graph.items():
                for v1, e in adj.items():
                    if v1 >= v0:
                        for _ in range(e.s): yield (v0, v1, EdgeType.SIMPLE)
                        for _ in range(e.h): yield (v0, v1, EdgeType.HADAMARD)
                        for _ in range(e.w_io): yield (v0, v1, EdgeType.W_IO)
        elif t != None:
            s, t = (s, t) if s < t else (t, s)
            e = self.graph[s][t]
            for _ in range(e.s): yield (s, t, EdgeType.SIMPLE)
            for _ in range(e.h): yield (s, t, EdgeType.HADAMARD)
            for _ in range(e.w_io): yield (s, t, EdgeType.W_IO)

    # def edges_in_range(self, start, end, safe=False):
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
    #    else:
    #        for v0,adj in self.graph.items():
    #            if not (start<v0<end): continue
    #            #verify that all neighbours are in range, and that each neighbour
    #            # is only connected to vertices that are also in range
    #            if all(start<v1<end for v1 in adj) and all(all(start<v2<end for v2 in self.graph[v1]) for v1 in adj):
    #                for v1 in adj:
    #                    if v1 > v0:
    #                        yield (v0,v1)

    def edge(self, s, t):
        return (s,t) if s < t else (t,s)

    def edge_set(self):
        return Counter(self.edges())

    def edge_st(self, edge):
        return (edge[0], edge[1])

    def neighbors(self, vertex):
        return self.graph[vertex].keys()

    def vertex_degree(self, vertex):
        d = 0
        for e in self.graph[vertex].values():
            d += e.s
            d += e.h
        return d

    def incident_edges(self, vertex):
        return list(itertools.chain.from_iterable(
            self.edges(vertex, v1) for v1 in self.graph[vertex]
        ))

    def connected(self,v1,v2):
        return v2 in self.graph[v1]

    def edge_type(self, e):
        if len(e) == 2:
            edges = list(self.edges(e[0],e[1]))
            if len(edges) > 1:
                # if all edges are of the same type, return that type
                if all(e[2] == edges[0][2] for e in edges):
                    return edges[0][2]
                else:
                    raise ValueError('Cannot determine edge type')
            e = edges[0]
        return e[2]

    def set_edge_type(self, edge, t):
        v1,v2,ty = edge
        if ty != t:
            e = self.graph[v1][v2]
            # decrement the old type and increment the new type
            if ty == EdgeType.SIMPLE: e.add(s=-1)
            elif ty == EdgeType.HADAMARD: e.add(h=-1)
            else: e.add(w_io=-1)
            if t == EdgeType.SIMPLE: e.add(s=1)
            elif t == EdgeType.HADAMARD: e.add(h=1)
            else: e.add(w_io=1)

    def type(self, vertex):
        return self.ty[vertex]
    def types(self):
        return self.ty
    def set_type(self, vertex, t):
        self.ty[vertex] = t

    def phase(self, vertex):
        return self._phase.get(vertex,Fraction(1))
    def phases(self):
        return self._phase
    def set_phase(self, vertex, phase):
        try:
            self._phase[vertex] = Fraction(phase) % 2
        except Exception:
            self._phase[vertex] = phase
    def add_to_phase(self, vertex, phase):
        old_phase = self._phase.get(vertex, Fraction(1))
        try:
            self._phase[vertex] = (old_phase + Fraction(phase)) % 2
        except Exception:
            self._phase[vertex] = old_phase + phase
    def qubit(self, vertex):
        return self._qindex.get(vertex,-1)
    def qubits(self):
        return self._qindex
    def set_qubit(self, vertex, q):
        if q > self._maxq: self._maxq = q
        self._qindex[vertex] = q

    def row(self, vertex):
        return self._rindex.get(vertex, -1)
    def rows(self):
        return self._rindex
    def set_row(self, vertex, r):
        if r > self._maxr: self._maxr = r
        self._rindex[vertex] = r

    def is_ground(self, vertex):
        return vertex in self._grounds
    def grounds(self):
        return self._grounds
    def set_ground(self, vertex, flag=True):
        if flag:
            self._grounds.add(vertex)
        else:
            self._grounds.discard(vertex)

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
