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

import abc
import math
import copy
from fractions import Fraction
from typing import TYPE_CHECKING, Union, Optional, Generic, TypeVar, Any, Sequence
from typing import List, Dict, Set, Tuple, Mapping, Iterable, Callable, ClassVar
from typing_extensions import Literal, GenericMeta # type: ignore # https://github.com/python/mypy/issues/5753

import numpy as np

from ..utils import EdgeType, VertexType, toggle_edge, vertex_is_zx, toggle_vertex
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

    def copy(self, adjoint:bool=False, backend:Optional[str]=None) -> 'BaseGraph':
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
        if (backend is None):
            backend = type(self).backend
        g = Graph(backend = backend)
        g.track_phases = self.track_phases
        g.scalar = self.scalar.copy()
        g.merge_vdata = self.merge_vdata
        mult:int = 1
        if adjoint: mult = -1

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
        
        etab = {e:g.edge(vtab[self.edge_s(e)],vtab[self.edge_t(e)]) for e in self.edges()}
        g.add_edges(etab.values())
        for e,f in etab.items():
            g.set_edge_type(f, self.edge_type(e))
        return g

    def adjoint(self) -> 'BaseGraph':
        """Returns a new graph equal to the adjoint of this graph."""
        return self.copy(adjoint=True)

    def clone(self) -> 'BaseGraph':
        """
        This method should return an identical copy of the graph, without any relabeling

        Used in lookahead extraction.
        """
        return self.copy()

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


    def replace_subgraph(self, left_row: FloatInt, right_row: FloatInt, replace: 'BaseGraph') -> None:
        """Deletes the subgraph of all nodes with rank strictly between ``left_row``
        and ``right_row`` and replaces it with the graph ``replace``.
        The amount of nodes on the left row should match the amount of inputs of 
        the replacement graph and the same for the right row and the outputs.
        The graphs are glued together based on the qubit index of the vertices."""
        qleft = [v for v in self.vertices() if self.row(v)==left_row]
        qright= [v for v in self.vertices() if self.row(v)==right_row]
        r_inputs = replace.inputs()
        r_outputs = replace.outputs()
        if len(qleft) != len(r_inputs):
            raise TypeError("Inputs do not match glueing vertices")
        if len(qright) != len(r_outputs):
            raise TypeError("Outputs do not match glueing vertices")
        if set(self.qubit(v) for v in qleft) != set(replace.qubit(v) for v in r_inputs):
            raise TypeError("Input qubit indices do not match")
        if set(self.qubit(v) for v in qright)!= set(replace.qubit(v) for v in r_outputs):
            raise TypeError("Output qubit indices do not match")
        
        self.remove_vertices([v for v in self.vertices() if (left_row < self.row(v) and self.row(v) < right_row)])
        self.remove_edges([self.edge(s,t) for s in qleft for t in qright if self.connected(s,t)])
        rdepth = replace.depth() -1
        for v in (v for v in self.vertices() if self.row(v)>=right_row):
            self.set_row(v, self.row(v)+rdepth)

        vtab = {}
        for v in replace.vertices():
            if v in r_inputs or v in r_outputs: continue
            vtab[v] = self.add_vertex(replace.type(v),
                                      replace.qubit(v),
                                      replace.row(v)+left_row,
                                      replace.phase(v),
                                      replace.is_ground(v))
        for v in r_inputs:
            vtab[v] = [i for i in qleft if self.qubit(i) == replace.qubit(v)][0]

        for v in r_outputs:
            vtab[v] = [i for i in qright if self.qubit(i) == replace.qubit(v)][0]

        etab = {e:self.edge(vtab[replace.edge_s(e)],vtab[replace.edge_t(e)]) for e in replace.edges()}
        self.add_edges(etab.values())
        for e,f in etab.items():
            self.set_edge_type(f, replace.edge_type(e))

    def compose(self, other: 'BaseGraph') -> None:
        """Inserts a graph after this one. The amount of qubits of the graphs must match.
        Also available by the operator `graph1 + graph2`"""
        outputs = self.outputs()
        inputs = other.inputs()
        if len(outputs) != len(inputs):
            raise TypeError("Outputs of first graph must match inputs of second.")
        other = other.copy()

        plugs: List[Tuple[VT,VT,EdgeType.Type]] = []
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
                vtab[v] = self.add_vertex(other.type(v),
                        phase=other.phase(v),
                        qubit=other.qubit(v),
                        row=offset + other.row(v))
        for e in other.edges():
            s,t = other.edge_st(e)
            if not s in inputs and not t in inputs:
                self.add_edge(self.edge(vtab[s],vtab[t]),
                        edgetype=other.edge_type(e))

        for (no,ni,et) in plugs:
            self.add_edge_smart(self.edge(no,vtab[ni]), edgetype=et)

        self.set_outputs(tuple(vtab[v] for v in other.outputs()))



    def tensor(self, other: 'BaseGraph') -> 'BaseGraph':
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
            vertex_map[v] = w
        for e in other.edges():
            s,t = other.edge_st(e)
            g.add_edge((vertex_map[s],vertex_map[t]),other.edge_type(e))

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

    def __iadd__(self, other: 'BaseGraph') -> 'BaseGraph':
        self.compose(other)
        return self

    def __add__(self, other: 'BaseGraph') -> 'BaseGraph':
        g = self.copy()
        g += other
        return g

    def __mul__(self, other: 'BaseGraph') -> 'BaseGraph':
        """Compose two diagrams, in formula order. That is, g * h produces 'g AFTER h'."""
        g = other.copy()
        g.compose(self)
        return g

    def __matmul__(self, other: 'BaseGraph') -> 'BaseGraph':
        return self.tensor(other)

    def merge(self, other: 'BaseGraph') -> Tuple[List[VT],List[ET]]:
        """Merges this graph with the other graph in-place.
        Returns (list-of-vertices, list-of-edges) corresponding to 
        the id's of the vertices and edges of the other graph."""
        ty = other.types()
        rs = other.rows()
        qs = other.qubits()
        phase = other.phases()

        vert_map = dict()
        edges = []
        for v in other.vertices():
            w = self.add_vertex(ty[v],qs[v],rs[v],phase[v])
            vert_map[v] = w
        for e in other.edges():
            s,t = other.edge_st(e)
            f = self.edge(vert_map[s],vert_map[t])
            self.add_edge(f,other.edge_type(e))
            edges.append(e)
        return (list(vert_map.values()),edges)

    def subgraph_from_vertices(self,verts: List[VT]) -> 'BaseGraph':
        """Returns the subgraph consisting of the specified vertices."""
        from .graph import Graph # imported here to prevent circularity
        g = Graph(backend=type(self).backend)
        ty = self.types()
        rs = self.rows()
        qs = self.qubits()
        phase = self.phases()

        edges = [self.edge(v,w) for v in verts for w in verts if self.connected(v,w)]

        vert_map = dict()
        for v in verts:
            w = g.add_vertex(ty[v],qs[v],rs[v],phase[v])
            vert_map[v] = w
        for e in edges:
            s,t = self.edge_st(e)
            f = g.edge(vert_map[s],vert_map[t])
            g.add_edge(f,self.edge_type(e))

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

    def to_json(self, include_scalar:bool=True) -> str:
        """Returns a json representation of the graph that follows the Quantomatic .qgraph format.
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
    def from_json(cls, js) -> 'BaseGraph':
        """Converts the given .qgraph json string into a Graph. 
        Works with the output of :meth:`to_json`."""
        from .jsonparser import json_to_graph
        return json_to_graph(js,cls.backend)

    @classmethod
    def from_tikz(cls, tikz: str, warn_overlap:bool= True, fuse_overlap:bool = True, ignore_nonzx:bool = False) -> 'BaseGraph':
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

    def vindex(self) -> VT:
        """The index given to the next vertex added to the graph. It should always
        be equal to ``max(g.vertices()) + 1``."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def depth(self) -> FloatInt:
        """Returns the value of the highest row number given to a vertex.
        This is -1 when no rows have been set."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

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
                self.add_edge(self.edge(i,v),toggle_edge(t))
                self.add_edge(self.edge(v,n),EdgeType.HADAMARD)
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
                self.add_edge(self.edge(o,v),toggle_edge(t))
                self.add_edge(self.edge(v,n),EdgeType.HADAMARD)

        self.pack_circuit_rows()

    def translate(self, x:FloatInt, y:FloatInt) -> 'BaseGraph':
        g = self.copy()
        for v in g.vertices():
            g.set_row(v, g.row(v)+x)
            g.set_qubit(v,g.qubit(v)+y)
        return g

    def inputs(self) -> Tuple[VT, ...]:
        """Gets the inputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def set_inputs(self, inputs: Tuple[VT, ...]):
        """Sets the inputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def num_inputs(self) -> int:
        """Gets the number of inputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def outputs(self) -> Tuple[VT, ...]:
        """Gets the outputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def set_outputs(self, outputs: Tuple[VT, ...]):
        """Sets the outputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def num_outputs(self) -> int:
        """Gets the number of outputs of the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def add_vertices(self, amount: int) -> List[VT]:
        """Add the given amount of vertices, and return the indices of the
        new vertices added to the graph, namely: range(g.vindex() - amount, g.vindex())"""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def add_vertex(self, 
                   ty:VertexType.Type=VertexType.BOUNDARY, 
                   qubit:FloatInt=-1, 
                   row:FloatInt=-1, 
                   phase:Optional[FractionLike]=None,
                   ground:bool=False
                   ) -> VT:
        """Add a single vertex to the graph and return its index.
        The optional parameters allow you to respectively set
        the type, qubit index, row index and phase of the vertex."""
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

    def add_edges(self, edges: Iterable[ET], edgetype:EdgeType.Type=EdgeType.SIMPLE) -> None:
        """Adds a list of edges to the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def add_edge(self, edge: ET, edgetype:EdgeType.Type=EdgeType.SIMPLE) -> None:
        """Adds a single edge of the given type"""
        self.add_edges([edge], edgetype)

    def add_edge_table(self, etab:Mapping[ET,List[int]]) -> None:
        """Takes a dictionary mapping (source,target) --> (#edges, #h-edges) specifying that
        #edges regular edges must be added between source and target and $h-edges Hadamard edges.
        The method selectively adds or removes edges to produce that ZX diagram which would 
        result from adding (#edges, #h-edges), and then removing all parallel edges using Hopf/spider laws."""
        add: Dict[EdgeType.Type,List[ET]] = {EdgeType.SIMPLE: [], EdgeType.HADAMARD: []} # list of edges and h-edges to add
        new_type: Optional[EdgeType.Type]
        remove: List = []   # list of edges to remove
        for e,(n1,n2) in etab.items():
            v1,v2 = self.edge_st(e)
            t1 = self.type(v1)
            t2 = self.type(v2)
            conn_type = self.edge_type(e)
            if conn_type == EdgeType.SIMPLE: n1 += 1 #and add to the relevant edge count
            elif conn_type == EdgeType.HADAMARD: n2 += 1

            if n1 + n2 <= 1: # We first deal with simple edges
                if n1 == 1: new_type = EdgeType.SIMPLE
                elif n2 == 1: new_type = EdgeType.HADAMARD
                else: new_type = None
            # Hence, all the other cases have some kind of parallel edge
            elif t1 == VertexType.BOUNDARY or t2 == VertexType.BOUNDARY:
                raise ValueError("Parallel edges to a boundary edge are not supported")
            elif t1 == t2 and vertex_is_zx(t1): #types are ZX & equal,
                n1 = bool(n1)            #so normal edges fuse
                pairs, n2 = divmod(n2,2) #while hadamard edges go modulo 2
                self.scalar.add_power(-2*pairs)
                if n1 != 0 and n2 != 0:  #reduction rule for when both edges appear
                    new_type = EdgeType.SIMPLE
                    self.add_to_phase(v1, 1)
                    self.scalar.add_power(-1)
                elif n1 != 0: new_type = EdgeType.SIMPLE
                elif n2 != 0: new_type = EdgeType.HADAMARD
                else: new_type = None
            elif t1 != t2 and vertex_is_zx(t1) and vertex_is_zx(t2): #types are ZX & different
                pairs, n1 = divmod(n1,2) #so normal edges go modulo 2
                n2 = bool(n2)            #while hadamard edges fuse
                self.scalar.add_power(-2*pairs)
                if n1 != 0 and n2 != 0:  #reduction rule for when both edges appear
                    new_type = EdgeType.HADAMARD
                    self.add_to_phase(v1, 1)
                    self.scalar.add_power(-1)
                elif n1 != 0: new_type = EdgeType.SIMPLE
                elif n2 != 0: new_type = EdgeType.HADAMARD
                else: new_type = None
            elif t1 == VertexType.H_BOX or t2 == VertexType.H_BOX:
                # TODO: Check scalar accuracy
                if t1 != VertexType.H_BOX: # Ensure that the first vertex is an H-box
                    v1,v2 = v2,v1
                    t1,t2 = t2,t1
                if t2 == VertexType.H_BOX: # They are both H-boxes
                    raise ValueError("Parallel edges between H-boxes are not supported")
                elif t2 == VertexType.Z: # Z & H-box
                    n1 = bool(n1) # parallel regular edges collapse to single wire
                    if n2 > 1: raise ValueError("Parallel H-edges between H-box and Z-spider are not supported")
                    #if n2 and (n2-1) % 2 == 1: # parallel H-edges also collapse, but each extra one adds a pi phase
                    #    self.add_to_phase(v2, 1)
                    #n2 = bool(n2)
                    if n1 and n2:
                        # There is no simple way to deal with a parallel H-edge and regular edge
                        # So we simply add a 2-ary H-box to the graph
                        r1,r2 = self.row(v1), self.row(v2)
                        q1,q2 = self.qubit(v1), self.qubit(v2)
                        w = self.add_vertex(VertexType.H_BOX,(q1+q2)/2,(r1+r2)/2-0.5)
                        add[EdgeType.SIMPLE].extend([self.edge(v1,w),self.edge(v2,w)])
                        new_type = EdgeType.SIMPLE
                    elif n1: new_type = EdgeType.SIMPLE
                    elif n2: new_type = EdgeType.HADAMARD
                    else: new_type = None
                elif t2 == VertexType.X: # X & H-box
                    n2 = bool(n2) # parallel H-edges collapse to single wire
                    if n1 > 1: raise ValueError("Parallel edges between H-box and X-spider are not supported")
                    #if (n1-1) % 2 == 1: # parallel regular edges also collapse, but each extra one adds a pi phase
                    #    self.add_to_phase(v2, 1)
                    #n1 = bool(n1)
                    if n1 and n2:
                        # There is no simple way to deal with a parallel H-edge and regular edge
                        # So we simply add a 2-ary H-box to the graph
                        r1,r2 = self.row(v1), self.row(v2)
                        q1,q2 = self.qubit(v1), self.qubit(v2)
                        w = self.add_vertex(VertexType.H_BOX,(q1+q2)/2,(r1+r2)/2-0.5)
                        add[EdgeType.SIMPLE].extend([self.edge(v1,w),self.edge(v2,w)])
                        new_type = EdgeType.SIMPLE
                    elif n1: new_type = EdgeType.SIMPLE
                    elif n2: new_type = EdgeType.HADAMARD
                    else: new_type = None
                else:
                    raise ValueError("Unhandled parallel edges between nodes of type (%s,%s)" % (t1,t2))
            else:
                raise ValueError("Unhandled parallel edges between nodes of type (%s,%s)" % (t1,t2))

            if new_type: # The vertices should be connected, so update the graph
                if not conn_type: #new edge added
                    add[new_type].append(self.edge(v1,v2))
                elif conn_type != new_type: #type of edge has changed
                    self.set_edge_type(self.edge(v1,v2), new_type)
            elif conn_type: #They were connected, but not anymore, so update the graph
                remove.append(self.edge(v1,v2))

        self.remove_edges(remove)
        self.add_edges(add[EdgeType.SIMPLE],EdgeType.SIMPLE)
        self.add_edges(add[EdgeType.HADAMARD],EdgeType.HADAMARD)

    def add_edge_smart(self, e: ET, edgetype: EdgeType.Type):
        """Like add_edge, but does the right thing if there is an existing edge."""
        self.add_edge_table({e : [1,0] if edgetype == EdgeType.SIMPLE else [0,1]})

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


    def remove_vertices(self, vertices: Iterable[VT]) -> None:
        """Removes the list of vertices from the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def remove_vertex(self, vertex: VT) -> None:
        """Removes the given vertex from the graph."""
        self.remove_vertices([vertex])

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

    def remove_edges(self, edges: List[ET]) -> None:
        """Removes the list of edges from the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def remove_edge(self, edge: ET) -> None:
        """Removes the given edge from the graph."""
        self.remove_edges([edge])

    def num_vertices(self) -> int:
        """Returns the amount of vertices in the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def num_edges(self) -> int:
        """Returns the amount of edges in the graph"""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def vertices(self) -> Sequence[VT]:
        """Iterator over all the vertices."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def edges(self) -> Sequence[ET]:
        """Iterator that returns all the edges. Output type depends on implementation in backend."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def vertex_set(self) -> Set[VT]:
        """Returns the vertices of the graph as a Python set. 
        Should be overloaded if the backend supplies a cheaper version than this."""
        return set(self.vertices())

    def edge_set(self) -> Set[ET]:
        """Returns the edges of the graph as a Python set. 
        Should be overloaded if the backend supplies a cheaper version than this."""
        return set(self.edges())

    def edge(self, s:VT, t:VT) -> ET:
        """Returns the edge object with the given source/target."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def edge_st(self, edge: ET) -> Tuple[VT, VT]:
        """Returns a tuple of source/target of the given edge."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)
    def edge_s(self, edge: ET) -> VT:
        """Returns the source of the given edge."""
        return self.edge_st(edge)[0]
    def edge_t(self, edge: ET) -> VT:
        """Returns the target of the given edge."""
        return self.edge_st(edge)[1]

    def neighbors(self, vertex: VT) -> Sequence[VT]:
        """Returns all neighboring vertices of the given vertex."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def vertex_degree(self, vertex: VT) -> int:
        """Returns the degree of the given vertex."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def incident_edges(self, vertex: VT) -> Sequence[ET]:
        """Returns all neighboring edges of the given vertex."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def connected(self,v1: VT,v2: VT) -> bool:
        """Returns whether vertices v1 and v2 share an edge."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def edge_type(self, e: ET) -> EdgeType.Type:
        """Returns the type of the given edge:
        ``EdgeType.SIMPLE`` if it is regular, ``EdgeType.HADAMARD`` if it is a Hadamard edge,
        0 if the edge is not in the graph."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)
    def set_edge_type(self, e: ET, t: EdgeType.Type) -> None:
        """Sets the type of the given edge."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

    def type(self, vertex: VT) -> VertexType.Type:
        """Returns the type of the given vertex:
        VertexType.BOUNDARY if it is a boundary, VertexType.Z if it is a Z node,
        VertexType.X if it is a X node, VertexType.H_BOX if it is an H-box."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)
    def types(self) -> Mapping[VT, VertexType.Type]:
        """Returns a mapping of vertices to their types."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)
    def set_type(self, vertex: VT, t: VertexType.Type) -> None:
        """Sets the type of the given vertex to t."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def phase(self, vertex: VT) -> FractionLike:
        """Returns the phase value of the given vertex."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def phases(self) -> Mapping[VT, FractionLike]:
        """Returns a mapping of vertices to their phase values."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def set_phase(self, vertex: VT, phase: FractionLike) -> None:
        """Sets the phase of the vertex to the given value."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def add_to_phase(self, vertex: VT, phase: FractionLike) -> None:
        """Add the given phase to the phase value of the given vertex."""
        self.set_phase(vertex,self.phase(vertex)+phase)

    def qubit(self, vertex: VT) -> FloatInt:
        """Returns the qubit index associated to the vertex. 
        If no index has been set, returns -1."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def qubits(self) -> Mapping[VT,FloatInt]:
        """Returns a mapping of vertices to their qubit index."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def set_qubit(self, vertex: VT, q: FloatInt) -> None:
        """Sets the qubit index associated to the vertex."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def row(self, vertex: VT) -> FloatInt:
        """Returns the row that the vertex is positioned at. 
        If no row has been set, returns -1."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def rows(self) -> Mapping[VT, FloatInt]:
        """Returns a mapping of vertices to their row index."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def set_row(self, vertex: VT, r: FloatInt) -> None:
        """Sets the row the vertex should be positioned at."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)

    def is_ground(self, vertex: VT) -> bool:
        """Returns a boolean indicating if the vertex is connected to a ground."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def grounds(self) -> Set[VT]:
        """Returns the set of vertices connected to a ground."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def set_ground(self, vertex: VT, flag: bool=True) -> None:
        """Connect or disconnect the vertex to a ground."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def is_hybrid(self) -> bool:
        """Returns whether this is a hybrid quantum-classical graph,
        i.e. a graph with ground generators."""
        return bool(self.grounds())

    def set_position(self, vertex: VT, q: FloatInt, r: FloatInt):
        """Set both the qubit index and row index of the vertex."""
        self.set_qubit(vertex, q)
        self.set_row(vertex, r)

    def vdata_keys(self, vertex: VT) -> Sequence[str]:
        """Returns an iterable of the vertex data key names.
        Used e.g. in making a copy of the graph in a backend-independent way."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def vdata(self, vertex: VT, key: str, default: Any=0) -> Any:
        """Returns the data value of the given vertex associated to the key.
        If this key has no value associated with it, it returns the default value."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
    def set_vdata(self, vertex: VT, key: str, val: Any) -> None:
        """Sets the vertex data associated to key to val."""
        raise NotImplementedError("Not implemented on backend" + type(self).backend)
