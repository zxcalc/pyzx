# Original circuit
#   qubits: 14
#   qubits used: 14
#   H: 22
#   cnot: 104
#   X: 8
#   T: 77
#   P: 0
#   Z: 0
#   tdepth (by partitions): 33
#   tdepth (by critical paths): 33
# Optimized circuit
#   qubits: 14
#   qubits used: 14
#   H: 22
#   cnot: 230
#   X: 12
#   T: 63
#   P: 7
#   Z: 0
#   tdepth (by partitions): 22
#   tdepth (by critical paths): 22
#   Time: 0.001 s
.v b0 a0 e b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 z
.i b0 a0 b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 z
.o b0 a0 e b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 z

BEGIN
tof a1 e
tof a1 b1
tof a2 b2
tof a3 b3
tof a4 b4
tof a5 b5
H a1
tof a0 b0
tof a1 b0
T b0
T b1
T b2
T b3
T b4
T b5
tof a0 b0
tof e b1
tof e b2
tof e b3
tof e b4
tof a1 a0
T a1
T* b0
T* a0
T* b4
T* b3
T* b2
T* b1
tof b0 a1
tof a0 b0
tof e b4
tof e b3
tof e b2
tof e b1
tof b0 a0
tof a1 a0
tof a1 b0
H a0
tof a2 e
H e
tof b1 a0
tof e a0
tof e b1
tof a0 e
T* e
T* b1
T a0
tof a0 e
tof a0 b1
tof a1 a0
tof e a0
tof e b1
T e
T* b1
T a0
tof b1 e
tof a0 e
tof a1 e
tof a0 b1
tof a1 b1
tof a1 a0
tof e b1
tof e a0
H b1
tof a3 a2
H a2
tof b2 b1
tof a2 b2
tof b1 a2
T* b1
T* b2
T a2
tof a2 b1
tof a2 b2
tof a1 a2
tof b1 a2
tof b1 b2
T b1
T* b2
T a2
tof b2 b1
tof a2 b1
tof a1 b1
tof a2 b2
tof a1 b2
tof a1 a2
tof b1 b2
tof b1 a2
H b2
tof a4 a3
H a3
tof b3 b2
tof a3 b3
tof b2 a3
T* b2
T* b3
T a3
tof a3 b2
tof a3 b3
tof a1 a3
tof b2 a3
tof b2 b3
T b2
T* b3
T a3
tof b3 b2
tof a3 b2
tof a1 b2
tof a3 b3
tof a1 b3
tof a1 a3
tof b2 b3
tof b2 a3
H b3
tof a5 a4
H a4
tof b4 b3
tof a4 b3
tof a4 b4
tof b3 a4
T* a4
T* b4
T b3
tof b3 a4
tof b3 b4
tof a1 b3
tof a4 b3
tof a4 b4
T a4
T* b4
T b3
tof b4 a4
tof b3 a4
tof a1 a4
tof b3 b4
tof a1 b4
tof a1 b3
tof a4 b4
tof a4 b3
H b4
tof a5 z
tof b1
H z
tof b5 b4
tof b4 b5
T b5
T z
T* b4
tof z b5
tof b4 z
tof b5 b4
T* b5
T* b4
T z
tof z b5
tof z b4
tof b4 z
tof b5 z
tof e
tof b2
tof a4
H z
tof b4 b5
tof b3 a4
tof a3 b2
tof a2 b1
tof a0 e
tof b1
H b4
tof b4 a1
tof b4 b3
tof b4 a4
tof a1 a4
tof a1
T b4
T* b3
T* a1
tof b3 b4
tof a1 b4
tof a1 b3
tof b4 b3
tof b4 a1
T b4
tof a4 b4
tof a1 b4
tof b3 b4
H b3
tof b0 a4
P* a4
P a0
P a2
P a3
P a1
tof b0 a4
H a1
tof a1 a4
tof a1 a3
tof a1 b2
tof a4 b2
tof a4
T a1
T* a3
T* a4
tof a3 a1
tof a4 a1
tof a4 a3
tof a1 a3
tof a1 a4
T a1
tof b2 a1
tof a4 a1
tof a3 a1
H a3
tof a5 b3
H a4
tof a4 b2
tof a4 a2
tof a4 b1
tof b2 b1
tof b2
T a4
T* a2
T* b2
tof a2 a4
tof b2 a4
tof b2 a2
tof a4 a2
tof a4 b2
T a4
tof b1 a4
tof b2 a4
tof a2 a4
H a2
tof b3 a3
tof a1
H b2
tof b2 b1
tof b2 a0
tof b2 e
tof b1 e
tof b1
T b2
T* a0
T* b1
tof a0 b2
tof b1 b2
tof b1 a0
tof b2 a0
tof b2 b1
T b2
tof e b2
tof b1 b2
tof a0 b2
H a0
tof a4
H b1
tof b1 e
tof b1 b0
tof a3 b3
tof b2
T b1
T* e
T* b0
tof e b1
tof b0 b1
tof e b0
tof b1 b0
tof b1 e
T b1
tof e b1
tof b0 b1
tof a3 a2
tof a3 b3
H b0
tof a3 a2
tof a5 a3
tof a5 b3
tof a3 a5
tof a3 b3
P b1
P e
tof e b1
tof a5 b2
tof a2 b2
tof a0 b2
tof a5 a4
tof a2 a4
tof a5 a1
tof a5 b4
tof b3 b4
tof a5 b5
tof a3 b5
tof a2 a5
tof a0 a5
tof a2 a3
tof a0 a3
tof a2 b3
tof a0 b3
tof a0 a2
tof a5 a3
tof a5 a0
tof a5 b3
tof a5 b0
tof a5 a2
tof b0 b2
tof b2 b0
tof b0 b2
tof e b2
tof b2 e
tof e b2
tof b2 a4
tof a4 b2
tof b2 a4
tof a4 b3
tof b3 a4
tof a4 b3
tof b3 a1
tof a1 b3
tof b3 a1
tof a1 a5
tof a5 a1
tof a1 a5
tof a5 a3
tof a3 a5
tof a5 a3
tof a3 a2
tof a2 a3
tof a3 a2
tof a2 a0
tof a0 a2
tof a2 a0
tof b1 b0
tof b0 b1
tof b1 b0
END
