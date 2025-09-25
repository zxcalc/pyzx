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

from .qasmparser import QASMParser
from ..rewrite_rules.rules import *
from ..simplify import simp
from ..graph.base import BaseGraph

__all__ = ['sqasm']

#TODO: Improve the type annotation of these functions

# versions of these rules which instruct the simplifier *not* to remove
# isolated vertices. n.b. remove_ids already does this, but this might change
# in the future...
def spider_nocheck(g: BaseGraph, ms: List) -> RewriteOutputType:
    etab,rem_v,rem_e,check = spider(g, ms)
    return (etab, rem_v, rem_e, False)

def remove_ids_nocheck(g: BaseGraph, ms: List) -> RewriteOutputType:
    etab,rem_v,rem_e,check = remove_ids(g, ms)
    return (etab, rem_v, rem_e, False)

def sqasm(s: str, simplify=True) -> BaseGraph:
    p = QASMParser()
    c = p.parse(s, strict=False)
    g = c.to_graph(zh=True)
    inputs = list(g.inputs())
    outputs = list(g.outputs())
    for r,sp in p.registers.items():
        if len(r) > 0 and r[0].isupper():
            for q in range(sp[0],sp[0]+sp[1]):
                if r[0] != 'Z':
                    v = inputs[q]
                    v1 = list(g.neighbors(v))
                    if len(v1) > 0 and g.type(v1[0]) != VertexType.BOUNDARY:
                        g.set_type(v, g.type(v1[0]))
                    else:
                        g.set_type(v, VertexType.Z)
                    inputs[q] = None
                    g.scalar.add_power(-1)

                if r[0] != 'A':
                    v = outputs[q]
                    v1 = list(g.neighbors(v))
                    if len(v1) > 0 and g.type(v1[0]) != VertexType.BOUNDARY:
                        g.set_type(v, g.type(v1[0]))
                    else:
                        g.set_type(v, VertexType.Z)
                    outputs[q] = None
                    g.scalar.add_power(-1)
        
    g.set_inputs(tuple(x for x in inputs if not x is None))
    g.set_outputs(tuple(x for x in outputs if not x is None))
    
    while simplify:
        i = simp(g, '', match_spider_parallel, spider_nocheck, quiet=True)
        i += simp(g, '', match_ids_parallel, remove_ids_nocheck, quiet=True)
        if i == 0: break
    
    g.pack_circuit_rows()
    return g
