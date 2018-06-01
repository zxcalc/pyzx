from __future__ import print_function

__all__ = ['bialg_simp','spider_simp', 'phase_free_simp']

from .rules import *

def bialg_simp(g):
    i = 0
    new_matches = True
    print('bialg_simp')
    while new_matches:
        i += 1
        new_matches = False
        m = match_bialg_parallel(g)
        if len(m) > 0:
            print(len(m), end='', flush=True)
            bialg(g, m)
            print('. ', end='', flush=True)
            new_matches = True
    print('\nfinished in ' + str(i) + ' iterations')

def spider_simp(g):
    i = 0
    new_matches = True
    print('spider_simp')
    while new_matches:
        i += 1
        new_matches = False
        m = match_spider_parallel(g)
        if len(m) > 0:
            print(len(m), end='', flush=True)
            spider(g, m)
            print('. ', end='', flush=True)
            new_matches = True
    print('\nfinished in ' + str(i) + ' iterations')

def phase_free_simp(g):
    spider_simp(g)
    bialg_simp(g)
