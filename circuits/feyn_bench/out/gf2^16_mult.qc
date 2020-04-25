# Feynman -- quantum circuit toolkit
# Original (gf2^16_mult.qc):
#   Qubits: 48
#   H: 62
#   T: 1792
#   cnot: 1837
#   Depth: 489
#   T depth: 180
# Result (509.787ms):
#   Qubits: 48
#   H: 62
#   S: 8
#   T: 1040
#   Z: 12
#   cnot: 1691
#   swap: 1
#   Depth: 1488
#   T depth: 585
.v a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15
.i a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15
.o c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15
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
H c9
H c10
H c11
H c12
H c13
H c14
T* c0
cnot a15 c0
T* c0
cnot b1 c0
T c0
cnot a15 c0
T* c0
cnot a6 c0
cnot b1 c0
T* c0
cnot b10 c0
T c0
cnot a6 c0
T* c0
cnot a5 c0
cnot b10 c0
T* c0
cnot b11 c0
T c0
cnot a5 c0
T* c0
cnot a4 c0
cnot b11 c0
T* c0
cnot b12 c0
T c0
cnot a4 c0
T* c0
cnot a3 c0
cnot b12 c0
T* c0
cnot b13 c0
T c0
cnot a3 c0
T* c0
cnot a2 c0
cnot b13 c0
T* c0
cnot b14 c0
T c0
cnot a2 c0
T* c0
cnot a1 c0
cnot b14 c0
T* c0
cnot b15 c0
T c0
cnot a1 c0
T* c0
cnot a14 c0
cnot b15 c0
T* c0
cnot b2 c0
T c0
cnot a14 c0
T* c0
cnot a13 c0
cnot b2 c0
T* c0
cnot b3 c0
T c0
cnot a13 c0
T* c0
cnot a12 c0
cnot b3 c0
T* c0
cnot b4 c0
T c0
cnot a12 c0
T* c0
cnot a11 c0
cnot b4 c0
T* c0
cnot b5 c0
T c0
cnot a11 c0
T* c0
cnot a10 c0
cnot b5 c0
T* c0
cnot b6 c0
T c0
cnot a10 c0
T* c0
cnot a9 c0
cnot b6 c0
T* c0
cnot b7 c0
T c0
cnot a9 c0
T* c0
cnot a8 c0
cnot b7 c0
T* c0
cnot b8 c0
T c0
cnot a8 c0
T* c0
cnot a7 c0
cnot b8 c0
T* c0
cnot b9 c0
T c0
cnot a7 c0
T* c0
cnot b9 c0
H c0
S* c1
cnot a7 c1
T* c1
cnot b10 c1
T c1
cnot a7 c1
T* c1
cnot a6 c1
cnot b10 c1
T* c1
cnot b11 c1
T c1
cnot a6 c1
T* c1
cnot a5 c1
cnot b11 c1
T* c1
cnot b12 c1
T c1
cnot a5 c1
T* c1
cnot a4 c1
cnot b12 c1
T* c1
cnot b13 c1
T c1
cnot a4 c1
T* c1
cnot a3 c1
cnot b13 c1
T* c1
cnot b14 c1
T c1
cnot a3 c1
T* c1
cnot a2 c1
cnot b14 c1
T* c1
cnot b15 c1
T c1
cnot a2 c1
T* c1
cnot a15 c1
cnot b15 c1
T* c1
cnot b2 c1
T c1
cnot a15 c1
T* c1
cnot a14 c1
cnot b2 c1
T* c1
cnot b3 c1
T c1
cnot a14 c1
T* c1
cnot a13 c1
cnot b3 c1
T* c1
cnot b4 c1
T c1
cnot a13 c1
T* c1
cnot a12 c1
cnot b4 c1
T* c1
cnot b5 c1
T c1
cnot a12 c1
T* c1
cnot a11 c1
cnot b5 c1
T* c1
cnot b6 c1
T c1
cnot a11 c1
T* c1
cnot a10 c1
cnot b6 c1
T* c1
cnot b7 c1
T c1
cnot a10 c1
T* c1
cnot a9 c1
cnot b7 c1
T* c1
cnot b8 c1
T c1
cnot a9 c1
T* c1
cnot a8 c1
cnot b8 c1
T* c1
cnot b9 c1
T c1
cnot a8 c1
T* c1
cnot b9 c1
H c1
T c2
Z c2
cnot a8 c2
T* c2
cnot b10 c2
T c2
cnot a8 c2
T* c2
cnot a7 c2
cnot b10 c2
T* c2
cnot b11 c2
T c2
cnot a7 c2
T* c2
cnot a6 c2
cnot b11 c2
T* c2
cnot b12 c2
T c2
cnot a6 c2
T* c2
cnot a5 c2
cnot b12 c2
T* c2
cnot b13 c2
T c2
cnot a5 c2
T* c2
cnot a4 c2
cnot b13 c2
T* c2
cnot b14 c2
T c2
cnot a4 c2
T* c2
cnot a3 c2
cnot b14 c2
T* c2
cnot b15 c2
T c2
cnot a3 c2
T* c2
cnot a15 c2
cnot b15 c2
T* c2
cnot b3 c2
T c2
cnot a15 c2
T* c2
cnot a14 c2
cnot b3 c2
T* c2
cnot b4 c2
T c2
cnot a14 c2
T* c2
cnot a13 c2
cnot b4 c2
T* c2
cnot b5 c2
T c2
cnot a13 c2
T* c2
cnot a12 c2
cnot b5 c2
T* c2
cnot b6 c2
T c2
cnot a12 c2
T* c2
cnot a11 c2
cnot b6 c2
T* c2
cnot b7 c2
T c2
cnot a11 c2
T* c2
cnot a10 c2
cnot b7 c2
T* c2
cnot b8 c2
T c2
cnot a10 c2
T* c2
cnot a9 c2
cnot b8 c2
T* c2
cnot b9 c2
T c2
cnot a9 c2
T* c2
cnot b9 c2
H c2
Z c3
cnot a9 c3
T* c3
cnot b10 c3
T c3
cnot a9 c3
T* c3
cnot a8 c3
cnot b10 c3
T* c3
cnot b11 c3
T c3
cnot a8 c3
T* c3
cnot a7 c3
cnot b11 c3
T* c3
cnot b12 c3
T c3
cnot a7 c3
T* c3
cnot a6 c3
cnot b12 c3
T* c3
cnot b13 c3
T c3
cnot a6 c3
T* c3
cnot a5 c3
cnot b13 c3
T* c3
cnot b14 c3
T c3
cnot a5 c3
T* c3
cnot a4 c3
cnot b14 c3
T* c3
cnot b15 c3
T c3
cnot a4 c3
T* c3
cnot a15 c3
cnot b15 c3
T* c3
cnot b4 c3
T c3
cnot a15 c3
T* c3
cnot a14 c3
cnot b4 c3
T* c3
cnot b5 c3
T c3
cnot a14 c3
T* c3
cnot a13 c3
cnot b5 c3
T* c3
cnot b6 c3
T c3
cnot a13 c3
T* c3
cnot a12 c3
cnot b6 c3
T* c3
cnot b7 c3
T c3
cnot a12 c3
T* c3
cnot a11 c3
cnot b7 c3
T* c3
cnot b8 c3
T c3
cnot a11 c3
T* c3
cnot a10 c3
cnot b8 c3
T* c3
cnot b9 c3
T c3
cnot a10 c3
T* c3
cnot b9 c3
H c3
T* c4
Z c4
cnot a10 c4
T* c4
cnot b10 c4
T c4
cnot a10 c4
T* c4
cnot a9 c4
cnot b10 c4
T* c4
cnot b11 c4
T c4
cnot a9 c4
T* c4
cnot a8 c4
cnot b11 c4
T* c4
cnot b12 c4
T c4
cnot a8 c4
T* c4
cnot a7 c4
cnot b12 c4
T* c4
cnot b13 c4
T c4
cnot a7 c4
T* c4
cnot a6 c4
cnot b13 c4
T* c4
cnot b14 c4
T c4
cnot a6 c4
T* c4
cnot a5 c4
cnot b14 c4
T* c4
cnot b15 c4
T c4
cnot a5 c4
T* c4
cnot a15 c4
cnot b15 c4
T* c4
cnot b5 c4
T c4
cnot a15 c4
T* c4
cnot a14 c4
cnot b5 c4
T* c4
cnot b6 c4
T c4
cnot a14 c4
T* c4
cnot a13 c4
cnot b6 c4
T* c4
cnot b7 c4
T c4
cnot a13 c4
T* c4
cnot a12 c4
cnot b7 c4
T* c4
cnot b8 c4
T c4
cnot a12 c4
T* c4
cnot a11 c4
cnot b8 c4
T* c4
cnot b9 c4
T c4
cnot a11 c4
T* c4
cnot b9 c4
H c4
S c5
cnot a11 c5
T* c5
cnot b10 c5
T c5
cnot a11 c5
T* c5
cnot a10 c5
cnot b10 c5
T* c5
cnot b11 c5
T c5
cnot a10 c5
T* c5
cnot a9 c5
cnot b11 c5
T* c5
cnot b12 c5
T c5
cnot a9 c5
T* c5
cnot a8 c5
cnot b12 c5
T* c5
cnot b13 c5
T c5
cnot a8 c5
T* c5
cnot a7 c5
cnot b13 c5
T* c5
cnot b14 c5
T c5
cnot a7 c5
T* c5
cnot a6 c5
cnot b14 c5
T* c5
cnot b15 c5
T c5
cnot a6 c5
T* c5
cnot a15 c5
cnot b15 c5
T* c5
cnot b6 c5
T c5
cnot a15 c5
T* c5
cnot a14 c5
cnot b6 c5
T* c5
cnot b7 c5
T c5
cnot a14 c5
T* c5
cnot a13 c5
cnot b7 c5
T* c5
cnot b8 c5
T c5
cnot a13 c5
T* c5
cnot a12 c5
cnot b8 c5
T* c5
cnot b9 c5
T c5
cnot a12 c5
T* c5
cnot b9 c5
H c5
T c6
cnot a12 c6
T* c6
cnot b10 c6
T c6
cnot a12 c6
T* c6
cnot a11 c6
cnot b10 c6
T* c6
cnot b11 c6
T c6
cnot a11 c6
T* c6
cnot a10 c6
cnot b11 c6
T* c6
cnot b12 c6
T c6
cnot a10 c6
T* c6
cnot a9 c6
cnot b12 c6
T* c6
cnot b13 c6
T c6
cnot a9 c6
T* c6
cnot a8 c6
cnot b13 c6
T* c6
cnot b14 c6
T c6
cnot a8 c6
T* c6
cnot a7 c6
cnot b14 c6
T* c6
cnot b15 c6
T c6
cnot a7 c6
T* c6
cnot a15 c6
cnot b15 c6
T* c6
cnot b7 c6
T c6
cnot a15 c6
T* c6
cnot a14 c6
cnot b7 c6
T* c6
cnot b8 c6
T c6
cnot a14 c6
T* c6
cnot a13 c6
cnot b8 c6
T* c6
cnot b9 c6
T c6
cnot a13 c6
T* c6
cnot b9 c6
H c6
cnot a13 c7
T* c7
cnot b10 c7
T c7
cnot a13 c7
T* c7
cnot a12 c7
cnot b10 c7
T* c7
cnot b11 c7
T c7
cnot a12 c7
T* c7
cnot a11 c7
cnot b11 c7
T* c7
cnot b12 c7
T c7
cnot a11 c7
T* c7
cnot a10 c7
cnot b12 c7
T* c7
cnot b13 c7
T c7
cnot a10 c7
T* c7
cnot a9 c7
cnot b13 c7
T* c7
cnot b14 c7
T c7
cnot a9 c7
T* c7
cnot a8 c7
cnot b14 c7
T* c7
cnot b15 c7
T c7
cnot a8 c7
T* c7
cnot a15 c7
cnot b15 c7
T* c7
cnot b8 c7
T c7
cnot a15 c7
T* c7
cnot a14 c7
cnot b8 c7
T* c7
cnot b9 c7
T c7
cnot a14 c7
T* c7
cnot b9 c7
H c7
T* c8
cnot a14 c8
T* c8
cnot b10 c8
T c8
cnot a14 c8
T* c8
cnot a13 c8
cnot b10 c8
T* c8
cnot b11 c8
T c8
cnot a13 c8
T* c8
cnot a12 c8
cnot b11 c8
T* c8
cnot b12 c8
T c8
cnot a12 c8
T* c8
cnot a11 c8
cnot b12 c8
T* c8
cnot b13 c8
T c8
cnot a11 c8
T* c8
cnot a10 c8
cnot b13 c8
T* c8
cnot b14 c8
T c8
cnot a10 c8
T* c8
cnot a9 c8
cnot b14 c8
T* c8
cnot b15 c8
T c8
cnot a9 c8
T* c8
cnot a15 c8
cnot b15 c8
T* c8
cnot b9 c8
T c8
cnot a15 c8
T* c8
cnot b9 c8
H c8
S* c9
cnot a15 c9
T* c9
cnot b10 c9
T c9
cnot a15 c9
T* c9
cnot a14 c9
cnot b10 c9
T* c9
cnot b11 c9
T c9
cnot a14 c9
T* c9
cnot a13 c9
cnot b11 c9
T* c9
cnot b12 c9
T c9
cnot a13 c9
T* c9
cnot a12 c9
cnot b12 c9
T* c9
cnot b13 c9
T c9
cnot a12 c9
T* c9
cnot a11 c9
cnot b13 c9
T* c9
cnot b14 c9
T c9
cnot a11 c9
T* c9
cnot a10 c9
cnot b14 c9
T* c9
cnot b15 c9
T c9
cnot a10 c9
T* c9
cnot b15 c9
H c9
T c10
Z c10
cnot a15 c10
T* c10
cnot b11 c10
T c10
cnot a15 c10
T* c10
cnot a14 c10
cnot b11 c10
T* c10
cnot b12 c10
T c10
cnot a14 c10
T* c10
cnot a13 c10
cnot b12 c10
T* c10
cnot b13 c10
T c10
cnot a13 c10
T* c10
cnot a12 c10
cnot b13 c10
T* c10
cnot b14 c10
T c10
cnot a12 c10
T* c10
cnot a11 c10
cnot b14 c10
T* c10
cnot b15 c10
T c10
cnot a11 c10
T* c10
cnot b15 c10
H c10
Z c11
cnot a15 c11
T* c11
cnot b12 c11
T c11
cnot a15 c11
T* c11
cnot a14 c11
cnot b12 c11
T* c11
cnot b13 c11
T c11
cnot a14 c11
T* c11
cnot a13 c11
cnot b13 c11
T* c11
cnot b14 c11
T c11
cnot a13 c11
T* c11
cnot a12 c11
cnot b14 c11
T* c11
cnot b15 c11
T c11
cnot a12 c11
T* c11
cnot b15 c11
H c11
T* c12
Z c12
cnot a15 c12
T* c12
cnot b13 c12
T c12
cnot a15 c12
T* c12
cnot a14 c12
cnot b13 c12
T* c12
cnot b14 c12
T c12
cnot a14 c12
T* c12
cnot a13 c12
cnot b14 c12
T* c12
cnot b15 c12
T c12
cnot a13 c12
T* c12
cnot b15 c12
H c12
S c13
cnot a15 c13
T* c13
cnot b14 c13
T c13
cnot a15 c13
T* c13
cnot a14 c13
cnot b14 c13
T* c13
cnot b15 c13
T c13
cnot a14 c13
T* c13
cnot b15 c13
H c13
T c14
cnot a15 c14
T* c14
cnot b15 c14
T c14
cnot a15 c14
T* c14
cnot b15 c14
H c14
cnot c11 c0
cnot c13 c0
cnot c14 c0
cnot c12 c1
cnot c14 c1
cnot c5 c10
cnot c6 c11
cnot c7 c10
cnot c9 c11
cnot c8 c10
cnot c8 c11
cnot c2 c13
cnot c3 c14
cnot c5 c12
cnot c8 c12
cnot c9 c12
cnot c5 c3
cnot c6 c3
cnot c7 c2
cnot c9 c2
cnot c9 c3
cnot c7 c9
cnot c6 c8
cnot c5 c8
cnot c5 c7
cnot c4 c7
cnot c4 c6
cnot c6 c9
cnot c3 c5
cnot c8 c2
cnot c2 c5
cnot c8 c15
swap c15 c8
cnot c2 c7
cnot c2 c4
cnot c3 c14
cnot c14 c5
cnot c14 c3
cnot c2 c13
cnot c13 c5
cnot c13 c15
cnot c12 c15
cnot c12 c14
cnot c3 c8
cnot c13 c7
cnot c3 c6
cnot c13 c4
cnot c13 c2
cnot c11 c13
cnot c10 c13
cnot c1 c6
cnot c1 c4
cnot c1 c3
cnot c10 c15
cnot c11 c14
cnot c10 c12
cnot c0 c5
cnot c0 c3
cnot c0 c2
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
H c10
H c11
H c12
H c13
H c14
H c15
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
T* c10
Z c10
cnot a10 c10
T* c10
cnot b0 c10
T c10
cnot a10 c10
T* c10
cnot a9 c10
cnot b0 c10
T* c10
cnot b1 c10
T c10
cnot a9 c10
T* c10
cnot a0 c10
cnot b1 c10
T* c10
cnot b10 c10
T c10
cnot a0 c10
T* c10
cnot a8 c10
cnot b10 c10
T* c10
cnot b2 c10
T c10
cnot a8 c10
T* c10
cnot a7 c10
cnot b2 c10
T* c10
cnot b3 c10
T c10
cnot a7 c10
T* c10
cnot a6 c10
cnot b3 c10
T* c10
cnot b4 c10
T c10
cnot a6 c10
T* c10
cnot a5 c10
cnot b4 c10
T* c10
cnot b5 c10
T c10
cnot a5 c10
T* c10
cnot a4 c10
cnot b5 c10
T* c10
cnot b6 c10
T c10
cnot a4 c10
T* c10
cnot a3 c10
cnot b6 c10
T* c10
cnot b7 c10
T c10
cnot a3 c10
T* c10
cnot a2 c10
cnot b7 c10
T* c10
cnot b8 c10
T c10
cnot a2 c10
T* c10
cnot a1 c10
cnot b8 c10
T* c10
cnot b9 c10
T c10
cnot a1 c10
T* c10
cnot b9 c10
H c10
Z c11
cnot a11 c11
T* c11
cnot b0 c11
T c11
cnot a11 c11
T* c11
cnot a10 c11
cnot b0 c11
T* c11
cnot b1 c11
T c11
cnot a10 c11
T* c11
cnot a1 c11
cnot b1 c11
T* c11
cnot b10 c11
T c11
cnot a1 c11
T* c11
cnot a0 c11
cnot b10 c11
T* c11
cnot b11 c11
T c11
cnot a0 c11
T* c11
cnot a9 c11
cnot b11 c11
T* c11
cnot b2 c11
T c11
cnot a9 c11
T* c11
cnot a8 c11
cnot b2 c11
T* c11
cnot b3 c11
T c11
cnot a8 c11
T* c11
cnot a7 c11
cnot b3 c11
T* c11
cnot b4 c11
T c11
cnot a7 c11
T* c11
cnot a6 c11
cnot b4 c11
T* c11
cnot b5 c11
T c11
cnot a6 c11
T* c11
cnot a5 c11
cnot b5 c11
T* c11
cnot b6 c11
T c11
cnot a5 c11
T* c11
cnot a4 c11
cnot b6 c11
T* c11
cnot b7 c11
T c11
cnot a4 c11
T* c11
cnot a3 c11
cnot b7 c11
T* c11
cnot b8 c11
T c11
cnot a3 c11
T* c11
cnot a2 c11
cnot b8 c11
T* c11
cnot b9 c11
T c11
cnot a2 c11
T* c11
cnot b9 c11
H c11
T c12
Z c12
cnot a12 c12
T* c12
cnot b0 c12
T c12
cnot a12 c12
T* c12
cnot a11 c12
cnot b0 c12
T* c12
cnot b1 c12
T c12
cnot a11 c12
T* c12
cnot a2 c12
cnot b1 c12
T* c12
cnot b10 c12
T c12
cnot a2 c12
T* c12
cnot a1 c12
cnot b10 c12
T* c12
cnot b11 c12
T c12
cnot a1 c12
T* c12
cnot a0 c12
cnot b11 c12
T* c12
cnot b12 c12
T c12
cnot a0 c12
T* c12
cnot a10 c12
cnot b12 c12
T* c12
cnot b2 c12
T c12
cnot a10 c12
T* c12
cnot a9 c12
cnot b2 c12
T* c12
cnot b3 c12
T c12
cnot a9 c12
T* c12
cnot a8 c12
cnot b3 c12
T* c12
cnot b4 c12
T c12
cnot a8 c12
T* c12
cnot a7 c12
cnot b4 c12
T* c12
cnot b5 c12
T c12
cnot a7 c12
T* c12
cnot a6 c12
cnot b5 c12
T* c12
cnot b6 c12
T c12
cnot a6 c12
T* c12
cnot a5 c12
cnot b6 c12
T* c12
cnot b7 c12
T c12
cnot a5 c12
T* c12
cnot a4 c12
cnot b7 c12
T* c12
cnot b8 c12
T c12
cnot a4 c12
T* c12
cnot a3 c12
cnot b8 c12
T* c12
cnot b9 c12
T c12
cnot a3 c12
T* c12
cnot b9 c12
H c12
S* c13
cnot a13 c13
T* c13
cnot b0 c13
T c13
cnot a13 c13
T* c13
cnot a12 c13
cnot b0 c13
T* c13
cnot b1 c13
T c13
cnot a12 c13
T* c13
cnot a3 c13
cnot b1 c13
T* c13
cnot b10 c13
T c13
cnot a3 c13
T* c13
cnot a2 c13
cnot b10 c13
T* c13
cnot b11 c13
T c13
cnot a2 c13
T* c13
cnot a1 c13
cnot b11 c13
T* c13
cnot b12 c13
T c13
cnot a1 c13
T* c13
cnot a0 c13
cnot b12 c13
T* c13
cnot b13 c13
T c13
cnot a0 c13
T* c13
cnot a11 c13
cnot b13 c13
T* c13
cnot b2 c13
T c13
cnot a11 c13
T* c13
cnot a10 c13
cnot b2 c13
T* c13
cnot b3 c13
T c13
cnot a10 c13
T* c13
cnot a9 c13
cnot b3 c13
T* c13
cnot b4 c13
T c13
cnot a9 c13
T* c13
cnot a8 c13
cnot b4 c13
T* c13
cnot b5 c13
T c13
cnot a8 c13
T* c13
cnot a7 c13
cnot b5 c13
T* c13
cnot b6 c13
T c13
cnot a7 c13
T* c13
cnot a6 c13
cnot b6 c13
T* c13
cnot b7 c13
T c13
cnot a6 c13
T* c13
cnot a5 c13
cnot b7 c13
T* c13
cnot b8 c13
T c13
cnot a5 c13
T* c13
cnot a4 c13
cnot b8 c13
T* c13
cnot b9 c13
T c13
cnot a4 c13
T* c13
cnot b9 c13
H c13
T* c14
cnot a14 c14
T* c14
cnot b0 c14
T c14
cnot a14 c14
T* c14
cnot a13 c14
cnot b0 c14
T* c14
cnot b1 c14
T c14
cnot a13 c14
T* c14
cnot a4 c14
cnot b1 c14
T* c14
cnot b10 c14
T c14
cnot a4 c14
T* c14
cnot a3 c14
cnot b10 c14
T* c14
cnot b11 c14
T c14
cnot a3 c14
T* c14
cnot a2 c14
cnot b11 c14
T* c14
cnot b12 c14
T c14
cnot a2 c14
T* c14
cnot a1 c14
cnot b12 c14
T* c14
cnot b13 c14
T c14
cnot a1 c14
T* c14
cnot a0 c14
cnot b13 c14
T* c14
cnot b14 c14
T c14
cnot a0 c14
T* c14
cnot a12 c14
cnot b14 c14
T* c14
cnot b2 c14
T c14
cnot a12 c14
T* c14
cnot a11 c14
cnot b2 c14
T* c14
cnot b3 c14
T c14
cnot a11 c14
T* c14
cnot a10 c14
cnot b3 c14
T* c14
cnot b4 c14
T c14
cnot a10 c14
T* c14
cnot a9 c14
cnot b4 c14
T* c14
cnot b5 c14
T c14
cnot a9 c14
T* c14
cnot a8 c14
cnot b5 c14
T* c14
cnot b6 c14
T c14
cnot a8 c14
T* c14
cnot a7 c14
cnot b6 c14
T* c14
cnot b7 c14
T c14
cnot a7 c14
T* c14
cnot a6 c14
cnot b7 c14
T* c14
cnot b8 c14
T c14
cnot a6 c14
T* c14
cnot a5 c14
cnot b8 c14
T* c14
cnot b9 c14
T c14
cnot a5 c14
T* c14
cnot b9 c14
H c14
cnot a15 c15
T* c15
cnot b0 c15
T c15
cnot a15 c15
T* c15
cnot a14 c15
cnot b0 c15
T* c15
cnot b1 c15
T c15
cnot a14 c15
T* c15
cnot a5 c15
cnot b1 c15
T* c15
cnot b10 c15
T c15
cnot a5 c15
T* c15
cnot a4 c15
cnot b10 c15
T* c15
cnot b11 c15
T c15
cnot a4 c15
T* c15
cnot a3 c15
cnot b11 c15
T* c15
cnot b12 c15
T c15
cnot a3 c15
T* c15
cnot a2 c15
cnot b12 c15
T* c15
cnot b13 c15
T c15
cnot a2 c15
T* c15
cnot a1 c15
cnot b13 c15
T* c15
cnot b14 c15
T c15
cnot a1 c15
T* c15
cnot a0 c15
cnot b14 c15
T* c15
cnot b15 c15
T c15
cnot a0 c15
T* c15
cnot a13 c15
cnot b15 c15
T* c15
cnot b2 c15
T c15
cnot a13 c15
T* c15
cnot a12 c15
cnot b2 c15
T* c15
cnot b3 c15
T c15
cnot a12 c15
T* c15
cnot a11 c15
cnot b3 c15
T* c15
cnot b4 c15
T c15
cnot a11 c15
T* c15
cnot a10 c15
cnot b4 c15
T* c15
cnot b5 c15
T c15
cnot a10 c15
T* c15
cnot a9 c15
cnot b5 c15
T* c15
cnot b6 c15
T c15
cnot a9 c15
T* c15
cnot a8 c15
cnot b6 c15
T* c15
cnot b7 c15
T c15
cnot a8 c15
T* c15
cnot a7 c15
cnot b7 c15
T* c15
cnot b8 c15
T c15
cnot a7 c15
T* c15
cnot a6 c15
cnot b8 c15
T* c15
cnot b9 c15
T c15
cnot a6 c15
T* c15
cnot b9 c15
H c15
cnot a0 b0
T* b0
cnot a1 b0
cnot a0 b0
T* b0
cnot a0 b1
T* b1
cnot a1 b1
cnot a0 b1
T* b1
cnot b0 a10
cnot a1 a10
T* a10
cnot b1 a10
cnot b0 a10
T* a10
cnot a0 b10
T* b10
cnot a1 b10
cnot a0 b10
T* b10
cnot b1 b10
cnot a10 b10
T* b10
cnot b0 a11
cnot a1 a11
T* a11
cnot b1 a11
cnot b0 a11
T* a11
cnot b10 a11
cnot a10 a11
T* a11
cnot a0 b11
T* b11
cnot a1 b11
cnot a0 b11
T* b11
cnot b1 b11
cnot a10 b11
T* b11
cnot b10 b11
cnot a11 b11
T* b11
cnot b0 a12
cnot a1 a12
T* a12
cnot b1 a12
cnot b0 a12
T* a12
cnot b10 a12
cnot a10 a12
T* a12
cnot b11 a12
cnot a11 a12
T* a12
cnot a0 b12
T* b12
cnot a1 b12
cnot a0 b12
T* b12
cnot b1 b12
cnot a10 b12
T* b12
cnot b10 b12
cnot a11 b12
T* b12
cnot b11 b12
cnot a12 b12
T* b12
cnot b0 a13
cnot a1 a13
T* a13
cnot b1 a13
cnot b0 a13
T* a13
cnot b10 a13
cnot a10 a13
T* a13
cnot b11 a13
cnot a11 a13
T* a13
cnot b12 a13
cnot a12 a13
T* a13
cnot a0 b13
T* b13
cnot a1 b13
cnot a0 b13
T* b13
cnot b1 b13
cnot a10 b13
T* b13
cnot b10 b13
cnot a11 b13
T* b13
cnot b11 b13
cnot a12 b13
T* b13
cnot b12 b13
cnot a13 b13
T* b13
cnot b0 a14
cnot a1 a14
T* a14
cnot b1 a14
cnot b0 a14
T* a14
cnot b10 a14
cnot a10 a14
T* a14
cnot b11 a14
cnot a11 a14
T* a14
cnot b12 a14
cnot a12 a14
T* a14
cnot b13 a14
cnot a13 a14
T* a14
cnot a0 b14
T* b14
cnot a1 b14
cnot a0 b14
T* b14
cnot b1 b14
cnot a10 b14
T* b14
cnot b10 b14
cnot a11 b14
T* b14
cnot b11 b14
cnot a12 b14
T* b14
cnot b12 b14
cnot a13 b14
T* b14
cnot b13 b14
cnot a14 b14
T* b14
cnot b0 a15
cnot a1 a15
T* a15
cnot b1 a15
cnot b0 a15
T* a15
cnot b10 a15
cnot a10 a15
T* a15
cnot b11 a15
cnot a11 a15
T* a15
cnot b12 a15
cnot a12 a15
T* a15
cnot b13 a15
cnot a13 a15
T* a15
cnot b14 a15
cnot a14 a15
T* a15
cnot a0 b15
T* b15
cnot a1 b15
cnot a0 b15
T* b15
cnot b1 b15
cnot a10 b15
T* b15
cnot b10 b15
cnot a11 b15
T* b15
cnot b11 b15
cnot a12 b15
T* b15
cnot b12 b15
cnot a13 b15
T* b15
cnot b13 b15
cnot a14 b15
T* b15
cnot b14 b15
cnot a15 b15
T* b15
cnot b0 a2
cnot a1 a2
T* a2
cnot b1 a2
cnot b0 a2
T* a2
cnot b10 a2
cnot a10 a2
T* a2
cnot b11 a2
cnot a11 a2
T* a2
cnot b12 a2
cnot a12 a2
T* a2
cnot b13 a2
cnot a13 a2
T* a2
cnot b14 a2
cnot a14 a2
T* a2
cnot b15 a2
cnot a15 a2
T* a2
cnot a0 b2
T* b2
cnot a1 b2
cnot a0 b2
T* b2
cnot b1 b2
cnot a10 b2
T* b2
cnot b10 b2
cnot a11 b2
T* b2
cnot b11 b2
cnot a12 b2
T* b2
cnot b12 b2
cnot a13 b2
T* b2
cnot b13 b2
cnot a14 b2
T* b2
cnot b14 b2
cnot a15 b2
T* b2
cnot b15 b2
cnot a2 b2
T* b2
cnot b0 a3
cnot a1 a3
T* a3
cnot b1 a3
cnot b0 a3
T* a3
cnot b10 a3
cnot a10 a3
T* a3
cnot b11 a3
cnot a11 a3
T* a3
cnot b12 a3
cnot a12 a3
T* a3
cnot b13 a3
cnot a13 a3
T* a3
cnot b14 a3
cnot a14 a3
T* a3
cnot b15 a3
cnot a15 a3
T* a3
cnot b2 a3
cnot a2 a3
T* a3
cnot a0 b3
T* b3
cnot a1 b3
cnot a0 b3
T* b3
cnot b1 b3
cnot a10 b3
T* b3
cnot b10 b3
cnot a11 b3
T* b3
cnot b11 b3
cnot a12 b3
T* b3
cnot b12 b3
cnot a13 b3
T* b3
cnot b13 b3
cnot a14 b3
T* b3
cnot b14 b3
cnot a15 b3
T* b3
cnot b15 b3
cnot a2 b3
T* b3
cnot b2 b3
cnot a3 b3
T* b3
cnot b0 a4
cnot a1 a4
T* a4
cnot b1 a4
cnot b0 a4
T* a4
cnot b10 a4
cnot a10 a4
T* a4
cnot b11 a4
cnot a11 a4
T* a4
cnot b12 a4
cnot a12 a4
T* a4
cnot b13 a4
cnot a13 a4
T* a4
cnot b14 a4
cnot a14 a4
T* a4
cnot b15 a4
cnot a15 a4
T* a4
cnot b2 a4
cnot a2 a4
T* a4
cnot b3 a4
cnot a3 a4
T* a4
cnot a0 b4
T* b4
cnot a1 b4
cnot a0 b4
T* b4
cnot b1 b4
cnot a10 b4
T* b4
cnot b10 b4
cnot a11 b4
T* b4
cnot b11 b4
cnot a12 b4
T* b4
cnot b12 b4
cnot a13 b4
T* b4
cnot b13 b4
cnot a14 b4
T* b4
cnot b14 b4
cnot a15 b4
T* b4
cnot b15 b4
cnot a2 b4
T* b4
cnot b2 b4
cnot a3 b4
T* b4
cnot b3 b4
cnot a4 b4
T* b4
cnot b0 a5
cnot a1 a5
T* a5
cnot b1 a5
cnot b0 a5
T* a5
cnot b10 a5
cnot a10 a5
T* a5
cnot b11 a5
cnot a11 a5
T* a5
cnot b12 a5
cnot a12 a5
T* a5
cnot b13 a5
cnot a13 a5
T* a5
cnot b14 a5
cnot a14 a5
T* a5
cnot b15 a5
cnot a15 a5
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
cnot a0 b5
T* b5
cnot a1 b5
cnot a0 b5
T* b5
cnot b1 b5
cnot a10 b5
T* b5
cnot b10 b5
cnot a11 b5
T* b5
cnot b11 b5
cnot a12 b5
T* b5
cnot b12 b5
cnot a13 b5
T* b5
cnot b13 b5
cnot a14 b5
T* b5
cnot b14 b5
cnot a15 b5
T* b5
cnot b15 b5
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
cnot b0 a6
cnot a1 a6
T* a6
cnot b1 a6
cnot b0 a6
T* a6
cnot b10 a6
cnot a10 a6
T* a6
cnot b11 a6
cnot a11 a6
T* a6
cnot b12 a6
cnot a12 a6
T* a6
cnot b13 a6
cnot a13 a6
T* a6
cnot b14 a6
cnot a14 a6
T* a6
cnot b15 a6
cnot a15 a6
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
cnot a0 b6
T* b6
cnot a1 b6
cnot a0 b6
T* b6
cnot b1 b6
cnot a10 b6
T* b6
cnot b10 b6
cnot a11 b6
T* b6
cnot b11 b6
cnot a12 b6
T* b6
cnot b12 b6
cnot a13 b6
T* b6
cnot b13 b6
cnot a14 b6
T* b6
cnot b14 b6
cnot a15 b6
T* b6
cnot b15 b6
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
cnot b0 a7
cnot a1 a7
T* a7
cnot b1 a7
cnot b0 a7
T* a7
cnot b10 a7
cnot a10 a7
T* a7
cnot b11 a7
cnot a11 a7
T* a7
cnot b12 a7
cnot a12 a7
T* a7
cnot b13 a7
cnot a13 a7
T* a7
cnot b14 a7
cnot a14 a7
T* a7
cnot b15 a7
cnot a15 a7
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
cnot a0 b7
T* b7
cnot a1 b7
cnot a0 b7
T* b7
cnot b1 b7
cnot a10 b7
T* b7
cnot b10 b7
cnot a11 b7
T* b7
cnot b11 b7
cnot a12 b7
T* b7
cnot b12 b7
cnot a13 b7
T* b7
cnot b13 b7
cnot a14 b7
T* b7
cnot b14 b7
cnot a15 b7
T* b7
cnot b15 b7
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
cnot b0 a8
cnot a1 a8
T* a8
cnot b1 a8
cnot b0 a8
T* a8
cnot b10 a8
cnot a10 a8
T* a8
cnot b11 a8
cnot a11 a8
T* a8
cnot b12 a8
cnot a12 a8
T* a8
cnot b13 a8
cnot a13 a8
T* a8
cnot b14 a8
cnot a14 a8
T* a8
cnot b15 a8
cnot a15 a8
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
cnot a0 b8
T* b8
cnot a1 b8
cnot a0 b8
T* b8
cnot b1 b8
cnot a10 b8
T* b8
cnot b10 b8
cnot a11 b8
T* b8
cnot b11 b8
cnot a12 b8
T* b8
cnot b12 b8
cnot a13 b8
T* b8
cnot b13 b8
cnot a14 b8
T* b8
cnot b14 b8
cnot a15 b8
T* b8
cnot b15 b8
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
cnot b0 a9
cnot a1 a9
T* a9
cnot b1 a9
cnot b0 a9
T* a9
cnot b10 a9
cnot a10 a9
T* a9
cnot b11 a9
cnot a11 a9
T* a9
cnot b12 a9
cnot a12 a9
T* a9
cnot b13 a9
cnot a13 a9
T* a9
cnot b14 a9
cnot a14 a9
T* a9
cnot b15 a9
cnot a15 a9
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
cnot a0 b9
T* b9
cnot a1 b9
cnot a0 b9
T* b9
cnot b1 b9
cnot a10 b9
T* b9
cnot b10 b9
cnot a11 b9
T* b9
cnot b11 b9
cnot a12 b9
T* b9
cnot b12 b9
cnot a13 b9
T* b9
cnot b13 b9
cnot a14 b9
T* b9
cnot b14 b9
cnot a15 b9
T* b9
cnot b15 b9
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
cnot b1 a10
cnot b10 a11
cnot b11 a12
cnot b12 a13
cnot b13 a14
cnot b14 a15
cnot b15 a2
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
cnot a15 a2
cnot a14 a2
cnot a14 a15
cnot a2 b9
cnot a2 b8
cnot a2 b7
cnot a2 b6
cnot a2 b5
cnot a2 b4
cnot a2 b3
cnot a2 b2
cnot a15 b15
cnot a14 b14
cnot a2 a9
cnot a2 a8
cnot a2 a7
cnot a2 a6
cnot a2 a5
cnot a2 a4
cnot a2 a3
cnot a12 a13
cnot a11 a13
cnot a11 a12
cnot a13 b9
cnot a13 b8
cnot a13 b7
cnot a13 b6
cnot a13 b5
cnot a13 b4
cnot a13 b3
cnot a13 b2
cnot a13 b15
cnot a13 b14
cnot a13 b13
cnot a12 b12
cnot a11 b11
cnot a13 a9
cnot a13 a8
cnot a13 a7
cnot a13 a6
cnot a13 a5
cnot a13 a4
cnot a13 a3
cnot a13 a2
cnot a13 a15
cnot a13 a14
cnot a1 a10
cnot a10 b9
cnot a10 b8
cnot a10 b7
cnot a10 b6
cnot a10 b5
cnot a10 b4
cnot a10 b3
cnot a10 b2
cnot a10 b15
cnot a10 b14
cnot a10 b13
cnot a10 b12
cnot a10 b11
cnot a10 b10
cnot a1 b1
cnot a1 b0
cnot a10 a9
cnot a10 a8
cnot a10 a7
cnot a10 a6
cnot a10 a5
cnot a10 a4
cnot a10 a3
cnot a10 a2
cnot a10 a15
cnot a10 a14
cnot a10 a13
cnot a10 a12
cnot a10 a11
END
