import igraph as ig

def vcol(t):
    if not t: return 'black'
    if t == 1: return 'green'
    if t == 2: return 'red'
    return 'black'
    
def ecol(t):
    if not t: return 'black'
    if t == 1: return 'magenta'
    return 'black'


def simple_layers(g):
    topo = g.as_directed(mutual=False).topological_sorting()
    layers = len(g.vs) * [-1]
    for i in topo:
        nlayers = [layers[n.index] for n in g.vs[topo[i]].neighbors()]
        layers[topo[i]] = max(nlayers)+1 if len(nlayers) > 0 else 0
    return layers

def draw(g):
    if g.backend != 'igraph':
        raise NotImplementedError("Drawing not implemented on backend " + g.backend)
    for v in g.graph.vs:
        v['color'] = vcol(v['t'])
        v['label'] = v.index
    layers = simple_layers(g.graph)
    layout = g.graph.layout_sugiyama(layers=layers)
    layout.transform(lambda t: (t[1],-t[0]))
    layout.fit_into([len(layers)/(max(layers)+1),max(layers)+1])
    return ig.plot(g.graph, layout=layout,
                   vertex_size=5,
                   vertex_label_size=8,
                   vertex_label_dist=2,
                   vertex_label_color='gray',
                   keep_aspect_ratio=True,
                   bbox=[600,200])