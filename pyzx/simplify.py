from .rules import *

def bialg_simp(g):
    i = 0
    new_matches = True
    while new_matches:
        i += 1
        new_matches = False
        m = match_bialg_parallel(g)
        if len(m) > 0:
            bialg(g, m)
            print(str(len(m)) + ' bialg')
            new_matches = True
    print('finished in ' + str(i) + ' iterations')

def spider_simp(g):
    i = 0
    new_matches = True
    while new_matches:
        i += 1
        new_matches = False
        m = match_spider_parallel(g)
        if len(m) > 0:
            spider(g, m)
            print(str(len(m)) + ' spider')
            new_matches = True
    print('finished in ' + str(i) + ' iterations')

def phase_free_simp(g):
    spider_simp(g)
    bialg_simp(g)
