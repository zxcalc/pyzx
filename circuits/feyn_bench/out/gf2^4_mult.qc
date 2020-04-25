# Feynman -- quantum circuit toolkit
# Original (gf2^4_mult.qc):
#   Qubits: 12
#   H: 14
#   T: 112
#   cnot: 115
#   Depth: 99
#   T depth: 36
# Result (13.430ms):
#   Qubits: 12
#   H: 14
#   S: 2
#   T: 68
#   Z: 3
#   cnot: 106
#   Depth: 116
#   T depth: 39
.v a0 a1 a2 a3 b0 b1 b2 b3 c0 c1 c2 c3
.i a0 a1 a2 a3 b0 b1 b2 b3
.o a0 a1 a2 a3 b0 b1 b2 b3 c0 c1 c2 c3
BEGIN 
H c0
H c1
H c2
T* c0
Z c0
cnot a3 c0
T* c0
cnot b1 c0
T c0
cnot a3 c0
T* c0
cnot a2 c0
cnot b1 c0
T* c0
cnot b2 c0
T c0
cnot a2 c0
T* c0
cnot a1 c0
cnot b2 c0
T* c0
cnot b3 c0
T c0
cnot a1 c0
T* c0
cnot b3 c0
H c0
S* c1
cnot a3 c1
T c1
cnot b2 c1
T* c1
cnot a3 c1
T c1
cnot a2 c1
cnot b2 c1
T c1
cnot b3 c1
T* c1
cnot a2 c1
T c1
cnot b3 c1
H c1
T c2
cnot a3 c2
T* c2
cnot b3 c2
T c2
cnot a3 c2
T* c2
cnot b3 c2
H c2
cnot c2 c3
cnot c1 c2
cnot c0 c1
H c0
H c1
H c2
H c3
T c0
cnot a0 c0
T* c0
cnot b0 c0
T c0
cnot a0 c0
T* c0
cnot b0 c0
H c0
S* c1
cnot a1 c1
T c1
cnot b0 c1
T* c1
cnot a1 c1
T c1
cnot a0 c1
cnot b0 c1
T c1
cnot b1 c1
T* c1
cnot a0 c1
T c1
cnot b1 c1
H c1
T* c2
Z c2
cnot a2 c2
T* c2
cnot b0 c2
T c2
cnot a2 c2
T* c2
cnot a1 c2
cnot b0 c2
T* c2
cnot b1 c2
T c2
cnot a1 c2
T* c2
cnot a0 c2
cnot b1 c2
T* c2
cnot b2 c2
T c2
cnot a0 c2
T* c2
cnot b2 c2
H c2
Z c3
cnot a3 c3
T c3
cnot b0 c3
T* c3
cnot a3 c3
T c3
cnot a2 c3
cnot b0 c3
T c3
cnot b1 c3
T* c3
cnot a2 c3
T c3
cnot a1 c3
cnot b1 c3
T c3
cnot b2 c3
T* c3
cnot a1 c3
T c3
cnot a0 c3
cnot b2 c3
T c3
cnot b3 c3
T* c3
cnot a0 c3
T c3
cnot b3 c3
H c3
cnot a0 b0
T* b0
cnot a1 b0
cnot a0 b0
T b0
cnot a0 b1
T b1
cnot a1 b1
cnot a0 b1
T* b1
cnot b0 a2
cnot a1 a2
T* a2
cnot b1 a2
cnot b0 a2
T a2
cnot a0 b2
T* b2
cnot a1 b2
cnot a0 b2
T b2
cnot b1 b2
cnot a2 b2
T* b2
cnot b0 a3
cnot a1 a3
T a3
cnot b1 a3
cnot b0 a3
T* a3
cnot b2 a3
cnot a2 a3
T a3
cnot a0 b3
T b3
cnot a1 b3
cnot a0 b3
T* b3
cnot b1 b3
cnot a2 b3
T b3
cnot b2 b3
cnot a3 b3
T* b3
cnot b1 a2
cnot b2 a3
cnot a2 a3
cnot a3 b3
cnot a2 b2
cnot a1 b3
cnot a1 b2
cnot a1 b1
cnot a1 b0
cnot a1 a3
cnot a1 a2
END
