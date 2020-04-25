# Feynman -- quantum circuit toolkit
# Original (gf2^10_mult.qc):
#   Qubits: 30
#   H: 38
#   T: 700
#   cnot: 709
#   Depth: 290
#   T depth: 108
# Result (128.040ms):
#   Qubits: 30
#   H: 38
#   S: 25
#   T: 410
#   Z: 6
#   cnot: 648
#   Depth: 324
#   T depth: 109
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
T c0
cnot a9 c0
T* c0
cnot b1 c0
T c0
cnot a9 c0
T* c0
cnot a8 c0
cnot b1 c0
T* c0
cnot b2 c0
T c0
cnot a8 c0
T* c0
cnot a7 c0
cnot b2 c0
T* c0
cnot b3 c0
T c0
cnot a7 c0
T* c0
cnot a6 c0
cnot b3 c0
T* c0
cnot b4 c0
T c0
cnot a6 c0
T* c0
cnot a5 c0
cnot b4 c0
T* c0
cnot b5 c0
T c0
cnot a5 c0
T* c0
cnot a4 c0
cnot b5 c0
T* c0
cnot b6 c0
T c0
cnot a4 c0
T* c0
cnot a3 c0
cnot b6 c0
T* c0
cnot b7 c0
T c0
cnot a3 c0
T* c0
cnot a2 c0
cnot b7 c0
T* c0
cnot b8 c0
T c0
cnot a2 c0
T* c0
cnot a1 c0
cnot b8 c0
T* c0
cnot b9 c0
T c0
cnot a1 c0
T* c0
cnot b9 c0
H c0
cnot a9 c1
T* c1
cnot b2 c1
T c1
cnot a9 c1
T* c1
cnot a8 c1
cnot b2 c1
T* c1
cnot b3 c1
T c1
cnot a8 c1
T* c1
cnot a7 c1
cnot b3 c1
T* c1
cnot b4 c1
T c1
cnot a7 c1
T* c1
cnot a6 c1
cnot b4 c1
T* c1
cnot b5 c1
T c1
cnot a6 c1
T* c1
cnot a5 c1
cnot b5 c1
T* c1
cnot b6 c1
T c1
cnot a5 c1
T* c1
cnot a4 c1
cnot b6 c1
T* c1
cnot b7 c1
T c1
cnot a4 c1
T* c1
cnot a3 c1
cnot b7 c1
T* c1
cnot b8 c1
T c1
cnot a3 c1
T* c1
cnot a2 c1
cnot b8 c1
T* c1
cnot b9 c1
T c1
cnot a2 c1
T* c1
cnot b9 c1
H c1
T* c2
cnot a9 c2
T* c2
cnot b3 c2
T c2
cnot a9 c2
T* c2
cnot a8 c2
cnot b3 c2
T* c2
cnot b4 c2
T c2
cnot a8 c2
T* c2
cnot a7 c2
cnot b4 c2
T* c2
cnot b5 c2
T c2
cnot a7 c2
T* c2
cnot a6 c2
cnot b5 c2
T* c2
cnot b6 c2
T c2
cnot a6 c2
T* c2
cnot a5 c2
cnot b6 c2
T* c2
cnot b7 c2
T c2
cnot a5 c2
T* c2
cnot a4 c2
cnot b7 c2
T* c2
cnot b8 c2
T c2
cnot a4 c2
T* c2
cnot a3 c2
cnot b8 c2
T* c2
cnot b9 c2
T c2
cnot a3 c2
T* c2
cnot b9 c2
H c2
S* c3
cnot a9 c3
T* c3
cnot b4 c3
T c3
cnot a9 c3
T* c3
cnot a8 c3
cnot b4 c3
T* c3
cnot b5 c3
T c3
cnot a8 c3
T* c3
cnot a7 c3
cnot b5 c3
T* c3
cnot b6 c3
T c3
cnot a7 c3
T* c3
cnot a6 c3
cnot b6 c3
T* c3
cnot b7 c3
T c3
cnot a6 c3
T* c3
cnot a5 c3
cnot b7 c3
T* c3
cnot b8 c3
T c3
cnot a5 c3
T* c3
cnot a4 c3
cnot b8 c3
T* c3
cnot b9 c3
T c3
cnot a4 c3
T* c3
cnot b9 c3
H c3
T c4
Z c4
cnot a9 c4
T* c4
cnot b5 c4
T c4
cnot a9 c4
T* c4
cnot a8 c4
cnot b5 c4
T* c4
cnot b6 c4
T c4
cnot a8 c4
T* c4
cnot a7 c4
cnot b6 c4
T* c4
cnot b7 c4
T c4
cnot a7 c4
T* c4
cnot a6 c4
cnot b7 c4
T* c4
cnot b8 c4
T c4
cnot a6 c4
T* c4
cnot a5 c4
cnot b8 c4
T* c4
cnot b9 c4
T c4
cnot a5 c4
T* c4
cnot b9 c4
H c4
Z c5
cnot a9 c5
T* c5
cnot b6 c5
T c5
cnot a9 c5
T* c5
cnot a8 c5
cnot b6 c5
T* c5
cnot b7 c5
T c5
cnot a8 c5
T* c5
cnot a7 c5
cnot b7 c5
T* c5
cnot b8 c5
T c5
cnot a7 c5
T* c5
cnot a6 c5
cnot b8 c5
T* c5
cnot b9 c5
T c5
cnot a6 c5
T* c5
cnot b9 c5
H c5
T* c6
Z c6
cnot a9 c6
T* c6
cnot b7 c6
T c6
cnot a9 c6
T* c6
cnot a8 c6
cnot b7 c6
T* c6
cnot b8 c6
T c6
cnot a8 c6
T* c6
cnot a7 c6
cnot b8 c6
T* c6
cnot b9 c6
T c6
cnot a7 c6
T* c6
cnot b9 c6
H c6
S c7
cnot a9 c7
T* c7
cnot b8 c7
T c7
cnot a9 c7
T* c7
cnot a8 c7
cnot b8 c7
T* c7
cnot b9 c7
T c7
cnot a8 c7
T* c7
cnot b9 c7
H c7
T c8
cnot a9 c8
T* c8
cnot b9 c8
T c8
cnot a9 c8
T* c8
cnot b9 c8
H c8
cnot c7 c0
cnot c8 c1
cnot c6 c9
cnot c5 c8
cnot c4 c7
cnot c3 c6
cnot c2 c5
cnot c1 c4
cnot c0 c3
H c0
H c1
H c2
H c3
H c4
H c5
H c6
H c7
H c8
H c9
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
T* c6
cnot a6 c6
T* c6
cnot b0 c6
T c6
cnot a6 c6
T* c6
cnot a5 c6
cnot b0 c6
T* c6
cnot b1 c6
T c6
cnot a5 c6
T* c6
cnot a4 c6
cnot b1 c6
T* c6
cnot b2 c6
T c6
cnot a4 c6
T* c6
cnot a3 c6
cnot b2 c6
T* c6
cnot b3 c6
T c6
cnot a3 c6
T* c6
cnot a2 c6
cnot b3 c6
T* c6
cnot b4 c6
T c6
cnot a2 c6
T* c6
cnot a1 c6
cnot b4 c6
T* c6
cnot b5 c6
T c6
cnot a1 c6
T* c6
cnot a0 c6
cnot b5 c6
T* c6
cnot b6 c6
T c6
cnot a0 c6
T* c6
cnot b6 c6
H c6
cnot a7 c7
T* c7
cnot b0 c7
T c7
cnot a7 c7
T* c7
cnot a6 c7
cnot b0 c7
T* c7
cnot b1 c7
T c7
cnot a6 c7
T* c7
cnot a5 c7
cnot b1 c7
T* c7
cnot b2 c7
T c7
cnot a5 c7
T* c7
cnot a4 c7
cnot b2 c7
T* c7
cnot b3 c7
T c7
cnot a4 c7
T* c7
cnot a3 c7
cnot b3 c7
T* c7
cnot b4 c7
T c7
cnot a3 c7
T* c7
cnot a2 c7
cnot b4 c7
T* c7
cnot b5 c7
T c7
cnot a2 c7
T* c7
cnot a1 c7
cnot b5 c7
T* c7
cnot b6 c7
T c7
cnot a1 c7
T* c7
cnot a0 c7
cnot b6 c7
T* c7
cnot b7 c7
T c7
cnot a0 c7
T* c7
cnot b7 c7
H c7
T c8
cnot a8 c8
T* c8
cnot b0 c8
T c8
cnot a8 c8
T* c8
cnot a7 c8
cnot b0 c8
T* c8
cnot b1 c8
T c8
cnot a7 c8
T* c8
cnot a6 c8
cnot b1 c8
T* c8
cnot b2 c8
T c8
cnot a6 c8
T* c8
cnot a5 c8
cnot b2 c8
T* c8
cnot b3 c8
T c8
cnot a5 c8
T* c8
cnot a4 c8
cnot b3 c8
T* c8
cnot b4 c8
T c8
cnot a4 c8
T* c8
cnot a3 c8
cnot b4 c8
T* c8
cnot b5 c8
T c8
cnot a3 c8
T* c8
cnot a2 c8
cnot b5 c8
T* c8
cnot b6 c8
T c8
cnot a2 c8
T* c8
cnot a1 c8
cnot b6 c8
T* c8
cnot b7 c8
T c8
cnot a1 c8
T* c8
cnot a0 c8
cnot b7 c8
T* c8
cnot b8 c8
T c8
cnot a0 c8
T* c8
cnot b8 c8
H c8
S c9
cnot a9 c9
T* c9
cnot b0 c9
T c9
cnot a9 c9
T* c9
cnot a8 c9
cnot b0 c9
T* c9
cnot b1 c9
T c9
cnot a8 c9
T* c9
cnot a7 c9
cnot b1 c9
T* c9
cnot b2 c9
T c9
cnot a7 c9
T* c9
cnot a6 c9
cnot b2 c9
T* c9
cnot b3 c9
T c9
cnot a6 c9
T* c9
cnot a5 c9
cnot b3 c9
T* c9
cnot b4 c9
T c9
cnot a5 c9
T* c9
cnot a4 c9
cnot b4 c9
T* c9
cnot b5 c9
T c9
cnot a4 c9
T* c9
cnot a3 c9
cnot b5 c9
T* c9
cnot b6 c9
T c9
cnot a3 c9
T* c9
cnot a2 c9
cnot b6 c9
T* c9
cnot b7 c9
T c9
cnot a2 c9
T* c9
cnot a1 c9
cnot b7 c9
T* c9
cnot b8 c9
T c9
cnot a1 c9
T* c9
cnot a0 c9
cnot b8 c9
T* c9
cnot b9 c9
T c9
cnot a0 c9
T* c9
cnot b9 c9
H c9
S a0
S a1
S b0
cnot a0 b0
T* b0
cnot a1 b0
cnot a0 b0
T* b0
S b1
cnot a0 b1
T* b1
cnot a1 b1
cnot a0 b1
T* b1
S a2
cnot b0 a2
cnot a1 a2
T* a2
cnot b1 a2
cnot b0 a2
T* a2
S b2
cnot a0 b2
T* b2
cnot a1 b2
cnot a0 b2
T* b2
cnot b1 b2
cnot a2 b2
T* b2
S a3
cnot b0 a3
cnot a1 a3
T* a3
cnot b1 a3
cnot b0 a3
T* a3
cnot b2 a3
cnot a2 a3
T* a3
S b3
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
S a4
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
S b4
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
S a5
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
S b5
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
S a6
cnot b0 a6
cnot a1 a6
T* a6
cnot b1 a6
cnot b0 a6
T* a6
cnot b2 a6
cnot a2 a6
T* a6
cnot b3 a6
cnot a3 a6
T* a6
cnot b4 a6
cnot a4 a6
T* a6
cnot b5 a6
cnot a5 a6
T* a6
S b6
cnot a0 b6
T* b6
cnot a1 b6
cnot a0 b6
T* b6
cnot b1 b6
cnot a2 b6
T* b6
cnot b2 b6
cnot a3 b6
T* b6
cnot b3 b6
cnot a4 b6
T* b6
cnot b4 b6
cnot a5 b6
T* b6
cnot b5 b6
cnot a6 b6
T* b6
S a7
cnot b0 a7
cnot a1 a7
T* a7
cnot b1 a7
cnot b0 a7
T* a7
cnot b2 a7
cnot a2 a7
T* a7
cnot b3 a7
cnot a3 a7
T* a7
cnot b4 a7
cnot a4 a7
T* a7
cnot b5 a7
cnot a5 a7
T* a7
cnot b6 a7
cnot a6 a7
T* a7
S b7
cnot a0 b7
T* b7
cnot a1 b7
cnot a0 b7
T* b7
cnot b1 b7
cnot a2 b7
T* b7
cnot b2 b7
cnot a3 b7
T* b7
cnot b3 b7
cnot a4 b7
T* b7
cnot b4 b7
cnot a5 b7
T* b7
cnot b5 b7
cnot a6 b7
T* b7
cnot b6 b7
cnot a7 b7
T* b7
S a8
cnot b0 a8
cnot a1 a8
T* a8
cnot b1 a8
cnot b0 a8
T* a8
cnot b2 a8
cnot a2 a8
T* a8
cnot b3 a8
cnot a3 a8
T* a8
cnot b4 a8
cnot a4 a8
T* a8
cnot b5 a8
cnot a5 a8
T* a8
cnot b6 a8
cnot a6 a8
T* a8
cnot b7 a8
cnot a7 a8
T* a8
S b8
cnot a0 b8
T* b8
cnot a1 b8
cnot a0 b8
T* b8
cnot b1 b8
cnot a2 b8
T* b8
cnot b2 b8
cnot a3 b8
T* b8
cnot b3 b8
cnot a4 b8
T* b8
cnot b4 b8
cnot a5 b8
T* b8
cnot b5 b8
cnot a6 b8
T* b8
cnot b6 b8
cnot a7 b8
T* b8
cnot b7 b8
cnot a8 b8
T* b8
S a9
cnot b0 a9
cnot a1 a9
T* a9
cnot b1 a9
cnot b0 a9
T* a9
cnot b2 a9
cnot a2 a9
T* a9
cnot b3 a9
cnot a3 a9
T* a9
cnot b4 a9
cnot a4 a9
T* a9
cnot b5 a9
cnot a5 a9
T* a9
cnot b6 a9
cnot a6 a9
T* a9
cnot b7 a9
cnot a7 a9
T* a9
cnot b8 a9
cnot a8 a9
T* a9
S b9
cnot a0 b9
T* b9
cnot a1 b9
cnot a0 b9
T* b9
cnot b1 b9
cnot a2 b9
T* b9
cnot b2 b9
cnot a3 b9
T* b9
cnot b3 b9
cnot a4 b9
T* b9
cnot b4 b9
cnot a5 b9
T* b9
cnot b5 b9
cnot a6 b9
T* b9
cnot b6 b9
cnot a7 b9
T* b9
cnot b7 b9
cnot a8 b9
T* b9
cnot b8 b9
cnot a9 b9
T* b9
cnot b1 a2
cnot b2 a3
cnot b3 a4
cnot b4 a5
cnot b5 a6
cnot b6 a7
cnot b7 a8
cnot b8 a9
cnot a9 b9
cnot a7 a8
cnot a6 a8
cnot a6 a7
cnot a8 b9
cnot a8 b8
cnot a7 b7
cnot a6 b6
cnot a8 a9
cnot a4 a5
cnot a3 a5
cnot a3 a4
cnot a5 b9
cnot a5 b8
cnot a5 b7
cnot a5 b6
cnot a5 b5
cnot a4 b4
cnot a3 b3
cnot a5 a9
cnot a5 a8
cnot a5 a7
cnot a5 a6
cnot a1 a2
cnot a2 b9
cnot a2 b8
cnot a2 b7
cnot a2 b6
cnot a2 b5
cnot a2 b4
cnot a2 b3
cnot a2 b2
cnot a1 b1
cnot a1 b0
cnot a2 a9
cnot a2 a8
cnot a2 a7
cnot a2 a6
cnot a2 a5
cnot a2 a4
cnot a2 a3
END
