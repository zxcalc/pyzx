# Original circuit
#   qubits: 36
#   qubits used: 36
#   H: 50
#   cnot: 267
#   X: 0
#   T: 238
#   P: 0
#   Z: 0
#   tdepth (by partitions): 102
#   tdepth (by critical paths): 24
# Optimized circuit
#   qubits: 36
#   qubits used: 36
#   H: 50
#   cnot: 737
#   X: 0
#   T: 162
#   P: 22
#   Z: 1
#   tdepth (by partitions): 11
#   tdepth (by critical paths): 11
#   Time: 0.017 s
.v a0 b0 c0 a1 b1 c1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6 c6 d6 a7 b7 c7 a8 b8 c8 d8 a9 b9 c9 e
.i a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 a6 b6 a7 b7 a8 b8 a9 b9
.o a0 b0 c0 a1 b1 c1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6 c6 d6 a7 b7 c7 a8 b8 c8 d8 a9 b9 c9 e

BEGIN
H c0
H c1
H c2
H d2
H c3
H c4
H d4
H c5
H d5
H c6
H d6
H c7
H c8
H d8
H c9
tof e c0
tof d2 a2
tof b3 a3
tof d5 a5
tof b7 a7
tof c7 b7
tof b9 a9
tof b9 c9
tof a9 c9
tof c8 a9
tof b8 a9
tof a8 a9
tof b8 d8
tof b7 c7
tof b6 d6
tof c6 a7
tof b5 d5
tof a5 d5
tof c4 d5
tof d2 a3
tof c2 a3
tof b2 a3
tof a2 a3
tof b2 d2
tof b1 c1
tof c0 e
tof b0 e
T a0
T b0
T c0
T* e
T a1
T b1
T* c1
T b2
T* a2
T* d2
T b3
P c3
T c3
T a4
T b4
T d4
T b5
T* a5
T a6
T b6
T* d6
T c7
T* b7
T a8
T b8
T* d8
T b9
T* c9
T c2
T a3
T c4
T* d5
T c6
T* a7
T c8
T a9
tof b0 a0
tof e b0
tof b2 c0
tof d2 c0
tof c1 a1
tof b1 a1
tof a2 b2
tof b3 a2
tof c3 a2
tof c2 a2
tof a3 a2
tof d2 a2
tof a3 b3
tof c3 b3
tof d4 a4
tof b4 a4
tof d5 b5
tof c4 d4
tof c4 b5
tof b6 a6
tof d6 a6
tof c4 a5
tof d5 a5
tof d6 b6
tof a7 c6
tof c6 c7
tof c6 b7
tof b9 b8
tof c8 b8
tof a9 b8
tof d8 a8
tof d8 b8
tof c8 b9
tof a9 b9
tof b9 d8
tof a3 c2
tof d5 c4
tof c6 a7
tof c4 d5
tof b9 a9
tof b9 c8
tof b8 b9
tof a8 b8
tof b8 a9
tof b8 c8
tof b8 d8
tof b8 c9
tof d6 a7
tof b6 d6
tof a7 c6
tof a6 c6
tof a6 a7
tof a6 d6
tof d4 d5
tof d4 c4
tof b4 d5
tof a4 b4
tof a4 c4
tof a4 d4
tof b3 a3
tof b3 c2
tof a2 c3
tof a2 c2
tof a2 b3
tof b2 d2
tof b1 c1
tof b0 c0
tof a0 b0
tof a0 e
T* a0
T* e
T b0
T* a1
T d2
T c0
T b2
T c3
T* a2
T* a3
T* b4
T* d5
T a4
T b5
T* a5
T b6
T* a6
T d6
T c7
T* b7
T b9
T* d8
T a8
T b8
P c9
T c9
T* b3
T* c2
T* d4
T c4
T* a7
T c6
T* c8
T* a9
T c5
tof b0 e
tof e a0
tof c1 a1
tof b2 c0
tof a2 c0
tof a3 c0
tof b3 c0
tof c2 c0
tof a2 b2
tof a3 b2
tof b3 b2
tof c2 b2
tof c2 a3
tof a3 a2
tof a4 b4
tof a4 d5
tof c4 b5
tof d4 a4
tof d4 b5
tof a6 b6
tof d6 a6
tof c6 a7
tof a7 c7
tof a7 b7
tof d8 b9
tof a8 d8
tof c8 a8
tof a9 a8
tof b8 a8
tof c4 d4
tof a9 c8
tof a7 c6
tof d4 c4
tof b8 a9
tof b8 c8
tof d8 c8
tof b9 c8
tof c8 a8
tof c8 a9
tof c7 b7
tof c7 a7
tof a6 d6
tof a6 c6
tof b6 d6
tof b6 c6
tof b5 a5
tof d5 c4
tof b4 c4
tof c4 a4
tof a2 a3
tof a2 b3
tof a2 c2
tof c3 a3
tof e b0
tof a0 b0
tof b8 c8
tof a7 c7
tof a1 b1
H b0
H a2
H b2
H c4
H a4
H c6
H d6
H a9
H a8
tof b1 b0
tof b1 a1
tof c0 b1
tof c2 c3
tof c5 c4
tof c6 c4
tof c6 c5
tof c7 a7
tof b7 d6
tof c8 a8
tof c9 a8
tof c9 b8
tof c8 b8
tof c8 c9
tof a8 c9
tof a8 c8
tof d6 b7
tof d6 c7
tof b2 c2
tof a2 a3
tof d2 b3
tof c1 c0
tof b1 c0
tof b0 b1
tof b0 c1
tof b0 c0
T* b8
T b1
T* b0
T* c0
T c1
T b2
T* c2
T* d6
T c7
T* c8
T a8
T* c5
T c4
T a2
T* a3
tof b0 b1
tof c0 b1
tof c1 b1
tof a8 b8
tof c9 b8
tof a1 c0
tof c1 b0
tof c1 c0
tof c2 b2
tof a1 c1
tof c3 b2
tof c7 d6
tof c3 c2
tof a7 d6
tof a8 c8
tof a7 c7
tof b7 c7
tof c6 c5
tof c9 a8
tof a3 a2
tof c6 c4
tof a2 a3
tof c8 a8
tof d6 c7
tof b2 c2
tof c0 c1
tof b0 c1
tof b8 c8
tof b3 d2
tof c3 b2
tof b4 d5
tof a6 b6
tof a7 d6
tof d8 b9
tof c8 b8
tof b8 b1
tof b9 b1
P b0
P d2
P b2
P d5
P a5
P d4
P b6
Z c7
P d6
P b9
P b8
P* b1
tof b3 d2
tof c3 b2
tof b5 d4
tof a6 b6
tof a7 d6
tof d8 b9
tof d8 b1
tof c8 b8
tof c8 b1
tof a1 c0
tof c0 a1
tof b8 b1
tof b8 c8
tof b9 b1
tof d6 a7
tof d4 b5
tof b2 c3
tof d2 b3
H b0
tof a3 b0
tof b3 d2
tof a3 b3
tof a2 a3
tof a2 c2
tof c3 b2
tof b5 a4
tof b5 d4
tof a5 b5
tof c7 c6
tof a7 d6
tof c8 c9
tof c8 b8
tof c9 c8
tof a9 a8
tof b7 a7
tof c6 c7
tof a5 b1
tof b5 b1
tof a4 b1
tof a4 a5
tof a4 b5
tof c4 c5
tof c2 c3
tof b0 b3
tof b0 a2
tof b0 a3
T* c2
T c3
T b1
T* a4
T* b5
T a5
T b7
T* a7
T c8
T* c9
P c5
T c5
P c7
T c7
T* c4
T* b0
T* a3
T a2
T* c6
T* b3
T a9
T* a8
tof a2 b0
tof b2 c3
tof c3 c2
tof b0 c3
tof b5 b1
tof a5 a4
tof a4 b1
tof d4 a5
tof a5 b5
tof d6 a7
tof a7 b7
tof b8 c9
tof c9 c8
tof c4 c5
tof c6 c7
tof d2 b3
tof b3 a3
tof b3 a2
tof a8 a9
tof a3 a2
tof a3 b3
tof b0 b3
tof b0 a3
tof c7 c6
tof c5 c4
tof c8 c9
tof b7 a7
tof b5 a5
tof a4 a5
tof c2 c3
tof b9 d8
tof b7 d6
tof b6 a6
tof b5 d4
H c5
H a4
H b0
tof d4 b5
tof c7 c5
tof b1 c5
tof a6 b6
tof c7 a4
tof c7 c6
tof d6 b7
tof c7 b1
tof b7 d6
tof a4 c7
tof b6 a6
tof a4 c6
tof c5 b1
tof b5 d4
tof a1 c0
T c7
T* c6
T* a4
T b1
T* c5
tof a4 c7
tof c5 b1
tof b0 b1
tof c6 c7
tof b1 c6
tof b1 a4
tof c5 b1
tof b0 d5
tof b0 c4
tof c5 b0
tof b1 b0
tof c7 c6
tof c6 a4
tof c6 c5
tof c6 b0
T c7
P c6
T c6
T* b1
T* b0
T c5
T* c4
T* d5
tof b0 c6
tof c5 b1
tof a4 c7
tof b1 c7
tof b1 c6
tof d5 b0
tof b4 b0
tof b0 b1
tof b4 d5
tof d5 c5
tof d5 c4
tof b0 c5
tof b1 b0
tof b1 d5
tof b1 c4
tof d6 b7
tof d4 b5
H a4
H b0
tof c4 d5
tof a4 d5
tof a4 c4
tof d8 b0
tof d8 b9
tof a8 d8
tof a9 a8
tof d8 a8
tof d8 a9
tof b0 a8
tof b0 a9
tof b0 d8
tof a4 c6
tof c4 c6
tof d5 c6
T a4
T* c6
T* c4
T d5
T* b0
T* a9
T* a8
T d8
tof c4 a4
tof d5 c6
tof d5 c4
tof a8 b0
tof d8 a9
tof b9 b0
tof a9 b0
tof d8 a8
tof a8 d8
tof a9 d8
tof c4 d5
tof a4 c6
tof a4 d5
tof c8 b8
tof b0 b9
tof a6 b6
tof b1 b4
tof a3 d2
H d5
H c3
H a5
H a7
H c9
H c5
tof c3 b3
tof d2 a3
tof c6 d2
tof b4 b1
tof a5 c4
tof a5 b4
tof c5 a4
tof c7 a4
tof b6 a6
tof b9 b0
tof c9 b9
tof b8 c8
tof c8 b8
tof d8 b9
tof d5 b6
tof c3 c6
tof d2 c6
tof b3 d2
T c3
T* b3
T* c6
T d2
T a5
T* c4
T* b4
T d5
T* b6
T b9
T a4
tof a3 c6
tof c6 c3
tof c6 b3
tof a3 d2
tof b1 b4
tof b4 a5
tof b4 c4
tof b6 d5
tof a6 d5
tof a6 b6
tof b0 b9
tof d8 b9
tof c9 b9
tof c7 a4
tof d5 b6
tof a5 c4
tof a5 b4
tof c6 d2
tof c3 b3
tof b3 d2
tof c3 c6
tof b9 b0
tof d5 a6
tof a5 b1
tof c3 a3
H c6
tof b4 c4
tof b1 c4
tof b1 a5
tof b4 b1
tof c7 c5
tof a6 d5
tof a7 b6
tof a7 a6
tof b7 d6
tof c9 d8
tof b0 b9
tof c9 b0
tof a7 d2
tof d6 b7
tof a6 d2
tof b6 d2
tof c5 c7
tof c4 b1
T c4
T a7
T* b6
T* a6
T d2
T c9
T* d8
T* b0
T c7
T* a4
T* c5
tof a6 a7
tof a5 c4
tof d5 a7
tof b1 c4
tof b4 c4
tof d5 a6
tof a6 b6
tof b0 c9
tof d5 d2
tof b9 c9
tof b9 b0
tof b0 d8
tof a4 c7
tof c5 a4
tof c7 a4
tof a4 c5
tof c9 b0
tof c9 d8
tof a6 d2
tof b6 d2
tof a7 d2
tof a7 a6
tof a7 b6
tof c9 b9
tof b7 d6
tof a7 d5
tof c4 a5
tof c2 b2
H b4
H a6
H b0
H a9
H c5
H a2
tof a3 c3
tof b2 a3
tof a5 c4
tof b5 a5
tof a4 c7
tof d5 a7
tof d6 d5
tof b9 c9
tof c9 b9
tof b7 d6
tof d4 b5
tof c2 b2
P* a3
P* a5
P* d5
P* c7
P b3
P d8
tof c3 a3
tof c2 a3
tof b2 a3
tof c4 a5
tof d4 a5
tof b5 a5
tof a7 d5
tof b7 d5
tof d6 d5
tof a4 c7
tof b8 c8
tof b9 c9
tof d4 b5
tof c2 b2
tof d5 a7
tof a5 c4
tof a3 c3
H c7
H a4
H a8
tof c3 a3
tof a2 c3
tof b2 c2
tof d2 b2
tof c4 a5
tof c7 c4
tof b5 d4
tof a7 d5
tof c8 a8
tof c9 b9
tof a8 c9
tof c8 a8
tof c8 b8
tof b8 c8
tof d5 a7
tof c7 b5
tof b2 d2
tof a2 d2
tof c3 b2
T a2
T* c3
T* d2
T b2
T c7
T* c4
T* b5
T c9
tof a3 c3
tof c2 d2
tof c3 a2
tof d2 c3
tof a3 b2
tof c2 b2
tof a5 c4
tof d4 b5
tof c4 c7
tof b5 c4
tof b9 c9
tof c8 c9
tof b8 c9
tof a8 c9
tof c7 c4
tof c4 b5
tof d2 b2
tof a2 c3
tof a2 b2
tof c3 d2
tof c1 c0
tof c0 a1
tof b3 a3
tof a3 a2
tof c6 c2
tof c2 c3
tof b1 a5
tof a5 c7
tof b4 d4
tof d4 c4
tof b6 d5
tof d5 a7
tof a6 d6
tof d6 b7
tof d8 b9
tof b9 c9
tof a8 b8
tof b8 c8
tof b8 a8
tof c8 b8
tof b9 d8
tof c9 b9
tof d6 a6
tof b7 d6
tof d5 b6
tof a7 d5
tof d4 b4
tof c4 d4
tof a5 b1
tof c7 a5
tof c2 c6
tof c3 c2
tof a3 b3
tof a2 a3
tof c0 c1
tof e b2
tof a0 b2
H d2
tof d5 e
tof b6 e
tof a4 e
tof d6 e
tof a6 e
tof b2 e
tof e a0
tof b5 b1
tof d4 b1
tof b4 b1
tof a5 c7
tof b1 a5
tof d4 b1
tof b4 b1
tof b5 b1
tof b6 d5
tof d6 a4
tof a6 a4
tof b2 a4
tof d5 a7
tof a4 d5
tof b2 a4
tof b2 a6
tof d6 b7
tof a6 d6
tof b9 c9
tof d8 c9
tof b2 a6
tof c8 b9
tof b8 b9
tof a8 b9
tof d8 b9
tof b8 a8
tof c8 a8
tof c8 b8
tof c9 d8
tof d6 b2
tof b7 a6
tof a4 b2
tof d5 d6
tof a7 b6
tof c4 d4
tof d4 b4
tof c7 b1
tof c2 c6
tof c3 c6
tof c3 c2
tof a3 b3
tof a2 b3
tof a2 a3
tof e d5
tof a0 e
T a5
T b2
T* d6
T* a4
T a0
T a8
T* b9
T* c8
tof d6 b2
tof c4 a5
tof b1 a5
tof a7 b2
tof b4 a5
tof b5 a5
tof a7 d6
tof a6 a4
tof a4 d6
tof b9 a8
tof c9 a8
tof a7 a0
tof a6 a0
tof c9 b9
tof a8 b9
tof a4 a0
tof d6 a4
tof b2 a0
tof b2 a4
tof b2 d6
tof b8 b9
tof c8 b8
tof d8 c9
tof a8 d8
tof b7 a6
tof d6 b7
tof b6 a7
tof b2 b6
tof d4 b4
tof c4 d4
tof c7 b1
tof a5 c7
tof c2 c6
tof c3 c2
tof a3 b3
tof a2 a3
tof a1 c0
tof d5 a0
H b5
H a4
H c8
tof a0 e
tof e a0
tof c0 a1
tof a1 c0
tof c0 a1
tof a3 c2
tof c2 a3
tof a3 c2
tof c2 d2
tof d2 c2
tof c2 d2
tof d2 c3
tof c3 d2
tof d2 c3
tof c3 a5
tof a5 c3
tof c3 a5
tof a5 d4
tof d4 a5
tof a5 d4
tof d4 c4
tof c4 d4
tof d4 c4
tof c4 b5
tof b5 c4
tof c4 b5
tof b5 b4
tof b4 b5
tof b5 b4
tof b4 b1
tof b1 b4
tof b4 b1
tof b1 c1
tof c1 b1
tof b1 c1
tof c1 a2
tof a2 c1
tof c1 a2
tof c7 a8
tof a8 c7
tof c7 a8
tof a8 d8
tof d8 a8
tof a8 d8
tof d8 b0
tof b0 d8
tof d8 b0
tof b0 d5
tof d5 b0
tof b0 d5
tof d5 b2
tof b2 d5
tof d5 b2
tof b2 b3
tof b3 b2
tof b2 b3
tof b3 c6
tof c6 b3
tof b3 c6
tof c6 a4
tof a4 c6
tof c6 a4
tof b6 a7
tof a7 b6
tof b6 a7
tof a7 b7
tof b7 a7
tof a7 b7
tof b7 a6
tof a6 b7
tof b7 a6
tof b8 c9
tof c9 b8
tof b8 c9
tof c9 a9
tof a9 c9
tof c9 a9
END
