.. _representations:

Importing and exporting quantum circuits and ZX-diagrams
========================================================

There are several ways to import and export circuits and ZX-diagrams in PyZX.

Importing and exporting quantum circuits
----------------------------------------

There are a number of standards for representing quantum circuits that are supported in PyZX. To see if PyZX supports a certain file format, just call :meth:`~pyzx.circuit.Circuit.load`::

	circuit = zx.Circuit.load("path/to/circuit.extension")

The currently supported formats are 

- `QASM <https://en.wikipedia.org/wiki/OpenQASM>`_,
- the ASCII format of `Quipper <https://www.mathstat.dal.ca/~selinger/quipper/>`_,
- the simple *.qc* format used for representing quantum circuits in LaTex,
- and the qsim format used by Google.

To convert a PyZX circuit to these formats, use :meth:`~pyzx.circuit.Circuit.to_qasm`, :meth:`~pyzx.circuit.Circuit.to_quipper`, :meth:`~pyzx.circuit.Circuit.to_qc`.

PyZX also offers a convenience function to construct a circuit out of a string containing QASM code using either :meth:`~pyzx.circuit.Circuit.from_qasm` or :func:`~pyzx.circuit.qasmparser.qasm`. See the `Supported Gates notebook <notebooks/gates.ipynb>`_ for more details.

To convert a Circuit into a PyZX Graph (i.e. a ZX-diagram), call the method :meth:`~pyzx.circuit.Circuit.to_graph`.

Measurements, resets, and mixed processes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PyZX can also import and graph circuits that are not purely unitary, such as
circuits with measurements, resets, ancilla preparations, post-selections, and
classical control. These operations are represented in the ZX-graph with
symbolic Boolean phases, so the classical outcomes remain visible in the graph
instead of being silently discarded.

The main operations are:

- :class:`~pyzx.circuit.gates.Measurement`: a measurement adds a ``Z(0)``
  spider on the measured qubit wire and a degree-1 ``X`` leaf whose phase is a
  Boolean symbol such as ``c[0]``. The symbol records the classical bit that
  receives the result.
- :class:`~pyzx.circuit.gates.Reset`: a reset discards the current qubit state
  and prepares ``|0>``. With the default graph conversion, this is represented
  by a discard leaf carrying a fresh Boolean symbol such as ``_r0`` and a
  separate ``X(0)`` preparation leaf.
- :class:`~pyzx.circuit.gates.InitAncilla` and
  :class:`~pyzx.circuit.gates.PostSelect`: these add explicit state preparation
  and post-selection vertices for ``|+>``, ``|->``, ``|0>``, or ``|1>``.
- :class:`~pyzx.circuit.gates.ConditionalGate`: OpenQASM-style classical
  control is represented by multiplying supported single-qubit ``Z`` or ``X``
  rotation phases by a Boolean condition polynomial.

For example, a small OpenQASM circuit with a measurement and a reset can be
loaded and converted to a graph:

.. code-block:: python

   import pyzx as zx

   circuit = zx.Circuit.from_qasm("""
   OPENQASM 2.0;
   include "qelib1.inc";
   qreg q[1];
   creg c[1];
   h q[0];
   measure q[0] -> c[0];
   reset q[0];
   """)

   graph = circuit.to_graph()

The graph contains symbolic phases for the measurement result and for the reset
discard. You can inspect those symbols directly:

.. code-block:: python

   symbolic_phases = [
       str(graph.phase(v))
       for v in graph.vertices()
       if graph.phase(v) != 0
   ]

The option ``elide_initial_resets`` controls leading resets on otherwise
unmodified input wires:

.. code-block:: python

   keep_reset = circuit.to_graph(elide_initial_resets=False)
   elide_reset = circuit.to_graph(elide_initial_resets=True)

The default, ``False``, preserves the reset's discard-and-prepare structure.
Use ``True`` when the input is already known to be ``|0>`` (for example, when
following OpenQASM's implicit all-zero input convention) and the leading reset
would only repeat that preparation. Mid-circuit resets are still kept, because
they discard a live state.

If you already built a graph with non-elided leading resets and want to remove
only the orphaned discard chains, use
:func:`~pyzx.simplify.drop_orphan_reset_discards`. This cleanup keeps
mid-circuit resets and any reset variable that is still referenced elsewhere in
the graph.

Some limitations are intentional. Symbolic phases cannot be converted to a
numeric tensor or matrix until the classical variables are substituted, and
classically-controlled graph conversion currently supports single-qubit ``Z``
and ``X`` rotations rather than arbitrary controlled subcircuits.


Importing and exporting ZX-diagrams
-----------------------------------

A ZX-diagram in PyZX is represented as an instance of :func:`~pyzx.graph.graph.Graph`. A ZX-diagram can be loaded using the ``.qgraph`` format that Quantomatic uses, via :meth:`~pyzx.graph.base.BaseGraph.from_json`. It can be converted into that format using :meth:`~pyzx.graph.base.BaseGraph.to_json`. 

Apart from this reversible representation, there are also several one-way translations for exporting ZX-diagrams from PyZX. A graph can be exported to GraphML format using :meth:`~pyzx.graph.base.BaseGraph.to_graphml`.
To export a ZX-diagram to tikz for easy importing to Latex, use :func:`~pyzx.tikz.to_tikz`.

Additionally, PyZX diagrams can be directly exported into the applications `Tikzit <https://tikzit.github.io/>`_ using the :func:`~pyzx.tikz.tikzit` function or edited in `Quantomatic <https://quantomatic.github.io/>`_ using the function :func:`~pyzx.quantomatic.edit_graph`.

Finally, to display a ZX-diagram in Jupyter call :func:`~pyzx.drawing.draw` and to create a matplotlib picture of the ZX-diagram use :func:`~pyzx.drawing.draw_matplotlib`.

Some ZX-diagrams can be converted into an equivalent circuit. For complicated ZX-diagrams, the function :func:`~pyzx.extract.extract_circuit` is supplied. For ZX-diagrams that come directly from Circuits, e.g. those produced by calling ``c.to_graph`` for a Circuit ``c``, one can also use the static method :meth:`~pyzx.circuit.Circuit.from_graph`, which is more lightweight.
