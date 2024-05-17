// PyZX - Python library for quantum circuit rewriting 
//        and optimisation using the ZX-calculus
// Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//    http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// styling functions
function nodeColor(t) {
    if (t == 0) return "black";
    else if (t == 1) return "#ccffcc";
    else if (t == 2) return "#ff8888";
    else if (t == 3) return "yellow";
    else if (t == 4) return "black";
    else if (t == 5) return "black";
    else if (t == 6) return "#ccffcc";
}

function edgeColor(t) {
    if (t == 1) return "black";
    else if (t == 2) return "#08f";
    else if (t == 3) return "gray";
}

function nodeStyle(selected) {
    return selected ? "stroke-width: 2px; stroke: #00f" : "stroke-width: 1.5px";
}

var symbolGround = {
    draw: function(context, size){
        let s = size/2;

        context.moveTo(0,-s);
        context.lineTo(0,0);

        context.moveTo(-s,0);
        context.lineTo(s,0);

        context.moveTo(-2*s/3,s/3);
        context.lineTo(2*s/3,s/3);

        context.moveTo(-s/3,2*s/3);
        context.lineTo(s/3,2*s/3);
    }
}

function showGraph(tag, graph, width, height, scale, node_size, auto_hbox, show_labels, scalar_str) {
    var ntab = {};

    var groundOffset = 2.5 * node_size;

    graph.nodes.forEach(function(d) {
        ntab[d.name] = d;
        d.selected = false;
        d.previouslySelected = false;
        d.nhd = [];
    });

    var spiders_and_boundaries = graph.nodes.filter(function(d) {
        return d.t != 3;
    });

    graph.links.forEach(function(d) {
        var s = ntab[d.source];
        var t = ntab[d.target];
        d.source = s;
        d.target = t;
        s.nhd.push(t);
        t.nhd.push(s);
    });

    var shiftKey;

    // SETUP SVG ITEMS

    var svg = d3.select(tag)
    //.attr("tabindex", 1)
        .on("keydown.brush", function() {shiftKey = d3.event.shiftKey || d3.event.metaKey;})
        .on("keyup.brush", function() {shiftKey = d3.event.shiftKey || d3.event.metaKey;})
    //.each(function() { this.focus(); })
        .append("svg")
        .attr("style", "max-width: none; max-height: none")
        .attr("width", width)
        .attr("height", height);

    var link = svg.append("g")
        .attr("class", "link")
        .selectAll("line")
        .data(graph.links)
        .enter().append("path")
        .attr("stroke", function(d) { return edgeColor(d.t); })
        .attr("fill", "transparent")
        .attr("style", "stroke-width: 1.5px");

    var brush = svg.append("g")
        .attr("class", "brush");

    var node = svg.append("g")
        .attr("class", "node")
        .selectAll("g")
        .data(graph.nodes)
        .enter().append("g")
        .attr("transform", function(d) {
            return "translate(" + d.x + "," + d.y +")";
        });

    // Draw a ground symbol connected to the node.
    node.filter(function(d) { return d.ground; })
        .append("path")
        .attr("stroke", "black")
        .attr("style", "stroke-width: 1.5px")
        .attr("fill", "none")
        .attr("d", "M 0 0 L 0 "+(groundOffset))
        .attr("class", "selectable");
    node.filter(function(d) { return d.ground; })
        .append("path")
        .attr("stroke", "black")
        .attr("style", "stroke-width: 1.5px")
        .attr("fill", "none")
        .attr("d", d3.symbol().type(symbolGround).size(node_size*1.5))
        .attr("transform", "translate(0,"+groundOffset+")")
        .attr("class", "selectable");

    node.filter(function(d) { return d.t != 3 && d.t != 5 && d.t != 6; })
        .append("circle")
        .attr("r", function(d) {
            if (d.t == 0) return 0.5 * node_size;
            else if (d.t == 4) return 0.25 * node_size;
            else return node_size;
        })
        .attr("fill", function(d) { return nodeColor(d.t); })
        .attr("stroke", "black")
        .attr("class", "selectable");

    var hbox = node.filter(function(d) { return d.t == 3; });

    hbox.append("rect")
        .attr("x", -0.75 * node_size).attr("y", -0.75 * node_size)
        .attr("width", node_size * 1.5).attr("height", node_size * 1.5)
        .attr("fill", function(d) { return nodeColor(d.t); })
        .attr("stroke", "black")
        .attr("class", "selectable");

    // draw a triangle for d.t == 5
    node.filter(function(d) { return d.t == 5; })
        .append("path")
        .attr("d", "M 0 0 L "+node_size+" "+node_size+" L -"+node_size+" "+node_size+" Z")
        .attr("fill", function(d) { return nodeColor(d.t); })
        .attr("stroke", "black")
        .attr("class", "selectable")
        .attr("transform", "translate(" + (-node_size/2) + ", 0) rotate(-90)");

    // draw a square for Z box: d.t == 6
    node.filter(function(d) { return d.t == 6; })
        .append("rect")
        .attr("x", -0.75 * node_size).attr("y", -0.75 * node_size)
        .attr("width", node_size * 1.5).attr("height", node_size * 1.5)
        .attr("fill", function(d) { return nodeColor(d.t); })
        .attr("stroke", "black")
        .attr("class", "selectable");

    node.filter(function(d) { return d.phase != ''; })
        .append("text")
        .attr("y", 0.7 * node_size + 14)
        .text(function (d) { return d.phase })
        .attr("text-anchor", "middle")
        .attr("font-size", "12px")
        .attr("font-family", "monospace")
        .attr("fill", "#00d")
        .attr('style', 'pointer-events: none; user-select: none;');

    if (show_labels) {
        node.append("text")
            .attr("y", -0.7 * node_size - 8)
            .text(function (d) { return d.name; })
            .attr("text-anchor", "middle")
            .attr("font-size", "10px")
            .attr("font-family", "monospace")
            .attr("fill", "#999")
            .attr('style', 'pointer-events: none; user-select: none;');
    }

    // Display the chosen data fields over the node.
    node.filter(d => d.vdata.length > 0)
        .append("text")
        .attr("y", d => -0.7 * node_size - 14 - 10 * d.vdata.length)
        .attr("text-anchor", "middle")
        .attr("font-size", "8px")
        .attr("font-family", "monospace")
        .attr("fill", "#c66")
        .attr('style', 'pointer-events: none; user-select: none;')
        .selectAll("tspan")
        .data(d => d.vdata)
        .enter()
        .append("tspan")
        .attr("x", "0")
        .attr("dy", "1.2em")
        .text(x => x.join(": "));

    if (scalar_str != "") {
        svg.append("text")
            .text(scalar_str)
            .attr("x", 60).attr("y", 40)
            .attr("text-anchor", "middle")
    }

    function update_hboxes() {
        if (auto_hbox) {
            var pos = {};
            hbox.attr("transform", function(d) {
                // calculate barycenter of non-hbox neighbours, then nudge a bit
                // to the NE.
                var x=0,y=0,sz=0;
                for (var i = 0; i < d.nhd.length; ++i) {
                    if (d.nhd[i].t != 3) {
                        sz++;
                        x += d.nhd[i].x;
                        y += d.nhd[i].y;
                    }
                }

                offset = 0.25 * scale;

                if (sz != 0) {
                    x = (x/sz) + offset;
                    y = (y/sz) - offset;

                    while (pos[[x,y]]) {
                        x += offset;
                    }
                    d.x = x;
                    d.y = y;
                    pos[[x,y]] = true;
                }

                return "translate("+d.x+","+d.y+")";
            });
        }
    }

    update_hboxes();

    var link_curve = function(d) {
        var x1 = d.source.x, x2 = d.target.x, y1 = d.source.y, y2 = d.target.y;
        if (d.num_parallel == 1) {
            return `M ${x1} ${y1} L ${x2} ${y2}`;
        } else {
            var dx = x2 - x1, dy = y2 - y1;
            var midx = 0.5 * (x1 + x2), midy = 0.5 * (y1 + y2);
            var pos = (d.index / (d.num_parallel-1)) - 0.5;
            var cx = midx - pos * dy;
            var cy = midy + pos * dx;
            return `M ${x1} ${y1} Q ${cx} ${cy}, ${x2} ${y2}`;
            // return `M ${x1} ${y1} L ${x2} ${y2}`;
        }
    };
    link.attr("d", link_curve);

    // EVENTS FOR DRAGGING AND SELECTION

    node.on("mousedown", function(d) {
        if (shiftKey) {
            d3.select(this).selectAll(".selectable").attr("style", nodeStyle(d.selected = !d.selected));
            d3.event.stopImmediatePropagation();
        } else if (!d.selected) {
            node.selectAll(".selectable").attr("style", function(p) { return nodeStyle(p.selected = d === p); });
        }
    })
        .call(d3.drag().on("drag", function(d) {
            var dx = d3.event.dx;
            var dy = d3.event.dy;
            // node.filter(function(d) { return d.selected; })
            //     .attr("cx", function(d) { return d.x += dx; })
            //     .attr("cy", function(d) { return d.y += dy; });
            node.filter(function(d) { return d.selected; })
                .attr("transform", function(d) {
                    d.x += dx;
                    d.y += dy;
                    return "translate(" + d.x + "," + d.y +")";
                });

            update_hboxes();

            link.filter(function(d) { return d.source.selected || d.target.selected ||
                    (auto_hbox && d.source.t == 3); })
                .attr("d", link_curve);
        }));

    brush.call(d3.brush().keyModifiers(false)
        .extent([[0, 0], [width, height]])
        .on("start", function() {
            if (d3.event.sourceEvent.type !== "end") {
                node.selectAll(".selectable").attr("style", function(d) {
                    return nodeStyle(
                        d.selected = d.previouslySelected = shiftKey &&
                        d.selected);
                });
            }
        })
        .on("brush", function() {
            if (d3.event.sourceEvent.type !== "end") {
                var selection = d3.event.selection;
                node.selectAll(".selectable").attr("style", function(d) {
                    return nodeStyle(d.selected = d.previouslySelected ^
                        (selection != null
                            && selection[0][0] <= d.x && d.x < selection[1][0]
                            && selection[0][1] <= d.y && d.y < selection[1][1]));
                });
            }
        })
        .on("end", function() {
            if (d3.event.selection != null) {
                d3.select(this).call(d3.event.target.move, null);
            }
        }));
}
