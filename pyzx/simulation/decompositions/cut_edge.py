from . import Decomp, register_decomp, register_validity_checker
from ...graph.base import BaseGraph,VT,ET
from ...utils import VertexType, ave_pos
from ..common import SumGraph

@register_decomp(
    Decomp.CUT_EDGE,
    alpha=float("inf"),
    reference="https://arxiv.org/pdf/2403.10964, https://www.cs.ox.ac.uk/people/aleks.kissinger/theses/codsi-thesis.pdf"
)
def decompose(g:BaseGraph[VT,ET], e:ET, ty:VertexType=VertexType.Z) -> SumGraph:
    """Applies the ``cutting'' decomposition to an edge. The type ty decides whether to cut with Z- branches or X- branches."""
    g  = g.clone()
    g0 = g.clone()
    g1 = g.clone()
    g0.remove_edge(e)
    g1.remove_edge(e)

    etype = g.edge_type(e)

    g0.scalar.add_power(-2)
    g1.scalar.add_power(-2)

    x0,x1 = g.row(e[0]), g.row(e[1])
    y0,y1 = g.qubit(e[0]), g.qubit(e[1])

    qubit1 = ave_pos(y0,y1,1/3)
    row1   = ave_pos(x0,x1,1/3)
    qubit2 = ave_pos(y0,y1,2/3)
    row2   = ave_pos(x0,x1,2/3)
    
    v = g0.add_vertex(ty=ty,qubit=qubit1,row=row1,phase=0)
    g0.add_edge((v,e[0]),1)
    v = g0.add_vertex(ty=ty,qubit=qubit2,row=row2,phase=0)
    g0.add_edge((v,e[1]),etype)

    v = g1.add_vertex(ty=ty,qubit=qubit1,row=row1,phase=1)
    g1.add_edge((v,e[0]),1)
    v = g1.add_vertex(ty=ty,qubit=qubit2,row=row2,phase=1)
    g1.add_edge((v,e[1]),etype)
    
    return SumGraph([g0,g1])

@register_validity_checker(Decomp.CUT_EDGE)
def check_valid(g:BaseGraph[VT,ET], e:ET, ty:VertexType=VertexType.Z) -> bool:
    assert ty in (VertexType.Z, VertexType.X), (f"Invalid edge cut type {ty!r}. Expected {VertexType.Z!r} or {VertexType.X!r}.")
    u,v = e; assert g.connected(u,v), (f"Invalid edge cut. Edge {e} does not exist in graph {g}.")
    # todo - these should probably be raise errors rather than assertions?
    return True