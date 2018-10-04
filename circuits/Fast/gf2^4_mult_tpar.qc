# Original circuit
#   qubits: 12
#   qubits used: 12
#   H: 14
#   cnot: 115
#   X: 0
#   T: 112
#   P: 0
#   Z: 0
#   tdepth (by partitions): 48
#   tdepth (by critical paths): 36
# Optimized circuit
#   qubits: 12
#   qubits used: 12
#   H: 14
#   cnot: 324
#   X: 0
#   T: 68
#   P: 4
#   Z: 9
#   tdepth (by partitions): 6
#   tdepth (by critical paths): 6
#   Time: 0.001 s
.v a0 a1 a2 a3 b0 b1 b2 b3 c0 c1 c2 c3
.i a0 a1 a2 a3 b0 b1 b2 b3
.o a0 a1 a2 a3 b0 b1 b2 b3 c0 c1 c2 c3

BEGIN
H c0
H c1
H c2
tof b3 a0
tof c0 a1
tof b2 a2
tof c0 a2
tof b2 a3
tof b2 b0
tof b2 b1
tof c0 b1
tof c1 b2
tof c0 b3
tof c1 b3
tof c1 c0
tof c2 c0
tof c2 c1
tof c1 c3
tof c0 c3
tof c0 c2
tof c0 c1
tof b3 c0
tof b2 c2
tof b2 b3
tof b1 c3
tof a3 c3
tof a3 b0
tof a2 b1
tof a2 b3
tof a2 c1
T* c3
T* c1
T* c2
T a2
T* a1
T* a3
T* b2
T* b3
T* c0
T* b0
T* b1
T* a0
tof b3 c3
tof c0 c3
tof b1 c3
tof c2 c1
tof a3 c2
tof a3 a2
tof b1 a2
tof b3 a1
tof b2 a3
tof b3 b2
tof a0 b2
tof b1 b3
tof b1 c0
tof b1 a0
tof b0 a0
tof b3 a0
tof a3 b2
tof a1 b3
tof a2 c0
tof a2 b1
tof c2 a0
tof c2 b2
tof c2 b0
tof c2 b1
tof c1 a0
tof c1 b2
tof c1 b3
tof c1 b0
tof c1 c0
tof c1 b1
tof c1 a1
P b1
T b1
T* c2
T a2
T* c1
T* a1
T* a3
T* c3
T c0
T* b0
T* b3
T* b2
T* a0
tof c2 b1
tof a2 b1
tof a2 c2
tof a1 c2
tof c1 a2
tof a1 a2
tof a3 a2
tof a1 c1
tof a3 c1
tof b0 c1
tof b2 c1
tof a0 c1
tof b3 a1
tof c3 a3
tof c0 a3
tof b0 a3
tof b2 a3
tof a0 a3
tof c0 c3
tof b0 c3
tof b2 c3
tof a0 c3
tof b0 c0
tof b3 c0
tof b2 c0
tof a0 c0
tof b3 b0
tof b2 b0
tof a0 b0
tof a0 b2
tof b2 a0
tof b3 a0
tof c3 a0
tof c3 b2
tof a3 a0
tof a3 b2
tof a3 c3
tof a1 a0
tof a1 b2
tof a1 c3
tof c1 a0
tof c1 b2
tof c1 c3
tof c1 b0
tof c1 c0
tof c1 a3
tof a2 b0
tof a2 c0
tof a2 b3
tof a2 a3
tof c2 b0
tof c2 c0
tof c2 a2
tof c2 c1
tof b1 a0
tof b1 b2
tof b1 c3
tof b1 b0
tof b1 c0
tof b1 a3
tof b1 c1
tof b1 c2
tof b1 a1
T* b1
T* a1
T c2
T c1
T* a2
T* a3
T b3
T c0
T* b0
T* c3
T* b2
T* a0
tof a1 b1
tof a2 b1
tof b3 b1
tof a0 b1
tof c2 a1
tof a2 c2
tof b3 c2
tof b3 c1
tof b0 c1
tof c3 c1
tof b3 a2
tof b3 a3
tof a2 b3
tof a2 b0
tof c1 a3
tof c1 b3
tof a1 a3
tof a1 b3
tof a1 c2
tof a1 c3
tof a1 b2
tof a1 c1
tof b1 a0
H c2
Z b0
Z a0
Z c1
Z c3
Z a1
Z a2
P b3
Z b2
Z b1
H b3
H c0
tof c0 a3
tof b3 c0
tof c2 b3
H c2
H b3
H c0
H a3
tof a0 b1
tof b3 b1
tof c3 a1
tof a3 a1
tof b2 c1
tof c0 c1
tof c2 b2
tof c0 a0
tof b3 c2
tof c0 c2
tof a3 c0
tof c0 a3
tof b3 a3
tof c2 a3
tof c2 b3
tof c3 c0
tof a0 c2
tof b2 b3
tof a1 c3
tof a1 c0
tof b1 c2
T* c3
T a1
T* b3
T c1
T* c0
T* a0
T b1
T a3
T* c2
T* b2
tof b3 c3
tof c0 c3
tof a3 c3
tof b2 c3
tof b0 c3
tof b3 a1
tof c0 a1
tof a3 a1
tof b2 a1
tof a3 b3
tof b2 b3
tof a0 c1
tof a3 c1
tof b2 c1
tof b0 c1
tof a0 c0
tof b1 c0
tof a3 c0
tof c2 c0
tof b0 a0
tof c2 b1
tof b2 b1
tof b0 b1
tof c2 a3
tof b0 a3
tof a2 a3
tof b2 c2
tof b0 c2
tof a2 c2
tof b0 b2
tof a2 b2
tof b0 a2
tof c2 b0
tof c2 a2
tof a3 b2
tof a3 b0
tof a3 c2
tof b1 b0
tof b1 a2
tof a0 a2
tof a0 b1
tof c0 c2
tof c1 a0
tof b3 a2
tof b3 b1
tof c3 a3
tof c3 c1
T* c3
T c1
T* a1
T a3
P b3
T b3
T* a0
T* c0
T* b1
T c2
T* a2
T* b0
T b2
tof c1 c3
tof b3 c3
tof a0 c3
tof c0 c3
tof b1 c3
tof c2 c3
tof b0 c3
tof a1 c1
tof b3 c1
tof a0 c1
tof c0 c1
tof b1 c1
tof c2 c1
tof b0 c1
tof a3 a1
tof c0 a1
tof b1 a1
tof c2 a1
tof a2 a1
tof c0 a3
tof b1 a3
tof c2 a3
tof a2 a3
tof a0 b3
tof c2 c0
tof c2 b1
tof a2 c2
tof b2 c2
tof b2 a2
tof a2 b0
tof c2 b2
tof c2 b0
tof c2 a2
tof b1 b2
tof b1 b0
tof b1 a2
tof b1 c2
tof c0 b2
tof c0 b0
tof c0 a2
tof b3 a0
tof a1 a3
tof c1 a3
tof c1 a1
H c2
Z a3
P a2
H a2
tof a3 b2
tof b0 b1
tof a0 b1
tof a3 b3
tof c0 c3
tof a3 c3
tof a3 c0
tof a3 b0
tof a0 c1
tof a3 a1
tof a3 a0
tof c1 a3
tof b2 a3
tof b2 a0
T* c0
T c3
T* b3
T* b0
T* b2
T* a1
T b1
T* a0
T* c1
T a3
tof c3 c0
tof b2 c3
tof c1 c3
tof a3 c3
tof b2 b3
tof c1 b3
tof a3 b3
tof b2 b0
tof b1 b0
tof a0 b0
tof a1 b2
tof c1 b2
tof a3 b2
tof a0 b1
tof c1 b1
tof a3 b1
tof c1 a0
tof a3 a0
tof a3 c1
tof c1 a3
tof a0 a3
tof b2 a1
tof b0 b1
tof c0 c3
H a0
H a1
tof c1 a2
tof a2 c1
tof c1 a2
tof a2 b3
tof b3 a2
tof a2 b3
tof b3 b2
tof b2 b3
tof b3 b2
tof b2 a3
tof a3 b2
tof b2 a3
tof a3 c0
tof c0 a3
tof a3 c0
tof c0 c2
tof c2 c0
tof c0 c2
tof c2 a0
tof a0 c2
tof c2 a0
tof b0 c3
tof c3 b0
tof b0 c3
tof c3 a1
tof a1 c3
tof c3 a1
END
