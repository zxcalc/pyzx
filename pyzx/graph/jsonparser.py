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

__all__ = ['string_to_phase','to_graphml']

import ast
import json
import re
import warnings
from fractions import Fraction
from typing import TYPE_CHECKING, Any

from ..symbolic import Poly, VarRegistry, new_var, parse
from ..utils import EdgeType, VertexType, phase_to_s
from .base import ET, VT, BaseGraph
from .graph import Graph
from .multigraph import Multigraph
from .scalar import Scalar, simplify_poly

if TYPE_CHECKING:
    from .diff import GraphDiff


def string_to_phase(string: str, g: 'BaseGraph | GraphDiff | None' = None) -> Fraction | Poly:
    if not string:
        return Fraction(0)
    try:
        s = string.lower().replace(' ', '')
        s = s.replace('*', '')
        s = re.sub(r'\\?(pi|\u03c0)', '', s)
        if s == '': return Fraction(1)
        if s == '-': return Fraction(-1)
        if '.' in s or 'e' in s:
            return Fraction(float(s))
        elif '/' in s:
            a, b = s.split("/", 2)
            if not a:
                return Fraction(int(1), int(b)) # For some weird reason this int(1) is needed. See PR #234.
            if a == '-':
                a = '-1'
            return Fraction(int(a), int(b))
        else:
            return Fraction(int(s))
    except ValueError:
        def _new_var(name: str) -> Poly:
            if g is None:
                return new_var(name, is_bool=False)
            return new_var(name, is_bool=g.var_registry.get_type(name, False), registry=g.var_registry)
        try:
            poly = parse(string, _new_var)
        except Exception as e:
            raise ValueError(e)
        # A numeric expression that misses the fast path above, like "(1)*1/4", parses
        # to a Poly without variables. Unwrap it so that numeric phases always get a
        # numeric type. See issue #471.
        value = simplify_poly(poly)
        if isinstance(value, (int, Fraction)):
            return Fraction(value)
        return poly

def graph_to_dict(g: BaseGraph[VT, ET], include_scalar: bool = True) -> dict[str, Any]:
    """Converts a PyZX graph into Python dict for JSON output.
    If include_scalar is set to True (the default), then this includes the value
    of g.scalar with the json, which will also be loaded by the ``from_json`` method."""
    d = {
        "version": 2,
        "backend": g.backend,
        "variable_types": g.var_registry.types, # Potential source of error: this dictionary is mutable
    }
    if hasattr(g,'name'):
        d['name'] = getattr(g, 'name')
    if include_scalar:
        d["scalar"] = g.scalar.to_dict()
    d['inputs'] = g.inputs()
    d['outputs'] = g.outputs()
    # Convert tuple keys to strings for JSON compatibility, replacing EdgeType with its integer value
    # This only applies to edata in Multigraph. For other classes, it returns str(k)
    def edata_key_to_str(k: Any) -> str:
        if isinstance(k, tuple) and len(k) == 3 and hasattr(k[2], 'value'):
            return str((k[0], k[1], k[2].value))
        return str(k)
    d['edata'] = {edata_key_to_str(k): v for k, v in g._edata.items()}  # type: ignore[attr-defined]
    if g.backend == 'multigraph':
        d['auto_simplify'] = g.get_auto_simplify()

    verts = []
    for v in g.vertices():
        d_v = {
            'id': v,
            't': g.type(v),
            'pos': (round(g.row(v),3),round(g.qubit(v),3)),
        }
        if g.phase(v):
            d_v['phase'] = phase_to_s(g.phase(v), limit_denominator=False)
        vdata_keys = g.vdata_keys(v)
        if vdata_keys:
            data_dict = {}
            for k in vdata_keys:
                val = g.vdata(v, k)
                if k == 'label':
                    if isinstance(val, (Fraction, Poly)):
                        val = phase_to_s(val, limit_denominator=False)
                    elif isinstance(val, complex):
                        val = str(val)
                data_dict[k] = val
            d_v['data'] = data_dict
        if g.is_ground(v):
            d_v['is_ground'] = True
        verts.append(d_v)

    edges: list[tuple[VT, VT, EdgeType]] = []
    if g.backend == 'multigraph':
        for e in g.edges():
            edges.append(e)  # type: ignore  # We know what we are doing, for multigraphs this has the right type.
    else:
        for e in g.edges():
            src,tgt = g.edge_st(e)
            et = g.edge_type(e)
            edges.append((src,tgt,et))

    d['vertices'] = verts
    d['edges']  = edges
    return d

def graph_to_json(g: BaseGraph[VT, ET], include_scalar: bool = True) -> str:
    """Converts a PyZX graph into JSON output compatible with Quantomatic.
    If include_scalar is set to True (the default), then this includes the value
    of g.scalar with the json, which will also be loaded by the ``from_json`` method."""
    return json.dumps(graph_to_dict(g, include_scalar))

def dict_to_graph(d: dict[str, Any], backend: str | None = None) -> BaseGraph:
    """Converts a Python dict representation a graph produced by `graph_to_dict` into
    a pyzx Graph.
    If backend is given, it will be used as the backend for the graph,
    otherwise the backend will be read from the dict description."""
    if 'version' not in d:
        raise ValueError("No version specified. To load an older format, please use pyzx version 0.10.7 or earlier.")
    else:
        if d['version'] != 2:
            raise ValueError("Unsupported version "+str(d['version']))
    if backend == None:
        backend = d.get('backend', None)
        if backend is None: raise ValueError("No backend specified in dictionary")

    g = Graph(backend)
    g.var_registry = VarRegistry(d.get('variable_types',{}))
    if g.backend == 'multigraph':
        if TYPE_CHECKING:
            assert isinstance(g, Multigraph)
        b = True if d.get('auto_simplify', True) in ('true', True) else False
        g.set_auto_simplify(b)
    for v_d in d['vertices']:
        pos = v_d['pos']
        v = v_d['id']
        g.add_vertex_indexed(v)
        g.set_type(v,v_d['t'])
        g.set_row(v,pos[0])
        g.set_qubit(v,pos[1])
        if 'phase' in v_d:
            g.set_phase(v,string_to_phase(v_d['phase'],g))
        if 'is_ground' in v_d and v_d['is_ground'] == True:
            g.set_ground(v)
        if 'data' in v_d:
            for k,val in v_d['data'].items():
                if k == 'label' and isinstance(val, str):
                    try:
                        val = complex(val)
                    except ValueError:
                        val = string_to_phase(val, g)
                g.set_vdata(v,k,val)

    if 'edata' in d:
        g._edata = {ast.literal_eval(k): v for k, v in d['edata'].items()}  # type: ignore[attr-defined]

    for (s,t,et) in d['edges']:
        g.add_edge((s,t),et)

    if 'inputs' in d:
        g.set_inputs(tuple(d['inputs']))
    if 'outputs' in d:
        g.set_outputs(tuple(d['outputs']))

    if 'scalar' in d:
        g.scalar = Scalar.from_json(d['scalar'])

    return g

def json_to_graph(js: str | dict[str, Any], backend: str | None = None) -> BaseGraph:
    """Converts the json representation of a pyzx graph (as a string or dict) into
    a `Graph`. If JSON is given as a string, parse it first."""
    if isinstance(js, str):
        d = json.loads(js)
    else:
        d = js
    return dict_to_graph(d, backend)

def to_graphml(g: BaseGraph[VT, ET]) -> str:
    gml = """<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<graphml xmlns="http://graphml.graphdrawing.org/xmlns">
    <key attr.name="type" attr.type="int" for="node" id="type">
        <default>1</default>
    </key>
    <key attr.name="phase" attr.type="string" for="node" id="phase">
        <default>0</default>
    </key>
    <key attr.name="edge type" attr.type="int" for="edge" id="etype">
        <default>1</default>
    </key>
    <key attr.name="x" attr.type="double" for="node" id="x">
        <default>0</default>
    </key>
    <key attr.name="y" attr.type="double" for="node" id="y">
        <default>0</default>
    </key>
    <graph edgedefault="undirected">
"""

    for v in g.vertices():
        gml += (
            (8*" " +
             """<node id="{!s}"><data key="type">{!s}</data><data key="phase">{!s}</data>"""+
             """<data key="x">{!s}</data><data key="y">{!s}</data></node>\n"""
            ).format(
                v, g.type(v), g.phase(v), g.row(v) * 100, g.qubit(v) * 100
            ))

    for e in g.edges():
        s,t = g.edge_st(e)
        gml += (
            (8*" " +
             """<edge id="{!s}_{!s}" source="{!s}" target="{!s}">"""+
             """<data key="etype">{!s}</data></edge>\n"""
            ).format(
                s, t, s, t, g.edge_type(e)
            ))
    gml += """
    </graph>
</graphml>
"""

    return gml
