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
from typing import Generator, Iterable, Any, Optional

from .base import BaseGraph

from ..utils import VertexType, EdgeType, FractionLike, FloatInt, vertex_is_zx_like, vertex_is_z_like, set_z_box_label, get_z_box_label, assert_phase_real, normalize_phase

class GraphS(BaseGraph[int, tuple[int,int]]):
    """Purely Pythonic implementation of :class:`~graph.base.BaseGraph`."""
    backend = 'simple'

    #The documentation of what these methods do
    #can be found in base.BaseGraph
    def __init__(self) -> None:
        BaseGraph.__init__(self)
        self.graph: dict[int,dict[int,EdgeType]]   = dict()
        self._vindex: int                               = 0
        self.nedges: int                                = 0
        self.ty: dict[int,VertexType]              = dict()
        self._phase: dict[int, FractionLike]            = dict()
        self._qindex: dict[int, FloatInt]               = dict()
        self._maxq: FloatInt                            = -1
        self._rindex: dict[int, FloatInt]               = dict()
        self._maxr: FloatInt                            = -1
        self._grounds: set[int] = set()

        self._vdata: dict[int,Any]                      = dict()
        self._edata: dict[tuple[int,int],Any] = dict()
        self._inputs: tuple[int, ...]                   = tuple()
        self._outputs: tuple[int, ...]                  = tuple()

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
        cpy._grounds = self._grounds.copy()
        cpy._inputs = tuple(list(self._inputs))
        cpy._outputs = tuple(list(self._outputs))
        cpy.track_phases = self.track_phases
        cpy.phase_index = self.phase_index.copy()
        cpy.phase_master = self.phase_master
        cpy.phase_mult = self.phase_mult.copy()
        cpy.max_phase_index = self.max_phase_index
        return cpy

    def vindex(self) -> int:
        return self._vindex
    
    def depth(self) -> int:
        if self._rindex: self._maxr = max(self._rindex.values())
        else: self._maxr = -1
        return int(self._maxr)
    
    def qubit_count(self) -> FloatInt:
        if self._qindex: self._maxq = max(self._qindex.values())
        else: self._maxq = -1
        return self._maxq + 1

    def inputs(self) -> tuple[int, ...]:
        return self._inputs

    def num_inputs(self) -> int:
        return len(self._inputs)

    def set_inputs(self, inputs: tuple[int, ...]) -> None:
        self._inputs = inputs

    def outputs(self) -> tuple[int, ...]:
        return self._outputs

    def num_outputs(self) -> int:
        return len(self._outputs)

    def set_outputs(self, outputs: tuple[int, ...]) -> None:
        self._outputs = outputs

    def add_vertices(self, amount: int) -> list[int]:
        for i in range(self._vindex, self._vindex + amount):
            self.graph[i] = dict()
            self.ty[i] = VertexType.BOUNDARY
            self._phase[i] = 0
        self._vindex += amount
        return list(range(self._vindex - amount, self._vindex))
    
    def add_vertex_indexed(self, v: int) -> None:
        """Adds a vertex that is guaranteed to have the chosen index (i.e. 'name').
        If the index isn't available, raises a ValueError.
        This method is used in the editor to support undo, which requires vertices
        to preserve their index."""
        if v in self.graph: raise ValueError("Vertex with this index already exists")
        if v >= self._vindex: self._vindex = v+1
        self.graph[v] = dict()
        self.ty[v] = VertexType.BOUNDARY
        self._phase[v] = 0

    def add_edges(self, edge_pairs: Iterable[tuple[int, int]], edgetype: EdgeType = EdgeType.SIMPLE) -> None:
        for s,t in edge_pairs:
            self.nedges += 1
            self.graph[s][t] = edgetype
            self.graph[t][s] = edgetype
    
    def add_edge(self, edge_pair: tuple[int, int], edgetype: EdgeType = EdgeType.SIMPLE) -> tuple[int, int]:
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

    def remove_vertices(self, vertices: Iterable[int]) -> None:
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
        self._vindex = max(self.vertices(), default=0) + 1

    def remove_vertex(self, vertex: int) -> None:
        self.remove_vertices([vertex])
    
    def remove_edges(self, edges: Iterable[tuple[int, int]]) -> None:
        for s,t in edges:
            if s == t:
                continue
            self.nedges -= 1
            del self.graph[s][t]
            del self.graph[t][s]
            self._edata.pop((s, t), None)

    def remove_edge(self, edge: tuple[int, int]) -> None:
        self.remove_edges([edge])

    def num_vertices(self) -> int:
        return len(self.graph)

    def num_edges(self, s: int | None = None, t: int | None = None, et: EdgeType | None = None) -> int:
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

    def vertices(self) -> Iterable[int]:
        return self.graph.keys()

    def vertices_in_range(self, start: FloatInt, end: FloatInt) -> Generator[int, None, None]:
        """Returns all vertices with index between start and end
        that only have neighbours whose indices are between start and end"""
        for v in self.graph.keys():
            if not start<v<end: continue
            if all(start<v2<end for v2 in self.graph[v]):
                yield v

    def edges(self, s: int | None = None, t: int | None = None) -> Generator[tuple[int, int], None, None]:
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

    def edges_in_range(self, start: FloatInt, end: FloatInt, safe: bool = False) -> Generator[tuple[int, int], None, None]:
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

    def edge(self, s: int, t: int, et: Optional[EdgeType] = None) -> tuple[int, int]:
        """Return the canonical pair ``(min(s, t), max(s, t))`` whether or not the
        edge exists; this supports the ``g.add_edge(g.edge(v, w), ...)`` pattern.
        ``et`` is accepted for consistency with :meth:`BaseGraph.edge` but ignored,
        as ``GraphS`` has no parallel edges of multiple types."""
        return (s,t) if s < t else (t,s)
    
    def edge_set(self) -> set[tuple[int, int]]:
        return set(self.edges())
    
    def edge_st(self, edge: tuple[int, int]) -> tuple[int, int]:
        return edge

    def neighbors(self, vertex: int) -> list[int]:
        return list(self.graph[vertex].keys())

    def vertex_degree(self, vertex: int) -> int:
        return len(self.graph[vertex])

    def incident_edges(self, vertex: int) -> list[tuple[int, int]]:
        return [(vertex, v1) if v1 > vertex else (v1, vertex) for v1 in self.graph[vertex]]

    def connected(self, v1: int, v2: int) -> bool:
        return v2 in self.graph[v1]

    def edge_type(self, e: tuple[int, int]) -> EdgeType:
        v1,v2 = e
        try:
            return self.graph[v1][v2]
        except KeyError:
            return EdgeType(0)

    def set_edge_type(self, e: tuple[int, int], t: EdgeType) -> None:
        v1,v2 = e
        self.graph[v1][v2] = t
        self.graph[v2][v1] = t

    def type(self, vertex: int) -> VertexType:
        return self.ty[vertex]
    
    def types(self) -> dict[int, VertexType]:
        return self.ty
    
    def set_type(self, vertex: int, t: VertexType) -> None:
        self.ty[vertex] = t

    def phase(self, vertex: int) -> FractionLike:
        return self._phase.get(vertex, Fraction(1))
    
    def phases(self) -> dict[int, FractionLike]:
        return self._phase
    
    def set_phase(self, vertex: int, phase: FractionLike) -> None:
        assert_phase_real(phase)
        phase = normalize_phase(phase)
        try:
            self._phase[vertex] = phase % 2
        except Exception:
            self._phase[vertex] = phase
    
    def add_to_phase(self, vertex: int, phase: FractionLike) -> None:
        assert_phase_real(phase)
        phase = normalize_phase(phase)
        old_phase = self._phase.get(vertex, Fraction(1))
        try:
            self._phase[vertex] = (old_phase + phase) % 2
        except Exception:
            self._phase[vertex] = old_phase + phase
    
    def qubit(self, vertex: int) -> FloatInt:
        return self._qindex.get(vertex,-1)
    
    def qubits(self) -> dict[int, FloatInt]:
        return self._qindex
    
    def set_qubit(self, vertex: int, q: FloatInt) -> None:
        if q > self._maxq: self._maxq = q
        self._qindex[vertex] = q

    def row(self, vertex: int) -> FloatInt:
        return self._rindex.get(vertex, -1)
    
    def rows(self) -> dict[int, FloatInt]:
        return self._rindex
    
    def set_row(self, vertex: int, r: FloatInt) -> None:
        if r > self._maxr: self._maxr = r
        self._rindex[vertex] = r

    def is_ground(self, vertex: int) -> bool:
        return vertex in self._grounds
    
    def grounds(self) -> set[int]:
        return self._grounds
    
    def set_ground(self, vertex: int, flag: bool = True) -> None:
        if flag:
            self._grounds.add(vertex)
        else:
            self._grounds.discard(vertex)

    def clear_vdata(self, vertex: int) -> None:
        if vertex in self._vdata:
            del self._vdata[vertex]
    
    def vdata_keys(self, vertex: int) -> list[str]:
        return list(self._vdata.get(vertex, {}).keys())
    
    def vdata(self, vertex: int, key: str, default: Any = None) -> Any:
        if vertex in self._vdata:
            return self._vdata[vertex].get(key,default)
        else:
            return default
    def set_vdata(self, vertex: int, key: str, val: Any) -> None:
        if vertex in self._vdata:
            self._vdata[vertex][key] = val
        else:
            self._vdata[vertex] = {key: val}

    def clear_edata(self, edge: tuple[int, int]) -> None:
        self._edata.pop(edge, None)
    
    def edata_keys(self, edge: tuple[int, int]) -> list[str]:
        return list(self._edata.get(edge, {}).keys())
    
    def edata(self, edge: tuple[int, int], key: str, default: Any = None) -> Any:
        if edge in self._edata:
            return self._edata[edge].get(key, default)
        else:
            return default
    
    def set_edata(self, edge: tuple[int, int], key: str, val: Any) -> None:
        if edge in self._edata:
            self._edata[edge][key] = val
        else:
            self._edata[edge] = {key: val}
