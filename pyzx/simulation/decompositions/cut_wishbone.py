from . import Decomp, register_decomp, register_validity_checker
from ...graph.base import BaseGraph,VT,ET
from ...utils import VertexType, FractionLike
from ..common import SumGraph
from typing import List

@register_decomp(
    Decomp.CUT_WISHBONE,
    alpha=1.0, # assuming one cuts a T-like spider with a T-like separator phase. Otherwise, alpha=inf
    reference="https://arxiv.org/abs/2412.17182, https://www.cs.ox.ac.uk/people/aleks.kissinger/theses/ahmad-thesis.pdf"
)
def decompose(g:BaseGraph[VT,ET], v:VT, neighs:List[VT]=[], ph:FractionLike=0) -> SumGraph:
    """Applies the ``wishbone cut'' (or ``separator cut'') decomposition to vertex v of graph g, pulling out the neighbours ``neighs'' and a phase ``ph''."""
    g = g.clone()
    
    for i in neighs:
        if not i in g.neighbors(v):
            raise ValueError("Attempted illegal wishbone cut. Vertex " + str(i) + " is not a neighbor of target vertex " + str(v) + ".")
    
    neighs_left  = set(g.neighbors(v)).symmetric_difference(neighs)
    neighs_right = neighs
    
    phase_left  = g.phase(v) - ph
    phase_right = ph
    
    v_left  = g.add_vertex(qubit=g.qubit(v),row=g.row(v)-0.5,ty=g.type(v),phase=phase_left)
    v_right = g.add_vertex(qubit=g.qubit(v),row=g.row(v)+0.5,ty=g.type(v),phase=phase_right)
    
    for i in neighs_left:  g.add_edge((v_left,i),g.edge_type(g.edge(v,i)))
    for i in neighs_right: g.add_edge((v_right,i),g.edge_type(g.edge(v,i)))
    
    g.remove_vertex(v)
    
    #--
    
    gLeft  = g.clone()
    gRight = g.clone()
    
    gRight.add_to_phase(v_left,1)
    gRight.add_to_phase(v_right,1)
    
    return SumGraph([gLeft,gRight]) # todo - ideally be consistent with whether to use g0,g1 or g_left,g_right, or g_A,g_B, etc.

@register_validity_checker(Decomp.CUT_WISHBONE)
def check_valid(g:BaseGraph[VT,ET], v:VT, neighs:List[VT]=[], ph:FractionLike=0) -> bool:
    assert v in g.vertices(), (f"Invalid wishbone cut. Vertex {v} does not exist in graph {g}.")
    assert g.type(v) in (VertexType.Z, VertexType.X), (f"Invalid wishbone cut on vertex {v} of type {g.type(v)}. Must be applied to a vertex of type {VertexType.Z!r} or {VertexType.X!r}.")
    assert all(g.connected(v,neigh) for neigh in neighs), (f"Invalid wishbone cut on vertex {v}. Target neighbours {neighs} are not all connected to vertex {v}.")
    # todo - these should probably be raise errors rather than assertions?
    return True