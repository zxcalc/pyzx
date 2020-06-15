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