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

def read_quipper_file(fname, backend=None, keynames=('q','r')):
    """Reads in the ASCII description of a circuit as outputted by Quipper."""
    f = open(fname, 'r')
    lines = f.read().splitlines()
    f.close()
    start = lines[0]
    end = lines[-1]
    gates = lines[1:-1]
    if not start.startswith("Inputs: "):
        raise TypeError("File does not start correctly: " + start)
    if start.endswith(','): start = start[:-1]
    inputs = start[8:].split(",")
    
    for i in inputs:
        n, t = i.split(":")
        if t.strip() != "Qbit":
            raise TypeError("Unsupported type " + t)
    
    qubits = len(inputs)
    g = Graph(backend)
    q = list(range(qubits))
    r = 1                     # current rank
    ty = [0] * qubits         # types of vertices
    qs = list(range(qubits))  # tracks qubit indices of vertices
    rs = [0] * qubits         # tracks rank of vertices
    v = qubits                # next vertex to add
    es1 = [] # normal edges to add
    es2 = [] # hadamard edges to add
    phases = {}

    for gate in gates:
        if not gate.startswith("QGate"):
            raise TypeError("Unsupported expression: " + gate)
        l = gate.split("with")
        g = l[0]
        gname = g[g.find('[')+2:g.find(']')-1]
        target = int(g[g.find('(')+1:g.find(')')])
        conj = 1 if g.find("*")==-1 else -1
        if len(l) == 2: #no controls
            if gname == "H": es2.append((q[target],v))
            else: es1.append((q[target],v))
            q[target] = v
            qs.append(target)
            rs.append(r)
            if gname == "not":
                ty.append(2)
                phases[v] = Fraction(1,1)
            elif gname == "Z":
                ty.append(1)
                phases[v] = Fraction(1,1)
            elif gname == "H":
                ty.append(1)
            elif gname == "S":
                ty.append(1)
                phases[v] = Fraction(conj,2)
            elif gname == "T":
                ty.append(1)
                phases[v] = Fraction(conj,4)
            else:
                raise TypeError("Unsupported gate: " + gname)
            v += 1
            r += 1
            continue
        elif len(l) != 3: raise TypeError("Unsupported expression: " + gate)
        ctrls = l[1]
        ctrls = ctrls[ctrls.find('[')+1:ctrls.find(']')]
        if ctrls.find(',')!=-1:
            raise TypeError("Multiple controls are not supported: " + gate)
        if ctrls.find('+')==-1:
            raise TypeError("Unsupported target: " + ctrls)
        ctrl = int(ctrls[1:])
        if gname != "not":
            raise TypeError("Unsupported controlled gate: " + gname)
        es1 += [(q[target],v), (q[ctrl],v+1), (v,v+1)]
        qs += [target,ctrl]
        ty += [2,1]
        rs += [r,r]
        q[target] = v
        q[ctrl] = v+1
        v += 2
        r += 1

    # outputs
    qs += list(range(qubits))
    rs += [r] * qubits
    ty += [0] * qubits
    es1 += [(q[i], v+i) for i in range(qubits)]
    v += qubits

    g = Graph(backend)

    g.add_vertices(v)
    g.add_edges(es1,1)
    g.add_edges(es2,2)

    for i in range(v):
        g.set_type(i, ty[i])
        g.set_vdata(i, keynames[0], qs[i])
        g.set_vdata(i, keynames[1], rs[i])
    for v, phase in phases.items():
        g.set_angle(v,phase)

    for i in range(qubits):
        g.set_vdata(i, 'i', True)
        g.set_vdata(v-i-1, 'o', True)

    #remove the identity nodes introduced for the hadamard gates
    id_simp(g)

    return g




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
    g = Graph('simple')
    v = 0
    names = {}
    hadamards = {}
    for name,attr in j.get('node_vertices',{}).items():
        if 'data' in attr and 'type' in attr['data'] and attr['data']['type'] == "hadamard":
            hadamards[name] = []
            continue
        g.add_vertex()
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
        c = attr['annotation']['coord']
        g.set_vdata(v, 'x', c[0])
        g.set_vdata(v, 'y', c[1])
        v += 1
    for name,attr in j.get('wire_vertices',{}).items():
        g.add_vertex()
        g.set_vdata(v,'name',name)
        names[name] = v
        g.set_type(v,0)
        c = attr['annotation']['coord']
        g.set_vdata(v, 'x', c[0])
        g.set_vdata(v, 'y', c[1])
        v += 1

    edges = {}
    for edge in j.get('undir_edges',{}).values():
        n1, n2 = edge['src'], edge['tgt']
        if n1 in hadamards and n2 in hadamards: #Both 
            g.add_vertex()
            g.set_type(v,1)
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
        coord = [g.vdata(v,'x'),g.vdata(v,'y')]
        name = g.vdata(v, 'name')
        if not name:
            if t == 0: name = freenamesb.pop(0)
            else: name = freenamesv.pop(0)
        else: 
            try:
                freenamesb.remove(name) if t==0 else freenamesv.remove(name)
            except:
                print("couldn't remove name '{}'".format(name))
        
        names[v] = name
        if t == 0:
            wire_vs[name] = {"annotation":{"boundary":True,"coord":coord}}
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
            x1,y1 = g.vdata(src,'x'), g.vdata(src,'y')
            x2,y2 = g.vdata(tgt,'x'), g.vdata(tgt,'y')
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