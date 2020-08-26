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

import json
from fractions import Fraction
from typing import List, Dict, Any

from .utils import FractionLike # type: ignore
from .graph import Graph, EdgeType, VertexType # type: ignore
from .graph.base import BaseGraph, VT, ET # type: ignore
from .simplify import id_simp # type: ignore

__all__ = ['json_to_graph', 'graph_to_json', 'to_graphml']

def _quanto_value_to_phase(s: str) -> Fraction:
    if not s: return Fraction(0)
    if r'\pi' in s:
        try:
            r = s.replace(r'\pi','').strip()
            if r.startswith('-'): r = "-1"+r[1:]
            if r.startswith('/'): r = "1"+r
            return Fraction(str(r)) if r else Fraction(1)
        except ValueError:
            raise ValueError("Invalid phase '{}'".format(s))
    return Fraction(s)

def _phase_to_quanto_value(p: FractionLike) -> str:
    if not p: return ""
    p = Fraction(p)
    if p.numerator == -1: v = "-"
    elif p.numerator == 1: v = ""
    else: v = str(p.numerator)
    d = "/"+str(p.denominator) if p.denominator!=1 else ""
    return r"{}\pi{}".format(v,d)


def json_to_graph(js: str) -> BaseGraph:
    """Converts the json representation of a .qgraph Quantomatic graph into
    a pyzx graph."""
    print("Deprecated. Please use zx.Graph.from_json() instead.")
    j = json.loads(js)
    g = Graph()

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
            else: raise TypeError("unsupported type '{}'".format(d['type']))
            if 'value' in d:
                g.set_phase(v,_quanto_value_to_phase(d['value']))
            else:
                g.set_phase(v,Fraction(0,1))
        else:
            g.set_type(v,VertexType.Z)
            g.set_phase(v,Fraction(0,1))
        
        #g.set_vdata(v, 'x', c[0])
        #g.set_vdata(v, 'y', c[1])
    for name,attr in j.get('wire_vertices',{}).items():
        ann = attr['annotation']
        c = ann['coord']
        q, r = -c[1], c[0]
        if q == int(q): q = int(q)
        if r == int(r): r = int(r)
        v = g.add_vertex(VertexType.BOUNDARY,q,r)
        g.set_vdata(v,'name',name)
        names[name] = v
        if "input" in ann and ann["input"]: g.inputs.append(v)
        if "output" in ann and ann["output"]: g.outputs.append(v)
        #g.set_vdata(v, 'x', c[0])
        #g.set_vdata(v, 'y', c[1])

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

        amount = edges.get(g.edge(names[n1],names[n2]),[0,0])
        amount[0] += 1
        edges[g.edge(names[n1],names[n2])] = amount

    for l in hadamards.values():
        if len(l) != 2: raise TypeError("Can't parse graphs with irregular Hadamard nodes")
        e = g.edge(*tuple(l))
        amount = edges.get(e,[0,0])
        amount[1] += 1
        edges[e] = amount
    g.add_edge_table(edges)

    return g

def graph_to_json(g: BaseGraph[VT,ET]) -> str:
    """Converts a PyZX graph into JSON output compatible with Quantomatic."""
    print("Deprecated. Please use g.to_json() instead (for a given graph g).")
    node_vs: Dict[str, Dict[str, Any]] = {}
    wire_vs: Dict[str, Dict[str, Any]] = {}
    edges: Dict[str, Dict[str, str]] = {}
    names: Dict[VT, str] = {}
    freenamesv = ["v"+str(i) for i in range(g.num_vertices()+g.num_edges())]
    freenamesb = ["b"+str(i) for i in range(g.num_vertices())]
    for v in g.vertices():
        t = g.type(v)
        coord = [g.row(v),-g.qubit(v)]
        name = g.vdata(v, 'name')
        if not name:
            if t == VertexType.BOUNDARY: name = freenamesb.pop(0)
            else: name = freenamesv.pop(0)
        else: 
            try:
                freenamesb.remove(name) if t==VertexType.BOUNDARY else freenamesv.remove(name) # type: ignore
            except:
                pass
                #print("couldn't remove name '{}'".format(name))
        
        names[v] = name
        if t == VertexType.BOUNDARY:
            wire_vs[name] = {"annotation":{"boundary":True,"coord":coord,
                                           "input":(v in g.inputs), "output":(v in g.outputs)}}
        else:
            node_vs[name] = {"annotation": {"coord":coord},"data":{}}
            if t==VertexType.Z:
                node_vs[name]["data"]["type"] = "Z"
            elif t==VertexType.X:
                node_vs[name]["data"]["type"] = "X"
            elif t==VertexType.H_BOX:
                node_vs[name]["data"]["type"] = "hadamard"
                node_vs[name]["data"]["is_edge"] = "false"
            else: raise Exception("Unkown vertex type "+ str(t))
            phase = _phase_to_quanto_value(g.phase(v))
            if phase: node_vs[name]["data"]["value"] = phase
            if not node_vs[name]["data"]: del node_vs[name]["data"]

    i = 0
    for e in g.edges():
        src,tgt = g.edge_st(e)
        t = g.edge_type(e)
        if t == EdgeType.SIMPLE:
            edges["e"+ str(i)] = {"src": names[src],"tgt": names[tgt]}
            i += 1
        elif t==EdgeType.HADAMARD:
            x1,y1 = g.row(src), -g.qubit(src)
            x2,y2 = g.row(tgt), -g.qubit(tgt)
            hadname = freenamesv.pop(0)
            node_vs[hadname] = {"annotation": {"coord":[(x1+x2)/2.0,(y1+y2)/2.0]},
                             "data": {"type": "hadamard","is_edge": "true"}}
            edges["e"+str(i)] = {"src": names[src],"tgt": hadname}
            i += 1
            edges["e"+str(i)] = {"src": names[tgt],"tgt": hadname}
            i += 1
        else:
            raise TypeError("Edge of type 0")


    return json.dumps({"wire_vertices": wire_vs, 
            "node_vertices": node_vs, 
            "undir_edges": edges})

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
    print("Deprecated. Please use g.to_graphml() instead (where g is a Graph instance).")

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
