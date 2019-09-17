Getting Started
===============

.. _gettingstarted:

The best way to get started if you have cloned the repository is to run the `Getting Started notebook <https://github.com/Quantomatic/pyzx/blob/master/demos/gettingstarted.ipynb>`_ in Jupyter. If you have a Microsoft account, then you can use Azure to run `this notebook <https://notebooks.azure.com/johnie102/libraries/pyzx/html/demos/gettingstarted.ipynb>`_ in your browser without having downloaded PyZX. If you don't want to follow those routes: this document contains the same general information.

With PyZX you can create and simplify quantum circuits. Start by importing the library::
	
	>>> import pyzx as zx

Then you can get a randomly generated Clifford circuit::
	
	>>> circuit = zx.generate.cliffords(5, 15)

Here ``5`` is the number of qubits the circuit acts on, and ``15`` is the depth of the generated circuit. We can visualise the circuit::
	
	>>> zx.draw(circuit)

.. figure::  _static/clifford.png
   :align:   center

We can also reduce the circuit using the rules from ZX-calculus::
	
	>>> g = circuit.copy()
	>>> zx.simplify.clifford_simp(g)  # simplifies the circuit
	>>> g.normalise()  # makes it more presentable
	>>> zx.draw(g)

.. figure::  _static/clifford_simp.png
   :align:   center

   The same circuit, but rewritten into a more compact form. The blue lines represent edges which have a Hadamard gate on them.

The circuit is represented internally as a graph::
	
	>>> print(g)
	Graph(16 vertices, 21 edges)


This simplified ZX-graph no longer looks like a circuit. PyZX supplies some methods for turning a ZX-graph back into a circuit::
	
	>>> c = zx.extract.streaming_extract(g.copy())
	>>> zx.draw(c)

.. figure::  _static/clifford_extracted.png
   :align:   center

To verify that the simplified circuit is still equal to the original we can convert them to numpy tensors and compare equality directly::
	
	>>> t1 = c.to_tensor()
	>>> t2 = g.to_tensor()
	>>> zx.compare_tensors(t1,t2,preserve_scalar=False)
		True

We can also inspect `c` as a series of gates::
	
	>>> print(c.gates)
		[S(1), S*(2), Z(3), CZ(1,3), CZ(2,3), S(0), CZ(1,0), CZ(3,0), CNOT(1,0), CNOT(2,0), CNOT(3,0), CNOT(2,3), CNOT(0,3), NOT(2), CX(2,3), HAD(3)]

And we can represent this circuit in one of several circuit description languages, such as that of QUIPPER::
	
	>>> print(c.to_quipper())
	Inputs: 0Qbit, 1Qbit, 2Qbit, 3Qbit
	QGate["S"](1) with nocontrol
	QGate["S"]*(2) with nocontrol
	QGate["Z"](3) with nocontrol
	QGate["Z"](3) with controls=[+1] with nocontrol
	QGate["Z"](3) with controls=[+2] with nocontrol
	QGate["S"](0) with nocontrol
	QGate["Z"](0) with controls=[+1] with nocontrol
	QGate["Z"](0) with controls=[+3] with nocontrol
	QGate["not"](0) with controls=[+1] with nocontrol
	QGate["not"](0) with controls=[+2] with nocontrol
	QGate["not"](0) with controls=[+3] with nocontrol
	QGate["not"](3) with controls=[+2] with nocontrol
	QGate["not"](3) with controls=[+0] with nocontrol
	QGate["not"](2) with nocontrol
	QGate["X"](3) with controls=[+2] with nocontrol
	QGate["H"](3) with nocontrol
	Outputs: 0Qbit, 1Qbit, 2Qbit, 3Qbit

Optimising random circuits is of course not very useful, so let us do some optimisation on a predefined circuit::

	>>> c = zx.Circuit.load('circuits/Fast/mod5_4_before')  # Circuit.load auto-detects the file format
	>>> print(c.gates)  #  This circuit is built out of CCZ gates.
	[NOT(4), HAD(4), CCZ(c1=0,c2=3,t=4), CCZ(c1=2,c2=3,t=4), HAD(4), CNOT(3,4), HAD(4), CCZ(c1=1,c2=2,t=4), HAD(4), CNOT(2,4), HAD(4), CCZ(c1=0,c2=1,t=4), HAD(4), CNOT(1,4), CNOT(0,4)]
	>>> c = c.to_basic_gates()  #  Convert it to the Clifford+T gate set.
	>>> print(c.gates)
	[NOT(4), HAD(4), CNOT(3,4), T*(4), CNOT(0,4), T(4), CNOT(3,4), T*(4), CNOT(0,4), T(3), T(4), HAD(4), CNOT(0,3), T(0), T*(3), CNOT(0,3), HAD(4), CNOT(3,4), T*(4), CNOT(2,4), T(4), CNOT(3,4), T*(4), CNOT(2,4), T(3), T(4), HAD(4), CNOT(2,3), T(2), T*(3), CNOT(2,3), HAD(4), HAD(4), CNOT(3,4), HAD(4), CNOT(2,4), T*(4), CNOT(1,4), T(4), CNOT(2,4), T*(4), CNOT(1,4), T(2), T(4), HAD(4), CNOT(1,2), T(1), T*(2), CNOT(1,2), HAD(4), HAD(4), CNOT(2,4), HAD(4), CNOT(1,4), T*(4), CNOT(0,4), T(4), CNOT(1,4), T*(4), CNOT(0,4), T(1), T(4), HAD(4), CNOT(0,1), T(0), T*(1), CNOT(0,1), HAD(4), HAD(4), CNOT(1,4), CNOT(0,4)]
	>>> print(c.stats())
	Circuit mod5_4_before on 5 qubits with 71 gates.
		28 is the T-count
		43 Cliffords among which
		28 2-qubit gates and 14 Hadamard gates.
	>>> g = c.to_graph()
	>>> print(g)
	Graph(109 vertices, 132 edges)
	>>> zx.simplify.full_reduce(g)  # Simplify the ZX-graph
	>>> print(g)
	Graph(31 vertices, 38 edges)
	>>> c2 = zx.extract.streaming_extract(g).to_basic_gates()  # Turn graph back into circuit
	>>> print(c2.stats())
	Circuit  on 5 qubits with 42 gates.
		8 is the T-count
		34 Cliffords among which
		24 2-qubit gates and 10 Hadamard gates.
	>>> c3 = zx.optimize.full_optimize(c2)  #  Do some further optimization on the circuit
	>>> print(c3.stats())
	Circuit  on 5 qubits with 27 gates.
		8 is the T-count
		19 Cliffords among which
		14 2-qubit gates and 2 Hadamard gates.

The circuit file-formats supported by ``Circuit.load`` are curently *qasm*, *qc* or *quipper*. 
PyZX can also be run from the command-line for some easy circuit-to-circuit manipulation. In order to optimise a circuit you can run the command::
	
	python -m pyzx opt input_circuit.qasm

For more information regarding the command-line tools, run ``python -m pyzx --help``.

This concludes this tutorial. For more information about the simplification procedures see :ref:`simplify`. Information regarding the circuit extraction can be found in :ref:`extract`. The different representations of the graphs and circuits is detailed in :ref:`representations`. The low level graph api is explained in :ref:`graph`.