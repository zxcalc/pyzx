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

from fractions import Fraction

from .linalg import Mat2, greedy_reduction
from .graph import Graph
from .simplify import id_simp
from .circuit import Circuit, ParityPhase, CNOT, HAD, ZPhase, CZ


def bi_adj(g, vs, ws):
    return Mat2([[1 if g.connected(v,w) else 0 for v in vs] for w in ws])

def cut_rank(g, left, right):
    return bi_adj(g, left, right).rank()

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
        v1 = g.add_vertex(1,i,max_r+1)
        v2 = g.add_vertex(1,i,max_r+2)
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
    return left_verts


def unspider_by_row(g, v):
    r = g.row(v)
    w = g.add_vertex(1,g.qubit(v),r-1)
    ns = list(g.neighbours(v))
    for n in ns:
        if g.row(n) < r:
            e = g.edge(n,v)
            g.add_edge((n,w), edgetype=g.edge_type(e))
            g.remove_edge(e)
    g.add_edge((w, v))


def greedy_cut_extract(g, quiet=True):
    """Given a graph that has been put into semi-normal form by
    :func:`simplify.clifford_simp` it cuts the graph at :math:`\pi/4` nodes
    so that it is easier to get a circuit back out again.
    It tries to get as many :math:`\pi/4` gates on the same row as possible
    as to reduce the T-depth of the circuit."""
    qubits = g.qubit_count()
    g.normalise()
    max_r = g.depth() - 1
    i_vs = sorted([v for v in g.vertices() if 1 < g.row(v) < max_r],key=g.row)
    for i in range(len(i_vs)-1):
        v = i_vs[i]
        if g.row(v) == g.row(i_vs[i+1]):
            g.set_row(v,g.row(v)-0.2)
    g.pack_circuit_rows()
    leftrow = 1
    cuts = 0
    totalverts = len(i_vs)
    if not quiet: print("Cutting graph, {!s} internal nodes to cut.".format(totalverts))
    printboundary = 10
    while len(i_vs) > 0:
        row = [i_vs.pop(0)]
        while True:
            rightrow = g.row(row[-1])
            left = [v for v in g.vertices() if g.row(v) == leftrow]
            right = set()
            for v in left: right.update(w for w in g.neighbours(v) if g.row(w)>rightrow)
            right = list(right)
            rank = cut_rank(g, left, right)

            if rank + len(row) == qubits:
                if len(i_vs) > 0:
                    row.append(i_vs.pop(0))
                else: break
            elif rank + len(row) > qubits:
                if len(row) == 1:
                    print("FAILED at row", row, "with rank", rank, ">=", qubits, "qubits")
                    return False
                i_vs.insert(0, row.pop())
                rightrow = g.row(row[-1])
                left = [v for v in g.vertices() if g.row(v) == leftrow]
                right = []
                for v in left: right.extend(w for w in g.neighbours(v) if g.row(w)>rightrow)
                #left,right = split(g, below=g.row(row[0]), above=g.row(row[-1]))
                #if len(left) + len(right) + len(row) != len(g.vertices()):
                #    print("row partition does not cover entire graph!")
                rank = cut_rank(g, left, right)
                break
            else:
                print("got len(row) + rank < qubits. For circuits, this should not happen!")
                return False
        
        #r = max(g.row(v) for v in left)+2
        r = leftrow + 2
        available = set(range(qubits))
        for v in row:
            q = g.qubit(v)
            if q in available:
                available.remove(q)
            else:
                q = available.pop()
                g.set_qubit(v, q)

        cut_edges(g, left, right, available)
        for v in row:
            g.set_row(v,r)
            unspider_by_row(g, v)

        leftrow = r
        cuts += 1
        if not quiet: 
            print(".", end='')
            if ((totalverts - len(i_vs))/totalverts)*100 > printboundary:
                print("{!s} %".format(printboundary), end=' ')
                printboundary += 10
        
        # for i,v in enumerate(row):
        #     g.set_qubit(v,rank+i)
        #     g.set_row(v,r)
        #     unspider_by_row(g, v)
        #if iterate: yield g
    if not quiet: print("\nDone, made {!s} cuts".format(cuts))
    g.pack_circuit_rows()
    return True


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
        self.add_node(r1, 1)
        self.add_node(r2, 2)
        self.g.add_edge((self.qs[r1],self.qs[r2]))
        self.r += 1


def clifford_extract(g, left_row, right_row, cnot_blocksize=2):
    """When ``left_row`` and ``right_row`` are adjacent rows of green nodes
    that are interconnected with Hadamard edges, that section of the graph
    is equal to some permutation matrix. This permutation matrix can be 
    decomposed as a series of CNOT gates. That is what this function does. """
    qubits = g.qubit_count()
    qleft = [v for v in g.vertices() if g.row(v)==left_row]
    qright= [v for v in g.vertices() if g.row(v)==right_row]
    qleft.sort(key=g.qubit)
    qright.sort(key=g.qubit)
    for q in range(qubits):
        no_left = False
        if len(qleft) <= q or g.qubit(qleft[q]) != q: #missing vertex
            vert = max((v for v in g.vertices() if g.qubit(v)==q and g.row(v)<left_row), key=g.row)
            neigh = [n for n in g.neighbours(vert) if g.qubit(n)==q and g.row(n)>=right_row]
            if neigh:
                conn = min(neigh,key=g.row)
            else:
                neigh = [n for n in g.neighbours(vert) if g.row(n)>=right_row]
                if len(neigh) > 1: raise TypeError("Too many neighbours")
                conn = neigh[0]
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
            neigh = [n for n in g.neighbours(vert) if g.qubit(n)==q and g.row(n)<=left_row]
            if neigh:
                conn2 = max(neigh,key=g.row)
                if v1 != conn2: raise TypeError("vertices mismatching")
            else:
                neigh = [n for n in g.neighbours(vert) if g.row(n)==left_row]
                if len(neigh) > 1: raise TypeError("Too many neighbours")
                conn2 = neigh[0]
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
    m.gauss(full_reduce=True,x=c,blocksize=cnot_blocksize)
    c.finish()

    g.replace_subgraph(left_row, right_row, c.g.adjoint())


def circuit_extract(g, cnot_blocksize=6,quiet=True):
    """Given a graph put into semi-normal form by :func:`simplify.clifford_simp`, 
    it turns the graph back into a circuit."""
    if greedy_cut_extract(g, quiet):
        layers = list(reversed(range(1,g.depth()-1,2)))
        if not quiet: print("Extracting CNOT circuits, {!s} iterations.".format(len(layers)))
        for i,layer in enumerate(layers):
            if not quiet: print(".", end='')
            clifford_extract(g,layer,layer+1, cnot_blocksize=cnot_blocksize)
        if not quiet: print("\nCircuit extraction complete")
        id_simp(g, quiet)
        g.pack_circuit_rows()
        return True
    else:
        return False




def connectivity_from_biadj(g, m, left, right, edgetype=2):
    for i in range(len(right)):
        for j in range(len(left)):
            if m.data[i][j] and not g.connected(right[i],left[j]):
                g.add_edge((right[i],left[j]),edgetype)
            elif not m.data[i][j] and g.connected(right[i],left[j]):
                g.remove_edge((right[i],left[j]))

def streaming_extract(g, quiet=True, stopcount=-1):
    """Given a graph put into semi-normal form by :func:`simplify.clifford_simp`, 
    it extracts its equivalent set of gates into an instance of :class:`circuit.Circuit`.
    This method uses a different algorithm than :func:`circuit_extract`, and seems
    to be faster and produce smaller circuits."""
    g.normalise()
    qs = g.qubits() # We are assuming that these are objects that update
    rs = g.rows()   # to reflect changes to the graph, so that when
    ty = g.types()  # g.set_row/g.set_qubit is called, these things update directly to reflect that
    phases = g.phases()
    c = Circuit(g.qubit_count())
    leftrow = 1

    # First we check whether there are MS-gate like constructions, since we have to deal with them separately
    special_nodes = {}
    for v in g.vertices():
        if len(list(g.neighbours(v))) == 1 and v not in g.inputs and v not in g.outputs:
            n = list(g.neighbours(v))[0]
            special_nodes[n] = v
        if rs[v] > 1:
            g.set_row(v, rs[v]+10)
    
    while True:
        left = [v for v in g.vertices() if rs[v] == leftrow]
        boundary_verts = []
        right = set()
        good_verts = []
        good_neighs = []
        for v in left:
            # First we add the gates to the circuit that can be processed now,
            # and we simplify the graph to represent this.
            q = qs[v]
            phase = phases[v]
            t = ty[v]
            neigh = [w for w in g.neighbours(v) if rs[w]<leftrow]
            if len(neigh) != 1:
                raise TypeError("Graph doesn't seem circuit like: multiple parents")
            n = neigh[0]
            if qs[n] != q:
                raise TypeError("Graph doesn't seem circuit like: cross qubit connections")
            if g.edge_type(g.edge(n,v)) == 2:
                c.add_gate("HAD", q)
                g.set_edge_type(g.edge(n,v),1)
            if t == 0: continue # it is an output
            if phase != 0:
                if t == 1: c.add_gate("ZPhase", q, phase=phase)
                else: c.add_gate("XPhase", q, phase=phase)
                g.set_phase(v, 0)
            neigh = [w for w in g.neighbours(v) if rs[w]==leftrow and w<v]
            for n in neigh:
                t2 = ty[n]
                q2 = qs[n]
                if t == t2:
                    if g.edge_type(g.edge(v,n)) != 2:
                        raise TypeError("Invalid vertical connection between vertices of the same type")
                    if t == 1: c.add_gate("CZ", q2, q)
                    else: c.add_gate("CX", q2, q)
                else:
                    if g.edge_type(g.edge(v,n)) != 1:
                        raise TypeError("Invalid vertical connection between vertices of different type")
                    if t == 1: c.add_gate("CNOT", q, q2)
                    else: c.add_gate("CNOT", q2, q)
                g.remove_edge(g.edge(v,n))
            
            # Done processing gates, now we look to see if we can shift the frontier
            d = [w for w in g.neighbours(v) if rs[w]>leftrow]
            right.update(d)
            if len(d) == 0: raise TypeError("Not circuit like")
            if len(d) == 1: # Only connected to one node in its future
                if ty[d[0]] != 0: # which is not an output
                    good_verts.append(v) # So we can make progress
                    good_neighs.append(d[0])
                else:  # This node is done processing, since it is directly (and only) connected to an output
                    boundary_verts.append(v)
                    right.remove(d[0])
        if not good_verts:  # There are no 'easy' nodes we can use to progress
            if all(ty[v] == 0 for v in right): break # Actually we are done, since only outputs are left
            for v in boundary_verts: left.remove(v) # We don't care about the nodes only connected to outputs
            
            for n in right.intersection(special_nodes): # Neighbours that are phase gadgets
                targets = set(g.neighbours(n))
                targets.remove(special_nodes[n])
                if targets.issubset(left): # Only connectivity on the lefthandside, so we can extract it
                    #print("Found special node!")
                    nphase = phases[n]
                    if nphase not in (0,1):
                        raise Exception("Can't parse ParityPhase with non-Pauli Phase")
                    phase = phases[special_nodes[n]]
                    c.add_gate("ParityPhase", phase*(-1 if nphase else 1), *[qs[t] for t in targets])
                    g.remove_vertices([special_nodes[n],n])
                    right.remove(n)
            if stopcount != -1 and len(c.gates) > stopcount: return c
            right = list(right)
            m = bi_adj(g,right,left)
            #print(m)
            sequence = greedy_reduction(m) # Find the optimal set of CNOTs we can apply to get a frontier we can work with
            if not isinstance(sequence, list): # Couldn't find any reduction, hopefully because phase gadget is in the way
                gates, leftrow = handle_phase_gadget(g, leftrow, quiet=quiet)
                c.gates.extend(gates)
                continue
            for control, target in sequence:
                c.add_gate("CNOT", qs[left[target]], qs[left[control]])
                # If a control is connected to an output, we need to add a new node.
                for v in g.neighbours(left[control]):
                    if v in g.outputs:
                        #print("Adding node before output")
                        q = qs[v]
                        r = rs[v]
                        w = g.add_vertex(1,q,r-1)
                        e = g.edge(left[control],v)
                        et = g.edge_type(e)
                        g.remove_edge(e)
                        g.add_edge((left[control],w),2)
                        g.add_edge((w,v),3-et)
                        k = right.index(v)
                        right[k] = w
                        break
                for k in range(len(m.data[control])): # We update the graph to represent the extraction of a CNOT
                    if not m.data[control][k]: continue
                    if m.data[target][k]: g.remove_edge((left[target],right[k]))
                    else: g.add_edge((left[target],right[k]), 2)
                m.row_add(control, target)
            # d = [w for w in g.neighbours(left[target]) if rs[w]>leftrow] # The target should now only have a single future node
            # if len(d) != 1:
            #     raise TypeError("Gaussian reduction did something wrong")
            for v in left:
                d = [w for w in g.neighbours(v) if rs[w]>leftrow]
                if len(d) == 1 and ty[d[0]] != 0:
                    good_verts.append(v)
                    good_neighs.append(d[0])
            if not good_verts: continue
            # if ty[d[0]] != 0:
            #     good_verts.append(left[target])
            #     good_neighs.append(d[0])
            # else: continue
        
        for v in g.vertices():
            if rs[v] < leftrow: continue
            if v in good_verts: continue
            g.set_row(v,rs[v]+1) # Push the frontier one layer up
        for i,v in enumerate(good_neighs): 
            g.set_row(v,leftrow+1) # Bring the new nodes of the frontier to the correct position
            g.set_qubit(v,qs[good_verts[i]])
        leftrow += 1
        if stopcount != -1 and len(c.gates) > stopcount: return c
            
    swap_map = {}
    leftover_swaps = False
    for v in left: # Finally, check for the last layer of Hadamards, and see if swap gates need to be applied.
        q = qs[v]
        neigh = [w for w in g.neighbours(v) if rs[w]>leftrow]
        if len(neigh) != 1: 
            raise TypeError("Algorithm failed: Not fully reducable")
            return c
        n = neigh[0]
        if ty[n] != 0: 
            raise TypeError("Algorithm failed: Not fully reducable")
            return c
        if g.edge_type(g.edge(n,v)) == 2:
            c.add_gate("HAD", q)
            g.set_edge_type(g.edge(n,v),1)
        if qs[n] != q: leftover_swaps = True
        swap_map[q] = qs[n]
    if leftover_swaps: 
        for t1, t2 in permutation_as_swaps(swap_map):
            c.add_gate("SWAP", t1, t2)
    return c



def handle_phase_gadget(g, leftrow, quiet=True):
    #raise Exception("Stop here")
    q = g.qubit_count()
    qs = g.qubits() # We are assuming this thing automatically updates
    rs = g.rows()
    special_nodes = {}
    left = []
    for v in g.vertices():
        if len(list(g.neighbours(v))) == 1 and v not in g.inputs and v not in g.outputs:
            n = list(g.neighbours(v))[0]
            special_nodes[n] = v
        if rs[v] == leftrow: left.append(v)
    
    neigh = set()
    for v in left: neigh.update(w for w in g.neighbours(v) if rs[w]>leftrow)
    gadgets = neigh.intersection(special_nodes) # These are the phase gadgets that are attached to the left row
    if len(gadgets) == 0: raise ValueError("No phase gadget connected to this row")
    for gadget in gadgets:
        right = list(neigh.difference({gadget}))
        if cut_rank(g, right, left + [gadget]) == q: # A good choice should allow us to cut the edges
            break
    else:
        raise ValueError("No good cut for phase gadget found")
    g.set_row(gadget,leftrow+1)
    g.set_row(special_nodes[gadget],leftrow+1)

    # Take care nothing is connected directly to an output
    for i in range(len(right)):
        w = right[i]
        if w in g.outputs:
            w2 = g.add_vertex(1, qs[w], rs[w]-1)
            n = list(g.neighbours(w))[0] # Outputs should have unique neighbours
            e = g.edge(n,w)
            et = g.edge_type(e)
            g.remove_edge(e)
            g.add_edge((n,w2),2)
            g.add_edge((w2,w),3-et)
            right[i] = w2

    if len(right) == q:
        if not quiet: print("No cutting necessary")
        for w in right:
            g.set_row(w, leftrow+2)
    else:
        right = cut_edges(g, left+[gadget], right)
    # We have now prepared the stage to do the extraction of the phase gadget
    
    phase = g.phase(special_nodes[gadget])
    phase = -1*phase if g.phase(gadget) != 0 else phase
    left.sort(key=g.qubit)
    right.sort(key=g.qubit)
    
    m = bi_adj(g, right, left)
    if m.rank() != q:
        raise Exception("Rank doesn't match, say whaat")
    operations = Circuit(q)
    operations.row_add = lambda r1,r2: operations.gates.append((r1,r2))
    m.gauss(full_reduce=True,x=operations)
    gates = [CNOT(r2,r1) for r1,r2 in operations.gates]
    m = bi_adj(g, right+[gadget], left)
    for r1,r2 in operations.gates:
        m.row_add(r1,r2)
    connectivity_from_biadj(g, m, right+[gadget], left)
    #return gates, leftrow
    gadget_left = [v for v in left if g.connected(gadget, v)]
    gadget_right = [w for w in right if g.connected(gadget, w)]
    targets = [qs[v] for v in gadget_left]
    # We bring as many connections on the right to the left
    for i in reversed(range(len(gadget_right))): # The following checks if every phase connected node is on the right
        w = gadget_right[i]
        v = next(v for v in left if g.connected(w,v))
        g.set_edge_type((v,w),1)
        g.set_qubit(w, qs[v])
        if qs[w] not in targets:
            gates.append(HAD(qs[w]))
            gadget_right.pop(i)
            targets.append(qs[w])
            gadget_left.append(v)
        else:
            g.set_row(w, leftrow+1)
    for w in right:
        if w in gadget_right: continue
        v = next(v for v in left if g.connected(w,v))
        g.set_qubit(w, qs[v])

    if not gadget_right: #Only connected on leftside so we are done
        if not quiet: print("Simple phase gadget")
        gate = ParityPhase(phase, *targets)
        g.remove_vertices([special_nodes[gadget],gadget])
        gates.append(gate)
        return gates, leftrow

    
    if not quiet: print("Complicated phase gadget") # targets on left and right, so need to do more
    if len(gadget_right) % 2 != 0 or len(gadget_left) == 1:
        raise Exception("Gadget seems non-unitary")
    
    #Now we can finally extract the phase gadget
    rtargets = []
    for w in gadget_right: 
        t = qs[w]
        rtargets.append(t)
        gates.extend([HAD(t),ZPhase(t,Fraction(-1,2)),HAD(t)])
    if len(gadget_right)%4 != 0: # This is either 2 or 0
        phase = (-phase)%2
    gates.append(ParityPhase(phase, *targets))
    for t in rtargets:
        gates.extend([HAD(t),ZPhase(t, Fraction(1,2))])
    for v in left:
        if qs[v] not in rtargets:
            g.set_row(v, leftrow+1)

    g.remove_vertices([special_nodes[gadget],gadget])
    if not quiet: print("end")
    return gates, leftrow+1


def permutation_as_swaps(perm):
    swaps = []
    l = [perm[i] for i in range(len(perm))]
    pinv = {v:k for k,v in perm.items()}
    linv = [pinv[i] for i in range(len(pinv))]
    for i in range(len(perm)):
        if l[i] == i: continue
        t1 = l[i]
        t2 = linv[i]
        swaps.append((i,t2))
        #l[i] = i
        #linv[i] = i
        l[t2] = t1
        linv[t1] = t2
    return swaps






# def single_cut_extract(g, qubits):
#     max_r = max(g.row(v) for v in g.vertices()) - 1
#     for v in g.vertices():
#         if any(w in g.outputs for w in g.neighbours(v)):
#             g.set_row(v, max_r)

#     ts = sorted([v for v in g.vertices() if g.phase(v).denominator > 2 and g.row(v) < max_r],
#           key=lambda v: g.row(v))
#     for t in ts:
#         row = g.row(v)
#         left,right = split(g, below=row, above=row)
#         rank = cut_rank(g, left, right)
#         if (rank >= qubits):
#             print("FAILED at", t, "with rank", rank, ">=", qubits, "qubits")
#             return False
#         cut_edges(g, left, right)
#         g.set_qubit(t,qubits-1)
#         if rank > 0:
#             g.set_row(t,g.row(g.vindex()-1))
#     return True

# def before(g, vs):
#     min_r = min(g.row(v) for v in vs)
#     return [w for w in g.vertices() if g.row(w) < min_r and any(g.connected(v, w) for v in vs)]
# def after(g, vs):
#     max_r = max(g.row(v) for v in vs)
#     return [w for w in g.vertices() if g.row(w) > max_r and any(g.connected(v, w) for v in vs)]

# def split(g, below, above):
#     left = [v for v in g.vertices() if g.row(v) < below]
#     right = [v for v in g.vertices() if g.row(v) > above]
#     return (left,right)

# def cut_at_vertex(g, v):
#     r = g.vdata(v, 'r')
#     for w in g.vertices():
#         r1 = g.vdata(w, 'r')
#         if r1 == r and v != w:
#             g.set_vdata(w, 'r', r+1)
#         elif r1 > r:
#             g.set_vdata(w, 'r', r1+1)
#     cut_at_row(g, r)


# def cut_at_row(g, row):
#     left = [v for v in g.vertices() if g.row(v) <= row]
#     right = [v for v in g.vertices() if g.row(v) > row]
#     cut_edges(g, left, right)

