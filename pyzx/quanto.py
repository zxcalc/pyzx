import igraph as ig

def load_qgraph(fname):
    '''loads a .qgraph file and outputs an igraph.Graph, igraph.Layout'''
    f = open(fname, "r")
    j = json.load(f)
    f.close()
    g = ig.Graph()
    layout = ig.Layout()
    for name,attr in j.get('node_vertices',{}).items():
        if 'data' not in attr:
            g.add_vertex(name=name)
        else:
            g.add_vertex(name=name, t=attr['data']['type'], phase=attr['data']['value'])
        layout.append(attr['annotation']['coord'])
    
    for name,attr in j.get('wire_vertices',{}).items():
        g.add_vertex(name=name,t='B')
        layout.append(attr['annotation']['coord'])
    for edge in j['undir_edges'].values():
        g.add_edge(edge['src'],edge['tgt'])
    return g, layout


def vcol(t):
    if not t or t=='boundary': return 'black'
    if t == 'X': return 'green'
    if t == 'Z': return 'red'
    
