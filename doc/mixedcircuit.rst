.. _hybrid_circuits:

ZX-Calculus for Hybrid Quantum-Classical Circuits
=================================================

This document explores how the ZX-calculus can be used to analyze and optimize hybrid quantum-classical circuits, focusing on measurement operations, classical control, and circuit optimization.

Mathematical Foundation
----------------------

.. _spiders_graphical:

Spiders and Graphical Calculus
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the ZX-calculus, quantum operations are represented as diagrams composed of spiders:

**Z-spider (green)**: Corresponds to a linear map with phase α.

**X-spider (red)**: Similar to Z-spiders but in the X-basis.

Each spider represents a tensor. Edges connect spiders and represent entanglement or composition (wires = identity maps).

The graphical language is compositional, meaning diagrams correspond to linear maps and can be manipulated via rewrite rules.

.. code-block:: python

    import pyzx as zx
    import numpy as np
    from fractions import Fraction
    import matplotlib.pyplot as plt

    # Check PyZX version and available functionality
    print("PyZX version:", zx.__version__)
    print("Available graph types:", [attr for attr in dir(zx) if 'Graph' in attr])

.. _measurement_operations:

Measurement in ZX-Calculus
-------------------------

Quantum Measurement as Projections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the ZX formalism, measurement (e.g., in the Z basis) is not an intrinsic operation but can be simulated via:

**Grounding outputs**: Connecting output vertices to ground spiders (Z-spiders with zero phase and no outputs).

This mimics a projective measurement by collapsing the output qubit and removing it from further computation.

Mathematically, this is equivalent to applying a projection operator.

In the ZX diagram, this corresponds to connecting the output to a scalar spider.

.. code-block:: python

    def create_measurement_circuit():
        """Create a circuit that demonstrates measurement operations"""
        circ = zx.Circuit(3)

        # Prepare a Bell state
        circ.add_gate("H", 0)
        circ.add_gate("CNOT", 0, 1)

        # Add some single qubit rotations
        circ.add_gate("ZPhase", 0, Fraction(1, 4))  # T gate
        circ.add_gate("XPhase", 1, Fraction(1, 2))  # S gate equivalent

        return circ

    def circuit_to_grounded_graph(circ):
        """Convert a circuit to a ZX graph and add ground generators for measurements"""
        g = circ.to_graph()
        outputs = g.outputs()

        # Add ground connections to some outputs to simulate measurements
        for i, v in enumerate(outputs):
            if i < 2:  # Ground first two outputs
                ground_vertex = g.add_vertex(zx.VertexType.Z, phase=0)
                g.add_edge((v, ground_vertex))
                print(f"Added ground generator connected to output {i}")

        return g

    measurement_circ = create_measurement_circuit()
    grounded_g = circuit_to_grounded_graph(measurement_circ)
    zx.draw_matplotlib(grounded_g, figsize=(12, 4))

.. _classical_control:

Classical Control in Hybrid Circuits
------------------------------------

Classical Data as Control Flow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In hybrid circuits, classical bits can control quantum gates (e.g., "apply X if measurement result is 1").

In ZX terms, this is modeled by:

- Adding auxiliary spiders representing classical bits
- Connecting them to quantum operation spiders to simulate conditional behavior

This does not yet reflect true conditional unitary logic but mimics classical correlations through graph topology.

.. code-block:: python

    def create_classically_controlled_circuit():
        """Create a circuit with classical control flow"""
        circ = zx.Circuit(4)

        # Prepare some initial states
        circ.add_gate("H", 0)
        circ.add_gate("H", 1)

        # Create entanglement
        circ.add_gate("CNOT", 0, 2)
        circ.add_gate("CNOT", 1, 3)

        # Add conditional operations (simulated through graph structure)
        circ.add_gate("ZPhase", 2, Fraction(1, 8))
        circ.add_gate("XPhase", 3, Fraction(3, 8))

        return circ

    def add_classical_control(g):
        """Add classical control structure to a ZX graph"""
        # Add auxiliary vertices to represent classical bits
        classical_vertices = []
        for i in range(2):
            classical_v = g.add_vertex(zx.VertexType.Z, phase=0)
            classical_vertices.append(classical_v)

        # Connect classical control to quantum operations
        quantum_vertices = [v for v in g.vertices() if g.phase(v) != 0]

        for i, qv in enumerate(quantum_vertices[:2]):
            if i < len(classical_vertices):
                g.add_edge((classical_vertices[i], qv))

        return g, classical_vertices

    controlled_circ = create_classically_controlled_circuit()
    controlled_g = controlled_circ.to_graph()
    controlled_g, classical_vs = add_classical_control(controlled_g)

    print(f"Added {len(classical_vs)} classical control vertices")
    zx.draw_matplotlib(controlled_g, figsize=(14, 5))

.. _optimization_simplification:

ZX Optimization and Graph Simplification
----------------------------------------

Full Reduce Algorithm
~~~~~~~~~~~~~~~~~~~~

ZX diagrams are manipulated by equational rewrite rules:

- **Spider fusion**: Two Z-spiders connected directly can be merged
- **Bialgebra rule**: Governs interactions between Z and X spiders
- **Hopf law**: Simplifies entangled structures
- **Pi-copy**: Allows propagation of π phase through spiders

Optimization uses these rules to:

1. Reduce number of vertices/edges
2. Find circuit equivalents with fewer gates
3. Identify classical subgraphs: parts that behave deterministically

Mathematically, this is graph rewriting in a monoidal category, preserving the linear map semantics.

.. code-block:: python

    def optimize_hybrid_circuit(g):
        """Apply optimization rules for hybrid circuits"""
        print("Original graph stats:")
        print(f"  Vertices: {g.num_vertices()}")
        print(f"  Edges: {g.num_edges()}")

        # Apply standard ZX optimizations
        zx.simplify.full_reduce(g)

        print("After standard optimization:")
        print(f"  Vertices: {g.num_vertices()}")
        print(f"  Edges: {g.num_edges()}")

        return g

    def create_complex_hybrid_circuit():
        """Create a complex circuit with classical and quantum parts"""
        circ = zx.Circuit(5)

        # Quantum part
        for i in range(4):
            circ.add_gate("H", i)

        # Create entanglement chain
        for i in range(4):
            circ.add_gate("CNOT", i, (i+1) % 5)

        # Add various phase gates
        phases = [Fraction(1, 4), Fraction(1, 2), Fraction(3, 4), Fraction(1, 8)]
        for i, phase in enumerate(phases):
            circ.add_gate("ZPhase", i, phase)

        # Add some X rotations
        circ.add_gate("XPhase", 4, Fraction(1, 2))

        return circ

    complex_circ = create_complex_hybrid_circuit()
    complex_g = complex_circ.to_graph()

    print("Before optimization:")
    zx.draw_matplotlib(complex_g, figsize=(15, 6))

    # Optimize
    optimized_g = optimize_hybrid_circuit(complex_g.copy())

    print("\nAfter optimization:")
    zx.draw_matplotlib(optimized_g, figsize=(15, 6))

.. _classical_quantum_analysis:

Hybrid Circuit Analysis: Classical vs. Quantum
----------------------------------------------

Classical Vertices
~~~~~~~~~~~~~~~~~

Vertices (spiders) are considered classically simulatable when:

- Their phase is 0 or π (i.e., deterministic)
- Their degree is small (e.g., ≤ 2), meaning limited entanglement

This implies their action is:

- Either identity or Pauli gates
- Or simple classical correlations (e.g., copy, NOT, parity)

These are captured by the Clifford group, which is efficiently classically simulatable.

Quantum Vertices
~~~~~~~~~~~~~~~

Quantum spiders have:

- Non-Clifford phases, like π/4 (T gate) or arbitrary rotations
- Larger degrees or entangling connectivity

These represent true quantum resources (e.g., magic states) and are the focus of optimization.

.. code-block:: python

    def analyze_classical_components(g):
        """Analyze which parts of a circuit can be implemented classically"""
        classical_vertices = []
        quantum_vertices = []

        for v in g.vertices():
            vertex_type = g.type(v)
            phase = g.phase(v)

            # Calculate vertex degree
            degree = len(list(g.neighbors(v)))

            # Heuristic: vertices with specific phases and connections
            # might be implementable classically
            if phase in [0, Fraction(1, 1)] and degree <= 2:
                classical_vertices.append(v)
            else:
                quantum_vertices.append(v)

        print(f"Potentially classical vertices: {len(classical_vertices)}")
        print(f"Quantum vertices: {len(quantum_vertices)}")

        return classical_vertices, quantum_vertices

.. _feedback_teleportation:

Feedback and Teleportation
--------------------------

Measurement-based Feedback
~~~~~~~~~~~~~~~~~~~~~~~~~

Quantum teleportation relies on:

- Entanglement, measurement, and classical communication
- A Bell measurement (on entangled qubits) and conditional corrections based on measurement outcomes

In ZX diagrams:

- **Bell measurement** = fusing and measuring spiders
- **Feedback** = applying conditional gates represented by added spiders connected from outputs back into circuit (simulating feedback loop)

.. code-block:: python

    def simulate_measurement_feedback():
        """Simulate a circuit with measurement feedback"""
        # Create a simple teleportation-like protocol
        circ = zx.Circuit(3)

        # Bell state preparation
        circ.add_gate("H", 0)
        circ.add_gate("CNOT", 0, 1)

        # Input state preparation
        circ.add_gate("H", 2)  # |+⟩ state

        # Bell measurement on qubits 2,0
        circ.add_gate("CNOT", 2, 0)
        circ.add_gate("H", 2)

        # Apply conditional corrections based on measurement results
        circ.add_gate("ZPhase", 1, Fraction(1, 1))  # Conditional Z
        circ.add_gate("XPhase", 1, Fraction(1, 1))  # Conditional X

        return circ

    def add_measurement_points(g, qubit_indices):
        """Add explicit measurement points to specific qubits"""
        measurement_vertices = []
        outputs = g.outputs()

        for idx in qubit_indices:
            if idx < len(outputs):
                # Create measurement vertex
                meas_v = g.add_vertex(zx.VertexType.Z, phase=0)
                output_v = outputs[idx]
                g.add_edge((output_v, meas_v))
                measurement_vertices.append(meas_v)

        return measurement_vertices

    teleport_circ = simulate_measurement_feedback()
    teleport_g = teleport_circ.to_graph()

    # Add measurements to first two qubits
    meas_vertices = add_measurement_points(teleport_g, [0, 1])
    print(f"Added {len(meas_vertices)} measurement points")

    zx.draw_matplotlib(teleport_g, figsize=(12, 4))

.. _vertex_classification:

Classical vs Quantum Vertex Analysis
------------------------------------

Graph Vertex Classification Heuristic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For each vertex v in the graph G:

1. Determine the vertex type
2. Extract the phase of the vertex
3. Compute the degree (number of neighbors) of the vertex

Classification Criterion
~~~~~~~~~~~~~~~~~~~~~~~~

Vertices are heuristically classified based on their phase and degree:

Classical-like vertices satisfy: phase ∈ {0, π} and degree ≤ 2

where the phase is expressed as a fraction representing multiples of π.

All other vertices are considered quantum vertices.

This heuristic reflects the idea that vertices with deterministic phases and limited connectivity behave like classical operations or Clifford gates.

.. code-block:: python

    def create_mixed_classical_quantum():
        """Create a circuit with both classical and quantum parts"""
        circ = zx.Circuit(4)

        # Classical-like operations (Pauli gates as phase rotations)
        circ.add_gate("XPhase", 0, Fraction(1, 1))  # X gate = π rotation around X
        circ.add_gate("ZPhase", 1, Fraction(1, 1))  # Z gate = π rotation around Z

        # Quantum operations
        circ.add_gate("H", 2)
        circ.add_gate("ZPhase", 2, Fraction(1, 8))  # T gate

        # Mixed operations
        circ.add_gate("CNOT", 0, 2)
        circ.add_gate("CNOT", 1, 3)

        return circ

    # Create and analyze the circuit
    mixed_circ = create_mixed_classical_quantum()
    mixed_g = mixed_circ.to_graph()

    # Visualize the circuit
    zx.draw_matplotlib(mixed_g, figsize=(12, 6))

    # Analyze components
    classical_vs, quantum_vs = analyze_classical_components(mixed_g)

    print(f"Circuit analysis complete:")
    print(f"- Classical-like vertices: {len(classical_vs)}")
    print(f"- Quantum vertices: {len(quantum_vs)}")

    # Create visualization of the analysis
    categories = ['Classical-like', 'Quantum']
    counts = [len(classical_vs), len(quantum_vs)]
    
    plt.bar(categories, counts, color=['lightblue', 'lightcoral'])
    plt.title('Vertex Classification')
    plt.ylabel('Number of Vertices')
    
    for i, count in enumerate(counts):
        plt.text(i, count + 0.1, str(count), ha='center', va='bottom')
    
    plt.show()

.. _benchmarking:

Benchmarking Optimization on Quantum Circuits
---------------------------------------------

Performance Analysis
~~~~~~~~~~~~~~~~~~~

The following benchmark compares optimization performance on different circuit types:

.. code-block:: python

    def benchmark_optimization():
        """Benchmark optimization on different circuit types"""
        results = {}

        # Pure quantum circuit
        pure_circ = zx.Circuit(4)
        for i in range(4):
            pure_circ.add_gate("H", i)
        for i in range(3):
            pure_circ.add_gate("CNOT", i, i+1)
        for i in range(4):
            pure_circ.add_gate("ZPhase", i, Fraction(1, 4))

        pure_g = pure_circ.to_graph()
        original_vertices = pure_g.num_vertices()

        # Optimize (work on a copy)
        pure_g_copy = pure_g.copy()
        zx.simplify.full_reduce(pure_g_copy)
        optimized_vertices = pure_g_copy.num_vertices()

        results['pure_quantum'] = {
            'original': original_vertices,
            'optimized': optimized_vertices,
            'reduction': original_vertices - optimized_vertices
        }

        # Hybrid circuit (with measurements)
        hybrid_circ = zx.Circuit(4)
        for i in range(4):
            hybrid_circ.add_gate("H", i)
        for i in range(3):
            hybrid_circ.add_gate("CNOT", i, i+1)

        hybrid_g = hybrid_circ.to_graph()
        outputs = hybrid_g.outputs()

        # Add ground generators for measurements
        for i in range(2):
            ground_v = hybrid_g.add_vertex(zx.VertexType.Z, phase=0)
            if i < len(outputs):
                hybrid_g.add_edge((outputs[i], ground_v))

        original_vertices_hybrid = hybrid_g.num_vertices()

        # Optimize (work on a copy)
        hybrid_g_copy = hybrid_g.copy()
        zx.simplify.full_reduce(hybrid_g_copy)
        optimized_vertices_hybrid = hybrid_g_copy.num_vertices()

        results['hybrid'] = {
            'original': original_vertices_hybrid,
            'optimized': optimized_vertices_hybrid,
            'reduction': original_vertices_hybrid - optimized_vertices_hybrid
        }

        return results

    benchmark_results = benchmark_optimization()

    print("Optimization Benchmark Results:")
    print("=" * 40)
    for circuit_type, data in benchmark_results.items():
        print(f"{circuit_type.upper()}:")
        print(f"  Original vertices: {data['original']}")
        print(f"  Optimized vertices: {data['optimized']}")
        print(f"  Reduction: {data['reduction']}")
        if data['original'] > 0:
            print(f"  Reduction %: {100 * data['reduction'] / data['original']:.1f}%")
        print()

Summary
-------

The ZX-calculus provides a powerful framework for analyzing hybrid quantum-classical circuits:

1. **Measurement Operations**: Can be modeled through grounding operations
2. **Classical Control**: Represented via auxiliary spiders and graph topology  
3. **Optimization**: Standard ZX rewrite rules can reduce circuit complexity
4. **Analysis**: Vertices can be classified as classical-like or quantum based on phase and connectivity
5. **Feedback Loops**: Teleportation and measurement-based protocols can be represented graphically

This approach enables systematic optimization and analysis of hybrid circuits, identifying which components require true quantum resources versus those that can be classically simulated.
