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

"""This module contains functions to calculate flows of graph-like ZX-diagrams."""

from typing import Dict, Set, Tuple, Optional, List, FrozenSet, Sequence, Union
from math import comb

from .linalg import Mat2
from .graph.base import BaseGraph, VertexType, VT, ET

def gflow(g: BaseGraph[VT, ET]) -> Optional[Tuple[Dict[VT, int], Dict[VT, Set[VT]], int]]:
  """Computes the maximally delayed gflow of a diagram in graph-like form.
	Based on an algorithm by Perdrix and Mhalla.
	See dx.doi.org/10.1007/978-3-540-70575-8_70
	
	:param g: A graph-like ZX-diagram.
	:return: Returns None if a gflow does not exist.
			Otherwise returns A 3-tuple containing an order labelling, the successor function of the gflow, and the maximum depth reached.
	"""
  order: Dict[VT, int] = {}
  gflow: Dict[VT, Set[VT]] = {}
  
  inputs = set(g.inputs())
  processed = set(g.outputs()) | g.grounds()
  vertices = set(g.vertices())
  pattern_inputs = {inp if g.type(inp) != VertexType.BOUNDARY else n for inp in inputs for n in g.neighbors(inp)}
  
  depth = 1
  order.update({v: 0 for v in processed})
  
  while True:
    neighbors_not_processed = {v: {w for w in g.neighbors(v) if w not in processed} for v in processed}
    processed_prime = list(set(v for v, neighbors in neighbors_not_processed.items() if neighbors).difference(pattern_inputs))
    candidates = [v for v in vertices - processed if any(w in processed_prime for w in g.neighbors(v))]
    
    zerovec = Mat2([[0] for _ in candidates])
    m = Mat2([[1 if g.connected(v,w) else 0 for v in processed_prime] for w in candidates])
    
    for idx, u in enumerate(candidates):
      vu = zerovec.copy()
      vu.data[idx] = [1]
      x = m.solve(vu)
      if x:
        gflow[u] = {processed_prime[i] for i in range(x.rows()) if x.data[i][0]}
        order[u] = depth
    
    if not order.keys() - processed:
      if vertices.difference(processed) == inputs.difference(pattern_inputs):
        return order, gflow, depth
    else:
      processed.update(order.keys())
      depth += 1

def cflow(g: BaseGraph[VT, ET], full_path_info: bool = False) -> Union[Optional[Tuple[Dict[VT, int], Dict[VT,VT], int]],Optional[Tuple[Dict[VT,VT], Dict[VT,VT], Dict[VT,int], Dict[Tuple[VT,VT], int]]]]:
    """Computes the causal flow of a diagram in graph-like form.
    If ``full_path_info`` is False (the default) the flow is calculated based on an algorithm by 
    Perdrix and Mhalla (see dx.doi.org/10.1007/978-3-540-70575-8_70) in O(kn) for n=|V| and k=|I|=|O|. This will output an order
    labelling, a successor function and the maximum depth reached.
    
    If ``full_path_info`` is set to True, then the flow is calculated based 
    on an extended version of the algorithm by Niel de Beaudrap (see https://doi.org/10.48550/arXiv.quant-ph/0603072) in O(k^2n).
    This will output an order labelling, a successor function, a path labelling and a supremum function. This characterises the full
    chain decomposition of the Dipaths.
    
    If the diagram has phase gadgets ``full_path_info`` is required to be True in order for causal flow to be calculated and checked.
	
	:param g: A graph-like ZX-diagram.
	:param full_path_info: Whether to calculate the full chain decomposition of the flow.
	:return: Returns None if a causal flow does not exist.
		If ``full_path_info`` is False returns a 3-tuple containing an order labelling, the successor function of the flow, and the maximum depth reached.
		If ``full_path_info`` is True returns a 4-tuple containing an order labelling, a successor function, a path labelling and a supremum function.
	"""
    if full_path_info:
        return full_cflow(g)
    
    inputs = set(g.inputs())
    processed = set(g.outputs())
    vertices = set(g.vertices())
    num_vertices = len(vertices)
    non_inputs = vertices - inputs
    correctors = processed - inputs
    
    order: Dict[VT, int] = {v:0 for v in processed}
    flow: Dict[VT, VT] = {}
    
    neighbor_sets = {v: set(g.neighbors(v)) for v in vertices}
    
    depth = 1
    while True:
        out_prime = set()
        c_prime = set()
        
        for v in correctors:
            ns = neighbor_sets[v] - processed
            if len(ns) == 1:
                u = ns.pop()
                if v != u:
                    flow[u] = v
                    order[v] = depth
                    out_prime.add(u)
                    c_prime.add(v)
        
        if not out_prime:
            if len(processed) == num_vertices:
                return order, flow, depth
            return None
        
        processed.update(out_prime)
        correctors.difference_update(c_prime)
        correctors.update(out_prime & non_inputs)
        depth += 1

def full_cflow(g: BaseGraph[VT, ET]) -> Optional[Tuple[Dict[VT,VT], Dict[VT,VT], Dict[VT,int], Dict[Tuple[VT,VT],int]]]:
    """Calculates the full chain decomposition for causal flow as per https://doi.org/10.48550/arXiv.quant-ph/0603072. 
    This has been extended to check for phase gadgets in an extentsion to the definition of causal flow which allows self loops on gadgets."""
    
    gadgets = {}
    gadget_connections = {}
    phases = g.phases()
    
    inputs = g.inputs()
    outputs = g.outputs()
    
    for v in g.vertices():
        if v in inputs or v in outputs or g.vertex_degree(v) != 1: continue
        
        n = next(iter(g.neighbors(v)))
        
        if g.type(v) != VertexType.Z or g.type(n) != VertexType.Z: continue
        if phases[n] not in (0,1): continue
        if n in gadgets or n in inputs or n in outputs: continue
        
        gadgets[n] = v
        gadget_connections[n] = frozenset(set(g.neighbors(n)) - {v})
    
    g_without_gadgets = g.clone()
    g_without_gadgets.remove_vertices(set(gadgets.keys()).union(set(gadgets.values())))
    
    for v in inputs:
        if v in outputs:
            g_without_gadgets.remove_vertex(v)
            
    if not g_without_gadgets.vertices(): return None
    
    num_inputs = g_without_gadgets.num_inputs()
    num_vertices = g_without_gadgets.num_vertices()
    if g_without_gadgets.num_edges() > (num_inputs * num_vertices - comb(num_inputs+1, 2)): return None # Prerequisite for causal flow
    
    path_cover = build_path_cover(g_without_gadgets)
    if not path_cover: return None
    
    successor_function, P, L = get_chain_decomp(g_without_gadgets, path_cover)
    sup = compute_suprema(g_without_gadgets, successor_function, P, L)
    if not sup: return None
    
    for n in gadgets.keys():
        connecting = gadget_connections[n]
        for m in gadgets.keys():
            connecting_m = gadget_connections[m]
            first = None
            for v_n in connecting:
                for v_m in connecting_m:
                    if v_n == v_m: continue
                    if v_n not in P.keys() or v_m not in P.keys(): return None # gadgets are connected
                    if n == m and P[v_n] == P[v_m]: return None
                    if v_n in g.inputs() or v_m in g.inputs(): continue
                    if sup[(P[path_cover.prev(v_m)], v_n)] <= L[path_cover.prev(v_m)]: #v_n < F.prev(v_m)
                        if first == 'm': return None
                        first = 'n'
                    if sup[(P[path_cover.prev(v_n)], v_m)] <= L[path_cover.prev(v_n)]: #v_m < F.prev(v_n)
                        if first == 'n': return None
                        first = 'm'
    return successor_function, P, L, sup

class Dipaths:
    """Class for handling dipaths, used for calculating causal flow"""
    def __init__(self, vertices: Sequence[VT]) -> None:
        self.vertices: Dict[VT, bool] = {v: False for v in vertices}
        self.arcs: Dict[VT, List[List[VT]]] = {v: [[],[]] for v in vertices}
    def prev(self, v):
        return next(iter(self.arcs[v][0]), [])
    def next(self, v):
        return next(iter(self.arcs[v][1]), [])
    def add_arc(self, v, w):
        self.arcs[v][1].append(w)
        self.arcs[w][0].append(v)
        self.vertices[v] = True
        self.vertices[w] = True
    def del_arc(self, v, w):
        self.arcs[v][1].remove(w)
        if not self.arcs[v][0]: self.vertices[v] = False
        self.arcs[w][0].remove(v)
        if not self.arcs[w][1]: self.vertices[w] = False
					
def build_path_cover(g: BaseGraph[VT, ET]) -> Optional[Dipaths]:
	"""Tries to build a path cover for g"""
	F = Dipaths(g.vertices()) # Collection of vertex disjoint Dipaths in G
	visited = {v: 0 for v in g.vertices()}
	i = 0
	for inp in g.inputs():
		i += 1
		F, visited, success = augment_search(g, F, i, visited, inp)
		if not success: return None
	if len([v for v in g.vertices() if not F.vertices[v]]) == 0: return F
	else: return None

def augment_search(g: BaseGraph[VT, ET], F: Dipaths, iter: int, visited: Dict[VT,int], v: VT) -> Tuple[Dipaths, Dict[VT, int], bool]:
	"""Searches for an output vertex along pre-alternating walks for F starting at v, subject to limitations on the end-points of the search paths"""
	visited[v] = iter
	if v in g.outputs(): return(F, visited, True)
	if F.vertices[v] and v not in g.inputs() and visited[F.prev(v)] < iter:
		F, visited, success = augment_search(g, F, iter, visited, F.prev(v))
		if success:
			F.del_arc(F.prev(v),v)
			return F, visited, True
	for w in g.neighbors(v):
		if visited[w] < iter and w not in g.inputs() and F.next(v) != w:
			if not F.vertices[w]:
				F, visited, success = augment_search(g, F, iter, visited, w)
				if success:
					F.add_arc(v,w)
					return F, visited, True
			elif visited[F.prev(w)] < iter:
				F, visited, success = augment_search(g, F, iter, visited, F.prev(w))
				if success:
					F.del_arc(F.prev(w),w)
					F.add_arc(v,w)
					return F, visited, True
	return F, visited, False

def get_chain_decomp(g: BaseGraph[VT, ET], C: Dipaths) -> Tuple[Dict[VT,VT], Dict[VT,VT], Dict[VT,int]]:
	"""Obtain the successor function f of the path cover C, and obtain functions describing the chain decomposition of the influencing digraph"""
	P: Dict[VT, VT] = {}
	L: Dict[VT, int] = {v:0 for v in g.vertices()}
	f: Dict[VT, VT] = {}
	for inp in g.inputs():
		l = 0
		v = inp
		while v not in g.outputs():
			try: f[v] = C.next(v)
			except: raise Exception(f'Vertex: {v}')
			P[v] = inp
			L[v] = l
			if C.next(v)==None: print(v)
			v = C.next(v)
			l += 1
		P[v] = inp
		L[v] = l
	return f, P, L

def compute_suprema(g: BaseGraph[VT, ET], f: Dict[VT,VT], P: Dict[VT,VT], L: Dict[VT,int]) -> Optional[Dict[Tuple[VT, VT], int]]:
	"""Compute the natural pre-order for successor function f in the form of a supremum function and functions characterising C"""
	sup, status = init_status(g,P,L)
	for v in [v for v in g.vertices() if v not in g.outputs()]:
		if not status[v]: sup, status = traverse_infl_walk(g,f,sup,status,v)
		if status[v] == 'pending': return None
	return sup
	
def init_status(g: BaseGraph[VT, ET], P: Dict[VT,VT], L: Dict[VT,int]) -> Tuple[Dict[Tuple[VT, VT], int],Dict[VT, Optional[Union[bool, str]]]]:
	"""Initialise the supremum function, and the status of each vertex"""
	sup: Dict[Tuple[VT,VT],int] = {}
	status: Dict[VT,Optional[Union[bool,str]]] = {v:None for v in g.vertices()}
	for v in g.vertices():
		for inp in g.inputs():
			if inp == P[v]: sup[(inp,v)] = L[v]
			else: sup[(inp,v)]=g.num_vertices()
		if v in g.outputs(): status[v]=True
	return sup, status

def traverse_infl_walk(g: BaseGraph[VT, ET], f: Dict[VT,VT], sup: Dict[Tuple[VT, VT], int], status: Dict[VT, Optional[Union[bool, str]]], v: VT) -> Tuple[Dict[Tuple[VT, VT], int], Dict[VT, Optional[Union[bool, str]]]]:
	"""Compute the suprema of v and all of it's descedants, by traversing influencing walks from v"""
	status[v] = 'pending'
	for w in list(g.neighbors(f[v]))+[f[v]]:
		if w != v:
			if not status[w]: sup, status = traverse_infl_walk(g,f,sup,status,w)
			if status[w] == 'pending': return sup, status
			else:
				for inp in g.inputs():
					if sup[(inp,v)] > sup[(inp,w)]: sup[(inp,v)] = sup[(inp,w)]
	status[v] = True
	return sup, status  