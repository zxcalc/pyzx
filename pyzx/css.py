from .utils import VertexType
from .graph import Graph
from .linalg import Mat2
from typing import Optional

def generate_css_encoder_graph(S: Mat2, L: Optional[Mat2]=None, type: str='Z-X'):
    """Returns a phase-free PyZX Graph of the encoder for a CSS code,
      given its stabilizers (S), logical operators (L), and normal form type (type).
      Normal form type can be 'Z-X' or 'X-Z' (Definitions 4.3.1 and 4.3.7 of Picturing Quantum Software).
      For type 'Z-X'('X-Z'), use X(Z)-type stabilizers and logicals.
      
      Example:
		To construct the encoder for the [[8, 3, 2]] code in Z-X form:

            SX = Mat2([[1,1,1,1,1,1,1,1]])
			LX = Mat2([[1,1,1,1,0,0,0,0],[1,1,0,0,1,1,0,0],[1,0,1,0,1,0,1,0]])
            enc, vertex_ids = generate_css_encoder_graph(SX, LX, 'Z-X')
      
    """
    
    if type == 'Z-X':
        r1type, r2type = VertexType.Z, VertexType.X
    elif type == 'X-Z':
        r1type, r2type = VertexType.X, VertexType.Z

    g = Graph()
    logical_verts = []
    stabilizer_verts = []
    output_verts = []
    num_L = L.rows() if L is not None else 0
    num_S = S.rows() if S is not None else 0
    n = S.cols() if S is not None else 0
    
    for i in range(num_L):
        in_bound_vert = g.add_vertex(VertexType.BOUNDARY, qubit=i, row=0)
        logical_vert = g.add_vertex(r1type, qubit=i, row=2)
        g.add_edge((in_bound_vert, logical_vert))
        logical_verts.append(logical_vert)

    for i in range(num_L, num_L+num_S):
        stabilizer_vert = g.add_vertex(r1type, qubit=i, row=2)
        stabilizer_verts.append(stabilizer_vert)
    
    for j in range(n):
        output_vert = g.add_vertex(r2type, qubit=j, row=6)
        out_bound_vert = g.add_vertex(VertexType.BOUNDARY, qubit=j, row=8)
        g.add_edge((output_vert, out_bound_vert))
        output_verts.append(output_vert)

    for i in range(num_L+num_S):
        for j in range(n):
            if (L is not None) and (i < num_L) and (L[i,j] == 1):
                g.add_edge((logical_verts[i], output_verts[j]))
            elif (i >= num_L) and (S[i-num_L,j] == 1):
                g.add_edge((stabilizer_verts[i-num_L], output_verts[j]))
    
    return g, [logical_verts, stabilizer_verts, output_verts]