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
import os
from fractions import Fraction

__all__ = ['init', 'draw']

try:
    from IPython.display import display, HTML
    in_notebook = True
    javascript_location = os.path.join(os.path.dirname(__file__), 'js')
    d3_load_string = 'require.config({paths: {d3: "https://d3js.org/d3.v5.min"} });'
    relpath = os.path.relpath(javascript_location, os.getcwd())
    if relpath.count('..') <= 1:
        javascript_location = os.path.relpath(javascript_location, os.getcwd())
        d3_load_string = 'require.config({{baseUrl: "{}",paths: {{d3: "d3.v5.min"}} }});'.format(
                            javascript_location.replace('\\','/'))
except ImportError:
    in_notebook = False
    javascript_location = '/js'
    d3_load_string = 'require.config({paths: {d3: "https://d3js.org/d3.v5.min"} });'
    try:
        from browser import document, html
        in_webpage = True
        d3_load_string = 'require.config({baseUrl: "/js", paths: {d3: "d3.v5.min"} });'
    except ImportError:
        in_webpage = False

# Provides functions for displaying pyzx graphs in jupyter notebooks using d3

_d3_display_seq = 0

from .drawing import phase_to_s

def draw(g, scale=None, auto_hbox=True, labels=False):
    global _d3_display_seq

    if not in_notebook and not in_webpage: 
        raise Exception("This method only works when loaded in a webpage or Jupyter notebook")

    if not hasattr(g, 'vertices'):
        g = g.to_graph(zh=True)

    _d3_display_seq += 1
    graph_id = _d3_display_seq

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
    with open(os.path.join(javascript_location, 'zx_viewer.js'), 'r') as f:
        viewer_code = f.read()
    text = """<div style="overflow:auto" id="graph-output-{id}"></div>
<script type="text/javascript">
{d3_load}
{viewer_code}
</script>
<script type="text/javascript">
require(['zx_viewer'], function(zx_viewer) {{
    zx_viewer.showGraph('#graph-output-{id}',
    JSON.parse('{graph}'), {width}, {height}, {scale}, {node_size}, {hbox}, {labels});
}});
</script>""".format(id = graph_id, d3_load = d3_load_string, viewer_code=viewer_code, 
                    graph = graphj, 
                   width=w, height=h, scale=scale, node_size=node_size,
                   hbox = 'true' if auto_hbox else 'false',
                   labels='true' if labels else 'false')
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
