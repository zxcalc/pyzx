# Original circuit
#   qubits: 24
#   qubits used: 24
#   H: 39
#   cnot: 215
#   X: 15
#   T: 203
#   P: 0
#   Z: 0
#   tdepth (by partitions): 87
#   tdepth (by critical paths): 27
# Optimized circuit
#   qubits: 24
#   qubits used: 24
#   H: 37
#   cnot: 496
#   X: 38
#   T: 95
#   P: 33
#   Z: 0
#   tdepth (by partitions): 11
#   tdepth (by critical paths): 11
#   Time: 0.002 s
.v a0 b0 c0 a1 b1 c1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6 c6
.i a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 a6 b6
.o a0 b0 c0 a1 b1 c1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6 c6

BEGIN
tof a0
tof a1
tof a2
tof a3
tof a4
tof a5
H c0
H c1
H c2
H d2
H c3
H c4
H d4
H d5
H c6
tof b4 a0
tof c0 a0
tof c0 b0
tof c1 a1
tof b4 a1
tof c1 b1
tof b4 a2
tof d2 a2
tof d2 b2
tof b4 a3
tof c3 a3
tof c3 b3
tof c4 a4
tof b5 a5
tof a6 a5
tof d5 b5
tof b6 c6
tof b4 a6
tof b4 a5
tof a4 a5
tof a3 b3
tof c2 b3
tof a0
tof a1
tof a2
tof a3
tof b4
tof b3
tof a4
T c0
T* a0
T* b0
T* a1
T* b1
T d2
T* a2
T* b2
T* a3
T* b5
T b4
T b6
T* c6
T c2
T* b3
T* a4
T a5
T c5
tof b0 c0
tof d2 c0
tof a2 c0
tof b2 c0
tof a6 c0
tof a6 a0
tof d2 b0
tof a2 b0
tof b2 b0
tof c1 a1
tof a6 b0
tof a6 a1
tof a2 d2
tof b2 d2
tof a4 d2
tof a6 d2
tof c1 b1
tof c4 d2
tof d4 d2
tof c2 b2
tof a4 a2
tof a6 a2
tof c4 a2
tof d4 a2
tof b2 a2
tof c2 a3
tof b3 a3
tof a5 b5
tof a6 b5
tof c4 b5
tof d4 b5
tof a4 b4
tof a6 b4
tof c4 b4
tof d4 b4
tof b6 b4
tof c6 b6
tof b3 c2
tof a4 c2
tof a6 c2
tof c4 c2
tof d4 c2
tof a6 b3
tof c4 a4
tof d4 a4
tof a4 b3
tof d4 a5
tof a6 a5
tof a6 c5
tof d4 a6
tof c2 b3
tof b4 c6
tof a2 b2
tof a2 b3
tof a2 c2
tof d2 b3
tof d2 b2
tof d2 a4
tof d2 a5
tof d2 a2
tof d2 c6
tof d2 b4
tof d2 b5
tof d2 c5
tof c0 b0
tof c0 a4
tof c0 a5
tof c0 a2
tof c0 c6
tof c0 b4
tof c0 b5
tof c0 c5
tof c0 d2
T a0
T c0
P c3
T c3
T* a3
T d4
T* d2
T* a6
T c5
T* b5
P b6
T b6
T b4
T* c6
T* a2
T c2
T c4
T* a5
tof a4 c0
tof b2 c0
tof b0 a0
tof b3 c0
tof a2 a3
tof c2 a3
tof a4 a3
tof a3 c3
tof a4 d2
tof d2 d4
tof a6 d2
tof a4 c5
tof c6 b6
tof d5 b5
tof a4 b5
tof a4 b6
tof a4 b4
tof a4 c6
tof a4 a2
tof b2 a2
tof b2 c2
tof a4 a5
tof c4 a5
tof a2 c2
tof b6 c6
tof a6 c5
tof d4 d2
tof d4 c5
tof d2 a6
tof c3 a3
tof c0 a2
tof d4 d2
tof c0 b2
tof a1 b1
tof a0
tof b2
tof d2
tof b6
H b0
H a2
H b3
H c4
H a6
H c5
tof c4 a0
tof c1 b0
tof c4 b1
tof b4 b1
tof a3 a2
tof a3 b3
tof b4 c4
tof c4 c2
tof d5 a6
tof b4 b6
tof c5 c6
tof a6 d5
tof a6 a5
tof c4 b4
tof c4 a5
tof b3 a3
tof b3 c2
tof b0 c1
tof b0 b1
tof a0 c4
tof a0 c2
tof a0 a5
tof a0 b1
tof c0
tof d4
T b4
T* a0
T* b0
T b1
T* a6
T a5
T* b3
T c2
T* a2
T c5
T* c6
tof b6 a0
tof a0 b4
tof c4 b1
tof b1 b0
tof c1 b1
tof c4 a5
tof a5 a6
tof d5 a5
tof c4 c2
tof c2 b3
tof a3 c2
tof c6 c5
tof c5 c6
tof b3 c2
tof c2 a2
tof a6 a5
tof b0 b1
tof b4 a0
tof b4 c4
tof b4 b0
tof b4 c0
tof b4 b3
tof b4 d4
tof b4 a6
tof b5 d5
tof a6 d5
tof c3 a3
tof b3 a3
P c4
P a4
P b0
P a1
P b1
P c0
P b2
P b3
P c3
P d4
P d2
P a6
P b5
P* d5
P* a3
tof b4 c4
tof b4 b0
tof b4 c0
tof c3 b3
tof a3 b3
tof a3 c3
tof b4 c3
tof b4 d4
tof b5 a6
tof d5 a6
tof b4 d5
tof d5 b5
tof b4 a3
tof b4 b6
tof a6 d5
tof a6 b5
tof d4 d2
tof b3 a3
tof b3 c3
tof c0 b2
tof b0 a1
tof b0
tof c3
tof b5
H b1
tof a3 a1
tof a3 b2
tof a3 c3
tof d5 b5
tof a3 d5
tof c1 a1
tof a4 a3
tof a4 a1
tof a4 d5
tof a4
tof d5
tof a1
P* c4
P a4
P a5
P d5
P* b2
P* d2
P c1
P* a1
P a6
P b3
P b1
P a2
tof b2 a4
tof a3 a4
tof d2 d5
tof a3 d5
tof c0 b2
tof c3 b2
tof d4 d2
tof b5 d2
tof a3 a1
tof a1 c1
tof c1 a1
tof c1 b0
tof d2 b5
tof b2 c3
tof d5 b5
tof d5 d2
tof d5 d4
tof a4 c3
tof a4 b2
tof a4 c0
tof c4
H a5
tof a5 c4
tof a2 b1
tof c2 b1
tof a5 c5
tof a5 b6
tof a2 c2
tof b1 c2
tof b1 a2
tof c4 b6
T* a2
T b1
T a5
T* c4
T* c5
tof c2 a2
tof c2 b1
tof c4 a5
tof c5 c4
tof a5 c4
tof c4 c5
tof a2 b1
tof a5 b4
tof b6
tof a5
H a2
tof c5 b6
tof c4 b6
tof c6 a2
tof c4 c6
tof c4 c5
tof b4 c5
tof b4 a5
tof c4 b4
tof c5 b4
tof c6 c4
tof a2 c4
tof a2 c6
tof b6 c5
T b6
T c4
T* a2
T* c6
tof c6 c4
tof a5 b6
tof b4 b6
tof c4 b6
tof a2 c4
tof c6 a2
tof c4 a2
tof c4 c6
T c4
tof c6 c4
tof a2 c4
tof b6 a5
tof c5
tof c3
tof b6
H c4
H a2
H c6
H b4
tof a0 c5
tof c6 c5
tof a2 c2
tof a2 b1
tof a2 c3
tof c6 a0
tof a5 a0
tof b4 d2
tof a5 c6
tof a5 b6
tof c6 a5
tof a0 c6
tof c5 a0
P a2
T a2
T* c2
T* b1
T c5
T* c3
T* d2
tof b1 c2
tof c2 a2
tof b3 c2
tof c6 c5
tof b3 c3
tof a6 d2
tof a0 d2
tof b2 a0
tof b3 a0
tof b5 b2
tof b3 b2
tof b4 b2
tof b4 b5
tof a5 c6
tof b4 a6
tof b2 b5
tof a0 b5
tof a0 b2
tof a2 c2
tof c2 b3
tof a2 b1
tof c2 a0
T a2
T* a6
T d2
T a5
T* c6
T* c5
T* c2
T c3
T* a0
T* b2
tof d2 a6
tof b2 a6
tof b1 a2
tof b3 a2
tof b4 a6
tof c5 a5
tof b2 d2
tof b5 a5
tof b6 a5
tof b5 c5
tof b6 c5
tof c5 c6
tof a0 c3
tof b3 c2
tof c3 c2
tof b3 a0
tof b4 b2
tof b5 a0
tof b5 b2
tof c2 c3
tof a5 c5
tof a5 c6
tof a6 d2
tof b1 a2
P* a2
P b4
tof b1 a2
tof a5 b6
tof b2 a6
tof a0 c2
tof b5
H b1
tof a1 b5
tof b1 b5
tof b0 a1
tof b1 c1
tof a1 c1
tof c1 b0
tof b5 c1
tof b5 a1
T* b0
T b5
T* a1
tof a1 b5
tof b1 b0
tof b5 b0
tof b1 a1
tof b0 b5
tof a1 b0
tof c1
tof c2
tof d5
tof a6
H b5
H a2
H c3
H c6
H d2
tof b5 c1
tof b5 a3
tof b1 a1
tof c3 b0
tof b1 b0
tof c3 a4
tof d2 d5
tof a4 c0
tof d5 a4
tof d5 c3
tof c3 a2
tof a0 c2
tof d5 a0
tof d5 d4
tof d2 c6
tof c6 d5
tof b2 d2
tof b2 a6
tof d2 b2
tof c6 d2
tof d5 c6
tof c3 a0
tof a2 c3
tof a4 a2
tof a4 c6
tof b0 c6
tof b0 a4
tof a1 c6
tof a1 a4
tof a1 b0
T a2
T d5
T b5
T* c1
T* a3
T* a1
T* c0
T b0
T* d4
T a4
tof a3 b5
tof b0 a2
tof a4 d5
tof a0 a2
tof b2 d5
tof b5 a2
tof b5 d5
tof a4 b5
tof c6 c1
tof d2 b5
tof b2 b5
tof a4 a3
tof c6 a3
tof b1 a1
tof d2 a3
tof b2 a3
tof a4 b0
tof a0 b0
tof d2 b0
tof b2 b0
tof b0 c0
tof c3 b0
tof c6 a4
tof b2 a4
tof d2 d4
tof d2 a4
tof b5 a3
tof b5 a4
tof b5 d4
tof b5 c0
tof b5 b0
T c3
T* b0
T* a2
T d2
T* b5
T* d5
T c1
T a0
T* c0
T b2
T* d4
tof a0 b0
tof c0 b0
tof a4 a2
tof c2 a2
tof b0 c3
tof a2 b0
tof b5 d2
tof b2 d2
tof d4 d2
tof b2 b5
tof d4 b5
tof a4 d5
tof a6 d5
tof d5 b5
tof c0 a0
tof a4 a0
tof a3 c1
tof d4 b2
tof a4 c0
tof a4 b2
tof a4 d4
tof b2 d4
tof a0 c0
tof b5 d5
tof d2 d5
tof d2 b5
tof c3 b0
tof b0 a2
tof b5
H a3
P b1
H b1
H a2
H c0
H b3
H d5
H d4
H c5
H b4
tof c4
tof c1 b1
tof b1 c1
tof c1 b1
tof b1 a1
tof a1 b1
tof b1 a1
tof a1 c6
tof c6 a1
tof a1 c6
tof c6 c4
tof c4 c6
tof c6 c4
tof c4 d5
tof d5 c4
tof c4 d5
tof d5 b4
tof b4 d5
tof d5 b4
tof b4 d2
tof d2 b4
tof b4 d2
tof d2 c0
tof c0 d2
tof d2 c0
tof c0 a3
tof a3 c0
tof c0 a3
tof a3 b0
tof b0 a3
tof a3 b0
tof b0 a4
tof a4 b0
tof b0 a4
tof a4 b2
tof b2 a4
tof a4 b2
tof b2 c3
tof c3 b2
tof b2 c3
tof c3 b3
tof b3 c3
tof c3 b3
tof b3 c2
tof c2 b3
tof b3 c2
tof c2 a2
tof a2 c2
tof c2 a2
tof a2 a0
tof a0 a2
tof a2 a0
tof a6 b5
tof b5 a6
tof a6 b6
tof b6 a6
tof a6 b6
tof b6 a5
tof a5 b6
tof b6 a5
END
