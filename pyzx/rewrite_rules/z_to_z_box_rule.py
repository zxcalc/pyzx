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
        'z_to_z_box',
        'check_z_to_z_box']


from typing import List, Callable, Optional
import numpy as np

from pyzx.symbolic import Poly

from pyzx.graph.base import BaseGraph, VT, ET
from pyzx.utils import VertexType, set_z_box_label


def check_z_to_z_box(
        g: BaseGraph[VT,ET],
        v: VT ) -> bool:
    """checks if a given vertex can be converted to Z-boxes."""

    types = g.types()
    phases = g.phases()

    if types[v] == VertexType.Z and not isinstance(phases[v],Poly):
        return True
    return False

def z_to_z_box(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Checks and converts a Z vertex to a Z-box."""
    if check_z_to_z_box(g, v):
        return unsafe_z_to_z_box(g, v)
    return False

def unsafe_z_to_z_box(g: BaseGraph[VT,ET], v: VT) -> bool:
    """Converts a Z vertex to a Z-box."""

    g.set_type(v, VertexType.Z_BOX)
    phase = g.phase(v)
    assert not isinstance(phase, Poly)
    label = np.round(np.e**(1j * np.pi * phase), 8)
    set_z_box_label(g, v, label)
    g.set_phase(v, 0)
    g.remove_isolated_vertices()
    return True
