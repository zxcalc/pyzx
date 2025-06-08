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

.. _ground_operations:

Ground Operations for Hybrid Circuits
-------------------------------------

Basic Ground Vertex Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PyZX provides explicit ground operations to model classical information flow in hybrid quantum-classical circuits. Ground vertices represent classical bits and control signals.

**Ground vertices**: Marked with `ground=True`, these vertices carry classical information rather than quantum states.

**Hybrid graphs**: Graphs containing both quantum and classical (ground) vertices, enabling modeling of measurement, classical control, and mixed algorithms.

.. code-block:: python

    def basic_ground_operations():
        """Demonstrate basic ground vertex operations."""
        print("1. Basic Ground Operations")
        print("-" * 30)

        # Create a simple graph
        g = zx.Graph()

        # Add some vertices
        v1 = g.add_vertex(zx.VertexType.Z, qubit=0, row=1)
        v2 = g.add_vertex(zx.VertexType.X, qubit=1, row=1)
        v3 = g.add_vertex(zx.VertexType.Z, qubit=0, row=2)

        print(f"Created graph with {g.num_vertices()} vertices")

        # Set ground connections
        g.set_ground(v1, True)
        g.set_ground(v3, True)

        print(f"Vertex {v1} is ground-connected: {g.is_ground(v1)}")
        print(f"Vertex {v2} is ground-connected: {g.is_ground(v2)}")
        print(f"Vertex {v3} is ground-connected: {g.is_ground(v3)}")

        # Get all ground vertices
        ground_vertices = g.grounds()
        print(f"Ground vertices: {ground_vertices}")

        # Check if graph is hybrid
        print(f"Graph is hybrid (has grounds): {g.is_hybrid()}")

        print()

.. _measurement_ground_circuits:

Measurement Circuits with Ground Vertices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ground vertices explicitly model quantum measurements that produce classical outputs. This approach provides a more direct representation than auxiliary ground spiders.

.. code-block:: python

    def measurement_circuit():
        """Demonstrate a circuit with quantum measurements."""
        print("2. Quantum Measurement Circuit")
        print("-" * 30)

        # Create a circuit that prepares a Bell state and measures both qubits
        g = zx.Graph()

        # Add input/output boundaries
        input1 = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=0)
        input2 = g.add_vertex(zx.VertexType.BOUNDARY, qubit=1, row=0)

        # Hadamard on first qubit (represented as Z-spider with phase π/2)
        h_gate = g.add_vertex(zx.VertexType.Z, qubit=0, row=1, phase=Fraction(1,2))

        # CNOT gate (represented as connected Z and X spiders)
        cnot_control = g.add_vertex(zx.VertexType.Z, qubit=0, row=2)
        cnot_target = g.add_vertex(zx.VertexType.X, qubit=1, row=2)

        # Measurement vertices (ground-connected to represent classical output)
        measure1 = g.add_vertex(zx.VertexType.Z, qubit=0, row=3, ground=True)
        measure2 = g.add_vertex(zx.VertexType.Z, qubit=1, row=3, ground=True)

        # Classical outputs
        output1 = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=4)
        output2 = g.add_vertex(zx.VertexType.BOUNDARY, qubit=1, row=4)

        # Connect the circuit
        g.add_edge((input1, h_gate))
        g.add_edge((input2, cnot_target))
        g.add_edge((h_gate, cnot_control))
        g.add_edge((cnot_control, cnot_target))  # CNOT connection
        g.add_edge((cnot_control, measure1))
        g.add_edge((cnot_target, measure2))
        g.add_edge((measure1, output1))
        g.add_edge((measure2, output2))

        # Set inputs/outputs
        g.set_inputs((input1, input2))
        g.set_outputs((output1, output2))

        print(f"Bell state measurement circuit created")
        print(f"Number of vertices: {g.num_vertices()}")
        print(f"Number of ground vertices: {len(g.grounds())}")
        print(f"Ground vertices: {g.grounds()}")
        print(f"Circuit is hybrid: {g.is_hybrid()}")

        # Analyze the measurement structure
        print("\nMeasurement Analysis:")
        for v in g.grounds():
            neighbors = g.neighbors(v)
            print(f"  Ground vertex {v}: connected to {neighbors}")
            print(f"  Type: {g.type(v)}, Phase: {g.phase(v)}")

        print()

.. _conditional_ground_gates:

Classical Control with Ground Vertices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ground vertices enable explicit modeling of classical control where classical bits determine quantum gate operations.

.. code-block:: python

    def conditional_gate_circuit():
        """Demonstrate classical control of quantum gates."""
        print("3. Classical Control Circuit")
        print("-" * 30)

        g = zx.Graph()

        # Create a circuit where a quantum gate is controlled by a classical bit
        # This models: if (classical_bit) then apply_X_gate()

        # Quantum input
        q_input = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=0)

        # Classical control input (ground-connected)
        c_input = g.add_vertex(zx.VertexType.BOUNDARY, qubit=1, row=0, ground=True)

        # Control logic vertex (processes classical information)
        control_logic = g.add_vertex(zx.VertexType.Z, qubit=1, row=1, ground=True)

        # Controlled quantum gate (X gate, controlled by classical bit)
        controlled_x = g.add_vertex(zx.VertexType.X, qubit=0, row=2, phase=Fraction(1))

        # Control connection vertex (mediates classical-quantum interaction)
        control_conn = g.add_vertex(zx.VertexType.Z, qubit=0, row=1, ground=True)

        # Quantum output
        q_output = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=3)

        # Classical output (copy of control bit)
        c_output = g.add_vertex(zx.VertexType.BOUNDARY, qubit=1, row=3, ground=True)

        # Connect the circuit
        g.add_edge((q_input, control_conn))
        g.add_edge((c_input, control_logic))
        g.add_edge((control_logic, control_conn))  # Classical control
        g.add_edge((control_conn, controlled_x))
        g.add_edge((controlled_x, q_output))
        g.add_edge((control_logic, c_output))  # Classical output

        g.set_inputs((q_input, c_input))
        g.set_outputs((q_output, c_output))

        print(f"Conditional gate circuit created")
        print(f"Hybrid circuit: {g.is_hybrid()}")
        print(f"Ground vertices: {len(g.grounds())}")

        # Analyze classical control structure
        print("\nClassical Control Analysis:")
        classical_vertices = g.grounds()
        for v in classical_vertices:
            neighbors = [n for n in g.neighbors(v)]
            quantum_neighbors = [n for n in neighbors if not g.is_ground(n)]
            classical_neighbors = [n for n in neighbors if g.is_ground(n)]

            print(f"  Classical vertex {v}:")
            print(f"    Quantum connections: {quantum_neighbors}")
            print(f"    Classical connections: {classical_neighbors}")

        print()

.. _teleportation_ground_protocol:

Quantum Teleportation with Ground Vertices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ground vertices naturally model the classical communication channels required in quantum teleportation protocols.

.. code-block:: python

    def teleportation_protocol():
        """Demonstrate quantum teleportation with classical communication."""
        print("4. Quantum Teleportation Protocol")
        print("-" * 30)

        g = zx.Graph()

        # Teleportation involves:
        # 1. Unknown quantum state to be teleported
        # 2. Entangled Bell pair shared between Alice and Bob
        # 3. Alice's Bell measurement (produces 2 classical bits)
        # 4. Bob's conditional operations based on classical bits

        # Alice's unknown state input
        alice_input = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=0)

        # Bell pair inputs (|00⟩ + |11⟩)/√2
        bell_alice = g.add_vertex(zx.VertexType.BOUNDARY, qubit=1, row=0)
        bell_bob = g.add_vertex(zx.VertexType.BOUNDARY, qubit=2, row=0)

        # Bell pair preparation
        h_bell = g.add_vertex(zx.VertexType.Z, qubit=1, row=1, phase=Fraction(1,2))
        cnot_bell_ctrl = g.add_vertex(zx.VertexType.Z, qubit=1, row=2)
        cnot_bell_targ = g.add_vertex(zx.VertexType.X, qubit=2, row=2)

        # Alice's Bell measurement
        alice_cnot_ctrl = g.add_vertex(zx.VertexType.Z, qubit=0, row=3)
        alice_cnot_targ = g.add_vertex(zx.VertexType.X, qubit=1, row=3)
        alice_h = g.add_vertex(zx.VertexType.Z, qubit=0, row=4, phase=Fraction(1,2))

        # Alice's measurement outcomes (classical bits)
        measure_x = g.add_vertex(zx.VertexType.Z, qubit=0, row=5, ground=True)
        measure_z = g.add_vertex(zx.VertexType.Z, qubit=1, row=5, ground=True)

        # Classical communication to Bob
        comm_x = g.add_vertex(zx.VertexType.Z, qubit=0, row=6, ground=True)
        comm_z = g.add_vertex(zx.VertexType.Z, qubit=1, row=6, ground=True)

        # Bob's conditional operations
        bob_x_gate = g.add_vertex(zx.VertexType.X, qubit=2, row=7, phase=Fraction(1))
        bob_z_gate = g.add_vertex(zx.VertexType.Z, qubit=2, row=8, phase=Fraction(1))

        # Bob's output (reconstructed state)
        bob_output = g.add_vertex(zx.VertexType.BOUNDARY, qubit=2, row=9)

        # Connect Bell pair preparation
        g.add_edge((bell_alice, h_bell))
        g.add_edge((bell_bob, cnot_bell_targ))
        g.add_edge((h_bell, cnot_bell_ctrl))
        g.add_edge((cnot_bell_ctrl, cnot_bell_targ))

        # Connect Alice's operations
        g.add_edge((alice_input, alice_cnot_ctrl))
        g.add_edge((cnot_bell_ctrl, alice_cnot_targ))
        g.add_edge((alice_cnot_ctrl, alice_cnot_targ))
        g.add_edge((alice_cnot_ctrl, alice_h))
        g.add_edge((alice_h, measure_x))
        g.add_edge((alice_cnot_targ, measure_z))

        # Classical communication
        g.add_edge((measure_x, comm_x))
        g.add_edge((measure_z, comm_z))

        # Bob's conditional operations (classical control)
        g.add_edge((cnot_bell_targ, bob_x_gate))
        g.add_edge((comm_x, bob_x_gate))  # Classical control
        g.add_edge((bob_x_gate, bob_z_gate))
        g.add_edge((comm_z, bob_z_gate))  # Classical control
        g.add_edge((bob_z_gate, bob_output))

        g.set_inputs((alice_input, bell_alice, bell_bob))
        g.set_outputs((bob_output,))

        print(f"Teleportation protocol circuit created")
        print(f"Total vertices: {g.num_vertices()}")
        print(f"Ground (classical) vertices: {len(g.grounds())}")
        print(f"Classical communication channels: {len([v for v in g.grounds() if 'comm' in str(v)])}")

        # Analyze information flow
        print("\nInformation Flow Analysis:")
        print("Classical vertices and their roles:")
        ground_vertices = list(g.grounds())
        for i, v in enumerate(ground_vertices):
            neighbors = g.neighbors(v)
            if any('measure' in str(n) for n in neighbors):
                print(f"  Vertex {v}: Measurement outcome")
            elif any('comm' in str(n) for n in neighbors):
                print(f"  Vertex {v}: Classical communication")
            else:
                print(f"  Vertex {v}: Classical control")

        print()

.. _simple_ground_circuits:

Simple Ground Circuit Construction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Basic classical and hybrid circuits demonstrate fundamental ground vertex usage patterns.

.. code-block:: python

    def build_simple_classical_circuit():
        """Build a basic classical-only circuit using ground vertices."""
        g = zx.Graph()
        in_v = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=0, ground=True)
        z1 = g.add_vertex(zx.VertexType.Z, qubit=0, row=1, ground=True)
        z2 = g.add_vertex(zx.VertexType.Z, qubit=0, row=2, ground=True)
        out_v = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=3, ground=True)

        g.add_edge((in_v, z1))
        g.add_edge((z1, z2))
        g.add_edge((z2, out_v))

        g.set_inputs((in_v,))
        g.set_outputs((out_v,))
        return g

    def build_simple_quantum_circuit():
        """Build a simple quantum circuit."""
        circ = zx.Circuit(1)
        circ.add_gate("H", 0)
        circ.add_gate("ZPhase", 0, Fraction(1, 8))  # T gate
        circ.add_gate("XPhase", 0, Fraction(1))     # X gate
        return circ.to_graph()

    def build_simple_hybrid_circuit():
        """Build a simple hybrid quantum-classical circuit."""
        g = zx.Graph()
        
        # Quantum input
        q_in = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=0)
        
        # Classical control input
        c_ctrl = g.add_vertex(zx.VertexType.BOUNDARY, qubit=1, row=0, ground=True)
        
        # Quantum gate (X gate)
        xgate = g.add_vertex(zx.VertexType.X, qubit=0, row=1, phase=Fraction(1))
        
        # Classical condition
        classical_condition = g.add_vertex(zx.VertexType.Z, qubit=1, row=1, ground=True)
        
        # Quantum output
        q_out = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=2)
        
        # Connect vertices
        g.add_edge((q_in, xgate))
        g.add_edge((c_ctrl, classical_condition))
        g.add_edge((classical_condition, xgate))
        g.add_edge((xgate, q_out))
        
        g.set_inputs((q_in, c_ctrl))
        g.set_outputs((q_out,))
        
        return g

    # Create example circuits
    classical_circuit = build_simple_classical_circuit()
    quantum_circuit = build_simple_quantum_circuit()
    hybrid_circuit = build_simple_hybrid_circuit()

    print("Classical circuit properties:")
    print(f"  Is hybrid: {classical_circuit.is_hybrid()}")
    print(f"  Ground vertices: {len(classical_circuit.grounds())}")

    print("\nQuantum circuit properties:")
    print(f"  Is hybrid: {quantum_circuit.is_hybrid()}")
    print(f"  Ground vertices: {len(quantum_circuit.grounds())}")

    print("\nHybrid circuit properties:")
    print(f"  Is hybrid: {hybrid_circuit.is_hybrid()}")
    print(f"  Ground vertices: {len(hybrid_circuit.grounds())}")

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

.. _reduction_with_grounds:

Circuit Reduction with Ground Vertices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ground vertices are preserved during graph operations and affect how circuit reductions are performed.

.. code-block:: python

    def reduction_with_grounds():
        """Demonstrate how ground vertices affect circuit reduction."""
        print("5. Circuit Reduction with Grounds")
        print("-" * 30)

        # Create a simple circuit with some redundancy
        g = zx.Graph()

        input1 = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=0)

        # Identity-like structure that should be reducible
        z1 = g.add_vertex(zx.VertexType.Z, qubit=0, row=1, phase=0)
        z2 = g.add_vertex(zx.VertexType.Z, qubit=0, row=2, phase=0)

        # But one vertex is ground-connected (measurement)
        measure = g.add_vertex(zx.VertexType.Z, qubit=0, row=3, ground=True)

        output1 = g.add_vertex(zx.VertexType.BOUNDARY, qubit=0, row=4)

        g.add_edge((input1, z1))
        g.add_edge((z1, z2))
        g.add_edge((z2, measure))
        g.add_edge((measure, output1))

        g.set_inputs((input1,))
        g.set_outputs((output1,))

        print("Original circuit:")
        print(f"  Vertices: {g.num_vertices()}")
        print(f"  Edges: {g.num_edges()}")
        print(f"  Ground vertices: {len(g.grounds())}")
        print(f"  Is hybrid: {g.is_hybrid()}")

        # Show that grounds are preserved during operations
        g_copy = g.copy()
        print(f"\nAfter copying:")
        print(f"  Ground vertices preserved: {len(g_copy.grounds()) == len(g.grounds())}")
        print(f"  Ground vertices: {g_copy.grounds()}")

        # Demonstrate adjoint with grounds
        g_adj = g.adjoint()
        print(f"\nAfter taking adjoint:")
        print(f"  Ground vertices: {len(g_adj.grounds())}")
        print(f"  Still hybrid: {g_adj.is_hybrid()}")

        print()
