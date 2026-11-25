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

"""
This module implements :class:`Architecture` aware routing methods for :class:`Circuit` s.
"""

__all__ = [
    # Architecture objects
    "architectures",
    "create_architecture",
    "Architecture",

    # Qubit parity map trackers
    "Parity",
    "CNOT_tracker",

    # Cnot mapping
    "ElimMode",
    "CostMetric",
    "FitnessFunction",
    "gauss",
    "permuted_gauss",
    "sequential_gauss",
    "steiner_gauss",
    "rec_steiner_gauss",

    # Phase polynomial routing
    "RoutingMethod",
    "RootHeuristic",
    "SplitHeuristic",
    "route_phase_poly",
]

from .architecture import Architecture, architectures, create_architecture
from .cnot_mapper import ElimMode, CostMetric, FitnessFunction, gauss, permuted_gauss, sequential_gauss
from .parity_maps import Parity, CNOT_tracker
from .steiner import steiner_gauss, rec_steiner_gauss
from .phase_poly import RoutingMethod, RootHeuristic, SplitHeuristic, route_phase_poly