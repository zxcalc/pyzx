import matplotlib.pyplot as plt
from matplotlib import patches, lines
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

def pack_indices(lst):
    d = dict()
    if len(lst) == 0: return d
    list.sort(lst)
    i = 0
    x = None
    for j in range(len(lst)):
        y = lst[j]
        if y != x:
            x = y
            d[y] = i
            i += 1
    return d

def pack_circuit_ranks(g):
    ranks = [g.get_vdata(v, 'r') for v in g.vertices()]
    new_rank = pack_indices(ranks)
    for v in g.vertices():
        g.set_vdata(v, 'r', new_rank[g.get_vdata(v, 'r')])


def pack_circuit_nf(g, nf):
    x_index = 0
    ty = g.get_types()
    for v in g.vertices():
        if g.get_vdata(v, 'i'):
            g.set_vdata(v, 'r', 0)
        elif g.get_vdata(v, 'o'):
            g.set_vdata(v, 'r', 4)
        elif ty[v] == 2:
            g.set_vdata(v, 'r', 2)
            g.set_vdata(v, 'q', x_index)
            x_index += 1
        elif ty[v] == 1:
            for w in g.get_neighbours(v):
                if g.get_vdata(w, 'i'):
                    g.set_vdata(v, 'r', 1)
                    g.set_vdata(v, 'q', g.get_vdata(w, 'q'))
                    break
                elif g.get_vdata(w, 'o'):
                    g.set_vdata(v, 'r', 3)
                    g.set_vdata(v, 'q', g.get_vdata(w, 'q'))
                    break

def circuit_layout(g):
    return {v:(g.get_vdata(v,'r'),-g.get_vdata(v,'q')) for v in g.vertices()}

def draw(g, layout, labels=False):
    minX = 0
    minY = 0
    maxX = 1
    maxY = 1
    #for _,p in layout.items():
    #    if p[0] < minX: minX = p[0]
    #    if p[0] > maxX: maxX = p[0]
    #    if p[1] < minY: minY = p[1]
    #    if p[1] > maxY: maxY = p[1]
    fig1 = plt.figure(1, (10, 5))
    ax = fig1.add_axes([0, 0, 1, 0.5], frameon=False, aspect=1)
    ax.xaxis.set_visible(False)
    ax.yaxis.set_visible(False)
    
    for e in g.edges():
        sp = layout[g.edge_s(e)]
        tp = layout[g.edge_t(e)]
        #ax.add_line(lines.Line2D([sp[0],tp[0]],[sp[1],tp[1]], color='black', zorder=0))
        plt.plot([sp[0],tp[0]],[sp[1],tp[1]], 'k', zorder=0, linewidth=0.8)
    
    for v in g.vertices():
        p = layout[v]
        t = g.get_type(v)
        a = g.get_angle(v)
        
        col = 'black'
        if t == 1: col = 'green'
        elif t == 2: col = 'red'
            
        ax.add_patch(patches.Circle(p, 0.2, facecolor=col, edgecolor='black', zorder=1))
        
        #plt.plot(p[0], p[1], 'o', color=col, markersize=4)
        if labels:
            plt.text(p[0], p[1]+0.3, str(v), ha='center', color='gray', fontsize=5)
        
        if a:
            plt.text(p[0], p[1]-0.7, angle_to_s(a), ha='center', color='blue', fontsize=8)
            
    plt.show()

# def draw(g, layout=None):
#     #g1 = g.copy(backend='igraph')
#     #if g.backend != 'igraph':
#     #    raise NotImplementedError("Drawing not implemented on backend " + g.backend)
#     for v in g.graph.vs:
#         v['color'] = vcol(v['_t'])
#         #a = v['angle']
#         #v['label'] = angle_to_s(v['_a'])
#     if not layout:
#         layout = dag_layout(g)
    
#     return ig.plot(g.graph, layout=layout,
#                    vertex_size=5,
#                    vertex_label_size=8,
#                    vertex_label_dist=2,
#                    vertex_label_color='blue',
#                    vertex_label=g.graph.vs['_a'],
#                    keep_aspect_ratio=True,
#                    bbox=[600,200])