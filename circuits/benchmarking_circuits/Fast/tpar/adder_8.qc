# Original circuit
#   qubits: 24
#   qubits used: 24
#   H: 80
#   cnot: 466
#   X: 12
#   T: 399
#   P: 0
#   Z: 0
#   tdepth (by partitions): 171
#   tdepth (by critical paths): 69
# Optimized circuit
#   qubits: 24
#   qubits used: 24
#   H: 80
#   cnot: 885
#   X: 27
#   T: 215
#   P: 67
#   Z: 6
#   tdepth (by partitions): 30
#   tdepth (by critical paths): 30
#   Time: 0.006 s
.v b0 a0 b1 a1 c1 b2 a2 b3 a3 c3 d3 b4 a4 b5 a5 c5 d5 e5 b6 a6 b7 a7 z c7
.i b0 a0 b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 b6 a6 b7 a7 z
.o b0 a0 b1 a1 c1 b2 a2 b3 a3 c3 d3 b4 a4 b5 a5 c5 d5 e5 b6 a6 b7 a7 z c7

BEGIN
tof a1 b1
tof a3 b3
tof a5 b5
tof a7 b7
tof a7 z
tof a5 c5
tof a3 c3
tof a1 c1
H a1
H a3
H a5
H a7
tof a1 b0
tof a1 a0
tof a3 b2
tof a3 a2
tof e5 a3
tof a4 b4
tof a5 b4
tof a7 d3
tof c7 b4
tof a5 a4
tof a7 b6
tof a7 a6
tof a6 a7
tof b6 a7
tof a5 c7
tof a4 c7
tof b4 c7
tof a3 e5
tof a2 a3
tof b2 a3
tof a1 d5
tof a0 d5
tof b0 d5
T a1
T* b0
T* a0
T d5
T e5
T* b2
T* a2
T a3
T a5
T* c7
T* a4
T b4
T d3
T* b6
T* a6
T a7
T b1
P* b3
T* b3
P* b5
T* b5
P* b7
T* b7
tof b0 a1
tof a0 b0
tof b2 e5
tof a2 b2
tof c7 a5
tof a4 c7
tof a6 d3
tof a7 b6
tof b6 d3
tof a6 a7
tof b6 a6
tof a4 b4
tof a5 c7
tof a5 b4
tof c7 a4
tof a2 a3
tof e5 b2
tof e5 a3
tof b2 a2
tof a0 d5
tof a1 b0
tof a1 d5
tof b0 a0
H a0
H a2
H a4
H a6
H c1
H c3
H c5
H z
H d3
H d5
H b4
tof a0 b1
tof c1 a0
tof b2 e5
tof b3 e5
tof a2 e5
tof d3 e5
tof a3 c1
tof a2 b3
tof c7 a5
tof b5 a5
tof a4 a5
tof d5 a5
tof a4 b5
tof b7 a7
tof a6 a7
tof b4 a7
tof b6 a7
tof a6 b7
tof b7 b4
tof a4 c5
tof b5 d5
tof a2 c3
tof c1 a3
tof a0 c1
T c1
T a3
T* b1
T* a0
P a2
T a2
P* b3
T* b3
T* c3
P a4
T a4
P* b5
T* b5
T* c5
T d5
P a6
T a6
P* b7
T* b7
T b4
T e5
T a5
T a7
tof a0 c1
tof z c1
tof a3 c1
tof b1 a3
tof a0 b1
tof d3 a2
tof d3 b3
tof c5 a4
tof d3 c3
tof d5 c5
tof b7 a6
tof z a6
tof z b4
tof z a7
tof e5 d3
tof b7 z
tof a6 a7
tof d5 a5
tof a6 b4
tof a6 b7
tof b5 c5
tof c5 a5
tof c5 d5
tof c3 d3
tof a4 a5
tof a4 c5
tof a4 b5
tof b3 e5
tof a2 e5
tof e5 d3
tof b3 c3
tof b1 a0
tof a3 a0
T* b1
T a3
T* c3
T d3
T* a2
T b3
T a4
T* d5
T b5
T* c5
P c1
T c1
T* a6
T* b7
T z
T* b4
T* e5
T* a5
T* a7
tof a0 b1
tof a0 a3
tof b3 a2
tof d3 c3
tof a2 d3
tof e5 b3
tof b2 b3
tof d5 a4
tof b5 d5
tof a5 c5
tof c7 c5
tof b7 c1
tof z a6
tof a6 c1
tof z b7
tof a7 b4
tof b2 e5
tof b6 b4
tof c7 a5
tof b6 a7
tof b4 a7
tof b7 z
tof a6 a7
tof a6 z
tof c5 a5
tof d5 b5
tof a4 b5
tof d5 a5
tof a2 b3
tof b3 e5
tof c3 d3
tof c3 e5
tof b1 a3
tof b2 b3
tof c7 c5
tof b6 b4
tof b4 a6
tof c5 d5
tof b3 c3
H a0
tof c1 b1
tof b2 b3
tof c1 a0
tof b3 a0
tof c3 a2
tof c7 c5
tof d5 a4
tof b6 b4
tof a6 b7
tof b1 c1
tof b1 a0
tof b0 b1
tof a1 b1
Z a1
P* b0
P b3
Z b2
P c5
Z c7
P b4
P b6
P d3
P e5
P c3
P* a2
P d5
P* a4
P a6
P* b7
P b1
P* a0
tof b0 a1
tof c1 b0
tof a0 b3
tof c1 b3
tof c7 c5
tof b6 b4
tof c3 e5
tof a2 e5
tof c1 a0
tof a0 c3
tof a0 a2
tof a5 a4
tof a4 d5
tof a7 b7
tof b7 a6
tof a0 b1
tof a6 b7
tof d5 a4
tof c3 a2
tof e5 a2
tof b2 b1
tof b3 b2
tof b2 c3
tof a1 b0
tof a1 b1
Z a1
P* e5
P a5
P* d5
P a7
P* a6
P b3
P b2
P* a0
P* b0
P b1
tof b0 a1
tof c1 a1
tof a2 e5
tof d5 a5
tof a6 a7
tof c3 a0
tof b2 b3
tof a0 b2
tof b1 a0
tof c3 a0
tof c1 a0
tof c1 b0
tof c3 b1
tof c1 b1
tof a0 b1
tof b2 b1
tof b3 b1
tof b2 c3
tof b3 a0
tof a7 a6
tof a5 d5
H a2
H b5
H d5
H a6
H a0
tof a2 b1
tof a2 d3
tof a6 b5
tof a0 d5
tof a6 a0
tof z a6
tof b5 z
tof b1 d3
T* d5
T* a0
T* b5
T* a6
T z
T a2
T* b1
T* d3
tof b5 a0
tof a6 a0
tof z a0
tof a0 d5
tof z a6
tof a6 b5
tof d3 a2
tof d3 b1
tof a2 d3
tof b5 z
P d5
T d5
P b5
T b5
T a0
T a6
T* z
T* b1
T a2
tof a0 d5
tof b5 d5
tof z a6
tof d3 b1
tof d3 a2
tof b1 a2
tof a6 z
T d5
tof b5 d5
tof a0 d5
H a0
H b1
H z
tof a0 a6
tof z d5
tof b1 z
P b1
T b1
T a0
T* a6
T* z
T* d5
tof a0 b1
tof a6 a0
tof z d5
tof a6 z
tof b1 a0
tof a0 z
tof b1 a6
T* b1
T* a6
T a0
T z
T* d5
tof a0 b1
tof a0 a6
tof d5 z
tof z d5
tof a6 a0
tof b1 a0
T z
tof a0 z
tof d5 z
H d5
H b1
H a6
tof a4 c5
tof a6 z
tof b5 a6
tof b7 b4
tof b4 b7
tof a6 b5
tof c5 a4
T b5
T* z
T* a6
tof a6 b5
tof z b5
tof b5 z
tof z a6
T b5
tof z b5
tof a6 b5
tof a4 c5
H a6
H d3
tof a0 b0
tof a4 b0
tof a4 a0
tof c7 a0
tof z b5
tof a4 c5
tof a0 c7
tof a0 a4
tof c3 b2
tof b0 c7
P* b5
P a4
P* a0
P b0
tof a0 a4
tof b0 a4
tof c7 a4
tof z b5
tof c7 b0
tof b0 a0
tof b2 c3
tof b7 b4
tof b0 c5
tof a4 c5
tof a4 b0
H b5
H z
tof d3 b2
tof c3 e5
tof d3 e5
tof d3 c3
tof a5 b0
tof c5 b0
tof b5 b0
tof b5 a5
tof b4 b7
tof z a7
tof b7 a7
tof b7 b4
tof a5 c5
tof b0 c5
tof b0 a5
T* c3
T e5
T* b2
T b0
T a7
tof b2 c3
tof e5 c3
tof c5 b0
tof d3 b2
tof b4 a7
tof a5 c5
tof b5 c5
tof b7 b4
tof z b4
tof b5 a5
tof z b7
tof c3 e5
T* c5
T b0
T* b4
T a7
T c3
T* a5
T* b7
tof a5 c5
tof a5 b0
tof b7 b4
tof b7 a7
tof b2 c3
tof b5 a5
tof z b7
tof b4 a7
tof c5 b0
tof c5 c7
tof a0 c7
tof a4 c7
tof a4 c5
tof a0 c5
tof b6 b4
tof d5 b4
tof b5 b0
tof d5 b6
tof z a7
tof c7 c5
Z d3
P* c3
Z b5
P* b0
P z
P* a7
P b6
P* b4
P* c7
tof c3 d3
tof b0 b5
tof a7 z
tof d5 b6
tof d5 b4
tof a4 c7
tof c5 c7
tof z a7
tof b5 b0
tof d3 c3
H a7
H a3
H b2
H a5
H b7
tof a3 c5
tof a3 a1
tof b2 e5
tof a0 c7
tof a5 c7
tof b7 b4
tof b6 b4
T a3
T* c5
T* a1
T e5
T c7
T b4
tof a1 a3
tof c5 a3
tof b3 e5
tof a0 c7
tof b6 b4
tof b2 b3
tof a5 a0
tof b7 b6
tof a3 c5
tof c5 a1
T a3
T b2
T* e5
T* b3
T a5
T* c7
T* a0
T b7
T* b4
T* b6
tof e5 b2
tof c5 a3
tof a1 a3
tof b3 e5
tof c7 a5
tof a0 c7
tof b4 b7
tof b6 b4
tof b4 b6
tof b7 b6
tof b7 b4
tof a5 c7
tof c7 a0
tof e5 b3
tof b2 b3
tof b2 e5
H a1
H b3
H a0
H b6
tof a1 c1
tof e5 b2
tof b3 d3
tof c7 a5
tof a0 b5
tof b4 b7
tof b6 z
tof b4 b6
tof d5 b4
tof c7 a0
tof a4 c7
tof e5 b3
tof a2 e5
H a1
H b3
H a0
H b6
tof a1 a3
tof a1 c5
tof e5 b2
tof b3 b2
tof c7 a5
tof a0 a5
tof b6 b7
tof b4 b7
T a1
T* a3
T* c5
T b2
T a5
T b7
tof c5 a1
tof a3 a1
tof e5 b2
tof c7 a5
tof b4 b7
tof b3 e5
tof a0 c7
tof b6 b4
tof a1 a3
tof a3 c5
T a1
T b3
T* b2
T* e5
T a0
T* a5
T* c7
T b6
T* b7
T* b4
tof b2 b3
tof a3 a1
tof c5 a1
tof e5 b2
tof a5 a0
tof c7 a5
tof b7 b6
tof b4 b7
tof b7 b4
tof b6 b4
tof b6 b7
tof a0 a5
tof a5 c7
tof b2 e5
tof b3 e5
tof b3 b2
H c5
H e5
H c7
H b4
tof c5 c1
tof e5 d3
tof c7 b5
tof b4 z
H c5
H e5
H c7
H b4
tof c5 a1
tof c5 a3
tof b2 b3
tof e5 b3
tof a5 a0
tof c7 a0
tof b4 b6
tof b7 b6
T c5
T* a1
T* a3
T b3
T a0
T b6
tof a3 c5
tof a1 c5
tof b2 b3
tof a5 a0
tof b7 b6
tof e5 b2
tof c7 a5
tof b4 b7
tof c5 a1
tof a1 a3
T c5
T e5
T* b3
T* b2
T c7
T* a0
T* a5
T b4
T* b6
T* b7
tof b3 e5
tof a1 c5
tof a3 c5
tof b2 b3
tof a0 c7
tof a5 a0
tof b6 b4
tof b7 b6
tof b6 b7
tof b4 b7
tof b4 b6
tof c7 a0
tof a0 a5
tof b3 b2
tof e5 b2
tof e5 b3
H a3
H b2
H a5
H b7
tof a1 c5
tof a3 c1
tof b2 d3
tof a5 b5
tof b6 b7
tof d5 b7
tof d5 b6
tof d5 b4
tof a0 b5
tof a0 a5
tof a4 a5
tof a4 b5
tof a4 a0
tof a4 c7
tof b3 d3
tof b3 b2
tof a2 e5
tof a2 b2
tof a2 d3
tof a2 b3
tof c5
tof c1
tof e5
tof c7
H a3
H b2
H a5
tof b3 c5
tof a3 c5
tof a3 a1
tof b3 c1
tof d3 c1
tof d3 e5
tof b2 e5
tof d3 b3
tof a0 c7
tof b5 c7
tof a5 c7
tof b5 a0
tof b7 b6
tof b6 b7
tof b3 d3
tof b3 c7
tof b3 b5
T a3
T* c5
T* a1
T e5
T c7
P* d3
T* d3
P* b3
T* b3
T c1
tof a1 a3
tof e5 a3
tof d3 a3
tof b5 c5
tof d3 e5
tof b3 c7
tof b5 e5
tof e5 a1
tof c7 e5
tof b2 d3
tof a0 b3
tof a5 b3
tof b5 b3
tof b5 c1
tof e5 c7
tof a3 a1
tof a3 c7
tof a3 e5
T c5
T b2
T* a3
T* d3
T a5
T* e5
T* b3
tof a3 b2
tof c7 b2
tof a1 c5
tof c7 a3
tof d3 a3
tof c7 e5
tof e5 a5
tof b3 e5
tof a5 e5
tof e5 b3
tof a3 d3
tof b2 d3
tof b2 a3
tof e5 a0
tof a3 b5
tof c5
tof c1
tof a5
H a1
H d3
H b3
tof d3 c5
tof b5 c1
tof d3 c1
tof a1 c1
tof b5 a3
tof d3 b5
tof e5 a5
tof b3 a5
tof b0 a5
tof b0 b3
tof a0 e5
tof b3 a0
tof b0 b3
tof d3 c3
tof b5 a0
tof c5 b5
tof c5 c1
tof c5 a0
P d3
T d3
P* c5
T* c5
T* c3
T a0
T a5
T a1
T* c1
tof c3 c5
tof c5 d3
tof b2 c3
tof b0 a0
tof c1 a1
tof b3 a5
tof b5 c1
tof a3 b2
tof b3 b0
tof a1 c1
tof a0 a5
tof d3 c5
tof d3 b2
T d3
P b3
T b3
P* a0
T* a0
T* b0
T* b2
T c3
T* a5
tof a0 b3
tof b0 b3
tof b2 d3
tof a5 b3
tof a3 d3
tof b5 b0
tof e5 a0
tof a5 a0
tof a5 b0
tof b5 b2
tof a3 c3
tof c3 b2
tof c5 c3
tof b5 a5
tof b0 a5
tof a0 a5
tof b3 a5
tof b3 a0
tof d3 c3
tof b3 b0
tof b2 b5
tof a3 b5
tof c3 b5
tof a3 d3
tof c3 d3
tof c5 d3
tof b3 b2
tof b0 b2
tof c3 b2
tof a5 b2
tof a3 b2
tof a0 e5
tof a5 b3
tof b0 b3
tof e5 b0
tof a0 e5
tof b3 b0
tof b0 a0
tof b2 b0
tof b2 b3
tof d3 c3
tof b5 b3
tof b5 b2
tof b5 d3
tof b5 b0
P* b5
P* b0
P d3
P* c3
P b2
P* a0
tof d3 b5
tof c3 b5
tof b2 b0
tof a0 b0
tof b3 d3
tof a3 c3
tof c5 d3
tof c5 c3
tof b3 b2
tof e5 a0
tof a5 b2
tof a5 a0
tof b7 b6
tof b2 a0
tof b2 a5
tof a0 e5
tof d3 c3
tof d3 c5
tof c3 a3
tof a3
tof c5
tof e5
H b5
H b0
H d5
tof b5 a2
tof b0 a4
tof b0 d5
tof b6 b7
tof b7 b6
tof a0 e5
tof a4 d5
tof c3 a3
tof a3
T b0
T* a4
T* d5
T b5
T* a2
tof d5 b0
tof d5 a4
tof a2 b5
tof b3 d5
tof a0 d5
tof e5 a0
tof b3 a0
tof b5 a2
tof a4 d5
tof b0 d5
tof d5 a5
tof d5 a0
T* a4
T b0
T* d5
T* a0
T a5
tof a0 d5
tof a5 d5
tof b0 a4
tof d5 b0
tof b3 a5
tof e5 a5
tof a0 d5
tof a5 a0
tof a0 a5
tof d5 a5
tof a4 b0
tof b6 b7
tof c3 a3
tof b3
tof d3
H a4
tof a4 b3
tof a2 b5
tof a4 b5
tof a4 d3
tof a3 c3
tof a4 a3
tof a4 c5
tof a2 a4
tof b7 b6
tof b6 b7
tof b5 a2
tof d3 c5
tof b3 a3
tof a0
T* a2
T* a4
T b5
T* b3
T* d3
tof b5 a4
tof b3 a2
tof a4 a2
tof a3 b3
tof c3 b3
tof b3 b5
tof d3 b3
tof b3 d3
tof a4 b5
tof a2 b5
tof a2 d3
tof a2 b3
tof b7 b6
tof e5 a0
tof a2 c3
tof a3
tof a1
H a4
H b5
H b0
tof b5 a3
tof c5 a1
tof c3 a1
tof b3 a1
tof b5 a1
tof a4 a1
tof a4 c1
tof c3 c5
tof b3 c5
tof b5 c5
tof b5 b3
tof c3 a2
tof b3 c3
tof b5 b3
tof b5 d3
tof b0 d5
tof d5 a0
tof b0 d5
tof b6 b7
tof b7 b6
tof b2 a0
tof c3 b3
tof c5 b3
tof c5 c3
tof c5 a0
tof a3 c5
tof a3 a1
tof a3 d3
tof a3 a0
T a3
T a0
T d3
T a4
T* a1
T* c1
tof c5 a0
tof a1 a4
tof c1 a4
tof c5 d3
tof c3 d3
tof b5 d3
tof c3 c5
tof b3 c5
tof b5 c5
tof b3 c3
tof b5 c3
tof d5 b2
tof b0 b2
tof b5 b3
tof b0 d5
tof c3 b2
tof c5 b2
tof c5 c3
tof a1 c1
tof a4 c1
tof a4 a1
tof a3 d3
T* c5
T a3
T* b2
T a0
T* b3
T* d5
T a4
tof c3 c5
tof b3 c5
tof b3 a3
tof c3 b2
tof d5 b2
tof d5 a0
tof b5 b3
tof b0 d5
tof a1 a4
tof c1 a4
tof c3 a4
tof b2 a0
tof c5 a3
tof a3 c5
tof a0 b2
tof b6 b7
tof a0 e5
tof a3 a2
tof c3
H c1
tof b5 c3
tof a2 a3
tof b5 a2
tof b0 e5
tof b7 b6
tof b6 b7
tof a2 e5
tof c3 a2
tof c3 e5
P a5
P d3
P b5
P* c3
P b0
P* e5
tof c3 b5
tof a2 e5
tof e5 b0
tof b7 b6
tof b0 e5
tof b0 a0
tof b5 c3
tof b5 a3
tof a2
tof a3
H d3
H c3
H a5
H e5
H a1
H b3
H d5
tof a1 a2
tof a1 c7
tof b5 a4
tof b3 a4
tof b5 c5
tof b3 c5
tof b0 c5
tof d5 c5
tof b0 b2
tof d5 b2
tof b6 b7
tof b7 b6
tof b0 a0
tof b5 a3
tof c5 b2
tof a4 b2
tof a4 c5
tof a3
tof b0
T a1
T* a2
T* c7
T a4
T c5
tof c7 a1
tof a4 a1
tof b5 a1
tof b2 a2
tof b2 c7
tof b5 a4
tof a0 c5
tof a4 c7
tof c5 a4
tof b2 c5
tof b3 b5
tof d5 a0
tof a4 c5
tof a1 c7
tof a1 c5
tof a1 a4
T a2
T b3
T* a1
T* b5
T d5
T* a4
T* a0
tof a1 b3
tof c5 b3
tof c7 a2
tof c5 a1
tof b5 a1
tof c5 a4
tof a4 d5
tof a0 a4
tof d5 a4
tof a4 a0
tof a1 b5
tof b3 b5
tof b3 a1
tof b6 b7
tof a4 b0
tof a1 a3
tof b2
tof a3
tof b0
H c7
H b5
H a0
tof c7 b2
tof b5 a3
tof a0 b0
tof a0 a5
tof b5 d3
tof c7 c1
tof b2
tof a3
tof b0
tof c5 a5
tof a5 c5
tof c5 a5
tof a5 a0
tof a0 a5
tof a5 a0
tof c7 a7
tof a7 c7
tof c7 a7
tof a7 b7
tof b7 a7
tof a7 b7
tof b7 z
tof z b7
tof b7 z
tof z b1
tof b1 z
tof z b1
tof b1 b2
tof b2 b1
tof b1 b2
tof b2 b3
tof b3 b2
tof b2 b3
tof b3 a3
tof a3 b3
tof b3 a3
tof a3 b5
tof b5 a3
tof a3 b5
tof b5 b0
tof b0 b5
tof b5 b0
tof b0 a2
tof a2 b0
tof b0 a2
tof a2 a1
tof a1 a2
tof a2 a1
tof b6 b4
tof b4 b6
tof b6 b4
tof b4 d5
tof d5 b4
tof b4 d5
tof d5 e5
tof e5 d5
tof d5 e5
tof e5 a6
tof a6 e5
tof e5 a6
tof d3 c3
tof c3 d3
tof d3 c3
END
