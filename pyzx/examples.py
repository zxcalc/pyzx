import random
from .graph import Graph

def complimentarity():
    g = ig.Graph()
    g.add_vertex(t='B')
    g.add_vertex(t='Z',phase='0.0')
    g.add_vertex(t='X',phase='0.0')
    g.add_vertex(t='B')
    g.add_edges([(0,1),(1,2),(1,2),(2,3)])
    return g

def cnots(qubits, depth, backend=None):
    g = Graph(backend)
    q = list(range(qubits)) # qubit register, initialised with input
    v = qubits              # index of next vertex to add
    #ty = qubits * [0]
    es = []
    for i in range(depth):
        c = random.randint(0, qubits-1)
        t = random.randint(0, qubits-2)
        if t >= c: t += 1
        es += [(q[c], v), (q[t], v+1), (v, v+1)]
        q[c] = v
        q[t] = v+1
        v += 2
    es += [(q[i],v+i) for i in range(qubits)]
    v += qubits

    g.add_vertices(v)
    g.add_edges(es)

    ty = (qubits * [0]) + [i % 2 + 1 for i in range(depth * 2)] + (qubits * [0])

    for i in range(v):
        g.set_type(i, ty[i])
    return g


def zigzag(sz, backend=None):
    g = Graph(backend)
    g.add_vertices(2*sz+4)
    for i in range(1,sz+1):
        g.set_type(2*i, (i%2)+1)
        g.set_type(2*i+1, (i%2)+1)
    g.add_edges([(0,2),(1,3)])
    g.add_edges([(2*i,2*i+2) for i in range(1,sz)])
    g.add_edges([(2*i,2*i+3) for i in range(1,sz)])
    g.add_edges([(2*i+1,2*i+2) for i in range(1,sz)])
    g.add_edges([(2*i+1,2*i+3) for i in range(1,sz)])
    g.add_edges([(2*sz,2*sz+2),(2*sz+1,2*sz+3)])
    return g

def zigzag2(sz, backend=None):
    g = Graph(backend)
    g.add_vertices(2*sz+4)
    for i in range(1,sz+1):
        g.set_type(2*i, ((i//2)%2)+1)
        g.set_type(2*i+1, ((i//2)%2)+1)
    g.add_edges([(0,2),(1,3)])
    g.add_edges([(2*i,2*i+2) for i in range(1,sz)])
    g.add_edges([(2*i+1,2*i+3) for i in range(1,sz)])
    g.add_edges([(4*i+1+2,4*i+2+2) for i in range(0,sz//2)])
    g.add_edges([(4*i+2,4*i+3+2) for i in range(0,sz//2)])
    g.add_edges([(2*sz,2*sz+2),(2*sz+1,2*sz+3)])
    return g

def t_to_zx(g):
	'''takes a graph where the 't' attributes are ints, and turns it into 'Z', 'X', or 'B' '''
	names = ['B', 'Z', 'X']
	for v in g.vs:
		if not v['t']: v['t'] = 'B'
		else: v['t'] = names[v['t']]
	return g