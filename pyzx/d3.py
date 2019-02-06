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
    from IPython.display import display, Javascript, HTML
except:
    pass

# Provides functions for displaying pyzx graphs in jupyter notebooks using d3

_d3_display_seq = 0

# TODO: avoid duplicate (copied from drawing.py)
def phase_to_s(a):
    if not a: return ''
    if not isinstance(a, Fraction):
        a = Fraction(a)
    ns = '' if a.numerator == 1 else str(a.numerator)
    ds = '' if a.denominator == 1 else '/' + str(a.denominator)

    # unicode 0x03c0 = pi
    return ns + '\u03c0' + ds

def draw(g, scale=None, js_path='../js'):
    global _d3_display_seq

    _d3_display_seq += 1
    seq = _d3_display_seq

    if scale == None:
        scale = 800 / (g.depth() + 2)
        if scale > 50: scale = 50

    node_size = 0.2 * scale
    if node_size < 2: node_size = 2

    w = (g.depth() + 2) * scale
    h = (g.qubit_count() + 3) * scale

    nodes = [{'name': str(v),
              'x': (g.row(v) + 1) * scale,
              'y': (g.qubit(v) + 2) * scale,
              't': g.type(v),
              'phase': phase_to_s(g.phase(v)) }
             for v in g.vertices()]
    links = [{'source': str(g.edge_s(e)),
              'target': str(g.edge_t(e)),
              't': g.edge_type(e) } for e in g.edges()]
    graphj = json.dumps({'nodes': nodes, 'links': links})
    display(HTML("""
    <div style="overflow:auto" id="graph-output-""" + str(seq) + """"></div>
    <script type="text/javascript">
    require.config({ baseUrl: \"""" + js_path + """\",
                     paths: {d3: "d3.v4.min"} });
    require(['pyzx'], function(pyzx) {
        pyzx.showGraph('#graph-output-""" + str(seq) + """',
        JSON.parse('""" + graphj + """'),
        """ + str(w) + """,
        """ + str(h) + """,
        """ + str(node_size) + """);
    });
    </script>
    """))

