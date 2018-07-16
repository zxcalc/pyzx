# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

__all__ = ['circuit_extract', 'clifford_extract', 'greedy_cut_extract']

from .linalg import Mat2
from .drawing import pack_circuit_rows
from .graph import Graph
from .simplify import id_simp

def before(g, vs):
    min_r = min(g.row(v) for v in vs)
    return [w for w in g.vertices() if g.row(w) < min_r and any(g.connected(v, w) for v in vs)]

def after(g, vs):
    max_r = max(g.row(v) for v in vs)
    return [w for w in g.vertices() if g.row(w) > max_r and any(g.connected(v, w) for v in vs)]
def bi_adj(g, vs, ws):
    return Mat2([[1 if g.connected(v,w) else 0 for v in vs] for w in ws])

def cut_edges(g, left, right, available=None):
    m = bi_adj(g, left, right)
    max_r = max(g.row(v) for v in left)
    for v in g.vertices():
        r = g.row(v)
        if (r > max_r):
            g.set_row(v, r+2)
    x,y = m.factor()

    for v1 in left:
        for v2 in right:
            if (g.connected(v1,v2)):
                g.remove_edge(g.edge(v1,v2))
    
    vi = g.vindex()
    cut_rank = y.rows()

    #g.add_vertices(2*cut_rank)
    left_verts = []
    right_verts = []
    
    if available == None:
        qs = range(cut_rank)
    else:
        qs = available

    for i in qs:
        v1 = g.add_vertex(1,i,max_r+3)
        v2 = g.add_vertex(1,i,max_r+4)
        #v = vi+cut_rank+i
        #g.add_edge((vi+i,v))
        g.add_edge((v1,v2),2)
        left_verts.append(v1)
        right_verts.append(v2)
        #g.set_edge_type(g.edge(vi+i,v), 2)

    for i in range(y.rows()):
        for j in range(y.cols()):
            if (y.data[i][j]):
                g.add_edge((left[j],left_verts[i]),2)
                #g.add_edge((left[j], vi + i))
                #g.set_edge_type(g.edge(left[j], vi + i), 2)
    for i in range(x.rows()):
        for j in range(x.cols()):
            if (x.data[i][j]):
                g.add_edge((right_verts[j],right[i]),2)
                #g.add_edge((vi + cut_rank + j, right[i]))
                #g.set_edge_type(g.edge(vi + cut_rank + j, right[i]), 2)
    

def split(g, below, above):
    left = [v for v in g.vertices() if g.row(v) < below]
    right = [v for v in g.vertices() if g.row(v) > above]
    return (left,right)

def cut_at_row(g, row):
    left = [v for v in g.vertices() if g.row(v) <= row]
    right = [v for v in g.vertices() if g.row(v) > row]
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

def unspider(g, v):
    r = g.row(v)
    w = g.add_vertex(1,g.qubit(v),r-1)
    ns = list(g.neighbours(v))
    for n in ns:
        if g.row(n) < r:
            e = g.edge(n,v)
            g.add_edge((n,w), edgetype=g.edge_type(e))
            g.remove_edge(e)
    g.add_edge((w, v))


def cut_rank(g, left, right):
    return bi_adj(g, left, right).rank()

def normalise(g):
    max_r = g.depth() - 1
    for v in g.vertices():
        if g.type(v) == 0 : continue
        for w in g.neighbours(v):
            if w in g.inputs:
                g.set_row(v,1)
                g.set_qubit(v, g.qubit(w))
                break
            elif w in g.outputs:
                g.set_row(v, max_r)
                g.set_qubit(v, g.qubit(w))
                break

    pack_circuit_rows(g)

# Solved most bugs I think, but it will probably still fail when
# it encounters a qubit that has no nodes on it 
# (so when input is directly connected to output)
def greedy_cut_extract(g, qubits):
    """Given a graph that has been put into semi-normal form by
    :func:`simplify.clifford_simp` it cuts the graph at $\pi/4$ nodes
    so that it is easier to get a circuit back out again.
    It tries to get as many $\pi/4$ gates on the same row as possible
    as to reduce the T-depth of the circuit."""
    normalise(g)
    max_r = g.depth() - 1

    #ts = sorted([v for v in g.vertices() if g.phase(v).denominator > 2 and 1 < g.row(v) < max_r],key=g.row)
    ts = sorted([v for v in g.vertices() if 1 < g.row(v) < max_r],key=g.row)
    while len(ts) > 0:
        row = [ts.pop(0)]
        while True:
            left,right = split(g, below=g.row(row[0]), above=g.row(row[-1]))
            #left = before(g, row)
            #right = after(g, row)
            rank = cut_rank(g, left, right)

            if rank + len(row) == qubits:
                # only consume t on consecutive rows
                if len(ts) > 0 and g.row(row[-1]) + 1 == g.row(ts[0]):
                    row.append(ts.pop(0))
                else: break
            elif rank + len(row) > qubits:
                if len(row) == 1:
                    print("FAILED at row", row, "with rank", rank, ">=", qubits, "qubits")
                    return False
                ts.insert(0, row.pop())
                left,right = split(g, below=g.row(row[0]), above=g.row(row[-1]))
                rank = cut_rank(g, left, right)
                break
            else:
                print("got len(row) + rank < qubits. For circuits, this should not happen!")
                return False
        
        r = max(g.row(v) for v in left)+2
        available = set(range(qubits))
        for v in row:
            q = g.qubit(v)
            if q in available:
                available.remove(q)
            else:
                q = available.pop()
                g.set_qubit(v, q)
            g.set_row(v,r)
            unspider(g, v)

        cut_edges(g, left, right, available)
        
        # for i,v in enumerate(row):
        #     g.set_qubit(v,rank+i)
        #     g.set_row(v,r)
        #     unspider(g, v)
        #if iterate: yield g
    pack_circuit_rows(g)
    return True

def single_cut_extract(g, qubits):
    max_r = max(g.row(v) for v in g.vertices()) - 1
    for v in g.vertices():
        if any(w in g.outputs for w in g.neighbours(v)):
            g.set_row(v, max_r)

    ts = sorted([v for v in g.vertices() if g.phase(v).denominator > 2 and g.row(v) < max_r],
          key=lambda v: g.row(v))
    for t in ts:
        row = g.row(v)
        left,right = split(g, below=row, above=row)
        rank = cut_rank(g, left, right)
        if (rank >= qubits):
            print("FAILED at", t, "with rank", rank, ">=", qubits, "qubits")
            return False
        cut_edges(g, left, right)
        g.set_qubit(t,qubits-1)
        if rank > 0:
            g.set_row(t,g.row(g.vindex()-1))
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


class CNOTMaker(object):
    def __init__(self, qubits, cnot_swaps=False):
        self.qubits = qubits
        self.cnot_swaps = cnot_swaps
        self.g = Graph()
        self.qs = list(range(qubits))  # tracks qubit indices of vertices
        self.v = 0                     # next vertex to add
        self.r = 0                     # current row
        
        for i in range(qubits):
            self.add_node(i, 0, False)
            self.g.inputs.append(self.v)
            self.v += 1
        self.r += 1
    
    def finish(self):
        for i in range(self.qubits):
            self.add_node(i, 0)
            self.g.outputs.append(self.v-1)
        self.r += 1
    
    def add_node(self, q, t, update_index=True):
        self.g.add_vertex(t,q,self.r)
        if update_index:
            self.g.add_edge((self.qs[q],self.v))
            self.qs[q] = self.v
            self.v += 1
    
    def row_swap(self, r1, r2):
        #print("row_swap", r1,r2)
        if self.cnot_swaps:
            self.row_add(r1, r2)
            self.row_add(r2, r1)
            self.row_add(r1, r2)
        else:
            self.add_node(r1, 1)
            self.add_node(r2, 1)
            self.r += 1
            self.add_node(r1, 1, False)
            self.g.add_edge((self.qs[r2],self.v))
            self.v += 1
            self.add_node(r2, 1, False)
            self.g.add_edge((self.qs[r1],self.v))
            self.qs[r1] = self.v - 1
            self.qs[r2] = self.v
            self.v += 1
            self.r += 1
    
    def row_add(self, r1, r2):
        #print("row_add", r1,r2)
        self.add_node(r1, 2)
        self.add_node(r2, 1)
        self.g.add_edge((self.qs[r1],self.qs[r2]))
        self.r += 1


def clifford_extract(g, left_row, right_row):
    """Given a Clifford diagram in normal form, constructs a Clifford circuit.
    ``left_row`` and ``right_row`` should point to adjacent rows of green nodes
    that are interconnected with Hadamard edges."""
    qubits = g.qubit_count()
    qleft = [v for v in g.vertices() if g.row(v)==left_row]
    qright= [v for v in g.vertices() if g.row(v)==right_row]
    qleft.sort(key=g.qubit)
    qright.sort(key=g.qubit)
    for q in range(qubits):
        no_left = False
        if len(qleft) <= q or g.qubit(qleft[q]) != q: #missing vertex
            vert = max((v for v in g.vertices() if g.qubit(v)==q and g.row(v)<left_row), key=g.row)
            conn = min((n for n in g.neighbours(vert) if g.qubit(n)==q and g.row(n)>=right_row),key=g.row)
            e = g.edge(vert, conn)
            t = g.edge_type(e)
            g.remove_edge(e)
            v1 = g.add_vertex(1,q,left_row)
            g.add_edge((vert,v1),3-t)
            g.add_edge((v1,conn), 2)
            qleft.insert(q,v1)
            no_left = True
        else:
            v1 = qleft[q]
        if len(qright) <= q or g.qubit(qright[q]) != q: #missing vertex
            if no_left: vert = conn
            else: vert = min((v for v in g.vertices() if g.qubit(v)==q and g.row(v)>right_row), key=g.row)
            conn2 = max((n for n in g.neighbours(vert) if g.qubit(n)==q and g.row(n)<=left_row),key=g.row)
            if v1 != conn2: raise TypeError("vertices mismatching")
            e = g.edge(conn2,vert)
            t = g.edge_type(e)
            g.remove_edge(e)
            v2 = g.add_vertex(1,q,right_row)
            g.add_edge((conn2,v2),2)
            g.add_edge((v2,vert),3-t)
            qright.insert(q,v2)

    if len(qleft) != len(qright):
        raise ValueError("Amount of qubits should match on left and right side")
    m = bi_adj(g,qleft,qright)
    if m.rank() != qubits:
        raise ValueError("Adjency matrix rank does not match amount of qubits")
    for v in qright:
        g.set_type(v,2)
        for e in g.incident_edges(v):
            if (g.row(g.edge_s(e)) <= right_row
                and g.row(g.edge_t(e)) <= left_row): continue
            g.set_edge_type(e,3-g.edge_type(e)) # 2 -> 1, 1 -> 2
    c = CNOTMaker(qubits, cnot_swaps=True)
    m.gauss(full_reduce=True,x=c)
    c.finish()
    g.replace_subgraph(left_row, right_row, c.g)


def circuit_extract(g):
    """Given a graph put into semi-normal form by :func:`simplify.clifford_simp`, 
    it turns the graph back into a circuit."""
    qubits = g.qubit_count()
    if greedy_cut_extract(g,qubits):
        for i in reversed(range(1,g.depth()-1,2)):
            clifford_extract(g,i,i+1)
        id_simp(g, quiet=True)
        pack_circuit_rows(g)
        return True
    else:
        return False

