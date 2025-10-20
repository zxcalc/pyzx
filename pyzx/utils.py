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

import os
from argparse import ArgumentTypeError
from enum import IntEnum
from fractions import Fraction
from typing import Union, Optional, List, Dict, Any
from typing_extensions import Literal, Final

from .symbolic import Poly

FloatInt = Union[float,int]
FractionLike = Union[Fraction,int,Poly]


class VertexType(IntEnum):
    """Type of a vertex in the graph."""
    BOUNDARY = 0
    Z = 1
    X = 2
    H_BOX = 3
    W_INPUT = 4
    W_OUTPUT = 5
    Z_BOX = 6
    DUMMY = 99

def vertex_is_zx(ty: VertexType) -> bool:
    """Check if a vertex type corresponds to a green or red spider."""
    return ty in (VertexType.Z, VertexType.X)

def toggle_vertex(ty: VertexType) -> VertexType:
    """Swap the X and Z vertex types."""
    if not vertex_is_zx(ty):
        return ty
    return VertexType.Z if ty == VertexType.X else VertexType.X

def vertex_is_z_like(ty: VertexType) -> bool:
    """Check if a vertex type corresponds to a Z spider or Z box."""
    return ty == VertexType.Z or ty == VertexType.Z_BOX

def vertex_is_zx_like(ty: VertexType) -> bool:
    """Check if a vertex type corresponds to a Z or X spider or Z box."""
    return vertex_is_z_like(ty) or ty == VertexType.X

def vertex_is_w(ty: VertexType) -> bool:
    return ty == VertexType.W_INPUT or ty == VertexType.W_OUTPUT

def get_w_partner(g, v):
    assert vertex_is_w(g.type(v))
    for edge in g.incident_edges(v):
        if g.edge_type(edge) == EdgeType.W_IO:
            u = edge[0] if edge[1] == v else edge[1]
            assert vertex_is_w(g.type(u))
            return u
    assert False

def get_w_io(g, v):
    v2 = get_w_partner(g, v)
    if g.type(v) == VertexType.W_INPUT:
        return v, v2
    return v2, v


class EdgeType(IntEnum):
    """Type of an edge in the graph."""
    SIMPLE = 1
    HADAMARD = 2
    W_IO = 3
    FAULT_EDGE = 4

def toggle_edge(ty: EdgeType) -> EdgeType:
    """Swap the regular and Hadamard edge types."""
    return EdgeType.HADAMARD if ty == EdgeType.SIMPLE else EdgeType.SIMPLE

def phase_to_s(a: FractionLike, t:VertexType=VertexType.Z, poly_with_pi:bool=False) -> str:
    if isinstance(a, Fraction) or isinstance(a, int):
        return phase_fraction_to_s(a, t)
    else: # a is a Poly
        if poly_with_pi:
            return f"({a})\u03c0"
        else:
            return str(a)

def phase_fraction_to_s(a: FractionLike, t:VertexType=VertexType.Z) -> str:
    if (a == 0 and t != VertexType.H_BOX): return ''
    if (a == 1 and t == VertexType.H_BOX): return ''
    if isinstance(a, Poly):
        return str(a)
    a = Fraction(a)

    if a == 0: return '0'
    simstr = ''
    if a.denominator > 256:
        a = a.limit_denominator(256)
        simstr = '~'

    ns = '' if a.numerator == 1 else str(a.numerator)
    ds = '' if a.denominator == 1 else '/' + str(a.denominator)

    # unicode 0x03c0 = pi
    return simstr + ns + '\u03c0' + ds

def phase_is_clifford(phase: FractionLike):
    if isinstance(phase, (Fraction, int)):
        return phase in [Fraction(i, 2) for i in range(4)]
    else:
        return phase.is_clifford

def phase_is_pauli(phase: FractionLike):
    if isinstance(phase, (Fraction, int)):
        return phase in (0, 1)
    else:
        return phase.is_pauli

tikz_classes = {
    'boundary': 'none',
    'Z': 'Z dot',
    'X': 'X dot',
    'Z phase': 'Z phase dot',
    'X phase': 'X phase dot',
    'Z box': 'Z box',
    'H': 'hadamard',
    'W': 'W triangle',
    'W input': 'W input',
    'dummy': 'text',
    'edge': '',
    'H-edge': 'hadamard edge',
    'W-io-edge': 'W io edge',
    'Fault-edge': 'fault edge'
}

original_colors = {
    'edge': '#000000',
    'Hedge': '#0088ff',
    'Xedge': '#999999',
    'FaultEdge': '#8B0000',
    'boundary': '#000000',
    'X': '#ff8888',
    'Y': '#aabbff',
    'Z': '#ccffcc',
    'H': '#ffff66',
    'W': '#000000',
    'Zalt': '#ccffcc',
    'Walt': '#000000',
    'Xdark': '#ff8888',
    'Ydark': '#aabbff',
    'Zdark': '#99dd99',
}

rgb_colors = original_colors.copy()
rgb_colors['Y'] = original_colors['Z']
rgb_colors['Z'] = original_colors['Y']
rgb_colors['Ydark'] = original_colors['Zdark']
rgb_colors['Zdark'] = original_colors['Ydark']
rgb_colors['Hedge'] = '#ff6600'

grayscale_colors = {
    'edge': '#000000',
    'Hedge': '#888888',
    'Xedge': '#dddddd',
    'FaultEdge': '#8B0000',
    'boundary': '#000000',
    'X': '#666666',
    'Y': '#9999dd',
    'Z': '#dddddd',
    'H': '#eeeeee',
    'W': '#000000',
    'Zalt': '#dddddd',
    'Walt': '#000000',
    'Xdark': '#666666',
    'Ydark': '#9999dd',
    'Zdark': '#dddddd',
}

class Settings(object): # namespace class
    mode: Literal["notebook", "browser", "shell", ""] = "shell"
    drawing_backend: Literal["d3","matplotlib"] = "d3"
    drawing_auto_hbox: bool = False
    javascript_location: str = "" # Path to javascript files of pyzx
    d3_load_string: str = ""
    tikzit_location: str = "" # Path to tikzit executable
    quantomatic_location: str = "" # Path to quantomatic executable
    topt_command: Optional[List[str]] = None # Argument-separated command to run TOpt such as ["wsl", "./TOpt"]
    show_labels: bool = False
    tikz_classes: Dict[str,str] = tikz_classes
    default_qasm_version: int = 2
    colors: Dict[str, str] = original_colors
    javascript_importmap: Dict[str, Any] = {
        "imports": {
            "three": "https://cdn.jsdelivr.net/npm/three@0.172.0/build/three.module.js",
            "three/addons/": "https://cdn.jsdelivr.net/npm/three@0.172.0/examples/jsm/",
            "d3": "https://cdn.jsdelivr.net/npm/d3@5.16.0/dist/d3.min.js",
        }
    }

settings = Settings()


settings.javascript_location = os.path.join(os.path.dirname(__file__), 'js')

# We default to importing d3 from a CDN
settings.d3_load_string = 'require.config({paths: {d3: "https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min"} });'
# However, if we are working in the pyzx directory itself, we can use the copy of d3
# local to pyzx, which doesn't require an internet connection
# We only do this if we believe we are running in the PyZX directory itself.

try:
    relpath = os.path.relpath(settings.javascript_location, os.getcwd())
    if relpath.count('..') <= 2: # We are *probably* working in the PyZX directory
        settings.javascript_location = os.path.relpath(settings.javascript_location, os.getcwd())
        #settings.d3_load_string = 'require.config({{baseUrl: "{}",paths: {{d3: "d3.v5.min"}} }});'.format(
        #                    settings.javascript_location.replace('\\','/'))
        # TODO: This will fail if Jupyter is started in the parent directory of pyzx, while
        # the notebook is not in the pyzx directory
except ValueError: # relpath raises this Exception when the drive letters don't match
    pass


settings.mode = ''
def get_mode():
    if settings.mode == '':
        try:
            import IPython # type: ignore
            ipython_instance = IPython.get_ipython()
            if ipython_instance is None: raise Exception
            if 'IPKernelApp' in ipython_instance.config:
                settings.mode = "notebook"
                if os.environ.get('SPHINXTARGET') == 'latexpdf':
                    settings.drawing_backend = "matplotlib"
            ipython_instance.config.InlineBackend.figure_format = 'svg'
        except:
            try:
                import browser # type: ignore
                settings.mode = "browser"
            except:
                settings.mode = "shell"

    return settings.mode



def restricted_float(x):
    x = float(x)
    if x < 0.0 or x > 1.0:
        raise ArgumentTypeError("%r not in range [0.0, 1.0]." % (x,))
    return x


def make_into_list(possible_list: Any) -> List[Any]:
    if not isinstance(possible_list, List):
        return [possible_list]
    return possible_list


def maxelements(seq, key=None, reverse=False):
    """
    Return list of position(s) of largest element.

    Adapted from: https://stackoverflow.com/questions/3989016/how-to-find-all-positions-of-the-maximum-value-in-a-list
    """
    indices = []
    if key is None:
        key = lambda x: x
    if reverse:
        compare = lambda x, y: x <= y
    else:
        compare = lambda x, y: x >= y
    if seq:
        best_val = key(seq[0])
        for i, val in enumerate(seq):
            cur_val = key(val)
            if compare(cur_val, best_val):
                if cur_val == best_val:
                    indices.append(i)
                else:
                    best_val = cur_val
                    indices = [i]

    return indices


def is_pauli(phase):
    """
    Check whether phase is Pauli.

    Compatible with zxlive symbols.
    """
    if phase == 0 or phase == 1:
        return True
    return getattr(phase, 'is_pauli', False)

def get_z_box_label(g, v):
    assert g.type(v) == VertexType.Z_BOX
    return g.vdata(v, 'label', 1)

def set_z_box_label(g, v, label):
    assert g.type(v) == VertexType.Z_BOX
    g.set_vdata(v, 'label', label)

# Return position 'perc'%-distance between 2 points:
def ave_pos(a,b,perc=1/2): return (abs(a-b))*(perc) + min(a,b)
