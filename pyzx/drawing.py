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

__all__ = ['draw', 'arrange_scalar_diagram', 'draw_matplotlib', 'draw_d3',
            'matrix_to_latex', 'print_matrix', 'graphs_to_gif']

import os
import math
import cmath
import json
import string
import random
import importlib
from fractions import Fraction
from typing import Dict, List, Tuple, Optional, Union, Iterable, Any, TYPE_CHECKING
from typing_extensions import Literal
import numpy as np

# matplotlib is lazy-imported on the first call to draw_matplotlib
plt: Any = None
path: Any = None
patches: Any = None
lines: Any = None


from .utils import settings, get_mode, phase_to_s, EdgeType, VertexType, FloatInt, get_z_box_label
from .graph.base import BaseGraph, VT, ET
from .circuit import Circuit

if get_mode() == "notebook":
    from IPython.display import display, HTML
elif get_mode() == "browser":
    from browser import document, html # type: ignore

if TYPE_CHECKING:
    from ipywidgets import Label

def draw(g: Union[BaseGraph[VT,ET], Circuit], labels: bool=False, **kwargs) -> Any:
    """Draws the given Circuit or Graph. 
    Depending on the value of ``pyzx.settings.drawing_backend``
    either uses matplotlib or d3 to draw."""

    # allow global setting to labels=False
    # TODO: probably better to make labels Optional[bool]
    labels = labels or settings.show_labels

    if get_mode() == "shell":
        return draw_matplotlib(g, labels, **kwargs)
    elif get_mode() == "browser":
        return draw_d3(g, labels, **kwargs)
    else: # in notebook
        if settings.drawing_backend == "d3":
            return draw_d3(g, labels, **kwargs)
        elif settings.drawing_backend == "matplotlib":
            return draw_matplotlib(g, labels, **kwargs)
        else:
            raise TypeError("Unsupported drawing backend '{}'".format(settings.drawing_backend))

def pack_circuit_nf(g: BaseGraph[VT,ET], nf:Literal['grg','gslc'] ='grg') -> None:
    x_index = 0
    ty = g.types()

    inputs = g.inputs()
    outputs = g.outputs()
    if nf == 'grg':
        for v in g.vertices():
            if v in inputs:
                g.set_row(v, 0)
            elif v in outputs:
                g.set_row(v, 4)
            elif ty[v] == VertexType.X:
                g.set_row(v, 2)
                g.set_qubit(v, x_index)
                x_index += 1
            elif ty[v] == VertexType.Z:
                for w in g.neighbors(v):
                    if w in inputs:
                        g.set_row(v,1)
                        g.set_qubit(v, g.qubit(w))
                        break
                    elif w in outputs:
                        g.set_row(v,3)
                        g.set_qubit(v, g.qubit(w))
                        break
    elif nf == 'gslc':
        for v in g.vertices():
            if v in inputs:
                g.set_row(v,0)
            elif v in outputs:
                g.set_row(v, 4)
            elif ty[v] == VertexType.Z:
                for w in g.neighbors(v):
                    if w in inputs:
                        g.set_row(v,1)
                        #g.set_vdata(v, 'q', g.get_vdata(w, 'q'))
                        break
                    elif w in outputs:
                        g.set_row(v,3)
                        #g.set_vdata(v, 'q', g.get_vdata(w, 'q'))
                        break
    else:
        raise ValueError("Unknown normal form: " + str(nf))

def arrange_scalar_diagram(g: BaseGraph[VT,ET]) -> None:
    g.normalize()
    rs = g.rows()
    qs = g.qubits()
    ty = g.types()
    gadgets: Dict[Tuple[VT,VT], FloatInt] = {}
    verts = []
    min_row = 1000000
    rows_used: Dict[FloatInt, List[VT]] = dict()
    for v in g.vertices():
        if len(list(g.neighbors(v))) == 1:
            w = list(g.neighbors(v))[0]
            gadgets[(v,w)] = 0
        elif all(g.vertex_degree(w) > 1 for w in g.neighbors(v)): # Not part of a phase gadget
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
        score = sum(rs[n] for n in g.neighbors(w))/len(list(g.neighbors(w)))
        gadgets[(v,w)] = score
    
    l = list(gadgets.items())
    l = sorted(l, key=lambda x: x[1])
    for i in range(len(l)):
        v,w = l[i][0]
        g.set_row(v, i+0.5)
        g.set_row(w, i+0.5)
        g.set_qubit(v,-1)
        g.set_qubit(w,0)

def draw_matplotlib(
        g:      Union[BaseGraph[VT,ET], Circuit], 
        labels: bool                             =False, 
        figsize:Tuple[FloatInt,FloatInt]         =(8,2), 
        h_edge_draw: Literal['blue', 'box']      ='blue', 
        show_scalar: bool                        =False,
        rows: Optional[Tuple[FloatInt,FloatInt]] =None
        ) -> Any: # TODO: Returns a matplotlib figure

    # lazy import matplotlib
    global plt, path, patches, lines
    if plt is None:
        try:
            plt = importlib.import_module('matplotlib.pyplot')
            path = importlib.import_module('matplotlib.path')
            patches = importlib.import_module('matplotlib.patches')
            lines = importlib.import_module('matplotlib.lines')
        except ImportError:
            raise ImportError("This function requires matplotlib to be installed. "
                "If you are running in a Jupyter notebook, you can instead use `zx.draw_d3`.")

    if isinstance(g, Circuit):
        g = g.to_graph(zh=True)
    fig1, ax = plt.subplots(figsize=figsize)
    ax.set_frame_on(False)
    ax.set(xlim=(0, 1), ylim=(0, 1))
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
        if et == 2 and h_edge_draw == 'blue':
            ecol = '#0099ff'
        elif et == 3:
            ecol = 'gray'
        else:
            ecol = 'black'

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
        phase_str = phase_to_s(a, t)

        if t == VertexType.Z:
            ax.add_patch(patches.Circle(p, 0.2, facecolor='#ccffcc', edgecolor='black', zorder=1))
        elif t == VertexType.X:
            ax.add_patch(patches.Circle(p, 0.2, facecolor='#ff8888', edgecolor='black', zorder=1))
        elif t == VertexType.H_BOX:
            ax.add_patch(patches.Rectangle((p[0]-0.1, p[1]-0.1), 0.2, 0.2, facecolor='yellow', edgecolor='black'))
            a_offset = 0.25
        elif t == VertexType.W_INPUT:
            ax.add_patch(patches.Circle(p, 0.05, facecolor='black', edgecolor='black', zorder=1))
        elif t == VertexType.W_OUTPUT:
            ax.add_patch(patches.Polygon([(p[0]-0.15, p[1]), (p[0]+0.15, p[1]+0.2), (p[0]+0.15, p[1]-0.2)], facecolor='black', edgecolor='black'))
        elif t == VertexType.Z_BOX:
            ax.add_patch(patches.Rectangle((p[0]-0.1, p[1]-0.1), 0.2, 0.2, facecolor='#ccffcc', edgecolor='black'))
            a_offset = 0.25
            phase_str = str(get_z_box_label(g, v))
        else:
            ax.add_patch(patches.Circle(p, 0.1, facecolor='black', edgecolor='black', zorder=1))

        if labels: plt.text(p[0]+0.25, p[1]+0.25, str(v), ha='center', color='gray', fontsize=5)
        if phase_str: plt.text(p[0], p[1]-a_offset, phase_str, ha='center', color='blue', fontsize=8)

    if show_scalar:
        x = min((g.row(v) for v in g.vertices()), default = 0)
        y = -sum((g.qubit(v) for v in g.vertices()))/(g.num_vertices()+1)
        ax.text(x-5,y,g.scalar.to_latex())

    ax.axis('equal')
    plt.close()
    return fig1
    #plt.show()

# Provides functions for displaying pyzx graphs in jupyter notebooks using d3

# make sure we get a fresh random seed
random_graphid = random.Random()

# def init_drawing() -> None:
#     if get_mode() not in ("notebook", "browser"): return
#
#     library_code = '<script type="text/javascript">\n'
#     for lib in ['d3.v5.min.inline.js']:
#         with open(os.path.join(settings.javascript_location, lib), 'r') as f:
#             library_code += f.read() + '\n'
#     library_code += '</script>'
#     display(HTML(library_code))

def draw_d3(
    g: Union[BaseGraph[VT,ET], Circuit],
    labels:bool=False, 
    scale:Optional[FloatInt]=None, 
    auto_hbox:Optional[bool]=None,
    show_scalar:bool=False,
    vdata: List[str]=[]
    ) -> Any:

    if get_mode() not in ("notebook", "browser"): 
        raise Exception("This method only works when loaded in a webpage or Jupyter notebook")

    if auto_hbox is None:
        auto_hbox = settings.drawing_auto_hbox

    if isinstance(g, Circuit):
        g = g.to_graph(zh=True)

    # tracking global sequence can cause clashes if you restart the kernel without clearing ouput, so
    # use an 8-digit random alphanum instead.
    graph_id = ''.join(random_graphid.choice(string.ascii_letters + string.digits) for _ in range(8))

    minrow = min([g.row(v) for v in g.vertices()], default=0)
    maxrow = max([g.row(v) for v in g.vertices()], default=0)
    minqub = min([g.qubit(v) for v in g.vertices()], default=0)
    maxqub = max([g.qubit(v) for v in g.vertices()], default=0)

    if scale is None:
        scale = 800 / (maxrow-minrow + 2)
        if scale > 50: scale = 50
        if scale < 20: scale = 20

    node_size = 0.2 * scale
    if node_size < 2: node_size = 2

    w = (maxrow-minrow + 2) * scale
    h = (maxqub-minqub + 3) * scale

    nodes = [{'name': str(v),
              'x': (g.row(v)-minrow + 1) * scale,
              'y': (g.qubit(v)-minqub + 2) * scale,
              't': g.type(v),
              'phase': phase_to_s(g.phase(v), g.type(v)) if g.type(v) != VertexType.Z_BOX else str(get_z_box_label(g, v)),
              'ground': g.is_ground(v),
              'vdata': [(key, g.vdata(v, key))
                  for key in vdata if g.vdata(v, key, None) is not None],
              }
             for v in g.vertices()]

    # keep track of the number of parallel edges seen for a source/target pair
    counts: Dict[Tuple[str,str], int] = dict()
    links = []
    for e in g.edges():
        s = str(g.edge_s(e))
        t = str(g.edge_t(e))
        i = counts.get((s,t), 0)
        links.append({'source': s,
                      'target': t,
                      't': g.edge_type(e),
                      'index': i })
        counts[(s,t)] = i + 1
    for link in links:
        s,t = (str(link['source']), str(link['target']))
        link['num_parallel'] = counts[(s,t)]
    graphj = json.dumps({'nodes': nodes, 'links': links})

    with open(os.path.join(settings.javascript_location, 'zx_viewer.inline.js'), 'r') as f:
        library_code = f.read() + '\n'

    text = """<div style="overflow:auto; background-color: white" id="graph-output-{id}"></div>
<script type="module">
var d3;
if (d3 == null) {{ d3 = await import("https://cdn.skypack.dev/d3@5"); }}
{library_code}
showGraph('#graph-output-{id}',
  JSON.parse('{graph}'), {width}, {height}, {scale},
  {node_size}, {hbox}, {labels}, '{scalar_str}');
</script>""".format(library_code=library_code,
                    id = graph_id,
                    graph = graphj, 
                    width=w, height=h, scale=scale, node_size=node_size,
                    hbox = 'true' if auto_hbox else 'false',
                    labels='true' if labels else 'false',
                    scalar_str=g.scalar.to_unicode() if show_scalar else '')
    if get_mode() == "notebook":
        display(HTML(text))
    else:
        d = html.DIV(style={"overflow": "auto", "background-color": "white"}, id="graph-output-{}".format(graph_id))
        source = """
        require(['zx_viewer'], function(zx_viewer) {{
            zx_viewer.showGraph('#graph-output-{0}',
            JSON.parse('{1}'), {2}, {3}, {4}, false, false);
        }});
        """.format(graph_id, graphj, str(w), str(h), str(node_size))
        s = html.SCRIPT(source, type="text/javascript")
        return d,s



# The dictionaries below are needed to
# pretty-print complex numbers in pretty_complex() and matrix_to_latex()

special_vals = {
    1: "1",
    -1: "-1",
    math.sqrt(2): r"\sqrt{2}",
    math.sqrt(3): r"\sqrt{3}",
    -math.sqrt(2): r"-\sqrt{2}",
    -math.sqrt(3): r"-\sqrt{3}",
    math.sqrt(1/2): r"\frac{1}{\sqrt{2}}",
    -math.sqrt(1/2): r"-\frac{1}{\sqrt{2}}",
    # math.sqrt(2) - 1:                 r"(\sqrt{2}-1)",
    # 1-math.sqrt(2):                 r"(1-\sqrt{2})",
    # 1+math.sqrt(2):                 r"(\sqrt{2}+1)",
    # 1+math.sqrt(1/2):                 r"(1+\frac{1}{\sqrt{2}})",
    # 1-math.sqrt(1/2):                 r"(1-\frac{1}{\sqrt{2}})",
    0.5*math.sqrt(1+math.sqrt(1/2)):r"\frac12\sqrt{1+\frac{1}{\sqrt{2}}}"
}

simple_vals = {
    1: "1",
    1/2: r"\frac12",
    1/3: r"\frac13",
    1/4: r"\frac14",
    2: "2",
    3: "3"
}
sqrt_vals = {
    math.sqrt(2): r"\sqrt{2}",
    math.sqrt(3): r"\sqrt{3}",
    math.sqrt(3)/2: r"\frac12\sqrt{3}",
    math.sqrt(1/2): r"\frac{1}{\sqrt{2}}",
    2*math.sqrt(2): r"2\sqrt{2}",
    math.sqrt(1/2)/2: r"\frac{1}{2\sqrt{2}}",
    math.sqrt(1/2)/4: r"\frac{1}{2\sqrt{4}}"
}

for v,s in simple_vals.items():
    for w,t in sqrt_vals.items():
        special_vals[v+w] = f"\\left({s}+{t}\\right)"
        special_vals[v-w] = f"\\left({s}-{t}\\right)"
        special_vals[-v+w] = f"\\left({t}-{s}\\right)"
        special_vals[-v-w] = f"-\\left({t}+{s}\\right)"

def strip_brackets(s:str) -> str:
    if s.startswith("(") and s.endswith(")"):
        return s[1:-1]
    if s.startswith("\\left(") and s.endswith("\\right)"):
        return s[6:-7]
    return s

def pretty_complex(z: complex) -> str:
    """Pretty print a complex number. Suitable for including in a
    Jupyter widgets Label()."""
    if abs(z) < 0.0000001:
        return "0"
    for v, s in special_vals.items():
        if abs(z-v) < 0.0001:
            return s
    out = ""
    r, arg = cmath.polar(z)
    farg = Fraction(arg/math.pi).limit_denominator(64) # this is now a fraction between -1 and 1
    if abs(farg*math.pi - arg) > 0.00001: # Polar decomp is not a good choice
        f = int(math.log10(1/abs(z)))
        if abs(f) > 1:
            z *= 10**f
        a,b = z.real, z.imag
        real_part, imag_part = False, False
        for v,s in special_vals.items():
            if abs(a-v) < 0.0001:
                out += s
                real_part = True
                break
        else:
            if abs(a) > 0.001:
                if abs(round(a)-a) < 0.0001:
                    out += str(round(a))
                elif abs(round(a*math.sqrt(2))-a*math.sqrt(2)) < 0.0001:
                    v = a/math.sqrt(2)
                    out += f"{round(v):d}\\sqrt{{2}}"
                else:
                    out += f"{a:.2f}".rstrip("0").rstrip(".")
                real_part = True

        if abs(b+1) < 0.0001:
            out += "-i"
            imag_part = True
        else:
            for v,s in special_vals.items():
                if abs(b-v) < 0.0001:
                    if b > 0:
                        out += "+"
                    out += s + "i"
                    imag_part = True
                    break
            else:
                if abs(b) > 0.001:
                    if b > 0.0:
                        if abs(a) > 0.001: out += "+"
                    if b < 0.0:
                        out += "-"
                        b = -b
                    if abs(b-1) < 0.001:
                        out += ""
                    else:
                        if abs(round(b)-b) < 0.0001:
                            out += str(round(b))
                        elif abs(round(b*math.sqrt(2))-b*math.sqrt(2)) < 0.0001:
                            v = b/math.sqrt(2)
                            out += f"{round(v):d}\\sqrt{{2}}"
                        else:
                            out += f"{b:.2f}".rstrip("0").rstrip(".")
                    out += "i"
                    imag_part = True
        if abs(f) > 1:
            out = f"({out})10^{{{-f}}}"
        elif real_part and imag_part:
            out = f"({out})"
        return out
    arg = farg # type: ignore
    if abs(r-1) > 0.00001: # not close to 1
        for v,s in special_vals.items():
            if abs(r-v) < 0.00001:
                out += s
                break
        else:
            v = math.log(r,2)
            vfrac = Fraction(v).limit_denominator(64)
            if abs(v-vfrac) < 0.00001:
                if vfrac.denominator == 1:
                    if vfrac == 1:
                        out += "2"
                    else:
                        out += r"2^{%d}" % vfrac.numerator
                else:
                    vfrac *= 2
                    if vfrac.denominator == 1:
                        if vfrac == 1:
                            out += r"\sqrt{2}"
                        else:
                            out += r"\sqrt{2}^{%d}" % vfrac.numerator
                    else:
                        out += r"\sqrt{2}^{\frac{%d}{%d}}" % (vfrac.numerator,vfrac.denominator)
            else:
                f = int(math.log10(1/abs(r)))
                if abs(f) > 1:
                    r *= 10**f
                if abs(round(r)-r) < 0.0001:
                    out += str(round(r))
                elif abs(round(r*math.sqrt(2))-r*math.sqrt(2)) < 0.0001:
                    v = r/math.sqrt(2)
                    out += f"{round(v):d}\\sqrt{{2}}"
                else:
                    out += f"{r:.2f}".rstrip("0").rstrip(".")
                if abs(f) > 1:
                    out += f"\\cdot 10^{{{-f}}}"
    
    minus = ""
    if arg < 0:
        minus = "-"
        arg += 1
    if arg == 1:
        minus = "-"
    elif arg == Fraction(1,2):
        out += "i"
    elif arg != 0:
        out += r"e^{i\frac{%d}{%d}\pi}" % (arg.numerator, arg.denominator) # type: ignore
    out = minus + out
    
    return out

def matrix_to_latex(m: np.ndarray) -> str:
    """Converts a matrix into latex code.
    Useful for pretty printing the matrix of a Circuit/Graph.

    Example:
        # Run this in a Jupyter notebook
        from ipywidgets import Label
        c = zx.Circuit(3)
        display(Label(matrix_to_latex(c.to_matrix())))
    """
    out = "\\begin{equation}\n"

    epsilon = 10**-14
    best_val = None
    denom = None
    for v in m.flat:
        if abs(v) > epsilon:
            if best_val is None: 
                best_val = v
                denom = Fraction(cmath.phase(v)/math.pi).limit_denominator(512).denominator
            else:
                p = Fraction(cmath.phase(v)/math.pi).limit_denominator(512)
                if p.denominator < denom:
                    best_val = v
                    denom = p.denominator
    if best_val is None:
        # matrix is zero
        out += "\\begin{pmatrix}\n"
        out += " \\\\ \n".join([" & ".join("0" for a in row) for row in m])
        out += "\n\\end{pmatrix}\n\\end{equation}"
        return out
    
    v = best_val
    m = m/v
    
    s = pretty_complex(v)
    if s == "1": s = ""
    if s == "-1": s= "-"
    out += s + "\n\\begin{pmatrix}\n"
    out += " \\\\ \n".join([" & ".join(strip_brackets(pretty_complex(a)) for a in row) for row in m])
    out += "\n\\end{pmatrix}\n\\end{equation}"
    return out


def print_matrix(m: Union[np.ndarray,BaseGraph,Circuit]) -> None:
    """Display a Label() Jupyter widget with a pretty LaTeX representation of the given matrix.
    Instead of a matrix, can also give a Circuit or Graph.
    """
    if get_mode() != "notebook":
        raise TypeError("Unsupported mode for print_matrix: '{}'".format(get_mode()))

    from ipywidgets import Label
    if isinstance(m, BaseGraph) or isinstance(m, Circuit):
        m = m.to_matrix()

    display(Label(matrix_to_latex(m)))


def graphs_to_gif(graphs: List[BaseGraph], filename: str, frame_duration: float=0.5):
    """Given a list of graphs, outputs an animated gif showing them in sequence.

    Args:
        graphs: The list of Graph instances that should be made into a gif.
        filename: the full filename of the output gif.
        frame_duration: how long (in seconds) each frame should last.

    Warning:
        This function requires imagio to be installed (pip install imageio).

    """
    import tempfile
    from pathlib import Path
    try:
        import imageio # type: ignore
    except ImportError:
        raise Exception("This function requires imageio to be installed (try: pip install imageio).")

    with tempfile.TemporaryDirectory() as tmpdirname:
        #print(tz)
        for i,g in enumerate(graphs):
            fig = draw_matplotlib(g)
            fname = os.path.join(tmpdirname, "graph{:03d}.png".format(i))
            fig.savefig(fname)
        image_path = Path(tmpdirname)
        images = list(image_path.glob('*.png'))
        image_list = []
        for file_name in images:
            image_list.append(imageio.imread(file_name))
        durations = [frame_duration]*len(image_list)
        durations[-1] = 5*frame_duration
        imageio.mimwrite(filename, image_list, duration=durations)
        return os.path.abspath(filename)
