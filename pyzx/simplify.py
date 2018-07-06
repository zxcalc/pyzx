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

"""Contains simplification procedures based in the rewrite rules in rules_.
"""

from __future__ import print_function

try:
    import multiprocessing as mp
except ImportError:
    pass

__all__ = ['bialg_simp','spider_simp', 'phase_free_simp', 'pivot_simp', 
        'lcomp_simp', 'clifford_simp', 't_count', 'to_gh', 'to_rg']

from .rules import *

def simp(g, name, match, rewrite, quiet=False):
    """Helper method for generating simplification strategies based on rules in rules_.
    It keeps matching and rewriting with the given methods until it can no longer do so.
    Example usage: ``simp(g, 'spider_simp', rules.match_spider_parallel, rules.spider)``

    :param g: The graph that needs to be simplified.
    :param str name: The name of this rewrite rule.
    :param match: One of the ``match_*`` functions of rules_.
    :param rewrite: One of the rewrite functions of rules_."""
    i = 0
    new_matches = True
    if not quiet: print(name)
    while new_matches:
        i += 1
        new_matches = False
        m = match(g)
        if len(m) > 0:
            if not quiet: print(len(m), end='')
            #print(len(m), end='', flush=True) #flush only supported on Python >3.3
            etab, rem_verts, check_isolated_vertices = rewrite(g, m)
            g.add_edge_table(etab)
            g.remove_vertices(rem_verts)
            if check_isolated_vertices: g.remove_isolated_vertices()
            if not quiet: print('. ', end='')
            #print('. ', end='', flush=True)
            new_matches = True
    if not quiet: print('\nfinished in ' + str(i) + ' iterations')

def pivot_simp(g, quiet=False):
    return simp(g, 'pivot_simp', match_pivot_parallel, pivot, quiet=quiet)

def lcomp_simp(g, quiet=False):
    return simp(g, 'lcomp_simp', match_lcomp_parallel, lcomp, quiet=quiet)

def bialg_simp(g, quiet=False):
    return simp(g, 'bialg_simp', match_bialg_parallel, bialg, quiet=quiet)

def spider_simp(g, quiet=False):
    return simp(g, 'spider_simp', match_spider_parallel, spider, quiet=quiet)

def id_simp(g, quiet=False):
    return simp(g, 'id_simp', match_ids_parallel, remove_ids, quiet=quiet)

def phase_free_simp(g, quiet=False):
    '''Performs the following set of simplifications on the graph:
    spider -> bialg'''
    spider_simp(g, quiet=quiet)
    bialg_simp(g, quiet=quiet)

def clifford_simp(g, quiet=False):
    '''Performs the following set of simplifications on the graph:
    spider -> pivot -> lcomp -> pivot -> id'''
    spider_simp(g, quiet=quiet)
    to_gh(g)
    spider_simp(g, quiet=quiet)
    pivot_simp(g, quiet=quiet)
    lcomp_simp(g, quiet=quiet)
    pivot_simp(g, quiet=quiet)
    #to_rg(g)
    id_simp(g, quiet=quiet)
    spider_simp(g, quiet=quiet)

def to_gh(g):
    """Turns every red node into a green node by changing regular edges into hadamard edges"""
    ty = g.types()
    for v in g.vertices():
        if ty[v] == 2:
            g.set_type(v, 1)
            for e in g.incident_edges(v):
                et = g.edge_type(e)
                if et == 2: g.set_edge_type(e,1)
                elif et == 1: g.set_edge_type(e,2)

def to_rg(g, select=None):
    """Turn green nodes into red nodes by colour-changing vertices which satisfy the predicate ``select``.
    By default, the predicate is set to greedily reducing the number of Hadamard-edges.
    :param g: A ZX-graph.
    :param select: A function taking in vertices and returning ``True`` or ``False``."""
    if not select:
        select = lambda v: (
            len([e for e in g.incident_edges(v) if g.edge_type(e) == 1]) <
            len([e for e in g.incident_edges(v) if g.edge_type(e) == 2])
            )

    ty = g.types()
    for v in g.vertices():
        if select(v):
            if ty[v] == 1:
                g.set_type(v, 2)
                for e in g.incident_edges(v):
                    g.set_edge_type(e, 1 if g.edge_type(e) == 2 else 2)
            elif ty[v] == 2:
                g.set_type(v, 1)
                for e in g.incident_edges(v):
                    g.set_edge_type(e, 1 if g.edge_type(e) == 2 else 2)




def simp_iter(g, name, match, rewrite):
    """Version of :func:`simp` that instead of performing all rewrites at once, returns an iterator."""
    i = 0
    new_matches = True
    while new_matches:
        i += 1
        new_matches = False
        m = match(g)
        if len(m) > 0:
            etab, rem_verts, check_isolated_vertices = rewrite(g, m)
            g.add_edge_table(etab)
            g.remove_vertices(rem_verts)
            if check_isolated_vertices: g.remove_isolated_vertices()
            yield g, name+str(i)
            new_matches = True

def pivot_iter(g):
    return simp_iter(g, 'pivot', match_pivot_parallel, pivot)

def lcomp_iter(g):
    return simp_iter(g, 'lcomp', match_lcomp_parallel, lcomp)

def bialg_iter(g):
    return simp_iter(g, 'bialg', match_bialg_parallel, bialg)

def spider_iter(g):
    return simp_iter(g, 'spider', match_spider_parallel, spider)

def id_iter(g):
    return simp_iter(g, 'id', match_ids_parallel, remove_ids)

def clifford_iter(g):
    for d in spider_iter(g): yield d
    to_gh(g)
    yield g, "to_gh"
    for d in spider_iter(g): yield d
    for d in pivot_iter(g): yield d
    for d in lcomp_iter(g): yield d
    for d in pivot_iter(g): yield d
    #to_rg(g)
    #yield g, "to_rg"
    for d in id_iter(g): yield d
    for d in spider_iter(g): yield d



def t_count(g):
    """Returns the amount of T-gates in ``g``."""
    count = 0
    for a in g.phases().values():
        if a.denominator == 4:
            count += 1
    return count

def _worker(arg):
    match, rewrite, g, kwargname, kwarg = arg
    m =  match(g, **{kwargname:kwarg})
    if m: return (len(m),rewrite(g, m))
    return None

def simp_threaded(g, name, match, rewrite, uses_verts=False,safe=False,skip_unthreaded_pass=False):
    """Version of :func:`simp` that uses :mod:`multiprocessing`."""
    nthreads = 5
    i = 0
    new_matches = True
    sep = int(g.vindex / nthreads) + 1 #TODO: currently only works on graph_s
    pool = mp.Pool(processes=nthreads)
    #Threaded pass
    print("Starting {} with {} threads".format(name,str(nthreads)))
    while new_matches:
        new_matches = False
        if uses_verts:
            chunks = [set(g.vertices_in_range(j*sep,(j+1)*sep)) for j in range(nthreads)]
            for j in range(nthreads-1):
                if chunks[j] & chunks[j+1]:
                    raise Exception("overlapping chunks")
            results = pool.map(_worker, ((match, rewrite, g, "vertexlist", chunks[j]) for j in range(nthreads)),
                                        #set(g.vertices_in_range(j*sep,(j+1)*sep))) for j in range(nthreads)),
                                chunksize=1)
        else:
            chunks = [set(g.edges_in_range(j*sep,(j+1)*sep,safe)) for j in range(nthreads)]
            for j in range(nthreads-1):
                if chunks[j] & chunks[j+1]:
                    raise Exception("overlapping chunks")
            results = pool.map(_worker, ((match, rewrite, g, "edgelist", chunks[j]) for j in range(nthreads)),
                                        #set(g.edges_in_range(j*sep,(j+1)*sep,safe))) for j in range(nthreads)),
                                chunksize=1)

        check_isolated_vertices = False
        for j,r in enumerate(results):
            if not r: continue
            new_matches = True
            amount, (etab, rem_verts, check) = r
            print(amount, end=',')
            if uses_verts and not chunks[j].issuperset(set(rem_verts)):
                raise Exception("Deleting vertices outside of chunk: ", chunks[j], set(rem_verts))
            else:
                for v in rem_verts:
                    if not (j*sep<v<(j+1)*sep):
                        raise Exception("Deleting vertices outside of chunk")
            g.add_edge_table(etab)
            g.remove_vertices(rem_verts)
            check_isolated_vertices = check
        if check_isolated_vertices: g.remove_isolated_vertices() 
        if new_matches: i += 1
        print('. ', end='')
    pool.close()
    #Unthreaded pass
    if not skip_unthreaded_pass:
        new_matches = True
        if i!=0: print("\nUnthreaded pass: ", end='')
        else: print("Unthreaded pass: ", end='') 
        while new_matches:
            new_matches = False
            m = match(g)
            if len(m) > 0:
                print(len(m), end='')
                etab, rem_verts, check_isolated_vertices = rewrite(g, m)
                g.add_edge_table(etab)
                g.remove_vertices(rem_verts)
                if check_isolated_vertices: g.remove_isolated_vertices()
                print('. ', end='')
                new_matches = True
            if new_matches: i += 1
    if i!=0:  print('\nDid ' + str(i) + ' nonzero iterations')
    else: print('Did ' + str(i) + ' nonzero iterations')


def pivot_threaded(g):
    return simp_threaded(g, 'pivot_simp', match_pivot_parallel, pivot, uses_verts=False,safe=True)

def lcomp_threaded_old(g):
    simp_threaded(g, 'lcomp_simp', match_lcomp_parallel, lcomp, uses_verts=True)

def lcomp_threaded(g):
    simp_threaded(g, 'lcomp_simp', match_lcomp_parallel, lcomp, uses_verts=True,skip_unthreaded_pass=True)
    print("Full pass: ",end='')
    nthreads = 5
    pool = mp.Pool(processes=nthreads)
    i = 0
    new_matches = True
    while new_matches:
        i += 1
        new_matches = False
        matches = match_lcomp_parallel(g)
        if len(matches) > 0:
            print(len(matches), end='')
            vs, ns = [], []
            for v, neighbours in matches:
                a = g.phase(v)
                for v2 in neighbours: g.add_to_phase(v2, -a)
                vs.append(v)
                ns.append(neighbours)
            for etab in pool.map(_lcomp_do, (ns[i:i + 10] for i in range(0, len(ns), 10))):
                g.add_edge_table(etab)
            g.remove_vertices(vs)
            print('. ', end='')
            new_matches = True
    pool.close()
    print('\nfinished in ' + str(i) + ' iterations')

def _lcomp_do(matches):
    etab = dict()
    for neighbours in matches:
        for i in range(len(neighbours)):
            for j in range(i+1, len(neighbours)):
                e = (neighbours[i],neighbours[j])
                if (e[0] > e[1]): e = (e[1],e[0])
                if e not in etab: etab[e] = [0,1]
                else: etab[e][1] += 1

    return etab

def bialg_threaded(g):
    return simp_threaded(g, 'bialg_simp', match_bialg_parallel, bialg, uses_verts=False)

def spider_threaded(g):
    return simp_threaded(g, 'spider_simp', match_spider_parallel, spider, uses_verts=False)

def id_threaded(g):
    return simp_threaded(g, 'id_simp', match_ids_parallel, remove_ids, uses_verts=True)

def clifford_threaded(g):
    spider_threaded(g)
    to_gh(g)
    lcomp_threaded(g)
    pivot_threaded(g)
    to_rg(g)
    id_threaded(g)
