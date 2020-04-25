# Feynman -- quantum circuit toolkit
# Original (gf2^32_mult.qc):
#   Qubits: 96
#   H: 126
#   T: 7168
#   cnot: 7292
#   Depth: 1001
#   T depth: 372
# Result (8894.228ms):
#   Qubits: 96
#   H: 126
#   S: 16
#   T: 4128
#   Z: 24
#   cnot: 6636
#   swap: 6
#   Depth: 5399
#   T depth: 2190
.v a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31
.i a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31
.o c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31
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
H c15
H c16
H c17
H c18
H c19
H c20
H c21
H c22
H c23
H c24
H c25
H c26
H c27
H c28
H c29
H c30
T* c0
cnot a31 c0
T* c0
cnot b1 c0
T c0
cnot a31 c0
T* c0
cnot a22 c0
cnot b1 c0
T* c0
cnot b10 c0
T c0
cnot a22 c0
T* c0
cnot a21 c0
cnot b10 c0
T* c0
cnot b11 c0
T c0
cnot a21 c0
T* c0
cnot a20 c0
cnot b11 c0
T* c0
cnot b12 c0
T c0
cnot a20 c0
T* c0
cnot a19 c0
cnot b12 c0
T* c0
cnot b13 c0
T c0
cnot a19 c0
T* c0
cnot a18 c0
cnot b13 c0
T* c0
cnot b14 c0
T c0
cnot a18 c0
T* c0
cnot a17 c0
cnot b14 c0
T* c0
cnot b15 c0
T c0
cnot a17 c0
T* c0
cnot a16 c0
cnot b15 c0
T* c0
cnot b16 c0
T c0
cnot a16 c0
T* c0
cnot a15 c0
cnot b16 c0
T* c0
cnot b17 c0
T c0
cnot a15 c0
T* c0
cnot a14 c0
cnot b17 c0
T* c0
cnot b18 c0
T c0
cnot a14 c0
T* c0
cnot a13 c0
cnot b18 c0
T* c0
cnot b19 c0
T c0
cnot a13 c0
T* c0
cnot a30 c0
cnot b19 c0
T* c0
cnot b2 c0
T c0
cnot a30 c0
T* c0
cnot a12 c0
cnot b2 c0
T* c0
cnot b20 c0
T c0
cnot a12 c0
T* c0
cnot a11 c0
cnot b20 c0
T* c0
cnot b21 c0
T c0
cnot a11 c0
T* c0
cnot a10 c0
cnot b21 c0
T* c0
cnot b22 c0
T c0
cnot a10 c0
T* c0
cnot a9 c0
cnot b22 c0
T* c0
cnot b23 c0
T c0
cnot a9 c0
T* c0
cnot a8 c0
cnot b23 c0
T* c0
cnot b24 c0
T c0
cnot a8 c0
T* c0
cnot a7 c0
cnot b24 c0
T* c0
cnot b25 c0
T c0
cnot a7 c0
T* c0
cnot a6 c0
cnot b25 c0
T* c0
cnot b26 c0
T c0
cnot a6 c0
T* c0
cnot a5 c0
cnot b26 c0
T* c0
cnot b27 c0
T c0
cnot a5 c0
T* c0
cnot a4 c0
cnot b27 c0
T* c0
cnot b28 c0
T c0
cnot a4 c0
T* c0
cnot a3 c0
cnot b28 c0
T* c0
cnot b29 c0
T c0
cnot a3 c0
T* c0
cnot a29 c0
cnot b29 c0
T* c0
cnot b3 c0
T c0
cnot a29 c0
T* c0
cnot a2 c0
cnot b3 c0
T* c0
cnot b30 c0
T c0
cnot a2 c0
T* c0
cnot a1 c0
cnot b30 c0
T* c0
cnot b31 c0
T c0
cnot a1 c0
T* c0
cnot a28 c0
cnot b31 c0
T* c0
cnot b4 c0
T c0
cnot a28 c0
T* c0
cnot a27 c0
cnot b4 c0
T* c0
cnot b5 c0
T c0
cnot a27 c0
T* c0
cnot a26 c0
cnot b5 c0
T* c0
cnot b6 c0
T c0
cnot a26 c0
T* c0
cnot a25 c0
cnot b6 c0
T* c0
cnot b7 c0
T c0
cnot a25 c0
T* c0
cnot a24 c0
cnot b7 c0
T* c0
cnot b8 c0
T c0
cnot a24 c0
T* c0
cnot a23 c0
cnot b8 c0
T* c0
cnot b9 c0
T c0
cnot a23 c0
T* c0
cnot b9 c0
H c0
S* c1
cnot a23 c1
T* c1
cnot b10 c1
T c1
cnot a23 c1
T* c1
cnot a22 c1
cnot b10 c1
T* c1
cnot b11 c1
T c1
cnot a22 c1
T* c1
cnot a21 c1
cnot b11 c1
T* c1
cnot b12 c1
T c1
cnot a21 c1
T* c1
cnot a20 c1
cnot b12 c1
T* c1
cnot b13 c1
T c1
cnot a20 c1
T* c1
cnot a19 c1
cnot b13 c1
T* c1
cnot b14 c1
T c1
cnot a19 c1
T* c1
cnot a18 c1
cnot b14 c1
T* c1
cnot b15 c1
T c1
cnot a18 c1
T* c1
cnot a17 c1
cnot b15 c1
T* c1
cnot b16 c1
T c1
cnot a17 c1
T* c1
cnot a16 c1
cnot b16 c1
T* c1
cnot b17 c1
T c1
cnot a16 c1
T* c1
cnot a15 c1
cnot b17 c1
T* c1
cnot b18 c1
T c1
cnot a15 c1
T* c1
cnot a14 c1
cnot b18 c1
T* c1
cnot b19 c1
T c1
cnot a14 c1
T* c1
cnot a31 c1
cnot b19 c1
T* c1
cnot b2 c1
T c1
cnot a31 c1
T* c1
cnot a13 c1
cnot b2 c1
T* c1
cnot b20 c1
T c1
cnot a13 c1
T* c1
cnot a12 c1
cnot b20 c1
T* c1
cnot b21 c1
T c1
cnot a12 c1
T* c1
cnot a11 c1
cnot b21 c1
T* c1
cnot b22 c1
T c1
cnot a11 c1
T* c1
cnot a10 c1
cnot b22 c1
T* c1
cnot b23 c1
T c1
cnot a10 c1
T* c1
cnot a9 c1
cnot b23 c1
T* c1
cnot b24 c1
T c1
cnot a9 c1
T* c1
cnot a8 c1
cnot b24 c1
T* c1
cnot b25 c1
T c1
cnot a8 c1
T* c1
cnot a7 c1
cnot b25 c1
T* c1
cnot b26 c1
T c1
cnot a7 c1
T* c1
cnot a6 c1
cnot b26 c1
T* c1
cnot b27 c1
T c1
cnot a6 c1
T* c1
cnot a5 c1
cnot b27 c1
T* c1
cnot b28 c1
T c1
cnot a5 c1
T* c1
cnot a4 c1
cnot b28 c1
T* c1
cnot b29 c1
T c1
cnot a4 c1
T* c1
cnot a30 c1
cnot b29 c1
T* c1
cnot b3 c1
T c1
cnot a30 c1
T* c1
cnot a3 c1
cnot b3 c1
T* c1
cnot b30 c1
T c1
cnot a3 c1
T* c1
cnot a2 c1
cnot b30 c1
T* c1
cnot b31 c1
T c1
cnot a2 c1
T* c1
cnot a29 c1
cnot b31 c1
T* c1
cnot b4 c1
T c1
cnot a29 c1
T* c1
cnot a28 c1
cnot b4 c1
T* c1
cnot b5 c1
T c1
cnot a28 c1
T* c1
cnot a27 c1
cnot b5 c1
T* c1
cnot b6 c1
T c1
cnot a27 c1
T* c1
cnot a26 c1
cnot b6 c1
T* c1
cnot b7 c1
T c1
cnot a26 c1
T* c1
cnot a25 c1
cnot b7 c1
T* c1
cnot b8 c1
T c1
cnot a25 c1
T* c1
cnot a24 c1
cnot b8 c1
T* c1
cnot b9 c1
T c1
cnot a24 c1
T* c1
cnot b9 c1
H c1
T c2
Z c2
cnot a24 c2
T* c2
cnot b10 c2
T c2
cnot a24 c2
T* c2
cnot a23 c2
cnot b10 c2
T* c2
cnot b11 c2
T c2
cnot a23 c2
T* c2
cnot a22 c2
cnot b11 c2
T* c2
cnot b12 c2
T c2
cnot a22 c2
T* c2
cnot a21 c2
cnot b12 c2
T* c2
cnot b13 c2
T c2
cnot a21 c2
T* c2
cnot a20 c2
cnot b13 c2
T* c2
cnot b14 c2
T c2
cnot a20 c2
T* c2
cnot a19 c2
cnot b14 c2
T* c2
cnot b15 c2
T c2
cnot a19 c2
T* c2
cnot a18 c2
cnot b15 c2
T* c2
cnot b16 c2
T c2
cnot a18 c2
T* c2
cnot a17 c2
cnot b16 c2
T* c2
cnot b17 c2
T c2
cnot a17 c2
T* c2
cnot a16 c2
cnot b17 c2
T* c2
cnot b18 c2
T c2
cnot a16 c2
T* c2
cnot a15 c2
cnot b18 c2
T* c2
cnot b19 c2
T c2
cnot a15 c2
T* c2
cnot a14 c2
cnot b19 c2
T* c2
cnot b20 c2
T c2
cnot a14 c2
T* c2
cnot a13 c2
cnot b20 c2
T* c2
cnot b21 c2
T c2
cnot a13 c2
T* c2
cnot a12 c2
cnot b21 c2
T* c2
cnot b22 c2
T c2
cnot a12 c2
T* c2
cnot a11 c2
cnot b22 c2
T* c2
cnot b23 c2
T c2
cnot a11 c2
T* c2
cnot a10 c2
cnot b23 c2
T* c2
cnot b24 c2
T c2
cnot a10 c2
T* c2
cnot a9 c2
cnot b24 c2
T* c2
cnot b25 c2
T c2
cnot a9 c2
T* c2
cnot a8 c2
cnot b25 c2
T* c2
cnot b26 c2
T c2
cnot a8 c2
T* c2
cnot a7 c2
cnot b26 c2
T* c2
cnot b27 c2
T c2
cnot a7 c2
T* c2
cnot a6 c2
cnot b27 c2
T* c2
cnot b28 c2
T c2
cnot a6 c2
T* c2
cnot a5 c2
cnot b28 c2
T* c2
cnot b29 c2
T c2
cnot a5 c2
T* c2
cnot a31 c2
cnot b29 c2
T* c2
cnot b3 c2
T c2
cnot a31 c2
T* c2
cnot a4 c2
cnot b3 c2
T* c2
cnot b30 c2
T c2
cnot a4 c2
T* c2
cnot a3 c2
cnot b30 c2
T* c2
cnot b31 c2
T c2
cnot a3 c2
T* c2
cnot a30 c2
cnot b31 c2
T* c2
cnot b4 c2
T c2
cnot a30 c2
T* c2
cnot a29 c2
cnot b4 c2
T* c2
cnot b5 c2
T c2
cnot a29 c2
T* c2
cnot a28 c2
cnot b5 c2
T* c2
cnot b6 c2
T c2
cnot a28 c2
T* c2
cnot a27 c2
cnot b6 c2
T* c2
cnot b7 c2
T c2
cnot a27 c2
T* c2
cnot a26 c2
cnot b7 c2
T* c2
cnot b8 c2
T c2
cnot a26 c2
T* c2
cnot a25 c2
cnot b8 c2
T* c2
cnot b9 c2
T c2
cnot a25 c2
T* c2
cnot b9 c2
H c2
Z c3
cnot a25 c3
T* c3
cnot b10 c3
T c3
cnot a25 c3
T* c3
cnot a24 c3
cnot b10 c3
T* c3
cnot b11 c3
T c3
cnot a24 c3
T* c3
cnot a23 c3
cnot b11 c3
T* c3
cnot b12 c3
T c3
cnot a23 c3
T* c3
cnot a22 c3
cnot b12 c3
T* c3
cnot b13 c3
T c3
cnot a22 c3
T* c3
cnot a21 c3
cnot b13 c3
T* c3
cnot b14 c3
T c3
cnot a21 c3
T* c3
cnot a20 c3
cnot b14 c3
T* c3
cnot b15 c3
T c3
cnot a20 c3
T* c3
cnot a19 c3
cnot b15 c3
T* c3
cnot b16 c3
T c3
cnot a19 c3
T* c3
cnot a18 c3
cnot b16 c3
T* c3
cnot b17 c3
T c3
cnot a18 c3
T* c3
cnot a17 c3
cnot b17 c3
T* c3
cnot b18 c3
T c3
cnot a17 c3
T* c3
cnot a16 c3
cnot b18 c3
T* c3
cnot b19 c3
T c3
cnot a16 c3
T* c3
cnot a15 c3
cnot b19 c3
T* c3
cnot b20 c3
T c3
cnot a15 c3
T* c3
cnot a14 c3
cnot b20 c3
T* c3
cnot b21 c3
T c3
cnot a14 c3
T* c3
cnot a13 c3
cnot b21 c3
T* c3
cnot b22 c3
T c3
cnot a13 c3
T* c3
cnot a12 c3
cnot b22 c3
T* c3
cnot b23 c3
T c3
cnot a12 c3
T* c3
cnot a11 c3
cnot b23 c3
T* c3
cnot b24 c3
T c3
cnot a11 c3
T* c3
cnot a10 c3
cnot b24 c3
T* c3
cnot b25 c3
T c3
cnot a10 c3
T* c3
cnot a9 c3
cnot b25 c3
T* c3
cnot b26 c3
T c3
cnot a9 c3
T* c3
cnot a8 c3
cnot b26 c3
T* c3
cnot b27 c3
T c3
cnot a8 c3
T* c3
cnot a7 c3
cnot b27 c3
T* c3
cnot b28 c3
T c3
cnot a7 c3
T* c3
cnot a6 c3
cnot b28 c3
T* c3
cnot b29 c3
T c3
cnot a6 c3
T* c3
cnot a5 c3
cnot b29 c3
T* c3
cnot b30 c3
T c3
cnot a5 c3
T* c3
cnot a4 c3
cnot b30 c3
T* c3
cnot b31 c3
T c3
cnot a4 c3
T* c3
cnot a31 c3
cnot b31 c3
T* c3
cnot b4 c3
T c3
cnot a31 c3
T* c3
cnot a30 c3
cnot b4 c3
T* c3
cnot b5 c3
T c3
cnot a30 c3
T* c3
cnot a29 c3
cnot b5 c3
T* c3
cnot b6 c3
T c3
cnot a29 c3
T* c3
cnot a28 c3
cnot b6 c3
T* c3
cnot b7 c3
T c3
cnot a28 c3
T* c3
cnot a27 c3
cnot b7 c3
T* c3
cnot b8 c3
T c3
cnot a27 c3
T* c3
cnot a26 c3
cnot b8 c3
T* c3
cnot b9 c3
T c3
cnot a26 c3
T* c3
cnot b9 c3
H c3
T* c4
Z c4
cnot a26 c4
T* c4
cnot b10 c4
T c4
cnot a26 c4
T* c4
cnot a25 c4
cnot b10 c4
T* c4
cnot b11 c4
T c4
cnot a25 c4
T* c4
cnot a24 c4
cnot b11 c4
T* c4
cnot b12 c4
T c4
cnot a24 c4
T* c4
cnot a23 c4
cnot b12 c4
T* c4
cnot b13 c4
T c4
cnot a23 c4
T* c4
cnot a22 c4
cnot b13 c4
T* c4
cnot b14 c4
T c4
cnot a22 c4
T* c4
cnot a21 c4
cnot b14 c4
T* c4
cnot b15 c4
T c4
cnot a21 c4
T* c4
cnot a20 c4
cnot b15 c4
T* c4
cnot b16 c4
T c4
cnot a20 c4
T* c4
cnot a19 c4
cnot b16 c4
T* c4
cnot b17 c4
T c4
cnot a19 c4
T* c4
cnot a18 c4
cnot b17 c4
T* c4
cnot b18 c4
T c4
cnot a18 c4
T* c4
cnot a17 c4
cnot b18 c4
T* c4
cnot b19 c4
T c4
cnot a17 c4
T* c4
cnot a16 c4
cnot b19 c4
T* c4
cnot b20 c4
T c4
cnot a16 c4
T* c4
cnot a15 c4
cnot b20 c4
T* c4
cnot b21 c4
T c4
cnot a15 c4
T* c4
cnot a14 c4
cnot b21 c4
T* c4
cnot b22 c4
T c4
cnot a14 c4
T* c4
cnot a13 c4
cnot b22 c4
T* c4
cnot b23 c4
T c4
cnot a13 c4
T* c4
cnot a12 c4
cnot b23 c4
T* c4
cnot b24 c4
T c4
cnot a12 c4
T* c4
cnot a11 c4
cnot b24 c4
T* c4
cnot b25 c4
T c4
cnot a11 c4
T* c4
cnot a10 c4
cnot b25 c4
T* c4
cnot b26 c4
T c4
cnot a10 c4
T* c4
cnot a9 c4
cnot b26 c4
T* c4
cnot b27 c4
T c4
cnot a9 c4
T* c4
cnot a8 c4
cnot b27 c4
T* c4
cnot b28 c4
T c4
cnot a8 c4
T* c4
cnot a7 c4
cnot b28 c4
T* c4
cnot b29 c4
T c4
cnot a7 c4
T* c4
cnot a6 c4
cnot b29 c4
T* c4
cnot b30 c4
T c4
cnot a6 c4
T* c4
cnot a5 c4
cnot b30 c4
T* c4
cnot b31 c4
T c4
cnot a5 c4
T* c4
cnot a31 c4
cnot b31 c4
T* c4
cnot b5 c4
T c4
cnot a31 c4
T* c4
cnot a30 c4
cnot b5 c4
T* c4
cnot b6 c4
T c4
cnot a30 c4
T* c4
cnot a29 c4
cnot b6 c4
T* c4
cnot b7 c4
T c4
cnot a29 c4
T* c4
cnot a28 c4
cnot b7 c4
T* c4
cnot b8 c4
T c4
cnot a28 c4
T* c4
cnot a27 c4
cnot b8 c4
T* c4
cnot b9 c4
T c4
cnot a27 c4
T* c4
cnot b9 c4
H c4
S c5
cnot a27 c5
T* c5
cnot b10 c5
T c5
cnot a27 c5
T* c5
cnot a26 c5
cnot b10 c5
T* c5
cnot b11 c5
T c5
cnot a26 c5
T* c5
cnot a25 c5
cnot b11 c5
T* c5
cnot b12 c5
T c5
cnot a25 c5
T* c5
cnot a24 c5
cnot b12 c5
T* c5
cnot b13 c5
T c5
cnot a24 c5
T* c5
cnot a23 c5
cnot b13 c5
T* c5
cnot b14 c5
T c5
cnot a23 c5
T* c5
cnot a22 c5
cnot b14 c5
T* c5
cnot b15 c5
T c5
cnot a22 c5
T* c5
cnot a21 c5
cnot b15 c5
T* c5
cnot b16 c5
T c5
cnot a21 c5
T* c5
cnot a20 c5
cnot b16 c5
T* c5
cnot b17 c5
T c5
cnot a20 c5
T* c5
cnot a19 c5
cnot b17 c5
T* c5
cnot b18 c5
T c5
cnot a19 c5
T* c5
cnot a18 c5
cnot b18 c5
T* c5
cnot b19 c5
T c5
cnot a18 c5
T* c5
cnot a17 c5
cnot b19 c5
T* c5
cnot b20 c5
T c5
cnot a17 c5
T* c5
cnot a16 c5
cnot b20 c5
T* c5
cnot b21 c5
T c5
cnot a16 c5
T* c5
cnot a15 c5
cnot b21 c5
T* c5
cnot b22 c5
T c5
cnot a15 c5
T* c5
cnot a14 c5
cnot b22 c5
T* c5
cnot b23 c5
T c5
cnot a14 c5
T* c5
cnot a13 c5
cnot b23 c5
T* c5
cnot b24 c5
T c5
cnot a13 c5
T* c5
cnot a12 c5
cnot b24 c5
T* c5
cnot b25 c5
T c5
cnot a12 c5
T* c5
cnot a11 c5
cnot b25 c5
T* c5
cnot b26 c5
T c5
cnot a11 c5
T* c5
cnot a10 c5
cnot b26 c5
T* c5
cnot b27 c5
T c5
cnot a10 c5
T* c5
cnot a9 c5
cnot b27 c5
T* c5
cnot b28 c5
T c5
cnot a9 c5
T* c5
cnot a8 c5
cnot b28 c5
T* c5
cnot b29 c5
T c5
cnot a8 c5
T* c5
cnot a7 c5
cnot b29 c5
T* c5
cnot b30 c5
T c5
cnot a7 c5
T* c5
cnot a6 c5
cnot b30 c5
T* c5
cnot b31 c5
T c5
cnot a6 c5
T* c5
cnot a31 c5
cnot b31 c5
T* c5
cnot b6 c5
T c5
cnot a31 c5
T* c5
cnot a30 c5
cnot b6 c5
T* c5
cnot b7 c5
T c5
cnot a30 c5
T* c5
cnot a29 c5
cnot b7 c5
T* c5
cnot b8 c5
T c5
cnot a29 c5
T* c5
cnot a28 c5
cnot b8 c5
T* c5
cnot b9 c5
T c5
cnot a28 c5
T* c5
cnot b9 c5
H c5
T c6
cnot a28 c6
T* c6
cnot b10 c6
T c6
cnot a28 c6
T* c6
cnot a27 c6
cnot b10 c6
T* c6
cnot b11 c6
T c6
cnot a27 c6
T* c6
cnot a26 c6
cnot b11 c6
T* c6
cnot b12 c6
T c6
cnot a26 c6
T* c6
cnot a25 c6
cnot b12 c6
T* c6
cnot b13 c6
T c6
cnot a25 c6
T* c6
cnot a24 c6
cnot b13 c6
T* c6
cnot b14 c6
T c6
cnot a24 c6
T* c6
cnot a23 c6
cnot b14 c6
T* c6
cnot b15 c6
T c6
cnot a23 c6
T* c6
cnot a22 c6
cnot b15 c6
T* c6
cnot b16 c6
T c6
cnot a22 c6
T* c6
cnot a21 c6
cnot b16 c6
T* c6
cnot b17 c6
T c6
cnot a21 c6
T* c6
cnot a20 c6
cnot b17 c6
T* c6
cnot b18 c6
T c6
cnot a20 c6
T* c6
cnot a19 c6
cnot b18 c6
T* c6
cnot b19 c6
T c6
cnot a19 c6
T* c6
cnot a18 c6
cnot b19 c6
T* c6
cnot b20 c6
T c6
cnot a18 c6
T* c6
cnot a17 c6
cnot b20 c6
T* c6
cnot b21 c6
T c6
cnot a17 c6
T* c6
cnot a16 c6
cnot b21 c6
T* c6
cnot b22 c6
T c6
cnot a16 c6
T* c6
cnot a15 c6
cnot b22 c6
T* c6
cnot b23 c6
T c6
cnot a15 c6
T* c6
cnot a14 c6
cnot b23 c6
T* c6
cnot b24 c6
T c6
cnot a14 c6
T* c6
cnot a13 c6
cnot b24 c6
T* c6
cnot b25 c6
T c6
cnot a13 c6
T* c6
cnot a12 c6
cnot b25 c6
T* c6
cnot b26 c6
T c6
cnot a12 c6
T* c6
cnot a11 c6
cnot b26 c6
T* c6
cnot b27 c6
T c6
cnot a11 c6
T* c6
cnot a10 c6
cnot b27 c6
T* c6
cnot b28 c6
T c6
cnot a10 c6
T* c6
cnot a9 c6
cnot b28 c6
T* c6
cnot b29 c6
T c6
cnot a9 c6
T* c6
cnot a8 c6
cnot b29 c6
T* c6
cnot b30 c6
T c6
cnot a8 c6
T* c6
cnot a7 c6
cnot b30 c6
T* c6
cnot b31 c6
T c6
cnot a7 c6
T* c6
cnot a31 c6
cnot b31 c6
T* c6
cnot b7 c6
T c6
cnot a31 c6
T* c6
cnot a30 c6
cnot b7 c6
T* c6
cnot b8 c6
T c6
cnot a30 c6
T* c6
cnot a29 c6
cnot b8 c6
T* c6
cnot b9 c6
T c6
cnot a29 c6
T* c6
cnot b9 c6
H c6
cnot a29 c7
T* c7
cnot b10 c7
T c7
cnot a29 c7
T* c7
cnot a28 c7
cnot b10 c7
T* c7
cnot b11 c7
T c7
cnot a28 c7
T* c7
cnot a27 c7
cnot b11 c7
T* c7
cnot b12 c7
T c7
cnot a27 c7
T* c7
cnot a26 c7
cnot b12 c7
T* c7
cnot b13 c7
T c7
cnot a26 c7
T* c7
cnot a25 c7
cnot b13 c7
T* c7
cnot b14 c7
T c7
cnot a25 c7
T* c7
cnot a24 c7
cnot b14 c7
T* c7
cnot b15 c7
T c7
cnot a24 c7
T* c7
cnot a23 c7
cnot b15 c7
T* c7
cnot b16 c7
T c7
cnot a23 c7
T* c7
cnot a22 c7
cnot b16 c7
T* c7
cnot b17 c7
T c7
cnot a22 c7
T* c7
cnot a21 c7
cnot b17 c7
T* c7
cnot b18 c7
T c7
cnot a21 c7
T* c7
cnot a20 c7
cnot b18 c7
T* c7
cnot b19 c7
T c7
cnot a20 c7
T* c7
cnot a19 c7
cnot b19 c7
T* c7
cnot b20 c7
T c7
cnot a19 c7
T* c7
cnot a18 c7
cnot b20 c7
T* c7
cnot b21 c7
T c7
cnot a18 c7
T* c7
cnot a17 c7
cnot b21 c7
T* c7
cnot b22 c7
T c7
cnot a17 c7
T* c7
cnot a16 c7
cnot b22 c7
T* c7
cnot b23 c7
T c7
cnot a16 c7
T* c7
cnot a15 c7
cnot b23 c7
T* c7
cnot b24 c7
T c7
cnot a15 c7
T* c7
cnot a14 c7
cnot b24 c7
T* c7
cnot b25 c7
T c7
cnot a14 c7
T* c7
cnot a13 c7
cnot b25 c7
T* c7
cnot b26 c7
T c7
cnot a13 c7
T* c7
cnot a12 c7
cnot b26 c7
T* c7
cnot b27 c7
T c7
cnot a12 c7
T* c7
cnot a11 c7
cnot b27 c7
T* c7
cnot b28 c7
T c7
cnot a11 c7
T* c7
cnot a10 c7
cnot b28 c7
T* c7
cnot b29 c7
T c7
cnot a10 c7
T* c7
cnot a9 c7
cnot b29 c7
T* c7
cnot b30 c7
T c7
cnot a9 c7
T* c7
cnot a8 c7
cnot b30 c7
T* c7
cnot b31 c7
T c7
cnot a8 c7
T* c7
cnot a31 c7
cnot b31 c7
T* c7
cnot b8 c7
T c7
cnot a31 c7
T* c7
cnot a30 c7
cnot b8 c7
T* c7
cnot b9 c7
T c7
cnot a30 c7
T* c7
cnot b9 c7
H c7
T* c8
cnot a30 c8
T* c8
cnot b10 c8
T c8
cnot a30 c8
T* c8
cnot a29 c8
cnot b10 c8
T* c8
cnot b11 c8
T c8
cnot a29 c8
T* c8
cnot a28 c8
cnot b11 c8
T* c8
cnot b12 c8
T c8
cnot a28 c8
T* c8
cnot a27 c8
cnot b12 c8
T* c8
cnot b13 c8
T c8
cnot a27 c8
T* c8
cnot a26 c8
cnot b13 c8
T* c8
cnot b14 c8
T c8
cnot a26 c8
T* c8
cnot a25 c8
cnot b14 c8
T* c8
cnot b15 c8
T c8
cnot a25 c8
T* c8
cnot a24 c8
cnot b15 c8
T* c8
cnot b16 c8
T c8
cnot a24 c8
T* c8
cnot a23 c8
cnot b16 c8
T* c8
cnot b17 c8
T c8
cnot a23 c8
T* c8
cnot a22 c8
cnot b17 c8
T* c8
cnot b18 c8
T c8
cnot a22 c8
T* c8
cnot a21 c8
cnot b18 c8
T* c8
cnot b19 c8
T c8
cnot a21 c8
T* c8
cnot a20 c8
cnot b19 c8
T* c8
cnot b20 c8
T c8
cnot a20 c8
T* c8
cnot a19 c8
cnot b20 c8
T* c8
cnot b21 c8
T c8
cnot a19 c8
T* c8
cnot a18 c8
cnot b21 c8
T* c8
cnot b22 c8
T c8
cnot a18 c8
T* c8
cnot a17 c8
cnot b22 c8
T* c8
cnot b23 c8
T c8
cnot a17 c8
T* c8
cnot a16 c8
cnot b23 c8
T* c8
cnot b24 c8
T c8
cnot a16 c8
T* c8
cnot a15 c8
cnot b24 c8
T* c8
cnot b25 c8
T c8
cnot a15 c8
T* c8
cnot a14 c8
cnot b25 c8
T* c8
cnot b26 c8
T c8
cnot a14 c8
T* c8
cnot a13 c8
cnot b26 c8
T* c8
cnot b27 c8
T c8
cnot a13 c8
T* c8
cnot a12 c8
cnot b27 c8
T* c8
cnot b28 c8
T c8
cnot a12 c8
T* c8
cnot a11 c8
cnot b28 c8
T* c8
cnot b29 c8
T c8
cnot a11 c8
T* c8
cnot a10 c8
cnot b29 c8
T* c8
cnot b30 c8
T c8
cnot a10 c8
T* c8
cnot a9 c8
cnot b30 c8
T* c8
cnot b31 c8
T c8
cnot a9 c8
T* c8
cnot a31 c8
cnot b31 c8
T* c8
cnot b9 c8
T c8
cnot a31 c8
T* c8
cnot b9 c8
H c8
S* c9
cnot a31 c9
T* c9
cnot b10 c9
T c9
cnot a31 c9
T* c9
cnot a30 c9
cnot b10 c9
T* c9
cnot b11 c9
T c9
cnot a30 c9
T* c9
cnot a29 c9
cnot b11 c9
T* c9
cnot b12 c9
T c9
cnot a29 c9
T* c9
cnot a28 c9
cnot b12 c9
T* c9
cnot b13 c9
T c9
cnot a28 c9
T* c9
cnot a27 c9
cnot b13 c9
T* c9
cnot b14 c9
T c9
cnot a27 c9
T* c9
cnot a26 c9
cnot b14 c9
T* c9
cnot b15 c9
T c9
cnot a26 c9
T* c9
cnot a25 c9
cnot b15 c9
T* c9
cnot b16 c9
T c9
cnot a25 c9
T* c9
cnot a24 c9
cnot b16 c9
T* c9
cnot b17 c9
T c9
cnot a24 c9
T* c9
cnot a23 c9
cnot b17 c9
T* c9
cnot b18 c9
T c9
cnot a23 c9
T* c9
cnot a22 c9
cnot b18 c9
T* c9
cnot b19 c9
T c9
cnot a22 c9
T* c9
cnot a21 c9
cnot b19 c9
T* c9
cnot b20 c9
T c9
cnot a21 c9
T* c9
cnot a20 c9
cnot b20 c9
T* c9
cnot b21 c9
T c9
cnot a20 c9
T* c9
cnot a19 c9
cnot b21 c9
T* c9
cnot b22 c9
T c9
cnot a19 c9
T* c9
cnot a18 c9
cnot b22 c9
T* c9
cnot b23 c9
T c9
cnot a18 c9
T* c9
cnot a17 c9
cnot b23 c9
T* c9
cnot b24 c9
T c9
cnot a17 c9
T* c9
cnot a16 c9
cnot b24 c9
T* c9
cnot b25 c9
T c9
cnot a16 c9
T* c9
cnot a15 c9
cnot b25 c9
T* c9
cnot b26 c9
T c9
cnot a15 c9
T* c9
cnot a14 c9
cnot b26 c9
T* c9
cnot b27 c9
T c9
cnot a14 c9
T* c9
cnot a13 c9
cnot b27 c9
T* c9
cnot b28 c9
T c9
cnot a13 c9
T* c9
cnot a12 c9
cnot b28 c9
T* c9
cnot b29 c9
T c9
cnot a12 c9
T* c9
cnot a11 c9
cnot b29 c9
T* c9
cnot b30 c9
T c9
cnot a11 c9
T* c9
cnot a10 c9
cnot b30 c9
T* c9
cnot b31 c9
T c9
cnot a10 c9
T* c9
cnot b31 c9
H c9
T c10
Z c10
cnot a31 c10
T* c10
cnot b11 c10
T c10
cnot a31 c10
T* c10
cnot a30 c10
cnot b11 c10
T* c10
cnot b12 c10
T c10
cnot a30 c10
T* c10
cnot a29 c10
cnot b12 c10
T* c10
cnot b13 c10
T c10
cnot a29 c10
T* c10
cnot a28 c10
cnot b13 c10
T* c10
cnot b14 c10
T c10
cnot a28 c10
T* c10
cnot a27 c10
cnot b14 c10
T* c10
cnot b15 c10
T c10
cnot a27 c10
T* c10
cnot a26 c10
cnot b15 c10
T* c10
cnot b16 c10
T c10
cnot a26 c10
T* c10
cnot a25 c10
cnot b16 c10
T* c10
cnot b17 c10
T c10
cnot a25 c10
T* c10
cnot a24 c10
cnot b17 c10
T* c10
cnot b18 c10
T c10
cnot a24 c10
T* c10
cnot a23 c10
cnot b18 c10
T* c10
cnot b19 c10
T c10
cnot a23 c10
T* c10
cnot a22 c10
cnot b19 c10
T* c10
cnot b20 c10
T c10
cnot a22 c10
T* c10
cnot a21 c10
cnot b20 c10
T* c10
cnot b21 c10
T c10
cnot a21 c10
T* c10
cnot a20 c10
cnot b21 c10
T* c10
cnot b22 c10
T c10
cnot a20 c10
T* c10
cnot a19 c10
cnot b22 c10
T* c10
cnot b23 c10
T c10
cnot a19 c10
T* c10
cnot a18 c10
cnot b23 c10
T* c10
cnot b24 c10
T c10
cnot a18 c10
T* c10
cnot a17 c10
cnot b24 c10
T* c10
cnot b25 c10
T c10
cnot a17 c10
T* c10
cnot a16 c10
cnot b25 c10
T* c10
cnot b26 c10
T c10
cnot a16 c10
T* c10
cnot a15 c10
cnot b26 c10
T* c10
cnot b27 c10
T c10
cnot a15 c10
T* c10
cnot a14 c10
cnot b27 c10
T* c10
cnot b28 c10
T c10
cnot a14 c10
T* c10
cnot a13 c10
cnot b28 c10
T* c10
cnot b29 c10
T c10
cnot a13 c10
T* c10
cnot a12 c10
cnot b29 c10
T* c10
cnot b30 c10
T c10
cnot a12 c10
T* c10
cnot a11 c10
cnot b30 c10
T* c10
cnot b31 c10
T c10
cnot a11 c10
T* c10
cnot b31 c10
H c10
Z c11
cnot a31 c11
T* c11
cnot b12 c11
T c11
cnot a31 c11
T* c11
cnot a30 c11
cnot b12 c11
T* c11
cnot b13 c11
T c11
cnot a30 c11
T* c11
cnot a29 c11
cnot b13 c11
T* c11
cnot b14 c11
T c11
cnot a29 c11
T* c11
cnot a28 c11
cnot b14 c11
T* c11
cnot b15 c11
T c11
cnot a28 c11
T* c11
cnot a27 c11
cnot b15 c11
T* c11
cnot b16 c11
T c11
cnot a27 c11
T* c11
cnot a26 c11
cnot b16 c11
T* c11
cnot b17 c11
T c11
cnot a26 c11
T* c11
cnot a25 c11
cnot b17 c11
T* c11
cnot b18 c11
T c11
cnot a25 c11
T* c11
cnot a24 c11
cnot b18 c11
T* c11
cnot b19 c11
T c11
cnot a24 c11
T* c11
cnot a23 c11
cnot b19 c11
T* c11
cnot b20 c11
T c11
cnot a23 c11
T* c11
cnot a22 c11
cnot b20 c11
T* c11
cnot b21 c11
T c11
cnot a22 c11
T* c11
cnot a21 c11
cnot b21 c11
T* c11
cnot b22 c11
T c11
cnot a21 c11
T* c11
cnot a20 c11
cnot b22 c11
T* c11
cnot b23 c11
T c11
cnot a20 c11
T* c11
cnot a19 c11
cnot b23 c11
T* c11
cnot b24 c11
T c11
cnot a19 c11
T* c11
cnot a18 c11
cnot b24 c11
T* c11
cnot b25 c11
T c11
cnot a18 c11
T* c11
cnot a17 c11
cnot b25 c11
T* c11
cnot b26 c11
T c11
cnot a17 c11
T* c11
cnot a16 c11
cnot b26 c11
T* c11
cnot b27 c11
T c11
cnot a16 c11
T* c11
cnot a15 c11
cnot b27 c11
T* c11
cnot b28 c11
T c11
cnot a15 c11
T* c11
cnot a14 c11
cnot b28 c11
T* c11
cnot b29 c11
T c11
cnot a14 c11
T* c11
cnot a13 c11
cnot b29 c11
T* c11
cnot b30 c11
T c11
cnot a13 c11
T* c11
cnot a12 c11
cnot b30 c11
T* c11
cnot b31 c11
T c11
cnot a12 c11
T* c11
cnot b31 c11
H c11
T* c12
Z c12
cnot a31 c12
T* c12
cnot b13 c12
T c12
cnot a31 c12
T* c12
cnot a30 c12
cnot b13 c12
T* c12
cnot b14 c12
T c12
cnot a30 c12
T* c12
cnot a29 c12
cnot b14 c12
T* c12
cnot b15 c12
T c12
cnot a29 c12
T* c12
cnot a28 c12
cnot b15 c12
T* c12
cnot b16 c12
T c12
cnot a28 c12
T* c12
cnot a27 c12
cnot b16 c12
T* c12
cnot b17 c12
T c12
cnot a27 c12
T* c12
cnot a26 c12
cnot b17 c12
T* c12
cnot b18 c12
T c12
cnot a26 c12
T* c12
cnot a25 c12
cnot b18 c12
T* c12
cnot b19 c12
T c12
cnot a25 c12
T* c12
cnot a24 c12
cnot b19 c12
T* c12
cnot b20 c12
T c12
cnot a24 c12
T* c12
cnot a23 c12
cnot b20 c12
T* c12
cnot b21 c12
T c12
cnot a23 c12
T* c12
cnot a22 c12
cnot b21 c12
T* c12
cnot b22 c12
T c12
cnot a22 c12
T* c12
cnot a21 c12
cnot b22 c12
T* c12
cnot b23 c12
T c12
cnot a21 c12
T* c12
cnot a20 c12
cnot b23 c12
T* c12
cnot b24 c12
T c12
cnot a20 c12
T* c12
cnot a19 c12
cnot b24 c12
T* c12
cnot b25 c12
T c12
cnot a19 c12
T* c12
cnot a18 c12
cnot b25 c12
T* c12
cnot b26 c12
T c12
cnot a18 c12
T* c12
cnot a17 c12
cnot b26 c12
T* c12
cnot b27 c12
T c12
cnot a17 c12
T* c12
cnot a16 c12
cnot b27 c12
T* c12
cnot b28 c12
T c12
cnot a16 c12
T* c12
cnot a15 c12
cnot b28 c12
T* c12
cnot b29 c12
T c12
cnot a15 c12
T* c12
cnot a14 c12
cnot b29 c12
T* c12
cnot b30 c12
T c12
cnot a14 c12
T* c12
cnot a13 c12
cnot b30 c12
T* c12
cnot b31 c12
T c12
cnot a13 c12
T* c12
cnot b31 c12
H c12
S c13
cnot a31 c13
T* c13
cnot b14 c13
T c13
cnot a31 c13
T* c13
cnot a30 c13
cnot b14 c13
T* c13
cnot b15 c13
T c13
cnot a30 c13
T* c13
cnot a29 c13
cnot b15 c13
T* c13
cnot b16 c13
T c13
cnot a29 c13
T* c13
cnot a28 c13
cnot b16 c13
T* c13
cnot b17 c13
T c13
cnot a28 c13
T* c13
cnot a27 c13
cnot b17 c13
T* c13
cnot b18 c13
T c13
cnot a27 c13
T* c13
cnot a26 c13
cnot b18 c13
T* c13
cnot b19 c13
T c13
cnot a26 c13
T* c13
cnot a25 c13
cnot b19 c13
T* c13
cnot b20 c13
T c13
cnot a25 c13
T* c13
cnot a24 c13
cnot b20 c13
T* c13
cnot b21 c13
T c13
cnot a24 c13
T* c13
cnot a23 c13
cnot b21 c13
T* c13
cnot b22 c13
T c13
cnot a23 c13
T* c13
cnot a22 c13
cnot b22 c13
T* c13
cnot b23 c13
T c13
cnot a22 c13
T* c13
cnot a21 c13
cnot b23 c13
T* c13
cnot b24 c13
T c13
cnot a21 c13
T* c13
cnot a20 c13
cnot b24 c13
T* c13
cnot b25 c13
T c13
cnot a20 c13
T* c13
cnot a19 c13
cnot b25 c13
T* c13
cnot b26 c13
T c13
cnot a19 c13
T* c13
cnot a18 c13
cnot b26 c13
T* c13
cnot b27 c13
T c13
cnot a18 c13
T* c13
cnot a17 c13
cnot b27 c13
T* c13
cnot b28 c13
T c13
cnot a17 c13
T* c13
cnot a16 c13
cnot b28 c13
T* c13
cnot b29 c13
T c13
cnot a16 c13
T* c13
cnot a15 c13
cnot b29 c13
T* c13
cnot b30 c13
T c13
cnot a15 c13
T* c13
cnot a14 c13
cnot b30 c13
T* c13
cnot b31 c13
T c13
cnot a14 c13
T* c13
cnot b31 c13
H c13
T c14
cnot a31 c14
T* c14
cnot b15 c14
T c14
cnot a31 c14
T* c14
cnot a30 c14
cnot b15 c14
T* c14
cnot b16 c14
T c14
cnot a30 c14
T* c14
cnot a29 c14
cnot b16 c14
T* c14
cnot b17 c14
T c14
cnot a29 c14
T* c14
cnot a28 c14
cnot b17 c14
T* c14
cnot b18 c14
T c14
cnot a28 c14
T* c14
cnot a27 c14
cnot b18 c14
T* c14
cnot b19 c14
T c14
cnot a27 c14
T* c14
cnot a26 c14
cnot b19 c14
T* c14
cnot b20 c14
T c14
cnot a26 c14
T* c14
cnot a25 c14
cnot b20 c14
T* c14
cnot b21 c14
T c14
cnot a25 c14
T* c14
cnot a24 c14
cnot b21 c14
T* c14
cnot b22 c14
T c14
cnot a24 c14
T* c14
cnot a23 c14
cnot b22 c14
T* c14
cnot b23 c14
T c14
cnot a23 c14
T* c14
cnot a22 c14
cnot b23 c14
T* c14
cnot b24 c14
T c14
cnot a22 c14
T* c14
cnot a21 c14
cnot b24 c14
T* c14
cnot b25 c14
T c14
cnot a21 c14
T* c14
cnot a20 c14
cnot b25 c14
T* c14
cnot b26 c14
T c14
cnot a20 c14
T* c14
cnot a19 c14
cnot b26 c14
T* c14
cnot b27 c14
T c14
cnot a19 c14
T* c14
cnot a18 c14
cnot b27 c14
T* c14
cnot b28 c14
T c14
cnot a18 c14
T* c14
cnot a17 c14
cnot b28 c14
T* c14
cnot b29 c14
T c14
cnot a17 c14
T* c14
cnot a16 c14
cnot b29 c14
T* c14
cnot b30 c14
T c14
cnot a16 c14
T* c14
cnot a15 c14
cnot b30 c14
T* c14
cnot b31 c14
T c14
cnot a15 c14
T* c14
cnot b31 c14
H c14
cnot a31 c15
T* c15
cnot b16 c15
T c15
cnot a31 c15
T* c15
cnot a30 c15
cnot b16 c15
T* c15
cnot b17 c15
T c15
cnot a30 c15
T* c15
cnot a29 c15
cnot b17 c15
T* c15
cnot b18 c15
T c15
cnot a29 c15
T* c15
cnot a28 c15
cnot b18 c15
T* c15
cnot b19 c15
T c15
cnot a28 c15
T* c15
cnot a27 c15
cnot b19 c15
T* c15
cnot b20 c15
T c15
cnot a27 c15
T* c15
cnot a26 c15
cnot b20 c15
T* c15
cnot b21 c15
T c15
cnot a26 c15
T* c15
cnot a25 c15
cnot b21 c15
T* c15
cnot b22 c15
T c15
cnot a25 c15
T* c15
cnot a24 c15
cnot b22 c15
T* c15
cnot b23 c15
T c15
cnot a24 c15
T* c15
cnot a23 c15
cnot b23 c15
T* c15
cnot b24 c15
T c15
cnot a23 c15
T* c15
cnot a22 c15
cnot b24 c15
T* c15
cnot b25 c15
T c15
cnot a22 c15
T* c15
cnot a21 c15
cnot b25 c15
T* c15
cnot b26 c15
T c15
cnot a21 c15
T* c15
cnot a20 c15
cnot b26 c15
T* c15
cnot b27 c15
T c15
cnot a20 c15
T* c15
cnot a19 c15
cnot b27 c15
T* c15
cnot b28 c15
T c15
cnot a19 c15
T* c15
cnot a18 c15
cnot b28 c15
T* c15
cnot b29 c15
T c15
cnot a18 c15
T* c15
cnot a17 c15
cnot b29 c15
T* c15
cnot b30 c15
T c15
cnot a17 c15
T* c15
cnot a16 c15
cnot b30 c15
T* c15
cnot b31 c15
T c15
cnot a16 c15
T* c15
cnot b31 c15
H c15
T* c16
cnot a31 c16
T* c16
cnot b17 c16
T c16
cnot a31 c16
T* c16
cnot a30 c16
cnot b17 c16
T* c16
cnot b18 c16
T c16
cnot a30 c16
T* c16
cnot a29 c16
cnot b18 c16
T* c16
cnot b19 c16
T c16
cnot a29 c16
T* c16
cnot a28 c16
cnot b19 c16
T* c16
cnot b20 c16
T c16
cnot a28 c16
T* c16
cnot a27 c16
cnot b20 c16
T* c16
cnot b21 c16
T c16
cnot a27 c16
T* c16
cnot a26 c16
cnot b21 c16
T* c16
cnot b22 c16
T c16
cnot a26 c16
T* c16
cnot a25 c16
cnot b22 c16
T* c16
cnot b23 c16
T c16
cnot a25 c16
T* c16
cnot a24 c16
cnot b23 c16
T* c16
cnot b24 c16
T c16
cnot a24 c16
T* c16
cnot a23 c16
cnot b24 c16
T* c16
cnot b25 c16
T c16
cnot a23 c16
T* c16
cnot a22 c16
cnot b25 c16
T* c16
cnot b26 c16
T c16
cnot a22 c16
T* c16
cnot a21 c16
cnot b26 c16
T* c16
cnot b27 c16
T c16
cnot a21 c16
T* c16
cnot a20 c16
cnot b27 c16
T* c16
cnot b28 c16
T c16
cnot a20 c16
T* c16
cnot a19 c16
cnot b28 c16
T* c16
cnot b29 c16
T c16
cnot a19 c16
T* c16
cnot a18 c16
cnot b29 c16
T* c16
cnot b30 c16
T c16
cnot a18 c16
T* c16
cnot a17 c16
cnot b30 c16
T* c16
cnot b31 c16
T c16
cnot a17 c16
T* c16
cnot b31 c16
H c16
S* c17
cnot a31 c17
T* c17
cnot b18 c17
T c17
cnot a31 c17
T* c17
cnot a30 c17
cnot b18 c17
T* c17
cnot b19 c17
T c17
cnot a30 c17
T* c17
cnot a29 c17
cnot b19 c17
T* c17
cnot b20 c17
T c17
cnot a29 c17
T* c17
cnot a28 c17
cnot b20 c17
T* c17
cnot b21 c17
T c17
cnot a28 c17
T* c17
cnot a27 c17
cnot b21 c17
T* c17
cnot b22 c17
T c17
cnot a27 c17
T* c17
cnot a26 c17
cnot b22 c17
T* c17
cnot b23 c17
T c17
cnot a26 c17
T* c17
cnot a25 c17
cnot b23 c17
T* c17
cnot b24 c17
T c17
cnot a25 c17
T* c17
cnot a24 c17
cnot b24 c17
T* c17
cnot b25 c17
T c17
cnot a24 c17
T* c17
cnot a23 c17
cnot b25 c17
T* c17
cnot b26 c17
T c17
cnot a23 c17
T* c17
cnot a22 c17
cnot b26 c17
T* c17
cnot b27 c17
T c17
cnot a22 c17
T* c17
cnot a21 c17
cnot b27 c17
T* c17
cnot b28 c17
T c17
cnot a21 c17
T* c17
cnot a20 c17
cnot b28 c17
T* c17
cnot b29 c17
T c17
cnot a20 c17
T* c17
cnot a19 c17
cnot b29 c17
T* c17
cnot b30 c17
T c17
cnot a19 c17
T* c17
cnot a18 c17
cnot b30 c17
T* c17
cnot b31 c17
T c17
cnot a18 c17
T* c17
cnot b31 c17
H c17
T c18
Z c18
cnot a31 c18
T* c18
cnot b19 c18
T c18
cnot a31 c18
T* c18
cnot a30 c18
cnot b19 c18
T* c18
cnot b20 c18
T c18
cnot a30 c18
T* c18
cnot a29 c18
cnot b20 c18
T* c18
cnot b21 c18
T c18
cnot a29 c18
T* c18
cnot a28 c18
cnot b21 c18
T* c18
cnot b22 c18
T c18
cnot a28 c18
T* c18
cnot a27 c18
cnot b22 c18
T* c18
cnot b23 c18
T c18
cnot a27 c18
T* c18
cnot a26 c18
cnot b23 c18
T* c18
cnot b24 c18
T c18
cnot a26 c18
T* c18
cnot a25 c18
cnot b24 c18
T* c18
cnot b25 c18
T c18
cnot a25 c18
T* c18
cnot a24 c18
cnot b25 c18
T* c18
cnot b26 c18
T c18
cnot a24 c18
T* c18
cnot a23 c18
cnot b26 c18
T* c18
cnot b27 c18
T c18
cnot a23 c18
T* c18
cnot a22 c18
cnot b27 c18
T* c18
cnot b28 c18
T c18
cnot a22 c18
T* c18
cnot a21 c18
cnot b28 c18
T* c18
cnot b29 c18
T c18
cnot a21 c18
T* c18
cnot a20 c18
cnot b29 c18
T* c18
cnot b30 c18
T c18
cnot a20 c18
T* c18
cnot a19 c18
cnot b30 c18
T* c18
cnot b31 c18
T c18
cnot a19 c18
T* c18
cnot b31 c18
H c18
Z c19
cnot a31 c19
T* c19
cnot b20 c19
T c19
cnot a31 c19
T* c19
cnot a30 c19
cnot b20 c19
T* c19
cnot b21 c19
T c19
cnot a30 c19
T* c19
cnot a29 c19
cnot b21 c19
T* c19
cnot b22 c19
T c19
cnot a29 c19
T* c19
cnot a28 c19
cnot b22 c19
T* c19
cnot b23 c19
T c19
cnot a28 c19
T* c19
cnot a27 c19
cnot b23 c19
T* c19
cnot b24 c19
T c19
cnot a27 c19
T* c19
cnot a26 c19
cnot b24 c19
T* c19
cnot b25 c19
T c19
cnot a26 c19
T* c19
cnot a25 c19
cnot b25 c19
T* c19
cnot b26 c19
T c19
cnot a25 c19
T* c19
cnot a24 c19
cnot b26 c19
T* c19
cnot b27 c19
T c19
cnot a24 c19
T* c19
cnot a23 c19
cnot b27 c19
T* c19
cnot b28 c19
T c19
cnot a23 c19
T* c19
cnot a22 c19
cnot b28 c19
T* c19
cnot b29 c19
T c19
cnot a22 c19
T* c19
cnot a21 c19
cnot b29 c19
T* c19
cnot b30 c19
T c19
cnot a21 c19
T* c19
cnot a20 c19
cnot b30 c19
T* c19
cnot b31 c19
T c19
cnot a20 c19
T* c19
cnot b31 c19
H c19
T* c20
Z c20
cnot a31 c20
T* c20
cnot b21 c20
T c20
cnot a31 c20
T* c20
cnot a30 c20
cnot b21 c20
T* c20
cnot b22 c20
T c20
cnot a30 c20
T* c20
cnot a29 c20
cnot b22 c20
T* c20
cnot b23 c20
T c20
cnot a29 c20
T* c20
cnot a28 c20
cnot b23 c20
T* c20
cnot b24 c20
T c20
cnot a28 c20
T* c20
cnot a27 c20
cnot b24 c20
T* c20
cnot b25 c20
T c20
cnot a27 c20
T* c20
cnot a26 c20
cnot b25 c20
T* c20
cnot b26 c20
T c20
cnot a26 c20
T* c20
cnot a25 c20
cnot b26 c20
T* c20
cnot b27 c20
T c20
cnot a25 c20
T* c20
cnot a24 c20
cnot b27 c20
T* c20
cnot b28 c20
T c20
cnot a24 c20
T* c20
cnot a23 c20
cnot b28 c20
T* c20
cnot b29 c20
T c20
cnot a23 c20
T* c20
cnot a22 c20
cnot b29 c20
T* c20
cnot b30 c20
T c20
cnot a22 c20
T* c20
cnot a21 c20
cnot b30 c20
T* c20
cnot b31 c20
T c20
cnot a21 c20
T* c20
cnot b31 c20
H c20
S c21
cnot a31 c21
T* c21
cnot b22 c21
T c21
cnot a31 c21
T* c21
cnot a30 c21
cnot b22 c21
T* c21
cnot b23 c21
T c21
cnot a30 c21
T* c21
cnot a29 c21
cnot b23 c21
T* c21
cnot b24 c21
T c21
cnot a29 c21
T* c21
cnot a28 c21
cnot b24 c21
T* c21
cnot b25 c21
T c21
cnot a28 c21
T* c21
cnot a27 c21
cnot b25 c21
T* c21
cnot b26 c21
T c21
cnot a27 c21
T* c21
cnot a26 c21
cnot b26 c21
T* c21
cnot b27 c21
T c21
cnot a26 c21
T* c21
cnot a25 c21
cnot b27 c21
T* c21
cnot b28 c21
T c21
cnot a25 c21
T* c21
cnot a24 c21
cnot b28 c21
T* c21
cnot b29 c21
T c21
cnot a24 c21
T* c21
cnot a23 c21
cnot b29 c21
T* c21
cnot b30 c21
T c21
cnot a23 c21
T* c21
cnot a22 c21
cnot b30 c21
T* c21
cnot b31 c21
T c21
cnot a22 c21
T* c21
cnot b31 c21
H c21
T c22
cnot a31 c22
T* c22
cnot b23 c22
T c22
cnot a31 c22
T* c22
cnot a30 c22
cnot b23 c22
T* c22
cnot b24 c22
T c22
cnot a30 c22
T* c22
cnot a29 c22
cnot b24 c22
T* c22
cnot b25 c22
T c22
cnot a29 c22
T* c22
cnot a28 c22
cnot b25 c22
T* c22
cnot b26 c22
T c22
cnot a28 c22
T* c22
cnot a27 c22
cnot b26 c22
T* c22
cnot b27 c22
T c22
cnot a27 c22
T* c22
cnot a26 c22
cnot b27 c22
T* c22
cnot b28 c22
T c22
cnot a26 c22
T* c22
cnot a25 c22
cnot b28 c22
T* c22
cnot b29 c22
T c22
cnot a25 c22
T* c22
cnot a24 c22
cnot b29 c22
T* c22
cnot b30 c22
T c22
cnot a24 c22
T* c22
cnot a23 c22
cnot b30 c22
T* c22
cnot b31 c22
T c22
cnot a23 c22
T* c22
cnot b31 c22
H c22
cnot a31 c23
T* c23
cnot b24 c23
T c23
cnot a31 c23
T* c23
cnot a30 c23
cnot b24 c23
T* c23
cnot b25 c23
T c23
cnot a30 c23
T* c23
cnot a29 c23
cnot b25 c23
T* c23
cnot b26 c23
T c23
cnot a29 c23
T* c23
cnot a28 c23
cnot b26 c23
T* c23
cnot b27 c23
T c23
cnot a28 c23
T* c23
cnot a27 c23
cnot b27 c23
T* c23
cnot b28 c23
T c23
cnot a27 c23
T* c23
cnot a26 c23
cnot b28 c23
T* c23
cnot b29 c23
T c23
cnot a26 c23
T* c23
cnot a25 c23
cnot b29 c23
T* c23
cnot b30 c23
T c23
cnot a25 c23
T* c23
cnot a24 c23
cnot b30 c23
T* c23
cnot b31 c23
T c23
cnot a24 c23
T* c23
cnot b31 c23
H c23
T* c24
cnot a31 c24
T* c24
cnot b25 c24
T c24
cnot a31 c24
T* c24
cnot a30 c24
cnot b25 c24
T* c24
cnot b26 c24
T c24
cnot a30 c24
T* c24
cnot a29 c24
cnot b26 c24
T* c24
cnot b27 c24
T c24
cnot a29 c24
T* c24
cnot a28 c24
cnot b27 c24
T* c24
cnot b28 c24
T c24
cnot a28 c24
T* c24
cnot a27 c24
cnot b28 c24
T* c24
cnot b29 c24
T c24
cnot a27 c24
T* c24
cnot a26 c24
cnot b29 c24
T* c24
cnot b30 c24
T c24
cnot a26 c24
T* c24
cnot a25 c24
cnot b30 c24
T* c24
cnot b31 c24
T c24
cnot a25 c24
T* c24
cnot b31 c24
H c24
S* c25
cnot a31 c25
T* c25
cnot b26 c25
T c25
cnot a31 c25
T* c25
cnot a30 c25
cnot b26 c25
T* c25
cnot b27 c25
T c25
cnot a30 c25
T* c25
cnot a29 c25
cnot b27 c25
T* c25
cnot b28 c25
T c25
cnot a29 c25
T* c25
cnot a28 c25
cnot b28 c25
T* c25
cnot b29 c25
T c25
cnot a28 c25
T* c25
cnot a27 c25
cnot b29 c25
T* c25
cnot b30 c25
T c25
cnot a27 c25
T* c25
cnot a26 c25
cnot b30 c25
T* c25
cnot b31 c25
T c25
cnot a26 c25
T* c25
cnot b31 c25
H c25
T c26
Z c26
cnot a31 c26
T* c26
cnot b27 c26
T c26
cnot a31 c26
T* c26
cnot a30 c26
cnot b27 c26
T* c26
cnot b28 c26
T c26
cnot a30 c26
T* c26
cnot a29 c26
cnot b28 c26
T* c26
cnot b29 c26
T c26
cnot a29 c26
T* c26
cnot a28 c26
cnot b29 c26
T* c26
cnot b30 c26
T c26
cnot a28 c26
T* c26
cnot a27 c26
cnot b30 c26
T* c26
cnot b31 c26
T c26
cnot a27 c26
T* c26
cnot b31 c26
H c26
Z c27
cnot a31 c27
T* c27
cnot b28 c27
T c27
cnot a31 c27
T* c27
cnot a30 c27
cnot b28 c27
T* c27
cnot b29 c27
T c27
cnot a30 c27
T* c27
cnot a29 c27
cnot b29 c27
T* c27
cnot b30 c27
T c27
cnot a29 c27
T* c27
cnot a28 c27
cnot b30 c27
T* c27
cnot b31 c27
T c27
cnot a28 c27
T* c27
cnot b31 c27
H c27
T* c28
Z c28
cnot a31 c28
T* c28
cnot b29 c28
T c28
cnot a31 c28
T* c28
cnot a30 c28
cnot b29 c28
T* c28
cnot b30 c28
T c28
cnot a30 c28
T* c28
cnot a29 c28
cnot b30 c28
T* c28
cnot b31 c28
T c28
cnot a29 c28
T* c28
cnot b31 c28
H c28
S c29
cnot a31 c29
T* c29
cnot b30 c29
T c29
cnot a31 c29
T* c29
cnot a30 c29
cnot b30 c29
T* c29
cnot b31 c29
T c29
cnot a30 c29
T* c29
cnot b31 c29
H c29
T c30
cnot a31 c30
T* c30
cnot b31 c30
T c30
cnot a31 c30
T* c30
cnot b31 c30
H c30
cnot c12 c11
cnot c13 c11
cnot c24 c1
cnot c25 c0
cnot c27 c0
cnot c28 c10
cnot c3 c10
cnot c4 c11
cnot c5 c10
cnot c7 c10
cnot c9 c10
cnot c29 c0
cnot c29 c11
cnot c30 c12
cnot c5 c12
cnot c8 c17
cnot c13 c12
cnot c14 c12
cnot c14 c13
cnot c15 c13
cnot c6 c13
cnot c15 c14
cnot c16 c14
cnot c7 c14
cnot c16 c15
cnot c17 c15
cnot c21 c19
cnot c22 c20
cnot c23 c19
cnot c24 c20
cnot c26 c19
cnot c3 c28
cnot c30 c28
cnot c6 c28
cnot c8 c17
cnot c9 c17
cnot c17 c16
cnot c18 c16
cnot c28 c17
cnot c20 c18
cnot c25 c18
cnot c25 c19
cnot c24 c20
cnot c27 c2
cnot c29 c2
cnot c7 c21
cnot c8 c22
cnot c9 c20
cnot c22 c20
cnot c29 c25
cnot c30 c23
cnot c4 c25
cnot c5 c23
cnot c6 c23
cnot c9 c23
cnot c9 c24
cnot c9 c25
cnot c6 c26
cnot c9 c26
cnot c30 c29
cnot c6 c28
cnot c7 c4
cnot c8 c28
cnot c9 c27
cnot c29 c28
cnot c3 c28
cnot c9 c29
cnot c4 c3
cnot c7 c30
cnot c8 c30
cnot c7 c6
cnot c8 c6
cnot c9 c8
cnot c7 c9
cnot c6 c9
swap c6 c8
cnot c8 c5
cnot c5 c9
swap c5 c6
cnot c5 c4
cnot c4 c9
cnot c5 c31
cnot c6 c31
swap c31 c9
cnot c30 c9
cnot c30 c6
swap c30 c4
cnot c6 c8
cnot c6 c7
cnot c31 c5
cnot c3 c5
cnot c3 c4
swap c3 c30
cnot c30 c29
cnot c29 c5
cnot c29 c30
cnot c29 c3
cnot c28 c4
cnot c28 c3
swap c28 c29
cnot c4 c27
cnot c27 c30
cnot c27 c28
cnot c5 c9
cnot c3 c8
cnot c5 c7
cnot c3 c6
cnot c4 c26
cnot c26 c29
cnot c26 c28
cnot c26 c27
cnot c6 c25
cnot c25 c30
cnot c25 c27
cnot c25 c26
cnot c6 c24
cnot c24 c29
cnot c24 c25
cnot c23 c30
cnot c23 c26
cnot c23 c24
cnot c29 c31
cnot c5 c22
cnot c22 c29
cnot c22 c25
cnot c22 c23
cnot c4 c21
cnot c21 c26
cnot c21 c23
cnot c21 c22
cnot c4 c20
cnot c20 c25
cnot c20 c22
cnot c20 c21
cnot c2 c9
cnot c2 c8
cnot c2 c7
cnot c2 c6
cnot c2 c5
cnot c2 c4
cnot c2 c3
cnot c26 c28
cnot c25 c27
cnot c21 c24
cnot c26 c19
cnot c19 c26
cnot c19 c20
cnot c25 c18
cnot c18 c25
cnot c18 c21
cnot c18 c19
cnot c17 c20
cnot c17 c19
cnot c17 c18
cnot c18 c16
cnot c16 c21
cnot c16 c18
cnot c16 c17
cnot c20 c24
cnot c21 c23
cnot c20 c22
cnot c17 c15
cnot c15 c22
cnot c15 c20
cnot c15 c16
cnot c16 c14
cnot c14 c21
cnot c14 c17
cnot c14 c15
cnot c15 c13
cnot c13 c20
cnot c13 c16
cnot c13 c14
cnot c14 c12
cnot c12 c17
cnot c12 c16
cnot c12 c15
cnot c12 c14
cnot c12 c13
cnot c17 c19
cnot c16 c18
cnot c13 c11
cnot c11 c12
cnot c10 c11
cnot c31 c1
cnot c1 c2
cnot c0 c1
cnot c2 c8
cnot c0 c7
cnot c2 c6
cnot c0 c5
cnot c2 c4
cnot c0 c3
cnot c12 c18
cnot c10 c17
cnot c12 c16
cnot c10 c15
cnot c12 c14
cnot c10 c13
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
H c16
H c17
H c18
H c19
H c20
H c21
H c22
H c23
H c24
H c25
H c26
H c27
H c28
H c29
H c30
H c31
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
T c16
cnot a16 c16
T* c16
cnot b0 c16
T c16
cnot a16 c16
T* c16
cnot a15 c16
cnot b0 c16
T* c16
cnot b1 c16
T c16
cnot a15 c16
T* c16
cnot a6 c16
cnot b1 c16
T* c16
cnot b10 c16
T c16
cnot a6 c16
T* c16
cnot a5 c16
cnot b10 c16
T* c16
cnot b11 c16
T c16
cnot a5 c16
T* c16
cnot a4 c16
cnot b11 c16
T* c16
cnot b12 c16
T c16
cnot a4 c16
T* c16
cnot a3 c16
cnot b12 c16
T* c16
cnot b13 c16
T c16
cnot a3 c16
T* c16
cnot a2 c16
cnot b13 c16
T* c16
cnot b14 c16
T c16
cnot a2 c16
T* c16
cnot a1 c16
cnot b14 c16
T* c16
cnot b15 c16
T c16
cnot a1 c16
T* c16
cnot a0 c16
cnot b15 c16
T* c16
cnot b16 c16
T c16
cnot a0 c16
T* c16
cnot a14 c16
cnot b16 c16
T* c16
cnot b2 c16
T c16
cnot a14 c16
T* c16
cnot a13 c16
cnot b2 c16
T* c16
cnot b3 c16
T c16
cnot a13 c16
T* c16
cnot a12 c16
cnot b3 c16
T* c16
cnot b4 c16
T c16
cnot a12 c16
T* c16
cnot a11 c16
cnot b4 c16
T* c16
cnot b5 c16
T c16
cnot a11 c16
T* c16
cnot a10 c16
cnot b5 c16
T* c16
cnot b6 c16
T c16
cnot a10 c16
T* c16
cnot a9 c16
cnot b6 c16
T* c16
cnot b7 c16
T c16
cnot a9 c16
T* c16
cnot a8 c16
cnot b7 c16
T* c16
cnot b8 c16
T c16
cnot a8 c16
T* c16
cnot a7 c16
cnot b8 c16
T* c16
cnot b9 c16
T c16
cnot a7 c16
T* c16
cnot b9 c16
H c16
S c17
cnot a17 c17
T* c17
cnot b0 c17
T c17
cnot a17 c17
T* c17
cnot a16 c17
cnot b0 c17
T* c17
cnot b1 c17
T c17
cnot a16 c17
T* c17
cnot a7 c17
cnot b1 c17
T* c17
cnot b10 c17
T c17
cnot a7 c17
T* c17
cnot a6 c17
cnot b10 c17
T* c17
cnot b11 c17
T c17
cnot a6 c17
T* c17
cnot a5 c17
cnot b11 c17
T* c17
cnot b12 c17
T c17
cnot a5 c17
T* c17
cnot a4 c17
cnot b12 c17
T* c17
cnot b13 c17
T c17
cnot a4 c17
T* c17
cnot a3 c17
cnot b13 c17
T* c17
cnot b14 c17
T c17
cnot a3 c17
T* c17
cnot a2 c17
cnot b14 c17
T* c17
cnot b15 c17
T c17
cnot a2 c17
T* c17
cnot a1 c17
cnot b15 c17
T* c17
cnot b16 c17
T c17
cnot a1 c17
T* c17
cnot a0 c17
cnot b16 c17
T* c17
cnot b17 c17
T c17
cnot a0 c17
T* c17
cnot a15 c17
cnot b17 c17
T* c17
cnot b2 c17
T c17
cnot a15 c17
T* c17
cnot a14 c17
cnot b2 c17
T* c17
cnot b3 c17
T c17
cnot a14 c17
T* c17
cnot a13 c17
cnot b3 c17
T* c17
cnot b4 c17
T c17
cnot a13 c17
T* c17
cnot a12 c17
cnot b4 c17
T* c17
cnot b5 c17
T c17
cnot a12 c17
T* c17
cnot a11 c17
cnot b5 c17
T* c17
cnot b6 c17
T c17
cnot a11 c17
T* c17
cnot a10 c17
cnot b6 c17
T* c17
cnot b7 c17
T c17
cnot a10 c17
T* c17
cnot a9 c17
cnot b7 c17
T* c17
cnot b8 c17
T c17
cnot a9 c17
T* c17
cnot a8 c17
cnot b8 c17
T* c17
cnot b9 c17
T c17
cnot a8 c17
T* c17
cnot b9 c17
H c17
T* c18
Z c18
cnot a18 c18
T* c18
cnot b0 c18
T c18
cnot a18 c18
T* c18
cnot a17 c18
cnot b0 c18
T* c18
cnot b1 c18
T c18
cnot a17 c18
T* c18
cnot a8 c18
cnot b1 c18
T* c18
cnot b10 c18
T c18
cnot a8 c18
T* c18
cnot a7 c18
cnot b10 c18
T* c18
cnot b11 c18
T c18
cnot a7 c18
T* c18
cnot a6 c18
cnot b11 c18
T* c18
cnot b12 c18
T c18
cnot a6 c18
T* c18
cnot a5 c18
cnot b12 c18
T* c18
cnot b13 c18
T c18
cnot a5 c18
T* c18
cnot a4 c18
cnot b13 c18
T* c18
cnot b14 c18
T c18
cnot a4 c18
T* c18
cnot a3 c18
cnot b14 c18
T* c18
cnot b15 c18
T c18
cnot a3 c18
T* c18
cnot a2 c18
cnot b15 c18
T* c18
cnot b16 c18
T c18
cnot a2 c18
T* c18
cnot a1 c18
cnot b16 c18
T* c18
cnot b17 c18
T c18
cnot a1 c18
T* c18
cnot a0 c18
cnot b17 c18
T* c18
cnot b18 c18
T c18
cnot a0 c18
T* c18
cnot a16 c18
cnot b18 c18
T* c18
cnot b2 c18
T c18
cnot a16 c18
T* c18
cnot a15 c18
cnot b2 c18
T* c18
cnot b3 c18
T c18
cnot a15 c18
T* c18
cnot a14 c18
cnot b3 c18
T* c18
cnot b4 c18
T c18
cnot a14 c18
T* c18
cnot a13 c18
cnot b4 c18
T* c18
cnot b5 c18
T c18
cnot a13 c18
T* c18
cnot a12 c18
cnot b5 c18
T* c18
cnot b6 c18
T c18
cnot a12 c18
T* c18
cnot a11 c18
cnot b6 c18
T* c18
cnot b7 c18
T c18
cnot a11 c18
T* c18
cnot a10 c18
cnot b7 c18
T* c18
cnot b8 c18
T c18
cnot a10 c18
T* c18
cnot a9 c18
cnot b8 c18
T* c18
cnot b9 c18
T c18
cnot a9 c18
T* c18
cnot b9 c18
H c18
Z c19
cnot a19 c19
T* c19
cnot b0 c19
T c19
cnot a19 c19
T* c19
cnot a18 c19
cnot b0 c19
T* c19
cnot b1 c19
T c19
cnot a18 c19
T* c19
cnot a9 c19
cnot b1 c19
T* c19
cnot b10 c19
T c19
cnot a9 c19
T* c19
cnot a8 c19
cnot b10 c19
T* c19
cnot b11 c19
T c19
cnot a8 c19
T* c19
cnot a7 c19
cnot b11 c19
T* c19
cnot b12 c19
T c19
cnot a7 c19
T* c19
cnot a6 c19
cnot b12 c19
T* c19
cnot b13 c19
T c19
cnot a6 c19
T* c19
cnot a5 c19
cnot b13 c19
T* c19
cnot b14 c19
T c19
cnot a5 c19
T* c19
cnot a4 c19
cnot b14 c19
T* c19
cnot b15 c19
T c19
cnot a4 c19
T* c19
cnot a3 c19
cnot b15 c19
T* c19
cnot b16 c19
T c19
cnot a3 c19
T* c19
cnot a2 c19
cnot b16 c19
T* c19
cnot b17 c19
T c19
cnot a2 c19
T* c19
cnot a1 c19
cnot b17 c19
T* c19
cnot b18 c19
T c19
cnot a1 c19
T* c19
cnot a0 c19
cnot b18 c19
T* c19
cnot b19 c19
T c19
cnot a0 c19
T* c19
cnot a17 c19
cnot b19 c19
T* c19
cnot b2 c19
T c19
cnot a17 c19
T* c19
cnot a16 c19
cnot b2 c19
T* c19
cnot b3 c19
T c19
cnot a16 c19
T* c19
cnot a15 c19
cnot b3 c19
T* c19
cnot b4 c19
T c19
cnot a15 c19
T* c19
cnot a14 c19
cnot b4 c19
T* c19
cnot b5 c19
T c19
cnot a14 c19
T* c19
cnot a13 c19
cnot b5 c19
T* c19
cnot b6 c19
T c19
cnot a13 c19
T* c19
cnot a12 c19
cnot b6 c19
T* c19
cnot b7 c19
T c19
cnot a12 c19
T* c19
cnot a11 c19
cnot b7 c19
T* c19
cnot b8 c19
T c19
cnot a11 c19
T* c19
cnot a10 c19
cnot b8 c19
T* c19
cnot b9 c19
T c19
cnot a10 c19
T* c19
cnot b9 c19
H c19
T c20
Z c20
cnot a20 c20
T* c20
cnot b0 c20
T c20
cnot a20 c20
T* c20
cnot a19 c20
cnot b0 c20
T* c20
cnot b1 c20
T c20
cnot a19 c20
T* c20
cnot a10 c20
cnot b1 c20
T* c20
cnot b10 c20
T c20
cnot a10 c20
T* c20
cnot a9 c20
cnot b10 c20
T* c20
cnot b11 c20
T c20
cnot a9 c20
T* c20
cnot a8 c20
cnot b11 c20
T* c20
cnot b12 c20
T c20
cnot a8 c20
T* c20
cnot a7 c20
cnot b12 c20
T* c20
cnot b13 c20
T c20
cnot a7 c20
T* c20
cnot a6 c20
cnot b13 c20
T* c20
cnot b14 c20
T c20
cnot a6 c20
T* c20
cnot a5 c20
cnot b14 c20
T* c20
cnot b15 c20
T c20
cnot a5 c20
T* c20
cnot a4 c20
cnot b15 c20
T* c20
cnot b16 c20
T c20
cnot a4 c20
T* c20
cnot a3 c20
cnot b16 c20
T* c20
cnot b17 c20
T c20
cnot a3 c20
T* c20
cnot a2 c20
cnot b17 c20
T* c20
cnot b18 c20
T c20
cnot a2 c20
T* c20
cnot a1 c20
cnot b18 c20
T* c20
cnot b19 c20
T c20
cnot a1 c20
T* c20
cnot a18 c20
cnot b19 c20
T* c20
cnot b2 c20
T c20
cnot a18 c20
T* c20
cnot a0 c20
cnot b2 c20
T* c20
cnot b20 c20
T c20
cnot a0 c20
T* c20
cnot a17 c20
cnot b20 c20
T* c20
cnot b3 c20
T c20
cnot a17 c20
T* c20
cnot a16 c20
cnot b3 c20
T* c20
cnot b4 c20
T c20
cnot a16 c20
T* c20
cnot a15 c20
cnot b4 c20
T* c20
cnot b5 c20
T c20
cnot a15 c20
T* c20
cnot a14 c20
cnot b5 c20
T* c20
cnot b6 c20
T c20
cnot a14 c20
T* c20
cnot a13 c20
cnot b6 c20
T* c20
cnot b7 c20
T c20
cnot a13 c20
T* c20
cnot a12 c20
cnot b7 c20
T* c20
cnot b8 c20
T c20
cnot a12 c20
T* c20
cnot a11 c20
cnot b8 c20
T* c20
cnot b9 c20
T c20
cnot a11 c20
T* c20
cnot b9 c20
H c20
S* c21
cnot a21 c21
T* c21
cnot b0 c21
T c21
cnot a21 c21
T* c21
cnot a20 c21
cnot b0 c21
T* c21
cnot b1 c21
T c21
cnot a20 c21
T* c21
cnot a11 c21
cnot b1 c21
T* c21
cnot b10 c21
T c21
cnot a11 c21
T* c21
cnot a10 c21
cnot b10 c21
T* c21
cnot b11 c21
T c21
cnot a10 c21
T* c21
cnot a9 c21
cnot b11 c21
T* c21
cnot b12 c21
T c21
cnot a9 c21
T* c21
cnot a8 c21
cnot b12 c21
T* c21
cnot b13 c21
T c21
cnot a8 c21
T* c21
cnot a7 c21
cnot b13 c21
T* c21
cnot b14 c21
T c21
cnot a7 c21
T* c21
cnot a6 c21
cnot b14 c21
T* c21
cnot b15 c21
T c21
cnot a6 c21
T* c21
cnot a5 c21
cnot b15 c21
T* c21
cnot b16 c21
T c21
cnot a5 c21
T* c21
cnot a4 c21
cnot b16 c21
T* c21
cnot b17 c21
T c21
cnot a4 c21
T* c21
cnot a3 c21
cnot b17 c21
T* c21
cnot b18 c21
T c21
cnot a3 c21
T* c21
cnot a2 c21
cnot b18 c21
T* c21
cnot b19 c21
T c21
cnot a2 c21
T* c21
cnot a19 c21
cnot b19 c21
T* c21
cnot b2 c21
T c21
cnot a19 c21
T* c21
cnot a1 c21
cnot b2 c21
T* c21
cnot b20 c21
T c21
cnot a1 c21
T* c21
cnot a0 c21
cnot b20 c21
T* c21
cnot b21 c21
T c21
cnot a0 c21
T* c21
cnot a18 c21
cnot b21 c21
T* c21
cnot b3 c21
T c21
cnot a18 c21
T* c21
cnot a17 c21
cnot b3 c21
T* c21
cnot b4 c21
T c21
cnot a17 c21
T* c21
cnot a16 c21
cnot b4 c21
T* c21
cnot b5 c21
T c21
cnot a16 c21
T* c21
cnot a15 c21
cnot b5 c21
T* c21
cnot b6 c21
T c21
cnot a15 c21
T* c21
cnot a14 c21
cnot b6 c21
T* c21
cnot b7 c21
T c21
cnot a14 c21
T* c21
cnot a13 c21
cnot b7 c21
T* c21
cnot b8 c21
T c21
cnot a13 c21
T* c21
cnot a12 c21
cnot b8 c21
T* c21
cnot b9 c21
T c21
cnot a12 c21
T* c21
cnot b9 c21
H c21
T* c22
cnot a22 c22
T* c22
cnot b0 c22
T c22
cnot a22 c22
T* c22
cnot a21 c22
cnot b0 c22
T* c22
cnot b1 c22
T c22
cnot a21 c22
T* c22
cnot a12 c22
cnot b1 c22
T* c22
cnot b10 c22
T c22
cnot a12 c22
T* c22
cnot a11 c22
cnot b10 c22
T* c22
cnot b11 c22
T c22
cnot a11 c22
T* c22
cnot a10 c22
cnot b11 c22
T* c22
cnot b12 c22
T c22
cnot a10 c22
T* c22
cnot a9 c22
cnot b12 c22
T* c22
cnot b13 c22
T c22
cnot a9 c22
T* c22
cnot a8 c22
cnot b13 c22
T* c22
cnot b14 c22
T c22
cnot a8 c22
T* c22
cnot a7 c22
cnot b14 c22
T* c22
cnot b15 c22
T c22
cnot a7 c22
T* c22
cnot a6 c22
cnot b15 c22
T* c22
cnot b16 c22
T c22
cnot a6 c22
T* c22
cnot a5 c22
cnot b16 c22
T* c22
cnot b17 c22
T c22
cnot a5 c22
T* c22
cnot a4 c22
cnot b17 c22
T* c22
cnot b18 c22
T c22
cnot a4 c22
T* c22
cnot a3 c22
cnot b18 c22
T* c22
cnot b19 c22
T c22
cnot a3 c22
T* c22
cnot a20 c22
cnot b19 c22
T* c22
cnot b2 c22
T c22
cnot a20 c22
T* c22
cnot a2 c22
cnot b2 c22
T* c22
cnot b20 c22
T c22
cnot a2 c22
T* c22
cnot a1 c22
cnot b20 c22
T* c22
cnot b21 c22
T c22
cnot a1 c22
T* c22
cnot a0 c22
cnot b21 c22
T* c22
cnot b22 c22
T c22
cnot a0 c22
T* c22
cnot a19 c22
cnot b22 c22
T* c22
cnot b3 c22
T c22
cnot a19 c22
T* c22
cnot a18 c22
cnot b3 c22
T* c22
cnot b4 c22
T c22
cnot a18 c22
T* c22
cnot a17 c22
cnot b4 c22
T* c22
cnot b5 c22
T c22
cnot a17 c22
T* c22
cnot a16 c22
cnot b5 c22
T* c22
cnot b6 c22
T c22
cnot a16 c22
T* c22
cnot a15 c22
cnot b6 c22
T* c22
cnot b7 c22
T c22
cnot a15 c22
T* c22
cnot a14 c22
cnot b7 c22
T* c22
cnot b8 c22
T c22
cnot a14 c22
T* c22
cnot a13 c22
cnot b8 c22
T* c22
cnot b9 c22
T c22
cnot a13 c22
T* c22
cnot b9 c22
H c22
cnot a23 c23
T* c23
cnot b0 c23
T c23
cnot a23 c23
T* c23
cnot a22 c23
cnot b0 c23
T* c23
cnot b1 c23
T c23
cnot a22 c23
T* c23
cnot a13 c23
cnot b1 c23
T* c23
cnot b10 c23
T c23
cnot a13 c23
T* c23
cnot a12 c23
cnot b10 c23
T* c23
cnot b11 c23
T c23
cnot a12 c23
T* c23
cnot a11 c23
cnot b11 c23
T* c23
cnot b12 c23
T c23
cnot a11 c23
T* c23
cnot a10 c23
cnot b12 c23
T* c23
cnot b13 c23
T c23
cnot a10 c23
T* c23
cnot a9 c23
cnot b13 c23
T* c23
cnot b14 c23
T c23
cnot a9 c23
T* c23
cnot a8 c23
cnot b14 c23
T* c23
cnot b15 c23
T c23
cnot a8 c23
T* c23
cnot a7 c23
cnot b15 c23
T* c23
cnot b16 c23
T c23
cnot a7 c23
T* c23
cnot a6 c23
cnot b16 c23
T* c23
cnot b17 c23
T c23
cnot a6 c23
T* c23
cnot a5 c23
cnot b17 c23
T* c23
cnot b18 c23
T c23
cnot a5 c23
T* c23
cnot a4 c23
cnot b18 c23
T* c23
cnot b19 c23
T c23
cnot a4 c23
T* c23
cnot a21 c23
cnot b19 c23
T* c23
cnot b2 c23
T c23
cnot a21 c23
T* c23
cnot a3 c23
cnot b2 c23
T* c23
cnot b20 c23
T c23
cnot a3 c23
T* c23
cnot a2 c23
cnot b20 c23
T* c23
cnot b21 c23
T c23
cnot a2 c23
T* c23
cnot a1 c23
cnot b21 c23
T* c23
cnot b22 c23
T c23
cnot a1 c23
T* c23
cnot a0 c23
cnot b22 c23
T* c23
cnot b23 c23
T c23
cnot a0 c23
T* c23
cnot a20 c23
cnot b23 c23
T* c23
cnot b3 c23
T c23
cnot a20 c23
T* c23
cnot a19 c23
cnot b3 c23
T* c23
cnot b4 c23
T c23
cnot a19 c23
T* c23
cnot a18 c23
cnot b4 c23
T* c23
cnot b5 c23
T c23
cnot a18 c23
T* c23
cnot a17 c23
cnot b5 c23
T* c23
cnot b6 c23
T c23
cnot a17 c23
T* c23
cnot a16 c23
cnot b6 c23
T* c23
cnot b7 c23
T c23
cnot a16 c23
T* c23
cnot a15 c23
cnot b7 c23
T* c23
cnot b8 c23
T c23
cnot a15 c23
T* c23
cnot a14 c23
cnot b8 c23
T* c23
cnot b9 c23
T c23
cnot a14 c23
T* c23
cnot b9 c23
H c23
T c24
cnot a24 c24
T* c24
cnot b0 c24
T c24
cnot a24 c24
T* c24
cnot a23 c24
cnot b0 c24
T* c24
cnot b1 c24
T c24
cnot a23 c24
T* c24
cnot a14 c24
cnot b1 c24
T* c24
cnot b10 c24
T c24
cnot a14 c24
T* c24
cnot a13 c24
cnot b10 c24
T* c24
cnot b11 c24
T c24
cnot a13 c24
T* c24
cnot a12 c24
cnot b11 c24
T* c24
cnot b12 c24
T c24
cnot a12 c24
T* c24
cnot a11 c24
cnot b12 c24
T* c24
cnot b13 c24
T c24
cnot a11 c24
T* c24
cnot a10 c24
cnot b13 c24
T* c24
cnot b14 c24
T c24
cnot a10 c24
T* c24
cnot a9 c24
cnot b14 c24
T* c24
cnot b15 c24
T c24
cnot a9 c24
T* c24
cnot a8 c24
cnot b15 c24
T* c24
cnot b16 c24
T c24
cnot a8 c24
T* c24
cnot a7 c24
cnot b16 c24
T* c24
cnot b17 c24
T c24
cnot a7 c24
T* c24
cnot a6 c24
cnot b17 c24
T* c24
cnot b18 c24
T c24
cnot a6 c24
T* c24
cnot a5 c24
cnot b18 c24
T* c24
cnot b19 c24
T c24
cnot a5 c24
T* c24
cnot a22 c24
cnot b19 c24
T* c24
cnot b2 c24
T c24
cnot a22 c24
T* c24
cnot a4 c24
cnot b2 c24
T* c24
cnot b20 c24
T c24
cnot a4 c24
T* c24
cnot a3 c24
cnot b20 c24
T* c24
cnot b21 c24
T c24
cnot a3 c24
T* c24
cnot a2 c24
cnot b21 c24
T* c24
cnot b22 c24
T c24
cnot a2 c24
T* c24
cnot a1 c24
cnot b22 c24
T* c24
cnot b23 c24
T c24
cnot a1 c24
T* c24
cnot a0 c24
cnot b23 c24
T* c24
cnot b24 c24
T c24
cnot a0 c24
T* c24
cnot a21 c24
cnot b24 c24
T* c24
cnot b3 c24
T c24
cnot a21 c24
T* c24
cnot a20 c24
cnot b3 c24
T* c24
cnot b4 c24
T c24
cnot a20 c24
T* c24
cnot a19 c24
cnot b4 c24
T* c24
cnot b5 c24
T c24
cnot a19 c24
T* c24
cnot a18 c24
cnot b5 c24
T* c24
cnot b6 c24
T c24
cnot a18 c24
T* c24
cnot a17 c24
cnot b6 c24
T* c24
cnot b7 c24
T c24
cnot a17 c24
T* c24
cnot a16 c24
cnot b7 c24
T* c24
cnot b8 c24
T c24
cnot a16 c24
T* c24
cnot a15 c24
cnot b8 c24
T* c24
cnot b9 c24
T c24
cnot a15 c24
T* c24
cnot b9 c24
H c24
S c25
cnot a25 c25
T* c25
cnot b0 c25
T c25
cnot a25 c25
T* c25
cnot a24 c25
cnot b0 c25
T* c25
cnot b1 c25
T c25
cnot a24 c25
T* c25
cnot a15 c25
cnot b1 c25
T* c25
cnot b10 c25
T c25
cnot a15 c25
T* c25
cnot a14 c25
cnot b10 c25
T* c25
cnot b11 c25
T c25
cnot a14 c25
T* c25
cnot a13 c25
cnot b11 c25
T* c25
cnot b12 c25
T c25
cnot a13 c25
T* c25
cnot a12 c25
cnot b12 c25
T* c25
cnot b13 c25
T c25
cnot a12 c25
T* c25
cnot a11 c25
cnot b13 c25
T* c25
cnot b14 c25
T c25
cnot a11 c25
T* c25
cnot a10 c25
cnot b14 c25
T* c25
cnot b15 c25
T c25
cnot a10 c25
T* c25
cnot a9 c25
cnot b15 c25
T* c25
cnot b16 c25
T c25
cnot a9 c25
T* c25
cnot a8 c25
cnot b16 c25
T* c25
cnot b17 c25
T c25
cnot a8 c25
T* c25
cnot a7 c25
cnot b17 c25
T* c25
cnot b18 c25
T c25
cnot a7 c25
T* c25
cnot a6 c25
cnot b18 c25
T* c25
cnot b19 c25
T c25
cnot a6 c25
T* c25
cnot a23 c25
cnot b19 c25
T* c25
cnot b2 c25
T c25
cnot a23 c25
T* c25
cnot a5 c25
cnot b2 c25
T* c25
cnot b20 c25
T c25
cnot a5 c25
T* c25
cnot a4 c25
cnot b20 c25
T* c25
cnot b21 c25
T c25
cnot a4 c25
T* c25
cnot a3 c25
cnot b21 c25
T* c25
cnot b22 c25
T c25
cnot a3 c25
T* c25
cnot a2 c25
cnot b22 c25
T* c25
cnot b23 c25
T c25
cnot a2 c25
T* c25
cnot a1 c25
cnot b23 c25
T* c25
cnot b24 c25
T c25
cnot a1 c25
T* c25
cnot a0 c25
cnot b24 c25
T* c25
cnot b25 c25
T c25
cnot a0 c25
T* c25
cnot a22 c25
cnot b25 c25
T* c25
cnot b3 c25
T c25
cnot a22 c25
T* c25
cnot a21 c25
cnot b3 c25
T* c25
cnot b4 c25
T c25
cnot a21 c25
T* c25
cnot a20 c25
cnot b4 c25
T* c25
cnot b5 c25
T c25
cnot a20 c25
T* c25
cnot a19 c25
cnot b5 c25
T* c25
cnot b6 c25
T c25
cnot a19 c25
T* c25
cnot a18 c25
cnot b6 c25
T* c25
cnot b7 c25
T c25
cnot a18 c25
T* c25
cnot a17 c25
cnot b7 c25
T* c25
cnot b8 c25
T c25
cnot a17 c25
T* c25
cnot a16 c25
cnot b8 c25
T* c25
cnot b9 c25
T c25
cnot a16 c25
T* c25
cnot b9 c25
H c25
T* c26
Z c26
cnot a26 c26
T* c26
cnot b0 c26
T c26
cnot a26 c26
T* c26
cnot a25 c26
cnot b0 c26
T* c26
cnot b1 c26
T c26
cnot a25 c26
T* c26
cnot a16 c26
cnot b1 c26
T* c26
cnot b10 c26
T c26
cnot a16 c26
T* c26
cnot a15 c26
cnot b10 c26
T* c26
cnot b11 c26
T c26
cnot a15 c26
T* c26
cnot a14 c26
cnot b11 c26
T* c26
cnot b12 c26
T c26
cnot a14 c26
T* c26
cnot a13 c26
cnot b12 c26
T* c26
cnot b13 c26
T c26
cnot a13 c26
T* c26
cnot a12 c26
cnot b13 c26
T* c26
cnot b14 c26
T c26
cnot a12 c26
T* c26
cnot a11 c26
cnot b14 c26
T* c26
cnot b15 c26
T c26
cnot a11 c26
T* c26
cnot a10 c26
cnot b15 c26
T* c26
cnot b16 c26
T c26
cnot a10 c26
T* c26
cnot a9 c26
cnot b16 c26
T* c26
cnot b17 c26
T c26
cnot a9 c26
T* c26
cnot a8 c26
cnot b17 c26
T* c26
cnot b18 c26
T c26
cnot a8 c26
T* c26
cnot a7 c26
cnot b18 c26
T* c26
cnot b19 c26
T c26
cnot a7 c26
T* c26
cnot a24 c26
cnot b19 c26
T* c26
cnot b2 c26
T c26
cnot a24 c26
T* c26
cnot a6 c26
cnot b2 c26
T* c26
cnot b20 c26
T c26
cnot a6 c26
T* c26
cnot a5 c26
cnot b20 c26
T* c26
cnot b21 c26
T c26
cnot a5 c26
T* c26
cnot a4 c26
cnot b21 c26
T* c26
cnot b22 c26
T c26
cnot a4 c26
T* c26
cnot a3 c26
cnot b22 c26
T* c26
cnot b23 c26
T c26
cnot a3 c26
T* c26
cnot a2 c26
cnot b23 c26
T* c26
cnot b24 c26
T c26
cnot a2 c26
T* c26
cnot a1 c26
cnot b24 c26
T* c26
cnot b25 c26
T c26
cnot a1 c26
T* c26
cnot a0 c26
cnot b25 c26
T* c26
cnot b26 c26
T c26
cnot a0 c26
T* c26
cnot a23 c26
cnot b26 c26
T* c26
cnot b3 c26
T c26
cnot a23 c26
T* c26
cnot a22 c26
cnot b3 c26
T* c26
cnot b4 c26
T c26
cnot a22 c26
T* c26
cnot a21 c26
cnot b4 c26
T* c26
cnot b5 c26
T c26
cnot a21 c26
T* c26
cnot a20 c26
cnot b5 c26
T* c26
cnot b6 c26
T c26
cnot a20 c26
T* c26
cnot a19 c26
cnot b6 c26
T* c26
cnot b7 c26
T c26
cnot a19 c26
T* c26
cnot a18 c26
cnot b7 c26
T* c26
cnot b8 c26
T c26
cnot a18 c26
T* c26
cnot a17 c26
cnot b8 c26
T* c26
cnot b9 c26
T c26
cnot a17 c26
T* c26
cnot b9 c26
H c26
Z c27
cnot a27 c27
T* c27
cnot b0 c27
T c27
cnot a27 c27
T* c27
cnot a26 c27
cnot b0 c27
T* c27
cnot b1 c27
T c27
cnot a26 c27
T* c27
cnot a17 c27
cnot b1 c27
T* c27
cnot b10 c27
T c27
cnot a17 c27
T* c27
cnot a16 c27
cnot b10 c27
T* c27
cnot b11 c27
T c27
cnot a16 c27
T* c27
cnot a15 c27
cnot b11 c27
T* c27
cnot b12 c27
T c27
cnot a15 c27
T* c27
cnot a14 c27
cnot b12 c27
T* c27
cnot b13 c27
T c27
cnot a14 c27
T* c27
cnot a13 c27
cnot b13 c27
T* c27
cnot b14 c27
T c27
cnot a13 c27
T* c27
cnot a12 c27
cnot b14 c27
T* c27
cnot b15 c27
T c27
cnot a12 c27
T* c27
cnot a11 c27
cnot b15 c27
T* c27
cnot b16 c27
T c27
cnot a11 c27
T* c27
cnot a10 c27
cnot b16 c27
T* c27
cnot b17 c27
T c27
cnot a10 c27
T* c27
cnot a9 c27
cnot b17 c27
T* c27
cnot b18 c27
T c27
cnot a9 c27
T* c27
cnot a8 c27
cnot b18 c27
T* c27
cnot b19 c27
T c27
cnot a8 c27
T* c27
cnot a25 c27
cnot b19 c27
T* c27
cnot b2 c27
T c27
cnot a25 c27
T* c27
cnot a7 c27
cnot b2 c27
T* c27
cnot b20 c27
T c27
cnot a7 c27
T* c27
cnot a6 c27
cnot b20 c27
T* c27
cnot b21 c27
T c27
cnot a6 c27
T* c27
cnot a5 c27
cnot b21 c27
T* c27
cnot b22 c27
T c27
cnot a5 c27
T* c27
cnot a4 c27
cnot b22 c27
T* c27
cnot b23 c27
T c27
cnot a4 c27
T* c27
cnot a3 c27
cnot b23 c27
T* c27
cnot b24 c27
T c27
cnot a3 c27
T* c27
cnot a2 c27
cnot b24 c27
T* c27
cnot b25 c27
T c27
cnot a2 c27
T* c27
cnot a1 c27
cnot b25 c27
T* c27
cnot b26 c27
T c27
cnot a1 c27
T* c27
cnot a0 c27
cnot b26 c27
T* c27
cnot b27 c27
T c27
cnot a0 c27
T* c27
cnot a24 c27
cnot b27 c27
T* c27
cnot b3 c27
T c27
cnot a24 c27
T* c27
cnot a23 c27
cnot b3 c27
T* c27
cnot b4 c27
T c27
cnot a23 c27
T* c27
cnot a22 c27
cnot b4 c27
T* c27
cnot b5 c27
T c27
cnot a22 c27
T* c27
cnot a21 c27
cnot b5 c27
T* c27
cnot b6 c27
T c27
cnot a21 c27
T* c27
cnot a20 c27
cnot b6 c27
T* c27
cnot b7 c27
T c27
cnot a20 c27
T* c27
cnot a19 c27
cnot b7 c27
T* c27
cnot b8 c27
T c27
cnot a19 c27
T* c27
cnot a18 c27
cnot b8 c27
T* c27
cnot b9 c27
T c27
cnot a18 c27
T* c27
cnot b9 c27
H c27
T c28
Z c28
cnot a28 c28
T* c28
cnot b0 c28
T c28
cnot a28 c28
T* c28
cnot a27 c28
cnot b0 c28
T* c28
cnot b1 c28
T c28
cnot a27 c28
T* c28
cnot a18 c28
cnot b1 c28
T* c28
cnot b10 c28
T c28
cnot a18 c28
T* c28
cnot a17 c28
cnot b10 c28
T* c28
cnot b11 c28
T c28
cnot a17 c28
T* c28
cnot a16 c28
cnot b11 c28
T* c28
cnot b12 c28
T c28
cnot a16 c28
T* c28
cnot a15 c28
cnot b12 c28
T* c28
cnot b13 c28
T c28
cnot a15 c28
T* c28
cnot a14 c28
cnot b13 c28
T* c28
cnot b14 c28
T c28
cnot a14 c28
T* c28
cnot a13 c28
cnot b14 c28
T* c28
cnot b15 c28
T c28
cnot a13 c28
T* c28
cnot a12 c28
cnot b15 c28
T* c28
cnot b16 c28
T c28
cnot a12 c28
T* c28
cnot a11 c28
cnot b16 c28
T* c28
cnot b17 c28
T c28
cnot a11 c28
T* c28
cnot a10 c28
cnot b17 c28
T* c28
cnot b18 c28
T c28
cnot a10 c28
T* c28
cnot a9 c28
cnot b18 c28
T* c28
cnot b19 c28
T c28
cnot a9 c28
T* c28
cnot a26 c28
cnot b19 c28
T* c28
cnot b2 c28
T c28
cnot a26 c28
T* c28
cnot a8 c28
cnot b2 c28
T* c28
cnot b20 c28
T c28
cnot a8 c28
T* c28
cnot a7 c28
cnot b20 c28
T* c28
cnot b21 c28
T c28
cnot a7 c28
T* c28
cnot a6 c28
cnot b21 c28
T* c28
cnot b22 c28
T c28
cnot a6 c28
T* c28
cnot a5 c28
cnot b22 c28
T* c28
cnot b23 c28
T c28
cnot a5 c28
T* c28
cnot a4 c28
cnot b23 c28
T* c28
cnot b24 c28
T c28
cnot a4 c28
T* c28
cnot a3 c28
cnot b24 c28
T* c28
cnot b25 c28
T c28
cnot a3 c28
T* c28
cnot a2 c28
cnot b25 c28
T* c28
cnot b26 c28
T c28
cnot a2 c28
T* c28
cnot a1 c28
cnot b26 c28
T* c28
cnot b27 c28
T c28
cnot a1 c28
T* c28
cnot a0 c28
cnot b27 c28
T* c28
cnot b28 c28
T c28
cnot a0 c28
T* c28
cnot a25 c28
cnot b28 c28
T* c28
cnot b3 c28
T c28
cnot a25 c28
T* c28
cnot a24 c28
cnot b3 c28
T* c28
cnot b4 c28
T c28
cnot a24 c28
T* c28
cnot a23 c28
cnot b4 c28
T* c28
cnot b5 c28
T c28
cnot a23 c28
T* c28
cnot a22 c28
cnot b5 c28
T* c28
cnot b6 c28
T c28
cnot a22 c28
T* c28
cnot a21 c28
cnot b6 c28
T* c28
cnot b7 c28
T c28
cnot a21 c28
T* c28
cnot a20 c28
cnot b7 c28
T* c28
cnot b8 c28
T c28
cnot a20 c28
T* c28
cnot a19 c28
cnot b8 c28
T* c28
cnot b9 c28
T c28
cnot a19 c28
T* c28
cnot b9 c28
H c28
S* c29
cnot a29 c29
T* c29
cnot b0 c29
T c29
cnot a29 c29
T* c29
cnot a28 c29
cnot b0 c29
T* c29
cnot b1 c29
T c29
cnot a28 c29
T* c29
cnot a19 c29
cnot b1 c29
T* c29
cnot b10 c29
T c29
cnot a19 c29
T* c29
cnot a18 c29
cnot b10 c29
T* c29
cnot b11 c29
T c29
cnot a18 c29
T* c29
cnot a17 c29
cnot b11 c29
T* c29
cnot b12 c29
T c29
cnot a17 c29
T* c29
cnot a16 c29
cnot b12 c29
T* c29
cnot b13 c29
T c29
cnot a16 c29
T* c29
cnot a15 c29
cnot b13 c29
T* c29
cnot b14 c29
T c29
cnot a15 c29
T* c29
cnot a14 c29
cnot b14 c29
T* c29
cnot b15 c29
T c29
cnot a14 c29
T* c29
cnot a13 c29
cnot b15 c29
T* c29
cnot b16 c29
T c29
cnot a13 c29
T* c29
cnot a12 c29
cnot b16 c29
T* c29
cnot b17 c29
T c29
cnot a12 c29
T* c29
cnot a11 c29
cnot b17 c29
T* c29
cnot b18 c29
T c29
cnot a11 c29
T* c29
cnot a10 c29
cnot b18 c29
T* c29
cnot b19 c29
T c29
cnot a10 c29
T* c29
cnot a27 c29
cnot b19 c29
T* c29
cnot b2 c29
T c29
cnot a27 c29
T* c29
cnot a9 c29
cnot b2 c29
T* c29
cnot b20 c29
T c29
cnot a9 c29
T* c29
cnot a8 c29
cnot b20 c29
T* c29
cnot b21 c29
T c29
cnot a8 c29
T* c29
cnot a7 c29
cnot b21 c29
T* c29
cnot b22 c29
T c29
cnot a7 c29
T* c29
cnot a6 c29
cnot b22 c29
T* c29
cnot b23 c29
T c29
cnot a6 c29
T* c29
cnot a5 c29
cnot b23 c29
T* c29
cnot b24 c29
T c29
cnot a5 c29
T* c29
cnot a4 c29
cnot b24 c29
T* c29
cnot b25 c29
T c29
cnot a4 c29
T* c29
cnot a3 c29
cnot b25 c29
T* c29
cnot b26 c29
T c29
cnot a3 c29
T* c29
cnot a2 c29
cnot b26 c29
T* c29
cnot b27 c29
T c29
cnot a2 c29
T* c29
cnot a1 c29
cnot b27 c29
T* c29
cnot b28 c29
T c29
cnot a1 c29
T* c29
cnot a0 c29
cnot b28 c29
T* c29
cnot b29 c29
T c29
cnot a0 c29
T* c29
cnot a26 c29
cnot b29 c29
T* c29
cnot b3 c29
T c29
cnot a26 c29
T* c29
cnot a25 c29
cnot b3 c29
T* c29
cnot b4 c29
T c29
cnot a25 c29
T* c29
cnot a24 c29
cnot b4 c29
T* c29
cnot b5 c29
T c29
cnot a24 c29
T* c29
cnot a23 c29
cnot b5 c29
T* c29
cnot b6 c29
T c29
cnot a23 c29
T* c29
cnot a22 c29
cnot b6 c29
T* c29
cnot b7 c29
T c29
cnot a22 c29
T* c29
cnot a21 c29
cnot b7 c29
T* c29
cnot b8 c29
T c29
cnot a21 c29
T* c29
cnot a20 c29
cnot b8 c29
T* c29
cnot b9 c29
T c29
cnot a20 c29
T* c29
cnot b9 c29
H c29
T* c30
cnot a30 c30
T* c30
cnot b0 c30
T c30
cnot a30 c30
T* c30
cnot a29 c30
cnot b0 c30
T* c30
cnot b1 c30
T c30
cnot a29 c30
T* c30
cnot a20 c30
cnot b1 c30
T* c30
cnot b10 c30
T c30
cnot a20 c30
T* c30
cnot a19 c30
cnot b10 c30
T* c30
cnot b11 c30
T c30
cnot a19 c30
T* c30
cnot a18 c30
cnot b11 c30
T* c30
cnot b12 c30
T c30
cnot a18 c30
T* c30
cnot a17 c30
cnot b12 c30
T* c30
cnot b13 c30
T c30
cnot a17 c30
T* c30
cnot a16 c30
cnot b13 c30
T* c30
cnot b14 c30
T c30
cnot a16 c30
T* c30
cnot a15 c30
cnot b14 c30
T* c30
cnot b15 c30
T c30
cnot a15 c30
T* c30
cnot a14 c30
cnot b15 c30
T* c30
cnot b16 c30
T c30
cnot a14 c30
T* c30
cnot a13 c30
cnot b16 c30
T* c30
cnot b17 c30
T c30
cnot a13 c30
T* c30
cnot a12 c30
cnot b17 c30
T* c30
cnot b18 c30
T c30
cnot a12 c30
T* c30
cnot a11 c30
cnot b18 c30
T* c30
cnot b19 c30
T c30
cnot a11 c30
T* c30
cnot a28 c30
cnot b19 c30
T* c30
cnot b2 c30
T c30
cnot a28 c30
T* c30
cnot a10 c30
cnot b2 c30
T* c30
cnot b20 c30
T c30
cnot a10 c30
T* c30
cnot a9 c30
cnot b20 c30
T* c30
cnot b21 c30
T c30
cnot a9 c30
T* c30
cnot a8 c30
cnot b21 c30
T* c30
cnot b22 c30
T c30
cnot a8 c30
T* c30
cnot a7 c30
cnot b22 c30
T* c30
cnot b23 c30
T c30
cnot a7 c30
T* c30
cnot a6 c30
cnot b23 c30
T* c30
cnot b24 c30
T c30
cnot a6 c30
T* c30
cnot a5 c30
cnot b24 c30
T* c30
cnot b25 c30
T c30
cnot a5 c30
T* c30
cnot a4 c30
cnot b25 c30
T* c30
cnot b26 c30
T c30
cnot a4 c30
T* c30
cnot a3 c30
cnot b26 c30
T* c30
cnot b27 c30
T c30
cnot a3 c30
T* c30
cnot a2 c30
cnot b27 c30
T* c30
cnot b28 c30
T c30
cnot a2 c30
T* c30
cnot a1 c30
cnot b28 c30
T* c30
cnot b29 c30
T c30
cnot a1 c30
T* c30
cnot a27 c30
cnot b29 c30
T* c30
cnot b3 c30
T c30
cnot a27 c30
T* c30
cnot a0 c30
cnot b3 c30
T* c30
cnot b30 c30
T c30
cnot a0 c30
T* c30
cnot a26 c30
cnot b30 c30
T* c30
cnot b4 c30
T c30
cnot a26 c30
T* c30
cnot a25 c30
cnot b4 c30
T* c30
cnot b5 c30
T c30
cnot a25 c30
T* c30
cnot a24 c30
cnot b5 c30
T* c30
cnot b6 c30
T c30
cnot a24 c30
T* c30
cnot a23 c30
cnot b6 c30
T* c30
cnot b7 c30
T c30
cnot a23 c30
T* c30
cnot a22 c30
cnot b7 c30
T* c30
cnot b8 c30
T c30
cnot a22 c30
T* c30
cnot a21 c30
cnot b8 c30
T* c30
cnot b9 c30
T c30
cnot a21 c30
T* c30
cnot b9 c30
H c30
cnot a31 c31
T* c31
cnot b0 c31
T c31
cnot a31 c31
T* c31
cnot a30 c31
cnot b0 c31
T* c31
cnot b1 c31
T c31
cnot a30 c31
T* c31
cnot a21 c31
cnot b1 c31
T* c31
cnot b10 c31
T c31
cnot a21 c31
T* c31
cnot a20 c31
cnot b10 c31
T* c31
cnot b11 c31
T c31
cnot a20 c31
T* c31
cnot a19 c31
cnot b11 c31
T* c31
cnot b12 c31
T c31
cnot a19 c31
T* c31
cnot a18 c31
cnot b12 c31
T* c31
cnot b13 c31
T c31
cnot a18 c31
T* c31
cnot a17 c31
cnot b13 c31
T* c31
cnot b14 c31
T c31
cnot a17 c31
T* c31
cnot a16 c31
cnot b14 c31
T* c31
cnot b15 c31
T c31
cnot a16 c31
T* c31
cnot a15 c31
cnot b15 c31
T* c31
cnot b16 c31
T c31
cnot a15 c31
T* c31
cnot a14 c31
cnot b16 c31
T* c31
cnot b17 c31
T c31
cnot a14 c31
T* c31
cnot a13 c31
cnot b17 c31
T* c31
cnot b18 c31
T c31
cnot a13 c31
T* c31
cnot a12 c31
cnot b18 c31
T* c31
cnot b19 c31
T c31
cnot a12 c31
T* c31
cnot a29 c31
cnot b19 c31
T* c31
cnot b2 c31
T c31
cnot a29 c31
T* c31
cnot a11 c31
cnot b2 c31
T* c31
cnot b20 c31
T c31
cnot a11 c31
T* c31
cnot a10 c31
cnot b20 c31
T* c31
cnot b21 c31
T c31
cnot a10 c31
T* c31
cnot a9 c31
cnot b21 c31
T* c31
cnot b22 c31
T c31
cnot a9 c31
T* c31
cnot a8 c31
cnot b22 c31
T* c31
cnot b23 c31
T c31
cnot a8 c31
T* c31
cnot a7 c31
cnot b23 c31
T* c31
cnot b24 c31
T c31
cnot a7 c31
T* c31
cnot a6 c31
cnot b24 c31
T* c31
cnot b25 c31
T c31
cnot a6 c31
T* c31
cnot a5 c31
cnot b25 c31
T* c31
cnot b26 c31
T c31
cnot a5 c31
T* c31
cnot a4 c31
cnot b26 c31
T* c31
cnot b27 c31
T c31
cnot a4 c31
T* c31
cnot a3 c31
cnot b27 c31
T* c31
cnot b28 c31
T c31
cnot a3 c31
T* c31
cnot a2 c31
cnot b28 c31
T* c31
cnot b29 c31
T c31
cnot a2 c31
T* c31
cnot a28 c31
cnot b29 c31
T* c31
cnot b3 c31
T c31
cnot a28 c31
T* c31
cnot a1 c31
cnot b3 c31
T* c31
cnot b30 c31
T c31
cnot a1 c31
T* c31
cnot a0 c31
cnot b30 c31
T* c31
cnot b31 c31
T c31
cnot a0 c31
T* c31
cnot a27 c31
cnot b31 c31
T* c31
cnot b4 c31
T c31
cnot a27 c31
T* c31
cnot a26 c31
cnot b4 c31
T* c31
cnot b5 c31
T c31
cnot a26 c31
T* c31
cnot a25 c31
cnot b5 c31
T* c31
cnot b6 c31
T c31
cnot a25 c31
T* c31
cnot a24 c31
cnot b6 c31
T* c31
cnot b7 c31
T c31
cnot a24 c31
T* c31
cnot a23 c31
cnot b7 c31
T* c31
cnot b8 c31
T c31
cnot a23 c31
T* c31
cnot a22 c31
cnot b8 c31
T* c31
cnot b9 c31
T c31
cnot a22 c31
T* c31
cnot b9 c31
H c31
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
cnot b0 a16
cnot a1 a16
T* a16
cnot b1 a16
cnot b0 a16
T* a16
cnot b10 a16
cnot a10 a16
T* a16
cnot b11 a16
cnot a11 a16
T* a16
cnot b12 a16
cnot a12 a16
T* a16
cnot b13 a16
cnot a13 a16
T* a16
cnot b14 a16
cnot a14 a16
T* a16
cnot b15 a16
cnot a15 a16
T* a16
cnot a0 b16
T* b16
cnot a1 b16
cnot a0 b16
T* b16
cnot b1 b16
cnot a10 b16
T* b16
cnot b10 b16
cnot a11 b16
T* b16
cnot b11 b16
cnot a12 b16
T* b16
cnot b12 b16
cnot a13 b16
T* b16
cnot b13 b16
cnot a14 b16
T* b16
cnot b14 b16
cnot a15 b16
T* b16
cnot b15 b16
cnot a16 b16
T* b16
cnot b0 a17
cnot a1 a17
T* a17
cnot b1 a17
cnot b0 a17
T* a17
cnot b10 a17
cnot a10 a17
T* a17
cnot b11 a17
cnot a11 a17
T* a17
cnot b12 a17
cnot a12 a17
T* a17
cnot b13 a17
cnot a13 a17
T* a17
cnot b14 a17
cnot a14 a17
T* a17
cnot b15 a17
cnot a15 a17
T* a17
cnot b16 a17
cnot a16 a17
T* a17
cnot a0 b17
T* b17
cnot a1 b17
cnot a0 b17
T* b17
cnot b1 b17
cnot a10 b17
T* b17
cnot b10 b17
cnot a11 b17
T* b17
cnot b11 b17
cnot a12 b17
T* b17
cnot b12 b17
cnot a13 b17
T* b17
cnot b13 b17
cnot a14 b17
T* b17
cnot b14 b17
cnot a15 b17
T* b17
cnot b15 b17
cnot a16 b17
T* b17
cnot b16 b17
cnot a17 b17
T* b17
cnot b0 a18
cnot a1 a18
T* a18
cnot b1 a18
cnot b0 a18
T* a18
cnot b10 a18
cnot a10 a18
T* a18
cnot b11 a18
cnot a11 a18
T* a18
cnot b12 a18
cnot a12 a18
T* a18
cnot b13 a18
cnot a13 a18
T* a18
cnot b14 a18
cnot a14 a18
T* a18
cnot b15 a18
cnot a15 a18
T* a18
cnot b16 a18
cnot a16 a18
T* a18
cnot b17 a18
cnot a17 a18
T* a18
cnot a0 b18
T* b18
cnot a1 b18
cnot a0 b18
T* b18
cnot b1 b18
cnot a10 b18
T* b18
cnot b10 b18
cnot a11 b18
T* b18
cnot b11 b18
cnot a12 b18
T* b18
cnot b12 b18
cnot a13 b18
T* b18
cnot b13 b18
cnot a14 b18
T* b18
cnot b14 b18
cnot a15 b18
T* b18
cnot b15 b18
cnot a16 b18
T* b18
cnot b16 b18
cnot a17 b18
T* b18
cnot b17 b18
cnot a18 b18
T* b18
cnot b0 a19
cnot a1 a19
T* a19
cnot b1 a19
cnot b0 a19
T* a19
cnot b10 a19
cnot a10 a19
T* a19
cnot b11 a19
cnot a11 a19
T* a19
cnot b12 a19
cnot a12 a19
T* a19
cnot b13 a19
cnot a13 a19
T* a19
cnot b14 a19
cnot a14 a19
T* a19
cnot b15 a19
cnot a15 a19
T* a19
cnot b16 a19
cnot a16 a19
T* a19
cnot b17 a19
cnot a17 a19
T* a19
cnot b18 a19
cnot a18 a19
T* a19
cnot a0 b19
T* b19
cnot a1 b19
cnot a0 b19
T* b19
cnot b1 b19
cnot a10 b19
T* b19
cnot b10 b19
cnot a11 b19
T* b19
cnot b11 b19
cnot a12 b19
T* b19
cnot b12 b19
cnot a13 b19
T* b19
cnot b13 b19
cnot a14 b19
T* b19
cnot b14 b19
cnot a15 b19
T* b19
cnot b15 b19
cnot a16 b19
T* b19
cnot b16 b19
cnot a17 b19
T* b19
cnot b17 b19
cnot a18 b19
T* b19
cnot b18 b19
cnot a19 b19
T* b19
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
cnot b16 a2
cnot a16 a2
T* a2
cnot b17 a2
cnot a17 a2
T* a2
cnot b18 a2
cnot a18 a2
T* a2
cnot b19 a2
cnot a19 a2
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
cnot a16 b2
T* b2
cnot b16 b2
cnot a17 b2
T* b2
cnot b17 b2
cnot a18 b2
T* b2
cnot b18 b2
cnot a19 b2
T* b2
cnot b19 b2
cnot a2 b2
T* b2
cnot b0 a20
cnot a1 a20
T* a20
cnot b1 a20
cnot b0 a20
T* a20
cnot b10 a20
cnot a10 a20
T* a20
cnot b11 a20
cnot a11 a20
T* a20
cnot b12 a20
cnot a12 a20
T* a20
cnot b13 a20
cnot a13 a20
T* a20
cnot b14 a20
cnot a14 a20
T* a20
cnot b15 a20
cnot a15 a20
T* a20
cnot b16 a20
cnot a16 a20
T* a20
cnot b17 a20
cnot a17 a20
T* a20
cnot b18 a20
cnot a18 a20
T* a20
cnot b19 a20
cnot a19 a20
T* a20
cnot b2 a20
cnot a2 a20
T* a20
cnot a0 b20
T* b20
cnot a1 b20
cnot a0 b20
T* b20
cnot b1 b20
cnot a10 b20
T* b20
cnot b10 b20
cnot a11 b20
T* b20
cnot b11 b20
cnot a12 b20
T* b20
cnot b12 b20
cnot a13 b20
T* b20
cnot b13 b20
cnot a14 b20
T* b20
cnot b14 b20
cnot a15 b20
T* b20
cnot b15 b20
cnot a16 b20
T* b20
cnot b16 b20
cnot a17 b20
T* b20
cnot b17 b20
cnot a18 b20
T* b20
cnot b18 b20
cnot a19 b20
T* b20
cnot b19 b20
cnot a2 b20
T* b20
cnot b2 b20
cnot a20 b20
T* b20
cnot b0 a21
cnot a1 a21
T* a21
cnot b1 a21
cnot b0 a21
T* a21
cnot b10 a21
cnot a10 a21
T* a21
cnot b11 a21
cnot a11 a21
T* a21
cnot b12 a21
cnot a12 a21
T* a21
cnot b13 a21
cnot a13 a21
T* a21
cnot b14 a21
cnot a14 a21
T* a21
cnot b15 a21
cnot a15 a21
T* a21
cnot b16 a21
cnot a16 a21
T* a21
cnot b17 a21
cnot a17 a21
T* a21
cnot b18 a21
cnot a18 a21
T* a21
cnot b19 a21
cnot a19 a21
T* a21
cnot b2 a21
cnot a2 a21
T* a21
cnot b20 a21
cnot a20 a21
T* a21
cnot a0 b21
T* b21
cnot a1 b21
cnot a0 b21
T* b21
cnot b1 b21
cnot a10 b21
T* b21
cnot b10 b21
cnot a11 b21
T* b21
cnot b11 b21
cnot a12 b21
T* b21
cnot b12 b21
cnot a13 b21
T* b21
cnot b13 b21
cnot a14 b21
T* b21
cnot b14 b21
cnot a15 b21
T* b21
cnot b15 b21
cnot a16 b21
T* b21
cnot b16 b21
cnot a17 b21
T* b21
cnot b17 b21
cnot a18 b21
T* b21
cnot b18 b21
cnot a19 b21
T* b21
cnot b19 b21
cnot a2 b21
T* b21
cnot b2 b21
cnot a20 b21
T* b21
cnot b20 b21
cnot a21 b21
T* b21
cnot b0 a22
cnot a1 a22
T* a22
cnot b1 a22
cnot b0 a22
T* a22
cnot b10 a22
cnot a10 a22
T* a22
cnot b11 a22
cnot a11 a22
T* a22
cnot b12 a22
cnot a12 a22
T* a22
cnot b13 a22
cnot a13 a22
T* a22
cnot b14 a22
cnot a14 a22
T* a22
cnot b15 a22
cnot a15 a22
T* a22
cnot b16 a22
cnot a16 a22
T* a22
cnot b17 a22
cnot a17 a22
T* a22
cnot b18 a22
cnot a18 a22
T* a22
cnot b19 a22
cnot a19 a22
T* a22
cnot b2 a22
cnot a2 a22
T* a22
cnot b20 a22
cnot a20 a22
T* a22
cnot b21 a22
cnot a21 a22
T* a22
cnot a0 b22
T* b22
cnot a1 b22
cnot a0 b22
T* b22
cnot b1 b22
cnot a10 b22
T* b22
cnot b10 b22
cnot a11 b22
T* b22
cnot b11 b22
cnot a12 b22
T* b22
cnot b12 b22
cnot a13 b22
T* b22
cnot b13 b22
cnot a14 b22
T* b22
cnot b14 b22
cnot a15 b22
T* b22
cnot b15 b22
cnot a16 b22
T* b22
cnot b16 b22
cnot a17 b22
T* b22
cnot b17 b22
cnot a18 b22
T* b22
cnot b18 b22
cnot a19 b22
T* b22
cnot b19 b22
cnot a2 b22
T* b22
cnot b2 b22
cnot a20 b22
T* b22
cnot b20 b22
cnot a21 b22
T* b22
cnot b21 b22
cnot a22 b22
T* b22
cnot b0 a23
cnot a1 a23
T* a23
cnot b1 a23
cnot b0 a23
T* a23
cnot b10 a23
cnot a10 a23
T* a23
cnot b11 a23
cnot a11 a23
T* a23
cnot b12 a23
cnot a12 a23
T* a23
cnot b13 a23
cnot a13 a23
T* a23
cnot b14 a23
cnot a14 a23
T* a23
cnot b15 a23
cnot a15 a23
T* a23
cnot b16 a23
cnot a16 a23
T* a23
cnot b17 a23
cnot a17 a23
T* a23
cnot b18 a23
cnot a18 a23
T* a23
cnot b19 a23
cnot a19 a23
T* a23
cnot b2 a23
cnot a2 a23
T* a23
cnot b20 a23
cnot a20 a23
T* a23
cnot b21 a23
cnot a21 a23
T* a23
cnot b22 a23
cnot a22 a23
T* a23
cnot a0 b23
T* b23
cnot a1 b23
cnot a0 b23
T* b23
cnot b1 b23
cnot a10 b23
T* b23
cnot b10 b23
cnot a11 b23
T* b23
cnot b11 b23
cnot a12 b23
T* b23
cnot b12 b23
cnot a13 b23
T* b23
cnot b13 b23
cnot a14 b23
T* b23
cnot b14 b23
cnot a15 b23
T* b23
cnot b15 b23
cnot a16 b23
T* b23
cnot b16 b23
cnot a17 b23
T* b23
cnot b17 b23
cnot a18 b23
T* b23
cnot b18 b23
cnot a19 b23
T* b23
cnot b19 b23
cnot a2 b23
T* b23
cnot b2 b23
cnot a20 b23
T* b23
cnot b20 b23
cnot a21 b23
T* b23
cnot b21 b23
cnot a22 b23
T* b23
cnot b22 b23
cnot a23 b23
T* b23
cnot b0 a24
cnot a1 a24
T* a24
cnot b1 a24
cnot b0 a24
T* a24
cnot b10 a24
cnot a10 a24
T* a24
cnot b11 a24
cnot a11 a24
T* a24
cnot b12 a24
cnot a12 a24
T* a24
cnot b13 a24
cnot a13 a24
T* a24
cnot b14 a24
cnot a14 a24
T* a24
cnot b15 a24
cnot a15 a24
T* a24
cnot b16 a24
cnot a16 a24
T* a24
cnot b17 a24
cnot a17 a24
T* a24
cnot b18 a24
cnot a18 a24
T* a24
cnot b19 a24
cnot a19 a24
T* a24
cnot b2 a24
cnot a2 a24
T* a24
cnot b20 a24
cnot a20 a24
T* a24
cnot b21 a24
cnot a21 a24
T* a24
cnot b22 a24
cnot a22 a24
T* a24
cnot b23 a24
cnot a23 a24
T* a24
cnot a0 b24
T* b24
cnot a1 b24
cnot a0 b24
T* b24
cnot b1 b24
cnot a10 b24
T* b24
cnot b10 b24
cnot a11 b24
T* b24
cnot b11 b24
cnot a12 b24
T* b24
cnot b12 b24
cnot a13 b24
T* b24
cnot b13 b24
cnot a14 b24
T* b24
cnot b14 b24
cnot a15 b24
T* b24
cnot b15 b24
cnot a16 b24
T* b24
cnot b16 b24
cnot a17 b24
T* b24
cnot b17 b24
cnot a18 b24
T* b24
cnot b18 b24
cnot a19 b24
T* b24
cnot b19 b24
cnot a2 b24
T* b24
cnot b2 b24
cnot a20 b24
T* b24
cnot b20 b24
cnot a21 b24
T* b24
cnot b21 b24
cnot a22 b24
T* b24
cnot b22 b24
cnot a23 b24
T* b24
cnot b23 b24
cnot a24 b24
T* b24
cnot b0 a25
cnot a1 a25
T* a25
cnot b1 a25
cnot b0 a25
T* a25
cnot b10 a25
cnot a10 a25
T* a25
cnot b11 a25
cnot a11 a25
T* a25
cnot b12 a25
cnot a12 a25
T* a25
cnot b13 a25
cnot a13 a25
T* a25
cnot b14 a25
cnot a14 a25
T* a25
cnot b15 a25
cnot a15 a25
T* a25
cnot b16 a25
cnot a16 a25
T* a25
cnot b17 a25
cnot a17 a25
T* a25
cnot b18 a25
cnot a18 a25
T* a25
cnot b19 a25
cnot a19 a25
T* a25
cnot b2 a25
cnot a2 a25
T* a25
cnot b20 a25
cnot a20 a25
T* a25
cnot b21 a25
cnot a21 a25
T* a25
cnot b22 a25
cnot a22 a25
T* a25
cnot b23 a25
cnot a23 a25
T* a25
cnot b24 a25
cnot a24 a25
T* a25
cnot a0 b25
T* b25
cnot a1 b25
cnot a0 b25
T* b25
cnot b1 b25
cnot a10 b25
T* b25
cnot b10 b25
cnot a11 b25
T* b25
cnot b11 b25
cnot a12 b25
T* b25
cnot b12 b25
cnot a13 b25
T* b25
cnot b13 b25
cnot a14 b25
T* b25
cnot b14 b25
cnot a15 b25
T* b25
cnot b15 b25
cnot a16 b25
T* b25
cnot b16 b25
cnot a17 b25
T* b25
cnot b17 b25
cnot a18 b25
T* b25
cnot b18 b25
cnot a19 b25
T* b25
cnot b19 b25
cnot a2 b25
T* b25
cnot b2 b25
cnot a20 b25
T* b25
cnot b20 b25
cnot a21 b25
T* b25
cnot b21 b25
cnot a22 b25
T* b25
cnot b22 b25
cnot a23 b25
T* b25
cnot b23 b25
cnot a24 b25
T* b25
cnot b24 b25
cnot a25 b25
T* b25
cnot b0 a26
cnot a1 a26
T* a26
cnot b1 a26
cnot b0 a26
T* a26
cnot b10 a26
cnot a10 a26
T* a26
cnot b11 a26
cnot a11 a26
T* a26
cnot b12 a26
cnot a12 a26
T* a26
cnot b13 a26
cnot a13 a26
T* a26
cnot b14 a26
cnot a14 a26
T* a26
cnot b15 a26
cnot a15 a26
T* a26
cnot b16 a26
cnot a16 a26
T* a26
cnot b17 a26
cnot a17 a26
T* a26
cnot b18 a26
cnot a18 a26
T* a26
cnot b19 a26
cnot a19 a26
T* a26
cnot b2 a26
cnot a2 a26
T* a26
cnot b20 a26
cnot a20 a26
T* a26
cnot b21 a26
cnot a21 a26
T* a26
cnot b22 a26
cnot a22 a26
T* a26
cnot b23 a26
cnot a23 a26
T* a26
cnot b24 a26
cnot a24 a26
T* a26
cnot b25 a26
cnot a25 a26
T* a26
cnot a0 b26
T* b26
cnot a1 b26
cnot a0 b26
T* b26
cnot b1 b26
cnot a10 b26
T* b26
cnot b10 b26
cnot a11 b26
T* b26
cnot b11 b26
cnot a12 b26
T* b26
cnot b12 b26
cnot a13 b26
T* b26
cnot b13 b26
cnot a14 b26
T* b26
cnot b14 b26
cnot a15 b26
T* b26
cnot b15 b26
cnot a16 b26
T* b26
cnot b16 b26
cnot a17 b26
T* b26
cnot b17 b26
cnot a18 b26
T* b26
cnot b18 b26
cnot a19 b26
T* b26
cnot b19 b26
cnot a2 b26
T* b26
cnot b2 b26
cnot a20 b26
T* b26
cnot b20 b26
cnot a21 b26
T* b26
cnot b21 b26
cnot a22 b26
T* b26
cnot b22 b26
cnot a23 b26
T* b26
cnot b23 b26
cnot a24 b26
T* b26
cnot b24 b26
cnot a25 b26
T* b26
cnot b25 b26
cnot a26 b26
T* b26
cnot b0 a27
cnot a1 a27
T* a27
cnot b1 a27
cnot b0 a27
T* a27
cnot b10 a27
cnot a10 a27
T* a27
cnot b11 a27
cnot a11 a27
T* a27
cnot b12 a27
cnot a12 a27
T* a27
cnot b13 a27
cnot a13 a27
T* a27
cnot b14 a27
cnot a14 a27
T* a27
cnot b15 a27
cnot a15 a27
T* a27
cnot b16 a27
cnot a16 a27
T* a27
cnot b17 a27
cnot a17 a27
T* a27
cnot b18 a27
cnot a18 a27
T* a27
cnot b19 a27
cnot a19 a27
T* a27
cnot b2 a27
cnot a2 a27
T* a27
cnot b20 a27
cnot a20 a27
T* a27
cnot b21 a27
cnot a21 a27
T* a27
cnot b22 a27
cnot a22 a27
T* a27
cnot b23 a27
cnot a23 a27
T* a27
cnot b24 a27
cnot a24 a27
T* a27
cnot b25 a27
cnot a25 a27
T* a27
cnot b26 a27
cnot a26 a27
T* a27
cnot a0 b27
T* b27
cnot a1 b27
cnot a0 b27
T* b27
cnot b1 b27
cnot a10 b27
T* b27
cnot b10 b27
cnot a11 b27
T* b27
cnot b11 b27
cnot a12 b27
T* b27
cnot b12 b27
cnot a13 b27
T* b27
cnot b13 b27
cnot a14 b27
T* b27
cnot b14 b27
cnot a15 b27
T* b27
cnot b15 b27
cnot a16 b27
T* b27
cnot b16 b27
cnot a17 b27
T* b27
cnot b17 b27
cnot a18 b27
T* b27
cnot b18 b27
cnot a19 b27
T* b27
cnot b19 b27
cnot a2 b27
T* b27
cnot b2 b27
cnot a20 b27
T* b27
cnot b20 b27
cnot a21 b27
T* b27
cnot b21 b27
cnot a22 b27
T* b27
cnot b22 b27
cnot a23 b27
T* b27
cnot b23 b27
cnot a24 b27
T* b27
cnot b24 b27
cnot a25 b27
T* b27
cnot b25 b27
cnot a26 b27
T* b27
cnot b26 b27
cnot a27 b27
T* b27
cnot b0 a28
cnot a1 a28
T* a28
cnot b1 a28
cnot b0 a28
T* a28
cnot b10 a28
cnot a10 a28
T* a28
cnot b11 a28
cnot a11 a28
T* a28
cnot b12 a28
cnot a12 a28
T* a28
cnot b13 a28
cnot a13 a28
T* a28
cnot b14 a28
cnot a14 a28
T* a28
cnot b15 a28
cnot a15 a28
T* a28
cnot b16 a28
cnot a16 a28
T* a28
cnot b17 a28
cnot a17 a28
T* a28
cnot b18 a28
cnot a18 a28
T* a28
cnot b19 a28
cnot a19 a28
T* a28
cnot b2 a28
cnot a2 a28
T* a28
cnot b20 a28
cnot a20 a28
T* a28
cnot b21 a28
cnot a21 a28
T* a28
cnot b22 a28
cnot a22 a28
T* a28
cnot b23 a28
cnot a23 a28
T* a28
cnot b24 a28
cnot a24 a28
T* a28
cnot b25 a28
cnot a25 a28
T* a28
cnot b26 a28
cnot a26 a28
T* a28
cnot b27 a28
cnot a27 a28
T* a28
cnot a0 b28
T* b28
cnot a1 b28
cnot a0 b28
T* b28
cnot b1 b28
cnot a10 b28
T* b28
cnot b10 b28
cnot a11 b28
T* b28
cnot b11 b28
cnot a12 b28
T* b28
cnot b12 b28
cnot a13 b28
T* b28
cnot b13 b28
cnot a14 b28
T* b28
cnot b14 b28
cnot a15 b28
T* b28
cnot b15 b28
cnot a16 b28
T* b28
cnot b16 b28
cnot a17 b28
T* b28
cnot b17 b28
cnot a18 b28
T* b28
cnot b18 b28
cnot a19 b28
T* b28
cnot b19 b28
cnot a2 b28
T* b28
cnot b2 b28
cnot a20 b28
T* b28
cnot b20 b28
cnot a21 b28
T* b28
cnot b21 b28
cnot a22 b28
T* b28
cnot b22 b28
cnot a23 b28
T* b28
cnot b23 b28
cnot a24 b28
T* b28
cnot b24 b28
cnot a25 b28
T* b28
cnot b25 b28
cnot a26 b28
T* b28
cnot b26 b28
cnot a27 b28
T* b28
cnot b27 b28
cnot a28 b28
T* b28
cnot b0 a29
cnot a1 a29
T* a29
cnot b1 a29
cnot b0 a29
T* a29
cnot b10 a29
cnot a10 a29
T* a29
cnot b11 a29
cnot a11 a29
T* a29
cnot b12 a29
cnot a12 a29
T* a29
cnot b13 a29
cnot a13 a29
T* a29
cnot b14 a29
cnot a14 a29
T* a29
cnot b15 a29
cnot a15 a29
T* a29
cnot b16 a29
cnot a16 a29
T* a29
cnot b17 a29
cnot a17 a29
T* a29
cnot b18 a29
cnot a18 a29
T* a29
cnot b19 a29
cnot a19 a29
T* a29
cnot b2 a29
cnot a2 a29
T* a29
cnot b20 a29
cnot a20 a29
T* a29
cnot b21 a29
cnot a21 a29
T* a29
cnot b22 a29
cnot a22 a29
T* a29
cnot b23 a29
cnot a23 a29
T* a29
cnot b24 a29
cnot a24 a29
T* a29
cnot b25 a29
cnot a25 a29
T* a29
cnot b26 a29
cnot a26 a29
T* a29
cnot b27 a29
cnot a27 a29
T* a29
cnot b28 a29
cnot a28 a29
T* a29
cnot a0 b29
T* b29
cnot a1 b29
cnot a0 b29
T* b29
cnot b1 b29
cnot a10 b29
T* b29
cnot b10 b29
cnot a11 b29
T* b29
cnot b11 b29
cnot a12 b29
T* b29
cnot b12 b29
cnot a13 b29
T* b29
cnot b13 b29
cnot a14 b29
T* b29
cnot b14 b29
cnot a15 b29
T* b29
cnot b15 b29
cnot a16 b29
T* b29
cnot b16 b29
cnot a17 b29
T* b29
cnot b17 b29
cnot a18 b29
T* b29
cnot b18 b29
cnot a19 b29
T* b29
cnot b19 b29
cnot a2 b29
T* b29
cnot b2 b29
cnot a20 b29
T* b29
cnot b20 b29
cnot a21 b29
T* b29
cnot b21 b29
cnot a22 b29
T* b29
cnot b22 b29
cnot a23 b29
T* b29
cnot b23 b29
cnot a24 b29
T* b29
cnot b24 b29
cnot a25 b29
T* b29
cnot b25 b29
cnot a26 b29
T* b29
cnot b26 b29
cnot a27 b29
T* b29
cnot b27 b29
cnot a28 b29
T* b29
cnot b28 b29
cnot a29 b29
T* b29
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
cnot b16 a3
cnot a16 a3
T* a3
cnot b17 a3
cnot a17 a3
T* a3
cnot b18 a3
cnot a18 a3
T* a3
cnot b19 a3
cnot a19 a3
T* a3
cnot b2 a3
cnot a2 a3
T* a3
cnot b20 a3
cnot a20 a3
T* a3
cnot b21 a3
cnot a21 a3
T* a3
cnot b22 a3
cnot a22 a3
T* a3
cnot b23 a3
cnot a23 a3
T* a3
cnot b24 a3
cnot a24 a3
T* a3
cnot b25 a3
cnot a25 a3
T* a3
cnot b26 a3
cnot a26 a3
T* a3
cnot b27 a3
cnot a27 a3
T* a3
cnot b28 a3
cnot a28 a3
T* a3
cnot b29 a3
cnot a29 a3
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
cnot a16 b3
T* b3
cnot b16 b3
cnot a17 b3
T* b3
cnot b17 b3
cnot a18 b3
T* b3
cnot b18 b3
cnot a19 b3
T* b3
cnot b19 b3
cnot a2 b3
T* b3
cnot b2 b3
cnot a20 b3
T* b3
cnot b20 b3
cnot a21 b3
T* b3
cnot b21 b3
cnot a22 b3
T* b3
cnot b22 b3
cnot a23 b3
T* b3
cnot b23 b3
cnot a24 b3
T* b3
cnot b24 b3
cnot a25 b3
T* b3
cnot b25 b3
cnot a26 b3
T* b3
cnot b26 b3
cnot a27 b3
T* b3
cnot b27 b3
cnot a28 b3
T* b3
cnot b28 b3
cnot a29 b3
T* b3
cnot b29 b3
cnot a3 b3
T* b3
cnot b0 a30
cnot a1 a30
T* a30
cnot b1 a30
cnot b0 a30
T* a30
cnot b10 a30
cnot a10 a30
T* a30
cnot b11 a30
cnot a11 a30
T* a30
cnot b12 a30
cnot a12 a30
T* a30
cnot b13 a30
cnot a13 a30
T* a30
cnot b14 a30
cnot a14 a30
T* a30
cnot b15 a30
cnot a15 a30
T* a30
cnot b16 a30
cnot a16 a30
T* a30
cnot b17 a30
cnot a17 a30
T* a30
cnot b18 a30
cnot a18 a30
T* a30
cnot b19 a30
cnot a19 a30
T* a30
cnot b2 a30
cnot a2 a30
T* a30
cnot b20 a30
cnot a20 a30
T* a30
cnot b21 a30
cnot a21 a30
T* a30
cnot b22 a30
cnot a22 a30
T* a30
cnot b23 a30
cnot a23 a30
T* a30
cnot b24 a30
cnot a24 a30
T* a30
cnot b25 a30
cnot a25 a30
T* a30
cnot b26 a30
cnot a26 a30
T* a30
cnot b27 a30
cnot a27 a30
T* a30
cnot b28 a30
cnot a28 a30
T* a30
cnot b29 a30
cnot a29 a30
T* a30
cnot b3 a30
cnot a3 a30
T* a30
cnot a0 b30
T* b30
cnot a1 b30
cnot a0 b30
T* b30
cnot b1 b30
cnot a10 b30
T* b30
cnot b10 b30
cnot a11 b30
T* b30
cnot b11 b30
cnot a12 b30
T* b30
cnot b12 b30
cnot a13 b30
T* b30
cnot b13 b30
cnot a14 b30
T* b30
cnot b14 b30
cnot a15 b30
T* b30
cnot b15 b30
cnot a16 b30
T* b30
cnot b16 b30
cnot a17 b30
T* b30
cnot b17 b30
cnot a18 b30
T* b30
cnot b18 b30
cnot a19 b30
T* b30
cnot b19 b30
cnot a2 b30
T* b30
cnot b2 b30
cnot a20 b30
T* b30
cnot b20 b30
cnot a21 b30
T* b30
cnot b21 b30
cnot a22 b30
T* b30
cnot b22 b30
cnot a23 b30
T* b30
cnot b23 b30
cnot a24 b30
T* b30
cnot b24 b30
cnot a25 b30
T* b30
cnot b25 b30
cnot a26 b30
T* b30
cnot b26 b30
cnot a27 b30
T* b30
cnot b27 b30
cnot a28 b30
T* b30
cnot b28 b30
cnot a29 b30
T* b30
cnot b29 b30
cnot a3 b30
T* b30
cnot b3 b30
cnot a30 b30
T* b30
cnot b0 a31
cnot a1 a31
T* a31
cnot b1 a31
cnot b0 a31
T* a31
cnot b10 a31
cnot a10 a31
T* a31
cnot b11 a31
cnot a11 a31
T* a31
cnot b12 a31
cnot a12 a31
T* a31
cnot b13 a31
cnot a13 a31
T* a31
cnot b14 a31
cnot a14 a31
T* a31
cnot b15 a31
cnot a15 a31
T* a31
cnot b16 a31
cnot a16 a31
T* a31
cnot b17 a31
cnot a17 a31
T* a31
cnot b18 a31
cnot a18 a31
T* a31
cnot b19 a31
cnot a19 a31
T* a31
cnot b2 a31
cnot a2 a31
T* a31
cnot b20 a31
cnot a20 a31
T* a31
cnot b21 a31
cnot a21 a31
T* a31
cnot b22 a31
cnot a22 a31
T* a31
cnot b23 a31
cnot a23 a31
T* a31
cnot b24 a31
cnot a24 a31
T* a31
cnot b25 a31
cnot a25 a31
T* a31
cnot b26 a31
cnot a26 a31
T* a31
cnot b27 a31
cnot a27 a31
T* a31
cnot b28 a31
cnot a28 a31
T* a31
cnot b29 a31
cnot a29 a31
T* a31
cnot b3 a31
cnot a3 a31
T* a31
cnot b30 a31
cnot a30 a31
T* a31
cnot a0 b31
T* b31
cnot a1 b31
cnot a0 b31
T* b31
cnot b1 b31
cnot a10 b31
T* b31
cnot b10 b31
cnot a11 b31
T* b31
cnot b11 b31
cnot a12 b31
T* b31
cnot b12 b31
cnot a13 b31
T* b31
cnot b13 b31
cnot a14 b31
T* b31
cnot b14 b31
cnot a15 b31
T* b31
cnot b15 b31
cnot a16 b31
T* b31
cnot b16 b31
cnot a17 b31
T* b31
cnot b17 b31
cnot a18 b31
T* b31
cnot b18 b31
cnot a19 b31
T* b31
cnot b19 b31
cnot a2 b31
T* b31
cnot b2 b31
cnot a20 b31
T* b31
cnot b20 b31
cnot a21 b31
T* b31
cnot b21 b31
cnot a22 b31
T* b31
cnot b22 b31
cnot a23 b31
T* b31
cnot b23 b31
cnot a24 b31
T* b31
cnot b24 b31
cnot a25 b31
T* b31
cnot b25 b31
cnot a26 b31
T* b31
cnot b26 b31
cnot a27 b31
T* b31
cnot b27 b31
cnot a28 b31
T* b31
cnot b28 b31
cnot a29 b31
T* b31
cnot b29 b31
cnot a3 b31
T* b31
cnot b3 b31
cnot a30 b31
T* b31
cnot b30 b31
cnot a31 b31
T* b31
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
cnot b16 a4
cnot a16 a4
T* a4
cnot b17 a4
cnot a17 a4
T* a4
cnot b18 a4
cnot a18 a4
T* a4
cnot b19 a4
cnot a19 a4
T* a4
cnot b2 a4
cnot a2 a4
T* a4
cnot b20 a4
cnot a20 a4
T* a4
cnot b21 a4
cnot a21 a4
T* a4
cnot b22 a4
cnot a22 a4
T* a4
cnot b23 a4
cnot a23 a4
T* a4
cnot b24 a4
cnot a24 a4
T* a4
cnot b25 a4
cnot a25 a4
T* a4
cnot b26 a4
cnot a26 a4
T* a4
cnot b27 a4
cnot a27 a4
T* a4
cnot b28 a4
cnot a28 a4
T* a4
cnot b29 a4
cnot a29 a4
T* a4
cnot b3 a4
cnot a3 a4
T* a4
cnot b30 a4
cnot a30 a4
T* a4
cnot b31 a4
cnot a31 a4
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
cnot a16 b4
T* b4
cnot b16 b4
cnot a17 b4
T* b4
cnot b17 b4
cnot a18 b4
T* b4
cnot b18 b4
cnot a19 b4
T* b4
cnot b19 b4
cnot a2 b4
T* b4
cnot b2 b4
cnot a20 b4
T* b4
cnot b20 b4
cnot a21 b4
T* b4
cnot b21 b4
cnot a22 b4
T* b4
cnot b22 b4
cnot a23 b4
T* b4
cnot b23 b4
cnot a24 b4
T* b4
cnot b24 b4
cnot a25 b4
T* b4
cnot b25 b4
cnot a26 b4
T* b4
cnot b26 b4
cnot a27 b4
T* b4
cnot b27 b4
cnot a28 b4
T* b4
cnot b28 b4
cnot a29 b4
T* b4
cnot b29 b4
cnot a3 b4
T* b4
cnot b3 b4
cnot a30 b4
T* b4
cnot b30 b4
cnot a31 b4
T* b4
cnot b31 b4
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
cnot b16 a5
cnot a16 a5
T* a5
cnot b17 a5
cnot a17 a5
T* a5
cnot b18 a5
cnot a18 a5
T* a5
cnot b19 a5
cnot a19 a5
T* a5
cnot b2 a5
cnot a2 a5
T* a5
cnot b20 a5
cnot a20 a5
T* a5
cnot b21 a5
cnot a21 a5
T* a5
cnot b22 a5
cnot a22 a5
T* a5
cnot b23 a5
cnot a23 a5
T* a5
cnot b24 a5
cnot a24 a5
T* a5
cnot b25 a5
cnot a25 a5
T* a5
cnot b26 a5
cnot a26 a5
T* a5
cnot b27 a5
cnot a27 a5
T* a5
cnot b28 a5
cnot a28 a5
T* a5
cnot b29 a5
cnot a29 a5
T* a5
cnot b3 a5
cnot a3 a5
T* a5
cnot b30 a5
cnot a30 a5
T* a5
cnot b31 a5
cnot a31 a5
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
cnot a16 b5
T* b5
cnot b16 b5
cnot a17 b5
T* b5
cnot b17 b5
cnot a18 b5
T* b5
cnot b18 b5
cnot a19 b5
T* b5
cnot b19 b5
cnot a2 b5
T* b5
cnot b2 b5
cnot a20 b5
T* b5
cnot b20 b5
cnot a21 b5
T* b5
cnot b21 b5
cnot a22 b5
T* b5
cnot b22 b5
cnot a23 b5
T* b5
cnot b23 b5
cnot a24 b5
T* b5
cnot b24 b5
cnot a25 b5
T* b5
cnot b25 b5
cnot a26 b5
T* b5
cnot b26 b5
cnot a27 b5
T* b5
cnot b27 b5
cnot a28 b5
T* b5
cnot b28 b5
cnot a29 b5
T* b5
cnot b29 b5
cnot a3 b5
T* b5
cnot b3 b5
cnot a30 b5
T* b5
cnot b30 b5
cnot a31 b5
T* b5
cnot b31 b5
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
cnot b16 a6
cnot a16 a6
T* a6
cnot b17 a6
cnot a17 a6
T* a6
cnot b18 a6
cnot a18 a6
T* a6
cnot b19 a6
cnot a19 a6
T* a6
cnot b2 a6
cnot a2 a6
T* a6
cnot b20 a6
cnot a20 a6
T* a6
cnot b21 a6
cnot a21 a6
T* a6
cnot b22 a6
cnot a22 a6
T* a6
cnot b23 a6
cnot a23 a6
T* a6
cnot b24 a6
cnot a24 a6
T* a6
cnot b25 a6
cnot a25 a6
T* a6
cnot b26 a6
cnot a26 a6
T* a6
cnot b27 a6
cnot a27 a6
T* a6
cnot b28 a6
cnot a28 a6
T* a6
cnot b29 a6
cnot a29 a6
T* a6
cnot b3 a6
cnot a3 a6
T* a6
cnot b30 a6
cnot a30 a6
T* a6
cnot b31 a6
cnot a31 a6
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
cnot a16 b6
T* b6
cnot b16 b6
cnot a17 b6
T* b6
cnot b17 b6
cnot a18 b6
T* b6
cnot b18 b6
cnot a19 b6
T* b6
cnot b19 b6
cnot a2 b6
T* b6
cnot b2 b6
cnot a20 b6
T* b6
cnot b20 b6
cnot a21 b6
T* b6
cnot b21 b6
cnot a22 b6
T* b6
cnot b22 b6
cnot a23 b6
T* b6
cnot b23 b6
cnot a24 b6
T* b6
cnot b24 b6
cnot a25 b6
T* b6
cnot b25 b6
cnot a26 b6
T* b6
cnot b26 b6
cnot a27 b6
T* b6
cnot b27 b6
cnot a28 b6
T* b6
cnot b28 b6
cnot a29 b6
T* b6
cnot b29 b6
cnot a3 b6
T* b6
cnot b3 b6
cnot a30 b6
T* b6
cnot b30 b6
cnot a31 b6
T* b6
cnot b31 b6
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
cnot b16 a7
cnot a16 a7
T* a7
cnot b17 a7
cnot a17 a7
T* a7
cnot b18 a7
cnot a18 a7
T* a7
cnot b19 a7
cnot a19 a7
T* a7
cnot b2 a7
cnot a2 a7
T* a7
cnot b20 a7
cnot a20 a7
T* a7
cnot b21 a7
cnot a21 a7
T* a7
cnot b22 a7
cnot a22 a7
T* a7
cnot b23 a7
cnot a23 a7
T* a7
cnot b24 a7
cnot a24 a7
T* a7
cnot b25 a7
cnot a25 a7
T* a7
cnot b26 a7
cnot a26 a7
T* a7
cnot b27 a7
cnot a27 a7
T* a7
cnot b28 a7
cnot a28 a7
T* a7
cnot b29 a7
cnot a29 a7
T* a7
cnot b3 a7
cnot a3 a7
T* a7
cnot b30 a7
cnot a30 a7
T* a7
cnot b31 a7
cnot a31 a7
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
cnot a16 b7
T* b7
cnot b16 b7
cnot a17 b7
T* b7
cnot b17 b7
cnot a18 b7
T* b7
cnot b18 b7
cnot a19 b7
T* b7
cnot b19 b7
cnot a2 b7
T* b7
cnot b2 b7
cnot a20 b7
T* b7
cnot b20 b7
cnot a21 b7
T* b7
cnot b21 b7
cnot a22 b7
T* b7
cnot b22 b7
cnot a23 b7
T* b7
cnot b23 b7
cnot a24 b7
T* b7
cnot b24 b7
cnot a25 b7
T* b7
cnot b25 b7
cnot a26 b7
T* b7
cnot b26 b7
cnot a27 b7
T* b7
cnot b27 b7
cnot a28 b7
T* b7
cnot b28 b7
cnot a29 b7
T* b7
cnot b29 b7
cnot a3 b7
T* b7
cnot b3 b7
cnot a30 b7
T* b7
cnot b30 b7
cnot a31 b7
T* b7
cnot b31 b7
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
cnot b16 a8
cnot a16 a8
T* a8
cnot b17 a8
cnot a17 a8
T* a8
cnot b18 a8
cnot a18 a8
T* a8
cnot b19 a8
cnot a19 a8
T* a8
cnot b2 a8
cnot a2 a8
T* a8
cnot b20 a8
cnot a20 a8
T* a8
cnot b21 a8
cnot a21 a8
T* a8
cnot b22 a8
cnot a22 a8
T* a8
cnot b23 a8
cnot a23 a8
T* a8
cnot b24 a8
cnot a24 a8
T* a8
cnot b25 a8
cnot a25 a8
T* a8
cnot b26 a8
cnot a26 a8
T* a8
cnot b27 a8
cnot a27 a8
T* a8
cnot b28 a8
cnot a28 a8
T* a8
cnot b29 a8
cnot a29 a8
T* a8
cnot b3 a8
cnot a3 a8
T* a8
cnot b30 a8
cnot a30 a8
T* a8
cnot b31 a8
cnot a31 a8
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
cnot a16 b8
T* b8
cnot b16 b8
cnot a17 b8
T* b8
cnot b17 b8
cnot a18 b8
T* b8
cnot b18 b8
cnot a19 b8
T* b8
cnot b19 b8
cnot a2 b8
T* b8
cnot b2 b8
cnot a20 b8
T* b8
cnot b20 b8
cnot a21 b8
T* b8
cnot b21 b8
cnot a22 b8
T* b8
cnot b22 b8
cnot a23 b8
T* b8
cnot b23 b8
cnot a24 b8
T* b8
cnot b24 b8
cnot a25 b8
T* b8
cnot b25 b8
cnot a26 b8
T* b8
cnot b26 b8
cnot a27 b8
T* b8
cnot b27 b8
cnot a28 b8
T* b8
cnot b28 b8
cnot a29 b8
T* b8
cnot b29 b8
cnot a3 b8
T* b8
cnot b3 b8
cnot a30 b8
T* b8
cnot b30 b8
cnot a31 b8
T* b8
cnot b31 b8
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
cnot b16 a9
cnot a16 a9
T* a9
cnot b17 a9
cnot a17 a9
T* a9
cnot b18 a9
cnot a18 a9
T* a9
cnot b19 a9
cnot a19 a9
T* a9
cnot b2 a9
cnot a2 a9
T* a9
cnot b20 a9
cnot a20 a9
T* a9
cnot b21 a9
cnot a21 a9
T* a9
cnot b22 a9
cnot a22 a9
T* a9
cnot b23 a9
cnot a23 a9
T* a9
cnot b24 a9
cnot a24 a9
T* a9
cnot b25 a9
cnot a25 a9
T* a9
cnot b26 a9
cnot a26 a9
T* a9
cnot b27 a9
cnot a27 a9
T* a9
cnot b28 a9
cnot a28 a9
T* a9
cnot b29 a9
cnot a29 a9
T* a9
cnot b3 a9
cnot a3 a9
T* a9
cnot b30 a9
cnot a30 a9
T* a9
cnot b31 a9
cnot a31 a9
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
cnot a16 b9
T* b9
cnot b16 b9
cnot a17 b9
T* b9
cnot b17 b9
cnot a18 b9
T* b9
cnot b18 b9
cnot a19 b9
T* b9
cnot b19 b9
cnot a2 b9
T* b9
cnot b2 b9
cnot a20 b9
T* b9
cnot b20 b9
cnot a21 b9
T* b9
cnot b21 b9
cnot a22 b9
T* b9
cnot b22 b9
cnot a23 b9
T* b9
cnot b23 b9
cnot a24 b9
T* b9
cnot b24 b9
cnot a25 b9
T* b9
cnot b25 b9
cnot a26 b9
T* b9
cnot b26 b9
cnot a27 b9
T* b9
cnot b27 b9
cnot a28 b9
T* b9
cnot b28 b9
cnot a29 b9
T* b9
cnot b29 b9
cnot a3 b9
T* b9
cnot b3 b9
cnot a30 b9
T* b9
cnot b30 b9
cnot a31 b9
T* b9
cnot b31 b9
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
cnot b15 a16
cnot b16 a17
cnot b17 a18
cnot b18 a19
cnot b19 a2
cnot b2 a20
cnot b20 a21
cnot b21 a22
cnot b22 a23
cnot b23 a24
cnot b24 a25
cnot b25 a26
cnot b26 a27
cnot b27 a28
cnot b28 a29
cnot b29 a3
cnot b3 a30
cnot b30 a31
cnot b31 a4
cnot b4 a5
cnot b5 a6
cnot b6 a7
cnot b7 a8
cnot b8 a9
cnot a8 a9
cnot a7 a9
cnot a7 a8
cnot a6 a9
cnot a6 a8
cnot a6 a7
cnot a9 b9
cnot a8 b8
cnot a7 b7
cnot a6 b6
cnot a4 a5
cnot a31 a5
cnot a31 a4
cnot a30 a5
cnot a30 a4
cnot a30 a31
cnot a5 b9
cnot a5 b8
cnot a5 b7
cnot a5 b6
cnot a5 b5
cnot a4 b4
cnot a31 b31
cnot a30 b30
cnot a5 a9
cnot a5 a8
cnot a5 a7
cnot a5 a6
cnot a29 a3
cnot a28 a3
cnot a28 a29
cnot a27 a3
cnot a27 a29
cnot a27 a28
cnot a3 b9
cnot a3 b8
cnot a3 b7
cnot a3 b6
cnot a3 b5
cnot a3 b4
cnot a3 b31
cnot a3 b30
cnot a3 b3
cnot a29 b29
cnot a28 b28
cnot a27 b27
cnot a3 a9
cnot a3 a8
cnot a3 a7
cnot a3 a6
cnot a3 a5
cnot a3 a4
cnot a3 a31
cnot a3 a30
cnot a25 a26
cnot a24 a26
cnot a24 a25
cnot a23 a26
cnot a23 a25
cnot a23 a24
cnot a26 b9
cnot a26 b8
cnot a26 b7
cnot a26 b6
cnot a26 b5
cnot a26 b4
cnot a26 b31
cnot a26 b30
cnot a26 b3
cnot a26 b29
cnot a26 b28
cnot a26 b27
cnot a26 b26
cnot a25 b25
cnot a24 b24
cnot a23 b23
cnot a26 a9
cnot a26 a8
cnot a26 a7
cnot a26 a6
cnot a26 a5
cnot a26 a4
cnot a26 a31
cnot a26 a30
cnot a26 a3
cnot a26 a29
cnot a26 a28
cnot a26 a27
cnot a21 a22
cnot a20 a22
cnot a20 a21
cnot a2 a22
cnot a2 a21
cnot a2 a20
cnot a22 b9
cnot a22 b8
cnot a22 b7
cnot a22 b6
cnot a22 b5
cnot a22 b4
cnot a22 b31
cnot a22 b30
cnot a22 b3
cnot a22 b29
cnot a22 b28
cnot a22 b27
cnot a22 b26
cnot a22 b25
cnot a22 b24
cnot a22 b23
cnot a22 b22
cnot a21 b21
cnot a20 b20
cnot a2 b2
cnot a22 a9
cnot a22 a8
cnot a22 a7
cnot a22 a6
cnot a22 a5
cnot a22 a4
cnot a22 a31
cnot a22 a30
cnot a22 a3
cnot a22 a29
cnot a22 a28
cnot a22 a27
cnot a22 a26
cnot a22 a25
cnot a22 a24
cnot a22 a23
cnot a18 a19
cnot a17 a19
cnot a17 a18
cnot a16 a19
cnot a16 a18
cnot a16 a17
cnot a19 b9
cnot a19 b8
cnot a19 b7
cnot a19 b6
cnot a19 b5
cnot a19 b4
cnot a19 b31
cnot a19 b30
cnot a19 b3
cnot a19 b29
cnot a19 b28
cnot a19 b27
cnot a19 b26
cnot a19 b25
cnot a19 b24
cnot a19 b23
cnot a19 b22
cnot a19 b21
cnot a19 b20
cnot a19 b2
cnot a19 b19
cnot a18 b18
cnot a17 b17
cnot a16 b16
cnot a19 a9
cnot a19 a8
cnot a19 a7
cnot a19 a6
cnot a19 a5
cnot a19 a4
cnot a19 a31
cnot a19 a30
cnot a19 a3
cnot a19 a29
cnot a19 a28
cnot a19 a27
cnot a19 a26
cnot a19 a25
cnot a19 a24
cnot a19 a23
cnot a19 a22
cnot a19 a21
cnot a19 a20
cnot a19 a2
cnot a14 a15
cnot a13 a15
cnot a13 a14
cnot a12 a15
cnot a12 a14
cnot a12 a13
cnot a15 b9
cnot a15 b8
cnot a15 b7
cnot a15 b6
cnot a15 b5
cnot a15 b4
cnot a15 b31
cnot a15 b30
cnot a15 b3
cnot a15 b29
cnot a15 b28
cnot a15 b27
cnot a15 b26
cnot a15 b25
cnot a15 b24
cnot a15 b23
cnot a15 b22
cnot a15 b21
cnot a15 b20
cnot a15 b2
cnot a15 b19
cnot a15 b18
cnot a15 b17
cnot a15 b16
cnot a15 b15
cnot a14 b14
cnot a13 b13
cnot a12 b12
cnot a15 a9
cnot a15 a8
cnot a15 a7
cnot a15 a6
cnot a15 a5
cnot a15 a4
cnot a15 a31
cnot a15 a30
cnot a15 a3
cnot a15 a29
cnot a15 a28
cnot a15 a27
cnot a15 a26
cnot a15 a25
cnot a15 a24
cnot a15 a23
cnot a15 a22
cnot a15 a21
cnot a15 a20
cnot a15 a2
cnot a15 a19
cnot a15 a18
cnot a15 a17
cnot a15 a16
cnot a10 a11
cnot a1 a11
cnot a1 a10
cnot a11 b9
cnot a11 b8
cnot a11 b7
cnot a11 b6
cnot a11 b5
cnot a11 b4
cnot a11 b31
cnot a11 b30
cnot a11 b3
cnot a11 b29
cnot a11 b28
cnot a11 b27
cnot a11 b26
cnot a11 b25
cnot a11 b24
cnot a11 b23
cnot a11 b22
cnot a11 b21
cnot a11 b20
cnot a11 b2
cnot a11 b19
cnot a11 b18
cnot a11 b17
cnot a11 b16
cnot a11 b15
cnot a11 b14
cnot a11 b13
cnot a11 b12
cnot a11 b11
cnot a10 b10
cnot a1 b1
cnot a1 b0
cnot a11 a9
cnot a11 a8
cnot a11 a7
cnot a11 a6
cnot a11 a5
cnot a11 a4
cnot a11 a31
cnot a11 a30
cnot a11 a3
cnot a11 a29
cnot a11 a28
cnot a11 a27
cnot a11 a26
cnot a11 a25
cnot a11 a24
cnot a11 a23
cnot a11 a22
cnot a11 a21
cnot a11 a20
cnot a11 a2
cnot a11 a19
cnot a11 a18
cnot a11 a17
cnot a11 a16
cnot a11 a15
cnot a11 a14
cnot a11 a13
cnot a11 a12
END
