// When the next line is uncommented, the module is reloaded every time the javascript is imported
// This is useful for development.
require.undef('make_editor')

define('make_editor', ['d3'], function(d3) {
        
    // styling functions
    function nodeColor(t) {
        if (t == 0) return "black";
        else if (t == 1) return "green";
        else if (t == 2) return "red";
        else if (t == 3) return "yellow";
    }

    function edgeColor(t,selected) {
        if (selected) return "#083bd4";
        if (t == 1) return "black";
        else if (t == 2) return "#08f";
    }

    function edgeWidth(selected) {
        if (selected) return "stroke-width: 2.5px";
        return "stroke-width: 1.5px";
    }

    function nodeStyle(selected) {
        return selected ? "stroke-width: 2px; stroke: #00f" : "stroke-width: 1.5px";
    }

    function prepareGraph(graph, selection) {
        var max_name = -1;
        
        var vtab = {};
        graph.nodes.forEach(function(d) {
            vtab[d.name] = d;
            if (d.name > max_name) max_name = d.name;
            d.selected = false;
            d.previouslySelected = false;
            d.nhd = [];
        });
        selection.nodes.forEach(function(d) {if (d.name in vtab) vtab[d.name].selected=true;});

        var ltab = {};
        graph.links.forEach(function(d) {
            ltab[d.source + "_" + d.target] = d;
            var s = vtab[d.source];
            var t = vtab[d.target];
            d.source = s;
            d.target = t;
            s.nhd.push(t);
            t.nhd.push(s);
            d.selected = false;
        });
        selection.links.forEach(function(d) {if (d.source +"_" + d.target in ltab) ltab[d.source +"_" + d.target].selected=true;});
        return max_name;
    }

    function showGraph(tag, model, show_labels) {
        var shiftKey, ctrlKey;

        // SETUP SVG ITEMS

        var svg = d3.select(tag)
            .attr("tabindex", 1)
            .on("keydown.brush", function() {shiftKey = d3.event.shiftKey || d3.event.metaKey;
            								 ctrlKey  = d3.event.ctrlKey;})
            .on("keyup.brush", function() {shiftKey = d3.event.shiftKey || d3.event.metaKey;
            							   ctrlKey  = d3.event.ctrlKey;})
            .each(function() { this.focus(); })
            .append("svg")
            .attr("style", "max-width: none; max-height: none")
            .attr("width", model.width)
            .attr("height", model.height);
        
        var brush = svg.append("g")
            .attr("class", "brush");
        
        var link = svg.append("g")
                .attr("class", "link")
                .selectAll("line")

        var node = svg.append("g")
                .attr("class", "node")
                .selectAll("g")
        
        const dragLine = svg.append('line')
                .attr('id', 'dragLine')
                .attr('class', 'link hidden')
                .attr("stroke", edgeColor(1))
                .attr("style", "stroke-width: 1.5px;pointer-events: none;")
                .attr("x1", 0)
                .attr("y1", 0)
                .attr("x2", 0)
                .attr("y2", 0);

        var mousedownNode = null;
        
        function resetMouseVars() {
            mousedownNode = null;
        }

        
        const vertexTypeBox = svg.append('g');
        vertexTypeBox.append('rect')
                .attr('x',0)
                .attr('y',model.height-24)
                .attr('width', 100).attr('height', 24)
                .attr("stroke", "black")
                .attr("fill", "white")
                .attr("style", "stroke-width: 2.5px");
        vertexTypeBox.append('text')
                .attr('x',5)
                .attr('y',model.height-7)
                .attr('style', 'pointer-events: none; user-select: none;')
                .text("Vertex type: Z");

        const edgeTypeBox = svg.append('g');
        edgeTypeBox.append('rect')
                .attr('x',100)
                .attr('y',model.height-24)
                .attr('width', 100).attr('height', 24)
                .attr("stroke", "black")
                .attr("fill", "white")
                .attr("style", "stroke-width: 2.5px");
        edgeTypeBox.append('text')
                .attr('x',105)
                .attr('y',model.height-7)
                .attr('style', 'pointer-events: none; user-select: none;')
                .text("Edge type: R");

        var addVertexType = 1;
        var addEdgeType = 1;

        function switchAddVertexType() {
            console.log("Switching vertex type");
            addVertexType = (addVertexType + 1) % 4;
            var thetext = vertexTypeBox.select("text");
            let options = ['B','Z','X','H'];
            thetext.text("Vertex type: " + options[addVertexType]);
            d3.event.stopImmediatePropagation();
            resetMouseVars();
        }

        function switchAddEdgeType() {
            console.log("Switching edge type");
            var thetext = edgeTypeBox.select("text");
            if (addEdgeType == 1) {
                thetext.text("Edge type: H");
                addEdgeType = 2;
            }
            else {
                thetext.text("Edge type: R");
                addEdgeType = 1;
            }
            d3.select("#dragLine").attr("stroke", edgeColor(addEdgeType));
            d3.event.stopImmediatePropagation();
            resetMouseVars();
        }

        edgeTypeBox.on("click", function(d) {switchAddEdgeType();});
        vertexTypeBox.on("click", function(d) {switchAddVertexType();});

        function deselectEdges() {
            link.attr("stroke", function(e) {return edgeColor(e.t,e.selected=false);})
                            .attr("style", edgeWidth(false));
        }

        
        function updateGraph() {
            console.log("Updating graph view")
            var node_size = model.node_size;
            var graph = model.graph;
            
            //First initialize all the nodes properly, before looking at edges.
            node = node.data(graph.nodes, function(d) {return d.name;});
            node.exit().remove();
            
            var newnodes = node.enter().append("g")

            newnodes.filter(function(d) { return d.t != 3; })
                .append("circle")
                .attr("stroke", "black");

            var hbox = newnodes.filter(function(d) { return d.t == 3; });

            hbox.append("rect")
                .attr("x", -0.75 * node_size).attr("y", -0.75 * node_size)
                .attr("width", node_size * 1.5).attr("height", node_size * 1.5)
                .attr("fill", nodeColor(3))
                .attr("stroke", "black");

            newnodes.append("text")
                .attr("y", 0.7 * node_size + 14)
                .attr("text-anchor", "middle")
                .attr("font-size", "12px")
                .attr("font-family", "monospace")
                .attr("fill", "#00d")
                .attr("style", 'pointer-events: none; user-select: none;')

            if (show_labels) {
                newnodes.append("text")
                    .attr("y", -0.7 * node_size - 5)
                    .text(function (d) { return String(d.name); })
                    .attr("text-anchor", "middle")
                    .attr("font-size", "8px")
                    .attr("font-family", "monospace")
                    .attr("fill", "#ccc")
                    .attr('style', 'pointer-events: none; user-select: none;');
            }

            //All the keyboard events of the nodes

            newnodes.on("mousedown", function(d) {
                if (d3.event.ctrlKey) { // Start the adding of an edge
                    mousedownNode = d;
                    d3.event.stopImmediatePropagation();
                    dragLine.classed('hidden', false)
                        .attr("x1", mousedownNode.x)
                        .attr("y1", mousedownNode.y)
                        .attr("x2", mousedownNode.x)
                        .attr("y2", mousedownNode.y);
                }
                else if (shiftKey) { // Add the node to the selection
                    console.log("Adding to selection");
                    d3.select(this).select(":first-child").attr("style", nodeStyle(d.selected = !d.selected));
                    d3.event.stopImmediatePropagation();
                    resetMouseVars();
                    model.selection_changed();
                } else if (!d.selected) {
                    console.log("Deselecting all except this vertex");
                    node.select(":first-child").attr("style", function(p) { return nodeStyle(p.selected = d === p); });
                    deselectEdges();
                    resetMouseVars();
                    model.selection_changed();
                }
            })
            .on("mouseup", function(d) { //Check if we need to add an edge
                if (d3.event.ctrlKey && mousedownNode) {
                    d3.event.stopImmediatePropagation();
                    dragLine.classed('hidden', true);
                    if (mousedownNode === d) {//released on self
                        resetMouseVars();
                        return; 
                    }
                    f = link.filter(function (e) {
                        return ((e.source.name == mousedownNode.name && e.target.name == d.name) ||
                                (e.target.name == mousedownNode.name && e.source.name == d.name));
                    })
                    if (!f.empty()) {
                        console.log("already edge present")
                        f.attr("stroke", function(d) {d.t = addEdgeType;return edgeColor(d.t)});
                    }
                    else {
                    const edge = {t:addEdgeType, source: mousedownNode, target: d, selected: false};
                    console.log("Adding edge")
                    mousedownNode.nhd.push(d);
                    d.nhd.push(mousedownNode);
                    model.graph.links.push(edge);
                    //updateGraph();
                    }
                    model.push_changes("Added edge");
                }
            })
            .on("dblclick", function(d) {
                const pi = '\u03c0';
                var phase = prompt("Input phase as fraction of pi (like 3/4 or 1):", d.phase);
                if (phase == null) {return;}
                if (phase.includes('.')) {alert("Invalid value " + phase) + phase; return;}
                if (phase != "") {
                    phase = phase.replace(pi, '').replace('pi', '');
                    if (phase.includes("/")) {
                        var terms = phase.split("/");
                        if (terms.length != 2) {alert("Invalid value " + phase); return;}
                        let a = terms[0]; let b = terms[1];
                        if (a!= "" && a != "-" && isNaN(a)) {alert("Invalid value " + phase); return;}
                        if (a=="1") {a = "";}
                        if (a=="-1") {a = "-";}
                        // if (a == "") {a=1;}
                        // else if (a == "-") {a=-1;}
                        // else if (isNaN(a)) {alert("Invalid value " + phase); return;}
                        // else {a = parseInt(a);}
                        if (isNaN(b)) {alert("Invalid value " + phase); return;}
                        b = parseInt(b);
                        phase = a + pi +"/" + b;
                    }
                    else {
                        if (isNaN(phase)) {alert("Invalid value " + phase); return;}
                        let a = parseInt(phase) % 2
                        if (d.t != 3) {
                            if (phase == "") {phase = pi;}
                            else if (a == 0) {phase = "";} 
                            else {phase = pi;}
                        }
                        else {
                            if (phase == "") {phase = "";}
                            else if (a == 1) {phase = "";}
                            else {phase = "0"}
                        }
                    }
                }
                d.phase = phase
                model.push_changes("Changed phase");

                d3.select(this).select("text").text(phase)
                                .attr("visibility", (phase == "") ? 'hidden' : 'visible')
            })
            .call(d3.drag().on("drag", function(d) {
                var dx = d3.event.dx;
                var dy = d3.event.dy;
                node.filter(function(d) { return d.selected; })
                    .attr("transform", function(d) {
                        d.x += dx;
                        d.y += dy;
                        return "translate(" + d.x + "," + d.y +")";
                    });


                link.filter(function(d) { return d.source.selected; })
                    .attr("x1", function(d) { return d.source.x; })
                    .attr("y1", function(d) { return d.source.y; });

                link.filter(function(d) { return d.target.selected; })
                    .attr("x2", function(d) { return d.target.x; })
                    .attr("y2", function(d) { return d.target.y; });

                // text.filter(function(d) { return d.selected; })
                //     .attr("x", function(d) { return d.x; })
                //     .attr("y", function(d) { return d.y + 0.7 * node_size + 14; });
            }).on("end", function(d) {model.push_changes("Moved selection");})
            );

            //Finally position all the nodes and update the texts and types
            
            node = newnodes.merge(node);
            node.attr("transform", function(d) {
                        return "translate(" + d.x + "," + d.y +")";
                    }).filter(function(d) {return d.t!=3;})
                .select(":first-child")
                    .attr("r", function(d) {
                           if (d.t == 0) return 0.5 * node_size;
                           else return node_size;
                        })
                    .attr("fill", function(d) { return nodeColor(d.t); });

            node.select("text").text(function (d) { return d.phase })
                    .attr("visibility", function(d) {return (d.phase == "") ? 'hidden' : 'visible';});

            //TODO: Right now, if a node changes from non-type 3 to type 3 or back, 
            //then the square wouldn't update to a circle and vice versa
            hbox = node.filter(function(d) { return d.t == 3; });

            // Now let's construct and update all the edges
            
            link = link.data(graph.links, function(d) {return String(d.source.name) + "_" + String(d.target.name);});
            link.exit().remove();
            
            var newlinks = link.enter().append("line")
                .on("click", function(d) {
                    if (d3.event.ctrlKey) {return;}
                    if (!shiftKey) {
                        deselectEdges();
                        node.select(":first-child").attr("style", function(n) {nodeStyle(n.selected=false)});
                    }
                    d.selected = !d.selected
                    d3.select(this).attr("stroke", edgeColor(d.t,d.selected))
                        .attr("style", edgeWidth(d.selected));
                    model.selection_changed();
                });
            
            link = newlinks.merge(link);
            link.attr("stroke", function(d) { return edgeColor(d.t,d.selected); })
                .attr("style", function(d) {return edgeWidth(d.selected); })
                .attr("x1", function(d) { return d.source.x; })
                .attr("y1", function(d) { return d.source.y; })
                .attr("x2", function(d) { return d.target.x; })
                .attr("y2", function(d) { return d.target.y; });
        } // End function updateGraph()
        
        updateGraph();
        
        // EVENTS FOR ADDING VERTICES AND EDGES
        svg.on("mousedown", function(d) {
            if (!d3.event.ctrlKey) return;
            console.log("Adding vertex");
            const point = d3.mouse(this);
            model.max_name += 1
            const vert = { name: model.max_name, t: addVertexType, 
                           selected: false, previouslySelected: false,
                           nhd: [], x: point[0], y: point[1], phase:''};
            model.graph.nodes.push(vert);
            resetMouseVars();
            model.push_changes("Added vertex");
            //updateGraph();
            })
            .on("mousemove", function(d) {
                if (!mousedownNode) return;
                dragLine.attr("x2", d3.mouse(this)[0])
                    .attr("y2",d3.mouse(this)[1]);
            })
            .on("mouseup", function(d) {
                if (mousedownNode) {
                    dragLine.classed('hidden', true);
                    resetMouseVars();
                }
            });
        
        var lastKeyDown = -1;
        
        d3.select(tag).on("keydown", function() {
            if (lastKeyDown !== -1) return;
            lastKeyDown = d3.event.keyCode;
            switch (d3.event.keyCode) {
                case 46: //delete
                case 8: //backspace
                    console.log("Deleting...")
                    d3.event.preventDefault();
                    node.each(function(d) {
                        if (!d.selected) return;
                        model.graph.nodes.splice(model.graph.nodes.indexOf(d),1);
                    });
                    link.each(function(d) {
                        if (!d.source.selected && !d.target.selected && !d.selected) return;
                        model.graph.links.splice(model.graph.links.indexOf(d),1);
                        var l = d.target.nhd;
                        l.splice(l.indexOf(d.source),1);
                        l = d.source.nhd;
                        l.splice(l.indexOf(d.target),1);
                        // if (d.source.selected) {
                        //     let l = d.target.nhd;
                            
                        // }
                        // if (d.target.selected) {
                            
                        // }
                    });
                    model.push_changes("Delete");
                    model.selection_changed();
                    break;
                case 88: // X
                    d3.event.preventDefault();
                    switchAddVertexType(); break;
                case 69: // E
                    d3.event.preventDefault();
                    switchAddEdgeType(); break
                case 90: // Z
                	d3.event.preventDefault();
                	if (!shiftKey) {model.perform_action("undo");}
                	else {model.perform_action("redo");}
                	break;
            }
            
        }).on("keyup", function() {
            lastKeyDown = -1;
        });

        // EVENTS FOR DRAGGING AND SELECTION
        
        brush.call(d3.brush().keyModifiers(false).filter(() => !d3.event.ctrlKey)
            //.extent([[0, 0], [model.width, model.height]])
            .on("start", function() {
                if (d3.event.sourceEvent.type !== "end") {
                    node.select(":first-child").attr("style", function(d) {
                        return nodeStyle(
                            d.selected = d.previouslySelected = shiftKey &&
                            d.selected);
                    });
                    if (!shiftKey) deselectEdges();
                    model.selection_changed();
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
                    model.selection_changed();
                }
            }));

        return updateGraph;
    }

    return {
        prepareGraph: prepareGraph,
        showGraph: showGraph
    };
});
