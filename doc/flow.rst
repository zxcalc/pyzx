Flow finding
============

``pyzx.flow.gflow`` finds gflow by interpreting all spiders in a graph-like diagram as
:math:`XY` measurements. ``pyzx.flow.pauli_flow`` finds Pauli flow by interpreting Pauli
phases as :math:`X` or :math:`Y` measurements and other phases as :math:`XY`. Both
finders use ``method="cubic"`` by default, which runs in :math:`O(n^3)` time for
:math:`n` vertices and returns focused gflow or focused Pauli flow.

``layers_only=True`` returns the partial-order layers without correction sets. It can
save time when only flow existence or the layers are needed:

.. code-block:: python

    from pyzx.flow import pauli_flow

    layers = pauli_flow(g, layers_only=True)
    has_flow = layers is not None

``method="legacy"`` is an older, less efficient implementation. The legacy
implementation additionally supports the ``focus`` argument, which specifies whether the
returned flow must be focused.

Ground vertices are processed with the outputs and receive no correction sets of their
own. In the cubic method, ``include_ground_constraints=True`` retains their constraints
in the correction equations. These are omitted by default. In the legacy method,
``focus=True`` adds these constraints.

All finding methods search for gflow or Pauli flow on graph-like diagrams without
explicitly checking that the diagram is in such form.

See :mod:`pyzx.flow` for the full API reference.

Cubic algorithm
---------------

The overview assumes a diagram without ground vertices.

The main idea follows the algebraic formulation by Mitosek and Backens, DOI
10.1088/1751-8121/ae2999. However, the implementation exploits the order-demand matrix's
special structure for optimisation.

Let :math:`V, I, O` be the sets of all vertices, input vertices, and output vertices of
the open graph respectively. Let :math:`R=V\setminus O` and :math:`S=V\setminus I` be
non-outputs and non-inputs respectively. All matrices and vectors are over
:math:`\mathbb{F}_2`. The flow-demand matrix :math:`M` is an :math:`R \times S`
submatrix of the graph's adjacency matrix, with additional ones on the main diagonal for
the :math:`Y`-measured vertices. The order-demand matrix :math:`N` also has shape
:math:`R \times S`. The only non-zero entries of :math:`N` are on the main diagonal for
non-input :math:`XY` measurements. The algebraic formulation states that flow exists if
there exists an :math:`S \times R` matrix :math:`C`, known as the correction matrix,
such that :math:`MC=\mathrm{Id}_R` and :math:`NC` is the adjacency matrix of a directed
acyclic graph (DAG). Furthermore, columns of :math:`C` encode correction sets, and the
transitive closure of :math:`NC` forms the partial order.

The algorithm finds :math:`C` in layers of the partial order, starting from the outputs
as explained in the next subsection. :math:`N` is so simple that we don't need to
construct it. Furthermore, instead of using the approach from DOI
10.1088/1751-8121/ae2999, which first constructs a right inverse :math:`C` of :math:`M`
and then adjusts it to make :math:`NC` a DAG, we can restrict the construction of
:math:`C` to ensure :math:`NC` is a DAG during construction. This approach is fast only
when there are no :math:`XZ/YZ/Z` measurements, which applies to graph-like diagrams. As
a result, the algorithm here is slightly faster than an implementation that would
closely follow DOI 10.1088/1751-8121/ae2999, though still :math:`O(n^3)`.

Furthermore, the implementation uses packed integer representation. Instead of storing
matrix :math:`M` as a two-dimensional array, we store it as an array of integers. Each
integer, when written in binary, corresponds to the column of the matrix.

Layer-by-layer construction
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let :math:`X` and :math:`Y` be the sets of vertices measured in those bases, and
:math:`T` the measured vertices already placed in later layers. Available correctors are
:math:`A=(O\cup X\cup Y\cup T)\setminus I`. For each unsolved :math:`u`, solve
:math:`M[R,A]c=e_u`, where :math:`e_u` is the unit vector for row :math:`u`. If it has a
solution, then :math:`c` forms the correction set for :math:`u`. However, to achieve
:math:`O(n^3)` complexity, the algorithm does not solve the linear system from scratch
for each vertex. Instead, it maintains one elimination basis of the :math:`M` columns
corresponding to vertices in :math:`A`. Each basis entry stores :math:`b` such that
:math:`b=Mq`, where :math:`q` records a combination of original correction columns. For
each unsolved :math:`u`, it also maintains a partial correction :math:`c_u` and residual
:math:`r_u` such that :math:`Mc_u+r_u=e_u`. That means a vertex :math:`u` is solved once
its residual :math:`r_u` is the zero vector.

When moving to earlier layers, the columns considered in :math:`M[R,A]c` grow. We add a
column only when it becomes relevant after adjusting it against the existing basis. If
the column introduces a pivot in the reduced matrix, eliminate that pivot from every
affected unsolved residual, applying the same XOR to its correction coordinates.
Otherwise, the core methodology matches the algorithm by Mitosek and Backens.

With ``layers_only=True``, the implementation still detects which vertices can be solved
as usual. This involves checking that the relevant linear system is consistent. Then,
the implementation skips tracking correction coordinates and decoding the actual
correction set, saving time.
