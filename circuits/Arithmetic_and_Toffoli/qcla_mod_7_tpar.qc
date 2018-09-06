# Original circuit
#   qubits: 26
#   qubits used: 26
#   H: 82
#   cnot: 441
#   X: 7
#   T: 413
#   P: 0
#   Z: 0
#   tdepth (by partitions): 177
#   tdepth (by critical paths): 66
# Optimized circuit
#   qubits: 26
#   qubits used: 26
#   H: 82
#   cnot: 1150
#   X: 82
#   T: 249
#   P: 54
#   Z: 2
#   tdepth (by partitions): 29
#   tdepth (by critical paths): 29
#   Time: 0.008 s
.v e a0 b0 c0 d0 a1 b1 c1 d1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6
.i a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 a6 b6
.o e a0 b0 c0 d0 a1 b1 c1 d1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6

BEGIN
H e
H c0
H d0
H c1
H d1
H c2
H d2
H c3
H c4
H d4
H c5
H d5
tof d0 a0
tof a6 e
tof d0 c0
tof d1 a1
tof b2 a2
tof c2 a2
tof a3 a2
tof b3 a2
tof b3 a3
tof d4 a4
tof b5 a5
tof d5 b5
tof b6 a6
tof b5 d5
tof d4 a5
tof c4 a5
tof b4 a5
tof a4 a5
tof b4 d4
tof b3 c3
tof d2 a3
tof c2 a3
tof b2 a3
tof a2 a3
tof b1 d1
tof a1 d1
tof d0 d1
tof c0 d1
tof b0 c0
tof a0 c0
tof e a6
T b0
T d0
T* a0
T b1
T* a1
T b2
T d2
T* a3
T b3
T* c3
T b4
T* a4
T* d4
T d5
T* b5
T b6
T* e
T* a6
T* c0
T* d1
T c2
T a2
T c4
T a5
T c1
tof d0 b0
tof a0 d0
tof a1 a0
tof c0 a0
tof d1 a0
tof a3 b2
tof d1 a1
tof c3 d2
tof b6 a3
tof c2 d2
tof a2 d2
tof c3 b3
tof a2 c3
tof b5 d4
tof c4 d4
tof a5 d4
tof a4 b4
tof d4 a4
tof b6 d4
tof c4 d4
tof a5 d4
tof b5 d4
tof b5 d5
tof c0 b6
tof a5 b5
tof c5 e
tof a6 e
tof c0 a6
tof d1 c0
tof c4 a5
tof c2 a2
tof c0 d1
tof d1 c2
tof b6 c2
tof b6 a6
tof b6 d1
tof b5 c4
tof b5 a5
tof a4 c4
tof b4 c4
tof c4 d4
tof a4 a5
tof a4 b5
tof c3 c2
tof c3 a2
tof a3 c2
tof d2 c2
tof d2 a2
tof d2 c3
tof b2 c2
tof a1 b6
tof b2 a3
tof b2 a2
tof b2 c3
tof a1 c0
tof b2 d2
tof a0 b1
tof a0 b6
tof a0 c0
tof a0 a1
tof b0 d0
tof b0 b1
tof d0 b6
tof b0 c0
tof b0 a1
tof b0 a0
T* b0
T d0
T* a0
T* c2
T b2
P b3
T b3
T* d2
T c4
T b4
T* a4
T a1
T c0
T* c3
T* a2
T* b5
T* a5
T c5
T* e
T* a3
T* b6
T* d4
tof d1 b6
tof d0 b0
tof b6 d0
tof b2 c2
tof a1 a0
tof c0 a0
tof b6 a0
tof b1 a0
tof d2 b3
tof a3 b2
tof d1 b2
tof b4 c4
tof d4 c4
tof d1 c4
tof d4 b4
tof d1 b4
tof d5 a4
tof b6 c0
tof a3 c3
tof d1 c3
tof d4 b5
tof d1 b5
tof a5 b5
tof d1 e
tof e c5
tof d1 a3
tof d1 d4
tof c5 e
tof b5 a5
tof c3 a2
tof a1 c0
tof a4 b5
tof c4 b4
tof c4 a5
tof c4 b5
tof b3 d2
tof b3 a2
tof c2 b2
tof c2 c3
tof c2 a2
tof a0 c0
tof b0 d0
tof b0 a0
tof c5 d1
tof a4 b5
tof b3 a2
tof a0 c0
H a1
H d0
H c3
H b2
H a5
H b4
tof c1 a1
tof c0 a0
tof b1 d0
tof b1 c0
tof a2 b3
tof d2 b2
tof b5 b4
tof d5 b4
tof b5 a4
tof d5 b5
tof d1 c5
tof b4 b5
tof b2 d2
tof b2 a2
tof d0 b1
tof d0 c0
tof a1 c1
P c1
T c1
T* a1
T b1
T* c0
T* d0
T* b2
T a2
T b4
tof c3 a1
tof a1 c1
tof d0 b1
tof c0 b1
tof a2 b2
tof d2 b2
tof d5 b4
tof c3 a2
tof e d1
tof a5 d1
tof a5 e
tof b5 d5
tof b2 a2
tof b1 c0
tof c0 d0
P c3
T c3
T* c1
T a1
P a5
T a5
T* e
T d1
T b1
T d2
T* b2
T b5
T* b4
T* d5
T* a2
tof c1 c3
tof a2 c1
tof e a5
tof a2 a1
tof c5 d1
tof d1 e
tof b2 d2
tof a0 b1
tof b3 d2
tof c0 b1
tof d0 b1
tof b4 b5
tof b3 b2
tof a4 b5
tof a4 b4
tof d5 b4
tof b4 d5
tof b5 d5
tof b5 b4
tof d2 b2
tof e d1
tof a5 d1
tof c1 a1
tof c3 c1
tof c1 a2
tof e c5
tof b5 a4
tof c4 d4
tof d2 b3
tof c2 a3
tof b1 a0
tof b0 b6
H c3
P b0
P b6
P b1
P c0
P a0
P c2
P a3
P d2
P b3
P c4
P d4
P b5
P a4
P e
Z a6
P c5
H c0
H a5
tof b6 b0
tof a5 a6
tof a0 b6
tof a2 a1
tof a3 c2
tof b3 a3
tof d4 c4
tof a4 d4
tof c5 d1
tof a4 b5
tof c5 e
tof b5 a4
tof d1 c5
tof d2 b3
tof b1 a0
P b4
P* b6
P* a3
P* d4
P* a1
P* d1
P c3
P a5
P* a6
tof b0 b6
tof b1 b6
tof a0 b6
tof c2 a3
tof d2 a3
tof b3 a3
tof c4 d4
tof a4 d4
tof b5 d4
tof e d1
tof a2 a1
tof c5 d1
tof a0 b1
tof a4 b5
tof b1 a0
tof a5 a6
tof d1 e
tof d4 c4
H b4
tof c3 a6
tof b4 c3
tof e c3
tof c1 c0
tof c1 a2
tof c4 d4
tof b5 a4
tof e d1
tof a4 b5
tof d4 c4
tof c0 c1
tof c0 a2
tof c3 e
tof a6 c3
tof a6 e
T c1
T* a2
T* c0
T* a6
T* e
T c3
tof c0 a2
tof a2 c1
tof a5 a6
tof b4 e
tof c3 e
tof e c3
tof a6 c3
tof c1 a2
tof c1 c0
T c1
T* c3
T a6
T b4
T* e
tof a6 c3
tof c0 c1
tof a2 c1
tof e b4
tof d1 b4
tof a5 a6
tof d1 e
tof b4 e
tof c3 a6
tof b4 d1
tof c4 d4
tof d2 b3
tof a3 c2
H c1
tof c1 c3
tof c2 a3
tof b3 d2
tof a5 c1
tof d1 b4
tof b4 d1
tof c1 a5
tof d2 b3
tof a3 c2
T a5
T* c1
T* c3
tof c3 c1
tof c1 a5
tof a5 c1
tof a5 c3
T a5
tof c3 a5
tof c1 a5
tof d1 b4
tof c2 a3
tof b6 b0
H a5
H c1
tof b0 b6
tof a6 a5
tof a6 b0
tof a6 a1
tof a3 c2
tof b4 d1
tof d1 b4
tof c2 a3
tof a5 a6
tof a5 b0
tof a5 a1
tof a5 c1
T* a5
T c1
T* a1
T* b0
tof c1 a5
tof a6 c1
tof b6 b0
tof a6 a1
tof a5 a6
T a5
T* a6
T* c1
T b0
tof b0 a6
tof a6 a5
tof c1 a6
tof a5 a6
tof a6 c1
tof a5 b0
tof b4 d1
tof b5 a4
tof a3 c2
tof a5 b6
H c1
H a2
H a6
H d0
H d5
H c3
H e
tof b6 a5
tof a1 b0
tof a2 b0
tof d0 b6
tof a2 b6
tof c0 a6
tof a1 b6
tof a6 a1
tof a6 d0
tof a2 d0
tof c0 a6
tof c5 c1
tof d4 c4
tof c5 d4
tof d5 c5
tof a4 b5
tof d1 c3
tof d1 b4
tof c3 d1
tof b5 a4
tof d5 e
tof c5 e
tof d4 c5
tof d4 d5
tof c1 e
tof c1 d5
tof c1 d4
tof a2 c0
tof a6 c0
tof d0 c0
tof a1 d0
tof b0 b6
tof b0 d0
T b0
T* d0
T b6
T a1
T* c1
T* e
T* d4
T* c5
T d5
T* c3
tof c0 d0
tof d0 b0
tof a2 d0
tof a2 b6
tof a2 a1
tof d5 c5
tof e c1
tof c5 e
tof d5 d4
tof a5 d5
tof d1 c3
tof a6 a2
tof a2 a6
tof d4 c5
tof d4 d5
tof e d1
tof c1 d1
tof d1 c3
tof b0 a1
tof b0 a2
tof d0 b6
T a6
T* d0
T* b0
T c0
T* b6
T* a2
T* a1
T e
T* c1
T d4
T* c5
T* d1
T c3
T d5
tof b0 a6
tof b0 d0
tof b6 c0
tof a5 c0
tof a1 a2
tof a5 b6
tof c1 e
tof c5 d4
tof d5 d4
tof a5 d4
tof c4 d4
tof c3 d1
tof d5 c5
tof a5 c5
tof c4 c5
tof b4 d1
tof a5 d5
tof c4 d5
tof b4 c3
tof d1 c3
tof d4 c5
tof d4 d5
tof e c1
tof e c3
tof a2 a1
tof c0 b6
tof a6 d0
tof a6 a1
tof a6 b0
tof a6 a2
tof d1 b4
tof d4 c4
tof b3 d2
tof c0 a5
H b6
H b0
H c5
tof b6 c0
tof b1 c0
tof b6 a5
tof b1 a5
tof b1 b6
tof b1 a0
tof c2 b0
tof c2 a3
tof d2 b3
tof e d5
tof c1 d5
tof c1 e
tof b4 d1
tof d1 b4
tof d5 e
tof b3 d2
tof b0 c2
tof b6 b1
tof c0 a5
tof c0 b6
T d5
T* b0
T c0
tof a3 b0
tof e d5
tof c1 d5
tof c2 b0
tof a0 c0
tof b1 c0
tof b6 c0
tof b4 d1
tof a4 b5
tof b0 a3
tof c0 a0
tof b6 a5
H c1
H a6
H a2
H b2
H d5
tof a5 b6
tof a6 b6
tof b0 b6
tof a3 b6
tof b6 d0
tof c0 b1
tof a0 a6
tof b0 b1
tof a3 b1
tof a6 a5
tof b1 a6
tof b0 c0
tof a3 c0
tof c3 a3
tof c1 a3
tof b4 a3
tof d1 a3
tof b0 c2
tof a3 b0
tof b2 a3
tof c3 a3
tof c1 a3
tof b4 a3
tof d1 a3
tof c3 b2
tof c1 b2
tof b4 b2
tof d1 b2
tof d5 c4
tof c5 c4
tof a4 c4
tof b5 c4
tof b5 c5
tof c3 c5
tof c1 c5
tof b4 c5
tof d1 c5
tof c1 c3
tof b4 c3
tof d1 c3
tof b5 a4
tof c3 b5
tof c1 d1
tof c3 d1
tof d1 b4
tof c5 b5
tof d4 c4
tof e c4
tof b0 b2
tof c2 b2
tof b0 c3
tof b0 d1
tof b0 c5
tof b1 c0
tof a6 b1
tof a5 a0
tof d0 b6
T* a0
T* b1
T a5
T* a3
T b2
T* d0
T* a6
T c4
T* b0
T c2
T c5
T d1
tof a5 b1
tof b2 a3
tof d0 a0
tof a6 b1
tof b6 a3
tof a2 a3
tof b1 a0
tof a3 b1
tof c3 a3
tof d2 c2
tof b3 c2
tof b6 c2
tof c0 a5
tof a3 a5
tof c2 a3
tof c3 d0
tof d2 b2
tof b3 b2
tof c0 d0
tof a2 b2
tof c5 c4
tof d4 c4
tof a4 c4
tof e c4
tof c0 a6
tof c3 a6
tof c3 c4
tof c5 c2
tof d1 b0
tof c3 c2
tof d4 c2
tof b6 c2
tof e c2
tof b4 b0
tof b5 c2
tof d4 c5
tof a4 c5
tof e c5
tof c1 d1
tof d5 c5
tof c3 c5
tof c3 d1
tof b3 d2
tof a4 c3
tof b5 c3
tof a2 c3
tof d5 c3
tof a4 d4
tof e d4
tof b5 d4
tof d5 d4
tof b5 a4
tof d5 a4
tof d4 d5
tof d2 a2
tof c5 d5
tof c5 d4
tof c5 c3
tof c5 a4
tof c2 c3
tof c2 a4
tof c2 c5
tof c4 d4
tof c4 c2
tof d0 a6
tof b2 c3
tof a3 a4
tof a3 c5
tof a3 c2
tof a3 d2
tof a3 b2
tof b1 a5
tof a0 b1
tof a0 a6
tof a0 d0
tof b1 a4
tof b1 c5
tof b1 c2
T* d2
T* a2
T a3
T c3
T* b2
T* d4
T* d5
T c4
T a0
T* b1
T* c2
T* c5
tof a3 a2
tof c3 d2
tof b2 d2
tof b1 d2
tof a4 d2
tof b2 c3
tof b1 a3
tof a4 a3
tof b3 a3
tof c3 a3
tof c2 d4
tof a4 d4
tof e d4
tof a4 c5
tof b5 c5
tof c4 d5
tof c5 c4
tof a4 b1
tof d0 a0
tof b6 a0
tof c0 a0
tof a6 a0
tof a4 c2
tof e c2
tof c5 c2
tof c2 c5
tof d5 c4
tof d5 c5
tof d5 c2
tof d4 c5
tof d4 c2
tof c3 b2
tof c3 b1
tof d2 a2
tof a2 b1
tof d2 a3
H b2
tof b0 d1
tof c1 d1
tof b5 c2
tof d4 d5
tof e d5
tof b2 b3
tof c3 a2
tof c0 d0
tof b6 a0
tof a0
tof b3
tof d5
tof d1
H b2
tof a2 c2
tof a2 d1
tof a2 b3
tof a4 a2
tof a4 d1
tof a4 c2
tof a4 b3
tof a4
tof b3
tof c2
tof d1
P a6
P b1
P c3
P c5
P* a0
P a4
P b3
P c2
P* d5
P d1
tof a2 a4
tof d5 c2
tof a2 b3
tof a2 c2
tof a2 d1
tof c2 d5
tof a4
H a6
tof b1 a2
tof b2 c3
tof b3 b1
tof b1 a4
tof b3 a3
tof b1 b3
tof b1 a3
tof a2 b1
tof a2 a3
tof a2
tof a3
T* a2
T a4
T b2
T* c3
T a3
tof b1 a4
tof b3 a3
tof a4 a2
tof a3 a4
tof c3 b2
tof b3 a3
tof b1 a3
tof b2 c3
tof a2 a4
tof a4 a3
tof c2
H b3
tof a6 b6
tof c3 b1
tof c3 a2
tof a6 a1
tof b1 a2
tof b1 b2
tof b1
tof b2
T* b1
T b2
P a6
T a6
T* b6
P b3
T b3
T* a1
tof c3 a2
tof a2 b1
tof a2 b2
tof b6 a6
tof a1 b6
tof c3 a2
tof a6 b6
tof b6 a1
tof b1 b2
tof a3
H c3
H c5
H c0
H b2
H b5
H c1
tof a1 a6
tof c0 a2
tof b2 a6
tof b2 a1
tof e a0
tof b5 a0
tof c0 a0
tof c0 a1
tof b6 c0
tof b2 c0
tof b3 c0
tof b2 b6
tof b3 b6
tof b5 e
tof e a3
tof b5 c2
tof c1 c2
tof c1 c5
tof c1 b4
tof b4 d1
tof c5 d1
tof c5 c1
tof c5 b4
tof c2 c5
tof e b4
tof e c5
tof e c2
tof c3 a3
tof b6 b2
tof c0 b6
tof a0 e
tof a0 a3
tof a0 b4
tof a1 c0
tof a2 e
tof a2 a3
tof a2 b4
tof a2 a0
tof a6 a1
tof a2
tof a0
tof b4
tof a3
T a6
T b6
T* a1
T* a2
T* b2
T c0
P c1
T c1
T* c5
T* c2
T b5
T a0
T* d1
T b4
T c3
T* a3
tof a1 b6
tof b2 a6
tof c0 a6
tof b6 a6
tof a2 a1
tof b3 b2
tof b3 c0
tof b5 c5
tof c2 c1
tof c2 c5
tof b5 c2
tof a0 b5
tof e b4
tof d1 a0
tof b4 d1
tof a3 c3
tof e c3
tof e a3
tof c3 a3
tof d1 b4
tof a0 b4
tof b5 a0
tof c2 a0
tof b5 b4
tof c5 b4
tof c1 c5
tof c1 a0
tof c5 c2
tof c5 b5
tof b2 c0
tof b6 a2
tof a6 b6
tof a2 a1
tof a6 c0
T a6
T* b6
T* c0
T a2
T c2
T* b4
T c1
T* c5
T* b5
tof a2 b6
tof e b6
tof a1 b6
tof b6 a6
tof c0 b6
tof e a2
tof a1 a2
tof c5 c1
tof b5 c1
tof e c1
tof b4 c2
tof c1 b4
tof b5 c5
tof e c5
tof e b5
tof b4 c1
tof c2 c1
tof b4 b5
tof b4 c5
tof a6 b6
tof b6 c0
tof a6 a2
tof b1
H c0
tof b3 b6
tof c2 b4
tof c2 d1
tof b4 d1
tof d0 d1
tof d0 b4
tof a6 d1
tof a6 b4
tof a6 d0
tof e d1
tof e b4
tof e d0
tof e a6
tof e
tof a6
tof d0
tof b4
P* a2
P b2
Z c5
P a0
P e
P a6
P* b1
P d0
P* b6
P* b4
tof d1 e
tof d1 a6
tof d1 d0
tof d1 b4
tof b3 b6
tof c2 b4
tof a6
tof d5
H b2
H a1
H b5
H a0
H c1
H c5
tof b2 a2
tof c1 d1
tof c1 a6
tof b4 a6
tof c1 d5
tof b4 d5
tof c1 b4
tof b5 d5
tof c0 b3
tof a1 a6
tof d1 b4
tof d1 d5
tof d1 a6
tof d1
tof a6
tof d5
T b2
T c5
T* a2
T c1
T* d1
T a0
T c0
T* b3
T a1
T* a6
T b5
T* d5
tof a2 c5
tof c5 b2
tof d1 c1
tof b4 c1
tof b4 d1
tof b3 c0
tof b4 a6
tof a6 a1
tof b4 d5
tof d5 b5
tof b5 d5
tof a1 a6
tof c0 b3
tof c1 d1
tof b2 a2
T* b2
T* a2
T c5
tof c5 b2
tof c5 a2
tof a2 c5
tof b2 c5
tof d0
H a2
H c5
tof d1 b4
tof a0 c5
tof d1 c1
tof b4 c1
tof a2 b4
tof a2 b0
tof a2 c5
tof a2 a0
tof a2 d1
tof b4
P a2
T a2
T* d1
T b4
T* a0
T c5
T* b0
tof b4 d1
tof c5 a2
tof b0 d1
tof c5 b4
tof b0 b4
tof c1 b0
tof a0 c5
tof d1 b4
tof a2 b4
tof d1 b0
tof a2 a0
T c5
T* a2
T* a0
T* d1
tof d1 a0
tof c1 a0
tof b0 a0
tof a0 c5
tof a0 a2
tof c1 d1
tof b0 d1
tof c5 a2
tof c5 a0
tof c5 d1
H a0
H b2
tof a4 c1
tof a0 c1
tof b2 b6
tof c0 b6
tof a0 b3
tof a0 c0
tof c3 a4
tof a0 a4
tof c1 a4
tof c1
P a0
T a0
T* b3
T* c0
T b6
T* c1
tof c0 a0
tof b3 a0
tof b6 b3
tof a3 c0
tof b6 c0
tof b2 b6
tof a4 c1
tof a4 c3
tof c0 a3
tof c0 a4
tof a0 b3
tof b3 a3
tof b3 a4
tof b3 c0
tof b3 b6
T a0
T b2
T* b3
T* b6
T* c0
T a4
T* c1
tof b6 a0
tof a3 a0
tof b2 a0
tof b3 b2
tof b6 b3
tof c3 a4
tof a4 c0
tof a3 a4
tof a3 c1
tof c0 a4
tof b3 b6
tof b2 b6
tof b2 b3
tof e
H a0
H a2
H b4
H b2
tof c2 c3
tof a2 c3
tof b2 e
tof a0 a6
tof a0 a5
tof c2 a1
tof a2 a1
tof b0 a1
tof c4 c2
tof a2 c2
tof b4 c2
tof b0 c2
tof a2 c4
tof b4 c4
tof b0 c4
tof b5 c4
tof a2 b0
tof c4 b0
tof c2 b0
tof c2 c4
tof a6 a1
tof c3 b0
tof c3 c2
tof c3 a1
tof c3
tof a1
tof c2
T c3
T* a6
T a1
T e
T* a5
T* c2
tof a1 a6
tof e a6
tof c4 c3
tof a2 c3
tof b2 a6
tof b0 c3
tof b0 a6
tof b0 a1
tof a0 a1
tof b2 e
tof e a1
tof b0 c2
tof b4 c2
tof a6 a1
tof a6 e
tof a6
H a1
H b3
H a4
tof a1 b0
tof c1 a6
tof b2 a6
tof c1 a5
tof c1 e
tof a4 d2
tof c1 d2
tof c1 a4
tof a4 b1
tof a4 b3
tof c0 a4
tof d5 c1
tof b4 c1
tof d5 c0
tof b5 c0
tof b4 c0
tof b5 d5
tof a2 c4
tof b4 d5
tof b4 c2
tof a2 c3
tof d5 b5
tof d5 a2
tof c1 c0
tof a4 c0
tof c1 a2
tof c1 d5
tof b3 a4
tof b1 b3
tof b2 e
tof a2
tof c1
tof a6
tof e
tof a5
tof d2
tof b1
T c3
T* c4
T* a2
T* b5
T c1
T b2
T* a6
T* e
T b3
T a1
T* b0
T* a5
T* d2
T b1
T* c2
tof d5 a2
tof a2 c3
tof a2 c4
tof c1 b5
tof d5 b5
tof e b2
tof b4 c1
tof d5 c1
tof d5 b2
tof e a6
tof d5 e
tof b0 a1
tof b1 b3
tof d5 b3
tof a4 b3
tof c0 b3
tof d5 a5
tof a0 a5
tof c0 d5
tof b1 d2
tof d5 b1
tof b4 c2
tof c0 d5
tof a1 b0
tof b2 e
tof b2 a5
tof b2 a6
tof b5 c1
tof c3 c4
tof c3 a2
tof a6
tof b2
tof b1
tof b3
tof b5
H c4
H c1
tof c2 b5
tof d4 d0
tof d5 b3
tof d2 b1
tof a5 b2
tof a1 a6
tof b2
tof b1
H d1
H e
tof b0 a1
tof a5 a1
tof b0 a6
tof a5 a6
tof d4 a5
tof c4 a5
tof d4 b2
tof d0 b2
tof c4 b2
tof c0 d2
tof c0 b1
tof d4 a4
tof d0 a4
tof c4 a4
tof a4 b1
tof d5 a4
tof b3 d5
tof d4 b3
tof d0 b3
tof c4 b3
tof c4 d0
tof d0 d4
tof c1 c4
tof c2 c1
tof b5 c2
tof c2 b5
tof c4 c1
tof c1 b5
tof d4 d0
tof d4 c1
tof d5 b3
tof a4 b3
tof d2 b1
tof a5 b2
tof a5 d4
tof a5 c4
tof a5 b1
tof a5 a4
tof a5 c1
tof b1
tof a4
tof a5
tof c1
tof a6
tof a1
tof c4
tof b2
T b3
T* b1
T* a4
T b5
T* a5
T* c1
T* a6
T a1
T c0
T* d2
T c4
tof d4 b3
tof b1 b3
tof a4 b1
tof a5 b5
tof d4 a4
tof d4 b5
tof c1 a5
tof d4 c1
tof b0 d4
tof a1 a6
tof d4 a1
tof d2 c0
tof b0 d4
tof d4 c4
tof c0 d2
tof a5 c1
tof b5 c4
tof b5 c1
tof b5 a5
tof b3 b1
tof b1 a4
tof c2 a5
tof d5 b1
tof c0 b3
tof d4 b2
tof a6 a1
tof a1
tof b2
tof b3
tof b1
tof a5
H b0
H b6
tof c3 c5
tof c2 a5
tof d5 b1
tof c0 b3
tof d4 b2
tof b2
tof b3
tof b1
tof d0
tof a5
P a0
P b4
tof c2 a5
tof b5 d0
tof d5 b1
tof c0 b3
tof d4 b2
tof a6
tof b2
tof b3
tof b1
H a0
H a4
H d2
H a3
tof c4 a1
tof d0 a6
tof c4 a6
tof c1 b5
tof c2 b5
tof d0 b5
tof c4 d0
tof a5 c2
tof c2 a5
tof c1 c2
tof d0 c2
tof b5 c2
tof d5 b1
tof c0 b3
tof d4 b2
tof a1 a6
tof a1 d0
tof a1
tof a6
tof b2
tof b3
tof b1
T b5
T c4
T* c2
T* a1
tof a1 b5
tof d0 b5
tof c1 b5
tof c2 b5
tof c2 c4
tof d0 a1
tof a1 c2
tof c2 a1
tof c4 a1
tof a5 b5
tof c4 c2
tof d5 b1
tof c0 b3
tof d4 b2
tof d0 a6
tof a6
tof b1
tof c2
tof b5
H c1
H a1
H a2
H b4
tof d0 b0
tof b0 d0
tof d0 b0
tof b0 a6
tof a6 b0
tof b0 a6
tof a6 c5
tof c5 a6
tof a6 c5
tof c5 a2
tof a2 c5
tof c5 a2
tof a2 c0
tof c0 a2
tof a2 c0
tof c0 e
tof e c0
tof c0 e
tof e d1
tof d1 e
tof e d1
tof d1 a0
tof a0 d1
tof d1 a0
tof d4 a1
tof a1 d4
tof d4 a1
tof d5 b4
tof b4 d5
tof d5 b4
tof b4 c2
tof c2 b4
tof b4 c2
tof c2 a4
tof a4 c2
tof c2 a4
tof a4 c4
tof c4 a4
tof a4 c4
tof c4 c1
tof c1 c4
tof c4 c1
tof c1 b6
tof b6 c1
tof c1 b6
tof b6 c3
tof c3 b6
tof b6 c3
tof c3 a3
tof a3 c3
tof c3 a3
tof b2 b3
tof b3 b1
tof b1 b3
tof b3 b1
END
