Getting Started
===============

With PyZX you can create and simplify quantum circuits. Start by importing the library::
	
	import pyzx as zx

Then you can get a randomly generated Clifford circuit::
	
	circuit = zx.cliffords(5, 10)

Here ``5`` is the number of qubits the circuit acts on, and ``10`` is the depth of the generated circuit.