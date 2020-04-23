## PyZX

[![Unitary Fund](https://img.shields.io/badge/Supported%20By-UNITARY%20FUND-brightgreen.svg?style=for-the-badge)](http://unitary.fund)

PyZX (pronounce as *Pisics*) is a **Py**thon tool implementing the theory of **ZX**-calculus for the creation, visualisation, and automated rewriting of large-scale quantum circuits. Please watch [this 2-minute video](https://www.youtube.com/watch?v=iC-KVdB8pf0) for a short introduction.

PyZX currently allows you to:

* Read in quantum circuits in the file format of [QASM](https://en.wikipedia.org/wiki/OpenQASM), [Quipper](https://www.mathstat.dal.ca/~selinger/quipper/doc/) or [Quantomatic](https://quantomatic.github.io/).
* Rewrite circuits into a pseudo-normal form using the ZX-calculus.
* Extract new simplified circuits from these reduced graphs.
* Visualise the ZX-graphs and rewrites using either [Matplotlib](https://matplotlib.org/), Quantomatic or as a TikZ file for use in LaTeX documents.
* Output the optimised circuits in QASM, QC or QUIPPER format.

You can try out the in-browser demo which shows some of these features [here](http://zxcalculus.com/pyzx.html).

## About the ZX-calculus

ZX-diagrams are a type of tensor network built out of combinations of linear maps known as *spiders*. There are 2 types of spiders: the Z-spiders (represented as green dots in PyZX) and the X-spiders (represented as red dots). Every linear map between some set of qubits can be represented by a ZX-diagram.
The ZX-calculus is a set of rewrite rules for ZX-diagrams. There are various extensive set of rewrite rules. PyZX however, uses only rewrite rules concerning the Clifford fragment of the ZX-calculus. Importantly, this set of rewrite rules is *complete* for Clifford diagrams, meaning that two representations of a Clifford map can be rewritten into one another if and only if the two linear maps they represent are equal.

[Here](http://zxcalculus.com) is a website with resources and information about the ZX-calculus. For a short introduction to the ZX-calculus see [this paper](https://arxiv.org/abs/1602.04744) while for a complete overview we recommend [this book](https://www.amazon.com/Picturing-Quantum-Processes-Diagrammatic-Reasoning/dp/110710422X). PyZX extensively uses two derived rewrite rules known as *local complementation* and *pivoting*. More information about these operations can be found in [this paper](https://arxiv.org/abs/1307.7048).


## Installation

If you wish to use PyZX as a Python module for use in other projects, we recommend installing via pip:
```pip install pyzx```

If you want to use the demos or the benchmark circuits you should install PyZX from source by cloning the git repository.

PyZX has no strict dependencies, although some functionality requires numpy. PyZX is built to interact well with Jupyter, so we additionally recommend you have Jupyter and matplotlib installed.

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

PyZX can also be run from the commandline. To optimise a circuit you can for instance run
```python -m pyzx opt input_circuit.qasm```

## Attribution

If you wish to cite PyZX in an academic work, please cite the [accompanying paper](https://arxiv.org/abs/1904.04735):
<pre>
  @article{kissinger2019pyzx,
    title={Pyzx: Large scale automated diagrammatic reasoning},
    author={Kissinger, Aleks and van de Wetering, John},
    journal={arXiv preprint arXiv:1904.04735},
    year={2019}
  }
</pre>

Here's a plane that says PYZX:
![PYZX](https://github.com/Quantomatic/pyzx/raw/master/F-PYZX.jpg)
