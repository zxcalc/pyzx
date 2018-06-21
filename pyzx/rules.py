from fractions import Fraction


def match_bialg(g):
    types = g.get_types()
    for e in g.edges():
        v0, v1 = g.edge_st(e)
        v0t = types[v0]
        v1t = types[v1]
        if ((v0t == 1 and v1t == 2) or (v0t == 2 and v1t == 1)):
            v0n = [n for n in g.get_neighbours(v0) if not n == v1]
            v1n = [n for n in g.get_neighbours(v1) if not n == v0]
            if (
                all([types[n] == v1t for n in v0n]) and
                all([types[n] == v0t for n in v1n])):
                return [[v0,v1,v0n,v1n]]
    return []


def match_bialg_parallel(g, num=-1, edgelist=-1):
    #TODO: make it be hadamard edge aware
    if edgelist!=-1: candidates = set(edgelist)
    else: candidates = g.edge_set()
    types = g.get_types()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v0, v1 = g.edge_st(candidates.pop())
        v0t = types[v0]
        v1t = types[v1]
        if ((v0t == 1 and v1t == 2) or (v0t == 2 and v1t == 1)):
            v0n = [n for n in g.get_neighbours(v0) if not n == v1]
            v1n = [n for n in g.get_neighbours(v1) if not n == v0]
            if (
                all([types[n] == v1t for n in v0n]) and
                all([types[n] == v0t for n in v1n])):
                i += 1
                for v in v0n:
                    for c in g.get_incident_edges(v): candidates.discard(c)
                for v in v1n:
                    for c in g.get_incident_edges(v): candidates.discard(c)
                m.append([v0,v1,v0n,v1n])
    return m


def bialg(g, matches):
    rem_verts = []
    etab = dict()
    #add_edges = set()
    #rem_edges = set()
    for m in matches:
        rem_verts.append(m[0])
        rem_verts.append(m[1])
        es = [(i,j) if i < j else (j,i) for i in m[2] for j in m[3]]
        for e in es:
            # Edges can appear multiple times. Every time an edge is encountered,
            # toggle whether it will be added/deleted.
            if e in etab: etab[e][0] += 1
            else: etab[e] = [1,0]
            # if g.is_connected(e[0], e[1]):
            #     if e in rem_edges: rem_edges.remove(e)
            #     else: rem_edges.add(e)
            # else:
            #     if e in add_edges: add_edges.remove(e)
            #     else: add_edges.add(e)
    
    return (etab, rem_verts, True)
    #g.add_edge_table(etab)
    #g.remove_vertices(rem_verts)
    #g.remove_solo_vertices()

def match_spider(g):
    for e in g.edges():
        if g.get_edge_type(e) != 1: continue
        v0, v1 = g.edge_st(e)
        if (g.get_type(v0) == g.get_type(v1)):
            return [[v0,v1]]
    return []

def match_spider_parallel(g, num=-1, edgelist=-1):
    if edgelist!=-1: candidates = set(edgelist)
    else: candidates = g.edge_set()
    types = g.get_types()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if g.get_edge_type(e) != 1: continue
        v0, v1 = g.edge_st(e)
        v0t = types[v0]
        v1t = types[v1]
        if (v0t == v1t):
                i += 1
                for v in g.get_neighbours(v0):
                    for c in g.get_incident_edges(v): candidates.discard(c)
                for v in g.get_neighbours(v1):
                    for c in g.get_incident_edges(v): candidates.discard(c)
                m.append([v0,v1])
    return m

def spider(g, matches):
    rem_verts = []
    etab = dict()
    types = g.get_types()

    for m in matches:
        v0 = m[0]
        g.set_angle(v0, g.get_angle(v0) + g.get_angle(m[1]))

        # always delete the second vertex in the match
        rem_verts.append(m[1])

        # edges from the second vertex are transferred to the first. If there is already
        # an edge there, avoid parallel edges using the following rules:
        #  - if the colors are different, remove the existing edge (hopf)
        #  - if the colors are the same, do nothing (specialness)
        for v1 in g.get_neighbours(m[1]):
            if v0 == v1: continue
            e = (v0,v1)
            if e not in etab: etab[e] = [0,0]
            etab[e][g.get_edge_type((m[1],v1))-1] += 1
    
    return (etab, rem_verts, True)
    #g.add_edge_table(etab)
    #g.remove_vertices(rem_verts)
    #g.remove_solo_vertices()


def match_pivot(g):
    # TODO: optimise for single-match case
    return match_pivot_parallel(g, num=1, check_edge_types=True)


def match_pivot_parallel(g, num=-1, check_edge_types=False, edgelist=-1):
    if edgelist!=-1: candidates = set(edgelist)
    else: candidates = g.edge_set()
    types = g.get_types()
    angles = g.get_angles()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if not check_edge_types and g.get_edge_type(e) != 2: continue
        v0, v1 = g.edge_st(e)

        v0t = types[v0]
        v1t = types[v1]
        if not (v0t == 1 and v1t == 1): continue

        v0a = angles[v0]
        v1a = angles[v1]
        if not ((v0a == 0 or v0a == 1) and (v1a == 0 or v1a == 1)): continue

        if check_edge_types and not (
            all(g.get_edge_type(e) == 2 for e in g.get_incident_edges(v0)) and
            all(g.get_edge_type(e) == 2 for e in g.get_incident_edges(v1))
            ): continue
                
        v0n = frozenset(n for n in g.get_neighbours(v0) if not n == v1)
        v1n = frozenset(n for n in g.get_neighbours(v1) if not n == v0)

        if not (
            all([types[n] == v1t for n in v0n]) and
            all([types[n] == v0t for n in v1n])): continue

        i += 1
        for v in v0n:
            for c in g.get_incident_edges(v): candidates.discard(c)
        for v in v1n:
            for c in g.get_incident_edges(v): candidates.discard(c)
        n0 = list(v0n - v1n)
        n01 = list(v0n & v1n)
        n1 = list(v1n - v0n)
        m.append([v0,v1,n0,n1,n01])
    return m


def pivot(g, matches):
    rem_verts = []
    etab = dict()
    for m in matches:
        es = ([(s,t) if s > t else (t,s) for s in m[2] for t in m[3]] +
              [(s,t) if s > t else (t,s) for s in m[2] for t in m[4]] +
              [(s,t) if s > t else (t,s) for s in m[3] for t in m[4]])
        
        v0a = g.get_angle(m[0])
        v1a = g.get_angle(m[1])
        for v in m[2]: g.add_angle(v, v1a)
        for v in m[3]: g.add_angle(v, v0a)
        for v in m[4]: g.add_angle(v, v0a + v1a + 1)

        rem_verts.append(m[0])
        rem_verts.append(m[1])
        for e in es:
            nhe = etab.get(e, (0,0))[1]
            etab[e] = (0,nhe+1)

    return (etab, rem_verts, True)
    #g.add_edge_table(etab)
    #g.remove_vertices(rem_verts)
    #g.remove_solo_vertices()


def match_lcomp(g):
    return match_lcomp_parallel(g, num=1, check_edge_types=True)

def match_lcomp_parallel(g, num=-1, check_edge_types=False, vertexlist=-1):
    if vertexlist!=-1: candidates = set(vertexlist)
    else: candidates = g.vertex_set()
    types = g.get_types()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        vt = types[v]
        va = g.get_angle(v)
        
        if not (va == Fraction(1,2) or va == Fraction(3,2)): continue

        if check_edge_types and not (
            all(g.get_edge_type(e) == 2 for e in g.get_incident_edges(v))
            ): continue
                
        vn = list(g.get_neighbours(v))

        if not all(types[n] == vt for n in vn): continue

        for n in vn: candidates.discard(n)
        m.append([v,vn])
    return m

def lcomp(g, matches):
    etab = dict()
    rem = []
    for m in matches:
        a = g.get_angle(m[0])
        rem.append(m[0])
        for i in range(len(m[1])):
            g.add_angle(m[1][i], -a)
            for j in range(i+1, len(m[1])):
                e = (m[1][i],m[1][j])
                if (e[0] > e[1]): e = (e[1],e[0])
                he = etab.get(e, (0,0))[1]
                etab[e] = (0, he+1)

    return (etab, rem, False)
    #g.add_edge_table(etab)
    #g.remove_vertices(rem)


def match_ids(g):
    return match_ids_parallel(g, num=1)

def match_ids_parallel(g, num=-1, vertexlist=-1):
    if vertexlist!=-1: candidates = set(vertexlist)
    else: candidates = g.vertex_set()
    types = g.get_types()
    phases = g.get_angles()

    i = 0
    m = []

    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        if phases[v] != 0: continue
        neigh = g.get_neighbours(v)
        if len(neigh) != 2: continue
        v0, v1 = neigh
        candidates.discard(v0)
        candidates.discard(v1)
        if g.get_edge_type((v,v0)) != g.get_edge_type((v,v1)): #exactly one of them is a hadamard edge
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
    #g.add_edge_table(etab)
    #g.remove_vertices(rem)