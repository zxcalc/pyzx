# Original circuit
#   qubits: 30
#   qubits used: 30
#   H: 38
#   cnot: 709
#   X: 0
#   T: 700
#   P: 0
#   Z: 0
#   tdepth (by partitions): 300
#   tdepth (by critical paths): 108
# Optimized circuit
#   qubits: 30
#   qubits used: 30
#   H: 38
#   cnot: 2176
#   X: 0
#   T: 410
#   P: 29
#   Z: 2
#   tdepth (by partitions): 16
#   tdepth (by critical paths): 16
#   Time: 0.207 s
.v a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 c0 c1 c2 c3 c4 c5 c6 c7 c8 c9
.i a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 c9
.o a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 c0 c1 c2 c3 c4 c5 c6 c7 c8 c9

BEGIN
H c0
H c1
H c2
H c3
H c4
H c5
H c6
H c7
H c8
tof b8 a0
tof b9 a1
tof b8 a3
tof b9 a2
tof b5 a5
tof b6 a4
tof b4 a7
tof c0 a6
tof b2 a9
tof b3 a8
tof b2 b1
tof b5 b0
tof b3 b2
tof b4 b3
tof c0 b4
tof c0 b5
tof b7 b6
tof c0 b7
tof c0 b8
tof c0 b9
tof c2 c0
tof c5 c2
tof c5 c3
tof c6 c5
tof c5 c6
tof c2 c3
tof c2 c6
tof c2 c5
tof c0 c6
tof c0 c5
tof c0 c2
tof c0 c3
tof b8 b9
tof b8 c0
tof b6 b7
tof b7 c1
tof b7 c4
tof b7 b8
tof b5 c1
tof b4 b5
tof b4 c5
tof b4 c2
tof b4 c4
tof b4 c3
tof b3 c2
tof b3 c4
tof b3 c3
tof a8 c2
tof a8 c4
tof a8 c3
tof a9 b2
tof a9 b1
tof a7 c5
tof a6 b7
tof a7 b5
tof a7 b3
tof a6 b4
tof a5 b0
tof a4 b8
tof a4 b6
tof a5 c1
tof a3 b9
T c6
T* b1
T* b3
T* b4
T* a6
T* a5
T* a4
T* a1
T* a9
T* a8
T* a7
T c1
T* b6
T* a3
T* a2
T* b2
T* b5
T* b7
T* b8
T* c0
T* b9
T* c3
T c4
T* c2
T* c5
T* a0
T* b0
tof b3 c6
tof a8 b1
tof b2 b1
tof a6 b4
tof a5 b3
tof a7 b4
tof c1 b4
tof b5 b4
tof a8 a5
tof a7 a5
tof c1 a6
tof b5 a6
tof b7 a6
tof c3 a5
tof b6 a4
tof a3 a1
tof b7 a4
tof b9 a1
tof a7 a8
tof b2 a8
tof c3 a8
tof a8 a9
tof b5 a8
tof b2 c1
tof c3 a7
tof c4 c1
tof b8 a3
tof b9 a3
tof a3 b6
tof b5 b2
tof b7 a2
tof b2 a2
tof b0 b2
tof b0 c3
tof c5 c4
tof c4 c5
tof b8 c0
tof b7 a0
tof b5 c3
tof b7 b0
tof b7 b8
tof b2 c3
tof b2 b0
tof a3 b8
tof b6 b8
tof b6 a2
tof b8 a0
tof b6 b9
tof b8 b5
tof b6 b7
tof b8 c4
tof c1 c5
tof a7 c1
tof a7 a2
tof a7 c3
tof a7 b0
tof a7 b5
tof c1 c4
tof a8 a2
tof a8 c3
tof a8 b0
tof a8 c5
tof a8 b5
tof a8 c4
tof a8 c1
tof a4 a2
tof a4 b5
tof a4 b7
tof a4 c4
tof a4 b8
tof a4 b6
tof a5 a7
tof a6 a7
tof a7 a2
tof a5 c3
tof a7 b0
tof a5 a9
tof a5 c5
tof a7 b5
tof a6 c4
tof a7 b8
tof a7 c2
tof a6 c1
tof a5 a8
tof b4 a6
tof b3 b4
tof b4 a2
tof b4 b0
tof b3 a9
tof b4 c5
tof b3 b2
tof b4 b5
tof a6 b7
tof b4 b8
tof b4 c2
tof a6 c1
tof b4 a7
tof b3 a8
tof b3 a5
tof c6 c4
tof c6 c1
tof c6 b4
tof c6 b3
T* c5
T c6
T b3
T* b9
T* b4
T* c0
T* a5
T* a6
T* a4
T* a3
T* a8
T* a7
T* c1
T* c2
T* b6
T* b8
T c4
T* b7
T* b5
T* b2
T* b1
T* a9
T* b0
T* c3
T* a1
T* a0
T* a2
tof a6 c6
tof a7 c6
tof b7 b6
tof a9 b6
tof b0 b6
tof b6 c5
tof b6 c6
tof a4 b9
tof a8 a6
tof a7 a6
tof b6 a6
tof b8 a6
tof b5 a6
tof a9 a6
tof b0 a6
tof c3 b3
tof a6 b3
tof a6 b9
tof a4 c0
tof a3 c0
tof a7 b4
tof b6 b4
tof b7 c0
tof a9 c0
tof b0 b4
tof c3 b4
tof c3 c0
tof a8 a6
tof b0 b5
tof c3 a5
tof a2 b5
tof a6 a5
tof b5 a6
tof b8 a3
tof b7 a3
tof a9 a3
tof a2 b0
tof b0 a4
tof b0 a3
tof c2 a7
tof b6 a8
tof b5 b8
tof b0 a7
tof a2 a8
tof b8 a8
tof b8 a7
tof b8 c1
tof b0 c1
tof c2 c1
tof b5 b6
tof b1 b6
tof a9 b6
tof b0 b2
tof a2 b6
tof b8 b6
tof b2 b8
tof b5 c4
tof b2 c4
tof a9 b7
tof c3 c4
tof a0 b7
tof b0 c4
tof b0 b7
tof b0 b5
tof c3 b2
tof b2 b5
tof a1 b2
tof c3 b1
tof c3 a9
tof a2 b0
tof a1 a0
tof b0 c3
tof a9 b0
tof b1 b0
tof b0 a2
tof b0 c3
tof b5 b2
tof b2 a0
tof b5 c3
tof b5 b1
tof b5 a9
tof b8 c3
tof b6 c3
tof b6 a2
tof b8 c4
tof b6 b0
tof b8 b1
tof c3 a9
tof b8 b5
tof c3 b7
tof c2 a0
tof c2 b2
tof a7 a0
tof a7 b2
tof a8 a2
tof a7 c2
tof a7 c1
tof a4 a0
tof a3 b0
tof a4 a1
tof a4 b7
tof a6 a0
tof a6 a2
tof a6 b1
tof a6 a9
tof a6 a1
tof a6 b5
tof a6 a3
tof a6 b6
tof a6 c4
tof b9 a8
tof b3 a8
tof b3 a3
tof b3 c4
tof b3 a5
tof b3 c0
tof b3 b4
tof b3 b5
tof c6 b5
tof c5 b5
tof c6 a8
tof c6 a3
tof b5 c4
tof b5 a5
tof c5 c0
tof c6 b4
T* c5
T c6
T b3
T* b5
T* a6
T* b4
T c0
T a5
T* c1
T* c2
T* a7
T* c4
T* a4
T* b7
T* b8
T* b6
T* c3
T* a3
T* b9
T* a1
T* a9
T* b1
T* b0
T* a8
T* a2
T* b2
T* a0
tof b3 c6
tof c2 c6
tof a4 c6
tof b8 c6
tof b6 c5
tof b9 c6
tof a1 c6
tof a9 c6
tof b1 c5
tof a8 c6
tof a2 c6
tof b2 c6
tof c6 c5
tof c3 c6
tof b4 b5
tof a4 c2
tof a3 c2
tof b9 b5
tof a1 c2
tof a8 b5
tof a2 c2
tof b2 c2
tof b5 b3
tof c2 b5
tof c2 c0
tof b6 c0
tof a3 a6
tof b9 b4
tof a1 c0
tof b1 c0
tof a8 b4
tof a2 a6
tof b2 c0
tof b4 a6
tof c0 b4
tof b6 a5
tof b1 a5
tof c2 c0
tof c2 a5
tof b8 c1
tof b6 c1
tof b9 c2
tof a9 c1
tof b1 c1
tof a8 c2
tof c2 c1
tof a3 c2
tof b8 c4
tof b6 a4
tof a3 a4
tof b9 a4
tof a9 c4
tof b1 a4
tof a8 a4
tof a2 a4
tof a4 a7
tof a4 c4
tof b6 a4
tof a3 a4
tof a1 b7
tof b1 a4
tof a8 b9
tof b2 b7
tof a0 b7
tof b9 a4
tof b9 b7
tof a1 b9
tof a9 b8
tof b1 b6
tof a8 b9
tof b2 b9
tof b6 b8
tof b9 b6
tof a2 c3
tof a8 a1
tof b2 a1
tof a8 a9
tof a2 b1
tof b2 b0
tof a8 b0
tof a2 a8
tof b2 a2
tof a8 a2
tof b0 a2
tof a8 b2
tof a9 a0
tof b1 b2
tof a1 a0
tof b9 a0
tof a1 b2
tof a1 a9
tof b9 b0
tof a1 a8
tof a3 b0
tof a3 a2
tof a3 a1
tof b6 a0
tof b6 a9
tof b6 a1
tof b7 b6
tof a4 b7
tof a4 b1
tof a4 a9
tof a4 b0
tof a4 c3
tof a4 a8
tof a4 a1
tof b6 b9
tof a7 b9
tof c2 a3
tof c1 a3
tof a3 a0
tof a3 b2
tof a3 b1
tof a3 a9
tof a3 c3
tof c2 a2
tof c1 c4
tof c2 b9
tof c1 a7
tof a3 b8
tof c2 b7
tof c1 a4
tof c1 a1
tof c2 b6
tof c0 a2
tof a5 b9
tof c0 b7
tof a5 a4
tof a5 c1
tof b4 c0
tof a6 c0
tof b4 a2
tof c0 c4
tof b4 b7
tof b4 b6
tof b5 a5
tof b3 a5
tof b5 a2
tof a5 b9
tof b5 b7
tof a5 a4
tof a5 c1
tof a5 c0
tof b5 a6
tof b5 b6
tof b5 b4
tof c6 a1
tof c5 c6
tof a1 a0
tof a1 b2
tof a1 b1
tof a1 a9
tof a1 c3
tof c5 a2
tof a1 c4
tof c5 b9
tof a1 a7
tof a1 b8
tof c5 b7
tof c6 a4
tof c5 c1
tof c6 c0
tof c5 a6
tof c6 a5
tof c5 b6
tof c6 b4
tof c5 b5
tof c5 c2
T* c5
T* c6
T* c2
T b3
T* b5
T b4
T b6
T* a5
T* a6
T* c0
T c1
T* a1
T a4
T* a3
T* b7
T* b8
T* a7
T b9
T* c4
T* a2
T* a8
T* c3
T* b0
T* a9
T* b1
T* b2
T* a0
tof b3 c6
tof b5 c6
tof a6 a5
tof c0 a5
tof c1 c6
tof a1 c6
tof a4 c6
tof a3 c6
tof a2 a5
tof a8 c6
tof b0 a5
tof b1 c6
tof b2 a5
tof a5 c5
tof a5 c6
tof a5 b3
tof a6 b5
tof c1 b3
tof a1 c2
tof a4 c2
tof a3 b3
tof a2 b5
tof a8 b5
tof b0 b5
tof b2 b5
tof b3 c2
tof b5 b3
tof b6 b4
tof a5 b5
tof a1 b4
tof a4 b4
tof a7 b4
tof b9 b4
tof a8 b4
tof b1 b4
tof c1 b6
tof a3 a5
tof b7 a4
tof b8 a4
tof a7 a5
tof b9 a5
tof a2 a4
tof b0 a4
tof b2 a4
tof a5 b6
tof a4 a5
tof b7 c0
tof a8 c0
tof c3 a2
tof b0 a2
tof b1 c0
tof b2 a2
tof a2 a6
tof a2 c0
tof a4 c1
tof a3 a1
tof b8 a1
tof a7 a1
tof b9 a1
tof a2 b7
tof c3 c1
tof b1 a1
tof a1 c1
tof b7 a1
tof b8 a4
tof a7 a3
tof b9 a3
tof a8 b7
tof b1 b7
tof a3 a4
tof b7 a3
tof a8 b7
tof b0 b8
tof b2 b7
tof b2 b8
tof b0 c3
tof b1 c3
tof b2 b9
tof b9 a7
tof c3 b9
tof c3 c4
tof b0 c4
tof b1 a2
tof b0 c3
tof b2 a9
tof b2 a0
tof b0 a9
tof a9 a0
tof c3 b0
tof a8 c3
tof b0 a0
tof a8 b2
tof b9 a9
tof a7 b9
tof b9 b0
tof b8 b9
tof b7 b9
tof b9 a9
tof b9 b0
tof b7 a7
tof b7 b2
tof a4 a9
tof a4 b0
tof a4 c4
tof a4 b9
tof a4 b8
tof a1 a8
tof c1 a8
tof a1 a9
tof a1 b9
tof a8 a3
tof a1 a7
tof a6 b7
tof a5 a8
tof b6 a8
tof a5 c4
tof a5 a3
tof a8 b2
tof a8 c3
tof a5 a7
tof a5 a1
tof a5 b8
tof b4 b2
tof b5 b2
tof b4 a0
tof b4 a9
tof b5 c4
tof b5 b9
tof b5 a3
tof b5 c0
tof b5 c3
tof b4 a8
tof b4 b6
tof b5 a7
tof b5 b8
tof b5 a5
tof b5 a6
tof b3 c4
tof b3 b9
tof b3 a3
tof b3 b2
tof b3 c3
tof b3 a8
tof b3 a7
tof b3 b8
tof b3 a5
tof b3 b5
tof b3 b7
tof c6 a6
tof c5 a6
tof a6 c4
tof a6 b9
tof a6 a3
tof a6 c0
tof a6 b2
tof a6 c3
tof a6 c1
tof c5 c2
tof a6 a1
tof c6 b7
tof c6 b3
tof c5 b1
tof c5 a4
tof c5 b4
T* c5
T c6
T* b4
T* a4
T* b1
T b3
T b7
T* b5
T a6
T* a5
T* b8
T* a1
T c2
T* a7
T* c1
T b6
T a8
T* c3
T* b2
T c0
T* a3
T* b9
T c4
T* b0
T* a2
T* a9
T* a0
tof b1 b4
tof b3 b4
tof a1 c6
tof c1 c6
tof b6 c6
tof a8 b4
tof c3 b4
tof b4 c5
tof b4 c6
tof a5 b4
tof a1 b4
tof c1 b4
tof b6 b4
tof a8 b3
tof b2 a4
tof b0 b4
tof a4 b4
tof b3 a4
tof a5 b1
tof c1 a1
tof b6 a1
tof a8 b3
tof c3 b3
tof b2 b1
tof b0 b3
tof b3 b1
tof a1 b3
tof a6 b5
tof a5 b5
tof b2 a1
tof b0 b5
tof a1 b7
tof a1 b5
tof b8 a6
tof c1 a1
tof b6 a1
tof b2 a6
tof b0 a5
tof a5 a6
tof a1 a5
tof c2 a1
tof c1 b8
tof b6 b8
tof b0 a1
tof b2 c2
tof b0 c2
tof c1 c2
tof c1 a7
tof a8 b6
tof c3 b6
tof a2 c1
tof b6 c1
tof b2 c3
tof c0 c3
tof a2 a8
tof c4 c0
tof a2 c0
tof b0 b2
tof b0 c0
tof b0 b9
tof b0 c4
tof a2 a0
tof b0 a0
tof c4 a0
tof c4 a9
tof b0 a2
tof b0 c8
tof a3 c4
tof b2 c0
tof b2 a9
tof b2 a2
tof b2 c8
tof b2 c4
tof b2 b0
tof b2 b9
tof c3 c0
tof a8 c0
tof c0 a0
tof c0 a9
tof c0 b0
tof b6 a2
tof c1 a2
tof c1 a0
tof a2 a9
tof b6 c4
tof b6 c0
tof c1 a8
tof c1 c3
tof a7 a9
tof c2 a7
tof c2 a2
tof c2 c0
tof a7 b9
tof a7 a8
tof c2 a3
tof c2 b6
tof a1 a3
tof b8 a3
tof b8 a0
tof a1 a2
tof a3 c4
tof a1 c0
tof a1 b9
tof a1 a8
tof a1 b6
tof a1 a7
tof a1 c2
tof a5 b8
tof a6 b8
tof a5 a2
tof b8 c8
tof a6 c4
tof b8 b0
tof b8 c0
tof a5 b9
tof a6 a3
tof a5 c3
tof a5 c1
tof a5 a7
tof a5 c2
tof b5 a0
tof b5 c8
tof b5 c4
tof b5 b0
tof b5 c0
tof b5 a3
tof b5 c3
tof b5 c1
tof b5 a6
tof b5 b8
tof b1 b3
tof b1 a9
tof b1 c4
tof b1 b0
tof b1 a8
tof b1 b6
tof b1 c1
tof b4 a4
tof a4 b3
tof b4 c4
tof b4 b0
tof b4 b6
tof b4 c1
T* b3
T* b7
T* b5
T b4
T b1
T* a2
T a4
T* b8
T a6
T* b2
T a1
T* a5
T* c2
T* a7
T* c6
T* c1
T* b6
T c3
T* a3
T* a8
T* b9
T* c0
T* b0
T c4
T c8
T* c5
T* a9
T* a0
tof b5 b7
tof a2 b3
tof b8 b4
tof b2 b3
tof b6 b7
tof c0 b3
tof b0 b3
tof c5 b4
tof b4 b3
tof b4 b7
tof b2 b5
tof c6 b4
tof b6 b5
tof c0 a2
tof b0 a2
tof a2 b5
tof a2 b4
tof b8 a2
tof a6 a2
tof a7 b1
tof b6 a2
tof a8 b1
tof b0 a5
tof c4 a5
tof a5 b1
tof a5 a2
tof a6 a4
tof b2 b8
tof a1 b8
tof a5 b8
tof b6 a4
tof c0 a4
tof b0 a4
tof b8 a4
tof a1 b2
tof c2 a6
tof a0 a6
tof b2 a6
tof a5 b2
tof c2 a1
tof a7 a5
tof c1 a5
tof b6 a5
tof c3 a5
tof a8 a5
tof a5 a1
tof c6 a5
tof a7 c2
tof c6 a7
tof b6 c6
tof a8 c3
tof c1 c6
tof c3 c1
tof c0 c3
tof b0 c3
tof c5 b6
tof b9 a8
tof b0 a8
tof c4 a8
tof c5 a3
tof b0 b9
tof c4 b9
tof c5 c0
tof c5 b0
tof c5 c4
tof c5 c8
tof c5 a9
tof b0 a9
tof c0 a9
tof c0 c4
tof c0 b0
tof a8 b9
tof c3 a9
tof c3 c4
tof b6 c8
tof b6 c0
tof b6 c5
tof b6 a3
tof c1 c3
tof c6 c3
tof c6 a9
tof c1 a0
tof c6 c4
tof c3 b0
tof c1 c8
tof c1 a3
tof c1 b6
tof a7 a9
tof c2 a0
tof a7 c4
tof a7 b9
tof a7 c8
tof a7 a3
tof a7 b6
tof a5 a9
tof a5 a0
tof a5 c8
tof a5 a3
tof a5 c3
tof a5 c6
tof a5 b0
tof a5 a7
tof a6 a0
tof b2 c8
tof b2 c0
tof b2 c5
tof b2 a3
tof b2 b6
tof b2 a1
tof b8 a9
tof b8 a0
tof b8 a6
tof b8 c8
tof b8 c0
tof b8 c5
tof b8 a3
tof b8 b6
tof a2 a4
tof b1 a2
tof a4 a9
tof a2 a0
tof b4 a9
tof b4 b6
tof b4 b9
tof b4 a0
tof b3 b7
tof b3 b9
tof b3 a0
tof b3 b4
T b3
T* b5
T* b4
T a0
T* b9
T* c2
T* b1
T* b2
T* b8
T a1
T* c4
T* a5
T* a7
T* b0
T c1
T* c6
T* b6
T* c3
P* a3
T* a3
T a8
T* c5
T* c0
T* c8
T* a2
T* a4
T* a6
T* b7
T* a9
tof a0 b3
tof c2 b5
tof a1 b5
tof b0 b5
tof c1 b5
tof b6 b5
tof c5 b3
tof b1 a0
tof b8 b4
tof a5 b4
tof a7 a0
tof b0 b4
tof c1 a0
tof c5 b4
tof a4 b4
tof a0 b4
tof b9 a0
tof b8 c2
tof a1 c2
tof a7 b9
tof b0 b9
tof c3 b9
tof a3 b9
tof c5 c2
tof c1 b9
tof c1 c2
tof a5 b8
tof b0 b8
tof c5 b8
tof a2 b2
tof a4 b1
tof b2 b1
tof b8 b2
tof a5 b8
tof a7 b8
tof b0 b8
tof c1 b8
tof a4 a3
tof a1 b8
tof a3 a1
tof a7 a5
tof c1 a5
tof a3 a5
tof a8 a5
tof c5 a5
tof a4 a5
tof b0 c4
tof b0 a5
tof c1 b0
tof c6 a7
tof a3 a7
tof a4 a7
tof b0 a7
tof a3 c6
tof a8 c1
tof a4 c6
tof c6 c1
tof c3 c6
tof a3 c3
tof b7 b6
tof c5 a8
tof c0 a8
tof a4 a3
tof a4 c5
tof c0 c5
tof c7 a4
tof c7 b7
tof c7 a9
tof b7 a9
tof a4 b7
tof a4 c7
tof a2 c7
tof c0 c7
tof c5 c7
tof c0 a2
tof a8 a2
tof a3 a2
tof a3 a9
tof a3 b7
tof a2 c7
tof a8 c5
tof a8 c0
tof a3 a4
tof c3 b7
tof b6 b7
tof b7 a9
tof c6 c0
tof c1 c0
tof c6 a9
tof c6 c3
tof c0 c8
tof c6 a4
tof c6 a3
tof b0 c1
tof a7 c1
tof a7 a9
tof a7 c3
tof b0 c8
tof b0 c0
tof a7 a4
tof c1 a8
tof a7 a3
tof a5 a2
tof c4 a5
tof c4 c1
tof c4 c5
tof c4 c7
tof a1 c3
tof b8 a1
tof a1 a9
tof c3 a6
tof b8 b6
tof a1 a4
tof a1 c5
tof b2 a2
tof b1 b2
tof c2 a6
tof b9 b7
tof c2 b6
tof c2 a4
tof c2 c5
tof c2 b8
tof a0 a1
tof b4 a1
tof a1 b7
tof a1 b9
tof b4 b2
tof a1 c5
tof a1 c7
tof a1 a5
tof a1 b0
tof b4 b1
tof b5 a9
tof b5 b6
T* b7
T* b9
T* a0
T* b4
T* a2
T* b1
T* c2
T* c3
T* b8
T* c4
T* a1
T b0
T* a7
T* a3
T c6
T a5
T* c7
T c5
T* c1
P a8
T a8
T a4
T* c0
T* c8
T* b2
T* b5
T* b6
T* b3
T* a6
T* a9
tof c3 b9
tof a7 b9
tof c6 b9
tof c7 b9
tof c5 b9
tof b9 b7
tof a1 a0
tof a7 a0
tof a3 a0
tof c6 a0
tof c7 c2
tof c5 c2
tof c2 a0
tof c2 b4
tof c2 b1
tof c6 a3
tof c7 b1
tof c5 b1
tof a3 a2
tof a3 b1
tof b8 c3
tof c4 c3
tof a1 c2
tof a3 c2
tof c6 c3
tof a5 c3
tof c7 c2
tof c5 c3
tof c1 c2
tof c0 c3
tof a7 c2
tof a7 c3
tof a1 b8
tof a7 b8
tof a3 b8
tof c7 c4
tof c1 c4
tof b2 b8
tof b5 b8
tof c4 b8
tof c6 a3
tof c7 a3
tof c5 a3
tof a4 a3
tof a3 a1
tof a3 b0
tof c6 a7
tof a4 a7
tof c1 c6
tof a4 c7
tof c0 a5
tof b2 a5
tof b5 c7
tof b6 c7
tof b3 c6
tof a5 c6
tof c7 a5
tof c0 c7
tof b5 c7
tof b6 c7
tof a9 c1
tof c5 c7
tof c1 c5
tof a4 c1
tof c0 c1
tof a9 c1
tof c0 a4
tof b5 b2
tof b6 b2
tof a9 b2
tof a9 b6
tof b6 b5
tof a9 a6
tof b3 a6
tof b5 a6
tof b5 b3
tof b2 b3
tof a4 b2
tof a4 c8
tof c5 b2
tof c7 b2
tof c7 c1
tof c5 a9
tof c5 b6
tof c5 b5
tof c7 c0
tof a5 b2
tof a5 b6
tof a5 b5
tof a5 c5
tof c6 b3
tof a5 a6
tof a7 c1
tof a7 b2
tof a7 a9
tof a7 a4
tof a3 b3
tof a7 a6
tof a7 a5
tof a3 c6
tof a7 c8
tof a1 b0
tof a1 c1
tof a1 a9
tof a1 b6
tof a1 b5
tof a1 c5
tof a1 b3
tof a1 c6
tof a1 a3
tof a1 a4
tof c4 b2
tof b8 b6
tof b8 b5
tof b8 c5
tof b8 a5
tof c4 a3
tof c3 a5
tof c2 a5
tof c3 b2
tof c2 a9
tof c3 b6
tof c3 b5
tof c3 c5
tof c2 a6
tof c3 b8
tof a2 b1
tof a0 b4
tof a0 a9
tof a0 b1
tof a0 c2
tof b9 b6
tof b7 b5
tof b7 b8
T* b9
T b1
T* a0
T* b3
T* c2
T* a2
T c3
T* a3
T* c4
T* c7
T* a1
T a4
T* a7
T* c0
T c8
T* b7
T* c6
T* b8
T* a5
T* a6
tof c7 b1
tof a1 b1
tof a4 b1
tof a7 b1
tof b7 b9
tof b6 b9
tof a9 b1
tof c3 b3
tof c4 b3
tof c7 b3
tof a4 b3
tof c6 b3
tof a5 a0
tof a6 b3
tof a9 a0
tof b2 b3
tof c6 a2
tof a6 a2
tof a9 c2
tof c7 c4
tof a4 c4
tof b2 c3
tof c4 c3
tof c4 a3
tof a1 c7
tof a4 c7
tof a7 c7
tof a7 a1
tof a7 a4
tof c0 a7
tof a6 c6
tof b5 b8
tof a7 c0
tof a1 a4
tof c7 c0
tof c7 a7
tof c7 a1
tof b3 a2
tof a0 a5
tof b3 a6
tof b3 c6
tof b9 b7
H b6
H a9
H a2
P a4
P a6
P c7
P b5
P c4
P b1
P b0
P a5
P c6
P b7
P b9
P c3
P b8
P c2
P b4
P a1
P a0
P a7
P* b2
Z c1
P c0
P c5
P b3
H b2
H a3
H c1
H a8
H c0
H c8
tof c0 b6
tof c8 a9
tof a8 c9
tof c1 c8
tof a3 c0
tof b2 a8
tof a2 c1
tof a9 a3
tof b6 b2
H b6
H a9
H a2
H b2
H a3
H c1
H a8
H c0
H c8
H c9
tof a5 a0
tof b2 b3
tof c1 a0
tof b7 b8
tof c3 b4
tof c8 b4
tof c8 b8
tof a6 c6
tof b7 b9
tof a8 c6
tof c9 b9
tof a6 c4
tof b1 b0
tof c8 c4
tof c9 b0
tof b7 a6
tof a2 c5
tof c1 a6
tof c9 a6
tof a5 b5
tof b2 b5
tof c1 b5
tof c1 b1
tof b2 a5
tof c8 b7
tof b7 a5
tof a3 b7
tof a3 c3
tof c8 c3
tof a2 b6
tof b2 a9
tof a3 a9
tof c1 a9
tof c8 a9
tof c9 a9
tof a3 a2
tof c1 a2
tof c9 c8
tof c8 a2
tof c8 b2
tof c0 c1
tof c9 c0
tof c8 a8
tof c8 c0
tof c0 c9
tof c0 c8
tof c1 c9
tof c1 c8
tof a3 a8
tof a3 c0
tof a2 b2
tof c3 a3
tof b7 b2
tof a5 b2
tof b7 a8
tof b7 c0
tof b7 a9
tof b7 a2
tof b7 c9
tof b5 a5
tof b1 c8
tof b1 c1
tof c5 b6
tof a6 a9
tof a6 a2
tof c5 a3
tof a6 c9
tof b9 a6
tof b9 a8
tof b4 a3
tof b4 c3
tof b8 b7
tof b8 a5
tof b3 a9
tof a0 b2
tof a0 b5
T* c8
T b0
T b9
T c4
T b8
T b4
T* c1
T* c0
T c6
T* a8
T a6
T a5
T* b1
T a0
T* b7
T* c9
T* c3
T b5
T* b3
T* c5
T a3
T* b2
T* a2
T a9
T* b6
tof b9 c8
tof c1 b0
tof c0 b0
tof a6 b0
tof b1 c8
tof a0 b8
tof b7 b8
tof c9 c8
tof c3 b0
tof c5 b0
tof a3 b0
tof b2 b8
tof a2 b8
tof b0 c8
tof b8 b0
tof b8 b9
tof a6 c4
tof a5 c4
tof b1 c1
tof a0 c4
tof b7 c4
tof c3 c1
tof c5 c1
tof a3 c1
tof b2 c4
tof a2 c4
tof c4 b9
tof c1 c4
tof c0 b8
tof a8 c6
tof a5 c6
tof a0 b4
tof b7 c6
tof c9 b4
tof c5 b4
tof a3 b4
tof c6 b8
tof c6 b4
tof c6 c1
tof a8 c1
tof c9 c1
tof c3 c1
tof a3 c5
tof c5 c1
tof c5 c0
tof a5 a8
tof b7 a8
tof c9 c6
tof c3 a8
tof c5 a8
tof b2 a6
tof a2 a6
tof a6 c6
tof a6 a8
tof b7 a5
tof c9 a6
tof c3 a5
tof a3 a6
tof a2 a6
tof a5 a6
tof c5 a5
tof c3 c9
tof b3 b1
tof c5 c9
tof b2 c9
tof a2 c9
tof c9 b1
tof c9 a0
tof a3 c3
tof b2 c9
tof a2 b7
tof c9 b7
tof c3 c9
tof c5 b5
tof a3 b5
tof a2 c3
tof a2 b5
tof a3 b3
tof a2 b3
tof c5 b3
tof a2 a3
tof a2 b2
tof b3 b6
tof b3 a9
tof c5 a2
tof c5 b2
tof b5 a3
tof c3 a3
tof b5 b6
tof b5 a9
tof c3 a2
tof b5 b3
tof a3 b2
tof c9 b5
tof b7 b5
tof c9 a2
tof c9 b2
tof c9 a3
tof c9 c3
tof a5 b1
tof a6 b1
tof a6 b6
tof a6 a9
tof a6 a3
tof a6 b5
tof a8 a6
tof c6 a8
tof a6 b6
tof a6 a9
tof a6 b1
tof a6 a3
tof a6 b5
tof a8 b3
tof c6 c5
tof c0 c5
tof c1 c5
tof c1 b6
tof c1 a9
tof c1 b1
tof c1 a3
tof c1 b5
tof c1 a6
tof c1 c3
tof b4 b3
tof b8 b4
tof b8 b6
tof b8 a9
tof b8 b1
tof b8 a3
tof b8 b5
tof b8 a6
tof b8 c3
tof b8 c1
tof b8 c6
tof b9 c4
tof b0 c4
tof c8 b0
tof b0 b6
tof b0 a9
tof b0 b1
tof b0 a3
tof b0 b5
tof b0 a6
tof b0 b3
tof b0 c3
tof b0 c1
tof b0 c6
tof b0 b8
T b9
T* c8
T b0
T c4
T b8
T c0
T* c6
T b4
T* c1
T* a8
T* c3
T c5
T b3
T* a5
T* a0
T* c9
T a6
T b7
T* b5
T a3
T* b2
T b1
T* a2
T* a9
T b6
tof c4 c8
tof b8 c8
tof c6 c0
tof a8 c8
tof c3 b9
tof c5 c0
tof a3 c0
tof b2 c0
tof c7 c8
tof c0 b9
tof c0 c8
tof b8 c4
tof c6 b0
tof b4 b0
tof b3 b0
tof a5 b0
tof a0 b0
tof c9 a8
tof a6 b0
tof b7 c4
tof b5 c4
tof b2 a8
tof b1 b0
tof a8 b0
tof a8 c4
tof c1 b8
tof a8 b8
tof c3 c0
tof c9 b8
tof b2 b8
tof c7 c0
tof c5 c1
tof c7 b4
tof b4 c6
tof c1 b4
tof c5 c1
tof a5 a8
tof c9 a8
tof a3 c3
tof b2 c1
tof c7 a8
tof c3 c1
tof c3 a8
tof a5 c5
tof a6 c9
tof b2 c3
tof c7 c9
tof c9 c3
tof c9 c5
tof c9 b3
tof b2 a5
tof b1 b3
tof a5 b3
tof c7 a5
tof b5 b7
tof a3 b7
tof b2 a0
tof b1 a0
tof c7 a0
tof b7 a0
tof b7 c9
tof b5 a6
tof c7 b7
tof c7 b5
tof c7 a3
tof c7 b2
tof b1 b2
tof a2 b1
tof c7 a9
tof c7 b6
tof c2 c7
tof c7 c2
tof a2 b6
tof b1 b6
tof b2 c2
tof b5 b6
tof a3 a9
tof b7 b5
tof a6 b5
tof a6 b6
tof c9 b6
tof c9 a6
tof a5 a9
tof b3 a5
tof a5 b6
tof a5 b1
tof b3 a0
tof b3 b2
tof b3 c2
tof c3 c5
tof c3 b6
tof c5 a9
tof c3 b1
tof c3 a5
tof c3 a0
tof c3 b2
tof c3 c2
tof c3 b3
tof c3 b5
tof c1 a8
tof c1 a2
tof c1 a5
tof c1 a3
tof c1 a6
tof c1 c9
tof c1 b7
tof c1 b2
tof c1 c2
tof c1 c5
tof c1 c3
tof b4 c5
tof c6 c5
tof c6 b6
tof b4 a9
tof c6 b1
tof c6 a5
tof c6 a0
tof b4 b2
tof c6 c2
tof c6 b3
tof c6 c7
tof c0 c6
tof b8 c6
tof c0 b6
tof c6 a9
tof c0 a3
tof c0 a6
tof c0 c9
tof c0 b7
tof b8 b2
tof c0 c2
tof b8 c5
tof c0 b3
tof c0 a8
tof c0 c3
tof c6 b4
tof c0 b5
tof c6 c7
tof b8 c1
tof c8 b4
tof c8 c0
T* c8
T* b9
T* c0
T* b4
T b0
T* b8
T* c1
T* c6
T* c7
T* b5
T c4
T c3
T* a8
T b3
T* c5
T* c2
T b2
P* b7
T* b7
T* c9
T a0
T a6
T* a3
T* a5
T* a2
T b1
T* a9
T b6
tof b4 c8
tof b8 c0
tof c1 c8
tof b3 c8
tof b2 c8
tof a3 c8
tof a5 c8
tof a2 c8
tof b1 c8
tof c0 c8
tof c0 b9
tof c6 c0
tof a8 b4
tof b2 b4
tof b7 b4
tof a0 b4
tof c1 b0
tof b5 b8
tof c4 b8
tof a8 b0
tof b3 b0
tof c5 c7
tof c2 c7
tof a2 c7
tof b1 c7
tof b8 b0
tof c7 b8
tof b3 c1
tof c2 c1
tof c9 b7
tof a3 c6
tof a5 c6
tof a2 c1
tof b1 c1
tof c6 c1
tof b7 c6
tof c4 c7
tof c3 c7
tof b3 b5
tof c2 b5
tof b7 b5
tof c9 b5
tof a0 b5
tof a5 a6
tof a6 c7
tof a6 b5
tof b7 c3
tof c9 c4
tof a6 c4
tof a2 a0
tof b1 a0
tof a0 c4
tof a0 c3
tof c2 a8
tof b7 a8
tof c9 b3
tof a0 b3
tof a3 a8
tof a5 a8
tof a2 a8
tof b1 a8
tof c9 c2
tof a0 c2
tof a6 b7
tof a3 c2
tof a5 c2
tof a2 c2
tof b1 c2
tof a1 c5
tof c2 c5
tof b7 c2
tof c9 b7
tof a0 b7
tof a3 b7
tof a5 b7
tof a2 b2
tof b1 b2
tof a3 a0
tof a5 a0
tof a1 a6
tof a0 c9
tof a6 a0
tof a5 a3
tof a1 a6
tof b1 a2
tof a1 a2
tof a1 b1
tof a1 a9
tof a1 b6
tof a2 b6
tof a2 b1
tof a3 a9
tof a6 a9
tof a3 b1
tof a3 a5
tof a6 a1
tof a3 a2
tof a0 a3
tof c9 a0
tof a3 b1
tof c9 a5
tof a3 a1
tof a3 a2
tof b7 a5
tof b7 a2
tof b7 a3
tof b7 a0
tof b7 a6
tof b7 c9
tof c2 b1
tof c5 b1
tof c5 a9
tof c2 a5
tof c5 a3
tof c5 a0
tof c2 b7
tof c2 c9
tof b3 b1
tof b3 a5
tof a8 a6
tof a8 c2
tof a8 c5
tof c3 b1
tof b5 b1
tof b5 c3
tof c6 a8
tof c1 c6
tof c6 a9
tof c6 a3
tof c6 b3
tof c6 c9
tof c6 c2
tof c6 c4
tof c6 c7
tof b8 c7
tof b0 b8
tof c7 a9
tof c7 b1
tof c7 c3
tof c7 b7
tof c7 c2
tof c7 b5
tof c7 c4
tof b4 a8
tof c0 a8
tof a8 a9
tof a8 a3
tof a8 b3
tof a8 c9
tof a8 c2
tof a8 c4
tof a8 c7
tof c0 c1
tof b4 c5
tof b4 a6
T* c1
T c8
T b4
T* a6
T* c0
T c5
T b0
T b8
T* b9
T c6
T* a8
T c7
T* c4
T b5
T c2
T* c9
T* b7
T* b3
T* b2
T c3
T* a0
T a3
T* a2
T* a1
T* a5
T b1
T* a9
T* b6
tof c6 a6
tof c7 a6
tof c9 a6
tof b7 a6
tof a0 a6
tof a3 a6
tof a2 a6
tof a1 a6
tof a6 c1
tof a6 c8
tof a8 a6
tof c7 a6
tof c9 a6
tof b7 a6
tof a2 b4
tof a1 b4
tof a6 b4
tof c0 a6
tof a0 c5
tof a2 c5
tof c5 c0
tof c4 b0
tof b5 b0
tof c3 b0
tof a0 b8
tof a2 b8
tof a1 b0
tof b8 b0
tof a0 c6
tof a3 c6
tof a2 a8
tof a1 a8
tof a8 b9
tof a8 c6
tof c2 c7
tof b7 c7
tof a2 c7
tof a1 c7
tof c7 a8
tof c2 b5
tof b3 b5
tof a2 b5
tof a1 b5
tof b5 c4
tof a0 c9
tof a2 c9
tof b1 c9
tof b2 c2
tof b2 c9
tof c3 b3
tof a2 b3
tof b2 b7
tof b2 b3
tof a2 c3
tof a5 c3
tof b1 a2
tof a3 a0
tof a2 a3
tof b1 a2
tof a1 a2
tof a2 a1
tof a0 a3
tof a3 b1
tof c3 a5
tof b3 a5
tof b3 c3
tof c2 c9
tof c2 a5
tof c9 a3
tof c2 b2
tof c2 c3
tof c2 b3
tof c2 b7
tof a8 c7
tof a8 a5
tof a8 b5
tof a8 b2
tof a8 c3
tof a8 c9
tof a8 a9
tof a8 c4
tof a8 b7
tof a8 c2
tof a8 b3
tof a8 a3
tof b0 b8
tof c0 c5
tof a6 c5
tof b4 a9
tof a6 c0
tof b4 a8
tof c1 c8
tof c1 c5
tof c1 c7
tof c1 b5
tof c1 a1
tof c1 c9
tof c1 b6
tof c1 b0
tof c1 a6
tof c1 a2
tof c1 b3
tof c1 b9
tof c1 c4
tof c1 c6
tof c1 b1
H b6
tof c0 c1
tof b5 b1
tof b8 c1
tof b5 a5
tof c7 b7
tof c7 c6
tof c7 b4
tof a8 b9
tof c7 c4
tof c7 b9
tof b8 c8
tof c5 a4
tof a8 c8
tof a8 a4
tof c7 a8
tof c7 a3
tof b5 b3
tof b5 a0
tof b5 c2
tof c5 a2
tof b5 a6
tof b8 b0
tof b5 c0
tof b8 c0
tof b5 a9
tof c7 a9
tof c7 c3
tof b5 a1
tof c7 b2
tof c5 b5
tof c7 b8
tof c7 c5
tof a2 b5
tof b3 a1
tof a0 c7
tof a8 a9
tof a8 c3
tof a8 b8
tof c6 b2
tof b4 c5
tof b7 c7
tof b1 a9
tof c1 c0
T a4
T* c5
T* a2
T* b8
T c8
T* b0
T c1
T* a8
T b9
T* c4
T* a3
T* b4
T* c6
T* b7
T* b3
T* a0
T c7
T* a5
T* b5
T* b1
T* c2
T* c0
T* a6
T* b2
T* a1
T* c3
P c9
T c9
T a9
tof b4 c5
tof b7 a4
tof a0 a4
tof c7 a4
tof a8 a4
tof a8 c5
tof a8 b8
tof b7 b8
tof a0 b8
tof c7 b8
tof b5 a2
tof c0 a2
tof a7 a2
tof a8 c8
tof b3 b0
tof a0 b7
tof c7 b7
tof c0 b0
tof b7 c8
tof b7 b0
tof b7 c1
tof a7 c1
tof a8 c1
tof b9 a8
tof b3 b9
tof c0 b9
tof a7 b9
tof b7 b9
tof b7 c4
tof b7 a3
tof b7 b4
tof c0 b3
tof b7 c6
tof b3 b7
tof c7 a0
tof c2 b3
tof c0 b3
tof c2 c7
tof c2 a5
tof c2 b5
tof c2 b1
tof a6 c2
tof a6 c0
tof a7 b2
tof a7 c3
tof a7 a9
tof c2 c0
tof c0 c9
tof c0 c3
tof c0 b2
tof c2 a6
tof c0 a7
tof b1 a9
tof b1 c3
tof c7 a6
tof c7 a7
tof a0 c7
tof b3 c7
tof b3 a9
tof b3 c9
tof c7 a1
tof b3 b2
tof c7 a6
tof c7 a7
tof b3 b5
tof b3 c0
tof b3 b1
tof b3 c2
tof b3 a5
tof c6 b2
tof b9 a9
tof b9 c9
tof b9 b2
tof b9 a6
tof b9 a7
tof b9 b7
tof a8 a9
tof a8 c9
tof a8 b2
tof a8 a6
tof a8 a7
tof a8 b7
tof a8 b9
tof b8 b9
tof a2 b9
tof a2 c9
tof a2 c3
tof a2 a6
tof b9 b0
tof a2 b7
tof a2 c1
tof b9 c0
tof b9 b1
tof b9 c2
tof b9 a5
tof b9 b3
tof b8 a0
tof b9 b5
tof b8 c6
tof b9 c7
tof b8 b4
tof b8 c4
tof b8 a3
tof b8 a8
tof c5 c9
tof c5 c3
tof c5 a6
tof c5 b0
tof c5 b7
tof c5 c1
tof c5 c0
tof c5 b1
tof c5 c2
tof c5 a5
tof c5 b3
tof c5 b5
tof c5 c7
tof c5 b9
tof c5 a7
T* a4
T* c5
T* a7
T a2
T b8
T* c8
T* a8
T* a3
T* c4
T* b9
T* b4
T* c7
T* c6
T* b5
T* a0
T* b3
T* a5
T* c2
T* b1
T* c0
T* c1
T* b7
T b0
T* a6
T* b2
T* a1
T* c3
T* c9
T* a9
tof b8 a7
tof a0 a7
tof a7 a4
tof a7 c5
tof b8 a2
tof c0 a2
tof a2 a7
tof c6 b8
tof c6 c8
tof c6 a8
tof c6 a3
tof c6 c4
tof c6 b9
tof c6 b4
tof c6 c7
tof c0 c6
tof c0 b5
tof a6 a0
tof c0 a0
tof c0 b3
tof c0 a5
tof c0 c2
tof c3 b1
tof c0 b1
tof c1 c0
tof b0 b7
tof b7 b0
tof c0 c1
tof b1 c3
tof a0 a6
tof c6 b5
tof c6 a6
tof c6 c1
tof c6 b0
tof c6 a0
tof c6 b1
tof c6 c9
tof c6 a9
tof c6 a5
tof c6 c0
tof c6 c2
tof c6 b3
tof c6 c3
tof c7 a1
tof b8 c8
tof b8 a6
tof b8 c1
tof b8 b0
tof b8 a0
tof b8 a1
tof b8 b1
tof b8 c9
tof b8 a9
tof b8 a5
tof b8 c0
tof b8 c2
tof b8 b3
tof b8 b5
tof b8 c7
tof b8 b9
tof b8 a3
tof b8 c3
tof b8 c6
tof b8 a8
tof b8 c4
tof b8 b4
tof a7 a2
tof c5 b2
P a2
P* b2
Z b1
P a9
H a9
H c9
H b1
H a1
H b2
H a0
H b0
H c1
tof a2 c6
tof a2 c3
tof c2 a6
tof b7 a5
tof a2 a5
tof a2 a6
tof a2 c0
tof a2 a7
tof b7 a2
tof a5 b7
T a6
T* b7
T* a2
T a5
T* c3
T* c0
T* c6
T* a7
tof a2 b7
tof a5 b7
tof c2 a6
tof b7 a6
tof c6 b7
tof a5 a2
tof c6 a5
tof c6 c3
tof c6 c0
tof a7 c6
tof c6 a7
tof a2 a5
tof b7 a7
tof b7 c6
tof b7 c0
tof b7 a5
tof b7 c3
H a7
tof b7 a5
tof a5 b7
tof b7 a5
tof a5 b4
tof b4 a5
tof a5 b4
tof b4 b5
tof b5 b4
tof b4 b5
tof b5 b3
tof b3 b5
tof b5 b3
tof b3 c7
tof c7 b3
tof b3 c7
tof c7 b0
tof b0 c7
tof c7 b0
tof b0 c5
tof c5 b0
tof b0 c5
tof c5 b2
tof b2 c5
tof c5 b2
tof b2 b9
tof b9 b2
tof b2 b9
tof b9 c6
tof c6 b9
tof b9 c6
tof c6 a0
tof a0 c6
tof c6 a0
tof c3 b1
tof b1 c3
tof c3 b1
tof b1 a3
tof a3 b1
tof b1 a3
tof a3 a6
tof a6 a3
tof a3 a6
tof a6 c4
tof c4 a6
tof a6 c4
tof c4 a1
tof a1 c4
tof c4 a1
tof b8 c0
tof c0 b8
tof b8 c0
tof c0 b6
tof b6 c0
tof c0 b6
tof b6 c2
tof c2 b6
tof b6 c2
tof c2 c9
tof c9 c2
tof c2 c9
tof c9 a7
tof a7 c9
tof c9 a7
tof a7 a8
tof a8 a7
tof a7 a8
tof a8 c8
tof c8 a8
tof a8 c8
tof c8 c1
tof c1 c8
tof c8 c1
tof c1 a9
tof a9 c1
tof c1 a9
tof a9 a4
tof a4 a9
tof a9 a4
END
