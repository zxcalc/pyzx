backends = {'simple': True}

typeB = 0
typeZ = 1
typeX = 2

def Graph(backend=None):
	"""Returns an instance of an implementation of :class:`~graph.base.BaseGraph`. 
	By default :class:`~graph.graph_s.GraphS` is used. 
	Currently ``backend`` is allowed to be `simple` (for the default),
	or 'graph_tool' and 'igraph'.
	**Note**: graph_tool is currently not fully supported."""
	if not backend: backend = 'simple'
	if backend:
		if backend not in backends:
			raise KeyError("Unavailable backend '{}'".format(backend))
		if backend == 'simple': return GraphS()
		if backend == 'graph_tool': 
			return GraphGT()
		if backend == 'igraph': return GraphIG()
	return GraphS()

from .graph_s import GraphS

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
