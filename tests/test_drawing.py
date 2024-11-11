import sys, os; sys.path.append('..')
from pyzx.graph.graph import Graph
from pyzx.drawing import draw
from pyzx.utils import VertexType, EdgeType


g = Graph()
v1 = g.add_vertex(VertexType.BOUNDARY)
v2 = g.add_vertex(VertexType.BOUNDARY)
g.add_edge(g.edge(v1, v2))
draw(g)