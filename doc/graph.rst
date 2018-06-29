ZX-Graphs
=============

.. _graph:

PyZX represents quantum circuits as ZX-graphs. These graphs have 3 different types of vertices: boundaries, Z nodes, and X nodes. Boundary vertices represent an input or an output to the circuit and carry no further information. Z and X nodes are what a circuit consists of. These can carry additional information in the form of a `phase`. This is a real number modulo ``2*pi``.

As a simple example, we could have a ZX-gaph with 3 vertices. The first being a boundary acting as input, the last being a boundary acting as output. If the middle one is a Z-node with phase ``a`` that is connected to both the input and output, then this graph represents a Z[``a``]-phase gate.

Edges in the graph come in two flavours. The first is the default edge type which represents a regular connection. The second is a `Hadamard-edge`. This represents a connection between nodes with a Hadamard gate applied between them.

Accessing and setting vertex and edge type
------------------------------------------

To get the type of a vertex (being either boundary, Z, or X) you call ``g.type(vertex)`` where ``g`` is an instance of some subclass of ``BaseGraph``. This returns an integer:

- Boundaries are type 0.
- Z nodes are type 1.
- X nodes are type 2.

To get the type of all the vertices at once you call ``g.types()``. This returns a dictionary-like object (the specifics depending on the chosen backend), that maps vertices to their types. So for instance one can do the following::
	
	ty = g.types()
	if ty[vertex] == 0:
		#It is a boundary

In the same way we can get the type of a given edge by ``g.edge_type(edge)``. This returns one of the following values:

- If the edge is actually not present in the graph it returns 0.
- If it is a normal edge it returns 1.
- If it is a Hadamard-edge it returns 2.


Backends
--------

ZX-graphs can be represented internally in different ways. PyZX currently supports using either ``python-igraph``, or the built-in implementation :class:`graph.graph_s.GraphS` (the default). Each implementation should implement the methods of :class:`graph.base.BaseGraph`.


Graph API
---------


.. module:: graph


.. autoclass:: graph.base.BaseGraph
   :members: