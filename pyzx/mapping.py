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

def to_tensor(g: BaseGraph) -> qtn.TensorNetwork:
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
    
    # Here we have Z-spiders with only one output and no input translated to the coresponding tensors.
    vertex_tensors = [qtn.Tensor(data = [1, np.exp(1j * np.pi * g.phase(v))],
                      inds = (f'{vtable[v]}',), tags = ("V",)) for v in g.vertices()]
    # Phaseless Z-spiders translated to tensors.
    phaseless_tensors = [qtn.Tensor() for v in g.vertices()]
    # List of Hadamard gates translated to tensors, to be filled in.
    h_tensors = []
    
    count = 0
    for i, t in enumerate(phaseless_tensors):
        t.new_ind(f'{i}', size = 2)
    for i, edge in enumerate(g.edges()):
        x, y = edge
        if g.edge_type(edge) == EdgeType.SIMPLE:
            phaseless_tensors[vtable[x]].new_ind(f'k{i}', size = 2)
            phaseless_tensors[vtable[y]].new_ind(f'k{i}', size = 2)
        else:
            count = len(h_tensors)
            phaseless_tensors[vtable[x]].new_ind(f'h{2 * count}', size = 2)
            phaseless_tensors[vtable[y]].new_ind(f'h{2 * count + 1}', size = 2)
            t = qtn.Tensor(data = qu.hadamard(),
                           inds = (f'h{2 * count}', f'h{2 * count + 1}'),
                           tags = ("H",))
            h_tensors.append(t)

    network = qtn.TensorNetwork(vertex_tensors) & qtn.TensorNetwork(phaseless_tensors) & qtn.TensorNetwork(h_tensors)
    return network
