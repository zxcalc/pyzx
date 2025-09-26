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

import json
import re
import ast
from fractions import Fraction
from typing import List, Dict, Tuple, Any, Optional, Callable, Union, TYPE_CHECKING

from pyzx.graph.multigraph import Multigraph

from ..utils import FractionLike, EdgeType, VertexType, phase_to_s
from .graph import Graph
from .scalar import Scalar
from .base import BaseGraph, VT, ET
from ..simplify import id_simp
from ..symbolic import parse, Poly, new_var
if TYPE_CHECKING:
    from .diff import GraphDiff
    from .multigraph import Multigraph


def string_to_phase(string: str, g: Union[BaseGraph,'GraphDiff']) -> Union[Fraction, Poly]:
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
            return new_var(name, is_bool=g.var_registry.get_type(name, False), registry=g.var_registry)
        try:
            return parse(string, _new_var)
        except Exception as e:
            raise ValueError(e)

def json_to_graph_old(js: Union[str,Dict[str,Any]], backend:Optional[str]=None) -> BaseGraph:
    """This method is deprecated. Use `json_to_graph` or `dict_to_graph` instead.

    Converts the json representation of a .qgraph Quantomatic graph into
    a pyzx graph. If JSON is given as a string, parse it first."""
    if isinstance(js, str):
        j = json.loads(js)
    else:
        j = js
    g = Graph(backend)
    g.variable_types = j.get('variable_types',{})

    names: Dict[str, Any] = {} # TODO: Any = VT
    hadamards: Dict[str, List[Any]] = {}
    for name,attr in j.get('node_vertices',{}).items():
        if ('data' in attr and 'type' in attr['data'] and attr['data']['type'] == "hadamard"
            and 'is_edge' in attr['data'] and attr['data']['is_edge'] == 'true'):
            hadamards[name] = []
            continue
        c = attr['annotation']['coord']
        q, r = -c[1], c[0]
        if q == int(q): q = int(q)
        if r == int(r): r = int(r)
        v = g.add_vertex(qubit=q, row=r)
        g.set_vdata(v,'name',name)
        names[name] = v
        if 'data' in attr:
            d = attr['data']
            if not 'type' in d or d['type'] == 'Z': g.set_type(v,VertexType.Z)
            elif d['type'] == 'X': g.set_type(v,VertexType.X)
            elif d['type'] == 'hadamard': g.set_type(v,VertexType.H_BOX)
            elif d['type'] == 'W_input': g.set_type(v,VertexType.W_INPUT)
            elif d['type'] == 'W_output': g.set_type(v,VertexType.W_OUTPUT)
            elif d['type'] == 'Z_box': g.set_type(v,VertexType.Z_BOX)
            else: raise TypeError("unsupported type '{}'".format(d['type']))
            if 'value' in d:
                g.set_phase(v,string_to_phase(d['value'],g))
            else:
                g.set_phase(v,Fraction(0,1))
            if d.get('ground', False):
                g.set_ground(v)
        else:
            g.set_type(v,VertexType.Z)
            g.set_phase(v,Fraction(0,1))
        for key, value in attr['annotation'].items():
            if key == 'coord':
                continue
            elif key == 'label':
                if type(value) != complex:
                    value = string_to_phase(value,g)
            g.set_vdata(v, key, value)

    inputs = {}
    outputs = {}

    for name,attr in j.get('wire_vertices',{}).items():
        ann = attr['annotation']
        c = ann['coord']
        q, r = -c[1], c[0]
        if q == int(q): q = int(q)
        if r == int(r): r = int(r)
        v = g.add_vertex(VertexType.BOUNDARY,q,r)
        g.set_vdata(v,'name',name)
        names[name] = v
        if "input" in ann: inputs[v] = ann["input"]
        if "output" in ann: outputs[v] = ann["output"]
        for key, value in attr['annotation'].items():
            if key in ('boundary','coord','input','output'):
                continue
            g.set_vdata(v, key, value)

    g.set_inputs(tuple(sorted(inputs.keys(),key=lambda v:inputs[v])))
    g.set_outputs(tuple(sorted(outputs.keys(),key=lambda v:outputs[v])))

    edges: Dict[Any, List[int]] = {} # TODO: Any = ET
    for edge in j.get('undir_edges',{}).values():
        n1, n2 = edge['src'], edge['tgt']
        if n1 in hadamards and n2 in hadamards: #Both
            v = g.add_vertex(VertexType.Z)
            name = "v"+str(len(names))
            g.set_vdata(v, 'name',name)
            names[name] = v
            hadamards[n1].append(v)
            hadamards[n2].append(v)
            continue
        if n1 in hadamards:
            hadamards[n1].append(names[n2])
            continue
        if n2 in hadamards:
            hadamards[n2].append(names[n1])
            continue
        if 'type' in edge and edge['type'] == 'w_io':
            g.add_edge((names[n1],names[n2]), EdgeType.W_IO)
            continue

        amount = edges.get((names[n1],names[n2]),[0,0])
        amount[0] += 1
        edges[(names[n1],names[n2])] = amount

    for l in hadamards.values():
        if len(l) != 2: raise TypeError("Can't parse graphs with irregular Hadamard nodes")
        e = tuple(l)
        amount = edges.get(e,[0,0])
        amount[1] += 1
        edges[e] = amount

    if "scalar" in j:
        g.scalar = Scalar.from_json(j["scalar"])
    g.add_edge_table(edges)

    return g

def graph_to_dict(g: BaseGraph[VT,ET], include_scalar: bool=True) -> Dict[str, Any]:
    """Converts a PyZX graph into Python dict for JSON output.
    If include_scalar is set to True (the default), then this includes the value
    of g.scalar with the json, which will also be loaded by the ``from_json`` method."""
    d = {
        "version": 2,
        "backend": g.backend,
        "variable_types": g.variable_types, # Potential source of error: this dictionary is mutable
    }
    if hasattr(g,'name'):
        d['name'] = g.name
    if include_scalar:
        d["scalar"] = g.scalar.to_dict()
    d['inputs'] = g.inputs()
    d['outputs'] = g.outputs()
    # Convert tuple keys to strings for JSON compatibility, replacing EdgeType with its integer value
    # This only applies to edata in Multigraph. For other classes, it returns str(k)
    def edata_key_to_str(k):
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
            d_v['phase'] = phase_to_s(g.phase(v))
        vdata_keys = g.vdata_keys(v)
        if vdata_keys:
            d_v['data'] = {k: g.vdata(v,k) for k in vdata_keys}
        if g.is_ground(v):
            d_v['is_ground'] = True
        verts.append(d_v)

    edges: List[Tuple[VT,VT,EdgeType]] = []
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


def graph_to_dict_old(g: BaseGraph[VT,ET], include_scalar: bool=True) -> Dict[str, Any]:
    """This method is deprecated, and replaced by `graph_to_dict`.
    Converts a PyZX graph into Python dict for JSON output that is compatible with the Quantomatic format.
    If include_scalar is set to True (the default), then this includes the value
    of g.scalar with the json, which will also be loaded by the ``from_json`` method."""
    node_vs: Dict[str, Dict[str, Any]] = {}
    wire_vs: Dict[str, Dict[str, Any]] = {}
    edges: Dict[str, Dict[str, str]] = {}
    names: Dict[VT, str] = {}
    freenamesv = ["v"+str(i) for i in range(g.num_vertices()+g.num_edges())]
    freenamesb = ["b"+str(i) for i in range(g.num_vertices())]
    inputs = g.inputs()
    outputs = g.outputs()
    for v in g.vertices():
        t = g.type(v)
        coord = [round(g.row(v),3),round(-g.qubit(v),3)]
        name = g.vdata(v, 'name')
        if not name:
            if t == VertexType.BOUNDARY: name = freenamesb.pop(0)
            else: name = freenamesv.pop(0)
        else:
            try:
                freenamesb.remove(name) if t==VertexType.BOUNDARY else freenamesv.remove(name)
            except:
                pass

        names[v] = name
        if t == VertexType.BOUNDARY:
            wire_vs[name] = {"annotation":{"boundary":True,"coord":coord}}
            if v in inputs:
                wire_vs[name]["annotation"]["input"] = inputs.index(v)
            if v in outputs:
                wire_vs[name]["annotation"]["output"] = outputs.index(v)

            for key in g.vdata_keys(v):
                if key in wire_vs[name]["annotation"]:
                    continue
                wire_vs[name]["annotation"][key] = g.vdata(v, key)
        else:
            node_vs[name] = {"annotation": {"coord":coord},"data":{}}
            if t==VertexType.Z:
                node_vs[name]["data"]["type"] = "Z"
            elif t==VertexType.X:
                node_vs[name]["data"]["type"] = "X"
            elif t==VertexType.H_BOX:
                node_vs[name]["data"]["type"] = "hadamard"
                node_vs[name]["data"]["is_edge"] = "false"
            elif t==VertexType.W_INPUT:
                node_vs[name]["data"]["type"] = "W_input"
            elif t==VertexType.W_OUTPUT:
                node_vs[name]["data"]["type"] = "W_output"
            elif t==VertexType.Z_BOX:
                node_vs[name]["data"]["type"] = "Z_box"
                zbox_label = g.vdata(v, 'label', 1)
                if type(zbox_label) == Fraction:
                    zbox_label = phase_to_s(zbox_label)
                node_vs[name]["annotation"]["label"] = zbox_label
            else: raise Exception("Unkown vertex type "+ str(t))
            phase = phase_to_s(g.phase(v))
            if phase: node_vs[name]["data"]["value"] = phase
            if g.is_ground(v):
                node_vs[name]["data"]["ground"] = True
            if not node_vs[name]["data"]: del node_vs[name]["data"]
            for key in g.vdata_keys(v):
                if key in node_vs[name]["annotation"]:
                    continue
                node_vs[name]["annotation"][key] = g.vdata(v, key)

    i = 0
    for e in g.edges():
        src,tgt = g.edge_st(e)
        et = g.edge_type(e)
        if et == EdgeType.SIMPLE:
            edges["e"+ str(i)] = {"src": names[src],"tgt": names[tgt]}
            i += 1
        elif et == EdgeType.HADAMARD:
            x1,y1 = g.row(src), -g.qubit(src)
            x2,y2 = g.row(tgt), -g.qubit(tgt)
            hadname = freenamesv.pop(0)
            node_vs[hadname] = {"annotation": {"coord":[round((x1+x2)/2.0,3),round((y1+y2)/2.0,3)]},
                             "data": {"type": "hadamard","is_edge": "true"}}
            edges["e"+str(i)] = {"src": names[src],"tgt": hadname}
            i += 1
            edges["e"+str(i)] = {"src": names[tgt],"tgt": hadname}
            i += 1
        elif et == EdgeType.W_IO:
            edges["e"+str(i)] = {"src": names[src],"tgt": names[tgt], "type": "w_io"}
            i += 1
        else:
            raise TypeError("Edge of type 0")

    d: Dict[str,Any] = {
        "wire_vertices": wire_vs,
        "node_vertices": node_vs,
        "undir_edges": edges,
        "variable_types": g.variable_types,
    }
    if include_scalar:
        d["scalar"] = g.scalar.to_dict()

    return d

def graph_to_json(g: BaseGraph[VT,ET], include_scalar: bool=True) -> str:
    """Converts a PyZX graph into JSON output compatible with Quantomatic.
    If include_scalar is set to True (the default), then this includes the value
    of g.scalar with the json, which will also be loaded by the ``from_json`` method."""
    return json.dumps(graph_to_dict(g, include_scalar))

def dict_to_graph(d: Dict[str,Any], backend: Optional[str]=None) -> BaseGraph:
    """Converts a Python dict representation a graph produced by `graph_to_dict` into
    a pyzx Graph.
    If backend is given, it will be used as the backend for the graph, 
    otherwise the backend will be read from the dict description."""
    if not 'version' in d:
        # "Version is not specified in dictionary, will try to parse it as an older format")
        return json_to_graph_old(d, backend)
    else:
        if d['version'] != 2:
            raise ValueError("Unsupported version "+str(d['version']))
    if backend == None:
        backend = d.get('backend', None)
        if backend is None: raise ValueError("No backend specified in dictionary")
    
    g = Graph(backend)
    g.variable_types = d.get('variable_types',{})
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
                g.set_vdata(v,k,val)

    if 'edata' in d:
        g._edata = {ast.literal_eval(k): v for k, v in d['edata'].items()}  # type: ignore[attr-defined]

    for (s,t,et) in d['edges']:
        g.add_edge((s,t),et)

    return g

def json_to_graph(js: Union[str,Dict[str,Any]], backend:Optional[str]=None) -> BaseGraph:
    """Converts the json representation of a pyzx graph (as a string or dict) into
    a `Graph`. If JSON is given as a string, parse it first."""
    if isinstance(js, str):
        d = json.loads(js)
    else:
        d = js
    return dict_to_graph(d, backend)

def to_graphml(g: BaseGraph[VT,ET]) -> str:
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


