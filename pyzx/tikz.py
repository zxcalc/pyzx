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

from .utils import get_z_box_label, set_z_box_label, settings, EdgeType, VertexType, FloatInt
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

def _to_tikz(g: BaseGraph[VT,ET], draw_scalar:bool = False,
    xoffset:FloatInt=0, yoffset:FloatInt=0, idoffset:int=0
    ) -> Tuple[List[str],List[str]]:
    """Converts a ZX-graph ``g`` to a string representing a tikz diagram.
    The optional arguments are used by :func:`to_tikz_sequence`.
    """
    verts = []

    if draw_scalar:
        scalar = g.scalar.to_latex()
        x = -1 + xoffset + min([g.row(v) for v in g.vertices()],default=0)
        y = - yoffset - sum([g.qubit(v) for v in g.vertices()])/(g.num_vertices()+1)
        s = "        \\node [style=none] ({:d}) at ({:.2f}, {:.2f}) {{{:s}}};".format(idoffset,x,y,scalar)
        idoffset += 1
        verts.append(s)
    maxindex = idoffset

    for v in g.vertices():
        ty = g.type(v)
        if ty == VertexType.DUMMY:
            # Export dummy node with its text label and style=text
            text = g.vdata(v, 'text', '')
            style = settings.tikz_classes['dummy']
            x = g.row(v) + xoffset
            y = - g.qubit(v) - yoffset
            s = f"        \\node [style={style}] ({v+idoffset}) at ({{x:.2f}}, {{y:.2f}}) {{{{{text}}}}};".format(x=x, y=y)
            verts.append(s)
            maxindex = max([v+idoffset,maxindex])
            continue
        if ty == VertexType.Z_BOX:
            p = get_z_box_label(g,v)
        else:
            p = g.phase(v)
        if ty == VertexType.BOUNDARY:
            style = settings.tikz_classes['boundary']
        elif ty == VertexType.H_BOX:
            style = settings.tikz_classes['H']
        elif ty == VertexType.W_INPUT:
            style = settings.tikz_classes['W input']
        elif ty == VertexType.W_OUTPUT:
            style = settings.tikz_classes['W']
        elif ty == VertexType.Z_BOX:
            style = settings.tikz_classes['Z box']
        else:
            if p != 0:
                if ty==VertexType.Z: style = settings.tikz_classes['Z phase']
                else: style = settings.tikz_classes['X phase']
            else:
                if ty==VertexType.Z: style = settings.tikz_classes['Z']
                else: style = settings.tikz_classes['X']
        if ((ty == VertexType.H_BOX or ty == VertexType.Z_BOX) and p == 1) or\
            (ty != VertexType.H_BOX and p == 0):
            phase = ""
        elif type(p) == Fraction:
            ns = '' if p.numerator == 1 else str(p.numerator)
            dn = '' if p.denominator == 1 else str(p.denominator)
            if dn: phase = r"$\frac{%s\pi}{%s}$" % (ns, dn)
            else: phase = r"$%s\pi$" % ns
        else:
            phase = r"$%s$" % str(p)
        x = g.row(v) + xoffset
        y = - g.qubit(v) - yoffset
        s = "        \\node [style={}] ({:d}) at ({:.2f}, {:.2f}) {{{:s}}};".format(style,v+idoffset,x,y,phase)
        verts.append(s)
        maxindex = max([v+idoffset,maxindex])
    edges = []
    for e in g.edges():
        v,w = g.edge_st(e)
        et = g.edge_type(e)
        s = "        \\draw "
        if et == EdgeType.HADAMARD:
            if g.type(v) != VertexType.BOUNDARY and g.type(w) != VertexType.BOUNDARY:
                style = settings.tikz_classes['H-edge']
                if style: s += "[style={:s}] ".format(style)
            else:
                x = (g.row(v) + g.row(w))/2.0 +xoffset
                y = -(g.qubit(v)+g.qubit(w))/2.0 -yoffset
                t = "        \\node [style={:s}] ({:d}) at ({:.2f}, {:.2f}) {{}};".format(settings.tikz_classes['H'],maxindex+1, x,y)
                verts.append(t)
                maxindex += 1
        elif et == EdgeType.W_IO:
            style = settings.tikz_classes['W-io-edge']
            if style: s += "[style={:s}] ".format(style)
        elif et == EdgeType.FAULT_EDGE:
            style = settings.tikz_classes['Fault-edge']
            if style: s += "[style={:s}] ".format(style)
        else:
            style = settings.tikz_classes['edge']
            if style: s += "[style={:s}] ".format(style)
        s += "({:d}) to ({:d});".format(v+idoffset,w+idoffset)
        edges.append(s)

    return (verts, edges)

def to_tikz(g: BaseGraph[VT,ET], draw_scalar:bool=False) -> str:
    """Converts a ZX-graph ``g`` to a string representing a tikz diagram."""
    verts, edges = _to_tikz(g,draw_scalar)
    return TIKZ_BASE.format(vertices="\n".join(verts), edges="\n".join(edges))

def to_tikz_sequence(graphs:List[BaseGraph], draw_scalar:bool=False, maxwidth:FloatInt=10) -> str:
    """Given a list of ZX-graphs, outputs a single tikz diagram with the graphs presented in a grid.
    ``maxwidth`` is the maximum width of the diagram, before a graph is put on a new row in the tikz diagram."""
    xoffset = -maxwidth
    yoffset = -10
    idoffset = 0
    total_verts, total_edges = [],[]
    for g in graphs:
        max_index = max(g.vertices()) + 2*g.num_inputs() + 2
        verts, edges = _to_tikz(g,draw_scalar,xoffset,yoffset,idoffset)
        total_verts.extend(verts)
        total_edges.extend(edges)
        if xoffset + g.depth() + 2> maxwidth:
            xoffset = -maxwidth
            yoffset += g.qubit_count() + 2
        else:
            xoffset += g.depth() + 2
        idoffset += max_index

    return TIKZ_BASE.format(vertices="\n".join(total_verts), edges="\n".join(total_edges))



def tikzit(g: Union[BaseGraph[VT,ET],Circuit,str], draw_scalar:bool=False) -> None:
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
        tz = to_tikz(g,draw_scalar)
    else:
        tz = g
    with tempfile.TemporaryDirectory() as tmpdirname:
        fname = os.path.join(tmpdirname, "graph.tikz")
        with open(fname,'w') as f:
            f.write(tz)
        print("Opening Tikzit...")
        subprocess.check_call([settings.tikzit_location, fname])
        print("Done")


synonyms_boundary = ['none', 'empty', 'boundary']
synonyms_z = ['z dot', 'z spider', 'z', 'z phase dot',
              'white spider', 'white phase spider', 'white dot', 'white phase dot',
              'green dot', 'green node', 'green phase node']
synonyms_x = ['x dot', 'x spider', 'x', 'x phase dot',
              'grey spider', 'grey phase spider', 'grey dot', 'grey phase dot',
              'gray spider', 'gray phase spider', 'gray dot', 'gray phase dot',
              'red dot', 'red node', 'red phase node']
synonyms_hadamard = ['hadamard', 'h', 'small hadamard']
synonyms_w_input = ['w input']
synonyms_w_output = ['w output', 'w', 'w triangle']
synonyms_z_box = ['z box', 'zbox', 'zbox phase', 'green box', 'green box phase',
                  'green phase box', 'white box', 'white box phase', 'white phase box']
synonyms_dummy = ['text', 'label', 'dummy node', 'dummy spider', 'dummy phase spider']

synonyms_edge = ['empty', 'simple', 'none']
synonyms_hedge = ['hadamard edge']
synonyms_wedge = ['w edge', 'w io edge']
synonyms_fault_edge = ['fault edge']

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
        label = label[:-2].replace('$','').replace(r'\ ','').replace('~','').strip()

        ty: VertexType
        if style.lower() in synonyms_boundary: ty = VertexType.BOUNDARY
        elif style.lower() in synonyms_z: ty = VertexType.Z
        elif style.lower() in synonyms_x: ty = VertexType.X
        elif style.lower() in synonyms_hadamard: ty = VertexType.H_BOX
        elif style.lower() in synonyms_w_input: ty = VertexType.W_INPUT
        elif style.lower() in synonyms_w_output: ty = VertexType.W_OUTPUT
        elif style.lower() in synonyms_z_box: ty = VertexType.Z_BOX
        elif style.lower() in synonyms_dummy: ty = VertexType.DUMMY
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

        if ty == VertexType.DUMMY:
            g.set_vdata(v, 'text', label)
            continue
        elif ty == VertexType.Z_BOX:
            set_phase = lambda v, p: set_z_box_label(g, v, p)
        else:
            set_phase = g.set_phase
        if label == '0':
            set_phase(v,0)
        elif label == r'\neg':
            set_phase(v,1)
        elif label:
            if label.find('pi') == -1 and ty != VertexType.Z_BOX:
                if not ignore_nonzx:
                    raise ValueError("Node definition %s has invalid phase label" % l)
            else:
                label = label.replace(r'\pi','').strip()
                if label == '' or label == '-' or label == '-1':
                    set_phase(v,1)
                elif label.find(r'\frac') != -1:
                    label = label.replace(r'\frac','').strip()
                    if label.find('}{') == -1:
                        n = 1
                        try:
                            m = int(label)
                        except:
                            raise ValueError("Node definition %s has invalid phase label" % l)
                    else:
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
                    set_phase(v, Fraction(n,m))
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
                    set_phase(v, Fraction(n,m))
                else:
                    try:
                        if ty == VertexType.Z_BOX:
                            phase = complex(label)
                        else:
                            phase = int(label)
                    except:
                        raise ValueError("Node definition %s has invalid phase label '%s'" % (l,label))
                    set_phase(v, phase)

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

        e = index_dict[int(src)], index_dict[int(tgt)]

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
        elif style.lower() in synonyms_wedge:
            g.add_edge(e, EdgeType.W_IO)
        elif style.lower() in synonyms_fault_edge:
            g.add_edge(e, EdgeType.FAULT_EDGE)
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
