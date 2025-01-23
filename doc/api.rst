Full API documentation
======================

Below is listed the documentation for all the supported functions, classes and methods in PyZX.
Some functionality of PyZX is still experimental or not well-tested (like the ZH-diagram interface and rewrite rules), so it is not listed here.

Graph API
---------
ZX-graphs are internally represented by instances of classes that implement the methods of :class:`~pyzx.graph.base.BaseGraph`. These methods are listed below. The only complete implementation currently is :class:`~pyzx.graph.graph_s.GraphS`.

.. module:: graph

.. autoclass:: pyzx.graph.graph_s.GraphS

To create a graph of a specific backend a convenience method ``Graph`` is supplied:

.. autofunction:: pyzx.graph.graph.Graph(backend=None)

Below you can find full documentation of all the functions supplied by a Graph in PyZX.

.. autoclass:: pyzx.graph.base.BaseGraph
   :members:


Circuit API
-----------

.. module:: circuit

.. _circuit:

.. autoclass:: pyzx.circuit.Circuit
   :members:


.. _generate:

Generating Circuits
-------------------


The following are some methods to generate (random) quantum circuits.

.. automodule:: pyzx.generate
   :members:
   :undoc-members:


.. _extract:

Circuit extraction and matrices over Z2
---------------------------------------

.. module:: extract

There is basically a single function that is needed for the most general extraction of a circuit from a ZX-diagram:

.. autofunction:: pyzx.extract.extract_circuit

This function uses some reasoning over matrices over the field Z2. This functionality is implemented in the following class.

.. autoclass:: pyzx.linalg.Mat2
	:members:


.. _simplify:

List of simplifications
-----------------------

Below is listed the content of ``simplify.py``.

.. module:: simplify

.. automodule:: pyzx.simplify
   :members:
   :undoc-members:

   .. autofunction:: simp


.. _rules:

List of rewrite rules
---------------------

Below is listed the content of ``rules.py``.

.. module:: rules

.. automodule:: pyzx.rules
   :members:
   :undoc-members:



.. _optimize:

List of optimization functions
------------------------------

Below is listed the content of ``optimize.py``.

.. module:: optimize

.. automodule:: pyzx.optimize
   :members:
   :undoc-members:


.. _routing:

List of routing functions
------------------------------

Below is listed the content of ``routing.py``.

.. module:: routing

.. automodule:: pyzx.routing
   :members:
   :undoc-members:
   :member-order: bysource

.. _tensor:

Functions for dealing with tensors
----------------------------------

Below is listed the content of ``tensor.py``.

.. module:: tensor

.. automodule:: pyzx.tensor
   :members:
   :undoc-members:


.. _drawing:

Drawing
-------

Below is listed the content of ``drawing.py``.

.. module:: drawing

.. automodule:: pyzx.drawing
   :members:
   :undoc-members:


Tikz functionality
----------------------------------

.. _tikz:

Below is listed the content of ``tikz.py``.

.. module:: tikz

.. automodule:: pyzx.tikz
   :members:
   :undoc-members:

.. _quanto:

