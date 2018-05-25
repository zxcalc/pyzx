def match_bialg(g):
    for e in g.edges():
        v0, v1 = g.edge_st(e)
        v0t = g.get_type(v0)
        v1t = g.get_type(v1)
        if ((v0t == 1 and v1t == 2) or (v0t == 2 and v1t == 1)):
            v0n = [n for n in g.get_neighbours(v0) if not n == v1]
            v1n = [n for n in g.get_neighbours(v1) if not n == v0]
            if (
                all([g.get_type(n) == v1t for n in v0n]) and
                all([g.get_type(n) == v0t for n in v1n])):
                return [[v0,v1,v0n,v1n]]
    return []


def match_bialg_parallel(g, num=-1):
    candidates = g.edge_set()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v0, v1 = g.edge_st(candidates.pop())
        v0t = g.get_type(v0)
        v1t = g.get_type(v1)
        if ((v0t == 1 and v1t == 2) or (v0t == 2 and v1t == 1)):
            v0n = [n for n in g.get_neighbours(v0) if not n == v1]
            v1n = [n for n in g.get_neighbours(v1) if not n == v0]
            if (
                all([g.get_type(n) == v1t for n in v0n]) and
                all([g.get_type(n) == v0t for n in v1n])):
                i += 1
                for v in v0n:
                    for c in g.get_incident_edges(v): candidates.discard(c)
                for v in v1n:
                    for c in g.get_incident_edges(v): candidates.discard(c)
                m.append([v0,v1,v0n,v1n])
    return m


def bialg(g, matches):
    del_verts = []
    add_edges = []
    del_edges = []
    for m in matches:
        del_verts.append(m[0])
        del_verts.append(m[1])
        es = [(i,j) for i in m[2] for j in m[3]]
        for e in es:
            if g.is_connected(e[0], e[1]): del_edges.append(e)
            else: add_edges.append(e)
    
    g.remove_edges(del_edges)
    g.add_edges(add_edges)
    g.remove_vertices(del_verts)
    g.remove_solo_vertices()

