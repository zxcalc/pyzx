# PyZX - Python library for quantum circuit rewriting 
#        and optimisation using the ZX-calculus
# Copyright (C) 2019 - Aleks Kissinger and John van de Wetering

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

from .simplify import spider_simp, id_simp
from .hrules import *

# a stripped-down version of "simp", since hrules don't return edge tables etc
def hsimp(g, name, match, rule, quiet=False):
    i = 0
    while True:
        ms = match(g)
        if len(ms) > 0:
            rule(g, ms)
            i += 1
            if i == 1 and not quiet: print("{}: ".format(name),end='')
            if not quiet: print(len(ms), end='. ')
        else:
            break
    if not quiet and i>0: print(' {!s} iterations'.format(i))
    return i

def hpivot_simp(g, quiet=False):
    while True:
        i = spider_simp(g, quiet=quiet)
        i += id_simp(g, quiet=quiet)

        hedge_to_hbox(g)
        i += hsimp(g, 'hpivot', match_hpivot, hpivot, quiet)
        i += hsimp(g, 'par_hbox', match_par_hbox, par_hbox, quiet)
        hbox_to_hedge(g)

        if i == 0: break
    