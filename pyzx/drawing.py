__all__ = ['draw', 'pack_circuit_ranks', 'pack_circuit_nf']

try:
    import matplotlib.pyplot as plt
    from matplotlib import patches, lines, path
except:
    plt = None
from fractions import Fraction
import math

def phase_to_s(a):
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


#TODO: Update this to work again
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
    ranks = [g.vdata(v, 'r') for v in g.vertices()]
    new_rank = pack_indices(ranks)
    for v in g.vertices():
        g.set_vdata(v, 'r', new_rank[g.vdata(v, 'r')])


def pack_circuit_nf(g, nf='grg'):
    x_index = 0
    ty = g.types()

    if nf == 'grg':
        for v in g.vertices():
            if g.vdata(v, 'i'):
                g.set_vdata(v, 'r', 0)
            elif g.vdata(v, 'o'):
                g.set_vdata(v, 'r', 4)
            elif ty[v] == 2:
                g.set_vdata(v, 'r', 2)
                g.set_vdata(v, 'q', x_index)
                x_index += 1
            elif ty[v] == 1:
                for w in g.neighbours(v):
                    if g.vdata(w, 'i'):
                        g.set_vdata(v, 'r', 1)
                        g.set_vdata(v, 'q', g.vdata(w, 'q'))
                        break
                    elif g.vdata(w, 'o'):
                        g.set_vdata(v, 'r', 3)
                        g.set_vdata(v, 'q', g.vdata(w, 'q'))
                        break
    elif nf == 'gslc':
        for v in g.vertices():
            if g.vdata(v, 'i'):
                g.set_vdata(v, 'r', 0)
            elif g.vdata(v, 'o'):
                g.set_vdata(v, 'r', 4)
            elif ty[v] == 1:
                for w in g.neighbours(v):
                    if g.vdata(w, 'i'):
                        g.set_vdata(v, 'r', 1)
                        #g.set_vdata(v, 'q', g.get_vdata(w, 'q'))
                        break
                    elif g.vdata(w, 'o'):
                        g.set_vdata(v, 'r', 3)
                        #g.set_vdata(v, 'q', g.get_vdata(w, 'q'))
                        break
    else:
        raise ValueError("Unknown normal form: " + str(nf))

def circuit_layout(g,keys = ('r','q')):
    return {v:(g.vdata(v,keys[0]),-g.vdata(v,keys[1])) for v in g.vertices()}

def draw(g, layout=None, labels=False, figsize=(8,2), h_edge_draw='blue'):
    fig1 = plt.figure(figsize=figsize)
    ax = fig1.add_axes([0, 0, 1, 1], frameon=False)
    ax.xaxis.set_visible(False)
    ax.yaxis.set_visible(False)

    if not layout:
        layout = circuit_layout(g)
    
    for e in g.edges():
        sp = layout[g.edge_s(e)]
        tp = layout[g.edge_t(e)]
        et = g.edge_type(e)

        
        dx = tp[0] - sp[0]
        dy = tp[1] - sp[1]
        bend_wire = (dx == 0) and h_edge_draw == 'blue'
        ecol = '#0099ff' if h_edge_draw == 'blue' and et == 2 else 'black'

        if bend_wire:
            bend = 0.25
            mid = (sp[0] + 0.5 * dx + bend * dy, sp[1] + 0.5 * dy - bend * dx)

            pth = path.Path([sp,mid,tp], [path.Path.MOVETO, path.Path.CURVE3, path.Path.LINETO])
            patch = patches.PathPatch(pth, edgecolor=ecol, linewidth=0.8, fill=False)
            ax.add_patch(patch)
        else:
            pos = 0.5 if dx == 0 or dy == 0 else 0.4
            mid = (sp[0] + pos*dx, sp[1] + pos*dy)
            ax.add_line(lines.Line2D([sp[0],tp[0]],[sp[1],tp[1]], color=ecol, linewidth=0.8, zorder=0))

        if h_edge_draw == 'box' and et == 2: #hadamard edge
            w = 0.2
            h = 0.15
            diag = math.sqrt(w*w+h*h)
            angle = math.atan2(dy,dx)
            angle2 = math.atan2(h,w)
            centre = (mid[0] - diag/2*math.cos(angle+angle2),
                      mid[1] - diag/2*math.sin(angle+angle2))
            ax.add_patch(patches.Rectangle(centre,w,h,angle=angle/math.pi*180,facecolor='yellow',edgecolor='black'))

        #plt.plot([sp[0],tp[0]],[sp[1],tp[1]], 'k', zorder=0, linewidth=0.8)
    
    for v in g.vertices():
        p = layout[v]
        t = g.type(v)
        a = g.phase(v)
        
        sz = 0.2
        col = 'black'
        if t == 1: col = 'green'
        elif t == 2: col = 'red'
        else: sz = 0.1
            
        ax.add_patch(patches.Circle(p, sz, facecolor=col, edgecolor='black', zorder=1))
        if labels: plt.text(p[0]+0.25, p[1]+0.25, str(v), ha='center', color='gray', fontsize=5)
        if a: plt.text(p[0], p[1]-0.5, phase_to_s(a), ha='center', color='blue', fontsize=8)
    
    ax.axis('equal')
    plt.close()
    return fig1
    #plt.show()