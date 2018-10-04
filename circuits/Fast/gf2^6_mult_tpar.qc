# Original circuit
#   qubits: 18
#   qubits used: 18
#   H: 22
#   cnot: 257
#   X: 0
#   T: 252
#   P: 0
#   Z: 0
#   tdepth (by partitions): 108
#   tdepth (by critical paths): 60
# Optimized circuit
#   qubits: 18
#   qubits used: 18
#   H: 22
#   cnot: 649
#   X: 0
#   T: 150
#   P: 19
#   Z: 2
#   tdepth (by partitions): 9
#   tdepth (by critical paths): 9
#   Time: 0.007 s
.v a0 a1 a2 a3 a4 a5 b0 b1 b2 b3 b4 b5 c0 c1 c2 c3 c4 c5
.i a0 a1 a2 a3 a4 a5 b0 b1 b2 b3 b4 b5
.o a0 a1 a2 a3 a4 a5 b0 b1 b2 b3 b4 b5 c0 c1 c2 c3 c4 c5

BEGIN
H c0
H c1
H c2
H c3
H c4
tof b2 a0
tof b5 a1
tof b3 a3
tof b4 a2
tof b2 a4
tof b3 a5
tof b3 b0
tof c0 b1
tof b4 b3
tof c1 b2
tof b5 b4
tof c1 b5
tof c0 c1
tof b5 c5
tof b4 b5
tof b5 c1
tof b3 b5
tof b2 b5
tof b3 c1
tof b2 c5
tof b1 c1
tof a5 c1
tof a5 b0
tof a4 c5
tof a5 c2
tof a4 b2
tof a4 b5
tof a2 b4
tof a3 b3
tof a1 c0
T* c1
T* b1
T* a4
T* a3
T* a2
T* a1
T c0
T* b5
T* b2
T* b3
T* b4
T* a5
T c2
T* c5
T* b0
T* a0
tof a5 b5
tof b1 c1
tof b5 b1
tof a1 a3
tof c0 a3
tof b5 a4
tof c2 a3
tof c0 a1
tof b3 a2
tof b4 a2
tof a5 a2
tof c2 a1
tof c4 a2
tof a1 a2
tof b2 b5
tof a5 c0
tof c2 c0
tof c4 c0
tof b4 b3
tof a5 b3
tof c2 b3
tof b0 b2
tof c4 b3
tof c4 b4
tof a5 b4
tof b0 a5
tof a0 c2
tof c4 c5
tof c4 a0
tof a0 b0
tof c3 a0
tof b0 c4
tof a0 c3
tof a5 b0
tof b4 b0
tof a5 c4
tof a5 c5
tof b0 c2
tof b0 a0
tof b2 c5
tof b3 c2
tof b3 a0
tof b2 a5
tof b5 c5
tof c0 c5
tof c0 c2
tof b5 a5
tof b5 b2
tof a1 c0
tof a2 c0
tof a1 c5
tof c0 c2
tof a1 a5
tof a2 c3
tof a2 b4
tof a2 b3
tof a3 c3
tof a4 c3
tof a4 c4
tof a4 c5
tof c3 c2
tof a3 c0
tof c3 b0
tof a3 a5
tof a3 b4
tof a3 a2
tof a3 a0
tof a4 b5
tof c1 b1
tof b1 a5
tof c1 a0
tof c1 a3
tof c1 a1
T* c1
T b3
T* a4
T* b5
T* a1
T* a3
T* a0
T a2
T* b1
T* b4
T* c3
T* b2
T* a5
T* b0
T* c0
T* c2
T* c5
T* c4
tof a4 c1
tof a1 c1
tof a3 c1
tof b1 c1
tof b4 c1
tof a5 c1
tof c0 b3
tof c2 b3
tof c5 b3
tof c4 b3
tof b0 c1
tof b0 b3
tof b0 b4
tof c2 b4
tof c4 b4
tof b5 a4
tof b4 b5
tof b4 a3
tof c0 a3
tof c2 a1
tof c5 a3
tof c4 a1
tof a3 a1
tof b1 a2
tof b4 a2
tof a5 a2
tof c0 a2
tof c5 a2
tof c3 b4
tof a5 b1
tof c0 b1
tof c2 b4
tof c5 b1
tof b4 b1
tof b0 b4
tof b0 b2
tof c5 c0
tof c4 c3
tof c0 c3
tof c0 b2
tof c0 b0
tof b0 a5
tof c4 c2
tof c0 c2
tof c0 c4
tof b0 c4
tof b0 c0
tof b2 c4
tof c3 c4
tof c3 c5
tof c3 c2
tof c3 c0
tof b4 c0
tof b1 b4
tof b1 c4
tof b4 b2
tof b1 c5
tof b1 c2
tof b4 b0
tof b1 c3
tof a3 a2
tof a1 a3
tof a1 c4
tof a1 a5
tof a3 c0
tof a1 c3
tof a1 b1
tof a1 c5
tof a1 c2
tof a1 b4
tof a4 b5
tof b5 a2
tof b5 a0
tof b3 c0
tof c1 c0
tof c0 a2
tof c1 b1
tof c1 c5
tof c1 c2
tof c1 b4
tof b3 a1
tof c1 b0
tof b3 c3
P* b3
T* b3
T* c1
T c3
T* b0
T a1
T* b4
T* c2
T* c5
T* b1
T* a4
T* a3
T c0
T* b5
T* a0
T* a2
T* b2
T* a5
T* c4
tof b0 b3
tof a1 b3
tof b4 c1
tof a4 b3
tof a3 c1
tof c0 c1
tof b5 c2
tof a5 c1
tof c2 b3
tof c2 c1
tof a1 b0
tof c2 b4
tof a4 c3
tof a3 c3
tof c0 c3
tof a5 b4
tof b4 c3
tof b4 b0
tof c2 a1
tof a4 b4
tof b4 a1
tof a5 b4
tof a3 a4
tof c0 a4
tof b5 c5
tof a4 c2
tof a4 c5
tof a3 b1
tof c0 b1
tof a5 a4
tof a5 a3
tof b5 a3
tof b5 c0
tof a5 b5
tof a5 a0
tof a5 c4
tof b5 a5
tof a3 c0
tof c0 a5
tof c0 a2
tof a4 a5
tof b1 a4
tof a4 a2
tof a4 c0
tof a4 a0
tof c2 c5
tof c2 a2
tof c2 c0
tof c2 a0
tof c2 a3
tof c2 b5
tof c2 b1
tof b4 b2
tof a1 b2
tof b2 c4
tof b4 a3
tof b4 b5
tof b0 c4
tof b0 b2
tof b0 a1
tof b0 c2
tof c1 a3
tof c1 b5
tof c1 a4
tof c1 c2
tof c1 c3
tof c1 b0
T c1
T* b0
T c3
T* b3
T c2
T* a1
T* a5
T* b4
T* b1
T a4
T* b5
T* a3
T a0
T* c0
T* a2
T* c5
T* b2
T* c4
tof c2 b0
tof a5 c3
tof b1 b0
tof b5 b0
tof c0 b0
tof c5 c1
tof b0 c1
tof c3 b0
tof c2 b3
tof a5 a1
tof b4 a1
tof a4 a1
tof b5 b3
tof c0 c3
tof a1 c3
tof a1 b3
tof a5 c2
tof a3 a1
tof b5 c2
tof b5 a1
tof b1 a5
tof a4 b4
tof b5 a5
tof a3 a5
tof a0 b4
tof b5 b1
tof a0 a4
tof c5 a4
tof b2 a4
tof a3 b1
tof a3 a4
tof c0 b5
tof a0 b5
tof a0 a3
tof a2 c0
tof c0 a0
tof c4 c5
tof c5 a2
tof c4 b2
tof c0 a2
tof a0 c0
tof a2 c5
tof a2 c4
tof a2 b2
tof b5 c4
tof b5 b2
tof b5 a2
tof a3 c0
tof b1 a4
tof a4 b2
tof b4 c0
tof a5 c0
tof a5 c5
tof c0 c4
tof c0 a2
tof c0 a4
tof c0 a3
tof b4 a0
tof a1 b1
tof c1 c4
tof c1 a2
T* b0
T b1
P a3
T a3
T* c5
T* b3
T* a5
T a1
T b5
T* b4
T* c0
T a0
T* c3
T* c1
T* a4
tof c5 b1
tof a5 b0
tof b5 b1
tof c0 b1
tof c3 b0
tof a1 b0
tof a1 b1
tof b4 a5
tof c0 a5
tof a5 a3
tof a5 c5
tof a1 a5
tof c0 b4
tof a5 b3
tof b4 a5
tof c0 b5
tof b4 a1
tof b4 b5
tof c4 c1
tof c1 a4
tof b4 c0
tof a5 a1
tof a5 c3
tof c5 b5
tof a3 c5
tof a3 b3
tof a3 c0
tof a3 a1
tof a3 b4
H b0
P* c5
P* c4
P* a3
P* c3
P* a5
P* c2
P* b2
P* b5
P* c1
P* b4
Z b1
P c0
P* a4
P* a2
H b1
H a1
H c0
H a0
tof a0 b3
tof c0 a0
tof a1 c0
tof b1 a1
tof b0 b1
H b0
H b1
H a1
H c0
H a0
H b3
tof c4 a2
tof b5 c1
tof b1 a2
tof b3 c1
tof c3 a5
tof a0 b2
tof b3 a5
tof c4 a3
tof b3 a3
tof a1 a4
tof a1 c4
tof b5 c3
tof c0 c3
tof b3 c3
tof b3 c2
tof a1 b5
tof b3 b5
tof a1 b0
tof b1 b0
tof c0 a1
tof a0 c0
tof b3 a0
tof a0 b3
tof a1 c0
tof a1 a0
tof b0 b1
tof b5 a0
tof b5 a1
tof c3 a0
tof c4 c0
tof a4 b1
tof c4 b0
tof a4 b3
tof b2 b3
tof a5 a0
tof a2 b0
tof c1 b5
tof c1 c3
tof c1 a1
T a3
T a5
T* c2
T c1
T* a0
T* c0
T* b2
T* a1
T c3
T* a4
T b3
T* b5
T* c4
T a2
T* b0
T* b1
tof a0 a5
tof a1 a3
tof c3 a3
tof a4 a5
tof b3 b2
tof c4 a3
tof a5 a3
tof b2 a5
tof c0 c1
tof b2 c1
tof c3 c2
tof b5 a4
tof c4 c1
tof b0 c2
tof b1 c2
tof a4 c2
tof a4 c1
tof b2 c0
tof a4 c0
tof b5 a0
tof c4 c3
tof c0 a0
tof c3 c0
tof a4 a1
tof c4 a1
tof a1 b2
tof b3 a1
tof b3 c3
tof c4 c3
tof b5 c3
tof b5 a4
tof c4 b5
tof a2 b5
tof b0 b5
tof b1 b5
tof b0 a2
tof b1 a2
tof a2 c4
tof b1 b0
tof b0 b1
tof c4 b0
tof b3 b1
tof b3 a2
tof b3 b0
tof b3 c4
tof c3 a4
tof a4 b1
tof a4 a2
tof c3 b0
tof c3 c4
tof c3 b3
tof a1 c3
tof b2 c3
tof c0 b1
tof c0 a2
tof c0 b0
tof c0 c4
tof c0 a4
tof c0 b3
tof c0 c3
tof a0 b2
tof a5 c2
T* a5
T* c1
T* c3
T a3
T a0
T* b2
T a1
T* c0
T c2
P b3
T b3
T* a4
T* c4
T b5
T* b0
T* a2
T b1
tof a0 a5
tof b2 a5
tof c0 a5
tof c4 c3
tof b0 c1
tof a2 a5
tof c5 c3
tof c3 a5
tof c3 c1
tof a0 c3
tof b2 c3
tof a1 c3
tof b3 c3
tof a4 c3
tof c4 a3
tof c5 a3
tof b0 c3
tof b0 a3
tof a1 a0
tof b3 a0
tof a4 a0
tof b0 c4
tof c5 c4
tof b2 a0
tof c4 b2
tof a4 c0
tof b0 a1
tof a2 a1
tof c5 a1
tof c2 a1
tof c2 c0
tof a4 b3
tof c4 b3
tof b3 c2
tof c5 b3
tof a2 b0
tof c5 b0
tof c4 a4
tof b0 c4
tof a2 b5
tof c5 b5
tof c5 b0
tof b0 a2
tof b5 a2
tof b0 b1
tof c4 b1
tof c4 a2
tof c4 b5
tof c4 b0
tof b3 a4
tof c2 b3
tof c2 b0
tof c2 c4
tof a1 c0
tof c0 c5
tof a1 b0
tof a1 c4
tof a1 c2
tof c3 a3
tof c3 a2
tof c3 c0
tof c3 a4
tof c3 b3
tof c3 b2
tof c3 b4
tof a5 c1
tof a5 b4
tof a5 c3
tof a5 b5
tof a5 a1
T* a5
T a1
T* b5
T* c3
T b4
P* a0
T* a0
T* a3
T c1
T* c2
T b2
T* c4
T* b0
T* b3
T* a4
T* c0
T c5
T* a2
T b1
tof b0 a1
tof b3 a1
tof c0 a5
tof c5 a5
tof c3 a5
tof c3 a1
tof c0 b5
tof c5 b5
tof c3 b5
tof b4 c3
tof a3 a0
tof c0 b4
tof c5 b4
tof c0 c1
tof c5 c1
tof c1 a3
tof c0 b0
tof c5 b0
tof b0 c2
tof b0 b2
tof b0 c4
tof b3 b0
tof c0 a4
tof c5 a4
tof c0 c5
tof a4 c0
tof b0 b3
tof c2 b2
tof a3 c1
tof a0 c1
tof a0 a3
tof c3 b4
tof b5 a2
H b1
P* b4
Z b3
P a2
H a2
tof c1 c5
tof c1 b5
tof b4 a1
tof b4 b2
tof c2 a5
tof b4 a0
tof b4 a5
tof b4 c2
tof b4 c4
tof b4 c0
tof c1 c0
tof c1 b0
tof c1 a3
tof b4 c3
tof c1 a4
tof b4 a4
tof b4 b3
tof b0 c1
tof c0 b4
tof c4 a4
tof a1 b3
tof a1 c0
tof b5 a4
tof b5 c1
T* c2
T a5
T* a0
T* c4
T* b2
T* a1
T* c3
T* b4
T c0
T* b5
T* b0
T c1
T* c5
T* a3
T* b3
T a4
tof b4 a1
tof c0 a1
tof a5 c2
tof a1 a5
tof a1 a0
tof a1 c4
tof a1 b2
tof c3 a1
tof c0 b4
tof b0 c0
tof c1 b5
tof b5 c0
tof a4 c1
tof a3 b0
tof a3 c1
tof a3 c5
tof b0 c1
tof c1 a4
tof b0 a3
tof b0 c5
tof b5 a3
tof b5 c5
tof b5 b0
tof b4 b3
tof b4 c0
tof a1 c3
tof c4 c1
tof c2 a5
H c1
H b3
H a3
H c3
tof c5 c3
tof c3 c5
tof c5 c3
tof c3 b3
tof b3 c3
tof c3 b3
tof b3 b5
tof b5 b3
tof b3 b5
tof b5 a1
tof a1 b5
tof b5 a1
tof a1 a4
tof a4 a1
tof a1 a4
tof a4 a0
tof a0 a4
tof a4 a0
tof b4 b0
tof b0 b4
tof b4 b0
tof b0 a5
tof a5 b0
tof b0 a5
tof a5 c2
tof c2 a5
tof a5 c2
tof c2 c1
tof c1 c2
tof c2 c1
tof c1 a2
tof a2 c1
tof c1 a2
tof b2 c0
tof c0 b2
tof b2 c0
tof c0 b1
tof b1 c0
tof c0 b1
tof b1 c4
tof c4 b1
tof b1 c4
tof c4 a3
tof a3 c4
tof c4 a3
END
