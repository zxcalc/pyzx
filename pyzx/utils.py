import os
from fractions import Fraction
from typing import Union, Optional, List
from typing_extensions import Literal, Final

FloatInt = Union[float,int]
FractionLike = Union[Fraction,int]


class VertexType:
    """Type of a vertex in the graph."""
    Type = Literal[0,1,2,3]
    BOUNDARY: Final = 0
    Z: Final = 1
    X: Final = 2
    H_BOX: Final = 3

def vertex_is_zx(ty: VertexType.Type) -> bool:
    """Check if a vertex type corresponds to a green or red spider."""
    return ty in (VertexType.Z, VertexType.X)

def toggle_vertex(ty: VertexType.Type) -> VertexType.Type:
    """Swap the X and Z vertex types."""
    if not vertex_is_zx(ty):
        return ty
    return VertexType.Z if ty == VertexType.X else VertexType.X

class EdgeType:
    """Type of an edge in the graph."""
    Type = Literal[1,2]
    SIMPLE: Final = 1
    HADAMARD: Final = 2

def toggle_edge(ty: EdgeType.Type) -> EdgeType.Type:
    """Swap the regular and Hadamard edge types."""
    return EdgeType.HADAMARD if ty == EdgeType.SIMPLE else EdgeType.SIMPLE



def phase_to_s(a: FractionLike, t:VertexType.Type=VertexType.Z):
    if (a == 0 and t != VertexType.H_BOX): return ''
    if (a == 1 and t == VertexType.H_BOX): return ''
    if not isinstance(a, Fraction):
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


class Settings(object): # namespace class
    mode: Literal["notebook", "browser", "shell"] = "shell"
    drawing_backend: Literal["d3","matplotlib"] = "d3" 
    javascript_location: str = ""
    d3_load_string: str = ""
    tikzit_location: str = ""
    quantomatic_location: str = ""
    topt_command: Optional[List[str]] = None # Argument-separated command to run TOpt such as ["wsl", "./TOpt"]

settings = Settings()


settings.javascript_location = os.path.join(os.path.dirname(__file__), 'js')

# We default to importing d3 from a CDN
settings.d3_load_string = 'require.config({paths: {d3: "https://d3js.org/d3.v5.min"} });'
# However, if we are working in the pyzx directory itself, we can use the copy of d3
# local to pyzx, which doesn't require an internet connection
# We only do this if we believe we are running in the PyZX directory itself.

relpath = os.path.relpath(settings.javascript_location, os.getcwd())
if relpath.count('..') <= 1: # We are *probably* working in the PyZX directory
    settings.javascript_location = os.path.relpath(settings.javascript_location, os.getcwd())
    settings.d3_load_string = 'require.config({{baseUrl: "{}",paths: {{d3: "d3.v5.min"}} }});'.format(
                        settings.javascript_location.replace('\\','/'))
    # TODO: This will fail if Jupyter is started in the parent directory of pyzx, while
    # the notebook is not in the pyzx directory


try:
    import IPython # type: ignore
    ipython_instance = IPython.get_ipython()
    if ipython_instance is None: raise Exception
    if 'IPKernelApp' in ipython_instance.config: settings.mode = "notebook"
    ipython_instance.config.InlineBackend.figure_format = 'svg'
except:
    try:
        import browser # type: ignore
        settings.mode = "browser"
    except:
        settings.mode = "shell"