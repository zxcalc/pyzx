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

"""Supplies methods to convert ZX-graphs to tikz files.
These tikz files are designed to be easily readable by the program `Tikzit <https://tikzit.github.io>`_.
"""


import tempfile
import os
import subprocess
import shutil
import time
from fractions import Fraction
from typing import List, Dict, overload, Tuple, Union, Optional

from .utils import settings, EdgeType, VertexType, FloatInt, FractionLike
from .graph.base import BaseGraph, VT, ET
from .graph.graph import Graph
from .circuit import Circuit

TIKZ_BASE = """
\\begin{{tikzpicture}}
    \\begin{{pgfonlayer}}{{nodelayer}}
{vertices}
    \\end{{pgfonlayer}}
    \\begin{{pgfonlayer}}{{edgelayer}}
{edges}
    \\end{{pgfonlayer}}
\\end{{tikzpicture}}
"""

def _to_tikz(g: BaseGraph[VT,ET], 
    xoffset:FloatInt=0, yoffset:FloatInt=0, idoffset:int=0) -> Tuple[List[str],List[str]]:
    """Converts a ZX-graph ``g`` to a string representing a tikz diagram.
    The optional arguments are used by :func:`to_tikz_sequence`.
    """
    verts = []
    maxindex = idoffset
    for v in g.vertices():
        p = g.phase(v)
        ty = g.type(v)
        if ty == VertexType.BOUNDARY:
            style = "none"
        elif ty == VertexType.H_BOX:
            style = "hadamard"
        else:
            style = 'Z' if ty==VertexType.Z else 'X'
            if p != 0: style += " phase"
            style += " dot"
        if (ty == VertexType.H_BOX and p == 1) or (ty != VertexType.H_BOX and p == 0):
            phase = ""
        else:
            ns = '' if p.numerator == 1 else str(p.numerator)
            dn = '' if p.denominator == 1 else str(p.denominator)
            if dn: phase = r"$\frac{%s\pi}{%s}$" % (ns, dn)
            else: phase = r"$%s\pi$" % ns
        x = g.row(v) + xoffset
        y = - g.qubit(v) - yoffset
        s = "        \\node [style={}] ({:d}) at ({:.2f}, {:.2f}) {{{:s}}};".format(style,v+idoffset,x,y,phase) # type: ignore
        verts.append(s)
        maxindex = max([v+idoffset,maxindex]) # type: ignore
    edges = []
    for e in g.edges():
        v,w = g.edge_st(e)
        ty = g.edge_type(e)
        s = "        \\draw "
        if ty == EdgeType.HADAMARD: 
            if g.type(v) != VertexType.BOUNDARY and g.type(w) != VertexType.BOUNDARY:
                s += "[style=hadamard edge] "
            else:
                x = (g.row(v) + g.row(w))/2.0 +xoffset
                y = -(g.qubit(v)+g.qubit(w))/2.0 -yoffset
                t = "        \\node [style=hadamard] ({:d}) at ({:.2f}, {:.2f}) {{}};".format(maxindex+1, x,y)
                verts.append(t)
                maxindex += 1
        s += "({:d}) to ({:d});".format(v+idoffset,w+idoffset) # type: ignore
        edges.append(s)
    
    return (verts, edges)

def to_tikz(g: BaseGraph[VT,ET]) -> str:
    """Converts a ZX-graph ``g`` to a string representing a tikz diagram."""
    verts, edges = _to_tikz(g)
    return TIKZ_BASE.format(vertices="\n".join(verts), edges="\n".join(edges))

def to_tikz_sequence(graphs:List[BaseGraph], maxwidth:FloatInt=10) -> str:
    """Given a list of ZX-graphs, outputs a single tikz diagram with the graphs presented in a grid.
    ``maxwidth`` is the maximum width of the diagram, before a graph is put on a new row in the tikz diagram."""
    xoffset = -maxwidth
    yoffset = -10
    idoffset = 0
    total_verts, total_edges = [],[]
    for g in graphs:
        max_index = max(g.vertices()) + 2*len(g.inputs) + 1
        verts, edges = _to_tikz(g,xoffset,yoffset,idoffset)
        total_verts.extend(verts)
        total_edges.extend(edges)
        if xoffset + g.depth() + 2> maxwidth:
            xoffset = -maxwidth
            yoffset += g.qubit_count() + 2
        else:
            xoffset += g.depth() + 2
        idoffset += max_index

    return TIKZ_BASE.format(vertices="\n".join(total_verts), edges="\n".join(total_edges))



def tikzit(g: Union[BaseGraph[VT,ET],Circuit,str]) -> None:
    """Opens Tikzit with the graph ``g`` opened as a tikz diagram. 
    For this to work, ``zx.settings.tikzit_location`` must be pointed towards the Tikzit executable.
    Even though this function is intended to be used with Tikzit, ``zx.tikz.tikzit_location``
    can point towards any executable that takes a tikz file as an input, such as a text processor."""

    if not settings.tikzit_location or shutil.which(settings.tikzit_location) is None:
        raise Exception("Please point towards the Tikzit executable"
                        " (or some other executable that accepts a text file as an argument)"
                        " with pyzx.settings.tikzit_location")

    if isinstance(g, Circuit):
        g = g.to_graph(zh=True)
    if isinstance(g, BaseGraph):
        tz = to_tikz(g)
    else:
        tz = g
    with tempfile.TemporaryDirectory() as tmpdirname:
        #print(tz)
        fname = os.path.join(tmpdirname, "graph.tikz")
        with open(fname,'w') as f:
            f.write(tz)
        print("Opening Tikzit...")
        #print(fname)
        subprocess.check_call([settings.tikzit_location, fname])
        print("Done")
        # with open(fname, 'r') as f:
        #     js = f.read()
        #     g = json_to_graph(js)


synonyms_boundary = ['none', 'empty', 'boundary']
synonyms_z = ['z dot', 'z spider', 'z', 'z phase dot', 
              'white spider', 'white phase spider', 'white dot', 'white phase dot',
              'green dot', 'green node', 'green phase node']
synonyms_x = ['x dot', 'x spider', 'x', 'x phase dot', 
              'grey spider', 'grey phase spider', 'grey dot', 'grey phase dot',
              'gray spider', 'gray phase spider', 'gray dot', 'gray phase dot',
              'red dot', 'red node', 'red phase node']
synonyms_hadamard = ['hadamard', 'h', 'small hadamard']

synonyms_edge = ['empty', 'simple', 'none']
synonyms_hedge = ['hadamard edge']

tikz_error_message = "Not a valid tikz picture. Please use Tikzit to generate correct output."
def tikz_to_graph(
    s: str, 
    warn_overlap:bool= True, 
    fuse_overlap:bool = True, 
    ignore_nonzx:bool = False,
    backend:Optional[str]=None) -> BaseGraph:
    """Converts a tikz diagram into a pyzx Graph. 
    The tikz diagram is assumed to be one generated by Tikzit, 
    and hence should have a nodelayer and a edgelayer..

    Args:
        s: a string containing a well-defined Tikz diagram.
        warn_overlap: If True raises a Warning if two vertices have the exact same position.
        fuse_overlap: If True fuses two vertices that have the exact same position. Only has effect if fuse_overlap is False.
        ignore_nonzx: If True suppresses most errors about unknown vertex/edge types and labels.
        backend: Backend of the graph returned.

    Warning:
    	Vertices that might look connected in the output of the tikz are not necessarily connected
		at the level of tikz itself, and won't be treated as such in pyzx.
    """
    lines = [l.strip() for l in s.strip().splitlines() if l.strip() != '']
    if not lines[0].startswith(r'\begin{tikzpicture}'):
        raise ValueError(tikz_error_message)
    if lines[-1] != r'\end{tikzpicture}':
        raise ValueError(tikz_error_message)
    if lines[1] != r'\begin{pgfonlayer}{nodelayer}':
        raise ValueError(tikz_error_message)

    g = Graph(backend)
    index_dict: Dict[int,VT] = {} # type: ignore
    position_dict: Dict[str,List[int]] = {}
    for c,l in enumerate(lines[2:]):
        if l == r'\end{pgfonlayer}': break
        # l should look like 
        # \node [style=stylename] (integer_id) at (x_float, y_float) {$phase$};
        if not l.startswith(r'\node'): 
            raise ValueError(r"Node definition does not start with '\node': %s" % l)
        l = l[6:]
        i = l.find('[')
        if i == -1: raise ValueError("Node definition %s does not include style" % l)
        j = l.find(']',i)
        style = l[i+1:j].strip()
        style = style.split('=')[1]
        vs, other = l[j+1:].split("at")
        vid = int(vs.replace("(","").replace(")","").strip())
        pos, label = other.split("{",1)
        pos = pos.replace("(","").replace(")","").strip()
        x,y = [float(z) for z in pos.split(",")]
        label = label[:-2].replace('$','').strip()

        ty: VertexType.Type
        if style.lower() in synonyms_boundary: ty = VertexType.BOUNDARY
        elif style.lower() in synonyms_z: ty = VertexType.Z
        elif style.lower() in synonyms_x: ty = VertexType.X
        elif style.lower() in synonyms_hadamard: ty = VertexType.H_BOX
        else:
            if ignore_nonzx:
                ty = VertexType.BOUNDARY
            else:
                raise ValueError("Unknown vertex style '%s' in node definition %s" % (style, l))

        if pos in position_dict:
            if warn_overlap:
                raise Warning("Vertices %d and %s have same position" % (vid, str(position_dict[pos])))
            if fuse_overlap:
                v = index_dict[position_dict[pos][0]]
            else:
                v = g.add_vertex(ty,-y,x)
            position_dict[pos].append(vid)
        else:
            position_dict[pos] = [vid]
            v = g.add_vertex(ty,-y,x)
        index_dict[vid] = v

        if label == '0':
            g.set_phase(v,0)
        elif label == r'\neg':
            g.set_phase(v,1)
        elif label:
            if label.find('pi') == -1:
                if not ignore_nonzx:
                    raise ValueError("Node definition %s has invalid phase label" % l)
            else:
                label = label.replace(r'\pi','').strip()
                if label == '' or label == '-' or label == '-1':
                    g.set_phase(v,1)
                elif label.find(r'\frac') != -1:
                    label = label.replace(r'\frac','').strip()
                    num, denom = label.split('}{',1)
                    num = num.replace('{','').strip()
                    denom = denom.replace('}','').strip()
                    if num == '': n = 1
                    elif num == '-': n = -1
                    else:
                        try:
                            n = int(num)
                        except:
                            raise ValueError("Node definition %s has invalid phase label" % l)
                    try:
                        m = int(denom)
                    except:
                        raise ValueError("Node definition %s has invalid phase label" % l)
                    g.set_phase(v, Fraction(n,m))
                elif label.find('/') != -1:
                    num, denom = label.split('/',1)
                    if num == '': n = 1
                    elif num == '-': n = -1
                    else:
                        try:
                            n = int(num)
                        except:
                            raise ValueError("Node definition %s has invalid phase label" % l)
                    try:
                        m = int(denom)
                    except:
                        raise ValueError("Node definition %s has invalid phase label" % l)
                    g.set_phase(v, Fraction(n,m))
                else:
                    try:
                        phase = int(label)
                    except:
                        raise ValueError("Node definition %s has invalid phase label '%s'" % (l,label))
                    g.set_phase(v, phase)

    # done parsing the vertices, now we parse the edges
    etab: Dict[ET, List[int]] = {} # type: ignore

    if lines[c+3] != r'\begin{pgfonlayer}{edgelayer}':
        raise ValueError(tikz_error_message)
    for c,l in enumerate(lines[c+4:]):
        if l == r'\end{pgfonlayer}': break
        if not l.startswith(r'\draw'): 
            raise ValueError(r"Edge definition does not start with '\draw': %s" % l)
        l = l[6:]
        i = l.find('style')
        if i == -1: 
            style = "empty"
            j = l.find(']')
        else:
            j1 = l.find(']')
            if j1 == -1:
                raise ValueError(r"Faulty edge definition %s" % l)
            j2 = l.find(',',i)
            if j2 != -1 and j2 < j1: 
                style = l[i+5:j2].replace("=","").strip()
            else:
                style = l[i+5:j1].replace("=","").strip()
            j = j1
        src, tgt = l[j+1:].replace(".center","").split("to")
        src = src.replace("(","").replace(")","").strip()
        tgt = tgt.replace("(","").replace(")","").replace(";","").strip()

        e = g.edge(index_dict[int(src)],index_dict[int(tgt)])

        if style.lower() in synonyms_edge: 
            if e in etab:
                etab[e][0] += 1
            else:
                etab[e] = [1,0]
        elif style.lower() in synonyms_hedge: 
            if e in etab:
                etab[e][1] += 1
            else:
                etab[e] = [0,1]
        else:
            if ignore_nonzx:
                if e in etab:
                    etab[e][0] += 1
                else:
                    etab[e] = [1,0]
            else:
                raise ValueError("Unknown edge style '%s' in edge definition %s" % (style, l))
        
    g.add_edge_table(etab)
    return g