# Original circuit
#   qubits: 24
#   qubits used: 24
#   H: 30
#   cnot: 469
#   X: 0
#   T: 448
#   P: 0
#   Z: 0
#   tdepth (by partitions): 192
#   tdepth (by critical paths): 84
# Optimized circuit
#   qubits: 24
#   qubits used: 24
#   H: 30
#   cnot: 1256
#   X: 0
#   T: 264
#   P: 8
#   Z: 2
#   tdepth (by partitions): 13
#   tdepth (by critical paths): 13
#   Time: 0.047 s
.v a0 a1 a2 a3 a4 a5 a6 a7 b0 b1 b2 b3 b4 b5 b6 b7 c0 c1 c2 c3 c4 c5 c6 c7
.i a0 a1 a2 a3 a4 a5 a6 a7 b0 b1 b2 b3 b4 b5 b6 b7
.o a0 a1 a2 a3 a4 a5 a6 a7 b0 b1 b2 b3 b4 b5 b6 b7 c0 c1 c2 c3 c4 c5 c6 c7

BEGIN
H c0
H c1
H c2
H c3
H c4
H c5
H c6
tof b7 a0
tof b7 a1
tof b5 a3
tof b6 a2
tof b3 a5
tof b4 a4
tof c0 a6
tof b2 a6
tof b2 a7
tof b2 b0
tof b2 b1
tof b3 b2
tof b4 b3
tof b5 b4
tof b6 b5
tof b7 b6
tof c1 b7
tof c3 c1
tof c4 c3
tof c3 c4
tof c1 c4
tof c0 c4
tof c0 c7
tof c1 c3
tof b6 b7
tof b7 c3
tof b7 c2
tof b5 b7
tof b4 b7
tof b7 c4
tof b7 c1
tof b7 c2
tof b3 c0
tof b2 c0
tof c0 c4
tof b3 c1
tof b3 b7
tof a7 b1
tof a7 b0
tof a6 c0
tof a7 b2
tof a6 c7
tof a6 c4
tof a5 c1
tof a4 c2
tof a4 b4
tof a5 b7
tof a5 b3
tof a2 b6
tof a3 b5
T* b1
T* c7
T* c4
T a6
T* a5
T* a4
T* a3
T* a2
T* a1
T* a7
T* b3
T* b7
T* b4
T* b5
T* b6
T* b2
T* c0
T c2
T* c1
T* c3
T* b0
T* a0
tof a6 b1
tof a5 b1
tof a4 c7
tof a3 c7
tof a2 c7
tof b3 b1
tof b4 c7
tof b5 c7
tof b2 b1
tof c0 a7
tof b0 c7
tof a7 b1
tof a7 c7
tof a7 a6
tof b3 c4
tof b7 c4
tof b2 c4
tof a6 c4
tof c0 a6
tof b3 a5
tof b7 a5
tof b4 a4
tof b5 a3
tof c0 a3
tof c1 a5
tof c3 a3
tof a4 a5
tof a3 a4
tof b3 a2
tof b7 a3
tof b6 a2
tof b2 a3
tof c1 a3
tof c3 c0
tof c0 a3
tof c0 a2
tof c0 a1
tof c3 a7
tof b3 a1
tof b3 a7
tof c0 b3
tof c2 b3
tof c1 b4
tof c3 b3
tof b4 b3
tof b4 b7
tof c0 b5
tof c2 b4
tof c3 b4
tof c2 b6
tof c1 b6
tof c3 b6
tof b2 b6
tof c1 c2
tof c3 c2
tof b0 c3
tof c3 b0
tof c2 c1
tof c0 c2
tof b2 c2
tof b6 c2
tof b2 c1
tof b2 c0
tof b4 c1
tof b4 a0
tof b4 c2
tof b5 c0
tof b4 b2
tof b4 b0
tof b4 b6
tof b7 b2
tof b3 b2
tof b7 c1
tof b3 a0
tof b3 c2
tof b3 b0
tof b7 b6
tof b3 b4
tof a7 b2
tof a7 c3
tof a2 b4
tof a3 b4
tof a2 a0
tof a2 c2
tof a3 c0
tof a2 a1
tof b4 b6
tof a3 a7
tof a2 b0
tof a4 a7
tof a5 a7
tof a7 c1
tof a4 c2
tof a5 c0
tof a5 b2
tof a7 c3
tof a4 b5
tof a5 b7
tof a5 b3
tof a5 b4
tof a4 b0
tof a5 a3
tof a4 a2
tof a6 c1
tof c4 c1
tof c4 a5
tof c4 b3
tof b1 a6
T b1
T* c1
T c4
T* b3
T a5
T* a4
T* a2
T* a3
T* b0
T* b4
T* a6
T* a7
T* b7
T* b5
T* b6
T* a1
T* c3
T* b2
T* c0
T* c2
T* a0
T* c7
tof c4 b1
tof a2 b1
tof b4 c1
tof a6 b1
tof a7 b1
tof b7 b0
tof b5 c1
tof c3 b0
tof b2 b0
tof c0 c1
tof c2 b0
tof c7 b0
tof c1 b1
tof b0 c1
tof a2 c4
tof a3 b3
tof b0 c4
tof a7 b3
tof b5 c4
tof c3 c4
tof b2 b7
tof c0 c4
tof c2 c4
tof c7 c4
tof b7 c4
tof b7 b3
tof a2 a5
tof b4 a4
tof a7 a4
tof b7 a5
tof b5 a4
tof b6 a4
tof c3 b0
tof c0 a4
tof c2 a5
tof c7 b0
tof b0 a5
tof b0 a4
tof b0 a3
tof b7 b4
tof b2 a2
tof c2 a3
tof b4 a2
tof b4 a3
tof a7 b0
tof b2 b0
tof c0 b7
tof c2 b0
tof b4 b0
tof b7 b4
tof b7 a7
tof b5 a6
tof c0 a6
tof c2 a6
tof b2 b7
tof c2 c0
tof b5 b7
tof c0 b5
tof c0 b6
tof c2 a1
tof c0 c3
tof c2 c3
tof c2 b2
tof c7 c0
tof a0 c7
tof c2 c7
tof c0 c7
tof c3 c7
tof c3 c0
tof a1 a0
tof b5 a0
tof b7 b6
tof b5 c2
tof b7 b2
tof b5 a1
tof b7 c0
tof a7 b6
tof b0 a6
tof b0 c3
tof b0 a1
tof b0 c0
tof b4 a7
tof a3 a1
tof a2 a1
tof a3 c7
tof a1 a0
tof a2 a6
tof a2 c3
tof a1 c2
tof a2 b6
tof a2 a7
tof a2 b0
tof b3 a2
tof c4 b3
tof c4 a4
tof c4 a5
tof b3 b4
tof b1 a4
tof b1 a5
tof b1 b4
tof b1 b3
tof b1 b7
tof c1 c0
T* c1
T* c0
T* b0
T* b1
T c4
T* b7
T b3
T* a2
T b4
T* a5
T* a7
T* b6
T a4
T* a3
T* b5
T* a1
T* b2
T* c2
T* c3
T* a6
T* a0
T* c7
tof b0 c1
tof b1 c1
tof b7 c1
tof b3 c1
tof a2 c0
tof a7 b4
tof a3 c1
tof a1 c1
tof c2 c1
tof c3 b4
tof a0 b4
tof c7 b4
tof b4 c1
tof b4 c0
tof c4 b1
tof a2 b0
tof b4 b0
tof a3 b0
tof b5 b0
tof a0 c3
tof c7 c3
tof b1 b0
tof c3 b1
tof b3 b7
tof a2 c4
tof b6 c4
tof a1 c4
tof c2 c4
tof c3 c4
tof b7 c4
tof b4 b7
tof b6 b3
tof b5 a2
tof a1 b3
tof b2 a2
tof c2 b3
tof c3 b3
tof b4 b3
tof b4 a2
tof a3 a5
tof a1 b4
tof b2 b4
tof c2 b4
tof c3 a5
tof b5 b4
tof b5 a5
tof a3 b6
tof b5 b6
tof a1 a7
tof c3 b6
tof b5 a4
tof b2 a1
tof c2 a1
tof c3 a3
tof a3 a4
tof a1 a3
tof c3 a1
tof b2 b5
tof b2 a1
tof c3 b2
tof c6 c7
tof c7 a0
tof a0 c7
tof c3 c7
tof b2 a6
tof c2 a0
tof c2 c6
tof a1 c6
tof b5 c6
tof a1 c7
tof b5 a6
tof c6 a0
tof b5 c3
tof b5 b2
tof a3 c6
tof b6 c6
tof a7 c6
tof b6 a4
tof b6 a3
tof a7 c2
tof b4 a0
tof b4 c2
tof b4 b5
tof a2 b4
tof b3 b4
tof b4 a0
tof b3 c6
tof a2 a3
tof a2 c2
tof b3 b5
tof b3 a7
tof b7 b6
tof c4 b6
tof c4 a0
tof c4 a4
tof c4 a5
tof c4 a3
tof c4 b5
tof b7 a2
tof c4 a7
tof c4 b3
tof b1 a0
tof b1 a4
tof b0 a5
tof b1 a3
tof b1 b5
tof b1 b4
tof b0 b6
tof b1 a1
tof b1 b2
tof c0 a7
tof c0 b0
tof c0 b2
tof c0 c4
tof c0 b1
tof c0 b3
tof c0 a1
T c0
T* a1
T b3
T* b1
T c4
T* b2
T* c1
T b0
T a7
T* b7
T a2
T* b6
T b4
T* b5
T* c2
T* a3
T* a5
T* a4
T c6
T* c3
T* a0
T* a6
T* c7
tof b1 a1
tof c4 c0
tof a2 c0
tof b4 c0
tof a3 a1
tof c3 b7
tof b7 c0
tof b7 a1
tof c4 b3
tof c1 b1
tof b7 b1
tof a3 b3
tof c3 a2
tof a2 b3
tof a2 b1
tof c1 c4
tof b0 b2
tof a2 b7
tof b4 c4
tof b7 c4
tof b7 b2
tof b7 c1
tof b5 c1
tof c2 c1
tof b0 c1
tof b5 a2
tof c3 a7
tof a6 a7
tof b7 a7
tof a2 b7
tof b4 a2
tof c3 b5
tof b5 a2
tof b5 b6
tof a4 c2
tof a0 b5
tof c2 b4
tof c2 b5
tof c5 a4
tof c7 a6
tof c5 a0
tof c5 a6
tof c3 a6
tof a4 a6
tof a4 a0
tof a4 c5
tof a3 a6
tof c2 a6
tof a3 c7
tof c2 c6
tof b5 a0
tof b4 b5
tof a0 a6
tof b4 c6
tof b4 a4
tof a2 c7
tof a2 c6
tof a2 a4
tof a2 c2
tof a2 c5
tof b6 a5
tof b7 a6
tof b7 a4
tof b7 c2
tof b7 a5
tof b7 a2
tof b7 a3
tof c1 b0
tof b0 a7
tof c4 c7
tof c4 c2
tof c4 c5
tof c4 a2
tof b2 c1
tof b1 a7
tof b1 c7
tof b3 b5
tof b1 c2
tof b1 c5
tof b1 a2
tof b1 c4
tof b1 b0
tof b1 c1
tof a1 a6
tof a1 c7
tof a1 b5
tof a1 c6
tof a1 c5
tof a1 a3
tof a1 b6
tof a1 b7
tof a1 c1
tof a1 a0
tof a1 b1
tof a1 b2
tof a1 c3
T* b0
T* a1
T b3
T* c3
T* b2
T b1
T* a0
T c1
T* b7
T* c0
T* b6
T* a3
T* c4
T* a2
T* a5
T* c5
T* c2
T b4
T* a4
T* c6
T* b5
T* c7
T* a7
T* a6
tof a0 a1
tof c0 b0
tof a2 a1
tof c5 b7
tof c2 b7
tof c7 a1
tof a7 a1
tof a6 a1
tof b7 b0
tof b7 a1
tof b2 b3
tof a0 c3
tof c4 b3
tof a2 b3
tof c2 b3
tof b4 b3
tof b7 b1
tof c4 b1
tof a5 a0
tof c5 a0
tof b4 a0
tof a0 b2
tof a0 b1
tof c4 c1
tof a2 a0
tof a5 a0
tof c5 a0
tof c2 c1
tof b4 b7
tof b7 a0
tof b7 c1
tof a3 b7
tof a2 c0
tof a5 b7
tof c5 b7
tof c2 b7
tof b4 b7
tof c7 c0
tof a7 c0
tof a6 c0
tof c4 a3
tof c5 a5
tof c2 a3
tof b4 b6
tof a3 b6
tof a5 a3
tof a2 c4
tof b4 a2
tof a4 c5
tof c2 a5
tof c2 c5
tof c6 a4
tof a7 c7
tof a6 c7
tof c7 b5
tof a6 a7
tof a7 a6
tof c7 a6
tof a4 c6
tof b4 c6
tof c2 c6
tof c5 c6
tof c5 a4
tof c4 a2
tof c4 b5
tof c4 a6
tof a3 a2
tof b6 a2
tof a3 c6
tof a3 c2
tof a3 b4
tof b7 c2
tof b7 b4
tof b7 a3
tof b2 a2
tof b2 a3
tof c3 b1
tof b3 b1
tof b3 a3
tof a1 a7
tof b0 c0
T* b0
T* c0
T* a0
T* c1
T b6
T* c4
T* b3
T* c3
T* b7
T c6
T b2
T* b1
T* a5
T a3
P b4
T b4
T a2
T* c2
T* c5
T* a4
T* a6
T* c7
T* a1
T* a7
T* b5
tof a0 b0
tof b4 c4
tof c2 c4
tof c7 c0
tof c0 b0
tof c4 c0
tof c4 a0
tof c1 a0
tof b3 c4
tof b7 b6
tof b2 b6
tof a5 c4
tof a3 c4
tof b4 c4
tof c2 b6
tof a2 b6
tof a2 c4
tof b2 c3
tof a3 b3
tof b4 b3
tof c2 b3
tof a5 b3
tof a5 c3
tof b4 c6
tof c2 c6
tof c5 c6
tof c6 b7
tof b2 c6
tof b4 b2
tof a2 a5
tof c2 b1
tof a6 b1
tof a5 b2
tof a5 b1
tof a2 a3
tof a3 a5
tof c2 a3
tof c7 c2
tof a1 c2
tof a7 c2
tof a2 b4
tof c2 a2
tof c7 c5
tof a1 c5
tof a7 c5
tof c5 c2
tof c7 a6
tof a1 a6
tof a7 a6
tof a7 a1
tof a1 c7
tof b5 a1
tof a1 b5
tof c5 a6
tof a2 c5
tof b4 c5
tof c5 c2
tof a2 c7
tof c5 a4
tof a2 a7
tof a2 a1
tof c5 a6
tof a2 b5
tof a5 a3
tof b2 b1
tof b2 a3
tof b7 c6
tof b7 a4
tof b7 b2
tof b7 b4
tof b3 c3
tof b3 c7
tof b3 c6
tof b3 a7
tof b3 a1
tof b3 b5
tof b3 a2
tof b3 b1
tof b3 b4
tof b3 c5
tof b3 b7
tof c4 c7
tof c4 a7
tof c4 a1
tof c4 b5
tof c4 a2
tof a0 c1
tof c0 c7
tof c0 a5
tof c0 a6
T* c0
T* a6
T* a5
T* c7
T* b0
P* b6
T* b6
T* c4
T* b3
T* a3
T* b7
T c5
T* b4
T b2
T a4
T* b1
tof a5 c0
tof a5 a6
tof c4 c7
tof b3 c7
tof b7 c7
tof b4 c7
tof c7 a5
tof c1 b0
tof b7 b3
tof b4 b3
tof b3 c4
tof b4 a3
tof b7 a3
tof c5 b7
tof b4 c5
tof b2 b4
tof b4 b2
tof b7 c5
tof b3 b2
tof b3 a3
tof b3 c5
tof a5 c7
tof a5 b2
tof a5 a3
tof a5 c5
tof a5 c4
tof a5 b3
tof a6 b1
tof c0 a6
tof c0 b2
tof c0 a3
tof c0 c7
tof c0 c5
tof c0 c4
tof c0 b3
tof c0 a5
H c7
P* c1
Z a3
P b2
H c1
H b6
H a3
H c2
H b2
H a4
tof c2 c7
tof a4 b2
tof b2 c7
tof b2 c1
tof a4 b6
tof a4 b2
tof c2 b2
tof b2 b1
tof a3 c2
tof b6 c2
tof a3 b1
tof c2 a4
tof c2 b2
tof c1 a3
tof c7 a3
tof c1 b2
tof a3 c2
tof c7 b6
H c7
H c1
H b6
H a3
H c2
H b2
H a4
H b1
tof c6 b5
tof a3 a2
tof b2 b5
tof a7 c3
tof c2 a0
tof b2 c3
tof b2 c0
tof a4 a5
tof a6 c0
tof a6 a5
tof b6 a1
tof c2 a6
tof c6 a7
tof a3 a7
tof b2 a7
tof b1 b0
tof a3 c6
tof b2 c6
tof b1 c4
tof b6 c7
tof a3 c1
tof c2 c1
tof c2 b6
tof c2 a3
tof a4 c2
tof b2 c2
tof b1 b2
tof a4 b1
tof b2 b1
tof c2 b1
tof c2 a4
tof b6 a3
tof c6 a3
tof c6 a4
tof b0 b2
tof a7 a4
tof a1 c7
tof a6 c1
tof a6 b6
tof a1 b1
tof a6 c2
tof c0 c2
tof a0 b1
tof c3 a4
tof a2 c1
tof b5 a3
tof b5 a7
tof b5 c6
T* b0
T* c4
T a5
T* c2
T c0
T c3
T* b2
T b5
T* a4
T* a6
T* a0
T* c6
T a7
T* a2
T* a1
T b1
T* a3
T* b6
T c1
T* c7
tof c3 b0
tof b2 b0
tof a4 b0
tof a6 b0
tof c6 b0
tof a7 b0
tof a1 c4
tof b1 c4
tof b3 b0
tof c0 c2
tof c3 c2
tof a4 c2
tof a6 c2
tof a7 c6
tof b3 a5
tof c2 a5
tof c6 c2
tof a4 c3
tof c6 c0
tof a1 c3
tof b1 a0
tof b6 c0
tof c3 c0
tof a0 c3
tof a6 b5
tof a0 b5
tof c6 b2
tof a2 b2
tof a1 b5
tof a3 b5
tof b6 b5
tof a0 a6
tof a1 a6
tof a6 a4
tof a7 c6
tof a1 c6
tof a3 c6
tof b6 a0
tof a1 a2
tof b1 a2
tof a3 a7
tof b6 a7
tof c1 a2
tof b3 a1
tof b1 a1
tof b6 b1
tof b3 b6
tof c5 a3
tof b6 a3
tof c5 b3
tof c1 c7
tof a3 b3
tof a3 c5
tof a1 b3
tof a1 b6
tof a2 c7
tof a7 a1
tof c6 b1
tof a0 c6
tof b1 c7
tof b1 a2
tof b1 a1
tof a6 c7
tof a6 a2
tof a6 c1
tof a6 b6
tof a6 a1
tof a6 a7
tof a4 c6
tof a6 a0
tof c3 b2
tof c2 a1
tof a5 a1
tof c2 b3
tof c2 a6
tof c4 b3
tof b0 b3
tof b0 a3
tof b0 c5
tof b0 a5
T b0
T a5
T c4
T* c5
T a3
T* c2
T* a1
T* a6
T b3
T* c3
T* b5
T* a0
T c0
T a4
T* c6
T b1
T* a7
T b2
T* b6
T* c1
T* a2
T c7
tof a1 a5
tof a0 b0
tof a4 b0
tof c6 b0
tof a7 b0
tof a5 b0
tof c2 a5
tof a6 a3
tof b3 c4
tof a0 c5
tof a4 c5
tof c6 c5
tof b1 c4
tof a7 a3
tof a3 c4
tof a3 c5
tof a6 c2
tof c3 a3
tof a0 a3
tof a4 a3
tof c6 a3
tof b1 c2
tof a7 c2
tof a0 c3
tof a4 c3
tof c6 c3
tof b1 c3
tof a7 a6
tof b2 a6
tof c1 a6
tof a2 a6
tof c3 a1
tof c3 a6
tof b1 a0
tof a7 b3
tof b2 c3
tof c1 a0
tof a2 a0
tof c3 b3
tof a0 c3
tof c0 a0
tof b1 a0
tof a7 b5
tof b2 b5
tof c1 a0
tof a2 a0
tof c6 c0
tof b1 a4
tof a4 c0
tof b2 a7
tof c1 a7
tof a2 a7
tof b1 c6
tof a7 b1
tof b6 b2
tof a2 c1
tof c1 a7
tof c1 b2
tof b6 c7
tof c1 a2
tof b2 c1
tof a7 b2
tof b2 c7
tof a7 a2
tof c6 c7
tof b1 c1
tof a4 c6
tof c0 a4
tof a4 c7
tof c6 b2
tof a0 c7
tof a0 a4
tof c3 c7
tof c3 b2
tof c3 c6
tof c3 a4
tof c3 b5
tof c3 a0
tof a6 c7
tof a6 a2
tof a6 b2
tof a6 c6
tof a6 a4
tof a6 a0
tof a6 c3
tof a6 b3
tof a6 a7
tof c2 a2
tof a3 a2
tof c2 b6
tof c2 b1
tof c2 c6
tof c2 a4
tof c2 a0
tof c2 c3
tof c2 a7
tof c2 a1
tof c2 c0
tof c5 a3
tof c4 c5
tof c5 c7
tof c4 a2
tof c5 b2
tof c5 c6
tof c5 a4
tof c5 a0
tof c5 c3
tof a3 b3
tof c5 a7
tof c5 a6
tof c5 a1
tof c5 c0
tof a5 a2
tof a5 b3
tof a5 a3
tof a5 c4
tof a5 c2
T* a5
T* c2
T* c4
T* c5
T b0
T c0
T* a1
T a6
T* a3
T* a7
T b3
P* c3
T* c3
T* a0
T b5
T a4
T* c6
T* b1
T* b2
T* b6
T c1
T* a2
T c7
tof a6 c2
tof a7 c2
tof c3 c2
tof a0 c2
tof b2 a5
tof b6 c2
tof b7 a5
tof c1 a5
tof c1 c2
tof c3 c0
tof a0 c4
tof b5 c5
tof a4 c5
tof b1 c5
tof b2 c0
tof b6 c0
tof b7 c4
tof c0 c4
tof c0 c5
tof a6 c0
tof a7 c0
tof a0 b0
tof a4 b0
tof b1 b0
tof b6 b5
tof c1 b5
tof b7 c0
tof b5 b0
tof b5 c0
tof c3 a6
tof b5 a1
tof a4 a1
tof b1 a1
tof b7 a6
tof a0 a1
tof a0 a6
tof c3 a7
tof c6 a0
tof b1 a0
tof b6 a7
tof c1 a7
tof b7 a0
tof a7 a3
tof a0 a7
tof b5 c3
tof a4 c3
tof c6 c3
tof b6 b3
tof c1 b3
tof b7 c3
tof c1 b2
tof b7 b5
tof b5 a0
tof b2 b5
tof b2 b1
tof c6 a4
tof b1 c6
tof b7 c1
tof c1 b6
tof b7 c7
tof b6 c1
tof b6 c7
tof b6 b7
tof b2 a2
tof b2 b7
tof c6 b2
tof a4 b2
tof c6 b1
tof a4 b6
tof a4 b7
tof b5 b7
tof a0 b5
tof b5 a2
tof b5 c1
tof b7 b6
tof a0 b2
tof b5 c6
tof c3 a2
tof c3 b7
tof c3 b2
tof c3 a4
tof a3 a2
tof a3 c1
tof a7 b1
tof a3 b2
tof a7 b5
tof a7 c3
tof a7 a0
tof a6 b1
tof a6 b5
tof c0 c1
tof c0 b2
tof c0 c6
tof c0 b5
tof c0 a6
tof c0 a0
tof c0 a7
tof c5 a2
tof c5 a0
tof c5 a1
tof c5 c3
tof c5 b0
tof c2 c0
tof a5 c0
tof c0 c1
tof c0 b2
tof c0 c6
tof c0 b5
tof c0 a6
tof c0 a0
tof c0 a7
tof a5 c4
tof c2 c5
tof a5 a4
T* a5
T c2
T* a4
T c5
T* b0
T c0
T c4
T* c3
T a1
T* a7
T* a0
T* a6
T* b3
T b5
T* a3
T* c6
T b2
T* b7
T* b6
T* b1
T c1
T* a2
T* c7
tof a3 a5
tof c6 a4
tof b2 a5
tof b6 a4
tof a4 a5
tof a4 c2
tof a0 c5
tof a6 c5
tof c6 c5
tof b2 a3
tof b6 c5
tof c5 a4
tof a3 c5
tof a3 b0
tof c6 b0
tof b7 c4
tof b6 c0
tof c0 b0
tof c4 c0
tof a6 c3
tof a3 c4
tof c6 c4
tof a6 a1
tof a6 a7
tof a6 a0
tof b3 a6
tof a3 b5
tof c6 b5
tof b7 a3
tof c1 b2
tof c6 a3
tof b2 c6
tof b7 b2
tof b7 b6
tof c6 b2
tof a3 b2
tof c6 c1
tof a3 b6
tof a3 b7
tof a3 c7
tof a6 b3
tof a7 c6
tof c3 a2
tof c3 a1
tof c0 c4
tof a4 c5
tof a4 c4
tof a4 b3
tof a4 b1
tof a4 c6
tof a4 a2
tof a4 c0
tof a4 a6
tof a4 b5
tof a4 a7
tof a4 c3
tof a4 b0
tof a4 a0
H c7
tof c4 a3
tof c4 c1
tof c4 a4
tof c5 a0
tof c5 c2
tof c5 a1
tof c3 a5
tof c5 b0
tof c5 a5
tof c5 c3
tof c5 a7
tof c5 b2
tof c4 b5
tof c4 b2
tof c4 b6
tof c4 a6
tof c4 c0
tof c4 a2
tof c5 a2
tof c5 b1
tof c4 b7
tof c5 b3
tof c5 c4
tof b5 b7
tof b2 c5
tof c3 a2
tof c3 b1
tof c2 b3
tof a0 b2
tof a0 c4
tof c1 a2
T* c3
T a5
T* b0
T* a7
T* a1
T* c2
T* a0
T* b5
T* c4
T* c5
T b2
T* a4
T* b6
T* c1
T* a6
T* a3
T* c0
T* b3
T* b7
T* b1
P c6
T c6
T a2
tof c5 a0
tof b2 a0
tof a5 c3
tof a0 a5
tof a0 b0
tof a0 a7
tof a0 a1
tof a0 c2
tof c4 b5
tof c5 b5
tof b2 b5
tof b2 c5
tof c1 c4
tof c5 c4
tof c1 b2
tof c1 a4
tof c1 b6
tof a6 c1
tof c0 a6
tof c0 a3
tof a6 a3
tof a6 c0
tof c1 a3
tof c1 c0
tof c1 a6
tof c5 b2
tof c4 b2
tof c4 a4
tof c4 c0
tof c4 a2
tof c4 a6
tof c4 c1
tof c4 b6
tof c4 a3
tof b5 b7
tof c2 b3
tof c3 a5
tof a5 b1
tof a5 a2
P* b3
Z b1
P a2
H a2
H c6
H b1
H b7
H b3
H c0
tof a0 a3
tof b4 a0
tof a3 b4
T* a3
T* a0
T b4
tof b4 a3
tof b4 a0
tof a0 b4
tof a3 b4
H b4
tof c4 b7
tof b7 c4
tof c4 b7
tof b7 a3
tof a3 b7
tof b7 a3
tof a3 c5
tof c5 a3
tof a3 c5
tof c5 b3
tof b3 c5
tof c5 b3
tof b3 b2
tof b2 b3
tof b3 b2
tof b2 b5
tof b5 b2
tof b2 b5
tof b5 c1
tof c1 b5
tof b5 c1
tof c1 a2
tof a2 c1
tof c1 a2
tof a2 a4
tof a4 a2
tof a2 a4
tof a4 c2
tof c2 a4
tof a4 c2
tof c2 c6
tof c6 c2
tof c2 c6
tof c6 c0
tof c0 c6
tof c6 c0
tof c0 c7
tof c7 c0
tof c0 c7
tof c7 b4
tof b4 c7
tof c7 b4
tof b4 b6
tof b6 b4
tof b4 b6
tof b6 a6
tof a6 b6
tof b6 a6
tof a6 b0
tof b0 a6
tof a6 b0
tof b0 a5
tof a5 b0
tof b0 a5
tof a5 a1
tof a1 a5
tof a5 a1
tof c3 b1
tof b1 c3
tof c3 b1
tof b1 a7
tof a7 b1
tof b1 a7
END
