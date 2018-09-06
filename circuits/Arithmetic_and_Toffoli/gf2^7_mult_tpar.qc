# Original circuit
#   qubits: 21
#   qubits used: 21
#   H: 26
#   cnot: 349
#   X: 0
#   T: 343
#   P: 0
#   Z: 0
#   tdepth (by partitions): 147
#   tdepth (by critical paths): 72
# Optimized circuit
#   qubits: 21
#   qubits used: 21
#   H: 26
#   cnot: 992
#   X: 0
#   T: 217
#   P: 8
#   Z: 2
#   tdepth (by partitions): 12
#   tdepth (by critical paths): 12
#   Time: 0.026 s
.v a0 a1 a2 a3 a4 a5 a6 b0 b1 b2 b3 b4 b5 b6 c0 c1 c2 c3 c4 c5 c6
.i a0 a1 a2 a3 a4 a5 a6 b0 b1 b2 b3 b4 b5 b6
.o a0 a1 a2 a3 a4 a5 a6 b0 b1 b2 b3 b4 b5 b6 c0 c1 c2 c3 c4 c5 c6

BEGIN
H c0
H c1
H c2
H c3
H c4
H c5
tof b6 a0
tof b6 a1
tof b2 a5
tof b1 a6
tof c0 b1
tof c0 b2
tof c1 c0
tof c4 c1
tof c4 c6
tof c1 c6
tof c0 c6
tof c1 c4
tof b6 c1
tof b6 c3
tof b4 c2
tof b2 c0
tof b1 b2
tof b1 c6
tof c0 c4
tof c0 c1
tof a6 b2
tof a5 c1
tof a4 c3
tof a5 c4
T* c6
T* a6
T* b1
T* c4
T* a5
T* a4
T* b3
T* a3
T* b4
T* a2
T* b5
T* b6
T* a1
T* b2
T* c0
T* c2
T c3
T c1
T* b0
T* a0
tof c4 c6
tof a5 c6
tof b6 c6
tof b2 c6
tof b0 c6
tof a0 c6
tof a6 c6
tof b1 a6
tof a5 b1
tof b3 c4
tof b2 b1
tof b3 a5
tof b4 a5
tof b5 a4
tof b2 a5
tof b4 b3
tof b5 a3
tof c2 b3
tof b6 a2
tof c2 b4
tof c1 b4
tof c2 b6
tof c3 b5
tof c1 b6
tof c3 c2
tof c1 c2
tof c2 a1
tof c2 b2
tof c2 c0
tof a0 c1
tof b0 c3
tof b0 c1
tof a0 b0
tof c3 c1
tof c1 a0
tof c3 b0
tof c2 c1
tof c2 b0
tof c2 c3
tof b2 c0
tof b6 a1
tof b5 a1
tof b6 c1
tof b6 b0
tof b5 a0
tof b5 b2
tof b5 c2
tof b4 c1
tof b4 a0
tof b4 b2
tof b4 c2
tof b4 c3
tof b4 b6
tof a3 a0
tof b3 a0
tof b3 c1
tof b3 b4
tof a4 b2
tof a5 b2
tof a4 c2
tof a5 c3
tof a5 b6
tof a4 b5
tof c4 c1
tof b1 c1
tof c4 b2
tof c4 c3
tof c4 b6
tof c4 b4
tof c4 a5
tof c4 b3
tof a6 c1
tof a6 b1
T* a6
T* c0
T* c4
T* c2
T* a3
T* a2
T* b3
T* a4
T* a5
T* b5
T* b4
T* b6
T* c3
T* b1
T* b2
T* a0
T* a1
T* b0
T* c1
T* c6
tof c2 c0
tof a3 c4
tof a4 c0
tof a5 c0
tof b6 a6
tof b1 c4
tof a0 c4
tof a1 a6
tof b0 c4
tof c1 c4
tof c4 a6
tof c4 c0
tof a3 c2
tof b3 c4
tof a5 c2
tof b1 c4
tof a0 c2
tof b0 c4
tof c1 c4
tof a4 c4
tof a4 c2
tof a4 a3
tof a0 a3
tof b6 a3
tof b6 a2
tof b6 a4
tof b1 b3
tof b0 b3
tof c1 b3
tof a1 a5
tof c3 b6
tof b0 b1
tof c1 b1
tof b1 b4
tof b1 b6
tof b2 c3
tof a0 c3
tof b1 c3
tof c1 b0
tof c1 c6
tof a1 c6
tof b0 c1
tof b2 a0
tof a0 c6
tof a0 c1
tof b2 b0
tof b1 c6
tof c3 c6
tof c3 c1
tof c3 b0
tof c3 b2
tof c3 a0
tof b6 c1
tof b6 b0
tof b6 b1
tof b6 b2
tof b6 a0
tof b6 c3
tof a4 c6
tof b3 c1
tof a4 a1
tof b3 b0
tof a4 a5
tof a4 a0
tof b3 b6
tof b3 b4
tof a3 c6
tof a3 c1
tof a3 a1
tof a3 b0
tof a3 b1
tof a3 a5
tof a3 c3
tof a3 a4
tof a3 b5
tof c2 a3
tof c4 a3
tof c2 c6
tof c4 c1
tof c4 b0
tof c2 b1
tof c2 a5
tof c2 a2
tof a3 b6
tof a3 b4
tof c2 a4
tof c2 b5
tof c2 b2
tof c4 a0
tof c2 b3
T a6
P* c0
T* c0
T* c2
T b3
T* c4
T* a0
T* b2
T* a3
T* b5
T* a4
T* b4
T* b6
T* c3
T* a2
T* a5
T* b1
T* b0
T* a1
T* c1
T* c6
tof a0 c0
tof b2 a6
tof a3 c0
tof a4 c0
tof a2 c0
tof b0 a6
tof a1 a6
tof c2 a6
tof c2 c0
tof a0 b3
tof b2 c4
tof a3 c4
tof a4 b3
tof c3 b3
tof b0 c2
tof b3 c2
tof c4 b3
tof b2 a0
tof a3 a0
tof a4 a0
tof b6 a0
tof c3 c4
tof b1 a0
tof b0 a0
tof b6 a3
tof c3 b2
tof b1 a3
tof b6 b5
tof c3 a4
tof b1 b5
tof b0 b5
tof c6 a5
tof a4 b5
tof a5 a4
tof c3 b4
tof a2 b6
tof b1 b6
tof b0 b6
tof a5 b4
tof a5 b6
tof b0 a5
tof a1 c6
tof b0 c6
tof a5 c1
tof c3 b1
tof a2 a1
tof c3 b0
tof b6 a5
tof b6 c6
tof b6 a2
tof a4 c1
tof a4 b4
tof a4 b6
tof b2 a3
tof a3 c6
tof a0 a2
tof c4 a0
tof c4 b1
tof c4 c1
tof a0 b4
tof a0 c6
tof a0 a3
tof a0 b6
tof a2 a4
tof a0 a5
tof b3 a5
tof c2 b3
tof b3 c1
tof c2 b4
tof c2 b5
tof a5 c6
tof b3 a3
tof c2 b0
tof c2 b2
tof a5 a1
tof b3 b6
tof c2 a4
tof c2 c3
tof c2 c4
tof a6 b2
tof a6 a1
tof a6 b6
tof a6 a4
tof a6 a5
tof a6 a2
tof a6 c3
tof a6 b3
tof a6 c4
tof a6 a0
tof a6 c2
T* b0
T a6
T* c2
T a0
T* c4
T b3
T* c3
T a2
T* a5
T* a4
T b6
T* a1
T* b2
T c0
T* a3
T c6
T b5
T b4
T* c1
T* b1
tof a5 a6
tof a4 c2
tof b6 c2
tof b2 c2
tof c0 c2
tof c2 b0
tof c2 a6
tof b3 c4
tof a5 a0
tof b2 a0
tof c0 a0
tof a3 c4
tof a0 c2
tof c4 a0
tof a4 c4
tof b6 c4
tof b2 b3
tof c0 b3
tof a3 b3
tof c6 a5
tof b3 c4
tof a5 b3
tof a5 a2
tof b6 a4
tof b2 c3
tof c0 c3
tof c6 a2
tof a2 c3
tof a4 a2
tof b2 a4
tof c0 a4
tof c6 a5
tof b6 a5
tof b6 a4
tof c0 b2
tof b2 b6
tof b2 a1
tof c0 b2
tof b5 c0
tof c6 a3
tof b5 c6
tof b4 b5
tof b5 b4
tof c6 b5
tof a3 b5
tof a3 c1
tof c0 b4
tof b2 c0
tof b2 b5
tof b6 c1
tof b6 b2
tof b6 a3
tof b6 b4
tof a4 b4
tof a5 a4
tof a4 b1
tof a4 a1
tof b4 b5
tof a4 c0
tof b4 b2
tof a5 c6
tof a5 a3
tof c3 a2
tof a2 b1
tof a2 a5
tof b3 a3
tof c4 a3
tof a3 c1
tof a3 b5
tof c2 a0
tof c2 c1
tof a0 b5
tof c2 c0
tof c2 b2
tof a0 c6
tof c2 b3
tof c2 a3
tof b0 a6
tof b0 b5
tof b0 c6
tof b0 a0
T* c2
T* a1
T b0
T a3
T* c4
T* c3
T b3
T* a2
T* b6
T a5
T* a4
T* b4
T* a0
T c6
T* b2
T* c0
T* b5
T* c1
T* a6
T* b1
tof b0 a1
tof b3 c4
tof a2 c2
tof b6 a1
tof a5 c2
tof c6 a1
tof b2 c2
tof c0 a1
tof c4 c2
tof c4 a1
tof c4 b0
tof a2 a3
tof b6 b0
tof a5 a3
tof c6 b0
tof b2 a3
tof c0 b0
tof a2 c3
tof a5 c4
tof b4 c3
tof a0 c3
tof c6 c3
tof c0 c3
tof b6 c4
tof b6 c3
tof b6 b3
tof a5 a2
tof a0 a2
tof c6 a2
tof c0 a2
tof a2 b3
tof c6 b6
tof a5 b6
tof b4 a5
tof a0 a4
tof c6 a4
tof c0 a4
tof b4 a4
tof c6 a0
tof b2 c6
tof b5 c0
tof a6 b5
tof b5 a6
tof c0 a6
tof b2 a6
tof b2 b1
tof b2 c1
tof c0 b5
tof c6 b2
tof a0 b2
tof c6 c1
tof a0 b5
tof a4 b1
tof a4 b5
tof a5 c6
tof b6 c6
tof c6 b1
tof b6 c1
tof a5 a4
tof b6 c0
tof b6 b2
tof a2 a5
tof b3 a5
tof a2 b1
tof a5 b4
tof a5 b5
tof a2 a4
tof a2 b2
tof a2 a0
tof c4 c1
tof c4 b4
tof c4 b5
tof c4 a4
tof c4 c0
tof c4 a5
tof c4 b2
tof c4 b6
tof c4 a2
tof b0 b1
tof b0 c1
tof a3 b4
tof a1 b1
T* b0
T* b4
T* c4
T* c2
T* a3
T b3
T* a2
T c3
P a0
T a0
T* b6
T* b2
T* a6
T* a5
T* c0
T* c6
T* a4
T* b5
T* a1
T* c1
T* b1
tof c2 b4
tof a0 b0
tof a6 b4
tof a5 b4
tof c6 b4
tof a4 b0
tof b2 b0
tof b2 b4
tof a3 c2
tof b3 c4
tof a2 c4
tof a0 c4
tof b2 c2
tof a5 c4
tof c6 c4
tof a4 c4
tof a6 c4
tof a6 c2
tof a2 b3
tof a0 a3
tof b2 b3
tof a5 b3
tof c6 b3
tof a4 b3
tof a6 a3
tof a6 b3
tof a0 c3
tof a6 c3
tof c6 c3
tof c5 c3
tof c3 a2
tof a4 b2
tof c1 b2
tof c5 b6
tof b2 a0
tof b2 b6
tof a4 a6
tof c1 a6
tof a6 b2
tof c6 a5
tof a4 a5
tof c1 a5
tof c5 c0
tof c1 a4
tof c5 c6
tof a4 c6
tof c1 a1
tof a1 b1
tof c6 c5
tof a5 b5
tof b2 a6
tof b2 c5
tof b2 a4
tof b2 c6
tof b2 b5
tof b2 a5
tof b6 c5
tof a0 b6
tof b6 c0
tof a0 a6
tof a0 a4
tof a0 c6
tof a0 c1
tof a0 b5
tof a0 b1
tof a0 a5
tof a0 a1
tof a2 c3
tof b3 c3
tof c4 c3
tof c2 a4
tof c2 a3
tof c4 c1
tof c4 b3
tof b4 a4
tof b0 b1
tof b0 a1
tof b0 a0
tof b4 c2
T* b4
T* c4
T* c2
T* b2
T a2
T* b6
T* c6
T c5
T* b0
tof c1 c4
tof a3 b4
tof a4 c2
tof c6 a2
tof c5 b6
tof b6 a2
tof c5 c6
tof c6 c5
tof b6 c5
tof c2 b2
tof c4 b0
P* a3
Z c3
P c0
H a3
H a4
H c3
H a6
H c0
H c5
tof c5 a2
tof c0 c5
tof a6 c0
tof c3 a6
tof a4 c3
tof a3 a4
H a3
H a4
H c3
H a6
H c0
H c5
H a2
tof b2 a1
tof a6 a0
tof c5 a1
tof b0 b3
tof c0 c4
tof c5 b3
tof b5 c2
tof a2 a5
tof a2 c2
tof c3 b1
tof b2 b0
tof a6 b0
tof a2 b5
tof c5 b5
tof c5 b0
tof a6 b2
tof c5 b4
tof c5 b2
tof c3 a3
tof a6 a4
tof c5 a4
tof a2 a4
tof a2 c5
tof c5 c3
tof c5 a6
tof a2 c5
tof c5 c0
tof c0 c5
tof c0 a2
tof c3 a6
tof b2 c0
tof b2 a6
tof b0 c0
tof b5 a4
tof b5 c3
tof b5 a2
tof b1 a3
tof b1 c5
tof a5 b5
tof c4 c5
tof b3 c0
tof a0 a4
tof a1 a6
tof a1 b0
tof a1 b2
T c2
T* a5
T b5
T b3
T* b4
T a1
T* c0
T* a2
T* c4
T* b2
T b0
T* a0
T* b1
T c5
T* a6
T* c3
T a4
T* a3
tof b5 a5
tof b3 a5
tof c0 a5
tof c4 c2
tof b2 a5
tof b0 a5
tof b1 c2
tof c5 c2
tof a2 c2
tof a2 a5
tof c0 b3
tof b2 b5
tof b0 b5
tof b1 b3
tof c5 c4
tof c3 b5
tof b3 b5
tof c4 b3
tof a2 a1
tof c4 a1
tof b2 b4
tof b0 b4
tof a0 b4
tof b1 a1
tof a6 a1
tof c3 a1
tof c4 c0
tof b1 a2
tof a2 c0
tof c3 a2
tof b1 b2
tof a6 b2
tof c3 c4
tof c5 a0
tof c3 b0
tof a4 a0
tof a6 b0
tof a6 a0
tof c3 c5
tof c5 b1
tof c1 a6
tof c3 a6
tof a4 a3
tof c3 c1
tof a6 c1
tof c1 a3
tof b1 a3
tof b1 c1
tof a0 a3
tof a0 c1
tof b2 c5
tof c4 b2
tof b2 a3
tof b2 c1
tof c4 a4
tof c5 a0
tof c4 b1
tof c4 c3
tof c4 a6
tof c4 b0
tof a2 a3
tof a2 c1
tof a2 a4
tof a2 b1
tof a2 c3
tof a2 a6
tof a2 b0
tof c0 b2
tof a2 c4
tof b3 b4
tof a5 a6
tof a5 c4
T* a5
T* c2
T* c4
T a6
T* b3
T* a1
T* a2
T b5
T c0
T* b2
T c5
T* b0
T b4
P c3
T c3
T* b1
T a0
T* a4
T* c1
T a3
tof c4 c2
tof b3 c2
tof a2 a5
tof c0 a5
tof b2 a5
tof b0 c2
tof c3 c5
tof b1 c5
tof c5 a5
tof c5 c2
tof b3 a6
tof a2 c4
tof c0 a6
tof b2 a6
tof c5 b5
tof b0 c4
tof a0 a6
tof a4 a6
tof b5 c4
tof b5 a6
tof c0 b3
tof b2 b3
tof c5 b5
tof b0 a1
tof b4 b5
tof c3 b5
tof b1 b5
tof a4 b3
tof c1 b3
tof b5 b3
tof b5 a1
tof c0 b5
tof b2 b5
tof c5 b5
tof b4 a2
tof c3 a2
tof b1 a2
tof b5 a2
tof b0 b5
tof c5 c0
tof b4 b0
tof c3 b0
tof b1 b0
tof b2 c0
tof b0 b2
tof a0 b0
tof a4 b0
tof b1 c3
tof a0 b4
tof a4 c3
tof c3 b4
tof c1 c3
tof a4 a0
tof a0 b1
tof c1 a4
tof a4 c1
tof a4 a3
tof a0 a3
tof b1 a3
tof b1 a4
tof c3 b1
tof b4 b1
tof c3 a3
tof b1 a0
tof c3 a4
tof b0 a0
tof c5 a0
tof a0 a3
tof b0 c1
tof b0 a4
tof c5 b1
tof c5 c3
tof b0 b4
tof b2 c1
tof c0 b2
tof c0 a3
tof c0 b4
tof c0 b0
tof b5 b2
tof a2 b2
tof a2 a3
tof b2 c1
tof b5 a4
tof b5 b1
tof b5 c3
tof a2 b4
tof a2 b0
tof b3 a1
tof b3 b5
tof b3 b0
tof c4 a6
tof c4 a3
tof c4 a4
tof c4 b1
tof c4 c3
tof c4 b4
tof c4 b3
tof a5 a3
tof a5 a4
tof a5 b1
tof a5 c3
tof a5 b4
tof a5 b3
tof a5 c6
T* a5
T c6
T c4
T* c2
T b3
T* b0
T* b5
T a6
P* c0
T* c0
T* a2
T a1
T* b4
T b2
T* c5
T* c3
T* b1
T* a4
T a0
T* c1
T a3
tof c4 c6
tof b5 b3
tof c0 a5
tof a2 c6
tof a1 b3
tof b4 b3
tof c3 b3
tof b1 c6
tof a0 c6
tof c6 a5
tof b3 c6
tof b3 c2
tof a2 c4
tof b1 c4
tof a4 c0
tof a0 c2
tof b6 c0
tof c0 c4
tof c0 c2
tof c0 b5
tof a4 b3
tof a0 b0
tof b6 b0
tof b5 b3
tof b5 b0
tof c0 b5
tof b4 b5
tof b2 b5
tof a0 a4
tof a4 b5
tof a4 a6
tof b4 c0
tof b2 c0
tof a4 c0
tof a0 c0
tof b6 a2
tof a1 c0
tof a1 a2
tof b2 b4
tof b1 a1
tof a0 a1
tof b6 a1
tof b4 a1
tof b1 c3
tof a0 c3
tof c5 b2
tof c3 c5
tof a0 b1
tof b6 a4
tof b6 a0
tof b6 a3
tof a4 a0
tof a4 a3
tof a4 b6
tof b1 a0
tof c3 a0
tof b1 a4
tof b1 b6
tof c5 c3
tof b2 c5
tof c5 c1
tof c3 a0
tof c5 b1
tof b4 b2
tof a1 b4
tof b4 c1
tof a1 a0
tof b2 c3
tof b4 a4
tof a1 b6
tof a1 c5
tof c0 a2
tof c0 c1
tof c0 a0
tof c0 c3
tof c0 b6
tof c0 c5
tof c0 a1
tof b5 c3
tof b5 b1
tof b5 c5
tof b5 a2
tof b5 c0
tof b0 b1
tof b3 b1
tof b1 c1
tof b1 a0
tof b3 c3
tof b3 c5
tof b3 b2
tof c4 c2
tof c4 c1
tof c4 a0
tof c4 b1
tof c4 c5
tof c4 b4
tof c4 c0
tof c4 b2
tof c4 b3
tof a5 c6
tof c6 c1
tof c6 a0
tof c6 b1
tof c6 c5
tof c6 b4
tof c6 c0
tof c6 b2
tof c6 c2
tof c6 b3
T* a5
T c6
T c4
T* b3
T c2
T* a2
T* b2
T* b5
T* c0
T* a6
T* a1
T b4
T* b0
T* c5
T b1
T* b6
T* a4
T* c3
T a0
T* c1
T* a3
tof a1 c6
tof b4 c6
tof b0 a5
tof c5 a5
tof b1 a5
tof b6 c4
tof a4 c6
tof c6 a5
tof c4 c6
tof c2 b3
tof b0 c4
tof c5 c4
tof b1 c4
tof a1 c0
tof b4 c0
tof c0 c2
tof c0 a2
tof c0 b2
tof c0 b5
tof a6 c0
tof c5 b0
tof b1 b0
tof c3 b4
tof b4 a1
tof b0 b4
tof b1 c5
tof b6 b0
tof b6 b1
tof b6 a4
tof c5 b1
tof b0 b1
tof b0 a4
tof b0 b6
tof c5 a0
tof b0 a3
tof a1 b4
tof a1 c3
tof c0 a6
tof b2 a0
tof c2 c1
tof b3 c1
tof b3 c2
tof c6 c4
H a3
P* a6
Z a1
P c1
H c1
H a0
H a1
H b6
H a6
tof c4 b0
tof c4 c5
tof b1 b5
tof c4 c3
tof c4 b5
tof c4 b4
tof c4 b1
tof c4 a4
tof c4 c0
tof c4 c6
tof b1 c4
tof b5 c4
T* b4
T* c4
T* b1
T b5
T* c3
T* a4
T* c5
T* c0
T* b0
T* c6
tof b1 c4
tof b5 c4
tof c4 b4
tof b0 c4
tof b5 b1
tof b0 b5
tof b0 c3
tof b0 a4
tof b0 c5
tof b0 c0
tof c6 b0
tof b0 c6
tof b1 b5
tof c4 c6
tof c4 b0
tof c4 c0
tof c4 a4
tof c4 b5
tof c4 c3
tof c4 c5
H c6
tof c4 b6
tof b6 c4
tof c4 b6
tof b6 b0
tof b0 b6
tof b6 b0
tof b0 c2
tof c2 b0
tof b0 c2
tof c2 a0
tof a0 c2
tof c2 a0
tof c5 a6
tof a6 c5
tof c5 a6
tof a6 a5
tof a5 a6
tof a6 a5
tof a5 b3
tof b3 a5
tof a5 b3
tof b3 b5
tof b5 b3
tof b3 b5
tof b5 c0
tof c0 b5
tof b5 c0
tof c0 a3
tof a3 c0
tof c0 a3
tof a3 b1
tof b1 a3
tof a3 b1
tof b1 b2
tof b2 b1
tof b1 b2
tof b2 b4
tof b4 b2
tof b2 b4
tof b4 a4
tof a4 b4
tof b4 a4
tof a4 a2
tof a2 a4
tof a4 a2
tof a2 c3
tof c3 a2
tof a2 c3
tof c3 a1
tof a1 c3
tof c3 a1
END
