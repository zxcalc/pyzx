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

from typing import Any

from .circuit import Circuit
from .drawing import draw_d3
from .graph.base import ET, VT, BaseGraph
from .pauliweb import PauliWeb
from .utils import FloatInt


def draw(
    g: BaseGraph[VT, ET] | Circuit,
    labels: bool = False,
    scale: FloatInt | None = None,
    auto_hbox: bool | None = None,
    show_scalar: bool = False,
    vdata: list[str] | None = None,
    pauli_web: PauliWeb[VT, ET] | None = None,
    auto_layout: bool = False
) -> Any:
    print("This function will be removed. Please use zx.draw or zx.draw_d3 instead.")
    return draw_d3(
        g,
        labels=labels,
        scale=scale,
        auto_hbox=auto_hbox,
        show_scalar=show_scalar,
        vdata=vdata,
        pauli_web=pauli_web,
        auto_layout=auto_layout
    )
