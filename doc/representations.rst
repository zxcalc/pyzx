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


Importing and exporting ZX-diagrams
-----------------------------------

A ZX-diagram in PyZX is represented as an instance of :func:`~pyzx.graph.graph.Graph`. A ZX-diagram can be loaded using the ``.qgraph`` format that Quantomatic uses, via :meth:`~pyzx.graph.base.BaseGraph.from_json`. It can be converted into that format using :meth:`~pyzx.graph.base.BaseGraph.to_json`. 

Apart from this reversible representation, there are also several one-way translations for exporting ZX-diagrams from PyZX. A graph can be exported to GraphML format using :meth:`~pyzx.graph.base.BaseGraph.to_graphml`.
To export a ZX-diagram to tikz for easy importing to Latex, use :func:`~pyzx.tikz.to_tikz`.

Additionally, PyZX diagrams can be directly exported into the applications `Tikzit <https://tikzit.github.io/>`_ using the :func:`~pyzx.tikz.tikzit` function or edited in `Quantomatic <https://quantomatic.github.io/>`_ using the function :func:`~pyzx.quantomatic.edit_graph`.

Finally, to display a ZX-diagram in Jupyter call :func:`~pyzx.drawing.draw` and to create a matplotlib picture of the ZX-diagram use :func:`~pyzx.drawing.draw_matplotlib`.

Some ZX-diagrams can be converted into an equivalent circuit. For complicated ZX-diagrams, the function :func:`~pyzx.extract.extract_circuit` is supplied. For ZX-diagrams that come directly from Circuits, e.g. those produced by calling ``c.to_graph`` for a Circuit ``c``, one can also use the static method :meth:`~pyzx.circuit.Circuit.from_graph`, which is more lightweight.


Measurements, resets, and ancilla preparations
---------------------------------------------

PyZX supports circuits containing **measurements**, **resets**, **ancilla preparations**, and **classical control** via a symbolic-boolean paradigm. These non-unitary operations are represented using parameterised spider phases built from boolean variables.

Overview
~~~~~~~~

When a circuit containing these operations is converted to a graph via :meth:`~pyzx.circuit.Circuit.to_graph`, each operation is encoded as a spider with a symbolic phase:

- **Measurements** are Z-spiders whose X-leaf carries a boolean variable (e.g. c[0]) representing the classical outcome.
- **Resets** are Z(0) spiders followed by an X-leaf carrying a fresh boolean variable (_rN), then a disconnected X(0) leaf for the fresh |0⟩ preparation.
- **Ancilla preparations** (via InitAncilla) are represented as state spiders (Z spiders for |+⟩/|-⟩, X spiders for |0⟩/|1⟩).
- **Post-selections** are similar to ancilla preparations but mark the end of a qubit wire.
- **Classical control** (feedforward) is represented as a spider whose phase is a symbolic polynomial of measurement result variables.

Supported operations
~~~~~~~~~~~~~~~~~

The following gate types are fully supported:

- zx.Circuit.add_gate("Measurement", target, result_bit=None, result_symbol=None) — Measure a qubit. The result is stored in a classical register or a symbolic variable.
- zx.Circuit.add_gate("Reset", target) — Reset a qubit to |0⟩. Discards the current state and reinitialises.
- zx.Circuit.add_gate("InitAncilla", label, state='+') — Initialise an ancilla qubit in a given state ('+', '-', '0', '1'). Note: this creates a **new** qubit, distinct from Reset.
- zx.Circuit.add_gate("PostSelect", label, state='+') — End a qubit wire with post-selection in a given state.
- zx.Circuit.add_gate("ConditionalGate", condition_register, condition_value, inner_gate, register_size) — Apply a single-qubit rotation only when a classical register equals a given value.

Limitations for ConditionalGate:

- Only single-qubit Z and X rotations ( ZPhase, Z, S, T, XPhase, NOT, and their subclasses) are supported.
- HAD, CNOT, and CZ are not supported as the inner gate.

The elide_initial_resets option
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When converting a circuit to a graph with :meth:`~pyzx.circuit.Circuit.to_graph`, the elide_initial_resets parameter (default False) controls handling of leading Reset gates on fresh input wires:

- elide_initial_resets=False (default): A leading Reset on an unmodified input wire is represented as a full Z(0)-X(_rN) discard fragment plus a disconnected X(0) prep leaf. This is the safe default for programmatically-constructed circuits where inputs may be uninitialised.
- elide_initial_resets=True: The discard chain is skipped for resets whose preceding wire is still a fresh input boundary. The reset becomes a no-op. Set this to True when inputs are already represented as explicit |0⟩ states (e.g. via initialize_qubits or Graph.apply_state). This matches OpenQASM's implicit |0⟩ semantics.

The simplification function :func:`~pyzx.simplify.drop_orphan_reset_discards` removes orphan discard components that arise from elide_initial_resets=False after the inputs are known to be |0⟩.

Example
~~~~~~~

.. code-block:: python

    import pyzx as zx
    from fractions import Fraction

    # Build a circuit with measurement and classical control
    c = zx.Circuit(2)
    c.add_gate("HAD", 0)
    c.add_gate("CNOT", 0, 1)
    c.add_gate("Measurement", 0, result_bit=0)
    # Conditional Z on qubit 1 when c[0] == 1
    c.add_gate("ConditionalGate", "c", 1, zx.gates.ZPhase(1, phase=Fraction(1,4)), register_size=1)
    c.add_gate("Measurement", 1, result_bit=1)

    # Convert to graph (measurement results become symbolic phases)
    g = c.to_graph()

    # Simplify
    zx.simplify.full_reduce(g)
    zx.draw(g)

    # Convert back to circuit (symbolic phases become conditional gates)
    c2 = zx.graph_to_circuit(g)
    print(c2.gates)
