Incremental flow finding for XY, X and Y
========================================

This file describes the new flow-finding algorithms that run in :math:`O(n^3)` time
where :math:`n` is the number of vertices.

``pyzx.flow.gflow`` and ``pyzx.flow.pauli_flow`` are two entry points for flow finding.
``pyzx.flow.gflow`` finds gflow by interpreting all spiders in graph-like diagram as
:math:`XY` measurements, and ``pyzx.flow.pauli_flow`` finds Pauli flow by interpreting
some spiders as :math:`X` or :math:`Y`, where applicable. These functions have a keyword
``method`` which defaults to ``method="cubic"`` for the new fast implementation. Using
``method="incremental"`` has the same effect. The new entry points still support the
``focus`` keyword, though regardless of the value, they always return focused gflow or
focused Pauli flow. Both entry points call ``_find_incremental_flow``, which is the
actual finder algorithm, explained below.

In addition, new methods offer ``layers_only=True``, which returns only layers of the
partial order without correction sets. This is slightly faster (though still
:math:`O(n^3)`) on instances with flow (gflow or Pauli flow). It can be useful if the
user cares only about the existence of flow or only the layers of the partial order, but
not about what the flow looks like. For example:

.. code-block:: python

    from pyzx.flow import pauli_flow

    layers = pauli_flow(g, method="incremental", layers_only=True)
    has_flow = layers is not None

For compatibility, the following are still available:

- ``gflow(..., pauli=True)`` as entry point for Pauli flow finder,
- ``pyzx.gflow`` file exports methods from ``pyzx.flow`` so that existing imports
  continue to work.
- ``method="legacy"`` gives access to the old (slow) finder. The legacy finder still
  supports ``focus=False`` option.

Algorithm overview
------------------

The following overview assumes a diagram without ground generators.

The main construction finds :math:`C` layer by layer, starting from the outputs.

The main idea follows the algebraic formulation by Mitosek and Backens, DOI
10.1088/1751-8121/ae2999. However, the implementation uses additional optimisation by
exploiting the special structure of the order-demand matrix.

Let :math:`R=V\setminus O` and :math:`S=V\setminus I`. The flow-demand matrix :math:`M`
has rows :math:`R` and columns :math:`S`. :math:`XY` and :math:`X` rows of :math:`M`
contain adjacency; :math:`Y` rows of :math:`M` additionally contain a diagonal one when
their vertex is not an input. The order-demand matrix :math:`N` also has rows :math:`R`
and columns :math:`S`. With only :math:`XY/X/Y` measurements, the only non-zero entries
of :math:`N` are at the intersection of internal :math:`XY` measurements. The
formulation states that flow exists if there is a matrix :math:`C` such that
:math:`MC=I` and :math:`NC` forms the adjacency matrix of a DAG.

:math:`N` is so simple that we don't need to construct it. Furthermore, instead of the
copying approach in DOI 10.1088/1751-8121/ae2999, which first constructs a right inverse
:math:`C` of :math:`M` and then adjusts it to make :math:`NC` a DAG, we can restrict the
construction of :math:`C` to ensure :math:`NC` is a DAG during construction. This
approach is fast only when there are no :math:`XZ/YZ/Z` measurements, which applies to
graph-like diagrams. As a result, the algorithm here is slightly faster than an
implementation that would closely follow Mitosek--Backens, though still :math:`O(n^3)`.

Furthermore, the implementation uses packed integer representation. Instead of holding
matrix :math:`M` as a two-dimensional array, we hold an array of integers. Each integer,
when written in binary, corresponds to the column of the matrix.

Incremental construction
------------------------

Let :math:`T` be the measured vertices already placed in later layers. Available
correctors are :math:`A=(O\cup X\cup Y\cup T)\setminus I`. For each unsolved :math:`u`,
solve :math:`M[R,A]c=e_u`. Maintain one elimination basis of the available :math:`M`
columns. Each basis entry stores :math:`b=Mq`, where :math:`q` records a combination of
original correction columns. For every unsolved :math:`u`, maintain a partial correction
:math:`c_u` and residual :math:`r_u` with :math:`Mc_u+r_u=e_u` over
:math:`\mathbb{F}_2`.

When moving to earlier layers, the columns considered in :math:`M[R,A]c` grow. We add a
column only when it becomes relevant after adjusting it against the existing basis. If
the new column introduces a pivot in the reduced matrix, eliminate that pivot from every
affected unsolved residual, applying the same XOR to its correction coordinates.
Otherwise, the core methodology resembles previous flow-finding algorithms.

With ``layers_only=True``, the implementation still detects which vertices can be solved
as usual. This involves checking that the relevant linear system is consistent. Then,
the implementation skips tracking correction coordinates and decoding the actual
correction set, saving time.

Verification
------------

Tests enumerate all 4,233 graph/input/output/XY-X-Y instances on up to three vertices
against the Pauli-flow definition directly. Other tests compare the incremental and
legacy finders on fixed graphs.

The optional ``tests/benchmark_flow.py`` test uses 200 spiders, 14 inputs and 14
outputs. It compares the incremental and legacy finders on this larger example and can
be run with ``python -m tests.benchmark_flow``.
