__all__ = ['cut_extract']

from .linalg import Mat2


def after(g, vs):
    max_r = max(g.vdata(v, 'r') for v in vs)
    return [w for w in g.vertices() if g.vdata(w, 'r') > max_r and any(g.connected(v, w) for v in vs)]
def bi_adj(g, vs, ws):
    return Mat2([[1 if g.connected(v,w) else 0 for v in vs] for w in ws])

def cut_edges(g, left, right):
    m = bi_adj(g, left, right)
    max_r = max(g.vdata(v, 'r') for v in left)
    for v in g.vertices():
        r = g.vdata(v,'r')
        if (r > max_r):
            g.set_vdata(v, 'r', r+2)
    x,y = m.factor()

    for v1 in left:
        for v2 in right:
            if (g.connected(v1,v2)):
                g.remove_edge(g.edge(v1,v2))
    
    vi = g.num_vertices()
    cut_rank = y.rows()
    g.add_vertices(2*cut_rank)
    
    for i in range(cut_rank):
        v = vi+i
        g.set_type(v,1)
        g.set_vdata(v, 'q', i)
        g.set_vdata(v, 'r', max_r+1)
    for i in range(cut_rank):
        v = vi+cut_rank+i
        g.set_type(v,1)
        g.set_vdata(v, 'q', i)
        g.set_vdata(v, 'r', max_r+2)
        g.add_edge((vi+i,v))
        g.set_edge_type(g.edge(vi+i,v), 2)
    for i in range(y.rows()):
        for j in range(y.cols()):
            if (y.data[i][j]):
                g.add_edge((left[j], vi + i))
                g.set_edge_type(g.edge(left[j], vi + i), 2)
    for i in range(x.rows()):
        for j in range(x.cols()):
            if (x.data[i][j]):
                g.add_edge((vi + cut_rank + j, right[i]))
                g.set_edge_type(g.edge(vi + cut_rank + j, right[i]), 2)
    

def split(g, below, above):
    left = [v for v in g.vertices() if g.vdata(v, 'r') < below]
    right = [v for v in g.vertices() if g.vdata(v, 'r') > above]
    return (left,right)

def cut_at_row(g, row):
    left = [v for v in g.vertices() if g.vdata(v, 'r') <= row]
    right = [v for v in g.vertices() if g.vdata(v, 'r') > row]
    cut_edges(g, left, right)

# def cut_at_vertex(g, v):
#     r = g.vdata(v, 'r')
#     for w in g.vertices():
#         r1 = g.vdata(w, 'r')
#         if r1 == r and v != w:
#             g.set_vdata(w, 'r', r+1)
#         elif r1 > r:
#             g.set_vdata(w, 'r', r1+1)
#     cut_at_row(g, r)


def cut_rank(g, left, right):
    return bi_adj(g, left, right).rank()

def cut1_extract(g, qubits):
    max_r = max(g.vdata(v,'r') for v in g.vertices()) - 1
    for v in g.vertices():
        if any(g.vdata(w,'o') for w in g.neighbours(v)):
            g.set_vdata(v, 'r', max_r)

    ts = sorted([v for v in g.vertices() if g.phase(v).denominator > 2 and g.vdata(v,'r') < max_r],
          key=lambda v: g.vdata(v,'r'))
    for t in ts:
        row = g.vdata(t, 'r')
        left,right = split(g, below=row, above=row)
        rank = cut_rank(g, left, right)
        if (rank >= qubits):
            print("FAILED at", t, "with rank", rank, ">=", qubits, "qubits")
            return False
        cut_edges(g, left, right)
        g.set_vdata(t,'q',qubits-1)
    return True


def cut_extract(g, qubits):
    """A circuit extraction heuristic which exploits the bounded cut-rank of ZX-diagrams
    which come from reducing circuits."""
    cut = False
    #last_row = [v for v in g.vertices() if g.type(v) == 1 and any(g.vdata(w, 'i') for w in g.neighbours(v))]
    last_row = []
    for v in g.vertices():
        if len(last_row) < qubits:
            if not g.vdata(v,'i'):
                last_row.append(v)
        else:
            break


    # if (len(last_row) != qubits):
    #     print("expected a full row of green nodes at the input")
    #     return False

    while True:
        row1 = after(g, last_row)
        list.sort(row1)
        if len(row1) == 0:
            print('terminated normally')
            return True
        
        row0 = []
        rank = bi_adj(g, last_row, row1).rank()
        m = None
        while len(row1) != 0:
            for i,v in enumerate(row1):
                new_row1 = row1[0:i] + row1[i+1:len(row1)]
                new_rank = bi_adj(g, last_row, new_row1).rank()
                if new_rank < rank:
                    row0.append(v)
                    row1 = new_row1
                    break
            if new_rank == rank:
                break
            else:
                rank = new_rank
        if len(row0) == 0:
            if not cut:
                print('could not solve row ', last_row, ' trying cut at ', row1[0])
                cut = True
                
                #cut_at_vertex(g, row1[0])
                cut_at_row(g, g.vdata(row1[0],'r'))
                continue
            else:
                print('no solution after cutting, giving up')
                return False
            
        cut = False
        max_r = max(g.vdata(v, 'r') for v in last_row)
        extra = qubits - len(row0)
        
        if (len(row1) != 0):
            cut_edges(g, last_row, row1)
            taken = set(g.vdata(v,'q') for v in row0)
            free = [q for q in range(0,qubits) if q not in taken]
            for v in range(g.num_vertices()-extra,g.num_vertices()):
                q = free.pop()
                g.set_vdata(v-extra,'q',q)
                g.set_vdata(v-extra,'r',max_r+1.75)
                g.set_vdata(v,'q',q)
                g.set_vdata(v,'r',max_r+2.25)
                
        for i,v in enumerate(row0):
            if g.type(v) != 0:
                g.set_vdata(v,'r',max_r+2)
            
        last_row = list(range(g.num_vertices()-extra,g.num_vertices())) + row0