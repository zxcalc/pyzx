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
import random

from ..utils import EdgeType, VertexType, get_z_box_label, set_z_box_label, toggle_edge, vertex_is_z_like, vertex_is_zx, toggle_vertex, vertex_is_w, get_w_partner, vertex_is_zx_like
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
ET = TypeVar('ET', bound=Tuple[int,int]) # The type used for representing edges (e.g. a pair of integers)

class BaseGraph(Generic[VT, ET], metaclass=DocstringMeta):
    """Base class for letting graph backends interact with PyZX.
    For a backend to work with PyZX, there should be a class that implements
    all the methods of this class. For implementations of this class see
    :class:`~pyzx.graph.graph_s.GraphS` or :class:`~pyzx.graph.graph_ig.GraphIG`."""

    backend: ClassVar[str] = 'None'

    def __init__(self) -> None:
        self.scalar: Scalar = Scalar()
        
        # Tracker for phase teleportation and simplifications
        self.phase_tracking: bool = False
        self.phase_teleporter: Optional['simplify.PhaseTeleporter'] = None
        self.parent_vertex: Dict[VT, VT] = {}
        self.vertex_groups: Dict[VT, int] = {}
        self.group_data: Dict[int, Set[VT]] = {}
        self.phase_sum: Dict[int, FractionLike] = {}
        self.phase_mult: Dict[VT, int] = {}
        self.vertex_rank: Dict[VT, int] = {}
        self.vertices_to_update: List[VT] = []

        # merge_vdata(v0,v1) is an optional, custom function for merging
        # vdata of v1 into v0 during spider fusion etc.
        self._vdata: Dict[VT,Dict[str,Any]] = dict()
        self.merge_vdata: Optional[Callable[[VT,VT], None]] = None
        self.variable_types: Dict[str,bool] = dict() # mapping of variable names to their type (bool or continuous)

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
        g.scalar = self.scalar.copy()
        g.merge_vdata = self.merge_vdata
        mult:int = 1
        if adjoint: mult = -1

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
        Returns an identical copy of the graph, without any relabeling
        """
        raise NotImplementedError("Not implemented on backend " + type(self).backend)
    
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
        other = other.copy()
        outputs = self.outputs()
        inputs = other.inputs()
        if len(outputs) != len(inputs):
            raise TypeError("Outputs of first graph must match inputs of second.")

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
                w = self.add_vertex(other.type(v),
                        phase=other.phase(v),
                        qubit=other.qubit(v),
                        row=offset + other.row(v),
                        ground=other.is_ground(v))
                if v in other._vdata: self._vdata[w] = other._vdata[v]
                vtab[v] = w
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
        vdata = other._vdata
        vertex_map = dict()
        for v in other.vertices():
            w = g.add_vertex(ts[v],qs[v]+height,rs[v],phases[v],g.is_ground(v))
            if v in vdata: g._vdata[w] = vdata[v]
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
        grounds = other.grounds()

        vert_map = dict()
        edges = []
        for v in other.vertices():
            w = self.add_vertex(ty[v],qs[v],rs[v],phase[v],v in grounds)
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
        grounds = self.grounds()

        edges = [self.edge(v,w) for v in verts for w in verts if self.connected(v,w)]

        vert_map = dict()
        for v in verts:
            w = g.add_vertex(ty[v],qs[v],rs[v],phase[v],v in grounds)
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
        return v

    def add_vertex_indexed(self,v:VT) -> None:
        """Adds a vertex that is guaranteed to have the chosen index (i.e. 'name').
        If the index isn't available, raises a ValueError.
        This method is used in the editor and ZXLive to support undo,
        which requires vertices to preserve their index."""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

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
                # self loops are allowed for W nodes. this is a hack to add self-loops using id Z spiders
                if new_type and vertex_is_w(t1) and vertex_is_w(t2) and \
                    (v1 == v2 or v1 == get_w_partner(self, v2)):
                    id_1 = self.add_vertex(VertexType.Z, self.qubit(v1) + 1, self.row(v1) - 0.5)
                    id_2 = self.add_vertex(VertexType.Z, self.qubit(v2) + 1, self.row(v2) + 0.5)
                    add[EdgeType.SIMPLE].extend([self.edge(v1, id_1), self.edge(v2, id_2)])
                    add[new_type].append(self.edge(id_1, id_2))
                    continue
            # Hence, all the other cases have some kind of parallel edge
            elif t1 == VertexType.BOUNDARY or t2 == VertexType.BOUNDARY:
                raise ValueError("Parallel edges to a boundary edge are not supported")
            elif (t1 == t2 and vertex_is_zx(t1)) or \
                (vertex_is_z_like(t1) and vertex_is_z_like(t2)): #types are ZX & equal,
                n1 = bool(n1)            #so normal edges fuse
                pairs, n2 = divmod(n2,2) #while hadamard edges go modulo 2
                self.scalar.add_power(-2*pairs)
                if n1 != 0 and n2 != 0:  #reduction rule for when both edges appear
                    new_type = EdgeType.SIMPLE
                    if t1 == VertexType.Z_BOX:
                        set_z_box_label(self, v1, get_z_box_label(self, v1) * -1)
                    else:
                        self.add_to_phase(v1, 1)
                    self.scalar.add_power(-1)
                elif n1 != 0: new_type = EdgeType.SIMPLE
                elif n2 != 0: new_type = EdgeType.HADAMARD
                else: new_type = None
            elif t1 != t2 and vertex_is_zx_like(t1) and vertex_is_zx_like(t2): #types are ZX & different
                pairs, n1 = divmod(n1,2) #so normal edges go modulo 2
                n2 = bool(n2)            #while hadamard edges fuse
                self.scalar.add_power(-2*pairs)
                if n1 != 0 and n2 != 0:  #reduction rule for when both edges appear
                    new_type = EdgeType.HADAMARD
                    if t1 == VertexType.Z_BOX:
                        set_z_box_label(self, v1, get_z_box_label(self, v1) * -1)
                    else:
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
                    if n1 and n2:
                        # There is no simple way to deal with a parallel H-edge and regular edge
                        # So we simply add a 2-ary H-box to the graph
                        r1,r2 = self.row(v1), self.row(v2)
                        q1,q2 = self.qubit(v1), self.qubit(v2)
                        w = self.add_vertex(VertexType.H_BOX,(q1+q2)/2,(r1+r2)/2-0.5)
                        add[EdgeType.SIMPLE].extend([self.edge(v1,w),self.edge(v2,w)])
                        new_type = EdgeType.SIMPLE
                        self.scalar.add_power(-1)  # H-boxes are scaled differently than H-edges, so we compensate with 1/sqrt(2) here.
                    elif n1: new_type = EdgeType.SIMPLE
                    elif n2: new_type = EdgeType.HADAMARD
                    else: new_type = None
                elif t2 == VertexType.X:  # X & H-box
                    n2 = bool(n2)  # parallel H-edges collapse to single wire
                    if n1 > 1: raise ValueError("Parallel edges between H-box and X-spider are not supported")
                    if n1 and n2:
                        # There is no simple way to deal with a parallel H-edge and regular edge
                        # So we simply add a 2-ary H-box to the graph
                        r1,r2 = self.row(v1), self.row(v2)
                        q1,q2 = self.qubit(v1), self.qubit(v2)
                        w = self.add_vertex(VertexType.H_BOX,(q1+q2)/2,(r1+r2)/2-0.5)
                        add[EdgeType.SIMPLE].extend([self.edge(v1,w),self.edge(v2,w)])
                        new_type = EdgeType.SIMPLE
                        self.scalar.add_power(-1)  # H-boxes are scaled differently than H-edges, so we compensate with 1/sqrt(2) here.
                    elif n1: new_type = EdgeType.SIMPLE
                    elif n2: new_type = EdgeType.HADAMARD
                    else: new_type = None
                else:
                    raise ValueError("Unhandled parallel edges between nodes of type (%s,%s)" % (t1,t2))
            elif t1 == VertexType.W_OUTPUT or t2 == VertexType.W_OUTPUT:
                # Since we don't yet support parallel edges, we simply add identity Z spiders to hack a parallel edge
                r1,r2 = self.row(v1), self.row(v2)
                q1,q2 = self.qubit(v1), self.qubit(v2)
                id_1 = self.add_vertex(VertexType.Z, (q1 + q2) / 2 - 0.2, (r1 + r2) / 2 - 0.2)
                id_2 = self.add_vertex(VertexType.Z, (q1 + q2) / 2 + 0.2, (r1 + r2) / 2 + 0.2)
                add[EdgeType.SIMPLE].extend([self.edge(v1, id_1), self.edge(v1, id_2)])
                if n1 > 1:
                    add[EdgeType.SIMPLE].extend([self.edge(id_1, v2), self.edge(id_2, v2)])
                elif n2 > 2:
                    add[EdgeType.HADAMARD].extend([self.edge(id_1, v2), self.edge(id_2, v2)])
                else:
                    add[EdgeType.SIMPLE].append(self.edge(id_1, v2))
                    add[EdgeType.HADAMARD].append(self.edge(id_2, v2))
                new_type = None
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

    def set_phase_teleporter(self, teleporter: 'simplify.PhaseTeleporter', fusing_mode: bool = True) -> None:
        """Used for phase teleportation.
        If ``fusing_mode`` is True then phases will be tracked as the graph is simplified.
        Otherwise info about previously teleported phases from ``teleporter`` is stored, but not placed on the graph yet.
        They will then be placed throughout simplification when required, or through the function :func:`place_tracked_phases`

        :param teleporter: Instance of the class :class:`~pyzx.simplify.PhaseTeleporter`
        :param fusing_mode: Defaults to True
        """
        self.phase_tracking = True
        
        if fusing_mode:
            self.phase_teleporter = teleporter
            return
        
        for group_num, group in enumerate(teleporter.get_vertex_groups()):
            if len(group) == 1: continue
            self.group_data[group_num] = set(group) # Groups of vertices fused throughout teleportation
            phase_sum = Fraction(0)
            for v in group:
                self.vertex_rank[v] = teleporter.vertex_rank[v]
                self.vertex_groups[v] = group_num
                mult = teleporter.phase_mult[v]
                self.phase_mult[v] = mult # Associated teleportation phase multiplier
                phase_sum += self.phase(v) * mult
                self.set_phase(v, 0) # Set all stored phases to zero for now
            self.phase_sum[group_num] = phase_sum # Phase sum for each group
    
    def remove_vertex_from_group(self, v: VT, group: int) -> None:
        """Used for post phase teleportation simplifications.
        Removes ``v`` from ``group`` then updates group when required.

        :param v:
        :param group:
        """
        del self.vertex_groups[v]
        del self.phase_mult[v]
        
        group_data = self.group_data[group]
        group_data.remove(v)
        group_len = len(group_data)
        
        if group_len == 1:
            u = next(iter(group_data))
            phase = self.phase_sum[group] * self.phase_mult[u]
            child_u = self.leaf_vertex(u)
            
            self.add_to_phase(child_u, phase)
            
            del self.vertex_groups[u]
            del self.phase_mult[u]
            del self.phase_sum[group]
            del self.group_data[group]
            self.vertices_to_update.append(child_u)
            
            if not self.group_data: self.phase_tracking = False # Turn off phase tracking
            
        elif group_len == 2:
            self.vertices_to_update.extend(self.leaf_vertex(u) for u in group_data) # Some pivots may need to be rechecked
    
    def place_tracked_phases(self, allow_jumping=False) -> None:
        """Used for phase teleportation.
        Places any stored phases onto the graph.
        ``allow_jumping`` defines whether any additional phases are permitted to teleport around during simplification.
        """
        for group, vertices in list(self.group_data.items()):
            v = max(vertices, key = self.vertex_rank.__getitem__)
            phase = self.phase_sum[group] * self.phase_mult[v]
            child_v = self.leaf_vertex(v)
            if not allow_jumping:
                self.add_to_phase(child_v, phase)
                continue
            current_phase = self.phase(child_v)
            self.fix_phase(child_v, current_phase, current_phase + phase)
        
        if allow_jumping: return
        self.vertex_groups.clear()
        self.group_data.clear()
        self.phase_sum.clear()
        self.phase_mult.clear()
        self.phase_tracking = False
    
    def root_vertex(self, v: VT) -> VT:
        """Used for phase teleportation.
        Returns the root vertex from the original graph.

        :param v:
        :return: Either the vertex itself or the vertex from the original graph which it points to.
        """
        while v in self.parent_vertex: v = self.parent_vertex[v]
        return v
    
    def leaf_vertex(self, v: VT) -> VT:
        """Used for phase teleportation.
        Returns the child vertex of a vertex in the current graph.

        :param v:
        :return: Either the vertex itself or the vertex in the current graph which points to it.
        """
        for child, parent in self.parent_vertex.items():
            if parent == v: return self.leaf_vertex(child)
        return v
    
    def fuse_phases(self, v1: VT, v2: VT) -> None:
        """Used for phase teleportation.
        Tracks the fusing of vertex ``v2`` into ``v1``.

        :param v1: Surviving vertex
        :param v2: Vertex to be deleted
        """
        root_v1 = self.root_vertex(v1)
        root_v2 = self.root_vertex(v2)
        
        if self.phase_teleporter: # Fusing mode
            if root_v2 in self.phase_teleporter.non_clifford_vertices:
                if root_v1 in self.phase_teleporter.non_clifford_vertices:
                    self.phase_teleporter.fuse_phases(root_v1,root_v2)
                else: self.parent_vertex[v1] = v2 # v1 now points to v2 (a non-Clifford vertex)
            return
        
        group_1 = self.vertex_groups.get(root_v1)
        group_2 = self.vertex_groups.get(root_v2)
        if group_2 is not None:
            if group_1 is not None:
                if group_1 == group_2: self.remove_vertex_from_group(root_v2, group_2)
                # The below handling of the case when group_1 != group_2 is not optimal
                elif len(self.group_data[group_1]) <= len(self.group_data[group_2]):
                    print('group_1 != group_2')
                    self.remove_vertex_from_group(root_v2, group_2)
                else:
                    print('group_1 != group_2')
                    self.remove_vertex_from_group(root_v1, group_1)
                    rem_v = v1
                    while rem_v in self.parent_vertex:
                        parent = self.parent_vertex[rem_v]
                        del self.parent_vertex[rem_v]
                        rem_v = parent
                    self.parent_vertex[v1] = v2
            else:
                self.parent_vertex[v1] = v2 # v1 now points to v2 (a phase variable)
    
    def unfuse_vertex(self, new_vertex: VT, old_vertex: VT) -> None:
        """Used for phase teleportation.
        Tracks the unfusing of ``old_vertex`` onto ``new_vertex``.

        :param new_vertex:
        :param old_vertex:
        """
        root_old_vertex = self.root_vertex(old_vertex)
        if root_old_vertex in (self.phase_teleporter.non_clifford_vertices if self.phase_teleporter else self.vertex_groups):
            self.parent_vertex[new_vertex] = old_vertex
    
    def phase_negate(self, v: VT) -> None:
        """Used for phase teleportation.
        Tracks when the sign of a phase has been negated (usually as a gadget).

        :param v: Vertex whose sign has been negated
        """
        root_v = self.root_vertex(v)
        
        if self.phase_teleporter: # Fusing mode
            if root_v in self.phase_teleporter.non_clifford_vertices:
                self.phase_teleporter.phase_negate(root_v)
            return
        
        if root_v in self.vertex_groups:
            self.phase_mult[root_v] *= -1
    
    def fix_phase(self, v: VT, current_phase: FractionLike, target_phase: FractionLike) -> None:
        """Used for post phase teleportation simplifications.
        Sets the phase of ``v`` to ``target_phase``, updating the rest of the vertex_group where necessary

        :param v:
        :param current_phase:
        :param target_phase:
        """
        root_v = self.root_vertex(v)
        
        if root_v not in self.vertex_groups:
            assert current_phase == target_phase # In this case the current phase should be the target phase
            return
        
        group = self.vertex_groups[root_v]
        self.phase_sum[group] -= self.phase_mult[root_v] * (target_phase - current_phase)
        self.set_phase(v, target_phase)
        self.remove_vertex_from_group(root_v, group)
    
    def check_phase(self, v: VT, current_phase: FractionLike, target_phase: FractionLike) -> bool:
        """Used for post phase teleportation simplifications.
        Returns a boolean representing whether ``v`` can be fixed to have a phase of ``target_phase``.

        :param v:
        :param current_phase: The current phase of ``v`` in the graph
        :param target_phase:
        :return:
        """
        root_v = self.root_vertex(v)
        if root_v not in self.vertex_groups: return current_phase == target_phase
        return True
    
    def check_two_pauli_phases(self, v1: VT, v1p: FractionLike, v2: VT, v2p: FractionLike) -> Optional[List[Optional[FractionLike]]]:
        """Used for post phase teleportation simplifications.
        Checks whether both ``v1`` and ``v2`` can have their phases fixed to a Pauli phase (i.e. for pivoting)

        :param v1:
        :param v1p: The current phase of ``v1`` in the graph
        :param v2:
        :param v2p: The current phase of ``v2`` in the graph
        :return: List of the two Pauli phases which the vertices can be fixed to. 
                If either cannot be fixed then the value of that list element is None. 
                If either `but only one` vertex can be fixed to Pauli then returns None.
        """
        PAULI = {0,1}
        
        root_v1 = self.root_vertex(v1)
        root_v2 = self.root_vertex(v2)
        group_1 = self.vertex_groups.get(root_v1)
        group_2 = self.vertex_groups.get(root_v2)
        
        if not group_1 and not group_2: return [v1p if v1p in PAULI else None, v2p if v2p in PAULI else None]
        if not group_1: return [v1p if v1p in PAULI else None, 0]
        if not group_2: return [0, v2p if v2p in PAULI else None]
        
        if group_1 == group_2:
            if len(self.group_data[group_1]) > 2: return [0,0] # Can place phase on another vertex in group
            else: # Calculate the resultant phase v2 would have if v1 was fixed to 0
                new_phase_v2 = v2p + self.phase_mult[root_v2] * (self.phase_sum[group_1] + self.phase_mult[root_v1] * v1p)
                if new_phase_v2 in PAULI: return [0, new_phase_v2]
                else: return None # Will get identical result if v2 was fixed to 0 and the resultant phase of v1 was calculated
                
        return [0,0]
    
    def replace(self, g2) -> None:
        """Replaces the metadata in the current graph object with the metadata of ``g2``"""
        raise NotImplementedError("Not implemented on backend " + type(self).backend)

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
