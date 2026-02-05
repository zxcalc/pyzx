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

r"""
This module contains the implementation of the fault-equivalent Fuse-1 rule and its reverse, Unfuse-1.

The check function returns a boolean indicating whether the rule can be applied.
The standard version of the applier will automatically call the basic checker, while the unsafe version
of the applier will assume that the given input is correct and will apply the rule without running the check first.

Fault-equivalent rewrites are defined in arXiv:2506.17181.
Alternatively, they are defined as distance-preserving rewrites in arXiv:2410.17240.

Formal Definition
=================

Let :math:`C_1` and :math:`C_2` be two circuits with respective noise models :math:`\mathcal{F}_1` and :math:`\mathcal{F}_2`.
The circuit :math:`C_1` under :math:`\mathcal{F}_1` is **w-fault-equivalent** to :math:`C_2` under :math:`\mathcal{F}_2`,
if and only if for all faults :math:`F_1 \in \langle \mathcal{F}_1 \rangle` with weight :math:`wt(F_1) < w`, we have either:

1.  :math:`F_1` is detectable, or
2.  There exists a fault :math:`F_2 \in \langle \mathcal{F}_2 \rangle` on :math:`C_2` such that:
        - :math:`wt(F_2) \leq wt(F_1)` and
        - :math:`C_1^{F_1} = C_2^{F_2}`.

The condition must similarly hold for all faults :math:`F_2 \in \langle \mathcal{F}_2 \rangle` with weight :math:`wt(F_2) < w`, making this equivalence relation symmetric.

Two circuits :math:`C_1` and :math:`C_2` are **fault-equivalent**, written :math:`C_1 \hat{=} C_2`, if they are :math:`w`-fault-equivalent for all :math:`w \in \mathbb{N}`.
"""

__all__ = [
    'check_fuse_1_FE',
    'fuse_1_FE',
    'unsafe_fuse_1_FE',
    'check_unfuse_1_FE',
    'unfuse_1_FE',
    'unsafe_unfuse_1_FE'
]

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.rewrite_rules import (
    fuse as _fuse,
)
from pyzx.utils import is_pauli, VertexType
from pyzx.rewrite_rules.fuse_rule import check_fuse


def check_fuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    neighs = list(g.neighbors(v))
    return len(neighs) == 1 and check_fuse(g,v,neighs[0]) and is_pauli(g.phase(v))


def fuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    if not check_fuse_1_FE(g, v):
        return False
    return unsafe_fuse_1_FE(g, v)


def unsafe_fuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    if not check_fuse_1_FE(g, v):
        return False
    [v2] = list(g.neighbors(v))
    return _fuse(g, v, v2)


def check_unfuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    return g.type(v) in (VertexType.X, VertexType.Z, VertexType.Z_BOX) and g.vertex_degree(v) > 0


def unfuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    if not check_unfuse_1_FE(g, v):
        return False
    return unsafe_unfuse_1_FE(g, v)


def unsafe_unfuse_1_FE(g: BaseGraph[VT, ET], v: VT) -> bool:
    typ = VertexType.X if g.type(v) == VertexType.X else VertexType.Z
    v2 = g.add_vertex(typ, g.qubit(v), g.row(v) - 1)
    _e = g.add_edge((v, v2))
    return True
