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

from typing import List, Tuple
from typing_extensions import Literal

from .circuit.gates import CNOT

def parity_network(n: int, S: List[List[Literal[0,1]]]) -> List[CNOT]:
    """Implements the parity network algorithm of https://arxiv.org/pdf/1712.01859.pdf.
    Specifically, it follows the pseudo-code of page 14."""
    c = [] # List of cnots
    Q: List[Tuple[List[List[Literal[0,1]]],List[int],int]] = [] # stack
    Q.append((S,list(range(n)),-1))
    while Q:
        S, I, i = Q.pop()
        if not S or not I: continue
        if i != -1:
            while True:
                for j in range(n):
                    if j==i: continue
                    if all(y[j] for y in S):
                        c.append(CNOT(j,i))
                        for (Sp,Ip,ip) in (Q+[(S,I,i)]):
                            for y in Sp:
                                y[j] = (y[i]+y[j])%2 # type: ignore # mypy doesn't understand this will always be Literal[0,1]
                        break
                else:
                    break
        j = max(I, key=lambda j: max([len([y for y in S if y[j]==0]),len([y for y in S if y[j]==1])]))
        S0 = [y.copy() for y in S if y[j]==0]
        S1 = [y.copy() for y in S if y[j]==1]
        Iprime = [jp for jp in I if jp!=j]
        if i == -1:
            Q.append((S1,Iprime,j))
        else:
            Q.append((S1,[jp for jp in I if jp!=i],i))
        Q.append((S0,Iprime, i))
    return c