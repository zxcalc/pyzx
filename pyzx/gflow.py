
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


