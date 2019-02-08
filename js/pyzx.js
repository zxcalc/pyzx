define(['d3'], function(d3) {
    
    // styling functions
    function nodeColor(t) {
        if (t == 0) return "black";
        else if (t == 1) return "green";
        else if (t == 2) return "red";
    }

    function edgeColor(t) {
        if (t == 1) return "black";
        else if (t == 2) return "#08f";
    }

    function nodeStyle(selected) {
        return selected ? "stroke-width: 2px; stroke: #00f" : "stroke-width: 1.5px";
    }

    return {
    showGraph: function(tag, graph, width, height, node_size) {
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

        var shiftKey;

        // SETUP SVG ITEMS

        var svg = d3.select(tag)
            .attr("tabindex", 1)
            .on("keydown.brush", function() {shiftKey = d3.event.shiftKey || d3.event.metaKey;})
            .on("keyup.brush", function() {shiftKey = d3.event.shiftKey || d3.event.metaKey;})
            .each(function() { this.focus(); })
            .append("svg")
            .attr("style", "max-width: none; max-height: none")
            .attr("width", width)
            .attr("height", height);

        var link = svg.append("g")
            .attr("class", "link")
            .selectAll("line")
            .data(graph.links)
            .enter().append("line")
            .attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; })
            .attr("stroke", function(d) { return edgeColor(d.t); })
            .attr("style", "stroke-width: 1.5px");

        var brush = svg.append("g")
            .attr("class", "brush");

        var node = svg.append("g")
            .attr("class", "node")
            .selectAll("circle")
            .data(graph.nodes)
            .enter().append("circle")
            .attr("r", function(d) {
               if (d.t == 0) return 0.5 * node_size;
               else return node_size;
            })
            .attr("cx", function(d) { return d.x; })
            .attr("cy", function(d) { return d.y; })
            .attr("fill", function(d) { return nodeColor(d.t); })
            .attr("stroke", "black");

        var text = svg.selectAll("text")
            .data(graph.nodes)
            .enter()
            .append("text")
            .attr("x", function(d) { return d.x; })
            .attr("y", function(d) { return d.y + 0.7 * node_size + 14; })
            .text( function (d) { return d.phase })
            .attr("text-anchor", "middle")
            .attr("font-size", "12px")
            .attr("font-family", "monospace")
            .attr("fill", "#00d");

        // EVENTS FOR DRAGGING AND SELECTION

        node.on("mousedown", function(d) {
                if (shiftKey) {
                    d3.select(this).attr("style", nodeStyle(d.selected = !d.selected));
                    d3.event.stopImmediatePropagation();
                } else if (!d.selected) {
                    node.attr("style", function(p) { return nodeStyle(p.selected = d === p); });
                }
            })
            .call(d3.drag().on("drag", function(d) {
                var dx = d3.event.dx;
                var dy = d3.event.dy;
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
            }));

        brush.call(d3.brush()
            .extent([[0, 0], [width, height]])
            .on("start", function() {
                if (d3.event.sourceEvent.type !== "end") {
                    node.attr("style", function(d) {
                        return nodeStyle(
                            d.selected = d.previouslySelected = shiftKey &&
                            d.selected);
                    });
                }
            })
            .on("brush", function() {
                if (d3.event.sourceEvent.type !== "end") {
                    var selection = d3.event.selection;
                    node.attr("style", function(d) {
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
