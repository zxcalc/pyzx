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


Measurements, resets, and ancilla preparations
-----------------------------------------------

PyZX supports circuits with measurements, resets, and ancilla preparations.
These are represented in the ZX-graph using parametrised phases via :mod:`~pyzx.symbolic`.

A measurement (``measure q -> c``) records the qubit outcome in a classical bit;
the qubit wire ends there. A reset (``reset q``) discards the qubit state and
re-prepares |0⟩; the wire continues. Ancilla preparations introduce a fresh qubit
in a known state mid-circuit; see :class:`~pyzx.circuit.gates.InitAncilla`.

When calling :meth:`~pyzx.circuit.Circuit.to_graph`, the flag ``elide_initial_resets``
controls whether leading resets are dropped. Since OpenQASM initialises qubits to |0⟩,
a reset at the start of a wire is redundant; setting this flag to ``True`` removes it.
The default is ``False`` to handle programmatically-built circuits where inputs may
not be |0⟩.


Classical control and ground vertices
-------------------------------------

OpenQASM measurements and classically controlled rotations can be imported as
circuits. The measurement outcome becomes a Boolean symbolic phase, and a
conditional rotation has a phase depending on that outcome::

    qasm = """OPENQASM 2.0;
    include "qelib1.inc";
    qreg q[2];
    creg c[1];
    h q[0];
    measure q[0] -> c[0];
    if (c==1) x q[1];
    """
    graph = zx.Circuit.from_qasm(qasm).to_graph()
    assert graph.var_registry.types["c[0]"] is True
    branch_zero = graph.substitute_variables({"c[0]": 0})
    branch_one = graph.substitute_variables({"c[0]": 1})

``substitute_variables`` returns a copy by default, so the symbolic graph
remains available after inspecting either outcome. Conditional ``Z`` and ``X``
rotations are supported by :class:`~pyzx.circuit.gates.ConditionalGate`;
other controlled gates may raise ``NotImplementedError`` when converted to a
graph.

Ground markers are a separate, graph-level feature for ZX-ground diagrams with
discarded outputs. To discard a classical bit after feedforward, append
:class:`~pyzx.circuit.gates.DiscardBit` to the circuit before calling
``to_graph()``::

    from pyzx.circuit.gates import DiscardBit
    circuit = zx.Circuit.from_qasm(qasm)
    circuit.gates.append(DiscardBit(0))
    hybrid_graph = circuit.to_graph()
    assert hybrid_graph.is_hybrid()

For diagrams constructed directly, add a ground connection to a spider with
the ``ground=True`` argument of :meth:`~pyzx.graph.base.BaseGraph.add_vertex`,
or mark an existing vertex with :meth:`~pyzx.graph.base.BaseGraph.set_ground`. Use
:meth:`~pyzx.graph.base.BaseGraph.grounds` and
:meth:`~pyzx.graph.base.BaseGraph.is_hybrid` to inspect the result. A ground
marker is not a Boolean measurement variable: measurements and resets are
represented with symbolic outcome leaves instead.
Hybrid graphs cannot currently be passed to ``tensorfy`` or ``extract_circuit``.
The `mixed classical-quantum demo
<https://github.com/zxcalc/pyzx/blob/master/demos/MixedClassicalQuantum.ipynb>`_
shows both representations and their supported operations.


Importing and exporting ZX-diagrams
-----------------------------------

A ZX-diagram in PyZX is represented as an instance of :func:`~pyzx.graph.graph.Graph`. A ZX-diagram can be loaded using the ``.qgraph`` format that Quantomatic uses, via :meth:`~pyzx.graph.base.BaseGraph.from_json`. It can be converted into that format using :meth:`~pyzx.graph.base.BaseGraph.to_json`. 

Apart from this reversible representation, there are also several one-way translations for exporting ZX-diagrams from PyZX. A graph can be exported to GraphML format using :meth:`~pyzx.graph.base.BaseGraph.to_graphml`.
To export a ZX-diagram to tikz for easy importing to Latex, use :func:`~pyzx.tikz.to_tikz`.

Additionally, PyZX diagrams can be directly exported into the applications `Tikzit <https://tikzit.github.io/>`_ using the :func:`~pyzx.tikz.tikzit` function or edited in `Quantomatic <https://quantomatic.github.io/>`_ using the function :func:`~pyzx.quantomatic.edit_graph`.

Finally, to display a ZX-diagram in Jupyter call :func:`~pyzx.drawing.draw` and to create a matplotlib picture of the ZX-diagram use :func:`~pyzx.drawing.draw_matplotlib`.

Some ZX-diagrams can be converted into an equivalent circuit. For complicated ZX-diagrams, the function :func:`~pyzx.extract.extract_circuit` is supplied. For ZX-diagrams that come directly from Circuits, e.g. those produced by calling ``c.to_graph`` for a Circuit ``c``, one can also use the static method :meth:`~pyzx.circuit.Circuit.from_graph`, which is more lightweight.
