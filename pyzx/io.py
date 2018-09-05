# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

import json
from fractions import Fraction

from .graph.graph import Graph
from .simplify import id_simp

def _quanto_value_to_phase(s):
    if not s: return Fraction(0)
    if r'\pi' in s:
        try:
            r = s.replace(r'\pi','').strip()
            if r.startswith('-'): r = "-1"+r[1:]
            if r.startswith('/'): r = "1"+r
            return Fraction(str(r)) if r else Fraction(1)
        except ValueError:
            raise ValueError("Invalid phase '{}'".format(s))
    return s

def _phase_to_quanto_value(p):
    if not p: return ""
    if isinstance(p, Fraction):
        if p.numerator == -1: v = "-"
        elif p.numerator == 1: v = ""
        else: v = str(p.numerator)
        d = "/"+str(p.denominator) if p.denominator!=1 else ""
        return r"{}\pi{}".format(v,d)
    else: return p
    # if not n: return ""
    # s = str(float(n))
    # return s + r"\pi"


def json_to_graph(js):
    """Converts the json representation of a .qgraph Quantomatic graph into
    a pyzx graph."""
    j = json.loads(str(js))
    g = Graph()
    v = 0
    names = {}
    hadamards = {}
    for name,attr in j.get('node_vertices',{}).items():
        if 'data' in attr and 'type' in attr['data'] and attr['data']['type'] == "hadamard":
            hadamards[name] = []
            continue
        c = attr['annotation']['coord']
        g.add_vertex(qubit=-c[1], row=c[0])
        g.set_vdata(v,'name',name)
        names[name] = v
        if 'data' in attr:
            d = attr['data']
            if not 'type' in d or d['type'] == 'Z': g.set_type(v,1)
            elif d['type'] == 'X': g.set_type(v,2)
            else: raise TypeError("unsupported type '{}'".format(d['type']))
            if 'value' in d:
                g.set_phase(v,_quanto_value_to_phase(d['value']))
            else:
                g.set_phase(v,Fraction(0,1))
        else:
            g.set_type(v,1)
            g.set_phase(v,Fraction(0,1))
        
        #g.set_vdata(v, 'x', c[0])
        #g.set_vdata(v, 'y', c[1])
        v += 1
    for name,attr in j.get('wire_vertices',{}).items():
        ann = attr['annotation']
        c = ann['coord']
        g.add_vertex(0,-c[1],c[0])
        g.set_vdata(v,'name',name)
        names[name] = v
        if "input" in ann and ann["input"]: g.inputs.append(v)
        if "output" in ann and ann["output"]: g.outputs.append(v)
        #g.set_vdata(v, 'x', c[0])
        #g.set_vdata(v, 'y', c[1])
        v += 1

    edges = {}
    for edge in j.get('undir_edges',{}).values():
        n1, n2 = edge['src'], edge['tgt']
        if n1 in hadamards and n2 in hadamards: #Both 
            g.add_vertex(ty=1)
            name = "v"+str(len(names))
            g.set_vdata(v, 'name',name)
            names[name] = v
            hadamards[n1].append(v)
            hadamards[n2].append(v)
            v+=1
            continue
        if n1 in hadamards: 
            hadamards[n1].append(names[n2])
            continue
        if n2 in hadamards:
            hadamards[n2].append(names[n1])
            continue

        v = edges.get((names[n1],names[n2]),[0,0])
        v[0] += 1
        edges[(names[n1],names[n2])] = v

    for l in hadamards.values():
        if len(l) != 2: raise TypeError("Can't parse graphs with irregular Hadamard nodes")
        v = edges.get(tuple(l),[0,0])
        v[1] += 1
        edges[tuple(l)] = v
    g.add_edge_table(edges)

    return g

def graph_to_json(g):
    """Converts a PyZX graph into JSON output compatible with Quantomatic."""
    node_vs = {}
    wire_vs = {}
    edges = {}
    names = {}
    freenamesv = ["v"+str(i) for i in range(g.num_vertices()+g.num_edges())]
    freenamesb = ["b"+str(i) for i in range(g.num_vertices())]
    for v in g.vertices():
        t = g.type(v)
        coord = [g.row(v),-g.qubit(v)]
        name = g.vdata(v, 'name')
        if not name:
            if t == 0: name = freenamesb.pop(0)
            else: name = freenamesv.pop(0)
        else: 
            try:
                freenamesb.remove(name) if t==0 else freenamesv.remove(name)
            except:
                pass
                #print("couldn't remove name '{}'".format(name))
        
        names[v] = name
        if t == 0:
            wire_vs[name] = {"annotation":{"boundary":True,"coord":coord,
                                           "input":(v in g.inputs), "output":(v in g.outputs)}}
        else:
            node_vs[name] = {"annotation": {"coord":coord},"data":{}}
            if t==2: node_vs[name]["data"]["type"] = "X"
            elif t==1:node_vs[name]["data"]["type"] = "Z"
            elif t!=1: raise Exception("Unkown type "+ str(t))
            phase = _phase_to_quanto_value(g.phase(v))
            if phase: node_vs[name]["data"]["value"] = phase
            if not node_vs[name]["data"]: del node_vs[name]["data"]

    i = 0
    for e in g.edges():
        src,tgt = g.edge_st(e)
        t = g.edge_type((src,tgt))
        if t == 1:
            edges["e"+ str(i)] = {"src": names[src],"tgt": names[tgt]}
            i += 1
        elif t==2: #hadamard edge
            x1,y1 = g.row(src), -g.qubit(src)
            x2,y2 = g.row(tgt), -g.qubit(tgt)
            hadname = freenamesv.pop(0)
            node_vs[hadname] = {"annotation": {"coord":[(x1+x2)/2.0,(y1+y2)/2.0]},
                             "data": {"type": "hadamard"}}
            edges["e"+str(i)] = {"src": names[src],"tgt": hadname}
            i += 1
            edges["e"+str(i)] = {"src": names[tgt],"tgt": hadname}
            i += 1
        else:
            raise TypeError("Edge of type 0")


    return json.dumps({"wire_vertices": wire_vs, 
            "node_vertices": node_vs, 
            "undir_edges": edges})