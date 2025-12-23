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

from fractions import Fraction
from typing import Optional, Tuple, Dict, Set, Any

from .base import BaseGraph

from ..utils import VertexType, EdgeType, FractionLike, FloatInt, vertex_is_zx_like, vertex_is_z_like, set_z_box_label, get_z_box_label

class GraphS(BaseGraph[int,Tuple[int,int]]):
    """Purely Pythonic implementation of :class:`~graph.base.BaseGraph`."""
    backend = 'simple'

    #The documentation of what these methods do
    #can be found in base.BaseGraph
    def __init__(self) -> None:
        BaseGraph.__init__(self)
        self.graph: Dict[int,Dict[int,EdgeType]]   = dict()
        self._vindex: int                               = 0
        self.nedges: int                                = 0
        self.ty: Dict[int,VertexType]              = dict()
        self._phase: Dict[int, FractionLike]            = dict()
        self._qindex: Dict[int, FloatInt]               = dict()
        self._maxq: FloatInt                            = -1
        self._rindex: Dict[int, FloatInt]               = dict()
        self._maxr: FloatInt                            = -1
        self._grounds: Set[int] = set()

        self._vdata: Dict[int,Any]                      = dict()
        self._edata: Dict[Tuple[int,int],Any] = dict()
        self._inputs: Tuple[int, ...]                   = tuple()
        self._outputs: Tuple[int, ...]                  = tuple()

    def clone(self) -> 'GraphS':
        cpy = GraphS()
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
        for s,t in edge_pairs:
            self.nedges += 1
            self.graph[s][t] = edgetype
            self.graph[t][s] = edgetype
    
    def add_edge(self, edge_pair, edgetype=EdgeType.SIMPLE):
        s,t = edge_pair
        t1 = self.ty[s]
        t2 = self.ty[t]
        if s == t:
            if not vertex_is_zx_like(t1) or not vertex_is_zx_like(t2):
                raise ValueError(f'Unexpected vertex type, it should be either z or x because you are trying to add a self-loop')
            if edgetype==EdgeType.SIMPLE:
                return edge_pair
            elif edgetype==EdgeType.HADAMARD:
                self.add_to_phase(s, 1)
                return edge_pair
            else:
                raise ValueError(f'The edge you are adding is not an accepted type')
                
        if not t in self.graph[s]:
            self.nedges += 1
            self.graph[s][t] = edgetype
            self.graph[t][s] = edgetype
        else:
            if (vertex_is_zx_like(t1) and vertex_is_zx_like(t2)):
                et1 = self.graph[s][t]

                # set the roles of simple or hadamard edges, depending on whether the colours match
                if vertex_is_z_like(t1) == vertex_is_z_like(t2): # same colour
                    fuse, hopf = (EdgeType.SIMPLE, EdgeType.HADAMARD)
                else:
                    fuse, hopf = (EdgeType.HADAMARD, EdgeType.SIMPLE)

                # handle parallel edges for all possible combinations of fuse/hopf type edges
                if edgetype == fuse and et1 == fuse:
                    pass # no-op
                elif ((edgetype == fuse and et1 == hopf) or (edgetype == hopf and et1 == fuse)):
                    # ensure the remaining edge is 'fuse' type
                    self.set_edge_type((s,t), fuse)
                    # add a pi phase to one of the neighbours
                    if t1 == VertexType.Z_BOX:
                        set_z_box_label(self, s, get_z_box_label(self, s) * -1)
                    else:
                        self.add_to_phase(s, 1)
                    self.scalar.add_power(-1)
                elif edgetype == hopf and et1 == hopf:
                    # remove the edge (reducing mod 2)
                    self.remove_edge((s,t))
                    self.scalar.add_power(-2)
                else:
                    raise ValueError(f'Got unexpected edge types: {t1}, {t2}')
            else:
                if (vertex_is_z_like(t1) and t2 == VertexType.H_BOX) or (vertex_is_z_like(t2) and t1 == VertexType.H_BOX):
                    if edgetype == EdgeType.SIMPLE: return edge_pair # Parallel simple edges between Z and H-boxes just reduce to a single edge
                raise ValueError(f'Attempted to add unreducible parallel edge {edge_pair}, types: {t1}, {t2}')


        return edge_pair

    def remove_vertices(self, vertices):
        for v in vertices:
            vs = list(self.graph[v])
            # remove all edges
            for v1 in vs:
                if v1 == v:
                    continue
                self.nedges -= 1
                del self.graph[v][v1]
                del self.graph[v1][v]
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
        for s,t in edges:
            if s == t:
                continue
            self.nedges -= 1
            del self.graph[s][t]
            del self.graph[t][s]
            self._edata.pop((s, t), None)

    def remove_edge(self, edge):
        self.remove_edges([edge])

    def num_vertices(self):
        return len(self.graph)

    def num_edges(self, s=None, t=None, et=None):
        if s is not None and t is not None:
            if self.connected(s, t):
                if et is not None:
                    if self.edge_type((s, t)) == et:
                        return 1
                    else:
                        return 0
                else:
                    return 1
            else:
                return 0
        elif s is not None:
            return self.vertex_degree(s)
        else:
            return len(list(self.edges()))

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
        if s is not None and t is not None:
            if self.connected(s, t):
                yield (s,t) if s < t else (t,s)
        elif s is not None:
            for t in self.graph[s]:
                yield (s,t) if s < t else (t,s)
        else:
            for v0,adj in self.graph.items():
                for v1 in adj:
                    if v1 > v0: yield (v0,v1)

    def edges_in_range(self, start, end, safe=False):
        """like self.edges, but only returns edges that belong to vertices
        that are only directly connected to other vertices with
        index between start and end.
        If safe=True then it also checks that every neighbour is only connected to vertices with the right index"""
        if not safe:
            for v0,adj in self.graph.items():
                if not (start<v0<end): continue
                #verify that all neighbours are in range
                if all(start<v1<end for v1 in adj):
                    for v1 in adj:
                        if v1 > v0: yield (v0,v1)
        else:
            for v0,adj in self.graph.items():
                if not (start<v0<end): continue
                #verify that all neighbours are in range, and that each neighbour
                # is only connected to vertices that are also in range
                if all(start<v1<end for v1 in adj) and all(all(start<v2<end for v2 in self.graph[v1]) for v1 in adj):
                    for v1 in adj:
                        if v1 > v0:
                            yield (v0,v1)

    def edge(self, s, t):
        return (s,t) if s < t else (t,s)
    def edge_set(self):
        return set(self.edges())
    def edge_st(self, edge):
        return edge

    def neighbors(self, vertex):
        return self.graph[vertex].keys()

    def vertex_degree(self, vertex):
        return len(self.graph[vertex])

    def incident_edges(self, vertex):
        return [(vertex, v1) if v1 > vertex else (v1, vertex) for v1 in self.graph[vertex]]

    def connected(self,v1,v2):
        return v2 in self.graph[v1]

    def edge_type(self, e):
        v1,v2 = e
        try:
            return self.graph[v1][v2]
        except KeyError:
            return 0

    def set_edge_type(self, e, t):
        v1,v2 = e
        self.graph[v1][v2] = t
        self.graph[v2][v1] = t

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
            self._phase[vertex] = phase % 2
        except Exception:
            self._phase[vertex] = phase
    def add_to_phase(self, vertex, phase):
        old_phase = self._phase.get(vertex, Fraction(1))
        try:
            self._phase[vertex] = (old_phase + phase) % 2
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

    def clear_vdata(self, vertex):
        if vertex in self._vdata:
            del self._vdata[vertex]
    def vdata_keys(self, vertex):
        return self._vdata.get(vertex, {}).keys()
    def vdata(self, vertex, key, default=None):
        if vertex in self._vdata:
            return self._vdata[vertex].get(key,default)
        else:
            return default
    def set_vdata(self, vertex, key, val):
        if vertex in self._vdata:
            self._vdata[vertex][key] = val
        else:
            self._vdata[vertex] = {key:val}

    def clear_edata(self, edge):
        self._edata.pop(edge, None)
    def edata_keys(self, edge):
        return self._edata.get(edge, {}).keys()
    def edata(self, edge, key, default=None):
        if edge in self._edata:
            return self._edata[edge].get(key, default)
        else:
            return default
    def set_edata(self, edge, key, val):
        if edge in self._edata:
            self._edata[edge][key] = val
        else:
            self._edata[edge] = {key: val}
