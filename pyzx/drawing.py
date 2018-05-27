import igraph as ig
from fractions import Fraction

def angle_to_s(a):
    if not a: return ''
    if not isinstance(a, Fraction):
        a = Fraction(a)
    ns = '' if a.numerator == 1 else str(a.numerator)
    ds = '' if a.denominator == 1 else '/' + str(a.denominator)

    # unicode 0x03c0 = pi
    return ns + '\u03c0' + ds

def vcol(t):
    if not t: return 'black'
    if t == 1: return 'green'
    if t == 2: return 'red'
    return 'black'
    
def ecol(t):
    if not t: return 'black'
    if t == 1: return 'magenta'
    return 'black'


def simple_layers(g, sort):
    topo = g.as_directed(mutual=False).topological_sorting() if sort else range(len(g.vs))
    layers = len(g.vs) * [-1]
    for i in topo:
        nlayers = [layers[n.index] for n in g.vs[topo[i]].neighbors()]
        layers[topo[i]] = max(nlayers)+1 if len(nlayers) > 0 else 0
    return layers

def dag_layout(g, sort=True):
    if g.backend != 'igraph':
        raise NotImplementedError("Drawing not implemented on backend " + g.backend)
    topo = g.graph.as_directed(mutual=False).topological_sorting() if sort else range(g.num_vertices())
    layers = g.num_vertices() * [-1]
    for i in topo:
        nlayers = [layers[n.index] for n in g.graph.vs[topo[i]].neighbors()]
        layers[topo[i]] = max(nlayers)+1 if len(nlayers) > 0 else 0
    layout = g.graph.layout_sugiyama(layers=layers)
    layout.transform(lambda t: (t[1],-t[0]))
    layout.fit_into([len(layers)/(max(layers)+1),max(layers)+1])
    return layout

def circuit_layout(g):
    return [(g.get_vdata(v,'d'),g.get_vdata(v,'q')) for v in g.vertices()]

def draw(g, layout=None):
    g1 = g.copy(backend='igraph')
    #if g.backend != 'igraph':
    #    raise NotImplementedError("Drawing not implemented on backend " + g.backend)
    for v in g1.graph.vs:
        v['color'] = vcol(v['type'])
        #a = v['angle']
        #v['label'] = angle_to_s(a) if a else '' #v.index
    if not layout:
        layout = dag_layout(g1)
    
    return ig.plot(g1.graph, layout=layout,
                   vertex_size=5,
                   vertex_label_size=8,
                   vertex_label_dist=2,
                   vertex_label_color='blue',
                   vertex_label=[angle_to_s(g1.get_angle(v)) for v in g1.vertices()],
                   keep_aspect_ratio=True,
                   bbox=[600,200])