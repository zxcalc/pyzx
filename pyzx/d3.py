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

__all__ = ['init', 'draw']

try:
    from IPython.display import display, HTML
    in_notebook = True
    javascript_location = '../js'
except ImportError:
    in_notebook = False
    javascript_location = '/js'
    try:
        from browser import document, html
        in_webpage = True
    except ImportError:
        in_webpage = False

# Provides functions for displaying pyzx graphs in jupyter notebooks using d3

_d3_display_seq = 0

# javascript_location = '../js'

# TODO: avoid duplicate (copied from drawing.py)
def phase_to_s(a, t):
    if (a == 0 and t != 3): return ''
    if (a == 1 and t == 3): return ''
    if not isinstance(a, Fraction):
        a = Fraction(a)

    simstr = ''
    if a.denominator > 256:
        a = a.limit_denominator(256)
        simstr = '~'

    ns = '' if a.numerator == 1 else str(a.numerator)
    ds = '' if a.denominator == 1 else '/' + str(a.denominator)

    # unicode 0x03c0 = pi
    return simstr + ns + '\u03c0' + ds

def draw(g, scale=None, auto_hbox=True, labels=False):
    global _d3_display_seq

    if not in_notebook and not in_webpage: 
        raise Exception("This method only works when loaded in a webpage or Jupyter notebook")

    if not hasattr(g, 'vertices'):
        g = g.to_graph(zh=True)

    _d3_display_seq += 1
    seq = _d3_display_seq

    if scale == None:
        scale = 800 / (g.depth() + 2)
        if scale > 50: scale = 50
        if scale < 20: scale = 20

    node_size = 0.2 * scale
    if node_size < 2: node_size = 2

    w = (g.depth() + 2) * scale
    h = (g.qubit_count() + 3) * scale

    nodes = [{'name': str(v),
              'x': (g.row(v) + 1) * scale,
              'y': (g.qubit(v) + 2) * scale,
              't': g.type(v),
              'phase': phase_to_s(g.phase(v), g.type(v)) }
             for v in g.vertices()]
    links = [{'source': str(g.edge_s(e)),
              'target': str(g.edge_t(e)),
              't': g.edge_type(e) } for e in g.edges()]
    graphj = json.dumps({'nodes': nodes, 'links': links})
    text = """
        <div style="overflow:auto" id="graph-output-{0}"></div>
        <script type="text/javascript">
        require.config({{ baseUrl: "{1}",
                         paths: {{d3: "d3.v5.min"}} }});
        require(['zx_viewer'], function(zx_viewer) {{
            zx_viewer.showGraph('#graph-output-{0}',
            JSON.parse('{2}'), {3}, {4}, {5}, {6}, {7}, {8});
        }});
        </script>
        """.format(seq, javascript_location, graphj, w, h, scale, node_size,
            'true' if auto_hbox else 'false',
            'true' if labels else 'false')
    if in_notebook:
        display(HTML(text))
    elif in_webpage:
        d = html.DIV(style={"overflow": "auto"}, id="graph-output-{}".format(seq))
        source = """
        require(['zx_viewer'], function(zx_viewer) {{
            zx_viewer.showGraph('#graph-output-{0}',
            JSON.parse('{2}'), {3}, {4}, {5});
        }});
        """.format(seq, javascript_location, graphj, w, h, node_size)
        s = html.SCRIPT(source, type="text/javascript")
        return d,s
