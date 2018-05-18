import igraph as ig

def bialg(g, v0, v1):
    v0t = g.vs[v0]['t']
    v1t = g.vs[v1]['t']
    match = (
        g.are_connected(v0,v1) and
        ((v0t == 1 and v1t == 2) or
         (v0t == 2 and v1t == 1))
    )
    if not match: return False
    
    n0 = [n for n in g.vs[v0].neighbors() if n.index != v1]
    n1 = [n for n in g.vs[v1].neighbors() if n.index != v0]
    
    # add dummy nodes around v0, v1 as necessary.
    for i in range(len(n0)):
        if (n0[i]['t'] != v1t):
            g.add_vertex()
            newv = g.vs[len(g.vs)-1]
            newv['t'] = v1t
            g.delete_edges([(v0,n0[i].index)])
            g.add_edges([(n0[i].index, newv.index), (newv.index, v0)])
            n0[i] = newv
    
    for i in range(len(n1)):
        if (n1[i]['t'] != v0t):
            g.add_vertex()
            newv = g.vs[len(g.vs)-1]
            newv['t'] = v0t
            g.delete_edges([(v1,n1[i].index)])
            g.add_edges([(v1,newv.index),(newv.index,n1[i].index)])
            n1[i] = newv
    
    for s in n0:
        for t in n1:
            if g.are_connected(s,t): g.delete_edges([(s,t)])
            else: g.add_edge(s,t)
    
    # delete vertices at the end so we don't mess up indices
    g.delete_vertices([v0,v1] + [v for v in n0 + n1 if v.degree() < 2])
    return True