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


__all__ = [
        'check_pi_commute',
        'pi_commute',
        'unsafe_pi_commute',]

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.rewrite_rules.color_change_rule import color_change_diagram

from pyzx.utils import EdgeType, VertexType



def check_pi_commute(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) == VertexType.Z or g.type(v) == VertexType.X


def pi_commute(g: BaseGraph[VT, ET], v: VT) -> bool:
    if check_pi_commute(g, v): return unsafe_pi_commute(g, v)
    return False

def unsafe_pi_commute(g: BaseGraph[VT, ET], v: VT) -> bool:

    swap_color = False

    if g.type(v) == VertexType.X:
        swap_color = True
        color_change_diagram(g)


    g.set_phase(v, -g.phase(v))
    ns = g.neighbors(v)
    for w in ns:
        e = g.edge(v, w)
        et = g.edge_type(e)
        if ((g.type(w) == VertexType.Z and et == EdgeType.HADAMARD) or
            (g.type(w) == VertexType.X and et == EdgeType.SIMPLE)):
            g.add_to_phase(w, 1)
        else:
            g.remove_edge(e)
            c = g.add_vertex(VertexType.X,
                    qubit=0.5*(g.qubit(v) + g.qubit(w)),
                    row=0.5*(g.row(v) + g.row(w)))
            g.add_edge((v, c))
            g.add_edge((c, w), edgetype=et)

    if swap_color:
        color_change_diagram(g)

    return True
