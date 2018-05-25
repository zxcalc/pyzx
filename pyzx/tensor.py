import numpy as np
np.set_printoptions(suppress=True)
from math import pi
from .graph import *
import examples

qpi = 0.25*pi

def contract_all(tensors,conns):
    '''
    Contract the tensors inside the list tensors
    according to the connectivities in conns

    Due to limitations in numpy, only up to 26 contractions can be done.

    Example input:
    tensors = [np.random.rand(2,3),np.random.rand(3,4,5),np.random.rand(3,4)]
    conns = [((0,1),(2,0)), ((1,1),(2,1))]
    returned shape in this case is (2,3,5)
    Taken from https://stackoverflow.com/questions/42034480/efficient-tensor-contraction-in-python
    '''

    ndims = [t.ndim for t in tensors]
    totdims = sum(ndims)
    dims0 = np.arange(totdims)
    # keep track of sublistout throughout
    sublistout = set(dims0.tolist())
    # cut up the index array according to tensors
    # (throw away empty list at the end)
    inds = np.split(dims0,np.cumsum(ndims))[:-1]
    # we also need to convert to a list, otherwise einsum chokes
    inds = [ind.tolist() for ind in inds]

    # if there were no contractions, we'd call
    # np.einsum(*zip(tensors,inds),sublistout)

    # instead we need to loop over the connectivity graph
    # and manipulate the indices
    for (m,i),(n,j) in conns:
        # tensors[m][i] contracted with tensors[n][j]

        # remove the old indices from sublistout which is a set
        sublistout -= {inds[m][i],inds[n][j]}

        # contract the indices
        inds[n][j] = inds[m][i]

    #There are now 'holes' in the used indices.
    #Since numpy only supports indices up to 26, we will
    #lower the indices down as much as possible before continuing.
    used_indices = set()
    for l in inds:
        used_indices.update(l)
    remap = {k:v for (v,k) in enumerate(list(used_indices))}
    for i in range(len(inds)):
      inds[i] = [remap[j] for j in inds[i]]
    s2 = set()
    for i in sublistout:
        s2.add(remap[i])
    sublistout = s2
    
    print(inds)
    print(sublistout)

    # zip and flatten the tensors and indices
    args = [subarg for arg in zip(tensors,inds) for subarg in arg]

    # assuming there are no multiple contractions, we're done here
    return np.einsum(*args,sublistout)


def Z_to_tensor(arity, phase):
    m = np.zeros([2]*arity, dtype = complex)
    m[(0,)*arity] = 1
    m[(1,)*arity] = np.exp(1j*phase)
    return m

def X_to_tensor(arity, phase):
    m = np.ones(2**arity,dtype = complex)
    for i in range(2**arity):
        if bin(i).count("1")%2 == 0: 
            m[i] += np.exp(1j*phase)
        else:
            m[i] -= np.exp(1j*phase)
    return np.power(np.sqrt(0.5),arity)*m.reshape([2]*arity)

S = Z_to_tensor(2,0.5*np.pi)
Xphase = X_to_tensor(2,0.5*np.pi)

had = np.sqrt(2)*np.exp(-1j*0.25*np.pi) * (S @ Xphase @ S)
#print(had)

def phase_to_number(s):
    s = s.replace("\\pi", "pi")
    exec("print({})".format(s))
    sys.stdout = old
    return float(stdout.getvalue().strip())


def zx_graph_to_tensor(g):
    '''Takes in a igraph.Graph.
    All nodes should have a 't' attribute valued in 'Z', 'X' or 'B' (for boundary)
    Outputs a multidimensional numpy array
    representing the linear map the ZX-diagram implements'''
    tensors = []
    ids = {}

    for v in g.vertices():
        if g.get_type(v) == typeZ:
            phase = g.get_attribute(v,'phase')
            ids[v.index] = len(tensors)
            tensors.append(Z_to_tensor(v.degree(),phase))
        elif v['t'] == 'X':
            phase = phase_to_number(v.attributes().get('phase',"0.0"))
            ids[v.index] = len(tensors)
            tensors.append(X_to_tensor(v.degree(),phase))
        elif v['t'] == 'B':
            pass
        else:
            raise Exception("Wrong type for node '{}'".format(v['t']))

    conns = []
    contraction_count = {i:0 for i in ids}
    for e in g.es:
        if not (e.source in ids and e.target in ids): continue
        conns.append(((ids[e.source],contraction_count[e.source]),
                     (ids[e.target],contraction_count[e.target])))
        contraction_count[e.source] += 1
        contraction_count[e.target] += 1

    #print(conns)

    return contract_all(tensors, conns)



if __name__ == '__main__':
    g = Graph('igraph')
    g.add_vertex(t=typeB)
    g.add_vertex(t=typeZ,phase='0.0')
    g.add_vertex(t=typeX,phase='0.0')
    g.add_vertex(t=typeB)
    g.add_edges([(0,1),(1,2),(1,2),(2,3)])

    import examples

    g = examples.t_to_zx(examples.zigzag(7))

    #print(zx_graph_to_tensor(g))
