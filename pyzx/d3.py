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
from IPython.display import display, Javascript, HTML

# Provides functions for displaying pyzx graphs in jupyter notebooks using d3

__all__ = ['init', 'draw']

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

def init():
    display(HTML("""
    <style>
    .node { stroke: #fff; stroke-width: 1.5px; }
    .node .selected { stroke: blue; }
    .link { stroke: black; stroke-width: 1.5px; }
    .d3graph { overflow: auto; }
    .d3graph svg { border: 1px solid #ddd; }
    </style>

    <script type="text/javascript">
    var showGraph;
    var test = false;
    require.config({ baseUrl: "../js", paths: {d3: "d3.v4.min"} });
    require(['d3'], function(d3) {

    test = true;
    showGraph = function(tag, json, width, height, node_size) {
        var shiftKey;

        var svg = d3.select(tag)
            .attr("tabindex", 1)
            .attr("max-width", "none")
            .attr("max-height", "none")
            .on("keydown.brush", keydowned)
            .on("keyup.brush", keyupped)
            .each(function() { this.focus(); })
          .append("svg")
            .attr("width", width)
            .attr("height", height);

        var link = svg.append("g")
            .attr("class", "link")
            .selectAll("line");

        var brush = svg.append("g")
            .attr("class", "brush");

        var node = svg.append("g")
            .attr("class", "node")
          .selectAll("circle");

        var graph = json;

        var ntab = {};

        graph.nodes.forEach(function(d) {
            ntab[d.name] = d;
            d.selected = false;
            d.previouslySelected = false;
        });

        graph.links.forEach(function(d) {
            d.source = ntab[d.source];
            d.target = ntab[d.target];
        });

        link = link
        .data(graph.links)
        .enter().append("line")
          .attr("x1", function(d) { return d.source.x; })
          .attr("y1", function(d) { return d.source.y; })
          .attr("x2", function(d) { return d.target.x; })
          .attr("y2", function(d) { return d.target.y; })
          .attr("stroke", function(d) {
              if (d.t == 1) return "black";
              else if (d.t == 2) return "#08f";
          });

        brush.call(d3.brush()
            .extent([[0, 0], [width, height]])
            .on("start", brushstarted)
            .on("brush", brushed)
            .on("end", brushended));


        node = node.data(graph.nodes)
            .enter().append("circle")
            .attr("r", function(d) {
               if (d.t == 0) return 0.5 * node_size;
               else return node_size;
            })
            .attr("cx", function(d) { return d.x; })
            .attr("cy", function(d) { return d.y; })
            .attr("fill", function(d) {
                if (d.t == 0) return "black";
                if (d.t == 1) return "green";
                if (d.t == 2) return "red";
            })
            .attr("stroke", "black")
            .on("mousedown", mousedowned)
            .call(d3.drag().on("drag", dragged));


        //node.append("text")
        //.attr("dx", node_size * 0.8)
        //.attr("dy", 0)
        //.text(function(d) { return d.name });

        var text = svg.selectAll("text")
                                .data(graph.nodes)
                                .enter()
                                .append("text");
        text.attr("x", function(d) { return d.x; })
            .attr("y", function(d) { return d.y + 0.7 * node_size + 14; })
            .text( function (d) { return d.phase })
            .attr("text-anchor", "middle")
            .attr("font-size", "12px")
            .attr("font-family", "monospace")
            .attr("fill", "#00d");

        function brushstarted() {
            if (d3.event.sourceEvent.type !== "end") {
              node.classed("selected", function(d) {
                return d.selected = d.previouslySelected = shiftKey && d.selected;
              });
            }
        }

        function brushed() {
            if (d3.event.sourceEvent.type !== "end") {
              var selection = d3.event.selection;
              node.classed("selected", function(d) {
                return d.selected = d.previouslySelected ^
                    (selection != null
                    && selection[0][0] <= d.x && d.x < selection[1][0]
                    && selection[0][1] <= d.y && d.y < selection[1][1]);
              });
            }
        }

        function brushended() {
            if (d3.event.selection != null) {
              d3.select(this).call(d3.event.target.move, null);
            }
        }

        function mousedowned(d) {
            if (shiftKey) {
              d3.select(this).classed("selected", d.selected = !d.selected);
              d3.event.stopImmediatePropagation();
            } else if (!d.selected) {
              node.classed("selected", function(p) { return p.selected = d === p; });
            }
        }

        function dragged(d) {
            nudge(d3.event.dx, d3.event.dy);
        }

        function nudge(dx, dy) {
          node.filter(function(d) { return d.selected; })
              .attr("cx", function(d) { return d.x += dx; })
              .attr("cy", function(d) { return d.y += dy; })

          link.filter(function(d) { return d.source.selected; })
              .attr("x1", function(d) { return d.source.x; })
              .attr("y1", function(d) { return d.source.y; });

          link.filter(function(d) { return d.target.selected; })
              .attr("x2", function(d) { return d.target.x; })
              .attr("y2", function(d) { return d.target.y; });

          text.filter(function(d) { return d.selected; })
              .attr("x", function(d) { return d.x; })
              .attr("y", function(d) { return d.y + 0.7 * node_size + 14; });
        }

        function keydowned() {
          if (!d3.event.metaKey) {
            switch (d3.event.keyCode) {
              case 38: nudge( 0, -1); break; // UP
              case 40: nudge( 0, +1); break; // DOWN
              case 37: nudge(-1,  0); break; // LEFT
              case 39: nudge(+1,  0); break; // RIGHT
            }
          }
          shiftKey = d3.event.shiftKey || d3.event.metaKey;
        }

        function keyupped() {
          shiftKey = d3.event.shiftKey || d3.event.metaKey;
        }
    }
    });

    </script>
    """))

def draw(g, scale=None):
    global _d3_display_seq
    _d3_display_seq += 1
    seq = _d3_display_seq

    if scale == None:
        scale = 800 / (g.depth() + 2)

    node_size = 0.2 * scale
    if node_size < 4: node_size = 4

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
    <div class="d3graph" id="graph-output-""" + str(seq) + """"></div>
    <script type="text/javascript">
    require(['d3'], function(d3) {
    showGraph('#graph-output-""" + str(seq) + """',
    JSON.parse('""" + graphj + """'),
    """ + str(w) + """,
    """ + str(h) + """,
    """ + str(node_size) + """);
    });
    </script>
    """))

