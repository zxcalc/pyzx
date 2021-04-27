# PyZX - Python library for quantum circuit rewriting
#        and optimisation using the ZX-calculus
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

__version__ = "0.6.4"

from .graph.graph import Graph
from .circuit import Circuit, gates, id
from .linalg import Mat2
from .utils import settings, VertexType, EdgeType
from .drawing import *
from .simplify import *
from .optimize import *
from .extract import *
from .io import *
from .tensor import *
from .local_search.simulated_annealing import anneal
from .local_search.genetic import GeneticOptimizer
from .circuit.qasmparser import qasm
from .circuit.sqasm import sqasm
from . import quantomatic
from . import generate
from . import todd
from . import linalg
from . import extract
from . import rules
from . import hrules
from . import optimize
from . import simplify
from . import hsimplify
from . import d3
from . import tikz
from . import simulate
from . import editor
from . import routing
from . import local_search
from .routing.parity_maps import CNOT_tracker

# some common scalars
from .graph.base import Scalar
ONE = Scalar()
SQRT_TWO = Scalar()
SQRT_TWO.add_power(1)
TWO = Scalar()
TWO.add_power(2)
SQRT_TWO_INV = Scalar()
SQRT_TWO_INV.add_power(-1)
TWO_INV = Scalar()
TWO_INV.add_power(-2)

if __name__ == '__main__':
    print("Please execute this as a module by running 'python -m pyzx'")
