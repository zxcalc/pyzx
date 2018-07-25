Getting Started
===============

.. _gettingstarted:

The best way to get started is to run the `Getting Started Notebook <_static/gettingstarted.ipynb>`_ in Jupyter. If you have a Microsoft account, then you can use Azure to run `this notebook <https://notebooks.azure.com/johnie102/libraries/pyzx/html/demos/gettingstarted.ipynb>`_ in your browser without having downloaded PyZX. If you don't want to follow those routes: this document contains the same general information.

With PyZX you can create and simplify quantum circuits. Start by importing the library::
	
	>>> import pyzx as zx

Then you can get a randomly generated Clifford circuit::
	
	>>> circuit = zx.generate.cliffords(5, 10)

Here ``5`` is the number of qubits the circuit acts on, and ``10`` is the depth of the generated circuit. We can visualise the circuit::
	
	>>> zx.draw(circuit)

.. figure::  _static/clifford.png
   :align:   center

We can also reduce the circuit using the rules from ZX-calculus::
	
	>>> zx.simplify.clifford_simp(circuit)  # simplifies the circuit
	>>> circuit.normalise()  # makes it more presentable
	>>> zx.draw(circuit)

.. figure::  _static/clifford_simp.png
   :align:   center

   The same circuit, but rewritten into a more compact form. The blue lines represent edges which have a Hadamard gate on them.

The circuit is represented internally as a graph::
	
	>>> print(circuit)
	Graph(40 vertices, 38 edges)


This simplified ZX-graph no longer looks like a circuit. PyZX supplies some methods for turning a ZX-graph back into a circuit::
	
	>>> zx.drawing.pack_circuit_rows(circuit)
	>>> zx.extract.clifford_extract(circuit,1,2)
	>>> zx.draw(circuit)