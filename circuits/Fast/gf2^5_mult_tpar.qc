# Original circuit
#   qubits: 15
#   qubits used: 15
#   H: 18
#   cnot: 179
#   X: 0
#   T: 175
#   P: 0
#   Z: 0
#   tdepth (by partitions): 75
#   tdepth (by critical paths): 51
# Optimized circuit
#   qubits: 15
#   qubits used: 15
#   H: 18
#   cnot: 535
#   X: 0
#   T: 111
#   P: 15
#   Z: 3
#   tdepth (by partitions): 9
#   tdepth (by critical paths): 9
#   Time: 0.004 s
.v a0 a1 a2 a3 a4 b0 b1 b2 b3 b4 c0 c1 c2 c3 c4
.i a0 a1 a2 a3 a4 b0 b1 b2 b3 b4
.o a0 a1 a2 a3 a4 b0 b1 b2 b3 b4 c0 c1 c2 c3 c4

BEGIN
H c0
H c1
H c2
H c3
tof b1 a0
tof b4 a2
tof b2 a3
tof b1 a4
tof b2 b1
tof b3 b2
tof c0 b3
tof c0 b4
tof c2 c0
tof c2 c4
tof c0 c4
tof c0 c2
tof b4 c2
tof b3 c4
tof b3 c0
tof b3 b4
tof b2 c4
tof b2 c0
tof b2 b4
tof b2 b3
tof b1 c4
tof b1 b3
tof a4 b3
tof a4 b1
tof a3 c0
tof a3 b4
tof a3 b2
tof a1 b0
tof a1 c2
P* c4
T* c4
T* a4
T* b3
T* a3
P* a1
T* a1
T* c2
P c1
T c1
T* b1
T* b2
T* a2
T* b4
T* c0
T* b0
T* a0
tof a4 c4
tof a3 c4
tof a1 c4
tof b1 c4
tof b0 c4
tof a3 a4
tof b1 a4
tof b1 b3
tof b1 a3
tof b4 a3
tof c2 a1
tof b2 a1
tof a2 a1
tof c0 a1
tof b2 c2
tof a2 c2
tof c0 c2
tof b0 c2
tof b2 c1
tof a2 b1
tof a2 b2
tof c0 b2
tof b4 a2
tof c0 a2
tof b0 a2
tof a0 b4
tof a0 c0
tof a0 b0
tof b4 b0
tof b4 c0
tof b4 a0
tof a2 c0
tof b2 b0
tof b2 c0
tof b2 a0
tof b2 b4
tof b1 c0
tof c2 b0
tof c2 c0
tof c2 a2
tof c2 b2
tof a1 a0
tof a1 b4
tof a1 c2
tof a3 c0
tof a3 b1
tof a3 b2
tof a4 b0
tof a4 b4
P* a0
T* a0
T* b3
T c1
T a1
T* a3
P* c2
T* c2
T* b2
T* a4
T* b1
T* a2
P* b4
T* b4
T* c4
T* c0
T* b0
tof b3 a0
tof c2 b3
tof b2 b3
tof c0 b3
tof b0 b3
tof a3 c1
tof b1 c1
tof a2 c1
tof b0 c1
tof c2 a1
tof b2 a1
tof a4 a1
tof b1 a1
tof c2 a3
tof b2 a3
tof b2 c2
tof a2 c2
tof b0 c2
tof a4 b2
tof b1 b2
tof a2 b2
tof c4 b2
tof c0 b2
tof c0 a4
tof b0 a4
tof a2 b1
tof c0 b1
tof b0 a2
tof c0 b4
tof b0 b4
tof b0 c0
tof b4 c4
tof a2 c4
tof a2 b4
tof a2 c0
tof a2 b0
tof b1 c4
tof a4 c4
tof a4 b4
tof a4 c0
tof b2 c4
tof c2 c4
tof c2 b4
tof c2 a4
tof c2 b1
tof c2 a2
tof c2 b0
tof a3 c0
tof a3 a4
tof a3 b0
tof a1 c0
tof a1 a4
tof b3 b4
tof b3 c0
tof b3 a1
tof b3 c1
tof b3 b0
tof b3 b2
tof b3 c2
tof b3 b1
tof b3 a2
tof a0 b4
tof a0 c0
tof a0 a1
tof a0 c1
T* a2
T b3
T a0
T* b1
T* c2
T b2
P* a3
T* a3
T b0
T c1
T* a1
T* a4
T c0
T* b4
T* c4
tof b3 a2
tof b1 a2
tof c2 a2
tof c1 a2
tof a1 a2
tof a4 a2
tof c2 b3
tof c1 b3
tof a1 b3
tof a4 b3
tof b2 a0
tof c1 a0
tof a1 a0
tof c0 a0
tof c2 b1
tof c1 b1
tof a1 b1
tof c0 b1
tof b2 c2
tof a3 c2
tof c1 c2
tof c1 b2
tof a1 b2
tof c0 b2
tof b0 a3
tof a1 b0
tof c0 b0
tof a1 c1
tof c0 c1
tof a4 a1
tof b4 c0
tof c0 c4
tof c0 b4
tof a4 c4
tof a4 b4
tof a4 c0
tof a1 c0
tof a1 a4
tof c1 c4
tof c1 a4
tof b0 c4
tof b0 b4
tof b0 c0
tof b0 a1
tof b0 c1
tof a3 c4
tof a3 b4
tof a3 c0
tof a3 a1
tof a3 c1
tof a3 b0
tof c2 c4
tof c2 c0
tof c2 b2
tof b1 c4
tof b1 a4
tof b1 a1
tof b1 b0
tof a0 c4
tof a0 c0
tof a0 c2
tof a2 b3
tof a2 c2
T* b2
P* b4
T* b4
T* a3
T* a2
T* a0
T c2
T* b1
T* b0
T* c1
T* a1
T* a4
T* c0
T* b3
T* c4
tof b1 b2
tof a1 b2
tof a2 b4
tof a0 b4
tof c2 b4
tof b0 b4
tof c3 b4
tof a2 a3
tof a0 a3
tof c2 a3
tof a1 a3
tof c3 a3
tof a0 a2
tof c2 a2
tof a1 a2
tof c2 a0
tof a1 c2
tof a1 b1
tof c3 b1
tof a1 b0
tof c0 b0
tof a1 c1
tof c3 c1
tof c3 a1
tof c3 c0
tof c1 a4
tof c1 b3
tof c1 c4
tof b0 c0
tof a0 c2
tof a0 c3
tof a2 a4
tof a2 a1
tof a2 c0
tof a2 b3
tof a2 c4
tof a2 b1
tof a2 c1
tof a2 c2
tof a2 c3
tof b4 a4
tof b4 a1
tof b4 c0
tof b4 b3
tof b4 c4
tof b4 b1
tof b4 c1
tof b4 a3
tof b4 a2
tof b4 a0
tof b2 a3
P* c2
T* c2
T* b2
T b4
T* a0
T* a2
T c3
T* b0
tof a0 b2
tof c3 b2
tof a0 b4
tof a2 b4
tof c3 b4
tof c3 a0
tof c3 a2
tof c0 b0
tof a2 c3
tof a0 c3
tof c1 c0
Z a2
Z b2
P* c1
P* c0
P a4
tof c1 c0
H b2
H a1
H a4
H c3
tof c3 b2
tof a4 b4
tof a1 c3
tof b2 a4
H b2
H a1
H a4
H c3
H b4
tof b3 b0
tof a1 b0
tof c3 a3
tof b4 c1
tof b4 b1
tof a4 c4
tof a4 b3
tof a1 b2
tof a4 b2
tof c3 a4
tof b4 c3
tof a4 c3
tof b2 a1
tof b3 b2
tof b3 c3
tof c4 a1
tof c4 b4
tof c1 b4
tof a3 a4
tof a3 c2
tof b0 b2
T* b1
T* c3
T* c1
T* a3
T c2
T* c4
T b4
T* a4
T* b3
T b0
T* b2
T* a1
tof c3 b1
tof c1 b1
tof c4 b1
tof b4 b1
tof c4 c3
tof b3 c3
tof a2 c3
tof a3 c1
tof c4 c1
tof b4 c1
tof a4 c1
tof b3 c1
tof c4 a3
tof b4 a3
tof a4 a3
tof b3 a3
tof b4 c2
tof a4 c2
tof a2 c2
tof a2 c4
tof b3 b4
tof b2 b4
tof a1 b4
tof c0 b4
tof b3 a4
tof b0 a4
tof b2 a4
tof a1 a4
tof b2 b3
tof a1 b3
tof a2 b3
tof c0 b3
tof a2 b0
tof c0 b0
tof a1 b2
tof a2 a1
tof b2 a1
tof b2 c0
tof b0 c0
tof b0 b2
tof b3 a1
tof b3 c0
tof b4 a1
tof b4 c0
tof b4 b2
tof b4 b0
tof b4 b3
tof c4 a1
tof c4 c0
tof a3 a1
tof a3 c0
tof a3 b2
tof a3 b0
tof a3 c4
tof a3 b3
tof a3 b4
tof a3 c2
tof c1 a1
tof c1 c0
tof c1 b2
tof c1 b0
tof c1 c4
tof c1 b3
tof c1 c2
tof c3 a1
tof c3 c0
tof c3 b2
tof c3 b0
tof c3 c4
tof c3 b3
tof c3 c2
tof c3 a2
tof b1 c1
T* a2
T c3
T b1
T* c1
T a3
T* c2
T b4
P b3
T b3
T* c4
T* b0
T a4
T* b2
T* c0
T a1
tof c3 a2
tof b1 a2
tof c1 a2
tof a3 a2
tof b3 a2
tof c4 a2
tof b1 c3
tof c1 c3
tof a3 c3
tof b3 c3
tof c4 c3
tof b0 c3
tof b2 c3
tof a0 c3
tof c1 b1
tof a3 b1
tof b3 b1
tof c4 b1
tof b0 c1
tof b2 c1
tof a0 c1
tof b3 a3
tof c4 a3
tof b0 a3
tof c0 a3
tof b3 c2
tof b0 c2
tof b2 c2
tof a0 c2
tof a0 b4
tof b0 b3
tof a4 b3
tof b2 b3
tof c0 b3
tof a0 b3
tof a4 c4
tof c0 c4
tof b2 b0
tof c0 a4
tof c0 b2
tof a0 c0
tof a4 c0
tof b0 a1
tof b0 c0
tof b0 b2
tof b0 a4
tof b3 c4
tof b3 a4
tof c2 a0
tof a3 a0
tof a3 c2
tof a3 b0
tof a3 b2
tof a3 c4
tof b1 c0
tof b1 c2
tof b1 a4
tof b1 b3
tof b1 b4
tof b1 c4
tof b1 c1
tof c3 c0
tof c3 c2
tof c3 a4
tof c3 b3
tof c3 b4
tof c3 c4
tof c3 c1
tof a2 c0
tof a2 c2
tof a2 a4
tof a2 b3
tof a2 b4
tof a2 c4
tof a2 c1
tof a2 c3
P* b1
T* b1
T* a2
T c3
T* a3
T c1
T* c4
T* b2
T* b0
T* b4
T b3
T* a4
T* c2
T a0
T* c0
T a1
tof a2 b1
tof c3 a2
tof c2 a2
tof a0 a2
tof c2 c3
tof a0 c3
tof c1 a3
tof b0 c1
tof c2 c1
tof a0 c1
tof b0 c4
tof c2 c4
tof a0 c4
tof b0 b2
tof c2 b2
tof a0 b2
tof b4 b0
tof c2 b0
tof a0 b0
tof a4 b3
tof c2 b3
tof a0 b3
tof c2 a4
tof a0 a4
tof c2 a0
tof a4 c2
tof b3 c0
tof b0 b4
tof b2 c0
tof b2 b3
tof a3 c1
tof a2 c3
tof b1 c3
tof b1 a2
H a1
Z b4
P c0
H c0
H a4
H b4
tof c3 a0
tof c3 b3
tof c2 c4
tof c3 c4
tof c3 c2
tof c3 a2
tof b0 c3
tof b3 b0
T* c2
T c4
T* b3
T* c3
T b0
T* a0
T* a2
tof c4 c2
tof b3 c4
tof c3 c4
tof b0 c4
tof c3 b3
tof b0 b3
tof a0 b3
tof b0 c3
tof a0 b0
tof a2 a0
tof a0 a2
tof c3 b0
tof b3 a2
tof b3 a0
tof c2 c4
H a2
tof b0 b3
tof b3 b0
tof b0 c1
tof c1 b0
tof b0 c1
tof c1 c0
tof c0 c1
tof c1 c0
tof c0 a1
tof a1 c0
tof c0 a1
tof a1 c3
tof c3 a1
tof a1 c3
tof c3 b4
tof b4 c3
tof c3 b4
tof b4 a0
tof a0 b4
tof b4 a0
tof c2 a4
tof a4 c2
tof c2 a4
tof a4 b1
tof b1 a4
tof a4 b1
tof b1 b2
tof b2 b1
tof b1 b2
tof b2 c4
tof c4 b2
tof b2 c4
tof c4 a2
tof a2 c4
tof c4 a2
END
