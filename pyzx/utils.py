from fractions import Fraction
from typing import Union
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