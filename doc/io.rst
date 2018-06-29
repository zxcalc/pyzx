Importing and Exporting graphs
==================================

PyZX allows importing of quantum circuits or ZX-graphs from a few different sources. It can currently import quantum circuits encoded in the ASCII format of `Quipper <https://www.mathstat.dal.ca/~selinger/quipper/>`_ (although note that currently only a subset of the full notation is supported). It can also import and export the JSON format of `Quantomatic <https://quantomatic.github.io/>`_, and furthermore using functionality of quanto_ it is fully integrated with it. There is also some functionality to turn graphs into a numpy tensor_.

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

.. automodule:: pyzx.tensor
   :members: