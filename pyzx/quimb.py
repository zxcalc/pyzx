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

import numpy as np
import quimb as qu
import quimb.tensor as qtn
from .utils import EdgeType, VertexType
from .graph.base import BaseGraph

def to_quimb_tensor(g: BaseGraph) -> qtn.TensorNetwork:
    """Converts tensor network representing the given :func:`pyzx.graph.Graph`.
    Precondition: g does not have X-spiders.
    Pretty printing: to_tensor(g).draw(color = ['V', 'H'])
    
    Args:
        g: graph to be converted."""
    # We need to normalize vertices because there might be gaps in their representation in g.
    vtable = {}
    count = 0
    for v in g.vertices():
        vtable[v] = count
        count += 1
    
    # Here we have phase tensors corresponding to Z-spiders with only one output and no input.
    vertex_tensors = []
    for v in g.vertices():
        if g.type(v) == VertexType.Z and g.phase(v) != 0:
            vertex_tensors.append(qtn.Tensor(data = [1, np.exp(1j * np.pi * g.phase(v))],
                                             inds = (f'{vtable[v]}',),
                                             tags = ("V",)))
    
    # Hadamard or Kronecker tensors, one for each edge of the diagram.
    edge_tensors = []
    
    for i, edge in enumerate(g.edges()):
        x, y = edge
        isHadamard = g.edge_type(edge) == EdgeType.HADAMARD
        t = qtn.Tensor(data = qu.hadamard() if isHadamard else np.array([1, 0, 0, 1]).reshape(2, 2),
                       inds = (f'{vtable[x]}', f'{vtable[y]}'),
                       tags = ("H",) if isHadamard else ("N",))
        edge_tensors.append(t)
        #if g.type(x) == VertexType.Z and g.type(y) == VertexType.Z:
        #if g.type(x) == VertexType.BOUNDARY:
        #if g.type(y) == VertexType.BOUNDARY:

    network = qtn.TensorNetwork(vertex_tensors) & qtn.TensorNetwork(edge_tensors)
    return network
