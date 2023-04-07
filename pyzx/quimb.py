# PyZX - Python library for quantum circuit rewriting 
#        and optimization using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import math
from typing import Any
import numpy as np
import importlib

# try:
#     import quimb as qu # type:ignore
#     import quimb.tensor as qtn #type:ignore
# except ImportError:

# load quimb modules on first call to to_quimb_tensor
qu = None
qtn = None

from .utils import EdgeType, VertexType
from .graph.base import BaseGraph
from .simplify import to_gh


def to_quimb_tensor(g: BaseGraph) -> "qtn.TensorNetwork": # type:ignore
    """Converts tensor network representing the given :func:`pyzx.graph.Graph`.
    Pretty printing: to_tensor(g).draw(color = ['V', 'H'])
    
    Args:
        g: graph to be converted."""

    global qu, qtn
    if qu is None:
        qu = importlib.import_module('quimb')
        qtn = importlib.import_module('quimb.tensor')

    # copying a graph guarantees consecutive indices, which are needed for the tensor net
    g = g.copy()

    # only Z spiders are handled below
    to_gh(g)
    
    tensors = []

    # Here we have phase tensors corresponding to Z-spiders with only one output and no input.
    for v in g.vertices():
        if g.type(v) == VertexType.Z and g.phase(v) != 0:
            tensors.append(qtn.Tensor(data = [1, np.exp(1j * np.pi * g.phase(v))],
                                      inds = (f'{v}',),
                                      tags = ("V",)))
    

    # Hadamard or Kronecker tensors, one for each edge of the diagram.
    for i, edge in enumerate(g.edges()):
        x, y = edge
        isHadamard = g.edge_type(edge) == EdgeType.HADAMARD
        t = qtn.Tensor(data = qu.hadamard() if isHadamard else np.array([1, 0, 0, 1]).reshape(2, 2),
                       inds = (f'{x}', f'{y}'),
                       tags = ("H",) if isHadamard else ("N",))
        tensors.append(t)

    # TODO: This is not taking care of all the stuff that can be in g.scalar
    # In particular, it doesn't check g.scalar.phasenodes
    # TODO: This will give the wrong tensor when g.scalar.is_zero == True.
    # Grab the float factor and exponent from the scalar
    scalar_float = np.exp(1j * np.pi * g.scalar.phase) * g.scalar.floatfactor
    for node in g.scalar.phasenodes:    # Each node is a Fraction
        scalar_float *= 1 + np.exp(1j * np.pi * node)
    scalar_exp = math.log10(math.sqrt(2)) * g.scalar.power2

    # If the TN is empty, create a single 0-tensor with scalar factor, otherwise
    # multiply the scalar into one of the tensors.
    if len(tensors) == 0:
        tensors.append(qtn.Tensor(data = scalar_float,
                                  inds = (),
                                  tags = ("S",)))
    else:
        tensors[0].modify(data = tensors[0].data * scalar_float)


    network = qtn.TensorNetwork(tensors)

    # the exponent can be very large, so distribute it evenly through the TN
    network.exponent = scalar_exp
    network.distribute_exponent()
    return network
