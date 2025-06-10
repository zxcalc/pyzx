.. _pyzx_hybrid_circuits:

PyZX Hybrid Quantum-Classical Circuit Documentation
===================================================

This document showcases PyZX's support for hybrid quantum-classical circuits using the 'ground' feature. This allows modeling of measurements, classical control, and mixed quantum-classical computation within the ZX-calculus framework.

.. contents::
   :local:
   :depth: 3

.. _introduction:

Introduction
============

The 'ground' feature in PyZX represents classical information flow and control, enabling the representation of:

* Quantum measurements that produce classical bits
* Classical control of quantum gates (conditional operations)
* Mixed quantum-classical algorithms
* Teleportation and other protocols involving classical communication

.. _mathematical_foundation_pyzx:

Mathematical Foundation
=======================

In traditional ZX-calculus, graphs model quantum operations using Z and X spiders (nodes) connected by edges. This extends that concept using "grounded" vertices, which represent classical information, such as measurement outcomes or classically controlled operations. By setting ``ground=True`` on certain vertices, PyZX can distinguish quantum behavior from classical control, enabling modeling of hybrid algorithms, such as quantum teleportation, conditional gates, and variational circuits.

Mathematically, grounding a vertex allows it to behave like a classical node in a computational graph, thus mixing quantum operations (unitary evolution) with non-unitary classical branching or feedback.

.. _ground_parameter_fundamentals:

Ground Parameter Fundamentals
=============================

.. _ground_parameter_creation:

Ground Parameter Creation and Analysis
---------------------------------------

This section demonstrates the basic creation and manipulation of ground parameters in PyZX:

.. code-block:: python

    import pyzx as zx
    from pyzx.graph.base import BaseGraph
    from pyzx.graph.graph_s import GraphS
    from pyzx.graph import VertexType, EdgeType
    import math

    def demonstrate_ground_properties():
        """Demo: Explore ground vertex properties and hybrid detection"""
        g = GraphS()

        # Create a mixed circuit with quantum and classical vertices
        v1 = g.add_vertex(VertexType.Z, qubit=0, row=0)
        v2 = g.add_vertex(VertexType.X, qubit=1, row=0)
        v3 = g.add_vertex(VertexType.Z, qubit=2, row=0)

        # Set some vertices as grounded (classical)
        g.set_ground(v1, True)
        g.set_ground(v3, True)

        # Demonstrate ground-related methods
        print(f"Is v1 grounded? {g.is_ground(v1)}")
        print(f"Is v2 grounded? {g.is_ground(v2)}")
        print(f"Ground vertices: {g.grounds()}")
        print(f"Is hybrid circuit? {g.is_hybrid()}")

        # Test ground preservation through graph operations
        g_copy = g.copy()
        g_adjoint = g.adjoint()
        
        # Verify ground status is preserved
        assert g_copy.is_ground(v1) == g.is_ground(v1)
        assert g_adjoint.is_ground(v1) == g.is_ground(v1)
        
        return g

This foundation demonstrates:

* Creating vertices with different types
* Setting ground status on specific vertices
* Querying ground properties
* Verification that ground status is preserved during graph transformations

.. _quantum_error_correction:

Quantum Error Correction with Syndrome Extraction
==================================================

.. _three_qubit_bit_flip:

Three-Qubit Bit-Flip Code Implementation
-----------------------------------------

This example demonstrates a complete 3-qubit bit-flip error correction code within the PyZX framework, specifically highlighting the use of 'ground' parameters for classical syndrome measurements:

.. code-block:: python

    import pyzx as zx
    from pyzx.graph.base import BaseGraph
    from pyzx.graph.graph_s import GraphS
    from pyzx.graph import VertexType, EdgeType
    import math

    def create_bit_flip_error_correction():
        """
        3-qubit bit-flip error correction code with grounded syndrome measurements.
        
        The process involves:
        1. Encoding a single logical qubit into three physical qubits
        2. Introducing a simulated bit-flip error on one physical qubit
        3. Performing syndrome measurements using ancilla qubits
        4. Grounding the ancilla qubits after measurement
        5. Demonstrating graph simplification effects
        """
        
        # Step 1: Create a new ZX graph instance
        g = GraphS()

        # Step 2: Define input and output boundaries for physical and ancilla qubits
        # Physical qubits for encoding/decoding
        in_log = g.add_vertex(VertexType.BOUNDARY, qubit=0, row=0)  # Logical input
        out_log = g.add_vertex(VertexType.BOUNDARY, qubit=0, row=9)  # Logical output

        # Additional physical qubits used in the repetition code
        q1_in = g.add_vertex(VertexType.BOUNDARY, qubit=1, row=0)
        q2_in = g.add_vertex(VertexType.BOUNDARY, qubit=2, row=0)

        q1_out = g.add_vertex(VertexType.BOUNDARY, qubit=1, row=9)
        q2_out = g.add_vertex(VertexType.BOUNDARY, qubit=2, row=9)

        # Ancilla qubits for syndrome measurement
        a0_in = g.add_vertex(VertexType.BOUNDARY, qubit=3, row=0)
        a1_in = g.add_vertex(VertexType.BOUNDARY, qubit=4, row=0)

        a0_out = g.add_vertex(VertexType.BOUNDARY, qubit=3, row=9)
        a1_out = g.add_vertex(VertexType.BOUNDARY, qubit=4, row=9)

        g.set_inputs([in_log, q1_in, q2_in, a0_in, a1_in])
        g.set_outputs([out_log, q1_out, q2_out, a0_out, a1_out])

        # Step 3: Encoding the logical qubit (3-qubit repetition code)
        # Initial state: |psi>_L = |000> + |111>
        # CNOT(Q0, Q1), CNOT(Q0, Q2)
        cn01_ctrl = g.add_vertex(VertexType.Z, qubit=0, row=1)  # Z-spider for CNOT control
        cn01_targ = g.add_vertex(VertexType.X, qubit=1, row=1)  # X-spider for CNOT target
        g.add_edge((in_log, cn01_ctrl), EdgeType.SIMPLE)
        g.add_edge((q1_in, cn01_targ), EdgeType.SIMPLE)  # Q1 starts as |0>
        g.add_edge((cn01_ctrl, cn01_targ), EdgeType.HADAMARD)

        cn02_ctrl = g.add_vertex(VertexType.Z, qubit=0, row=2)
        cn02_targ = g.add_vertex(VertexType.X, qubit=2, row=2)
        g.add_edge((cn01_ctrl, cn02_ctrl), EdgeType.SIMPLE)  # Q0 path continues
        g.add_edge((q2_in, cn02_targ), EdgeType.SIMPLE)  # Q2 starts as |0>
        g.add_edge((cn02_ctrl, cn02_targ), EdgeType.HADAMARD)

        # Connect paths to next stage
        q1_encoded_out = cn01_targ
        q2_encoded_out = cn02_targ
        q0_encoded_out = cn02_ctrl

        # Step 4: Introduce a simulated error (bit-flip on Qubit 1)
        error_q1 = g.add_vertex(VertexType.X, qubit=1, row=3)
        g.add_edge((q1_encoded_out, error_q1), EdgeType.SIMPLE)
        q1_after_error = error_q1
        q0_after_error = q0_encoded_out
        q2_after_error = q2_encoded_out

        # Step 5: Syndrome Measurement (using ancilla qubits)
        # Measure s0 = Q0 XOR Q1 (for error on Q0 or Q1)
        # Measure s1 = Q1 XOR Q2 (for error on Q1 or Q2)

        # Syndrome Measurement 1: s0 = Q0 XOR Q1 -> Ancilla A0
        synd0_ctrl_q0 = g.add_vertex(VertexType.Z, qubit=0, row=4)
        synd0_ctrl_q1 = g.add_vertex(VertexType.Z, qubit=1, row=4)
        synd0_targ_a0 = g.add_vertex(VertexType.X, qubit=3, row=4)

        g.add_edge((q0_after_error, synd0_ctrl_q0), EdgeType.SIMPLE)
        g.add_edge((q1_after_error, synd0_ctrl_q1), EdgeType.SIMPLE)
        g.add_edge((a0_in, synd0_targ_a0), EdgeType.SIMPLE)

        # CNOT operations for syndrome extraction
        g.add_edge((synd0_ctrl_q0, synd0_targ_a0), EdgeType.HADAMARD)
        g.add_edge((synd0_ctrl_q1, synd0_targ_a0), EdgeType.HADAMARD)

        # Syndrome Measurement 2: s1 = Q1 XOR Q2 -> Ancilla A1
        synd1_ctrl_q1 = g.add_vertex(VertexType.Z, qubit=1, row=5)
        synd1_ctrl_q2 = g.add_vertex(VertexType.Z, qubit=2, row=5)
        synd1_targ_a1 = g.add_vertex(VertexType.X, qubit=4, row=5)

        g.add_edge((synd0_ctrl_q1, synd1_ctrl_q1), EdgeType.SIMPLE)
        g.add_edge((q2_after_error, synd1_ctrl_q2), EdgeType.SIMPLE)
        g.add_edge((a1_in, synd1_targ_a1), EdgeType.SIMPLE)

        g.add_edge((synd1_ctrl_q1, synd1_targ_a1), EdgeType.HADAMARD)
        g.add_edge((synd1_ctrl_q2, synd1_targ_a1), EdgeType.HADAMARD)

        # Step 6: Grounding the Ancilla Qubits (Critical for classical processing)
        # This signals that these ancilla qubits have been measured and their
        # quantum information is now classical
        g.set_ground(synd0_targ_a0, True)  # Grounding Ancilla A0
        g.set_ground(synd1_targ_a1, True)  # Grounding Ancilla A1

        # Step 7: Continue with correction/decoding paths
        q0_pre_correct = synd0_ctrl_q0
        q1_pre_correct = synd1_ctrl_q1
        q2_pre_correct = synd1_ctrl_q2

        # Add continuation vertices
        q0_continue = g.add_vertex(VertexType.Z, qubit=0, row=7)
        q1_continue = g.add_vertex(VertexType.Z, qubit=1, row=7)
        q2_continue = g.add_vertex(VertexType.Z, qubit=2, row=7)

        g.add_edge((q0_pre_correct, q0_continue), EdgeType.SIMPLE)
        g.add_edge((q1_pre_correct, q1_continue), EdgeType.SIMPLE)
        g.add_edge((q2_pre_correct, q2_continue), EdgeType.SIMPLE)

        # Step 8: Decoding the logical qubit (reverse of encoding)
        cn01_decode_ctrl = g.add_vertex(VertexType.Z, qubit=0, row=8)
        cn01_decode_targ = g.add_vertex(VertexType.X, qubit=1, row=8)
        g.add_edge((q0_continue, cn01_decode_ctrl), EdgeType.SIMPLE)
        g.add_edge((q1_continue, cn01_decode_targ), EdgeType.SIMPLE)
        g.add_edge((cn01_decode_ctrl, cn01_decode_targ), EdgeType.HADAMARD)

        cn02_decode_ctrl = g.add_vertex(VertexType.Z, qubit=0, row=8)
        cn02_decode_targ = g.add_vertex(VertexType.X, qubit=2, row=8)
        g.add_edge((cn01_decode_ctrl, cn02_decode_ctrl), EdgeType.SIMPLE)
        g.add_edge((q2_continue, cn02_decode_targ), EdgeType.SIMPLE)
        g.add_edge((cn02_decode_ctrl, cn02_decode_targ), EdgeType.HADAMARD)

        # Connect to output boundaries
        g.add_edge((cn02_decode_ctrl, out_log), EdgeType.SIMPLE)
        g.add_edge((cn01_decode_targ, q1_out), EdgeType.SIMPLE)
        g.add_edge((cn02_decode_targ, q2_out), EdgeType.SIMPLE)
        g.add_edge((synd0_targ_a0, a0_out), EdgeType.SIMPLE)
        g.add_edge((synd1_targ_a1, a1_out), EdgeType.SIMPLE)

        return g

    # Usage example
    def demonstrate_error_correction():
        g = create_bit_flip_error_correction()
        
        # Visualize the initial complex circuit
        print("Before simplification:")
        zx.draw(g)
        
        # Apply ZX-calculus simplification rules
        # The grounded vertices enable specific simplifications
        zx.simplify.full_reduce(g)
        
        # Visualize the reduced diagram
        print("After simplification:")
        zx.draw(g)
        
        return g

Key features of this error correction implementation:

* **Syndrome Extraction**: Uses ancilla qubits to measure error syndromes
* **Ground Parameters**: Critical use of grounding to mark classical measurement outcomes
* **Graph Simplification**: Demonstrates how grounding enables ZX-calculus simplifications
* **Classical Control**: Shows how quantum information becomes classical for error correction decisions

.. _adaptive_quantum_algorithms:

Adaptive Quantum Algorithms
============================

.. _dynamic_circuit_measurements:

Dynamic Circuit with Mid-Circuit Measurements
----------------------------------------------

This section demonstrates adaptive quantum algorithms with dynamic circuits that change behavior based on measurement outcomes:

.. code-block:: python

    def create_adaptive_algorithm():
        """
        Adaptive quantum algorithm with mid-circuit measurements and classical control.
        
        Features:
        - Qubit preparation in superposition
        - Mid-circuit measurement with branching logic
        - Classical postprocessing of outcomes
        """
        g = GraphS()
        
        # Define input/output boundaries
        in_q0 = g.add_vertex(VertexType.BOUNDARY, qubit=0, row=0)
        in_q1 = g.add_vertex(VertexType.BOUNDARY, qubit=1, row=0)
        out_q0 = g.add_vertex(VertexType.BOUNDARY, qubit=0, row=10)
        out_q1 = g.add_vertex(VertexType.BOUNDARY, qubit=1, row=10)
        
        g.set_inputs([in_q0, in_q1])
        g.set_outputs([out_q0, out_q1])
        
        # Step 1: Prepare qubit in superposition
        h_prep_z = g.add_vertex(VertexType.Z, qubit=0, row=1, phase=0)
        h_prep_x = g.add_vertex(VertexType.X, qubit=0, row=1.1, phase=0)
        g.add_edge((in_q0, h_prep_z), EdgeType.SIMPLE)
        g.add_edge((h_prep_z, h_prep_x), EdgeType.HADAMARD)
        
        # Step 2: First measurement (adaptive step)
        meas1 = g.add_vertex(VertexType.Z, qubit=0, row=2)
        g.add_edge((h_prep_x, meas1), EdgeType.SIMPLE)
        g.set_ground(meas1, True)  # Classical measurement outcome
        
        # Step 3: Conditional operations based on measurement
        # Branch 1: If measured 0, do nothing (identity path)
        identity_path = g.add_vertex(VertexType.Z, qubit=0, row=3, phase=0)
        g.add_edge((meas1, identity_path), EdgeType.SIMPLE)
        
        # Branch 2: If measured 1, apply complex rotation sequence
        rotation_sequence = g.add_vertex(VertexType.Z, qubit=0, row=4, phase=math.pi/4)
        g.add_edge((meas1, rotation_sequence), EdgeType.SIMPLE)
        
        # Additional rotation in the complex sequence
        complex_rot = g.add_vertex(VertexType.X, qubit=0, row=5, phase=math.pi/3)
        g.add_edge((rotation_sequence, complex_rot), EdgeType.SIMPLE)
        
        # Reconverge paths
        reconverge = g.add_vertex(VertexType.Z, qubit=0, row=6)
        g.add_edge((identity_path, reconverge), EdgeType.SIMPLE)
        g.add_edge((complex_rot, reconverge), EdgeType.SIMPLE)
        
        # Step 4: Second measurement for further adaptation
        meas2 = g.add_vertex(VertexType.Z, qubit=0, row=7)
        g.add_edge((reconverge, meas2), EdgeType.SIMPLE)
        g.set_ground(meas2, True)  # Second classical outcome
        
        # Step 5: Final processing based on both measurements
        final_processing = g.add_vertex(VertexType.Z, qubit=0, row=8, phase=math.pi/6)
        g.add_edge((meas2, final_processing), EdgeType.SIMPLE)
        
        # Connect auxiliary qubit path
        aux_path = g.add_vertex(VertexType.Z, qubit=1, row=4)
        g.add_edge((in_q1, aux_path), EdgeType.SIMPLE)
        
        # Entanglement for correlation
        entangle_ctrl = g.add_vertex(VertexType.Z, qubit=0, row=9)
        entangle_targ = g.add_vertex(VertexType.X, qubit=1, row=9)
        g.add_edge((final_processing, entangle_ctrl), EdgeType.SIMPLE)
        g.add_edge((aux_path, entangle_targ), EdgeType.SIMPLE)
        g.add_edge((entangle_ctrl, entangle_targ), EdgeType.HADAMARD)
        
        # Connect to outputs
        g.add_edge((entangle_ctrl, out_q0), EdgeType.SIMPLE)
        g.add_edge((entangle_targ, out_q1), EdgeType.SIMPLE)
        
        return g

This adaptive algorithm demonstrates:

* **Dynamic Branching**: Circuit behavior changes based on measurement outcomes
* **Multiple Measurements**: Sequential measurements for progressive adaptation
* **Classical Control**: Ground parameters enable classical decision making
* **Hybrid Processing**: Combination of quantum operations and classical logic

.. _quantum_machine_learning_pipeline:

Quantum Machine Learning Pipeline
=================================

.. _basic_qml_circuit:

Basic QML Circuit with Hybrid Processing
-----------------------------------------

This example demonstrates a simplified Quantum Machine Learning circuit focusing on hybrid quantum-classical processing:

.. code-block:: python

    def create_basic_qml_circuit():
        """
        Basic QML circuit with classical feature encoding and measurement.
        
        Demonstrates:
        - Classical data encoding into quantum states
        - Parameterized quantum circuit (PQC)
        - Quantum measurement with classical output
        - Ground parameters for classical optimization feedback
        """
        g = GraphS()

        # Define input and output boundaries for two qubits
        in0 = g.add_vertex(VertexType.BOUNDARY, qubit=0, row=0)  # Data qubit
        in1 = g.add_vertex(VertexType.BOUNDARY, qubit=1, row=0)  # Auxiliary qubit
        out0 = g.add_vertex(VertexType.BOUNDARY, qubit=0, row=6)
        out1 = g.add_vertex(VertexType.BOUNDARY, qubit=1, row=6)

        g.set_inputs([in0, in1])
        g.set_outputs([out0, out1])

        # Step 1: Data Encoding Layer (Hadamard decomposition)
        h_encode_z = g.add_vertex(VertexType.Z, qubit=0, row=1, phase=0)
        h_encode_x = g.add_vertex(VertexType.X, qubit=0, row=1.1, phase=0)
        g.add_edge((in0, h_encode_z), EdgeType.SIMPLE)
        g.add_edge((h_encode_z, h_encode_x), EdgeType.HADAMARD)

        # Step 2: Parameterized Quantum Circuit (PQC) Layer
        # Rz rotation on Qubit 0 (trainable parameter)
        rz0_1 = g.add_vertex(VertexType.Z, qubit=0, row=2, phase=math.pi / 3)
        g.add_edge((h_encode_x, rz0_1), EdgeType.SIMPLE)

        # Rz rotation on Qubit 1 (trainable parameter)
        rz1_1 = g.add_vertex(VertexType.Z, qubit=1, row=1, phase=math.pi / 2)
        g.add_edge((in1, rz1_1), EdgeType.SIMPLE)

        # CNOT gate for entanglement
        cnot_ctrl = g.add_vertex(VertexType.Z, qubit=0, row=3)
        cnot_targ = g.add_vertex(VertexType.X, qubit=1, row=3)
        g.add_edge((rz0_1, cnot_ctrl), EdgeType.SIMPLE)
        g.add_edge((rz1_1, cnot_targ), EdgeType.SIMPLE)
        g.add_edge((cnot_ctrl, cnot_targ), EdgeType.HADAMARD)

        # Another parameterized rotation
        rz0_2 = g.add_vertex(VertexType.Z, qubit=0, row=4, phase=math.pi / 6)
        g.add_edge((cnot_ctrl, rz0_2), EdgeType.SIMPLE)

        # Step 3: Observable Measurement and Grounding
        meas_q0 = g.add_vertex(VertexType.Z, qubit=0, row=5)
        g.add_edge((rz0_2, meas_q0), EdgeType.SIMPLE)

        # Critical: Ground the measurement for classical processing
        g.set_ground(meas_q0, True)

        # Connect paths to outputs
        g.add_edge((cnot_targ, out1), EdgeType.SIMPLE)
        g.add_edge((meas_q0, out0), EdgeType.SIMPLE)

        return g

.. _advanced_qml_measurements:

Advanced QML with Mid-Circuit Measurements
-------------------------------------------

This extended QML example demonstrates advanced patterns with multiple measurements and classical control:

.. code-block:: python

    def create_advanced_qml_circuit():
        """
        Advanced QML circuit with sequential and parallel measurements.
        
        Features:
        - Sequential measurements with feed-forward control
        - Parallel measurements with joint classical processing
        - Multiple PQC layers with adaptive parameters
        """
        g = GraphS()

        # Define boundaries
        in0 = g.add_vertex(VertexType.BOUNDARY, qubit=0, row=0)
        in1 = g.add_vertex(VertexType.BOUNDARY, qubit=1, row=0)
        out0 = g.add_vertex(VertexType.BOUNDARY, qubit=0, row=12)
        out1 = g.add_vertex(VertexType.BOUNDARY, qubit=1, row=12)

        g.set_inputs([in0, in1])
        g.set_outputs([out0, out1])

        # Data Encoding Layer
        h_encode_z = g.add_vertex(VertexType.Z, qubit=0, row=1, phase=0)
        h_encode_x = g.add_vertex(VertexType.X, qubit=0, row=1.1, phase=0)
        g.add_edge((in0, h_encode_z), EdgeType.SIMPLE)
        g.add_edge((h_encode_z, h_encode_x), EdgeType.HADAMARD)
        q0_curr = h_encode_x
        q1_curr = in1

        # First PQC Layer
        rz0_1 = g.add_vertex(VertexType.Z, qubit=0, row=2, phase=math.pi / 4)
        g.add_edge((q0_curr, rz0_1), EdgeType.SIMPLE)
        q0_curr = rz0_1

        rz1_1 = g.add_vertex(VertexType.Z, qubit=1, row=2, phase=math.pi / 3)
        g.add_edge((q1_curr, rz1_1), EdgeType.SIMPLE)
        q1_curr = rz1_1

        cnot1_ctrl = g.add_vertex(VertexType.Z, qubit=0, row=3)
        cnot1_targ = g.add_vertex(VertexType.X, qubit=1, row=3)
        g.add_edge((q0_curr, cnot1_ctrl), EdgeType.SIMPLE)
        g.add_edge((q1_curr, cnot1_targ), EdgeType.SIMPLE)
        g.add_edge((cnot1_ctrl, cnot1_targ), EdgeType.HADAMARD)
        q0_curr = cnot1_ctrl
        q1_curr = cnot1_targ

        # Mid-Circuit Measurement 1 (Sequential Control)
        mcm1_q0 = g.add_vertex(VertexType.Z, qubit=0, row=4)
        g.add_edge((q0_curr, mcm1_q0), EdgeType.SIMPLE)
        g.set_ground(mcm1_q0, True)  # Classical outcome for feed-forward

        # Conditional Gates (Feed-Forward Logic)
        cond_gate1_q0 = g.add_vertex(VertexType.Z, qubit=0, row=5, phase=math.pi / 8)
        g.add_edge((mcm1_q0, cond_gate1_q0), EdgeType.SIMPLE)

        cond_gate2_q0 = g.add_vertex(VertexType.X, qubit=0, row=5)
        g.add_edge((mcm1_q0, cond_gate2_q0), EdgeType.SIMPLE)

        # Reconverge paths
        q0_reconverge = g.add_vertex(VertexType.Z, qubit=0, row=6)
        g.add_edge((cond_gate1_q0, q0_reconverge), EdgeType.SIMPLE)
        g.add_edge((cond_gate2_q0, q0_reconverge), EdgeType.SIMPLE)
        q0_curr = q0_reconverge

        # Second PQC Layer
        cnot2_ctrl = g.add_vertex(VertexType.Z, qubit=0, row=7)
        cnot2_targ = g.add_vertex(VertexType.X, qubit=1, row=7)
        g.add_edge((q0_curr, cnot2_ctrl), EdgeType.SIMPLE)
        g.add_edge((q1_curr, cnot2_targ), EdgeType.SIMPLE)
        g.add_edge((cnot2_ctrl, cnot2_targ), EdgeType.HADAMARD)
        q0_curr = cnot2_ctrl
        q1_curr = cnot2_targ

        # Parallel Mid-Circuit Measurements (Joint Classical Processing)
        mcm2_q0 = g.add_vertex(VertexType.Z, qubit=0, row=8)
        mcm2_q1 = g.add_vertex(VertexType.Z, qubit=1, row=8)

        g.add_edge((q0_curr, mcm2_q0), EdgeType.SIMPLE)
        g.add_edge((q1_curr, mcm2_q1), EdgeType.SIMPLE)

        # Ground both measurements for joint classical processing
        g.set_ground(mcm2_q0, True)
        g.set_ground(mcm2_q1, True)

        # Connect to outputs
        g.add_edge((mcm2_q0, out0), EdgeType.SIMPLE)
        g.add_edge((mcm2_q1, out1), EdgeType.SIMPLE)

        return g

QML features demonstrated:

* **Hybrid Architecture**: Classical encoding, quantum processing, classical output
* **Parameterized Circuits**: Trainable quantum parameters for optimization
* **Feed-Forward Control**: Classical measurement outcomes control subsequent quantum gates
* **Joint Processing**: Multiple measurement outcomes processed together classically
* **Variational Structure**: Circuit structure suitable for gradient-based optimization

