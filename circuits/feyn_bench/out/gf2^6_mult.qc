# Feynman -- quantum circuit toolkit
# Original (gf2^6_mult.qc):
#   Qubits: 18
#   H: 22
#   T: 252
#   cnot: 257
#   Depth: 163
#   T depth: 60
# Result (47.529ms):
#   Qubits: 18
#   H: 22
#   S: 15
#   T: 150
#   Z: 6
#   cnot: 235
#   Depth: 189
#   T depth: 63
.v a0 a1 a2 a3 a4 a5 b0 b1 b2 b3 b4 b5 c0 c1 c2 c3 c4 c5
.i a0 a1 a2 a3 a4 a5 b0 b1 b2 b3 b4 b5
.o a0 a1 a2 a3 a4 a5 b0 b1 b2 b3 b4 b5 c0 c1 c2 c3 c4 c5
BEGIN 
H c0
H c1
H c2
H c3
H c4
T c0
Z c0
cnot a5 c0
T* c0
cnot b1 c0
T c0
cnot a5 c0
T* c0
cnot a4 c0
cnot b1 c0
T* c0
cnot b2 c0
T c0
cnot a4 c0
T* c0
cnot a3 c0
cnot b2 c0
T* c0
cnot b3 c0
T c0
cnot a3 c0
T* c0
cnot a2 c0
cnot b3 c0
T* c0
cnot b4 c0
T c0
cnot a2 c0
T* c0
cnot a1 c0
cnot b4 c0
T* c0
cnot b5 c0
T c0
cnot a1 c0
T* c0
cnot b5 c0
H c0
Z c1
cnot a5 c1
T* c1
cnot b2 c1
T c1
cnot a5 c1
T* c1
cnot a4 c1
cnot b2 c1
T* c1
cnot b3 c1
T c1
cnot a4 c1
T* c1
cnot a3 c1
cnot b3 c1
T* c1
cnot b4 c1
T c1
cnot a3 c1
T* c1
cnot a2 c1
cnot b4 c1
T* c1
cnot b5 c1
T c1
cnot a2 c1
T* c1
cnot b5 c1
H c1
T* c2
Z c2
cnot a5 c2
T* c2
cnot b3 c2
T c2
cnot a5 c2
T* c2
cnot a4 c2
cnot b3 c2
T* c2
cnot b4 c2
T c2
cnot a4 c2
T* c2
cnot a3 c2
cnot b4 c2
T* c2
cnot b5 c2
T c2
cnot a3 c2
T* c2
cnot b5 c2
H c2
S c3
cnot a5 c3
T* c3
cnot b4 c3
T c3
cnot a5 c3
T* c3
cnot a4 c3
cnot b4 c3
T* c3
cnot b5 c3
T c3
cnot a4 c3
T* c3
cnot b5 c3
H c3
T c4
cnot a5 c4
T* c4
cnot b5 c4
T c4
cnot a5 c4
T* c4
cnot b5 c4
H c4
cnot c4 c5
cnot c3 c4
cnot c2 c3
cnot c1 c2
cnot c0 c1
H c0
H c1
H c2
H c3
H c4
H c5
T c0
cnot a0 c0
T* c0
cnot b0 c0
T c0
cnot a0 c0
T* c0
cnot b0 c0
H c0
S c1
cnot a1 c1
T* c1
cnot b0 c1
T c1
cnot a1 c1
T* c1
cnot a0 c1
cnot b0 c1
T* c1
cnot b1 c1
T c1
cnot a0 c1
T* c1
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
T* c3
cnot b0 c3
T c3
cnot a3 c3
T* c3
cnot a2 c3
cnot b0 c3
T* c3
cnot b1 c3
T c3
cnot a2 c3
T* c3
cnot a1 c3
cnot b1 c3
T* c3
cnot b2 c3
T c3
cnot a1 c3
T* c3
cnot a0 c3
cnot b2 c3
T* c3
cnot b3 c3
T c3
cnot a0 c3
T* c3
cnot b3 c3
H c3
T c4
Z c4
cnot a4 c4
T* c4
cnot b0 c4
T c4
cnot a4 c4
T* c4
cnot a3 c4
cnot b0 c4
T* c4
cnot b1 c4
T c4
cnot a3 c4
T* c4
cnot a2 c4
cnot b1 c4
T* c4
cnot b2 c4
T c4
cnot a2 c4
T* c4
cnot a1 c4
cnot b2 c4
T* c4
cnot b3 c4
T c4
cnot a1 c4
T* c4
cnot a0 c4
cnot b3 c4
T* c4
cnot b4 c4
T c4
cnot a0 c4
T* c4
cnot b4 c4
H c4
S* c5
cnot a5 c5
T* c5
cnot b0 c5
T c5
cnot a5 c5
T* c5
cnot a4 c5
cnot b0 c5
T* c5
cnot b1 c5
T c5
cnot a4 c5
T* c5
cnot a3 c5
cnot b1 c5
T* c5
cnot b2 c5
T c5
cnot a3 c5
T* c5
cnot a2 c5
cnot b2 c5
T* c5
cnot b3 c5
T c5
cnot a2 c5
T* c5
cnot a1 c5
cnot b3 c5
T* c5
cnot b4 c5
T c5
cnot a1 c5
T* c5
cnot a0 c5
cnot b4 c5
T* c5
cnot b5 c5
T c5
cnot a0 c5
T* c5
cnot b5 c5
H c5
S* a0
S* a1
S* b0
cnot a0 b0
T* b0
cnot a1 b0
cnot a0 b0
T* b0
S* b1
cnot a0 b1
T* b1
cnot a1 b1
cnot a0 b1
T* b1
S* a2
cnot b0 a2
cnot a1 a2
T* a2
cnot b1 a2
cnot b0 a2
T* a2
S* b2
cnot a0 b2
T* b2
cnot a1 b2
cnot a0 b2
T* b2
cnot b1 b2
cnot a2 b2
T* b2
S* a3
cnot b0 a3
cnot a1 a3
T* a3
cnot b1 a3
cnot b0 a3
T* a3
cnot b2 a3
cnot a2 a3
T* a3
S* b3
cnot a0 b3
T* b3
cnot a1 b3
cnot a0 b3
T* b3
cnot b1 b3
cnot a2 b3
T* b3
cnot b2 b3
cnot a3 b3
T* b3
S* a4
cnot b0 a4
cnot a1 a4
T* a4
cnot b1 a4
cnot b0 a4
T* a4
cnot b2 a4
cnot a2 a4
T* a4
cnot b3 a4
cnot a3 a4
T* a4
S* b4
cnot a0 b4
T* b4
cnot a1 b4
cnot a0 b4
T* b4
cnot b1 b4
cnot a2 b4
T* b4
cnot b2 b4
cnot a3 b4
T* b4
cnot b3 b4
cnot a4 b4
T* b4
S* a5
cnot b0 a5
cnot a1 a5
T* a5
cnot b1 a5
cnot b0 a5
T* a5
cnot b2 a5
cnot a2 a5
T* a5
cnot b3 a5
cnot a3 a5
T* a5
cnot b4 a5
cnot a4 a5
T* a5
S* b5
cnot a0 b5
T* b5
cnot a1 b5
cnot a0 b5
T* b5
cnot b1 b5
cnot a2 b5
T* b5
cnot b2 b5
cnot a3 b5
T* b5
cnot b3 b5
cnot a4 b5
T* b5
cnot b4 b5
cnot a5 b5
T* b5
cnot b1 a2
cnot b2 a3
cnot b3 a4
cnot b4 a5
cnot a4 a5
cnot a3 a5
cnot a3 a4
cnot a5 b5
cnot a4 b4
cnot a3 b3
cnot a1 a2
cnot a2 b5
cnot a2 b4
cnot a2 b3
cnot a2 b2
cnot a1 b1
cnot a1 b0
cnot a2 a5
cnot a2 a4
cnot a2 a3
END
