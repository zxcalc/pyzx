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
- Pivoting.
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
"""

from fractions import Fraction


def match_bialg(g):
    """Does the same as :func:`match_bialg_parallel` but with ``num=1``."""
    types = g.types()
    for e in g.edges():
        v0, v1 = g.edge_st(e)
        v0t = types[v0]
        v1t = types[v1]
        if ((v0t == 1 and v1t == 2) or (v0t == 2 and v1t == 1)):
            v0n = [n for n in g.neighbours(v0) if not n == v1]
            v1n = [n for n in g.neighbours(v1) if not n == v0]
            if (
                all([types[n] == v1t for n in v0n]) and
                all([types[n] == v0t for n in v1n])):
                return [[v0,v1,v0n,v1n]]
    return []


#TODO: make it be hadamard edge aware
def match_bialg_parallel(g, num=-1, edgelist=-1):
    """Finds noninteracting matchings of the bialgebra rule.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param edgelist: List of edges to consider. If -1 (the default), looks 
       at all edges.
    :rtype: List of 4-tuples ``(v1, v2, neighbours_of_v1,neighbours_of_v2)``
    """
    if edgelist!=-1: candidates = set(edgelist)
    else: candidates = g.edge_set()
    types = g.types()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        v0, v1 = g.edge_st(candidates.pop())
        v0t = types[v0]
        v1t = types[v1]
        if ((v0t == 1 and v1t == 2) or (v0t == 2 and v1t == 1)):
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
        if g.edge_type(e) != 1: continue
        v0, v1 = g.edge_st(e)
        if (g.type(v0) == g.type(v1)):
            return [[v0,v1]]
    return []

def match_spider_parallel(g, num=-1, edgelist=-1):
    """Finds noninteracting matchings of the spider fusion rule.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param edgelist: List of edges to consider. If -1 (the default), looks 
       at all edges.
    :rtype: List of 2-tuples ``(v1, v2)``
    """
    if edgelist!=-1: candidates = set(edgelist)
    else: candidates = g.edge_set()
    types = g.types()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if g.edge_type(e) != 1: continue
        v0, v1 = g.edge_st(e)
        v0t = types[v0]
        v1t = types[v1]
        if (v0t == v1t and v0t!=0):
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
        v0 = m[0]
        g.set_phase(v0, g.phase(v0) + g.phase(m[1]))

        # always delete the second vertex in the match
        rem_verts.append(m[1])

        # edges from the second vertex are transferred to the first
        for v1 in g.neighbours(m[1]):
            if v0 == v1: continue
            e = (v0,v1)
            if e not in etab: etab[e] = [0,0]
            etab[e][g.edge_type((m[1],v1))-1] += 1
    
    return (etab, rem_verts, [], True)

# TODO: optimise for single-match case
def match_pivot(g):
    """Does the same as :func:`match_pivot_parallel` but with ``num=1``."""
    return match_pivot_parallel(g, num=1, check_edge_types=True)


def match_pivot_parallel(g, num=-1, check_edge_types=False, edgelist=-1):
    """Finds noninteracting matchings of the pivot rule.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param check_edge_types: Whether the method has to check if all the edges involved
       are of the correct type (Hadamard edges).
    :param edgelist: List of edges to consider. If -1 (the default), looks 
       at all edges.
    :rtype: List of 7-tuples. See :func:`pivot` for the details.
    """
    if edgelist!=-1: candidates = set(edgelist)
    else: candidates = g.edge_set()
    types = g.types()
    phases = g.phases()
    
    i = 0
    m = []
    while (num == -1 or i < num) and len(candidates) > 0:
        e = candidates.pop()
        if not check_edge_types and g.edge_type(e) != 2: continue
        v0, v1 = g.edge_st(e)

        v0t = types[v0]
        v1t = types[v1]
        if not (v0t == 1 and v1t == 1): continue

        v0a = phases[v0]
        v1a = phases[v1]
        if not ((v0a == 0 or v0a == 1) and (v1a == 0 or v1a == 1)): continue

        invalid_edge = False

        v0n = list(g.neighbours(v0))
        v0b = []
        for n in v0n:
            #if g.phase(n).denominator > 2:
            #    invalid_edge = True
            #    break
            et = g.edge_type(g.edge(v0,n))
            if types[n] == 1 and et == 2: pass
            elif types[n] == 0: v0b.append(n)
            else:
                invalid_edge = True
                break

        if invalid_edge: continue

        v1n = list(g.neighbours(v1))
        v1b = []
        for n in v1n:
            #if g.phase(n).denominator > 2:
            #    invalid_edge = True
            #    break
            et = g.edge_type(g.edge(v1,n))
            if types[n] == 1 and et == 2: pass
            elif types[n] == 0: v1b.append(n)
            else:
                invalid_edge = True
                break

        if invalid_edge: continue
        if not (len(v0b) + len(v1b) <= 1): continue

        i += 1
        for v in v0n:
            for c in g.incident_edges(v): candidates.discard(c)
        for v in v1n:
            for c in g.incident_edges(v): candidates.discard(c)
        #n0 = list(v0n - v1n)
        #n01 = list(v0n & v1n)
        #n1 = list(v1n - v0n)
        b0 = list(v0b)
        b1 = list(v1b)
        m.append([v0,v1,b0,b1])
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
        
        for v in n[2]: g.add_to_phase(v, 1)

        for i in range(2):
            # if m[i] has a phase, it will get copied on to the neighbours of m[1-i]:
            a = g.phase(m[i])
            for v in n[1-i]: g.add_to_phase(v, a)
            for v in n[2]: g.add_to_phase(v, a)


            if len(m[i+2]) == 0:
                # if there is no boundary, the other vertex is destroyed
                rem_verts.append(m[1-i])
            else:
                # if there is a boundary, toggle whether it is an h-edge or a normal edge
                # and point it at the other vertex
                e = g.edge(m[i], m[i+2][0])
                new_e = (m[1-i], m[i+2][0])
                if new_e[0] > new_e[1]: new_e = (new_e[1],new_e[0])
                ne,nhe = etab.get(new_e, (0,0))
                if g.edge_type(e) == 1: nhe += 1
                elif g.edge_type(e) == 2: ne += 1
                etab[new_e] = (ne,nhe)
                rem_edges.append(e)
                


        for e in es:
            nhe = etab.get(e, (0,0))[1]
            etab[e] = (0,nhe+1)

    return (etab, rem_verts, rem_edges, True)


def match_lcomp(g):
    """Same as :func:`match_lcomp_parallel`, but with ``num=1``"""
    return match_lcomp_parallel(g, num=1, check_edge_types=True)

def match_lcomp_parallel(g, num=-1, check_edge_types=False, vertexlist=-1):
    """Finds noninteracting matchings of the local complementation rule.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param check_edge_types: Whether the method has to check if all the edges involved
       are of the correct type (Hadamard edges).
    :param vertexlist: List of vertices to consider. If -1 (the default), looks 
       at all vertices.
    :rtype: List of 2-tuples ``(vertex, neighbours)``.
    """
    if vertexlist!=-1: candidates = set(vertexlist)
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
            all(g.edge_type(e) == 2 for e in g.incident_edges(v))
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
        for i in range(len(m[1])):
            g.add_to_phase(m[1][i], -a)
            for j in range(i+1, len(m[1])):
                e = (m[1][i],m[1][j])
                if (e[0] > e[1]): e = (e[1],e[0])
                he = etab.get(e, (0,0))[1]
                etab[e] = (0, he+1)

    return (etab, rem, [], False)


def match_ids(g):
    """Finds a single identity node. See :func:`match_ids_parallel`."""
    return match_ids_parallel(g, num=1)

def match_ids_parallel(g, num=-1, vertexlist=-1):
    """Finds noninteracting identity nodes.
    
    :param g: An instance of a ZX-graph.
    :param num: Maximal amount of matchings to find. If -1 (the default)
       tries to find as many as possible.
    :param vertexlist: List of vertices to consider. If -1 (the default), looks 
       at all vertices.
    :rtype: List of 4-tuples ``(identity_vertex, neighbour1, neighbour2, edge_type)``.
    """
    if vertexlist!=-1: candidates = set(vertexlist)
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
    return m

def remove_ids(g, matches):
    """Given the output of ``match_ids(_parallel)``, returns a list of edges to add,
    and vertices to remove."""
    etab = dict()
    rem = []
    for m in matches:
        rem.append(m[0])
        e = (m[1],m[2])
        if not e in etab: etab[e] = [0,0]
        etab[e][m[3]-1] += 1
    return (etab, rem, [], False)
    