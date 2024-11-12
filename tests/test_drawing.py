import sys, os; sys.path.append('..')
import importlib
from pyzx.graph.graph import Graph
from pyzx.graph.base import BaseGraph, VT, ET
import random
from typing import *
import  math
from pyzx.drawing import draw
from pyzx.utils import VertexType, EdgeType


def auto_draw_vertex_locs(g:BaseGraph[VT, ET], x_scale = 1, y_scale = 1): #Force-based graph drawing algorithm given by Eades(1984):
    c1 = 2
    c2 = 1
    c3 = 1
    c4 = .1
    v_loc:Dict[VT, Tuple[int, int]] = dict()
    for v in g.vertices():
        v_loc[v]=(random.random()*10,  random.random()*10)
    for i in range(10): #100 iterations of force-based drawing
        print(v_loc.values())
        forces:Dict[VT, Tuple[int, int]] = dict()
        for v in g.vertices():
            forces[v] = (0, 0)
            for v1 in g.vertices():
                diff = (v_loc[v][0]-v_loc[v1][0], v_loc[v][1]-v_loc[v1][1])
                d = math.sqrt(diff[0]*diff[0]+diff[1]*diff[1])
                if g.connected(v1, v): #edge between vertices: apply rule c1*log(d/c2)
                    force_mag = -c1*math.log(d/c2) #negative force attracts
                elif v != v1: #nonadjacent vertices: apply rule -c3/d^2
                    force_mag = c3/(d*d) #positive force repels
                else: #free body in question, applies no force on itself
                    force_mag = 0
                v_force = (diff[0]*force_mag*c4, diff[1]*force_mag*c4)
                forces[v] = (forces[v][0]+v_force[0], forces[v][1]+v_force[1])
        for v in g.vertices(): #leave y value constant if input or output
            v_loc[v]=(v_loc[v][0]+forces[v][0], v_loc[v][1]+forces[v][1])
    max_x = max(v[0] for v in v_loc.values())
    min_x = min(v[0] for v in v_loc.values())
    max_y = max(v[1] for v in v_loc.values())
    min_y = min(v[1] for v in v_loc.values())
    #scale_x = x_scale / (max_x - min_x)
    #scale_y = y_scale / (max_y - min_y)
    #scale_x = x_scale
    #scale_y = y_scale
    
    #v_loc = {k:((v[0]+min_x)*scale_x, (v[1]+min_y)*scale_y) for k, v in v_loc.items()} #rescale
    return v_loc


g = Graph()
v1 = g.add_vertex(VertexType.BOUNDARY)
v2 = g.add_vertex(VertexType.BOUNDARY)
v3 = g.add_vertex(VertexType.BOUNDARY)
g.add_edge(g.edge(v1, v2))
g.add_edge(g.edge(v2, v3))
g.add_edge(g.edge(v1, v3))
#draw(g)
auto_draw_vertex_locs(g, .1, .1)