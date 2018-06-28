__all__ = ['cnots','zigzag', 'zigzag2','cliffords']

import random
from fractions import Fraction

from .graph.graph import Graph


def cnots(qubits, depth, backend=None, keynames=('q','r')):
    g = Graph(backend)

    # initialise and add input row

    q = list(range(qubits))   # qubit index, initialised with input
    r = 1                     # current rank
    ty = [0] * qubits         # types of vertices
    qs = list(range(qubits))  # tracks qubit indices of vertices
    rs = [0] * qubits         # tracks rank of vertices
    v = qubits                # next vertex to add
    es = [] # edges to add

    # initial row of Z
    for i in range(qubits):
        es.append((q[i], v))
        q[i] = v
        rs.append(r)
        qs.append(i)
        ty.append(1)
        v += 1
    r += 1

    # random CNOTs
    for i in range(depth):
        c = random.randint(0, qubits-1)
        t = random.randint(0, qubits-2)
        if t >= c: t += 1
        es += [(q[c], v), (q[t], v+1), (v, v+1)]
        q[c] = v
        q[t] = v+1
        rs += [r,r]
        qs += [c,t]
        ty += [1,2]
        v += 2
        r += 1

    # final row of Z
    for i in range(qubits):
        es.append((q[i], v))
        q[i] = v
        rs.append(r)
        qs.append(i)
        ty.append(1)
        v += 1
    r += 1

    # outputs
    qs += list(range(qubits))
    rs += [r] * qubits
    ty += [0] * qubits
    es += [(q[i], v+i) for i in range(qubits)]
    v += qubits


    g.add_vertices(v)
    g.add_edges(es)

    # ty = (
    #   (qubits * [0]) + (qubits * [1]) +
    #   [i % 2 + 1 for i in range(depth * 2)] +
    #   (qubits * [1]) + (qubits * [0])
    # )

    for i in range(v):
        g.set_type(i, ty[i])
        g.set_vdata(i, keynames[0], qs[i])
        g.set_vdata(i, keynames[1], rs[i])

    for i in range(qubits):
        g.set_vdata(i, 'i', True)
        g.set_vdata(v-i-1, 'o', True)
    return g

def accept(p):
    return p>random.random()

def random_phase(add_t):
    if add_t:
        return Fraction(random.randint(1,8),4)
    return Fraction(random.randint(1,4),2)

def cliffordT(qubits, depth, p_t = 0.1):
    g = Graph()
    qs = list(range(qubits))  # tracks qubit indices of vertices
    v = 0                     # next vertex to add

    p_s = (1 - p_t) / 3.0
    p_hsh = (1 - p_t) / 3.0
    p_cnot = (1 - p_t) / 3.0
    

    for i in range(qubits):
        g.add_vertex()
        g.set_vdata(v, 'q', i)
        g.set_vdata(v, 'r', 0)
        g.set_type(v, 0)
        v += 1

    for i in range(qubits):
        g.add_vertex()
        g.set_vdata(v, 'q', i)
        g.set_vdata(v, 'r', 1)
        g.set_type(v, 1)
        g.add_edge((qs[i], v))
        qs[i] = v
        v += 1

    for r in range(2, depth+2):
        p = random.random()
        q0 = random.randrange(qubits)

        g.add_vertex()
        g.set_vdata(v, 'q', q0)
        g.set_vdata(v, 'r', r)
        g.set_type(v, 1)
        g.add_edge((qs[q0], v))
        qs[q0] = v
        v += 1

        if p > 1 - p_cnot:
            # apply CNOT gate
            q1 = random.randrange(qubits-1)
            if q1 >= q0: q1 += 1

            g.add_vertex()
            g.set_vdata(v, 'q', q1)
            g.set_vdata(v, 'r', r)
            g.set_type(v, 2)
            g.add_edge((qs[q1], v))
            g.add_edge((v-1,v))
            qs[q1] = v
            v += 1
        elif p > 1 - p_cnot - p_hsh:
            # apply HSH gate
            g.set_type(v-1, 2)
            g.set_phase(v-1, Fraction(1,2))
        elif p > 1 - p_cnot - p_hsh - p_s:
            # apply S gate
            g.set_phase(v-1, Fraction(1,2))
        else:
            # apply T gate
            g.set_phase(v-1, Fraction(1,4))

    for i in range(qubits):
        g.add_vertex()
        g.set_vdata(v, 'q', i)
        g.set_vdata(v, 'r', depth+2)
        g.set_type(v, 1)
        g.add_edge((qs[i], v))
        qs[i] = v
        v += 1

    for i in range(qubits):
        g.add_vertex()
        g.set_vdata(v, 'q', i)
        g.set_vdata(v, 'r', depth+3)
        g.set_type(v, 0)
        g.add_edge((qs[i], v))
        v += 1

    return g



def cliffords(qubits, depth, no_hadamard=False,t_gates=False,backend=None, keynames=('q','r')):
    #randomness parameters
    p_two_qubit = 0.4 #whether to add a edge between two qubits
    p_cnot = 1 #0.4 # whether to CNOT or to CZ
    p_phase = 0.6 #probability of adding a phase to a node
    p_had = 0 #0.2 # probability of adding a hadamard on a qubit

    # initialise and add input row

    q = list(range(qubits))   # qubit index, initialised with input
    r = 1                     # current rank
    ty = [0] * qubits         # types of vertices
    qs = list(range(qubits))  # tracks qubit indices of vertices
    rs = [0] * qubits         # tracks rank of vertices
    v = qubits                # next vertex to add
    es1 = [] # normal edges to add
    es2 = [] # hadamard edges to add
    phases = {}

    # initial row of Z
    for i in range(qubits):
        es1.append((q[i], v))
        q[i] = v
        rs.append(r)
        qs.append(i)
        ty.append(1)
        v += 1
    r += 1

    # random gates
    for i in range(depth):
        c = random.randint(0, qubits-1)
        t = random.randint(0, qubits-2)
        if t >= c: t += 1
        if accept(p_two_qubit):
            if no_hadamard or accept(p_cnot): 
                es1.append((v, v+1))
                ty += [1,2]
            else: 
                es2.append((v,v+1))
                typ = random.randint(1,2)
                ty += [typ,typ]
            if accept(p_phase): phases[v] = random_phase(t_gates)
            if accept(p_phase): phases[v+1] = random_phase(t_gates)
        else:
            phases[v] = random_phase(t_gates)
            phases[v+1] = random_phase(t_gates)
            ty += [1,2]
        
        if not no_hadamard and accept(p_had): es2.append((q[c],v))
        else: es1.append((q[c],v))
        if not no_hadamard and accept(p_had): es2.append((q[t],v+1))
        else: es1.append((q[t],v+1))

        q[c] = v
        q[t] = v+1
        
        rs += [r,r]
        qs += [c,t]
        v += 2
        r += 1

    # final row of Z
    for i in range(qubits):
        es1.append((q[i], v))
        q[i] = v
        rs.append(r)
        qs.append(i)
        ty.append(1)
        v += 1
    r += 1

    # outputs
    qs += list(range(qubits))
    rs += [r] * qubits
    ty += [0] * qubits
    es1 += [(q[i], v+i) for i in range(qubits)]
    v += qubits

    g = Graph(backend)

    g.add_vertices(v)
    g.add_edges(es1,1)
    g.add_edges(es2,2)

    for i in range(v):
        g.set_type(i, ty[i])
        g.set_vdata(i, keynames[0], qs[i])
        g.set_vdata(i, keynames[1], rs[i])
    for w, phase in phases.items():
        g.set_phase(w,phase)

    for i in range(qubits):
        g.set_vdata(i, 'i', True)
        g.set_vdata(v-i-1, 'o', True)
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