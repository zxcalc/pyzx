# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

__version__ = "0.5.1"

from .graph.graph import Graph
from .linalg import Mat2
from .circuit import Circuit, gates, id
from .utils import settings, VertexType, EdgeType
from .drawing import *
from .simplify import *
from .io import *
from .tensor import *
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


if __name__ == '__main__':
    print("Please execute this as a module by running 'python -m pyzx'")
