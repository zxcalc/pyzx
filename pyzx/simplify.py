from .rules import *

def phase_free_simp(g):
    new_matches = True
    i = 0
    while new_matches:
        i += 1
        new_matches = False
        m = match_spider_parallel(g)
        if len(m) > 0:
            spider(g, m)
            print(str(len(m)) + ' spider')
            new_matches = True
        m = match_bialg_parallel(g)
        if len(m) > 0:
            bialg(g, m)
            print(str(len(m)) + ' bialg')
            new_matches = True
    print('finished in ' + str(i) + ' iterations')
