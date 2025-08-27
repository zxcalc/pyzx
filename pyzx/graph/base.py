# PyZX - Python library for quantum circuit rewriting 
#        and optimization using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from __future__ import annotations
import math
from fractions import Fraction
from typing import TYPE_CHECKING, Union, Optional, Generic, TypeVar, Any, Sequence
from typing import List, Dict, Set, Tuple, Mapping, Iterable, Callable, ClassVar, Literal
from typing_extensions import Literal, GenericMeta # type: ignore # https://github.com/python/mypy/issues/5753

import numpy as np

from ..utils import EdgeType, VertexType, toggle_edge, vertex_is_zx
from ..utils import FloatInt, FractionLike
from ..tensor import tensorfy, tensor_to_matrix

from .scalar import Scalar

if TYPE_CHECKING:
    from .. import simplify


class DocstringMeta(GenericMeta):
    """Metaclass that allows docstring 'inheritance'."""

    def __new__(mcls, classname, bases, cls_dict, **kwargs):
        cls = GenericMeta.__new__(mcls, classname, bases, cls_dict, **kwargs)
        mro = cls.__mro__[1:]
        for name, member in cls_dict.items():
            if not getattr(member, '__doc__'):
                for base in mro:
                    try:
                        member.__doc__ = getattr(base, name).__doc__
                        break
                    except AttributeError:
                        pass
        return cls

def pack_indices(lst: List[FloatInt]) -> Mapping[FloatInt,int]:
    d: Dict[FloatInt,int] = dict()
    if len(lst) == 0: return d
    list.sort(lst)
    i: int = 0
    x: Optional[FloatInt] = None
    for j in range(len(lst)):
        y = lst[j]
        if y != x:
            x = y
            d[y] = i
            i += 1
    return d

VT = TypeVar('VT', bound=int) # The type that is used for representing vertices (e.g. an integer)
ET = TypeVar('ET') # The type used for representing edges (e.g. a pair of integers)


def upair(v1: VT, v2: VT) -> Tuple[VT, VT]:
    """Returns the unordered pair associated to the pair of vertices.
    This method takes a pair of vertices and returns them in a canonical order. Use this
    whenever a pair of vertices is used to reference the location of an undirected edge, 
    e.g. as a key in an edge table."""
    return (v1, v2) if v1 <= v2 else (v2, v1)


class BaseGraph(Generic[VT, ET], metaclass=DocstringMeta):
    """Base class for letting graph backends interact with PyZX.
    For a backend to work with PyZX, there should be a class that implements
    all the methods of this class. For implementations of this class see
    :class:`~pyzx.graph.graph_s.GraphS` or :class:`~pyzx.graph.graph_ig.GraphIG`."""

    backend: ClassVar[str] = 'None'

    def __init__(self) -> None:
        self.scalar: Scalar = Scalar()
        # self.inputs: List[VT] = []
        # self.outputs: List[VT] = []
        #Data necessary for phase tracking for phase teleportation
        self.track_phases: bool = False
        self.phase_index : Dict[VT,int] = dict() # {vertex:index tracking its phase for phase teleportation}
        self.phase_master: Optional['simplify.Simplifier'] = None
        self.phase_mult: Dict[int,Literal[1,-1]] = dict()
        self.max_phase_index: int = -1

        # merge_vdata(v0,v1) is an optional, custom function for merging
        # vdata of v1 into v0 during spider fusion etc.
        self.merge_vdata: Optional[Callable[[VT,VT], None]] = None
        self.variable_types: Dict[str,bool] = dict() # mapping of variable names to their type (bool or continuous)

    # MANDATORY OVERRIDES {{{

    # All backends should override these methods

    def clone(self) -> BaseGraph[VT,ET]:
        """
        This method should return an identical copy of the graph, without any relabeling.

        This needs to be implemented in the backend, since different backends deal with names differently.
        """
        raise NotImplementedError()

    def inputs(self) -> Tuple[VT, ...]:
        """Gets the inputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def set_inputs(self, inputs: Tuple[VT, ...]):
        """Sets the inputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def outputs(self) -> Tuple[VT, ...]:
        """Gets the outputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def set_outputs(self, outputs: Tuple[VT, ...]):
        """Sets the outputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def add_vertices(self, amount: int) -> List[VT]:
        """Add the given amount of vertices, and return the indices of the
        new vertices added to the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def add_vertex_indexed(self,v:VT) -> None:
        """Adds a vertex that is guaranteed to have the chosen index (i.e. 'name').
        If the index isn't available, raises a ValueError.
        This method is used in the editor and ZXLive to support undo,
        which requires vertices to preserve their index."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def add_edge(self, edge_pair: Tuple[VT,VT], edgetype:EdgeType=EdgeType.SIMPLE) -> ET:
        """Adds a single edge of the given type and return its id"""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def remove_vertices(self, vertices: Iterable[VT]) -> None:
        """Removes the list of vertices from the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def remove_edges(self, edges: List[ET]) -> None:
        """Removes the list of edges from the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def num_vertices(self) -> int:
        """Returns the amount of vertices in the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def num_edges(self, s: Optional[VT]=None, t: Optional[VT]=None, et: Optional[EdgeType]=None) -> int:
        """Returns the amount of edges in the graph"""
        return len(list(self.edges(s, t)))

    def vertices(self) -> Iterable[VT]:
        """Iterator over all the vertices."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def edges(self, s: Optional[VT]=None, t: Optional[VT]=None) -> Iterable[ET]:
        """Iterator that returns all the edges in the graph, or all the edges connecting the pair of vertices.
        Output type depends on implementation in backend."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def edge_st(self, edge: ET) -> Tuple[VT, VT]:
        """Returns a tuple of source/target of the given edge."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def incident_edges(self, vertex: VT) -> Sequence[ET]:
        """Returns all neighboring edges of the given vertex."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def edge_type(self, e: ET) -> EdgeType:
        """Returns the type of the given edge:
        ``EdgeType.SIMPLE`` if it is regular, ``EdgeType.HADAMARD`` if it is a Hadamard edge,
        0 if the edge is not in the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def set_edge_type(self, e: ET, t: EdgeType) -> None:
        """Sets the type of the given edge."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def type(self, vertex: VT) -> VertexType:
        """Returns the type of the given vertex:
        VertexType.BOUNDARY if it is a boundary, VertexType.Z if it is a Z node,
        VertexType.X if it is a X node, VertexType.H_BOX if it is an H-box."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def set_type(self, vertex: VT, t: VertexType) -> None:
        """Sets the type of the given vertex to t."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def phase(self, vertex: VT) -> FractionLike:
        """Returns the phase value of the given vertex."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def set_phase(self, vertex: VT, phase: FractionLike) -> None:
        """Sets the phase of the vertex to the given value."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def qubit(self, vertex: VT) -> FloatInt:
        """Returns the qubit index associated to the vertex.
        If no index has been set, returns -1."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def set_qubit(self, vertex: VT, q: FloatInt) -> None:
        """Sets the qubit index associated to the vertex."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def row(self, vertex: VT) -> FloatInt:
        """Returns the row that the vertex is positioned at.
        If no row has been set, returns -1."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def set_row(self, vertex: VT, r: FloatInt) -> None:
        """Sets the row the vertex should be positioned at."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def clear_vdata(self, vertex: VT) -> None:
        """Removes all vdata associated to a vertex"""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def vdata_keys(self, vertex: VT) -> Sequence[str]:
        """Returns an iterable of the vertex data key names.
        Used e.g. in making a copy of the graph in a backend-independent way."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def vdata(self, vertex: VT, key: str, default: Any=None) -> Any:
        """Returns the data value of the given vertex associated to the key.
        If this key has no value associated with it, it returns the default value."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def set_vdata(self, vertex: VT, key: str, val: Any) -> None:
        """Sets the vertex data associated to key to val."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def clear_edata(self, edge: ET) -> None:
        """Removes all edata associated to an edge"""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def edata_keys(self, edge: ET) -> Sequence[str]:
        """Returns an iterable of the edge data key names."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def edata(self, edge: ET, key: str, default: Any=None) -> Any:
        """Returns the data value of the given edge associated to the key.
        If this key has no value associated with it, it returns the default value."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def set_edata(self, edge: ET, key: str, val: Any) -> None:
        """Sets the edge data associated to key to val."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)
    # }}}


    # OPTIONAL OVERRIDES {{{

    # These only need to be overridden if the backend will be used with hybrid classical/quantum
    # methods.
    def is_ground(self, vertex: VT) -> bool:
        """Returns a boolean indicating if the vertex is connected to a ground."""
        return False

    def grounds(self) -> Set[VT]:
        """Returns the set of vertices connected to a ground."""
        return set(v for v in self.vertices() if self.is_ground(v))

    def set_ground(self, vertex: VT, flag: bool=True) -> None:
        """Connect or disconnect the vertex to a ground."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def is_hybrid(self) -> bool:
        """Returns whether this is a hybrid quantum-classical graph,
        i.e. a graph with ground generators."""
        return bool(self.grounds())

    # Override and set to true if the backend supports parallel edges
    def multigraph(self) -> bool:
        return False


    # Backends may wish to override these methods to implement them more efficiently


    # Helper functions for mutating the scalar
    #
    # AK: I suggest new code *only* uses these functions to modify the scalar and we deprecate mutating
    # the scalar directly (which doesn't work correctly with the Rust backend). I also picked slightly
    # clearer names for these options, as the "add_..." method names are misleading for these operations,
    # which all entail scalar multiplication.

    def mult_scalar_by_phase(self, phase: FractionLike) -> None:
        """Multiplies the scalar by a phase factor."""
        self.scalar.add_phase(phase)

    def mult_scalar_by_one_plus_phase(self, phase: FractionLike) -> None:
        """Multiplies the scalar by a phase factor."""
        self.scalar.add_node(phase)

    def mult_scalar_by_sqrt2_power(self, power: int) -> None:
        """Multiplies the scalar by sqrt(2) raised to the given power."""
        self.scalar.add_power(power)
    
    def mult_scalar_by_scalar(self, scalar: Scalar) -> None:
        """Multiplies scalar with the given scalar"""
        self.scalar.mult_with_scalar(scalar)

    def mult_scalar_by_spider_pair(self, phase1: FractionLike, phase2: FractionLike) -> None:
        """Multiplies scalar with a 'spider pair', i.e. a pair of phased Z-spiders connected by an H edge"""
        self.scalar.add_spider_pair(phase1, phase2)


    # These methods return mappings from vertices to various pieces of data. If the backend
    # stores these e.g. as Python dicts, just return the relevant dicts.
    def phases(self) -> Mapping[VT, FractionLike]:
        """Returns a mapping of vertices to their phase values."""
        return { v: self.phase(v) for v in self.vertices() }

    def types(self) -> Mapping[VT, VertexType]:
        """Returns a mapping of vertices to their types."""
        return { v: self.type(v) for v in self.vertices() }

    def qubits(self) -> Mapping[VT,FloatInt]:
        """Returns a mapping of vertices to their qubit index."""
        return { v: self.qubit(v) for v in self.vertices() }

    def rows(self) -> Mapping[VT, FloatInt]:
        """Returns a mapping of vertices to their row index."""
        return { v: self.row(v) for v in self.vertices() }

    def depth(self) -> FloatInt:
        """Returns the value of the highest row number given to a vertex.
        This is -1 when no rows have been set."""
        if self.num_vertices() == 0:
            return -1
        else:
            return max(self.row(v) for v in self.vertices())

    def edge(self, s:VT, t:VT, et: EdgeType=EdgeType.SIMPLE) -> ET:
        """Returns the name of the first edge with the given source/target and type. Behaviour is undefined if the vertices are not connected."""
        for e in self.incident_edges(s):
            if t in self.edge_st(e) and et == self.edge_type(e):
                return e
        raise ValueError(f"No edge of type {et} between {s} and {t}")

    def connected(self,v1: VT,v2: VT) -> bool:
        """Returns whether vertices v1 and v2 share an edge."""
        for e in self.incident_edges(v1):
            if v2 in self.edge_st(e):
                return True
        return False

    def add_vertex(self,
                   ty:VertexType=VertexType.BOUNDARY,
                   qubit:FloatInt=-1,
                   row:FloatInt=-1,
                   phase:Optional[FractionLike]=None,
                   ground:bool=False,
                   index: Optional[VT] = None
                   ) -> VT:
        """Add a single vertex to the graph and return its index.
        The optional parameters allow you to respectively set
        the type, qubit index, row index and phase of the vertex."""
        if index is not None:
            self.add_vertex_indexed(index)
            v = index
        else:
            v = self.add_vertices(1)[0]
        self.set_type(v, ty)
        if phase is None:
            if ty == VertexType.H_BOX: phase = 1
            else: phase = 0
        self.set_qubit(v, qubit)
        self.set_row(v, row)
        if phase:
            self.set_phase(v, phase)
        if ground:
            self.set_ground(v, True)
        if self.track_phases:
            self.max_phase_index += 1
            self.phase_index[v] = self.max_phase_index
            self.phase_mult[self.max_phase_index] = 1
        return v

    def add_edges(self, edge_pairs: Iterable[Tuple[VT,VT]], edgetype:EdgeType=EdgeType.SIMPLE) -> None:
        """Adds a list of edges to the graph."""
        for ep in edge_pairs:
            self.add_edge(ep, edgetype)

    def remove_vertex(self, vertex: VT) -> None:
        """Removes the given vertex from the graph."""
        self.remove_vertices([vertex])

    def remove_edge(self, edge: ET) -> None:
        """Removes the given edge from the graph."""
        self.remove_edges([edge])

    def add_to_phase(self, vertex: VT, phase: FractionLike) -> None:
        """Add the given phase to the phase value of the given vertex."""
        self.set_phase(vertex,self.phase(vertex)+phase)

    def num_inputs(self) -> int:
        """Gets the number of inputs of the graph."""
        return len(self.inputs())

    def num_outputs(self) -> int:
        """Gets the number of outputs of the graph."""
        return len(self.outputs())

    def set_position(self, vertex: VT, q: FloatInt, r: FloatInt):
        """Set both the qubit index and row index of the vertex."""
        self.set_qubit(vertex, q)
        self.set_row(vertex, r)

    def neighbors(self, vertex: VT) -> Sequence[VT]:
        """Returns all neighboring vertices of the given vertex."""
        vs: Set[VT] = set()
        for e in self.incident_edges(vertex):
            s,t = self.edge_st(e)
            vs.add(s if t == vertex else t)
        return list(vs)

    def vertex_degree(self, vertex: VT) -> int:
        """Returns the degree of the given vertex."""
        return len(self.incident_edges(vertex))

    def edge_s(self, edge: ET) -> VT:
        """Returns the source of the given edge."""
        return self.edge_st(edge)[0]

    def edge_t(self, edge: ET) -> VT:
        """Returns the target of the given edge."""
        return self.edge_st(edge)[1]


    def vertex_set(self) -> Set[VT]:
        """Returns the vertices of the graph as a Python set.
        Should be overloaded if the backend supplies a cheaper version than this."""
        return set(self.vertices())

    def edge_set(self) -> Set[ET]:
        """Returns the edges of the graph as a Python set.
        Should be overloaded if the backend supplies a cheaper version than this. Note this ignores parallel edges."""
        return set(self.edges())


    # }}}

    # def vindex(self) -> VT:
    #     """The index given to the next vertex added to the graph. It should always
    #     be equal to ``max(g.vertices()) + 1``."""
    #     raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def __str__(self) -> str:
        return "Graph({} vertices, {} edges)".format(
                str(self.num_vertices()),str(self.num_edges()))

    def __repr__(self) -> str:
        return str(self)

    def stats(self) -> str:
        """
        Returns:
            Returns a string with some information regarding the degree distribution of the graph.
        """
        s = str(self) + "\n"
        degrees: Dict[int,int] = {}
        for v in self.vertices():
            d = self.vertex_degree(v)
            if d in degrees: degrees[d] += 1
            else: degrees[d] = 1
        s += "degree distribution: \n"
        for d, n in sorted(degrees.items(),key=lambda x: x[0]):
            s += "{:d}: {:d}\n".format(d,n)
        return s

    def copy(self, adjoint:bool=False, backend:Optional[str]=None) -> BaseGraph[VT,ET]:
        """Create a copy of the graph. If ``adjoint`` is set,
        the adjoint of the graph will be returned (inputs and outputs flipped, phases reversed).
        When ``backend`` is set, a copy of the graph with the given backend is produced.
        By default the copy will have the same backend.

        Args:
            adjoint: set to True to make the copy be the adjoint of the graph
            backend: the backend of the output graph

        Returns:
            A copy of the graph

        Note:
            The copy will have consecutive vertex indices, even if the original
            graph did not.
        """
        from .graph import Graph # imported here to prevent circularity
        from .multigraph import Multigraph
        if (backend is None):
            backend = type(self).backend
        g = Graph(backend = backend)
        if isinstance(self, Multigraph) and isinstance(g, Multigraph):
            g.set_auto_simplify(self._auto_simplify) # type: ignore
            # mypy issue https://github.com/python/mypy/issues/16413
        g.track_phases = self.track_phases
        g.scalar = self.scalar.copy(conjugate=adjoint)
        g.merge_vdata = self.merge_vdata # type: ignore
        mult:int = 1
        if adjoint:
            mult = -1

        #g.add_vertices(self.num_vertices())
        ty = self.types()
        ph = self.phases()
        qs = self.qubits()
        rs = self.rows()
        maxr = self.depth()
        vtab = dict()
        for v in self.vertices():
            i = g.add_vertex(ty[v],phase=mult*ph[v])
            if v in qs: g.set_qubit(i,qs[v])
            if v in rs:
                if adjoint: g.set_row(i, maxr-rs[v])
                else: g.set_row(i, rs[v])
            vtab[v] = i
            for k in self.vdata_keys(v):
                g.set_vdata(i, k, self.vdata(v, k))
        for v in self.grounds():
            g.set_ground(vtab[v], True)

        new_inputs = tuple(vtab[i] for i in self.inputs())
        new_outputs = tuple(vtab[i] for i in self.outputs())
        if not adjoint:
            g.set_inputs(new_inputs)
            g.set_outputs(new_outputs)
        else:
            g.set_inputs(new_outputs)
            g.set_outputs(new_inputs)
        
        for e in self.edges():
            s, t = self.edge_st(e)
            new_e = g.add_edge((vtab[s], vtab[t]), self.edge_type(e))
            g.set_edata_dict(new_e, self.edata_dict(e))

        return g

    def adjoint(self) -> BaseGraph[VT,ET]:
        """Returns a new graph equal to the adjoint of this graph."""
        return self.copy(adjoint=True)


    def map_qubits(self, qubit_map:Mapping[int,Tuple[float,float]]) -> None:
        for v in self.vertices():
            q = self.qubit(v)
            r = self.row(v)
            q0 = min(max(0,math.floor(q)), len(qubit_map)-1)
            offset = q - q0
            coord = qubit_map[q0]
            qf = 3*(coord[0]+offset)+(0.6 * coord[1])
            rf = 3*r+(0.6 * coord[1])
            self.set_qubit(v, qf)
            self.set_row(v, rf)

    def compose(self, other: BaseGraph[VT,ET]) -> None:
        """Inserts a graph after this one. The amount of qubits of the graphs must match.
        Also available by the operator `graph1 + graph2`"""
        other = other.copy()
        outputs = self.outputs()
        inputs = other.inputs()
        if len(outputs) != len(inputs):
            raise TypeError("Outputs of first graph must match inputs of second.")

        plugs: List[Tuple[VT,VT,EdgeType]] = []
        for k in range(len(outputs)):
            o = outputs[k]
            i = inputs[k]
            if len(self.neighbors(o)) != 1:
                raise ValueError("Bad output vertex: " + str(o))
            if len(other.neighbors(i)) != 1:
                raise ValueError("Bad input vertex: " + str(i))
            no = next(iter(self.neighbors(o)))
            ni = next(iter(other.neighbors(i)))
            plugs.append((no, ni, EdgeType.HADAMARD
                if self.edge_type(self.edge(no,o)) != other.edge_type(other.edge(i,ni))
                else EdgeType.SIMPLE))

        self.scalar.mult_with_scalar(other.scalar)
        maxr = max((self.row(v) for v in self.vertices()
                    if self.type(v) != VertexType.BOUNDARY), default=0)
        minr = min((other.row(v) for v in other.vertices()
                    if other.type(v) != VertexType.BOUNDARY), default=0)
        offset = maxr - minr + 1

        for v in outputs:
            self.remove_vertex(v)

        vtab : Dict[VT,VT] = dict()
        for v in other.vertices():
            if not v in inputs:
                w = self.add_vertex(other.type(v),
                        phase=other.phase(v),
                        qubit=other.qubit(v),
                        row=offset + other.row(v),
                        ground=other.is_ground(v))
                self.set_vdata_dict(w, other.vdata_dict(v))
                vtab[v] = w
        for e in other.edges():
            s,t = other.edge_st(e)
            if not s in inputs and not t in inputs:
                new_e = self.add_edge((vtab[s],vtab[t]), edgetype=other.edge_type(e))
                self.set_edata_dict(new_e, other.edata_dict(e))

        for (no,ni,et) in plugs:
            self.add_edge((no,vtab[ni]), edgetype=et)
        self.set_outputs(tuple(vtab[v] for v in other.outputs()))

    def tensor(self, other: BaseGraph[VT,ET]) -> BaseGraph[VT,ET]:
        """Take the tensor product of two graphs. Places the second graph below the first one.
        Can also be called using the operator ``graph1 @ graph2``"""
        g = self.copy()
        g.scalar.mult_with_scalar(other.scalar)
        ts = other.types()
        qs = other.qubits()
        height = max((self.qubits().values()), default=0) + 1
        rs = other.rows()
        phases = other.phases()
        vertex_map = dict()
        for v in other.vertices():
            w = g.add_vertex(ts[v],qs[v]+height,rs[v],phases[v],g.is_ground(v))
            g.set_vdata_dict(w, other.vdata_dict(v))
            vertex_map[v] = w
        for e in other.edges():
            s,t = other.edge_st(e)
            new_e = g.add_edge((vertex_map[s],vertex_map[t]),other.edge_type(e))
            g.set_edata_dict(new_e, other.edata_dict(e))

        inputs = g.inputs() + tuple(vertex_map[v] for v in other.inputs())
        outputs = g.outputs() + tuple(vertex_map[v] for v in other.outputs())
        g.set_inputs(inputs)
        g.set_outputs(outputs)

        minr = min((g.row(v) for v in inputs), default=1)
        for v in inputs:
            g.set_row(v, minr)

        maxr = max((g.row(v) for v in outputs), default=1)
        for v in outputs:
            g.set_row(v, maxr)

        return g

    def __iadd__(self, other: BaseGraph[VT,ET]) -> BaseGraph[VT,ET]:
        self.compose(other)
        return self

    def __add__(self, other: BaseGraph[VT,ET]) -> BaseGraph[VT,ET]:
        g = self.copy()
        g += other
        return g

    def __mul__(self, other: BaseGraph[VT,ET]) -> BaseGraph[VT,ET]:
        """Compose two diagrams, in formula order. That is, g * h produces 'g AFTER h'."""
        g = other.copy()
        g.compose(self)
        return g

    def __matmul__(self, other: BaseGraph[VT,ET]) -> BaseGraph[VT,ET]:
        return self.tensor(other)

    def merge(self, other: BaseGraph[VT,ET]) -> Tuple[List[VT],List[ET]]:
        """Merges this graph with the other graph in-place.
        Returns (list-of-vertices, list-of-edges) corresponding to
        the id's of the vertices and edges of the other graph."""
        ty = other.types()
        rs = other.rows()
        qs = other.qubits()
        phase = other.phases()
        grounds = other.grounds()

        vert_map = dict()
        edges = []
        for v in other.vertices():
            w = self.add_vertex(ty[v],qs[v],rs[v],phase[v],v in grounds)
            self.set_vdata_dict(w, other.vdata_dict(v))
            vert_map[v] = w
        for e in other.edges():
            s,t = other.edge_st(e)
            f = (vert_map[s],vert_map[t])
            new_e = self.add_edge(f,other.edge_type(e))
            self.set_edata_dict(new_e, other.edata_dict(e))
            edges.append(e)
        return (list(vert_map.values()),edges)

    def subgraph_from_vertices(self,verts: List[VT]) -> BaseGraph[VT,ET]:
        """Returns the subgraph consisting of the specified vertices."""
        from .graph import Graph # imported here to prevent circularity
        from .multigraph import Multigraph
        g = Graph(backend=type(self).backend)
        if isinstance(self, Multigraph) and isinstance(g, Multigraph):
            g.set_auto_simplify(self._auto_simplify) # type: ignore
            # mypy issue https://github.com/python/mypy/issues/16413
        ty = self.types()
        rs = self.rows()
        qs = self.qubits()
        phase = self.phases()
        grounds = self.grounds()

        edges = [e for e in self.edges() \
            if self.edge_st(e)[0] in verts and self.edge_st(e)[1] in verts]

        vert_map = dict()
        for v in verts:
            w = g.add_vertex(ty[v], qs[v], rs[v], phase[v], v in grounds, index=v)
            vert_map[v] = w
            g.set_vdata_dict(w, self.vdata_dict(v))
        for e in edges:
            s,t = self.edge_st(e)
            new_e = g.add_edge((vert_map[s], vert_map[t]), self.edge_type(e))
            g.set_edata_dict(new_e, self.edata_dict(e))

        return g

    def apply_state(self, state: str) -> None:
        """Inserts a state into the inputs of the graph. ``state`` should be
        a string with every character representing an input state for each qubit.
        The possible types of states are on of '0', '1', '+', '-' for the respective
        kets. If '/' is specified this input is skipped."""
        inputs = self.inputs()
        if len(state) > len(inputs): raise TypeError("Too many input states specified")
        new_inputs = []
        for i,s in enumerate(state):
            v = inputs[i]
            if s == '/':
                new_inputs.append(v)
                continue
            if s in ('0', '1'):
                self.scalar.add_power(-1)
                self.set_type(v, VertexType.X)
                if s == '1':
                    self.set_phase(v, Fraction(1))
            elif s in ('+', '-'):
                self.scalar.add_power(-1)
                self.set_type(v, VertexType.Z)
                if s == '-':
                    self.set_phase(v, Fraction(1))
            else:
                raise TypeError("Unknown input state " + s)
        self.set_inputs(tuple(new_inputs))

    def apply_effect(self, effect: str) -> None:
        """Inserts an effect into the outputs of the graph. ``effect`` should be
        a string with every character representing an output effect for each qubit.
        The possible types of effects are one of '0', '1', '+', '-' for the respective
        kets. If '/' is specified this output is skipped."""
        outputs = self.outputs()
        if len(effect) > len(outputs): raise TypeError("Too many output effects specified")
        new_outputs = []
        for i,s in enumerate(effect):
            v = outputs[i]
            if s == '/': 
                new_outputs.append(v)
                continue
            if s in ('0', '1'):
                self.scalar.add_power(-1)
                self.set_type(v, VertexType.X)
                if s == '1':
                    self.set_phase(v, Fraction(1))
            elif s in ('+', '-'):
                self.scalar.add_power(-1)
                self.set_type(v, VertexType.Z)
                if s == '-':
                    self.set_phase(v, Fraction(1))
            else:
                raise TypeError("Unknown output effect " + s)
        self.set_outputs(tuple(new_outputs))

    def to_tensor(self, preserve_scalar:bool=True) -> np.ndarray:
        """Returns a representation of the graph as a tensor using :func:`~pyzx.tensor.tensorfy`"""
        return tensorfy(self, preserve_scalar)
    def to_matrix(self,preserve_scalar:bool=True) -> np.ndarray:
        """Returns a representation of the graph as a matrix using :func:`~pyzx.tensor.tensorfy`"""
        return tensor_to_matrix(tensorfy(self, preserve_scalar), self.num_inputs(), self.num_outputs())

    def to_dict(self, include_scalar:bool=True) -> Dict[str, Any]:
        """Returns a dictionary representation of the graph, which can then be converted into json."""
        from .jsonparser import graph_to_dict
        return graph_to_dict(self, include_scalar)

    def to_json(self, include_scalar:bool=True) -> str:
        """Returns a json representation of the graph.
        Convert back into a graph using :meth:`from_json`."""
        from .jsonparser import graph_to_json
        return graph_to_json(self, include_scalar)

    def to_graphml(self) -> str:
        """Returns a GraphML representation of the graph."""
        from .jsonparser import to_graphml
        return to_graphml(self)

    def to_tikz(self,draw_scalar:bool=False) -> str:
        """Returns a Tikz representation of the graph."""
        from ..tikz import to_tikz
        return to_tikz(self,draw_scalar)

    @classmethod
    def from_json(cls, js:Union[str,Dict[str,Any]]) -> BaseGraph[VT,ET]:
        """Converts the given .qgraph json string into a Graph.
        Works with the output of :meth:`to_json`."""
        from .jsonparser import json_to_graph
        return json_to_graph(js)

    @classmethod
    def from_tikz(cls, tikz: str, warn_overlap:bool= True, fuse_overlap:bool = True, ignore_nonzx:bool = False) -> BaseGraph[VT,ET]:
        """Converts a tikz diagram into a pyzx Graph.
    The tikz diagram is assumed to be one generated by Tikzit,
    and hence should have a nodelayer and a edgelayer..

    Args:
        s: a string containing a well-defined Tikz diagram.
        warn_overlap: If True raises a Warning if two vertices have the exact same position.
        fuse_overlap: If True fuses two vertices that have the exact same position. Only has effect if fuse_overlap is False.
        ignore_nonzx: If True suppresses most errors about unknown vertex/edge types and labels.

    Warning:
        Vertices that might look connected in the output of the tikz are not necessarily connected
        at the level of tikz itself, and won't be treated as such in pyzx.
    """
        from ..tikz import tikz_to_graph
        return tikz_to_graph(tikz,warn_overlap, fuse_overlap, ignore_nonzx, cls.backend)

    def is_id(self) -> bool:
        """Returns whether the graph is just a set of identity wires,
        i.e. a graph where all the vertices are either inputs or outputs,
        and they are connected to each other in a non-permuted manner."""
        inputs = self.inputs()
        outputs = self.outputs()

        if (len(inputs) != len(outputs) or
            self.num_vertices() != 2*len(inputs) or
            self.num_edges() != len(inputs)): return False

        for i in range(len(inputs)):
            if not self.connected(inputs[i], outputs[i]): return False
        return True

    def pack_circuit_rows(self) -> None:
        """Compresses the rows of the graph so that every index is used."""
        rows = [self.row(v) for v in self.vertices()]
        new_rows = pack_indices(rows)
        for v in self.vertices():
            self.set_row(v, new_rows[self.row(v)])

    def qubit_count(self) -> int:
        """Returns the number of inputs of the graph"""
        return self.num_inputs()

    def auto_detect_io(self):
        """Adds every vertex that is of boundary-type to the list of inputs or outputs.
        Whether it is an input or output is determined by looking whether its neighbor
        is further to the right or further to the left of the input.
        Inputs and outputs are sorted by vertical position.
        Raises an exception if boundary vertex does not have a unique neighbor
        or if this neighbor is on the same horizontal position.
        """
        ty = self.types()
        inputs = []
        outputs = []
        for v in self.vertices():
            if ty[v] != VertexType.BOUNDARY: continue
            if v in inputs or v in outputs: continue
            if self.vertex_degree(v) != 1:
                raise TypeError("Invalid ZX-diagram: Boundary-type vertex does not have unique neighbor")
            w = list(self.neighbors(v))[0]
            if self.row(w) > self.row(v):
                inputs.append(v)
            elif self.row(w) < self.row(v):
                outputs.append(v)
            else:
                raise TypeError("Boundary-type vertex at same horizontal position as neighbor. Can't determine whether it is an input or output.")
        inputs = sorted(filter(lambda v: v in self.vertices(), inputs), key=self.qubit)
        outputs = sorted(filter(lambda v: v in self.vertices(), outputs), key=self.qubit)
        self.set_inputs(tuple(inputs))
        self.set_outputs(tuple(outputs))

    def normalize(self) -> None:
        """Puts every node connecting to an input/output at the correct qubit index and row."""
        if self.num_inputs() == 0:
            self.auto_detect_io()
        max_r = self.depth() - 1
        if max_r <= 2:
            for o in self.outputs():
                self.set_row(o,4)
            max_r = self.depth() -1
        claimed = []
        for q,i in enumerate(sorted(self.inputs(), key=self.qubit)):
            self.set_row(i,0)
            self.set_qubit(i,q)
            #q = self.qubit(i)
            n = list(self.neighbors(i))[0]
            if self.type(n) in (VertexType.Z, VertexType.X):
                claimed.append(n)
                self.set_row(n,1)
                self.set_qubit(n, q)
            else: #directly connected to output
                e = self.edge(i, n)
                t = self.edge_type(e)
                self.remove_edge(e)
                v = self.add_vertex(VertexType.Z,q,1)
                self.add_edge((i,v),toggle_edge(t))
                self.add_edge((v,n),EdgeType.HADAMARD)
                claimed.append(v)
        for q, o in enumerate(sorted(self.outputs(),key=self.qubit)):
            #q = self.qubit(o)
            self.set_row(o,max_r+1)
            self.set_qubit(o,q)
            n = list(self.neighbors(o))[0]
            if n not in claimed:
                self.set_row(n,max_r)
                self.set_qubit(n, q)
            else:
                e = self.edge(o, n)
                t = self.edge_type(e)
                self.remove_edge(e)
                v = self.add_vertex(VertexType.Z,q,max_r)
                self.add_edge((o,v),toggle_edge(t))
                self.add_edge((v,n),EdgeType.HADAMARD)

        self.pack_circuit_rows()

    def translate(self, x:FloatInt, y:FloatInt) -> BaseGraph[VT,ET]:
        g = self.copy()
        for v in g.vertices():
            g.set_row(v, g.row(v)+x)
            g.set_qubit(v,g.qubit(v)+y)
        return g



    def add_edge_table(self, etab:Mapping[Tuple[VT,VT],List[int]]) -> None:
        """Takes a dictionary mapping (source,target) --> (#edges, #h-edges) specifying that
        #edges regular edges must be added between source and target and $h-edges Hadamard edges.
        The method selectively adds or removes edges to produce that ZX diagram which would
        result from adding (#edges, #h-edges), and then removing all parallel edges using Hopf/spider laws."""

        for st, (ns, nh) in etab.items():
            for _ in range(ns): self.add_edge(st, EdgeType.SIMPLE)
            for _ in range(nh): self.add_edge(st, EdgeType.HADAMARD)


    def set_phase_master(self, m: 'simplify.Simplifier') -> None:
        """Points towards an instance of the class :class:`~pyzx.simplify.Simplifier`.
        Used for phase teleportation."""
        self.phase_master = m

    def update_phase_index(self, old:VT, new:VT) -> None:
        """When a phase is moved from a vertex to another vertex,
        we need to tell the phase_teleportation algorithm that this has happened.
        This function does that. Used in some of the rules in `simplify`."""
        if not self.track_phases: return
        i = self.phase_index[old]
        self.phase_index[old] = self.phase_index[new]
        self.phase_index[new] = i

    def fuse_phases(self, p1: VT, p2: VT) -> None:
        if p1 not in self.phase_index or p2 not in self.phase_index:
            return
        if self.phase_master is not None:
            self.phase_master.fuse_phases(self.phase_index[p1],self.phase_index[p2])
        self.phase_index[p2] = self.phase_index[p1]

    def phase_negate(self, v: VT) -> None:
        if v not in self.phase_index: return
        index = self.phase_index[v]
        mult = self.phase_mult[index]
        if mult == 1: self.phase_mult[index] = -1
        else: self.phase_mult[index] = 1
        #self.phase_mult[index] = -1*mult

    def vertex_from_phase_index(self, i: int) -> VT:
        return list(self.phase_index.keys())[list(self.phase_index.values()).index(i)]


    def remove_isolated_vertices(self) -> None:
        """Deletes all vertices and vertex pairs that are not connected to any other vertex."""
        rem: List[VT] = []
        for v in self.vertices():
            d = self.vertex_degree(v)
            if d == 0:
                rem.append(v)
                ty = self.type(v)
                if ty == VertexType.BOUNDARY:
                    raise TypeError("Diagram is not a well-typed ZX-diagram: contains isolated boundary vertex.")
                elif ty == VertexType.H_BOX:
                    self.scalar.add_phase(self.phase(v))
                else: self.scalar.add_node(self.phase(v))
            if d == 1: # It has a unique neighbor
                if v in rem: continue # Already taken care of
                if self.type(v) == VertexType.BOUNDARY: continue # Ignore in/outputs
                w = list(self.neighbors(v))[0]
                if len(list(self.neighbors(w))) > 1: continue # But this neighbor has other neighbors
                if self.type(w) == VertexType.BOUNDARY: continue # It's a state/effect
                # At this point w and v are only connected to each other
                rem.append(v)
                rem.append(w)
                et = self.edge_type(self.edge(v,w))
                t1 = self.type(v)
                t2 = self.type(w)
                if t1 == VertexType.H_BOX: t1 = VertexType.Z # 1-ary H-box is just a Z spider
                if t2 == VertexType.H_BOX: t2 = VertexType.Z
                if t1==t2:
                    if et == EdgeType.SIMPLE:
                        self.scalar.add_node(self.phase(v)+self.phase(w))
                    else:
                        self.scalar.add_spider_pair(self.phase(v), self.phase(w))
                else:
                    if et == EdgeType.SIMPLE:
                        self.scalar.add_spider_pair(self.phase(v), self.phase(w))
                    else:
                        self.scalar.add_node(self.phase(v)+self.phase(w))
        self.remove_vertices(rem)

    def vdata_dict(self, vertex: VT) -> Dict[str, Any]:
        return { key: self.vdata(vertex, key) for key in self.vdata_keys(vertex) }

    def set_vdata_dict(self, vertex: VT, d: Dict[str, Any]) -> None:
        self.clear_vdata(vertex)
        for k, v in d.items():
            self.set_vdata(vertex, k, v)

    def edata_dict(self, edge: ET) -> Dict[str, Any]:
        """Return a dict of all edge data for the given edge."""
        return { key: self.edata(edge, key) for key in self.edata_keys(edge) }

    def set_edata_dict(self, edge: ET, d: Dict[str, Any]) -> None:
        """Set all edge data for the given edge from a dict, clearing existing data first."""
        self.clear_edata(edge)
        for k, v in d.items():
            self.set_edata(edge, k, v)

    def is_well_formed(self) -> bool:
        """Returns whether the graph is a well-formed ZX-diagram.
        This means that it has no isolated boundary vertices,
        each boundary vertex has a unique neighbor,
        W_input vertices have two neighbors: W_output and other,
        and W_output vertices have at least two neighbors: W_input and other."""
        for v in self.vertices():
            if self.type(v) == VertexType.BOUNDARY:
                if self.vertex_degree(v) != 1:
                    return False
            elif self.type(v) == VertexType.W_INPUT:
                if self.vertex_degree(v) != 2:
                    return False
            elif self.type(v) == VertexType.W_OUTPUT:
                if self.vertex_degree(v) < 2:
                    return False
        return True

    def get_auto_simplify(self) -> bool:
        """Returns whether this graph auto-simplifies parallel edges
        
        For multigraphs, this parameter might change, but simple graphs should always return True."""
        return True

    def set_auto_simplify(self, s: bool) -> None:
        """Set whether this graph auto-simplifies parallel edges
        
        Simple graphs should always auto-simplify, so this method is a no-op."""
        pass
    
    def is_phase_gadget(self, v: VT) -> bool:
        """Returns True if the vertex is the 'hub' of a phase gadget"""
        if not vertex_is_zx(self.type(v)) or self.phase(v) != 0 or self.vertex_degree(v) < 2:
            return False
        for w in self.neighbors(v):
            if vertex_is_zx(self.type(w)) and self.vertex_degree(w) == 1:
                return True
        return False



