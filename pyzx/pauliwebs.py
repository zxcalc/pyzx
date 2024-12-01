# PyZX - Python library for quantum circuit rewriting 
#        and optimization using the ZX-calculus
# Copyright (C) 2024 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from .circuit import Circuit
from .utils import EdgeType, VertexType
from .simplify import gadgetize, to_rg
from .graph.base import BaseGraph


def preprocess(g: BaseGraph):
    gadgetize(g)
    to_rg(g) # TODO: i/o should stay Z
    in_circ = Circuit()
    out_circ = Circuit()
    for j,i in enumerate(g.inputs()):
        e = g.incident_edges(i)[0]
        v = g.neighbors(i)[0]
        p = g.phase(v)
        if g.edge_type(e) == EdgeType.HADAMARD:
            in_circ.add_gate('H', j)
            g.set_edge_type(e, EdgeType.SIMPLE)
        if p != 0:
            g.set_phase(v, 0)
            in_circ.add_gate("ZPhase", j, phase=p)

    for j,o in enumerate(g.outputs()):
        r = g.get_row(o)
        g.set_row(o, r + 1)
        e = g.incident_edges(o)[0]
        v = g.neighbors(o)[0]
        p = g.phase(v)
        if p != 0:
            g.set_phase(v, 0)
            out_circ.add_gate("ZPhase", j, phase=p)

        if g.edge_type(e) == EdgeType.HADAMARD:
            out_circ.add_gate('H', j)
        g.remove_edge(e)
        
        v1 = g.add_vertex(VertexType.Z, qubit=g.qubit(o), row=r)
        g.add_edge((v,v1), EdgeType.HADAMARD)
        g.add_edge((v1,o), EdgeType.HADAMARD)