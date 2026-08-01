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
    if (t == 0) return _settings_colors['boundary'];
    else if (t == 1) return _settings_colors['Z']; // "#ccffcc";
    else if (t == 2) return _settings_colors['X']; // "#ff8888";
    else if (t == 3) return _settings_colors['H']; // "yellow";
    else if (t == 4) return _settings_colors['W']; // "black";
    else if (t == 5) return _settings_colors['Walt']; // "black";
    else if (t == 6) return _settings_colors['Zalt']; // "#ccffcc";
}

function edgeColor(t) {
    if (t == 1) return _settings_colors['edge']; //"black";
    else if (t == 2) return _settings_colors['Hedge']; // "#08f";
    else if (t == 3) return _settings_colors['Xedge']; // "gray";
}

function webColor(t) {
    if (t == 'X') return _settings_colors['Xdark'];
    else if (t == 'Y') return _settings_colors['Ydark'];
    else if (t == 'Z') return _settings_colors['Zdark'];
    else if (t == 'I') return '#dddddd';
}

function nodeStyle(selected) {
    return selected ? "stroke-width: 2px; stroke: #00f" : "stroke-width: 1.5px";
}

function nodeRadius(t, node_size) {
    let r = node_size;
    if (t === 0) { r *= 0.50; }
    else if (t === 4) { r *= 0.25; }
    return r;
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

function get_visual_center(node, node_size) {
    let vx = node.x;
    let vy = node.y;
    if (node.t === 5) {
        vx += node_size / 2;
    }
    return [vx, vy];
}

// Function to detect overlapping nodes. The approach uses a quadtree of nodes that can be efficiently queried
// to consider only the nodes in a region of interest around some node. See https://d3js.org/d3-quadtree.
// n.b. all nodes are treated as circles, an approximation which may introduce some false positives.
function detect_overlaps(graph, node_size, overlap_markers, overlap_summary) {
    // Populate the quadtree of nodes for overlap detection.
    const node_space = d3.quadtree()
        .x(node => node.x)
        .y(node => node.y)
        .addAll(graph.nodes);

    // Purge the old overlap markers.
    overlap_markers.selectAll("*").remove()
    overlap_summary.selectAll("*").remove()

    // console.log(`Space size : ${node_space.size()} [ns:${node_size}, d:${diameter}, r^2:${diameter_squared}]`)
    const diameter = 2 * node_size;

    let nodes_overlapping = 0
    graph.nodes.forEach(function (node) {
        let current_radius = nodeRadius(node.t, node_size);
        let [ node_vx , node_vy ] = get_visual_center(node, node_size);
        // These four constants represent the boundaries of the box that must be explored for overlapping nodes.
        const xmin = node.x - diameter; const xmax = node.x + diameter;
        const ymin = node.y - diameter; const ymax = node.y + diameter;
        let overlap_detected = false;
        node_space.visit((quadnode, xL, yT, xR, yB) => {
            // A leaf may contain either a single node or multiple coincident nodes
            while (quadnode && !quadnode.length && !overlap_detected) {
                // The node overlaps with the one contained in the quadnode if they are closer than the diameter
                let other = quadnode.data;
                let [ other_vx, other_vy ] = get_visual_center(other, node_size);
                let dx = other_vx - node_vx;
                let dy = other_vy - node_vy;
                let distance_squared = dx * dx + dy * dy;
                let other_radius = nodeRadius(other.t, node_size);
                let minimal_distance_squared = (current_radius + other_radius)**2;
                // Comparison against the square of the distance to avoid computing an expensive sqrt(..)
                if (distance_squared <= minimal_distance_squared && other !== node) {
                    // console.log(`> Overlap detected for ${node.name}@(${node.x},${node.y}) by ${other.name}`);
                    overlap_markers.append("circle")
                        .attr("cx", node_vx)
                        .attr("cy", node_vy)
                        .attr("r", 2.25 * node_size)
                        .attr("fill", "rgba(255, 255, 0, 0.75)")
                        .attr("stroke", "black")
                        .attr("stroke-width", "2px")
                        .attr("stroke-dasharray", "3");
                    nodes_overlapping += 1;
                    // Don't search further once an overlap has been detected for the node
                    overlap_detected = true;
                }
                quadnode = quadnode.next;
            }
            // Don't explore this branch if we are completely outside the neighbourhood of d or an overlap was detected
            return overlap_detected || xR < xmin || xmax < xL || yB < ymin || ymax < yT;
        });
    });

    if (nodes_overlapping > 0) {
        // console.log(`Overlapping nodes detected : ${nodes_overlapping}`)
        let text = overlap_summary.append("text")
            .attr("x", 190)
            .attr("y", 16)
            .attr("text-anchor", "middle")
            .text(`${nodes_overlapping} overlapping nodes detected`)
            .style("fill", "black")
            .style("font-family", "sans-serif")
            .style("font-size", "14px");
        let box = text.node().getBBox();
        let padding_h = 2, padding_v = 1;
        overlap_summary.insert("rect", "text") // Place rectangle under text
            .attr("x", box.x - padding_h)
            .attr("y", box.y - padding_v)
            .attr("width", box.width + (2 * padding_h))
            .attr("height", box.height + (2 * padding_v))
            .attr("fill", "rgba(255, 255, 0, 1.0)")
            .attr("stroke", "black")
            .attr("stroke-width", "2px")
            .attr("stroke-dasharray", "3");
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

    graph.pauli_web.forEach(function(d) {
        var s = ntab[d.source];
        var t = ntab[d.target];
        d.source = s;
        d.target = t;
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

    // SETUP FOR ZOOMING
    // Based on https://observablehq.com/@d3/zoom-to-bounding-box
    // The canvas is needed to consistently scale all drawn elements across viewers (Jupyter & web browsers).
    var canvas = svg.append("g");

    var zoomer = d3.zoom()
        .scaleExtent([1, 8])
        .on("zoom", function () {
            canvas.attr("transform", d3.event.transform);
        });
    svg.call(zoomer); // Attach the zooming behavior to the SVG
    svg.on("mousedown", function () {
        // Handle the resetting of the zoom level when clicking the wheel button
        if (d3.event.button === 1) {
            svg.transition().duration(750).call(
                zoomer.transform,
                d3.zoomIdentity,
                d3.zoomTransform(svg.node()).invert([width / 2, height / 2])
            );
            d3.event.stopImmediatePropagation();
        }
    });

    // This container is used to store the markers that highlight overlapping nodes.
    var overlap_summary = svg.append("g")
        .attr("class", "overlap_summary");
    var overlap_markers = canvas.append("g")
        .attr("class", "overlap");

    var web = canvas.append("g")
        .attr("class", "web")
        .selectAll("line")
        .data(graph.pauli_web)
        .enter().append("path")
        .attr("stroke", function(d) { return webColor(d.t); })
        .attr("fill", "transparent")
        .attr("style", "stroke-width: 7px");

    var link = canvas.append("g")
        .attr("class", "link")
        .selectAll("line")
        .data(graph.links)
        .enter().append("path")
        .attr("stroke", function(d) { return edgeColor(d.t); })
        .attr("fill", "transparent")
        .attr("style", "stroke-width: 1.5px");

    var brush = canvas.append("g")
        .attr("class", "brush");

    var node = canvas.append("g")
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
        .attr("r", d => nodeRadius(d.t, node_size))
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

                let offset = 0.25 * scale;

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

    // Perform the initial round of overlap detection
    detect_overlaps(graph, node_size, overlap_markers, overlap_summary);

    var link_curve = function(d) {
        var x1 = d.source.x, x2 = d.target.x, y1 = d.source.y, y2 = d.target.y;
        if (x1 == x2 && y1 == y2 && d.num_parallel == 1) {
            var cx1 = x1 - 40;
            var cy1 = y1 - 40;
            var cx2 = x1 + 40;
            var cy2 = y1 - 40;
            return `M ${x1} ${y1} C ${cx1} ${cy1}, ${cx2} ${cy2}, ${x2} ${y2}`;
        } else if (x1 == x2 && y1 == y2) {
            var pos = d.index + 1;
            var cx1 = x1 - 20 - pos * 10;
            var cy1 = y1 - 20 - pos * 10;
            var cx2 = x1 + 20 + pos * 10;
            var cy2 = y1 - 20 - pos * 10;
            return `M ${x1} ${y1} C ${cx1} ${cy1}, ${cx2} ${cy2}, ${x2} ${y2}`;
        } else if (d.num_parallel == 1) {
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


    var web_curve = function(d) {
        var x1 = d.source.x, x2 = (x1 + d.target.x)/2, y1 = d.source.y, y2 = (y1 + d.target.y)/2;
        return `M ${x1} ${y1} L ${x2} ${y2}`;
    }
    web.attr("d", web_curve);

    // EVENTS FOR DRAGGING AND SELECTION

    var dragger = d3.drag()
        .on("drag", function(d) {
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
            web.filter(function(d) { return d.source.selected || d.target.selected; })
                .attr("d", web_curve);
        })
        .on("end", () =>
            // Once the user releases the node, we can perform a new round of overlapping nodes detection.
            detect_overlaps(graph, node_size, overlap_markers, overlap_summary)
        );

    node.on("mousedown", function(d) {
        if (shiftKey) {
            d3.select(this).selectAll(".selectable").attr("style", nodeStyle(d.selected = !d.selected));
            d3.event.stopImmediatePropagation();
        } else if (!d.selected) {
            node.selectAll(".selectable").attr("style", function(p) { return nodeStyle(p.selected = d === p); });
        }
    })
        .call(dragger);

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
