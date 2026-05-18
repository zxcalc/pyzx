"""
This decomposition allows a vertex to be cut, producing two terms, as used in https://arxiv.org/pdf/2403.10964
and https://www.cs.ox.ac.uk/people/aleks.kissinger/theses/codsi-thesis.pdf.
"""

from . import Decomp, register_decomp, register_validity_checker
from ...graph.base import BaseGraph,VT,ET
from ...utils import VertexType, ave_pos, toggle_vertex
from ..common import SumGraph

@register_decomp(
    Decomp.CUT_VERTEX,
    alpha=1.0, # assuming it is a T-spider that is cut. Otherwise, alpha=inf
    reference="https://arxiv.org/pdf/2403.10964, https://www.cs.ox.ac.uk/people/aleks.kissinger/theses/codsi-thesis.pdf"
)
def decompose(g:BaseGraph[VT,ET], v:VT) -> SumGraph:
    """Applies the ``cutting'' decomposition to a vertex."""
    g  = g.clone()
    g0 = g.clone()
    g1 = g.clone()
    g0.remove_vertex(v)
    g1.remove_vertex(v)

    n = len(g.neighbors(v))
    g0.scalar.add_power(-n)
    g1.scalar.add_power(-n)
    g1.scalar.add_phase(g.phase(v)) # account for e^(i*pi*alpha) on right branch
    
    vtype = toggle_vertex(g.type(v))

    for i in g.neighbors(v):
        etype = g.edge_type(g.edge(v,i)) # maintain edge type
        qubit = ave_pos(g.qubit(v),g.qubit(i),1/2)
        row   = ave_pos(g.row(v),g.row(i),1/2)
        
        newV = g0.add_vertex(vtype,qubit,row,0) # add and connect the new vertices
        g0.add_edge((newV,i),etype)
        newV = g1.add_vertex(vtype,qubit,row,1)
        g1.add_edge((newV,i),etype)

    return SumGraph([g0,g1])

@register_validity_checker(Decomp.CUT_VERTEX)
def check_valid(g:BaseGraph[VT,ET], v:VT) -> bool:
    assert v in g.vertices(), (f"Invalid vertex cut. Vertex {v} does not exist in graph {g}.")
    assert g.type(v) in (VertexType.Z, VertexType.X), (f"Invalid cut on vertex {v} of type {g.type(v)}. Must be applied to a vertex of type {VertexType.Z!r} or {VertexType.X!r}.")
    # todo - these should probably be raise errors rather than assertions?
    return True