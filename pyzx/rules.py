# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

"""
This file contains rewrite rules for ZX-graphs based on the ZX-calculus.

The current rewrites are based on:

- Spider fusion.
- The bialgebra equation.
- Local Complementation.
- A few variations on Pivoting.
- Removing of identities.

Each of these rewrite rules consists of three methods:

- ``match_*`` finds a single match of the rule in a graph.
- ``match_*_parallel`` finds as many non-overlapping matches as possible.
- The final method takes a list of matches produced by these methods and returns
  a 4-tuple ``(edge_table, verts_to_remove, edges_to_remove, check_for_isolated_vertices)``.
  ``edge_table`` should be fed to :meth:`~graph.base.BaseGraph.add_edge_table`, 
  ``verts_to_remove`` to :meth:`~graph.base.BaseGraph.remove_vertices` (and similarly for ``edges_to_remove``).
  If ``check_for_isolated_vertices`` is ``True``, then 
  :meth:`~graph.base.BaseGraph.remove_isolated_vertices`
  should be called.

These rewrite rules are used in the simplification procedures of :mod:`simplify`. 
In particular, they are used in combination with :func:`simplify.simp` to create rewrite strategies.
"""

from typing import Tuple, List, Dict, Any

from fractions import Fraction
import itertools

from .utils import VertexType, EdgeType, toggle_edge

TypeRewriteOutput = Tuple[Dict[Any,Tuple[int,int]], List, List, bool]

def apply_rule(g, rewrite, m, check_isolated_vertices=True):
    etab, rem_verts, rem_edges, check_isolated_vertices = rewrite(g, m)
    g.add_edge_table(etab)
    g.remove_edges(rem_edges)
    g.remove_vertices(rem_verts)
    if check_isolated_vertices: g.remove_isolated_vertices()


def match_bialg(g):
    """Does the same as :func:`match_bialg_parallel` but with ``num=1``."""
    types = g.types()
    for e in g.edges():
        v0, v1 = g.edge_st(e)
        v0t = types[v0]
        v1t = types[v1]
        if (v0t == VertexType.Z and v1t == VertexType.X) or (v0t == VertexType.X and v1t == VertexType.Z):
            v0n = [n for n in g.neighbours(v0) if not n == v1]
            v1n = [n for n in g.neighbours(v1) if not n == v0]
            if (
                all([types[n] == v1t for n in v0n]) and
                all([types[n] == v0t for n in v1n])):
                return [[v0,v1,v0n,v1n]]
    return []


#TODO: make it be hadamard edge aware
def match_bialg_parallel(g, matchf=None, num=-1):
    """Finds noninteracting matchings of the bialgebra rule.
    
    :param g: An instance of a ZX-graph.
    :param matchf: An optional filtering function for candidate edge, should
       return True if a edge should considered as a match. Passing None will
       consider all edges.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param edgelist: List of edges to consider. If -1 (the default), looks 
       at all edges.
    :rtype: List of 4-tuples ``(v1, v2, neighbours_of_v1,neighbours_of_v2)``
    """
    if matchf != None: candidates = set([e for e in g.edges() if matchf(e)])
    else: candidates = g.edge_set()
    types = g.types()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v0, v1 = g.edge_st(candidates.pop())
        v0t = types[v0]
        v1t = types[v1]
        if ((v0t == VertexType.Z and v1t == VertexType.X) or (v0t == VertexType.X and v1t == VertexType.Z)):
            v0n = [n for n in g.neighbours(v0) if not n == v1]
            v1n = [n for n in g.neighbours(v1) if not n == v0]
            if (
                all([types[n] == v1t for n in v0n]) and
                all([types[n] == v0t for n in v1n])):
                i += 1
                for v in v0n:
                    for c in g.incident_edges(v): candidates.discard(c)
                for v in v1n:
                    for c in g.incident_edges(v): candidates.discard(c)
                m.append([v0,v1,v0n,v1n])
    return m


def bialg(g, matches):
    """Performs a certain type of bialgebra rewrite given matchings supplied by
    ``match_bialg(_parallel)``."""
    rem_verts = []
    etab = dict()
    for m in matches:
        rem_verts.append(m[0])
        rem_verts.append(m[1])
        es = [(i,j) if i < j else (j,i) for i in m[2] for j in m[3]]
        for e in es:
            if e in etab: etab[e][0] += 1
            else: etab[e] = [1,0]
    
    return (etab, rem_verts, [], True)

def match_spider(g):
    """Does the same as :func:`match_spider_parallel` but with ``num=1``."""
    for e in g.edges():
        if g.edge_type(e) != EdgeType.SIMPLE: continue
        v0, v1 = g.edge_st(e)
        if (g.type(v0) == g.type(v1)):
            return [[v0,v1]]
    return []

def match_spider_parallel(g, matchf=None, num=-1):
    """Finds non-interacting matchings of the spider fusion rule.
    
    :param g: An instance of a ZX-graph.
    :param matchf: An optional filtering function for candidate edge, should
       return True if the edge should be considered for matchings. Passing None will
       consider all edges.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :rtype: List of 2-tuples ``(v1, v2)``
    """
    if matchf != None: candidates = set([e for e in g.edges() if matchf(e)])
    else: candidates = g.edge_set()
    types = g.types()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if g.edge_type(e) != EdgeType.SIMPLE: continue
        v0, v1 = g.edge_st(e)
        v0t = types[v0]
        v1t = types[v1]
        if (v0t == v1t and v0t!=VertexType.BOUNDARY and v0t!=VertexType.H_BOX):
                i += 1
                for v in g.neighbours(v0):
                    for c in g.incident_edges(v): candidates.discard(c)
                for v in g.neighbours(v1):
                    for c in g.incident_edges(v): candidates.discard(c)
                m.append([v0,v1])
    return m


def spider(g, matches):
    '''Performs spider fusion given a list of matchings from ``match_spider(_parallel)``
    '''
    rem_verts = []
    etab = dict()
    types = g.types()

    for m in matches:
        if g.row(m[0]) == 0:
            v0, v1 = m[1], m[0]
        else:
            v0, v1 = m[0], m[1]

        g.add_to_phase(v0, g.phase(v1))

        if g.track_phases:
            g.fuse_phases(v0,v1)

        # always delete the second vertex in the match
        rem_verts.append(v1)

        # edges from the second vertex are transferred to the first
        for w in g.neighbours(v1):
            if v0 == w: continue
            e = (v0,w)
            if e not in etab: etab[e] = [0,0]
            etab[e][g.edge_type((v1,w))-1] += 1
    return (etab, rem_verts, [], True)

def unspider(g, m, qubit=-1, row=-1):
    """Undoes a single spider fusion, given a match ``m``. A match is a list with 3
    elements given by::

      m[0] : a vertex to unspider
      m[1] : the neighbours of the new node, which should be a subset of the
             neighbours of m[0]
      m[2] : the phase of the new node. If omitted, the new node gets all of the phase of m[0]

    Returns the index of the new node. Optional parameters ``qubit`` and ``row`` can be used
    to position the new node. If they are omitted, they are set as the same as the old node.
    """
    v = g.add_vertex(ty=g.type(m[0]))
    g.set_qubit(v, qubit if qubit != -1 else g.qubit(m[0]))
    g.set_row(v, row if row != -1 else g.row(m[0]))

    g.add_edge((m[0], v))
    for n in m[1]:
        e = g.edge(m[0],n)
        g.add_edge((v,n), edgetype=g.edge_type(e))
        g.remove_edge(e)
    if len(m) >= 3:
        g.add_phase(v, m[2])
        g.add_phase(m[0], Fraction(0) - m[2])
    else:
        g.set_phase(v, g.phase(m[0]))
        g.set_phase(m[0], 0)
    return v


def match_pivot(g):
    """Does the same as :func:`match_pivot_parallel` but with ``num=1``."""
    return match_pivot_parallel(g, num=1, check_edge_types=True)


def match_pivot_parallel(g, matchf=None, num=-1, check_edge_types=False):
    """Finds non-interacting matchings of the pivot rule.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param check_edge_types: Whether the method has to check if all the edges involved
       are of the correct type (Hadamard edges).
    :param matchf: An optional filtering function for candidate edge, should
       return True if a edge should considered as a match. Passing None will
       consider all edges.
    :rtype: List of 4-tuples. See :func:`pivot` for the details.
    """
    if matchf != None: candidates = set([e for e in g.edges() if matchf(e)])
    else: candidates = g.edge_set()
    types = g.types()
    phases = g.phases()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if not check_edge_types and g.edge_type(e) != EdgeType.HADAMARD: continue
        v0, v1 = g.edge_st(e)

        if not (types[v0] == VertexType.Z and types[v1] == VertexType.Z): continue

        v0a = phases[v0]
        v1a = phases[v1]
        if not ((v0a in (0,1)) and (v1a in (0,1))): continue

        invalid_edge = False

        v0n = list(g.neighbours(v0))
        v0b = []
        for n in v0n:
            et = g.edge_type(g.edge(v0,n))
            if types[n] == VertexType.Z and et == EdgeType.HADAMARD: pass
            elif types[n] == VertexType.BOUNDARY: v0b.append(n)
            else:
                invalid_edge = True
                break

        if invalid_edge: continue

        v1n = list(g.neighbours(v1))
        v1b = []
        for n in v1n:
            et = g.edge_type(g.edge(v1,n))
            if types[n] == VertexType.Z and et == EdgeType.HADAMARD: pass
            elif types[n] == VertexType.BOUNDARY: v1b.append(n)
            else:
                invalid_edge = True
                break

        if invalid_edge: continue
        if len(v0b) + len(v1b) > 1: continue

        i += 1
        for v in v0n:
            for c in g.incident_edges(v): candidates.discard(c)
        for v in v1n:
            for c in g.incident_edges(v): candidates.discard(c)
        b0 = list(v0b)
        b1 = list(v1b)
        m.append([v0,v1,b0,b1])
    return m

def match_pivot_gadget(g, matchf=None, num=-1):
    """Like :func:`match_pivot_parallel`, but except for pairings of
    Pauli vertices, it looks for a pair of an interior Pauli vertex and an
    interior non-Clifford vertex in order to gadgetize the non-Clifford vertex."""
    if matchf != None: candidates = set([e for e in g.edges() if matchf(e)])
    else: candidates = g.edge_set()
    types = g.types()
    phases = g.phases()
    rs = g.rows()
    
    edge_list = []
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        v0, v1 = g.edge_st(e)

        if not (types[v0] == VertexType.Z and types[v1] == VertexType.Z): continue

        v0a = phases[v0]
        v1a = phases[v1]
        
        if v0a not in (0,1):
            if v1a in (0,1):
                v0, v1 = v1, v0
                v0a, v1a = v1a, v0a
            else: continue
        elif v1a in (0,1): continue
        # Now v0 has a Pauli phase and v1 has a non-Pauli phase
        
        v0n = list(g.neighbours(v0))
        v1n = list(g.neighbours(v1))
        if len(v1n) == 1: continue # It is a phase gadget
        bad_match = False
        discard_edges = []
        for i,l in enumerate((v0n, v1n)):
            for n in l:
                if types[n] != VertexType.Z:
                    bad_match = True
                    break
                ne = list(g.incident_edges(n))
                if i==0 and len(ne) == 1 and not (e == ne[0]): # v0 is a phase gadget
                    bad_match = True
                    break
                discard_edges.extend(ne)
            if bad_match: break
        if bad_match: continue
                
        if any(types[w]!=VertexType.Z for w in v0n): continue
        if any(types[w]!=VertexType.Z for w in v1n): continue
        # Both v0 and v1 are interior
        
        v = g.add_vertex(VertexType.Z,-2,rs[v0],v1a)
        g.set_phase(v1, 0)
        g.set_qubit(v0,-1)
        g.update_phase_index(v1,v)
        edge_list.append((v,v1) if v<v1 else (v1,v))
        
        m.append([v0,v1,[],[v]])
        i += 1
        for c in discard_edges: candidates.discard(c)
    g.add_edges(edge_list,EdgeType.SIMPLE)
    return m


def match_pivot_boundary(g, matchf=None, num=-1):
    """Like :func:`match_pivot_parallel`, but except for pairings of
    Pauli vertices, it looks for a pair of an interior Pauli vertex and a
    boundary non-Pauli vertex in order to gadgetize the non-Pauli vertex."""
    if matchf != None: candidates = set([v for v in g.vertices() if matchf(v)])
    else: candidates = g.vertex_set()
    types = g.types()
    phases = g.phases()
    rs = g.rows()
    
    edge_list = []
    consumed_vertices = set()
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        if types[v] != VertexType.Z or phases[v] not in (0,1): continue

        good_vert = True
        w = None
        bound = None
        for n in g.neighbours(v):
            if types[n] == VertexType.BOUNDARY:
                good_vert = False
                break
            if len(g.neighbours(n)) == 1: # v is a phase gadget
                good_vert = False
                break
            if n in consumed_vertices:
                good_vert = False
                break
            boundaries = [b for b in g.neighbours(n) if types[b]==VertexType.BOUNDARY]
            if len(boundaries) != 1: # n is not on the boundary,
                continue             # or it is connected to both an input and an output
            if phases[n] and phases[n].denominator == 2:
                w = n
                bound = boundaries[0]
            if not w:
                w = n
                bound = boundaries[0]
        if not good_vert or not w: continue
        
        if bound in g.inputs: mod = 0.5
        else: mod = -0.5
        v1 = g.add_vertex(VertexType.Z,-2,rs[w]+mod,phases[w])
        v2 = g.add_vertex(VertexType.Z,-1,rs[w]+mod,0)
        g.set_phase(w, 0)
        g.update_phase_index(w,v1)
        edge_list.append((w,v2) if w<v2 else (v2,w))
        edge_list.append((v1,v2) if v1<v2 else (v2,v1))
        for n in g.neighbours(v): consumed_vertices.add(n)
        for n in g.neighbours(w): consumed_vertices.add(n)
        
        m.append([v,w,[],[bound]])
        i += 1
        for n in g.neighbours(v): candidates.discard(n)
        for n in g.neighbours(w): candidates.discard(n)

    g.add_edges(edge_list, EdgeType.HADAMARD)
    return m

def pivot(g, matches):
    """Perform a pivoting rewrite, given a list of matches as returned by
    ``match_pivot(_parallel)``. A match is itself a list where:

    ``m[0]`` : first vertex in pivot.
    ``m[1]`` : second vertex in pivot.
    ``m[2]`` : list of zero or one boundaries adjacent to ``m[0]``.
    ``m[3]`` : list of zero or one boundaries adjacent to ``m[1]``.
    """
    rem_verts = []
    rem_edges = []
    etab = dict()


    for m in matches:
        # compute:
        #  n[0] <- non-boundary neighbours of m[0] only
        #  n[1] <- non-boundary neighbours of m[1] only
        #  n[2] <- non-boundary neighbours of m[0] and m[1]
        g.update_phase_index(m[0],m[1])
        n = [set(g.neighbours(m[0])), set(g.neighbours(m[1]))]
        for i in range(2):
            n[i].remove(m[1-i])
            if len(m[i+2]) == 1: n[i].remove(m[i+2][0])
        n.append(n[0] & n[1])
        n[0] = n[0] - n[2]
        n[1] = n[1] - n[2]
        es = ([(s,t) if s < t else (t,s) for s in n[0] for t in n[1]] +
              [(s,t) if s < t else (t,s) for s in n[1] for t in n[2]] +
              [(s,t) if s < t else (t,s) for s in n[0] for t in n[2]])
        k0, k1, k2 = len(n[0]), len(n[1]), len(n[2])
        g.scalar.add_power(k0*k2 + k1*k2 + k0*k1)
        
        for v in n[2]: g.add_to_phase(v, 1)

        if g.phase(m[0]) and g.phase(m[1]): g.scalar.add_phase(Fraction(1))
        if not m[2] and not m[3]: 
            g.scalar.add_power(-(k0+k1+2*k2-1))
        elif not m[2]:
            g.scalar.add_power(-(k1+k2))
        else: g.scalar.add_power(-(k0+k2))

        for i in range(2):
            # if m[i] has a phase, it will get copied on to the neighbours of m[1-i]:
            a = g.phase(m[i])
            for v in n[1-i]: g.add_to_phase(v, a)
            for v in n[2]: g.add_to_phase(v, a)

            if not m[i+2]:
                # if there is no boundary, the other vertex is destroyed
                rem_verts.append(m[1-i])
            else:
                # if there is a boundary, toggle whether it is an h-edge or a normal edge
                # and point it at the other vertex
                e = g.edge(m[i], m[i+2][0])
                new_e = (m[1-i], m[i+2][0])
                if new_e[0] > new_e[1]: new_e = (new_e[1],new_e[0])
                ne,nhe = etab.get(new_e, (0,0))
                if g.edge_type(e) == EdgeType.SIMPLE: nhe += 1
                elif g.edge_type(e) == EdgeType.HADAMARD: ne += 1
                etab[new_e] = (ne,nhe)
                rem_edges.append(e)


        for e in es:
            nhe = etab.get(e, (0,0))[1]
            etab[e] = (0,nhe+1)

    return (etab, rem_verts, rem_edges, True)

def match_lcomp(g):
    """Same as :func:`match_lcomp_parallel`, but with ``num=1``"""
    return match_lcomp_parallel(g, num=1, check_edge_types=True)

def match_lcomp_parallel(g, vertexf=None, num=-1, check_edge_types=False):
    """Finds noninteracting matchings of the local complementation rule.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param check_edge_types: Whether the method has to check if all the edges involved
       are of the correct type (Hadamard edges).
    :param vertexf: An optional filtering function for candidate vertices, should
       return True if a vertex should be considered as a match. Passing None will
       consider all vertices.
    :rtype: List of 2-tuples ``(vertex, neighbours)``.
    """
    if vertexf != None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    types = g.types()
    phases = g.phases()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        vt = types[v]
        va = g.phase(v)
        
        if not (va == Fraction(1,2) or va == Fraction(3,2)): continue

        if check_edge_types and not (
            all(g.edge_type(e) == EdgeType.HADAMARD for e in g.incident_edges(v))
            ): continue
                
        vn = list(g.neighbours(v))

        if not all(types[n] == vt for n in vn): continue # and phases[n].denominator <= 2

        for n in vn: candidates.discard(n)
        m.append([v,vn])
    return m

def lcomp(g, matches):
    """Performs a local complementation based rewrite rule on the given graph with the
    given ``matches`` returned from ``match_lcomp(_parallel)``. See *insert paper here* 
    for more details on the rewrite"""
    etab = dict()
    rem = []
    for m in matches:
        a = g.phase(m[0])
        rem.append(m[0])
        if a.numerator == 1: g.scalar.add_phase(Fraction(1,4))
        else: g.scalar.add_phase(Fraction(7,4))
        n = len(m[1])
        g.scalar.add_power((n-2)*(n-1)//2)
        for i in range(n):
            g.add_to_phase(m[1][i], -a)
            for j in range(i+1, n):
                e = (m[1][i],m[1][j])
                if (e[0] > e[1]): e = (e[1],e[0])
                he = etab.get(e, (0,0))[1]
                etab[e] = (0, he+1)

    return (etab, rem, [], True)


def match_ids(g):
    """Finds a single identity node. See :func:`match_ids_parallel`."""
    return match_ids_parallel(g, num=1)

def match_ids_parallel(g, vertexf=None, num=-1):
    """Finds non-interacting identity vertices.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param vertexf: An optional filtering function for candidate vertices, should
       return True if a vertex should be considered as a match. Passing None will
       consider all vertices.
    :rtype: List of 4-tuples ``(identity_vertex, neighbour1, neighbour2, edge_type)``.
    """
    if vertexf != None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    types = g.types()
    phases = g.phases()

    i = 0
    m = []

    while (num == -1 or i < num) and len(candidates) > 0:
        v = candidates.pop()
        if phases[v] != 0: continue
        neigh = g.neighbours(v)
        if len(neigh) != 2: continue
        v0, v1 = neigh
        candidates.discard(v0)
        candidates.discard(v1)
        if g.edge_type((v,v0)) != g.edge_type((v,v1)): #exactly one of them is a hadamard edge
            m.append((v,v0,v1,2))
        else: m.append((v,v0,v1,1))
        i += 1
    return m

def remove_ids(g, matches):
    """Given the output of ``match_ids(_parallel)``, returns a list of edges to add,
    and vertices to remove."""
    etab = dict()
    rem = []
    for m in matches:
        rem.append(m[0])
        e = (m[1],m[2]) if m[1] < m[2] else (m[2],m[1])
        if not e in etab: etab[e] = [0,0]
        etab[e][m[3]-1] += 1
    return (etab, rem, [], False)
    


def match_phase_gadgets(g):
    """Determines which phase gadgets act on the same vertices, so that they can be fused together.
    
    :param g: An instance of a ZX-graph.
    :rtype: List of 5-tuples ``(axel,leaf, total combined phase, other axels with same targets, other leafs)``.
    """
    phases = g.phases()

    parities = dict()
    gadgets = dict()
    # First we find all the phase-gadgets, and the list of vertices they act on
    for v in g.vertices():
        if phases[v] != 0 and phases[v].denominator > 2 and len(list(g.neighbours(v)))==1:
            n = list(g.neighbours(v))[0]
            if phases[n] not in (0,1): continue # Not a real phase gadget (happens for scalar diagrams)
            if n in gadgets: continue # Not a real phase gadget (happens for scalar diagrams)
            if n in g.inputs or n in g.outputs: continue # Not a real phase gadget (happens for non-unitary diagrams)
            gadgets[n] = v
            par = frozenset(set(g.neighbours(n)).difference({v}))
            if par in parities: parities[par].append(n)
            else: parities[par] = [n]

    m = []
    for par, gad in parities.items():
        if len(gad) == 1: 
            n = gad[0]
            v = gadgets[n]
            if phases[n] != 0: # If the phase of the axel vertex is pi, we change the phase of the gadget
                g.scalar.add_phase(phases[v])
                g.phase_negate(v)
                m.append((v,n,-phases[v],[],[]))
        else:
            totphase = sum((1 if phases[n]==0 else -1)*phases[gadgets[n]] for n in gad)%2
            for n in gad:
                if phases[n] != 0:
                    g.scalar.add_phase(phases[gadgets[n]])
                    g.phase_negate(gadgets[n])
            g.scalar.add_power(-((len(par)-1)*(len(gad)-1)))
            n = gad.pop()
            v = gadgets[n]
            m.append((v,n,totphase, gad, [gadgets[n] for n in gad]))
    return m

def merge_phase_gadgets(g, matches):
    """Given the output of :func:``match_phase_gadgets``, removes phase gadgets that act on the same set of targets."""
    rem = []
    for v, n, phase, othergadgets, othertargets in matches:
        g.set_phase(v, phase)
        g.set_phase(n, 0)
        rem.extend(othergadgets)
        rem.extend(othertargets)
        for w in othertargets:
            g.fuse_phases(v,w)
            if g.merge_vdata != None:
                g.merge_vdata(g, v, w)
    return ({}, rem, [], False)



def match_supplementarity(g):
    """Finds pairs of non-Clifford spiders that are connected to exactly the same set of vertices.
    
    :param g: An instance of a ZX-graph.
    :rtype: List of 4-tuples ``(vertex1, vertex2, type of supplementarity, neighbours)``.
    """
    candidates = g.vertex_set()
    phases = g.phases()

    parities = dict()
    m = []
    taken = set()
    # First we find all the non-Clifford vertices and their list of neighbours
    while len(candidates) > 0:
        v = candidates.pop()
        if phases[v] == 0 or phases[v].denominator <= 2: continue # Skip Clifford vertices
        neigh = set(g.neighbours(v))
        if not neigh.isdisjoint(taken): continue
        par = frozenset(neigh)
        if par in parities: 
            for w in parities[par]:
                if (phases[v]-phases[w]) % 2 == 1 or (phases[v]+phases[w]) % 2 == 1:
                    m.append((v,w,1,par))
                    taken.update({v,w})
                    taken.update(neigh)
                    candidates.difference_update(neigh)
                    break
            else: parities[par].append(v)
            if v in taken: continue
        else: parities[par] = [v]
        for w in neigh:
            if phases[w] == 0 or phases[w].denominator <= 2 or w in taken: continue
            diff = neigh.symmetric_difference(g.neighbours(w))
            if len(diff) == 2: # Perfect overlap
                if (phases[v] + phases[w]) % 2 == 0 or (phases[v] - phases[w]) % 2 == 1:
                    m.append((v,w,2,neigh.difference({w})))
                    taken.update({v,w})
                    taken.update(neigh)
                    candidates.difference_update(neigh)
                    break
    return m

def apply_supplementarity(g, matches):
    """Given the output of :func:``match_supplementarity``, removes non-Clifford spiders that act on the same set of targets trough supplementarity."""
    rem = []
    for v, w, t, neigh in matches:
        rem.append(v)
        rem.append(w)
        alpha = g.phase(v)
        beta = g.phase(w)
        g.scalar.add_power(-2*len(neigh))
        if t == 1: # v and w are not connected
            g.scalar.add_node(2*alpha+1)
            #if (alpha-beta)%2 == 1: # Standard supplementarity    
            if (alpha+beta)%2 == 1: # Need negation on beta
                g.scalar.add_phase(-alpha + 1)
                for n in neigh:
                    g.add_to_phase(n,1)
        elif t == 2: # they are connected
            g.scalar.add_power(-1)
            g.scalar.add_node(2*alpha)
            #if (alpha-beta)%2 == 1: # Standard supplementarity 
            if (alpha+beta)%2 == 0: # Need negation
                g.scalar.add_phase(-alpha)
                for n in neigh:
                    g.add_to_phase(n,1)
        else: raise Exception("Shouldn't happen")
    return ({}, rem, [], True)


def match_copy(g, vertexf=None):
    """Finds spiders with a 0 or pi phase that have a single neighbour,
    and copies them through. Assumes that all the spiders are green and maximally fused."""
    if vertexf != None: candidates = set([v for v in g.vertices() if vertexf(v)])
    else: candidates = g.vertex_set()
    phases = g.phases()
    types = g.types()
    m = []

    while len(candidates) > 0:
        v = candidates.pop()
        if phases[v] not in (0,1) or types[v] != VertexType.Z or g.vertex_degree(v) != 1: continue
        w = list(g.neighbours(v))[0]
        if types[w] != VertexType.Z: continue
        neigh = [n for n in g.neighbours(w) if n != v]
        m.append((v,w,phases[v],phases[w],neigh))
        candidates.discard(w)
        candidates.difference_update(neigh)

    return m

def apply_copy(g, matches):
    rem = []
    types = g.types()
    for v,w,a,alpha, neigh in matches:
        rem.append(v)
        rem.append(w)
        g.scalar.add_power(-len(neigh)+1)
        if a: g.scalar.add_phase(alpha)
        for n in neigh: 
            if types[n] == VertexType.BOUNDARY:
                r = g.row(n) - 1 if n in g.outputs else g.row(n)+1
                u = g.add_vertex(VertexType.Z, g.qubit(n), r, a)
                e = g.edge((w,n))
                et = g.edge_type(e)
                g.add_edge((n,u), toggle_edge(et))
            g.add_to_phase(n, a)
    return ({}, rem, [], True)




def match_gadgets_phasepoly(g):
    """Finds groups of phase-gadgets that act on the same set of 4 vertices in order to apply a rewrite based on
    rule R_13 of the paper *A Finite Presentation of CNOT-Dihedral Operators*.""" 
    targets = {}
    gadgets = {}
    for v in g.vertices():
        if v not in g.inputs and v not in g.outputs and len(list(g.neighbours(v)))==1:
            if g.phase(v) != 0 and g.phase(v).denominator != 4: continue
            n = list(g.neighbours(v))[0]
            tgts = frozenset(set(g.neighbours(n)).difference({v}))
            if len(tgts)>4: continue
            gadgets[tgts] = (n,v)
            for t in tgts:
                if t in targets: targets[t].add(tgts)
                else: targets[t] = {tgts}
        if g.phase(v) != 0 and g.phase(v).denominator == 4:
            if v in targets: targets[v].add(frozenset([v]))
            else: targets[v] = {frozenset([v])}
    targets = {t:s for t,s in targets.items() if len(s)>1}
    matches = {}

    for v1,t1 in targets.items():
        s = t1.difference(frozenset([v1]))
        if len(s) == 1:
            c = s.pop()
            if any(len(targets[v2])==2 for v2 in c): continue
        s = t1.difference({frozenset({v1})})
        for c in [d for d in s if not any(d.issuperset(e) for e in s if e!=d)]:
            if not all(v2 in targets for v2 in c): continue
            if any(v2<v1 for v2 in c): continue
            a = set()
            for t in c: a.update([i for s in targets[t] for i in s if i in targets])
            for group in itertools.combinations(a.difference(c),4-len(c)):
                group = list(group)+list(c)
                a = set()
                for t in group: a.update([s for s in targets[t] if s.issubset(group)])
                if len(a)>7:
                    matches[frozenset(group)] = a

    m = []
    taken = set()
    for group, gad in sorted(matches.items(), key=lambda a: len(a[1]), reverse=True):
        if taken.intersection(group): continue
        m.append((list(group), {s:(gadgets[s] if len(s)>1 else list(s)[0]) for s in gad}))
        taken.update(group)

    return m


def apply_gadget_phasepoly(g, matches):
    """Uses the output of :func:`match_gadgets_phasepoly` to apply a rewrite based 
    on rule R_13 of the paper *A Finite Presentation of CNOT-Dihedral Operators*.""" 
    rs = g.rows()
    phases = g.phases()
    for group, gadgets in matches:
        for i in range(4):
            v1 = group[i]
            g.add_to_phase(v1, Fraction(5,4))

            for j in range(i+1,4):
                v2 = group[j]
                f = frozenset({v1,v2})
                if f in gadgets:
                    n,v = gadgets[f]
                    phase = phases[v]
                    if phases[n]:
                        phase = -phase
                        g.set_phase(n,0)
                else:
                    n = g.add_vertex(VertexType.Z,-1, rs[v2]+0.5)
                    v = g.add_vertex(VertexType.Z,-2, rs[v2]+0.5)
                    phase = 0
                    g.add_edges([(n,v),(v1,n),(v2,n)],EdgeType.HADAMARD)
                g.set_phase(v, phase + Fraction(3,4))

                for k in range(j+1,4):
                    v3 = group[k]
                    f = frozenset({v1,v2,v3})
                    if f in gadgets:
                        n,v = gadgets[f]
                        phase = phases[v]
                        if phases[n]:
                            phase = -phase
                            g.set_phase(n,0)
                    else:
                        n = g.add_vertex(VertexType.Z,-1, rs[v3]+0.5)
                        v = g.add_vertex(VertexType.Z,-2, rs[v3]+0.5)
                        phase = 0
                        g.add_edges([(n,v),(v1,n),(v2,n),(v3,n)],EdgeType.HADAMARD)
                    g.set_phase(v, phase + Fraction(1,4))
        f = frozenset(group)
        if f in gadgets:
            n,v = gadgets[f]
            phase = phases[v]
            if phases[n]:
                phase = -phase
                g.set_phase(n,0)
        else:
            n = g.add_vertex(1,-1, rs[group[0]]+0.5)
            v = g.add_vertex(1,-2, rs[group[0]]+0.5)
            phase = 0
            g.add_edges([(n,v)]+[(n,w) for w in group],2)
        g.set_phase(v, phase + Fraction(7,4))
