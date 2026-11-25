Full API documentation
======================
Below is listed the documentation for all the supported functions, classes and methods in PyZX.
Some functionality of PyZX is still experimental or not well-tested (like the ZH-diagram interface and rewrite rules), so it is not listed here.

Graph API
---------
ZX-graphs are internally represented by instances of classes that implement the methods of :class:`~pyzx_cflow.graph.base.BaseGraph`. These methods are listed below. The only complete implementation currently is :class:`~pyzx_cflow.graph.graph_s.GraphS`.

.. module:: graph

.. autoclass:: pyzx_cflow.graph.graph_s.GraphS

To create a graph of a specific backend a convenience method ``Graph`` is supplied:

.. autofunction:: pyzx_cflow.graph.graph.Graph(backend=None)

Below you can find full documentation of all the functions supplied by a Graph in PyZX.

.. autoclass:: pyzx_cflow.graph.base.BaseGraph
   :members:

Circuit API
-----------

.. module:: circuit

.. _circuit:

.. autoclass:: pyzx_cflow.circuit.Circuit
   :members:

.. _generate:

Generating Circuits
-------------------
The following are some methods to generate (random) quantum circuits.

.. automodule:: pyzx_cflow.generate
   :members:
   :undoc-members:

.. _extract:

Circuit extraction and matrices over Z2
---------------------------------------

.. module:: extract

There is a single function that performs the most general extraction of a circuit from a ZX-diagram:

.. autofunction:: pyzx_cflow.extract.extract_circuit

For graphs which admit a causal flow there is a simpler function for circuit extraction:

.. autofunction:: pyzx_cflow.extract.extract_simple

The function :func:`~pyzx_cflow.extract.extract_circuit` uses some reasoning over matrices over the field Z2. This functionality is implemented in the following class.

.. autoclass:: pyzx_cflow.linalg.Mat2
	:members:

The function :func:`~pyzx_cflow.extract.extract_simple` uses a phase polynomial synthesis algorithm based on https://arxiv.org/abs/2004.06052 to extract phase gadgets fufilling causal flow conditons. This is implemented in the following function.

.. autofunction:: pyzx_cflow.extract.phase_poly_synth

.. _simplify:

List of simplifications
-----------------------
Below is listed the content of ``simplify.py``.

.. module:: simplify

.. automodule:: pyzx_cflow.simplify

   The following functions iteratively apply a single rewrite rule frum rules_ using the helper function :func:`~pyzx_cflow.simplify.simp`

   .. autofunction:: simp

   .. autofunction:: id_simp

   .. autofunction:: spider_simp

   .. autofunction:: id_fuse_simp

   .. autofunction:: pivot_simp

   .. autofunction:: pivot_boundary_simp

   .. autofunction:: pivot_gadget_simp

   .. autofunction:: lcomp_simp

   .. autofunction:: biagl_simp

   .. autofunction:: gadget_simp

   .. autofunction:: supplementarity_simp

   .. autofunction:: copy_simp

   The following functions iteratively apply a combination of the above functions:

   .. autofunction:: basic_simp

   .. autofunction:: phase_free_simp

   .. autofunction:: interior_clifford_simp

   .. autofunction:: clifford_simp
   
   .. autofunction:: full_reduce

   .. autofunction:: reduce_scalar

   The following function implements phase teleportation of non-Clifford phases:

   .. autofunction:: teleport_reduce

   The following implements a more selective simplification strategy using the helper function :func:`~pyzx_cflow.simplify.selective_simp`

   .. autofunction:: selective_simp

   .. autofunction:: flow_2Q_simp

   .. autofunction:: match_score_2Q_simp

   .. autofunction:: update_2Q_simp_matches

   The following functions perform various useful actions on ZX-diagrams:

   .. autofunction:: to_gh

   .. autofunction:: to_rg

   .. autofunction:: to_graph_like

   .. autofunction:: is_graph_like

   .. autofunction:: to_clifford_normal_form_graph

   .. autofunction:: tcount

.. _rules:

List of rewrite rules
---------------------
Below is listed the content of ``rules.py``.

.. module:: rules

.. automodule:: pyzx_cflow.rules
   :members:
   :undoc-members:

.. _heuristics:

List of heuristic functions
---------------------------
Below is listed the content of ``heuristics.py``.

.. module:: heuristics

.. automodule:: pyzx_cflow.heuristics
   :members:
   :undoc-members:

.. _flow:

List of flow functions
----------------------
Below is listed the content of ``flow.py``.

.. module:: flow

.. automodule:: pyzx_cflow.flow
   :members:

.. _optimize:

List of optimization functions
------------------------------
Below is listed the content of ``optimize.py``.

.. module:: optimize

.. automodule:: pyzx_cflow.optimize
   :members:
   :undoc-members:

.. _routing:

List of routing functions
------------------------------
Below is listed the content of ``routing.py``.

.. module:: routing

.. automodule:: pyzx_cflow.routing
   :members:
   :undoc-members:
   :member-order: bysource

.. _tensor:

Functions for dealing with tensors
----------------------------------
Below is listed the content of ``tensor.py``.

.. module:: tensor

.. automodule:: pyzx_cflow.tensor
   :members:
   :undoc-members:


.. _drawing:

Drawing
-------
Below is listed the content of ``drawing.py``.

.. module:: drawing

.. automodule:: pyzx_cflow.drawing
   :members:
   :undoc-members:


Tikz and Quantomatic functionality
----------------------------------
.. _tikz:

Below is listed the content of ``tikz.py``.

.. module:: tikz

.. automodule:: pyzx_cflow.tikz
   :members:
   :undoc-members:

.. _quanto:

Below is listed the content of ``quantomatic.py``.

.. module:: quantomatic

.. automodule:: pyzx_cflow.quantomatic
   :members:
   :undoc-members:

