## PyZX

[![Unitary Fund](https://img.shields.io/badge/Supported%20By-UNITARY%20FUND-brightgreen.svg?style=for-the-badge)](http://unitary.fund)

PyZX (pronounce as *Pisics*) is a **Py**thon tool implementing the theory of **ZX**-calculus for the creation, visualisation, and automated rewriting of large-scale quantum circuits.

It currently allows you to:

* Generate random quantum circuits containing millions of gates.
* Rewrite circuits into a pseudo-normal form using the ZX-calculus.
* Extract new simplified circuits from these reduced graphs.
* Read in quantum circuits in the file format of [QASM](https://en.wikipedia.org/wiki/OpenQASM), [Quipper](https://www.mathstat.dal.ca/~selinger/quipper/doc/) or [Quantomatic](https://quantomatic.github.io/).
* Visualize the ZX-graphs and rewrites using either [Matplotlib](https://matplotlib.org/), Quantomatic or generate TikZ output for use in LaTeX documents.
* Output the optimized circuits in QASM, QC or QUIPPER format.

## About the ZX-calculus

ZX-diagrams are a type of tensor network built out of combinations of linear maps known as *spiders*. There are 2 types of spiders: the Z-spiders (represented as green dots in PyZX) and the X-spiders (represented as red dots). Every linear map between some set of qubits can be represented by a ZX-diagram.
The ZX-calculus is a set of rewrite rules for ZX-diagrams. There are various extensive set of rewrite rules. PyZX however, uses only rewrite rules concerning the Clifford fragment of the ZX-calculus. Importantly, this set of rewrite rules is *complete* for Clifford diagrams meaning that two representations of a Clifford map can be rewritten into one another if and only if the two linear maps they represent are equal.

For a short introduction to the ZX-calculus see [this paper](https://arxiv.org/abs/1602.04744) while for a complete overview we recommend [this book](https://www.amazon.com/Picturing-Quantum-Processes-Diagrammatic-Reasoning/dp/110710422X). PyZX extensively uses two derived rewrite rules known as *local complementation* and *pivoting*. More information about these operations can be found in [this paper](https://arxiv.org/abs/1307.7048).


## Installation

To install pyzx from source, clone this repository, `cd` into it, and run:
```
pip install -e .
```


## Usage

See the [Documentation](https://pyzx.readthedocs.io/en/latest/) for a full overview of the features of PyZX.

If you have [Jupyter](https://jupyter.org/) installed you can use one of the demonstration notebooks in the demos folder for an illustration of what PyZX can do.

This is some example Python code for generating a random circuit, optimizing it, and finally displaying it:

```python
import pyzx as zx
qubit_amount = 5
gate_count = 80
#Generate random circuit of Clifford gates
circuit = zx.generate.cliffordT(qubit_amount, gate_count)
#If running in Jupyter, draw the circuit
zx.draw(circuit)
#Use one of the built-in rewriting strategies to simplify the circuit
zx.simplify.full_reduce(circuit)
#See the result
zx.draw(circuit)
```