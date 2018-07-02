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

def gflow(g):
	inputs = set()
	outputs = set()
	l = dict()
	g = dict()
	for v in g.vertices():
		l[v] = 0
		intputs.add(v) if g.vdata(v, 'i')
		outputs.add(v) if g.vdata(v, 'o')

	k = 0
	while True:
		correct = set()

		if len(correct) == 0:
			break
		else:
			outputs |= correct
			k += 1


