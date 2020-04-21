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

"""Supplies methods to convert ZX-graphs to tikz files.
These tikz files are designed to be easily readable by the program `Tikzit <https://tikzit.github.io>`_.
"""


import tempfile
import os
import subprocess
import time
from typing import List, overload, Tuple, Union, Optional

from .utils import EdgeType, VertexType, FloatInt, FractionLike
from .graph.base import BaseGraph, VT, ET

tikzit_location: Optional[str] = None

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



def tikzit(g: BaseGraph[VT,ET]) -> None:
    """Opens Tikzit with the graph ``g`` opened as a tikz diagram. 
    For this to work, ``zx.tikz.tikzit_location`` must be pointed towards the Tikzit executable.
    Even though this function is intended to be used with Tikzit, ``zx.tikz.tikzit_location``
    can point towards any executable that takes a tikz file as an input, such as a text processor."""

    if tikzit_location is None or not os.path.exists(tikzit_location):
        raise Exception("Please point towards the Tikzit executable with tikz.tikzit_location")

    with tempfile.TemporaryDirectory() as tmpdirname:
        tz = to_tikz(g)
        #print(tz)
        fname = os.path.join(tmpdirname, "graph.tikz")
        with open(fname,'w') as f:
            f.write(tz)
        print("Opening Tikzit...")
        #print(fname)
        subprocess.check_call([tikzit_location, fname])
        print("Done")
        # with open(fname, 'r') as f:
        #     js = f.read()
        #     g = json_to_graph(js)
