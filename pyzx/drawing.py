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

__all__ = ['draw', 'pack_circuit_nf']

from fractions import Fraction
import math
from typing import Dict, List, Tuple, Optional, Union, Iterable, Any
from typing_extensions import Literal

try:
    import matplotlib.pyplot as plt
    from matplotlib import patches, lines, path
except:
    plt = None


from .utils import phase_to_s, EdgeType, VertexType, FloatInt

from .graph.base import BaseGraph, VT, ET
from .circuit import Circuit


def pack_circuit_nf(g: BaseGraph[VT,ET], nf:Literal['grg','gslc'] ='grg') -> None:
    x_index = 0
    ty = g.types()

    if nf == 'grg':
        for v in g.vertices():
            if v in g.inputs:
                g.set_row(v, 0)
            elif v in g.outputs:
                g.set_row(v, 4)
            elif ty[v] == VertexType.X:
                g.set_row(v, 2)
                g.set_qubit(v, x_index)
                x_index += 1
            elif ty[v] == VertexType.Z:
                for w in g.neighbours(v):
                    if w in g.inputs:
                        g.set_row(v,1)
                        g.set_qubit(v, g.qubit(w))
                        break
                    elif w in g.outputs:
                        g.set_row(v,3)
                        g.set_qubit(v, g.qubit(w))
                        break
    elif nf == 'gslc':
        for v in g.vertices():
            if v in g.inputs:
                g.set_row(v,0)
            elif v in g.outputs:
                g.set_row(v, 4)
            elif ty[v] == VertexType.Z:
                for w in g.neighbours(v):
                    if w in g.inputs:
                        g.set_row(v,1)
                        #g.set_vdata(v, 'q', g.get_vdata(w, 'q'))
                        break
                    elif w in g.outputs:
                        g.set_row(v,3)
                        #g.set_vdata(v, 'q', g.get_vdata(w, 'q'))
                        break
    else:
        raise ValueError("Unknown normal form: " + str(nf))

def arrange_scalar_diagram(g: BaseGraph[VT,ET]) -> None:
    g.normalise()
    rs = g.rows()
    qs = g.qubits()
    ty = g.types()
    gadgets: Dict[Tuple[VT,VT], FloatInt] = {}
    verts = []
    min_row = 1000000
    rows_used: Dict[FloatInt, List[VT]] = dict()
    for v in g.vertices():
        if len(list(g.neighbours(v))) == 1:
            w = list(g.neighbours(v))[0]
            gadgets[(v,w)] = 0
        elif all(g.vertex_degree(w) > 1 for w in g.neighbours(v)): # Not part of a phase gadget
            verts.append(v)
            #if rs[v] < min_row: min_row = rs[v]
            if rs[v] in rows_used: rows_used[rs[v]].append(v)
            else: rows_used[rs[v]] = [v]
    
    for i, r in enumerate(sorted(rows_used.keys())):
        for v in rows_used[r]:
            g.set_row(v,i)
            if qs[v] < 0: g.set_qubit(v,1)
            else: g.set_qubit(v,qs[v]+1)
    
    for v,w in gadgets.keys():
        score = sum(rs[n] for n in g.neighbours(w))/len(list(g.neighbours(w)))
        gadgets[(v,w)] = score
    
    l = list(gadgets.items())
    l = sorted(l, key=lambda x: x[1])
    for i in range(len(l)):
        v,w = l[i][0]
        g.set_row(v, i+0.5)
        g.set_row(w, i+0.5)
        g.set_qubit(v,-1)
        g.set_qubit(w,0)

def draw(
        g:      Union[BaseGraph[VT,ET], Circuit], 
        labels: bool                             =False, 
        figsize:Tuple[FloatInt,FloatInt]         =(8,2), 
        h_edge_draw: Literal['blue', 'box']      ='blue', 
        rows: Optional[Tuple[FloatInt,FloatInt]] =None
        ) -> Any: # TODO: Returns a matplotlib figure
    if plt is None:
        raise ImportError("This function requires matplotlib to be installed. "
            "If you are running in a Jupyter notebook, you can instead use `zx.d3.draw`.")
    if isinstance(g, Circuit):
        g = g.to_graph(zh=True)
    fig1 = plt.figure(figsize=figsize)
    ax = fig1.add_axes([0, 0, 1, 1], frameon=False)
    ax.xaxis.set_visible(False)
    ax.yaxis.set_visible(False)
    vs_on_row: Dict[FloatInt, int] = {} # count the vertices on each row
    for v in g.vertices():
        vs_on_row[g.row(v)] = vs_on_row.get(g.row(v), 0) + 1
    
    #Dict[VT,Tuple[FloatInt,FloatInt]]
    layout = {v:(g.row(v),-g.qubit(v)) for v in g.vertices()}

    if rows is not None:
        minrow,maxrow = rows
        vertices: Iterable[VT] = [v for v in g.vertices() if (minrow<=g.row(v) and g.row(v) <=maxrow)]
        edges: Iterable[ET] = [e for e in g.edges() if g.edge_s(e) in vertices and g.edge_t(e) in vertices]
    else:
        vertices = g.vertices()
        edges = g.edges()
    
    for e in edges:
        sp = layout[g.edge_s(e)]
        tp = layout[g.edge_t(e)]
        et = g.edge_type(e)
        n_row = vs_on_row.get(g.row(g.edge_s(e)), 0)

        
        dx = tp[0] - sp[0]
        dy = tp[1] - sp[1]
        bend_wire = (dx == 0) and h_edge_draw == 'blue' and n_row > 2
        ecol = '#0099ff' if h_edge_draw == 'blue' and et == 2 else 'black'

        if bend_wire:
            bend = 0.25
            mid = (sp[0] + 0.5 * dx + bend * dy, sp[1] + 0.5 * dy - bend * dx)

            pth = path.Path([sp,mid,tp], [path.Path.MOVETO, path.Path.CURVE3, path.Path.LINETO])
            patch = patches.PathPatch(pth, edgecolor=ecol, linewidth=0.8, fill=False)
            ax.add_patch(patch)
        else:
            pos = 0.5 if dx == 0 or dy == 0 else 0.4
            mid = (sp[0] + pos*dx, sp[1] + pos*dy)
            ax.add_line(lines.Line2D([sp[0],tp[0]],[sp[1],tp[1]], color=ecol, linewidth=0.8, zorder=0))

        if h_edge_draw == 'box' and et == 2: #hadamard edge
            w = 0.2
            h = 0.15
            diag = math.sqrt(w*w+h*h)
            angle = math.atan2(dy,dx)
            angle2 = math.atan2(h,w)
            centre = (mid[0] - diag/2*math.cos(angle+angle2),
                      mid[1] - diag/2*math.sin(angle+angle2))
            ax.add_patch(patches.Rectangle(centre,w,h,angle=angle/math.pi*180,facecolor='yellow',edgecolor='black'))

        #plt.plot([sp[0],tp[0]],[sp[1],tp[1]], 'k', zorder=0, linewidth=0.8)
    
    for v in vertices:
        p = layout[v]
        t = g.type(v)
        a = g.phase(v)
        a_offset = 0.5

        if t == VertexType.Z:
            ax.add_patch(patches.Circle(p, 0.2, facecolor='green', edgecolor='black', zorder=1))
        elif t == VertexType.X:
            ax.add_patch(patches.Circle(p, 0.2, facecolor='red', edgecolor='black', zorder=1))
        elif t == VertexType.H_BOX:
            ax.add_patch(patches.Rectangle((p[0]-0.1, p[1]-0.1), 0.2, 0.2, facecolor='yellow', edgecolor='black'))
            a_offset = 0.25
        else:
            ax.add_patch(patches.Circle(p, 0.1, facecolor='black', edgecolor='black', zorder=1))

        if labels: plt.text(p[0]+0.25, p[1]+0.25, str(v), ha='center', color='gray', fontsize=5)
        if a: plt.text(p[0], p[1]-a_offset, phase_to_s(a, t), ha='center', color='blue', fontsize=8)
    
    ax.axis('equal')
    plt.close()
    return fig1
    #plt.show()

