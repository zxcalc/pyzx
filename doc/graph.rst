.. _graph:

ZX-Graphs
=============


PyZX represents quantum circuits as ZX-graphs. These graphs have 4 different types of vertices: boundaries, Z-spiders, X-spiders and H-boxes. Boundary vertices represent an input or an output to the circuit and carry no further information. Z- and X-spider are the usual bread and butter of ZX-diagrams. H-boxes are used in ZH-diagrams as a generalisation of the Hadamard gate. Non-boundary vertices carry additional information in the form of a `phase`. This is a fraction ``q`` representing a phase ``pi*q``.

As a simple example, we could have a ZX-gaph with 3 vertices. The first being a boundary acting as input, the last being a boundary acting as output. If the middle one is a Z-node with phase ``a`` that is connected to both the input and output, then this graph represents a Z[``pi*a``]-phase gate.

Edges in a PyZX graph come in two flavors. The first is the default edge type which represents a regular connection. The second is a `Hadamard-edge`. This represents a connection between nodes with a Hadamard gate applied between them, and in the drawing functions of PyZX is represented by a blue edge.

Accessing and setting vertex and edge type
------------------------------------------

The type of a vertex ``v`` in a graph ``g`` can be retrieved by ``g.type(v)``. This returns an integer representing the type. These integers are stored in :class:`pyzx.utils.VertexType` and is one of the following:

- ``VertexType.BOUNDARY``
- ``VertexType.Z``
- ``VertexType.X``
- ``VertexType.H_BOX``

To get the type of all the vertices at once you call ``g.types()``. This returns a dictionary-like object that maps vertices to their types. So for instance one can do the following::
	
	ty = g.types()
	if ty[vertex] == VertexType.BOUNDARY:
		#It is a boundary

Similarly, the type of an edge is stored as one of the integers ``EdgeType.SIMPLE`` or ``EdgeType.HADAMARD``, where ``EdgeType`` can be found as :class:`pyzx.utils.EdgeType`. The edge type of a given edge can be retrieved by ``g.edge_type(edge)``.

Backends
--------

ZX-graphs can be represented internally in different ways. The only fully functioning backend right now is :class:`pyzx.graph.graph_s.GraphS`, which is written entirely in Python. A partial implementation using the ``python-igraph`` package is also available as :class:`pyzx.graph.graph_ig.GraphIG`. A new backend can be constructed by subclassing :class:`pyzx.graph.base.BaseGraph`.

.. _graph_api:

Graph API
---------
ZX-graphs are internally represented by instances of classes that implement the methods of :class:`pyzx.graph.base.BaseGraph`. These methods are listed below. The only complete implementation currently is :class:`pyzx.graph.graph_s.GraphS`.

.. module:: graph

.. autoclass:: pyzx.graph.graph_s.GraphS

To create a graph of a specific backend a convenience method ``Graph`` is supplied:

.. function:: Graph(backend=None)
   
   If backend is given it should be a string. If it is ``'simple'`` an instance of :class:`pyzx.graph.graph_s.GraphS` is returned (this is the default). If it is ``'igraph'`` an instance of :class:`pyzx.graph.graph_ig.GraphIG` is returned.

Both these implementations implement the following methods of BaseGraph:

.. autoclass:: pyzx.graph.base.BaseGraph
   :members: