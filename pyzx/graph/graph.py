# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from typing import Optional

from .base import BaseGraph
from .graph_s import GraphS

backends = {'simple': True}

def Graph(backend:Optional[str]=None) -> BaseGraph:
	"""Returns an instance of an implementation of :class:`~pyzx.graph.base.BaseGraph`. 
	By default :class:`~pyzx.graph.graph_s.GraphS` is used. 
	Currently ``backend`` is allowed to be `simple` (for the default),
	or 'graph_tool' and 'igraph'.
	This method is the preferred way to instantiate a ZX-diagram in PyZX.

	Example:
		To construct an empty ZX-diagram, just write::

			g = zx.Graph()
		
	"""
	if backend is None: backend = 'simple'
	if backend not in backends:
		raise KeyError("Unavailable backend '{}'".format(backend))
	if backend == 'simple': return GraphS()
	if backend == 'graph_tool': 
		return GraphGT()
	if backend == 'igraph': return GraphIG()
	return GraphS()

Graph.from_json = GraphS.from_json # type: ignore

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
