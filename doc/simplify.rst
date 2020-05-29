Optimising and simplifying circuits
===================================

The main functionality of PyZX is the ability to optimise quantum circuits. The main optimisation methods work by converting a circuit into a ZX-diagram, simplifying this diagram, and then converting it back into a quantum circuit. This process is explained in the next section. There are also some basic optimisation methods that work directly on the quantum circuit representation. This is detailed in the section `Gate-level optimisation`_.

Optimising circuits using the ZX-calculus
-----------------------------------------

PyZX allows the simplification of quantum circuits via a translation to the ZX-calculus. To demonstrate this functionality, let us generate a random circuit using :func:`~pyzx.generate.CNOT_HAD_PHASE_circuit`::

	c = zx.generate.CNOT_HAD_PHASE_circuit(qubits=8, depth=100)
	print(c.stats())

To use the ZX-diagram simplification routines, the circuit must first be converted to a ZX-diagram::

	g = c.to_graph()

We can now use any of the built-in simplification strategies for ZX-diagrams. The most powerful of these is :func:`~pyzx.simplify.full_reduce`::

	zx.full_reduce(g, quiet=False) # simplifies the Graph in-place, and show the rewrite steps taken.
	g.normalise() # Makes the graph more suitable for displaying
	zx.draw(g) # Display the resulting diagram

This rewrite strategy implements a variant of the algorithm described in `this paper <https://arxiv.org/abs/1903.10477>`__.
The resulting diagram most-likely does not resemble the structure of a circuit. In order to extract an equivalent circuit from the diagram, we use the function :func:`~pyzx.extract.extract_circuit`.

Simply use it like so::

	c_opt = zx.extract_circuit(g.copy())

For some circuits, :func:`~pyzx.extract.extract_circuit` can result in quite large circuits involving many CNOT gates. If one is only interested in optimising the T-count of a circuit, the extraction stage can be skipped by using the *phase-teleportation* method of `this paper <https://arxiv.org/abs/1903.10477>`__. This applies ``full_reduce`` in such a way that only phases are moved around the circuit, and all other structure remains intact::

	g = c.to_graph()
	zx.teleport_reduce(g)
	c_opt = zx.Circuit.from_graph(g) # This function is able to reconstruct a Circuit from a Graph that looks sufficiently like a Circuit

Circuit equality verification
-----------------------------

In order to verify that the simplified circuit is equal to the original, PyZX supplies two different methods. 
For circuits on a small number of qubits (generally less than 10) PyZX allows for the direct calculation of the linear maps that the circuits implement. 
These can then be checked for equality::

	zx.compare_tensors(c,c_opt) # Returns True if c and c_opt implement the same circuit (up to global phase)

You can also inspect the linear map itself by calling :meth:`c.to_matrix() <pyzx.circuit.Circuit.to_matrix>`. 
For larger circuits calculating the linear map directly is not feasible. 
For those circuits PyZX allows you to check equality of the circuits using the built-in ZX-diagram rewrite strategy. 
This is done by composing one circuit with the adjoint of the other and simplifying the resulting circuit. 
If this is reducable to the identity, this is strong evidence that the circuits indeed implement the same unitary::

	c.verify_equality(c_opt) # Returns True if full_reduce() is able to reduce the composition of the circuits to the identity.


Gate-level optimisation
-----------------------

Besides the advanced simplification strategies based on the ZX-calculus, PyZX also supplies some optimisation methods that work directly on :class:`~pyzx.circuit.Circuit`\ s. The most straightforward of these is :func:`~pyzx.optimize.basic_optimization`.

A more advanced optimisation technique involves splitting up the circuit into `phase polynomial <https://arxiv.org/abs/1303.2042>`_ subcircuits, optimising each of these, and then resynthesising the circuit, which can be done using :func:`~pyzx.optimize.phase_block_optimize`.

The :func:`~pyzx.optimize.basic_optimization` and :func:`~pyzx.optimize.phase_block_optimize` functions are also combined into a single function :func:`~pyzx.optimize.full_optimize`.