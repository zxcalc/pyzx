require.undef('zx_viewer');

define('zx_viewer', ['d3'], function(d3) {
    
    // styling functions
    function nodeColor(t) {
        if (t == 0) return "black";
        else if (t == 1) return "green";
        else if (t == 2) return "red";
        else if (t == 3) return "yellow";
    }

    function edgeColor(t) {
        if (t == 1) return "black";
        else if (t == 2) return "#08f";
    }

    function nodeStyle(selected) {
        return selected ? "stroke-width: 2px; stroke: #00f" : "stroke-width: 1.5px";
    }

    return {
    showGraph: function(tag, graph, width, height, scale, node_size, auto_hbox, show_labels) {
        var ntab = {};

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
            .enter().append("line")
            .attr("stroke", function(d) { return edgeColor(d.t); })
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

        node.filter(function(d) { return d.t != 3; })
            .append("circle")
            .attr("r", function(d) {
               if (d.t == 0) return 0.5 * node_size;
               else return node_size;
            })
            .attr("fill", function(d) { return nodeColor(d.t); })
            .attr("stroke", "black");

        var hbox = node.filter(function(d) { return d.t == 3; });

        hbox.append("rect")
            .attr("x", -0.75 * node_size).attr("y", -0.75 * node_size)
            .attr("width", node_size * 1.5).attr("height", node_size * 1.5)
            .attr("fill", function(d) { return nodeColor(d.t); })
            .attr("stroke", "black");

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
                .attr("y", -0.7 * node_size - 5)
                .text(function (d) { return d.name; })
                .attr("text-anchor", "middle")
                .attr("font-size", "8px")
                .attr("font-family", "monospace")
                .attr("fill", "#ccc")
                .attr('style', 'pointer-events: none; user-select: none;');
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

        link.attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; });

        // EVENTS FOR DRAGGING AND SELECTION

        node.on("mousedown", function(d) {
                if (shiftKey) {
                    d3.select(this).select(":first-child").attr("style", nodeStyle(d.selected = !d.selected));
                    d3.event.stopImmediatePropagation();
                } else if (!d.selected) {
                    node.select(":first-child").attr("style", function(p) { return nodeStyle(p.selected = d === p); });
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

                link.filter(function(d) { return d.source.selected ||
                                            (auto_hbox && d.source.t == 3); })
                    .attr("x1", function(d) { return d.source.x; })
                    .attr("y1", function(d) { return d.source.y; });

                link.filter(function(d) { return d.target.selected ||
                                            (auto_hbox && d.target.t == 3); })
                    .attr("x2", function(d) { return d.target.x; })
                    .attr("y2", function(d) { return d.target.y; });

                // text.filter(function(d) { return d.selected; })
                //     .attr("x", function(d) { return d.x; })
                //     .attr("y", function(d) { return d.y + 0.7 * node_size + 14; });
            }));

        brush.call(d3.brush().keyModifiers(false)
            .extent([[0, 0], [width, height]])
            .on("start", function() {
                if (d3.event.sourceEvent.type !== "end") {
                    node.select(":first-child").attr("style", function(d) {
                        return nodeStyle(
                            d.selected = d.previouslySelected = shiftKey &&
                            d.selected);
                    });
                }
            })
            .on("brush", function() {
                if (d3.event.sourceEvent.type !== "end") {
                    var selection = d3.event.selection;
                    node.select(":first-child").attr("style", function(d) {
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
    }};
});
