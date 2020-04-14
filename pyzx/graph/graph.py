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

backends = {'simple': True}

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
