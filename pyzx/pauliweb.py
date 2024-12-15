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
from .graph.base import BaseGraph, VT, ET


def preprocess(g: BaseGraph[VT,ET]):
    gadgetize(g)
    to_rg(g)

    in_circ = Circuit(len(g.inputs()))
    for j,i in enumerate(g.inputs()):
        e = g.incident_edges(i)[0]
        v = next(iter(g.neighbors(i)))
        p = g.phase(v)
        ty = g.type(v)

        # remove local cliffords from the inputs
        if g.edge_type(e) == EdgeType.HADAMARD:
            in_circ.add_gate('H', j)
            g.set_edge_type(e, EdgeType.SIMPLE)
        if p != 0:
            g.set_phase(v, 0)
            in_circ.add_gate("ZPhase" if ty == VertexType.Z else "XPhase", j, phase=p)

    out_circ = Circuit(len(g.outputs()))
    for j,o in enumerate(g.outputs()):
        r = g.row(o)
        g.set_row(o, r + 2)
        e = g.incident_edges(o)[0]
        v = next(iter(g.neighbors(o)))
        p = g.phase(v)
        ty = g.type(v)

        # remove local cliffords from the outputs
        if p != 0:
            g.set_phase(v, 0)
            out_circ.add_gate("ZPhase" if ty == VertexType.Z else "XPhase", j, phase=p)

        if g.edge_type(e) == EdgeType.HADAMARD:
            out_circ.add_gate('H', j)
        g.remove_edge(e)

        # introduce ID spiders at the outputs for computing pauli webs
        if ty == VertexType.X:
            v1 = g.add_vertex(VertexType.Z, qubit=g.qubit(o), row=r)
            g.add_edge((v,v1), EdgeType.SIMPLE)
        else:
            v1 = v
            g.set_row(v1, r)
        
        v2 = g.add_vertex(VertexType.X, qubit=g.qubit(o), row=r+1)

        
        g.add_edge((v1,v2), EdgeType.SIMPLE)
        g.add_edge((v2,o), EdgeType.SIMPLE)
    
    return (in_circ, out_circ)