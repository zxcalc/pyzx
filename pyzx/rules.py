from fractions import Fraction


def match_bialg(g):
    types = g.types()
    for e in g.edges():
        v0, v1 = g.edge_st(e)
        v0t = types[v0]
        v1t = types[v1]
        if ((v0t == 1 and v1t == 2) or (v0t == 2 and v1t == 1)):
            v0n = [n for n in g.neighbours(v0) if not n == v1]
            v1n = [n for n in g.neighbours(v1) if not n == v0]
            if (
                all([types[n] == v1t for n in v0n]) and
                all([types[n] == v0t for n in v1n])):
                return [[v0,v1,v0n,v1n]]
    return []


def match_bialg_parallel(g, num=-1, edgelist=-1):
    #TODO: make it be hadamard edge aware
    if edgelist!=-1: candidates = set(edgelist)
    else: candidates = g.edge_set()
    types = g.types()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v0, v1 = g.edge_st(candidates.pop())
        v0t = types[v0]
        v1t = types[v1]
        if ((v0t == 1 and v1t == 2) or (v0t == 2 and v1t == 1)):
            v0n = [n for n in g.neighbours(v0) if not n == v1]
            v1n = [n for n in g.neighbours(v1) if not n == v0]
            if (
                all([types[n] == v1t for n in v0n]) and
                all([types[n] == v0t for n in v1n])):
                i += 1
                for v in v0n:
                    for c in g.incident_edges(v): candidates.discard(c)
                for v in v1n:
                    for c in g.incident_edges(v): candidates.discard(c)
                m.append([v0,v1,v0n,v1n])
    return m


def bialg(g, matches):
    rem_verts = []
    etab = dict()
    for m in matches:
        rem_verts.append(m[0])
        rem_verts.append(m[1])
        es = [(i,j) if i < j else (j,i) for i in m[2] for j in m[3]]
        for e in es:
            if e in etab: etab[e][0] += 1
            else: etab[e] = [1,0]
    
    return (etab, rem_verts, True)

def match_spider(g):
    for e in g.edges():
        if g.edge_type(e) != 1: continue
        v0, v1 = g.edge_st(e)
        if (g.type(v0) == g.type(v1)):
            return [[v0,v1]]
    return []

def match_spider_parallel(g, num=-1, edgelist=-1):
    if edgelist!=-1: candidates = set(edgelist)
    else: candidates = g.edge_set()
    types = g.types()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if g.edge_type(e) != 1: continue
        v0, v1 = g.edge_st(e)
        v0t = types[v0]
        v1t = types[v1]
        if (v0t == v1t):
                i += 1
                for v in g.neighbours(v0):
                    for c in g.incident_edges(v): candidates.discard(c)
                for v in g.neighbours(v1):
                    for c in g.incident_edges(v): candidates.discard(c)
                m.append([v0,v1])
    return m

def spider(g, matches):
    rem_verts = []
    etab = dict()
    types = g.types()

    for m in matches:
        v0 = m[0]
        g.set_phase(v0, g.phase(v0) + g.phase(m[1]))

        # always delete the second vertex in the match
        rem_verts.append(m[1])

        # edges from the second vertex are transferred to the first
        for v1 in g.neighbours(m[1]):
            if v0 == v1: continue
            e = (v0,v1)
            if e not in etab: etab[e] = [0,0]
            etab[e][g.edge_type((m[1],v1))-1] += 1
    
    return (etab, rem_verts, True)


def match_pivot(g):
    # TODO: optimise for single-match case
    return match_pivot_parallel(g, num=1, check_edge_types=True)


def match_pivot_parallel(g, num=-1, check_edge_types=False, edgelist=-1):
    if edgelist!=-1: candidates = set(edgelist)
    else: candidates = g.edge_set()
    types = g.types()
    phases = g.phases()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if not check_edge_types and g.edge_type(e) != 2: continue
        v0, v1 = g.edge_st(e)

        v0t = types[v0]
        v1t = types[v1]
        if not (v0t == 1 and v1t == 1): continue

        v0a = phases[v0]
        v1a = phases[v1]
        if not ((v0a == 0 or v0a == 1) and (v1a == 0 or v1a == 1)): continue

        invalid_edge = False

        v0n = set()
        v0b = set()
        for n in g.neighbours(v0):
            #if g.phase(n).denominator > 2:
            #    invalid_edge = True
            #    break
            et = g.edge_type(g.edge(v0,n))
            if n == v1 and et == 2: pass
            elif types[n] == 1 and et == 2: v0n.add(n)
            elif types[n] == 0: v0b.add(n)
            else:
                invalid_edge = True
                break

        if invalid_edge: continue

        v1n = set()
        v1b = set()
        for n in g.neighbours(v1):
            #if g.phase(n).denominator > 2:
            #    invalid_edge = True
            #    break
            et = g.edge_type(g.edge(v1,n))
            if n == v0 and et == 2: pass
            elif types[n] == 1 and et == 2: v1n.add(n)
            elif types[n] == 0: v1b.add(n)
            else:
                invalid_edge = True
                break

        if invalid_edge: continue
        if not (len(v0b) + len(v1b) <= 1): continue

        i += 1
        for v in v0n:
            for c in g.incident_edges(v): candidates.discard(c)
        for v in v1n:
            for c in g.incident_edges(v): candidates.discard(c)
        n0 = list(v0n - v1n)
        n01 = list(v0n & v1n)
        n1 = list(v1n - v0n)
        b0 = list(v0b)
        b1 = list(v1b)
        m.append([v0,v1,b0,b1,n0,n1,n01])
    return m


def pivot(g, matches):
    '''Perform a pivoting rewrite, given a list of matches. A match is itself a list where:

    m[0] : first vertex in pivot
    m[1] : second vertex in pivot
    m[2] : list of zero or one boundaries adjacent to m[0]
    m[3] : list of zero or one boundaries adjacent to m[1]
    m[4] : list of (non-boundary) vertices adjacent to m[0] only
    m[5] : list of (non-boundary) vertices adjacent to m[1] only
    m[6] : list of (non-boundary) vertices adjacent to m[0] and m[1]
    '''
    rem_verts = []
    etab = dict()
    for m in matches:
        es = ([(s,t) if s < t else (t,s) for s in m[4] for t in m[5]] +
              [(s,t) if s < t else (t,s) for s in m[5] for t in m[6]] +
              [(s,t) if s < t else (t,s) for s in m[4] for t in m[6]])
        
        for v in m[6]: g.add_phase(v, 1)

        for i in range(2):
            if len(m[i+2]) == 0:
                # if there is no boundary, the vertex is destroyed, depositing
                # its phase on its new neighbours.
                a = g.phase(m[i])
                rem_verts.append(m[i])

                g.add_phase(m[1-i], a)
                for v in m[(1-i)+4]: g.add_phase(v, a)
                for v in m[6]: g.add_phase(v, a)
            else:
                # toggle whether the boundary is an h-edge or a normal edge
                e = g.edge(m[i], m[i+2][0])
                g.set_edge_type(e, 2 if g.edge_type(e) == 1 else 1)

                # the vertices m[i] and m[1-i] need to trade places. The easiest
                # way to do that is add the symmetric difference of their neighbourhoods
                # as h-edges, which happens to be in m[4] + m[5].
                for v in m[4] + m[5]:
                    e = (m[i],v) if m[i] < v else (v, m[i])
                    nhe = etab.get(e, (0,0))[1]
                    etab[e] = (0,nhe+1)

        for e in es:
            nhe = etab.get(e, (0,0))[1]
            etab[e] = (0,nhe+1)

    return (etab, rem_verts, True)


def match_lcomp(g):
    return match_lcomp_parallel(g, num=1, check_edge_types=True)

def match_lcomp_parallel(g, num=-1, check_edge_types=False, vertexlist=-1):
    if vertexlist!=-1: candidates = set(vertexlist)
    else: candidates = g.vertex_set()
    types = g.types()
    phases = g.phases()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        vt = types[v]
        va = g.phase(v)
        
        if not (va == Fraction(1,2) or va == Fraction(3,2)): continue

        if check_edge_types and not (
            all(g.edge_type(e) == 2 for e in g.incident_edges(v))
            ): continue
                
        vn = list(g.neighbours(v))

        if not all(types[n] == vt for n in vn): continue # and phases[n].denominator <= 2

        for n in vn: candidates.discard(n)
        m.append([v,vn])
    return m

def lcomp(g, matches):
    etab = dict()
    rem = []
    for m in matches:
        a = g.phase(m[0])
        rem.append(m[0])
        for i in range(len(m[1])):
            g.add_phase(m[1][i], -a)
            for j in range(i+1, len(m[1])):
                e = (m[1][i],m[1][j])
                if (e[0] > e[1]): e = (e[1],e[0])
                he = etab.get(e, (0,0))[1]
                etab[e] = (0, he+1)

    return (etab, rem, False)


def match_ids(g):
    return match_ids_parallel(g, num=1)

def match_ids_parallel(g, num=-1, vertexlist=-1):
    if vertexlist!=-1: candidates = set(vertexlist)
    else: candidates = g.vertex_set()
    types = g.types()
    phases = g.phases()

    i = 0
    m = []

    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        if phases[v] != 0: continue
        neigh = g.neighbours(v)
        if len(neigh) != 2: continue
        v0, v1 = neigh
        candidates.discard(v0)
        candidates.discard(v1)
        if g.edge_type((v,v0)) != g.edge_type((v,v1)): #exactly one of them is a hadamard edge
            m.append((v,v0,v1,2))
        else: m.append((v,v0,v1,1))
    return m

def remove_ids(g, matches):
    etab = dict()
    rem = []
    for m in matches:
        rem.append(m[0])
        e = (m[1],m[2])
        if not e in etab: etab[e] = [0,0]
        etab[e][m[3]-1] += 1
    return (etab, rem, False)
    