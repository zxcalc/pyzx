import matplotlib.pyplot as plt
from matplotlib import patches, lines
from fractions import Fraction
import math

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

def draw(g, layout=None, labels=False, figsize=(8,2)):
    fig1 = plt.figure(figsize=figsize)
    ax = fig1.add_axes([0, 0, 1, 1], frameon=False)
    ax.xaxis.set_visible(False)
    ax.yaxis.set_visible(False)

    if not layout:
        layout = circuit_layout(g)
    
    for e in g.edges():
        sp = layout[g.edge_s(e)]
        tp = layout[g.edge_t(e)]
        ax.add_line(lines.Line2D([sp[0],tp[0]],[sp[1],tp[1]], color='black', linewidth=0.8, zorder=0))
        if g.get_edge_type(e) == 2: #hadamard edge
            x,y = (sp[0]-tp[0]), (sp[1]-tp[1])
            w = 0.3
            h = 0.2
            diag = math.sqrt(w*w+h*h)
            angle = math.atan2(y,x)
            angle2 = math.atan2(h,w)
            pos = 0.5 if x == 0 or y == 0 else 0.4
            centre = (tp[0] + pos*x - diag/2*math.cos(angle+angle2),
                      tp[1] + pos*y - diag/2*math.sin(angle+angle2))
            ax.add_patch(patches.Rectangle(centre,w,h,angle=angle/math.pi*180,facecolor='yellow',edgecolor='black'))

        #plt.plot([sp[0],tp[0]],[sp[1],tp[1]], 'k', zorder=0, linewidth=0.8)
    
    for v in g.vertices():
        p = layout[v]
        t = g.get_type(v)
        a = g.get_angle(v)
        
        sz = 0.2
        col = 'black'
        if t == 1: col = 'green'
        elif t == 2: col = 'red'
        else: sz = 0.1
            
        ax.add_patch(patches.Circle(p, sz, facecolor=col, edgecolor='black', zorder=1))
        if labels: plt.text(p[0]+0.3, p[1]+0.3, str(v), ha='center', color='gray', fontsize=5)
        if a: plt.text(p[0]+0.25, p[1]-0.25, angle_to_s(a), ha='left', color='blue', fontsize=12)
    
    ax.axis('equal')
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