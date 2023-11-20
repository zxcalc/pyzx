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

PyZX also offers a convenience function to construct a circuit out of a string containing QASM code using either :meth:`~pyzx.circuit.Circuit.from_qasm` or :func:`~pyzx.circuit.qasmparser.qasm`. See the `Supported OpenQASM Gates notebook <notebooks/qasm.ipynb>`_ for more details.

To convert a Circuit into a PyZX Graph (i.e. a ZX-diagram), call the method :meth:`~pyzx.circuit.Circuit.to_graph`.


Importing and exporting ZX-diagrams
-----------------------------------

A ZX-diagram in PyZX is represented as an instance of :func:`~pyzx.graph.graph.Graph`. A ZX-diagram can be loaded using the ``.qgraph`` format that Quantomatic uses, via :meth:`~pyzx.graph.base.BaseGraph.from_json`. It can be converted into that format using :meth:`~pyzx.graph.base.BaseGraph.to_json`. 

Apart from this reversible representation, there are also several one-way translations for exporting ZX-diagrams from PyZX. A graph can be exported to GraphML format using :meth:`~pyzx.graph.base.BaseGraph.to_graphml`.
To export a ZX-diagram to tikz for easy importing to Latex, use :func:`~pyzx.tikz.to_tikz`.

Additionally, PyZX diagrams can be directly exported into the applications `Tikzit <https://tikzit.github.io/>`_ using the :func:`~pyzx.tikz.tikzit` function or edited in `Quantomatic <https://quantomatic.github.io/>`_ using the function :func:`~pyzx.quantomatic.edit_graph`.

Finally, to display a ZX-diagram in Jupyter call :func:`~pyzx.drawing.draw` and to create a matplotlib picture of the ZX-diagram use :func:`~pyzx.drawing.draw_matplotlib`.

Some ZX-diagrams can be converted into an equivalent circuit. For complicated ZX-diagrams, the function :func:`~pyzx.extract.extract_circuit` is supplied. For ZX-diagrams that come directly from Circuits, e.g. those produced by calling ``c.to_graph`` for a Circuit ``c``, one can also use the static method :meth:`~pyzx.circuit.Circuit.from_graph`, which is more lightweight.
