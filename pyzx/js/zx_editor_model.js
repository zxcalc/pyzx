// When the next line is uncommented, the module is reloaded every time the javascript is imported
// This is useful for development.
require.undef('zx_editor');

define('zx_editor', ["@jupyter-widgets/base", "make_editor"], function(widgets,make_editor) {
    console.log("Loading model script");
    var ZXEditorModel = widgets.DOMWidgetModel.extend({
        defaults: _.extend(widgets.DOMWidgetModel.prototype.defaults(), {
            _model_name: 'ZXEditorModel',
            _view_name: 'ZXEditorView',
            _model_module: 'zx_editor',
            _view_module: 'zx_editor',
            _model_module_version: '0.1.0',
            _view_module_version: '0.1.0',
            graph_json: '{"nodes": [], "links": []}',
            graph_selected: '{"nodes": [], "links": []}',
            graph_id: '0',
            graph_width: 600.0,
            graph_height: 400.0,
            graph_node_size: 5.0
        })
    });
    
    var ZXEditorView = widgets.DOMWidgetView.extend({
        
        render: function() {
            var div_editor = document.createElement('div');
            div_editor.setAttribute('style', 'overflow:auto');
            var graph_id = this.model.get('graph_id');
            var div_id = 'zx-interactive-' + graph_id;
            div_editor.setAttribute('id', div_id);
            this.el.appendChild(div_editor);
            this.graph = JSON.parse(this.model.get('graph_json'));
            this.selected = JSON.parse(this.model.get('graph_selected'));
            this.max_name = make_editor.prepareGraph(this.graph,this.selected);
            this.width = this.model.get("graph_width");
            this.height = this.model.get("graph_height");
            this.node_size = this.model.get("graph_node_size");
            this.update_graph = make_editor.showGraph(div_editor, this, false);
            this.listenTo(this.model, 'change:graph_json', this.graph_changed, this);

            var div_buttons = document.createElement('div');
            var operations = JSON.parse(this.model.get('graph_buttons'));
            var buttons = {};
            var model = this.model;
            Object.keys(operations).forEach(function(btn_id) {
                let btn = document.createElement('button');
                buttons[btn_id] = btn
                btn.textContent = operations[btn_id]['text'];
                btn.setAttribute('title',operations[btn_id]['tooltip'])
                //btn.setAttribute('id', 'zx-button' + graph_id + '-' + btn_id);
                btn.disabled = true;
                btn.setAttribute('style', 'opacity: 60%;');
                btn.addEventListener('click', function(e) {model.set('button_clicked', btn_id);model.save_changes();});
                div_buttons.appendChild(btn);
            });
            this.el.appendChild(div_buttons);
            this.buttons = buttons;
            this.listenTo(this.model, 'change:graph_buttons', this.buttons_changed, this);
            //btn.onclick = this.push_changes.bind(this);
            //this.el.appendChild(btn)
        },

        strip_graph: function(graph) {
            var g = {links: [], nodes: []}
            graph.nodes.forEach(function(d) {
                g.nodes.push({"name": d.name, "x":d.x, "y": d.y, "t": d.t, "phase": d.phase})
            });
            graph.links.forEach(function(d) {
               g.links.push({"source": d.source.name, "target": d.target.name, "t":d.t}) 
            });
            //console.log(g);
            return g
        },

        selection_changed: function() {
            console.log("Pushing selection changes");
            var g = {links: [], nodes: []}
            this.graph.nodes.forEach(function(d) {if (d.selected) g.nodes.push(d);})
            this.graph.links.forEach(function(d) {if (d.selected) g.links.push(d);})
            this.model.set('graph_selected', JSON.stringify(this.strip_graph(g)));
            this.model.save_changes();
        },

        graph_changed: function() {
            console.log("Updating graph");
            var new_graph = JSON.parse(this.model.get('graph_json'));
            var selection = JSON.parse(this.model.get('graph_selected'));
            this.max_name = make_editor.prepareGraph(new_graph, selection);
            this.graph = new_graph;
            //console.log(this.graphData.graph);
            this.update_graph();
        },

        push_changes: function() {
            console.log("Pushing changes to kernel")
            this.model.set('graph_json', JSON.stringify(this.strip_graph(this.graph)));
            this.model.save_changes();
            //this.model.touch();
        },

        buttons_changed: function() {
            console.log("Updating buttons");
            var operations = JSON.parse(this.model.get('graph_buttons'));
            var buttons = this.buttons;
            Object.keys(operations).forEach(function(btn_id) {
                if (operations[btn_id]["active"]) {
                    buttons[btn_id].disabled = false; 
                    buttons[btn_id].setAttribute('style', 'opacity: 100%;');
                }
                else {
                    buttons[btn_id].disabled = true; 
                    buttons[btn_id].setAttribute('style', 'opacity: 60%;');
                }
            });
        }
    });
    
    return {
        ZXEditorModel: ZXEditorModel,
        ZXEditorView: ZXEditorView
    };
});