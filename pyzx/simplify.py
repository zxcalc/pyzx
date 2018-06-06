from __future__ import print_function

__all__ = ['bialg_simp','spider_simp', 'phase_free_simp', 'pivot_simp', 'lcomp_simp', 'clifford_simp']

from .rules import *

def simp(g, name, match, rewrite):
    i = 0
    new_matches = True
    print(name)
    while new_matches:
        i += 1
        new_matches = False
        m = match(g)
        if len(m) > 0:
            print(len(m), end='', flush=True)
            rewrite(g, m)
            print('. ', end='', flush=True)
            new_matches = True
    print('\nfinished in ' + str(i) + ' iterations')

def pivot_simp(g):
    return simp(g, 'pivot_simp', match_pivot_parallel, pivot)

def lcomp_simp(g):
    return simp(g, 'lcomp_simp', match_lcomp_parallel, lcomp)

def bialg_simp(g):
    return simp(g, 'bialg_simp', match_bialg_parallel, bialg)

def spider_simp(g):
    return simp(g, 'spider_simp', match_spider_parallel, spider)

def phase_free_simp(g):
    spider_simp(g)
    bialg_simp(g)

def clifford_simp(g):
    spider_simp(g)
    to_gh(g)
    lcomp_simp(g)
    pivot_simp(g)
    to_rg(g)

def to_gh(g):
    ty = g.get_types()
    for v in g.vertices():
        if ty[v] == 2:
            g.set_type(v, 1)
            for e in g.get_incident_edges(v):
                et = g.get_edge_type(e)
                if et == 2: g.set_edge_type(e,1)
                elif et == 1: g.set_edge_type(e,2)

def to_rg(g):
    ty = g.get_types()
    for v in g.vertices():
        if all(g.get_edge_type(e) == 2 for e in g.get_incident_edges(v)):
            if ty[v] == 1:
                g.set_type(v, 2)
                for e in g.get_incident_edges(v): g.set_edge_type(e, 1)
            elif ty[v] == 2:
                g.set_type(v, 1)
                for e in g.get_incident_edges(v): g.set_edge_type(e, 1)
