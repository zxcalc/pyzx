__all__ = ['backends', 'Graph','typeB','typeZ','typeX']


from .graph_s import GraphS

backends = {'simple': True}
try:
	import graph_tool.all as gt
	from .graph_gt import GraphGT
	backends['graph_tool'] = gt
except ImportError:
	pass
try:
	import igraph as ig
	from .graph_ig import GraphIG
	backends['igraph'] = ig 
except ImportError:
	pass
try:
	import networkx as nx
	from .graph_nx import GraphNX
	backends['networkx'] = nx
except ImportError:
	pass

if backends:
	print("Available backends: " + ", ".join(backends.keys()))
else:
	raise ImportError("No graph backend found. Please install one of graph_tool, igraph or networkx")

typeB = 0
typeZ = 1
typeX = 2

def Graph(backend: str='simple'):
	if backend:
		if backend not in backends:
			raise KeyError("Unavailable backend '{}'".format(backend))
		if backend == 'simple': return GraphS()
		if backend == 'graph_tool': return GraphGT()
		if backend == 'igraph': return GraphIG()
		if backend == 'networkx': return GraphNX()
	if 'graph_tool' in backends: return GraphGT()
	if 'igraph' in backends: return GraphIG()
	if 'networkx' in backends: return GraphNX()
	raise KeyError("Unavailable backend '{}'".format(backend))
