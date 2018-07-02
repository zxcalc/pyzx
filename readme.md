## PyZX

PyZX (pronounce as *Pisics*) is a **Py**thon tool implementing the theory of **ZX**-calculus for the creation, visualisation, and automated rewriting of large-scale quantum circuits.

It currently allows you to:

* Generate random quantum circuits containing millions of gates.
* Rewrite circuits into a pseudo-normal form using the ZX-calculus.
* Extract new simplified circuits from these reduced graphs.
* Read in quantum circuits in the file format of [Quipper](https://www.mathstat.dal.ca/~selinger/quipper/doc/) or [Quantomatic](https://quantomatic.github.io/).
* Visualize the ZX-graphs and rewrites using either [Matplotlib](https://matplotlib.org/) or Quantomatic.


## Installation

The core of PyZX is Pure Python and will run on Python 2.7 or 3.x without any additional dependencies. To get the most out of it however, you should install ``matplotlib`` and ``numpy``. If [python-igraph](http://igraph.org/python/) is installed it can be used to speed up some operations.


## Usage

If you have [Jupyter](https://jupyter.org/) installed you can use one of the demo's for an illustration of what PyZX can do. For instance:

```python
import pyzx as zx
qubit_amount = 5
gate_count = 40
#Generate random circuit of Clifford gates
circuit = zx.cliffords(qubit_amount, gate_count)
#If running in Jupyter, draw the circuit
zx.draw(circuit)
#Use one of the built-in rewriting strategies to simplify the circuit
zx.clifford_simp(circuit)
#See the result
zx.draw(circuit)
```