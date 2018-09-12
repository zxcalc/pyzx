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


# Based on algorithm by Perdrix and Mhalla. Here is the pseudocode from
# dx.doi.org/10.1007/978-3-540-70575-8_70
#
# input : An open graph
# output: A generalised flow
#
# gFlow (V,Gamma,In,Out) =
# begin
#   for all v in Out do
#     l(v) := 0
#   end
#   return gFlowaux (V,Gamma,In,Out,1)
# end
#
# gFlowaux (V,Gamma,In,Out,k) =
# begin
#   C := {}
#   for all u in V \ Out do
#     Solve in F2 : Gamma[V \ Out, Out \ In] * I[X] = I[{u}]
#     if there is a solution X0 then
#       C := C union {u}
#       g(u) := X0
#       l(u) := k
#     end
#   end
#   if C = {} then
#     return (Out = V,(g,l))
#   else
#     return gFlowaux (V, Gamma, In, Out union C, k + 1)
#   end
# end
#

from .extract import bi_adj


def gflow(g):
	l = dict()
	g = dict()
	for v in g.outputs:
		l[v] = 0

	inputs = set(g.inputs)
	processed = set(g.outputs)
	vertices = set(g.vertices())
	k = 1
	while True:
		correct = set()
		unprocessed = list(vertices.difference(processed))
		processed_prime = list(unprocessed.difference(inputs))
		zerovec = [0]*len(processed_prime)
		for u in unprocessed:
			vu = zerovec.copy()
			vu[processed_prime.index(u)] = 1
			m = bi_adj(processed_prime, unprocessed)
			x = m.solve(vu)
			if x:
				correct.add(u)
				g[u] = x
				l[u] = k

		if not correct:
			if not unprocessed:
				return l, g, k
			return None
		else:
			processed.update(correct)
			k += 1


