# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
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
from typing import List, overload, Tuple, Union, Optional

from .utils import settings, EdgeType, VertexType, FloatInt, FractionLike
from .graph.base import BaseGraph, VT, ET
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
    For this to work, ``zx.tikz.tikzit_location`` must be pointed towards the Tikzit executable.
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
