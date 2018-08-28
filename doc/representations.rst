.. _representations:

Representations of quantum circuits and ZX-Graphs
=================================================

There are a few standards being used for representing quantum circuits. The ones currently supported by PyZX are `QASM <https://en.wikipedia.org/wiki/OpenQASM>`_ and the ASCII format of `Quipper <https://www.mathstat.dal.ca/~selinger/quipper/>`_. Using the class :class:`~pyzx.circuit.Circuit`, files from these formats can be imported and converted into ZX-graphs. Vice versa, circuit-like ZX-graphs can be converted into circuits which can then be saved in the formats of QASM and QUIPPER. ZX-graphs can also be converted into the json format of `Quantomatic <https://quantomatic.github.io/>`_ using functions supplied in io_. This allows PyZX to interface with Quantomatic; see the section on methods in quanto_ for more details. Finally, ZX-graphs can be converted into NumPy tensors with the functions supplied in tensor_ to allow easy verification of equality between two ZX-graphs.


.. module:: circuit

.. _circuit:

Contents of ``circuit``
-------------------------

.. autoclass:: pyzx.circuit.Circuit
   :members:


.. module:: io

.. _io:

Contents of ``io``
------------------------

.. automodule:: pyzx.io
   :members:

.. _quanto:

.. module:: quantomatic

Contents of ``quantomatic``
---------------------------

.. automodule:: pyzx.quantomatic
   :members:


.. _tensor:

Contents of ``tensor``
----------------------

This module provides methods for converting ZX-graphs into numpy tensors and using these tensors to test semantic equality of ZX-graphs. This module is not meant as an efficient quantum simulator. Due to the way the tensor is calculated it can only handle circuits of small size before running out of memory on a regular machine. Currently, it can reliably transform 7 qubit circuits into tensors. If the ZX-diagram is not circuit-like, but instead has nodes with high degree, it will run out of memory even sooner.

.. automodule:: pyzx.tensor
   :members: