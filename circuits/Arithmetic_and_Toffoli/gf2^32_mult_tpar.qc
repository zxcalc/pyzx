# Original circuit
#   qubits: 96
#   qubits used: 96
#   H: 126
#   cnot: 7292
#   X: 0
#   T: 7168
#   P: 0
#   Z: 0
#   tdepth (by partitions): 3072
#   tdepth (by critical paths): 372
# Optimized circuit
#   qubits: 96
#   qubits used: 96
#   H: 126
#   cnot: 33269
#   X: 0
#   T: 4128
#   P: 32
#   Z: 8
#   tdepth (by partitions): 47
#   tdepth (by critical paths): 47
#   Time: 615.522 s
.v a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31
.i a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31
.o a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31

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
tof b25 a0
tof b31 a1
tof b31 a2
tof b29 a5
tof b30 a4
tof b31 a3
tof b27 a6
tof b25 a7
tof b25 a8
tof b22 a11
tof b23 a10
tof b24 a9
tof b19 a14
tof b20 a13
tof b21 a12
tof b16 a17
tof b17 a16
tof b18 a15
tof b13 a20
tof b14 a19
tof b15 a18
tof b10 a23
tof b11 a22
tof b12 a21
tof b7 a26
tof b8 a25
tof b9 a24
tof b7 a27
tof b6 a28
tof b6 a29
tof b3 a31
tof b5 a30
tof b9 b0
tof b3 b1
tof b3 b2
tof b4 b3
tof b13 b4
tof b14 b6
tof c6 b5
tof c7 b15
tof b8 b7
tof b9 b8
tof b15 b9
tof c0 b10
tof b11 b10
tof b12 b11
tof b13 b12
tof c7 b15
tof b14 b13
tof b15 b14
tof c2 b15
tof b17 b16
tof b18 b17
tof b19 b18
tof c3 b19
tof b21 b20
tof b22 b21
tof b23 b22
tof b24 b23
tof b25 b24
tof b26 b25
tof b27 b26
tof b28 b27
tof c2 b29
tof c4 b28
tof c3 b28
tof c3 b30
tof c2 c1
tof c3 b31
tof c4 b31
tof c7 c0
tof c9 c4
tof c3 c2
tof c4 c3
tof c11 c4
tof c9 c6
tof c10 c7
tof c14 c10
tof c15 c8
tof c11 c8
tof c10 c9
tof c11 c9
tof c11 c10
tof c12 c10
tof c13 c11
tof c14 c11
tof c13 c12
tof c14 c12
tof c16 c13
tof c21 c16
tof c18 c17
tof c19 c18
tof c21 c19
tof c18 c19
tof c17 c19
tof c19 c21
tof c16 c19
tof c14 c19
tof c14 c22
tof c14 c20
tof c19 c17
tof c13 c17
tof c13 c19
tof c12 c31
tof c12 c17
tof c11 c31
tof c11 c19
tof c19 c21
tof c12 c15
tof c11 c22
tof c13 c16
tof c17 c18
tof c11 c14
tof c10 c15
tof c10 c12
tof c9 c10
tof c8 c15
tof c12 c21
tof c12 c22
tof c10 c31
tof c10 c18
tof c10 c17
tof c12 c19
tof c12 c14
tof c12 c11
tof c7 c15
tof c7 c22
tof c5 c17
tof c7 c19
tof c7 c14
tof c7 c11
tof c7 c9
tof c7 c12
tof c4 c9
tof c4 c12
tof c4 c31
tof c3 c12
tof c3 c4
tof c2 c9
tof c2 c12
tof c12 c21
tof c12 c15
tof c2 c22
tof c12 c16
tof c3 c6
tof c9 c20
tof c3 c18
tof c3 c17
tof c12 c19
tof c12 c13
tof c4 c8
tof c9 c11
tof c3 c10
tof c0 c21
tof c0 c14
tof b30 c22
tof b28 c20
tof b28 c11
tof b28 c10
tof b28 c5
tof b27 c5
tof b27 b28
tof b26 c5
tof b26 b28
tof b25 b28
tof b25 b26
tof b28 c6
tof c5 c17
tof b28 c3
tof b28 b31
tof b24 c6
tof b24 b28
tof b23 c6
tof b23 b28
tof b22 b28
tof b28 c18
tof b28 c9
tof b28 c31
tof b28 c5
tof b21 c31
tof b21 b28
tof b20 c31
tof b19 c31
tof b19 b28
tof b21 c18
tof b19 c8
tof b21 c9
tof b19 c4
tof b19 c2
tof b18 c2
tof b18 b19
tof b17 c2
tof b17 b19
tof b16 c2
tof c2 c21
tof c2 c22
tof c2 c16
tof c2 c20
tof c2 c13
tof b18 c8
tof b19 b30
tof c2 b29
tof c2 c11
tof c2 c9
tof c2 c12
tof b18 c4
tof b18 b28
tof b15 c2
tof b15 c15
tof b14 c0
tof b14 c15
tof b14 b15
tof b13 c0
tof b13 b15
tof c2 c21
tof b15 c1
tof c2 c22
tof c2 c16
tof c2 c20
tof b15 c19
tof c2 c13
tof c15 c8
tof c2 c11
tof c2 c9
tof c2 c12
tof b12 c19
tof b12 c0
tof b11 c19
tof b11 c0
tof b10 c0
tof b12 c1
tof c0 c16
tof c0 c12
tof b10 c14
tof b9 c9
tof b9 c7
tof b8 c9
tof b8 c7
tof b7 c7
tof c7 c21
tof b9 c22
tof b9 c20
tof b9 c13
tof b9 c0
tof b5 c6
tof b6 c8
tof b3 b4
tof a31 b1
tof a30 c6
tof a31 b4
tof a30 b5
tof a31 b3
tof a31 b2
tof a29 c8
tof a27 c7
tof a28 b6
tof a24 b0
tof a24 c22
tof a24 c20
tof a24 c13
tof a25 c9
tof a24 b9
tof a24 c0
tof a25 b8
tof a25 b7
tof a23 c16
tof a22 c19
tof a23 c12
tof a22 b10
tof a21 b12
tof a22 b11
tof a23 c14
tof a18 c11
tof a18 c2
tof a19 b14
tof a20 b15
tof a20 b13
tof a16 b30
tof a17 b29
tof a15 b28
tof a15 b18
tof a16 b17
tof a17 b16
tof a12 b20
tof a14 c31
tof a11 c5
tof a11 b21
tof a9 b24
tof a10 b23
tof a11 b22
tof a8 b31
tof a6 b27
tof a7 b26
tof a7 b25
T* b1
T* b7
T* c21
T b10
T* b20
T* b21
T* a7
T* a1
T* b2
T* a26
T* a25
T* a24
T* a23
T* a22
T* a21
T* c1
T* a20
T* a19
T* a18
T* a17
T* a16
T* a15
T* a14
T* a13
T* a12
T* a11
T* a10
T* a9
T* a8
T* b25
T* a6
T* a2
T* a31
T* a28
T* a27
T* b8
T* c0
T* c14
T* b11
T* b12
T* b13
T* b15
T* b14
T* c2
T* b16
T* b17
T* b18
T* c31
T* b22
T* b23
T* b24
T* b26
T* b27
T* a5
T* a4
T* a3
T* b3
T* a30
T* a29
T* b19
T b28
T c5
T* b5
T b9
T* b31
T* c15
T* c3
T* b6
T c7
T* c4
T* b4
T* c10
T* c12
T c9
T* c11
T* b29
T* b30
T c8
T* c13
T* c19
T* c17
T* c18
T c20
T* c6
T* c16
T c22
T* a0
T* b0
tof a24 b1
tof a23 b1
tof a22 b1
tof a21 b1
tof b8 a27
tof c0 b1
tof c14 b1
tof b11 b1
tof b12 b1
tof b4 b1
tof b7 b1
tof a27 b1
tof c21 b7
tof a27 c21
tof a7 b21
tof a24 b10
tof a22 b10
tof a17 b21
tof a16 b21
tof a15 b21
tof a12 b20
tof a10 b21
tof a9 b21
tof a6 b21
tof c0 b10
tof c14 b10
tof c2 b21
tof b16 b21
tof b17 b21
tof b18 a14
tof b22 b21
tof b23 b21
tof b24 b21
tof b26 b21
tof b27 b21
tof c11 b21
tof b21 b20
tof a14 b21
tof a20 b2
tof a19 b2
tof a18 b2
tof a16 a17
tof a10 b2
tof a9 b2
tof a6 a7
tof a2 a17
tof b13 b2
tof b14 b2
tof c2 a17
tof b16 a17
tof b23 b2
tof b24 b2
tof b26 a7
tof b27 a7
tof b31 a8
tof b4 b2
tof c11 a7
tof b30 a17
tof c6 b2
tof a17 a7
tof a8 a7
tof a8 a1
tof a17 b2
tof a8 b2
tof a22 a25
tof a21 a25
tof a20 a25
tof a28 a25
tof a27 a26
tof b8 a24
tof c0 a24
tof c14 a23
tof b11 a25
tof b12 a25
tof b13 a25
tof a29 a25
tof b6 a25
tof a24 a26
tof a24 a25
tof a23 a25
tof a23 a24
tof a20 a22
tof a19 a22
tof a18 a22
tof a17 a22
tof a15 a22
tof a2 a22
tof b8 a22
tof c0 a23
tof c14 a22
tof b11 a21
tof b12 a21
tof b13 a22
tof b14 a22
tof b17 a22
tof b28 a22
tof b30 a22
tof a21 a22
tof a18 a19
tof a17 a19
tof a10 a19
tof a9 a19
tof a8 a19
tof a28 a31
tof b11 c1
tof b12 c1
tof b13 a20
tof b14 a19
tof b23 a19
tof b24 a19
tof a30 a19
tof a29 a31
tof b6 a31
tof b4 a20
tof c6 a19
tof a31 a20
tof a31 a19
tof a2 a16
tof b14 a18
tof c2 a18
tof a3 b16
tof b19 a17
tof b29 b16
tof b30 a16
tof a16 a17
tof b16 a16
tof a12 a14
tof a11 a13
tof a9 a10
tof a8 a10
tof a2 a10
tof b17 a15
tof b22 a13
tof b23 a10
tof b24 a10
tof b30 a10
tof a13 a15
tof a10 a15
tof a13 a14
tof a10 a13
tof b18 a13
tof b25 a12
tof a6 a12
tof a2 a8
tof b17 a12
tof c31 a12
tof b24 a8
tof b26 a12
tof b27 a12
tof c11 a12
tof b30 a8
tof a10 a12
tof a8 a12
tof b18 a12
tof a10 a11
tof b18 a11
tof b22 a11
tof a9 a10
tof a8 a10
tof b22 a10
tof a6 b25
tof a31 a2
tof b13 a2
tof b14 a2
tof c2 a2
tof b16 a2
tof b22 a2
tof b24 b23
tof b26 b25
tof b27 b25
tof a30 a2
tof b19 a2
tof c11 b25
tof b30 a2
tof c6 a2
tof b23 a9
tof a2 a8
tof b23 a8
tof a2 b25
tof b23 b25
tof b8 a2
tof b11 a2
tof b17 a6
tof c31 a6
tof b22 b18
tof b23 a6
tof b24 a6
tof b27 a6
tof b3 a31
tof a30 a2
tof b28 a2
tof b6 a31
tof b4 a2
tof c11 a6
tof c6 a2
tof b18 a6
tof b18 a2
tof c0 b8
tof c14 a27
tof b11 a27
tof b3 a28
tof b4 a27
tof b14 b13
tof c2 b13
tof b16 b13
tof b18 b13
tof b22 b13
tof a4 b13
tof b19 b13
tof b28 b13
tof b6 b13
tof b30 b13
tof b13 c14
tof b13 b11
tof b14 b15
tof c2 b15
tof b16 b15
tof b18 b15
tof b22 b15
tof a4 b15
tof b19 b15
tof b28 b15
tof b4 b3
tof b30 b15
tof b3 b12
tof b6 b12
tof b6 b13
tof b3 b15
tof b6 b15
tof a4 b16
tof b30 b16
tof c2 b14
tof b19 b14
tof b16 c2
tof b17 c2
tof b19 c2
tof b19 b16
tof b22 b18
tof a3 a4
tof b29 a4
tof b30 a4
tof b18 b17
tof c31 b17
tof a4 b18
tof b28 a30
tof b6 a30
tof b4 a30
tof c6 a30
tof a30 b22
tof b24 b23
tof a30 b23
tof a30 b24
tof a4 b27
tof c11 b27
tof b29 b27
tof b30 b26
tof a3 b27
tof a3 a5
tof a30 a4
tof b31 a3
tof b6 b28
tof b4 a29
tof c6 a29
tof c11 a30
tof b28 a29
tof c11 a29
tof b28 b19
tof c11 b19
tof b6 c5
tof b4 b5
tof c6 c11
tof c5 b28
tof c11 c5
tof c4 b9
tof b29 b31
tof c6 b31
tof b6 b9
tof c11 b9
tof c11 b31
tof b6 c15
tof c9 c4
tof c11 c4
tof c7 b6
tof c4 c7
tof c11 c10
tof c6 c4
tof c6 c10
tof c8 c9
tof c6 c12
tof c11 c9
tof c13 c8
tof c6 b29
tof c6 b30
tof c6 c8
tof c20 c13
tof c6 c13
tof c16 c6
tof c22 c20
tof c22 c16
tof c16 c22
tof c6 c16
tof c20 c16
tof c6 c22
tof c13 c16
tof c13 c20
tof b29 c6
tof c11 c8
tof c9 c8
tof c8 c16
tof c8 c20
tof c11 c6
tof c11 b29
tof c8 c13
tof c11 c17
tof c11 c19
tof c4 c16
tof c4 b29
tof c4 c18
tof b6 c7
tof c7 c20
tof c7 b29
tof c7 c13
tof c7 c18
tof c7 c8
tof c7 c9
tof c7 c4
tof b9 c16
tof b9 c20
tof b9 c13
tof b9 c8
tof b9 c7
tof c5 b5
tof b28 b5
tof b28 c5
tof c5 c22
tof c5 c6
tof c5 b30
tof c5 b29
tof c5 c18
tof c5 c17
tof c5 c19
tof c5 c8
tof c5 c11
tof c5 c4
tof c5 c12
tof c5 b9
tof b19 c22
tof a29 c5
tof a30 b19
tof a30 a29
tof a30 b30
tof a30 c18
tof a30 c17
tof a30 c19
tof a30 c8
tof c5 c9
tof a30 c4
tof a30 c12
tof a30 b31
tof a30 b5
tof b3 b19
tof b3 b31
tof a3 b31
tof a4 b19
tof b3 b0
tof b3 c6
tof b3 c18
tof b3 c9
tof b3 c15
tof b3 c5
tof b24 a30
tof b23 a30
tof b23 b24
tof b22 a30
tof b22 b23
tof b23 a0
tof a30 c17
tof a30 c19
tof b22 c11
tof b23 b31
tof b23 c3
tof b23 b26
tof b22 b28
tof c31 b9
tof b18 a4
tof b18 c31
tof b17 b9
tof b17 a4
tof b17 c31
tof b18 b19
tof b18 c6
tof b17 b30
tof b18 b29
tof b9 c9
tof b18 b31
tof b17 c3
tof b17 b26
tof b17 a30
tof a4 b3
tof a4 b28
tof a4 b22
tof b16 b19
tof b14 b19
tof b12 b15
tof b13 c6
tof b12 c18
tof b13 c9
tof b13 c4
tof b13 b6
tof b13 b31
tof b13 c16
tof b13 b3
tof b13 a4
tof b13 b19
tof b11 c4
tof b11 a4
tof c14 c16
tof c14 b11
tof c0 c16
tof c0 a4
tof c16 c20
tof c0 c6
tof a4 b30
tof c0 b29
tof c16 c13
tof c0 c19
tof c16 c8
tof c16 c9
tof c16 c7
tof c0 c12
tof c16 b9
tof c14 b6
tof b11 b4
tof a4 c3
tof c0 c15
tof c14 c5
tof a4 a30
tof a4 b3
tof a4 b28
tof a4 b22
tof c0 b13
tof b8 c9
tof a28 c9
tof b8 c20
tof b8 c6
tof b8 b30
tof b8 b29
tof b8 c13
tof b8 c19
tof b8 c8
tof b8 c7
tof b8 c12
tof b8 b9
tof b8 c3
tof b8 c16
tof a28 c5
tof a28 a29
tof a27 b5
tof b8 a30
tof b8 b3
tof b8 b28
tof b8 b22
tof b8 a4
tof b8 b13
tof a31 b3
tof a2 b3
tof b3 b15
tof a31 b0
tof a31 c6
tof a2 b30
tof b3 b29
tof b3 c9
tof a2 c4
tof a2 b4
tof a31 b31
tof a2 c3
tof a31 c15
tof b3 c5
tof a31 a29
tof a2 b5
tof a2 a27
tof b3 b27
tof a6 b26
tof a2 a30
tof a2 b28
tof a2 b22
tof a2 a4
tof b3 b16
tof b3 b18
tof a31 b12
tof b3 c2
tof a31 b19
tof b3 b13
tof a2 b11
tof b3 c14
tof a31 a28
tof b3 c31
tof b25 a30
tof b25 a4
tof a8 c3
tof a8 b25
tof a9 a4
tof a9 a8
tof a9 a0
tof a8 b15
tof a8 c6
tof a8 b30
tof a9 c17
tof a9 c19
tof a8 c9
tof a8 c4
tof b25 c10
tof a8 b4
tof a8 b31
tof a8 c5
tof a8 b5
tof a8 a27
tof b25 b27
tof b25 b26
tof a4 a6
tof a8 b28
tof a9 b24
tof a9 b23
tof a8 b22
tof b25 b16
tof b25 b17
tof a8 c2
tof a8 b13
tof a8 b11
tof a8 c14
tof a8 a2
tof a10 a4
tof a12 a4
tof a10 a0
tof a10 b15
tof a10 c6
tof a10 b30
tof a4 c18
tof a10 c17
tof a10 c19
tof a10 c9
tof a10 c11
tof a10 c4
tof a4 c12
tof a10 b4
tof a10 c5
tof a10 b5
tof a10 a27
tof a10 b28
tof a10 b24
tof a10 b23
tof a11 b22
tof a12 b17
tof a10 c2
tof a10 b13
tof a10 b11
tof a10 c14
tof a10 a2
tof a10 a8
tof a13 a12
tof a14 a12
tof a15 a13
tof a15 a14
tof a13 b15
tof a13 b29
tof a14 c18
tof a13 c4
tof a14 c12
tof a13 b9
tof a13 b4
tof a13 c5
tof a13 b5
tof a13 a27
tof a13 b28
tof a14 b23
tof a15 b22
tof a14 a4
tof a13 a11
tof a14 b17
tof a13 b18
tof a13 b25
tof a13 b13
tof a13 b11
tof a13 c14
tof a13 a2
tof a16 a8
tof a16 b16
tof a17 b14
tof a17 a8
tof a17 b16
tof a18 b14
tof a18 a8
tof a17 c22
tof a8 b15
tof a16 c6
tof a16 b29
tof b16 c17
tof b16 c19
tof a8 c9
tof b16 c10
tof a8 c5
tof a8 a29
tof b16 b27
tof b16 b26
tof a16 a3
tof b16 a30
tof b16 a6
tof b16 b24
tof a16 b18
tof b16 b25
tof a8 c2
tof a8 b19
tof a8 b13
tof a8 c14
tof a16 a5
tof b16 a12
tof a16 c31
tof a19 a8
tof a20 a19
tof a8 b15
tof a20 b0
tof a19 c6
tof a19 b30
tof a19 c18
tof a19 c17
tof a19 c19
tof a19 c8
tof a8 c9
tof a19 c11
tof a19 c12
tof a19 b4
tof a20 c15
tof a8 c5
tof a8 a29
tof a19 a27
tof a8 b14
tof a19 b19
tof a8 b13
tof a19 b11
tof a8 c14
tof a19 a2
tof a20 a28
tof a20 b12
tof a20 a31
tof a21 a2
tof a22 b11
tof a22 a2
tof a23 b11
tof a21 c1
tof a22 b15
tof b11 b0
tof a23 c20
tof b11 c6
tof a21 b30
tof a22 b29
tof a23 c13
tof b11 c17
tof a21 c19
tof b11 c8
tof a21 c11
tof a22 c4
tof b11 c12
tof a22 b9
tof a22 b4
tof b11 c15
tof a23 c16
tof a22 c5
tof a22 b5
tof a22 a27
tof a22 b28
tof a21 b19
tof a22 b13
tof a23 c0
tof a23 b8
tof a22 c14
tof a24 c8
tof a24 c9
tof a24 c7
tof a24 b9
tof a24 b6
tof a26 c15
tof a24 c5
tof a25 a29
tof a24 b5
tof a24 a27
tof a26 c0
tof a24 b8
tof a24 c14
tof a7 b2
tof a7 c8
tof a7 c11
tof a7 c4
tof a7 c3
tof a7 a29
tof a7 b5
tof a7 b27
tof a7 a3
tof a7 a30
tof a7 a6
tof a7 b28
tof a7 b24
tof a7 b23
tof a7 b22
tof a7 a4
tof a7 a11
tof a7 a5
tof a7 a19
tof a7 b3
tof a7 b16
tof a7 a14
tof a7 a15
tof a7 a16
tof b21 c12
tof b10 c12
tof b10 c20
tof b10 c6
tof b10 c13
tof b21 c18
tof b10 c19
tof b10 c8
tof b10 c9
tof b10 c7
tof b10 b6
tof b10 c16
tof b10 b28
tof b21 b23
tof b20 b22
tof b21 b17
tof b20 b18
tof b10 a22
tof b20 a12
tof b21 a14
tof b20 a15
tof b10 b15
tof c21 b6
tof b7 c21
tof b7 c20
tof b7 c6
tof b7 c13
tof b7 c19
tof b7 c8
tof b7 c9
tof b7 c7
tof b7 c12
tof c21 c15
tof b7 c16
tof c21 b5
tof c21 a27
tof b7 b28
tof c21 c0
tof c21 b8
tof b7 a22
tof c21 a26
tof b7 b15
T* b2
T* a20
T* a31
T* b7
T b10
T* a16
T* a7
T* c1
T b15
T* a23
T* a2
T* a21
T* b12
T* a8
T* a18
T* c22
T* a17
T* c31
T* a13
T* b20
T* b21
T* a15
T* a14
T* a10
T* a9
T* b16
T* b3
T* a19
T* c21
T* a26
T* a24
T* a12
T* a22
T* a5
T* a28
T* a25
T* c14
T* b8
T* c0
T* b11
T* b13
T* b19
T* b14
T* c2
T* b25
T* b18
T* b17
T* a11
T* a4
T* b22
T* b23
T* b24
T* b28
T* a6
T* a30
T* a3
T* b26
T* b27
T* a27
T* b5
T* a29
T* c5
T* c16
T* c15
T* c3
T* b31
T* b4
T* b6
T* b9
T* c10
T c12
T* c7
T* c4
T* c11
T* c9
T c8
T c19
T* c17
T* c18
T* c13
T* b29
T* b30
T c6
T* c20
T* b0
T* b1
T* a1
T* a0
tof c21 b2
tof c14 a31
tof a29 a25
tof a25 b2
tof c5 b2
tof a25 a20
tof c5 a31
tof a21 b10
tof c22 a8
tof a13 a8
tof b21 a8
tof a24 b7
tof a28 b7
tof a25 b10
tof b11 b10
tof b19 a8
tof b14 a8
tof b25 a8
tof b17 a8
tof a4 a8
tof a29 b10
tof c5 b10
tof b4 b7
tof c4 a8
tof b29 a16
tof b30 a16
tof a8 b10
tof a8 a16
tof a23 c1
tof a21 b15
tof a14 a7
tof a9 a7
tof c21 b12
tof a26 b12
tof a28 b12
tof a25 b12
tof b8 b12
tof c0 b12
tof b11 b15
tof b13 b12
tof b23 a7
tof a6 a7
tof a29 b12
tof c5 b12
tof b4 b12
tof c4 a7
tof b30 a7
tof a8 a7
tof b15 c1
tof b12 b15
tof a8 b15
tof a8 a21
tof a17 a18
tof a13 a18
tof b21 a18
tof a26 c21
tof a28 a18
tof a25 a18
tof c14 a2
tof b8 c21
tof c0 c21
tof b11 a21
tof b13 a24
tof b25 a18
tof b17 a18
tof a4 a18
tof a29 a18
tof c5 a18
tof b4 a18
tof c4 a18
tof a21 a23
tof a24 a23
tof c21 a2
tof a24 a2
tof a18 a21
tof c21 a21
tof c31 b12
tof b20 b12
tof a15 b12
tof a9 a14
tof a5 a14
tof a28 b12
tof a25 b12
tof b19 a18
tof b18 b12
tof a11 b12
tof b22 b12
tof b23 a14
tof a29 b12
tof c5 b12
tof b31 a14
tof b4 b12
tof c4 a14
tof c11 b12
tof b30 a14
tof a8 b12
tof c21 b12
tof a18 a8
tof c21 a8
tof a14 a18
tof c21 a18
tof b20 a17
tof b21 a13
tof a15 a17
tof a14 c22
tof c21 a17
tof a28 a17
tof a25 a17
tof b19 a17
tof c2 c31
tof b25 a13
tof b18 c31
tof b17 a13
tof a11 a17
tof a4 a13
tof b22 a17
tof a29 a17
tof c5 a17
tof b4 a17
tof c4 a13
tof c11 a17
tof a13 c22
tof c31 a17
tof a13 a17
tof a15 b21
tof b14 a13
tof b25 a13
tof b18 b20
tof a11 b20
tof a4 b21
tof b22 b21
tof c4 b21
tof c11 b21
tof a14 a13
tof b21 b20
tof a14 b20
tof a14 b21
tof b17 b21
tof a9 a10
tof a5 a10
tof a11 a15
tof b22 a15
tof b23 a10
tof b24 a10
tof b31 a10
tof c4 a14
tof b30 a10
tof a14 a15
tof c11 a15
tof a4 a14
tof c11 a14
tof c11 a10
tof b22 a5
tof b23 b3
tof a30 b16
tof b31 a9
tof c11 a5
tof b30 a5
tof a5 a9
tof b24 b16
tof a5 b3
tof b24 b3
tof a28 c21
tof a25 c21
tof b8 a26
tof b19 a24
tof a4 a24
tof a29 c21
tof c5 c21
tof c15 c21
tof c4 a24
tof c11 a24
tof a26 a19
tof c0 a19
tof b4 a19
tof a26 c21
tof b11 c21
tof b4 c21
tof a24 a26
tof c0 a26
tof b11 a26
tof c0 a24
tof b19 a24
tof c2 a12
tof b17 a22
tof a11 a22
tof a4 b13
tof c4 b13
tof c11 a24
tof b13 a24
tof b13 a12
tof c14 a25
tof b22 a5
tof b26 a5
tof a27 a25
tof c5 a25
tof c11 a5
tof b30 a5
tof a25 a28
tof b4 a25
tof b11 c0
tof b13 b8
tof b19 b8
tof c15 a29
tof b4 c0
tof c11 b8
tof a27 c14
tof c0 b8
tof a27 c0
tof a29 c0
tof c15 b17
tof c3 b17
tof c11 b19
tof b13 b11
tof b19 b11
tof b19 b13
tof b17 b19
tof b17 b18
tof a11 b18
tof a4 b18
tof c15 b18
tof c3 b18
tof c11 b18
tof b25 b14
tof b18 b14
tof b18 c2
tof b18 b25
tof a4 a11
tof c15 b17
tof c3 b17
tof c11 b17
tof a11 b17
tof c11 a4
tof c11 b22
tof c11 b23
tof b26 a6
tof b31 a6
tof b30 a6
tof c4 a3
tof c11 a30
tof b29 a3
tof b26 a30
tof b30 a30
tof b30 a3
tof b31 b26
tof b31 b27
tof c4 b27
tof b29 b27
tof b30 b27
tof c5 a27
tof c5 b5
tof c3 a29
tof c10 a29
tof c11 a29
tof c10 c15
tof c12 c15
tof c11 c15
tof c18 b31
tof b30 b31
tof c3 c15
tof b9 c3
tof c12 b9
tof c11 b4
tof c11 c10
tof c12 c10
tof c7 c10
tof c7 c12
tof c8 c12
tof c9 c7
tof c8 c9
tof c19 c9
tof c9 c4
tof b30 c11
tof b29 c9
tof b30 c9
tof b29 c13
tof c17 c8
tof c17 c19
tof c13 c19
tof c13 c17
tof c6 c17
tof b30 b29
tof c23 c13
tof b29 c13
tof c6 b30
tof c20 b30
tof c20 c6
tof b30 c20
tof b30 c6
tof c6 a1
tof c6 a0
tof c18 c13
tof b29 c20
tof c18 c23
tof c19 c17
tof c8 c19
tof c17 c20
tof c19 c13
tof c17 b30
tof c9 c13
tof c9 b29
tof c11 c9
tof c4 b29
tof c4 c9
tof c11 a1
tof c9 c20
tof c13 c23
tof b29 b30
tof b29 c17
tof c9 c19
tof c11 c6
tof c7 c4
tof c12 c4
tof c10 c12
tof c10 c7
tof c4 c20
tof c7 c23
tof c7 c13
tof c4 b30
tof c4 c17
tof c4 c19
tof c12 c8
tof b4 c20
tof b9 c23
tof b9 c19
tof b9 c4
tof b9 c12
tof b31 c13
tof c3 c13
tof c3 c12
tof c15 c13
tof c15 c12
tof c15 c20
tof c3 c23
tof c15 b30
tof c15 c17
tof c12 c19
tof c3 c8
tof c15 c7
tof c15 c10
tof c15 b9
tof a29 c20
tof a29 c23
tof a29 c13
tof a29 c17
tof a29 c19
tof c5 b4
tof a29 c8
tof a29 b9
tof a29 c15
tof a27 b5
tof a27 b0
tof a27 b4
tof a27 c5
tof b26 c13
tof a30 c19
tof b26 b31
tof b26 b27
tof b24 b28
tof b24 a1
tof a6 c13
tof a6 c19
tof a6 b31
tof a6 c18
tof a6 c8
tof a6 a29
tof b24 c11
tof b24 a30
tof b24 c9
tof b23 a1
tof b22 a6
tof b22 b23
tof a4 b22
tof a4 a0
tof a4 c5
tof a6 c8
tof a4 c4
tof b23 c11
tof a4 b27
tof a4 c6
tof a4 a3
tof b23 a30
tof a4 c9
tof a4 b29
tof a11 c3
tof b17 c3
tof b17 a4
tof b18 b17
tof c3 c13
tof c3 c19
tof a11 b4
tof a4 c5
tof c3 c8
tof c3 c4
tof a11 c7
tof a11 c10
tof c3 b9
tof a11 c6
tof b25 c18
tof b25 b18
tof c2 a4
tof c2 b18
tof c2 b25
tof b14 c18
tof b14 b18
tof b14 c2
tof c18 b31
tof b14 b22
tof b14 a11
tof b19 b30
tof b19 b9
tof b19 a29
tof b13 b30
tof b13 b6
tof b13 b19
tof b11 b30
tof b11 b9
tof b11 b6
tof b11 b1
tof b13 c23
tof a29 c13
tof a29 c19
tof b9 b4
tof b9 c5
tof b19 c8
tof b19 c4
tof b19 c7
tof b19 c10
tof b19 c3
tof c14 b0
tof c0 b4
tof c0 c5
tof c0 b9
tof c14 a27
tof a28 a29
tof a5 a29
tof a25 c20
tof a28 c23
tof a5 c13
tof a29 b30
tof a28 c17
tof a5 c19
tof a25 b4
tof a5 b31
tof a5 c18
tof a28 c8
tof a28 c15
tof a28 c0
tof a5 a30
tof a5 b26
tof a5 a6
tof a5 b27
tof a24 a12
tof a24 c23
tof a24 b4
tof a24 c5
tof a24 c4
tof a24 c12
tof a24 b9
tof a24 b19
tof a24 b8
tof a26 c23
tof c21 c23
tof a26 b1
tof c23 c20
tof a26 c13
tof c23 b30
tof c23 c17
tof c23 b4
tof c23 c8
tof c21 c4
tof c21 c12
tof c23 b9
tof c23 c15
tof c23 a29
tof c21 c3
tof a26 b6
tof c21 b19
tof a26 b11
tof c21 c0
tof c23 a25
tof a26 b8
tof c23 c14
tof c23 a28
tof b16 b3
tof b16 a30
tof a9 b3
tof a9 a30
tof b16 a1
tof a30 c19
tof a9 c8
tof a9 c11
tof b16 b24
tof a9 b23
tof a9 b22
tof a10 b23
tof a14 b23
tof a14 b14
tof a15 b14
tof a10 a1
tof a10 b3
tof a14 a0
tof a14 c13
tof a10 c19
tof b23 a12
tof a15 b4
tof a15 c5
tof a14 c8
tof a15 c7
tof a15 c10
tof a14 b9
tof a14 c3
tof a14 b6
tof a10 c11
tof a14 b19
tof a10 a30
tof b23 c9
tof a10 b24
tof b14 b22
tof b14 a11
tof a14 a4
tof b14 c2
tof a14 b29
tof a14 b13
tof a14 a26
tof a14 b27
tof a15 c6
tof a14 a3
tof b21 c2
tof b21 b14
tof b20 c2
tof b20 b14
tof a13 b14
tof b14 a12
tof b21 c5
tof a13 c18
tof b21 c7
tof b21 c10
tof c2 b9
tof b20 a29
tof b20 b19
tof b21 a11
tof c2 a4
tof b20 b17
tof c2 b18
tof b14 b25
tof b21 c6
tof b21 a22
tof c31 a12
tof c22 b31
tof c31 b9
tof c22 c3
tof c31 b17
tof c22 b18
tof c31 b25
tof c31 c2
tof c22 b29
tof c22 a13
tof a18 b25
tof a18 a26
tof a8 b25
tof a8 a18
tof b12 b25
tof a18 a1
tof a18 b3
tof a18 a0
tof a26 c13
tof a18 b30
tof a8 c19
tof a18 b4
tof b25 c18
tof a26 c4
tof a18 b9
tof a8 a29
tof a26 c3
tof a18 b6
tof a26 b19
tof a18 a30
tof a18 b26
tof a18 c9
tof a18 b24
tof a18 a6
tof a18 b23
tof a18 b22
tof a18 a11
tof a18 a4
tof a18 b17
tof a18 b18
tof a18 b13
tof a18 c22
tof a8 a17
tof a8 c16
tof a18 a5
tof a18 a3
tof a18 a10
tof a18 a9
tof a18 a14
tof a18 a15
tof a18 b21
tof a18 b20
tof a18 b14
tof a18 a22
tof a21 a26
tof a23 a26
tof a23 a2
tof a21 c13
tof a26 b30
tof a21 c19
tof a23 a12
tof a23 b4
tof a23 c5
tof a23 c8
tof a21 c4
tof a26 c12
tof a23 c7
tof a23 c10
tof a23 b9
tof a21 a29
tof a21 c3
tof a23 b6
tof a21 b19
tof a23 b11
tof a26 c0
tof a2 a27
tof a23 b13
tof a23 a24
tof a21 c16
tof a21 a8
tof c1 b15
tof b15 b30
tof b15 c17
tof b15 c8
tof b15 c4
tof b15 c12
tof b15 c15
tof b15 a29
tof b15 c3
tof b15 b19
tof b15 c21
tof b15 a21
tof b10 b15
tof b7 b15
tof b15 b30
tof b15 c17
tof b15 c8
tof b15 c4
tof b15 c12
tof b15 c15
tof b15 a29
tof b15 c3
tof b15 b19
tof b15 c21
tof b15 a21
tof b15 c1
T* a19
T* b7
T b10
T* b3
T* a20
T* a31
T b15
T* a16
T* c1
T* c23
T a21
T* b27
T* a18
T* a28
T* a22
T* b28
T* b5
T* b14
T* b20
T* b21
T* a15
T* a14
T* a9
T* a10
T* a3
T* a5
T* c20
T* a23
T* a8
T* c16
T* a17
T* c22
T* b12
T* a13
T* c31
T* c6
T* b16
T* c14
T* a2
T* a26
T c21
T* a24
T* b13
T* b29
T* c2
T* b25
T* b18
T* b17
T* a4
T* a11
T* b22
T* b23
T* a6
T* b24
T* c9
T* b26
T* a30
T* b8
T* a25
T* a27
T* c0
T* b11
T b19
T* c11
T* b6
T c3
T a29
T* c15
T* b9
T* c10
T* c7
T* c12
T* c4
T c8
T* c18
T* b31
T* c5
T* b4
T* a12
T* c19
T* c17
T b30
T c13
T* a0
T* b0
T* b2
T* a7
T* a1
T* b1
tof c23 b10
tof a28 b7
tof b20 b7
tof b21 b7
tof c20 b10
tof a8 b10
tof a13 b12
tof c31 b12
tof c6 b7
tof a24 b7
tof b13 b10
tof b25 b12
tof b18 b12
tof b17 b12
tof a4 b7
tof c0 a26
tof b11 b7
tof b9 b12
tof c5 b10
tof b4 b7
tof a26 a19
tof b12 b7
tof a26 b7
tof b12 b10
tof b21 b20
tof c22 a20
tof b12 b20
tof c6 b20
tof b16 b3
tof a2 a31
tof b29 a20
tof c2 a20
tof a4 b20
tof c9 b3
tof a27 a31
tof b9 a20
tof b4 b20
tof b20 a20
tof b20 a31
tof a14 a16
tof a10 a16
tof a23 c23
tof b16 a16
tof a2 c1
tof a24 c23
tof c2 c23
tof b23 a16
tof b24 a16
tof c0 c1
tof c11 a16
tof b9 c23
tof c23 b15
tof c23 c1
tof b12 a21
tof a2 a23
tof a24 a23
tof c2 c23
tof b17 a21
tof c9 b27
tof a27 a23
tof c11 b27
tof b9 c23
tof a21 c23
tof a23 a21
tof b20 a28
tof a14 a18
tof a9 a18
tof a10 a18
tof a23 a22
tof b12 a22
tof c31 a22
tof c6 a15
tof b16 a18
tof a26 a28
tof a24 a28
tof b17 a22
tof a11 a18
tof b22 a18
tof b23 a18
tof a6 a18
tof b24 a18
tof b11 a28
tof c11 a18
tof a15 a18
tof a15 a22
tof b21 b20
tof a15 b28
tof c31 b14
tof b16 b28
tof b17 b14
tof a11 b14
tof b22 b28
tof b24 b28
tof c5 b5
tof b4 b20
tof b20 b28
tof a23 b28
tof a23 b5
tof b12 b5
tof b20 b14
tof b12 b14
tof a9 a15
tof a10 a14
tof a3 a15
tof b12 b20
tof b16 a14
tof c14 b21
tof b18 c31
tof b17 c31
tof a11 a14
tof b22 a15
tof b23 a14
tof a6 a15
tof b24 a14
tof c9 c31
tof a30 c31
tof c11 a15
tof b31 c31
tof c5 b21
tof b4 b21
tof a14 b20
tof c31 b20
tof a14 b21
tof c31 b21
tof a14 a15
tof a3 a9
tof b12 a23
tof c31 a23
tof b16 a10
tof a4 c6
tof a6 a9
tof b24 a10
tof b19 a23
tof c11 a9
tof a23 a14
tof c6 a14
tof a23 a9
tof a23 a10
tof c6 a10
tof c31 a3
tof b16 a5
tof a26 b12
tof a24 a3
tof c9 a5
tof a30 a5
tof b11 a3
tof c11 a3
tof c5 c20
tof a12 a3
tof b12 a3
tof b12 c20
tof b12 c16
tof a2 a13
tof a26 a13
tof a24 a13
tof b13 a8
tof a4 b17
tof c9 a13
tof a30 a13
tof a27 a13
tof b11 a8
tof b19 a8
tof b31 a13
tof c31 a23
tof b17 a23
tof c16 a8
tof b17 a8
tof a13 c16
tof c31 c16
tof c31 a13
tof a2 a13
tof a24 a13
tof b29 c22
tof c2 c22
tof a25 c14
tof a27 a13
tof b9 c22
tof c5 c14
tof c22 a17
tof a26 a17
tof b12 c22
tof a13 c22
tof c14 b12
tof a26 b12
tof a24 a13
tof b29 a13
tof c2 c31
tof b18 c31
tof a4 c6
tof a11 c6
tof c9 c31
tof a30 c31
tof b11 a13
tof b9 c31
tof b31 c31
tof c14 a13
tof c14 c31
tof a24 a26
tof b17 a26
tof b26 b16
tof b11 a26
tof b19 a26
tof c11 b16
tof c3 a26
tof c5 a2
tof a2 c14
tof a26 a2
tof a25 b17
tof b11 c21
tof b19 b17
tof b9 a27
tof c5 a27
tof a27 a26
tof c3 a26
tof a24 c21
tof c3 c21
tof b17 a24
tof a27 a24
tof b25 b29
tof b18 c2
tof b17 b29
tof b9 c2
tof b4 c2
tof c3 b13
tof a25 b29
tof c3 b29
tof a25 c2
tof b22 b17
tof c9 b17
tof b26 b17
tof a30 b17
tof a25 b18
tof b19 b17
tof c11 b17
tof c3 a27
tof b31 b17
tof a27 b25
tof b9 b25
tof b9 b18
tof b4 b18
tof a27 b17
tof b4 b17
tof b23 a11
tof c9 a11
tof b26 b22
tof b19 a6
tof c11 a11
tof c3 a6
tof a12 a6
tof a11 a4
tof b22 a4
tof b22 a11
tof a6 b22
tof b26 b24
tof b19 b11
tof c11 c9
tof c3 b11
tof b31 b11
tof b4 b11
tof a6 b23
tof c9 b23
tof c9 a6
tof a30 a6
tof b11 a6
tof c9 b24
tof a30 b24
tof a30 c9
tof c11 c9
tof b11 b26
tof c11 b26
tof b11 a30
tof c3 b8
tof b9 b8
tof c5 b8
tof a27 b8
tof c0 a25
tof c0 a27
tof b4 a27
tof c3 c0
tof b31 c0
tof b4 c0
tof b11 c0
tof b19 c0
tof c11 b11
tof a29 b19
tof a29 c11
tof b31 c11
tof b4 c11
tof b9 c11
tof b9 b6
tof b9 c3
tof b31 b9
tof b4 b9
tof b31 c10
tof b4 c10
tof b4 c7
tof b31 c18
tof b4 c18
tof a12 c18
tof b4 b31
tof a12 b31
tof b4 c5
tof a12 b4
tof b30 a12
tof b1 b30
tof b1 b2
tof b30 b1
tof b30 b2
tof a12 b1
tof a12 b2
tof a12 b30
tof b31 b4
tof b31 a7
tof b31 b30
tof b31 c13
tof b31 a12
tof b31 b1
tof c18 c13
tof c18 a12
tof c7 c17
tof c10 c17
tof c10 b4
tof c10 b30
tof c10 c18
tof c10 b31
tof c10 c4
tof b9 c10
tof a29 b9
tof b9 a7
tof c10 b4
tof c10 b30
tof c10 c18
tof c10 b31
tof b9 b1
tof b9 c4
tof a29 c12
tof c3 c7
tof c11 c7
tof c3 a7
tof c3 b4
tof c3 c18
tof c3 b1
tof c3 c4
tof c11 b9
tof c3 a29
tof b19 c7
tof b19 a29
tof b19 c11
tof b11 c7
tof b11 c11
tof c0 a29
tof c0 c11
tof c11 b6
tof b19 a7
tof c11 b4
tof c7 c17
tof c0 b31
tof b19 b1
tof b19 c4
tof b19 c12
tof c0 c10
tof b11 b9
tof c0 c3
tof a27 b4
tof a25 a27
tof a25 b6
tof a25 b31
tof a27 c7
tof a25 c10
tof a25 a29
tof b4 c15
tof a25 c3
tof a25 c11
tof a27 c5
tof a25 c0
tof a30 b9
tof a30 b11
tof b26 a30
tof c9 b11
tof c9 a30
tof c9 b26
tof b11 a0
tof b9 c17
tof b26 c4
tof a6 b26
tof b23 b26
tof a6 b6
tof b26 a1
tof a6 b31
tof b26 c4
tof a6 c7
tof a6 a29
tof a6 c3
tof a6 c5
tof b22 a29
tof b22 b23
tof a11 a29
tof a11 b23
tof a4 a29
tof a4 a11
tof b22 b6
tof b22 b31
tof a11 c12
tof b22 c7
tof b22 c3
tof b22 c5
tof b22 a6
tof b17 b31
tof b17 a29
tof b18 c10
tof b18 a29
tof b25 b31
tof b25 b18
tof b17 b6
tof b31 b2
tof b17 a7
tof c10 c17
tof b31 c19
tof b31 c18
tof c10 c4
tof b17 c7
tof b25 c15
tof b17 c3
tof b17 c5
tof b25 b4
tof b17 a6
tof b17 b22
tof b17 a4
tof c2 b18
tof b29 b18
tof b29 b2
tof c2 a7
tof b29 c19
tof b29 c18
tof b29 b31
tof c2 c10
tof c2 a29
tof b29 c15
tof b13 c11
tof b29 b4
tof b29 b25
tof c2 b22
tof c2 a4
tof c2 b17
tof b29 a27
tof a24 a6
tof a26 a24
tof a26 b6
tof a6 b2
tof a6 b0
tof a26 a7
tof a26 b30
tof a6 a12
tof a6 c19
tof a6 c8
tof a6 c12
tof a24 c10
tof a26 a29
tof a6 c3
tof a26 c11
tof a6 c5
tof a26 b18
tof a24 c0
tof a26 b22
tof a26 a4
tof a26 b17
tof a26 a27
tof a2 c3
tof a2 b17
tof c14 b17
tof c14 a2
tof b16 b17
tof a2 b6
tof c3 b0
tof b16 a1
tof b16 a7
tof c14 b8
tof c14 b30
tof c3 c19
tof a2 c18
tof a2 b1
tof c3 c8
tof c3 c12
tof a2 c7
tof c3 c10
tof a2 a29
tof a2 c15
tof c14 c11
tof a2 c5
tof b16 a30
tof b16 b26
tof a2 b4
tof c14 b25
tof a2 b13
tof b16 b24
tof a2 a4
tof a2 c21
tof a2 b29
tof c14 a26
tof c6 a4
tof c31 b18
tof c31 a4
tof a13 b18
tof a13 b2
tof c31 a7
tof b18 c17
tof a13 c19
tof a13 c18
tof a13 b31
tof b18 c4
tof c31 c10
tof a13 c15
tof a4 b26
tof a13 b4
tof a13 b25
tof c31 b22
tof c31 b17
tof c6 a11
tof a13 a27
tof a13 b29
tof c31 c2
tof b12 a13
tof c22 a13
tof b12 b6
tof b12 b2
tof b12 a7
tof b12 b8
tof b12 b30
tof b12 c19
tof b12 b31
tof b12 b1
tof c22 c4
tof b12 c7
tof b12 c10
tof b12 a29
tof a17 c3
tof b12 c5
tof c22 b4
tof a13 a6
tof a17 c0
tof b12 b13
tof b12 a24
tof b12 b22
tof b12 c21
tof b12 a26
tof b12 a2
tof b12 a25
tof b12 c14
tof b12 c31
tof c16 c18
tof a8 c18
tof a8 c16
tof a23 c16
tof a23 a8
tof a23 b6
tof c16 b2
tof a23 b30
tof c18 c13
tof c18 a12
tof c16 c17
tof c16 c19
tof c16 b31
tof a23 b1
tof a23 a29
tof c16 c15
tof a23 c11
tof a23 b26
tof c16 b18
tof a23 b25
tof a23 b13
tof a23 a4
tof a23 b17
tof a23 c21
tof a23 c6
tof a23 a26
tof a23 a2
tof a3 a7
tof a3 b1
tof a3 b22
tof a10 b1
tof a10 a4
tof a9 b1
tof a9 b17
tof a14 b1
tof a14 a10
tof a14 a9
tof a4 a1
tof b17 a7
tof a10 a12
tof a10 c19
tof a10 b31
tof a4 c4
tof a14 c12
tof a4 b9
tof a14 a29
tof a4 b11
tof b17 a30
tof a14 b26
tof a14 b19
tof a10 b23
tof a10 a3
tof a9 a11
tof a14 c6
tof a14 a23
tof a15 a3
tof b20 a3
tof b20 b21
tof b20 a5
tof a3 a12
tof b20 c17
tof a3 c19
tof a3 b31
tof a3 b1
tof b20 c4
tof b20 c12
tof b20 b9
tof b20 a29
tof b21 c11
tof a15 a30
tof b20 b19
tof b21 a24
tof b20 b24
tof a15 b22
tof a15 b17
tof a15 a11
tof b20 c6
tof b21 a27
tof b21 a25
tof b20 c9
tof a15 a9
tof b20 a23
tof b21 c2
tof b20 a14
tof b21 b12
tof b14 b23
tof b14 a11
tof c23 a21
tof a21 c13
tof a21 a12
tof a21 c19
tof a21 c18
tof a21 c8
tof a21 c10
tof a21 b19
tof a21 a2
tof a21 b6
tof a21 a14
tof a21 c21
tof a21 a8
tof a21 b5
tof a21 b28
tof a21 a22
tof b15 c1
tof b15 c13
tof b15 a12
tof b15 c19
tof b15 c18
tof b15 c8
tof b15 c10
tof b15 b19
tof b15 a2
tof b15 b6
tof b15 a14
tof b15 c21
tof b15 a8
tof b15 b5
tof b15 b28
tof b15 a22
tof b15 c23
tof b10 b15
tof b7 b15
tof b15 c13
tof b15 a12
tof b15 c19
tof b15 c18
tof b15 c8
tof b15 c10
tof b15 b19
tof b15 a2
tof b15 b6
tof b15 a14
tof b15 c21
tof b15 a8
tof b15 b5
tof b15 b28
tof b15 a22
tof b15 c23
tof b15 c1
T* a28
T* b7
T b10
T* a18
T* a19
T* b15
T* b3
T* a31
T c1
T* c20
T* c23
T* a15
T* a5
T* a21
T a22
T* b27
T b28
T b5
T* b16
T* b20
T* b21
T* b8
T* b12
T a8
T* c21
T* a14
T b6
T* c22
T* c31
T* b29
T* c2
T* a23
T* b14
T* a9
T* a10
T* c9
T* c14
T* a25
T* a17
T* a13
T* a2
T* a26
T* c16
T* a27
T* c6
T* a11
T* a3
T* b17
T* a4
T* b22
T* b24
T* a24
T* b13
T* c0
T* a6
T* b25
T* b18
T* b4
T* b23
T* b19
T* b26
T* a30
T* b11
T* c5
T* c11
T* c3
T* c15
T* a29
T* b9
T c10
T* c7
T* c12
T* c4
T* c8
T* b1
T* b31
T c18
T c19
T* c17
T* a12
T* c13
T* b30
T* a0
T* a16
T* a7
T* a1
T* b0
T* b2
T* a20
tof a21 b10
tof b8 b15
tof b12 b15
tof c22 b7
tof a23 c31
tof b14 c31
tof a17 b10
tof a13 b10
tof c16 c31
tof c6 c31
tof a11 c31
tof c0 b15
tof a6 b10
tof b25 b10
tof b18 c31
tof b4 b29
tof c3 a28
tof a29 c31
tof b1 c31
tof b10 a28
tof c31 a28
tof c31 b7
tof b29 b7
tof b15 b10
tof c31 b10
tof b29 b10
tof c23 b15
tof c31 a18
tof b29 b15
tof c2 b15
tof a10 a18
tof c16 a18
tof a27 b15
tof a11 a18
tof b13 b15
tof c0 a19
tof b23 a18
tof b26 a18
tof c3 a19
tof b1 a18
tof b31 a18
tof b12 c1
tof c22 c1
tof c31 c1
tof a23 c1
tof b14 c1
tof a10 b3
tof c14 c1
tof a17 a31
tof a13 a31
tof c6 c1
tof a11 c1
tof b17 b3
tof a24 c1
tof c0 c1
tof a6 a31
tof b26 b3
tof a30 b3
tof c5 c1
tof c11 b13
tof c3 b13
tof a29 c1
tof b1 c1
tof b13 a31
tof b13 c1
tof a22 c23
tof c22 c23
tof b29 c23
tof c2 c23
tof a10 c31
tof a17 c20
tof c16 a15
tof a27 c23
tof a11 c31
tof b13 c23
tof c0 c20
tof b23 c31
tof b26 a15
tof c11 c23
tof b1 c31
tof b31 a15
tof c31 c23
tof c31 a15
tof b28 a22
tof a4 a22
tof b24 a22
tof b13 a21
tof b26 a22
tof a30 b17
tof c3 a21
tof b9 a22
tof b17 a5
tof b17 a22
tof a8 b28
tof c31 b28
tof a10 b27
tof b24 b28
tof b25 b28
tof b26 b17
tof b11 b27
tof b17 b27
tof a4 b27
tof b17 b28
tof a4 b28
tof b9 b28
tof a4 b5
tof b9 b5
tof a17 b21
tof a13 b21
tof b17 b16
tof a4 b20
tof b13 b21
tof a6 b21
tof b26 b16
tof b11 b20
tof b6 a8
tof c31 a8
tof a10 a8
tof a17 a8
tof a13 a8
tof a11 a8
tof b13 b8
tof a6 a8
tof b25 a8
tof b23 a8
tof b1 a8
tof c3 b8
tof c0 b12
tof c3 b12
tof c0 a8
tof b14 a14
tof a9 a14
tof a25 c21
tof a13 b6
tof a11 a14
tof b13 c21
tof c0 b6
tof a6 b6
tof c10 b6
tof a17 c21
tof a17 b6
tof a10 c22
tof b17 c16
tof b23 b14
tof a30 c16
tof b31 c16
tof c31 c22
tof b14 c22
tof c16 c31
tof b14 b29
tof a27 c2
tof c6 b14
tof a30 b17
tof b31 a23
tof a10 c2
tof b17 c2
tof b14 a23
tof a10 a23
tof b17 a23
tof a10 b14
tof b26 b14
tof a11 a10
tof b17 a10
tof a4 c9
tof a6 a13
tof b18 a13
tof b23 a10
tof b19 a9
tof a30 c9
tof b9 c9
tof c10 a13
tof c7 a13
tof b1 a13
tof b31 a13
tof a10 a9
tof a13 a10
tof a13 a25
tof b13 a17
tof b18 a25
tof c5 a24
tof c10 a25
tof c7 a25
tof b1 a25
tof b31 a25
tof a17 c14
tof a24 c14
tof a17 a25
tof a24 a17
tof a6 a17
tof c16 a26
tof b17 a26
tof a24 a26
tof b25 a26
tof b18 a6
tof a30 a11
tof c10 a6
tof c7 a6
tof b1 a2
tof b31 a6
tof a11 a13
tof a11 a2
tof a6 a2
tof a6 a26
tof b25 c16
tof b18 c6
tof b4 c6
tof b23 a27
tof b26 c6
tof a30 a27
tof c10 b17
tof c7 c6
tof c12 c16
tof b1 a11
tof b31 c6
tof a27 c16
tof b17 c16
tof a11 a27
tof b17 c6
tof a24 a3
tof b13 a3
tof a6 a3
tof b4 a3
tof a30 a4
tof c3 a3
tof b9 a4
tof c12 a11
tof c4 a3
tof b1 a3
tof c10 a11
tof b31 a11
tof b17 a3
tof b31 a3
tof a4 b17
tof c10 b17
tof a30 b22
tof b9 b11
tof b22 a4
tof b11 a4
tof b26 b22
tof b11 b22
tof b11 b24
tof b25 a6
tof c11 c0
tof c3 c5
tof b31 a6
tof b13 a24
tof c5 a24
tof c0 b13
tof a6 c0
tof c5 c0
tof c11 b25
tof c10 b18
tof c7 b18
tof b18 b25
tof b4 b18
tof b26 b19
tof a30 b23
tof a29 b23
tof c10 b4
tof c12 b4
tof b31 b23
tof a30 b26
tof b11 b26
tof b9 b11
tof c7 c10
tof c12 c3
tof b1 c3
tof a12 c3
tof c11 c5
tof c3 c5
tof c10 c11
tof c10 c3
tof c7 c15
tof c12 c15
tof b31 a29
tof c8 c10
tof b1 c10
tof c7 c10
tof c12 c10
tof c12 c7
tof b31 c7
tof c19 c12
tof a12 c4
tof c17 c19
tof c13 b31
tof c13 c18
tof c13 c19
tof b30 c17
tof a12 c17
tof c13 c17
tof c13 a12
tof b0 c13
tof b0 a16
tof b0 a7
tof c24 b0
tof b0 c24
tof b30 a7
tof c13 a7
tof c17 a7
tof c17 a12
tof c13 a16
tof c13 b0
tof c13 c24
tof c19 c17
tof b31 c18
tof b31 c19
tof b31 a16
tof c19 a12
tof c17 b30
tof b31 c24
tof b31 c13
tof b31 b0
tof b1 c17
tof c8 b1
tof c17 a12
tof c8 b30
tof b1 a20
tof b1 b2
tof b1 c13
tof c12 b30
tof c7 c13
tof c10 b30
tof c10 c13
tof b30 a7
tof b30 c4
tof b30 a12
tof c10 a20
tof c10 b2
tof c12 c17
tof c10 c8
tof c12 c19
tof c10 b1
tof a29 a1
tof a29 a12
tof a29 c24
tof b9 c7
tof b9 b0
tof b9 b31
tof a29 c18
tof c11 c3
tof c11 c7
tof c5 c3
tof c5 c7
tof c5 c17
tof c11 c13
tof a30 b11
tof b26 b11
tof a30 a0
tof a30 a1
tof b11 c7
tof b11 b0
tof b11 b31
tof a30 c18
tof b11 b9
tof b23 a1
tof b4 c15
tof b23 a12
tof b4 a20
tof b4 b2
tof b4 c13
tof b4 c5
tof b23 a29
tof b23 c24
tof b18 c13
tof b18 c5
tof b25 c13
tof b25 c5
tof a6 c5
tof b18 a16
tof b18 c15
tof c5 b30
tof b18 b2
tof a6 c17
tof c5 c7
tof b25 c11
tof b18 c24
tof b18 c4
tof b18 b4
tof c0 c17
tof c0 b25
tof b13 c0
tof a24 b25
tof a24 c0
tof a24 b30
tof a24 c3
tof b25 b2
tof c0 c13
tof a24 c5
tof c0 c11
tof a4 b22
tof b22 c7
tof b22 b0
tof b22 b31
tof b22 c19
tof b22 b19
tof b22 b26
tof b22 a30
tof b17 c19
tof a11 c19
tof c19 a7
tof a11 c13
tof a11 c12
tof b17 b9
tof a11 c10
tof a11 c8
tof a11 b1
tof a11 b4
tof b17 a30
tof b17 b22
tof b17 b11
tof a27 a11
tof c16 a11
tof c6 a16
tof a11 b30
tof c6 a20
tof a11 b0
tof a11 c19
tof a11 c12
tof a11 c10
tof a11 a6
tof c6 c24
tof c6 c4
tof a27 b4
tof c6 b25
tof a11 c0
tof c6 b18
tof a13 a2
tof a13 a1
tof a13 a7
tof a13 a12
tof a13 c13
tof a13 c19
tof a13 c12
tof a13 c10
tof a13 c24
tof a13 c8
tof a13 b1
tof a13 b4
tof a13 b26
tof a13 a29
tof a13 b23
tof a13 c16
tof a17 b30
tof a17 b2
tof a17 c13
tof a17 c7
tof a17 c5
tof a17 a3
tof a17 c11
tof a17 a6
tof a17 b25
tof a17 c0
tof a17 a26
tof a10 a1
tof a10 a7
tof a10 a12
tof a10 b30
tof a10 a20
tof a10 b2
tof a10 c7
tof a10 c5
tof a10 c19
tof a10 c12
tof a10 c10
tof a10 a3
tof a10 c11
tof a10 a6
tof a10 c24
tof a10 c8
tof a10 b1
tof a10 b25
tof a10 c0
tof a9 b19
tof a10 b26
tof a10 a29
tof a10 b23
tof a10 c16
tof a10 c6
tof a10 a26
tof a10 a13
tof b14 a16
tof c2 a12
tof b14 a20
tof a23 c18
tof b14 b9
tof b14 c24
tof b14 c4
tof a23 b1
tof b14 b25
tof b14 a30
tof c2 b22
tof c2 a29
tof a23 b23
tof b14 b18
tof a23 a11
tof c2 c16
tof b14 c6
tof b29 c2
tof c31 c4
tof c31 c2
tof c22 c4
tof c22 c2
tof c22 b29
tof c31 a0
tof c31 a16
tof c31 c9
tof c2 a12
tof c31 b30
tof c22 a20
tof c31 b2
tof c31 b0
tof c31 b31
tof c31 c5
tof c31 c12
tof c31 c10
tof c4 a3
tof c31 c11
tof c31 a6
tof c22 c24
tof c31 c8
tof b29 b4
tof c22 b25
tof c31 c0
tof b29 b22
tof c2 a29
tof c31 b18
tof c31 a11
tof c2 c16
tof b29 a27
tof c22 c6
tof c31 a26
tof c31 a23
tof c31 a10
tof c31 a9
tof b6 a12
tof b6 c5
tof b6 c19
tof b6 c12
tof b6 c4
tof b6 c16
tof b6 a10
tof a8 a12
tof a8 c5
tof a8 c19
tof a8 c12
tof a8 c4
tof a8 c16
tof a8 a10
tof a8 b6
tof b28 a12
tof b28 c5
tof b28 c19
tof b28 c12
tof b28 c4
tof b28 c16
tof b28 a10
tof b28 b6
tof b28 a8
tof a22 a12
tof a22 c5
tof a22 c19
tof a22 c12
tof a22 c4
tof a22 c16
tof a22 a10
tof a22 b6
tof a22 a8
tof a22 b28
tof a5 b5
tof c23 a12
tof c23 c5
tof c23 c19
tof c23 c12
tof c23 c4
tof c23 c16
tof c23 a10
tof c23 b6
tof c23 a8
tof c23 b28
tof c23 a22
tof b15 a12
tof a19 b30
tof b15 c5
tof b15 c19
tof b15 c12
tof b15 c4
tof b15 c16
tof b15 a10
tof b15 b6
tof b15 a8
tof b15 b28
tof b15 a22
tof b15 c23
tof b10 a12
tof b7 b10
tof a28 a12
tof b10 c5
tof b10 c19
tof b10 c12
tof b10 c4
tof b10 c16
tof b10 a10
tof b10 b6
tof b10 a8
tof b10 b28
tof b10 a22
tof b10 c23
tof b10 b15
T a28
T* b7
T* b27
T b10
T* a18
T* a19
T c1
T* b21
T b15
T* c20
T* c23
T* a15
T* a5
T* a21
T* a22
T* c9
T b5
T* c14
T* a25
T* b28
T* b16
T* b20
T* b8
T* b12
T* c21
T* a14
T* a8
T* c31
T* b11
T* a4
T* b24
T* a24
T* b13
T* a2
T* a9
T* c15
T* b6
T* c3
T a10
T* a23
T* c22
T* b29
T* c2
T* b14
T* a13
T* b17
T* a17
T* a26
T* c6
T* a27
T c16
T* a11
T* b18
T* b23
T* a29
T* b22
T* a30
T* b26
T* b19
T* c0
T* b25
T* b4
T* b1
T* c8
T c4
T* c24
T* a6
T* c11
T* a3
T* c10
T* b9
T c18
T* c12
T c19
T c5
T* b31
T b0
T* c7
T* c13
T* c17
T* b2
T* a20
T* a31
T* b30
T* a12
T* b3
T* a16
T* a7
T* a1
T* a0
tof b29 b7
tof a27 a28
tof a11 a28
tof b18 c22
tof b4 a28
tof b1 b7
tof c8 b27
tof c24 c22
tof a31 b7
tof b30 a28
tof a12 a28
tof a23 a28
tof a23 b7
tof c22 b7
tof c22 b27
tof c1 a19
tof b12 a19
tof a23 b10
tof c22 b10
tof c2 b29
tof b14 a19
tof a11 b10
tof a29 b29
tof b22 b29
tof b4 a27
tof c24 a27
tof b9 a19
tof a31 a27
tof b30 b10
tof a27 b10
tof b29 a18
tof b29 a19
tof a27 a19
tof b13 b15
tof c22 a23
tof c6 b15
tof a27 c1
tof b23 b21
tof b25 b15
tof a31 b15
tof b30 a11
tof a23 c1
tof a11 c1
tof a23 b21
tof b1 b21
tof a11 b15
tof b1 b15
tof b29 a15
tof b17 c23
tof c6 c20
tof a27 c20
tof c0 c23
tof b25 c20
tof b1 c20
tof a6 c23
tof c11 c23
tof c7 c23
tof a31 c20
tof a23 c20
tof a23 a15
tof b5 a5
tof b24 a22
tof a23 a5
tof b14 b29
tof a13 a22
tof a27 a5
tof a11 a5
tof b26 a22
tof c0 a21
tof c8 a22
tof c24 a5
tof a6 a21
tof b9 a21
tof c7 a21
tof b29 a5
tof a30 a5
tof c22 a21
tof b29 a21
tof c22 a22
tof b29 a22
tof a30 a22
tof c21 c14
tof a23 b5
tof c22 b5
tof c2 c9
tof b14 c9
tof c6 c14
tof a27 b5
tof b18 b5
tof b22 c9
tof c0 c9
tof b25 c14
tof b1 c14
tof c24 b5
tof a6 c9
tof c11 c9
tof b9 c9
tof c7 c9
tof a31 c14
tof a11 b5
tof a11 c14
tof a24 b28
tof c22 b28
tof a13 a25
tof c6 b16
tof a27 b16
tof a30 b29
tof b1 a23
tof c8 b28
tof c24 b16
tof c5 b28
tof a31 b16
tof a23 a25
tof b29 a25
tof b29 b28
tof a23 b16
tof b29 b16
tof a8 b12
tof a24 b12
tof a23 b20
tof b29 b20
tof c2 b8
tof b14 b8
tof a13 b20
tof a27 b20
tof a29 b8
tof b22 b8
tof b26 b20
tof c0 b8
tof b4 b20
tof c24 b20
tof a6 b8
tof b9 b8
tof c7 b8
tof a31 b20
tof a24 a8
tof c22 a8
tof b29 c21
tof b14 a8
tof a13 a14
tof c6 c21
tof b22 a8
tof a30 a11
tof b19 a14
tof b25 c21
tof b1 a23
tof c8 a8
tof c24 a27
tof b9 a14
tof c5 a8
tof b30 a8
tof a23 c21
tof a27 c21
tof a11 c21
tof a27 a14
tof a11 a14
tof a23 a8
tof a11 a8
tof c3 c31
tof c2 c31
tof a17 b11
tof a26 a4
tof b22 c31
tof a30 a4
tof c0 a4
tof a6 a4
tof c7 b9
tof b14 c31
tof b9 c31
tof b14 b11
tof b9 b11
tof b9 a4
tof c22 a24
tof b29 b13
tof a13 b24
tof b17 b13
tof c6 b13
tof a27 b13
tof a11 a24
tof b26 b24
tof b19 a24
tof b25 b13
tof b1 b13
tof c8 a24
tof a6 b24
tof c5 a24
tof c7 a23
tof a31 b13
tof b30 a24
tof a30 b24
tof b9 b24
tof a23 a24
tof b9 a24
tof a23 b13
tof a30 b13
tof b9 b13
tof c3 a2
tof b29 a2
tof a13 a9
tof a17 c15
tof a27 a9
tof a11 a23
tof b19 a9
tof c0 c15
tof a6 c15
tof c11 c15
tof b9 a23
tof c7 a2
tof a31 a2
tof a23 a2
tof a23 a9
tof a23 b6
tof b29 b6
tof b17 c3
tof a30 a11
tof c0 b6
tof b1 a11
tof a6 b6
tof c11 b6
tof a31 a10
tof a11 b6
tof c7 b6
tof c7 c3
tof a11 a10
tof a27 b29
tof a11 b29
tof b23 b18
tof a30 a23
tof b25 c6
tof c8 c6
tof b9 a23
tof c18 b18
tof c5 c6
tof c7 a23
tof b2 c6
tof a31 b29
tof c22 a23
tof b30 a23
tof a12 a23
tof b29 c22
tof c6 c22
tof b30 c22
tof b18 b29
tof b30 b29
tof a12 b29
tof c6 c2
tof a27 c2
tof a11 c2
tof b22 c2
tof b26 a13
tof c12 c2
tof a31 c2
tof b30 c2
tof a12 c2
tof b14 c2
tof a30 c2
tof b9 b14
tof a30 a13
tof b9 a13
tof b26 a26
tof b19 b17
tof c0 a26
tof a6 a26
tof b9 a17
tof a30 c6
tof b9 c6
tof b31 c6
tof a31 c6
tof b30 b0
tof a11 c6
tof b0 a27
tof a11 c16
tof b0 c16
tof a30 b18
tof b9 b18
tof b31 b18
tof a31 c24
tof b30 b18
tof b23 b18
tof c24 b23
tof c0 a30
tof a6 a30
tof b9 a30
tof a16 a29
tof b22 a29
tof c7 b22
tof a6 c0
tof c7 b19
tof b9 b26
tof b9 b19
tof a3 b25
tof c18 b25
tof b31 b25
tof b0 b4
tof b2 b25
tof a12 b25
tof c12 c24
tof c5 c8
tof b0 c4
tof c17 c8
tof a31 c24
tof b3 c24
tof a12 c8
tof b30 c4
tof a12 c4
tof b30 c24
tof b9 a6
tof c18 a3
tof b31 a3
tof c13 c11
tof c17 a3
tof a12 a3
tof b31 c18
tof b0 c10
tof b30 c18
tof a12 c18
tof a16 c12
tof c18 c10
tof c7 b9
tof c12 c18
tof c7 c18
tof b0 c19
tof c7 c12
tof c17 c5
tof b30 c12
tof b30 c19
tof b30 c5
tof a12 b31
tof b0 b31
tof c7 b31
tof c17 c7
tof a31 a20
tof a16 b3
tof a16 a0
tof b30 a12
tof b2 a20
tof c17 a0
tof c17 a1
tof c17 a16
tof c17 b3
tof c7 a20
tof b0 a20
tof b0 a31
tof b31 a20
tof b31 a31
tof c7 a0
tof c7 a1
tof c7 a16
tof c7 b3
tof c7 c17
tof c7 b2
tof c12 c5
tof c12 b31
tof c12 a12
tof c12 b30
tof c18 a1
tof b9 a16
tof b9 b3
tof b9 c5
tof b9 a12
tof a6 a16
tof c8 c5
tof c8 b2
tof c8 c7
tof c8 a20
tof b25 a3
tof b19 a6
tof b26 b19
tof c0 b25
tof a6 a16
tof b26 b3
tof c0 c18
tof c0 c10
tof c0 c13
tof c0 a20
tof c0 a7
tof c0 b2
tof c0 c7
tof c0 c17
tof a30 c18
tof b22 c18
tof b22 c12
tof a29 c12
tof c18 a1
tof a30 b25
tof c12 b1
tof a30 c10
tof b22 b30
tof b22 b9
tof a30 a7
tof a30 c8
tof a30 b2
tof a30 c7
tof a30 c0
tof a30 a20
tof b23 c24
tof b18 c10
tof b18 c24
tof a11 c10
tof a11 c24
tof b18 b25
tof b18 c18
tof a11 b1
tof a11 a20
tof a11 a31
tof a27 b31
tof a27 c16
tof c6 b31
tof b31 a16
tof b31 b3
tof b31 c5
tof b31 c18
tof a27 b4
tof a27 c10
tof a27 c19
tof b31 a12
tof b31 b30
tof a27 b0
tof b31 a0
tof c6 c24
tof c6 b18
tof a27 c4
tof c6 a20
tof c6 a31
tof a13 b3
tof b14 b31
tof c2 b3
tof c2 b31
tof b14 a1
tof c2 b25
tof c2 a16
tof b14 c18
tof a13 a26
tof b14 b30
tof a13 b19
tof a13 b26
tof b14 b9
tof b31 a29
tof c2 a0
tof b14 a7
tof c2 c24
tof b14 b22
tof c2 a31
tof a13 c6
tof c2 b2
tof b29 c24
tof b29 b18
tof c22 b18
tof c22 c2
tof a23 b18
tof a23 c2
tof a23 b29
tof c22 a3
tof c2 b25
tof c24 a16
tof c24 b3
tof c22 c5
tof c22 c18
tof c2 b1
tof b18 b4
tof c22 a12
tof c22 b30
tof c2 c12
tof b18 b23
tof a23 c7
tof a23 c4
tof c2 a31
tof c22 c6
tof c2 b2
tof a23 c8
tof a23 c10
tof a24 a6
tof b24 a6
tof a24 a16
tof b13 c3
tof a24 b17
tof a4 a26
tof b11 a17
tof c31 c3
tof a8 a1
tof c21 c5
tof a8 c18
tof c21 a17
tof c21 b26
tof a8 b9
tof a8 b22
tof b12 a1
tof b12 c18
tof b8 b1
tof b20 b4
tof b12 b9
tof b8 a29
tof b12 b22
tof b12 a8
tof b16 a3
tof b28 a3
tof b28 a1
tof b28 b25
tof b28 a16
tof a25 b3
tof b28 c18
tof b28 a6
tof a25 a26
tof b28 b17
tof a25 b19
tof b28 b9
tof b28 b22
tof b28 a24
tof b28 a8
tof b28 c22
tof b28 c8
tof b28 c7
tof c9 c11
tof b5 b25
tof c14 c5
tof b5 c18
tof c14 a17
tof c14 b26
tof c14 c21
tof a5 b25
tof a5 c18
tof a21 a12
tof a5 b5
tof a15 b1
tof c20 b23
tof b21 b4
tof c1 b22
tof a19 b22
tof b10 a19
tof b22 a3
tof b22 a1
tof b22 b25
tof b22 a16
tof a18 b3
tof b22 c18
tof b22 a6
tof b22 b17
tof b22 b9
tof b22 a24
tof b22 a8
tof b22 c22
tof b22 c8
tof b22 c7
tof b10 a27
tof b10 c6
tof b22 b28
tof b10 c19
tof b10 c10
tof b10 c4
tof b10 c16
tof b10 a10
tof b10 a9
tof b10 a2
tof b10 a14
tof b10 c14
tof b10 a5
tof b10 b15
tof b10 c1
tof b7 b10
tof a28 b10
tof b27 c5
tof b10 a27
tof b10 c6
tof b10 c19
tof b10 c10
tof b10 c4
tof b10 c16
tof b10 a10
tof b10 a9
tof b10 a2
tof b10 a14
tof b10 c14
tof b10 a5
tof b10 b15
tof b10 a19
tof b10 c1
tof b7 b18
T* b7
T a28
T* b18
T* b10
T* b23
T* c1
T* a19
T* b15
T* c23
T* a22
T* a5
T* b22
T c14
T a14
T* b12
T a2
T a9
T* c15
T* b6
T* a10
T* c16
T* c4
T c10
T b29
T* c2
T* c19
T b28
T c6
T* a27
T* a31
T* b14
T* a30
T* b2
T* c0
T* c7
T* a13
T* c17
T* c13
T* c8
T* c22
T* a20
T* b0
T* a11
T* a23
T* a21
T* c20
T* b21
T* b8
T* a8
T* c21
T* a25
T* a24
T* b13
T* c31
T* b11
T* a4
T* b24
T* c9
T* b16
T* b20
T* a15
T* b5
T* b27
T* a18
T* c24
T* b31
T* a7
T* a0
T* a29
T* b9
T* b26
T* b19
T* b17
T* c3
T* c12
T* b30
T* a12
T* a17
T* a26
T* a6
T* b4
T* b1
T* c18
T* c5
T* b3
T* a16
T* b25
T* a1
T* c11
T* a3
tof b10 b18
tof c1 a28
tof a19 a28
tof b0 b2
tof a21 b18
tof b21 b18
tof b8 a28
tof a29 a8
tof b9 b18
tof c12 a28
tof a12 b18
tof a31 b7
tof b2 b7
tof b2 a28
tof a8 a28
tof a31 b18
tof b2 b18
tof a8 b18
tof c16 b10
tof a31 a19
tof b0 a19
tof a21 b10
tof c20 b23
tof b8 c1
tof a8 b23
tof c21 b15
tof a25 b15
tof a24 b15
tof b20 b10
tof a29 b15
tof b9 a19
tof b26 b15
tof b19 b15
tof c12 a11
tof a12 b10
tof b4 b10
tof c1 b10
tof a19 b10
tof a11 b10
tof c1 b23
tof a11 b23
tof a19 c1
tof b15 c1
tof a31 a19
tof a30 a19
tof c0 a19
tof a13 a19
tof c17 a19
tof b0 a19
tof b8 b15
tof c21 c23
tof a25 c23
tof a24 a22
tof b24 c23
tof b5 a22
tof b26 c23
tof b19 b15
tof b17 c23
tof a26 a22
tof a6 b15
tof c18 a22
tof b9 a19
tof c23 b15
tof a22 c23
tof b9 c23
tof a31 a5
tof b0 a5
tof a11 b22
tof a23 b22
tof b8 b22
tof a25 b22
tof a29 b22
tof b9 c21
tof b26 c21
tof b19 a22
tof b30 b22
tof a6 a22
tof c18 a5
tof a14 a22
tof c21 a22
tof a14 a5
tof c21 a5
tof a14 b22
tof b2 a31
tof c21 b12
tof a31 c14
tof a9 a14
tof a9 b12
tof a31 b12
tof a31 a9
tof b2 a9
tof c7 a9
tof a23 c15
tof a8 c15
tof c21 c15
tof a25 a9
tof b11 c15
tof a4 a9
tof a29 c15
tof b26 c15
tof b30 c15
tof a17 c15
tof a26 a9
tof b0 a2
tof b0 a9
tof a31 a10
tof a30 a10
tof b2 a10
tof c0 a10
tof c7 c16
tof c17 a10
tof c13 a10
tof b0 b6
tof b21 c16
tof b8 a11
tof a8 a11
tof c21 a11
tof a25 a11
tof a24 b6
tof a4 c16
tof b24 b6
tof c9 a10
tof b20 c16
tof b19 b6
tof a26 c16
tof a6 b6
tof b4 c16
tof c11 a10
tof a11 b6
tof a11 c16
tof a31 c10
tof b2 c10
tof c7 c10
tof a11 c10
tof a21 c4
tof a25 b29
tof a4 c10
tof b5 b29
tof b27 c4
tof a18 b29
tof b9 c4
tof b26 c4
tof a12 c4
tof a26 c10
tof c18 b29
tof c5 c4
tof b3 b29
tof c21 c4
tof b0 c10
tof b0 b29
tof c21 b29
tof b14 c19
tof a30 c19
tof b2 a31
tof c0 c19
tof c17 c19
tof b0 a31
tof a11 c2
tof a23 c7
tof a8 c7
tof c21 c7
tof a25 c7
tof a4 c7
tof a18 c2
tof a29 c7
tof b30 c7
tof a26 c7
tof b3 c2
tof a31 c2
tof c7 c2
tof c7 c19
tof a31 b28
tof c7 b28
tof c0 a30
tof c17 a30
tof c13 a30
tof b0 a30
tof a31 c6
tof c7 c6
tof c7 a27
tof a30 a31
tof c13 a30
tof b0 c7
tof a23 c7
tof a21 c0
tof a8 c7
tof a25 b2
tof a24 b2
tof b24 b2
tof b27 b14
tof b31 b14
tof a29 c7
tof b9 c0
tof b26 b14
tof b19 b2
tof b30 c7
tof a12 c0
tof a6 b2
tof c5 b14
tof a30 b14
tof c7 b14
tof c21 b14
tof c0 a30
tof c7 a30
tof c7 b2
tof c21 b2
tof c17 c7
tof c8 c7
tof b0 c7
tof c20 a13
tof b8 a13
tof a8 a13
tof a25 c21
tof a24 c21
tof b24 c21
tof c9 c7
tof b19 c21
tof a6 c21
tof c11 c13
tof a3 c7
tof c13 c0
tof c21 c0
tof c21 c7
tof c13 a13
tof c21 a13
tof b21 c17
tof a25 c13
tof a24 c13
tof b24 c13
tof b16 c8
tof b20 a8
tof b5 a8
tof b27 c13
tof b26 c13
tof b19 c13
tof a6 c13
tof b4 c17
tof b1 a8
tof c18 a8
tof c5 c13
tof a3 c8
tof c8 c17
tof a8 c8
tof a23 c22
tof a21 a20
tof c20 b0
tof b8 b0
tof a24 c22
tof a4 c22
tof b24 c22
tof b20 a8
tof b5 a8
tof a29 c22
tof b9 a20
tof b19 c22
tof b30 c22
tof a12 a20
tof a26 c22
tof a6 c22
tof b1 a8
tof c18 a8
tof c11 b0
tof a8 c22
tof c21 c22
tof c21 a20
tof a8 b0
tof c21 b0
tof a8 a11
tof a24 c21
tof b24 c21
tof b20 b16
tof a18 a21
tof a7 a21
tof a29 a23
tof b9 a21
tof b19 c21
tof b30 a23
tof a12 a21
tof a6 c21
tof b1 b16
tof b3 a21
tof a3 a11
tof c21 a11
tof b16 a11
tof b16 a23
tof c21 a21
tof b20 b21
tof c12 c20
tof b30 b21
tof b4 b21
tof b1 b21
tof a29 b21
tof a29 b8
tof b11 a25
tof b24 c21
tof b16 c21
tof b26 a25
tof b19 a24
tof a17 a25
tof a6 a24
tof c18 b1
tof c21 a8
tof a24 a8
tof a24 c21
tof b1 c21
tof a24 a25
tof b16 b24
tof b5 b24
tof b17 b13
tof c3 b13
tof a26 c31
tof a6 c31
tof b1 b24
tof c18 b24
tof b3 b24
tof b24 a24
tof b24 c31
tof a15 b11
tof b5 b11
tof a17 b11
tof a26 a4
tof c5 b11
tof b3 b11
tof b24 b11
tof b24 a4
tof a6 b24
tof a6 b5
tof b1 b16
tof c18 b16
tof b3 b5
tof b5 b16
tof b5 b20
tof b31 b27
tof a0 b27
tof a29 b27
tof b19 b5
tof b30 b27
tof a6 b5
tof b1 a15
tof c5 b26
tof b26 a15
tof c18 a15
tof c18 b5
tof b26 b27
tof a0 b31
tof a29 b31
tof b26 b31
tof b19 c24
tof b30 b31
tof a17 b31
tof a26 a18
tof c5 b31
tof b3 a18
tof a16 c24
tof a1 c24
tof b9 a7
tof c3 b17
tof c12 b17
tof b30 a0
tof a17 b17
tof a26 a7
tof a6 a0
tof b4 a7
tof b1 a29
tof c18 b17
tof b25 b17
tof b19 a7
tof a29 a0
tof b19 a0
tof b17 a29
tof c3 b26
tof a17 b26
tof b4 b19
tof c5 b26
tof a1 b26
tof b19 b9
tof a6 b9
tof a6 b26
tof b17 b19
tof a6 b19
tof b30 c12
tof b1 b17
tof c5 a17
tof b3 a17
tof c11 b4
tof a6 a26
tof b3 c5
tof b25 c5
tof c18 b1
tof c11 b1
tof c11 c18
tof c11 c5
tof c11 a1
tof a16 b3
tof b25 a16
tof a1 a16
tof c11 a3
tof b3 a16
tof c5 a16
tof c5 b25
tof c18 a16
tof c18 b25
tof b1 b25
tof b1 c5
tof b1 c18
tof a6 b25
tof a26 a6
tof b25 a16
tof b4 a1
tof b4 b1
tof a17 c5
tof b30 c5
tof a17 a16
tof b30 b25
tof a17 a1
tof b30 a3
tof b30 b4
tof c12 c5
tof c3 a1
tof c3 c5
tof b17 a1
tof b17 c5
tof c3 a16
tof b17 b25
tof c3 a6
tof b17 b1
tof c3 a17
tof b19 a1
tof b19 b4
tof b26 a1
tof b9 b19
tof b26 a16
tof b4 b25
tof b19 b1
tof b4 c11
tof b4 a3
tof b19 a12
tof b19 b17
tof a29 c11
tof a29 a3
tof a29 b4
tof a29 a12
tof a29 b19
tof a18 a7
tof b27 b31
tof b5 a1
tof a15 b27
tof a15 a1
tof b5 a7
tof a1 b25
tof b5 a0
tof b5 c11
tof b5 a3
tof b5 b4
tof a15 c18
tof b5 b9
tof b5 c24
tof a1 a17
tof a15 a16
tof b20 b9
tof b16 b4
tof b16 b20
tof c9 b4
tof b9 a7
tof b16 a3
tof b9 b19
tof b9 b1
tof b24 a0
tof b24 a17
tof a4 a0
tof b11 a17
tof b11 b25
tof a17 b26
tof a17 b31
tof b24 c11
tof b24 a26
tof b11 c18
tof b24 c24
tof b24 c5
tof b24 b3
tof b24 b16
tof a17 c3
tof a17 a29
tof b13 b24
tof b13 c31
tof a24 b24
tof a24 c31
tof a24 a7
tof a24 b25
tof a24 a0
tof c31 a18
tof b13 b31
tof a24 a26
tof a24 c24
tof a24 c5
tof a24 a4
tof a24 b3
tof a24 a1
tof b24 a6
tof b13 a17
tof a25 c18
tof a25 a29
tof a25 b11
tof c21 c18
tof c21 a29
tof c21 a24
tof a8 a29
tof a8 b11
tof a8 c21
tof a8 a7
tof a25 b25
tof a8 a0
tof c18 b26
tof a25 b31
tof a8 c11
tof c21 a12
tof c21 b17
tof a25 a26
tof a8 c9
tof b11 b27
tof a24 c24
tof a24 b3
tof a8 a1
tof b11 a16
tof a8 b20
tof a25 b16
tof a25 c3
tof a24 b5
tof b11 a15
tof c21 b9
tof a25 a17
tof b8 c12
tof b21 c12
tof b21 a0
tof b8 a3
tof b21 b4
tof b8 b30
tof b21 b27
tof b8 a29
tof a21 a7
tof a21 a18
tof a20 a7
tof c22 a23
tof c17 c8
tof c17 a23
tof c17 a3
tof c17 b4
tof c17 a11
tof c17 b1
tof c17 a8
tof c17 c9
tof a13 b0
tof c7 c9
tof c0 a13
tof c0 c7
tof c9 a7
tof c9 a23
tof c9 a0
tof c9 a3
tof c7 b4
tof c9 c12
tof c9 a11
tof c9 c8
tof c9 b27
tof c0 c13
tof c9 a16
tof c9 b20
tof c0 b16
tof c9 b9
tof c9 b21
tof c9 c21
tof c9 b1
tof c9 a8
tof c9 b19
tof b2 a7
tof a30 a18
tof b14 b31
tof a30 b4
tof b2 a20
tof b14 b27
tof a30 a21
tof a30 b16
tof a30 a13
tof a30 c7
tof a30 c0
tof a30 c13
tof a31 b0
tof c16 a7
tof c16 b4
tof c16 c12
tof c16 a16
tof c16 b20
tof c16 b9
tof c16 b21
tof c16 c21
tof c16 b19
tof c16 c9
tof c16 c17
tof a9 a7
tof a9 a0
tof a9 a18
tof a9 b31
tof a9 a3
tof a9 b4
tof a9 a20
tof a9 c22
tof a9 a11
tof a9 a21
tof a9 b14
tof a9 b16
tof a9 b1
tof a9 a8
tof a9 a13
tof a9 c17
tof a9 c0
tof a9 a27
tof a9 c13
tof a9 c6
tof a9 b28
tof a9 c8
tof a9 c16
tof a9 a30
tof a9 c19
tof a9 c2
tof a9 c10
tof a9 b2
tof a14 b12
tof a14 a7
tof a14 a0
tof a14 a18
tof a14 b31
tof a14 a3
tof a14 b4
tof a14 a20
tof a14 c22
tof a14 a11
tof a14 a21
tof a14 b14
tof a14 b16
tof a14 b1
tof a14 a8
tof a14 a13
tof a14 c17
tof a14 c0
tof a14 a27
tof a14 c13
tof a14 c6
tof a14 b28
tof a14 c8
tof a14 c16
tof a14 a30
tof a14 c19
tof a14 c2
tof a14 c10
tof a14 b2
tof a14 a9
tof a22 b22
tof a22 a5
tof a22 a7
tof a22 a0
tof a22 a18
tof a22 b31
tof a22 a3
tof a22 b4
tof a22 a20
tof a22 c22
tof a22 a11
tof a22 a21
tof a22 b14
tof a22 b16
tof a22 b1
tof a22 a8
tof a22 a13
tof a22 c17
tof a22 c0
tof a22 a27
tof a22 c13
tof a22 c6
tof a22 b28
tof a22 c8
tof a22 c16
tof a22 a30
tof a22 c19
tof a22 c2
tof a22 c10
tof a22 b2
tof a22 a9
tof a22 a14
tof a22 b12
tof c23 a13
tof b15 a13
tof b15 c23
tof a19 a13
tof c23 a7
tof c23 a0
tof c23 a18
tof c23 b31
tof c23 a3
tof c23 b4
tof a19 b0
tof c23 a20
tof c23 c22
tof c23 a11
tof c23 a21
tof c23 b14
tof c23 b16
tof c23 b1
tof c23 a8
tof c23 c17
tof c23 c0
tof c23 a27
tof c23 c13
tof c23 c6
tof c23 b28
tof c23 c8
tof c23 c16
tof c23 a30
tof c23 c19
tof c23 c2
tof c23 c10
tof c23 b2
tof c23 a9
tof c23 a14
tof c23 b12
tof c23 a22
tof c23 b22
tof c23 a5
tof c1 a13
tof b23 a13
tof c1 a7
tof c1 a0
tof c1 a18
tof c1 b31
tof c1 a3
tof c1 b4
tof b23 b0
tof c1 a20
tof c1 c22
tof c1 a11
tof c1 a21
tof c1 b14
tof c1 b16
tof a13 b8
tof a13 c20
tof c1 b1
tof c1 a8
tof c1 c17
tof c1 c0
tof c1 a27
tof c1 c13
tof c1 c8
tof c1 c16
tof b23 a19
tof c1 a30
tof c1 c19
tof c1 b29
tof c1 b2
tof c1 a9
tof c1 b6
tof c1 a2
tof c1 b12
tof c1 c14
tof c1 a5
tof b18 b10
tof a28 c1
tof a28 b18
tof b7 b10
tof b7 c1
tof b10 a7
tof b10 b4
tof b10 c12
tof b10 a16
tof b10 b20
tof b10 b9
tof b10 b21
tof b10 c21
tof b10 b19
tof b10 c9
tof b10 c17
tof c1 c6
tof c1 b28
tof b10 c16
tof c1 c2
tof c1 b29
tof c1 c10
tof c1 b6
tof c1 a14
tof c1 a2
tof c1 a22
tof c1 c14
tof c1 b22
tof c1 c23
tof c1 b15
T* b7
T a28
T b18
T* b23
T c1
T b15
T c23
T* a5
T b22
T* c14
T* a22
T* b12
T* a2
T* a14
T* c15
T b6
T* a9
T* b2
T* a10
T* b10
T* c4
T* c10
T* b29
T c2
T* c19
T* a30
T* a19
T* c16
T* c8
T* b28
T* c6
T* c13
T* a27
T* a26
T* a4
T* c0
T* c7
T* c17
T* c9
T* a13
T* b19
T* b17
T* c18
T* b25
T* c5
T* b13
T* a17
T* c31
T* a25
T* a8
T* b1
T* c21
T* b11
T* a24
T* c20
T* b21
T* b8
T* b9
T* a15
T* b5
T* a29
T* b24
T* c3
T* a6
T* b16
T* b20
T* a16
T* a1
T* b3
T* b14
T* a21
T* c24
T* b27
T* a31
T* a11
T* c22
T* a20
T* b0
T* c12
T* b30
T* a12
T* b4
T* a3
T* c11
T* b31
T* a18
T* b26
T* a0
T* a23
T* a7
tof a4 a9
tof a13 b18
tof b19 b18
tof c20 a28
tof b21 a28
tof b8 b18
tof b20 b2
tof b0 a28
tof c12 a28
tof b30 b18
tof c11 a9
tof a7 b2
tof b2 b7
tof a9 a28
tof b2 a28
tof a9 b18
tof a26 c1
tof c0 b23
tof b19 a13
tof b17 a9
tof c18 b15
tof a17 c1
tof c20 b23
tof b21 b23
tof b8 a13
tof b9 a9
tof a15 b15
tof b5 b15
tof c3 c1
tof a6 c1
tof b16 b23
tof b20 b23
tof a11 c1
tof a20 b23
tof c12 b23
tof b30 a13
tof a3 c1
tof c11 a25
tof a7 b23
tof a9 b23
tof a13 b23
tof a25 b23
tof a13 c1
tof a25 c1
tof a9 b15
tof a13 b15
tof a19 a5
tof c0 c23
tof c17 c23
tof b17 a9
tof a25 c23
tof b1 c23
tof c21 a5
tof b11 c23
tof a24 c23
tof c20 a5
tof b21 a5
tof b9 a9
tof b16 c23
tof b20 c23
tof a16 c23
tof a1 c23
tof a11 b22
tof c12 a5
tof b30 b22
tof a3 b22
tof a9 c23
tof c9 c23
tof a9 a5
tof c9 a5
tof a9 b22
tof a26 b12
tof c17 a22
tof c9 a22
tof b17 a13
tof c18 c14
tof b25 c14
tof b13 b12
tof a17 b12
tof a25 a13
tof b1 a22
tof b11 a22
tof b9 a13
tof a15 a13
tof b5 c14
tof b24 b12
tof c3 b12
tof a6 b12
tof b16 c0
tof b20 c0
tof a16 a22
tof a7 b2
tof b2 c14
tof c0 c14
tof a13 c14
tof c0 a22
tof a13 a22
tof b2 b12
tof c0 b12
tof a13 a14
tof c31 a26
tof a25 a2
tof a8 c15
tof b21 a2
tof a21 a14
tof a31 a2
tof c22 c15
tof b4 a2
tof a18 a14
tof a23 c15
tof a26 a2
tof a26 a14
tof a10 b2
tof a13 a26
tof b17 a26
tof a17 a26
tof c31 a26
tof b9 a26
tof a15 a26
tof c3 a26
tof a6 a26
tof b20 b2
tof a31 b21
tof a11 a26
tof b30 a26
tof b4 b21
tof a3 a26
tof a9 b6
tof b21 b6
tof a26 a9
tof a26 b2
tof b21 b2
tof c17 a26
tof c9 c4
tof a13 a10
tof b17 a10
tof a17 a10
tof c31 a10
tof a25 a26
tof a8 c4
tof b1 c4
tof b11 c4
tof a24 c4
tof b9 a10
tof a15 a10
tof c3 a10
tof a6 a10
tof a16 c4
tof a1 c4
tof a21 a10
tof a11 b21
tof c22 c4
tof a20 c4
tof b30 b21
tof a3 b21
tof a18 a10
tof a23 c4
tof a7 c4
tof c0 a10
tof b21 a10
tof b20 a10
tof a26 b10
tof c0 b10
tof b21 b10
tof a26 c4
tof c0 c4
tof b20 c4
tof a26 c2
tof c0 c10
tof c9 c10
tof c31 b29
tof a25 c17
tof b1 c10
tof b11 c10
tof a24 c10
tof a6 b29
tof a16 c10
tof a1 c10
tof b14 b29
tof a21 b29
tof a11 c17
tof b30 c17
tof a3 c17
tof b31 b29
tof a18 b29
tof c17 c10
tof c17 c2
tof a26 c19
tof c17 c19
tof a8 c19
tof c20 a19
tof b21 a19
tof b20 c19
tof c24 c19
tof a31 a19
tof a11 a19
tof c22 c19
tof a20 a25
tof c12 a19
tof b30 a19
tof b4 a19
tof a3 a19
tof c11 a30
tof b26 c19
tof a23 c19
tof a7 a25
tof c0 c19
tof c0 a30
tof a25 a30
tof c0 a19
tof a25 a19
tof a26 b28
tof a4 b28
tof c0 c8
tof c9 c8
tof a25 c8
tof b1 c8
tof b11 c8
tof a24 c8
tof c20 c16
tof a16 c8
tof a1 c8
tof b27 b28
tof a11 c8
tof a20 c8
tof c12 c16
tof b30 c8
tof a3 c8
tof a0 b28
tof a7 c8
tof c17 c8
tof c17 b28
tof a26 a27
tof c17 a27
tof b20 a8
tof b14 c13
tof c22 a8
tof a20 a8
tof b31 c13
tof a23 a8
tof a7 a8
tof a8 c6
tof a8 a27
tof c9 c0
tof a13 c17
tof b17 c17
tof a17 c17
tof c31 c17
tof a25 c17
tof b1 c0
tof b11 c0
tof a24 c0
tof b21 c17
tof b9 c17
tof a15 c17
tof c3 c17
tof a6 c17
tof a16 c0
tof a1 c0
tof a21 c17
tof b27 a4
tof a20 c17
tof b30 a11
tof a3 a11
tof c11 a4
tof a18 c17
tof a0 a4
tof a7 c17
tof c0 a26
tof a11 a4
tof c17 c0
tof a11 c0
tof b17 a13
tof a17 a13
tof c31 a13
tof a8 c17
tof b1 c17
tof b11 a25
tof a24 a25
tof b21 a13
tof b9 a13
tof a15 a13
tof c3 a13
tof a6 a13
tof a16 c9
tof a1 a25
tof a21 a13
tof a11 c9
tof c22 c7
tof a20 a13
tof a18 a13
tof a0 b27
tof a23 c7
tof a7 a13
tof c17 c7
tof c9 c7
tof a13 c7
tof c9 c17
tof a25 c17
tof c11 c17
tof a13 c9
tof a25 c9
tof b27 c9
tof a25 a13
tof b11 a13
tof a24 b13
tof b21 c31
tof b9 b17
tof a15 b19
tof a6 c31
tof a1 a13
tof b14 c31
tof a21 c31
tof a11 a13
tof a12 b19
tof b31 c31
tof a18 c31
tof c31 a13
tof b17 b19
tof b13 b17
tof c31 b17
tof a17 b25
tof c31 c5
tof a24 b25
tof a15 b25
tof b5 c18
tof b24 c5
tof c3 b25
tof a6 b25
tof a12 b8
tof b8 c18
tof b13 b25
tof b8 b25
tof b13 c5
tof a8 c31
tof c21 c31
tof b11 c31
tof b8 b13
tof b9 a17
tof a15 b13
tof b5 b13
tof c3 a24
tof b20 c31
tof a16 c31
tof a1 c31
tof b14 a17
tof a20 c31
tof c11 c31
tof b31 a17
tof a7 c31
tof a24 b13
tof a24 a17
tof a11 a17
tof a11 c31
tof c21 b1
tof a24 b11
tof b21 a25
tof c3 b11
tof b20 b1
tof a16 b1
tof a1 b11
tof b3 b1
tof c24 a25
tof b27 b1
tof a11 b11
tof a20 b11
tof a3 b30
tof c11 a8
tof b26 a25
tof a7 b11
tof b11 a25
tof b30 a8
tof b11 b1
tof b30 b1
tof b21 a24
tof b9 b8
tof a15 b8
tof b5 b8
tof b24 b8
tof c3 b11
tof b16 a24
tof b20 b11
tof a16 c21
tof b14 a24
tof c24 a24
tof b30 b11
tof c11 b8
tof b31 a24
tof b26 a24
tof b11 c21
tof a24 c21
tof a24 b11
tof b8 a24
tof a15 c20
tof b24 c20
tof c3 b8
tof b16 b8
tof b14 b8
tof c24 b8
tof a31 c20
tof a11 c20
tof b0 c20
tof c12 c20
tof a12 c20
tof b4 c20
tof c11 c20
tof b31 b8
tof b26 b8
tof a0 b27
tof b21 c20
tof b8 b21
tof b27 b8
tof b24 a15
tof c3 b5
tof b16 b5
tof b14 b9
tof c24 b5
tof b27 b5
tof c11 a15
tof b31 b9
tof b26 b5
tof a11 b9
tof a11 b5
tof a6 a29
tof c24 b16
tof b27 b16
tof a31 a29
tof a11 b24
tof b0 a29
tof c11 b24
tof b31 b14
tof b26 b16
tof a0 a29
tof b16 a29
tof b14 a29
tof b14 b24
tof b16 c3
tof b14 c3
tof a20 b20
tof b30 b20
tof c11 c22
tof a23 c22
tof a7 b20
tof b16 a6
tof b14 a6
tof a11 b16
tof c22 b16
tof b14 b20
tof c22 b20
tof c24 b14
tof b27 b14
tof a11 b14
tof c22 b14
tof b14 a16
tof b14 a1
tof c22 b14
tof a20 a11
tof b30 a11
tof c11 b14
tof a18 a21
tof a7 a11
tof c24 b14
tof b27 b14
tof b27 a21
tof a11 a21
tof b27 c24
tof a11 c24
tof b26 c24
tof a20 a31
tof c12 a31
tof b30 a31
tof b4 a31
tof c11 c22
tof a7 a11
tof a31 b27
tof a11 b27
tof a11 a31
tof c22 a31
tof c12 b0
tof b30 a20
tof a12 b0
tof b4 b0
tof c11 a20
tof b31 a20
tof b31 a12
tof a23 a3
tof b30 c12
tof a3 b30
tof c11 b30
tof c11 a12
tof a3 b4
tof a7 a3
tof a7 b31
tof a7 a18
tof b31 b26
tof b31 a7
tof c11 a7
tof b30 b4
tof c12 b4
tof b30 a3
tof a12 a7
tof a20 b31
tof c22 b31
tof b31 a3
tof a20 b26
tof c22 a23
tof c22 a18
tof a20 a12
tof c22 b30
tof a11 a3
tof a31 a3
tof b27 a3
tof b27 a31
tof a31 a0
tof b27 b4
tof a11 a18
tof b27 c12
tof b27 b0
tof a11 a20
tof c24 b26
tof a21 a18
tof b14 b26
tof b14 a18
tof b14 a0
tof b14 a23
tof a21 b31
tof b14 a31
tof b14 a20
tof b14 c11
tof b3 a18
tof b3 a20
tof b20 a0
tof b16 b20
tof a6 b26
tof b16 a16
tof b16 a18
tof b16 a31
tof b16 a1
tof b20 b3
tof b16 c22
tof a6 b14
tof c3 a6
tof b24 c3
tof b5 c3
tof b5 c11
tof a15 c3
tof a15 b5
tof b9 b5
tof b9 a23
tof a15 a7
tof a15 a12
tof a15 b0
tof b5 a31
tof b5 b3
tof b9 a6
tof b9 b24
tof b8 b0
tof b8 c11
tof b8 b5
tof b21 b0
tof b21 b8
tof c20 b0
tof c20 c11
tof b0 a29
tof b8 b4
tof b21 a18
tof c20 a7
tof c20 a12
tof b8 c12
tof b5 a31
tof b5 b3
tof b8 c22
tof b8 b14
tof b5 c3
tof b8 b27
tof b8 b20
tof b8 a21
tof b8 b16
tof b8 b31
tof b8 c24
tof a24 b3
tof a24 b21
tof b11 b3
tof b11 b20
tof c21 b11
tof c21 a24
tof b21 a29
tof b20 a16
tof a24 a18
tof a24 a31
tof b21 a20
tof c21 b14
tof b21 a6
tof a24 b24
tof c21 b16
tof b21 b9
tof c21 c24
tof b1 a18
tof a8 b1
tof a8 c21
tof a25 c21
tof a25 a29
tof c21 b26
tof c21 a16
tof a8 a12
tof a8 a31
tof c21 a1
tof b1 a20
tof a25 c22
tof a8 b14
tof a8 b24
tof a8 a0
tof a8 a21
tof a8 b16
tof c21 b9
tof a8 a24
tof c21 c24
tof a8 a11
tof c31 b24
tof c31 b9
tof c31 a24
tof a17 a6
tof a17 b9
tof a17 a24
tof b13 a6
tof b13 b24
tof b13 a24
tof b9 a29
tof c31 b26
tof a17 a23
tof c31 a16
tof a17 a7
tof c31 a31
tof c31 a1
tof c31 a20
tof a24 c22
tof c31 b14
tof b13 c3
tof a17 c11
tof a24 a15
tof a17 b27
tof a24 c20
tof c31 b1
tof c31 b11
tof c31 a0
tof c31 b16
tof c31 c21
tof c5 a29
tof b25 a29
tof c18 a29
tof c18 b25
tof b25 b26
tof c5 a23
tof b25 b14
tof c18 a6
tof c5 c11
tof c18 b5
tof c18 b13
tof b17 c20
tof b19 c20
tof a13 c20
tof a13 b17
tof b17 a29
tof b17 b26
tof a13 a16
tof a13 a7
tof c20 a12
tof a13 a31
tof a13 a1
tof b17 b14
tof b17 a6
tof b17 c3
tof a13 b24
tof c20 c11
tof b19 b5
tof b17 a15
tof a13 b27
tof a13 b1
tof a13 b11
tof a13 a0
tof b17 b25
tof b17 b13
tof a13 c5
tof b19 c18
tof a13 a17
tof a13 b21
tof a13 c31
tof c9 a29
tof c17 a23
tof c17 a16
tof c9 a18
tof c9 a31
tof c17 a1
tof c9 a20
tof c7 b3
tof c9 b1
tof c7 b20
tof c17 b11
tof c9 a0
tof c17 a21
tof c17 b16
tof c17 c31
tof c17 b31
tof c0 b8
tof c0 c9
tof c0 c17
tof a4 b8
tof a4 c9
tof a26 b8
tof a26 c0
tof a4 a3
tof a26 a29
tof a26 a23
tof c17 a16
tof a26 a18
tof c17 a12
tof c17 b30
tof c9 a31
tof c17 a1
tof a26 a20
tof c0 c22
tof c0 a6
tof c0 c3
tof c0 b24
tof c0 c11
tof c9 a0
tof a26 a21
tof a26 b16
tof c0 b9
tof c0 a24
tof c0 b25
tof c0 b13
tof c0 b17
tof c0 c5
tof c17 a8
tof c17 c24
tof a26 b31
tof c0 c21
tof c17 a11
tof a26 a13
tof a19 a27
tof a19 c6
tof a30 c17
tof a30 b28
tof b2 a10
tof a9 b2
tof a9 a27
tof a9 b28
tof a9 b21
tof a9 c19
tof a9 a26
tof a9 c2
tof a9 c4
tof a9 b10
tof c1 a9
tof b23 b15
tof b23 a9
tof b23 a27
tof b23 b28
tof b23 c19
tof b23 c2
tof b23 c4
tof b23 b10
tof b23 b2
tof b23 b6
tof b23 b22
tof b23 a5
tof b23 c23
tof a28 b23
tof a28 b18
tof b7 b23
tof b7 b18
tof b23 a27
tof b23 b28
tof b23 c19
tof b23 c2
tof b23 c4
tof b23 b10
tof b23 b2
tof b23 b6
tof b23 b22
tof b23 a5
tof b23 c23
tof b23 b15
tof b23 a9
T* b7
T a28
T* b18
T b23
T c1
T* a9
T* b15
T* c23
T a5
T* b22
T* c14
T* a22
T* a30
T* b12
T* a2
T* a14
T* c15
T* c13
T* b6
T* c8
T b2
T b10
T c4
T* c10
T* b29
T* c2
T* a26
T* c0
T c19
T* b21
T* a10
T* a25
T* a4
T b28
T* c17
T* a19
T* c16
T* c6
T a27
T* a13
T* a11
T* c21
T* b31
T* c24
T* c9
T* c31
T* c7
T* b8
T* a8
T* a17
T* b19
T* c18
T* c5
T* b17
T* b13
T* b25
T* a24
T* b9
T* b16
T* a21
T* a0
T* b11
T* b20
T* b1
T* c20
T* b27
T* a15
T* b5
T* c11
T* b24
T* c3
T* a6
T* b14
T* c22
T* b3
T* a20
T* a1
T* a31
T* b0
T* c12
T* b30
T* a12
T* a7
T* a18
T* a16
T* a23
T* b26
T* b4
T* a29
T* a3
tof c1 b23
tof a9 b23
tof a30 b7
tof a26 b7
tof c17 b7
tof a13 b21
tof a11 b23
tof c7 b21
tof a8 b7
tof b19 a17
tof c18 a17
tof c5 a28
tof b17 a28
tof b25 b18
tof a24 b23
tof b9 b23
tof b11 b21
tof b20 b21
tof c20 a17
tof a15 a17
tof b5 a17
tof c11 a28
tof b24 a28
tof c3 b13
tof a6 b13
tof b14 b18
tof c22 b23
tof a31 b7
tof a12 a17
tof a7 a17
tof a3 b7
tof a28 b7
tof b18 b7
tof b13 b7
tof b21 a28
tof a17 a28
tof b13 a28
tof b23 b18
tof a17 b18
tof b13 b18
tof b15 c1
tof a30 b23
tof c17 b23
tof a11 c1
tof c31 c1
tof a8 b23
tof b19 c1
tof c18 c1
tof c5 b23
tof b17 a17
tof b13 c1
tof b25 c1
tof b9 a9
tof a0 c1
tof b5 c1
tof c11 b23
tof b24 a17
tof b14 a24
tof c22 a9
tof c12 b23
tof b26 a1
tof a9 b23
tof a17 b23
tof a9 c1
tof a17 c1
tof a24 c1
tof a24 a9
tof a1 a9
tof a26 a5
tof b21 a5
tof a19 a5
tof c21 a5
tof b31 a5
tof c24 a5
tof c9 a5
tof b19 b15
tof c18 b15
tof c5 b15
tof b17 b15
tof b13 a8
tof b25 b15
tof a24 a5
tof b16 a5
tof a21 a5
tof a0 c31
tof b5 b15
tof c11 b15
tof b24 b15
tof c3 c23
tof c22 a8
tof a1 c31
tof a31 a5
tof c12 b9
tof a3 a5
tof c23 b15
tof c31 b15
tof a8 c23
tof b9 c23
tof c31 a5
tof b9 a5
tof a26 c14
tof a10 c14
tof b8 c14
tof a17 a22
tof b19 a22
tof c18 a22
tof b17 a22
tof b13 a8
tof b25 c14
tof a24 b22
tof b9 a8
tof c20 a22
tof b5 a22
tof b24 a22
tof a6 c14
tof a1 a8
tof a31 c14
tof a12 a22
tof a7 a22
tof a16 a22
tof b26 a22
tof a8 c14
tof a8 a22
tof a26 b12
tof c0 a2
tof a10 a2
tof c17 a30
tof c21 a2
tof b14 a30
tof c22 a2
tof a31 a1
tof c12 a1
tof a3 a1
tof a8 a30
tof a24 a30
tof a1 a30
tof a8 b12
tof a1 b12
tof a8 a2
tof a24 a2
tof b21 a26
tof a13 a14
tof a11 c15
tof c21 c13
tof c9 a14
tof c7 a14
tof a8 a26
tof a17 c15
tof b19 a14
tof c18 a14
tof c5 a26
tof b17 a14
tof b13 a26
tof b25 a26
tof b11 a14
tof b20 a14
tof c20 a14
tof b5 a14
tof c11 a26
tof b24 a14
tof c22 c13
tof a1 a24
tof a31 c13
tof c12 c13
tof a7 a14
tof a3 c13
tof a26 a14
tof a24 a14
tof a26 c15
tof a24 c15
tof a24 c13
tof c0 b6
tof a10 b2
tof a13 c8
tof c21 c8
tof b31 c8
tof c24 c8
tof c9 b2
tof c7 c8
tof a8 b8
tof a17 b2
tof b13 c5
tof b25 c5
tof a24 b2
tof b16 c8
tof a21 c8
tof b11 c8
tof b20 c8
tof c11 c5
tof c22 c8
tof a1 c8
tof a31 b8
tof a12 b2
tof a26 b6
tof b8 b6
tof c5 b6
tof a26 c8
tof c5 c8
tof b8 b2
tof c5 b2
tof a11 c10
tof c9 c0
tof b8 c0
tof a17 b10
tof c5 b10
tof a1 c10
tof a31 c10
tof c12 c10
tof a12 c0
tof a3 c10
tof c0 b10
tof a24 b10
tof a24 c4
tof c0 c10
tof a24 c10
tof a13 b29
tof a11 c2
tof b31 c21
tof c24 c21
tof c31 c21
tof c7 b29
tof b8 c2
tof a8 c21
tof a24 c5
tof b16 c21
tof a21 c21
tof b11 b29
tof b20 b29
tof c22 c21
tof a1 b29
tof a31 a26
tof c12 a26
tof a12 c21
tof a3 a26
tof a26 b29
tof c5 b29
tof a17 c2
tof c5 c2
tof c21 a26
tof a17 a26
tof c16 c0
tof a11 c19
tof c7 b21
tof a8 c19
tof c5 a17
tof b17 c0
tof b13 c0
tof b11 b21
tof b1 b21
tof c20 b21
tof a6 b21
tof b14 c0
tof b3 b21
tof b0 c0
tof a12 b21
tof a7 b21
tof b4 c0
tof a17 c0
tof b25 c0
tof a17 c19
tof a24 c19
tof a17 b21
tof b25 b21
tof a24 b21
tof c16 a25
tof b31 a10
tof c24 a10
tof c31 c21
tof b8 a10
tof a17 a4
tof c5 a4
tof b17 a11
tof b13 a25
tof b25 a25
tof a24 a25
tof b16 a10
tof a21 a10
tof c20 a25
tof c11 a4
tof b24 a4
tof b14 a25
tof a1 c21
tof b0 a25
tof b30 a4
tof a12 a10
tof a16 a10
tof a23 a4
tof b26 a10
tof b4 a25
tof a29 a25
tof c21 a10
tof a11 a25
tof c21 a25
tof a11 a4
tof a8 c17
tof a17 a11
tof a24 b28
tof b9 a19
tof c11 c5
tof b24 c5
tof c22 a19
tof a1 a19
tof c12 a19
tof b30 c5
tof a23 c5
tof a11 b28
tof c5 b28
tof a11 c17
tof b17 c17
tof c5 a19
tof b17 a19
tof a11 a27
tof c21 c16
tof c9 c16
tof c31 c16
tof c7 c16
tof a8 a27
tof c18 c16
tof c5 c16
tof b11 c16
tof b1 c16
tof c11 c16
tof b14 c16
tof b3 c16
tof a1 c16
tof a31 c16
tof b0 c16
tof c12 c16
tof b30 c16
tof a12 c16
tof a23 c16
tof b4 c16
tof a3 c16
tof b17 c16
tof a24 c6
tof b17 a27
tof a24 a27
tof c31 c21
tof c7 c21
tof c5 a13
tof b13 a13
tof b25 c21
tof a24 a11
tof b11 c21
tof b20 a13
tof b1 b8
tof c20 c21
tof c3 a13
tof a6 b8
tof b3 b8
tof a1 c21
tof a31 c21
tof c12 c21
tof a12 c21
tof a7 c21
tof a3 c21
tof c21 a13
tof b17 a13
tof b17 a11
tof b8 c21
tof c7 c31
tof a8 c31
tof c5 c18
tof b17 c18
tof b25 b8
tof a24 c18
tof b9 c18
tof b16 b31
tof a21 b31
tof b11 c31
tof b1 c18
tof c11 c18
tof c22 c18
tof b3 c18
tof a1 c18
tof a31 c31
tof c12 b8
tof b30 c18
tof a7 b8
tof a16 b31
tof a23 c18
tof b26 b31
tof a29 b31
tof a3 c31
tof c24 b31
tof c9 b31
tof c20 b31
tof c31 c24
tof b8 c24
tof c20 c24
tof b8 c9
tof c18 c9
tof c20 c9
tof a17 b8
tof c18 a8
tof a21 c7
tof c20 a24
tof c12 c7
tof a12 b8
tof a7 c31
tof b8 c31
tof a1 c31
tof b8 c7
tof a24 c7
tof a1 c7
tof a8 b8
tof a24 b8
tof b17 b19
tof b13 b19
tof b25 b19
tof b1 b9
tof c20 a17
tof a15 b19
tof b5 b19
tof c22 b9
tof b3 b9
tof a1 b9
tof a12 a17
tof b26 a16
tof b9 a8
tof a16 a8
tof c18 a17
tof b9 a17
tof a16 a17
tof c18 b19
tof b9 b19
tof b13 c5
tof b25 c5
tof a24 b17
tof c20 b17
tof c3 b17
tof b3 c18
tof c12 c18
tof a16 b1
tof b1 c18
tof b27 c18
tof a7 c18
tof b17 c5
tof b1 c5
tof b27 c5
tof b1 b17
tof a7 b17
tof b9 a24
tof c20 a24
tof b27 b1
tof c3 b13
tof b3 a24
tof c12 a24
tof b30 b1
tof a7 a24
tof a16 a24
tof a23 c11
tof b25 b13
tof b1 b13
tof c11 b25
tof b1 a24
tof b1 b16
tof b27 b16
tof b3 b9
tof a1 a21
tof c12 b9
tof b30 b9
tof a7 b5
tof a16 a21
tof c25 a21
tof b16 b9
tof a29 b9
tof b5 b16
tof a29 b16
tof a29 a21
tof c20 a0
tof b27 b11
tof b3 b20
tof b30 b20
tof a16 a0
tof b26 b11
tof b1 a0
tof b5 a0
tof c25 a0
tof b20 b11
tof b1 b11
tof c25 b11
tof b5 b20
tof a29 b20
tof c25 b20
tof b5 b1
tof b24 b1
tof b14 b1
tof a31 c20
tof c12 c20
tof a12 c20
tof a16 b1
tof a3 c20
tof b27 b1
tof c3 b5
tof b14 b24
tof c22 b5
tof a1 b5
tof a31 a15
tof a7 b5
tof a16 b5
tof a3 a15
tof b24 a15
tof b30 a15
tof b30 b5
tof b24 c11
tof c22 c3
tof a7 a1
tof c3 b24
tof a1 b24
tof a1 c3
tof c25 c3
tof a1 a6
tof c25 a6
tof a1 c22
tof a31 b3
tof b30 b3
tof b4 b0
tof c25 b3
tof b0 b14
tof b0 c22
tof a7 c22
tof a7 b3
tof b0 a31
tof c12 a31
tof a12 a31
tof a16 a20
tof b4 a31
tof a3 a31
tof c25 a31
tof a7 a1
tof a7 a31
tof a12 c12
tof b26 c12
tof b4 c12
tof c25 b30
tof a7 b0
tof a7 c12
tof a7 b30
tof a16 a18
tof a23 a12
tof c25 a18
tof a7 a12
tof b4 a12
tof b4 a18
tof a3 b26
tof c25 a16
tof c25 a23
tof c25 b4
tof c25 a29
tof c25 a3
tof b4 a3
tof b26 a3
tof a16 a29
tof a7 a3
tof a7 a23
tof a18 b4
tof a7 c25
tof b30 b26
tof c12 b26
tof b0 b26
tof b0 c12
tof b0 a3
tof b0 a12
tof b30 a16
tof b0 c25
tof b30 a7
tof b0 a18
tof a31 b26
tof a31 c12
tof a31 a18
tof c22 b0
tof b14 c22
tof b14 a3
tof b14 a12
tof b14 a31
tof b14 c25
tof c3 a6
tof c3 a7
tof b24 c3
tof b24 a16
tof c3 a1
tof c3 b3
tof c3 a18
tof b24 b0
tof c3 c22
tof c3 c25
tof c3 a29
tof c11 a6
tof b5 a6
tof b5 a16
tof c11 c25
tof b5 a7
tof b5 b24
tof b27 a7
tof b27 a31
tof c20 a18
tof c20 a31
tof b1 a18
tof b1 a7
tof b27 c12
tof a31 a12
tof a7 a16
tof b1 a15
tof a7 b3
tof b27 b30
tof a7 a6
tof a7 b0
tof b1 c22
tof a7 c11
tof b27 a23
tof b1 b24
tof b1 a29
tof b1 a1
tof a0 a29
tof a21 b20
tof b16 a18
tof b16 b20
tof b9 b20
tof b9 a21
tof b9 b16
tof b9 b4
tof b16 a16
tof b16 a15
tof b20 b11
tof b9 a20
tof b16 a6
tof b16 c22
tof b16 c11
tof b9 b24
tof b16 a0
tof b16 a1
tof b16 b5
tof b16 b1
tof b9 b27
tof b9 a29
tof a24 a6
tof a24 b30
tof b25 a6
tof b13 a24
tof a24 b26
tof b30 c12
tof b30 a12
tof b13 a16
tof b13 a15
tof b30 b11
tof b30 a18
tof b13 b0
tof b30 c22
tof b25 c11
tof b13 a7
tof b30 c3
tof b30 a23
tof b30 a31
tof b30 a21
tof b30 a0
tof b30 a1
tof a24 b5
tof a24 b1
tof b13 b16
tof b17 a15
tof b17 b1
tof c5 b17
tof c5 b13
tof c18 a15
tof c18 b17
tof c18 c5
tof c5 b26
tof c18 c12
tof c18 b4
tof b13 a12
tof c5 a16
tof c18 b3
tof c18 a20
tof b1 c22
tof b13 c25
tof c18 c11
tof b1 a7
tof b1 c3
tof b13 a23
tof c18 b24
tof c18 a0
tof b13 b25
tof c18 b16
tof c5 a24
tof c18 a29
tof c18 b27
tof b13 b14
tof b19 a15
tof a17 c18
tof a8 a15
tof a8 a17
tof a8 b26
tof a8 c12
tof c18 b4
tof c18 a12
tof a8 a18
tof c18 a20
tof b19 a7
tof c18 c3
tof c18 a23
tof c18 a31
tof c18 b24
tof a8 b20
tof a8 a0
tof a8 a24
tof a8 a29
tof a17 b9
tof a8 b17
tof a8 b27
tof a17 c20
tof a17 c5
tof b8 b27
tof c31 b27
tof b27 b4
tof b8 b3
tof c7 b11
tof b27 a18
tof b27 a20
tof b27 b24
tof b8 b20
tof c7 a21
tof c31 a0
tof c31 a29
tof b27 b9
tof b8 b17
tof b8 c5
tof c9 b27
tof b31 b27
tof c24 a6
tof b27 b0
tof c24 b20
tof b27 a21
tof c24 a1
tof c24 c7
tof b27 a29
tof c9 b9
tof c9 b30
tof c9 b8
tof c21 c5
tof c21 b30
tof a11 b30
tof a13 c5
tof c21 b3
tof c21 b11
tof c21 a6
tof c21 b0
tof c21 a0
tof c21 a1
tof c21 b9
tof c21 c24
tof c21 b27
tof a11 b13
tof c21 c9
tof c21 c31
tof c21 b17
tof a11 b31
tof c16 b30
tof c16 c9
tof c16 b17
tof a19 a24
tof c17 c6
tof a19 a13
tof a25 b31
tof a10 b31
tof a4 b17
tof a4 b28
tof c0 b17
tof c0 b31
tof b21 c21
tof c0 a25
tof a26 b4
tof a26 b3
tof a26 b11
tof a26 a20
tof a26 b24
tof a26 b20
tof a26 a21
tof a26 a0
tof a26 c7
tof a26 a29
tof a26 b9
tof a26 c21
tof a26 a25
tof a26 a13
tof a26 c16
tof b10 c16
tof b6 c0
tof a14 a13
tof a30 a17
tof a30 a24
tof a30 c17
tof a30 b28
tof a30 c4
tof a2 a10
tof c14 b21
tof b22 a8
tof b22 a11
tof a5 a26
tof c23 a5
tof b15 a5
tof b15 c23
tof c23 a27
tof c23 c6
tof c23 b28
tof c23 c19
tof a26 c10
tof c23 c4
tof a26 b10
tof a26 b2
tof a26 c0
tof a26 a13
tof a26 a14
tof c23 a2
tof c23 a22
tof c23 b21
tof c23 c14
tof c23 a8
tof a26 b8
tof a9 b8
tof a9 c23
tof c1 c23
tof b23 b8
tof b23 c23
tof c23 b26
tof c23 c12
tof c23 b4
tof c23 a15
tof c23 b11
tof c23 a20
tof c23 b24
tof c23 b20
tof c23 a21
tof c23 a0
tof c23 c7
tof c23 a29
tof c23 b9
tof c23 c20
tof c23 c18
tof c1 a27
tof c23 c9
tof c23 a24
tof c1 c6
tof c23 b17
tof c23 c8
tof c1 b28
tof c1 c19
tof c23 c2
tof c23 a19
tof c23 b29
tof b8 c10
tof c1 c4
tof c23 a30
tof b8 b10
tof b8 b2
tof b8 c0
tof c23 c15
tof b8 a13
tof b8 a14
tof c23 a10
tof c1 a2
tof c23 b12
tof c1 a22
tof c1 b21
tof c1 c14
tof c1 a8
tof c23 a26
tof c1 a5
tof c1 b15
tof b7 b18
tof b18 b26
tof b18 c12
tof b18 b4
tof b18 a15
tof b18 b11
tof b18 a20
tof b18 b24
tof b18 b20
tof b18 a21
tof b18 a0
tof b18 c7
tof b18 a29
tof b18 b9
tof b18 c20
tof b18 c18
tof b18 c9
tof b18 a24
tof b18 b17
tof b18 c8
tof b18 c2
tof b18 a19
tof b18 b29
tof b18 c10
tof b18 a30
tof b18 b10
tof b18 b2
tof b18 c0
tof b18 c15
tof b18 a13
tof b18 a14
tof b18 a10
tof b18 b12
tof b18 b8
tof b18 a26
tof b18 c23
tof b18 b23
T a28
T b7
T b18
T b23
T* a9
T* c31
T c1
T b15
T* c23
T* a5
T a26
T* b8
T* b22
T* a11
T a8
T c14
T b21
T a22
T* b12
T a2
T* a10
T a14
T a13
T* c15
T* b6
T c0
T* b2
T* b10
T c16
T* a30
T* c4
T* a4
T c10
T* b29
T* a19
T* c2
T* a25
T* c19
T* c13
T* b28
T* c8
T* c21
T* b31
T* b17
T* c17
T c6
T* a24
T* c9
T* a27
T b30
T* a17
T* c18
T* c5
T* b13
T* b14
T* c20
T* b27
T* c24
T* b9
T* a29
T* c7
T* b19
T* b16
T* b25
T* b1
T* b5
T* a1
T* a0
T* a21
T* b20
T* b24
T* a31
T* a23
T* c3
T* a7
T* c11
T* c25
T* c22
T* b0
T* a6
T* a20
T* a18
T* b11
T* b3
T* a15
T* a16
T* a12
T* b4
T* c12
T* b26
T* a3
tof b23 a28
tof a9 a28
tof c23 b7
tof a11 b7
tof a8 b7
tof a2 b7
tof a10 b7
tof c0 b6
tof a4 b6
tof a19 b6
tof c13 a28
tof b31 b7
tof b17 b6
tof a24 b6
tof c9 b6
tof a17 a28
tof b13 b7
tof c20 a28
tof b27 a28
tof c24 a28
tof a29 b7
tof b19 b7
tof b16 b7
tof b1 a28
tof b5 a28
tof a1 a28
tof a0 b7
tof a23 a28
tof c3 c18
tof a7 b7
tof c11 b7
tof c25 a28
tof c22 a28
tof b0 a28
tof b11 a28
tof a16 b7
tof a12 a28
tof c12 a28
tof b6 a28
tof c18 a28
tof b25 a28
tof b6 b7
tof b25 b7
tof b6 b18
tof c18 b18
tof b15 a9
tof a26 c1
tof b8 c31
tof b22 b23
tof a11 b23
tof c14 a5
tof b21 a5
tof a14 c1
tof a13 c1
tof b6 c23
tof b10 a5
tof c16 a5
tof c17 a9
tof a24 c1
tof c9 a5
tof a17 b23
tof c18 c31
tof c5 c1
tof b13 a5
tof c20 b23
tof b27 c31
tof c24 b23
tof b9 c23
tof b19 a9
tof b16 c31
tof b25 c31
tof b1 c31
tof b5 c31
tof a1 a9
tof b24 c1
tof a31 c1
tof a23 b23
tof a7 b23
tof c11 c31
tof c25 c31
tof c22 c31
tof b0 c31
tof a6 a5
tof a15 c1
tof a16 a5
tof a12 b23
tof c12 c1
tof a3 c1
tof c31 b23
tof c23 b23
tof a5 b23
tof c31 a9
tof a5 a9
tof c1 c31
tof c23 c31
tof b8 c1
tof b22 b15
tof a8 b15
tof a13 a14
tof b29 b15
tof a19 b6
tof c17 b15
tof a24 b15
tof c18 b15
tof c5 a14
tof b13 b15
tof b27 b6
tof b9 b6
tof a29 b6
tof c7 b6
tof b19 c1
tof b16 b6
tof b25 b6
tof b1 b6
tof b5 b6
tof a0 b6
tof a21 b6
tof b24 a14
tof a7 c1
tof c11 b6
tof c25 b6
tof c22 b6
tof b0 b6
tof a16 b15
tof c23 c1
tof c23 b15
tof a14 b15
tof a14 c23
tof b6 c23
tof a11 b22
tof b21 a26
tof a14 a26
tof b10 a26
tof c16 a26
tof c17 b6
tof a24 b22
tof c9 a26
tof a17 a5
tof c20 a5
tof b27 b22
tof b9 a19
tof a29 a19
tof c7 a19
tof b19 a26
tof b16 b22
tof b25 b22
tof b1 b22
tof b5 b22
tof a1 b22
tof a0 a19
tof a21 a19
tof a23 a5
tof a7 a19
tof c11 b22
tof c25 b22
tof c22 b22
tof b0 b22
tof a18 a26
tof b3 a26
tof a16 a26
tof a12 a5
tof b4 a26
tof b26 a26
tof b8 a5
tof b22 a5
tof a19 a5
tof b8 a26
tof a19 a26
tof c18 a26
tof b22 b8
tof b6 b8
tof c18 b8
tof b21 c14
tof a2 a8
tof a10 a8
tof b6 c14
tof b10 c14
tof c16 c14
tof b31 a8
tof c17 c14
tof c9 c14
tof c18 a11
tof c5 c14
tof b13 a19
tof c20 a17
tof b27 a11
tof b9 a8
tof a29 a8
tof b19 a14
tof b16 c14
tof b25 c14
tof b1 a19
tof b5 a19
tof a1 a17
tof a0 a8
tof b24 c14
tof a23 a17
tof c11 c14
tof c25 c14
tof c22 a19
tof b0 a11
tof a6 c14
tof a16 a19
tof a12 a17
tof a11 b22
tof a14 b22
tof a17 b22
tof c14 a11
tof a19 a11
tof a17 a11
tof c14 a8
tof a14 a8
tof a17 a8
tof a2 a22
tof a10 a22
tof b6 a14
tof b10 c14
tof c16 c14
tof b31 a22
tof c17 a14
tof a24 b21
tof a17 c9
tof c18 c14
tof c5 c9
tof b13 a19
tof b27 a14
tof b9 a22
tof a29 a22
tof b25 b16
tof b1 c14
tof b5 c14
tof a1 a14
tof a0 a22
tof b24 c9
tof c11 b16
tof c25 b16
tof c22 c14
tof b0 a14
tof a6 b21
tof a16 a19
tof b21 c14
tof a14 c14
tof c9 c14
tof a14 b21
tof a19 b21
tof b16 b21
tof a14 a22
tof c9 a22
tof b16 a22
tof a14 a2
tof b6 b12
tof a30 a10
tof b29 a10
tof c13 a10
tof c8 b12
tof b31 a2
tof c17 b12
tof a17 b12
tof c5 b12
tof b9 a10
tof a29 a10
tof b19 b12
tof b16 b27
tof b1 a24
tof b5 a24
tof a1 a2
tof a0 a10
tof b24 b12
tof c22 a24
tof b0 b27
tof a6 b12
tof a19 b12
tof b27 b12
tof a7 b12
tof a19 a2
tof a24 a2
tof b27 a2
tof a19 a10
tof a24 a10
tof a7 a10
tof b10 c15
tof c16 c15
tof a4 c15
tof a19 a13
tof b17 c15
tof c17 b6
tof a24 b6
tof c9 c15
tof c18 a14
tof b13 c15
tof b9 c15
tof a29 c15
tof c7 c15
tof b19 c5
tof b16 a14
tof b1 b6
tof b5 b6
tof a1 b6
tof a0 c15
tof a21 c15
tof b24 c5
tof a7 a17
tof c22 b6
tof a6 b6
tof a16 c15
tof b6 a14
tof a17 a14
tof b27 a14
tof b6 a13
tof c5 a13
tof b27 a13
tof b6 c15
tof a17 c15
tof c5 c15
tof b10 b2
tof c16 b2
tof b31 c0
tof a24 a19
tof c18 b2
tof b27 a19
tof b9 b2
tof a29 b2
tof c7 b2
tof b16 a17
tof b1 b2
tof b5 b2
tof a1 a17
tof a0 b2
tof a21 b2
tof a31 b2
tof c22 b2
tof a6 c9
tof a18 c0
tof b11 b2
tof b3 b2
tof a16 b2
tof b4 c0
tof b26 b2
tof a3 b2
tof a19 b6
tof a17 b6
tof c5 b6
tof c9 c0
tof a17 c0
tof c5 c0
tof a19 b2
tof c9 b2
tof c5 b2
tof a4 b10
tof a19 b10
tof b17 b10
tof c9 c16
tof c5 a17
tof b27 a17
tof b9 b10
tof a29 b10
tof c7 b10
tof b19 a30
tof b16 c16
tof b1 c18
tof b5 c18
tof a0 b10
tof a21 b10
tof a31 c18
tof c22 c18
tof a6 a1
tof b3 c16
tof a15 c18
tof a16 c16
tof c12 c18
tof b26 c16
tof a3 c18
tof c16 b10
tof a1 b10
tof a17 c16
tof c18 c16
tof a17 a30
tof a1 a30
tof a19 a4
tof b17 a4
tof c18 c10
tof b13 c5
tof b9 a4
tof a29 a4
tof c7 a4
tof b19 c4
tof b16 c5
tof a0 a4
tof a21 a4
tof a31 c10
tof b3 c5
tof a15 c10
tof c12 c10
tof b26 c5
tof a3 c10
tof a17 c4
tof a1 c4
tof a17 a4
tof c5 a4
tof c5 c10
tof a1 c10
tof c13 b29
tof a17 a19
tof c18 b29
tof c20 a19
tof b27 c2
tof b9 a19
tof a29 a19
tof c7 a19
tof b16 c2
tof a0 a19
tof a21 a19
tof b24 b29
tof a31 b29
tof a23 a19
tof a7 c2
tof b3 b13
tof a15 b29
tof a12 a19
tof c12 b29
tof b26 b13
tof a3 b29
tof c5 b29
tof b13 b29
tof a1 b29
tof c5 a19
tof b13 a19
tof b13 c2
tof a1 c2
tof b31 a25
tof b17 a25
tof c18 c13
tof c5 c13
tof b27 c19
tof b16 c19
tof b1 c19
tof b5 c19
tof a31 c13
tof c22 c19
tof a15 c13
tof b4 c13
tof c12 c13
tof a3 c13
tof b13 a25
tof a1 c19
tof b13 c13
tof a1 c13
tof b17 b28
tof a17 b28
tof b13 c18
tof b27 b28
tof b16 c21
tof b1 c8
tof b5 c8
tof a1 c18
tof a31 c18
tof a7 c5
tof c22 c8
tof a15 c18
tof c12 c18
tof a3 c18
tof c5 b28
tof c21 c8
tof c18 c21
tof c5 c21
tof a24 b31
tof a17 b31
tof c5 c18
tof c20 b31
tof b27 c18
tof b19 b31
tof b16 b31
tof b1 b17
tof b5 b17
tof a1 b17
tof a7 b31
tof c22 b17
tof a18 b31
tof a12 b31
tof b4 b31
tof c18 b31
tof c18 b17
tof b13 b17
tof b13 c17
tof c5 a17
tof b13 a17
tof b16 c9
tof b1 a24
tof b5 a24
tof a1 c9
tof a7 c6
tof c22 a24
tof c18 c6
tof b27 c6
tof c9 a24
tof c18 a24
tof a17 c9
tof c18 c9
tof b27 c9
tof c18 b30
tof a7 b30
tof b27 b30
tof b27 a17
tof c20 b13
tof c24 b14
tof b19 c5
tof a1 b14
tof a31 b27
tof a23 b13
tof a7 c18
tof a6 b14
tof a15 b27
tof a16 b27
tof a12 b13
tof c12 b27
tof b26 b3
tof a3 b27
tof b27 c18
tof b3 c18
tof b14 c5
tof b27 c5
tof b14 b13
tof b3 b13
tof b1 b19
tof b5 b19
tof a7 b19
tof c22 b19
tof b0 b16
tof a18 b14
tof b3 a1
tof a12 c20
tof b4 b14
tof c20 b14
tof a1 b14
tof b27 c20
tof b19 c20
tof a1 c20
tof b16 b27
tof a1 b27
tof c7 a29
tof b19 a29
tof b16 a29
tof b5 b9
tof a0 b9
tof a21 a29
tof a31 a29
tof a23 a29
tof c22 b9
tof b0 a29
tof a6 c24
tof b3 a29
tof a16 a29
tof c12 a15
tof a3 a29
tof a15 c24
tof a29 b9
tof a15 b9
tof a15 a29
tof b25 b16
tof b1 b19
tof b5 b19
tof a31 b19
tof c11 b16
tof c25 b16
tof c22 b19
tof b0 b16
tof b3 b19
tof a15 b19
tof a16 b16
tof a12 c7
tof a3 b19
tof a23 c7
tof b16 b19
tof a23 b16
tof a31 b5
tof c11 b25
tof c25 b1
tof c22 b1
tof b0 b5
tof b3 b5
tof a15 b5
tof a16 b5
tof a12 b25
tof a3 b5
tof b1 b25
tof b5 b25
tof a6 b5
tof a31 a0
tof a23 a0
tof b0 a0
tof b11 a20
tof b3 a20
tof a16 a0
tof a12 a0
tof b4 a0
tof a3 a0
tof a20 a1
tof a15 a1
tof a20 a0
tof a15 a21
tof a23 b20
tof c3 a31
tof a6 a31
tof a18 b24
tof b3 a31
tof a15 a31
tof a16 a31
tof b4 b24
tof a3 a31
tof a12 b20
tof a12 a31
tof a6 a23
tof a16 a23
tof a12 c22
tof c3 a23
tof a7 a23
tof c22 c3
tof b0 c3
tof b0 a7
tof a6 c25
tof a12 c11
tof a12 c22
tof a15 a20
tof a16 a20
tof a6 b0
tof a12 b0
tof a12 a6
tof a12 a20
tof a15 b11
tof a12 a16
tof b4 a18
tof a16 a18
tof b3 b11
tof a16 b3
tof a3 a15
tof b4 a15
tof b4 a12
tof a3 c12
tof b4 c12
tof b4 a3
tof a16 a12
tof a16 c12
tof a15 c12
tof a15 a3
tof a16 b4
tof b3 c12
tof b3 b4
tof b11 c12
tof a18 b4
tof a18 b11
tof b3 a12
tof b4 a15
tof a18 b26
tof a18 a16
tof a20 a12
tof a20 a15
tof a6 b26
tof a20 b4
tof a20 a16
tof a20 b11
tof a20 b3
tof a6 a18
tof c22 b0
tof c22 a18
tof a7 a18
tof c3 a18
tof a23 a18
tof a18 b26
tof a18 b4
tof a18 b11
tof a18 b3
tof a18 a20
tof c3 b0
tof b24 a15
tof a31 b26
tof b24 b3
tof a31 b0
tof b24 a18
tof a31 c3
tof a31 a23
tof a1 a0
tof a1 b4
tof a1 b3
tof a1 a20
tof b5 c3
tof b5 a31
tof b1 b5
tof b25 a31
tof b5 c25
tof b25 a0
tof b1 c22
tof b25 a6
tof b25 a23
tof b25 a16
tof b25 b0
tof b16 a23
tof b19 b16
tof a23 c25
tof c7 a21
tof b19 a0
tof b19 a31
tof b19 c11
tof b19 b25
tof b19 a16
tof a29 a0
tof a29 c3
tof b9 c22
tof b27 b25
tof b27 a16
tof c20 b25
tof c20 a16
tof b14 a16
tof b25 a3
tof a16 a12
tof c20 b26
tof b25 b11
tof b25 b3
tof b25 a21
tof b25 a18
tof b25 b20
tof c20 c3
tof c20 c22
tof b27 a6
tof c20 c11
tof c20 b16
tof b25 c7
tof c20 a29
tof c20 b9
tof b27 b5
tof a16 a1
tof c20 b19
tof b27 a7
tof b14 a20
tof b13 a1
tof b13 a20
tof c5 a16
tof c5 b13
tof c18 a20
tof c18 b13
tof c18 c5
tof a20 a3
tof c5 a12
tof a16 c12
tof a16 a15
tof a1 b26
tof b13 b4
tof a20 c24
tof b13 b11
tof b13 b3
tof a20 a21
tof b13 a0
tof b13 a18
tof a1 b16
tof a20 b25
tof c18 a7
tof c18 c20
tof c18 c25
tof c5 b14
tof c18 b27
tof c9 a17
tof a24 c9
tof c9 a20
tof c9 c20
tof c9 b14
tof c9 a27
tof c17 b14
tof b31 b14
tof b31 c20
tof c8 c21
tof c19 b14
tof a19 a21
tof a19 a0
tof a19 b20
tof a19 c3
tof a19 c22
tof a19 c7
tof a19 a29
tof a19 b9
tof a4 c10
tof a4 a3
tof a4 a12
tof a4 c12
tof a4 a15
tof a4 b26
tof a4 c24
tof a4 a21
tof a4 b16
tof a4 a1
tof a4 b25
tof a4 a16
tof a4 b30
tof a4 b17
tof a4 a27
tof a4 c9
tof a4 c6
tof a4 b28
tof a4 c19
tof a4 c5
tof a4 a20
tof c16 a20
tof b10 a20
tof b10 a3
tof b10 a12
tof b10 c12
tof b10 a15
tof b10 b26
tof b10 c24
tof b10 a21
tof b10 b16
tof b10 a1
tof b10 b25
tof b10 a16
tof a30 c13
tof a30 b29
tof b10 b30
tof b10 a27
tof b10 c9
tof b10 c17
tof b10 a25
tof b10 c6
tof b10 c19
tof b10 c2
tof b10 c5
tof a30 c4
tof a20 a24
tof c16 c18
tof b10 a4
tof c0 b31
tof b6 c0
tof b2 a3
tof b6 a12
tof b6 b26
tof b2 c24
tof b2 a21
tof b6 b16
tof b6 a1
tof b2 b25
tof b6 c13
tof b6 b29
tof b6 b17
tof b6 c21
tof b6 a27
tof b6 c9
tof b6 c17
tof b6 a25
tof b6 c25
tof b6 c8
tof b6 b27
tof b6 c5
tof b6 c10
tof b6 c18
tof b2 c16
tof b6 a4
tof b6 b10
tof c0 c20
tof b6 a30
tof a14 c15
tof a14 a12
tof a14 c12
tof a14 a15
tof a14 b4
tof a14 c24
tof a14 a0
tof a14 b20
tof a14 c3
tof a14 c22
tof a14 c11
tof a14 c7
tof a14 a29
tof a14 b9
tof a14 a1
tof a14 a16
tof a14 b19
tof a14 c13
tof a14 b29
tof a14 b13
tof a14 b30
tof a14 b17
tof a14 a17
tof a14 a27
tof a14 c9
tof a14 c17
tof a14 a25
tof a14 c6
tof a14 b27
tof a14 c19
tof a14 c2
tof a14 a24
tof a14 c18
tof a14 a7
tof a14 a4
tof a14 b10
tof a14 b2
tof a14 c20
tof a2 a10
tof a10 c13
tof a10 b29
tof a22 c19
tof b21 c19
tof b21 a14
tof c14 c19
tof c14 b21
tof b21 a12
tof a14 c12
tof a14 a15
tof a14 b26
tof c14 b4
tof c14 b11
tof c14 b3
tof c14 a0
tof c14 a18
tof a14 b16
tof a14 a1
tof a14 a16
tof a22 c13
tof a22 b29
tof a14 b30
tof c19 b14
tof a22 c21
tof a14 a27
tof a14 c9
tof a14 c17
tof a14 a25
tof c14 c8
tof a14 c6
tof b21 c2
tof a14 c5
tof a14 a24
tof a14 a20
tof a14 c16
tof c14 a7
tof a14 b10
tof b21 b2
tof a22 c0
tof a14 c15
tof c14 a13
tof c14 b12
tof c14 b6
tof a8 a22
tof a11 b6
tof a11 a8
tof b22 a22
tof b22 b6
tof b6 b26
tof b6 b4
tof b6 b11
tof b6 b3
tof b6 a0
tof b6 a18
tof b6 b16
tof b6 a1
tof a22 c13
tof a22 b29
tof b6 b30
tof a22 b14
tof a22 c21
tof b6 a27
tof b6 c9
tof b6 c17
tof b6 a25
tof a8 c25
tof b6 c8
tof b6 c6
tof a8 a10
tof a22 c19
tof b6 c5
tof b6 a24
tof b6 a20
tof b6 c16
tof b6 a7
tof b6 b10
tof b6 b2
tof a22 c0
tof b6 c15
tof b6 a13
tof b6 a14
tof a8 a2
tof b6 b12
tof a22 b27
tof b6 b21
tof a26 b2
tof a5 b2
tof b2 a3
tof a26 c12
tof a26 a15
tof a5 b4
tof b2 c24
tof b2 a21
tof a5 a0
tof a5 b20
tof a5 c3
tof a5 c22
tof a5 c7
tof a5 a29
tof a5 b9
tof b2 b25
tof a26 a16
tof a5 c13
tof a5 b29
tof a5 b14
tof a5 b17
tof a5 c21
tof a5 c25
tof a5 c19
tof b2 c16
tof a5 a7
tof a5 c0
tof a5 a22
tof a5 c14
tof a5 a8
tof a5 a11
tof a5 b22
tof c23 c13
tof c23 a5
tof b15 c13
tof c1 b15
tof c1 c23
tof a5 a12
tof c23 c12
tof c23 a15
tof c23 b4
tof c1 c24
tof a5 b11
tof a5 b3
tof c23 a21
tof a5 a18
tof a5 b20
tof a5 c3
tof a5 c22
tof c1 c11
tof a5 c7
tof a5 a29
tof a5 b9
tof c1 a1
tof c23 a16
tof c1 b19
tof c23 b29
tof c1 b13
tof c1 b30
tof a5 b14
tof c23 b17
tof c1 a17
tof c1 a27
tof c1 c9
tof c1 c17
tof c1 a25
tof c1 c6
tof a5 c19
tof a5 c2
tof c1 a24
tof c1 c18
tof c23 a7
tof c1 a4
tof c1 b10
tof c23 b2
tof c1 c20
tof c1 c15
tof a5 a13
tof c23 a2
tof a5 b27
tof c23 a22
tof a5 b21
tof c23 a26
tof c23 c14
tof a5 a8
tof c23 a11
tof c23 b22
tof c23 b8
tof c31 b15
tof a9 b15
tof b23 b15
tof b23 a9
tof c31 c12
tof c31 a15
tof c31 b4
tof c31 c24
tof c31 a21
tof c31 c11
tof c31 a1
tof c31 a16
tof c31 b19
tof a9 c13
tof c31 b29
tof c31 b13
tof c31 b30
tof c31 b17
tof c31 a17
tof c31 a27
tof c31 c9
tof c31 c17
tof c31 a25
tof c31 c6
tof b15 a10
tof c31 a24
tof c31 c18
tof c31 a7
tof c31 a4
tof c31 b10
tof c31 b2
tof c31 c20
tof c31 c15
tof c31 a2
tof c31 a22
tof c31 a26
tof c31 c14
tof c31 a11
tof c31 b22
tof c31 b8
tof c31 c23
tof c31 a30
tof c31 c5
tof b23 a5
T a28
T* b7
T* b18
T b23
T* a5
T c31
T c5
T c1
T* a30
T* c23
T a9
T b8
T b22
T a11
T* a8
T* c14
T a26
T* b6
T* b21
T* a22
T b27
T* b12
T* a2
T* a14
T* a13
T* c15
T c0
T b31
T* c20
T* b2
T* b10
T* a4
T* a7
T* c16
T* a20
T* c18
T* a24
T* c4
T* c10
T* b15
T c2
T* c19
T* b28
T* a10
T* c6
T* c8
T* c25
T* a25
T* c17
T* c9
T* a27
T* a17
T* c21
T* b17
T* b14
T* b30
T* b13
T* b29
T* a19
T* c13
T* b19
T* b24
T* a16
T* b25
T* a1
T* b1
T* b0
T* b5
T* b9
T* a29
T* c7
T* b16
T* c11
T* a31
T* a23
T* a6
T* c22
T* c3
T* b20
T* a18
T* a0
T* a21
T* b3
T* b11
T* c24
T* b4
T* b26
T* a15
T* c12
T* a12
T* a3
tof a5 b23
tof c31 a28
tof a30 a28
tof b22 b18
tof a11 b18
tof b6 b18
tof b21 b18
tof a22 b23
tof b27 b23
tof a4 b23
tof a7 b18
tof c16 b18
tof a20 b23
tof c18 a28
tof a24 b7
tof a10 a28
tof c25 a14
tof c9 b23
tof a17 b7
tof c21 a28
tof b13 a28
tof b25 b18
tof a1 a28
tof a29 b18
tof b16 b18
tof a23 b23
tof c3 b18
tof b11 a28
tof b4 b18
tof c12 a28
tof a12 b18
tof b23 a28
tof a14 a28
tof b23 b7
tof a14 b7
tof b23 b18
tof c5 c31
tof b22 a5
tof a11 a5
tof b21 c14
tof a22 a5
tof b27 a5
tof a14 b23
tof a4 c14
tof a7 a5
tof c16 c14
tof a20 c14
tof c18 b23
tof c25 a5
tof c9 c14
tof b24 c14
tof b25 c14
tof a1 b13
tof b0 a5
tof b5 a5
tof b9 a5
tof a29 a5
tof b16 a5
tof a6 a5
tof c22 a5
tof c3 a5
tof b3 c14
tof c24 c31
tof b4 a5
tof a12 a5
tof a3 c31
tof c21 b23
tof b13 b23
tof c31 a5
tof c21 a5
tof c14 c31
tof b13 c31
tof b22 a30
tof c14 c23
tof a26 c23
tof b6 c1
tof b27 a22
tof b12 a30
tof a14 a30
tof c0 c23
tof b31 c23
tof b10 c23
tof a4 c5
tof a7 a11
tof a20 a11
tof c18 a11
tof a10 a30
tof c17 c23
tof c9 c5
tof c21 a30
tof b14 c23
tof a19 c23
tof b19 c23
tof b24 c5
tof a1 c23
tof b0 a22
tof b5 a30
tof b9 a30
tof a29 a30
tof b16 a11
tof a6 a30
tof c22 a30
tof c3 a30
tof a18 c5
tof c24 c5
tof b4 a11
tof a12 a11
tof a3 c5
tof c23 c5
tof b21 c5
tof a22 c5
tof c23 c1
tof a11 c1
tof a22 c1
tof c23 a30
tof a11 a30
tof b21 a30
tof a11 b22
tof c14 b8
tof b21 c23
tof a22 a9
tof a14 b22
tof b31 c0
tof a4 c0
tof a20 c0
tof c25 b8
tof c9 c0
tof c21 c16
tof b17 b8
tof b14 c0
tof b13 c16
tof b29 a9
tof c13 c23
tof b19 c0
tof b24 a9
tof b25 c16
tof b0 b8
tof b5 c18
tof b9 b22
tof a29 b22
tof a6 c23
tof c22 c18
tof c3 b22
tof b4 c23
tof b22 c23
tof c16 c23
tof c18 c23
tof b22 a9
tof c0 a9
tof c16 a9
tof b22 b8
tof c0 b8
tof c18 b8
tof c0 b22
tof c16 a8
tof a20 a11
tof c17 b22
tof c21 b22
tof c13 a8
tof b24 a11
tof a6 b22
tof c22 b5
tof b20 a11
tof b3 a11
tof b4 a8
tof c14 b22
tof c18 b22
tof c14 a11
tof c18 a11
tof b5 a11
tof c18 a8
tof b5 a8
tof b21 b6
tof c0 a22
tof b10 a26
tof a4 c14
tof a20 b6
tof c17 a22
tof c9 c14
tof c21 c16
tof b13 c14
tof b29 b6
tof b24 b6
tof b5 c18
tof c11 c18
tof a22 c14
tof c18 c14
tof c16 a26
tof c18 a26
tof a22 b6
tof c16 b6
tof c18 b6
tof c0 a22
tof a4 b21
tof a20 b21
tof a24 b27
tof c25 b21
tof c9 b21
tof c21 b21
tof b14 a22
tof b0 b27
tof b5 c16
tof b9 c16
tof a29 c16
tof c11 b21
tof a6 c16
tof c3 c16
tof c24 b27
tof a3 b27
tof c18 b21
tof b13 b21
tof c16 a22
tof c18 a22
tof c16 b27
tof b13 b27
tof c0 b12
tof c16 a14
tof a20 a14
tof c18 b12
tof c25 a14
tof c9 a4
tof b14 b12
tof b13 a4
tof b5 a4
tof b9 a4
tof a29 a4
tof c11 b12
tof a6 a4
tof c3 a4
tof a21 a2
tof a3 a14
tof a4 b12
tof c24 a2
tof a4 a14
tof c24 a14
tof a4 c0
tof a7 a13
tof c16 c0
tof b29 a13
tof b19 b13
tof b24 a13
tof b5 a13
tof b9 a13
tof a29 a13
tof c11 b13
tof a6 a13
tof c3 a13
tof c24 a13
tof a3 a13
tof c0 a13
tof b14 a13
tof c17 c15
tof b14 c15
tof c17 c0
tof b13 c0
tof a20 b31
tof c18 b31
tof c17 c20
tof b14 c20
tof b13 c20
tof c13 b2
tof b24 b2
tof a16 b2
tof b5 c20
tof b9 c20
tof a29 c20
tof a6 c20
tof c3 c20
tof a18 b2
tof b11 b2
tof a12 c20
tof c11 b31
tof b4 c20
tof c11 b2
tof b4 b2
tof a20 a4
tof c18 a7
tof b19 b13
tof b24 b13
tof b5 a7
tof b9 a7
tof a29 a7
tof a6 a7
tof c3 a7
tof a18 b13
tof a3 c24
tof b13 b10
tof c24 b10
tof c16 a4
tof c24 a4
tof c16 a7
tof b13 a7
tof c24 a7
tof c17 c16
tof a17 a24
tof c21 c25
tof b14 c16
tof b13 c25
tof a16 b19
tof b0 a20
tof c11 b19
tof a18 b24
tof b11 b19
tof c18 c16
tof c25 c16
tof b19 c16
tof c18 a20
tof b19 a20
tof b24 a20
tof a24 c18
tof c25 c18
tof b24 c18
tof c25 c10
tof b14 c17
tof b13 c4
tof c13 c17
tof a16 b29
tof b5 b19
tof b9 b19
tof a29 b19
tof c11 c17
tof a6 b19
tof c3 b19
tof a18 b29
tof b11 b29
tof c24 a24
tof b4 c17
tof b29 a24
tof b19 a24
tof c17 c4
tof b29 c4
tof b19 c4
tof c17 c10
tof b19 c10
tof c8 c19
tof c17 c25
tof b14 b15
tof b13 b15
tof b29 b15
tof c13 c25
tof b19 c2
tof a21 c19
tof b4 c25
tof a3 c19
tof c25 b15
tof c11 b15
tof c25 c2
tof c11 c2
tof c11 c19
tof c25 b28
tof c9 c17
tof b17 b28
tof b14 c6
tof b13 c6
tof c13 c17
tof b19 c17
tof b24 a10
tof b0 c17
tof b5 c17
tof b9 c17
tof a29 c17
tof c7 a10
tof c11 c6
tof a6 c17
tof c3 c17
tof a18 a10
tof b3 a10
tof b4 c17
tof c17 b28
tof c17 c6
tof c17 c8
tof c9 c8
tof b17 a25
tof b13 c25
tof b24 c8
tof a16 b19
tof b0 c8
tof b5 c8
tof b9 c25
tof a29 c25
tof a6 c8
tof c3 c25
tof b11 b19
tof c25 c8
tof b19 c8
tof b29 c25
tof c11 c25
tof b19 a25
tof c11 a25
tof b14 c9
tof b19 c9
tof a16 c17
tof b0 c17
tof b5 c17
tof a29 b9
tof c11 b29
tof a6 c17
tof c3 b9
tof a21 b9
tof b11 c17
tof c24 b29
tof a3 b9
tof c9 c17
tof b13 c17
tof b29 c17
tof b29 c9
tof b24 c9
tof b9 c9
tof b13 a27
tof b29 a27
tof b9 a27
tof b13 b14
tof b29 a17
tof a16 b24
tof b0 a17
tof b5 a17
tof a6 a17
tof a21 a17
tof b11 b24
tof a3 a17
tof b24 a17
tof c24 a17
tof b14 c21
tof b24 c21
tof c24 c21
tof b14 b17
tof c24 b17
tof b19 b13
tof a16 b13
tof b5 b0
tof b9 b13
tof b16 b14
tof c11 b14
tof a6 b0
tof a21 b13
tof b11 b13
tof c24 b14
tof b4 b14
tof a12 b14
tof a3 b13
tof b13 b14
tof b0 b13
tof b24 a19
tof a16 c13
tof a1 a19
tof b9 b19
tof b16 c13
tof a21 b19
tof b11 c13
tof c24 b29
tof a12 c13
tof a3 b19
tof c11 b29
tof b19 a19
tof c11 a19
tof b19 c13
tof c11 c13
tof b0 b24
tof b9 a16
tof c11 b24
tof a21 a16
tof b11 a16
tof c24 a16
tof b4 b16
tof a12 b16
tof a3 a16
tof b16 b19
tof b16 b24
tof b16 a16
tof b9 a1
tof c22 b1
tof a21 a1
tof b11 a1
tof c24 a1
tof a3 a1
tof c11 b25
tof b0 a1
tof c11 a1
tof b0 b1
tof c11 b0
tof a6 b5
tof a21 b9
tof a3 b9
tof b9 b0
tof c24 b0
tof b16 b5
tof c24 b5
tof b16 b9
tof c24 b9
tof c11 c7
tof a31 c7
tof a23 a29
tof b3 a18
tof b16 a29
tof c24 a29
tof b16 c7
tof a18 c7
tof b20 b16
tof a18 b16
tof c24 b16
tof a18 a23
tof c24 c11
tof b20 c11
tof b20 a31
tof a18 a6
tof c24 c3
tof b4 c3
tof c12 a6
tof b20 a6
tof b11 a6
tof b11 c22
tof b20 c3
tof b11 a0
tof c24 a0
tof b4 a0
tof a18 b20
tof b3 a18
tof c24 a21
tof a3 a21
tof a12 b4
tof c24 b4
tof c24 a3
tof b4 a12
tof a21 b3
tof b11 a12
tof b11 c12
tof b20 a18
tof b20 a0
tof a18 a15
tof b20 a12
tof b20 c12
tof a18 b3
tof a18 c24
tof b20 b11
tof b20 a21
tof c11 a31
tof c11 a23
tof a31 a3
tof a31 b26
tof c11 b3
tof a31 b11
tof a31 a18
tof c11 c3
tof b16 a23
tof a29 a23
tof b16 a12
tof b16 c24
tof b16 b4
tof b16 b11
tof b16 a18
tof b16 a31
tof b16 a6
tof a23 c3
tof b16 a0
tof b16 b20
tof b16 c11
tof b16 a21
tof b9 a3
tof b9 b26
tof b9 a6
tof b5 b26
tof b5 a6
tof b0 a3
tof b0 b26
tof b9 a12
tof b9 c24
tof b9 b4
tof b0 b11
tof b0 a18
tof b0 a31
tof b9 c3
tof b9 c22
tof b0 c7
tof b9 a0
tof b9 b20
tof b0 c11
tof b9 b16
tof b0 a29
tof b1 a3
tof a1 a12
tof b1 b26
tof b1 b11
tof b1 a18
tof b1 a31
tof b1 c7
tof b1 b0
tof a16 a1
tof a16 a23
tof b24 a12
tof b24 a1
tof b19 a12
tof b19 a1
tof b19 a23
tof a16 c24
tof a16 b4
tof a16 b11
tof a16 a18
tof a16 a31
tof a16 a6
tof a16 c22
tof a16 c7
tof a16 a0
tof a16 c11
tof a16 b16
tof a23 a29
tof b24 b25
tof b29 a19
tof b29 a12
tof b29 c24
tof b29 b4
tof b29 b11
tof b29 a18
tof b29 a31
tof b29 a6
tof b29 c22
tof b29 c7
tof b29 a0
tof b29 b20
tof b29 c11
tof b29 b16
tof b29 a29
tof c13 a23
tof b13 b25
tof b14 b25
tof b14 a3
tof b14 a1
tof b14 c24
tof b14 b4
tof b14 c3
tof b14 a0
tof b14 a21
tof b14 b16
tof b14 b5
tof b14 a29
tof b14 a23
tof b14 c13
tof b14 a16
tof b14 b19
tof b14 b24
tof b14 b9
tof b17 b25
tof c9 b24
tof c17 a27
tof c17 c9
tof c17 a3
tof c17 a1
tof c17 c24
tof c17 b4
tof c17 c3
tof c17 a0
tof c17 a21
tof c17 b16
tof c17 b5
tof c17 a29
tof c17 a23
tof c17 b17
tof c17 c21
tof c9 a17
tof c17 b19
tof c17 b9
tof c17 b14
tof c25 a3
tof c25 a12
tof c25 a1
tof c25 b11
tof c25 a18
tof c25 a31
tof c25 a6
tof c25 c3
tof c25 c22
tof c25 c7
tof c25 b20
tof c25 c11
tof c25 b5
tof c25 a23
tof c25 b17
tof c25 c21
tof c25 a17
tof c25 b19
tof c25 b24
tof c25 b9
tof c25 a19
tof c25 c17
tof a24 c17
tof c18 a17
tof c18 b29
tof a20 a17
tof a20 b24
tof c16 b29
tof c16 b24
tof c16 a3
tof c16 a12
tof c16 a1
tof c16 b11
tof c16 a18
tof c16 a31
tof c16 a6
tof c16 c3
tof c16 c22
tof c16 c7
tof c16 c11
tof c16 b5
tof c16 a23
tof c16 c21
tof a17 b30
tof a20 b13
tof c16 c8
tof b24 a27
tof a20 c6
tof a20 b28
tof b24 c19
tof c16 c2
tof c16 b15
tof c16 c10
tof b29 c4
tof c16 a25
tof c18 c17
tof b29 a24
tof c16 c25
tof b24 c9
tof c16 b19
tof c16 b25
tof c16 a19
tof c16 b9
tof a4 b20
tof a4 b16
tof b10 a24
tof b31 c20
tof b31 c9
tof b31 a16
tof b31 b19
tof b31 b25
tof c0 a1
tof c0 c24
tof c0 b4
tof c0 b11
tof c0 a18
tof c0 a31
tof c0 a6
tof c0 c22
tof c0 c7
tof c0 a0
tof c0 c11
tof c0 a21
tof c0 b16
tof a13 b5
tof c0 c21
tof c0 c8
tof c0 b15
tof c0 c17
tof a13 a7
tof c0 b29
tof c0 b31
tof c0 b14
tof c0 c16
tof c0 c25
tof c0 a20
tof a14 a13
tof a2 a14
tof a13 a21
tof a13 b5
tof b12 a10
tof b12 c21
tof b12 c8
tof a13 a7
tof a13 b14
tof a2 a4
tof a2 b10
tof a2 b9
tof b27 b0
tof b27 b20
tof a22 b20
tof a22 b27
tof a22 c16
tof b21 b20
tof b21 c16
tof a22 a3
tof a22 a1
tof a22 c24
tof a22 b4
tof a22 c3
tof a22 a0
tof a22 c20
tof a22 b16
tof a22 b5
tof a22 a29
tof a22 a10
tof a22 a23
tof a22 b15
tof a22 b12
tof a22 c17
tof a22 b29
tof c16 b2
tof a22 c9
tof a22 a16
tof a22 b19
tof a22 b25
tof a22 a13
tof b21 c18
tof b0 b1
tof b27 c13
tof c16 a20
tof c16 a19
tof b6 a13
tof a26 b20
tof c14 b6
tof c14 a26
tof c14 a3
tof c14 a1
tof c14 c24
tof c14 b4
tof c14 c3
tof c14 a0
tof a13 a21
tof c14 b16
tof c14 b5
tof c14 a29
tof c14 a10
tof c14 a23
tof c14 a27
tof c14 c19
tof c14 c2
tof c14 b15
tof c14 b12
tof b6 c17
tof c14 a24
tof c14 b29
tof a26 b2
tof c14 a16
tof c14 b25
tof c14 b31
tof c14 b10
tof a26 c18
tof c14 b1
tof c14 b0
tof c14 c13
tof c14 b27
tof c14 c16
tof c14 b3
tof c14 a25
tof c14 a22
tof c14 c0
tof b22 a3
tof b22 b11
tof b22 a18
tof b22 a31
tof b22 a6
tof b22 c3
tof b22 c22
tof b22 c7
tof b22 c11
tof b22 b5
tof b22 a29
tof b22 a23
tof b22 b13
tof b22 a27
tof b22 c6
tof b22 b15
tof b22 c10
tof b22 a24
tof b22 b2
tof b22 b25
tof b22 b9
tof b22 b1
tof b22 b0
tof a8 c13
tof b22 b20
tof b22 a19
tof b22 b3
tof b22 c25
tof b22 c14
tof c23 a29
tof c23 a10
tof c23 b12
tof c23 b2
tof a9 c25
tof c23 a8
tof c23 c14
tof c1 a11
tof c5 a29
tof a30 a10
tof a30 c21
tof a30 c8
tof a30 b12
tof c5 a7
tof c5 b10
tof c5 c23
tof c31 c23
tof c31 c5
tof c31 a25
tof a5 a25
tof a5 c31
tof b23 c23
tof b23 c31
tof b23 a5
tof b23 a3
tof b23 b11
tof b23 a18
tof b23 a31
tof b23 a6
tof b23 c3
tof b23 c22
tof b23 c7
tof b23 c11
tof c5 a11
tof b23 b5
tof c23 a29
tof c23 a10
tof b23 a23
tof c5 c21
tof b23 b13
tof c5 c8
tof b23 a27
tof b23 c6
tof b23 b28
tof b23 c19
tof b23 b15
tof b23 c10
tof c23 b12
tof c5 a7
tof b23 a24
tof c5 b10
tof b23 b9
tof c5 a30
tof b23 b1
tof b23 b0
tof b23 c13
tof b23 b20
tof b23 a19
tof b23 b21
tof c5 c1
tof b23 a9
tof c5 a8
tof c5 c14
tof c31 c0
tof b23 b3
tof b18 b3
tof b18 a21
tof b7 c18
tof a28 b23
tof a28 b22
T* a28
T* b22
T* b23
T* b7
T* c18
T* b18
T* a21
T b3
T a5
T c31
T* c0
T* a25
T c5
T* c23
T c14
T* a8
T* a9
T* c25
T* a22
T b8
T c1
T* b21
T* c16
T a19
T* a26
T a20
T b27
T* b24
T b20
T* b6
T c13
T* b0
T* b1
T* a30
T* a2
T* b9
T b10
T* a14
T* a4
T* a13
T* b14
T* c15
T* b31
T b25
T* b19
T a16
T* c9
T* b2
T* b29
T a24
T* a7
T c17
T* b12
T* c4
T* c10
T* b15
T* c2
T c19
T* b28
T* c6
T a27
T* c8
T* b13
T* a17
T* b30
T* c21
T* b17
T* a23
T* a10
T* a29
T* b5
T* b16
T* a11
T* c11
T* c20
T* a0
T* c7
T* c22
T* c3
T* a6
T* a31
T* a18
T* b11
T* b4
T* c24
T* a1
T* b26
T* c12
T* a12
T* a3
T* a15
tof b7 b22
tof c18 b22
tof a21 b22
tof b3 b22
tof c31 b23
tof a19 c16
tof a20 a26
tof b20 a28
tof b6 b22
tof b1 a28
tof b31 b23
tof b25 a28
tof b19 b23
tof c9 a28
tof b29 b22
tof b13 b22
tof b17 a28
tof b16 a28
tof c11 b22
tof a0 a28
tof a31 a28
tof b11 a28
tof a26 a28
tof c16 b22
tof a26 b22
tof c16 b23
tof a21 b7
tof c16 b3
tof b20 b7
tof b6 b7
tof a2 b1
tof b9 b27
tof a4 b7
tof b31 a26
tof c9 a26
tof b29 b7
tof b12 a26
tof c11 b3
tof c18 b7
tof b3 b7
tof b1 b7
tof a26 c18
tof b27 c18
tof b1 c18
tof b3 b18
tof b27 b18
tof b1 b18
tof c31 a5
tof b27 a21
tof b20 c16
tof a2 a26
tof b9 a5
tof b10 a5
tof a4 a5
tof a13 b1
tof b14 b1
tof b31 c16
tof b19 a26
tof a16 a5
tof a24 a5
tof c17 a5
tof b12 a26
tof b16 a26
tof c11 c16
tof c22 a26
tof a31 a26
tof b11 a26
tof b3 a21
tof b1 a21
tof c16 b3
tof a26 b3
tof b1 b3
tof c16 a5
tof b1 a5
tof c16 c31
tof a19 a25
tof a20 a25
tof b27 c31
tof b20 c0
tof b1 c0
tof a14 a25
tof a4 a26
tof a13 c0
tof b14 c0
tof b31 a25
tof b19 c0
tof c9 a25
tof b5 a25
tof b16 a26
tof c11 a25
tof c22 a26
tof a31 a26
tof b11 a26
tof c0 c31
tof a25 c0
tof a26 c0
tof a2 a25
tof b20 c23
tof c13 a8
tof b1 c16
tof a2 a8
tof a4 c5
tof a13 c16
tof b14 c16
tof b31 c16
tof b19 a8
tof a16 a8
tof a8 c5
tof c16 c5
tof b27 c5
tof c14 c23
tof c16 c23
tof b27 c23
tof a8 c14
tof b27 c14
tof b27 c16
tof b20 c16
tof b6 a9
tof b1 a8
tof a2 c16
tof a4 c16
tof b14 a13
tof c11 a8
tof a13 a8
tof c25 a9
tof a13 a9
tof c16 c25
tof c16 c1
tof a26 c1
tof b20 c1
tof b6 a22
tof b0 b8
tof b9 a22
tof a14 c1
tof b31 c1
tof b19 c1
tof c9 c1
tof b29 a22
tof b13 c1
tof c21 b8
tof b17 b8
tof b16 c1
tof a11 c1
tof a2 a22
tof a13 a22
tof b1 b8
tof a2 b8
tof a13 b8
tof b1 c1
tof a13 c1
tof a26 a19
tof b20 a19
tof a4 c16
tof a13 b1
tof b31 a20
tof b19 a19
tof c9 a20
tof b12 b21
tof c11 a19
tof a20 b21
tof b27 b21
tof b1 b21
tof b27 c16
tof b1 c16
tof a2 c16
tof a20 a19
tof b27 a19
tof a2 a19
tof b20 a26
tof b6 a20
tof a2 b1
tof a4 b27
tof a13 a20
tof b19 a26
tof b29 a20
tof b16 b27
tof b4 a20
tof b1 a26
tof b12 a26
tof c8 a26
tof b27 a20
tof b1 a20
tof b12 a20
tof b1 b27
tof c8 b27
tof c21 b27
tof b1 b20
tof a2 b20
tof b9 b20
tof b10 b20
tof a4 b20
tof b19 b20
tof a16 b20
tof a24 b20
tof a7 b20
tof c17 b20
tof a17 b24
tof a23 b20
tof a13 b20
tof a13 b6
tof a2 b0
tof b9 b0
tof b10 b0
tof a4 b0
tof a13 b0
tof a16 b19
tof a24 b0
tof a7 b0
tof c17 b0
tof a23 b0
tof b1 c13
tof b19 c13
tof b1 b0
tof b19 b0
tof b10 b9
tof a4 a2
tof a13 b9
tof b19 a2
tof b29 a30
tof a24 b9
tof a7 b9
tof c17 b9
tof c8 a30
tof a23 b9
tof b16 a2
tof b4 a2
tof b9 a2
tof a13 b10
tof b19 b10
tof a24 b10
tof a7 b10
tof c17 b10
tof a23 b10
tof b5 a14
tof b16 a4
tof a0 c21
tof a31 c21
tof b11 c21
tof b4 b10
tof a4 b10
tof c8 b10
tof a4 a14
tof c8 a14
tof a11 a14
tof c21 a4
tof a11 a4
tof b31 c15
tof b19 a13
tof a16 c15
tof b12 c15
tof c8 c15
tof c21 c15
tof a10 b14
tof a0 c15
tof c7 b14
tof b11 c15
tof b4 a31
tof a31 b14
tof a31 c15
tof b12 b31
tof b13 c9
tof c21 b25
tof a31 a11
tof a18 b25
tof b11 b19
tof b4 a11
tof b25 b31
tof a11 b31
tof c9 b25
tof a11 b25
tof a11 b19
tof b12 b2
tof c21 a16
tof a0 a16
tof c9 a16
tof c17 a24
tof c8 a24
tof a23 a7
tof a29 a7
tof a11 a7
tof c11 b29
tof a0 c21
tof a31 c21
tof b11 b29
tof c21 b29
tof c21 a7
tof c21 b12
tof a31 a11
tof b11 b12
tof a11 c17
tof a11 b12
tof c21 c10
tof a23 c2
tof b5 b15
tof a31 c8
tof c8 c10
tof a11 c10
tof c8 b15
tof b11 b15
tof c8 c2
tof a11 c2
tof b11 c2
tof c8 c6
tof b17 c6
tof a10 b28
tof c7 b28
tof a31 a17
tof b11 c21
tof c21 c19
tof a11 c19
tof a17 b28
tof c21 b28
tof a17 c6
tof c21 c6
tof a11 c6
tof b17 c8
tof b16 c8
tof a11 a27
tof a6 c8
tof b11 b13
tof a1 b13
tof c12 c8
tof a12 b13
tof c21 a27
tof a31 c8
tof c21 b13
tof a31 b13
tof b16 b17
tof a11 b30
tof a6 b17
tof a31 a17
tof a1 b30
tof c12 b17
tof a12 b30
tof b17 a17
tof c21 b30
tof b17 b30
tof b17 c21
tof c11 b17
tof c7 a10
tof a31 a11
tof a11 b17
tof b11 b17
tof a11 a23
tof b11 a23
tof a11 a10
tof b4 b16
tof a31 a11
tof b4 a6
tof c12 a6
tof a6 a11
tof a6 c20
tof a31 a6
tof c22 a0
tof a6 c7
tof a6 c22
tof b11 c22
tof b4 a6
tof a1 c3
tof a12 c3
tof a31 a6
tof b11 a31
tof b11 a18
tof b4 a18
tof a3 b11
tof a12 a1
tof a1 a12
tof b4 c12
tof a18 c24
tof b11 a3
tof a31 c26
tof a6 c26
tof a31 c12
tof a6 a15
tof a6 c24
tof a31 a12
tof a6 a18
tof a31 a1
tof a31 a3
tof a31 b11
tof a6 b4
tof a0 c22
tof c11 c26
tof a11 c26
tof a11 c20
tof c11 b26
tof a11 c24
tof a11 c22
tof a11 c7
tof a11 b4
tof a11 a6
tof c11 c3
tof b16 c24
tof b16 a18
tof a23 c12
tof b17 c26
tof b17 c3
tof a17 b30
tof c21 b26
tof c21 c26
tof c21 b4
tof c21 a1
tof c21 b11
tof c21 b17
tof c21 a18
tof b13 a1
tof c8 a1
tof c8 b26
tof b13 b30
tof c8 b4
tof c8 c3
tof c8 b11
tof c8 c21
tof c8 a17
tof b28 c6
tof b29 b26
tof a24 c17
tof b29 b17
tof a7 a29
tof a16 c2
tof a16 c10
tof b19 a16
tof b19 a18
tof b25 a16
tof b31 a16
tof b31 b25
tof b31 a18
tof b19 c24
tof b19 b30
tof b25 a27
tof b25 c6
tof b25 c19
tof a16 c2
tof b19 b15
tof a16 c10
tof b25 c9
tof a16 b11
tof b25 b13
tof b19 a31
tof b19 b17
tof b19 a23
tof a16 b4
tof b19 a29
tof b25 a1
tof b19 a7
tof a13 a24
tof a14 b26
tof a14 b15
tof b10 c10
tof b10 c17
tof b10 b2
tof b10 c9
tof b10 c15
tof b10 a24
tof a14 b5
tof b10 a3
tof b9 a31
tof a2 a31
tof a31 c12
tof a31 b26
tof b9 c24
tof b9 b30
tof a31 a27
tof a31 c6
tof a31 c19
tof b9 c2
tof a2 b15
tof b9 c10
tof a31 c17
tof a2 b2
tof a2 c9
tof b9 c15
tof a2 b14
tof a31 a4
tof a31 a6
tof b9 b17
tof a2 c21
tof a2 b16
tof a2 a24
tof b9 a23
tof a31 b12
tof a31 c20
tof a31 c22
tof a31 c7
tof a31 b5
tof b9 a29
tof a31 c3
tof a31 a16
tof a31 a14
tof b9 a7
tof a2 a3
tof a2 b10
tof a31 a11
tof b9 a18
tof b9 a13
tof a31 b11
tof a31 a10
tof a31 b19
tof a31 b31
tof b0 c24
tof b0 b16
tof c13 a24
tof b6 b17
tof b20 b30
tof b20 b17
tof b24 b30
tof b6 b26
tof b24 b28
tof b20 b15
tof b6 c10
tof b6 c4
tof b20 c17
tof b20 b14
tof b6 a30
tof b6 b29
tof b20 c21
tof b24 a17
tof b20 b0
tof b20 a18
tof b20 a2
tof b20 a13
tof b24 b11
tof b20 b9
tof b27 b29
tof b27 c21
tof a20 b29
tof a26 b29
tof a26 b27
tof c21 b30
tof b27 a27
tof a26 c6
tof b27 b28
tof b27 c19
tof a26 c2
tof c21 b15
tof b27 c10
tof c21 c17
tof a26 b2
tof a26 c9
tof b27 c15
tof b27 a4
tof a26 a30
tof c21 b1
tof c21 b17
tof a26 c8
tof b27 b12
tof a26 b4
tof a26 b5
tof b27 a29
tof a26 c3
tof b27 a16
tof a26 a14
tof a26 a17
tof b27 a7
tof a26 a3
tof a26 b10
tof c21 b0
tof c21 a18
tof c21 a2
tof c21 a13
tof a26 b11
tof b27 b13
tof a26 a1
tof c21 b9
tof b27 b31
tof c21 b20
tof c16 a4
tof c16 a19
tof b21 a4
tof c16 c24
tof c16 b30
tof c16 a27
tof c16 b28
tof c16 c19
tof c16 b15
tof c16 c10
tof c16 c17
tof c16 c15
tof c16 b14
tof c16 b1
tof c16 b17
tof c16 b16
tof c16 a24
tof c16 c11
tof c16 b12
tof c16 c13
tof c16 a29
tof c16 a16
tof c16 a7
tof b21 a12
tof c16 a18
tof c16 a2
tof c16 a13
tof c16 b13
tof c16 b9
tof c16 b31
tof c16 b27
tof c16 b20
tof a22 b26
tof a22 a20
tof a9 c25
tof c25 c8
tof a8 c11
tof c23 c14
tof c14 c12
tof c14 c4
tof c5 b17
tof c23 c11
tof c14 b20
tof c0 a25
tof c31 a25
tof c31 c0
tof c31 c25
tof c31 c5
tof a21 a5
tof a21 b3
tof a21 c2
tof a21 c10
tof a21 c4
tof a21 b14
tof a21 a30
tof a21 b17
tof a21 c8
tof a21 c25
tof a21 a22
tof b3 a0
tof a21 a29
tof a21 a7
tof a21 a13
tof a21 b20
tof a21 a23
tof a21 a9
tof a21 b6
tof a21 a24
tof a21 b12
tof b18 b28
tof b18 a17
tof b18 a16
tof c18 b28
tof c18 a17
tof c18 a2
tof b7 a17
tof b7 a2
tof b7 a16
tof b7 c12
tof b7 c24
tof b18 b30
tof b7 a27
tof b28 c6
tof b7 c19
tof b7 c2
tof b7 b15
tof b7 c17
tof a16 c15
tof b7 a4
tof b7 a30
tof b7 b1
tof b7 b17
tof b7 b29
tof a2 a20
tof b7 c1
tof c18 b8
tof c18 c8
tof b7 c25
tof b18 a8
tof b7 a25
tof b7 a5
tof b7 a22
tof a16 a0
tof a16 b3
tof c18 b5
tof a2 a29
tof c18 c3
tof a17 c0
tof c18 a14
tof a2 a7
tof c18 b25
tof a2 a3
tof c18 b10
tof a2 a12
tof c18 b21
tof a2 a18
tof a16 b11
tof b18 b24
tof b7 a1
tof b7 b19
tof b7 b31
tof b7 a6
tof b7 a26
tof b7 c7
tof b7 a10
tof b7 a11
tof b7 b0
tof b7 a24
tof b7 a19
tof b7 b12
tof b7 a31
tof b7 c20
tof b7 c5
tof b7 b4
tof b7 c21
tof b7 c22
tof b7 a13
tof b22 b23
tof b22 a18
tof a28 a18
tof a18 c6
tof a18 b28
tof a18 a20
tof a18 b8
tof a18 c8
tof b22 b11
tof b22 b24
tof b22 b13
tof b22 a1
tof b22 b19
tof b22 b9
tof a28 b31
tof b22 b27
tof b22 a6
tof b22 a26
tof b22 c7
tof b22 b20
tof b22 a23
tof b22 a10
tof b22 a9
tof b22 c14
tof b22 a11
tof b22 b6
tof b22 c16
tof b22 b0
tof b22 b16
tof b22 a24
tof b22 c13
tof b22 a19
tof b22 c23
tof b22 b12
tof b22 a21
tof b22 a31
tof b22 c20
tof b22 c5
tof b22 c31
tof b22 a16
tof b22 b18
tof b22 b4
tof b22 c22
tof b22 a13
tof b22 b7
tof b22 a5
tof b22 c21
T b22
T* c21
T a5
T* b7
T a13
T* c22
T a28
T* b4
T* b18
T a16
T* c31
T c5
T* c20
T* a31
T* a21
T b12
T* c23
T* a19
T* c13
T a24
T* b16
T b0
T* c16
T* b6
T* a11
T* c14
T* a9
T* a10
T* a23
T b20
T* c7
T* a26
T* a6
T b27
T b31
T* b9
T b19
T* a1
T b13
T* b24
T b11
T* c18
T a2
T* a18
T* b21
T a12
T* b10
T a3
T* b25
T* a7
T* a17
T* a14
T c0
T* c3
T* a29
T* b5
T* b3
T* a0
T* a22
T b23
T* a25
T a8
T* c11
T c25
T c8
T b8
T* c1
T a20
T* b29
T* b17
T* b1
T* a30
T a4
T b14
T* c15
T* c9
T* b2
T* c17
T* c4
T c10
T* b15
T* c2
T* c19
T b28
T c6
T* a27
T b30
T c26
T* c24
T* b26
T* a15
T* c12
tof b4 a5
tof a16 a5
tof c31 b7
tof c5 b7
tof a21 b22
tof b12 b22
tof a18 b7
tof a0 c22
tof a22 b7
tof b23 b22
tof a25 b22
tof a8 c23
tof c11 c23
tof a20 b7
tof b29 b7
tof b17 b7
tof c22 b22
tof b18 b22
tof c23 b22
tof b7 c21
tof b18 c21
tof c23 c21
tof b7 a5
tof c22 a5
tof c23 a5
tof a16 b4
tof c5 c31
tof c23 b4
tof a18 c31
tof a0 c22
tof a22 c31
tof a20 c31
tof b29 c31
tof b17 c31
tof b4 b7
tof c22 a13
tof b4 c22
tof c31 c22
tof b24 b4
tof b11 b4
tof c18 c31
tof a2 c31
tof b18 a28
tof b18 b4
tof c23 b4
tof c31 b18
tof c23 b18
tof c23 a16
tof c18 c31
tof a2 c31
tof a14 a17
tof c0 a17
tof c3 c5
tof a22 a18
tof a20 a18
tof b29 a18
tof b17 a18
tof c31 a16
tof a18 c31
tof a17 c31
tof a17 c5
tof b12 a21
tof c18 a21
tof a2 a21
tof c3 c20
tof c3 a31
tof a2 c18
tof a8 c23
tof c11 c23
tof c18 b12
tof c3 b12
tof c3 c23
tof c18 a19
tof c3 a19
tof b0 b16
tof a24 c13
tof c3 a24
tof c18 b6
tof c3 b0
tof c3 c16
tof c3 b6
tof c3 a11
tof c3 c14
tof c3 a9
tof c18 a10
tof c3 a10
tof c3 a23
tof c18 b20
tof c3 b20
tof b27 a6
tof c18 a26
tof c3 c7
tof c3 a26
tof a1 b19
tof c18 b31
tof c8 c25
tof c3 b27
tof c25 b27
tof b9 b31
tof c25 b31
tof b19 b9
tof c3 b9
tof b11 b19
tof c17 b19
tof b24 b19
tof c3 b19
tof c3 a1
tof b24 b13
tof c3 b24
tof a0 a2
tof c18 b11
tof a2 c18
tof a12 a18
tof a17 a2
tof a22 a18
tof a20 a18
tof b29 a18
tof a0 a2
tof b17 a2
tof b21 a18
tof a0 a18
tof b17 a18
tof a0 b21
tof a0 a12
tof a0 b10
tof a0 a3
tof a14 a17
tof c0 a17
tof a0 b25
tof a0 a7
tof a0 a17
tof a22 c0
tof a8 c0
tof c11 c0
tof a20 c0
tof b29 c0
tof b17 c0
tof a0 a14
tof c3 c0
tof a0 c0
tof a29 c3
tof a22 b3
tof a8 a29
tof c11 a29
tof a20 b3
tof b29 b3
tof a0 a29
tof a0 b5
tof a25 b23
tof a20 a22
tof b29 a22
tof c11 a0
tof c11 a22
tof c8 a22
tof c8 b23
tof a20 a8
tof c11 a8
tof a20 c1
tof b29 c1
tof c8 c25
tof c1 c8
tof a30 c1
tof b1 a20
tof b1 b29
tof c15 b1
tof a30 b17
tof a30 b1
tof a4 a30
tof c9 a4
tof c9 c15
tof c17 c9
tof c4 c17
tof c10 c4
tof b15 c10
tof c19 b15
tof c6 c19
tof b30 c6
tof c6 b30
tof b30 c12
tof c19 c12
tof c19 b30
tof c19 c6
tof b15 b30
tof c10 b15
tof c4 b15
tof c4 c10
tof b30 b26
tof b15 c12
tof c9 c17
tof c17 c12
tof c9 c26
tof c9 a27
tof c17 b15
tof c17 c10
tof c17 c4
tof c15 c10
tof a4 c15
tof c10 b26
tof a4 c12
tof c10 b30
tof a4 c26
tof a4 a27
tof a4 b15
tof a4 c4
tof a4 c17
tof a4 c9
tof a30 c15
tof b1 c15
tof b1 b26
tof a30 c12
tof a30 c26
tof a30 a27
tof a30 b15
tof a30 c4
tof a30 c17
tof a30 c9
tof a30 a4
tof b29 b26
tof a20 b1
tof a20 b29
tof c1 b26
tof c1 b1
tof c1 c12
tof b1 b30
tof c1 c26
tof c1 a27
tof c1 b15
tof b1 c10
tof c1 c4
tof c1 c17
tof c1 b17
tof c1 c9
tof c1 a4
tof c1 a30
tof c8 c10
tof c25 c10
tof c10 b26
tof c8 c12
tof c8 a27
tof c8 b15
tof c8 a4
tof c8 b1
tof c25 c15
tof c11 b1
tof a8 c10
tof a8 b1
tof a25 a8
tof c10 b26
tof a8 b30
tof c11 a27
tof c11 b28
tof c11 b15
tof a8 a20
tof a8 b29
tof c11 c8
tof b23 b15
tof a22 c8
tof a22 b23
tof a0 b15
tof a0 b23
tof a0 a22
tof c8 b26
tof a22 c12
tof c8 b30
tof c8 c26
tof b15 c6
tof a0 a27
tof b15 c19
tof a0 b28
tof c8 c4
tof c8 c17
tof c8 b17
tof c8 c9
tof a0 b1
tof c8 a30
tof c8 c1
tof b5 c10
tof a29 c10
tof a29 b26
tof c3 a29
tof c0 a29
tof a14 a29
tof a14 c0
tof c3 b26
tof a29 c12
tof a29 b3
tof a29 c26
tof a29 c4
tof a29 c17
tof a29 b17
tof a29 c9
tof a29 b1
tof a29 a30
tof a29 c1
tof a29 a8
tof a29 b23
tof a29 a22
tof a29 a0
tof a17 b23
tof b25 b23
tof a17 c12
tof a17 b3
tof a17 c26
tof b23 c6
tof b25 a27
tof b23 c19
tof b23 b15
tof b25 c2
tof a17 c4
tof a17 b17
tof a17 c9
tof a17 b1
tof a17 a30
tof a17 c1
tof a17 a8
tof b25 c8
tof a17 a22
tof a17 a0
tof a17 a29
tof a17 c0
tof b10 a3
tof b10 c2
tof b10 c4
tof b10 c9
tof b10 b2
tof b10 a4
tof a12 b30
tof b21 a30
tof b21 b30
tof b21 a12
tof a18 b30
tof a18 a12
tof a2 a30
tof a2 b30
tof a2 b26
tof a2 c12
tof a2 b3
tof a2 c26
tof a2 c6
tof a2 c19
tof a12 b28
tof a2 b15
tof a2 c4
tof a2 c17
tof a2 c9
tof b21 b2
tof b21 a4
tof a12 b1
tof b30 a20
tof b30 b29
tof b30 a8
tof a2 c8
tof a2 b23
tof a2 a22
tof a12 a0
tof a12 a29
tof a12 c0
tof b21 a3
tof c18 a22
tof b11 a22
tof b24 a22
tof b24 b11
tof b11 a15
tof c18 b26
tof c18 c12
tof c18 b3
tof b11 c26
tof c18 c6
tof a22 a27
tof c18 c19
tof c18 b15
tof b11 c2
tof c18 c4
tof c18 c17
tof c18 c9
tof a22 a4
tof a22 b1
tof c18 a30
tof b24 c1
tof a22 c15
tof c18 a20
tof c18 b29
tof c18 a8
tof c18 c8
tof b11 b8
tof c18 b23
tof b11 c11
tof c18 b30
tof c18 a2
tof a1 b13
tof b19 c26
tof b19 a27
tof b9 c26
tof b27 c26
tof b9 a27
tof b9 b19
tof a6 b8
tof a6 b27
tof a26 b8
tof c7 a6
tof c7 c24
tof b27 c26
tof a26 b15
tof a23 b20
tof b20 a15
tof b20 c12
tof a10 b28
tof a10 c2
tof a23 b29
tof b20 a26
tof a11 a15
tof c14 b28
tof a11 c10
tof a11 c15
tof a11 a22
tof a11 b31
tof a11 b27
tof a11 a10
tof b0 c10
tof b6 c17
tof b0 c15
tof b0 b8
tof b6 c11
tof b0 b31
tof b0 b27
tof b16 c25
tof b16 b0
tof a24 b16
tof c13 c25
tof c13 b16
tof c13 a24
tof b0 c24
tof b0 c10
tof c13 b19
tof c13 c9
tof b0 c1
tof b0 c15
tof c13 a20
tof b16 b8
tof b0 b31
tof b0 b27
tof b0 b6
tof c23 c11
tof b12 c11
tof b12 a19
tof c23 b1
tof c23 c15
tof c23 a0
tof c23 b30
tof c23 c0
tof c23 c13
tof a21 b30
tof a31 b30
tof a31 a4
tof c20 b29
tof a21 b23
tof a21 c11
tof a21 a25
tof a21 a19
tof a21 b12
tof c5 c25
tof c31 c25
tof c31 c5
tof c31 b17
tof a16 c25
tof a16 b17
tof c31 b26
tof c5 c10
tof c31 b1
tof c31 c1
tof c5 c15
tof c31 a20
tof c31 b29
tof c31 c8
tof c31 a0
tof a16 a25
tof c31 b30
tof c31 a29
tof c31 c0
tof c31 a2
tof c5 b31
tof c5 b27
tof b18 b11
tof b4 b11
tof b4 a15
tof b18 b26
tof b18 b3
tof b11 c26
tof b18 c6
tof b11 a27
tof b18 c19
tof b18 b28
tof b11 b15
tof b4 c2
tof b18 c4
tof b11 c17
tof b4 b19
tof b18 c9
tof b4 a4
tof b4 b1
tof b18 a30
tof b4 c15
tof b18 a20
tof b18 b29
tof b18 a8
tof b18 c8
tof b4 b8
tof b4 a22
tof b11 c25
tof b4 c11
tof b11 a0
tof b18 a25
tof a28 b30
tof a28 c0
tof b18 a2
tof b11 b13
tof b11 b24
tof b11 b9
tof b11 a1
tof b18 b31
tof b11 b27
tof b11 a6
tof b11 c7
tof b11 a26
tof b18 b20
tof b11 a23
tof b11 a9
tof b18 a10
tof b11 a11
tof b11 c14
tof b11 c16
tof b18 b6
tof b11 b0
tof b11 b16
tof b11 a24
tof b11 c13
tof b11 c23
tof b18 a19
tof b11 b12
tof b18 a21
tof b11 c20
tof b11 a31
tof b11 c5
tof c22 c12
tof a13 c12
tof b7 c12
tof b7 a13
tof a13 b3
tof c22 b1
tof b7 b14
tof b7 c15
tof b7 a20
tof c22 b23
tof c22 b30
tof c22 a29
tof c22 c0
tof c22 b5
tof c22 a2
tof c22 a17
tof c22 a14
tof c22 b25
tof c22 a7
tof c22 b10
tof c22 a3
tof c22 b21
tof c22 a18
tof c22 a12
tof c22 c18
tof c22 a28
tof c21 a5
tof c21 b14
tof c21 c15
tof c21 a20
tof b22 b23
T* c3
T* b11
T* c0
T* b4
T* b18
T* b7
T c21
T* c22
T a13
T a28
T* a16
T* c31
T b17
T* c5
T* a31
T* c20
T* a21
T* b12
T a19
T* c23
T c13
T* a24
T b16
T* b0
T b6
T* c16
T* c14
T* a11
T a10
T* a9
T* a23
T* b20
T a26
T* c7
T a6
T b27
T b31
T* a1
T b9
T* b24
T b13
T* c18
T* a12
T a18
T* b21
T a3
T* b10
T* a7
T* b25
T* a14
T* a17
T* a2
T* b22
T* b5
T* a5
T* a29
T b30
T* a25
T* a0
T c11
T c25
T* a22
T* b23
T b8
T* c8
T* a8
T b29
T a20
T c15
T c1
T* a30
T* b14
T* b1
T a4
T* b2
T* c9
T* b19
T* c17
T* c4
T c10
T c2
T* b15
T* b28
T* c19
T* a27
T* c6
T* c26
T* b3
T* c12
T* c24
T* b26
T* a15
tof a13 c22
tof a16 c0
tof a31 c0
tof b12 b11
tof c23 b11
tof b0 b11
tof b6 b11
tof b30 c0
tof a25 c22
tof a0 b11
tof c11 b11
tof c25 b11
tof a22 b11
tof a20 b11
tof c15 b11
tof b3 c22
tof b11 c3
tof c0 c3
tof c0 b11
tof c22 c0
tof c22 b4
tof a16 b7
tof b12 b4
tof c23 b4
tof b0 b4
tof b6 b4
tof c7 b18
tof a25 b7
tof a0 b4
tof c11 b4
tof c25 b4
tof a22 b4
tof a20 b4
tof c15 b4
tof b12 c22
tof b0 c22
tof b6 c22
tof a11 c21
tof a10 c21
tof b5 a13
tof a29 c22
tof a0 c22
tof c11 c22
tof b14 c21
tof b3 a13
tof a16 c21
tof a25 c21
tof a16 c22
tof b25 c22
tof a16 a13
tof b25 a13
tof a25 a13
tof b17 c31
tof a31 a28
tof a19 b12
tof c23 a16
tof a29 a16
tof b30 a28
tof c25 a16
tof a22 a16
tof a20 a16
tof c15 a16
tof c31 a16
tof b12 c31
tof a21 c5
tof a19 a31
tof c23 b17
tof b0 a31
tof b6 a31
tof b22 a31
tof b5 b17
tof a0 a31
tof c11 a31
tof c25 b17
tof a22 b17
tof a20 b17
tof c15 b17
tof b1 b17
tof a29 b17
tof b12 c5
tof b12 a31
tof a29 a31
tof c23 c20
tof b0 a19
tof b6 a19
tof a23 c20
tof a2 c20
tof a29 b12
tof a25 c20
tof a0 a19
tof c11 a19
tof c25 c20
tof a22 c20
tof a8 c20
tof b29 c20
tof a20 c20
tof c15 c20
tof a19 c20
tof b12 a21
tof a19 a21
tof a19 b12
tof a24 b12
tof b0 a24
tof c14 a24
tof c18 c23
tof a29 a24
tof a25 c23
tof c25 c23
tof a22 c23
tof c15 a20
tof a24 a19
tof a24 c23
tof a20 c23
tof a24 c13
tof a20 c13
tof c14 b0
tof a11 a24
tof a6 c7
tof a29 a24
tof b0 a24
tof b0 b16
tof c7 b0
tof a10 c16
tof c7 c14
tof c14 b6
tof a6 c14
tof a26 a9
tof b20 a11
tof b20 a10
tof b10 b27
tof c9 b27
tof b19 b27
tof b20 a23
tof b27 b20
tof b27 a26
tof b9 a1
tof b13 c7
tof a6 c7
tof b24 c7
tof b27 a6
tof a1 b27
tof b24 b27
tof c18 b13
tof b10 b31
tof a2 b13
tof a8 b13
tof b29 b13
tof c9 b31
tof b19 b31
tof a1 b31
tof b9 b31
tof b13 a1
tof b24 b9
tof b10 c18
tof b13 b24
tof c1 b13
tof b10 a12
tof b10 a18
tof b10 b21
tof b25 a7
tof b3 a7
tof b10 a3
tof a17 b10
tof b23 a17
tof a20 a29
tof c15 a29
tof b3 a29
tof a17 b25
tof a29 a17
tof a5 b5
tof a25 b22
tof a8 a2
tof b3 b23
tof b23 a2
tof b29 a2
tof b23 b22
tof b23 b5
tof b29 b5
tof a25 a29
tof a22 c25
tof b23 b30
tof b8 c25
tof a8 c8
tof b29 c8
tof c15 c25
tof b3 a29
tof a29 a5
tof c25 a5
tof c25 a29
tof c8 a29
tof c25 b30
tof c8 b30
tof c25 a25
tof b23 a25
tof b8 a25
tof a20 a0
tof c15 a25
tof a22 a25
tof c11 a0
tof a22 a0
tof b8 a22
tof c15 c25
tof a22 c25
tof b23 a22
tof a20 a22
tof b3 b23
tof b29 c8
tof c15 b8
tof b3 b8
tof b3 c8
tof a30 b29
tof b3 b29
tof b3 a20
tof a30 c15
tof c9 a30
tof b14 c1
tof b14 a30
tof b19 b14
tof b3 a4
tof c26 b19
tof b19 c9
tof b3 b19
tof b3 c4
tof b3 c10
tof b3 c2
tof b3 b15
tof b3 b28
tof b3 a27
tof c24 b3
tof b3 c24
tof c24 a15
tof c24 b26
tof c26 a15
tof c26 b3
tof c9 b19
tof c9 a15
tof c9 b3
tof c9 c26
tof b1 c24
tof a30 b14
tof b14 a15
tof b14 b3
tof b14 c26
tof c15 c26
tof b29 c15
tof b29 a15
tof c26 c24
tof c26 c12
tof b29 b3
tof b29 b14
tof a20 a27
tof a20 b15
tof b29 a30
tof b29 b1
tof c8 a8
tof c8 c15
tof b8 c15
tof c8 a15
tof c8 c24
tof b8 c12
tof c8 b3
tof c8 b14
tof b8 c6
tof b8 a27
tof b8 c19
tof b8 b28
tof b8 b15
tof c8 a30
tof b8 b19
tof c8 b1
tof b23 a20
tof a22 a20
tof b23 a15
tof a20 c24
tof b23 c12
tof b23 b3
tof a20 c26
tof b23 a8
tof b23 c15
tof b23 c9
tof a20 c6
tof a22 a27
tof a20 c19
tof a20 b28
tof a22 b15
tof b23 c2
tof b23 c10
tof b23 c4
tof b23 c17
tof a20 b19
tof b23 a4
tof a20 b8
tof b23 c8
tof b23 b29
tof a0 a20
tof a25 a0
tof a25 c24
tof a25 c26
tof a25 c25
tof a25 c6
tof a25 a27
tof a25 c19
tof a25 b28
tof a25 b15
tof a25 b19
tof a25 b8
tof a25 a22
tof b30 c24
tof a29 b30
tof a29 c15
tof a5 a29
tof a29 a15
tof c15 c12
tof a29 b3
tof a5 c26
tof a29 a8
tof b30 c25
tof c15 c6
tof c15 a27
tof c15 c19
tof c15 b28
tof c15 b15
tof a29 a30
tof c15 b19
tof a29 b1
tof c15 b8
tof a5 a20
tof c15 c1
tof c15 a0
tof a5 a22
tof a29 b14
tof a29 c8
tof b5 c24
tof b5 b29
tof b22 c24
tof b22 b30
tof a2 b22
tof a2 b5
tof a2 a15
tof a2 c12
tof a2 b3
tof a2 a8
tof b30 c25
tof a2 a27
tof a2 b15
tof a2 c10
tof b29 b1
tof a2 c1
tof a2 c8
tof a2 a25
tof a2 c15
tof a17 c26
tof b25 a17
tof c26 a15
tof c26 c24
tof b25 c12
tof c26 b3
tof c26 a8
tof a17 b30
tof b25 c9
tof a17 c6
tof a17 a27
tof a17 c19
tof a17 b28
tof a17 b15
tof b25 c2
tof b25 c4
tof b25 c17
tof c26 a30
tof a17 b19
tof b25 a4
tof a17 b8
tof c26 a20
tof c26 b29
tof b25 b23
tof c26 b14
tof c26 b5
tof c26 c8
tof c26 a29
tof c26 a5
tof b25 a2
tof c26 a22
tof b10 a15
tof b10 c24
tof b10 c12
tof b10 b3
tof b10 c9
tof b10 c2
tof b10 c4
tof b10 a30
tof a3 b2
tof b10 a4
tof b10 a20
tof b10 b29
tof b10 b23
tof b10 b14
tof b10 b5
tof b10 c8
tof b10 a29
tof b10 a5
tof b10 a2
tof b10 a22
tof b10 c26
tof b10 a8
tof b10 b25
tof b21 a3
tof a12 a3
tof a12 a18
tof b21 b19
tof a3 b2
tof b21 a4
tof b21 b29
tof c18 a15
tof c18 c24
tof c18 c12
tof c18 b3
tof c18 a27
tof c18 b15
tof c18 a20
tof b13 c1
tof c18 b5
tof c18 c8
tof c18 a5
tof c18 a2
tof c18 a22
tof c18 a3
tof c18 c26
tof c18 b25
tof c18 a12
tof c18 a8
tof c18 b21
tof c18 b10
tof c18 b23
tof b9 b13
tof a1 b13
tof b9 c6
tof a1 b24
tof a1 a2
tof b27 a2
tof b27 a1
tof a6 a2
tof c7 a2
tof c7 a1
tof a1 a15
tof a2 b26
tof a1 b3
tof a2 a7
tof a2 b30
tof b27 c6
tof a1 a27
tof a2 b28
tof a2 c2
tof a2 c4
tof a2 b19
tof a2 a4
tof c7 c1
tof a2 a17
tof b27 b24
tof b27 b9
tof a26 a5
tof b20 a5
tof b20 a1
tof b20 a26
tof a23 a5
tof a23 a1
tof b20 a15
tof a5 c12
tof b20 b3
tof a26 a14
tof b20 c6
tof b20 a27
tof a1 b15
tof a23 c10
tof a23 b1
tof a1 c1
tof a23 b22
tof b20 b24
tof a23 a29
tof a23 a25
tof a23 c15
tof b20 a6
tof b20 b27
tof b20 b9
tof a9 c12
tof a11 a9
tof a11 a10
tof a11 b3
tof a9 a14
tof a10 c25
tof a11 c6
tof a11 a27
tof a11 c10
tof a10 a30
tof a11 b1
tof a10 c1
tof a11 b22
tof a11 b24
tof a11 a29
tof a11 a5
tof a11 a25
tof a11 c15
tof a9 a26
tof a11 a23
tof a11 b27
tof a11 b9
tof a11 b20
tof a11 a6
tof c16 c25
tof c14 b28
tof b6 c4
tof b6 a20
tof c14 b13
tof b6 c11
tof b6 a0
tof c16 a10
tof b0 a6
tof b16 b24
tof a24 b24
tof a24 a6
tof b0 b26
tof a24 b3
tof a24 a14
tof b0 a7
tof a24 c25
tof b0 b30
tof a24 c6
tof a24 a27
tof a6 b28
tof a6 b15
tof b0 c2
tof a24 c10
tof b0 b19
tof b0 a4
tof a24 b1
tof b0 a20
tof a24 b22
tof a6 b13
tof b0 a17
tof a24 a29
tof a24 a5
tof a24 a25
tof b0 c11
tof a24 c15
tof b0 a2
tof b0 a0
tof a6 a1
tof a6 c7
tof a6 c14
tof b0 b6
tof a24 a10
tof a24 b27
tof a24 b9
tof a24 b20
tof a24 c16
tof a24 a11
tof a24 a9
tof a24 a26
tof a24 a23
tof c13 a20
tof c13 a6
tof c23 a20
tof c23 a1
tof a19 c23
tof a19 c13
tof a19 b26
tof c23 c24
tof a1 c12
tof a19 a7
tof a19 b30
tof a6 a27
tof c13 c19
tof a19 b28
tof a19 b15
tof a19 c2
tof a1 c10
tof a19 c4
tof c13 a30
tof a19 b19
tof a19 a4
tof a1 c1
tof a1 b22
tof a19 a17
tof a19 b24
tof c23 b5
tof c23 c8
tof a1 a29
tof c23 a5
tof a1 a25
tof a1 c15
tof a19 a2
tof c23 a22
tof c23 c26
tof a19 c7
tof c23 b25
tof c23 a8
tof a19 b16
tof c23 b10
tof c23 b23
tof c23 c18
tof c23 b21
tof c23 a3
tof c23 a12
tof c23 a18
tof c13 b20
tof a19 b0
tof b12 a7
tof b12 a29
tof a21 a7
tof a21 b5
tof c20 b5
tof c20 a29
tof b12 b26
tof b12 b3
tof b12 a14
tof b12 c25
tof b12 b30
tof b12 c6
tof b12 a27
tof b12 c2
tof b12 c10
tof b12 c4
tof b12 b19
tof b12 a4
tof b12 b1
tof a21 b8
tof b12 b22
tof b12 a17
tof b12 b24
tof c20 c8
tof b12 a25
tof b12 c15
tof b12 a2
tof c20 a1
tof b12 b27
tof b12 b9
tof b12 b20
tof b12 b0
tof b12 a11
tof b12 a9
tof b12 a26
tof b12 a23
tof b12 a24
tof b12 c16
tof b12 a10
tof b12 a19
tof b12 c14
tof b12 b6
tof a31 c24
tof b17 c24
tof c5 a7
tof a31 c25
tof a31 b30
tof a31 b22
tof a16 c31
tof c31 b26
tof c31 c24
tof c31 b30
tof c31 c19
tof c31 b28
tof c31 b15
tof c31 c2
tof c31 c4
tof c31 a30
tof c31 a4
tof c31 a17
tof c31 a29
tof c31 a5
tof c31 c5
tof c31 a2
tof c31 a22
tof c31 c26
tof c31 c7
tof c31 b25
tof c31 c20
tof c31 a8
tof c31 b16
tof c31 b10
tof c31 b23
tof c31 c18
tof c31 b21
tof c31 a3
tof c31 a12
tof c31 a18
tof c31 c23
tof c31 b20
tof c31 c13
tof c31 b0
tof c31 a19
tof c31 b24
tof c22 a13
tof c22 b26
tof c22 c12
tof c21 a30
tof a13 b1
tof a13 b17
tof a13 b29
tof c22 a2
tof b7 a30
tof b7 c21
tof c0 b4
tof b11 b4
tof b11 b26
tof b11 b30
tof c3 c10
T* c0
T* b16
T* c7
T* b3
T c24
T* a16
T b22
T* a21
T c5
T* c31
T a1
T* a0
T a20
T* c15
T* b24
T* b12
T b6
T* c14
T a19
T* a10
T c16
T* a24
T* a23
T* a26
T a9
T* a11
T* b0
T* c13
T a6
T* b14
T b20
T* b9
T b31
T b27
T* c23
T a18
T* a12
T a3
T* b21
T* c18
T* b23
T c22
T* b10
T* b11
T* a8
T c20
T* b25
T* c3
T* c26
T* b7
T* a22
T* a28
T* a2
T* a13
T* c11
T* a25
T a5
T* a29
T* c8
T b5
T* a31
T* a17
T b13
T* b29
T* c21
T c1
T* b17
T* b8
T* b1
T* a4
T* b2
T b19
T a30
T* c17
T* c4
T* c10
T* c2
T b15
T* b28
T* c19
T a27
T* c6
T* c9
T* b30
T* c25
T* a7
T* a14
T* b4
T* c12
T* b18
T* b26
T* a15
tof c24 c0
tof b24 a21
tof a10 c5
tof a23 c0
tof c22 c0
tof b11 c0
tof b17 c0
tof b8 c0
tof b1 c0
tof b30 c0
tof c25 c5
tof a21 c0
tof c7 b16
tof a21 c7
tof c5 c7
tof b22 a16
tof a0 a16
tof b24 a21
tof a10 a16
tof a23 c24
tof a11 a21
tof b0 a21
tof c23 b3
tof a12 a16
tof b23 a21
tof b11 c24
tof c11 a16
tof b17 c24
tof b8 a21
tof b1 c24
tof b30 c24
tof c25 a16
tof c24 b3
tof a21 c24
tof a21 a16
tof c31 c5
tof a0 b22
tof a11 b22
tof b0 b22
tof c23 a21
tof a18 a21
tof b23 c5
tof c11 b22
tof b8 c5
tof c25 a10
tof a10 b22
tof a10 c5
tof a20 a1
tof a11 c15
tof b0 c15
tof c13 c15
tof b9 c15
tof b31 c15
tof c23 a0
tof a18 a0
tof b21 c15
tof c21 c15
tof c1 c15
tof b19 c15
tof a30 c15
tof c15 c31
tof a0 a1
tof c15 a1
tof b24 a0
tof b12 c15
tof b6 c15
tof b0 a11
tof c13 c15
tof b9 c15
tof b31 c15
tof a18 c23
tof b21 c15
tof c11 a11
tof a25 a20
tof c21 c15
tof c1 c15
tof b19 c15
tof a30 c15
tof a11 a20
tof c23 c15
tof a11 b24
tof c23 b24
tof c16 a10
tof c13 b6
tof b9 b6
tof b31 b6
tof c23 a11
tof a12 b6
tof b21 b6
tof c11 a11
tof c21 b6
tof c1 b6
tof b19 b6
tof a30 b6
tof c25 a10
tof a7 b6
tof c14 b12
tof a19 b12
tof a11 b12
tof c14 b6
tof a19 b6
tof a10 c14
tof a11 c14
tof a23 c16
tof a11 a19
tof c23 c16
tof a10 a19
tof c16 a10
tof a9 a24
tof c23 a23
tof a14 b21
tof a26 a24
tof a11 a24
tof a11 a23
tof a11 a26
tof b21 a26
tof c13 b0
tof b21 a9
tof a11 a9
tof b0 a11
tof b9 b0
tof b9 c13
tof c23 b20
tof b21 a12
tof b19 a12
tof a30 a12
tof a7 a12
tof a14 a12
tof a6 c13
tof b14 c13
tof b14 a6
tof a12 a6
tof b20 b14
tof b27 b31
tof c23 b31
tof a22 a12
tof b9 b20
tof b31 b9
tof a12 b31
tof a12 a18
tof a3 a18
tof b21 a18
tof c18 c23
tof a22 a18
tof c21 b27
tof c1 b27
tof b19 a18
tof a30 a18
tof a7 a18
tof a14 a18
tof a22 a12
tof c8 b23
tof b5 b23
tof b8 b23
tof b19 a12
tof a30 a12
tof a7 a3
tof a14 b21
tof a3 a12
tof b21 a12
tof c18 a3
tof b23 a3
tof c18 b21
tof a29 b21
tof c8 c22
tof b5 c22
tof b8 c22
tof c25 a31
tof a31 c18
tof a31 b23
tof a31 c22
tof b30 b11
tof a31 b10
tof a31 b11
tof a31 a8
tof a31 c20
tof a31 c3
tof a25 a22
tof a17 a22
tof a31 c26
tof a31 b7
tof a31 a22
tof a31 a28
tof a31 a2
tof a17 a25
tof a5 c11
tof b5 c8
tof b30 b5
tof c25 a31
tof c25 b13
tof b19 b29
tof a30 b29
tof c25 b29
tof a7 b29
tof b19 b8
tof a30 b8
tof c17 b8
tof c25 b8
tof b1 b17
tof a30 b19
tof c17 b19
tof c9 b19
tof c25 b2
tof a7 b2
tof a7 b19
tof b28 c17
tof c25 c17
tof c25 c4
tof c25 c6
tof c19 b28
tof c6 c19
tof c25 c9
tof a7 c9
tof c9 c6
tof a15 c12
tof a14 b26
tof a14 c12
tof a7 a14
tof c25 c12
tof c25 a14
tof c25 b18
tof c25 a15
tof c6 a14
tof b30 b4
tof b28 c19
tof c19 a14
tof c19 c6
tof c17 a14
tof c17 c6
tof c17 c19
tof c17 b28
tof b19 a14
tof b19 c6
tof b19 c9
tof b17 b4
tof b8 c9
tof b8 b19
tof a31 b13
tof a31 c12
tof a31 b18
tof a31 a14
tof a31 a15
tof a31 c25
tof a31 b19
tof a31 b28
tof a31 c17
tof a31 c4
tof a31 b8
tof a31 b2
tof a31 a4
tof a31 b29
tof c8 b8
tof c8 b5
tof a29 b8
tof a29 b26
tof a29 c12
tof c8 c9
tof c8 b19
tof b8 c19
tof b8 b28
tof b8 c17
tof a29 c4
tof b5 b2
tof a29 a4
tof a29 b1
tof a29 c6
tof a5 b8
tof a25 b8
tof c11 b8
tof c11 a5
tof a25 b18
tof a25 a14
tof a5 b30
tof a25 a17
tof a25 b19
tof a25 c19
tof a25 c10
tof a5 a7
tof a5 c4
tof a25 b29
tof a25 c6
tof a22 b29
tof b7 b29
tof a22 b18
tof a22 a14
tof b7 c25
tof a22 a17
tof a22 b19
tof a22 c19
tof a22 c10
tof a22 b8
tof a22 c6
tof a22 a5
tof b25 c12
tof b25 a15
tof b25 a17
tof c3 c10
tof b11 b4
tof b11 b30
tof b11 b2
tof a8 c20
tof b11 b5
tof b23 c6
tof b23 c22
tof c18 b23
tof c22 b26
tof c18 c12
tof c18 a15
tof c18 b4
tof c18 b30
tof c18 a17
tof b23 b25
tof c6 b19
tof c6 c19
tof c6 b28
tof c6 c17
tof b23 a7
tof c18 c4
tof c6 b8
tof b23 b2
tof c18 a4
tof c18 b29
tof c18 b13
tof c18 a5
tof c18 a22
tof c18 b5
tof c18 a8
tof c18 b10
tof b23 c8
tof c18 b11
tof c18 a31
tof c18 a2
tof b23 c9
tof c18 a28
tof b23 a13
tof c18 b7
tof c18 c3
tof c18 c26
tof b21 c6
tof a3 c6
tof a12 c6
tof a12 a3
tof b21 b26
tof b21 c12
tof c6 b18
tof c6 a14
tof a3 b25
tof b21 b19
tof c6 c10
tof a3 a7
tof b21 c4
tof a3 b2
tof b21 a4
tof b21 b1
tof c6 b29
tof b21 a29
tof a12 b5
tof a18 b5
tof c23 b13
tof c23 b5
tof b27 b13
tof c23 b26
tof c23 a15
tof c23 b4
tof c23 b30
tof c23 a17
tof c23 b19
tof c23 c19
tof c23 a27
tof c23 b28
tof c23 b15
tof c23 c2
tof c23 c4
tof b5 b2
tof c23 b1
tof b27 c1
tof b27 c21
tof c23 b29
tof b27 a25
tof c23 a5
tof c23 a29
tof c23 a22
tof c23 a3
tof b27 c11
tof a18 a12
tof c23 c8
tof c23 b11
tof c23 a31
tof c23 a2
tof c23 a28
tof c23 a13
tof c23 b23
tof c23 b7
tof c23 c3
tof c23 c26
tof c23 c18
tof c23 a8
tof c23 b10
tof c23 c9
tof c23 c22
tof b9 b13
tof b9 b31
tof b20 b13
tof b20 b18
tof b20 a15
tof b20 c19
tof b31 b28
tof b31 c17
tof b9 c1
tof b9 c21
tof b9 a25
tof b31 a5
tof b9 c11
tof b9 b27
tof b14 b18
tof b14 a15
tof b14 b13
tof a6 b18
tof a6 b13
tof c13 a15
tof c13 b13
tof c13 a6
tof a15 c12
tof a6 b19
tof b14 c19
tof a6 b28
tof a6 c17
tof a6 c10
tof a6 a30
tof a6 c1
tof a6 c6
tof a6 a25
tof a6 a5
tof a6 b31
tof a6 c11
tof b14 b20
tof a6 b27
tof b0 b18
tof a11 b0
tof b0 b19
tof b0 c19
tof a11 b28
tof a11 c17
tof b0 c10
tof b0 a30
tof b0 c1
tof b0 b13
tof b0 c6
tof b0 a25
tof a11 a5
tof a11 b31
tof b0 c11
tof b0 b27
tof b0 a6
tof b0 c13
tof b0 b20
tof a26 a9
tof a24 a9
tof a26 b26
tof a26 c12
tof a26 a14
tof a23 b4
tof a23 c25
tof a23 a4
tof a23 b1
tof a23 c11
tof a23 a31
tof a23 b17
tof a23 c18
tof a10 c16
tof a10 c25
tof c16 c2
tof a10 a4
tof a19 b13
tof c16 c11
tof a10 a31
tof a10 c18
tof a10 a23
tof c14 b13
tof c14 a19
tof b6 b13
tof b12 a19
tof b12 b6
tof b6 a14
tof b6 b25
tof b6 a30
tof b6 c1
tof b6 a25
tof b6 a3
tof b6 b27
tof c14 c16
tof b24 a25
tof b24 a22
tof b24 b6
tof c15 a25
tof c15 b6
tof a20 a25
tof a20 a22
tof c15 a14
tof b24 b30
tof a22 a17
tof c15 b25
tof b24 a7
tof b24 c4
tof b24 b8
tof c15 a30
tof c15 c1
tof c15 b13
tof a22 c6
tof a20 a5
tof a22 b31
tof c15 a3
tof b6 c11
tof b24 c8
tof b24 b11
tof b24 a31
tof b24 a2
tof b24 b17
tof b24 a28
tof b24 a13
tof b24 b23
tof b24 b7
tof b24 c3
tof b24 c26
tof b24 c18
tof b24 a8
tof b24 c20
tof b24 b10
tof b24 c9
tof b24 c22
tof b24 c23
tof b24 a26
tof b24 a29
tof b24 a18
tof b24 a12
tof a0 a17
tof a0 b6
tof a1 a17
tof c31 a17
tof c31 a1
tof c31 b6
tof c31 a14
tof a17 a15
tof a0 b30
tof c31 b25
tof c31 a30
tof c31 c21
tof a0 c6
tof a0 a25
tof a0 b31
tof a0 a22
tof c31 a3
tof a0 c11
tof a0 c8
tof a0 b11
tof a0 a31
tof a0 a2
tof a0 b17
tof b6 a6
tof a0 a28
tof a0 a13
tof a0 b23
tof a0 b7
tof a0 c3
tof a0 c26
tof a0 c18
tof a0 a8
tof a0 c20
tof a0 b10
tof a0 c9
tof a0 c22
tof a0 c23
tof a0 a26
tof a0 a29
tof c31 b9
tof a0 a18
tof a0 a12
tof a0 b24
tof c5 a14
tof a21 a14
tof a14 b26
tof a21 b4
tof a21 c25
tof a21 b30
tof a21 a17
tof c5 b25
tof a21 a27
tof a21 c17
tof a21 b15
tof a21 c2
tof a21 c10
tof a21 a7
tof a21 b8
tof a21 a30
tof a21 a4
tof a21 b1
tof a21 c21
tof a21 b29
tof a21 a22
tof a21 a3
tof b22 a20
tof a21 c8
tof a21 b11
tof a21 a2
tof a21 a6
tof a21 a28
tof a21 a13
tof a21 b23
tof a21 b7
tof a21 c3
tof a21 c26
tof a21 a8
tof a21 b10
tof a21 c9
tof a21 c22
tof a21 c23
tof a21 a26
tof a21 a29
tof c5 b6
tof a21 b9
tof a21 a18
tof a21 a12
tof a21 b0
tof a21 b14
tof a21 c13
tof a21 b20
tof a21 a11
tof a21 a24
tof a21 a9
tof a21 a10
tof a21 a23
tof a21 c14
tof a21 c16
tof a21 b12
tof a21 a19
tof a21 c15
tof a21 b27
tof a21 a0
tof a21 a1
tof c24 a16
tof c24 c12
tof c24 b18
tof c24 a14
tof c24 a17
tof c24 b25
tof c24 b19
tof c24 c19
tof c24 a27
tof c24 b28
tof c24 b15
tof c24 c2
tof c24 c4
tof c24 a30
tof c24 c1
tof c24 b29
tof c24 c6
tof c24 a25
tof c24 b31
tof c24 a22
tof c24 c11
tof c24 b22
tof c24 c20
tof c24 a26
tof c24 b24
tof c24 c31
tof c24 b14
tof c24 a11
tof c24 a10
tof c24 b27
tof c24 a0
tof c24 a1
tof c24 a21
tof b16 c7
tof c0 b16
T* c0
T* b16
T c7
T b3
T c24
T* b9
T* a21
T c5
T a1
T a0
T* b27
T c15
T* a19
T b12
T* c16
T c14
T* a23
T a10
T* a9
T a24
T a11
T* b20
T c13
T* b14
T* b0
T c31
P b24
T b24
T* a12
T a18
T* a16
T b6
T* a29
T a26
T* c23
T c22
T* c9
T* b10
T* c20
T* a8
T* c18
T* c26
T* c3
T* b7
T* b23
T* a13
T* a28
T* a6
T* b17
T* a2
T* a31
T* b11
T* c8
T* b22
T* a20
T c11
T* b21
T b5
T* a3
T* a22
T* b31
T a5
T* a25
T* c6
T b13
T b29
T* c21
T* c1
T* b1
T* a4
T* b2
T* a30
T* b8
T c4
T* a7
T* c10
T* c2
T* b15
T* c17
T b28
T* a27
T c19
T b19
T* b25
T* a17
T* b30
T* c25
T* b4
T* a15
T* a14
T* b18
T* c12
T* b26
tof b3 c7
tof c24 c7
tof c5 c7
tof a0 c0
tof a23 c0
tof a11 c7
tof c13 b20
tof a12 c7
tof b7 c0
tof a31 c7
tof a3 b23
tof a5 c0
tof c6 c7
tof c25 c0
tof c12 b20
tof b20 c0
tof b24 c0
tof b31 c0
tof b20 b16
tof b24 b16
tof b23 b16
tof b24 c7
tof b23 c7
tof b31 c7
tof a11 c24
tof b24 b3
tof a12 b3
tof b31 c24
tof c6 c24
tof c24 b3
tof b27 b3
tof b9 c24
tof b27 c24
tof a21 b9
tof b27 b9
tof c15 a1
tof b24 c5
tof b23 c5
tof a22 a1
tof a25 a1
tof b25 c5
tof a17 c5
tof b27 a21
tof b27 a1
tof a9 c15
tof b24 a0
tof b6 a0
tof b7 a23
tof a5 a0
tof a25 c15
tof a7 a0
tof c25 a23
tof a14 a0
tof a23 a0
tof b31 a0
tof c15 b27
tof a23 b27
tof b31 b27
tof c23 c15
tof b31 c15
tof a23 c14
tof b24 b12
tof b7 a10
tof b22 b12
tof a20 b12
tof c25 a10
tof c16 a19
tof c14 a19
tof c16 b12
tof c14 b12
tof a10 c16
tof b24 a23
tof b22 c14
tof a20 c14
tof b31 a9
tof c6 a9
tof a23 c14
tof a10 c14
tof a9 a23
tof a9 a10
tof b20 a11
tof c13 a11
tof b0 a9
tof b31 a24
tof c12 a11
tof b24 a9
tof b24 a24
tof b24 b14
tof a20 b22
tof a25 b14
tof c6 b14
tof c21 b14
tof c1 b14
tof c12 c13
tof c13 b20
tof b0 b20
tof b0 c13
tof b22 c13
tof b0 b14
tof c22 c23
tof b10 b0
tof a25 c31
tof c6 c31
tof c21 c31
tof c1 c31
tof a17 b0
tof b24 b0
tof b22 b0
tof b24 c31
tof c23 b24
tof b22 b24
tof b6 a16
tof b7 a16
tof b22 a12
tof a14 a16
tof a18 a12
tof c23 a12
tof c23 a18
tof c23 a16
tof c23 b6
tof b21 b22
tof a14 b6
tof a7 b6
tof b22 a29
tof a7 a29
tof b22 a26
tof b7 c18
tof b21 b22
tof c18 c23
tof c18 c22
tof b22 c22
tof b22 c9
tof c26 a8
tof b22 c18
tof b25 b10
tof c18 b10
tof c18 c20
tof a6 c18
tof a31 c18
tof b22 c18
tof b22 c26
tof b22 c3
tof a6 b7
tof a31 b7
tof b22 b7
tof b22 b23
tof b22 a13
tof a31 a6
tof b25 a6
tof b22 a28
tof b22 b17
tof b25 a31
tof b22 a2
tof b22 a31
tof b22 b11
tof c6 a3
tof b22 c8
tof a3 b22
tof b25 b22
tof b25 a20
tof b31 c11
tof a5 c11
tof a7 b21
tof a17 c11
tof b25 b21
tof b25 b5
tof a5 b31
tof c6 a3
tof b13 a25
tof b8 a22
tof b31 a3
tof a25 a3
tof b31 a22
tof a25 a22
tof b25 a22
tof b25 b31
tof c21 b13
tof c1 b13
tof a4 a5
tof b25 a30
tof a25 a5
tof c6 a25
tof b13 a25
tof a30 c6
tof c1 b13
tof a7 b29
tof b25 c21
tof a30 c1
tof b25 b1
tof a7 b1
tof a7 a4
tof b25 b2
tof b19 a7
tof b25 a7
tof b25 b28
tof b25 c19
tof b26 a14
tof b26 c12
tof c12 b26
tof a15 b18
tof a14 c12
tof b30 c25
tof b30 b26
tof a17 a15
tof b25 a17
tof a15 b18
tof b25 c12
tof b25 b26
tof b25 a14
tof b25 c25
tof b28 c19
tof a7 b19
tof a30 b26
tof a30 a14
tof a30 c27
tof a30 a27
tof a30 b15
tof c1 b26
tof c1 a14
tof c1 b25
tof c1 c27
tof c1 a27
tof c1 b15
tof c1 a17
tof c1 a30
tof c21 a15
tof b13 b26
tof b29 c10
tof c6 b25
tof a25 b25
tof a25 b26
tof a25 a14
tof a25 a27
tof a25 b15
tof a25 a17
tof a25 c1
tof a25 a30
tof b31 b13
tof a3 a22
tof a3 b13
tof b13 a15
tof a3 b26
tof b13 a14
tof b31 c25
tof b13 c21
tof b13 b25
tof b13 c27
tof a22 a7
tof b13 a27
tof b13 b15
tof a22 b8
tof b13 a17
tof b13 c1
tof a3 a5
tof b31 b30
tof b21 a22
tof b21 a4
tof b21 b1
tof b5 b30
tof b22 a15
tof b22 b26
tof b22 a14
tof b22 c21
tof b22 c27
tof b22 a7
tof b22 a27
tof b22 b15
tof b22 b8
tof b22 a22
tof b22 c6
tof b22 c1
tof b22 a5
tof b22 b13
tof b22 a3
tof c8 b30
tof a31 a14
tof a31 b2
tof b17 a4
tof a6 a4
tof a6 b18
tof b17 b4
tof a6 c12
tof a6 b19
tof a6 c21
tof a6 a20
tof a6 a7
tof a6 b28
tof a6 a22
tof a6 c1
tof a6 a5
tof a6 a3
tof a6 b21
tof a6 b22
tof a6 b5
tof a6 c11
tof a6 a31
tof a6 b31
tof b7 c25
tof b23 a17
tof b23 c6
tof b7 b29
tof b23 b25
tof c3 b29
tof c18 b29
tof c18 b18
tof c18 c12
tof c18 c25
tof c18 b19
tof c18 c21
tof c18 a20
tof c18 a7
tof c18 b28
tof b29 c10
tof c18 a22
tof c18 c1
tof c18 a5
tof c18 a4
tof c18 a3
tof c18 b21
tof c18 b22
tof c18 b5
tof c18 c11
tof c18 b7
tof c18 b31
tof c18 a6
tof b10 b18
tof c20 c21
tof c20 a20
tof a8 c26
tof b10 c11
tof b10 a6
tof c9 c17
tof c9 c20
tof c22 b28
tof c22 c17
tof c23 c17
tof c23 c20
tof c23 c22
tof c23 c12
tof c23 c25
tof c23 b19
tof c22 c27
tof c23 a7
tof b28 c19
tof c22 a27
tof c22 b15
tof c22 c2
tof c23 a22
tof c23 c1
tof c23 a5
tof c23 a4
tof c23 b29
tof c23 a3
tof c23 b21
tof c23 b22
tof c23 b5
tof c23 b31
tof c23 b10
tof c23 c18
tof a26 b19
tof a29 b19
tof a29 a26
tof a29 b21
tof b6 a26
tof b6 a29
tof b21 a7
tof b21 c2
tof b21 c4
tof a29 a22
tof b21 c1
tof b21 a5
tof a29 a4
tof a29 b1
tof b6 b29
tof a12 a18
tof a18 b2
tof a18 b30
tof a18 b5
tof b24 b10
tof c31 b18
tof b0 b18
tof b0 b10
tof b24 b4
tof b24 c12
tof b10 a15
tof b24 c25
tof b24 b19
tof b24 c19
tof b24 b28
tof b24 c2
tof b24 a26
tof b24 c4
tof b10 a17
tof b24 b1
tof b24 a3
tof b24 b22
tof b24 b5
tof b24 a29
tof b0 c11
tof b24 a12
tof b24 b31
tof b24 b6
tof b24 c18
tof b24 c23
tof b24 a16
tof b24 c20
tof b20 c13
tof b20 b18
tof c13 c12
tof c13 b26
tof b20 a3
tof a24 a17
tof a9 a17
tof a11 b18
tof a9 a15
tof a9 a7
tof a9 a30
tof a9 a3
tof a9 c11
tof a9 b20
tof a9 b10
tof a9 b0
tof a9 b14
tof a23 a10
tof a23 c11
tof c14 c11
tof c14 c13
tof a23 c21
tof a23 c27
tof a23 a7
tof a23 a27
tof a10 b15
tof a23 a22
tof a23 a17
tof a23 c6
tof a23 c1
tof a23 a5
tof a23 b13
tof a23 a3
tof a23 c31
tof a23 b22
tof a23 b10
tof a23 b8
tof a23 b0
tof a23 a25
tof a23 a9
tof a23 a11
tof a23 b20
tof c16 c11
tof b12 c11
tof a19 c11
tof a19 b12
tof c16 c13
tof b12 c2
tof b12 b13
tof c16 c14
tof b27 c15
tof b27 a22
tof a0 a22
tof a0 c12
tof b27 a15
tof a0 a14
tof a0 c13
tof b27 c21
tof b27 c27
tof a22 a7
tof b27 a27
tof b27 a17
tof b27 c6
tof b27 c1
tof b27 a5
tof a0 a4
tof a0 b1
tof b27 a30
tof b27 b13
tof a0 b29
tof b27 a24
tof b27 c31
tof b27 b22
tof a0 a29
tof a0 b6
tof b27 b8
tof a0 a16
tof a0 a26
tof b27 b14
tof b27 a25
tof b27 a11
tof b27 a23
tof c5 a1
tof c5 a15
tof a1 a22
tof c5 a24
tof c5 c11
tof c5 b10
tof c5 b0
tof c24 b9
tof b3 c24
tof b9 a21
tof c0 b16
tof c7 c24
tof c7 b3
tof c0 c13
T* c0
T c13
T* c7
T* b3
T* c24
T* b9
T* a21
T* c5
T* c31
T* a12
T a19
T* a10
T c16
T b27
T* a0
T* a23
T* b20
T a11
T* a9
T* a25
T b14
T* a18
T* b19
T a26
T* b24
T b21
T* c22
T* c9
T c20
T* a6
T b0
T* a8
T* c26
T* b7
T* a16
T c23
T* c3
T* a13
T* b25
T* a28
T* b8
T* b17
T* a31
T c18
T* a2
T* c8
T* b11
T* b23
T* b10
T* b6
T* b31
T* b12
T* c14
T c11
T* a29
T* b5
T* b30
T b22
T* a1
T a24
T a3
T* b29
T* b13
T* a30
T* b1
T a4
T* a5
T* b2
T* c1
T* c6
T a17
T a22
T* c4
T* c15
T* c10
T c2
T* b15
T* c17
T* b28
T* a27
T* c19
T* a7
T c27
T* a20
T* c21
T* b16
T* c25
T* a14
T* b26
T* a15
T* c12
T* b4
T* b18
tof a0 c13
tof a9 c13
tof b19 c7
tof a26 c7
tof b25 c13
tof c18 a31
tof b23 c13
tof b12 c13
tof c14 c13
tof b22 c13
tof a24 c13
tof b13 c13
tof a30 c13
tof c6 c13
tof a17 c13
tof c13 c0
tof a31 c13
tof a21 b9
tof c5 b9
tof c31 b9
tof b21 b24
tof a31 c24
tof b23 b24
tof b22 b24
tof a1 b8
tof a24 b24
tof c1 b24
tof a17 b24
tof c15 c22
tof c22 b3
tof b8 b3
tof b24 c24
tof b8 c24
tof b24 b9
tof c22 b9
tof a0 c31
tof a9 c31
tof a26 b19
tof c22 a21
tof b25 a21
tof b17 b19
tof b23 a21
tof b12 c31
tof b22 a21
tof a24 a21
tof b13 c31
tof a30 c31
tof a4 b19
tof a5 b19
tof b18 c31
tof b24 a21
tof b19 c5
tof b24 c5
tof b19 c31
tof c9 a12
tof c20 a12
tof b23 b25
tof b12 a12
tof c14 a19
tof b22 b25
tof a24 b25
tof b13 a9
tof a30 a9
tof c6 b25
tof a17 b25
tof c21 a12
tof a9 a12
tof b24 a12
tof b25 a12
tof a9 a19
tof b24 a19
tof c11 a19
tof a9 a10
tof b25 a10
tof c11 a10
tof b19 b27
tof a8 a0
tof c26 a0
tof b25 c16
tof c11 b27
tof a9 c16
tof b24 c16
tof b12 c16
tof a9 b27
tof b24 b27
tof a9 a0
tof b12 a0
tof b25 a9
tof b12 a11
tof c11 a9
tof b13 a11
tof a30 a11
tof a9 a23
tof a11 b20
tof a9 a11
tof c9 b14
tof c20 b14
tof b12 b25
tof c11 b25
tof a25 a9
tof b25 a9
tof b25 a25
tof b25 b14
tof c9 a26
tof c20 a26
tof b25 b19
tof b17 b24
tof b12 b24
tof c11 b24
tof a29 a18
tof a4 b24
tof a5 b24
tof b19 a18
tof b24 a18
tof b24 a26
tof a13 b7
tof b23 b21
tof b10 c22
tof b12 b21
tof c11 b21
tof b22 b21
tof a24 b21
tof a4 b17
tof a5 b17
tof c1 b21
tof a17 b21
tof b7 b24
tof b17 b24
tof b7 b21
tof b17 b21
tof b7 c22
tof b0 a6
tof b7 c20
tof a20 c20
tof c20 c9
tof a6 c20
tof b25 c20
tof a13 c23
tof a8 b0
tof c26 b0
tof b7 b0
tof c26 a8
tof b25 a8
tof b7 c26
tof c23 c26
tof b25 c26
tof b8 a16
tof b12 a16
tof a1 a16
tof b13 a16
tof b25 b7
tof b6 b7
tof c23 a16
tof b25 a16
tof b25 c23
tof b6 c23
tof c8 a13
tof b30 a13
tof b25 c3
tof b25 a13
tof b6 a13
tof b6 b25
tof a31 b8
tof b23 b17
tof b12 b17
tof c11 b17
tof b22 b17
tof a1 b8
tof a24 b17
tof a4 b17
tof a5 b17
tof c6 b17
tof a17 b17
tof b6 a28
tof b6 b8
tof b6 b17
tof a1 a31
tof b6 c18
tof a1 c18
tof b6 a2
tof b12 b23
tof c11 b23
tof b5 c8
tof b30 c8
tof b22 b23
tof a24 b23
tof c6 b23
tof a17 b23
tof b26 c8
tof b6 c8
tof b6 b11
tof c11 b31
tof a3 b31
tof a30 b13
tof c15 b10
tof a20 b10
tof b6 b10
tof b12 b6
tof b13 b6
tof b12 b31
tof b2 a1
tof c15 a1
tof a20 a1
tof c14 b12
tof b13 b12
tof a1 c14
tof b13 c11
tof a4 a29
tof a5 a29
tof b26 b5
tof b5 a29
tof b30 b5
tof b29 b30
tof b2 a1
tof c6 a24
tof a17 a24
tof c15 a1
tof a20 a1
tof a24 b22
tof a4 b29
tof a5 b29
tof a5 a4
tof c6 a4
tof c6 c1
tof a22 c1
tof c15 b2
tof a20 b2
tof a20 c1
tof c4 a22
tof a20 a22
tof c10 c6
tof c10 a17
tof a20 c15
tof c15 c4
tof b15 c2
tof a20 c2
tof a27 b15
tof a20 c17
tof b26 a27
tof a20 b28
tof a20 a27
tof a20 c19
tof a15 c21
tof a20 a7
tof a20 c27
tof c21 a20
tof b26 c25
tof c12 b4
tof a20 a15
tof a20 c21
tof a27 b26
tof c2 b15
tof b15 b26
tof b15 a27
tof c15 b26
tof c4 b26
tof c10 b4
tof b26 a27
tof b26 b15
tof b26 c2
tof c6 a17
tof c6 b4
tof a17 b18
tof c6 c10
tof a22 a27
tof a22 b15
tof a22 c2
tof a22 b26
tof a22 c4
tof b2 c12
tof c1 a27
tof c1 b15
tof c1 c2
tof c1 b26
tof c1 c4
tof c1 a22
tof a4 b4
tof a4 c10
tof a4 c6
tof b29 c10
tof b29 c6
tof b29 b1
tof a1 c12
tof b22 b16
tof a1 a14
tof b30 b1
tof b5 b1
tof b5 b30
tof a29 b1
tof a29 b4
tof b30 c10
tof a29 a27
tof b30 c6
tof b5 a4
tof c14 c2
tof b12 c14
tof c14 c12
tof c11 b16
tof c11 a3
tof c14 b2
tof c11 a30
tof c11 b22
tof c11 a24
tof b31 a3
tof b6 a3
tof b6 c14
tof b10 c14
tof b6 c12
tof b6 b16
tof b6 b2
tof b10 c27
tof b6 a7
tof b10 b15
tof c14 c2
tof b10 c1
tof b6 b13
tof b6 b22
tof b6 a24
tof b6 b12
tof b6 c11
tof b10 c15
tof b23 a29
tof c8 a29
tof a29 b4
tof c8 c12
tof c8 c10
tof b23 b16
tof b11 a20
tof a29 a27
tof b23 b15
tof b23 c2
tof b23 b26
tof c8 c6
tof b23 c4
tof b23 a22
tof b23 c1
tof c8 a4
tof b23 b22
tof c8 b30
tof b23 b29
tof b23 a24
tof c8 c25
tof c8 b5
tof a31 c18
tof a31 a14
tof a31 a1
tof a31 b2
tof a31 c1
tof a31 c14
tof a2 a5
tof b17 b4
tof a28 a14
tof b8 a1
tof b8 c1
tof b17 a4
tof b8 a31
tof b17 b29
tof b17 a29
tof b25 c6
tof b25 b30
tof a13 c6
tof a13 b30
tof c3 b30
tof b25 b18
tof a13 c10
tof b25 b16
tof b25 a1
tof b25 c18
tof b25 a20
tof b25 c27
tof b25 c19
tof b25 b15
tof b25 b28
tof b25 c17
tof b25 b26
tof b25 c4
tof b25 a22
tof b25 a5
tof b25 a31
tof b25 b22
tof c3 b29
tof b25 b31
tof b25 a29
tof b25 b11
tof b25 b6
tof b25 c25
tof b25 b5
tof b25 a17
tof b25 b10
tof b25 b12
tof b25 a3
tof b25 b13
tof b25 a28
tof b25 c15
tof b25 a2
tof c23 c6
tof b7 c23
tof b7 b18
tof b7 a14
tof b7 b2
tof b7 a27
tof b7 a7
tof b7 c19
tof b7 b28
tof b7 c17
tof b7 b26
tof b7 c4
tof c23 a31
tof b7 b30
tof b7 b29
tof b7 b31
tof b7 a24
tof b7 a13
tof b7 a29
tof b7 b8
tof b7 c8
tof b7 a17
tof b7 b17
tof b7 c11
tof a8 b18
tof a8 b16
tof c26 c6
tof c26 a31
tof c26 c23
tof a6 b0
tof c20 a6
tof c9 a6
tof c9 c20
tof c9 a20
tof c9 a7
tof c9 c19
tof c9 b28
tof c9 c17
tof c9 c4
tof c9 c21
tof c9 b10
tof c9 a15
tof c9 b7
tof c22 b10
tof b24 b21
tof b24 c22
tof b21 b4
tof b24 b18
tof b24 a14
tof b24 b0
tof b24 b2
tof b24 a20
tof b24 a27
tof c22 c27
tof b10 a7
tof b10 c19
tof c22 b15
tof b10 b28
tof b10 c17
tof c22 c2
tof b24 b26
tof b10 c4
tof c22 c1
tof b24 a16
tof b24 b29
tof b24 b31
tof b24 a24
tof b24 a29
tof b24 c21
tof b24 c8
tof b24 a17
tof b24 a15
tof b24 c11
tof b24 c9
tof b24 b8
tof b24 b17
tof b19 a26
tof b19 a29
tof a18 a29
tof b19 b15
tof b19 b28
tof b19 a4
tof b19 a5
tof a18 b1
tof b19 b29
tof b19 b31
tof b19 b21
tof a25 b14
tof a9 a25
tof b14 a26
tof a9 c14
tof a9 c8
tof b20 a11
tof a11 c19
tof a11 a30
tof a23 b31
tof a0 b18
tof c16 a25
tof a10 a25
tof a10 c17
tof a10 c16
tof c31 b18
tof c5 b18
tof c5 c31
tof a21 b18
tof b3 c24
tof c13 c24
T c13
T* c24
T c7
T* b3
T* a21
T* b18
T* c5
T* a25
T* c12
T* b2
T b20
T* a9
T c8
T b21
T a27
T* c21
T b10
T* a6
T c20
T* a8
T b0
T* c23
T c26
T* c10
T b24
T* c3
T* a28
T* b23
T b17
T* b8
T* a1
T* c18
T* b5
T* a2
T* b22
T* b11
T* c9
T* b25
T b7
T* c15
T c22
T* c11
T* b13
T* a3
T* b12
T* a15
T* a10
T* a19
T* a17
T* c16
T* b19
T* c25
T* a23
T* b27
T* a11
T* b6
T* a18
T* a29
T* a13
T* a24
T b31
T* b29
T* b30
T* a16
T a30
T* b1
T* a31
T* a5
T c14
T a4
T* c1
T* a22
T* c4
T* c6
T* b26
T c2
T* c17
T* b28
T b15
T* c19
T* a7
T* c27
T* a0
T* a20
T* a12
T* c0
T* b14
T* a14
T* b16
T* a26
T* c31
T* b9
T* b4
tof b3 c7
tof c23 c7
tof c10 c7
tof b24 c7
tof b8 c13
tof c15 c24
tof c22 c24
tof c11 c13
tof b27 b13
tof b29 c7
tof b30 c7
tof a31 c7
tof a1 c13
tof b13 c13
tof b13 c24
tof a1 c7
tof c23 b3
tof a1 b8
tof c9 a8
tof b25 a8
tof b7 a8
tof a10 a8
tof a17 a21
tof a31 b3
tof a0 a8
tof b9 b18
tof a21 b3
tof b18 b3
tof b8 a21
tof a8 b18
tof b8 b18
tof c10 c12
tof b24 c12
tof a15 c5
tof c16 a25
tof b19 c5
tof c25 a25
tof a29 c12
tof a13 c12
tof a12 c5
tof c10 a9
tof b24 a9
tof b8 b2
tof c9 b2
tof b25 b2
tof b7 b2
tof a10 a8
tof c25 b20
tof b6 b20
tof a18 a9
tof a29 a9
tof a13 a9
tof a0 a8
tof a8 b2
tof a8 b20
tof a8 a9
tof a8 c8
tof c10 c8
tof b24 c8
tof b25 c9
tof b7 c9
tof c15 a27
tof c22 a27
tof c25 c8
tof a18 c9
tof a29 c9
tof a13 c9
tof b30 b29
tof c4 a27
tof c9 c8
tof c9 b21
tof b29 b21
tof c9 a27
tof b29 a27
tof c20 a6
tof c10 a6
tof b24 a6
tof a18 a6
tof a29 a6
tof a13 a6
tof b14 c25
tof b10 c21
tof a6 c21
tof a6 b10
tof c25 b10
tof b24 b0
tof c9 c20
tof a18 c20
tof a29 c20
tof a8 c20
tof a13 c20
tof a0 a8
tof a13 b0
tof a0 b0
tof b24 c10
tof b23 c3
tof b17 c3
tof a18 c26
tof a29 c26
tof a13 c26
tof c10 c23
tof c9 c23
tof a31 c23
tof c10 c26
tof a31 c26
tof c3 c10
tof c9 c10
tof b23 c3
tof b17 c3
tof b12 b24
tof a31 c9
tof a13 b24
tof a28 c3
tof c9 a28
tof a13 a28
tof a18 b17
tof a29 b17
tof a1 b23
tof a1 b17
tof a1 b8
tof b22 c18
tof a18 c9
tof a29 c9
tof a13 c9
tof a31 c9
tof b11 a1
tof b11 c18
tof c9 c18
tof c9 b5
tof c22 c15
tof b11 a2
tof c9 b22
tof c9 b11
tof c15 b11
tof c15 c9
tof c11 c9
tof c15 b25
tof c11 b25
tof c11 b7
tof b13 c22
tof b12 c11
tof b19 a19
tof b27 c22
tof a19 c15
tof a19 c11
tof b27 b13
tof b12 b13
tof a17 a3
tof a19 b12
tof a17 b12
tof a17 a10
tof a23 c16
tof a11 a15
tof a24 a10
tof a16 a15
tof a30 a15
tof a19 a10
tof c16 a19
tof b6 a17
tof b27 c16
tof b6 c16
tof b27 b19
tof a11 c25
tof b14 c25
tof b27 c25
tof b6 c25
tof b27 a23
tof b6 b27
tof a18 b27
tof a29 a18
tof a16 a11
tof a30 a11
tof a31 a18
tof b6 a11
tof b30 a13
tof a31 b31
tof b26 a24
tof c17 a24
tof a0 a13
tof b31 a29
tof b31 a13
tof a31 b31
tof a5 b29
tof a0 b30
tof b1 b31
tof b30 b29
tof b1 b29
tof a4 a5
tof c4 a22
tof a22 a4
tof b26 c4
tof c2 b26
tof b28 c2
tof b28 c17
tof b15 b28
tof a7 b15
tof a7 c19
tof a26 b9
tof b14 b9
tof a0 b16
tof a0 b4
tof b15 c19
tof b15 a7
tof c19 a12
tof a7 c28
tof c2 c17
tof c2 b28
tof c17 b9
tof b28 a12
tof b28 c28
tof b28 a7
tof b28 b15
tof b28 c19
tof b26 c17
tof c4 b26
tof b26 b9
tof b26 a12
tof b26 c28
tof b26 a7
tof b26 b15
tof b26 c19
tof b26 b28
tof b26 c2
tof a4 a22
tof a22 c0
tof c1 c27
tof c1 c6
tof a5 c0
tof a31 c17
tof a5 a22
tof a31 c6
tof a5 a4
tof b1 a26
tof a30 a26
tof a16 a26
tof a16 a30
tof a26 b9
tof a30 b14
tof b1 b4
tof b1 c0
tof b1 c31
tof b1 a0
tof a30 b15
tof b1 c19
tof b1 b28
tof b1 b26
tof b1 c4
tof b1 a31
tof b1 a4
tof b1 c1
tof b1 a22
tof b29 a4
tof b31 b29
tof b31 b9
tof b31 b4
tof b31 c0
tof b31 c31
tof b31 a26
tof b31 a0
tof b31 c19
tof b31 b28
tof b31 b26
tof b31 c4
tof b31 a31
tof b31 c1
tof b31 a22
tof a24 b9
tof a13 b29
tof a29 b9
tof a29 a13
tof a29 b4
tof a29 c0
tof a29 c31
tof a29 a26
tof a24 c17
tof a29 a0
tof a29 c19
tof a29 b28
tof a29 b26
tof a29 c4
tof a29 a31
tof a13 a4
tof a29 c1
tof b29 a5
tof a29 a22
tof a29 b31
tof a13 b30
tof a18 b9
tof a18 a26
tof b6 a26
tof a11 b9
tof a11 a26
tof a18 b16
tof a11 b14
tof a18 b4
tof a18 c0
tof a11 a12
tof a18 c31
tof a18 a0
tof a11 b15
tof a18 c19
tof a18 b28
tof a18 b26
tof a18 c4
tof a18 a31
tof a18 c1
tof a18 a5
tof a18 a22
tof a18 b29
tof a18 b31
tof a11 a16
tof a18 a29
tof a11 a30
tof a18 c17
tof b27 b9
tof b27 c19
tof a23 c19
tof c25 b9
tof c25 b14
tof b27 c0
tof c19 a12
tof b27 c31
tof c25 a26
tof b27 a0
tof b27 b28
tof b27 b26
tof b27 c4
tof b27 a31
tof b27 a4
tof b27 c1
tof b27 a22
tof b27 b1
tof b27 b30
tof b27 a29
tof b19 a29
tof c16 b19
tof c16 a23
tof a17 a29
tof a17 b19
tof a17 a23
tof a17 b9
tof c16 c0
tof a23 a12
tof c16 c31
tof c16 a26
tof a17 b6
tof c16 a0
tof a17 a7
tof a17 b15
tof a17 c19
tof c16 b28
tof c16 b26
tof c16 c4
tof c16 a31
tof c16 a4
tof c16 c1
tof b19 a5
tof a17 c14
tof c16 a22
tof c16 b1
tof c16 b30
tof a17 a16
tof a17 a30
tof a17 a11
tof c16 c25
tof c16 b27
tof a19 a12
tof a19 c4
tof a10 c4
tof a15 a12
tof c4 b9
tof a19 c0
tof a19 c31
tof a19 a26
tof a19 a0
tof a19 b28
tof c4 a24
tof a19 b26
tof a19 a31
tof a19 a4
tof a19 c1
tof a19 a5
tof a10 c14
tof a19 a22
tof a19 b1
tof a19 b30
tof a19 b19
tof a15 a11
tof a19 b27
tof a19 c16
tof a19 c25
tof b12 b1
tof b12 a10
tof a3 b1
tof b13 a10
tof b12 c0
tof b12 a12
tof a3 b6
tof a10 c4
tof b12 a5
tof a10 c14
tof b12 a22
tof c11 b13
tof c11 b12
tof c22 c14
tof c22 b13
tof c15 c14
tof c15 b13
tof c15 c11
tof c11 a14
tof c11 c0
tof c11 a12
tof c15 c31
tof c15 a26
tof c15 a0
tof b12 a7
tof b12 b15
tof b12 c19
tof c15 b28
tof b12 c2
tof b12 a24
tof c15 b26
tof b12 c4
tof c11 c6
tof c15 a31
tof c15 a4
tof c15 c1
tof c11 a5
tof c11 a22
tof c11 b1
tof c15 b30
tof b12 a16
tof b13 a29
tof c22 a10
tof b12 a3
tof c15 b27
tof c15 c16
tof b12 a17
tof c15 c25
tof b12 a30
tof c15 a19
tof b12 a23
tof b12 b19
tof b12 a15
tof b25 a12
tof b25 b7
tof c9 b25
tof c9 a14
tof c9 a0
tof c9 a7
tof c9 b15
tof c9 c19
tof c9 c2
tof c9 a24
tof c9 c4
tof c9 c6
tof c9 a5
tof b7 c14
tof c9 a22
tof c9 b1
tof b25 b30
tof c9 b13
tof c9 a17
tof c9 a30
tof c9 a23
tof c9 b19
tof c9 b12
tof c9 a3
tof b11 c0
tof b22 a22
tof a2 c0
tof a2 a22
tof a2 a20
tof b11 c31
tof b11 a26
tof b11 c28
tof b11 a31
tof b11 c1
tof b11 c14
tof a2 b29
tof a2 b31
tof b11 b30
tof b11 a16
tof b11 a10
tof b11 b7
tof b11 b27
tof b11 c16
tof b11 a17
tof b11 c25
tof b11 a30
tof b11 a19
tof b11 a23
tof b11 c15
tof b11 b19
tof b11 b12
tof b11 a3
tof b11 c11
tof b11 c9
tof b11 c22
tof b11 b13
tof c18 a22
tof a1 c18
tof a22 c0
tof a1 c31
tof a1 a26
tof a1 c28
tof a1 a31
tof a1 c1
tof b5 a5
tof a1 c14
tof a1 b29
tof a1 b31
tof a1 b30
tof a1 a16
tof a1 a10
tof b5 c17
tof c18 b22
tof a1 a2
tof a1 b27
tof a1 c16
tof a1 a17
tof a1 c25
tof a1 a30
tof a1 a19
tof a1 a23
tof a1 c15
tof a1 b19
tof a1 b12
tof a1 a3
tof a1 c11
tof a1 c9
tof a1 c22
tof a1 b13
tof a1 b11
tof a1 b7
tof a1 b25
tof b17 c17
tof b23 b17
tof b17 a14
tof b23 c31
tof b17 a31
tof b23 a16
tof b23 a10
tof a28 a31
tof c3 a14
tof c3 a31
tof b24 a14
tof a28 b16
tof a31 a26
tof a31 c28
tof b24 c6
tof a31 c1
tof a31 a5
tof a31 c14
tof a31 b29
tof a31 b31
tof a31 b30
tof a31 c17
tof c3 b17
tof a31 b23
tof a31 b27
tof a31 c16
tof a31 a17
tof a31 c25
tof a31 a30
tof a31 a19
tof a31 a23
tof a31 c15
tof a31 b19
tof a31 a15
tof a31 b12
tof a31 a3
tof a31 c11
tof a31 c9
tof a31 c22
tof a31 b13
tof a31 b11
tof a31 b7
tof a31 b25
tof a31 a1
tof a31 b8
tof a31 a2
tof a31 c18
tof a31 b22
tof a31 b5
tof c10 c1
tof c23 c1
tof c23 c26
tof c10 a14
tof c23 b4
tof c10 a26
tof c26 b6
tof c10 c28
tof c23 c27
tof c1 b15
tof c1 c19
tof c1 c2
tof c1 c6
tof c23 a4
tof c10 a5
tof c10 c14
tof c10 b29
tof c10 b31
tof c10 b30
tof c23 a28
tof c10 b17
tof c23 a18
tof c10 b27
tof c10 c16
tof c10 a17
tof c10 c25
tof c10 a30
tof c10 a19
tof c10 a23
tof c10 c15
tof c10 b19
tof c10 a15
tof c10 b12
tof c10 a3
tof c10 c11
tof c10 c9
tof c10 c22
tof c10 b13
tof c10 b11
tof c10 b7
tof c10 b25
tof c10 a1
tof c10 a2
tof c10 c18
tof c10 b22
tof c10 b5
tof c10 a31
tof c10 b8
tof c10 b23
tof a8 b0
tof a8 b9
tof a8 b16
tof a8 b4
tof a8 c31
tof a8 a0
tof b0 c6
tof b0 b24
tof a8 a13
tof a6 c1
tof c21 c1
tof c21 b10
tof b10 b9
tof b10 b14
tof b10 a26
tof c1 c27
tof c1 b15
tof c1 c19
tof c1 c2
tof a6 c20
tof b21 b27
tof a9 c8
tof b2 b20
tof b2 a9
tof b2 b4
tof a9 c28
tof a9 c27
tof a9 c14
tof a9 b1
tof a9 a8
tof c12 b4
tof c5 a12
tof a25 b10
tof a25 c8
tof a25 b20
tof b18 b9
tof a21 b9
tof a21 b18
tof b3 b18
tof c13 c24
T c13
T* b3
T b18
T* a21
T* c5
T* a12
T* a25
T* b20
T* c8
T* b10
T c12
T* b2
T a26
T* c26
T* c3
T* b21
T b27
T a27
T* a6
T c21
T c20
T c10
T* b23
T* b8
T* a31
T b5
T* b22
T c18
T* a2
T* c23
T* a1
T b25
T* b7
T* b11
T* b13
T c22
T* c9
T c11
T* a3
T* a11
T* b12
T a15
T* b19
T c15
T* a23
T a19
T* a30
T c25
T* a17
T c16
T* a9
T a8
T b0
T* a18
T* b17
T a28
T c17
T a10
T a29
T a13
T a16
T* b30
T* b31
T b1
T* b29
T a22
T c14
T a5
T* c1
T a4
T* b24
T* c6
T* c4
T* b26
T* a24
T c2
T* b28
T c19
T b15
T* a7
T* c27
T c28
T* a0
T* b6
T* c24
T* c31
T* c7
T* c0
T* b4
T* a20
T* b14
T* b16
T* b9
T* a14
tof c3 b18
tof a31 b18
tof b5 b18
tof a2 c13
tof c23 c13
tof c22 c13
tof a3 c13
tof a11 b3
tof b12 b3
tof a17 c13
tof c16 c13
tof a9 b13
tof a8 b18
tof a18 b18
tof a28 b18
tof c17 b18
tof a10 b18
tof b31 c13
tof b1 c13
tof b13 c13
tof b18 b3
tof b13 b3
tof b13 b18
tof a30 b18
tof b8 a21
tof a2 a12
tof a1 a12
tof b25 a12
tof c9 b21
tof c11 b21
tof a3 a12
tof a9 a12
tof b31 a12
tof b1 a12
tof b24 b21
tof c5 a21
tof a12 a21
tof a12 c5
tof b21 c5
tof c23 a12
tof a2 b20
tof c9 c8
tof c11 c8
tof a3 b20
tof a30 a25
tof c25 a25
tof a17 b10
tof a9 b20
tof b0 c8
tof a18 c8
tof b17 c8
tof a28 c8
tof b31 b20
tof b1 b20
tof b24 c8
tof b20 a25
tof c23 a25
tof b10 b20
tof b10 c8
tof c23 c8
tof c26 a26
tof b21 b10
tof b27 b10
tof c23 b10
tof c11 b10
tof a3 b2
tof b12 b22
tof a9 a2
tof b31 a2
tof b1 a2
tof b29 b22
tof a22 b22
tof b24 b10
tof a0 b2
tof b6 a26
tof c12 b10
tof b2 b10
tof a2 b10
tof b2 c12
tof a26 c12
tof c9 c12
tof b22 b2
tof a2 b2
tof c9 b2
tof b21 a26
tof b27 a26
tof c10 c3
tof b22 c3
tof c9 a26
tof c11 a26
tof a17 c26
tof a18 c3
tof a28 c3
tof b29 c3
tof a22 c3
tof b24 a26
tof a7 c26
tof b6 c26
tof a3 a26
tof b12 a26
tof a3 c26
tof b12 c3
tof c10 b27
tof a31 b27
tof b5 b27
tof b7 a27
tof c9 b27
tof c11 b27
tof b12 b21
tof a17 b27
tof c16 b27
tof c17 b27
tof b29 b21
tof a22 b21
tof b24 b27
tof b14 b27
tof b27 b21
tof b22 b21
tof b22 a27
tof a31 c10
tof b5 c10
tof c9 c20
tof a3 a2
tof b12 c10
tof c17 c10
tof b29 c10
tof a22 c10
tof a0 c20
tof c10 a6
tof a2 a6
tof b22 c21
tof a2 c21
tof c10 c20
tof b22 c20
tof b22 c10
tof a2 c10
tof b11 b23
tof a9 b13
tof a18 b13
tof b17 b13
tof a28 b13
tof a10 b13
tof b13 c10
tof b13 b8
tof b13 b22
tof b12 b22
tof a18 a2
tof a28 a2
tof c17 b5
tof b29 b22
tof a22 b22
tof a2 a31
tof a2 b5
tof b13 c23
tof b12 a11
tof b19 a11
tof c15 a11
tof a18 c18
tof b17 a11
tof a28 c18
tof a2 c18
tof a11 a2
tof b13 b25
tof a18 b25
tof a28 b25
tof b30 b25
tof a11 a1
tof b17 a1
tof b17 b25
tof a11 b7
tof b17 b7
tof a11 b11
tof b17 c22
tof a28 a18
tof a10 c22
tof a7 a17
tof a18 b11
tof a17 b13
tof a17 c22
tof a18 c22
tof a11 c9
tof b0 c11
tof b17 c11
tof b24 c11
tof a0 a18
tof b6 a3
tof a18 c9
tof a17 c11
tof a18 c11
tof a17 a3
tof b19 a15
tof c15 a15
tof b0 a15
tof a18 b12
tof a0 b12
tof b6 b17
tof a17 a11
tof a15 b12
tof a17 a15
tof b17 a15
tof a30 a23
tof a18 a23
tof b29 c15
tof a22 c15
tof a5 c15
tof a0 a23
tof a17 b19
tof b17 b19
tof b6 b19
tof a17 c15
tof b6 c15
tof b17 a23
tof b6 a23
tof b17 c25
tof a16 a17
tof a0 a18
tof b6 c25
tof a30 a19
tof c25 a30
tof a18 a30
tof a17 c25
tof a13 c16
tof a16 a17
tof b31 a9
tof b1 a9
tof a7 c16
tof b6 a9
tof b14 c16
tof a9 a17
tof a18 a17
tof a9 c16
tof a18 a9
tof b17 b0
tof a10 b0
tof b31 a8
tof b1 a8
tof b24 b0
tof b6 a8
tof a18 b0
tof b6 b0
tof c17 a18
tof b6 a28
tof c17 a28
tof a10 c17
tof b6 a29
tof a29 a10
tof a22 a29
tof a22 a13
tof a7 b31
tof a0 b31
tof a4 b1
tof a7 b1
tof a0 b1
tof b29 b1
tof a22 b1
tof c14 b1
tof a22 b29
tof c14 a22
tof b6 a22
tof b6 c14
tof a5 c14
tof a4 a5
tof b6 a4
tof c6 b24
tof b6 c6
tof b6 b26
tof b6 a24
tof b6 c2
tof b6 c19
tof b6 b15
tof b6 c27
tof b6 c28
tof b6 b4
tof b6 b16
tof b6 a20
tof b6 c0
tof b6 b9
tof b6 c7
tof b6 c24
tof b6 c31
tof b6 b14
tof a7 c27
tof c6 b16
tof b24 b16
tof b24 c6
tof a4 c6
tof a4 a14
tof a4 b4
tof a4 b9
tof a4 c24
tof a4 c31
tof a4 b14
tof a4 b6
tof a4 c28
tof a4 c27
tof a4 c19
tof a4 c2
tof a4 a24
tof a4 b26
tof a4 a0
tof a5 a14
tof c14 a5
tof a5 b4
tof a5 b9
tof a5 c6
tof a5 c24
tof a5 c31
tof a5 b14
tof a5 b6
tof a5 c28
tof a5 c27
tof a5 c19
tof c14 b28
tof a5 c2
tof a5 a24
tof a5 b26
tof a5 a0
tof a5 a4
tof b29 a14
tof a22 b9
tof a22 c6
tof a22 c24
tof a22 c31
tof a22 b14
tof a22 b6
tof a22 c28
tof a22 c27
tof a22 c19
tof b29 b28
tof a22 c2
tof a22 a24
tof a22 b26
tof b29 c4
tof b29 a5
tof a22 c14
tof a16 b15
tof b31 b1
tof a10 a29
tof a13 b9
tof a29 c6
tof a29 c24
tof a29 c31
tof a13 b14
tof a29 c28
tof a29 c27
tof a29 c19
tof a29 c2
tof a29 a24
tof a29 b26
tof a13 c4
tof a29 c14
tof a29 a22
tof a13 b6
tof c17 a22
tof b17 a22
tof b17 a28
tof a22 b4
tof c17 b16
tof b17 a20
tof b17 c7
tof c17 c24
tof c17 c31
tof c17 c28
tof c17 c27
tof b17 b15
tof c17 c19
tof a22 b28
tof c17 c2
tof a22 b1
tof a22 a4
tof a22 a5
tof c17 c14
tof b17 b29
tof a22 a0
tof c17 a29
tof b17 a13
tof a18 b16
tof b0 b16
tof a18 b4
tof b0 c6
tof a18 c31
tof a18 c28
tof a18 c27
tof a18 c19
tof a18 b28
tof a18 c2
tof b0 a24
tof b0 b26
tof a18 b1
tof a18 a4
tof a18 a5
tof a18 c14
tof a18 a0
tof a18 a22
tof a18 a29
tof a18 c17
tof a18 a28
tof a17 a9
tof a17 c16
tof a17 a20
tof c16 b9
tof a17 c31
tof c16 b14
tof a17 a8
tof c16 c4
tof c16 b6
tof c16 a13
tof a17 b31
tof c25 b15
tof a30 b15
tof a30 c25
tof a19 b15
tof a30 a20
tof a19 a4
tof b19 c15
tof c15 a14
tof a23 b15
tof c15 b28
tof a23 a4
tof c15 b29
tof a23 a19
tof a15 a13
tof b12 a13
tof b12 a15
tof a11 a13
tof a11 a14
tof a15 b4
tof a11 b9
tof a11 a8
tof a11 c28
tof a11 c27
tof a11 c19
tof a11 b28
tof a11 c2
tof a13 c4
tof a15 b1
tof a15 a5
tof a15 c15
tof a11 a29
tof a13 b6
tof a11 b31
tof a11 c25
tof a11 c17
tof a11 b19
tof a11 c16
tof a15 a10
tof a11 a17
tof a11 a18
tof a11 b17
tof a11 a28
tof a3 b31
tof c9 b31
tof c9 c11
tof c11 a14
tof c11 b16
tof a3 a20
tof a3 c0
tof a3 c31
tof c11 a24
tof c11 b26
tof a3 b1
tof a3 a17
tof a3 a15
tof c11 b0
tof a3 b17
tof c11 b12
tof c11 c6
tof c9 a0
tof b13 c4
tof b13 c22
tof b11 c4
tof b13 b4
tof b13 b16
tof b13 c0
tof b13 b9
tof b13 a9
tof b11 c24
tof b11 c31
tof b13 c27
tof b13 a7
tof b11 a4
tof b13 a5
tof b13 c1
tof b13 c15
tof b13 a29
tof b11 a16
tof b13 c17
tof b13 c16
tof b13 a10
tof b13 a17
tof b13 a18
tof b13 b0
tof b13 a28
tof b13 b12
tof b13 a11
tof b13 c6
tof b13 c11
tof b13 a3
tof b13 c9
tof a1 b25
tof b7 c7
tof b7 a22
tof b7 a10
tof b25 b30
tof b7 c22
tof a1 b11
tof c23 b9
tof a2 b9
tof a2 a14
tof c23 b4
tof a2 b16
tof a2 c7
tof a2 c24
tof a2 c31
tof a2 a8
tof a2 c28
tof a2 c27
tof a2 c19
tof a2 b28
tof a2 c2
tof a2 a24
tof a2 b26
tof c23 b1
tof a2 a4
tof c23 c1
tof a2 a22
tof a2 a29
tof a2 b6
tof a2 a13
tof a2 c25
tof a2 a16
tof a2 c17
tof a2 c16
tof a2 a10
tof a2 a17
tof a2 b30
tof a2 c22
tof a2 a18
tof a2 b0
tof a2 b25
tof a2 b17
tof a2 a28
tof a2 a11
tof a2 c6
tof a2 c11
tof a2 b7
tof a2 c9
tof a2 a1
tof a2 a0
tof a2 b19
tof b22 c15
tof a31 c15
tof a31 b5
tof b22 b16
tof b22 c0
tof b5 a9
tof a31 c7
tof b5 c24
tof b22 c4
tof b22 b1
tof b22 a5
tof a31 c14
tof b22 a29
tof b22 a13
tof b5 c23
tof b22 c18
tof c10 b8
tof c10 a9
tof b23 c31
tof c10 c27
tof c10 a7
tof b23 a4
tof c10 a13
tof b23 c25
tof b23 a16
tof c10 c23
tof c10 c16
tof c10 a10
tof c10 a17
tof c10 b30
tof c10 c18
tof c10 a18
tof c10 b25
tof c10 b22
tof c10 a28
tof c10 b12
tof c10 a11
tof c10 c6
tof c10 c11
tof c10 a3
tof c10 c9
tof c10 b13
tof a6 c21
tof c21 c27
tof c21 a7
tof b21 b27
tof b27 b16
tof b21 a13
tof b21 c16
tof a26 b4
tof c3 b27
tof c3 c23
tof c3 a10
tof c3 a17
tof c3 b30
tof c3 c18
tof c3 a18
tof c3 b8
tof c3 b25
tof c3 a28
tof c3 b12
tof c3 a11
tof c3 c6
tof c3 c11
tof c3 c20
tof c3 a3
tof c3 c21
tof c3 c9
tof c3 b13
tof c3 a6
tof c3 b21
tof c3 c10
tof c3 a9
tof b10 c12
tof c12 a26
tof b20 c8
tof a25 c8
tof a25 b20
tof b20 a26
tof b20 c12
tof b20 b10
tof a21 c5
tof a12 b20
tof a12 a25
tof c5 b27
tof b3 a14
tof c13 b9
T* c13
T* b9
T* b18
T* a21
T c5
T* b27
T* a12
T* a25
T b20
T* b10
T* c12
T* a31
T* c3
T* a26
T* b2
T* c26
T* a9
T* a8
T* a1
T b11
T* b7
T c22
T* c17
T b0
T* a0
T* c10
T* b17
T a15
T a2
T* b19
T* a19
T a23
T* a30
T b21
T a6
T* b13
T c9
T* c21
T* a3
T* c20
T* c11
T* c6
T* a11
T b12
T* a28
T* b22
T* b25
T* b8
T* a18
T* b5
T* c18
T* b30
T* a17
T a10
T* c16
T* c23
T* b23
T* a16
T* c25
T b31
T a13
T* b6
T* a29
T* a22
T* c15
T* b29
T* c14
T* c1
T* a5
T* a4
T b1
T* b24
T c4
T* b26
T* a24
T* c2
T* b28
T* c19
T* b15
T* a7
T c27
T* c28
T* a27
T* b14
T* c31
T* c24
T* c7
T* c8
T* b3
T* c0
T* a20
T* b16
T* b4
T* a14
tof c12 b9
tof a26 b9
tof a1 b18
tof b11 b18
tof b17 b18
tof a15 b18
tof b22 c3
tof b5 b9
tof c18 b18
tof c23 c13
tof a16 b18
tof c25 b18
tof b6 c3
tof a29 c3
tof a18 c13
tof c3 b9
tof a18 b9
tof c3 b18
tof c3 b27
tof c26 c5
tof b11 a1
tof b7 a21
tof b17 b27
tof a15 b27
tof a2 a31
tof a19 a1
tof b13 c5
tof c6 c5
tof a11 a31
tof b22 b27
tof b30 a31
tof b23 a1
tof b29 a31
tof c14 a31
tof a4 a1
tof b27 a21
tof a1 a21
tof b27 c5
tof a31 b27
tof a1 b27
tof b10 a25
tof c3 a12
tof a26 a25
tof b0 c17
tof a15 b17
tof c21 b20
tof a11 b20
tof b5 a12
tof c23 a12
tof a7 b20
tof c17 a12
tof b17 a12
tof c17 a25
tof b17 a25
tof c17 b20
tof c3 b10
tof a1 b10
tof c17 c12
tof b17 c12
tof a2 b2
tof b13 b2
tof b30 a31
tof c15 b2
tof c14 b2
tof b3 b10
tof a31 b10
tof a26 b10
tof a26 c12
tof b2 a31
tof b7 b2
tof c10 b2
tof a2 b2
tof a19 a1
tof b13 b2
tof c9 b2
tof c21 a26
tof c11 a26
tof b22 a1
tof a10 b2
tof c15 b2
tof c14 b2
tof a4 a1
tof a7 a26
tof c8 a26
tof a1 c3
tof b17 c3
tof b17 a26
tof a1 b2
tof b7 a8
tof c10 a8
tof b17 c26
tof a15 c26
tof a2 a1
tof a6 a8
tof c9 a8
tof b22 a19
tof b5 a9
tof a10 a8
tof c15 a1
tof c14 a1
tof c1 a1
tof a4 a19
tof a19 c26
tof b13 c26
tof a1 a9
tof a19 a9
tof b13 a9
tof a1 a8
tof a19 a8
tof c10 b7
tof a2 a1
tof b22 b11
tof a10 b7
tof b23 b11
tof c15 a1
tof c14 a1
tof c1 a1
tof c17 a1
tof a19 a1
tof b7 b11
tof a19 b11
tof c17 b7
tof a19 b7
tof b8 b7
tof c10 c22
tof a19 c17
tof c9 c22
tof b8 c17
tof a10 c22
tof c15 c22
tof b29 c22
tof b13 c22
tof b13 c17
tof a3 c17
tof b13 b0
tof a3 b0
tof a3 b13
tof b8 a19
tof a10 c10
tof b6 b17
tof a29 b17
tof a19 a0
tof a19 c10
tof b13 c10
tof b13 b17
tof b13 a15
tof c9 a2
tof a3 a2
tof b6 a15
tof a29 a15
tof c15 a2
tof c14 a2
tof a19 a15
tof a19 a2
tof a19 b19
tof b13 a23
tof c9 a30
tof a3 a30
tof b22 a23
tof c18 a30
tof b23 a23
tof a16 a23
tof c25 a23
tof c15 a30
tof b29 a30
tof a23 a19
tof b8 a19
tof b8 a23
tof b8 a30
tof a3 a6
tof a11 b21
tof a28 b13
tof a13 b21
tof b6 b21
tof c1 a6
tof b8 b21
tof b8 b13
tof a28 a3
tof c23 b5
tof c15 c9
tof c14 c9
tof c1 b5
tof a5 b5
tof a7 c21
tof a3 c9
tof b8 c9
tof b8 c21
tof b8 a3
tof b5 a3
tof a11 c11
tof a28 c6
tof b22 c6
tof b14 c11
tof b8 c20
tof b8 c6
tof b25 a28
tof a18 a28
tof b5 a28
tof c23 a28
tof b23 b12
tof a16 b12
tof a13 c16
tof b6 c16
tof c15 c16
tof c14 c16
tof c1 a28
tof a5 a28
tof b8 a11
tof c16 a11
tof b8 b12
tof c16 b12
tof b8 a28
tof a18 b25
tof b5 b25
tof c23 b25
tof b23 b8
tof a16 b8
tof c25 b8
tof c1 b25
tof a5 b25
tof b8 b22
tof c18 b8
tof c25 b30
tof c1 b5
tof a5 b5
tof b5 a18
tof c23 a18
tof c18 b5
tof b30 c18
tof c23 c18
tof c23 b30
tof b6 a10
tof a5 a17
tof b1 a17
tof a17 b30
tof c24 a17
tof a16 b23
tof c25 b23
tof b6 c16
tof b23 c23
tof c25 a16
tof a4 c25
tof c14 a13
tof a29 b6
tof c14 b6
tof c14 a29
tof b14 a29
tof c4 c15
tof a7 b29
tof c14 c15
tof c14 b29
tof c2 a5
tof a7 b26
tof c1 c14
tof a5 c14
tof b26 c1
tof b28 a5
tof b26 a4
tof b28 c2
tof c19 a4
tof c2 a4
tof c2 b1
tof c2 b26
tof b15 c19
tof b26 c4
tof c19 c4
tof c27 b26
tof c19 a24
tof c27 a24
tof b28 c2
tof c27 c2
tof c19 b28
tof b15 c19
tof c27 c19
tof c28 c27
tof b3 c7
tof a14 b3
tof a14 b16
tof b3 b16
tof b3 a14
tof c7 b16
tof c7 a14
tof c24 b4
tof c27 c28
tof b15 c8
tof c19 b15
tof b28 b15
tof c2 b15
tof c2 b28
tof b15 c8
tof b26 b28
tof b26 a24
tof c4 b28
tof c4 a24
tof b26 c28
tof c4 c8
tof b28 b15
tof b26 a20
tof b26 c24
tof b26 c19
tof b26 c2
tof b1 c31
tof b1 c28
tof a4 a20
tof a4 c24
tof a4 c19
tof a4 b26
tof a4 c4
tof a5 c31
tof a5 c2
tof a5 a4
tof c1 c2
tof c1 a4
tof c14 c2
tof c14 a5
tof c14 a14
tof c14 b4
tof c1 c28
tof c1 c8
tof a5 b28
tof a4 a20
tof a4 c24
tof a5 b1
tof a4 b26
tof c15 c8
tof c15 b15
tof c15 b28
tof b29 a7
tof c15 c4
tof c15 a24
tof b29 c1
tof b6 a29
tof b6 a14
tof b6 b4
tof a29 c8
tof b6 b28
tof a29 b14
tof b6 b1
tof b6 a5
tof b6 c14
tof b6 c2
tof a16 b3
tof b23 a29
tof b23 c14
tof c23 a29
tof c23 c14
tof c16 a29
tof c14 a14
tof c14 b4
tof c16 c8
tof c14 b28
tof c16 b14
tof c14 b1
tof b23 c19
tof b23 b26
tof b23 c4
tof c16 a13
tof b23 c25
tof a17 c31
tof b30 a17
tof a10 b16
tof a17 b4
tof b30 c28
tof a10 a27
tof b30 b1
tof b30 c27
tof c18 a17
tof b5 a17
tof b5 c18
tof a18 a17
tof a18 c31
tof a17 a14
tof c18 b4
tof c18 c28
tof b5 a20
tof a17 c24
tof c18 b1
tof c18 c27
tof b5 b26
tof b5 a4
tof b5 c23
tof c18 b30
tof b8 b26
tof b8 a4
tof b8 c23
tof b25 b26
tof b25 b8
tof b25 c18
tof b22 a4
tof b22 b8
tof b22 c18
tof b25 b16
tof c23 a14
tof c23 b4
tof b25 c28
tof b25 a27
tof a4 c8
tof b25 b15
tof c23 b28
tof b26 a20
tof b22 b3
tof b26 c24
tof c23 b1
tof b22 c19
tof c23 a29
tof b26 c27
tof b22 c4
tof b25 a5
tof c23 c14
tof b25 c1
tof b25 c15
tof b25 a10
tof b8 b5
tof b22 b31
tof b25 c25
tof b22 a16
tof b22 b23
tof b25 b30
tof a11 b12
tof a28 b16
tof a28 c28
tof a28 a27
tof a11 c8
tof a28 b15
tof a28 a20
tof a11 b14
tof a11 a29
tof a28 c27
tof a28 b26
tof a28 a5
tof a28 c1
tof a28 c15
tof a11 a13
tof a28 a10
tof a28 b5
tof a11 c16
tof a28 b8
tof a28 c25
tof a28 c18
tof a28 b30
tof c11 c8
tof c20 b14
tof c20 b24
tof c6 b5
tof c6 b8
tof c6 b12
tof a3 c8
tof a3 b28
tof c21 c8
tof c21 b29
tof c9 c8
tof c9 b28
tof c9 b29
tof a3 c28
tof c9 b15
tof a3 c27
tof a3 b26
tof c9 c4
tof a3 a4
tof a3 c14
tof c9 a24
tof c9 c1
tof c9 c15
tof c9 b6
tof c9 a13
tof c21 a22
tof c21 b31
tof c9 a11
tof c9 a7
tof b13 b16
tof b21 b4
tof b13 a27
tof a6 c8
tof b13 a20
tof b13 c4
tof b13 a4
tof b13 a5
tof b13 c14
tof b13 a24
tof b13 b29
tof b13 a3
tof b13 b6
tof b13 a13
tof b13 a10
tof b13 b12
tof b13 c25
tof b13 c6
tof b13 c18
tof b13 a11
tof b13 b30
tof b13 a28
tof b13 a7
tof b13 c9
tof a23 a30
tof a19 a30
tof a19 a23
tof a23 c0
tof a23 b4
tof a30 a20
tof a19 a6
tof a23 a24
tof a23 b24
tof a23 c20
tof a15 c0
tof a15 b16
tof a2 c7
tof a15 a27
tof a2 b3
tof b17 a10
tof c10 a10
tof b17 c0
tof a10 b16
tof c10 a14
tof c10 c7
tof b17 b4
tof a10 a27
tof b17 b21
tof b17 a5
tof b17 c14
tof b17 b6
tof b17 a13
tof c10 a22
tof b17 c16
tof a0 b31
tof a0 b12
tof b17 a23
tof b17 a11
tof b17 a15
tof b17 c2
tof b0 c25
tof c17 b0
tof c17 b4
tof c17 b21
tof c22 a30
tof c17 c27
tof c17 b26
tof c17 c14
tof c17 a24
tof c22 c1
tof c22 b29
tof c17 a10
tof c17 c16
tof b0 b31
tof c17 b12
tof c17 a23
tof c17 c18
tof c17 a11
tof c17 a2
tof c17 c10
tof b7 c17
tof a1 b7
tof a1 c0
tof c17 b16
tof c17 a14
tof c17 a27
tof c17 c8
tof c17 b15
tof b7 b28
tof b7 a20
tof c17 b3
tof a1 b21
tof c17 a30
tof a1 c27
tof a1 b26
tof b7 c4
tof a1 c14
tof c17 a24
tof c17 c1
tof c17 c15
tof a1 b24
tof a1 c20
tof b7 b29
tof c17 b6
tof c17 a13
tof c17 a22
tof a1 a10
tof a1 c16
tof a1 b12
tof a1 c25
tof a1 c18
tof a1 a11
tof c17 b30
tof c17 a19
tof b7 c21
tof b7 b19
tof b7 b22
tof a1 a2
tof b7 c19
tof b7 a15
tof b7 a0
tof c17 c2
tof b7 b0
tof a1 c10
tof b7 b1
tof b7 a16
tof c17 b17
tof b7 b23
tof b7 c23
tof c17 a28
tof b7 c24
tof c17 b13
tof c17 c6
tof a9 a8
tof c26 b16
tof c26 a27
tof a8 c8
tof a9 b28
tof a9 a6
tof a9 a5
tof a9 c1
tof a9 a3
tof b2 b28
tof a26 c8
tof c3 c8
tof c3 b2
tof c3 b16
tof c3 a14
tof b2 c7
tof c3 a27
tof b2 a8
tof b2 a20
tof b2 b3
tof b28 a6
tof c3 c26
tof c3 a30
tof c3 c27
tof c3 b26
tof b2 c4
tof c3 a4
tof b28 a5
tof c3 c14
tof b2 a24
tof b28 c1
tof b2 c15
tof c3 b24
tof c3 c20
tof c3 b29
tof b28 a3
tof b28 a9
tof b2 b6
tof b2 a13
tof c3 a22
tof c3 c16
tof c3 b31
tof c3 b12
tof b2 c22
tof c3 a11
tof c3 c21
tof b2 a2
tof b2 c9
tof c3 b1
tof b2 a7
tof c3 c23
tof c3 c24
tof c3 b7
tof c3 b21
tof a31 c7
tof b10 c7
tof c12 c0
tof c7 b16
tof c7 a14
tof c12 b4
tof a31 a8
tof a31 a20
tof a31 b3
tof a31 a6
tof a31 c4
tof a31 a5
tof a31 a24
tof a31 c1
tof a31 c15
tof a31 a3
tof a31 a9
tof a31 b6
tof a31 a13
tof a31 c22
tof a31 a2
tof a31 c9
tof a31 a7
tof a31 b2
tof a31 b28
tof a12 a25
tof a12 b20
tof a25 c7
tof a25 b10
tof a12 c12
tof c5 b16
tof c5 c26
tof c13 b9
tof b9 c0
tof b18 a30
T* c28
T* c13
T* b18
T a30
T b27
T* c12
T* a12
T c8
T a26
T* a31
T* c5
T* a27
T* c3
T* b28
T* a1
T* b21
T* a18
T* b15
T b2
T c17
T* b14
T c6
T* b7
T b13
T* b25
T* c24
T a28
T* c23
T* b23
T* a7
T* b17
T* a16
T* b1
T* b11
T* c10
T* b0
T* c2
T* a0
T* c9
T* a15
T* c19
T* a2
T* b22
T* b19
T* c21
T* a19
T* b30
T* a11
T c18
T* c22
T* a23
T c25
T* b12
T* b8
T b31
T* c16
T* b5
T* a10
T* a22
T a13
T* b6
T* a9
T* a3
T* b29
T* c20
T* b24
T* c15
T c1
T* a24
T* c14
T a5
T* a4
T* c4
T* b26
T* c27
T* a29
T* c11
T* a17
T* a21
T* c26
T* a6
T* b3
T* a20
T* b20
T* a8
T* a25
T* b10
T* b9
T* b4
T* c7
T* a14
T* b16
T* c0
T* c31
tof a31 c28
tof c3 b18
tof b21 c28
tof a18 c28
tof c17 c28
tof c6 b18
tof b23 b18
tof b1 c24
tof c10 b18
tof b8 b18
tof a21 b18
tof c24 c28
tof a28 c28
tof b25 c13
tof c24 c13
tof b25 b18
tof a28 b18
tof c8 a30
tof a28 b25
tof c23 b27
tof c10 a30
tof b0 b27
tof c2 a30
tof a0 b27
tof a2 b27
tof a19 a30
tof c18 b27
tof c22 a7
tof c25 b27
tof b29 c12
tof a21 a30
tof a6 a30
tof a8 a30
tof b25 a30
tof a7 a30
tof c19 a30
tof b25 b27
tof c19 b27
tof b25 c12
tof a7 c12
tof b17 a12
tof a15 b25
tof c19 c8
tof c21 a26
tof a19 c8
tof a23 a12
tof c26 b25
tof a6 c8
tof a8 c8
tof a2 a12
tof a26 c8
tof a2 c8
tof b25 a26
tof a2 a26
tof b21 a31
tof a18 a31
tof c17 a31
tof b7 a31
tof b25 a31
tof c24 a31
tof a28 a31
tof a7 c5
tof b1 a31
tof b0 a31
tof c2 a31
tof c19 a31
tof c22 a27
tof c25 a31
tof a13 a31
tof b6 a31
tof c26 a15
tof a15 a31
tof a15 c5
tof b29 c5
tof b29 a27
tof c6 c3
tof b25 c3
tof b23 c3
tof a7 a1
tof b17 a1
tof b1 c3
tof c9 b28
tof a15 c3
tof a2 b28
tof a23 a1
tof b5 c3
tof a17 c3
tof a25 c3
tof a14 c3
tof b25 b21
tof c24 a18
tof a28 a18
tof b1 a18
tof c2 b21
tof c9 b21
tof a18 b21
tof b15 a18
tof b2 a18
tof b17 b15
tof b7 c17
tof b1 b14
tof b0 b2
tof c2 c17
tof a0 b14
tof a15 b25
tof c19 b2
tof a23 b14
tof c25 b2
tof c16 b14
tof a10 b14
tof a13 c17
tof b6 c17
tof c20 b14
tof a29 b14
tof a17 b14
tof a25 b14
tof a14 b14
tof b17 b2
tof b25 c17
tof b25 b14
tof b17 b14
tof b25 c6
tof a16 a7
tof b1 c6
tof b0 b13
tof c2 a7
tof c19 b13
tof a11 a7
tof c22 a7
tof c25 b13
tof b5 c6
tof a13 a7
tof b6 a7
tof a17 c6
tof a25 c6
tof a14 c6
tof a7 b7
tof a7 b13
tof b0 c24
tof c2 a7
tof c19 c24
tof a11 a7
tof c25 c24
tof a13 a7
tof b6 a7
tof a7 b25
tof b1 b25
tof a28 c24
tof b1 c24
tof a7 a28
tof b1 a28
tof b17 c23
tof b1 b23
tof c18 c23
tof c25 c19
tof b0 c23
tof c19 c23
tof a7 b23
tof b0 b23
tof c19 b23
tof b0 a7
tof c9 a7
tof b0 a16
tof c9 a16
tof a19 a16
tof c22 a16
tof a23 b17
tof b29 a16
tof c20 b17
tof a6 a16
tof a25 b17
tof b1 b17
tof c2 b1
tof c9 b0
tof a15 b0
tof b22 b0
tof c26 b0
tof c2 b11
tof c2 c10
tof c19 a0
tof b30 a0
tof b12 a0
tof b22 c2
tof c9 a0
tof b22 c9
tof c21 a2
tof b30 b19
tof c25 c19
tof c26 a15
tof b22 a15
tof b19 a15
tof b22 c19
tof b19 a2
tof c11 a29
tof a17 a29
tof a25 a29
tof a14 a29
tof c21 b22
tof c21 b19
tof b30 b19
tof b30 c21
tof a29 c21
tof a23 b30
tof a13 a11
tof b6 a11
tof c20 b30
tof c26 c22
tof a6 a19
tof a25 b30
tof c22 a19
tof b29 a19
tof c22 b30
tof c22 a11
tof b29 a11
tof b29 c22
tof c20 a23
tof a25 a23
tof a23 c18
tof a29 c18
tof c25 c22
tof a29 c22
tof c25 a23
tof b5 b8
tof a10 c16
tof a29 b12
tof c11 c16
tof a17 b8
tof a25 b8
tof a14 b8
tof b12 c25
tof c16 b12
tof c16 b8
tof a29 b31
tof a17 c16
tof a25 c16
tof a14 c16
tof b6 a13
tof c11 a10
tof a17 a13
tof a25 a13
tof a14 a13
tof a13 a10
tof a29 a10
tof a29 a22
tof a29 a13
tof a29 a3
tof c11 b6
tof a25 a17
tof a14 a17
tof a17 a9
tof a17 a3
tof a29 b29
tof a17 b29
tof c26 b29
tof a25 c20
tof c26 b24
tof a25 b24
tof a29 c1
tof a17 c1
tof a17 a24
tof c11 c14
tof a17 a5
tof a29 c14
tof a29 a5
tof a29 a4
tof a29 c27
tof a17 c4
tof a17 b26
tof a25 a17
tof c11 a29
tof a25 a6
tof a14 a20
tof a25 b3
tof a25 a20
tof a14 a25
tof c31 a25
tof c0 b9
tof c31 c7
tof c31 a14
tof c0 a14
tof c0 b16
tof a14 c0
tof b9 b16
tof b9 a14
tof a25 b10
tof a25 c7
tof a25 a14
tof a25 c0
tof a25 c31
tof c26 a6
tof c26 b3
tof c26 c31
tof c26 b9
tof c26 b4
tof a17 c0
tof c11 c0
tof a29 c0
tof a29 c11
tof c0 a20
tof a17 b3
tof c11 b9
tof c11 a25
tof c0 b20
tof c0 a8
tof c11 b4
tof a17 a6
tof a4 c27
tof c15 a20
tof c15 b9
tof b24 a14
tof b24 c26
tof c20 a14
tof c20 c26
tof b29 a14
tof b29 b24
tof b29 c31
tof b29 a6
tof b29 c15
tof c20 c11
tof a9 a24
tof a13 a9
tof a10 a13
tof a13 a14
tof a13 c31
tof a13 b4
tof a13 a6
tof a9 a24
tof a13 c15
tof a13 c26
tof a13 b24
tof a13 c20
tof c16 a14
tof c16 b20
tof c16 b4
tof c16 b24
tof c16 a3
tof b12 c16
tof b12 b8
tof c25 c16
tof c25 b8
tof c16 a20
tof b12 a14
tof c16 b3
tof c16 c31
tof c25 b9
tof c16 a8
tof c16 b4
tof c16 b26
tof c16 c4
tof c16 a5
tof c16 c1
tof c16 c15
tof c25 c26
tof b12 b24
tof b12 a3
tof c25 a13
tof c16 a10
tof c16 b29
tof c16 b5
tof c16 a17
tof a23 a14
tof a23 a13
tof a23 b29
tof c22 a14
tof c22 a23
tof c18 b29
tof c18 a23
tof c22 a20
tof a14 b16
tof c22 b3
tof a13 c31
tof c22 a8
tof c22 b4
tof a13 a6
tof c22 a5
tof c22 a24
tof c22 c1
tof a13 c15
tof c22 c26
tof a13 b24
tof c22 a9
tof c22 a10
tof a11 a10
tof b30 c15
tof a19 b30
tof a19 a11
tof c15 a20
tof b30 b16
tof b30 a14
tof b30 c31
tof c15 b9
tof a19 a8
tof b30 a6
tof a19 c27
tof a19 a5
tof a11 a24
tof a19 c1
tof a11 a9
tof b30 a13
tof a19 b29
tof a19 a23
tof a19 c16
tof a19 b8
tof a19 b5
tof a19 a17
tof c21 a25
tof c21 c26
tof c21 c25
tof b19 a25
tof b19 c21
tof b22 a25
tof b22 c25
tof b22 b19
tof c25 a20
tof c26 b16
tof c26 a14
tof c21 b3
tof c25 c31
tof b19 b9
tof c21 b20
tof c25 a6
tof b22 c27
tof b22 b26
tof c21 a4
tof c25 c15
tof c21 b24
tof c25 a3
tof c21 b6
tof c21 a22
tof c21 c20
tof c21 a10
tof c21 b31
tof c21 c18
tof c21 c0
tof c21 c11
tof b19 b30
tof c21 c22
tof b19 b12
tof a2 a25
tof c19 c22
tof a15 c22
tof a15 a2
tof a2 b16
tof a2 a14
tof a25 b10
tof a15 b3
tof a15 b9
tof a15 b20
tof c22 b4
tof c19 a6
tof c19 b26
tof c19 c4
tof a15 a4
tof c22 a5
tof c19 a24
tof c22 c1
tof c22 c15
tof c22 c26
tof a15 b24
tof c19 a3
tof c19 a9
tof a15 b6
tof a15 a22
tof a15 c20
tof a15 a10
tof a15 b31
tof c22 b29
tof c22 a23
tof a15 c18
tof a15 c0
tof c19 c16
tof a15 c11
tof c19 b8
tof c19 c25
tof a15 b30
tof c19 b5
tof c22 a11
tof c19 a17
tof a15 b12
tof a15 c21
tof c9 c26
tof c9 c25
tof c9 a19
tof a0 c26
tof a0 c25
tof a0 b12
tof c2 c25
tof c2 b12
tof c2 c9
tof c9 a20
tof c2 b10
tof c2 c31
tof c9 b9
tof c2 a25
tof c25 b20
tof b12 b4
tof c9 a6
tof a19 c27
tof c9 b26
tof c2 c4
tof c9 a4
tof a19 a5
tof c25 c14
tof a19 a24
tof a19 c1
tof c2 c15
tof c9 a3
tof a19 a9
tof c25 b6
tof c2 a22
tof c25 c20
tof a0 a13
tof c25 a10
tof c2 b31
tof a19 b29
tof c25 a29
tof a19 a23
tof a19 c16
tof a19 b8
tof c2 b30
tof a19 b5
tof a19 a11
tof a19 a17
tof a19 c22
tof c2 c19
tof c2 b19
tof c2 b22
tof b0 a22
tof c10 a22
tof b11 a22
tof b0 a20
tof b0 b16
tof b0 a14
tof b0 b3
tof b0 b20
tof b0 b4
tof c10 a21
tof b0 a4
tof b0 a5
tof b0 c1
tof b0 c26
tof b0 b24
tof b0 b6
tof b0 c20
tof b0 a10
tof b0 b31
tof b0 b29
tof b11 a29
tof b0 a23
tof b0 c18
tof b0 c0
tof b0 c11
tof b0 b30
tof b0 a11
tof b0 c22
tof b0 b12
tof b0 a19
tof b0 c21
tof b0 a15
tof b0 a2
tof b1 c20
tof b1 b30
tof b1 a19
tof a16 b30
tof a16 a19
tof b17 c20
tof b17 b30
tof a19 a20
tof a16 b16
tof a16 a14
tof b1 b10
tof a16 b3
tof b1 c31
tof a19 b9
tof b1 a25
tof b1 b20
tof c20 b4
tof b1 a6
tof b1 b26
tof b1 c4
tof b1 a4
tof b1 c14
tof a19 c15
tof c20 c26
tof b30 b24
tof b1 a3
tof b1 a22
tof a16 a13
tof b1 a10
tof b1 b31
tof b30 b29
tof b17 c18
tof b17 c11
tof b1 b11
tof b1 a11
tof b17 a17
tof a16 c22
tof b1 b12
tof b1 b19
tof b1 b22
tof b1 c2
tof b1 c19
tof b1 c25
tof b1 c10
tof b1 c9
tof a7 c18
tof c23 c18
tof a7 a20
tof a7 b20
tof a7 a6
tof a7 b26
tof a7 c4
tof a7 a4
tof a7 a24
tof a7 c15
tof a7 b24
tof a7 a3
tof a7 a9
tof a7 b6
tof a7 a22
tof a7 c20
tof c18 a13
tof a7 a10
tof a7 b31
tof c23 b29
tof c18 a23
tof a7 c0
tof a7 c16
tof a7 c11
tof a7 b8
tof a7 b5
tof a7 a17
tof a7 c22
tof a7 c21
tof a7 a16
tof a7 a15
tof a7 a0
tof a7 a2
tof a7 b0
tof a28 c0
tof c24 a6
tof c24 c0
tof c24 a28
tof b25 a6
tof b25 a28
tof b25 b16
tof b25 a14
tof b25 b9
tof b25 b20
tof b25 b26
tof b25 c4
tof b25 a4
tof b25 c15
tof b25 a3
tof b25 b6
tof b25 a22
tof b25 c20
tof b25 b31
tof b25 b23
tof b25 a23
tof b25 c18
tof b25 c16
tof b25 b8
tof b25 b5
tof b25 a11
tof b25 a17
tof b25 a19
tof b25 c21
tof b25 b19
tof b25 b22
tof b25 c2
tof b25 c19
tof b25 c25
tof b25 c9
tof b25 b1
tof b25 c10
tof b25 a29
tof b25 b11
tof b7 b13
tof c6 a8
tof b7 a24
tof b7 a9
tof b7 a10
tof b7 a11
tof c6 c22
tof c6 a19
tof b7 a15
tof b7 a0
tof b7 b19
tof b7 a2
tof b7 b22
tof b7 b0
tof b7 c2
tof b7 c19
tof b7 c25
tof b7 a7
tof b7 c9
tof b7 b1
tof b7 c10
tof b7 a29
tof b7 b11
tof b7 c11
tof b7 b25
tof b7 b30
tof b14 c14
tof c17 a4
tof c17 c14
tof b2 a4
tof b2 c14
tof b14 b20
tof a4 c27
tof c17 b26
tof b2 c4
tof b2 a5
tof b2 a24
tof b2 c1
tof b2 c15
tof b2 a3
tof b2 a9
tof b14 b6
tof b14 c20
tof b14 a13
tof b14 a10
tof b14 b12
tof b2 c21
tof b14 a29
tof b21 b4
tof b15 c27
tof b15 c4
tof b15 a4
tof b15 a5
tof b15 c14
tof b15 a24
tof b15 c1
tof b15 c15
tof b15 a3
tof b15 a9
tof b15 c21
tof b15 b2
tof b21 a19
tof c3 a20
tof c3 b16
tof c3 a14
tof c3 b10
tof c3 c31
tof c3 a25
tof c3 b20
tof c3 a8
tof c3 c0
tof c3 c16
tof c3 b8
tof c3 b5
tof c3 c22
tof c3 c21
tof c3 b17
tof c3 c6
tof c3 b14
tof c3 a19
tof c5 a27
tof a31 c27
tof a31 b26
tof a31 a4
tof a31 c14
tof a31 c17
tof c5 a16
tof c8 b10
tof c8 a26
tof a12 c8
tof a12 b16
tof a12 a14
tof a12 b9
tof a26 b21
tof c12 b16
tof c12 a14
tof c12 b9
tof a30 b21
tof b27 b14
tof b18 b21
tof c28 b21
tof c28 c27
tof c28 b26
tof c28 a4
tof c28 c14
tof c28 c17
tof c28 a31
tof c28 a19
tof b18 a30
tof b18 a21
tof c13 c3
T* b15
T* c13
T* c3
T* b18
T* b17
T* a21
T* b27
T b14
T c12
T* a12
T* c8
T* a26
T a30
T* c28
T a19
T b21
T* c5
T* a16
T* b28
T* a1
T* a18
T* c23
T* c6
T b7
T b30
T* b25
T c11
T* b11
T a29
T* c10
T* b1
T* c9
T a7
T* c25
T* c19
T* c2
T b0
T* b22
T a2
T* b19
T* a0
T a15
T a31
T* b2
T c21
T* c17
T* b12
T c22
T* a17
T* a11
T* b5
T* c24
T* b13
T* b8
T* a28
T* c16
T c0
T* c18
T* a23
T* b23
T* b29
T* b31
T* a10
T a13
T* c20
T a22
T* b6
T* a9
T* a3
T* b24
T* c26
T* c15
T* c1
T* a24
T c14
T* a5
T a4
T* c4
T* b26
T c27
T* a27
T* a6
T* b4
T* a8
T* b20
T* a25
T* b9
T* c31
T* b3
T* b10
T* a14
T* b16
T* c7
T* a20
tof a26 c3
tof a30 c3
tof a19 c3
tof b21 c3
tof a18 b15
tof b7 c3
tof b30 c13
tof c11 c13
tof b1 c3
tof c9 c3
tof b22 c3
tof b2 b15
tof c22 c3
tof a23 c23
tof b29 c3
tof a13 c13
tof c20 c13
tof b24 c3
tof c26 c3
tof c23 b15
tof c23 c13
tof c18 c13
tof c18 c3
tof b30 a21
tof b25 a21
tof c11 a21
tof b1 a21
tof a17 b17
tof a28 a21
tof c16 a21
tof c0 a21
tof c18 a21
tof a13 a21
tof c20 a21
tof a14 b17
tof a21 b18
tof b12 b17
tof c23 a21
tof b12 a21
tof c8 c12
tof a30 b14
tof a19 b14
tof b21 b14
tof b7 b14
tof b30 c23
tof c11 b25
tof b11 b14
tof a29 b14
tof b1 b14
tof c9 b14
tof c25 b27
tof b22 b25
tof c22 b14
tof c16 a28
tof c0 a28
tof c18 c12
tof b29 b14
tof a13 b25
tof c20 b25
tof b24 b25
tof c26 b25
tof b14 b27
tof c23 b27
tof b25 b27
tof b25 b14
tof a28 b14
tof c23 c12
tof b25 c12
tof a30 a26
tof c28 c8
tof b21 a26
tof b7 a19
tof b1 a26
tof c9 a26
tof b0 c2
tof b22 c2
tof a2 a12
tof c22 a19
tof c18 a19
tof b29 a19
tof b24 a19
tof c26 a19
tof a26 a12
tof a19 a12
tof a26 c8
tof a19 a26
tof c2 a26
tof b21 a30
tof a16 c5
tof a1 a30
tof c23 c5
tof b1 a30
tof a7 c28
tof b19 a30
tof a15 a30
tof a28 a30
tof c18 b25
tof b24 a30
tof c26 a30
tof a19 a30
tof b25 a30
tof c9 a30
tof a19 c28
tof c9 c28
tof b22 c28
tof c5 a19
tof b25 a19
tof b22 a19
tof c23 b21
tof c9 b21
tof b22 b21
tof b5 a16
tof a28 c5
tof c18 b21
tof b29 b21
tof b24 b21
tof c26 b21
tof b3 b8
tof c5 b21
tof b25 c5
tof b8 c5
tof b8 a16
tof c23 b28
tof c9 b28
tof b22 b25
tof b2 a18
tof a28 a18
tof b23 a1
tof a10 a18
tof a13 c18
tof c20 b28
tof b24 b25
tof c26 b25
tof c18 b28
tof b25 a1
tof b25 a18
tof c18 a18
tof b25 c23
tof c9 b7
tof a7 b7
tof c22 c6
tof c24 c6
tof a28 b7
tof c18 b7
tof b29 b7
tof b31 b7
tof a13 b7
tof b24 c6
tof c26 c6
tof b22 c23
tof a2 c23
tof a2 c6
tof b22 b7
tof a2 b7
tof b11 c11
tof a29 c11
tof c9 b30
tof a7 b30
tof a2 b22
tof a28 b30
tof b31 b30
tof a10 a31
tof c20 c11
tof b25 b30
tof b22 b30
tof c11 b25
tof b22 b25
tof c18 b25
tof b22 c11
tof a31 c11
tof b1 a29
tof a7 c9
tof a0 b19
tof a15 b19
tof b31 c9
tof a29 b11
tof c9 b11
tof b22 b11
tof b22 a29
tof b19 a29
tof c9 c10
tof b22 c10
tof b22 b1
tof b19 a7
tof c24 a17
tof b31 a7
tof c9 b1
tof a17 c9
tof a17 a7
tof b0 c2
tof a2 c2
tof b31 c2
tof b22 c25
tof a17 c25
tof b22 c19
tof a17 c19
tof a17 c2
tof c17 a2
tof c22 a2
tof b31 b22
tof a22 b19
tof b24 a2
tof c26 a2
tof b22 b0
tof b19 b22
tof a17 b22
tof a17 a2
tof a31 a15
tof b31 a15
tof c20 a15
tof a22 a17
tof a0 b19
tof a17 b19
tof a25 a0
tof a17 a15
tof a25 a15
tof a10 b2
tof a22 a17
tof c15 a23
tof a17 a31
tof c20 a31
tof c21 b2
tof c20 b2
tof a17 c21
tof a23 c21
tof b24 c22
tof a8 b12
tof c22 c17
tof c26 c17
tof c22 b12
tof a17 b12
tof c26 b12
tof a17 c22
tof a28 c22
tof b8 b5
tof b3 b5
tof c24 a17
tof a28 a17
tof c24 a11
tof c24 b5
tof a28 b5
tof c16 a28
tof c0 a28
tof a23 b13
tof c20 a28
tof a3 b8
tof c15 b13
tof b3 b8
tof a28 c24
tof a28 b8
tof a10 c16
tof b6 c0
tof b23 a28
tof c0 c16
tof b23 c0
tof c20 c0
tof c20 b23
tof c1 a23
tof b23 c18
tof a10 c18
tof a13 c18
tof b23 a23
tof a13 a23
tof a10 b23
tof b6 b23
tof b6 c20
tof a3 c20
tof a10 b29
tof c20 a10
tof c1 c20
tof c20 a13
tof b6 c20
tof a5 c14
tof a3 b6
tof c14 a3
tof c4 c15
tof b26 a5
tof c26 b24
tof c14 b24
tof c14 c26
tof a5 c26
tof c14 c15
tof a5 c14
tof b26 a4
tof a8 a24
tof c14 a24
tof a4 c14
tof b26 a4
tof c27 a4
tof a6 c4
tof a8 a5
tof a8 c4
tof a6 b26
tof b4 b26
tof a8 a6
tof b9 a25
tof a20 c31
tof a20 c7
tof b3 b10
tof c31 b10
tof c31 b3
tof b3 c7
tof a25 b9
tof b20 a14
tof a6 b4
tof a6 b9
tof a6 a25
tof c27 b4
tof b26 b4
tof b4 a14
tof b4 b3
tof c4 b26
tof a4 b3
tof a5 b3
tof a5 b26
tof b3 b10
tof b3 a20
tof a4 a14
tof c4 b9
tof c4 a25
tof a5 a8
tof b3 c31
tof a4 b4
tof a4 c27
tof c4 a6
tof c14 b4
tof a24 b4
tof c14 b10
tof c14 a20
tof c14 a14
tof b4 b9
tof b4 a25
tof c14 c31
tof c14 b3
tof c14 c27
tof a24 a5
tof a24 c4
tof c14 a4
tof c26 a14
tof c15 b26
tof a3 a5
tof b6 a9
tof b6 a5
tof a3 b10
tof a3 a20
tof b6 a14
tof a5 b9
tof a5 a25
tof a3 a8
tof a3 c31
tof a3 b3
tof a5 b4
tof a3 b24
tof b6 b26
tof b6 c1
tof b6 b20
tof a3 c15
tof a5 c4
tof a5 a24
tof b6 a6
tof c20 c1
tof a13 c20
tof a22 c31
tof c1 b4
tof a13 c15
tof a22 c4
tof a22 a6
tof a13 c27
tof a10 a6
tof b31 a6
tof b31 b16
tof b31 b10
tof b31 a20
tof a10 a14
tof a6 b9
tof a6 a25
tof b31 a8
tof b31 c31
tof b31 b3
tof b29 b4
tof a10 b24
tof a10 b26
tof b29 c1
tof a6 c15
tof a6 c4
tof b31 a24
tof b31 c26
tof a10 a3
tof a10 c27
tof a10 a13
tof a10 a9
tof b31 a22
tof a10 b6
tof a23 c27
tof c18 a23
tof c18 b23
tof c18 b4
tof c27 b26
tof c18 b29
tof a23 c15
tof c18 a13
tof c0 a24
tof c16 c0
tof c16 c18
tof a28 a24
tof a28 c0
tof a28 c18
tof c16 b9
tof c16 a25
tof a28 b4
tof c16 b24
tof a28 b26
tof c16 c1
tof c16 b20
tof a28 b29
tof c18 c15
tof c16 c4
tof c16 a3
tof a28 c27
tof c16 a5
tof c18 b23
tof c16 a10
tof c18 c20
tof a28 a22
tof c16 b6
tof b8 b20
tof c24 b8
tof b8 b10
tof b8 a20
tof b20 a14
tof c24 b9
tof c24 a25
tof b8 a8
tof b8 c31
tof b8 b3
tof c24 b4
tof c24 b24
tof c24 b26
tof c24 c1
tof c24 c4
tof c24 a3
tof c24 c27
tof c24 a5
tof c24 c0
tof c24 a10
tof c24 a22
tof c24 b6
tof c24 c16
tof c24 a28
tof b5 a8
tof a11 b24
tof a17 a11
tof a17 b5
tof a17 b10
tof a17 a20
tof a17 b9
tof a17 a25
tof a17 c31
tof a17 b3
tof a17 b4
tof a17 b26
tof a17 c1
tof a17 a3
tof a17 c27
tof a17 a5
tof a17 c0
tof a17 a10
tof a17 b8
tof a17 a22
tof a17 a9
tof a17 b6
tof a17 c16
tof a17 a28
tof a17 c24
tof c22 a14
tof c22 c26
tof b12 a14
tof c17 b12
tof c17 c26
tof c26 a8
tof c17 b24
tof c26 c4
tof c26 a24
tof c21 c27
tof b2 b20
tof b2 c27
tof b2 c21
tof a31 c21
tof a31 b2
tof b20 c7
tof b20 b10
tof b20 a14
tof a31 a25
tof a31 a27
tof a31 b26
tof c27 a4
tof c27 c26
tof a31 a6
tof c27 c14
tof c27 a3
tof a31 a5
tof a31 a13
tof c21 a23
tof a31 c0
tof a31 a9
tof a31 b6
tof a31 c16
tof a31 c24
tof a15 a25
tof a0 a15
tof b19 a25
tof b19 a0
tof a0 b9
tof b19 a13
tof b19 a10
tof b19 b8
tof b22 b9
tof a2 a8
tof b22 c31
tof b22 a15
tof a2 b12
tof b22 c15
tof a2 c4
tof a2 a24
tof b22 a6
tof a2 c22
tof b22 a22
tof a2 c17
tof a2 b24
tof c2 b22
tof c19 b22
tof c25 a11
tof c2 c26
tof b22 a3
tof c2 b0
tof c2 b31
tof c9 b22
tof c9 a7
tof b1 b22
tof c9 b10
tof c9 a20
tof c9 b9
tof a7 c31
tof c9 b3
tof c9 a27
tof c9 a0
tof c9 c15
tof a7 a6
tof b22 a3
tof b1 a10
tof a7 a22
tof b1 c18
tof b1 b6
tof b1 c16
tof c9 b19
tof c9 b0
tof c9 c17
tof c9 c25
tof c9 b31
tof c9 c2
tof c9 c19
tof c9 a17
tof c9 b24
tof c9 a2
tof c9 b2
tof c9 a31
tof c9 a28
tof c9 c1
tof c9 b4
tof c9 b5
tof a29 b22
tof b11 a29
tof a29 a0
tof a29 c15
tof b11 a10
tof b11 c18
tof b11 b6
tof b11 c16
tof a29 a7
tof b25 c11
tof b30 b16
tof b30 b9
tof c11 a27
tof c11 a15
tof c11 b26
tof c11 a6
tof c11 a5
tof c11 a13
tof c11 a23
tof c11 c21
tof c11 c0
tof b25 a10
tof c11 a9
tof c11 b6
tof c11 c16
tof b25 b22
tof c11 c24
tof b25 b11
tof c11 a31
tof c11 b2
tof c23 c6
tof c23 b7
tof c23 b16
tof c23 a25
tof c23 a8
tof c23 c31
tof b7 a27
tof c23 a15
tof c23 a0
tof c23 b12
tof c23 a11
tof c23 c15
tof c23 c4
tof c23 a24
tof c23 c26
tof c23 a6
tof c23 a3
tof c23 c22
tof c23 a10
tof c23 a22
tof c23 c17
tof c23 c25
tof c23 b31
tof c23 c2
tof c23 c19
tof c23 c10
tof c23 b1
tof c23 b30
tof c23 b24
tof c23 a2
tof c23 b25
tof b28 a27
tof c5 a16
tof c5 c7
tof c5 a20
tof c5 c31
tof c5 b3
tof c28 b16
tof c28 b10
tof c28 a20
tof a19 b21
tof a19 c31
tof a12 a26
tof a12 c8
tof c8 b16
tof c8 b10
tof c8 a20
tof b27 b14
tof c12 b16
tof c12 a20
tof b27 a30
tof b18 b16
tof b17 a14
tof c13 c3
tof c13 b21
T* c13
T* a11
T b21
T* a21
T* b14
T* a12
T* a26
T* a15
T* b27
T* a19
T* c31
T* a16
T* a27
T* c15
T* b28
T* a1
T a30
T* a18
T* b15
T* a8
T* c6
T* b9
T* c23
P b23
T b23
T* c11
T* b25
T b2
T a2
T b24
T* a17
T c9
T b5
T* b4
T c1
T* a28
T* b7
T* a31
T* b30
T* b1
T b11
T* a29
T a7
T* c10
T* c19
T* c2
T* b31
T* c25
T* c17
T* b0
T* b19
T* b13
T* b29
T* c24
T* c20
T b22
T* c16
T* b6
T* c18
T* a9
T* a22
T* b8
T* a10
T* c0
T* c22
T c21
T* a23
T a13
T a5
T* c27
T* a3
T* c14
T* a6
T c26
T* a4
T* a24
T* c4
T* c28
T* b18
T* b20
T* b12
T* b26
T* a0
T* b17
T* c5
T* b3
T* c8
T* c3
T* a25
T* c12
T* a14
T* a20
T* b10
T* c7
T* b16
tof c15 a11
tof b28 b21
tof a28 a11
tof a7 a11
tof c25 a11
tof b13 a11
tof b6 a11
tof c18 a11
tof a22 a11
tof b4 c13
tof c1 c13
tof b4 a11
tof c1 a11
tof a31 a11
tof c1 b21
tof a31 b21
tof a26 a12
tof c15 a12
tof c1 a12
tof a28 a12
tof a31 a12
tof a7 a12
tof c2 b14
tof b31 b14
tof b0 a12
tof b13 a12
tof b29 b14
tof c24 b14
tof c20 b14
tof c16 a21
tof c18 a12
tof a22 a12
tof c0 a21
tof a24 a21
tof b12 a21
tof c3 a12
tof b6 a21
tof b4 b14
tof b4 a12
tof b6 a12
tof a1 b27
tof a30 b27
tof a8 a15
tof a28 b27
tof a31 a15
tof b11 b5
tof c2 b27
tof b31 b27
tof b0 a26
tof b19 b27
tof b8 b5
tof a10 b5
tof c28 b27
tof b1 a26
tof b5 a15
tof b1 a15
tof b5 b27
tof b1 b27
tof b28 a27
tof a18 a19
tof a8 a16
tof a28 c31
tof a31 c31
tof c16 a19
tof b6 a19
tof a22 c31
tof c31 a19
tof a27 c31
tof a17 a27
tof b4 c15
tof c1 c15
tof a28 c15
tof b1 a27
tof b11 a27
tof a7 c15
tof b6 c15
tof c18 c15
tof a22 c15
tof a31 a27
tof a31 c15
tof c25 c15
tof a31 b28
tof c25 b28
tof c6 a18
tof a17 a18
tof c1 b4
tof a28 a1
tof b19 a30
tof b6 a31
tof c18 a31
tof a31 a1
tof b4 a30
tof a31 a30
tof b4 a18
tof a31 a18
tof a17 c6
tof b5 a8
tof b4 b15
tof b1 a31
tof c25 b15
tof b13 b15
tof c18 c16
tof b8 b11
tof a10 b11
tof c0 a8
tof c6 b15
tof c16 b15
tof a31 a8
tof c16 a8
tof a31 c6
tof b11 c6
tof c11 b23
tof a2 b23
tof b4 b9
tof c1 c23
tof b30 b9
tof b1 a31
tof c25 a28
tof b29 c23
tof c24 c23
tof c20 c23
tof c16 b23
tof c0 b23
tof c23 b9
tof a28 c23
tof a31 c23
tof a31 b23
tof a2 c11
tof b1 b25
tof b11 b25
tof c16 b25
tof b8 b25
tof a10 b25
tof c4 b25
tof b4 c11
tof a31 c11
tof c0 c11
tof b4 b25
tof c0 b25
tof b4 b2
tof a31 b2
tof b4 b24
tof a28 a2
tof b1 a17
tof b11 a17
tof b31 a17
tof c25 a2
tof b19 a2
tof c16 a2
tof b8 a17
tof a10 a17
tof c0 a2
tof c22 a2
tof a23 a2
tof a13 a2
tof a31 a2
tof a31 b24
tof b1 a28
tof b11 a31
tof c19 b5
tof b31 c9
tof c25 a31
tof b22 b5
tof c16 a28
tof b6 c9
tof c18 c9
tof a10 b8
tof c0 a28
tof b20 c9
tof a14 c9
tof b4 c9
tof b8 c9
tof b4 b5
tof a31 b5
tof b8 b5
tof a28 b4
tof a31 b4
tof a31 c1
tof a7 c1
tof c19 b7
tof c25 c10
tof b29 c1
tof c24 c1
tof c20 c1
tof b22 b7
tof c16 a28
tof a22 a28
tof b8 b7
tof c0 a28
tof a28 c1
tof b1 c1
tof b11 c1
tof b1 a28
tof c10 a28
tof b1 b7
tof b11 b7
tof c19 b1
tof c2 a31
tof b31 a31
tof c25 a31
tof b19 c10
tof b13 c10
tof b22 b1
tof a22 c10
tof b8 b1
tof a23 c10
tof a13 c10
tof c28 a31
tof b11 a31
tof b1 b30
tof b11 b30
tof b11 b1
tof c10 b1
tof c19 a29
tof b31 c2
tof c25 a29
tof b19 c10
tof b13 a29
tof c20 c2
tof b22 a29
tof c16 b11
tof b6 c2
tof c18 c2
tof a22 a7
tof a10 a29
tof c0 b11
tof a23 c10
tof a13 c10
tof a24 b11
tof c28 c2
tof c10 b11
tof a7 a29
tof c10 a29
tof c2 a7
tof b29 b19
tof c24 c2
tof c20 c2
tof b22 c19
tof b8 c19
tof c0 c16
tof a23 b19
tof a13 b19
tof c19 c10
tof c2 c19
tof c16 c19
tof b19 c2
tof b19 b0
tof c16 b29
tof b29 b31
tof b0 c25
tof b29 c25
tof b0 c17
tof b29 c17
tof b6 c24
tof c18 c24
tof a10 b8
tof a24 b0
tof b13 b0
tof b29 b0
tof b29 b19
tof c24 b19
tof b29 b13
tof c24 b13
tof b8 b13
tof c16 b29
tof b6 c20
tof c18 c20
tof b8 b29
tof a10 b29
tof c24 b29
tof a22 c24
tof a22 c20
tof c18 b6
tof a22 b22
tof b8 b22
tof a10 b22
tof c16 b22
tof a24 c16
tof a10 b8
tof a23 a9
tof a13 a9
tof a24 a22
tof c28 c18
tof a22 a9
tof b8 a22
tof c21 c0
tof a24 c0
tof b20 b8
tof a14 b8
tof a14 b20
tof a23 c21
tof b20 a23
tof c4 c27
tof b20 a13
tof a24 a13
tof a24 c27
tof a24 c14
tof c4 a3
tof b20 a3
tof b20 a6
tof a24 c26
tof a24 a4
tof c4 a24
tof b16 b18
tof c5 b20
tof c5 b26
tof a25 a0
tof b16 b3
tof c7 a14
tof c7 b10
tof a14 b10
tof a25 b10
tof a14 c7
tof c12 a20
tof c8 a20
tof c8 c12
tof b20 b26
tof b20 c5
tof b12 b17
tof b18 b16
tof c28 a25
tof c28 b16
tof c28 b18
tof c4 a25
tof c4 b18
tof b16 b3
tof c4 c12
tof a25 a0
tof a25 b10
tof c28 c8
tof c4 c5
tof c4 c3
tof c4 b12
tof c4 a14
tof a24 c12
tof a24 a0
tof a24 b10
tof a24 a25
tof a24 b18
tof a24 c3
tof a24 b12
tof a24 a14
tof a24 c4
tof a6 b26
tof a23 a6
tof c21 a6
tof a6 b26
tof a23 b20
tof c21 a3
tof c0 b26
tof c0 a3
tof a10 b26
tof a10 a3
tof a10 a23
tof b8 a3
tof b8 a23
tof b8 b10
tof a23 b20
tof a10 c3
tof b8 b17
tof b8 c7
tof b8 a14
tof a10 a4
tof a23 c26
tof c0 a6
tof a10 c14
tof b8 a13
tof c0 c21
tof b8 c5
tof a22 a23
tof a9 a23
tof a22 b26
tof a22 a25
tof a22 b17
tof a23 c26
tof a9 c14
tof a23 a3
tof a22 c27
tof a22 a13
tof a22 c21
tof a22 c5
tof a22 a10
tof a22 b8
tof b6 b8
tof c16 b8
tof c16 c12
tof c16 a0
tof c16 b26
tof c16 b10
tof c16 c22
tof c16 b18
tof c16 c3
tof b8 b17
tof c16 a14
tof c16 c26
tof c16 a3
tof c16 c4
tof c16 a24
tof c16 c5
tof c16 a10
tof c20 b8
tof c20 a9
tof c24 c4
tof c24 c20
tof b29 c4
tof b29 a9
tof c24 b3
tof b29 c12
tof c20 a0
tof c24 b26
tof c24 b16
tof b29 c3
tof b29 a14
tof b29 a4
tof c20 c26
tof c20 c14
tof c20 a3
tof c4 c27
tof c24 a13
tof c20 a23
tof c24 c21
tof c24 c5
tof c24 a10
tof c24 b22
tof c24 a22
tof b13 b26
tof b13 c3
tof b13 a4
tof b19 b26
tof b19 b13
tof b19 a22
tof b0 b26
tof b0 a4
tof b0 a22
tof b19 a20
tof a22 c12
tof b19 a0
tof a22 b10
tof a22 a25
tof b0 c22
tof b13 b20
tof a22 c7
tof b19 a14
tof b0 a6
tof b0 a5
tof b19 a13
tof a22 c21
tof b0 c0
tof a22 c4
tof b19 a10
tof b0 a9
tof a22 c18
tof a22 b29
tof b19 c28
tof b19 b22
tof b19 c24
tof c17 a4
tof c17 b13
tof c25 b13
tof c25 c17
tof c25 a9
tof b31 b13
tof b31 a9
tof b31 a20
tof c25 c12
tof c25 b26
tof c25 b10
tof c25 a25
tof c25 c22
tof b31 b20
tof c25 c7
tof b31 a14
tof a9 c26
tof c25 a6
tof a9 c14
tof a9 a3
tof b31 c27
tof c25 a5
tof a9 a23
tof c25 c21
tof c25 c0
tof c25 c4
tof b31 a10
tof c25 c18
tof c25 b29
tof c25 a22
tof c25 b0
tof c2 a10
tof c2 b31
tof c19 a10
tof c19 c28
tof c19 b31
tof c10 c28
tof c10 b31
tof c19 b3
tof c2 a20
tof c2 c12
tof c28 a0
tof c2 b26
tof c28 b10
tof c28 a25
tof c10 c22
tof b31 b20
tof c19 b16
tof c28 b18
tof c28 c7
tof b31 a14
tof c10 a4
tof b31 c26
tof a10 c14
tof b31 a3
tof b31 c27
tof c10 a13
tof a10 a23
tof c19 c21
tof c19 c4
tof b31 b13
tof c19 a9
tof c28 c18
tof c2 b29
tof c19 c20
tof c10 b22
tof c10 c24
tof c19 b19
tof c10 c16
tof c10 c25
tof c19 c5
tof c10 a24
tof c10 b6
tof a7 a0
tof b11 a5
tof a7 c4
tof a7 b8
tof a7 a9
tof a7 c20
tof b11 b0
tof b11 c16
tof a7 c19
tof a7 c2
tof b1 b18
tof b1 c24
tof b1 b19
tof b30 b18
tof b30 c24
tof a31 b18
tof a31 b19
tof c24 b3
tof b19 a0
tof a31 b26
tof a31 b10
tof a31 a25
tof b1 c22
tof c24 b16
tof b1 a4
tof b19 a6
tof b1 c14
tof b19 c27
tof b1 a13
tof b1 a23
tof a31 c21
tof b19 c0
tof b1 c4
tof b30 a29
tof a31 b8
tof b1 a9
tof a31 c18
tof a31 b29
tof b1 c28
tof b1 b31
tof b1 b22
tof b1 a22
tof b19 b11
tof a31 c5
tof b19 a24
tof b19 b6
tof b19 c10
tof b1 c2
tof b1 c25
tof a31 a7
tof b7 b0
tof a28 b0
tof a28 c2
tof c1 c2
tof a28 b10
tof a28 b20
tof a28 c7
tof a28 a14
tof a28 c26
tof a28 a6
tof a28 c14
tof a28 a3
tof a28 a5
tof a28 a23
tof c2 c21
tof a28 c0
tof c1 c4
tof a28 b13
tof a28 a29
tof b7 a10
tof c1 b8
tof a28 a9
tof a28 c18
tof a28 a22
tof c1 c19
tof a28 b1
tof c1 a7
tof a28 b19
tof b4 b8
tof c9 b8
tof b4 a0
tof b4 b10
tof b4 c22
tof b4 b20
tof b4 c7
tof b4 a14
tof b4 a4
tof b4 a6
tof b4 c14
tof b4 c27
tof b4 a5
tof b4 a13
tof b4 a23
tof b4 c21
tof b4 c0
tof b4 c4
tof b4 b13
tof b4 c18
tof b4 c20
tof b4 a22
tof b4 c24
tof b4 b0
tof b4 c5
tof b4 c19
tof b4 b19
tof b4 c25
tof a17 a20
tof a2 c22
tof a17 b8
tof a17 a9
tof b24 b29
tof a17 c9
tof b2 b26
tof c11 b2
tof b25 a3
tof b25 c27
tof b25 c5
tof b25 a24
tof b9 c23
tof b23 c22
tof b23 b2
tof b23 c11
tof c23 c25
tof a8 a0
tof a8 b10
tof a8 a25
tof a8 b12
tof a8 a2
tof c6 b4
tof a8 b23
tof a8 b25
tof a18 b15
tof c15 b28
tof a27 a20
tof c15 c12
tof c15 b26
tof c15 b15
tof c15 c22
tof c15 b20
tof c15 c3
tof c15 a14
tof c15 b29
tof c15 c2
tof c15 b5
tof c15 b1
tof c15 b19
tof c15 c23
tof a27 a17
tof a19 a18
tof a16 a8
tof c31 a17
tof c31 a27
tof a15 a0
tof a15 b10
tof a15 a25
tof a15 b12
tof a26 b11
tof a12 c12
tof a12 b15
tof a12 c22
tof a12 c3
tof a21 c9
tof b14 c7
tof b14 c8
tof a21 b17
tof c13 b21
tof a11 a12
tof a11 b29
tof a11 b1
tof c13 a31
T* c13
T* a31
T c9
T* a21
T* b17
T* b14
T* c8
T* c7
T* a26
T* b11
T b27
T* c15
T* b9
T* b25
T* c31
T a27
T* a17
T* a16
T* a8
T* b28
T* c4
T* b21
T* a1
T* a30
T* a19
T* c1
T a18
T* b23
T* a11
T c6
T b4
T c23
T* c25
T* c11
T* b2
T* a28
T* b24
T b19
T* c17
T a7
T b1
T b5
T c2
T* c19
T* c10
T* b6
T* a24
T c5
T* b7
T* c16
T b0
T* b30
T c24
T* a22
T* b22
T* c20
T* b31
T* c28
T* b29
T* c18
T a9
T* b8
T a10
T* a29
T* b13
T* a2
T* c0
T c21
T* a23
T* a13
T* a5
T* c27
T a3
T* c14
P* a6
T* a6
T* c26
T* a4
T* a14
T* a15
T* b12
T* a12
T* c3
T* b18
T* b16
T* b20
T* c22
T* b15
T* a25
T* b10
T* b26
T* a0
T* c12
T* a20
T* b3
tof a21 c9
tof b14 c9
tof a8 a16
tof c1 c9
tof a11 c4
tof a28 c4
tof b24 c4
tof c2 c4
tof c10 c13
tof b6 c9
tof a24 a31
tof c5 a31
tof b7 a31
tof c16 a31
tof b0 a31
tof b30 c4
tof c24 c4
tof c20 c9
tof c28 c9
tof b29 a16
tof b8 c9
tof a15 a16
tof a0 a16
tof a16 c13
tof c4 c13
tof a16 a31
tof c4 a31
tof c4 c9
tof b24 b17
tof b6 a21
tof c28 b14
tof b29 b14
tof a12 b17
tof c22 b17
tof b22 a21
tof c4 b17
tof b22 b17
tof c4 b14
tof a24 a26
tof c16 a26
tof b29 b24
tof a12 c7
tof b15 c7
tof b24 c8
tof b24 c7
tof c4 b27
tof c1 b9
tof a18 b27
tof b4 b27
tof c17 c15
tof b5 b27
tof c2 b27
tof a24 b27
tof c5 b27
tof c16 c15
tof b0 c15
tof b30 b11
tof c24 b11
tof c20 b9
tof b31 c15
tof b29 b27
tof a10 c15
tof b13 c15
tof c21 b27
tof a23 b27
tof c15 b27
tof b9 c15
tof a1 b25
tof a11 b9
tof c23 b9
tof c25 b9
tof b24 b9
tof c2 b9
tof c10 b25
tof c5 b9
tof b7 c4
tof c16 c4
tof b0 c4
tof b29 b9
tof c4 b9
tof a24 b9
tof a24 b25
tof c4 c31
tof b4 c6
tof c10 c6
tof a24 c6
tof c5 c6
tof b7 a17
tof c16 a17
tof b0 a17
tof c24 a16
tof a22 a27
tof c20 c6
tof b31 a17
tof b29 c6
tof a17 a27
tof b30 a27
tof c4 a17
tof c6 a17
tof c4 a16
tof b30 a16
tof a11 b28
tof b4 a18
tof c23 b28
tof c25 b28
tof b24 b28
tof c2 c4
tof a24 b28
tof c5 b28
tof c16 b7
tof b0 b7
tof b30 c4
tof c24 a18
tof c20 a8
tof b29 c4
tof c21 a18
tof a23 a18
tof b7 a8
tof c4 b28
tof a18 c4
tof b7 c4
tof a18 b21
tof a11 b21
tof c11 b21
tof b2 b21
tof b24 b21
tof c10 a1
tof a24 b21
tof c5 b21
tof b7 b21
tof b30 a1
tof c24 c19
tof c21 b21
tof a23 b21
tof a15 c19
tof a0 c19
tof a30 a1
tof c19 a30
tof b4 c1
tof b24 a11
tof c17 a19
tof c5 c1
tof c16 a19
tof b0 a19
tof b30 a24
tof c24 a19
tof c20 c1
tof b31 a19
tof a10 a19
tof b13 a19
tof a18 a19
tof a11 a19
tof c2 a19
tof a18 c1
tof c2 c1
tof a24 c1
tof a11 a18
tof a24 a18
tof b7 a18
tof c11 b23
tof b24 b23
tof c2 a11
tof b7 a24
tof b30 b6
tof c24 b23
tof b29 c6
tof a9 c6
tof c21 b23
tof a23 c5
tof a13 c6
tof b12 b23
tof a12 b23
tof c22 b23
tof a0 b23
tof a11 b23
tof a24 b23
tof c5 b23
tof b6 a11
tof a24 a11
tof b6 c6
tof a24 c6
tof c5 c6
tof c19 c23
tof b7 a24
tof b30 c5
tof a23 c5
tof a24 b4
tof c5 b4
tof c25 c23
tof c5 c23
tof b6 c25
tof a24 c25
tof c2 b2
tof a24 b2
tof c5 c11
tof c16 a28
tof b30 a28
tof c24 a28
tof b29 b6
tof c21 c11
tof a23 c11
tof a14 b2
tof b6 c11
tof b6 b2
tof b7 b2
tof b7 a28
tof b1 b24
tof c2 b19
tof a24 b19
tof b7 b19
tof b0 c17
tof b30 b6
tof c24 b19
tof b31 c17
tof b29 b6
tof a10 c17
tof b13 c17
tof b6 b24
tof b6 b19
tof c19 b5
tof a24 b5
tof c5 b6
tof b7 b1
tof c16 b1
tof b0 b1
tof b30 b6
tof c20 b5
tof a9 b5
tof a23 b5
tof a13 b5
tof a12 b1
tof c12 b1
tof b6 a7
tof b6 b5
tof a24 c2
tof c16 c10
tof b0 c10
tof b30 c19
tof c24 c2
tof a10 c10
tof b31 c19
tof b31 c10
tof b7 b6
tof b30 a24
tof c24 c5
tof c20 b6
tof b31 a24
tof b29 a24
tof a9 b6
tof c21 c5
tof a13 b6
tof a15 c5
tof a0 c5
tof a24 b6
tof a23 b6
tof b8 a24
tof a23 c5
tof b30 b0
tof c24 b0
tof b31 c20
tof b29 c20
tof a9 c20
tof b8 c20
tof c21 c20
tof a13 c20
tof a15 b7
tof a0 b7
tof c20 b7
tof b0 c16
tof c20 b0
tof a10 b0
tof b22 c24
tof a29 c20
tof b13 a22
tof a15 c20
tof a0 c24
tof c24 b30
tof b31 b30
tof c20 c24
tof b31 c24
tof a10 c24
tof b31 a22
tof a10 a22
tof a9 b29
tof b8 b29
tof a10 b31
tof a29 b31
tof b13 c20
tof c21 b29
tof a13 b29
tof a15 b29
tof a0 c20
tof b31 b22
tof b31 c20
tof b29 b31
tof a10 c18
tof b13 c18
tof b16 c28
tof a2 c28
tof a15 c28
tof a9 b29
tof a15 b29
tof a9 c18
tof a2 c18
tof a29 a9
tof c21 b8
tof a13 b8
tof c27 b8
tof a0 a10
tof a10 a9
tof a0 a2
tof b13 a29
tof a2 a29
tof c0 a2
tof c27 c21
tof a15 a5
tof b18 c21
tof b3 c21
tof a23 c0
tof a13 c0
tof a23 c21
tof a13 a23
tof a5 a23
tof a6 c27
tof a15 c27
tof b12 c27
tof a0 a13
tof a3 a13
tof a3 c27
tof b12 a6
tof a0 a4
tof a4 a3
tof a4 c14
tof a0 c26
tof c12 a4
tof a0 a14
tof c12 a14
tof c22 a12
tof a0 b12
tof c12 b12
tof a0 c22
tof c22 c3
tof c22 b18
tof a0 b20
tof a20 c22
tof c12 c22
tof c12 b15
tof a20 a25
tof c12 a25
tof a0 b10
tof a0 b26
tof c12 b26
tof c12 a0
tof a20 a0
tof a20 c12
tof b3 c12
tof a20 b3
tof c12 b3
tof a0 a20
tof b10 b26
tof c22 a25
tof c22 c12
tof c22 a0
tof b18 a25
tof b18 c12
tof a12 c3
tof b12 c12
tof a15 c12
tof a15 c3
tof c12 b20
tof c12 b26
tof a12 a0
tof a15 b18
tof a15 b16
tof a14 c12
tof a4 a14
tof c12 b20
tof c12 b26
tof a4 c3
tof a4 a20
tof a4 b18
tof a4 b12
tof a6 b12
tof a3 b12
tof a3 c14
tof b12 c12
tof a3 c3
tof a3 a20
tof a3 b18
tof a3 a14
tof c14 a15
tof a3 a4
tof c27 c12
tof c27 b18
tof a5 c12
tof a5 a20
tof a13 a20
tof a13 c27
tof a13 c3
tof a13 c22
tof a13 b12
tof a13 a14
tof a13 a4
tof a13 a3
tof a23 c12
tof a23 a20
tof c21 c12
tof c0 c21
tof c0 a20
tof a20 c3
tof a20 c22
tof a20 b12
tof a20 a14
tof a20 c27
tof a20 a4
tof a20 a3
tof a20 a13
tof a23 a5
tof a2 a14
tof a2 a4
tof a2 a13
tof b13 a14
tof b13 a2
tof a29 a4
tof a29 a2
tof a4 b20
tof a14 c12
tof a4 a0
tof a2 c3
tof a2 c21
tof a13 c22
tof a2 b12
tof a4 b3
tof a2 c27
tof a13 c14
tof b13 c26
tof b13 a6
tof a13 a15
tof b13 a5
tof b13 a20
tof a10 c21
tof a10 a2
tof b8 c21
tof a9 a2
tof a10 c12
tof b8 b18
tof a2 c22
tof a10 b12
tof a10 a14
tof b8 c27
tof a2 a3
tof a10 c26
tof a10 a6
tof a10 a15
tof a10 a23
tof a2 a20
tof a2 c0
tof a9 a29
tof a9 a5
tof c18 a14
tof b29 c12
tof b29 c18
tof c28 c12
tof c12 b20
tof b29 b18
tof b29 c22
tof c28 b16
tof b29 c27
tof c18 c14
tof b29 a3
tof b29 a2
tof b29 a29
tof b31 a29
tof b31 a5
tof b31 a9
tof c20 c12
tof c20 a29
tof c20 a5
tof b22 c12
tof b22 a29
tof b22 b31
tof c12 b20
tof b22 a0
tof b22 c3
tof b22 c21
tof a29 c22
tof a29 b16
tof b22 b12
tof a29 c28
tof b31 b10
tof a9 a14
tof b22 c27
tof b22 a4
tof c20 c14
tof b31 a3
tof c20 c26
tof c20 a6
tof a29 a15
tof a29 a13
tof a9 b8
tof a5 a23
tof b31 a20
tof a29 c18
tof b31 a2
tof c20 b13
tof a9 b29
tof b31 c0
tof c20 b3
tof a22 c18
tof c24 b3
tof b30 c18
tof b30 b3
tof b30 b20
tof c24 c12
tof b30 a0
tof b30 c3
tof b30 c21
tof b30 c22
tof b30 b16
tof b30 b12
tof b30 c28
tof b30 b10
tof c18 a14
tof b30 c27
tof b30 a4
tof c18 c14
tof b30 a3
tof b30 a15
tof b30 a13
tof b30 a20
tof b30 a2
tof b30 a29
tof b30 a10
tof b3 b29
tof b30 c0
tof b30 b31
tof c24 b22
tof b0 c27
tof b0 a15
tof c16 c27
tof c16 a15
tof c16 c20
tof b7 c27
tof b7 b0
tof b7 c20
tof b7 b20
tof c27 a25
tof b7 c12
tof c20 a0
tof b0 c3
tof b7 c21
tof c16 b18
tof c16 c22
tof b7 b16
tof b7 c28
tof b7 b10
tof b7 a14
tof c16 b15
tof c20 a4
tof a15 c14
tof b7 c26
tof b7 a13
tof b7 b8
tof b0 a23
tof b7 a20
tof c20 c18
tof b7 a29
tof b7 b13
tof c16 a10
tof c16 a5
tof b7 b29
tof b7 a9
tof b7 b31
tof c16 a22
tof b7 b22
tof b7 c24
tof b7 c0
tof c5 c21
tof c5 a6
tof c5 b7
tof a24 a6
tof a24 b29
tof a24 b7
tof b6 c21
tof b6 a6
tof b6 a24
tof a6 a25
tof b29 c12
tof a6 b18
tof b6 c22
tof a6 b12
tof a6 c27
tof c5 a3
tof c5 a15
tof c5 a13
tof a24 b8
tof b7 a23
tof b7 a20
tof c5 a2
tof c5 a29
tof b7 a5
tof b7 b31
tof b7 a22
tof b7 c20
tof b7 b22
tof b7 c24
tof b7 c16
tof c19 b20
tof c2 b20
tof c2 b26
tof c19 a0
tof c2 a14
tof c19 a4
tof c10 a23
tof c10 a20
tof c19 a2
tof c19 b0
tof c19 b6
tof c19 b30
tof b1 a0
tof b1 c3
tof b1 b18
tof b1 c22
tof b1 b15
tof b1 a4
tof c17 c3
tof b24 c3
tof b24 a0
tof b24 b18
tof b24 c22
tof b24 b15
tof c17 c27
tof b24 a4
tof b24 b1
tof b24 a3
tof b24 c26
tof b24 a15
tof b24 b8
tof b24 a29
tof c11 b2
tof a28 a25
tof b2 b26
tof c11 b12
tof c11 a6
tof c23 b5
tof b4 b5
tof c23 b20
tof c23 a4
tof c23 a2
tof b4 a24
tof c23 b6
tof c6 b24
tof a11 c6
tof a11 a25
tof a11 c3
tof a11 c21
tof c6 c22
tof b23 b12
tof a11 b15
tof a11 a4
tof a11 b1
tof a11 a3
tof a11 c26
tof b23 a6
tof a11 a15
tof a11 b8
tof a11 a29
tof a11 b5
tof a11 a24
tof a11 b6
tof a11 b19
tof a11 c11
tof a11 b4
tof a11 a0
tof a18 a25
tof a18 b26
tof a18 c3
tof a18 c22
tof a18 b12
tof a18 a14
tof a18 b15
tof a18 b1
tof a18 c26
tof a18 a6
tof a18 a13
tof a18 c2
tof c1 b5
tof c1 a24
tof a18 c6
tof a18 b29
tof a18 c5
tof a18 a7
tof a18 c25
tof a18 b4
tof a19 c17
tof a18 a11
tof a18 c23
tof a18 a0
tof a1 a30
tof a30 c19
tof a30 b30
tof a30 c23
tof a30 a0
tof c4 b21
tof b28 b21
tof c4 a25
tof c4 b26
tof b21 b2
tof c4 c3
tof c4 c22
tof c4 b12
tof c4 a14
tof c4 b15
tof c4 b1
tof c4 c26
tof c4 a6
tof c4 a13
tof c4 c2
tof c4 b5
tof c4 a24
tof c4 c6
tof c4 b29
tof c4 c5
tof c4 a7
tof c4 c25
tof c4 b4
tof c4 c1
tof c4 a11
tof c4 c23
tof c4 a0
tof b28 a1
tof c4 a18
tof a16 b26
tof a17 c22
tof a16 b16
tof a16 b12
tof a16 c28
tof a16 b10
tof a16 b15
tof a27 b29
tof a16 c5
tof a16 b23
tof a16 b30
tof a16 a30
tof a27 b28
tof b9 b20
tof b9 b2
tof b9 c21
tof c31 c22
tof b9 b21
tof b9 a4
tof b9 a2
tof b9 b5
tof b9 b6
tof b9 c25
tof b9 c23
tof b9 a1
tof b9 a18
tof b9 b28
tof c15 b20
tof b11 c12
tof c15 b2
tof c15 c21
tof c15 b21
tof c15 a4
tof c15 a2
tof c15 b5
tof c15 b6
tof c15 c25
tof c15 a1
tof c15 a18
tof c15 b28
tof b27 c4
tof c15 b9
tof a26 c12
tof c8 c3
tof c8 a12
tof a21 b17
tof b14 c3
tof b14 c7
tof b14 a12
tof b14 c8
tof b14 a11
tof c13 a31
tof a31 c4
tof a31 b27
tof c13 a16
tof c13 b15
tof c13 b12
T* c13
T* b12
T* a31
T* b15
T* b16
T* a16
T* a21
T c9
T* b14
T* c15
T* a11
T* a26
T b11
T b27
T* b9
T* c4
T c31
T a17
T* a27
T a8
T* b28
T* c27
T* a18
T* a1
T a30
T* a0
T* c23
T b30
T* b25
T* c19
T* a19
T* c17
T* c1
T* b4
T* c25
T* a28
T b23
T* c11
T* c14
T* b19
T* a7
T c5
T c18
T b29
T* c6
T b24
T b6
T a24
T b5
T* b7
T c0
T* c16
T c24
T* b3
T* b22
T* c20
T a22
T* b31
T* a9
T b0
T* c10
T* a5
T* a10
T* b13
T* a29
T* a2
T* c2
T a20
T a23
T b8
T* a13
T a15
T* a6
T* c26
T a3
T* b1
T* a4
T* b21
T* c8
T* a14
T* b10
T* a12
T* c28
T* c7
T* b17
T* c22
T* b18
T* c21
T* c3
T* b2
T* c12
T* b26
T* a25
T* b20
tof a16 b12
tof c15 b12
tof b11 a31
tof c23 b12
tof b30 a31
tof b23 b12
tof c11 b12
tof b19 b12
tof b24 c6
tof b6 b12
tof b7 a31
tof b3 c19
tof b22 c19
tof a5 a31
tof a10 a31
tof c28 a31
tof c12 a31
tof c6 c13
tof c19 b12
tof c6 b12
tof c19 a31
tof c27 b16
tof a30 b16
tof a19 b16
tof c17 b16
tof c25 b16
tof c14 a16
tof b7 a16
tof c20 a16
tof a22 a16
tof b0 c16
tof b13 c16
tof c8 a0
tof a16 b15
tof c16 b15
tof c19 b16
tof c16 b16
tof a0 a16
tof c19 a16
tof c15 c9
tof a8 b14
tof c27 a11
tof c23 c9
tof b25 c9
tof a19 a11
tof c17 a11
tof c14 a11
tof c6 b14
tof b24 b14
tof b6 c9
tof b7 c9
tof c0 c9
tof c20 c9
tof a22 c9
tof b0 c16
tof a5 c9
tof a10 a21
tof c16 a21
tof b31 a21
tof a11 c9
tof c16 c9
tof a11 b14
tof b31 b14
tof b11 a26
tof b9 c15
tof c4 c15
tof c31 c15
tof a17 c15
tof a18 a26
tof c23 c15
tof b30 a26
tof c19 a27
tof c6 c15
tof b24 c15
tof b6 c15
tof a24 c15
tof b22 c16
tof b31 c15
tof a5 c0
tof a10 a26
tof b21 a11
tof a14 a11
tof c28 a26
tof b2 a11
tof c12 a26
tof a26 c15
tof b7 c15
tof c0 c15
tof b7 a11
tof c0 a11
tof c16 a11
tof a27 a26
tof b7 a26
tof c16 a26
tof c4 b27
tof a17 b9
tof a27 b9
tof b30 b11
tof a19 b9
tof c17 b9
tof c14 c19
tof c6 b9
tof b24 b9
tof c16 b9
tof c20 c19
tof a22 c19
tof b31 b9
tof b0 b11
tof a10 b11
tof b13 b27
tof c2 b27
tof c28 b11
tof c12 b11
tof c19 b11
tof b7 b11
tof b7 b27
tof c0 b27
tof c19 b9
tof b7 b9
tof c0 b9
tof a30 c31
tof c19 c31
tof c17 a19
tof c11 c31
tof c14 a19
tof c6 a17
tof b24 a17
tof a24 c31
tof c0 a17
tof c16 b7
tof b22 b7
tof c20 b7
tof a22 b7
tof b0 c31
tof b21 a5
tof a14 a5
tof b2 a5
tof c31 c4
tof a19 c4
tof b7 c4
tof a19 c31
tof a5 c31
tof a19 a17
tof b7 a17
tof a18 c27
tof c19 a27
tof a19 c27
tof b4 c27
tof c14 a27
tof b29 a8
tof b24 c6
tof b7 c27
tof c0 c27
tof b22 a27
tof a22 c20
tof b31 a8
tof a29 a8
tof b28 a27
tof c6 a27
tof c20 a27
tof b28 a8
tof c20 a8
tof c27 b28
tof c6 b28
tof b25 a1
tof c19 a1
tof b4 a18
tof c25 a18
tof c14 a1
tof c16 c0
tof b22 c0
tof c20 a1
tof c2 c0
tof a18 c27
tof c6 c27
tof c0 a18
tof c6 a1
tof c14 c23
tof c5 a30
tof b29 a30
tof c6 c19
tof c0 a0
tof b31 a30
tof b0 a30
tof c10 a0
tof c2 b7
tof c8 a0
tof c19 a30
tof b7 a30
tof c20 a30
tof b7 a0
tof c20 a0
tof c19 c23
tof c20 c23
tof c6 c19
tof b7 b25
tof c16 c19
tof b22 c19
tof c20 c0
tof c10 c14
tof a10 b30
tof c8 c14
tof a12 c14
tof c28 b30
tof c19 b30
tof c12 b30
tof c19 b25
tof c0 b25
tof c12 b25
tof c14 c19
tof c0 c19
tof b4 c1
tof c25 c1
tof c11 c1
tof c5 c1
tof c6 c1
tof b7 c17
tof c0 c17
tof c16 c17
tof b3 c17
tof c20 c17
tof b31 c1
tof c10 c14
tof a29 c1
tof c8 c14
tof a12 c14
tof c14 a19
tof c14 c17
tof c14 a28
tof c6 c25
tof b7 a28
tof c0 a28
tof b22 c25
tof c20 a28
tof a10 a28
tof b13 c16
tof c25 b4
tof c16 c25
tof b19 b23
tof c6 c5
tof b24 c5
tof b6 c11
tof c0 b23
tof c20 b23
tof b31 c11
tof a29 c5
tof c2 b23
tof a14 c14
tof b2 c14
tof c5 b23
tof c5 c11
tof c16 c5
tof b22 c5
tof b31 c5
tof b0 a7
tof b13 c5
tof c2 b19
tof a4 c5
tof a14 a7
tof b2 a7
tof c0 b19
tof c20 b19
tof b7 a7
tof c0 a7
tof c20 a7
tof b7 c5
tof c0 c5
tof b7 b24
tof c20 c6
tof a22 c18
tof b31 c18
tof b0 b24
tof c8 c18
tof a14 b24
tof a12 c18
tof b2 b24
tof c0 c18
tof c6 b29
tof c0 b29
tof b24 c6
tof c0 c6
tof b5 b6
tof b7 b24
tof b22 b24
tof c20 b6
tof a9 a24
tof b0 b6
tof b13 c16
tof a6 a24
tof a14 b6
tof b2 b6
tof c16 b24
tof c16 b6
tof a29 b6
tof a29 a24
tof c16 b5
tof b22 b5
tof c20 b5
tof a29 c0
tof c8 c10
tof a12 c10
tof b2 a14
tof b7 b5
tof c0 b5
tof c10 b7
tof a14 b7
tof a14 c0
tof a22 c24
tof a5 c16
tof b13 c24
tof b21 c16
tof a14 c16
tof c20 c16
tof a10 c16
tof c20 c24
tof a10 c24
tof a2 c24
tof c20 b3
tof a2 b3
tof b31 c20
tof c10 c20
tof a5 a22
tof a10 a22
tof a29 a22
tof b21 a22
tof c8 c20
tof a14 a22
tof a12 c20
tof b13 c20
tof b13 a22
tof a5 c10
tof a10 b0
tof b13 c10
tof b21 c10
tof c8 c10
tof a14 b31
tof a12 c10
tof a9 b31
tof b0 b31
tof b0 a9
tof c10 a9
tof c10 b0
tof a29 b0
tof a29 a5
tof b21 a5
tof a14 b13
tof a10 c10
tof b13 c10
tof b13 a5
tof a2 a5
tof a2 a10
tof a23 a2
tof a14 b13
tof a14 c2
tof a13 c2
tof a13 a23
tof c30 a13
tof b21 a6
tof c8 c26
tof a12 c26
tof b18 c26
tof c30 c26
tof a14 a6
tof a14 c26
tof c8 b1
tof a14 b21
tof a12 a4
tof c28 b1
tof c22 a4
tof c3 b1
tof c12 b1
tof a12 a14
tof c3 c28
tof c12 c28
tof b26 b10
tof a25 b18
tof c30 b18
tof a14 c8
tof b18 c8
tof c28 a14
tof b18 a14
tof b18 b10
tof b17 c28
tof c12 c3
tof c30 c7
tof c28 a12
tof b18 a12
tof c3 c28
tof b18 c7
tof c3 c22
tof c30 b18
tof b18 c22
tof c21 b18
tof c30 c21
tof c12 c21
tof c12 b2
tof c30 c12
tof c30 b26
tof c30 b20
tof c12 b26
tof c12 b20
tof c12 c30
tof c3 b26
tof c21 b26
tof b2 b20
tof c21 c30
tof b18 c30
tof b17 c30
tof b17 c22
tof b18 b26
tof b18 c21
tof b17 c3
tof c28 c3
tof a12 c28
tof c3 b26
tof a12 c30
tof c28 c21
tof c28 c22
tof c28 b2
tof c28 c12
tof b10 b26
tof a14 b26
tof a14 a12
tof c8 b26
tof c8 b10
tof c8 a14
tof a14 c30
tof a12 c22
tof c8 b2
tof c8 b18
tof c8 c12
tof a14 c3
tof c8 c28
tof a12 b17
tof c8 c7
tof c8 a25
tof a4 c22
tof a6 b18
tof c26 a25
tof a13 c22
tof a13 b18
tof a13 c7
tof a13 c8
tof a13 c26
tof a13 c12
tof a23 c7
tof a23 c26
tof a23 c12
tof a23 a13
tof a20 b17
tof a2 c12
tof a2 a23
tof a29 a23
tof b13 c12
tof b13 a23
tof a29 b20
tof a29 c30
tof a29 c21
tof a23 c22
tof c12 b2
tof a23 b18
tof c12 b1
tof c12 c28
tof a29 a12
tof a2 c7
tof a23 c2
tof c12 a14
tof a23 c8
tof a2 c26
tof a29 c3
tof a2 a13
tof b13 a25
tof a10 a25
tof a10 a20
tof a10 a29
tof a5 a6
tof a5 a20
tof a5 a29
tof c10 a6
tof c10 a25
tof c10 a20
tof c10 b26
tof c10 c30
tof a5 c22
tof a5 b2
tof a6 b18
tof a29 b10
tof a10 b1
tof a5 c28
tof a29 c7
tof a5 c2
tof a10 a14
tof a5 c8
tof a25 c26
tof a10 c12
tof c10 c3
tof a20 b17
tof a5 a23
tof a5 b13
tof b0 c2
tof b0 b17
tof b0 b13
tof a9 c2
tof a9 c12
tof a9 b0
tof b31 c2
tof b31 c12
tof b31 b13
tof c12 b26
tof c12 c21
tof b31 c22
tof b31 b2
tof b31 b1
tof b31 c28
tof b13 a6
tof b13 c7
tof b31 a14
tof b31 c8
tof b31 c26
tof b17 c3
tof b13 a13
tof b13 a25
tof b31 a23
tof b13 a2
tof b13 a29
tof c20 a9
tof b22 a22
tof b22 c20
tof b22 b26
tof b22 c21
tof a9 c22
tof a9 b2
tof c20 b10
tof a9 b1
tof a9 c28
tof a9 c7
tof b22 c2
tof a9 a14
tof a9 c8
tof a9 c26
tof b22 c12
tof c20 a13
tof a9 a25
tof a9 a23
tof c20 a2
tof a22 a20
tof c20 a29
tof c20 b13
tof a22 a5
tof a9 b31
tof b22 b0
tof c16 b3
tof c16 b26
tof c16 c21
tof c16 b10
tof c16 c2
tof c16 c12
tof c16 a13
tof c16 a23
tof c16 a2
tof c16 a20
tof c16 a29
tof c16 b13
tof c16 a5
tof b3 c10
tof c16 a22
tof c16 c20
tof c16 b22
tof c0 c30
tof b7 c30
tof c0 b20
tof c30 b26
tof c0 c21
tof c0 b2
tof b7 b18
tof b7 b10
tof c30 b1
tof c0 c28
tof c30 a6
tof c0 a12
tof b7 c7
tof c0 c2
tof c30 a14
tof b7 c8
tof b7 c26
tof b7 c12
tof b7 c3
tof c30 a13
tof c30 b17
tof c30 a23
tof c30 a2
tof c30 b13
tof c30 a10
tof c30 b3
tof c30 b22
tof c30 c16
tof c30 b31
tof c30 a9
tof c30 c20
tof a24 a6
tof b24 a6
tof b6 b5
tof b24 b2
tof b24 b18
tof b24 b10
tof b24 c28
tof b24 a12
tof b24 c7
tof b6 c3
tof b24 b21
tof b6 a25
tof b24 c16
tof b24 b31
tof c6 b6
tof b29 b6
tof c6 b5
tof c6 b2
tof c6 b18
tof c6 b10
tof c6 c28
tof c6 a6
tof c6 a12
tof c6 c7
tof b6 c3
tof c6 b21
tof b29 a13
tof b29 a3
tof b6 a25
tof b29 a24
tof b29 a15
tof b29 a23
tof b29 b8
tof b29 a20
tof b29 a29
tof b29 b13
tof b29 a5
tof b29 c24
tof b29 a10
tof b29 c10
tof b29 b3
tof b29 b0
tof b29 a22
tof b29 c0
tof c6 c16
tof c6 b31
tof c6 b24
tof c5 c22
tof c5 a4
tof a7 a9
tof a7 c2
tof c14 c22
tof c11 c22
tof c14 b26
tof c11 b5
tof c11 a4
tof c14 b1
tof c14 c28
tof c14 c7
tof c11 c5
tof c14 a14
tof c11 c3
tof c14 c0
tof c11 b6
tof c14 c6
tof c14 b7
tof c14 a7
tof b4 b5
tof a28 b18
tof c25 c26
tof b4 a23
tof b4 b6
tof b4 c16
tof c25 c20
tof a28 b19
tof c1 b5
tof c1 b6
tof b25 b26
tof b30 b25
tof c19 b20
tof c19 c21
tof b30 b1
tof b30 c28
tof c19 a12
tof b30 a14
tof c19 c8
tof c19 c26
tof c19 c12
tof c19 c3
tof c19 c18
tof c19 b7
tof a0 c3
tof a30 c3
tof a0 b20
tof c3 c22
tof a30 b2
tof a30 b18
tof a30 b10
tof c3 a4
tof a30 c28
tof c23 a6
tof a0 a12
tof a30 c7
tof a0 c8
tof a0 c26
tof a0 c12
tof c23 b21
tof a30 a13
tof a30 a3
tof a30 a25
tof a30 a24
tof a30 a15
tof a30 b8
tof a30 a20
tof a30 a29
tof a30 b13
tof a30 a5
tof a30 c24
tof a30 a10
tof a30 c10
tof a30 b3
tof a30 b0
tof a30 a22
tof a30 c0
tof a30 b6
tof a30 c1
tof a30 b29
tof a0 c18
tof a30 c20
tof a0 c19
tof a18 a30
tof c27 a30
tof a1 b26
tof a1 b25
tof a30 b2
tof a30 b18
tof a30 b10
tof a30 c28
tof a30 c7
tof c27 c26
tof a30 a13
tof a30 a3
tof a30 a25
tof a30 a24
tof a30 a15
tof a18 a23
tof a30 b8
tof a30 a20
tof a30 a29
tof a30 b13
tof a30 a5
tof a30 c24
tof a30 a10
tof a30 c10
tof a30 b3
tof a30 b0
tof a30 a22
tof a30 c0
tof a30 b6
tof a18 c1
tof a30 b23
tof a30 c11
tof a30 b29
tof a18 c20
tof c27 b4
tof c27 c25
tof b28 b29
tof a8 b29
tof a27 a8
tof a27 b28
tof a27 b26
tof a27 b25
tof a27 a1
tof b28 b2
tof b28 b18
tof b28 b10
tof b28 c28
tof b28 c7
tof b28 a13
tof b28 a3
tof b28 a25
tof b28 a24
tof b28 a15
tof b28 b8
tof b28 a20
tof b28 a29
tof b28 b13
tof b28 a5
tof b28 c24
tof b28 a10
tof b28 c10
tof b28 b3
tof b28 b0
tof b28 a22
tof b28 c0
tof b28 c1
tof b28 b23
tof b28 c11
tof b28 c20
tof b28 a30
tof b28 b4
tof b28 c16
tof b28 a18
tof a27 b31
tof a17 a6
tof a17 b23
tof c31 a6
tof c4 b23
tof c4 c31
tof b23 a24
tof a17 a30
tof a17 a9
tof a17 c2
tof a17 c21
tof b27 a14
tof b9 a30
tof b9 a9
tof b9 c2
tof b9 c4
tof b9 c21
tof b9 a17
tof a26 c4
tof c15 c4
tof a26 b2
tof a26 b18
tof a26 c28
tof c4 a6
tof c4 c5
tof c4 c3
tof c15 a24
tof a26 a23
tof a26 b6
tof c4 c1
tof c15 b23
tof c4 c11
tof a26 a30
tof a26 a9
tof a26 c2
tof a26 b4
tof a26 c16
tof a26 b28
tof a26 c21
tof a26 a17
tof a26 b9
tof c9 a1
tof b14 b29
tof b14 a8
tof b15 c7
tof b15 c6
tof a16 c22
tof b12 a24
tof b12 b23
T c13
T* b27
T* c22
T* a26
T* c23
T a16
T* a21
T a11
T* b30
T* a31
T* b11
T c15
T* b15
T c31
T* c14
T b9
T* c19
T* b24
T b14
T* a27
T* b31
T a0
T* a17
T* c21
T* b7
T* a19
T* c17
T* c6
T b5
T* b28
T a18
T* c27
T* c16
T* b16
T* c4
T b12
T* c25
T* b4
T* a28
T b19
T a7
T c2
T* a9
T* a30
T c20
T* c18
T* b22
T* b17
T c30
T* a8
T b29
T c11
T b23
T c1
T b6
T c0
T a22
T b0
T* b3
T c10
T* a10
T* c24
T a5
T* b13
T a29
T* a20
T* a2
T* b8
T* a23
T* a15
T a24
T a25
T* a3
T a13
T* b21
T* c3
T* c12
T* c26
T* c8
T* a14
T* c5
T* c7
T* a12
T* a6
T* c28
T* b1
T* a4
T* b10
T* b18
T* b2
T* c9
T* a1
T* b25
T* b26
T* b20
tof a26 c13
tof c23 b27
tof a11 b27
tof c15 b27
tof b15 c22
tof c31 b27
tof a27 c22
tof b7 c21
tof c6 c22
tof a18 c13
tof c16 c21
tof b4 c21
tof a7 c21
tof a9 c21
tof c11 a16
tof c0 c13
tof a22 c13
tof b0 a16
tof a10 b17
tof a5 c13
tof b13 c13
tof a29 b17
tof c3 a16
tof a14 b27
tof a6 b27
tof c28 c13
tof b1 b27
tof b25 c13
tof a16 c13
tof c21 c13
tof b17 c13
tof c21 b27
tof c27 b27
tof b17 b27
tof a16 c22
tof c21 c22
tof c27 c22
tof b15 a16
tof c31 c23
tof c21 b11
tof c6 a16
tof a18 a26
tof c27 c23
tof c25 c16
tof b4 c16
tof a7 a16
tof a9 a16
tof a30 c16
tof c20 c16
tof c0 a26
tof a22 c16
tof b3 c16
tof c10 c16
tof a10 a16
tof a5 c16
tof b13 c23
tof b21 c23
tof c28 a26
tof a1 b11
tof b25 b11
tof b11 a26
tof b0 a26
tof c16 c23
tof b0 c23
tof b11 a16
tof c16 a16
tof b0 a16
tof c15 a11
tof c21 a11
tof c27 b30
tof c25 a11
tof a7 b30
tof a9 b30
tof a30 a11
tof c20 a11
tof b17 c16
tof b0 c16
tof b3 a11
tof c10 a11
tof b13 a11
tof a29 b30
tof b21 a11
tof c12 a21
tof a14 a11
tof a6 a11
tof b1 a11
tof c16 a11
tof c16 b30
tof c21 c15
tof c17 c15
tof b5 b24
tof b28 b24
tof c27 b24
tof c25 b11
tof b4 b24
tof a7 b11
tof a9 b11
tof a30 b11
tof c20 b11
tof b17 b24
tof a22 c16
tof b0 c16
tof c10 b11
tof a10 b3
tof a5 c16
tof b13 b24
tof a29 a31
tof b21 c15
tof a14 a31
tof a6 c15
tof a1 a31
tof b25 b11
tof b11 a31
tof c16 a31
tof b3 a31
tof b24 b11
tof b3 b11
tof c16 c15
tof b3 c15
tof b9 b15
tof a27 c31
tof b31 c31
tof a19 b15
tof c6 b15
tof a18 c14
tof c27 c31
tof b12 b15
tof a28 b15
tof b19 b15
tof c0 c14
tof a22 c31
tof a10 c21
tof a5 c31
tof b13 c31
tof a29 c21
tof b21 c31
tof c21 b15
tof c16 b15
tof b17 b15
tof c16 c31
tof b17 c31
tof b0 c31
tof c21 c14
tof b17 c14
tof b0 c14
tof c21 b24
tof b7 b24
tof b5 b24
tof b28 b24
tof c27 c19
tof c16 c19
tof b4 b24
tof c2 b24
tof a9 c19
tof a30 c25
tof c20 c25
tof b17 b24
tof c0 c19
tof a22 b24
tof b0 a7
tof b3 c25
tof c10 c25
tof a5 b24
tof b13 a10
tof a29 c25
tof c25 b9
tof a10 b9
tof a7 c19
tof a10 c19
tof c25 b24
tof a7 b24
tof a10 b24
tof c17 a0
tof c27 c21
tof c4 a0
tof c25 b31
tof a28 a27
tof a7 b7
tof c2 b14
tof a9 a0
tof a30 a27
tof c20 a27
tof b17 b31
tof a22 c21
tof b0 b31
tof b3 a27
tof c10 b31
tof a10 a27
tof a5 c21
tof b13 c21
tof a29 b31
tof b21 a0
tof c21 b14
tof b7 b14
tof b31 a27
tof c21 a27
tof a0 b31
tof b7 b31
tof b7 a0
tof b28 a17
tof a18 a0
tof c27 c21
tof c16 a17
tof c4 a0
tof b4 c25
tof a28 a0
tof a7 a0
tof a9 a0
tof a30 c25
tof c20 c25
tof a8 b16
tof b6 a0
tof c0 a0
tof a22 b17
tof b3 c25
tof c10 a17
tof a10 a17
tof a5 b17
tof b13 c21
tof c21 a0
tof c25 a0
tof b17 a0
tof c21 a17
tof c25 a17
tof b0 a17
tof b16 c21
tof b17 c21
tof b0 c21
tof b5 b7
tof b16 c16
tof b12 a19
tof c25 b7
tof b4 a19
tof a28 a19
tof b19 a19
tof a7 a19
tof c2 b7
tof a9 a19
tof a30 b7
tof c20 b7
tof b17 c17
tof c11 a19
tof b0 c16
tof b3 a22
tof a10 c17
tof a5 c17
tof b13 a22
tof a29 a22
tof a14 a22
tof c9 b7
tof a1 b7
tof c17 b7
tof b28 b7
tof b28 a19
tof c16 a19
tof c16 c17
tof a22 c17
tof c16 c6
tof b12 b16
tof c25 b16
tof b19 b16
tof c2 b5
tof a9 b5
tof b17 c6
tof a22 b28
tof b0 b28
tof b3 b28
tof c10 b16
tof a10 b4
tof b13 b4
tof a14 a5
tof c28 b5
tof b25 b5
tof b28 c6
tof b4 c6
tof c11 c6
tof b28 b5
tof b4 b5
tof a5 b5
tof b16 b28
tof c11 b28
tof a5 b28
tof b12 b16
tof c25 a18
tof b4 b16
tof a28 c16
tof b19 b16
tof a7 a18
tof a9 a18
tof c20 a30
tof b23 c27
tof b6 a18
tof c0 a18
tof a22 b17
tof b3 b16
tof a10 b17
tof a5 c16
tof b13 c10
tof a29 a18
tof c9 a18
tof a1 a18
tof b16 a18
tof b17 a18
tof c10 a18
tof b16 c27
tof a30 c27
tof c10 c27
tof a30 c16
tof b17 c16
tof c10 c16
tof b4 c25
tof a28 c4
tof b19 b12
tof a30 c4
tof b3 b12
tof c10 b16
tof a10 b16
tof b13 b16
tof a29 a22
tof c9 c4
tof a1 c4
tof c4 b16
tof b12 b16
tof a22 b16
tof c25 c4
tof c11 c4
tof a22 c4
tof c11 b12
tof a22 b12
tof a5 b12
tof a30 a7
tof b17 a7
tof b0 b4
tof b3 a22
tof c10 a28
tof a10 c25
tof a5 b4
tof a29 a7
tof b4 c25
tof a28 c25
tof a22 c25
tof a9 b4
tof a22 b4
tof b13 b4
tof a7 a28
tof a22 a28
tof b13 a28
tof a9 b19
tof a30 c2
tof b22 c2
tof a8 b19
tof b3 c20
tof a5 a10
tof b13 c20
tof c28 c2
tof c9 c2
tof a1 c2
tof b25 c2
tof a22 b19
tof a10 b19
tof c20 a7
tof a22 a7
tof c20 c2
tof a10 c2
tof b17 c18
tof a22 c18
tof b0 c18
tof b3 c20
tof c10 c18
tof a10 a30
tof a5 a9
tof b21 c18
tof a14 a9
tof c9 c20
tof a1 c20
tof c24 a9
tof c20 a30
tof c18 c20
tof c24 c20
tof a22 b17
tof b0 b17
tof c24 c18
tof a5 a10
tof b13 b17
tof c12 b22
tof c9 c18
tof a1 c18
tof b17 c18
tof b3 c18
tof b3 b22
tof a10 b22
tof b3 b17
tof a10 b17
tof a29 b17
tof c10 b3
tof a10 a8
tof a5 a22
tof b13 a22
tof a29 a22
tof a8 c30
tof b29 c30
tof a22 a8
tof a22 b29
tof b3 b29
tof a22 b23
tof b3 c1
tof a10 c11
tof b13 a5
tof a20 c11
tof a2 c1
tof b8 c11
tof a14 c11
tof a4 c11
tof c9 b23
tof a1 b23
tof b0 c11
tof a5 c11
tof a5 b23
tof b0 c1
tof a10 a22
tof c24 b0
tof a5 b6
tof b13 b0
tof a14 b6
tof c28 b6
tof b10 b6
tof b25 b6
tof a22 b6
tof b3 b6
tof a22 c0
tof b0 a22
tof b3 a22
tof c24 a10
tof b13 a10
tof a14 a5
tof a5 b0
tof c10 b3
tof a10 c10
tof a5 c10
tof c28 b13
tof b25 b13
tof c24 a10
tof b13 a10
tof a5 c24
tof b13 a5
tof a29 a5
tof a20 a29
tof b8 a20
tof a15 b8
tof b25 c28
tof c28 b8
tof c28 a23
tof b21 a24
tof c28 a25
tof c9 a24
tof a1 a24
tof a24 a15
tof c9 b21
tof a1 b21
tof c28 a3
tof c28 a13
tof c28 b21
tof a14 c26
tof c28 c3
tof b10 c3
tof c9 c26
tof a1 c26
tof a4 c5
tof c9 c8
tof a1 c8
tof c28 c8
tof c28 c5
tof b10 c7
tof c28 c7
tof c28 a12
tof a4 a12
tof a4 a6
tof c9 b1
tof a1 b1
tof b20 a4
tof a1 c9
tof b10 b25
tof b2 c9
tof a4 b20
tof c28 b1
tof c28 a4
tof c28 a1
tof c28 c9
tof c28 b26
tof a12 a6
tof a12 a4
tof c5 a12
tof c5 b20
tof c12 c7
tof b21 b1
tof a24 c7
tof a15 a24
tof a24 b25
tof a24 c5
tof a24 b10
tof b8 a15
tof a2 a15
tof a2 c7
tof b8 b25
tof b8 c5
tof b8 b10
tof a23 c28
tof b8 a24
tof a23 a13
tof a23 a25
tof a20 a24
tof a20 a15
tof a20 b8
tof a29 a24
tof a29 a15
tof a29 a23
tof b13 a24
tof b13 b8
tof b13 a23
tof a20 b25
tof a24 c9
tof a24 b2
tof b13 a12
tof b13 b20
tof a20 c26
tof a20 c3
tof a29 c5
tof a20 b10
tof a23 c28
tof a23 a13
tof a23 a25
tof a5 b21
tof a5 a15
tof a5 a29
tof c24 a15
tof c24 b13
tof c24 a29
tof a10 b13
tof a10 a29
tof a10 a5
tof a15 c7
tof a10 a6
tof a29 b25
tof a5 c9
tof a10 b2
tof c24 a12
tof c24 b20
tof b21 b1
tof b13 c26
tof b13 c3
tof c24 c5
tof a10 a1
tof a29 b10
tof a29 c28
tof b13 a24
tof a5 a13
tof a10 a3
tof a5 a25
tof c24 b8
tof a5 a23
tof a5 a20
tof c10 a3
tof b3 c10
tof c10 c7
tof c10 b25
tof c10 a12
tof c10 b20
tof c10 c3
tof c10 b18
tof c10 b10
tof c10 c28
tof b3 a24
tof c10 b8
tof c10 a20
tof c10 a2
tof b3 b13
tof c10 a29
tof c10 a10
tof a22 c28
tof c0 c28
tof b6 c7
tof b6 b25
tof b6 c3
tof c28 b18
tof a22 c5
tof b6 b10
tof a22 a15
tof a22 b8
tof a22 a5
tof b23 a6
tof b23 a12
tof b23 b21
tof c11 c5
tof c1 a15
tof b29 a3
tof b29 a29
tof b29 a22
tof a8 a29
tof a8 b29
tof c30 a22
tof c30 b29
tof a8 a12
tof a8 b20
tof a29 c26
tof a29 c3
tof a8 b18
tof a8 c5
tof a29 c11
tof a29 a13
tof a29 a25
tof a29 b8
tof a29 a23
tof a29 a20
tof a8 a2
tof a8 c1
tof a8 c24
tof a8 b0
tof a8 c10
tof a8 a24
tof b17 a20
tof c18 a20
tof b22 c7
tof b17 c12
tof a20 c26
tof a20 c3
tof b17 b18
tof b17 c5
tof a20 c11
tof c18 a5
tof c20 c26
tof c20 c3
tof c20 c18
tof a30 c26
tof a30 c3
tof a30 a10
tof a9 c3
tof a9 a10
tof a9 c20
tof a30 c7
tof a10 c8
tof a30 a6
tof a30 b2
tof a10 a12
tof a10 b20
tof a30 b1
tof a30 b21
tof c18 b18
tof c18 c5
tof a30 a1
tof c20 c11
tof a10 b6
tof a9 a3
tof a9 b8
tof c20 a20
tof a9 a2
tof a30 c1
tof a9 c24
tof a9 b0
tof a9 c10
tof a9 a22
tof a9 a24
tof a10 b29
tof a9 c28
tof a9 b13
tof c20 a5
tof c2 c7
tof a7 c2
tof a7 c8
tof a7 a12
tof a7 b20
tof a7 b18
tof c2 b22
tof a7 c11
tof a7 b6
tof a7 b8
tof a7 a20
tof a7 c1
tof a7 b29
tof a7 a10
tof a7 a5
tof a7 c18
tof a7 c20
tof a7 a9
tof a28 b6
tof a28 c28
tof a28 a7
tof b4 b6
tof b4 a8
tof b4 a28
tof c25 c28
tof c25 a8
tof c25 a28
tof b4 c7
tof a28 c8
tof a7 a6
tof c25 b25
tof a7 b2
tof a28 a12
tof a28 b20
tof a28 c12
tof a7 b1
tof a7 b21
tof b4 c3
tof a8 b18
tof a7 c5
tof a7 a1
tof c25 b10
tof a28 b22
tof a8 a3
tof a7 b8
tof a28 a20
tof a8 a2
tof a8 c1
tof a28 b17
tof a8 c24
tof a8 b0
tof a8 c10
tof a8 a22
tof a8 a24
tof a28 b29
tof a28 a10
tof a8 b19
tof a28 c2
tof b4 c18
tof a28 a9
tof c4 b12
tof c4 c5
tof b16 b12
tof b16 c4
tof b12 b2
tof c5 a12
tof c5 b20
tof c4 c12
tof b12 b1
tof c4 c3
tof b16 a1
tof c4 b22
tof c4 c11
tof b16 b6
tof b16 c1
tof b16 b29
tof b16 c20
tof c16 b16
tof c27 a12
tof a18 a12
tof a18 b16
tof a18 c8
tof c27 a6
tof c16 b25
tof a18 c9
tof a12 a4
tof a18 c3
tof c16 b18
tof a18 c5
tof b16 a1
tof c16 b10
tof a18 b22
tof b16 c11
tof b16 b6
tof c16 a3
tof c16 a15
tof c16 b8
tof c16 a2
tof b16 c1
tof c16 b17
tof a18 b23
tof c16 c24
tof c16 b0
tof c16 a24
tof b16 b29
tof a18 a10
tof c16 c30
tof a18 c2
tof b16 c20
tof c16 a7
tof a18 a30
tof c16 a8
tof c16 c25
tof a18 b21
tof b28 b2
tof b28 b22
tof b5 b22
tof c6 b2
tof b5 c7
tof b5 b20
tof b28 c12
tof b28 b1
tof b28 c3
tof b5 b29
tof b5 a10
tof b28 c4
tof b5 c2
tof b28 b16
tof c17 c6
tof c17 a18
tof a19 c6
tof b7 c6
tof b7 a18
tof a18 c7
tof a18 c8
tof a18 b25
tof a18 c9
tof c6 b2
tof a18 b20
tof a19 b1
tof a19 c3
tof a18 a1
tof a18 b10
tof a18 b22
tof b7 a15
tof a18 c1
tof a18 b23
tof a18 b29
tof a18 a10
tof a18 c2
tof c17 c20
tof a18 a30
tof c17 b21
tof a19 b16
tof c17 a14
tof a19 b28
tof c21 b22
tof c21 c20
tof a17 b22
tof a0 c20
tof b22 c7
tof c21 c8
tof c21 a6
tof c21 b25
tof c21 c9
tof a17 c12
tof c21 b1
tof c21 c6
tof c21 b18
tof c21 c5
tof c21 b10
tof c21 a3
tof c21 a15
tof c21 b8
tof c21 a2
tof c21 b17
tof c21 b23
tof c21 c24
tof c21 b0
tof c21 a24
tof c21 a10
tof c21 c30
tof a17 c4
tof c21 c2
tof c20 a5
tof c20 c18
tof c21 c27
tof c21 a7
tof c21 a30
tof c21 c25
tof a0 b21
tof c21 b16
tof c21 c16
tof c21 a14
tof c21 b12
tof c21 a19
tof c21 c17
tof b31 a0
tof a27 a0
tof a27 a6
tof a0 a4
tof a0 a12
tof a0 b20
tof a27 b18
tof a0 c5
tof a0 c11
tof a27 a15
tof a27 b17
tof a27 c10
tof a27 a22
tof a27 b29
tof a27 c30
tof a0 b16
tof a27 c16
tof a0 a18
tof a27 b28
tof b24 c6
tof b9 c6
tof b24 c8
tof b24 b25
tof b24 c9
tof c19 a4
tof b24 b2
tof b9 c3
tof b24 a1
tof b24 b10
tof b24 b14
tof b24 a15
tof b24 c1
tof b24 b23
tof b24 b29
tof b24 a10
tof b24 c2
tof b24 a30
tof b9 b16
tof b24 a18
tof b9 a19
tof b24 b7
tof b24 b22
tof c31 a6
tof c14 b25
tof b15 c6
tof b15 c3
tof c31 a15
tof b15 b16
tof c31 c16
tof c31 b31
tof b15 a19
tof b11 c8
tof b11 b25
tof b11 c9
tof b11 b2
tof b11 c6
tof b11 a1
tof b11 b10
tof c15 a15
tof c15 b31
tof b11 b7
tof b11 b5
tof a21 c7
tof a11 c9
tof b30 c19
tof a11 a31
tof a11 b1
tof a11 c17
tof a21 b22
tof c23 c9
tof a26 a16
tof a26 c9
tof a26 c8
tof c23 a6
tof a26 b25
tof a26 b2
tof c23 a31
tof c23 b1
tof a26 c6
tof a26 b10
tof c23 c16
tof a26 b7
tof c23 c17
tof c23 c31
tof a26 b5
tof c23 c15
tof a26 b11
tof b27 c9
tof c22 a4
tof c22 a12
tof b27 a31
tof b27 b1
tof c22 c5
tof c22 c11
tof c22 b16
tof c22 a18
tof c22 a0
tof c22 b31
tof b27 c17
tof c22 b20
tof b27 a11
T* a16
T* c12
T* b11
T* a21
T* b22
T* c7
T b27
T* a26
T* a1
T* a11
T* c21
T* c23
T b15
T* b9
T* b14
T* c22
T* b20
T* b24
T c15
T* a14
T* a27
T* b5
T* c31
T* c17
T b7
T* a19
T a17
T* b12
T b28
T b31
T a0
T a18
T* c16
T b19
T* b16
T* b21
T* c25
T b4
T* a28
T* b13
T* a8
T* a30
T* a7
T* a9
T* c27
T c20
T c18
T* a5
T* c2
T* c4
T* c30
T* c28
T* a10
T* b29
T* a24
T a22
T* c0
T* c10
T* b3
T* b0
P c24
T c24
T* b23
T* b17
T* a29
T c1
T* a2
T* a20
T* a23
T* b8
T a15
T* a25
T* a3
T* a13
T* b6
T* c11
T* c14
T* b10
T* b30
T* c5
T* b18
T* c3
T* c26
T* c6
T* b1
T* a31
T* c19
T* a12
T* b2
T* b26
T* a4
T* c9
T* b25
T* a6
T* c8
T* c13
tof a21 c12
tof c17 a14
tof b28 b12
tof c25 a16
tof b4 a16
tof b13 a16
tof a30 b11
tof a7 b11
tof c18 a28
tof a5 a28
tof c30 a16
tof c28 a28
tof a10 a16
tof b29 a16
tof a24 b12
tof c0 a28
tof c10 a14
tof b3 b11
tof b17 c12
tof c14 a28
tof b10 b11
tof b2 a14
tof c9 a14
tof b25 a16
tof b11 a16
tof a28 a16
tof b11 c12
tof b12 c12
tof a14 b11
tof b12 b11
tof a28 b11
tof b12 c7
tof a28 c7
tof b13 b4
tof c18 b22
tof a5 b22
tof a10 b22
tof b29 b22
tof a24 b22
tof a22 b22
tof c10 b4
tof b3 a21
tof c14 a14
tof b22 a21
tof c25 a21
tof a14 b22
tof b4 b22
tof c25 c7
tof b4 c7
tof a27 a26
tof c31 a1
tof b31 b27
tof a18 b27
tof c16 a1
tof b21 b27
tof c25 b27
tof a28 a26
tof c20 a26
tof c18 a26
tof a24 b4
tof c10 b4
tof b23 b27
tof b17 a26
tof c14 a26
tof b1 b27
tof a31 b27
tof b2 b27
tof c9 b27
tof b4 b27
tof a1 a26
tof b4 a26
tof b9 c21
tof b24 b20
tof a14 c23
tof c25 c23
tof b4 c23
tof a28 c21
tof b13 c21
tof a8 c21
tof c30 a11
tof a10 c23
tof b29 a11
tof a24 c23
tof c10 c21
tof c14 b12
tof c5 c21
tof a12 b20
tof a6 b20
tof c23 a11
tof b12 a11
tof b12 c21
tof b20 c23
tof b12 c23
tof a14 b14
tof a27 b15
tof b7 c17
tof c25 b14
tof b4 b12
tof a28 b15
tof c20 b15
tof c18 b9
tof a5 c17
tof c28 c17
tof a10 c17
tof b29 c17
tof a24 b14
tof a22 c17
tof c10 b14
tof b3 b15
tof b17 b12
tof c6 c17
tof b2 c17
tof c9 c17
tof b9 b15
tof b12 b15
tof c17 b9
tof b12 b14
tof b16 b24
tof c25 c22
tof b4 c22
tof a28 c22
tof a30 c22
tof a7 c22
tof a24 c22
tof b3 c22
tof b17 c10
tof c14 c22
tof a12 b20
tof a6 b20
tof b20 c22
tof a10 c22
tof b24 b20
tof a10 b24
tof c10 b24
tof c31 c15
tof b7 c15
tof b12 c15
tof b31 c15
tof a18 c15
tof c16 c15
tof b21 c15
tof c25 a27
tof b4 c15
tof a30 a27
tof a7 a27
tof c27 a27
tof c20 a27
tof a5 c15
tof c4 c15
tof c28 c15
tof a10 c15
tof b29 c15
tof a22 c15
tof c10 c18
tof b3 a27
tof b23 a24
tof b17 c17
tof c14 c15
tof c3 a14
tof c6 c15
tof c17 c15
tof a24 c15
tof c17 a14
tof c18 a14
tof c18 a27
tof a24 a27
tof b7 b5
tof c16 c31
tof c25 b12
tof a28 b4
tof a5 c17
tof c4 c31
tof c28 b5
tof a10 b4
tof b29 c17
tof a24 b12
tof a22 c17
tof c10 c17
tof b23 b12
tof b17 b12
tof c6 b5
tof a31 c31
tof b2 c31
tof c9 c31
tof c17 b5
tof b12 b5
tof c14 b5
tof b12 c31
tof c14 c31
tof b12 c17
tof b4 c17
tof a0 a17
tof a18 a17
tof c25 a19
tof a30 a17
tof a7 a17
tof c20 a17
tof c18 a17
tof c4 a17
tof a10 b4
tof a24 a17
tof c10 b7
tof b3 a17
tof b23 a17
tof c14 b7
tof c5 a17
tof c3 a17
tof c6 b7
tof a28 b7
tof b4 a19
tof a28 a19
tof b4 a17
tof a28 a17
tof a18 b31
tof b21 b31
tof c25 b28
tof b4 b12
tof a7 a30
tof c27 a30
tof a5 c18
tof c4 c18
tof a10 c18
tof b29 c18
tof a24 a30
tof a22 c18
tof c10 b28
tof b3 a30
tof b23 b31
tof b17 c18
tof c5 c18
tof a31 c18
tof b2 c18
tof c9 c18
tof c18 b12
tof a30 b28
tof c18 b28
tof a30 b31
tof c27 a18
tof c18 c16
tof c4 c16
tof c10 c16
tof b23 a18
tof b17 c16
tof c5 a0
tof c3 a0
tof a31 c16
tof b2 c16
tof c9 c16
tof a18 a0
tof a30 a0
tof c25 a18
tof c28 a18
tof c25 c16
tof a30 c16
tof c25 b21
tof a28 b19
tof c27 a30
tof c20 b19
tof c18 b4
tof a5 b19
tof c4 b4
tof c28 b21
tof a10 b19
tof b29 b19
tof a22 b19
tof b23 b19
tof b17 b4
tof c14 b16
tof c5 b19
tof a31 b4
tof b2 b4
tof c9 b4
tof b4 b19
tof a30 b19
tof b4 b16
tof a30 b21
tof a30 c25
tof c27 a28
tof c18 b4
tof c4 b4
tof c28 b4
tof c0 b4
tof b17 b4
tof c14 c10
tof a31 b4
tof b2 b4
tof c9 b4
tof b23 c25
tof c10 b4
tof c10 a28
tof b23 a28
tof a24 a30
tof c0 c28
tof b3 c27
tof b23 c27
tof a30 b13
tof c28 b13
tof c28 a8
tof c27 a30
tof c28 a30
tof c4 c18
tof c28 a7
tof a10 c27
tof b29 c27
tof a22 c27
tof c10 a9
tof b3 c27
tof b17 c18
tof c14 a9
tof c5 c27
tof a31 c18
tof b2 c18
tof c9 c18
tof a9 a7
tof c18 a7
tof c18 a9
tof c18 c27
tof c28 c4
tof c10 c18
tof c14 c18
tof b30 c20
tof c3 c5
tof a5 c20
tof a5 c18
tof c5 c18
tof c4 a5
tof c5 a5
tof a10 c2
tof b29 c4
tof a22 c4
tof c10 c2
tof b3 c2
tof b17 c2
tof c14 c2
tof c5 c4
tof c3 c4
tof c28 c2
tof c28 c4
tof c28 c30
tof a22 a10
tof c10 a10
tof b3 a24
tof b23 a24
tof c14 a10
tof c5 a24
tof c3 a10
tof b29 c28
tof b29 a10
tof a24 b29
tof c5 a24
tof c3 a2
tof c0 a24
tof a2 c0
tof c24 c10
tof c14 c10
tof c5 b0
tof c3 c10
tof c3 b0
tof a2 b23
tof c5 b23
tof c3 c24
tof c3 b23
tof c14 a29
tof c5 c1
tof c3 a29
tof a2 c1
tof c3 c1
tof a15 a2
tof a3 a20
tof a3 b8
tof a13 a3
tof c5 a3
tof a31 a15
tof c19 b30
tof b2 a15
tof c9 a15
tof c3 a15
tof a3 a25
tof c3 a25
tof b30 a3
tof c3 a3
tof b10 b6
tof a31 a13
tof b2 a13
tof c9 a13
tof c13 b6
tof b30 a13
tof c3 b6
tof b30 c11
tof c3 c11
tof a31 c14
tof b2 c14
tof b26 b30
tof c9 c14
tof b25 c14
tof c5 c14
tof c3 b10
tof c5 b30
tof c3 b30
tof c6 c3
tof c19 b18
tof a12 c5
tof c8 c3
tof b26 c5
tof b26 b18
tof b26 c3
tof b2 a31
tof c9 a31
tof b25 c26
tof c13 c6
tof a31 c6
tof a31 b1
tof c8 a12
tof a12 a31
tof b26 a31
tof b26 c19
tof b25 a12
tof b25 b2
tof c9 b26
tof b25 b26
tof c9 a4
tof b25 a4
tof c13 b25
tof b25 c9
tof c8 b25
tof c8 a6
tof c13 c8
tof b26 a4
tof b26 c9
tof b2 b26
tof a12 a6
tof a12 b2
tof c19 b2
tof a31 b2
tof a31 a12
tof a12 b25
tof c19 a4
tof a12 b26
tof a31 c13
tof c6 c8
tof c6 b25
tof c6 c9
tof c6 c13
tof c3 a31
tof c5 a31
tof c3 c8
tof c3 b25
tof b18 a4
tof a31 c9
tof c3 c13
tof b30 a12
tof c14 a12
tof b30 c8
tof c14 c26
tof b10 c6
tof c14 a6
tof c14 b26
tof b30 c5
tof a3 a13
tof a3 c8
tof a3 a12
tof a25 c8
tof a25 a3
tof a15 a13
tof a15 c8
tof a3 b18
tof a3 b2
tof a15 c26
tof a15 c6
tof a15 a6
tof a15 a31
tof a15 b26
tof a15 c14
tof a3 c19
tof a3 c11
tof a3 b30
tof a3 c5
tof a2 c8
tof c1 a2
tof c8 b18
tof c8 b2
tof c1 c26
tof a2 c6
tof c1 a6
tof c1 a31
tof c1 b26
tof c1 c14
tof c8 c19
tof c8 c11
tof c8 b30
tof c8 c5
tof c1 a15
tof c8 a3
tof c8 a25
tof c1 a13
tof b23 a3
tof c24 a3
tof b23 b18
tof b23 b2
tof b23 c19
tof c24 b1
tof b17 c8
tof b3 a3
tof c10 a3
tof b3 b18
tof b3 b2
tof c10 c13
tof b3 c19
tof c10 b1
tof b3 b23
tof c10 c24
tof c0 c6
tof c0 b30
tof c0 a25
tof a22 c6
tof a22 c0
tof a24 a25
tof a24 c0
tof b30 a4
tof b30 b18
tof a25 a12
tof b30 c3
tof b30 c19
tof a22 c11
tof a22 c5
tof a22 a13
tof c0 c8
tof c0 a2
tof c0 b23
tof a22 c10
tof a22 b0
tof b29 a2
tof b29 b23
tof b29 c0
tof a10 b23
tof a10 b29
tof a10 c10
tof c28 c0
tof c28 b29
tof c28 c10
tof b23 b18
tof b23 b2
tof a2 c26
tof c10 c13
tof b29 a12
tof c28 c6
tof a2 a6
tof a2 a31
tof a10 c3
tof a2 b26
tof a2 c14
tof b23 c19
tof c0 c11
tof c0 c5
tof a2 a15
tof b23 a3
tof b29 a25
tof a2 a13
tof b29 c8
tof a10 c1
tof c28 b0
tof c28 a22
tof c28 b3
tof a10 b25
tof c30 a13
tof c4 a13
tof a13 b8
tof a13 a20
tof c4 b18
tof c4 b2
tof c4 c26
tof c4 c6
tof c4 a6
tof c4 a31
tof c4 b26
tof c4 c14
tof c4 c19
tof c4 a15
tof c4 a3
tof a13 a25
tof c30 c8
tof c4 a2
tof c4 b23
tof c30 c0
tof c4 c10
tof c4 b0
tof c4 a22
tof c4 c28
tof c18 a5
tof a5 b8
tof a5 a20
tof a5 b18
tof a5 c6
tof a5 a6
tof a5 a31
tof a5 c19
tof a5 a3
tof a5 b1
tof a5 a25
tof a5 a13
tof a5 a2
tof a5 b23
tof a5 c10
tof a5 b0
tof a5 a22
tof a5 c28
tof c18 a10
tof a5 c4
tof c27 c4
tof a9 c4
tof a7 c4
tof a7 a9
tof c27 b8
tof c27 a20
tof c27 b18
tof c27 b2
tof a9 c13
tof c27 a12
tof c27 c3
tof c27 c19
tof c27 b30
tof c27 c20
tof c27 a3
tof c27 a13
tof c27 b23
tof c27 c1
tof c27 b29
tof c27 c10
tof c27 b0
tof c27 a22
tof a9 b3
tof c27 c28
tof c27 a24
tof a9 c2
tof c27 a10
tof c27 c18
tof c27 b25
tof a30 c3
tof a30 c4
tof a8 c3
tof b13 c3
tof b13 c4
tof b13 a8
tof c4 c13
tof a30 a12
tof a30 b30
tof b13 c5
tof b13 a3
tof a30 b23
tof a30 b29
tof c4 b3
tof a30 c30
tof a30 a24
tof c4 c2
tof a30 a9
tof b13 a5
tof b13 a7
tof a28 c1
tof a28 a30
tof a28 c27
tof b4 c1
tof b4 b13
tof b4 a30
tof c25 b13
tof c25 a30
tof c25 c27
tof a28 b8
tof a28 a20
tof b4 a4
tof c25 b18
tof c25 b2
tof b13 c13
tof c25 a12
tof c1 c6
tof b4 a6
tof b4 a31
tof a30 c3
tof c25 c19
tof c25 c11
tof c27 b30
tof b13 c5
tof c25 c20
tof b13 a3
tof b4 b1
tof b4 a25
tof a28 a13
tof c27 c0
tof c25 b29
tof a28 c10
tof a28 b0
tof a28 a22
tof b13 b3
tof a30 c30
tof a28 c28
tof c27 a24
tof b13 c2
tof c27 a10
tof a28 c18
tof c25 b25
tof b13 c4
tof a28 a9
tof b13 b17
tof c25 a5
tof c25 a7
tof b13 c24
tof c25 a8
tof b21 c19
tof b16 c9
tof b21 a24
tof b19 a30
tof b12 b28
tof b12 b2
tof b12 c26
tof b12 c16
tof b12 b26
tof b12 b1
tof b12 a25
tof b12 c0
tof b12 c1
tof b12 b29
tof b12 b0
tof b12 a5
tof b12 a7
tof b28 b4
tof b28 a28
tof b7 a31
tof b7 b30
tof a17 a0
tof b7 b21
tof c17 b30
tof c17 b12
tof c31 b12
tof b5 b30
tof c17 b6
tof c17 c26
tof c17 a12
tof c17 a6
tof b5 a31
tof c17 c3
tof c31 c16
tof c17 b26
tof b12 c14
tof c31 a25
tof c31 c0
tof c31 c1
tof c17 a29
tof c31 b29
tof c31 b0
tof c17 c18
tof c31 a15
tof c31 a5
tof c31 a7
tof b12 a0
tof b12 a17
tof c17 b21
tof c17 b7
tof c17 b16
tof a14 b6
tof a14 c26
tof a14 a12
tof a14 c6
tof a14 a6
tof a27 c16
tof a14 b26
tof a14 c14
tof a14 a29
tof a14 c18
tof a27 b25
tof a27 b4
tof a14 a17
tof a14 b10
tof b24 b16
tof b20 b24
tof b24 a4
tof b24 c13
tof b24 a6
tof b24 c5
tof b24 c9
tof b24 b13
tof b24 b7
tof b16 b12
tof c22 c25
tof b9 a0
tof b9 b16
tof b14 a24
tof b9 a14
tof b9 c17
tof b9 b10
tof c21 a0
tof c21 b16
tof a26 c16
tof b27 c31
tof c7 a12
tof b22 a12
tof b22 c7
tof a21 a12
tof a21 c13
tof c7 a6
tof b11 b22
tof c12 b22
tof b11 b6
tof b22 c13
tof b11 c6
tof b22 a6
tof b11 c14
tof b22 c7
tof b22 a21
tof b11 c18
tof b11 a17
tof b11 a14
tof b11 b10
tof a16 a11
T* a16
T* a11
T* c15
T* b15
T* b11
T* c20
T c12
T* b27
T* c31
T* b26
T* a1
T* c23
T* a3
T* a27
T b9
T* b10
T* c21
T* c17
T* a14
T* b14
T a24
T* c22
T* c25
T* b20
T* b24
T* b16
T* b12
T b7
T b21
T* a8
T* b5
T* a17
T* a0
T a19
T b28
T* c27
T* a28
T b4
T a18
T* b19
T a30
T* b13
T* b31
T* c24
T* a7
T* a5
T* b17
T* a15
T a9
T* c4
T* b25
T* c18
T* a10
T* c2
T* b22
P* c28
T* c28
T c30
T* b3
T* a22
T* b0
T* c10
T* b29
T* a29
T* c1
T c0
T* b23
T* a2
T* c8
P a13
T a13
T* c9
T* a25
T* b1
T* a21
T* c7
T* c5
T* b30
T* c11
T* c19
T* c14
T* a26
T* c16
T* c3
T* a31
T* a6
T* c6
T* a12
T* c13
T* c26
T* b2
T* b18
T* b6
T* a4
tof b27 a11
tof c31 a11
tof c17 c15
tof b24 a16
tof b28 a16
tof c27 c15
tof a28 a16
tof a30 b19
tof b13 a16
tof c24 c15
tof c28 a16
tof c30 a16
tof a22 c15
tof a21 b19
tof c5 b19
tof c13 b19
tof c26 a11
tof b19 a16
tof b17 a16
tof a5 a11
tof b17 a11
tof b19 c15
tof a5 c15
tof a27 c20
tof c17 b11
tof a24 c20
tof c22 c20
tof c25 c20
tof b20 c20
tof b24 b15
tof b12 c20
tof b28 c20
tof a28 c20
tof b19 b15
tof b13 b15
tof c24 b15
tof b25 b14
tof a22 c27
tof b29 c20
tof c1 c20
tof c9 c20
tof c7 b11
tof c5 b11
tof c19 c20
tof a12 b11
tof c13 b11
tof b14 b15
tof c27 b15
tof c27 b11
tof b14 c20
tof a27 c31
tof b9 c12
tof c17 c12
tof b14 c12
tof a24 c12
tof b20 c12
tof b12 c12
tof b7 c12
tof b21 c12
tof b28 b24
tof c27 c31
tof a28 b24
tof b13 c31
tof a5 c31
tof a15 c12
tof b25 b24
tof c18 c12
tof a10 c12
tof c9 c12
tof c11 b27
tof b24 c12
tof b19 c12
tof c31 b27
tof b24 b27
tof b19 b27
tof b24 c31
tof a27 a1
tof b24 a1
tof c27 a1
tof b13 a1
tof b17 a1
tof c7 b26
tof c5 b19
tof a6 c23
tof a12 b19
tof c13 b19
tof b19 b26
tof b19 c23
tof c17 b9
tof a24 b14
tof b16 b14
tof b12 b14
tof b7 b9
tof b21 b9
tof a17 b14
tof a0 b14
tof a28 b28
tof b19 b9
tof b13 a3
tof c24 a3
tof b25 b9
tof b29 b14
tof c5 b9
tof c19 b28
tof a12 b9
tof c13 b9
tof b18 b28
tof a4 b28
tof a27 a3
tof b24 a3
tof c27 a3
tof b9 a27
tof b14 a27
tof b24 a27
tof b24 b9
tof b28 b9
tof c27 b9
tof b20 b10
tof b16 b10
tof a0 b10
tof b28 b10
tof b19 c21
tof a9 b10
tof c4 b10
tof c9 b10
tof c5 c27
tof c19 b10
tof a12 c21
tof c13 c27
tof b18 b10
tof a4 b10
tof c17 b10
tof c17 c21
tof c27 c21
tof c27 c17
tof b20 b14
tof b12 a24
tof b7 b16
tof b21 b16
tof a17 b14
tof a0 b16
tof b28 a24
tof c27 b14
tof b13 b16
tof b17 b16
tof b25 b14
tof b29 a24
tof c9 b14
tof c5 a24
tof c19 a24
tof a12 b19
tof c13 a24
tof b18 a24
tof a4 a24
tof b19 a14
tof b16 b14
tof b19 b14
tof b16 a24
tof b19 a24
tof b16 b20
tof b7 b20
tof b21 b20
tof b13 b20
tof b31 c25
tof b17 b20
tof b22 a0
tof c9 b20
tof c5 c22
tof c13 c22
tof b20 c22
tof a0 c22
tof b19 c22
tof a0 c25
tof c27 c25
tof b19 c25
tof c27 b20
tof b19 b20
tof a10 b20
tof b7 b16
tof b21 b16
tof b19 b16
tof b13 c27
tof c24 b12
tof b25 b24
tof a10 c27
tof c28 c2
tof b3 c2
tof a22 c2
tof c10 b12
tof b29 b12
tof c5 b24
tof c13 b24
tof c27 b24
tof b17 b24
tof c2 b24
tof b12 b16
tof c27 b16
tof c2 b16
tof b17 b12
tof c2 b12
tof b28 b21
tof a30 a8
tof b13 b19
tof b17 b21
tof a10 b19
tof c2 b5
tof a22 a8
tof a21 a8
tof c13 c5
tof b18 b21
tof a4 b21
tof b5 b7
tof c27 b7
tof b19 b7
tof b5 b21
tof c27 b21
tof c5 b21
tof c27 a8
tof b19 a8
tof c5 a8
tof a28 a0
tof b19 a0
tof b17 b5
tof c18 a17
tof a10 a17
tof b22 a0
tof c5 a0
tof b13 b5
tof b13 a0
tof b19 b28
tof a5 c27
tof b17 c27
tof a9 c27
tof c4 c27
tof c2 c27
tof b29 a19
tof c5 b13
tof c19 b28
tof b18 b28
tof a4 b28
tof c29 a19
tof a10 a19
tof c27 b28
tof a10 b28
tof b13 c27
tof a10 c27
tof b19 a28
tof b13 a28
tof b25 b4
tof c2 a18
tof b3 a10
tof b23 a10
tof c29 c30
tof a10 a28
tof c28 a28
tof a10 b4
tof c30 b4
tof c28 a18
tof c30 a18
tof b31 a30
tof a10 b17
tof c2 b17
tof c30 c28
tof b3 b17
tof b23 b17
tof a21 a22
tof c5 c28
tof b30 b19
tof a31 b19
tof c6 b19
tof b13 b19
tof c28 b19
tof a22 b19
tof c28 a30
tof a22 a30
tof b17 b13
tof c28 b13
tof a5 c24
tof b17 a7
tof a10 b31
tof c30 c24
tof b3 b31
tof a22 a7
tof c1 b31
tof b23 b31
tof a21 a7
tof c5 c28
tof b30 a7
tof a31 a7
tof c6 a7
tof c29 a7
tof c28 c24
tof c28 a7
tof a10 a15
tof c30 a5
tof b3 a15
tof a22 a15
tof c10 a5
tof b29 a5
tof b23 a15
tof a21 a15
tof a31 a15
tof c6 a15
tof b17 a5
tof c29 a5
tof c28 b17
tof c28 a15
tof c29 a15
tof c30 c4
tof b3 a10
tof a22 a9
tof c10 c4
tof b29 c4
tof b23 a10
tof c5 a9
tof b30 a9
tof a26 b25
tof c16 b25
tof a31 a9
tof c6 a9
tof c29 c4
tof c4 a9
tof a10 a9
tof c28 c4
tof a10 b25
tof c28 b25
tof c28 a10
tof a21 a22
tof b18 c18
tof b6 a22
tof a4 c18
tof a22 a10
tof a22 c2
tof c10 c30
tof b29 c30
tof c7 a21
tof b30 a21
tof a31 a21
tof c6 a21
tof a12 a21
tof c29 c30
tof c28 b22
tof c30 b22
tof a22 b22
tof a22 c28
tof a21 c28
tof a22 c30
tof a21 c30
tof c14 c30
tof c10 b3
tof b29 b3
tof b23 b3
tof a21 a22
tof b6 a22
tof c29 b3
tof c29 a22
tof c29 b0
tof b1 c10
tof a21 a29
tof b6 a29
tof a4 b18
tof c29 b29
tof b29 c10
tof b18 b29
tof c7 c0
tof c5 c0
tof c14 b23
tof a12 c0
tof b6 b23
tof a21 c8
tof b6 c8
tof c29 a2
tof c14 b1
tof b6 a21
tof a21 c9
tof a21 a25
tof a12 c7
tof c7 a21
tof c5 a21
tof c5 c7
tof b6 c7
tof a31 b30
tof c6 b30
tof b6 b30
tof c16 a26
tof c6 a31
tof a12 a6
tof b6 a31
tof b6 c6
tof a4 b18
tof c29 b6
tof b18 a4
tof c11 c26
tof a21 c5
tof a21 c7
tof c5 a31
tof a21 c26
tof a21 c11
tof c5 c13
tof c5 a6
tof c5 a12
tof c7 b6
tof c9 c29
tof c10 b1
tof b29 a4
tof c10 c6
tof a22 c8
tof a22 c0
tof b3 b23
tof b3 c14
tof a22 b6
tof a22 c29
tof a22 a25
tof a22 c9
tof c28 c30
tof c30 b1
tof c30 b23
tof c30 c14
tof b22 b3
tof c28 c7
tof a10 c2
tof a10 c8
tof a10 a29
tof a10 b23
tof a10 a12
tof a10 b3
tof a10 b22
tof a10 c5
tof a10 c7
tof c18 b29
tof a10 a25
tof a10 c9
tof a10 a21
tof a10 c13
tof a10 c6
tof a10 c26
tof a10 c11
tof a10 a6
tof a10 c28
tof a10 b30
tof a10 b6
tof a10 c29
tof a9 c4
tof b25 c16
tof b25 a26
tof b17 a4
tof a5 a4
tof a5 b22
tof a5 a9
tof a5 c6
tof a5 c10
tof a5 c30
tof b31 c1
tof c24 a4
tof c24 c6
tof c24 c10
tof c24 a5
tof b19 c0
tof b19 a29
tof b19 c4
tof b19 c5
tof a30 b31
tof b19 a21
tof b19 a9
tof b19 c26
tof b19 c11
tof b19 a6
tof b19 b30
tof b19 a22
tof b19 a12
tof b19 c13
tof b19 a10
tof b19 a7
tof b19 c28
tof b19 c6
tof b19 a15
tof a28 b4
tof a28 c14
tof a28 b3
tof c27 a9
tof b28 c27
tof a9 b23
tof c27 c4
tof a9 a18
tof a9 b3
tof b28 b22
tof a9 c2
tof a9 b4
tof a9 b31
tof a9 b13
tof a9 c10
tof a9 c16
tof a9 c30
tof a9 a26
tof a9 b25
tof b28 c24
tof a9 a30
tof a9 b17
tof a9 c28
tof a9 c6
tof a9 b19
tof a9 c29
tof a9 a5
tof a9 c9
tof a0 b3
tof a17 b29
tof a17 c18
tof a0 a28
tof b7 b21
tof b7 b5
tof b21 c19
tof b21 c18
tof b21 b2
tof a8 c3
tof b21 b18
tof b16 b12
tof b16 a5
tof b24 b16
tof a5 a2
tof a5 b0
tof b24 b23
tof b24 a18
tof a5 b29
tof b24 c2
tof a5 a19
tof b24 b13
tof b24 c10
tof b24 c30
tof b24 b17
tof b24 b28
tof b24 c6
tof a5 a15
tof b24 b7
tof a5 c29
tof b24 a7
tof b16 a4
tof b24 c24
tof b20 b3
tof b20 a30
tof c25 a30
tof c22 b3
tof c22 a30
tof c22 c25
tof b20 c8
tof b20 a2
tof b20 c0
tof b20 b0
tof b20 b23
tof b20 c4
tof b20 b22
tof b20 c7
tof b20 c2
tof a30 b31
tof b20 c19
tof b20 b13
tof b20 c10
tof b20 c30
tof b20 b2
tof a30 c3
tof b20 b18
tof b20 c27
tof a30 a8
tof b20 b12
tof b20 b21
tof b20 b17
tof b20 a0
tof b20 c28
tof b20 c6
tof b20 a15
tof b20 b7
tof b20 a25
tof b20 c29
tof b20 a5
tof b20 a9
tof b20 a7
tof b20 b6
tof b20 a22
tof b20 b24
tof b20 a28
tof b14 a24
tof b14 a18
tof b14 b5
tof b14 c19
tof b14 c18
tof b14 b2
tof b14 b18
tof b14 b21
tof b14 b7
tof c17 c5
tof c17 a14
tof c17 a31
tof b9 c18
tof a27 c18
tof c18 c8
tof c18 c0
tof c18 b23
tof c18 c4
tof c18 a24
tof a27 b29
tof c18 c2
tof c18 c19
tof c18 b13
tof c18 c10
tof c18 c30
tof c18 b2
tof c18 b18
tof c18 c27
tof c18 b21
tof c18 b10
tof c18 c6
tof c18 b7
tof c18 a25
tof c18 a9
tof c18 a7
tof c18 b6
tof c18 a22
tof c18 b16
tof c18 c25
tof c18 b24
tof c18 b20
tof c18 b22
tof c18 a4
tof c18 b17
tof c18 a17
tof c12 b29
tof b27 c26
tof b27 c11
tof c20 b31
tof b11 a31
tof b11 c17
tof a16 a11
tof a16 c2
tof a11 c26
T* a16
T c12
P* c31
T* c31
T* b10
T c15
T* b11
T* a27
T b15
T c22
T* b12
T* b5
P* c7
T* c7
T* c18
T c28
T* a0
T* a17
T a30
T* b28
T b17
T* a4
T* b22
T* b20
T* c1
T* a28
T b24
T c24
T* c20
T* c25
T* b16
T* a22
T* b14
T* b6
T* a7
T a9
T* c9
T* a5
T c29
T a25
T* b7
T* b19
T* a15
T* c6
T* c17
T* a31
T* b27
T* a11
T* b9
tof b17 c12
tof a4 c12
tof b14 a16
tof b9 c12
tof c2 a16
tof b29 c12
tof a0 c22
tof b22 c22
tof c24 c15
tof b3 c22
tof c14 c22
tof b1 c15
tof c22 b10
tof c22 c15
tof c5 c15
tof c5 b11
tof c24 b15
tof b9 a27
tof a24 b15
tof b1 b15
tof c22 b15
tof b28 c22
tof c28 c7
tof a22 c7
tof c9 c7
tof a5 c7
tof c29 c7
tof b6 b12
tof a9 b12
tof b6 b5
tof a9 b5
tof b6 c7
tof a28 a0
tof a22 c28
tof b6 c28
tof c9 c28
tof a5 c28
tof c29 c28
tof c14 a0
tof c28 c18
tof b22 b28
tof b20 a30
tof c1 a30
tof c25 a30
tof c24 b22
tof b1 b22
tof a4 b17
tof c1 b20
tof b31 c20
tof b23 b24
tof b1 c24
tof b6 a22
tof c9 a22
tof a5 a22
tof c29 a22
tof a9 a7
tof c9 b6
tof a5 b6
tof c29 b6
tof c9 a9
tof a5 a9
tof c29 a9
tof c29 c9
tof c29 a5
tof b13 b7
tof a31 a15
tof c10 c6
tof c11 b27
tof c26 a11
tof a5 c29
tof c9 c29
tof b6 a7
tof b6 a9
tof b20 c1
tof b20 c25
tof b17 a4
tof b17 b16
tof b22 c24
tof b28 c24
tof b28 b22
tof a0 a28
tof c7 a30
tof c7 c28
tof c7 b24
tof c7 c18
tof c7 b19
tof c22 c24
tof a27 a17
tof c22 b22
tof c22 b28
tof b11 c17
tof b11 a31
tof b11 a15
tof a16 b14
tof c12 a17
tof c12 b9
tof c12 a27
H c2
P* b29
Z a1
P c5
P* b5
Z c14
P a30
P* b23
Z b0
P a29
P* b8
Z c8
P c29
H b29
H c31
H a1
H c23
H c5
H a24
H b3
H b12
H b5
H c28
H c14
H a18
H a30
H a4
H c4
H c1
H b23
H b1
H b0
H b16
H a29
H c0
H a20
H a23
H b8
H a2
H c8
H a13
H c29
H a25
tof b8 c2
tof a2 b29
tof c8 c2
tof a13 b29
tof c29 c2
tof a25 b29
tof c8 c31
tof a13 a1
tof a25 a1
tof c29 c31
tof c29 c23
tof a25 c5
tof a25 a7
tof c29 a7
tof c29 a25
tof a13 c29
tof c8 a13
tof a2 c29
tof a2 a13
tof a2 c8
tof c8 a25
tof b8 a2
tof a23 c29
tof a23 b8
tof a20 a2
tof a20 b8
tof a20 a23
tof c29 a7
tof a2 a25
tof a23 c8
tof c0 c29
tof c0 a20
tof a29 a2
tof a29 c0
tof b16 a20
tof b16 c0
tof b16 a29
tof a2 a13
tof a20 c8
tof a29 a23
tof b0 a2
tof b0 b16
tof b1 a20
tof b1 b0
tof b23 b16
tof b23 b0
tof b23 b1
tof a20 b8
tof b16 a23
tof b1 a29
tof c1 a20
tof c1 b23
tof c4 b16
tof c4 c1
tof a4 b23
tof a4 c1
tof a4 c4
tof b16 c0
tof b23 a29
tof c4 b1
tof a30 b16
tof a30 a4
tof a18 b23
tof a18 a30
tof c14 a4
tof c14 a30
tof c14 a18
tof b23 b0
tof a4 b1
tof a18 c4
tof c28 b23
tof c28 c14
tof b5 a4
tof b5 c28
tof b12 c14
tof b12 c28
tof b12 b5
tof a4 c1
tof c14 c4
tof b5 a18
tof b3 a4
tof b3 b12
tof a24 c14
tof a24 b3
tof c5 b12
tof c5 b3
tof c5 a24
tof c14 a30
tof b12 a18
tof b12 c28
tof a24 b5
tof c23 c14
tof c23 c5
tof a1 c28
tof a1 c23
tof c31 c5
tof c31 c23
tof c31 a1
tof c5 b5
tof a1 b12
tof c5 b3
tof a1 a24
tof b29 c31
tof c2 b29
tof c31 b12
tof c2 b3
tof c31 a24
tof c2 c5
tof c31 c23
tof c2 a1
H c2
H b29
H c31
H a1
H c23
H c5
H a24
H b3
H b12
H b5
H c28
H c14
H a18
H a30
H a4
H c4
H c1
H b23
H b1
H b0
H b16
H a29
H c0
H a20
H a23
H b8
H a2
H c8
H a13
H c29
H a25
H a7
tof c16 a11
tof c11 c12
tof b12 a11
tof c28 c12
tof b0 a10
tof a6 b27
tof c26 c13
tof c15 a12
tof a18 b27
tof c4 c13
tof b0 a12
tof b13 a14
tof a19 b21
tof c0 a14
tof a13 c21
tof c29 b21
tof a3 b10
tof c15 b11
tof a29 c6
tof c0 b10
tof a23 b11
tof c30 b25
tof b1 b25
tof b16 b7
tof a2 b26
tof b9 a8
tof b16 a15
tof b8 a26
tof a13 a8
tof b8 c22
tof a2 b28
tof c8 c7
tof c10 c22
tof c10 b28
tof c10 b30
tof a6 b17
tof c29 b30
tof a25 b17
tof a4 b18
tof b12 c3
tof c4 b2
tof b8 b19
tof a2 b2
tof a13 c3
tof a19 c16
tof c5 a31
tof a4 c16
tof b1 c30
tof b0 a31
tof c29 c16
tof c14 c17
tof a18 c17
tof a2 c10
tof c8 c10
tof a6 c17
tof c1 a6
tof a19 c26
tof c28 c26
tof a4 c26
tof c4 c26
tof a13 c11
tof c29 c26
tof b23 c11
tof b23 b9
tof a29 b15
tof c0 a3
tof a23 c15
tof a30 a3
tof a30 c15
tof a19 b13
tof a18 b13
tof a4 b13
tof c0 b13
tof a23 c19
tof c29 b13
tof a25 a17
tof b23 a19
tof b16 a19
tof a2 c18
tof c29 a19
tof a13 c18
tof a13 a28
tof a7 a22
tof b12 b29
tof c28 b29
tof a4 c2
tof b23 b29
tof c28 a1
tof a4 c23
tof b16 c23
tof b12 c31
tof a13 c31
tof b23 a1
tof a13 a1
tof b12 c23
tof b23 c23
tof c28 a24
tof a4 a24
tof b23 a24
tof b1 b3
tof b0 c5
tof b16 a24
tof c8 c5
tof a4 b5
tof c1 b12
tof b23 b5
tof b16 b5
tof a2 c4
tof a18 b12
tof b1 b12
tof c28 b5
tof b1 b5
tof a18 c28
tof c4 c28
tof b1 c28
tof b23 a4
tof b16 a4
tof c4 c14
tof a4 a18
tof a4 a30
tof c4 a30
tof b16 a4
tof a29 b1
tof a2 c4
tof a13 a4
tof c1 c4
tof b1 c1
tof a29 b1
tof c0 b1
tof b8 b1
tof a2 a20
tof c8 a20
tof a13 b23
tof a20 b23
tof a20 b0
tof a20 b16
tof b8 c0
tof a25 a29
tof c0 b16
tof c0 a29
tof a2 a23
tof a13 b8
tof c29 a23
tof a25 b8
tof c29 a13
tof a25 a2
tof a25 c8
tof a25 a7
tof a13 c29
tof a2 c8
tof a2 a13
tof a2 a25
tof b8 a13
tof a23 a13
tof a20 a13
tof a20 a25
tof a20 a2
tof c0 c29
tof c0 a2
tof a29 a2
tof b16 c29
tof c29 c8
tof a2 a25
tof b16 a13
tof b0 b16
tof b1 b16
tof b23 b0
tof b23 c8
tof b16 a13
tof b23 c29
tof b23 a2
tof b1 c0
tof b1 a29
tof c1 a2
tof c4 a2
tof a4 a2
tof a2 c8
tof c1 a25
tof c1 a29
tof a30 a2
tof a18 a30
tof a18 c8
tof c14 c29
tof a18 c4
tof c28 c8
tof b5 c28
tof c28 a18
tof a19 c4
tof a19 c23
tof a19 a24
tof a19 b5
tof a19 c28
tof a19 c29
tof a19 a2
tof a17 b8
tof b13 c4
tof c19 a23
tof b13 c28
tof a17 a7
tof c15 a13
tof a3 a13
tof a3 a30
tof c11 b0
tof b9 b23
tof c11 b29
tof c11 a1
tof c26 a24
tof c26 b5
tof c11 a4
tof b9 a19
tof c10 b23
tof c10 a20
tof a6 a29
tof a6 b12
tof c10 c8
tof a6 c4
tof a31 c5
tof c30 b1
tof c16 c23
tof c30 b3
tof c30 b12
tof c30 b16
tof c30 b5
tof c30 a7
tof c16 c26
tof c16 b13
tof c30 a2
tof c30 c1
tof c30 a25
tof c3 b29
tof c3 c31
tof b2 c28
tof b2 a18
tof b2 c29
tof b2 c14
tof b2 a30
tof b18 c2
tof b28 c10
tof a26 b1
tof a8 b23
tof b25 a7
tof b26 b2
tof b7 b16
tof b26 a23
tof b10 a30
tof b10 a3
tof b11 c15
tof c6 c1
tof c21 c3
tof a14 c28
tof b21 c29
tof a14 b13
tof b21 a2
tof b21 c16
tof a14 c4
tof c21 c11
tof b21 a19
tof c21 b8
tof c21 c18
tof c13 a24
tof b27 b12
tof c13 b5
tof c13 c26
tof b27 c17
tof a12 a13
tof c12 b29
tof c12 a1
tof a11 c23
tof a10 a31
T a7
T* a22
T* a29
T b17
T* a17
T b30
T a23
T b21
T a8
T* a28
T* c21
T* c5
T* c7
T* c10
T b28
T* b26
T c18
T* b19
T c22
T* a26
T b8
T b11
T* c19
T* a20
T b23
T b1
T b10
T a14
T* c6
T* b15
T* a15
T* b7
T a19
T b16
T* b0
T a12
T* a10
P c0
T c0
T* c30
T b25
T a13
T c11
T* b9
T* a25
T c1
T* a6
T b2
T c4
T c13
T* b18
T c16
T* a4
T* c15
T* a3
T a2
T a30
T b13
T b27
T* c14
T c29
T c17
T c26
T* c8
T c12
T* a18
T c28
T b5
T c3
T b12
T a11
T* b3
T* a24
T a31
T* c23
T* a1
T* c31
T b29
T* c2
tof b8 a26
tof b11 a26
tof c19 a26
tof b1 a26
tof b10 a26
tof b7 a26
tof a19 a26
tof b0 a26
tof a12 a26
tof c0 a29
tof c30 a22
tof b25 a7
tof a13 a26
tof c11 a26
tof b9 a26
tof a25 a29
tof a6 a29
tof c15 a26
tof a3 a26
tof c14 a7
tof c29 a7
tof a21 a29
tof a26 a7
tof a17 a22
tof a26 a22
tof a17 a29
tof a26 a29
tof a23 b30
tof a26 a17
tof b7 c21
tof a19 c21
tof b16 a17
tof b0 a17
tof c30 b17
tof c11 c21
tof b9 c21
tof a6 a25
tof b2 b30
tof c4 b30
tof c16 b30
tof a4 b30
tof a3 c21
tof a2 c21
tof a30 c21
tof b13 c21
tof c26 a17
tof c8 a17
tof c28 a17
tof b5 a17
tof a21 c21
tof c0 b17
tof a25 b17
tof b30 a17
tof c0 a17
tof a25 a17
tof c21 b30
tof a25 b30
tof c21 b21
tof c19 b11
tof a20 a8
tof b23 a8
tof b10 b11
tof a14 b11
tof b7 b21
tof a19 b21
tof b16 b21
tof b0 a23
tof a12 b11
tof c0 a23
tof c30 a23
tof b25 b11
tof a13 b11
tof c11 b21
tof b9 b21
tof a25 a23
tof b2 a23
tof c4 a23
tof c16 a23
tof a4 a23
tof c15 b11
tof a2 b11
tof a30 b11
tof b13 b11
tof a18 b11
tof c28 b11
tof b11 a23
tof b11 b21
tof b28 c10
tof b26 c10
tof a19 b7
tof b16 c5
tof b0 c5
tof c0 c5
tof b25 c5
tof c11 a28
tof a25 c10
tof b2 c10
tof c4 c10
tof c16 c10
tof a4 c10
tof c14 a28
tof c29 a28
tof c26 b9
tof c8 b9
tof c28 b9
tof b5 b9
tof a21 c21
tof c10 a28
tof b9 a28
tof c10 c21
tof b7 c21
tof c10 c5
tof b7 c5
tof b9 c5
tof b26 c10
tof a26 b28
tof b8 b28
tof b10 b11
tof a14 b11
tof b7 b28
tof b16 c10
tof b0 b28
tof c0 c10
tof c30 b11
tof c11 b28
tof b9 b28
tof a25 c10
tof b2 c10
tof c4 c10
tof c16 c10
tof a4 c10
tof a2 a3
tof b13 a30
tof c14 c7
tof c29 c7
tof c26 c7
tof c8 c7
tof a18 b11
tof b5 c7
tof a21 c10
tof a3 c7
tof a30 c7
tof c28 c7
tof b11 c10
tof a30 c10
tof c28 c10
tof b11 b28
tof a3 b28
tof c28 b28
tof b8 a26
tof b11 b26
tof b0 b7
tof c0 b16
tof c30 c18
tof b25 b26
tof c11 b16
tof b9 b16
tof a25 b26
tof b2 b26
tof c4 b26
tof c16 b26
tof a4 b26
tof a3 a26
tof a30 b19
tof c14 b7
tof c29 b7
tof c8 b16
tof c28 c18
tof b5 c26
tof a21 b19
tof a26 b26
tof b16 b26
tof c26 b26
tof b7 c18
tof b16 c18
tof c26 c18
tof a26 b19
tof b7 b19
tof b16 b19
tof b11 a26
tof b16 b8
tof b0 c19
tof b25 b8
tof c11 a26
tof b9 a26
tof a25 a26
tof c1 a26
tof a6 a26
tof a30 a3
tof c29 c14
tof c26 c14
tof c8 a3
tof a18 b8
tof c28 c22
tof a21 c19
tof a3 c22
tof c14 c22
tof c19 a26
tof a3 a26
tof c14 a26
tof c19 b8
tof c14 b8
tof c6 b23
tof c0 b23
tof b25 b11
tof c11 b16
tof b9 b16
tof a25 a20
tof c1 a20
tof a6 a20
tof b18 c19
tof a4 c19
tof a3 b11
tof a30 b11
tof c14 b16
tof c26 c19
tof c8 b16
tof a21 b11
tof c19 b11
tof a20 b11
tof b16 c19
tof c30 c19
tof b23 a20
tof c30 a20
tof c6 b23
tof b16 b7
tof c0 b23
tof c30 b7
tof a25 b10
tof c1 b10
tof a6 b10
tof b18 b7
tof a4 b7
tof c15 b7
tof a2 b7
tof a30 b10
tof c14 a3
tof c26 b1
tof c8 b10
tof c28 b23
tof a3 b23
tof b10 b1
tof a3 b1
tof b7 b10
tof a3 b10
tof b7 c6
tof c0 b15
tof c30 a14
tof c1 a25
tof a6 a25
tof b2 a25
tof c4 a25
tof b18 a25
tof c16 a25
tof c15 a19
tof a3 a25
tof a2 a19
tof c14 a25
tof c26 c6
tof c8 a25
tof a18 a14
tof c28 a14
tof c6 a14
tof a13 a14
tof a19 c6
tof a25 c6
tof a13 b15
tof a25 b15
tof b0 b7
tof c30 c0
tof a25 a19
tof c1 a19
tof a6 a19
tof b2 a19
tof c4 a19
tof b18 b9
tof c16 a19
tof a4 b7
tof c15 a19
tof a3 a19
tof a2 a19
tof c14 b9
tof c26 b9
tof c8 b7
tof c28 b9
tof c0 a15
tof a19 b7
tof c0 b7
tof b9 a19
tof a25 c0
tof c1 c0
tof a6 c0
tof c4 b2
tof b18 c0
tof c16 b2
tof a4 a12
tof c15 c0
tof a3 b2
tof a2 c0
tof c26 c0
tof c8 b2
tof c0 b16
tof b2 b16
tof c14 b16
tof a12 b0
tof c0 b0
tof c14 b0
tof c30 a12
tof b2 a12
tof c14 a12
tof a13 c30
tof a25 b25
tof c1 b25
tof a6 b25
tof b2 a10
tof b18 b25
tof c16 c30
tof a3 c30
tof a2 c15
tof c26 b25
tof c8 c30
tof c28 c30
tof b5 c30
tof b3 a10
tof c0 a10
tof b25 c0
tof c15 c0
tof b25 c30
tof b9 c11
tof c1 c11
tof b2 c11
tof c4 c11
tof b18 a6
tof c16 c11
tof b13 c11
tof b27 c11
tof c29 c11
tof c17 c11
tof c26 b25
tof c8 c11
tof a18 c11
tof b5 c11
tof a25 b25
tof a6 b25
tof a25 a13
tof a6 a13
tof a4 a13
tof a25 c11
tof a4 c11
tof a6 b9
tof b2 a25
tof b18 a25
tof c16 a25
tof a3 a25
tof c26 a4
tof a18 a25
tof c28 a25
tof c1 b9
tof c14 b9
tof c8 b9
tof c1 a25
tof c8 a25
tof a4 c1
tof c14 c1
tof c13 c4
tof b18 b2
tof a4 c4
tof c15 a6
tof a3 a6
tof a2 a6
tof b13 c4
tof b27 c4
tof c8 a6
tof a18 a6
tof c28 a6
tof b2 a6
tof c16 a6
tof c14 b2
tof c16 c4
tof c14 c4
tof a4 b18
tof c15 b18
tof b13 b18
tof b27 b18
tof c29 c13
tof c17 c13
tof c28 b18
tof b5 c13
tof c16 c13
tof c14 c13
tof a18 c13
tof c16 b18
tof c26 b18
tof a18 b18
tof c14 c16
tof c26 c16
tof c29 c15
tof c26 a3
tof a18 c14
tof b5 a4
tof a21 a3
tof a2 a4
tof c14 a4
tof a2 c15
tof c14 a3
tof c14 a2
tof c29 a30
tof c8 a2
tof c28 b13
tof a21 a30
tof b13 a2
tof b5 a2
tof b13 a30
tof b5 a30
tof a18 b13
tof c8 b27
tof a18 c26
tof b5 c28
tof a21 c28
tof c29 b27
tof c29 c14
tof c26 c14
tof c26 c29
tof c28 c29
tof a18 c8
tof b12 c17
tof a11 c17
tof c26 c17
tof c8 c26
tof b5 c26
tof a21 c8
tof c3 c28
tof b12 a18
tof a11 b5
tof b3 a18
tof a24 c12
tof a21 c28
tof a18 c12
tof c28 c12
tof c28 a18
tof b5 c28
tof a11 b5
tof a24 c3
tof b12 c3
tof b3 a11
tof a24 a11
tof a21 b3
tof a21 a1
tof a21 b29
tof a21 c2
tof b29 c2
tof a24 a31
tof a11 b3
tof a11 a24
tof a11 b29
tof b3 c31
tof b3 c23
tof b12 b29
tof b12 c31
tof b12 b3
tof c3 c31
tof c3 b3
tof b5 b29
tof b5 b3
tof b5 a1
tof b12 c23
tof c3 a31
tof b12 a11
tof b5 a21
tof b12 a24
tof c28 b29
tof c28 b3
tof a18 c28
tof c12 b29
tof b29 c2
tof b3 a1
tof b3 c3
tof c28 a11
tof a18 a21
tof c28 a24
tof b3 b12
tof b3 b5
tof c8 c3
tof c26 c8
tof c8 c2
tof c8 b29
tof c8 c31
tof c3 c23
tof c8 a31
tof c26 c12
tof c8 a21
tof c29 a18
tof c29 b12
tof c29 c8
tof c14 a18
tof c14 c29
tof b27 b12
tof b27 c29
tof c8 a1
tof a18 c23
tof a18 a31
tof a18 c12
tof a18 c3
tof a18 a21
tof c14 a24
tof c14 b5
tof c14 c17
tof b13 c26
tof a2 c26
tof c26 c31
tof c26 c23
tof c26 a31
tof c26 a11
tof b13 a21
tof a2 a18
tof a2 b12
tof a2 c29
tof a2 b27
tof c26 c14
tof a3 b5
tof a3 a2
tof c15 b5
tof a4 a2
tof a4 c31
tof c15 a1
tof a4 c23
tof a4 a31
tof a3 c12
tof a3 c3
tof a4 a11
tof a2 a21
tof c15 a24
tof a4 c28
tof a2 a18
tof a4 b12
tof c15 c8
tof c15 c29
tof c15 b27
tof a3 b3
tof a4 c14
tof a2 a30
tof c16 a18
tof c16 c29
tof b18 a18
tof b18 c29
tof c13 a18
tof c16 c2
tof c16 b29
tof c13 c31
tof c16 c12
tof c16 c28
tof c16 b12
tof b18 b27
tof c29 a2
tof c29 a3
tof c4 a18
tof b2 a18
tof b2 b18
tof a6 a18
tof a6 b18
tof c4 c31
tof a6 a1
tof a18 c23
tof a6 a24
tof b18 c28
tof a6 b5
tof a6 c8
tof c4 c13
tof b2 b27
tof a6 c15
tof b2 a2
tof c1 c13
tof c1 b3
tof a25 b3
tof b9 c13
tof b9 b3
tof c1 c2
tof c1 b29
tof b9 c31
tof a25 c23
tof c1 a31
tof c1 c12
tof c1 a11
tof c1 a21
tof a25 c28
tof b3 a18
tof b3 b12
tof c1 b27
tof c1 c14
tof c1 a30
tof a25 a2
tof a25 b18
tof c1 a4
tof c1 c4
tof c11 c31
tof a13 b3
tof b25 c31
tof b25 b3
tof a13 c2
tof a13 b29
tof a13 a1
tof c11 c23
tof b25 a31
tof a13 c12
tof a13 a11
tof a13 a21
tof b25 a24
tof c11 a18
tof b3 b12
tof a13 b5
tof a13 c8
tof c11 c13
tof a13 b27
tof a13 c14
tof a13 c15
tof a13 a30
tof a13 a2
tof a13 a6
tof a13 a4
tof a13 c4
tof a13 c1
tof b25 a25
tof a13 b9
tof c30 a21
tof c30 a24
tof c0 a31
tof c0 a21
tof c0 c30
tof a10 a31
tof a10 a21
tof c30 c2
tof c30 b29
tof c0 c31
tof a24 a1
tof c30 c12
tof a21 c3
tof c30 a11
tof c30 b12
tof a24 b5
tof a24 c8
tof c30 b27
tof c30 b3
tof c30 c14
tof a24 c15
tof c30 a30
tof a24 a2
tof a24 a6
tof c30 a4
tof c30 c4
tof c30 c1
tof c0 a25
tof c30 b9
tof c0 b25
tof a24 a13
tof a12 c29
tof b0 c29
tof b0 a12
tof b16 c29
tof a12 c2
tof a12 b29
tof a12 a1
tof a12 c12
tof a12 c3
tof a12 a11
tof a12 a21
tof a12 b5
tof a12 c8
tof a12 b27
tof a12 c14
tof a12 c15
tof a12 a30
tof a12 a2
tof a12 a6
tof a12 a4
tof a12 c4
tof a12 c1
tof a12 b9
tof a12 a13
tof a19 b9
tof b7 b9
tof b7 c2
tof b7 b29
tof a19 c31
tof b7 a1
tof b9 c23
tof b7 a31
tof b7 c12
tof b7 a11
tof b7 a10
tof a19 a18
tof a19 b12
tof b7 b5
tof b7 c8
tof a19 c13
tof b7 b27
tof a19 b3
tof b7 c14
tof b7 c15
tof b7 a30
tof b7 a2
tof b7 a6
tof b7 a4
tof b7 c4
tof b7 c1
tof b9 c11
tof b7 a13
tof a19 c30
tof b7 a12
tof b7 b16
tof b7 b0
tof c6 b15
tof c6 c2
tof c6 b29
tof c6 c31
tof c6 a1
tof c6 a31
tof c6 c12
tof c6 a11
tof c6 a10
tof c6 a18
tof c6 b12
tof c6 b5
tof c6 c8
tof c6 c13
tof c6 b27
tof c6 b3
tof c6 c14
tof c6 c15
tof c6 a30
tof c6 a2
tof c6 a6
tof c6 a4
tof c6 c4
tof c6 c1
tof c6 a13
tof c6 c30
tof c6 a19
tof c6 a12
tof c6 b16
tof c6 b0
tof c6 b7
tof b1 a3
tof b10 a14
tof b23 a24
tof b23 b2
tof a20 a24
tof a20 b2
tof c19 a24
tof c19 b1
tof b11 a24
tof b11 b2
tof b11 b1
tof b2 c2
tof b2 b29
tof b2 c31
tof b2 a1
tof b2 a31
tof b2 c12
tof b2 a11
tof b2 a10
tof b2 a18
tof b2 b12
tof b2 b5
tof b2 c8
tof b2 c13
tof a24 b27
tof b2 b3
tof b2 c14
tof b2 c15
tof b2 a30
tof b2 a2
tof b2 a6
tof b2 a4
tof b2 c4
tof b2 c1
tof b2 a13
tof a24 c30
tof b2 a19
tof c19 a3
tof b2 a12
tof b2 b16
tof a24 b0
tof b2 b7
tof c19 b15
tof b2 c6
tof c19 b10
tof b11 c29
tof a26 c2
tof a26 b29
tof a26 c31
tof a26 a1
tof a26 a31
tof a26 c12
tof a26 a11
tof a26 a10
tof a26 a18
tof a26 b12
tof a26 b5
tof a26 c8
tof a26 c13
tof a26 b3
tof a26 c14
tof a26 c15
tof a26 a30
tof a26 a2
tof a26 a6
tof a26 a4
tof a26 c4
tof a26 c1
tof a26 a13
tof a26 a19
tof a26 a3
tof a26 a12
tof a26 b16
tof a26 b7
tof a26 b15
tof a26 c6
tof a26 b2
tof a26 b10
tof a26 c29
tof a26 b11
tof b19 c13
tof b26 c13
tof b26 c2
tof b26 b29
tof b26 c31
tof b26 a1
tof b26 a31
tof b26 c12
tof b26 a11
tof b26 a10
tof b26 a18
tof b26 b12
tof b26 b5
tof b26 c8
tof b26 c14
tof b26 c15
tof b26 a30
tof b26 a2
tof b26 a6
tof b26 a4
tof b26 c4
tof b26 c1
tof b26 a13
tof b26 a19
tof b26 a3
tof b26 a12
tof b26 b16
tof b26 b7
tof b26 b15
tof b26 c6
tof b26 b2
tof b26 b10
tof b26 c29
tof b26 b11
tof b26 b8
tof b26 a26
tof c10 b28
tof c10 c2
tof c10 b29
tof c10 c31
tof c10 a1
tof c10 a31
tof c10 c12
tof c10 a11
tof c10 a10
tof c10 a18
tof c10 b12
tof c10 b5
tof c10 c8
tof c10 c13
tof c10 c14
tof c10 c15
tof c10 a30
tof c10 a2
tof c10 a6
tof c10 a4
tof c10 c4
tof c10 c1
tof c10 a13
tof c10 a19
tof c10 a3
tof c10 a12
tof c10 b16
tof c10 b7
tof c10 b15
tof c10 c6
tof c10 b2
tof c10 b10
tof c10 c29
tof c10 b11
tof c10 b8
tof c10 a26
tof c10 b26
tof c5 b12
tof c21 b12
tof c21 c2
tof c21 b29
tof c21 c31
tof c21 a1
tof c21 a31
tof c21 c12
tof c21 a11
tof c21 a10
tof c21 a18
tof c21 b5
tof c21 c8
tof c21 c13
tof c21 c14
tof c21 c15
tof c21 a30
tof c21 a2
tof c21 a6
tof c21 a4
tof c21 c4
tof c21 c1
tof c21 a13
tof c21 a19
tof c21 a12
tof c21 b16
tof c21 b7
tof c21 b15
tof c21 c6
tof c21 b2
tof c21 b10
tof c21 c29
tof c21 b11
tof c21 b8
tof c21 a26
tof c21 b26
tof c21 b28
tof c21 c10
tof a23 b21
tof a8 c2
tof a8 b29
tof a8 c31
tof a8 a1
tof a8 a31
tof a8 c12
tof a8 a11
tof a8 a10
tof a8 a18
tof a8 b12
tof a8 b5
tof a8 c8
tof a8 c13
tof a8 c14
tof a8 c15
tof a8 a30
tof a8 a2
tof a8 a6
tof a8 a4
tof a8 c4
tof a8 c1
tof a8 a13
tof a8 a19
tof a8 a12
tof a8 b16
tof a8 b7
tof a8 b15
tof a8 c6
tof a8 b2
tof a8 b10
tof a8 c29
tof a8 b11
tof a8 b8
tof a8 a26
tof a8 b26
tof a8 b28
tof a8 c10
tof a8 a28
tof a8 c21
tof a17 b30
tof b17 b30
tof b30 c13
tof b30 b27
tof b30 b19
tof b30 c30
tof b30 b0
tof b30 b15
tof b30 a24
tof b30 b10
tof b30 c29
tof b30 b1
tof b30 c19
tof b30 b26
tof b30 b3
tof b30 b28
tof b30 c10
tof b30 a3
tof b30 b21
tof a29 b30
tof a7 a22
tof a7 a29
tof b30 c13
tof b30 b27
tof b30 b19
tof b30 c30
tof b30 b0
tof b30 b15
tof b30 a24
tof b30 b10
tof b30 c29
tof b30 b1
tof b30 c19
tof b30 b26
tof b30 b3
tof b30 b28
tof b30 c10
tof b30 a3
tof b30 b21
T a7
T a29
T* a17
T* b17
T a22
T a23
T b30
T* a8
T b21
T* c21
T c7
T a3
T a28
T c10
T* c18
T* b28
T* c22
T* b3
T b26
T* c19
T a26
T b8
T* b11
T* b1
T* b23
T c29
T b10
T a20
T b2
T* a24
T a14
T* c6
T a15
T b15
T b7
T* b0
T* b16
T* c0
T* a12
T c5
T a19
T c30
T* a13
T* b25
T b9
T c11
T a25
T* c16
T c1
T c4
T* a4
T a6
T* c26
T b18
T* b13
T* a2
T* a30
T* c15
T* c14
T b19
T b27
T c17
T c13
T* c8
T* b5
T b12
T a18
T c28
T* a10
T a21
T* a11
T c3
T c12
T* a31
T c23
T a1
T* c31
T* b29
T c2
tof a3 c21
tof b3 a29
tof b26 a29
tof c19 a29
tof a26 a29
tof b11 a29
tof b1 c21
tof c29 a7
tof b2 a17
tof a14 a7
tof c6 a7
tof a15 a7
tof b16 a7
tof c0 a29
tof a12 c21
tof a19 a29
tof c30 a29
tof a13 a17
tof b9 a29
tof a25 a17
tof c16 a17
tof a4 a17
tof c26 a17
tof b13 b25
tof a2 b25
tof b27 a17
tof c17 a17
tof c8 a7
tof b5 a7
tof c28 a17
tof a10 b25
tof a21 a29
tof a11 a17
tof c3 a17
tof c21 a7
tof a24 a7
tof c21 a29
tof b25 a29
tof a24 a17
tof b25 a17
tof b30 b17
tof a8 b17
tof c21 a22
tof b3 b17
tof b26 b17
tof a26 c19
tof b11 c19
tof a20 b23
tof b2 a23
tof a24 b23
tof a14 a23
tof c0 b23
tof a12 c19
tof a19 c19
tof c30 c19
tof a13 a23
tof b25 a23
tof c16 a23
tof c1 c19
tof a4 a25
tof c26 a25
tof b13 c19
tof a2 c19
tof c15 c19
tof c14 c19
tof b19 a22
tof b27 b17
tof c17 a25
tof c13 a22
tof b5 a22
tof c28 a25
tof a21 b17
tof a11 a25
tof c3 a25
tof b22 a10
tof c19 b17
tof b23 b17
tof a25 b17
tof a23 a22
tof b23 a22
tof a25 a22
tof c19 a23
tof b23 a23
tof a10 a23
tof a3 b30
tof b26 b3
tof b1 b30
tof b23 a8
tof a20 c21
tof a24 b3
tof c0 b21
tof a12 b2
tof a13 b2
tof b25 b30
tof b9 b21
tof a25 b30
tof c16 b2
tof c1 b21
tof b13 b21
tof a2 b21
tof c15 b21
tof c14 b21
tof b19 b21
tof b27 b21
tof c17 b30
tof c13 b21
tof b5 b21
tof c28 b30
tof a10 b30
tof a11 b30
tof c3 b30
tof b22 b30
tof a8 b30
tof b3 b30
tof b2 b30
tof c21 a8
tof b3 a8
tof b3 b21
tof b2 b21
tof c10 c7
tof b3 c7
tof c19 a3
tof b1 a3
tof b23 b11
tof c29 c21
tof a20 c21
tof c0 b2
tof a19 c7
tof c30 c7
tof b25 a24
tof b9 c7
tof a25 c21
tof c16 c7
tof c15 c7
tof c14 c7
tof b27 c21
tof c8 c21
tof b5 c21
tof a10 c7
tof a21 b11
tof b22 c7
tof b2 c21
tof a24 c21
tof a12 c21
tof a3 c7
tof a24 c7
tof a12 c7
tof b11 a3
tof b2 a3
tof a24 a3
tof b26 c18
tof b11 a28
tof c29 c18
tof b2 c19
tof a24 c19
tof c0 b23
tof a12 c10
tof c30 a19
tof b25 c18
tof b9 c18
tof a25 c18
tof c16 a19
tof c1 a28
tof b13 a28
tof a2 a28
tof c15 c18
tof c14 c18
tof b19 a28
tof b27 a19
tof c13 a28
tof c8 a28
tof a21 c10
tof c10 a28
tof a19 a28
tof c19 c10
tof b23 c10
tof b23 c18
tof a19 c18
tof b26 b3
tof c19 b3
tof c29 b3
tof b10 c22
tof a24 b3
tof c0 c22
tof c5 c22
tof a19 c22
tof c30 c22
tof b25 a12
tof b9 c22
tof a25 c22
tof c16 c22
tof c1 c22
tof a4 c22
tof a6 c22
tof c15 c22
tof c14 c22
tof b27 a12
tof c17 a12
tof c8 b3
tof b5 b3
tof c28 a12
tof a21 b28
tof a11 a12
tof c3 a12
tof b22 a10
tof a10 b28
tof b3 c22
tof a10 c22
tof a12 b3
tof b2 b26
tof a24 b26
tof c0 c19
tof a19 a26
tof b25 b26
tof a25 a26
tof c16 c19
tof c1 b23
tof a4 b26
tof c26 b26
tof a2 b13
tof c15 a26
tof c14 a26
tof b27 a26
tof c17 a26
tof c28 a26
tof a10 b26
tof a21 b23
tof a11 a13
tof c3 a26
tof c12 c19
tof b23 b26
tof b9 b26
tof b13 b26
tof a26 c19
tof b23 c19
tof b13 c19
tof a13 a26
tof b9 a26
tof b13 a26
tof b23 b8
tof c29 b8
tof b2 b8
tof a24 b8
tof b15 c6
tof b16 c6
tof c0 b11
tof a12 c6
tof b25 c6
tof a25 b8
tof c1 b8
tof b27 b11
tof c17 c6
tof c28 c6
tof a21 b1
tof a11 c6
tof c3 c6
tof b22 c6
tof c6 b8
tof a10 b8
tof c6 b11
tof a10 b11
tof a10 b1
tof a24 b23
tof c6 c29
tof b16 c29
tof c0 b23
tof a12 b2
tof a13 c29
tof a25 b2
tof c16 c29
tof c4 b10
tof a4 c29
tof a6 b10
tof c26 c29
tof b18 b10
tof b13 b10
tof b27 b2
tof c17 c29
tof c28 c29
tof a21 b10
tof a11 c29
tof c3 c29
tof c12 c29
tof b22 c29
tof b2 b23
tof b25 b23
tof c1 b23
tof b2 c29
tof b9 c29
tof c1 c29
tof b25 b10
tof b9 b10
tof c1 b10
tof b15 a20
tof b16 a20
tof c0 b2
tof a12 a20
tof a13 a24
tof b25 c6
tof b9 a24
tof c16 a24
tof c1 a24
tof c26 a4
tof b27 a24
tof c17 a20
tof c28 a20
tof a10 b13
tof a21 c6
tof a11 a20
tof c3 a20
tof c12 a24
tof b22 a20
tof b2 a20
tof c6 a20
tof a4 a20
tof a4 b2
tof b13 b2
tof c6 a24
tof a4 a24
tof b13 a24
tof b7 a15
tof b16 b15
tof c0 a15
tof c5 a15
tof a19 a15
tof c30 a15
tof a13 c6
tof b25 c6
tof a25 a12
tof c1 b9
tof a4 a14
tof a6 a15
tof c26 a15
tof b13 a12
tof c15 a15
tof c14 a15
tof b27 a14
tof a10 b15
tof a21 a14
tof a11 a12
tof c12 b9
tof b22 b15
tof c6 a14
tof b9 a14
tof c16 a14
tof b15 c6
tof a12 c6
tof c16 c6
tof a12 a15
tof b9 a15
tof c16 a15
tof a12 b0
tof a13 b15
tof a25 b25
tof c16 b25
tof c1 b0
tof a4 b7
tof a6 b7
tof c26 b7
tof b13 b15
tof b27 b25
tof c17 b0
tof c28 b0
tof a10 b0
tof a11 b15
tof c3 b0
tof b25 b15
tof b25 b0
tof c5 c0
tof a19 c0
tof c30 c0
tof a13 a12
tof b25 a12
tof b9 a12
tof c16 c0
tof c15 c0
tof c14 c0
tof b27 c0
tof c17 a12
tof c28 a12
tof a10 a4
tof a21 a18
tof a11 a18
tof c3 b16
tof b22 a18
tof a4 b16
tof b13 b16
tof a18 b16
tof a4 c0
tof b13 c0
tof a4 a12
tof a18 a12
tof b9 a13
tof a25 c5
tof c4 c5
tof a4 a19
tof c26 c5
tof b18 c5
tof b13 c16
tof c15 a19
tof c14 a19
tof b27 c16
tof a18 c5
tof a10 a13
tof a21 a13
tof c3 c5
tof a19 c5
tof c30 c5
tof a13 c5
tof c30 a19
tof c16 a19
tof a13 c30
tof c1 c30
tof a4 b9
tof b13 a13
tof b27 b25
tof c17 b25
tof c28 b25
tof a21 b9
tof a11 a18
tof c3 b9
tof b22 c1
tof c1 a13
tof a10 a13
tof a18 b25
tof a10 b25
tof c1 b9
tof a18 b9
tof c1 a25
tof c4 a25
tof a4 a25
tof c26 a25
tof b18 a25
tof b13 c16
tof c15 a25
tof c14 c16
tof b19 c11
tof b27 a30
tof c17 c11
tof b5 c13
tof a18 a25
tof c28 c11
tof a21 c16
tof a11 c13
tof c3 c13
tof a25 c11
tof c16 c11
tof c16 a25
tof c13 a25
tof a10 a25
tof a30 c16
tof a10 c16
tof c26 c1
tof b18 c1
tof b13 c4
tof a30 c1
tof c14 c1
tof b27 c1
tof a10 c1
tof c3 a11
tof c4 c1
tof a4 c1
tof a21 c1
tof a2 c4
tof a21 c4
tof a21 a4
tof a11 a4
tof a2 a6
tof a30 b13
tof c15 b13
tof b19 a6
tof b27 a6
tof c17 b13
tof a18 c13
tof c28 c26
tof a21 c13
tof a11 c13
tof c26 a6
tof b13 a6
tof b13 c26
tof c13 c26
tof a10 c26
tof b13 b18
tof c13 b18
tof c14 b13
tof b19 a30
tof c13 b13
tof c8 a30
tof b5 a30
tof c28 b13
tof a10 c15
tof a21 a30
tof a11 a2
tof b22 a30
tof c15 b13
tof a18 a2
tof c15 a30
tof a18 a30
tof c8 c14
tof b5 b27
tof a18 c14
tof c28 c17
tof a10 c15
tof a21 c17
tof a11 c15
tof c3 c15
tof c12 c15
tof b22 c14
tof c14 c15
tof b19 c15
tof b27 c15
tof b27 c14
tof c17 c14
tof b27 b19
tof b5 c13
tof a18 c8
tof c28 c8
tof a11 a10
tof c3 c13
tof c12 c13
tof b22 c13
tof c13 b27
tof a21 b27
tof a10 c17
tof a21 c17
tof c8 c13
tof a10 c13
tof a21 c13
tof a11 c28
tof c12 c3
tof b22 c28
tof b5 c8
tof c28 c8
tof c3 c8
tof a10 b5
tof a21 b5
tof c3 b5
tof c28 b12
tof a21 b12
tof c3 b12
tof a21 a10
tof a11 a10
tof b22 a18
tof c3 a18
tof a10 c28
tof c3 a10
tof b22 c3
tof b22 c12
tof b22 c2
tof c23 c2
tof c3 c31
tof c3 b22
tof a11 c31
tof a11 b22
tof a21 b22
tof a21 c2
tof a11 a1
tof b22 c12
tof a10 c3
tof c28 c3
tof c28 c2
tof a10 b29
tof c28 c31
tof a10 a1
tof c3 c12
tof a10 b22
tof a10 a11
tof c8 b12
tof c8 b5
tof c8 b22
tof b5 a11
tof c13 c28
tof c17 c28
tof c17 a18
tof b27 c28
tof b27 a18
tof a18 b29
tof c28 c31
tof a18 c23
tof a18 a31
tof c13 c12
tof c13 b12
tof a18 b5
tof c14 c8
tof c15 b19
tof c15 c14
tof c15 b29
tof c15 c31
tof c15 c23
tof c15 a31
tof c15 c28
tof c15 b12
tof c15 b5
tof c15 b27
tof c14 c13
tof c14 a10
tof a30 c23
tof a30 c15
tof a2 c23
tof b13 c23
tof b13 a30
tof c23 c2
tof a30 b29
tof c15 c31
tof a30 a31
tof c15 c12
tof c15 b22
tof c15 c28
tof a30 b12
tof c15 a11
tof c15 b5
tof c15 b19
tof a30 b27
tof a30 c13
tof c15 c8
tof c15 c14
tof b13 a18
tof c26 b18
tof c26 b13
tof a4 b18
tof c4 b18
tof c1 b18
tof c1 c4
tof b18 c2
tof c4 c23
tof a4 c12
tof a4 b22
tof a4 a21
tof a4 c3
tof a4 c28
tof a4 b12
tof a4 a11
tof a4 b19
tof a4 c13
tof a4 c8
tof a4 c14
tof a4 a6
tof c1 c26
tof a4 a30
tof a25 c26
tof c11 a25
tof c16 c2
tof c16 c23
tof c11 c12
tof c16 b18
tof c16 c4
tof c16 c15
tof c16 c1
tof b9 c15
tof b25 c15
tof b25 c11
tof a13 c15
tof a13 c11
tof a13 b9
tof a13 c2
tof a13 b29
tof a13 c23
tof c11 c12
tof a13 b12
tof a13 b18
tof a13 c4
tof b25 a2
tof a13 c1
tof b25 a30
tof c5 a31
tof c5 c11
tof c5 b9
tof c5 b25
tof a19 a4
tof a12 a13
tof a12 a18
tof a12 c5
tof c0 c5
tof c0 a12
tof b16 a13
tof b16 a12
tof a13 b29
tof a18 c31
tof c0 c23
tof c5 a31
tof a18 c12
tof a18 b22
tof a18 c28
tof c0 b12
tof a18 a11
tof a18 b5
tof a18 b19
tof a12 b27
tof a18 c8
tof a18 a10
tof a18 c14
tof a18 a6
tof a12 c11
tof c5 b9
tof c5 b25
tof a18 a19
tof b7 b0
tof b15 c31
tof b15 c28
tof b15 b12
tof b15 b5
tof b15 b27
tof b15 c8
tof b15 a10
tof b15 c14
tof b15 a6
tof b15 a30
tof b15 a19
tof b7 a13
tof a15 a30
tof c6 a15
tof a15 b29
tof c6 c31
tof a30 c12
tof c6 c28
tof c6 b12
tof c6 b5
tof c6 b27
tof c6 c8
tof c6 a10
tof c6 c14
tof a15 c4
tof a30 a2
tof c6 a6
tof a15 c15
tof a15 c1
tof a30 c11
tof a15 b9
tof c6 a19
tof a15 a18
tof c6 b15
tof a15 a12
tof a24 b16
tof b2 a24
tof a24 c2
tof b2 b29
tof a24 c31
tof b16 c23
tof a24 a31
tof a24 c12
tof b16 b22
tof a24 c28
tof a24 b12
tof b16 a11
tof a24 b5
tof b16 b19
tof b2 b27
tof a24 c8
tof a24 a10
tof a24 c14
tof a24 b18
tof b16 a2
tof a24 a6
tof b2 c11
tof b16 a30
tof a24 b25
tof a24 c30
tof a24 a19
tof a24 a14
tof b10 c5
tof c29 a15
tof b23 a15
tof b23 b10
tof a15 b29
tof b23 c31
tof a15 c12
tof b23 a21
tof b23 c3
tof b23 b12
tof b23 b5
tof c29 b27
tof b23 c13
tof b23 a10
tof a15 c4
tof a15 a2
tof b23 a6
tof a15 c15
tof a15 c1
tof a15 c11
tof a15 a30
tof a15 b9
tof a15 a18
tof a15 a12
tof b23 c0
tof c29 b16
tof b23 a20
tof b23 a14
tof b23 b2
tof b11 c2
tof a26 c29
tof a26 a24
tof c19 c29
tof c19 a24
tof b26 c29
tof a24 b29
tof b26 c31
tof c29 c23
tof a24 a31
tof c29 c12
tof c29 b22
tof b26 a21
tof b26 c3
tof b26 b12
tof c29 a11
tof b26 b5
tof c29 b19
tof b26 b27
tof b26 c13
tof b26 a10
tof a24 b18
tof c29 c4
tof a24 a2
tof b26 a6
tof c29 c15
tof c29 c1
tof a24 a30
tof c29 b9
tof a24 b25
tof a24 c30
tof c29 a18
tof a24 b15
tof c29 a12
tof b26 c0
tof b26 b16
tof a24 a13
tof c29 a15
tof b26 a20
tof b26 a14
tof b26 b2
tof b26 b10
tof a24 b11
tof a24 b8
tof b3 c31
tof b3 c23
tof b3 c12
tof b3 b22
tof b3 a21
tof b3 c3
tof b3 b12
tof b3 a11
tof b3 b5
tof b3 b19
tof b3 b27
tof b3 c13
tof b3 a10
tof b3 c4
tof b3 a6
tof b3 c15
tof b3 c1
tof b3 b9
tof b3 a18
tof b3 a12
tof b3 c0
tof b3 b16
tof b3 a15
tof b3 a20
tof b3 a14
tof b3 c29
tof b3 b2
tof b3 b10
tof b3 b26
tof c10 c18
tof c21 b29
tof c21 c31
tof c21 c12
tof c21 a21
tof c21 c3
tof c21 b12
tof c21 b5
tof c21 c13
tof c21 a10
tof c21 c4
tof c21 a2
tof c21 a6
tof c21 c15
tof c21 c1
tof c21 c11
tof c21 a30
tof c21 b9
tof c21 a18
tof c21 a12
tof c21 c0
tof c21 a15
tof c21 a20
tof c21 a14
tof c21 b2
tof c21 c5
tof c21 b10
tof c21 c22
tof c21 b26
tof c21 b8
tof c21 c18
tof c21 b3
tof a3 a28
tof a3 b11
tof b17 a22
tof a23 a24
tof b17 c21
T a7
T* a29
T* b17
T a17
T c21
T a23
T a24
T a22
T* a8
T* b21
T* a3
T* b30
T* b11
T c7
T* c10
T a28
T* b3
T b28
T c18
T a26
T* b8
T* c19
T* b26
T* b23
T b1
T c22
T b10
T c5
T* b2
T c29
T* a14
T* a20
T* c6
T a15
T* b7
T a13
T* b16
T* c0
T a12
T* b15
T* a18
T b0
T a19
T* c30
T* a4
T* b25
T b9
T* a30
T c11
T a25
T c16
T* c1
T* c15
T* c26
T* b13
T a6
T a2
T* c4
T b18
T* c14
T a10
T* c8
T c13
T b27
T* c17
T* b19
T* b5
T* a11
T b12
T* c28
T* c3
T* a21
T* b22
T c12
T a31
T c23
T* a1
T c31
T* b29
T c2
tof b10 c21
tof c5 c21
tof b2 b17
tof a14 a7
tof a20 c29
tof c6 c29
tof a15 a7
tof b7 a7
tof b15 a7
tof a18 a7
tof b25 a7
tof b9 c29
tof a30 b17
tof c11 c21
tof a25 c21
tof c16 c21
tof c1 c21
tof c26 c21
tof b13 c21
tof c14 b17
tof c8 c21
tof c13 c29
tof b27 c29
tof c17 c29
tof b5 c21
tof a11 c21
tof c28 c29
tof c3 c29
tof c27 c21
tof b17 a7
tof c21 a7
tof c21 a29
tof a10 a29
tof c21 b17
tof c29 b17
tof a10 b17
tof a24 a23
tof a8 a17
tof c5 b10
tof b2 a23
tof c29 a23
tof c6 a20
tof c0 c21
tof a12 a23
tof b15 a20
tof b25 a18
tof b9 a20
tof a30 c21
tof c16 b10
tof c1 b10
tof c26 b10
tof b13 b10
tof c14 b10
tof c8 b10
tof b19 b10
tof a11 b10
tof c28 b10
tof a21 a20
tof b22 c21
tof c27 c21
tof c21 a17
tof a20 a17
tof a10 a17
tof b10 c21
tof a18 c21
tof a10 c21
tof b10 a23
tof a20 a23
tof a10 a23
tof b1 b23
tof b2 a22
tof c29 a22
tof a20 b23
tof a13 a15
tof c0 b23
tof a12 a24
tof b15 b23
tof a18 a8
tof b0 a15
tof b25 a8
tof a30 a8
tof c16 b23
tof c1 b23
tof a10 a22
tof b27 a22
tof c17 a22
tof b5 b23
tof a11 b23
tof a21 b23
tof a15 a24
tof a8 a22
tof a15 a22
tof b23 a8
tof b23 b21
tof c29 b2
tof a20 b21
tof c0 b30
tof b15 b2
tof a18 b21
tof b25 b2
tof a30 b21
tof a2 b11
tof b18 b11
tof b27 b21
tof c17 b21
tof b5 b11
tof a11 b11
tof c28 a3
tof c3 b11
tof a21 b2
tof b22 b2
tof c27 b2
tof b30 b21
tof b11 b21
tof b11 a3
tof c14 a3
tof b2 b30
tof c14 b30
tof b3 c7
tof b23 a28
tof a20 a28
tof b15 c10
tof a18 c10
tof a19 c10
tof c30 c10
tof b25 c10
tof c14 a28
tof a10 a28
tof b27 a28
tof c17 a28
tof b19 a28
tof b5 a28
tof a21 b11
tof c10 c7
tof a28 c10
tof a21 c10
tof b2 b3
tof c0 b28
tof a12 a28
tof b15 b28
tof b25 b28
tof a25 c11
tof c16 a28
tof c15 a28
tof a10 b3
tof b19 c11
tof b5 a30
tof a11 a28
tof c28 c11
tof a21 a28
tof b22 c11
tof a18 a28
tof a30 a28
tof b28 b3
tof a18 b3
tof a30 b28
tof c11 b28
tof b23 b8
tof b1 b8
tof a20 b8
tof b15 a26
tof b9 a26
tof a30 b8
tof c11 c18
tof c16 b2
tof c1 b8
tof c15 a26
tof c14 a26
tof a10 c18
tof c8 b25
tof b27 c18
tof c17 c18
tof b5 b8
tof a11 c18
tof c28 b25
tof a21 c18
tof a26 c18
tof b2 c18
tof b25 c18
tof b2 a26
tof c0 a26
tof a18 a26
tof b2 b8
tof c0 b8
tof b25 b8
tof b1 b26
tof a20 b23
tof c0 b23
tof a12 b23
tof a18 b23
tof a19 b26
tof b25 b2
tof a30 b15
tof c16 b15
tof c1 b26
tof a2 c19
tof a10 c15
tof c8 b2
tof b19 c15
tof b5 c14
tof a11 b23
tof c28 b2
tof a21 b23
tof b2 c19
tof b15 c19
tof c14 c19
tof b23 b26
tof b2 b26
tof c14 b26
tof b15 b23
tof c15 b23
tof c14 b23
tof c5 b10
tof b2 b10
tof c0 b10
tof a12 b1
tof a18 c22
tof a19 b15
tof c30 b15
tof b25 b15
tof c1 b1
tof c15 b1
tof a6 b15
tof b18 b9
tof c14 a2
tof a10 b10
tof c8 c16
tof a11 c16
tof c28 b10
tof c3 b9
tof a21 a2
tof b15 b1
tof c16 b1
tof a2 b1
tof b10 c22
tof b15 c22
tof a2 c22
tof b9 b10
tof c16 b10
tof a2 b10
tof a20 c5
tof b7 c5
tof a13 c5
tof b15 a12
tof a19 a12
tof c30 a12
tof b25 c5
tof c16 c6
tof c1 a12
tof c15 a12
tof a6 a12
tof a2 c5
tof b18 c6
tof c14 c0
tof a10 a12
tof c8 b2
tof c13 a12
tof b5 c0
tof a11 b9
tof c3 b2
tof a21 b2
tof b22 b2
tof c27 a12
tof c29 c5
tof c0 c5
tof b9 c5
tof c29 b2
tof c0 b2
tof a12 b2
tof c6 c29
tof a12 c29
tof b9 c29
tof b7 a14
tof a13 a14
tof a12 a14
tof a18 c6
tof a19 b15
tof c30 b15
tof b25 a14
tof b9 c6
tof a30 b15
tof a6 b15
tof a10 c6
tof c8 a14
tof a11 c16
tof c28 a20
tof c3 c0
tof a21 a20
tof a20 a14
tof c0 a14
tof c16 a14
tof c6 a20
tof c0 a20
tof b15 a20
tof c0 c6
tof c16 c6
tof c0 b7
tof b0 a13
tof a19 a18
tof c16 b15
tof c26 a30
tof b13 a30
tof a2 a18
tof c4 a18
tof c14 a18
tof c13 b7
tof b19 a30
tof b5 a18
tof a11 a18
tof c28 a15
tof a21 a18
tof c27 a18
tof b7 a15
tof a13 a15
tof b15 b7
tof a30 b7
tof a18 a13
tof a30 a13
tof b15 b16
tof a18 c0
tof a19 c0
tof c11 a30
tof c16 a12
tof c26 a30
tof b13 a30
tof a2 c0
tof c4 c0
tof a10 c14
tof c8 b25
tof c13 a12
tof c17 b16
tof b19 a30
tof b5 c14
tof a11 c0
tof c3 c0
tof a21 c0
tof c27 a30
tof b25 b16
tof c14 b16
tof a30 c0
tof c14 c0
tof b25 a12
tof a30 a12
tof a19 b0
tof b25 b0
tof c11 b0
tof c16 b0
tof c14 a2
tof a10 a2
tof c8 b0
tof a11 a30
tof a21 a2
tof b22 a6
tof c27 a6
tof a30 b15
tof a6 b15
tof a2 b15
tof a30 a18
tof a2 a18
tof c4 a18
tof a30 b0
tof a6 b0
tof c4 b0
tof a30 c30
tof a2 a19
tof c4 c30
tof c14 a19
tof c28 a6
tof a6 a19
tof a11 a19
tof c27 a19
tof a6 c30
tof a11 c30
tof a6 a4
tof c27 a4
tof c16 a30
tof c15 b25
tof a6 c1
tof a2 b25
tof c4 a25
tof b18 b9
tof c14 a30
tof a10 b25
tof c8 a30
tof c28 a11
tof c3 b9
tof b22 b9
tof c27 a11
tof c11 b25
tof c1 b25
tof a11 b25
tof a30 b9
tof c11 b9
tof a11 b9
tof c11 a30
tof a25 a30
tof c1 a30
tof b13 c15
tof a2 c16
tof c14 c11
tof a10 c15
tof c8 c16
tof b19 a25
tof c28 c15
tof a21 c4
tof b22 a25
tof c27 a6
tof a25 c11
tof c4 c11
tof c16 a25
tof a6 a25
tof c4 a25
tof c15 c16
tof c4 c16
tof b13 c15
tof a6 c15
tof c4 c26
tof c14 c26
tof b19 c15
tof a11 a2
tof c3 c1
tof a2 c1
tof c26 c15
tof a2 c26
tof c27 c26
tof c14 c4
tof c8 a6
tof c13 a6
tof c28 b18
tof c3 c4
tof b22 b13
tof c27 a2
tof a2 b13
tof c4 a6
tof c4 a2
tof b18 a2
tof a10 c14
tof c13 c8
tof c17 b27
tof b19 c4
tof a11 c4
tof c3 c4
tof a21 c4
tof c27 c4
tof b18 c4
tof c28 c4
tof b22 c4
tof c14 b18
tof c8 b18
tof b22 b18
tof b27 c14
tof c28 c14
tof b22 c14
tof b27 c13
tof b19 c13
tof b5 a10
tof a11 c13
tof a21 c13
tof b22 c28
tof c27 c13
tof c17 a10
tof c28 a10
tof c28 c8
tof c17 c13
tof b5 b19
tof c3 c28
tof b22 c28
tof c27 c28
tof c28 b27
tof b19 c17
tof c28 b19
tof c28 b5
tof a21 a11
tof b22 c3
tof a11 b5
tof c3 b5
tof c3 a11
tof c3 b12
tof b22 a21
tof c27 c3
tof c27 a21
tof c27 a31
tof c27 c23
tof c27 c31
tof c27 c2
tof a21 b22
tof c3 c31
tof c28 c31
tof c28 b22
tof c3 c2
tof c28 b29
tof c3 a1
tof c3 c23
tof c3 a31
tof c28 b31
tof b12 c3
tof a11 b22
tof a11 c3
tof a11 b12
tof b5 b22
tof b5 b12
tof c3 c2
tof b12 b29
tof a11 c31
tof b12 a1
tof c3 c23
tof c3 a31
tof a11 c27
tof a11 a21
tof a11 c28
tof b5 b31
tof b19 b22
tof b19 b12
tof c17 b22
tof c17 a11
tof b27 a11
tof b27 b19
tof b12 c2
tof b12 b29
tof b12 c23
tof b12 a31
tof b19 c27
tof c13 a11
tof c8 b22
tof c8 a11
tof a10 b22
tof a11 a1
tof c8 c12
tof a11 c3
tof a11 b12
tof c13 c27
tof c8 c28
tof a10 b19
tof c8 b27
tof c8 b5
tof c14 c13
tof c14 b27
tof b18 b27
tof b18 b5
tof c4 c13
tof c4 b5
tof c4 c2
tof b5 b29
tof c14 a1
tof c4 c23
tof c4 a31
tof b18 b22
tof c4 c3
tof c14 b12
tof c4 c28
tof c14 b19
tof a2 c28
tof a2 b18
tof a2 c4
tof a6 c28
tof a6 b18
tof b13 c28
tof b13 c4
tof a2 c2
tof a2 b29
tof c4 c31
tof a2 c23
tof a2 a31
tof a6 c12
tof a2 b22
tof a2 c3
tof b18 b12
tof c4 a21
tof a2 c13
tof b13 b5
tof c4 b31
tof a6 c8
tof c26 b12
tof c26 a2
tof c15 b12
tof c15 c8
tof c15 c26
tof c1 b12
tof c1 c8
tof a2 b29
tof b12 a1
tof c26 c12
tof c26 c28
tof c8 c17
tof a2 b27
tof c26 b5
tof c26 a6
tof c16 c28
tof c16 b5
tof c16 c1
tof a25 b5
tof a25 c1
tof a25 c15
tof c11 b5
tof c11 c16
tof c11 a25
tof c15 b29
tof c16 c31
tof b5 a1
tof c11 c12
tof b5 c3
tof b5 b12
tof b5 c27
tof c16 a21
tof b5 a11
tof b5 a10
tof c15 c17
tof c16 b27
tof c16 b31
tof c1 c4
tof c15 c8
tof c15 a2
tof c16 b13
tof a25 c26
tof c11 a6
tof a30 c8
tof b25 a30
tof a30 b29
tof a30 c31
tof a30 c12
tof c8 c3
tof a30 a21
tof a30 c17
tof a30 b27
tof a30 b31
tof a30 c4
tof a30 a2
tof a30 b13
tof a30 c1
tof a30 c15
tof a30 c16
tof a30 a6
tof a4 c13
tof a19 c13
tof a4 b29
tof a4 c31
tof a19 a1
tof a4 c3
tof c13 c27
tof a19 b19
tof a19 a10
tof a19 b27
tof a19 c14
tof a19 c4
tof a19 c8
tof a19 b25
tof a18 a19
tof b15 b0
tof b15 a18
tof a18 b29
tof a18 c31
tof b0 c12
tof a18 c3
tof a18 b12
tof b0 c28
tof a18 b19
tof a18 a10
tof a18 c17
tof a18 b27
tof a18 c14
tof a18 c4
tof a18 a4
tof a18 c30
tof a18 c8
tof a12 b25
tof c0 a10
tof c0 b25
tof b16 a10
tof c0 b29
tof a10 c31
tof a12 a1
tof c0 c12
tof b25 c3
tof a12 b12
tof c0 c27
tof c0 c28
tof c0 a11
tof b16 b19
tof a12 c17
tof c0 b5
tof c0 a2
tof c0 c1
tof c0 c15
tof c0 b0
tof c0 a25
tof c0 a30
tof c0 c11
tof c0 c30
tof c0 b15
tof c0 a19
tof b7 a13
tof a13 c12
tof a13 c28
tof a13 b0
tof b7 b27
tof c6 b29
tof c6 c31
tof c6 a1
tof a20 c12
tof c6 b22
tof c6 a21
tof a20 c28
tof c6 a11
tof c6 c14
tof c6 b5
tof c6 b31
tof c6 c4
tof c6 a2
tof c6 c1
tof c6 c15
tof c6 c16
tof a20 b0
tof c6 a6
tof c6 a25
tof c6 b9
tof c6 a30
tof a20 a13
tof c6 b15
tof c6 a19
tof a20 b27
tof c29 a14
tof b2 c29
tof c29 b29
tof c29 c31
tof c29 a1
tof c29 c12
tof c29 b22
tof c29 a21
tof c29 c28
tof c29 a11
tof c29 c14
tof c29 b5
tof c29 b31
tof c29 c4
tof c29 a2
tof c29 c1
tof c29 c15
tof c29 c16
tof c29 b0
tof c29 a6
tof c29 a25
tof c29 b9
tof c29 a30
tof c29 a13
tof c29 b15
tof c29 a19
tof c29 b27
tof c29 c0
tof b2 a12
tof b1 c22
tof b10 c5
tof c19 c2
tof c19 c31
tof b26 a1
tof c19 c23
tof c19 a31
tof b26 c3
tof b26 b12
tof b26 c17
tof b26 b25
tof b23 b2
tof b23 b1
tof b23 c22
tof a26 b8
tof a26 c2
tof a26 c31
tof a26 c23
tof a26 a31
tof a26 c19
tof a26 c4
tof b3 b28
tof b28 c18
tof b3 a26
tof b28 c26
tof a28 b23
tof c10 a28
tof b11 b3
tof b30 b29
tof a3 b29
tof b30 c31
tof b30 b22
tof b30 c3
tof b30 b12
tof b30 a21
tof b30 a11
tof b30 c17
tof b30 c14
tof b30 b5
tof b30 a2
tof b30 c1
tof b30 c15
tof b30 c16
tof b30 a6
tof b30 a25
tof b30 b9
tof b30 a30
tof b30 b25
tof b30 b26
tof b30 b15
tof b30 a19
tof b30 c0
tof b30 c29
tof b30 c5
tof b30 b10
tof b30 c22
tof b30 c26
tof b30 b28
tof b30 b3
tof a24 a22
tof a8 b21
tof a8 c10
tof c21 a23
tof b17 b30
tof a7 a29
tof a7 b17
tof b30 b29
tof b30 c31
tof b30 b22
tof b30 c3
tof b30 b12
tof b30 a21
tof b30 a11
tof b30 c17
tof b30 c14
tof b30 b5
tof b30 a2
tof b30 c1
tof b30 c15
tof b30 c16
tof b30 a6
tof b30 a25
tof b30 b9
tof b30 a30
tof b30 b25
tof b30 b26
tof b30 b15
tof b30 a19
tof b30 c0
tof b30 c29
tof b30 c5
tof b30 b10
tof b30 c22
tof b30 c26
tof b30 b28
tof b30 b21
tof b30 b3
tof b17 b31
T a7
T b17
T b31
T* a23
T* c21
T a29
T a24
T a17
T a8
T c10
T a22
T* b11
T b30
T b3
T b21
T a28
T* b23
T* c7
T* b28
T* c26
T a26
T c4
T c18
T c22
T b1
T b8
T b10
T b2
T a12
T c5
T* c6
T a20
T* c29
T c0
T a14
T b7
T* b27
T* a15
T* a19
T b15
T b26
T a18
T a13
T b25
T c8
T c30
T c11
T a30
T b9
T a25
T a6
T* b0
T* c16
T c15
T c1
T b13
T* a2
T* a4
T* c19
T* a3
T* b18
T b5
T* c14
T b16
T c17
T c13
T* a10
T b19
T a11
T* c28
T* a21
T c27
T b12
T c3
T b22
T c12
T* a31
T* c23
T* a1
T c31
T* b29
T* c2
tof a20 b17
tof c29 b31
tof b7 b17
tof b27 b17
tof b15 a19
tof b25 c0
tof c8 c0
tof a25 a7
tof a6 c0
tof b0 b31
tof c16 b17
tof c15 b17
tof b13 b31
tof a4 b31
tof b18 a7
tof b5 a7
tof c17 c0
tof c13 c0
tof a10 a7
tof b19 a7
tof a11 c0
tof c28 b31
tof c27 a7
tof b17 a7
tof c0 a7
tof a19 a7
tof b31 b17
tof c6 b17
tof c0 b17
tof c0 b31
tof a19 b31
tof a12 c21
tof c5 c21
tof c29 a29
tof c0 a29
tof a19 a29
tof b25 c21
tof c8 c21
tof a25 c21
tof a6 c21
tof b0 a29
tof a4 b13
tof b18 c21
tof b5 c21
tof c17 c21
tof c13 c21
tof a11 c21
tof c28 b13
tof c21 a23
tof b13 a23
tof a29 c21
tof b13 a29
tof b11 a8
tof b3 a8
tof a28 c10
tof b23 c10
tof c26 b28
tof a26 a8
tof c4 a8
tof c22 a8
tof b1 a8
tof b2 a8
tof a12 a8
tof c29 c6
tof a15 a24
tof a19 c6
tof b15 a24
tof b26 c10
tof a18 c6
tof a13 a24
tof b25 b28
tof c8 c6
tof c30 a8
tof a30 c11
tof a25 c6
tof b0 c6
tof b13 a24
tof b18 c11
tof b5 c11
tof b16 c11
tof c17 c11
tof a10 c11
tof c28 c10
tof a21 b28
tof c27 a24
tof b28 a24
tof c6 a24
tof c11 a24
tof c10 a17
tof b28 a17
tof c6 a17
tof c10 a8
tof c6 a8
tof c11 a8
tof b3 b11
tof b28 c10
tof c6 c10
tof c0 c29
tof b0 a22
tof b13 a25
tof b18 a25
tof b5 c29
tof c14 a22
tof a10 a22
tof b19 a22
tof c28 c29
tof a21 c29
tof c27 a22
tof a22 c10
tof c29 c10
tof a19 a22
tof a25 a22
tof c29 b11
tof a25 b11
tof c29 b30
tof b0 b21
tof c14 b21
tof a10 b21
tof b19 b21
tof c27 b21
tof b3 b30
tof a25 b30
tof b21 b3
tof a25 b3
tof a19 b21
tof a25 b21
tof c26 c7
tof c6 a28
tof c29 b28
tof a19 a28
tof b26 a28
tof c8 c7
tof a25 a28
tof a6 c7
tof b5 c7
tof c17 c7
tof c13 c7
tof a10 a28
tof b19 a28
tof a11 c7
tof c28 b28
tof b23 a28
tof b28 a28
tof b28 c7
tof c4 a26
tof c22 a26
tof b1 a26
tof c29 a26
tof b25 a26
tof c8 b28
tof c30 a26
tof a25 a26
tof b13 c11
tof b18 b0
tof b5 a6
tof c17 a6
tof c13 a6
tof a10 c11
tof b19 c11
tof a11 a6
tof c28 a26
tof a21 b0
tof c27 a26
tof c11 b28
tof b0 b28
tof c11 c26
tof a6 c26
tof b0 c26
tof a6 a26
tof b0 a26
tof b1 c22
tof c29 c4
tof a19 c18
tof b25 c4
tof c30 c22
tof a25 c22
tof a6 c4
tof b0 c22
tof b13 c18
tof a10 c18
tof b19 c18
tof a11 c18
tof a21 c8
tof c18 c4
tof c8 c4
tof c27 c4
tof c28 c18
tof c27 c18
tof c8 c22
tof c27 c22
tof c6 b10
tof a18 b10
tof c30 b1
tof b9 b10
tof a25 b1
tof b0 c8
tof b13 b8
tof a2 b10
tof a4 b10
tof c14 b10
tof a10 b8
tof b19 b8
tof a11 b8
tof c28 b8
tof b12 b10
tof c3 b10
tof b8 b1
tof a19 b1
tof c8 b1
tof a19 b8
tof c27 b8
tof a19 b10
tof c8 b10
tof b25 a12
tof c8 a12
tof a6 a12
tof b0 a12
tof b13 b2
tof a10 b2
tof b19 b2
tof c28 c29
tof a21 a25
tof c27 b2
tof a12 b2
tof a19 b2
tof a25 b2
tof c5 a12
tof a25 a12
tof c29 c5
tof a19 c5
tof a25 c5
tof c0 a20
tof a19 c29
tof a18 c6
tof c8 c6
tof a25 c29
tof b13 a20
tof b18 b0
tof b5 a20
tof c14 b0
tof a21 b0
tof c27 b0
tof b12 b0
tof c3 b0
tof b0 c6
tof c28 c6
tof c29 a20
tof b0 a20
tof c28 a20
tof a10 c29
tof c28 c29
tof b27 b7
tof a25 a14
tof c16 b7
tof c15 b7
tof b5 c0
tof a10 b0
tof b19 b0
tof c28 b0
tof a21 a14
tof c27 b0
tof a14 c0
tof a19 c0
tof b0 a14
tof a19 b7
tof b15 a15
tof a25 a15
tof b0 a15
tof b13 a19
tof b18 a15
tof c14 a15
tof b19 a19
tof a21 a15
tof c27 c28
tof b12 a15
tof c3 a15
tof c28 a15
tof c28 a19
tof a6 b26
tof b13 a18
tof b18 a25
tof c14 a25
tof a10 b26
tof b19 a13
tof c28 b15
tof a21 a25
tof b12 a25
tof c3 a25
tof a25 b15
tof b0 b15
tof a18 b26
tof a25 b26
tof a13 a18
tof a25 a18
tof b0 a18
tof a25 b25
tof a6 b25
tof b0 c8
tof b13 c8
tof b18 c30
tof c14 c30
tof c28 b25
tof c27 c30
tof b12 c30
tof c3 c30
tof b19 a13
tof c8 b25
tof c30 c8
tof b19 c8
tof a6 c11
tof b0 c11
tof c14 b18
tof a10 c11
tof b19 c11
tof c28 c11
tof a21 c11
tof c27 b18
tof b12 b18
tof c3 b18
tof b18 c30
tof a30 c11
tof b18 c11
tof b13 b0
tof b18 a25
tof b5 a6
tof b16 a6
tof c17 a6
tof a10 b9
tof b19 a25
tof c27 b0
tof b12 c14
tof c3 c14
tof a25 b9
tof c14 b9
tof c28 b9
tof b0 a25
tof a3 a25
tof c14 a25
tof b0 a6
tof c14 a6
tof c28 a6
tof b13 b0
tof c14 b0
tof b19 b0
tof c27 b0
tof a1 c1
tof c1 c16
tof c1 c15
tof a4 b13
tof a10 b13
tof b19 b13
tof c28 b13
tof c27 b13
tof c19 b13
tof c19 a2
tof c14 a3
tof c12 a3
tof a1 a3
tof c19 a4
tof c31 a4
tof c31 a3
tof b16 b5
tof c17 b5
tof c27 b18
tof c3 b18
tof c14 b5
tof c3 b5
tof c3 c14
tof c31 c13
tof b19 a10
tof c27 c28
tof c31 c27
tof c12 c3
tof a1 c3
tof c31 c3
tof a1 c12
tof b19 a11
tof a10 a11
tof a10 b19
tof b19 c27
tof b19 a21
tof b19 c28
tof b16 c17
tof b16 c13
tof b5 c17
tof a3 c3
tof a4 a3
tof c3 b12
tof c3 b18
tof a4 c27
tof c3 c17
tof a3 c12
tof a4 c31
tof c3 b5
tof a4 c13
tof c3 c14
tof b13 a2
tof b13 c27
tof b13 c12
tof b13 c13
tof b13 c19
tof b13 a3
tof b13 a4
tof b13 c2
tof b13 c31
tof c16 c15
tof c16 a1
tof c16 c1
tof c16 a3
tof a6 b5
tof a25 b5
tof a25 b12
tof a25 b18
tof a25 c17
tof a25 c12
tof a6 c13
tof a25 c14
tof a6 b16
tof a25 c3
tof a25 a3
tof a25 b29
tof c11 a30
tof c8 c30
tof a18 a13
tof a19 a11
tof a19 b12
tof a19 b18
tof a19 b26
tof a19 a13
tof a19 c30
tof a19 c19
tof a19 c14
tof a19 c3
tof a19 b22
tof a19 a3
tof a19 c23
tof a19 a4
tof a19 b29
tof a19 c2
tof a19 c31
tof a19 b25
tof a19 b13
tof a19 a25
tof a19 a18
tof a19 c8
tof a19 a2
tof a19 c13
tof a19 c27
tof c0 a14
tof b7 b27
tof c29 c12
tof c6 a20
tof c6 c12
tof c6 a1
tof c6 b26
tof c29 c17
tof c6 a14
tof c12 a13
tof c29 b0
tof c6 c1
tof c29 c19
tof c29 b19
tof c6 c3
tof c29 b22
tof c12 a3
tof c29 c23
tof c6 c16
tof c29 c2
tof c29 c31
tof c29 c28
tof c29 a6
tof c29 b25
tof c12 b9
tof c29 b13
tof c12 c0
tof c12 a18
tof c29 a2
tof c29 c13
tof c29 a21
tof c29 a19
tof c29 b5
tof a12 c5
tof b1 b8
tof c4 c18
tof c22 a31
tof b28 c26
tof b28 a26
tof a26 a1
tof a26 c18
tof b28 b8
tof b28 b22
tof a26 a3
tof b28 a31
tof a26 c16
tof a26 c4
tof b28 b1
tof b28 a18
tof b28 c8
tof b28 a30
tof b28 c22
tof a28 b23
tof b3 b21
tof c10 a22
tof b11 a1
tof b11 b21
tof b11 c18
tof b11 a3
tof b11 c16
tof b11 b3
tof b11 c4
tof b11 a26
tof b11 b30
tof a8 a1
tof a8 c18
tof a8 a3
tof a8 a31
tof a8 c16
tof a8 c4
tof a8 a26
tof a8 c22
tof c21 a29
tof b17 b31
H c2
tof a26 c31
tof c19 c31
tof b27 b13
tof b23 a1
tof c27 c28
tof c0 b28
tof b3 a11
tof c19 c28
tof b27 b28
tof b23 a11
tof a18 c17
tof c30 a10
tof c5 b12
tof c5 c17
tof a19 a6
tof a30 c15
tof c1 a6
tof b8 b18
tof b8 c15
tof c12 b9
tof a26 b26
tof b27 b9
tof c26 b26
tof a29 b25
tof a26 a15
tof c8 a20
tof a14 b2
tof b23 a15
tof a24 a20
tof c22 c7
tof c26 c7
tof b8 a8
tof b8 b11
tof c22 b30
tof c12 a23
tof b23 b30
tof b21 a17
tof a29 a23
tof c22 a7
tof a24 a7
tof c3 a25
tof c30 a25
tof a30 c29
tof c8 b5
tof a3 c6
tof c19 c29
tof b27 b5
tof b8 c29
tof a24 b5
tof a30 a21
tof c14 a19
tof a13 a21
tof b8 a21
tof c26 c22
tof c1 c12
tof b0 c13
tof c30 c27
tof b27 c12
tof c8 a26
tof c11 a30
tof b15 a26
tof b27 a26
tof b8 a2
tof b23 a26
tof a22 a2
tof a24 a26
tof c0 b7
tof c30 c8
tof a13 a18
tof b27 b15
tof c26 c8
tof b23 c8
tof a24 c8
tof b15 c8
tof b15 b7
tof c30 c0
tof a29 c0
tof c5 a12
tof c5 b1
tof c18 c4
tof c26 a28
tof b23 b3
tof b3 a28
tof b0 b3
tof b31 b17
tof a22 c10
tof a22 c21
tof c3 b29
tof c19 b29
tof c26 b29
tof a3 c23
tof c3 c16
tof c30 c16
tof c19 a31
tof a29 b22
tof c30 a31
tof b27 a3
tof c30 b22
tof b27 b22
tof c14 b19
tof c30 c3
tof b27 c3
tof b27 b16
tof c18 c14
tof c26 c19
tof a29 c1
tof c19 c14
tof c30 c19
tof b27 c19
tof b27 c1
tof b15 c30
tof b8 a13
tof c26 c30
tof a24 c30
tof b27 b0
tof a13 c11
tof b27 c11
tof a13 c30
tof b27 c30
tof c5 b15
tof b23 b15
tof a24 b15
tof b31 a14
tof b27 a13
tof b8 a13
tof c26 a13
tof b8 b15
tof c26 b15
tof a14 b27
tof c26 b27
tof b8 c5
tof c18 c5
tof c26 b10
tof a22 c5
tof a29 b10
tof b31 b21
tof b10 a14
tof b21 b10
tof a22 c18
tof a29 c18
tof c26 b8
tof c26 c18
tof b23 c26
tof b21 b23
tof a24 b21
tof a29 b21
tof a24 a22
tof a29 a24
tof a29 b31
tof a24 b31
tof a22 a24
tof b21 a22
tof b23 a22
tof b21 b31
tof c26 a22
tof c26 a29
tof c18 a22
tof c18 a29
tof c18 b21
tof b8 a29
tof b8 c18
tof c18 a24
tof b10 b21
tof c5 b21
tof a14 b21
tof a14 b10
tof b10 b31
tof c5 a29
tof c5 c18
tof b10 b23
tof b27 b21
tof b27 b23
tof b27 a14
tof b15 b21
tof b15 b23
tof a13 b23
tof a13 b27
tof a13 a24
tof a13 a22
tof b15 a29
tof b15 c18
tof b15 c5
tof a13 c26
tof c30 b23
tof c30 c26
tof c11 c30
tof b0 b23
tof c11 a24
tof c11 a22
tof c26 a29
tof c26 c18
tof c26 c5
tof c26 b15
tof b0 a14
tof c11 a13
tof c14 a24
tof c14 a22
tof b16 c19
tof b16 b0
tof a3 c11
tof c0 b22
tof c8 c26
tof c8 b29
tof c8 c19
tof c8 c0
tof c8 c5
tof c8 a29
tof c8 c30
tof a18 b27
tof c8 b21
tof a26 c5
tof a2 c5
tof a26 b29
tof a30 c11
tof a26 c19
tof c5 c14
tof a30 a24
tof a30 a22
tof a26 c0
tof a26 c8
tof c12 c1
tof c27 b15
tof c13 a14
tof c27 a31
tof c27 c3
tof c13 b0
tof c27 b23
tof c22 b8
tof a21 c11
tof a19 b19
tof c22 a13
tof c6 c23
tof c29 a24
tof c29 a22
tof b5 b21
tof b5 a26
tof b5 a29
tof a25 b29
tof a25 c16
tof a8 a2
tof a15 a26
tof b2 b27
tof b2 b10
tof a20 b5
tof b26 c0
tof b9 c12
tof b25 c18
tof b26 c8
tof b25 b31
tof b25 a14
tof b26 c5
tof b18 a24
tof c15 c29
tof b18 a13
tof c15 a21
tof a10 a25
tof b12 b23
tof c28 a31
tof b28 b22
tof a11 b3
tof b28 b7
tof a11 a28
tof c31 b29
tof b13 a3
tof b13 c3
tof b13 b16
tof c31 c19
tof c31 c14
tof a1 c30
T b27
T* b17
T* c1
T a23
T c0
T* b25
T a7
T a20
T a2
T* c10
T* c21
T* a17
T* b10
T b30
T a15
T a11
T* a1
T* c22
T c7
T b26
T a28
T c5
T* c4
T* b11
T* a8
T* b8
T c15
T* b18
T* c26
T a14
T* b15
T c17
T* b12
T* a12
T* b1
T* b2
T* b31
T b5
T b9
T b28
T* b13
T* a29
T a26
T b7
T a21
T* a18
T* c8
T* c18
T* b21
T* a10
T* c27
T a13
T* a30
T c30
T b23
T* b3
T* c13
T* c12
T a6
T c29
T c28
T c31
T* a22
T a24
T* a19
T c14
T* c19
T* b0
T* b16
T* b19
T a25
T c3
T* b22
T* c6
T* a3
T* c11
T* a31
T* c23
T* c16
P a4
T a4
T b29
tof a23 c1
tof b25 b17
tof a2 c1
tof a1 a15
tof c22 b27
tof b26 b27
tof a8 c1
tof b8 a15
tof c15 a15
tof b18 b27
tof c26 a15
tof b2 b27
tof b31 b27
tof a29 a15
tof a26 a15
tof a21 b27
tof a18 b27
tof c8 b27
tof c27 b17
tof a30 a15
tof c30 a15
tof b23 b17
tof c13 b17
tof c29 c1
tof c31 c1
tof a22 a15
tof a24 b27
tof c14 c1
tof b0 b17
tof b16 b17
tof a3 b17
tof c11 b17
tof a16 c18
tof a15 b27
tof c18 b27
tof c18 b17
tof a15 c1
tof a20 a7
tof a2 a23
tof c22 a23
tof b26 a23
tof a8 a23
tof c15 a23
tof b18 a23
tof c26 a7
tof b15 a23
tof b12 c0
tof a12 c0
tof b31 c0
tof b5 a7
tof b28 c0
tof c8 c0
tof c18 b8
tof b21 a7
tof a13 a23
tof a30 a23
tof b23 c0
tof c13 c0
tof c29 a23
tof c31 a23
tof a22 a23
tof c14 a23
tof b0 c0
tof b16 c0
tof a3 a7
tof c11 a7
tof a16 b8
tof b25 a23
tof b8 a23
tof c27 a23
tof b25 c0
tof b13 c0
tof c27 c0
tof a7 b25
tof b8 b25
tof b13 b25
tof c21 a20
tof a15 a2
tof a8 a2
tof c26 a20
tof b15 b11
tof b12 b11
tof b5 a20
tof c8 a7
tof c18 b8
tof b21 a20
tof c27 a20
tof b23 a2
tof c13 a2
tof c29 a2
tof c31 a2
tof c14 a2
tof b0 a20
tof b16 a20
tof a16 b8
tof b8 a7
tof b13 a7
tof a2 a20
tof b8 a20
tof b13 a20
tof b11 a2
tof b8 a2
tof b10 c10
tof a15 c10
tof c22 c10
tof b26 c10
tof c15 c10
tof b18 a17
tof b15 b11
tof b12 b11
tof b2 b11
tof b31 b11
tof c8 c10
tof c18 b11
tof c27 c21
tof a13 b11
tof a30 b11
tof b23 c21
tof b3 c10
tof c13 b11
tof a24 b8
tof a16 b11
tof b11 c10
tof b8 c10
tof b11 c21
tof b8 c21
tof a22 c21
tof b8 a17
tof a22 a17
tof a1 b30
tof b26 a15
tof c15 a15
tof c26 b30
tof b2 b10
tof b31 b10
tof c8 a15
tof c18 b10
tof c27 b18
tof a13 c22
tof a30 a15
tof c30 b30
tof b23 b18
tof c13 b18
tof a22 b8
tof a24 a15
tof b0 b18
tof b16 b18
tof a3 b18
tof c11 b18
tof a16 a15
tof c25 b18
tof a15 b10
tof c22 b10
tof c22 b30
tof b8 b30
tof c22 a15
tof b8 a15
tof b18 a15
tof b26 c22
tof b8 a1
tof c15 c22
tof b18 c22
tof c26 a1
tof b12 b15
tof b5 c22
tof b13 c22
tof c8 c22
tof b21 c22
tof c27 c22
tof a13 a1
tof a30 c22
tof c30 a1
tof b3 a11
tof c29 c22
tof c31 c22
tof a22 c22
tof c14 c22
tof b0 c13
tof b16 c13
tof a3 c22
tof c11 c22
tof c25 c22
tof b15 a11
tof b23 a11
tof b15 a1
tof b23 a1
tof c13 a1
tof b23 c22
tof c13 c22
tof c15 c7
tof b18 c7
tof b15 c7
tof b5 c5
tof b13 c5
tof b21 c5
tof a13 c7
tof a30 c7
tof b3 a28
tof c13 b26
tof c29 c7
tof c28 a28
tof c31 c5
tof a22 c7
tof a19 c7
tof c19 c5
tof b16 c5
tof a3 c8
tof c11 c8
tof a16 b23
tof c25 c8
tof b26 c7
tof c5 c7
tof b23 c7
tof c8 b26
tof c27 b26
tof b23 b26
tof c5 a28
tof c8 a28
tof b23 a28
tof b8 c4
tof c15 c4
tof b18 c4
tof b2 b11
tof b31 b11
tof b13 b5
tof a26 a29
tof c8 c5
tof c18 b11
tof b21 b5
tof c27 b11
tof a13 b5
tof a30 b5
tof b23 a29
tof c29 c4
tof c28 c4
tof c31 c5
tof a24 c4
tof a19 b11
tof c14 b5
tof c19 c13
tof b0 c13
tof a3 c13
tof c11 c13
tof a16 a29
tof c25 c13
tof b15 c5
tof a29 c5
tof c13 c5
tof b5 c4
tof a29 c4
tof c13 c4
tof b15 b11
tof b5 b11
tof c13 b11
tof b18 a8
tof a14 c15
tof b12 b15
tof b1 c15
tof b5 c15
tof c18 c15
tof b21 a8
tof a30 a13
tof b23 a8
tof c13 a8
tof c29 c15
tof c28 c15
tof a22 b15
tof a24 a8
tof c19 b15
tof b0 b15
tof a16 b15
tof b15 a8
tof c15 b8
tof b15 b8
tof b15 c15
tof a13 c15
tof c8 a14
tof c18 a14
tof b21 c26
tof a13 b5
tof b23 b5
tof c13 b5
tof a24 b18
tof a19 b5
tof c19 b15
tof b16 b15
tof a3 b5
tof c11 b5
tof a16 b12
tof c25 b18
tof b15 b18
tof b12 b18
tof b5 b18
tof b15 c26
tof b5 c26
tof a22 c26
tof b15 a14
tof b12 a14
tof a22 a14
tof b1 c17
tof b31 a12
tof b5 c17
tof b13 a12
tof a21 c17
tof a18 c17
tof c18 a12
tof a10 b15
tof c27 b12
tof b23 a12
tof c29 c17
tof c28 c17
tof a19 c17
tof c19 c13
tof b0 a12
tof b16 c17
tof c11 a3
tof a16 a3
tof c25 a3
tof b12 b15
tof a22 b15
tof a3 b15
tof b12 c17
tof c13 c17
tof a22 c17
tof a12 b12
tof c13 b12
tof a3 b12
tof b5 b1
tof a29 a12
tof a26 a12
tof a18 a21
tof c8 b1
tof c27 b2
tof c13 b23
tof c29 b1
tof c28 b1
tof a22 b1
tof a19 b1
tof b0 b21
tof b16 b1
tof a3 a21
tof a16 a21
tof c25 a12
tof b1 a12
tof b21 a12
tof b23 a12
tof a21 b1
tof b23 b1
tof b21 b2
tof b23 b2
tof b13 b9
tof a26 a29
tof a18 b9
tof c8 b9
tof c18 b31
tof a10 a29
tof c27 a29
tof a13 b9
tof b23 b5
tof c13 a29
tof a22 b9
tof a24 b9
tof a19 a29
tof c14 a29
tof c19 a29
tof b0 b21
tof b16 b5
tof a3 a29
tof a16 b31
tof c25 b5
tof b21 b31
tof a29 b5
tof b21 b5
tof a29 b9
tof b21 b9
tof c8 a21
tof b21 a29
tof c27 b13
tof b23 b13
tof a19 a29
tof c14 a29
tof c19 a29
tof b0 b13
tof b16 a29
tof a3 b13
tof a16 b28
tof b13 b28
tof a21 b28
tof c25 b28
tof c18 b13
tof c25 b13
tof a21 a29
tof c25 a29
tof c8 a26
tof c18 b7
tof b21 a18
tof a30 b7
tof c30 b7
tof b23 c27
tof a19 b7
tof c14 b7
tof c19 b7
tof b0 a18
tof c6 a26
tof a3 a21
tof c11 a26
tof a16 a21
tof c25 a10
tof a21 a26
tof a18 a26
tof c27 a26
tof a21 b7
tof a18 b7
tof a10 b7
tof a10 a21
tof c27 a21
tof b16 a21
tof b21 a18
tof c27 a10
tof a13 a18
tof c13 c18
tof c12 a18
tof a6 a18
tof a24 a18
tof c14 c18
tof c19 c18
tof b0 a22
tof c6 b16
tof a3 a22
tof c11 b16
tof a16 a18
tof c25 c18
tof c8 a18
tof a22 a18
tof a10 c8
tof b16 c8
tof a10 c18
tof a22 c18
tof a30 c27
tof c30 b21
tof a19 b21
tof c14 b21
tof c19 b21
tof b0 c27
tof c6 b16
tof a3 b21
tof c11 b16
tof c25 b16
tof a10 b21
tof c27 b21
tof b16 a10
tof b23 a13
tof a22 a13
tof a24 a13
tof a19 a13
tof c14 a13
tof c19 a13
tof b16 a13
tof c3 a13
tof a3 a30
tof c11 c6
tof a16 c6
tof c25 a30
tof c6 a13
tof c30 a30
tof c6 a30
tof c3 b3
tof a3 b3
tof a16 c13
tof c28 b23
tof b0 b23
tof c13 b3
tof c28 b3
tof b0 b3
tof b0 c13
tof c28 c29
tof c14 a22
tof b0 a22
tof b16 c19
tof c6 c19
tof a3 a6
tof a22 c12
tof c19 c12
tof c19 a6
tof a22 c29
tof c19 c29
tof a24 a22
tof c14 c28
tof b0 c28
tof a25 c28
tof c3 c28
tof c6 c19
tof a3 a22
tof c25 c31
tof c19 c28
tof b16 c28
tof c19 c31
tof c19 a22
tof b16 a22
tof c19 c14
tof b16 a19
tof b19 a19
tof a16 a24
tof c25 a19
tof c6 a24
tof a3 a24
tof c14 a19
tof c6 a19
tof a3 a19
tof c6 c14
tof b19 c19
tof c6 c19
tof a3 c19
tof a16 c19
tof c25 c19
tof c25 b16
tof c6 a25
tof a3 a25
tof a25 b19
tof a16 a25
tof c25 a16
tof a16 c6
tof a16 a3
tof a16 a31
tof c25 c23
tof a16 c16
tof a16 b29
tof c23 b29
tof c23 c16
tof a3 c25
tof c6 c25
tof c25 b29
tof c25 c16
tof c6 c23
tof a3 c11
tof a3 a16
tof a25 c23
tof b19 c23
tof c23 b29
tof c23 c16
tof c3 a31
tof b19 c6
tof b16 c6
tof b16 a25
tof b0 c6
tof b0 a25
tof c19 c6
tof c19 b29
tof c19 c16
tof b16 c23
tof a25 a31
tof b16 c11
tof b16 b22
tof a25 a3
tof b0 b19
tof c14 b19
tof a19 b19
tof c14 b29
tof c14 c16
tof a19 c23
tof c14 a3
tof c14 c6
tof c14 a25
tof a19 c19
tof a19 b0
tof a22 a24
tof c28 a22
tof c28 b29
tof c28 c16
tof a24 c11
tof c28 a3
tof c28 c6
tof c28 a25
tof c28 b19
tof a24 c19
tof a24 a19
tof c29 a31
tof a6 c19
tof b23 b3
tof b23 b29
tof b23 c16
tof c13 c11
tof b23 a3
tof b23 c6
tof b23 a25
tof b23 b19
tof c13 a19
tof c13 a24
tof b23 a22
tof c13 c14
tof b23 c28
tof b23 c29
tof c30 b16
tof a30 c30
tof a30 c23
tof a30 b19
tof c30 b0
tof c30 c29
tof c30 a6
tof c30 c12
tof c30 c25
tof c27 c30
tof c27 a30
tof a10 c30
tof a10 a30
tof b21 a30
tof a10 a4
tof a10 c16
tof b21 c23
tof c30 c11
tof a10 c3
tof c30 a13
tof b21 b19
tof c27 b0
tof a10 b16
tof c30 a24
tof a10 a22
tof c30 c14
tof a10 c31
tof c27 c29
tof a10 a6
tof c27 c12
tof c27 c25
tof c18 c11
tof c18 a19
tof c18 a24
tof a18 a6
tof a18 c19
tof c8 a30
tof a21 b21
tof b7 b21
tof a21 a13
tof a21 b0
tof a21 a19
tof b21 a24
tof a21 c14
tof a21 c29
tof a21 a6
tof a21 c12
tof a21 c19
tof a21 c25
tof a21 c18
tof a21 c27
tof a21 a16
tof a21 a10
tof a29 a19
tof a29 c27
tof a29 b21
tof b13 a19
tof b13 b21
tof b13 b7
tof b28 c27
tof b28 b21
tof b28 b7
tof b13 c11
tof a29 a13
tof a29 b0
tof b21 a24
tof b28 c14
tof b28 c29
tof c27 a6
tof a29 c12
tof a29 c19
tof b28 c25
tof a29 c18
tof a29 a16
tof a29 a10
tof a29 a21
tof b9 b7
tof b5 b9
tof b5 a31
tof b5 a13
tof b5 b0
tof b5 a19
tof b5 c14
tof b5 c28
tof b5 c29
tof b9 a6
tof b5 c12
tof b9 c19
tof b5 c18
tof b5 a30
tof b9 c27
tof b7 b21
tof b5 a16
tof b5 a10
tof b9 a18
tof b1 b28
tof a12 b28
tof a12 a31
tof b28 a24
tof b28 c14
tof a12 c28
tof a12 c29
tof b28 a6
tof b28 c19
tof b28 a30
tof b28 c27
tof b28 a21
tof b1 b9
tof a12 a26
tof b1 a29
tof b12 c14
tof b12 c25
tof c17 c14
tof b15 c14
tof b15 c25
tof b15 b29
tof b15 a4
tof b15 c23
tof b12 a31
tof b12 c11
tof b15 c3
tof b15 b19
tof b15 b0
tof b12 a19
tof b15 b16
tof b15 a24
tof b12 c28
tof b15 c31
tof c25 c29
tof b12 a6
tof b15 c12
tof c25 c19
tof c25 a30
tof b12 c27
tof b15 a16
tof c25 a21
tof b15 c8
tof b15 c30
tof c25 b7
tof b12 a26
tof b15 a29
tof c25 b28
tof b12 a12
tof b15 b5
tof a14 b9
tof c26 a30
tof b18 b9
tof b18 c26
tof a14 a31
tof b18 a13
tof a30 b16
tof a14 c14
tof a14 c28
tof a14 c29
tof b18 a6
tof a14 c17
tof c26 b21
tof c26 b7
tof a14 a26
tof a14 a29
tof a14 a12
tof b18 b15
tof a14 b1
tof c15 b9
tof b8 c15
tof b8 a31
tof c15 a13
tof c15 b16
tof b8 c14
tof b8 c28
tof b8 c29
tof c15 a6
tof b8 c17
tof c15 a30
tof b9 c27
tof b9 b21
tof b9 b7
tof b8 a26
tof b8 a29
tof b8 a12
tof b8 b1
tof a8 c26
tof c5 c4
tof b11 b15
tof b26 a28
tof c7 a28
tof c7 a31
tof c7 b0
tof c7 a19
tof c7 c14
tof c7 c28
tof c7 c29
tof c7 c12
tof c7 c19
tof c7 c18
tof c7 c27
tof c7 a16
tof c7 a10
tof c7 a18
tof c7 b8
tof c7 b11
tof c7 b18
tof c7 c5
tof c22 c7
tof a1 c22
tof c7 a31
tof c7 b0
tof c7 a19
tof c7 c14
tof c7 c28
tof c7 c29
tof c7 c12
tof c7 c19
tof c7 c18
tof c7 c27
tof c7 a16
tof c7 a10
tof c7 a18
tof c7 b8
tof c7 b11
tof c7 b18
tof c7 a28
tof c7 c5
tof a15 c23
tof a15 a3
tof a15 c6
tof a15 a25
tof a15 a13
tof a15 b3
tof a15 b0
tof a15 a19
tof a15 c28
tof a15 b23
tof a15 c12
tof a15 c19
tof a15 c13
tof a15 c17
tof a15 c27
tof a15 b21
tof a15 a16
tof a15 a21
tof a15 c30
tof a15 b7
tof a15 a29
tof a15 b28
tof a15 a12
tof a15 b13
tof a15 b15
tof a15 b2
tof a15 b1
tof a15 a14
tof a15 b11
tof a15 b18
tof a15 c7
tof a15 b26
tof a2 c21
tof a20 c21
tof a2 c10
tof a2 b15
tof c0 a24
tof a23 a24
tof c0 c11
tof a24 b22
tof c0 a19
tof a23 a6
tof a23 c19
tof a23 c17
tof a23 a21
tof c0 b7
tof a23 b9
tof a23 a29
tof a23 b28
tof c0 c25
tof c0 b12
tof b25 a7
tof b27 b17
tof c1 b22
tof c1 a24
tof c1 a6
tof c1 c19
tof c1 c17
tof c1 a21
tof c1 b9
tof c1 a29
tof c1 b28
tof c1 a23
tof b27 a15
tof b27 c26
T b27
T c26
T a15
T b25
T* a7
T b17
T c21
T a20
T c1
T a2
T* b15
T* b10
T a17
T c10
T c22
T* a11
T* a1
T* b30
T* b26
T c7
T c5
T a28
T* b18
T b11
T* c15
T c4
T a14
T b8
T a8
T a23
T* b1
T* b31
T b2
T c0
T b13
T* b12
T* c25
T* b5
T* a12
T* b28
T a29
T a26
T b9
T b7
T* c30
T c8
T* a21
T a18
T* a10
T a16
T b21
T c27
T* a30
T c18
T c17
T* c13
T* c19
T c12
T a6
T* b23
T* c29
T* c31
T c28
T* c14
T a22
T a24
T* b16
T* a19
T b0
T* b3
T* b19
T* a13
T* a25
T* c6
T* a3
T* c3
T b22
T* c11
T* a31
T* c23
T* c16
T* a4
T* b29
tof a1 c22
tof b18 c26
tof c15 c26
tof a8 c26
tof b1 c26
tof b13 c26
tof b12 c26
tof b5 c22
tof b28 b27
tof a29 c26
tof a21 b27
tof b21 c26
tof c27 c26
tof a30 c26
tof c18 c26
tof c13 c26
tof c19 c26
tof a6 c26
tof a24 c26
tof b16 c26
tof b19 c26
tof a25 c22
tof c6 c26
tof a3 c22
tof c26 b27
tof a10 b27
tof a16 b27
tof a15 c26
tof c22 c26
tof a10 c26
tof a10 a15
tof a16 a15
tof c22 b25
tof b28 b25
tof c30 a7
tof c8 a7
tof a21 b25
tof a16 b17
tof a7 b25
tof a10 b25
tof b17 a7
tof a10 a7
tof a10 b17
tof a2 c1
tof b18 c1
tof b11 c1
tof b1 a23
tof b31 c21
tof b2 c21
tof b13 c21
tof b12 c21
tof a12 a23
tof a29 a23
tof c30 a23
tof c8 a23
tof a21 a23
tof a16 a10
tof b21 a23
tof c18 c21
tof c13 c21
tof c19 c21
tof a6 c21
tof a24 a23
tof b16 a23
tof a19 c1
tof b0 c1
tof a13 c1
tof a25 c21
tof c6 c21
tof a3 c1
tof a20 c21
tof a23 c21
tof a10 a20
tof a23 c1
tof a17 b10
tof c22 a2
tof b18 a2
tof b11 a2
tof a23 a2
tof b28 a2
tof a21 a2
tof a10 a2
tof a16 a2
tof a19 a2
tof b0 a2
tof a25 a2
tof a3 a2
tof b15 a2
tof b13 a23
tof b12 a23
tof b28 c22
tof a21 c22
tof a10 c22
tof a16 c22
tof b3 c10
tof a13 a17
tof c10 a17
tof c22 c10
tof a25 c10
tof a23 c22
tof b26 b30
tof c29 b30
tof c31 b30
tof a25 a23
tof a3 a1
tof c3 b30
tof a1 a11
tof a23 a11
tof a23 a1
tof a23 b30
tof b18 c7
tof c15 c7
tof a23 b26
tof b13 c5
tof b12 c5
tof a12 c5
tof a29 c5
tof a26 c5
tof b9 c5
tof c30 c5
tof a21 c5
tof a10 c7
tof c18 c7
tof c13 c7
tof c19 a28
tof c12 c5
tof a6 c7
tof b23 a28
tof c31 b26
tof a19 c5
tof b0 c5
tof a13 c5
tof a25 c5
tof c6 c7
tof a3 c5
tof c3 c29
tof c29 b26
tof c5 c7
tof a28 c5
tof c29 c5
tof a10 c15
tof c18 c15
tof c13 c15
tof c19 a23
tof a6 c15
tof c29 a28
tof c6 c15
tof a23 a28
tof c15 b18
tof a23 b18
tof c15 b11
tof a23 b11
tof b8 a14
tof c30 a14
tof c8 a14
tof c19 c4
tof c29 b23
tof c3 a14
tof c4 c15
tof b23 c15
tof a23 c4
tof b23 c4
tof b23 a14
tof b1 a8
tof b13 a8
tof b12 a8
tof a21 a8
tof b21 a8
tof c19 a23
tof b23 b8
tof a24 a8
tof b16 a8
tof a25 a8
tof a23 b8
tof b19 a8
tof b19 a23
tof b12 b13
tof a21 b1
tof b21 b1
tof a24 b1
tof b16 b1
tof b19 b13
tof a25 b13
tof b13 b1
tof c0 b31
tof b13 b31
tof c0 b2
tof b13 b2
tof c25 b12
tof b0 a19
tof b19 a19
tof a3 a19
tof b13 c0
tof a19 b13
tof a19 b12
tof b28 b5
tof a29 a12
tof a12 b5
tof b9 a26
tof c30 a26
tof a21 a26
tof c27 a29
tof a30 a29
tof c19 a26
tof c12 a26
tof b19 a26
tof a13 a26
tof a29 b28
tof a21 c30
tof c19 b9
tof c12 b9
tof a24 b7
tof b16 b7
tof a19 b7
tof b19 b9
tof a13 b9
tof b7 b9
tof a24 b21
tof b16 b21
tof a19 b21
tof a21 c8
tof b21 a21
tof b21 a18
tof c13 c18
tof c19 c18
tof a6 c18
tof b19 c18
tof c6 c18
tof a16 a10
tof b21 a10
tof b21 a16
tof c18 a16
tof c17 c27
tof c13 c27
tof c28 c27
tof c14 c27
tof a31 c27
tof a30 c27
tof c18 c27
tof c12 c19
tof c14 c17
tof c13 c17
tof c6 a6
tof a6 c12
tof b19 c12
tof b19 a6
tof b19 b23
tof b19 c29
tof a31 c28
tof a19 a24
tof a31 a22
tof a24 a22
tof b19 b0
tof a3 b0
tof b22 a3
tof b19 b3
tof a3 b19
tof a3 a13
tof a3 a25
tof a3 c6
tof c3 a3
tof a4 b22
tof a4 b29
tof b22 b29
tof b22 a4
tof c6 c16
tof a3 c3
tof b19 a13
tof b19 c16
tof b19 b29
tof b19 a25
tof b19 a4
tof b19 c6
tof b19 a3
tof b19 b22
tof b19 c3
tof a19 c11
tof a24 b16
tof c29 c31
tof c17 c14
tof c19 c12
tof c17 c28
tof c18 c28
tof c27 c28
tof c18 c14
tof c27 a22
tof c27 a31
tof c18 c13
tof c18 c17
tof a10 a16
tof a16 c14
tof a16 a22
tof a16 a31
tof a16 c12
tof a16 c13
tof a16 a6
tof a16 c17
tof a16 c27
tof a16 c18
tof a21 a18
tof a21 b21
tof a21 a10
tof b9 b7
tof c30 c8
tof b28 a29
tof b28 a22
tof b28 a31
tof b28 c28
tof b28 a30
tof b28 c27
tof a12 b16
tof a12 c14
tof a12 a31
tof a12 a29
tof a12 b21
tof a12 c17
tof a12 a24
tof a12 b19
tof a12 c27
tof a12 a26
tof a12 b9
tof a12 a10
tof a12 c30
tof b13 b12
tof b13 b16
tof b13 a22
tof b12 c25
tof b13 a24
tof b13 b0
tof b13 c11
tof b13 a19
tof b13 b9
tof b13 a21
tof b31 b2
tof b31 c0
tof a23 b16
tof a23 b3
tof a23 a22
tof a23 a4
tof a23 b1
tof a23 c0
tof a23 c25
tof a23 b7
tof a23 c29
tof a23 a24
tof a23 b0
tof a23 c3
tof a23 b19
tof a23 c11
tof a23 c23
tof a23 c16
tof a23 b22
tof a23 b29
tof a23 c6
tof a23 b23
tof a23 a26
tof a23 a19
tof a23 b12
tof a23 a21
tof a23 a16
tof a23 c31
tof a23 a3
tof a23 a25
tof a23 a13
tof c15 c4
tof a14 b8
tof b18 b11
tof b18 a30
tof b18 b28
tof c5 a28
tof a17 c10
tof c22 b3
tof c22 a1
tof c22 b26
tof c22 b8
tof c22 c0
tof c22 b7
tof c22 a6
tof c22 c29
tof c22 c3
tof c22 b19
tof c22 c23
tof c22 c16
tof c22 b22
tof c22 b29
tof c22 c6
tof c22 b23
tof c22 a11
tof c22 c5
tof c22 c15
tof c22 b31
tof c22 b9
tof c22 c31
tof c22 b13
tof c22 a3
tof c22 a25
tof c22 a13
tof c22 a23
tof c22 c12
tof c22 a4
tof c22 b30
tof c22 a8
tof c22 a26
tof a2 b15
tof b10 c10
tof b10 a17
tof c21 a20
tof a7 b17
tof c26 a15
P* a20
Z c10
P b26
P* b1
Z c25
P b7
P* a6
Z c17
P b0
P* c27
Z c16
P b29
H b29
tof b7 a4
tof c25 b16
tof a1 c6
tof a17 b23
tof a7 b3
tof a20 b3
tof a1 a19
tof a1 b23
tof b28 a2
tof c13 c14
tof a30 c18
tof b1 a2
tof a25 a22
tof c15 a18
tof b21 a22
tof c4 c28
tof b15 a18
tof a31 c22
tof a25 c8
tof c31 c19
tof a6 c22
tof c0 c8
tof c4 c19
tof a3 b5
tof b13 b2
tof a10 a26
tof a28 b5
tof b26 a26
tof a1 b2
tof a23 b11
tof c0 a8
tof b8 b11
tof c4 c7
tof b26 b30
tof a1 b10
tof c10 c1
tof b18 b30
tof b18 b10
tof b17 b25
tof b17 b27
tof c31 a31
tof c29 a31
tof c4 a31
tof b13 c30
tof a10 c12
tof a16 a23
tof b21 c12
tof c25 c30
tof b8 a23
tof b26 c12
tof a1 c30
tof a15 a23
tof c17 a13
tof a6 b18
tof a30 a13
tof b17 a25
tof c13 a12
tof a29 b13
tof c25 b13
tof a28 a3
tof a1 b13
tof b13 a3
tof c29 a16
tof b7 a16
tof a29 c31
tof b1 a10
tof c4 c31
tof b26 a10
tof b17 a10
tof b17 c31
tof c13 b28
tof a30 a21
tof b7 b9
tof a1 b28
tof a1 a21
tof a29 b12
tof c25 b12
tof b8 a14
tof a17 a11
tof b21 c15
tof a28 c5
tof b26 a11
tof a1 a11
tof b15 c15
tof a1 a17
tof c25 a17
tof a20 c21
tof c25 a7
tof a20 a7
tof a15 c26
tof b21 c16
tof a29 b22
tof c25 c16
tof b1 c16
tof a1 c23
tof b17 c16
tof b1 b21
tof a1 c11
tof b17 b21
tof b21 c27
tof b21 b19
tof a29 b0
tof c25 b0
tof a1 c3
tof a1 b0
tof a1 a24
tof a29 c17
tof b8 c29
tof c4 c17
tof b26 a6
tof a1 c29
tof b17 c17
tof a15 c29
tof b7 c17
tof b7 c29
tof a29 c13
tof c0 c13
tof b1 b21
tof a1 a30
tof b17 c13
tof b17 b21
tof c0 a29
tof b1 b7
tof c4 a29
tof a1 c25
tof a20 a29
tof b17 a29
tof c4 b8
tof a1 c0
tof a20 b8
tof b1 c0
tof b17 b1
tof a1 b26
tof a20 c4
tof b17 c10
tof c10 c4
tof c10 a28
tof b17 a1
tof b15 c10
tof b17 c10
tof a15 b15
tof a15 a20
tof a15 b17
tof b15 a15
tof b15 a20
tof c10 a15
tof c10 b15
tof a1 a15
tof a1 c10
tof c4 a28
tof c4 a15
tof c4 b15
tof c4 c10
tof b8 c10
tof b1 b8
tof c0 a15
tof b8 b17
tof b8 b15
tof b1 b26
tof c25 b17
tof c25 b15
tof c25 c4
tof a29 a15
tof a29 b17
tof a29 c4
tof b7 a15
tof b7 b17
tof b7 b15
tof a29 a28
tof a29 b8
tof a29 a20
tof b21 c0
tof a30 c0
tof c13 a28
tof c13 b17
tof b21 c10
tof c13 b8
tof c13 a20
tof c17 a15
tof c29 b17
tof c29 b15
tof a24 c29
tof a24 a30
tof a24 c25
tof a24 a1
tof a24 b26
tof a17 c25
tof a7 b17
tof a7 b15
tof c15 b21
tof c15 c10
tof b9 b7
tof a10 b8
tof a10 b1
tof a10 c16
tof a10 c27
tof a10 b19
tof a10 b26
tof a16 c29
tof c31 c17
tof c31 c13
tof a10 b7
tof c31 a29
tof a10 c0
tof b13 a28
tof a3 a28
tof a12 b8
tof a28 a20
tof b13 b22
tof b13 b0
tof a28 c13
tof a12 b17
tof b13 c4
tof b18 a6
tof a25 a1
tof a25 c0
tof a25 a10
tof a25 c31
tof c30 b22
tof c12 c16
tof c12 c27
tof c12 b19
tof a23 c29
tof c12 c0
tof c30 a3
tof c30 b13
tof a8 c4
tof a8 a29
tof b11 a23
tof c7 a20
tof a26 c12
tof b5 a3
tof b2 c30
tof a26 b7
tof a26 a10
tof a26 b8
tof c19 a31
tof c8 c0
tof c19 c31
tof c19 c13
tof c28 a15
tof a18 c15
tof c18 a30
tof c18 a13
tof a19 c3
tof a19 a24
tof b23 c25
tof b3 b17
tof b3 b15
tof b23 a17
tof b3 a7
tof a19 c10
tof b23 a11
tof b16 c16
tof c6 c23
tof c6 c11
tof a4 c17
tof a4 a16
tof c6 b28
tof c6 a21
tof b16 b12
tof b16 b31
T a23
T* c26
T* b27
T* b25
T* a25
T b7
T a29
T* c21
T b3
T a20
T* b21
T a18
T* c1
T c4
T b10
T b2
T b23
T* a19
T* c6
T* a6
T b30
T* b1
T a26
T a11
T b5
T* c5
T* c7
T c19
T* c28
T b11
T b8
T* a14
T c10
T a10
T a2
T* a8
T c8
T c13
T c30
T* a7
T* a17
T* b16
T b31
T* b13
T a3
T c31
T b12
T* b9
T* a4
T c12
T a22
T* c15
T c0
T* c18
T a21
T* c14
T* a12
T* a28
T b28
T c22
T* b18
T a31
T* b15
T b17
T a16
T* a15
T a13
T c17
T* c29
T* a30
T* c25
T* a1
T* a24
T* b26
T* b0
T* c3
T* b19
T* c11
T* c27
T* c23
T c16
T* b22
tof a25 c26
tof a18 a23
tof b1 a20
tof a26 a20
tof c7 a20
tof c19 a23
tof c28 b21
tof b11 a23
tof b8 b21
tof c10 a20
tof c8 a23
tof c13 a23
tof a17 a7
tof c12 a23
tof c15 a23
tof c0 a23
tof c18 a23
tof a12 b21
tof a28 b21
tof b15 a23
tof a16 a23
tof a15 b21
tof a13 a20
tof c17 a23
tof c29 a23
tof a30 b21
tof c25 a7
tof a1 a7
tof a24 a20
tof a27 a7
tof a20 a23
tof a7 a23
tof a20 c26
tof b21 c26
tof a7 c26
tof a20 b27
tof b21 b27
tof a18 b7
tof a6 b25
tof c19 b7
tof c28 b25
tof c10 a26
tof c8 b7
tof c13 b7
tof a7 a20
tof b9 b7
tof a4 b7
tof c12 b7
tof c15 b7
tof c0 b7
tof c18 b7
tof a12 b25
tof a28 b25
tof b15 a25
tof b17 a25
tof a15 b25
tof c17 b7
tof a30 b25
tof a1 b8
tof a24 a26
tof b26 b25
tof b4 a20
tof b7 b25
tof a26 b25
tof b8 b25
tof b7 a25
tof a20 a25
tof b8 a25
tof a20 b7
tof b1 b7
tof a26 b7
tof a20 b3
tof b21 b3
tof c4 c21
tof b2 c21
tof a19 c21
tof a26 b1
tof c19 a29
tof c28 a29
tof b11 b1
tof b8 b1
tof c10 b1
tof a8 b1
tof c13 b1
tof c30 c21
tof a17 c21
tof b13 c21
tof c31 c21
tof a12 b1
tof a28 b1
tof a15 a29
tof a13 a29
tof c29 b1
tof a30 a29
tof a24 a29
tof b26 b1
tof a27 b3
tof b4 a29
tof b1 a29
tof a7 a29
tof b1 c21
tof a7 b3
tof b1 a20
tof b11 a20
tof b8 c28
tof a8 a20
tof c8 c19
tof c13 c10
tof a7 c19
tof b9 c19
tof a4 c19
tof c12 c19
tof c15 c19
tof c0 c19
tof c18 c19
tof a12 a20
tof a28 a20
tof b15 a18
tof b17 a18
tof a15 c28
tof c17 c19
tof c29 a20
tof a30 c28
tof a1 c28
tof a24 c19
tof b26 a20
tof b4 c19
tof a18 a20
tof c19 a20
tof c19 b21
tof c10 b21
tof c19 a18
tof c28 a18
tof c10 a18
tof b2 c4
tof b1 b10
tof a26 c1
tof c19 a6
tof c28 a6
tof b11 b10
tof b8 c1
tof c10 c1
tof a8 a19
tof c13 c4
tof c30 c4
tof a17 c4
tof a3 c4
tof c31 c4
tof b9 c4
tof a4 c4
tof a12 a19
tof a28 a19
tof b15 c4
tof b17 c4
tof a13 c4
tof c17 c4
tof c29 b10
tof a30 c4
tof c25 c4
tof a24 a19
tof b26 a6
tof a6 c1
tof a1 c1
tof a19 c4
tof a1 c4
tof a19 b10
tof a6 b10
tof a1 b10
tof b1 b23
tof a26 b2
tof c28 c19
tof b11 b23
tof c10 b2
tof c8 a19
tof c13 b8
tof c30 b2
tof a17 b2
tof a3 b2
tof c31 b2
tof c12 a19
tof c15 a19
tof c0 a19
tof c18 a19
tof a28 a12
tof c29 b23
tof a30 a19
tof c25 a8
tof a1 b23
tof a24 a19
tof b26 a8
tof a19 b2
tof a8 b2
tof a12 b2
tof c19 b23
tof a8 b23
tof a12 b23
tof c19 a19
tof b8 a19
tof a12 a19
tof b5 b30
tof c28 c6
tof b11 b1
tof b8 c19
tof c10 a26
tof a10 c6
tof a2 c6
tof a8 a6
tof c8 c6
tof c13 c19
tof a7 c6
tof b13 b30
tof a3 b30
tof c12 c6
tof c15 c6
tof c0 c6
tof c18 c6
tof a12 a26
tof a28 c6
tof b28 c6
tof b18 a26
tof b15 b1
tof b17 b1
tof a13 c6
tof c29 c19
tof a30 c19
tof c25 a6
tof b26 a1
tof b4 c6
tof b1 c6
tof c19 c6
tof a1 c6
tof b30 a6
tof b1 a6
tof a1 a6
tof a26 b30
tof c19 b30
tof a1 b30
tof b5 a11
tof c19 a26
tof a8 b1
tof a7 c10
tof b13 a11
tof a3 a11
tof a12 c10
tof b18 a26
tof b15 a26
tof b17 a26
tof a30 a26
tof a1 a26
tof a24 a26
tof b4 c10
tof c10 b1
tof c29 b1
tof c25 b1
tof b8 a26
tof c10 a26
tof c29 a26
tof b8 a11
tof c10 a11
tof c25 a11
tof c19 c5
tof c10 b5
tof c13 b8
tof c30 c8
tof a7 c5
tof a17 c8
tof b13 c5
tof a3 b5
tof c31 c8
tof b9 c7
tof a4 c7
tof c12 c8
tof c15 c8
tof c0 c8
tof c18 c8
tof b15 c8
tof b17 c8
tof a13 c5
tof c17 c7
tof c29 c5
tof c25 c8
tof a1 c28
tof a24 b5
tof b26 c28
tof a27 c7
tof b4 c5
tof b8 b5
tof c8 b5
tof a30 b5
tof c28 c5
tof b8 c5
tof c8 c5
tof c28 c7
tof b8 c7
tof a30 c7
tof a10 b11
tof c8 b11
tof c30 b11
tof a17 b11
tof b13 b11
tof b9 c28
tof a4 c28
tof c15 c12
tof c0 c12
tof c18 c12
tof a12 c28
tof b15 c28
tof b17 c28
tof c17 c28
tof c29 c12
tof c25 b11
tof a1 c19
tof a24 b11
tof b26 c19
tof a27 c28
tof b8 c19
tof c10 c19
tof c12 c19
tof b8 c28
tof c12 c28
tof c10 b11
tof c12 b11
tof c8 a14
tof c13 c10
tof c30 a14
tof b16 a14
tof a3 b13
tof c31 a14
tof b15 b13
tof b17 b13
tof c29 c12
tof a30 c10
tof a1 a7
tof a24 c10
tof b26 a7
tof b4 a7
tof c10 b8
tof a7 b8
tof c12 b8
tof c10 a14
tof a7 a14
tof b13 c10
tof c12 c10
tof c13 a2
tof c30 c8
tof a7 c8
tof a17 c8
tof c31 c8
tof b9 a10
tof a4 a10
tof a12 c12
tof b17 b15
tof a13 a10
tof c17 a10
tof c29 a10
tof a30 a8
tof c25 c8
tof b26 c12
tof a27 a10
tof c12 a10
tof b15 a10
tof a1 a10
tof c8 a2
tof c12 a2
tof a1 a2
tof c8 a8
tof b15 a8
tof a1 a8
tof a17 c30
tof a3 b13
tof b9 c8
tof a4 c8
tof c12 b13
tof c0 c30
tof c18 c30
tof a12 c31
tof b15 c13
tof a13 c8
tof c17 c8
tof c29 c8
tof a30 c31
tof c25 c30
tof a1 c13
tof b26 a7
tof a27 c8
tof c13 c8
tof a7 c8
tof b13 c13
tof c31 c13
tof a7 c30
tof b13 c30
tof b31 b16
tof b13 a7
tof a3 a7
tof b15 c12
tof a30 a17
tof c25 a17
tof a1 a7
tof b26 b16
tof c12 a7
tof c12 b16
tof b9 a3
tof c12 c31
tof a22 c31
tof c15 c31
tof a12 c31
tof a13 a4
tof c17 a4
tof c29 a4
tof a30 b31
tof a1 a3
tof a27 a4
tof b13 b31
tof a3 b31
tof a3 b13
tof a4 b13
tof c31 a3
tof a4 b9
tof a22 c31
tof a28 b12
tof b28 b12
tof b15 a12
tof a30 b9
tof a1 c31
tof c15 c31
tof a12 b12
tof c15 b9
tof a12 b9
tof c0 a4
tof c18 a4
tof a30 c12
tof c25 a12
tof a1 a4
tof b26 a4
tof a12 c12
tof b26 c12
tof a12 a22
tof a1 a22
tof b26 a22
tof a12 c0
tof a28 c14
tof a30 c18
tof a1 c15
tof b26 c15
tof c25 c15
tof c18 c0
tof c14 c18
tof c25 c18
tof a28 a21
tof b28 a21
tof b26 a1
tof a12 a21
tof c25 a21
tof a12 c14
tof c25 c14
tof a1 a12
tof b15 a31
tof b17 a31
tof c25 a28
tof a1 a28
tof a27 a31
tof b4 a31
tof b28 a28
tof a31 b28
tof a31 c22
tof b17 b18
tof c25 b15
tof a24 a31
tof a27 a30
tof b4 a30
tof a30 b18
tof a1 b18
tof a1 a31
tof a30 b15
tof c17 a16
tof c29 a16
tof c25 a15
tof a1 b17
tof b4 a30
tof a15 b17
tof a13 b17
tof a13 a16
tof a30 a16
tof a13 a15
tof a30 a15
tof a27 a15
tof a30 a13
tof c25 c29
tof a1 c17
tof a27 a13
tof b4 c17
tof c17 a13
tof c29 a13
tof c29 c17
tof a24 c17
tof c25 a30
tof a27 a30
tof a1 c25
tof a24 a1
tof a27 a1
tof b26 a24
tof a27 b26
tof b4 b19
tof a27 c3
tof a27 b19
tof a27 c23
tof b4 c27
tof b4 c23
tof a27 b22
tof a27 b4
tof b19 c27
tof a24 b26
tof a1 b26
tof c25 a1
tof a1 b22
tof c25 c16
tof c25 c23
tof a1 c27
tof c25 b19
tof a1 c3
tof c25 a27
tof c29 a1
tof c17 a1
tof a13 a1
tof a13 c17
tof a13 c23
tof a13 c27
tof a13 b19
tof c17 a24
tof c29 a27
tof b17 a15
tof a15 a30
tof a15 c25
tof a15 c29
tof a31 b22
tof a31 c27
tof b15 a30
tof b15 c25
tof b15 c29
tof b15 a15
tof b15 b17
tof b15 a13
tof b15 b4
tof a28 b28
tof a28 c23
tof a28 c11
tof b28 a31
tof a12 c16
tof a12 c23
tof a12 b19
tof a12 b26
tof a12 a24
tof a12 c17
tof a12 b17
tof a12 a13
tof a12 b4
tof a12 b15
tof a12 c22
tof a12 b28
tof a12 a28
tof c0 b19
tof c15 b19
tof c0 b22
tof c0 c16
tof b19 c27
tof c0 c11
tof c0 b0
tof c15 a24
tof c15 c17
tof c15 a30
tof c15 b18
tof c15 c29
tof c15 a15
tof c15 b15
tof c15 a27
tof c15 c22
tof a22 b22
tof a22 c16
tof c12 b22
tof c12 b0
tof c12 a22
tof a4 b22
tof a4 b0
tof c12 c27
tof a4 c11
tof c12 b19
tof c12 b26
tof c12 a30
tof c12 b18
tof c12 c29
tof c12 b17
tof c12 a13
tof c12 b4
tof c12 b15
tof c12 a27
tof c12 a31
tof c12 c18
tof c12 c15
tof c12 c0
tof c12 a12
tof c31 b12
tof b9 b22
tof b9 c16
tof b9 c27
tof b12 c11
tof b9 b19
tof b9 a24
tof b9 c17
tof b9 a30
tof b9 b18
tof b9 c29
tof b9 a15
tof b9 b15
tof b9 a27
tof b9 c22
tof b9 a28
tof b9 c0
tof c31 a12
tof a3 b22
tof a3 c16
tof b13 a3
tof b13 b12
tof b31 c16
tof b31 b12
tof b13 b0
tof b13 a1
tof b13 a24
tof b13 c17
tof b13 a16
tof b13 a30
tof b13 b18
tof b13 c29
tof b13 a15
tof b13 b15
tof b13 b28
tof b13 c0
tof b13 b9
tof b13 a4
tof b13 a12
tof b13 c14
tof b13 a27
tof b16 b12
tof b16 b31
tof a17 b31
tof a17 b16
tof a17 b13
tof a7 b31
tof a7 b13
tof a7 b22
tof b16 c16
tof b13 c23
tof b12 c11
tof b31 b0
tof a7 a1
tof a7 a24
tof a7 c17
tof a7 a16
tof a7 a30
tof a7 b18
tof a7 c29
tof a7 a15
tof b13 a13
tof a7 b4
tof a7 b15
tof b31 a3
tof a7 b28
tof a17 a21
tof b13 a28
tof a7 c0
tof a7 b9
tof a7 a12
tof a7 c14
tof a7 a27
tof c13 a3
tof c8 a3
tof c8 c16
tof c8 c23
tof c8 c27
tof c8 c11
tof c8 c22
tof c8 b28
tof c8 a28
tof c8 a12
tof c8 b13
tof c13 c12
tof a2 b13
tof a10 b13
tof b13 c23
tof b13 c11
tof b13 a13
tof b13 a21
tof b13 a28
tof b13 b12
tof a8 c12
tof a10 c14
tof a14 a3
tof b8 a14
tof b8 b19
tof b8 b0
tof b8 a13
tof b8 b4
tof b8 c22
tof b8 a21
tof b8 c0
tof b8 b9
tof b8 b12
tof b8 a4
tof b8 a12
tof b8 c30
tof b8 b13
tof b8 c12
tof b8 c14
tof b8 a2
tof b8 a10
tof b8 c8
tof c10 a7
tof b8 a8
tof c28 c8
tof c19 b11
tof c19 c28
tof c8 c23
tof c8 c11
tof c19 b19
tof c19 b0
tof c19 b26
tof c19 a1
tof c19 a24
tof c19 c17
tof c19 a16
tof c19 a15
tof c19 b17
tof c28 a13
tof c19 b4
tof c19 a3
tof c19 c22
tof c19 a31
tof c28 a21
tof c19 c18
tof c8 a28
tof c19 c15
tof c19 a22
tof c8 b12
tof c19 a4
tof c19 c31
tof c19 c30
tof c19 b16
tof c28 b13
tof c19 a14
tof c19 c12
tof c19 c13
tof c19 c14
tof c8 a2
tof c28 a10
tof c19 a7
tof c19 c10
tof c19 a8
tof c19 b8
tof c28 a27
tof b5 c5
tof c7 c28
tof a26 a11
tof a26 c19
tof b1 a26
tof b1 c23
tof b1 c11
tof a26 b0
tof b1 b26
tof b1 a1
tof b1 a24
tof b1 c17
tof b1 a16
tof b1 a15
tof b1 b17
tof c19 b4
tof b1 a31
tof b1 c18
tof b1 a28
tof b1 c15
tof b1 a22
tof b1 c0
tof b1 b9
tof b1 a12
tof b1 c31
tof b1 b16
tof b1 a14
tof b1 c13
tof b1 a7
tof b1 c5
tof b1 a27
tof b1 c8
tof b1 c28
tof b1 b5
tof b30 a13
tof a6 a13
tof a6 b30
tof c6 a13
tof c6 c23
tof c6 c11
tof b30 b18
tof b30 b4
tof b30 b15
tof c6 a21
tof c6 a28
tof c6 b12
tof c6 b13
tof c6 a2
tof c6 a10
tof a19 a13
tof b2 a13
tof a19 c23
tof a19 c11
tof b2 a1
tof b2 a16
tof b2 b4
tof a19 a21
tof a19 a28
tof b2 b9
tof a19 b12
tof b2 a12
tof a19 b13
tof a19 a2
tof a19 a10
tof a19 c6
tof b2 a27
tof b2 c8
tof b2 b5
tof b2 c19
tof a19 a8
tof c1 b10
tof c1 b26
tof c1 a24
tof c1 c17
tof c1 b17
tof c1 a31
tof c1 a21
tof c1 c18
tof c1 a28
tof c1 a22
tof c1 b12
tof c1 c31
tof c1 b16
tof c1 b13
tof c1 c13
tof c1 c14
tof c1 a10
tof c1 a7
tof c1 c10
tof c1 c5
tof c1 c28
tof c1 a11
tof c1 a6
tof c1 a26
tof c1 b23
tof c1 b8
tof a18 b2
tof a18 c1
tof a18 a3
tof b21 b2
tof b21 c1
tof a20 c1
tof a20 b21
tof a20 a18
tof a20 c23
tof b2 b0
tof c1 b26
tof b2 a1
tof c1 a24
tof c1 c17
tof b2 a16
tof a20 a15
tof c1 b17
tof b2 a13
tof a20 b4
tof a20 c22
tof c1 a31
tof c1 a21
tof c1 c18
tof c1 a28
tof a20 c15
tof c1 a22
tof b2 b9
tof c1 b12
tof a20 b31
tof b2 a12
tof c1 c31
tof a20 c30
tof c1 b16
tof c1 b13
tof a20 a14
tof a20 c12
tof c1 c13
tof c1 c14
tof c1 a10
tof a20 b11
tof c1 a7
tof c1 c10
tof c1 c5
tof b2 a27
tof b2 c8
tof c1 c28
tof c1 a11
tof b2 b5
tof c1 a6
tof b2 c19
tof c1 a26
tof c1 b10
tof c1 b23
tof a20 a19
tof c1 b8
tof a20 c4
tof a20 c7
tof a29 c21
tof b7 b1
tof a25 b7
tof a25 c23
tof a25 b26
tof a25 c25
tof a25 a15
tof a25 b4
tof a25 c22
tof a25 a31
tof a25 a21
tof a25 c18
tof a25 a28
tof a25 c15
tof a25 a22
tof a25 b12
tof a25 b31
tof a25 c31
tof a25 c30
tof a25 b16
tof a25 b13
tof a25 a14
tof a25 c12
tof a25 c13
tof a25 c14
tof a25 a10
tof a25 b11
tof a25 a7
tof a25 c10
tof a25 c6
tof a25 c8
tof a25 c28
tof a25 a11
tof a25 a6
tof a25 a26
tof a25 b10
tof a25 b23
tof a25 a19
tof a25 c21
tof a25 c1
tof a25 b21
tof a25 a18
tof a25 b3
tof a25 a29
tof b1 a20
tof b1 b8
tof a23 c26
tof a23 a25
tof a23 c7
T a23
T c7
T a25
T* b1
T b27
T* b8
T* a20
T* b7
T c26
T a29
T* b3
T b25
T* a18
T a3
T* b21
T c1
T c4
T c21
T a19
T* a8
T* b23
T* b10
T b2
T* a26
T* c19
T a6
T b5
T a11
T c28
T* c8
T* a27
T* c6
T c5
T c10
T* a7
T b11
T* a10
T* a2
T* c14
T* c13
T c12
T a14
T* a17
T b13
T* b16
T c30
T* c31
T* a12
T a4
T* b31
T b12
T* b9
T* c0
T* a22
T* c15
T a28
T* c18
T* a21
T b28
T* a31
T* c22
T b30
T b15
T b4
T a13
T* b17
T* a15
T* c29
T* b18
T* c25
T* a30
T* a16
T* c17
T* a24
T* a1
P b26
T b26
T* b0
T* c3
T* b19
T* c11
T c27
T* c23
T* c16
T* b22
tof b21 a18
tof a19 b7
tof a8 b7
tof b2 b7
tof a26 b7
tof a6 a18
tof b5 a18
tof c28 c7
tof c8 b8
tof a27 a23
tof c10 b7
tof a7 b7
tof a10 c6
tof a2 c6
tof c13 b7
tof c12 b7
tof a17 c6
tof b13 c6
tof c30 a18
tof c31 b8
tof a12 c6
tof b9 a23
tof c0 a18
tof c15 c7
tof b30 a18
tof b15 a25
tof b4 b7
tof a15 a18
tof c29 a23
tof c25 a23
tof a30 a18
tof a24 a18
tof a1 a18
tof c7 a23
tof b8 a23
tof c6 a23
tof b8 c7
tof b7 c7
tof a18 c7
tof b8 a25
tof b7 a25
tof c6 a25
tof a29 b27
tof a3 b27
tof b21 b1
tof a19 b7
tof a8 b7
tof b2 b7
tof a26 b7
tof c8 b7
tof a27 b27
tof c6 b1
tof b11 b27
tof a2 b27
tof c13 a20
tof c12 b7
tof a14 b27
tof a17 b1
tof b13 b27
tof c31 b7
tof a12 b27
tof a4 b7
tof b31 b27
tof b12 a20
tof b9 b8
tof c0 b7
tof a22 b27
tof c15 b8
tof a28 a20
tof b4 b7
tof b17 b16
tof a15 b1
tof b18 b27
tof c25 b16
tof a30 b16
tof a24 b27
tof a1 b27
tof b27 b1
tof b8 b1
tof b7 b1
tof b7 b27
tof b16 b27
tof a20 b8
tof b7 b8
tof a29 a20
tof a18 a20
tof a3 a20
tof b21 a20
tof a19 b3
tof a8 b3
tof b2 c26
tof a26 c26
tof a6 a20
tof b5 a20
tof c8 c26
tof a27 a20
tof b11 a20
tof a2 c6
tof c13 c6
tof c12 b3
tof a14 a20
tof a17 b7
tof b13 c6
tof b16 b3
tof c30 a20
tof c31 c26
tof a12 a20
tof a4 b7
tof b31 a20
tof b9 c26
tof a22 a20
tof c15 c26
tof c18 c14
tof a21 c14
tof b30 a20
tof b15 c26
tof b4 c26
tof a15 a20
tof c25 b3
tof a30 a20
tof b7 a20
tof c26 a20
tof c6 a20
tof c6 b7
tof c14 b7
tof c0 b7
tof b3 c26
tof c6 c26
tof c14 c26
tof a18 b25
tof a3 a29
tof c4 b3
tof a19 c1
tof b2 b21
tof a26 b21
tof a6 b25
tof b5 b25
tof c28 b21
tof c8 b21
tof a27 b21
tof c6 b21
tof b11 a29
tof a2 b3
tof c13 c1
tof c12 c1
tof a14 a29
tof b13 b3
tof b16 c1
tof c30 b25
tof c31 b21
tof a4 a29
tof b31 a29
tof b9 b21
tof c0 a17
tof a22 a29
tof c15 b21
tof b30 b25
tof a15 b21
tof c29 a17
tof b18 b3
tof c25 c1
tof a30 b25
tof a24 a17
tof a1 a17
tof b21 a29
tof a17 a29
tof b25 b3
tof b21 b3
tof a17 b3
tof c1 b25
tof a17 b25
tof c1 b21
tof c21 b21
tof a8 b21
tof b2 b21
tof a26 b21
tof a6 a18
tof b5 a18
tof c28 b21
tof c6 a3
tof a2 c8
tof c12 a19
tof a17 b21
tof b13 c8
tof c30 a18
tof c31 c8
tof a12 b21
tof b9 b21
tof c0 a19
tof a22 a3
tof c15 c8
tof b30 a18
tof b18 b21
tof a30 b21
tof c17 b21
tof a24 a19
tof a1 a18
tof a19 a18
tof c13 a18
tof c8 a3
tof c13 a3
tof a19 b21
tof c8 b21
tof a19 c21
tof a8 c1
tof b2 c4
tof c8 a26
tof a27 a26
tof a2 a26
tof c13 c21
tof b13 a26
tof b16 c1
tof a12 a26
tof b9 a26
tof c0 c21
tof b4 b15
tof c29 b15
tof b18 c1
tof c25 c1
tof a30 c21
tof c17 c21
tof a24 c21
tof a1 c21
tof c4 c1
tof a26 c1
tof b15 c1
tof a26 c4
tof a26 c21
tof b15 c21
tof b5 a26
tof c8 a26
tof c6 b23
tof a2 a27
tof c12 a26
tof b13 a27
tof c30 a26
tof a12 b23
tof c0 a8
tof b30 a26
tof b15 a19
tof b4 a26
tof c29 b23
tof c17 b23
tof a24 a19
tof a1 b23
tof a8 a19
tof c13 a19
tof a30 a19
tof a26 a8
tof a27 a8
tof c13 a8
tof a27 b23
tof c13 b23
tof a30 b23
tof b5 a26
tof a27 a26
tof c10 b2
tof a2 a6
tof c13 c8
tof c12 b10
tof b13 a6
tof c30 a26
tof a12 b10
tof b30 a26
tof b4 a26
tof a26 b10
tof c8 b10
tof c6 b10
tof c8 b2
tof c6 b2
tof c15 b2
tof a6 a26
tof c6 a26
tof c15 a26
tof c8 c28
tof a27 c19
tof c6 c28
tof c10 c28
tof c13 c19
tof a14 c28
tof a17 c28
tof b13 a2
tof b16 c28
tof c30 b5
tof a12 b5
tof a4 c28
tof b31 c28
tof c0 b5
tof b28 c19
tof a31 c19
tof c22 b5
tof b30 b5
tof c29 a2
tof c25 c28
tof a30 b5
tof c17 c19
tof a24 c28
tof a1 c12
tof a6 c19
tof c12 c19
tof c15 c19
tof b5 a6
tof a2 a6
tof c15 a6
tof c28 b5
tof c12 b5
tof c15 b5
tof a27 a11
tof c13 a11
tof a17 c8
tof c0 c8
tof a22 b16
tof c15 c28
tof a15 c28
tof c29 c8
tof c25 b16
tof c17 a11
tof a24 c8
tof a1 c6
tof c6 a11
tof a12 a11
tof c8 c28
tof a12 c28
tof c6 c8
tof b16 c8
tof a2 a27
tof c13 c6
tof a17 c6
tof a12 c6
tof a4 c10
tof b31 c5
tof c0 c5
tof c15 c10
tof c22 c6
tof b4 c6
tof a15 c6
tof c29 a27
tof c17 c5
tof a1 a27
tof c5 a27
tof c10 a27
tof c10 c6
tof a24 c6
tof c10 c5
tof a24 c5
tof c13 b11
tof a17 a7
tof b16 b11
tof b31 c10
tof a22 a14
tof c15 a14
tof c29 b11
tof a24 a7
tof a1 a7
tof a7 c10
tof a2 c10
tof a2 a7
tof a14 a7
tof c0 a7
tof a2 b11
tof c0 b11
tof a14 a10
tof a12 b16
tof a4 b16
tof b31 a10
tof b12 b16
tof c0 a10
tof a22 b16
tof c15 b16
tof a21 c18
tof a31 a10
tof b17 b16
tof a15 b16
tof c29 c14
tof a30 c18
tof a16 c18
tof a24 a17
tof a1 a17
tof a2 a10
tof a17 a10
tof c14 a2
tof c18 a2
tof a17 c14
tof b16 c14
tof b16 c13
tof a12 c13
tof a4 c13
tof b31 a14
tof b12 c13
tof c0 c13
tof a22 c13
tof c15 c12
tof a31 a17
tof b17 c13
tof a15 c13
tof c29 a17
tof a30 c12
tof a16 c12
tof a24 c17
tof a1 c12
tof c12 c13
tof a14 c12
tof a17 c12
tof c17 a14
tof a4 a17
tof c0 b16
tof a22 b12
tof c15 a12
tof c18 a12
tof a21 b13
tof a31 a17
tof b4 b13
tof a13 b13
tof b17 b12
tof c17 b13
tof b16 a17
tof b12 a17
tof c29 a17
tof b16 b13
tof a15 b13
tof c29 b13
tof a12 b16
tof b12 b16
tof a15 b16
tof c0 a12
tof c18 a12
tof a31 c31
tof c29 a15
tof a12 c30
tof a15 c30
tof a15 c31
tof c17 c31
tof a4 a12
tof a15 a12
tof c17 a12
tof c0 a4
tof a22 b12
tof b17 b12
tof c17 b12
tof b9 a4
tof a21 a4
tof b9 b31
tof a21 b31
tof a21 b12
tof c18 a22
tof a21 c0
tof a31 c0
tof a30 a22
tof a16 a22
tof c17 a22
tof a28 b9
tof a28 c0
tof a28 a22
tof a21 a28
tof b4 c15
tof b17 c15
tof a15 c15
tof c29 c15
tof a30 c18
tof a16 c18
tof a28 c15
tof b28 a28
tof c17 a28
tof c17 c18
tof b4 b28
tof a16 c29
tof c17 c29
tof a31 a21
tof c29 b28
tof c29 a31
tof b17 c22
tof a15 c22
tof c29 b4
tof c17 b4
tof b4 c22
tof a16 c22
tof a30 b30
tof a16 b30
tof b4 b15
tof a30 b15
tof a15 b17
tof c17 b4
tof a30 b4
tof a16 b4
tof a30 a13
tof a16 a13
tof a16 b17
tof a16 c29
tof c17 c29
tof c25 c29
tof c25 b18
tof a24 c17
tof a1 c17
tof a16 c25
tof c17 c25
tof a16 a30
tof c17 a30
tof a1 a24
tof c16 b22
tof c3 b22
tof c3 c27
tof c3 c11
tof a24 c16
tof a24 a1
tof c17 a1
tof c17 a24
tof c16 b22
tof c17 c23
tof a24 c11
tof a24 c3
tof a24 b0
tof a30 c11
tof c25 c11
tof a30 b22
tof c25 c16
tof c25 c17
tof b18 c11
tof c29 b18
tof c29 c17
tof a15 c17
tof c29 c16
tof c29 c25
tof b17 a30
tof b4 a13
tof b4 a30
tof b4 b22
tof a30 c23
tof b4 c27
tof b4 c11
tof b17 b0
tof a30 a1
tof a30 c25
tof b17 a24
tof c22 a30
tof c22 a24
tof a31 c25
tof a21 c25
tof a31 c16
tof a31 c23
tof b28 c3
tof b28 b0
tof a21 c22
tof a31 c29
tof a31 a15
tof a31 b18
tof c18 c3
tof a28 c3
tof a28 b0
tof c15 b0
tof c18 b22
tof c15 a1
tof c18 c25
tof a28 b28
tof c18 c22
tof c18 b17
tof c18 a21
tof a22 a21
tof b9 a21
tof b9 c0
tof a21 c23
tof b9 c3
tof b9 a1
tof a22 c25
tof a22 c15
tof b9 b28
tof a22 c22
tof a22 b17
tof b9 a28
tof b12 b9
tof b31 c3
tof a4 b31
tof a4 b9
tof c3 b22
tof a4 c23
tof b31 c27
tof b31 b0
tof a4 a1
tof b9 c25
tof b12 c15
tof a4 b28
tof b9 c22
tof b9 b17
tof a4 a21
tof b9 a22
tof a4 c0
tof a4 a28
tof a12 c23
tof a12 b0
tof a12 a1
tof a12 c15
tof a12 b28
tof a12 c22
tof a12 b17
tof a12 a21
tof a12 c0
tof a12 a28
tof a12 b9
tof a12 c18
tof a12 b12
tof b16 c22
tof b16 b9
tof b16 c18
tof b13 c25
tof b13 c22
tof b13 b9
tof a17 c25
tof a17 b9
tof a17 c18
tof c25 c23
tof c18 c27
tof c18 c11
tof c25 b19
tof b16 c3
tof a17 b0
tof c18 b26
tof a17 a1
tof c25 a13
tof a17 b28
tof b16 b17
tof a17 a21
tof a17 c31
tof a17 c0
tof a17 a28
tof a17 b12
tof b16 a4
tof a17 a12
tof a17 c30
tof c13 c12
tof a14 b22
tof c12 c16
tof a14 c23
tof a14 c27
tof c13 c3
tof a14 a1
tof a14 a13
tof a14 b4
tof a14 c15
tof a14 b28
tof a14 c29
tof a14 a15
tof a14 b18
tof a14 a21
tof a14 a31
tof a14 c31
tof a14 c0
tof a14 b9
tof a14 b13
tof a14 a12
tof c13 a22
tof c14 b17
tof a2 b17
tof b17 c23
tof a2 c27
tof a2 c11
tof a2 c3
tof a2 b26
tof b17 a16
tof b17 a13
tof b17 b15
tof b17 b30
tof c14 c15
tof b17 b28
tof a2 c22
tof b17 c29
tof b17 a15
tof b17 b18
tof b17 a31
tof a2 b9
tof c14 b13
tof a2 a4
tof a2 b16
tof b17 a24
tof a2 a22
tof b17 c13
tof c10 a7
tof a7 b22
tof a7 c16
tof a7 c23
tof a7 c27
tof a7 a1
tof a7 a13
tof a7 b4
tof a7 c15
tof a7 b28
tof a7 a10
tof a7 c29
tof a7 a15
tof a7 b18
tof a7 a21
tof a7 a31
tof a7 c12
tof a7 c31
tof a7 c0
tof a7 b9
tof a7 b13
tof a7 a12
tof a7 a14
tof c5 a24
tof c6 a24
tof a27 a24
tof a27 c5
tof a24 c16
tof c6 c23
tof a24 c27
tof a24 b0
tof a24 a1
tof c6 a13
tof c5 a30
tof c6 c15
tof c6 b28
tof c5 c22
tof a24 a10
tof a24 c29
tof a24 a15
tof a24 b18
tof a24 a21
tof a24 a31
tof a24 c12
tof a24 c31
tof a24 c0
tof c6 b13
tof a24 a14
tof c8 c13
tof c28 c13
tof c8 c16
tof c8 c23
tof c13 c3
tof c8 b0
tof c8 a1
tof c28 a16
tof c28 b15
tof c28 b30
tof c8 c15
tof c8 b28
tof c28 c29
tof c28 a15
tof c28 b18
tof c8 a21
tof c28 a31
tof c8 c12
tof c8 c31
tof c8 c0
tof c8 a28
tof c8 b12
tof c8 a4
tof c8 a12
tof c8 b16
tof c28 c6
tof c28 c14
tof c8 a17
tof c8 c30
tof c13 a22
tof c8 a7
tof c8 b11
tof c28 c17
tof b5 c3
tof b5 c6
tof a6 c3
tof a6 b28
tof a6 b5
tof c19 c3
tof c19 b28
tof a6 c23
tof c3 c27
tof c3 c11
tof b28 b19
tof b5 a16
tof a6 a13
tof a6 a30
tof b28 b31
tof b5 b15
tof c6 b4
tof b5 b30
tof a6 c15
tof a6 c22
tof b5 c29
tof b5 a15
tof b5 b18
tof b5 a31
tof c19 a28
tof c6 b9
tof a6 b13
tof c19 a12
tof b5 c14
tof b5 c13
tof b5 c17
tof b5 c28
tof a6 a14
tof a26 a12
tof b2 a12
tof b2 b22
tof a26 c23
tof a12 c11
tof a12 c3
tof b2 b0
tof a26 a16
tof a26 a13
tof a26 a30
tof a12 b31
tof a26 b15
tof a26 b30
tof a26 c15
tof a26 c22
tof a26 c29
tof a26 a15
tof a26 b18
tof a26 a31
tof a26 a28
tof a26 b13
tof a26 c19
tof b2 a24
tof b2 c6
tof a26 c14
tof a26 c13
tof b2 a7
tof a26 c17
tof a26 c28
tof a26 b5
tof a26 a14
tof a26 a6
tof a8 b31
tof a19 a8
tof a8 c23
tof a19 c27
tof a19 c11
tof a8 b19
tof b31 c3
tof a8 a13
tof a8 a30
tof a19 b15
tof a8 b4
tof a8 c15
tof a8 b28
tof a8 c22
tof a8 b9
tof a8 b13
tof a8 c6
tof a19 a17
tof a8 a14
tof a8 a6
tof a8 a26
tof c21 a19
tof c4 a19
tof c4 c21
tof c1 c21
tof a19 b22
tof c1 c23
tof a19 c27
tof c1 c11
tof c1 b19
tof c21 c3
tof a19 b0
tof c1 a13
tof c1 a30
tof c21 b31
tof a19 b15
tof c21 b4
tof c1 c15
tof c1 b28
tof c1 c22
tof c1 b9
tof c1 b13
tof a19 a12
tof a19 a24
tof c1 c6
tof c1 a17
tof a19 a7
tof c21 b5
tof a19 b2
tof c1 a14
tof c1 a6
tof c1 a26
tof c1 a8
tof c21 b23
tof b21 a7
tof b21 b5
tof b21 c21
tof a3 a7
tof a3 b5
tof a18 a7
tof a18 b21
tof b21 b22
tof a7 c16
tof b21 c27
tof a18 c11
tof b21 c3
tof b21 b0
tof c21 a16
tof b21 b31
tof b21 b15
tof b21 b4
tof c21 b30
tof c21 c29
tof c21 a15
tof c21 b18
tof c21 a31
tof a7 c12
tof c21 b9
tof b21 a12
tof b21 a24
tof c21 c14
tof a18 a17
tof b5 a22
tof c21 c13
tof c21 c17
tof c21 c28
tof b21 b2
tof c21 a8
tof b21 b23
tof b21 a19
tof c21 b10
tof b3 b25
tof a29 b25
tof a29 b3
tof b25 b22
tof b25 c16
tof b25 c23
tof b25 c27
tof b25 c11
tof b25 b19
tof b25 b0
tof b25 a13
tof b25 a30
tof b25 b15
tof b25 c15
tof b25 b28
tof b25 c22
tof b25 c12
tof b25 b9
tof b25 b13
tof b25 a12
tof b25 a24
tof b25 c6
tof b25 a17
tof b25 a7
tof b25 b2
tof b25 a14
tof b25 a6
tof b25 a26
tof b25 a8
tof b25 a19
tof b25 b21
tof b25 c1
tof c26 c14
tof b7 c26
tof a20 c14
tof a20 c26
tof c26 b22
tof c14 c23
tof c26 c27
tof c26 b0
tof c26 b15
tof c14 b9
tof b7 b12
tof c26 a12
tof b7 b16
tof c26 a24
tof b7 a22
tof c26 b2
tof c26 a8
tof c26 a19
tof c26 b21
tof c26 b3
tof b8 c26
tof b27 c26
tof b1 c26
tof b1 b27
tof b8 b22
tof c26 c16
tof b8 c27
tof c26 c11
tof c26 b19
tof b27 c3
tof b8 b0
tof b27 a16
tof c26 a13
tof c26 a30
tof b27 b31
tof b8 b15
tof b27 b4
tof b27 b30
tof c26 c15
tof c26 b28
tof c26 c22
tof b27 c29
tof b27 a15
tof b27 b18
tof b27 a31
tof c26 c12
tof b27 b9
tof c26 b13
tof b8 b12
tof b8 a12
tof b8 b16
tof b8 a24
tof c26 c6
tof c26 c14
tof c26 a17
tof b8 a22
tof b27 c13
tof c26 a7
tof b27 c17
tof b27 c28
tof b8 b2
tof c26 a14
tof c26 a6
tof c26 a26
tof b8 a8
tof b27 b23
tof b8 a19
tof b27 b10
tof b27 c21
tof b8 b21
tof c26 c1
tof c26 b25
tof b8 b3
tof b27 c8
tof b8 a20
T c7
T* a25
T* a23
T b7
T* b8
T b1
T a29
T a20
T b27
T* c8
T* a3
T c26
T* b3
T* c4
T b25
T* a18
T* c1
T b21
T* c21
T b10
T* a19
T b23
T a8
T* a11
T* a26
T* a6
T* c5
T a14
T* b2
T b5
T a27
T* c28
T* c17
T b17
T c10
T b11
T* a7
T c13
T* c18
T a2
T a22
T* c30
T a17
T c14
T* c6
T* a24
T* b16
T* c19
T a12
T* a4
T* b12
T* b13
T b9
T* a28
T* c0
T* c31
T* c12
T* a31
T* a21
T* b18
T* a15
T* c29
T* a10
T c22
T* b28
T c15
T* b30
T* b4
T* b15
T* b31
T* a30
T* c25
T* a13
P* a16
T* a16
T* a1
T* b26
T b0
T* c3
T* b19
T* c11
T* c27
T c23
T* c16
T b22
tof b8 a25
tof a26 c7
tof c5 c7
tof b17 c17
tof c6 a25
tof b16 a25
tof b18 c17
tof a15 c17
tof c17 c7
tof b20 c7
tof c17 a25
tof b20 a25
tof c17 a23
tof a29 b1
tof a3 b7
tof c21 b1
tof a19 b1
tof b2 b1
tof b5 b1
tof c28 b7
tof c17 c8
tof b17 b7
tof c18 b7
tof a22 b7
tof c6 b8
tof b16 b8
tof c19 b7
tof a12 b7
tof b12 b7
tof b13 b7
tof c12 b1
tof a21 c8
tof c22 b7
tof b20 b8
tof c24 b8
tof c8 b7
tof c8 b1
tof a3 c8
tof c21 c8
tof a19 c8
tof a26 a29
tof a6 a29
tof c5 a29
tof a14 a29
tof b2 a29
tof b5 a29
tof c28 c8
tof c17 a20
tof b17 c8
tof c18 c8
tof a22 c8
tof a17 b27
tof c14 b27
tof b12 a29
tof b13 a29
tof c12 a29
tof a31 c8
tof b18 c8
tof a15 b27
tof b15 a29
tof c25 a29
tof b20 a20
tof c24 a20
tof c8 a29
tof c8 b27
tof c4 c26
tof a19 c21
tof c28 a3
tof c17 c26
tof b17 a3
tof c18 a3
tof a22 a3
tof c14 a17
tof c6 c26
tof a24 c26
tof b13 b12
tof a31 c21
tof b18 c8
tof a15 a17
tof c22 b12
tof c21 c8
tof b12 c8
tof c21 a3
tof a17 a3
tof a17 c26
tof b12 c26
tof c1 b25
tof a19 b25
tof c17 b3
tof c22 b25
tof b4 b25
tof c25 b25
tof a31 b3
tof b18 b3
tof c21 c4
tof a31 c4
tof c21 b25
tof a31 b25
tof b18 b25
tof c21 a18
tof a17 a18
tof c6 b21
tof a24 b21
tof b12 a18
tof c22 c1
tof b4 c1
tof c25 c1
tof b20 b21
tof c24 b21
tof c1 a18
tof c17 c1
tof a10 c1
tof c17 b21
tof c28 a8
tof b17 a8
tof c13 a8
tof a2 a8
tof c19 c17
tof a12 c17
tof c0 a8
tof c12 a8
tof a31 b10
tof b18 a19
tof c22 a8
tof c15 a8
tof c25 a8
tof a19 c21
tof c17 c21
tof a19 b10
tof b20 b10
tof a8 a19
tof c17 a19
tof b20 a19
tof a6 a11
tof c5 a11
tof a14 a11
tof c6 b23
tof a24 b23
tof c19 a8
tof a12 a8
tof c12 a8
tof b18 a8
tof c22 a8
tof b31 a8
tof c25 a8
tof b20 b23
tof c24 b23
tof a8 b23
tof c17 a8
tof a14 c5
tof c19 c17
tof a12 c17
tof c12 c17
tof c22 b13
tof c17 a26
tof b18 a26
tof c5 a6
tof c17 a6
tof b18 a6
tof b13 c5
tof b18 c5
tof c28 b5
tof c0 b5
tof b18 c17
tof a15 b2
tof c17 a14
tof c17 b2
tof c12 b2
tof c12 b5
tof b17 c28
tof c18 c28
tof a22 c28
tof b12 c28
tof a28 c17
tof c12 c17
tof c22 a27
tof b31 a27
tof c25 a27
tof b18 a27
tof b18 c28
tof a7 c10
tof a2 c10
tof a22 b17
tof b12 c18
tof c0 b11
tof a15 b17
tof c22 c18
tof c15 c10
tof b31 c10
tof a30 c18
tof c25 c18
tof c18 b17
tof a28 b17
tof c18 c10
tof a28 b11
tof a2 c18
tof a22 c13
tof a17 c13
tof c14 c13
tof a28 b12
tof c12 c13
tof b18 a7
tof b28 c13
tof c15 a7
tof a30 c18
tof c25 c22
tof c18 a7
tof b12 a7
tof c0 a7
tof b12 c13
tof c0 c13
tof c22 c13
tof b12 c18
tof a10 c18
tof c22 c18
tof a17 c30
tof c14 c30
tof b12 a22
tof a28 c6
tof c12 c30
tof b18 c6
tof a10 a22
tof c22 a22
tof b4 a2
tof b20 c6
tof c24 c6
tof a22 a2
tof c6 a2
tof a30 a22
tof c6 c30
tof a28 b12
tof c12 a17
tof b28 c14
tof a30 b12
tof c14 a17
tof b18 a17
tof c22 a17
tof c6 c14
tof b12 c14
tof b18 c14
tof b18 c6
tof c22 c6
tof b4 c6
tof b13 a24
tof b18 c19
tof a10 c12
tof b28 c19
tof c25 b16
tof c22 a24
tof b4 a24
tof c19 b16
tof c22 b16
tof b4 b16
tof c12 c19
tof c22 c19
tof b28 b18
tof b31 b12
tof a30 b12
tof b18 a12
tof c22 a12
tof b18 a4
tof c22 a4
tof c22 b12
tof b18 b9
tof a10 a28
tof b28 c22
tof a30 a28
tof c25 b9
tof a13 a28
tof c22 b13
tof c22 b9
tof a10 b18
tof c22 b18
tof b28 b18
tof b4 c12
tof a13 b18
tof b18 c0
tof a30 c0
tof b18 c31
tof a30 c31
tof a30 c12
tof a13 a10
tof b18 a31
tof a30 a31
tof a10 a21
tof a30 a21
tof a10 b18
tof b28 b18
tof a30 b18
tof b28 a10
tof b31 c22
tof a30 c22
tof b20 c22
tof a10 a15
tof a10 c29
tof c22 a10
tof b31 c22
tof a30 c15
tof a13 c15
tof b20 c22
tof b28 c22
tof b30 b28
tof b30 c15
tof b20 b4
tof b31 b30
tof c24 b30
tof b31 b4
tof b31 b15
tof c24 b15
tof c24 b31
tof a30 b31
tof c25 a30
tof a13 c25
tof b20 a1
tof c24 a13
tof c24 a1
tof c24 b20
tof b20 b19
tof b20 c11
tof b20 c27
tof c24 c23
tof b19 c27
tof c11 c23
tof c25 a13
tof a30 a13
tof a30 c25
tof b31 a13
tof b31 b22
tof b31 c16
tof b31 c11
tof c25 c3
tof b31 b0
tof c25 b26
tof b31 a1
tof b31 a16
tof b31 b20
tof b4 b19
tof b30 b19
tof b30 b15
tof b30 b22
tof b30 c16
tof b19 c27
tof b30 b0
tof b4 a1
tof b30 a16
tof b30 c24
tof b30 b31
tof b4 b20
tof c15 b0
tof b28 c15
tof b28 b22
tof b28 c16
tof b28 c27
tof b28 b19
tof b28 a16
tof b28 c24
tof b28 b31
tof b28 b30
tof b28 b15
tof a10 c23
tof a10 c11
tof a15 b0
tof a10 b30
tof a10 b4
tof b18 c11
tof a31 c11
tof b18 b22
tof b18 c16
tof c11 c23
tof a21 b26
tof b18 a1
tof b18 a16
tof b18 c22
tof b18 c25
tof b18 b20
tof b18 b4
tof b18 a15
tof b18 c29
tof c0 c31
tof c0 c23
tof c0 a16
tof c0 b30
tof c12 b4
tof c0 c15
tof c0 a15
tof c0 c29
tof c0 a31
tof a28 c0
tof b13 c0
tof c0 c23
tof b13 c27
tof b13 c11
tof a28 c3
tof b13 b0
tof a28 a16
tof b13 c24
tof a28 a21
tof b13 b31
tof c0 b30
tof a28 b4
tof b13 b15
tof b13 b28
tof c0 c15
tof c0 a15
tof c0 c29
tof c0 a31
tof c0 c31
tof a28 a10
tof a28 c25
tof b12 b22
tof b12 c23
tof b12 a13
tof a12 b4
tof a24 c23
tof a24 c27
tof a24 c11
tof a24 b0
tof c19 b4
tof c19 c12
tof c6 c12
tof c14 c12
tof a17 c12
tof a17 c14
tof c6 c23
tof c6 c27
tof c6 c11
tof c6 b0
tof c6 a24
tof c6 b16
tof c14 a30
tof a22 c25
tof a22 a28
tof a22 b18
tof c18 c3
tof c18 b0
tof c18 b26
tof c18 c15
tof c18 c19
tof c18 a2
tof c18 b18
tof b17 a2
tof b17 c13
tof b17 a22
tof b17 a21
tof c17 b17
tof c28 b17
tof c17 c27
tof c17 c11
tof c17 b26
tof c17 a16
tof c17 a24
tof c17 b30
tof c17 b4
tof c17 a15
tof c17 c29
tof c17 a31
tof c17 c31
tof c17 c0
tof c17 b16
tof c17 c19
tof c17 a30
tof b17 a2
tof c17 c6
tof c17 c14
tof c17 c30
tof b17 c13
tof c28 a28
tof c28 b18
tof b17 a22
tof b17 c10
tof c17 a7
tof c17 b11
tof c28 a21
tof c17 a10
tof c17 c18
tof b2 b5
tof c5 a14
tof a6 a14
tof a14 b20
tof a6 c12
tof a6 c19
tof a6 a30
tof a6 c14
tof a6 c30
tof a6 c13
tof a6 a17
tof a6 a10
tof a8 a11
tof a8 a10
tof a8 b12
tof a19 a10
tof b10 a19
tof c21 a10
tof c21 a19
tof a10 c12
tof a10 c19
tof a10 a30
tof a10 c14
tof a10 c30
tof a10 c13
tof a10 a17
tof a10 c17
tof c21 b23
tof a18 c12
tof a18 c14
tof c1 c18
tof c1 c28
tof a3 c26
tof c8 c26
tof c8 b22
tof c8 c16
tof c8 c23
tof c8 c27
tof c8 b0
tof c8 a1
tof c8 c22
tof c8 b9
tof c8 a24
tof c8 b30
tof c8 a14
tof c8 a15
tof c8 c29
tof c8 a31
tof c8 c31
tof c8 c5
tof c8 c0
tof c8 a4
tof c8 c19
tof c8 a12
tof c8 a2
tof c8 c6
tof c8 c13
tof c8 a17
tof c8 c25
tof c8 a28
tof c8 a22
tof c8 c10
tof c8 a7
tof c8 a21
tof c8 b17
tof c8 a27
tof c8 a19
tof c8 b25
tof c8 c18
tof c8 c1
tof a3 a18
tof b7 b8
tof b8 c23
tof b8 c27
tof b8 c11
tof b8 b0
tof b8 a24
tof b8 b30
tof b8 b16
tof b8 a30
tof b8 a2
tof b8 c6
tof b8 c14
tof b8 c30
tof b8 b23
tof b8 b21
tof b8 a20
tof b7 c8
tof b7 b4
tof c7 a25
tof c7 b8
tof c7 b10
T c7
T b10
T b8
T* b7
T a23
T* b4
T* c8
T a25
T a29
T* a20
T b1
T* b27
T* a3
T* a18
T* c4
T b3
T c26
T* c1
T c28
T* c18
T* b21
T* b25
T* c21
T a19
T* a8
T b23
T* b12
T* a6
T a26
T* a10
T c17
T a11
T* b2
T* a27
T b5
T* b17
T a21
T* b11
T* a7
T c10
T a22
T* b18
T* a28
T* c25
T* a17
T c13
T* c30
T c14
T* c6
T a2
T a30
T* a12
T c19
T* c12
T b16
T* b13
T a4
T* c0
T* c5
T* c31
T* a31
T* c29
T* a15
T* c15
T* b28
T* b15
T* a14
T b20
T* b30
T* b31
T* a24
T* c24
T* b9
T* c22
T* a13
T* a16
T a1
T* b26
T* b0
T c3
T* b19
T c11
T* c27
T* c23
T c16
T* b22
tof b7 c7
tof b4 c7
tof c18 c1
tof a19 b10
tof a8 b10
tof a6 b10
tof a10 b10
tof a22 c1
tof b18 c1
tof c14 c7
tof c6 c7
tof a12 c7
tof c12 c7
tof a14 c7
tof b20 c7
tof b30 b8
tof c24 b10
tof b10 c7
tof b31 c7
tof b8 b10
tof c1 b8
tof b31 b8
tof c1 b4
tof c14 b4
tof c6 b4
tof a12 b4
tof c12 b4
tof a14 b4
tof b20 b4
tof a23 b7
tof b4 a23
tof c8 b4
tof a20 a29
tof a6 a29
tof a26 a29
tof b15 a29
tof b30 a25
tof b31 c1
tof a25 c8
tof c1 c8
tof c1 a25
tof c1 a29
tof c1 b27
tof c14 a18
tof c6 a18
tof a31 b1
tof a14 a18
tof b20 a18
tof b31 a18
tof a18 b1
tof a18 b27
tof b3 c4
tof c1 a18
tof c6 a3
tof a30 a3
tof a14 a3
tof b20 a3
tof a18 a3
tof c6 c14
tof a12 c14
tof c12 c14
tof a31 b3
tof a14 c14
tof b20 c14
tof b31 c14
tof a24 c26
tof c26 b3
tof c1 c26
tof c14 c1
tof a19 c18
tof a8 c18
tof a6 c18
tof a10 c18
tof a22 c28
tof c25 c28
tof a12 c18
tof c19 c18
tof b31 c28
tof c24 c18
tof c18 c28
tof b21 c18
tof c14 c18
tof a8 a19
tof c14 a19
tof c24 a19
tof c21 b25
tof a7 b12
tof c10 b12
tof c0 b12
tof b12 a8
tof c24 a8
tof b12 b23
tof c24 b23
tof c14 b12
tof a26 a6
tof a10 a26
tof c17 a10
tof a27 b2
tof a15 b2
tof c24 a11
tof a11 c17
tof c14 c17
tof c14 a11
tof c14 b2
tof c0 b5
tof b31 b5
tof b17 b5
tof a21 b17
tof c0 a7
tof b31 a21
tof c14 a21
tof a7 b11
tof c14 b11
tof c10 a7
tof c14 a7
tof c14 a22
tof a12 b18
tof c19 b18
tof b31 a22
tof b18 a22
tof a28 b18
tof c14 a17
tof b13 a17
tof c25 a28
tof c6 c30
tof b13 c13
tof a14 c30
tof b20 c30
tof c14 c13
tof b9 c14
tof b20 a14
tof a30 c6
tof a14 c6
tof a30 a2
tof a14 a2
tof c12 a12
tof c12 c19
tof c16 a24
tof a4 b13
tof a24 a4
tof a16 c0
tof b9 c0
tof b9 c5
tof b9 c31
tof a24 a31
tof b0 a15
tof c11 a31
tof c16 a31
tof b9 c29
tof b9 a15
tof a14 c15
tof a1 c15
tof b9 c15
tof b9 b28
tof b9 b15
tof c27 a14
tof b9 b20
tof c27 b20
tof b9 b30
tof c23 a24
tof c16 a24
tof b9 b31
tof b9 a24
tof b9 c24
tof c27 a1
tof c27 b19
tof c23 c11
tof c23 c16
tof a24 c16
tof a24 c23
tof a24 c11
tof a14 b20
tof a14 c27
tof a14 a1
tof a14 b19
tof c15 a1
tof a15 b0
tof a31 c11
tof c0 a16
tof b13 a4
tof a4 c16
tof a12 c19
tof a12 c12
tof c12 b16
tof c6 a2
tof c6 a30
tof c14 c24
tof c14 b0
tof c14 c5
tof c14 c31
tof c14 c23
tof c14 a16
tof c14 b30
tof c14 b28
tof c14 b31
tof c14 b9
tof c14 c0
tof c14 c15
tof c14 a15
tof c14 a24
tof c14 a1
tof c14 b15
tof c14 c29
tof c14 c11
tof c14 c16
tof c14 b20
tof a28 c25
tof a17 c13
tof b18 c25
tof b18 a28
tof a7 c10
tof a7 a13
tof a7 b22
tof b17 a21
tof b17 b26
tof b2 a27
tof a10 c17
tof a26 c17
tof a6 c17
tof a6 a26
tof a26 c19
tof c17 a11
tof a26 c25
tof a26 a22
tof a26 a28
tof a26 b18
tof a8 b12
tof a8 b23
tof a8 a13
tof a8 b22
tof a8 a7
tof a19 c19
tof a19 a11
tof a19 c25
tof a19 a22
tof a19 c17
tof a19 a28
tof a19 b18
tof a19 a26
tof c18 b21
tof c28 b21
tof c28 c18
tof c28 c19
tof c28 a11
tof c28 c25
tof c28 a22
tof c28 c17
tof c28 a28
tof c28 b18
tof c28 a26
tof c28 a19
tof b3 c26
tof c1 c24
tof c1 c19
tof c1 b0
tof c1 c5
tof c1 b21
tof c1 c21
tof c1 b12
tof c1 a27
tof c1 a21
tof c1 c10
tof c1 c25
tof c1 a17
tof c1 c12
tof c1 b9
tof c1 a13
tof c1 c0
tof c1 c15
tof c1 a15
tof c1 a24
tof c1 b22
tof c1 a7
tof c1 a12
tof c1 c18
tof c1 c17
tof c1 b2
tof c1 a28
tof c1 b16
tof c1 c14
tof c1 b18
tof c1 b31
tof c1 b20
tof c1 b15
tof c1 b28
tof c1 a1
tof c1 c29
tof c1 b30
tof c1 c11
tof c1 a16
tof c1 c16
tof c1 c31
tof c1 c23
tof c1 b25
tof c1 c28
tof c1 b11
tof c4 c26
tof c4 b3
tof a3 c6
tof a3 b16
tof c8 a25
tof a29 a20
tof b7 a23
tof b4 a25
tof b4 c22
tof b4 c8
tof b10 b8
H b22
tof c17 a7
tof b3 c24
tof b21 c24
tof a27 a3
tof a27 a7
tof c8 c23
tof a20 c23
tof b12 b30
tof b12 c27
tof b18 c19
tof b4 a12
tof a30 a22
tof c10 a12
tof c10 c19
tof b20 b27
tof b16 b17
tof a21 b27
tof b21 b0
tof b21 b17
tof a30 c5
tof a11 a10
tof a18 c31
tof b15 b13
tof b18 c30
tof a30 c1
tof a11 b13
tof a25 c30
tof c16 b5
tof c25 b11
tof c10 b5
tof c26 c13
tof a16 a6
tof a19 b25
tof a27 a6
tof a11 c28
tof c21 b25
tof a19 c4
tof c11 b7
tof b21 c4
tof c26 b1
tof a20 b7
tof a25 c7
tof b18 c16
tof a30 c16
tof a25 c16
tof b15 a19
tof c21 a19
tof b8 a19
tof a30 a16
tof a30 c11
tof a30 a23
tof a30 c29
tof a30 a1
tof c21 b15
tof b8 b15
tof a30 b28
tof a30 b15
tof a30 a26
tof b18 b31
tof b4 a2
tof a30 b20
tof c10 a17
tof a17 b31
tof a17 a2
tof c12 c14
tof a30 b4
tof c10 b4
tof a25 b18
tof a18 b16
tof a20 a28
tof c25 a8
tof a21 b2
tof a27 a8
tof c17 b2
tof a27 b2
tof c12 c17
tof a27 c17
tof b12 b23
tof c21 c18
tof b21 b3
tof b3 c18
tof c12 b3
tof a18 a29
tof a20 c8
tof b8 b10
tof c8 a29
tof b12 c8
tof a30 a4
tof a30 a24
tof a30 a31
tof c10 b19
tof a27 a14
tof a25 b19
tof a30 c3
tof a30 a15
tof a30 b26
tof c12 c15
tof b12 a13
tof a18 c0
tof b12 b9
tof c12 c22
tof a18 c12
tof a18 a30
tof a25 c25
tof c10 a30
tof c10 a17
tof c26 a17
tof c10 c25
tof c26 c25
tof a11 c10
tof b21 a21
tof a18 c10
tof a18 a21
tof a18 a27
tof a18 b12
tof a25 c21
tof a20 c26
tof a18 c26
tof a25 a20
tof a25 b8
tof c26 a20
tof c21 b8
tof c10 a11
tof a27 c26
tof a17 a20
tof a17 c25
tof a30 a20
tof a30 a11
tof a17 c26
tof a30 c10
tof c12 b12
tof c12 a30
tof c12 a27
tof c8 b12
tof b3 c15
tof b3 c22
tof c6 b21
tof b16 c12
tof c6 a11
tof a28 c26
tof b16 a21
tof b16 a18
tof b18 c21
tof b18 a31
tof b18 b19
tof b4 c3
tof b18 a15
tof b18 b26
tof b4 a30
tof b18 a20
tof b18 c25
tof b18 a25
tof b31 a20
tof b31 c25
tof b15 b8
tof a16 a4
tof a16 a24
tof a19 b15
tof c16 a31
tof c16 a15
tof c16 b26
tof b25 a19
tof c13 a17
tof c30 a25
tof c30 c16
tof c31 c0
tof a10 c10
tof c31 a18
tof b17 a21
tof b0 c6
tof c19 b19
tof a12 c3
tof a12 b4
tof a12 a2
tof c19 b31
tof b30 a13
tof c27 b9
tof c23 b12
tof c23 c8
tof c23 a29
tof a3 a14
tof c24 c15
tof c24 c22
tof a3 a27
tof a7 c17
tof c24 b3
tof a3 c26
tof a3 a8
tof a7 b2
tof c24 c18
T a19
T* b10
T* c7
T* a25
T* b18
T c30
T b7
T* a28
T c23
T* c31
T* b16
T a18
T a29
T* b1
T* c13
T c4
T b17
T* b0
T* b21
T c6
T c24
T b25
T* c21
T c18
T* c27
T* b30
T* c8
T* b23
T* c28
T b13
T* a10
T a6
T a7
T* a3
T b27
T* a21
T b2
T b5
T c19
T a12
T* b11
T* c25
T a8
T* a17
T b31
T a2
T c26
T c16
T* c1
T* a16
T* b15
T* c10
T* c11
T* c5
T* a23
T* c29
T* a1
T* b28
T* b8
T* a22
T* a26
T* b20
T* b4
T* a20
T* a11
T* b12
T* b3
T* a30
T* c17
T* c14
T* a27
T* c12
T* b9
T* c22
T* a13
T* c0
T* c15
T* b26
T* a15
T* c3
T* b19
T* a31
T* a14
T* a24
T* a4
tof b18 b10
tof c30 a25
tof c31 b10
tof a18 b10
tof c6 b0
tof b25 a19
tof c21 a19
tof b15 a19
tof c11 b0
tof b8 a19
tof a11 b0
tof b12 b10
tof c12 b10
tof c20 a25
tof a25 a19
tof b0 a19
tof a25 b10
tof b0 b10
tof b0 c7
tof a18 c31
tof b0 b18
tof c21 c30
tof c19 c31
tof a12 c31
tof b31 c31
tof a2 c31
tof b8 c30
tof a20 c31
tof a30 c31
tof c12 c31
tof c20 a25
tof b18 a25
tof c31 b18
tof c11 b18
tof c11 c30
tof c31 c23
tof b16 b7
tof b21 b17
tof b27 b17
tof a21 b17
tof c19 c23
tof a12 c23
tof b31 c23
tof c26 a28
tof b15 b7
tof c11 b17
tof b20 b17
tof b4 a28
tof a20 c23
tof a11 b17
tof b12 c23
tof a30 c23
tof a27 a28
tof c12 a28
tof b17 b7
tof b17 a28
tof a2 a28
tof a2 c23
tof c19 c31
tof a12 c31
tof c25 a18
tof b31 c31
tof a2 c31
tof c11 b16
tof a20 b0
tof a30 c31
tof c12 c5
tof c20 b12
tof b0 c31
tof b12 c31
tof c5 b16
tof b12 b16
tof b0 a18
tof c5 a18
tof b12 a18
tof a17 c13
tof a2 c13
tof c11 b1
tof c5 a29
tof b4 c13
tof a20 b0
tof b12 a29
tof b3 a29
tof c12 a29
tof c20 a29
tof c13 a29
tof b0 a29
tof b0 b1
tof b15 b1
tof b0 c13
tof b15 c13
tof c21 c4
tof b27 b17
tof a21 b17
tof c19 c4
tof a12 c4
tof b31 c4
tof a2 c4
tof b15 c4
tof c11 b0
tof b20 b17
tof a20 c4
tof a11 b21
tof b12 b21
tof a30 c4
tof b0 c4
tof b21 c4
tof b0 b17
tof b21 b17
tof c12 b17
tof c5 b0
tof c12 b0
tof a12 c6
tof b4 c6
tof a20 c6
tof a11 c6
tof b12 c24
tof b3 c24
tof a30 c6
tof c12 c11
tof c11 b21
tof c5 c6
tof c11 c24
tof c5 c24
tof a3 a6
tof a21 a6
tof c19 c21
tof a12 c21
tof b31 c21
tof a2 c21
tof c16 a6
tof b15 b25
tof c11 c8
tof b8 a6
tof a20 c21
tof b12 c21
tof b3 c18
tof a30 c21
tof c17 c18
tof a27 a6
tof c12 c21
tof c20 c8
tof c21 b25
tof c8 b25
tof a16 b25
tof c18 c21
tof c8 c21
tof c8 c18
tof a6 c18
tof a16 c18
tof a21 b30
tof a2 c27
tof c11 c8
tof b4 c27
tof c8 c27
tof c5 c27
tof c12 c27
tof c8 b30
tof b12 b30
tof c12 b30
tof c5 c8
tof a22 c8
tof b12 c8
tof c25 b13
tof a16 c28
tof c10 a10
tof b8 b13
tof a22 b23
tof a20 b13
tof c17 b23
tof a10 b23
tof c12 b23
tof c5 c28
tof c12 c28
tof a10 b13
tof c5 b13
tof c12 b13
tof b5 a6
tof c16 a6
tof a16 a6
tof c11 a7
tof b12 a7
tof c17 a7
tof b8 a10
tof c5 a6
tof b8 a6
tof c5 a7
tof a12 b2
tof c25 b27
tof c11 b27
tof c5 a21
tof b20 b27
tof b4 b2
tof a20 b27
tof b12 b27
tof b3 a3
tof a30 b2
tof c17 b2
tof c12 b27
tof a27 a3
tof a21 b27
tof b2 a21
tof a27 a21
tof a12 c19
tof c25 b5
tof b31 c19
tof a2 b2
tof c11 c19
tof a20 c5
tof b12 b4
tof a30 c19
tof a27 b2
tof c12 b5
tof b4 b2
tof c5 b5
tof c5 c19
tof b4 c19
tof a2 a17
tof c11 a17
tof c5 c25
tof b20 a12
tof b12 b4
tof a30 a12
tof b4 a12
tof c12 a12
tof c25 b11
tof c12 b11
tof a17 c25
tof b4 c25
tof a2 b31
tof b15 a17
tof c11 a8
tof a22 b31
tof a27 a8
tof c5 a8
tof a20 a8
tof b12 a8
tof c5 a17
tof b4 a17
tof a20 a17
tof c5 b31
tof b4 b31
tof b12 b31
tof a26 a2
tof b4 a2
tof a20 c5
tof b12 c26
tof a27 c26
tof c12 c16
tof c11 a2
tof c5 a2
tof c11 c26
tof c5 c26
tof c5 c16
tof b8 a16
tof b15 c1
tof a23 b15
tof a23 c10
tof a22 c5
tof b4 c5
tof b12 c5
tof c12 c11
tof c5 c11
tof a26 c5
tof b28 a23
tof b28 c29
tof b28 a1
tof c14 b4
tof c12 b4
tof b8 b28
tof a22 b8
tof b4 a22
tof a11 b4
tof b12 b20
tof c12 b20
tof a20 a26
tof a20 b20
tof a11 a20
tof b12 a20
tof c14 a20
tof c14 a11
tof c12 a11
tof c14 b12
tof c20 a27
tof c17 b3
tof a27 a30
tof a27 c17
tof a27 c14
tof c12 a27
tof c20 a14
tof a24 a4
tof c15 a24
tof c15 a15
tof b9 b19
tof a27 c3
tof a27 c12
tof c14 c3
tof c14 a14
tof a27 b19
tof c14 c15
tof c14 c22
tof c17 c15
tof b3 c15
tof b3 a4
tof c15 a24
tof c15 a15
tof b12 c14
tof a20 b12
tof a20 a14
tof b12 a31
tof c14 b19
tof b12 b26
tof a20 c15
tof b12 a13
tof c14 c22
tof b12 b9
tof c14 c12
tof c14 c20
tof c14 c17
tof c14 a27
tof c14 a30
tof b4 b9
tof a26 b9
tof a26 b20
tof a26 a14
tof a26 a31
tof b9 b19
tof a26 b26
tof a26 c15
tof a26 a13
tof b4 a11
tof a26 b12
tof a26 a20
tof a22 a24
tof a22 c3
tof a22 b4
tof b8 c3
tof b8 b4
tof b28 a24
tof b28 b4
tof b28 b8
tof b4 a14
tof b4 a31
tof a22 b19
tof a22 a15
tof b4 b26
tof b4 c15
tof b4 a13
tof a22 c22
tof a22 b9
tof a22 a20
tof a1 a13
tof a23 a1
tof a23 c29
tof a23 a24
tof a23 a14
tof a23 a31
tof a23 a15
tof a23 b26
tof a23 c0
tof a23 b4
tof a23 b8
tof a23 b28
tof c5 a20
tof c11 c5
tof c11 a24
tof c5 a14
tof c5 a31
tof c11 a15
tof c5 c15
tof c11 c22
tof c5 c12
tof c11 a11
tof c5 c20
tof c5 c17
tof c5 a27
tof c5 a30
tof a20 b4
tof c5 b20
tof c11 a22
tof b15 a24
tof a16 a24
tof a24 a4
tof b15 a14
tof b15 a31
tof a16 c3
tof b15 a15
tof b15 b26
tof b15 c0
tof b15 b4
tof b15 b8
tof b15 b28
tof b15 a23
tof b15 a1
tof b15 c29
tof b15 c10
tof a2 b19
tof a2 b26
tof a2 a13
tof a2 b9
tof a2 c12
tof a2 c20
tof a2 b12
tof a2 c17
tof a2 a27
tof a2 a30
tof a2 c5
tof a2 a26
tof a17 a31
tof b31 b19
tof a17 a15
tof a17 b26
tof a17 c0
tof b31 a11
tof a17 b4
tof b31 a20
tof a17 b8
tof a17 b28
tof a17 a23
tof a17 a1
tof a17 c29
tof a17 c10
tof a17 b15
tof a17 c1
tof c25 a31
tof c25 a15
tof c25 b26
tof c25 c0
tof a12 b20
tof c25 b8
tof c25 b28
tof c25 a23
tof c25 a1
tof c25 c29
tof c25 c10
tof c25 b15
tof c25 c1
tof c25 a17
tof b5 a31
tof b2 b19
tof b5 a15
tof b5 b26
tof b2 a13
tof b5 c16
tof b5 b11
tof a21 b19
tof a21 a13
tof a21 b2
tof a3 b3
tof a6 a31
tof a6 b26
tof a6 b27
tof a10 a16
tof a6 b5
tof a6 a21
tof b30 b19
tof c27 b26
tof b30 a13
tof c27 b9
tof c27 c12
tof b30 b2
tof c8 b23
tof c8 c11
tof c8 a20
tof c8 b31
tof c21 c18
tof b21 c6
tof b21 a31
tof b21 b26
tof b21 b5
tof b21 a12
tof b21 a6
tof b21 b30
tof b21 c18
tof b0 a6
tof b17 a6
tof b0 a4
tof b0 a24
tof b17 a31
tof b0 b19
tof a6 a15
tof b17 b26
tof b0 c22
tof b0 c26
tof b0 c20
tof b0 b12
tof b0 c17
tof b0 a27
tof b0 a30
tof b0 b2
tof b0 c19
tof b0 c27
tof b0 c5
tof b0 a26
tof b0 a2
tof b0 a8
tof a6 b27
tof b0 b13
tof a6 c16
tof b0 c25
tof a6 b11
tof b17 b5
tof a6 a21
tof b0 c6
tof b17 a12
tof b17 b30
tof b17 c18
tof b0 a7
tof b0 b23
tof b0 c28
tof b0 a20
tof b0 c8
tof b0 c24
tof b16 a18
tof b16 a22
tof c31 b16
tof c31 a4
tof c31 a24
tof c31 a14
tof c31 b19
tof c31 a15
tof c31 b26
tof c31 c15
tof a18 c0
tof c31 a13
tof c31 b9
tof c31 c26
tof c31 c20
tof c31 c17
tof c31 a27
tof c31 a30
tof c31 b2
tof c31 c19
tof c31 c27
tof c31 a8
tof c31 b27
tof c31 c6
tof c31 b20
tof c31 c18
tof c31 a7
tof c31 c11
tof c31 a20
tof c31 b31
tof c31 b14
tof c31 c4
tof c31 c24
tof c31 b21
tof c31 b17
tof b16 a29
tof a22 b0
tof c31 c14
tof a28 b19
tof a28 c22
tof a28 a11
tof a28 c20
tof a28 b12
tof a28 c17
tof a28 a27
tof a28 a30
tof a28 b2
tof a28 c27
tof a28 a26
tof a28 a2
tof a28 c25
tof a28 c21
tof a28 a20
tof a28 b31
tof a28 b25
tof a28 c4
tof a28 a29
tof a28 c13
tof c30 c18
tof b18 c18
tof b18 a28
tof a25 c30
tof a25 a28
tof c18 a31
tof a28 b19
tof c18 a15
tof c18 b26
tof a28 c22
tof a28 a11
tof a28 c20
tof a28 b12
tof a28 c17
tof a28 a27
tof a28 a30
tof a28 b2
tof a28 c27
tof a28 a26
tof a28 a2
tof c18 c16
tof a28 c25
tof c18 b11
tof c18 b5
tof c18 a6
tof a28 c21
tof a28 a20
tof a28 b31
tof a28 b25
tof a28 c4
tof a28 a29
tof a28 c13
tof a28 b7
tof a25 b4
tof a19 b10
tof a19 c14
tof a19 b14
tof a19 c31
T a19
T* c31
T b14
T* c14
T* a25
T c7
T* b18
T b4
T b10
T* a28
T* c23
T b7
T* b16
T* a22
T b0
T* c13
T b1
T a29
T* b17
T* b21
T* c24
T* c4
T c30
T b25
T c8
T* b31
T a20
T* c11
T c21
T* a16
T c28
T* a10
T b23
T* a3
T* b3
T* a7
T c18
T* b30
P* b20
T* b20
T* a6
T a12
T c6
T a21
T* b5
T b11
T* c25
T* c16
T* a17
T* c1
T* b13
T* b15
T* c10
T* c29
T* a1
T* a18
T* a23
T* b27
T* b28
T* b8
T* a8
T* a2
T* a26
T* c5
T* c27
T* c19
T* b2
T* a30
T* a27
T* c17
T* b12
T* c20
T* c26
T* a11
T* c12
T* b9
T c22
T* a13
T* c0
T* c15
T* b26
T a15
T* c3
T b19
T* a31
T* a14
T a24
T a4
tof a25 a19
tof b18 a19
tof a20 b31
tof c5 a19
tof b12 b31
tof c20 c14
tof c14 a19
tof c14 c31
tof b31 c31
tof c14 b14
tof b31 b14
tof c5 b18
tof b31 c14
tof c7 a25
tof b18 c7
tof b31 c7
tof c8 b4
tof b31 b18
tof c11 b4
tof c25 b4
tof b8 b4
tof c5 b4
tof a27 b4
tof b4 b18
tof b10 b4
tof b16 b7
tof a22 b7
tof b0 b7
tof b31 c8
tof c11 c8
tof a17 b7
tof b27 a28
tof b8 c8
tof a27 c8
tof c23 a28
tof c8 a28
tof c8 b7
tof b0 b16
tof b0 a22
tof b31 a29
tof a3 a29
tof b3 a29
tof a17 c8
tof c17 a29
tof b1 c13
tof a29 b1
tof c8 b1
tof b31 b21
tof b20 b17
tof a12 b17
tof a27 b21
tof b21 b17
tof c24 b21
tof c8 b25
tof c11 b25
tof a16 b25
tof a10 b25
tof c16 c30
tof a17 b25
tof c30 c4
tof b28 c4
tof b28 c30
tof b28 b25
tof c11 a20
tof b30 c18
tof b5 c18
tof a17 c8
tof b2 c18
tof b12 a20
tof b31 c8
tof c18 c8
tof c18 b31
tof b13 b31
tof c18 a20
tof b13 a20
tof a10 a16
tof b13 a16
tof b28 a16
tof b2 c21
tof c17 c21
tof c21 c11
tof c18 b23
tof b28 a10
tof c17 b23
tof a10 c28
tof b13 c28
tof b23 a10
tof b13 b23
tof b2 b3
tof c17 b3
tof b3 a3
tof a7 b3
tof a21 b20
tof b13 c18
tof c20 b20
tof b2 c18
tof b2 b20
tof a26 c6
tof c20 a21
tof a21 a6
tof b2 a6
tof a21 a12
tof b2 a12
tof a21 c6
tof b2 a21
tof b11 b5
tof b13 b11
tof b13 c25
tof b13 c16
tof b13 a17
tof b13 c1
tof a8 b13
tof a8 b15
tof a8 c10
tof a8 c29
tof a8 a1
tof a15 a23
tof a8 a18
tof a8 a23
tof a8 b27
tof b9 b8
tof a8 b28
tof a8 b8
tof c22 c5
tof b2 a2
tof b2 a26
tof b2 c5
tof b26 c27
tof a4 c17
tof b2 c27
tof b2 c19
tof c17 b2
tof c17 a30
tof c17 a27
tof c26 c17
tof c26 b12
tof c26 c20
tof b26 c12
tof a15 c0
tof a15 c15
tof c17 b12
tof c17 c20
tof c17 c26
tof b2 a4
tof b2 a27
tof b2 b12
tof b2 a30
tof b2 c20
tof c27 b26
tof b2 c26
tof c27 c12
tof b2 c17
tof c5 c22
tof b8 b9
tof a23 a15
tof a23 c0
tof a23 c15
tof a1 a13
tof b13 b15
tof b13 b9
tof b13 b28
tof b13 c10
tof b13 a15
tof b13 c29
tof b13 a8
tof b13 b8
tof b13 a13
tof b13 c0
tof b13 c15
tof b13 a23
tof b13 b27
tof b13 a18
tof b13 a1
tof a17 a14
tof a17 a24
tof a17 b2
tof b5 b11
tof b20 a12
tof b20 a6
tof b20 a21
tof c18 a23
tof c18 a24
tof c18 b2
tof b20 c6
tof b3 a7
tof a3 c5
tof a3 a23
tof a3 a24
tof a10 b23
tof c11 c21
tof a16 c28
tof a16 c3
tof b31 a20
tof b31 c18
tof c8 b31
tof c18 a4
tof b31 b9
tof b31 c10
tof b31 c16
tof b31 b23
tof c18 a7
tof c18 b30
tof b31 a8
tof c18 c26
tof a20 a11
tof c18 c12
tof b31 b8
tof b31 a13
tof b31 c0
tof b31 c15
tof c18 c27
tof c8 a23
tof b31 c3
tof c18 b19
tof b31 a14
tof c8 a24
tof c8 b2
tof c18 a3
tof c18 c6
tof b31 c1
tof c18 c11
tof c8 a10
tof c18 b3
tof c18 b20
tof b31 b13
tof c18 c17
tof c18 b12
tof c18 a27
tof b31 a18
tof c18 a30
tof c18 c19
tof c18 c22
tof c18 a26
tof b31 c25
tof c18 a2
tof b31 b28
tof b31 a15
tof b31 a1
tof b31 c29
tof b31 b15
tof c18 b26
tof b31 a17
tof b31 a16
tof b31 b11
tof c18 c20
tof b31 b27
tof b21 c24
tof b17 a12
tof b1 a29
tof c13 a29
tof c13 b1
tof a22 b0
tof b16 b0
tof a28 c23
tof b4 b10
tof b18 b10
tof b18 b4
tof b18 c23
tof b18 a29
tof b18 c21
tof b18 b23
tof b18 a8
tof b18 a11
tof b18 b8
tof b18 a13
tof b18 c0
tof b18 c15
tof b18 a23
tof b18 c3
tof b18 a14
tof b18 a24
tof b18 b2
tof b18 a28
tof b18 b1
tof b18 c11
tof b18 a10
tof b18 b13
tof b18 b28
tof b18 a15
tof b18 a1
tof b18 c29
tof b18 b15
tof b18 a17
tof b18 a16
tof b18 b11
tof b18 b7
tof b18 c8
tof b18 c25
tof b18 c16
tof b18 c1
tof b18 b31
tof b18 c10
tof b18 a18
tof b18 b27
tof b18 b9
tof b18 a20
tof a25 c7
tof c7 b19
tof c7 a31
tof c31 b14
tof c31 b4
H b2
tof a10 c20
tof b1 a4
tof b4 a3
tof a7 c20
tof c24 a4
tof c23 a3
tof c14 b26
tof a21 c31
tof a21 c18
tof a30 b9
tof b16 a20
tof c14 b18
tof a7 a20
tof a7 b9
tof a21 a12
tof c21 c6
tof c24 b27
tof b16 c6
tof b16 b27
tof a30 c10
tof b30 a22
tof b0 c10
tof c23 a18
tof b23 b31
tof b30 c1
tof b30 c16
tof a26 b5
tof b30 a6
tof b10 c25
tof b10 b5
tof b30 c8
tof a7 c28
tof b23 b25
tof b11 c28
tof b11 b25
tof c30 c4
tof c24 c13
tof a29 b7
tof a16 c4
tof a16 c13
tof a17 a25
tof c23 a25
tof b10 a19
tof a21 b11
tof c30 a16
tof b30 a17
tof b30 c7
tof b30 b15
tof b30 c29
tof b30 a1
tof b16 a2
tof b30 a15
tof c24 a2
tof a21 b28
tof a21 a2
tof b10 a26
tof a21 b17
tof a21 c22
tof a7 b16
tof a21 c19
tof a21 b16
tof c21 a27
tof a21 b12
tof a21 c17
tof a10 b3
tof b30 b3
tof a7 b3
tof a21 b13
tof a21 b20
tof b1 b21
tof a21 a10
tof a7 a10
tof c21 c11
tof c30 b21
tof c24 b21
tof c24 b1
tof b0 a28
tof c23 b4
tof a21 b1
tof b4 a28
tof a21 b4
tof c14 b14
tof a21 a14
tof c30 a14
tof c14 a31
tof a21 c27
tof b30 c3
tof c21 a7
tof a7 a23
tof a7 c27
tof b30 c15
tof a7 c0
tof c21 c0
tof a21 c15
tof a21 a13
tof a21 b8
tof b10 c12
tof c24 a11
tof a21 a11
tof a7 a11
tof c21 a11
tof a7 c26
tof c21 c26
tof a21 a8
tof a7 a8
tof c21 a7
tof c24 a7
tof b0 b30
tof c14 a21
tof c14 a7
tof c14 c21
tof b0 b23
tof b0 c30
tof c14 c24
tof b10 a29
tof b10 b0
tof b10 c23
tof b0 b10
tof b0 c23
tof a7 c24
tof a21 a7
tof b30 c30
tof a21 c14
tof b30 c23
tof b30 b23
tof b30 b0
tof a21 c21
tof a27 c21
tof a30 b10
tof b16 b19
tof b16 a23
tof b16 c27
tof a30 c0
tof b16 a13
tof b16 a11
tof a30 c26
tof b16 a8
tof b16 a7
tof b16 c24
tof a30 c14
tof a30 b30
tof a26 a29
tof a26 c12
tof a15 c15
tof a16 a14
tof a17 c3
tof a16 c30
tof b11 b19
tof b11 a23
tof c25 b0
tof b31 b23
tof c10 a30
tof a18 c23
tof c10 b30
tof c6 a23
tof c6 c27
tof a12 b8
tof b27 a11
tof c6 a8
tof b27 a2
tof a20 b19
tof b9 c0
tof a20 a13
tof b9 c26
tof a20 b16
tof c18 a14
tof b26 a31
tof c18 c15
tof b26 a21
tof c20 a10
tof a4 b1
tof a3 b4
tof c20 b3
tof a4 b21
tof a3 a28
T* b18
T* b26
T* b14
T* a19
T* a26
T b5
T* c25
T a25
T* a18
T a3
T* a30
T* b10
T c10
T a28
T* b7
T* a29
T c13
T* a7
T b27
T a4
T* a16
T c4
T b21
T c6
T* a27
T* c11
T b25
T* b31
T c28
T b9
T a20
T c20
T* c8
T* a6
T* c30
T* a17
T* b0
T* c7
T* c16
T* b15
T* c1
T* c29
T* b23
T* a1
T* b30
T* a15
T* a22
T* c23
T b3
T* b11
T* b28
T a2
T* a12
T* b17
T* c22
T* b16
T* c19
T* c14
T* a21
T* c24
T* c18
T* c21
T* c31
T* b12
T* b4
T* c17
T* b1
T* b13
T* a10
T* b20
T* a8
T* c26
T* a11
T* c12
T* b8
T* c5
T* a13
T* c0
T c15
T* c27
T a23
T* c3
T b19
T* a31
T a14
P* a24
T* a24
tof c25 b14
tof a20 b18
tof b0 b14
tof b30 b10
tof b16 b18
tof c14 a30
tof a21 b26
tof c24 b18
tof b4 b14
tof a0 a17
tof b26 b18
tof a30 b18
tof c10 b18
tof b14 b26
tof b10 b26
tof c10 b26
tof a30 b14
tof c10 b14
tof a17 b14
tof c25 a26
tof a29 a30
tof a17 a19
tof b0 a26
tof b16 a30
tof a0 a19
tof b10 a19
tof c10 a19
tof b5 a26
tof b10 a26
tof c10 a26
tof a30 b5
tof c10 b5
tof a30 a18
tof a29 a18
tof c30 a25
tof b0 c25
tof b30 a25
tof c23 a18
tof b16 a18
tof c14 a25
tof a10 b10
tof a0 a17
tof a17 c25
tof a18 a25
tof a17 a25
tof b10 a18
tof c10 a3
tof a29 a30
tof b16 a30
tof c19 b30
tof c14 b30
tof b4 a30
tof a10 b10
tof a0 a17
tof a30 a3
tof b10 a30
tof a17 a30
tof b30 b10
tof c30 b7
tof b30 c10
tof b16 a28
tof c19 a28
tof b4 a28
tof b1 a28
tof b23 c10
tof b23 b7
tof a4 a29
tof a16 c13
tof a20 a29
tof c23 b23
tof b11 c13
tof c14 b23
tof b1 a29
tof c24 a29
tof a7 c13
tof c24 c13
tof b23 a7
tof c24 a7
tof a20 b27
tof c30 a16
tof b23 a4
tof b28 a16
tof a2 b27
tof b16 b27
tof c14 c23
tof b4 a17
tof b1 a4
tof a4 b27
tof a17 a4
tof c23 a4
tof a17 a16
tof a20 c6
tof c20 c6
tof c30 c4
tof a17 c4
tof b11 c4
tof b16 c6
tof c21 a27
tof b4 c6
tof b1 b21
tof a27 c4
tof b28 c4
tof a27 b21
tof b28 b21
tof a10 b21
tof a27 c6
tof a10 c6
tof b31 c11
tof a20 b9
tof a17 b25
tof b23 b25
tof c23 b25
tof b11 b25
tof b16 b9
tof c14 b9
tof c24 b9
tof a10 c11
tof b9 a27
tof b9 c11
tof a20 b31
tof c20 b31
tof a17 c28
tof b23 c28
tof c23 c28
tof b11 c28
tof b16 b31
tof c24 b31
tof a10 b31
tof b4 b31
tof b4 b9
tof b23 a20
tof c23 a20
tof b16 a20
tof c14 c20
tof c24 a20
tof b4 c20
tof a10 c20
tof a17 a20
tof b11 a20
tof b11 c20
tof a17 c8
tof b11 c8
tof c23 b23
tof c14 b23
tof a17 a6
tof b11 a6
tof a17 c30
tof b11 c30
tof b23 a17
tof b11 b23
tof b23 b0
tof b23 c7
tof b23 c16
tof b23 b15
tof b23 c1
tof b23 c29
tof b11 c23
tof c19 b30
tof c17 c23
tof c23 b23
tof c14 b23
tof c23 a1
tof c14 a1
tof c23 b30
tof c31 b11
tof c17 b11
tof c23 a15
tof c14 a15
tof c23 a22
tof c14 a22
tof b11 c23
tof c14 b3
tof c31 b11
tof c17 b11
tof a10 b3
tof a0 b4
tof b28 b11
tof b4 b28
tof c14 a2
tof b4 a12
tof b4 b17
tof a0 b16
tof b4 c22
tof b4 b16
tof b4 c19
tof c31 c14
tof c17 c14
tof b13 c14
tof b4 a21
tof b4 c24
tof b4 c18
tof b4 c21
tof b4 c31
tof b13 c17
tof a0 b1
tof b4 b12
tof b1 b4
tof a0 b1
tof b13 b1
tof b20 b13
tof b20 a10
tof a0 a13
tof a0 c0
tof a0 b19
tof a0 a14
tof b13 b20
tof b13 a10
tof b1 b20
tof c17 b19
tof c17 c27
tof c17 c15
tof c17 c5
tof c17 c12
tof c17 a11
tof c17 a8
tof b4 b20
tof c18 a24
tof c18 a14
tof c31 b19
tof c31 c27
tof c31 c15
tof c31 c5
tof c31 c12
tof c31 a11
tof c31 a8
tof c31 c17
tof a21 a31
tof c14 b19
tof a21 a23
tof c14 c27
tof c14 c15
tof c14 c5
tof c14 c12
tof c14 a11
tof c14 a8
tof c14 c17
tof c14 a10
tof c14 b13
tof c14 b1
tof b16 b19
tof b16 a13
tof a12 c0
tof b17 a13
tof a12 b8
tof b11 b28
tof b28 a24
tof b28 a31
tof b28 c3
tof b28 a23
tof b28 c15
tof b28 c5
tof b28 c12
tof b28 a11
tof b28 a8
tof b28 a0
tof b28 c31
tof b28 c18
tof b28 b12
tof b28 a21
tof b28 c21
tof b28 c24
tof b28 c17
tof b28 c19
tof b28 c22
tof b28 a12
tof b28 b17
tof a15 c15
tof a22 c5
tof c23 a10
tof c23 b13
tof c23 b1
tof c23 c14
tof b23 b30
tof b23 a1
tof b23 c15
tof b23 c5
tof b23 a10
tof b23 b13
tof b23 b1
tof b23 c14
tof b23 c23
tof b23 a22
tof b23 a15
tof c29 a31
tof b15 c3
tof c7 a14
tof a17 a14
tof c30 a14
tof a17 a31
tof a17 b19
tof a17 c3
tof a17 a23
tof a17 c12
tof a17 a11
tof c30 a8
tof a17 b3
tof a17 a10
tof a17 b13
tof a17 b1
tof a17 c14
tof a17 a0
tof a17 a2
tof a17 a22
tof a17 b30
tof a17 a15
tof a17 a1
tof a17 c1
tof a17 c29
tof a17 c16
tof a17 b15
tof a17 b0
tof a17 c7
tof c20 a0
tof a20 c20
tof a20 c8
tof a20 b19
tof c20 a23
tof c20 c27
tof a20 c12
tof a20 a11
tof c20 a8
tof a20 c31
tof a20 c18
tof a20 b12
tof a20 a21
tof a20 c21
tof a20 c24
tof a20 c17
tof a20 c19
tof a20 c22
tof a20 a12
tof a20 b17
tof a20 a22
tof a20 b11
tof a20 b30
tof a20 a15
tof a20 a1
tof a20 c1
tof a20 c29
tof a20 c16
tof a20 b15
tof a20 b0
tof a20 c7
tof a20 b28
tof a20 a6
tof a20 c30
tof b9 c0
tof b9 c26
tof b9 b20
tof b31 a17
tof b31 c20
tof a27 c11
tof c6 a23
tof c6 c27
tof c6 a8
tof c6 a17
tof c6 b31
tof a4 a2
tof b27 a2
tof a2 a11
tof a4 b3
tof a4 a0
tof a4 c31
tof a4 c18
tof a4 b12
tof a4 a21
tof a4 c21
tof a4 c24
tof a4 c17
tof a4 c19
tof a4 c22
tof a4 a12
tof a4 b17
tof a4 b11
tof a4 a20
tof a4 c28
tof a4 b25
tof a16 b21
tof a16 c4
tof a29 c12
tof a7 a11
tof a7 a2
tof a7 b27
tof a7 b23
tof c10 b7
tof c10 c27
tof c10 c15
tof c10 c5
tof c10 a11
tof c10 a8
tof c10 c23
tof c10 a22
tof c10 b30
tof c10 a15
tof c10 a1
tof c10 c1
tof c10 c29
tof c10 c16
tof c10 b15
tof c10 b0
tof c10 c7
tof c10 b28
tof c10 a6
tof c10 c30
tof c10 c8
tof c10 c11
tof c10 b31
tof c10 a4
tof c10 a7
tof b10 a4
tof a30 a4
tof a30 a31
tof b10 c27
tof b10 c15
tof b10 c5
tof a30 b8
tof a4 c12
tof b10 a11
tof b10 a8
tof a4 b3
tof a30 a10
tof a30 b13
tof a30 b1
tof a30 c14
tof b10 c23
tof a4 a0
tof a4 c31
tof a4 c18
tof a4 b12
tof a4 a21
tof a4 c21
tof a30 b9
tof a4 c24
tof a4 c17
tof a4 c19
tof a4 c22
tof a4 a12
tof a4 a29
tof a4 b17
tof a4 b27
tof b10 a22
tof a4 b11
tof b10 b30
tof b10 a15
tof b10 a1
tof b10 c1
tof b10 c29
tof b10 c16
tof b10 b15
tof b10 b0
tof b10 c7
tof b10 b28
tof b10 a6
tof b10 c30
tof b10 c8
tof a4 a20
tof a4 c28
tof b10 c11
tof a30 a17
tof a30 c20
tof b10 b31
tof a4 b25
tof a30 b21
tof a30 a16
tof b10 a7
tof b10 a28
tof a30 b24
tof b10 b7
tof a30 b4
tof a30 b16
tof a30 c6
tof c25 b28
tof a26 b5
tof b5 c12
tof b5 a29
tof a26 b28
tof b5 a28
tof b26 b14
tof b18 b19
tof b14 b4
tof b14 b24
tof b14 a30
tof b14 b16
tof b14 b9
tof b14 c6
T b14
T c6
T* b9
T* b16
T* a30
T b24
T* b4
T* c25
T a19
T* a26
T b26
T* a3
T* a18
T a25
T* b10
T c10
T b7
T* b5
T a28
T a7
T* b23
T* a4
T c13
T* a16
T c4
T* a27
T b21
T* b25
T* b31
T* c20
T a17
T c11
T* c28
T* a20
T* c8
T* c30
T* a6
T* b28
T* c7
T* b0
T* b15
T* c16
T* c29
T* c1
T* a1
T* a15
T* b30
T* b11
T* a22
T* b27
T* b17
T* a2
T* a29
T* a12
T* c22
T* c19
T* c17
T* c24
T* b18
T* c21
T* a21
T* b12
T* c18
T* c31
T* a0
T c23
T* c14
T* b1
T* b13
T* a10
T* b3
T* b20
T* a8
T* c26
T* a11
T c12
T* b8
T* c5
T* a13
T* c0
T* c15
T* c27
T* a23
T* c3
T* b19
T* a31
T a14
T a24
tof b16 b9
tof c25 b14
tof b5 b9
tof c20 b14
tof a17 c6
tof c30 b14
tof c17 b31
tof a0 c6
tof c6 b14
tof b31 c6
tof a18 b4
tof a25 b16
tof b10 b16
tof b5 b16
tof b31 b16
tof a17 b24
tof a20 b16
tof c30 b16
tof c19 b16
tof b1 b4
tof a10 b4
tof c20 b16
tof b4 a30
tof b4 b24
tof c20 b24
tof a18 a26
tof b10 a25
tof a27 a25
tof c20 b4
tof a17 a25
tof a20 a25
tof c30 c25
tof b28 a26
tof c19 a25
tof c14 a25
tof b1 b26
tof a10 a26
tof c25 b4
tof a19 b4
tof b31 b4
tof a19 c25
tof a26 c25
tof b26 c25
tof a26 a19
tof a25 a19
tof b31 a19
tof b10 a3
tof b31 a3
tof c20 b26
tof a12 b26
tof c19 a3
tof b1 a3
tof a10 a18
tof b3 b26
tof a18 a26
tof b17 a26
tof a17 b26
tof b17 b26
tof a18 a3
tof a17 a3
tof c10 b10
tof b31 a27
tof c20 b10
tof c30 a25
tof a2 a27
tof a12 b10
tof c21 a27
tof c14 a27
tof b1 a18
tof b3 b10
tof a27 a25
tof a27 b10
tof b23 b7
tof b31 c10
tof a20 b7
tof c30 b7
tof a2 c20
tof a12 b7
tof c19 c10
tof c17 b5
tof c21 b7
tof c31 b7
tof c23 b7
tof b3 b7
tof a17 c10
tof c20 b7
tof a17 b7
tof c20 b5
tof a27 a7
tof c20 b23
tof a17 a28
tof a12 b23
tof c17 a2
tof c21 a28
tof c31 b23
tof c23 b23
tof c14 a7
tof b1 a28
tof a10 a28
tof b3 b23
tof b23 a28
tof b23 a7
tof a2 a7
tof b31 b23
tof a2 b23
tof c20 a4
tof a17 c13
tof b11 a16
tof a2 a4
tof a12 a4
tof a10 a4
tof b3 a4
tof a16 a4
tof b31 a4
tof b31 c13
tof a20 c13
tof a20 a16
tof b25 a27
tof c20 b21
tof a20 c4
tof a2 b21
tof c17 a12
tof a10 b21
tof b3 a12
tof b31 c4
tof a17 c4
tof b31 a27
tof a17 a27
tof a12 a27
tof b31 b21
tof a12 b21
tof a20 a17
tof c30 c20
tof a2 c20
tof a12 a17
tof c17 b31
tof c24 a17
tof b3 a17
tof c20 b25
tof a17 b31
tof a17 c20
tof c30 c28
tof a12 a17
tof c17 a17
tof c24 a17
tof c14 c11
tof a10 c11
tof b3 a17
tof a12 a20
tof c17 a20
tof c24 a20
tof b3 a20
tof a6 a20
tof c30 c8
tof a6 c30
tof c29 a6
tof c29 b28
tof c29 c7
tof c29 b0
tof c29 b15
tof c29 c16
tof b11 c29
tof b11 c1
tof b11 a1
tof b11 a15
tof b11 b30
tof b17 b11
tof b17 a22
tof b17 b27
tof a29 b17
tof c24 c17
tof c21 a12
tof b12 a2
tof b3 a12
tof a12 a2
tof c19 a29
tof c19 a12
tof c17 a12
tof b3 c14
tof c19 c22
tof c24 c19
tof c14 c19
tof c14 c17
tof c31 c24
tof c23 c24
tof b3 c24
tof c21 b18
tof a21 c21
tof c23 b12
tof b3 b12
tof c18 a21
tof c31 b12
tof c31 c18
tof c14 c23
tof b3 c23
tof a0 c31
tof c23 a0
tof b3 c14
tof b13 c14
tof b13 b1
tof a10 b13
tof b3 a10
tof c3 a14
tof c12 a24
tof b8 c27
tof c12 c15
tof c26 a14
tof a10 b3
tof a10 c0
tof a10 a8
tof c14 b1
tof c14 b13
tof b1 a23
tof b13 c0
tof b1 c5
tof b1 c26
tof b13 a8
tof b13 b3
tof b13 a10
tof c31 a0
tof c23 b19
tof c23 c12
tof c18 c12
tof a21 c18
tof c12 a24
tof c18 a14
tof c18 b19
tof c12 c15
tof b12 a0
tof c18 c23
tof c18 c31
tof c21 b19
tof c21 c23
tof b18 b19
tof c24 b19
tof c24 c23
tof c24 a24
tof c21 a14
tof c23 c3
tof c21 a23
tof c24 c15
tof c23 c5
tof c24 c12
tof c23 c26
tof c23 a8
tof c23 b3
tof c21 c31
tof c21 c18
tof c21 a21
tof c19 c17
tof c19 a24
tof c19 b19
tof c19 c3
tof c19 a23
tof c19 c15
tof c19 c0
tof c19 c12
tof c19 b20
tof c19 b13
tof c19 b1
tof c19 a10
tof c19 c14
tof a12 c3
tof a12 a0
tof a29 a0
tof a29 a12
tof a2 a0
tof a29 a24
tof c3 a14
tof a29 b19
tof a29 a23
tof a29 c15
tof a29 c0
tof a29 c12
tof a12 a8
tof a29 b20
tof a29 c22
tof a29 b13
tof a29 b1
tof a29 a10
tof a29 c14
tof a29 c19
tof a12 c23
tof a2 b12
tof a29 c17
tof b17 c15
tof b27 c15
tof b17 a24
tof b17 b19
tof b17 a23
tof b17 c0
tof b27 a13
tof a22 c5
tof b17 c12
tof b17 a8
tof b17 b20
tof b17 a0
tof b17 b13
tof b17 b1
tof b17 a10
tof b17 c14
tof b17 c19
tof b17 c23
tof b17 a12
tof b17 c17
tof b17 a29
tof b17 c22
tof b11 a24
tof b11 b19
tof b11 a23
tof b30 c27
tof b11 c0
tof b11 c5
tof b30 b8
tof b11 c12
tof b11 a8
tof b11 b20
tof b11 b3
tof b11 a0
tof b11 b13
tof b11 b1
tof b11 a10
tof b11 c14
tof b11 c19
tof b11 c23
tof b11 a12
tof b11 b27
tof b11 c17
tof b11 a29
tof b11 c22
tof b11 b17
tof b11 a22
tof c29 a1
tof c29 c1
tof c29 a24
tof c29 b19
tof c29 a23
tof c29 c27
tof c29 c0
tof c29 c5
tof c29 b8
tof c29 c12
tof c29 a8
tof c29 b20
tof c29 b3
tof c29 a0
tof c29 a15
tof c29 b13
tof c29 b1
tof c29 a10
tof c29 c14
tof c29 c19
tof c29 c23
tof c29 a12
tof c29 c17
tof c29 a29
tof c29 c22
tof c29 b17
tof c29 a22
tof c29 b11
tof c29 b30
tof c29 b27
tof b15 b19
tof b15 c3
tof b15 c27
tof a6 c7
tof a6 b28
tof a6 a24
tof c7 a14
tof a6 a31
tof a6 c3
tof a6 a23
tof a6 c0
tof a6 c5
tof a6 b8
tof a6 c12
tof a6 a8
tof a6 b20
tof a6 b3
tof a6 a0
tof a6 b15
tof a6 b13
tof a6 b1
tof a6 a10
tof a6 c14
tof a6 c19
tof a6 c23
tof a6 a12
tof a6 c17
tof a6 a29
tof a6 c22
tof a6 b17
tof a6 a22
tof a6 b11
tof a6 b30
tof a6 b27
tof a6 c29
tof a6 c1
tof a6 a15
tof a6 c16
tof a6 a1
tof a6 b0
tof a20 a24
tof a20 a14
tof c30 a31
tof a20 c3
tof a20 a23
tof a20 c0
tof a20 c5
tof c30 b8
tof a20 c12
tof c30 a8
tof a20 b20
tof a20 b3
tof a20 a0
tof a20 b13
tof a20 b1
tof a20 a10
tof a20 c14
tof a20 c19
tof c30 c23
tof c30 a12
tof c30 c7
tof c30 c17
tof c30 a29
tof c30 c22
tof c30 b17
tof c30 a22
tof c30 b11
tof c30 b30
tof c30 b27
tof c30 c29
tof c30 c1
tof c30 a15
tof c30 c16
tof c30 a1
tof c30 b0
tof c30 a6
tof c30 b28
tof c30 b15
tof a17 a14
tof a17 c26
tof a17 b13
tof a17 c31
tof a17 b1
tof a17 a10
tof a17 c14
tof a17 c18
tof a17 c19
tof a17 a21
tof a17 c24
tof a17 c21
tof a17 b18
tof c20 c23
tof c20 a12
tof b31 c23
tof b31 c20
tof b25 c20
tof b31 a24
tof c20 a14
tof a12 a23
tof a12 c5
tof b25 b8
tof b31 c12
tof c20 a11
tof b31 c26
tof a12 b20
tof a12 b3
tof a12 a0
tof c23 c11
tof a12 c31
tof a12 c18
tof a12 a21
tof b31 c24
tof a12 c21
tof a12 b18
tof a12 a17
tof b25 c17
tof b25 a29
tof b25 c22
tof b31 a20
tof b25 b17
tof b25 a22
tof b25 b11
tof b25 b30
tof b25 b27
tof b25 c29
tof b25 c1
tof b25 a15
tof b25 c16
tof b25 a1
tof b25 b0
tof b25 a6
tof b25 b28
tof b25 b15
tof b25 c30
tof b25 c7
tof b25 c8
tof b25 c28
tof a27 a14
tof a27 b8
tof a27 a11
tof a27 c20
tof a27 c17
tof a27 a29
tof a27 c22
tof a27 b17
tof a27 a22
tof a27 b11
tof a27 b30
tof a27 b27
tof a27 c29
tof a27 c1
tof a27 a15
tof a27 c16
tof a27 a1
tof a27 b0
tof a27 a6
tof a27 b28
tof a27 b15
tof a27 c30
tof a27 c7
tof a27 c8
tof a27 c28
tof a27 b25
tof a16 a12
tof a16 b31
tof b23 a4
tof b5 a14
tof b5 c26
tof b10 a11
tof a25 c26
tof a25 b10
tof a18 c26
tof c26 a14
tof a25 b8
tof a25 b20
tof a25 a0
tof a25 b5
tof a25 c20
tof a25 c17
tof a25 a29
tof a25 c22
tof a25 a7
tof a25 b17
tof a25 a22
tof a25 b11
tof a25 b30
tof a25 b27
tof a25 c29
tof a25 c1
tof a25 a15
tof a25 c16
tof a25 a1
tof a25 b0
tof a25 a6
tof a25 b28
tof a25 b15
tof a25 c30
tof a25 c7
tof a25 c8
tof a25 c28
tof a25 b25
tof a25 a27
tof a25 a28
tof a25 b7
tof a25 b12
tof a25 a2
tof a26 b26
tof b26 a23
tof b26 c5
tof b26 b8
tof b26 c26
tof b26 b20
tof b26 b3
tof b26 a0
tof b26 c11
tof b26 b13
tof b26 b1
tof b26 a10
tof b26 c14
tof b26 c19
tof b26 c24
tof b26 b21
tof b26 c20
tof b26 c17
tof b26 a29
tof b26 c22
tof b26 a7
tof b26 b17
tof b26 a22
tof b26 b11
tof b26 b30
tof b26 b27
tof b26 b10
tof b26 c29
tof b26 c1
tof b26 a15
tof b26 c16
tof b26 a1
tof b26 b0
tof b26 a6
tof b26 b28
tof b26 b15
tof b26 c30
tof b26 c7
tof b26 c8
tof b26 c28
tof b26 b25
tof b26 a27
tof b26 a28
tof b26 b23
tof b26 b7
tof b26 c23
tof a26 a20
tof b26 b12
tof a19 b8
tof c25 b8
tof b4 a19
tof b4 c25
tof a19 a14
tof c25 a23
tof b8 c27
tof c25 c5
tof c25 c26
tof c25 b20
tof c25 b3
tof c25 a0
tof c25 c11
tof c25 b13
tof c25 b1
tof c25 a10
tof c25 c14
tof c25 c19
tof c25 c24
tof c25 b21
tof c25 c20
tof c25 c17
tof c25 a29
tof c25 c22
tof c25 a7
tof c25 b17
tof c25 a22
tof c25 b11
tof c25 b30
tof c25 b27
tof c25 b10
tof c25 c29
tof c25 c1
tof c25 a15
tof c25 c16
tof c25 a1
tof c25 b0
tof c25 a6
tof c25 b28
tof c25 b15
tof c25 c30
tof c25 c7
tof c25 c8
tof c25 c28
tof c25 b25
tof c25 a27
tof c25 a28
tof c25 b23
tof c25 b7
tof c25 c23
tof c25 b12
tof c25 b26
tof a30 c26
tof a30 b24
tof b16 c26
tof a30 a14
tof b16 b20
tof b16 a0
tof b16 b5
tof b16 c20
tof b16 c17
tof b16 a29
tof b16 c22
tof b16 a7
tof b16 b17
tof b16 a22
tof b16 b11
tof b16 b30
tof b16 b27
tof b16 b10
tof b16 c29
tof b16 c1
tof b16 a15
tof b16 c16
tof b16 a1
tof b16 b0
tof b16 a6
tof b16 b28
tof b16 b15
tof b16 c30
tof b16 c7
tof b16 c8
tof b16 a19
tof b16 c28
tof b16 b25
tof b16 a27
tof b16 a28
tof b16 b7
tof b16 b12
tof b16 a2
tof b16 a25
tof a30 c25
tof b9 c23
tof c6 c23
tof c6 a14
tof c6 a23
tof c6 c5
tof c23 b20
tof c6 b3
tof c23 a0
tof c6 c11
tof c6 b13
tof c6 b1
tof c6 a10
tof c6 c14
tof c6 c19
tof c6 c24
tof c6 b5
tof c6 b21
tof c23 c20
tof c23 c17
tof c23 a29
tof c23 c22
tof b9 a7
tof c23 b17
tof c23 a22
tof c23 b11
tof c23 b30
tof c23 b27
tof c23 b10
tof c23 c29
tof c23 c1
tof c23 a15
tof c23 c16
tof c23 a1
tof c23 b0
tof c23 a6
tof c23 b28
tof c23 b15
tof c23 c30
tof c23 c7
tof c23 c8
tof c23 a19
tof c23 c28
tof c23 b25
tof c23 a27
tof c6 b23
tof c6 a2
tof c6 a25
tof c6 b16
tof c6 c25
tof c6 b4
tof c6 b24
T b26
T* c6
T* b24
T b14
T* a26
T a20
T b4
T* a30
T* a18
T c25
T* c10
T a3
T b16
T a25
T a2
T b12
T* b9
T c23
T b7
T* b23
T a28
T* c13
T* a16
T b31
T a12
T a4
T* c4
T* a27
T* b25
T* c28
T* a19
T* c8
T* c7
T* c30
T* b15
T* b28
T* a6
T* b0
T* a1
T* c16
T* a15
T* c1
T* c29
T* b10
T* b27
T* b30
T* b11
T* a22
T* b17
T* a7
T* c22
T* a29
T* c17
T* c20
T* b21
T* a17
T b5
T* b18
T* c21
T* c24
T* a21
T* c19
T* c18
T* c14
T* a10
T* b1
T* c31
T* b13
T* c11
T* a0
T* b3
T* b20
T* a8
T* c26
T* a11
T* c12
T* b8
T* c5
T* a13
T* c0
T* c15
T* c27
T* a23
T* c3
T* b19
T* a31
T a14
T* a24
tof a26 b24
tof c23 b9
tof b11 b24
tof c20 c6
tof c19 b9
tof a10 b26
tof b1 b24
tof a5 b25
tof b9 b26
tof b25 c6
tof b9 b24
tof b25 b24
tof b25 a26
tof c30 a20
tof b1 b9
tof a9 b9
tof a26 b14
tof a20 b14
tof a5 b14
tof a20 a26
tof b9 a26
tof b9 a20
tof b11 a20
tof a5 a20
tof c10 b4
tof a16 b4
tof a12 b9
tof b25 a30
tof b10 b4
tof c20 b9
tof a17 b9
tof b1 a18
tof a5 b4
tof a18 b4
tof b9 b4
tof a18 a30
tof b9 a30
tof a21 a18
tof b12 a3
tof a12 b9
tof b10 c10
tof c20 c25
tof a17 b9
tof c24 a3
tof b13 a3
tof a5 b25
tof a9 b9
tof b9 c25
tof b25 c10
tof b9 a3
tof b25 a3
tof b12 a25
tof a16 b16
tof b31 a2
tof a7 a2
tof a17 b16
tof c24 a25
tof b1 a12
tof a5 b25
tof a9 b25
tof a12 b16
tof b25 b16
tof c20 b16
tof b9 a25
tof a12 a25
tof c20 a25
tof b9 a2
tof b25 a2
tof c20 a2
tof a12 c23
tof c17 b25
tof a17 c23
tof c24 b12
tof c19 c23
tof b1 a22
tof b25 b12
tof a22 b12
tof c20 b12
tof b23 b9
tof b25 b9
tof c20 b9
tof b23 c23
tof a22 c23
tof c20 c23
tof a16 b7
tof a12 b7
tof c20 b7
tof a17 b7
tof b1 a28
tof b13 a28
tof b25 b7
tof c17 b7
tof c4 b23
tof c17 b23
tof c4 a28
tof b25 a28
tof c17 a28
tof a22 b31
tof a7 b31
tof c17 a12
tof c20 a12
tof a17 a12
tof b1 b31
tof a9 b31
tof a12 c13
tof b25 c13
tof a12 a16
tof b25 a16
tof a12 b31
tof a7 a12
tof a29 a12
tof c17 a4
tof b1 a4
tof b13 a4
tof b25 a12
tof c4 a4
tof b25 a4
tof a27 c4
tof a17 b25
tof b1 b25
tof b15 a27
tof b15 c28
tof b15 a19
tof b15 c8
tof b15 c7
tof b15 c30
tof a15 b15
tof a15 b28
tof a15 a6
tof a15 b0
tof a15 a1
tof a15 c16
tof b11 a15
tof b11 c1
tof b11 c29
tof b11 b10
tof b11 b27
tof c17 a29
tof b1 a22
tof a22 b30
tof a29 b30
tof a7 b11
tof a29 b11
tof a7 a22
tof a29 a7
tof a7 b17
tof c17 a7
tof c17 c22
tof b21 c17
tof b21 c20
tof b1 b21
tof a9 b21
tof a17 b21
tof c24 a17
tof c24 b5
tof c24 b18
tof c24 c21
tof c19 c24
tof c18 a21
tof c18 c19
tof a10 c18
tof a9 b1
tof a10 c14
tof c11 a10
tof c11 b1
tof c11 c31
tof c11 b13
tof a9 c5
tof a5 c27
tof a9 a23
tof a5 a31
tof b19 a24
tof c12 a24
tof a0 c26
tof b13 a23
tof b1 a23
tof a10 b1
tof b1 a31
tof b1 c27
tof b1 c5
tof b1 a11
tof b1 a8
tof a10 c11
tof a10 c31
tof a10 b13
tof b1 a5
tof b1 a9
tof c19 c12
tof c19 c18
tof a21 c12
tof c19 a14
tof c18 a31
tof c18 c27
tof c18 c5
tof c18 a11
tof c18 a8
tof c19 b3
tof c18 c11
tof c18 c14
tof c18 b13
tof c18 a5
tof c18 a9
tof c18 a10
tof c18 c31
tof c24 a31
tof c24 c12
tof c21 c12
tof b18 a31
tof c12 a24
tof c24 a14
tof c21 b19
tof c24 c27
tof b18 a13
tof c24 c5
tof c24 a11
tof c24 a8
tof c24 b3
tof c24 c11
tof c24 b13
tof c24 a5
tof c24 a9
tof c24 a10
tof c24 c31
tof c24 c19
tof c24 c18
tof c24 c14
tof a17 b5
tof a17 a14
tof a17 b19
tof a17 c27
tof a17 a13
tof a17 c5
tof a17 a11
tof b5 c26
tof a17 a8
tof a17 b3
tof a17 c11
tof a17 b13
tof a17 a5
tof a17 a9
tof a17 a10
tof a17 c31
tof a17 c19
tof a17 c18
tof a17 c14
tof a17 c21
tof a17 c24
tof a17 b18
tof c20 a8
tof c17 a8
tof c17 c20
tof a29 a8
tof a29 c5
tof c20 a11
tof a29 c26
tof a29 a0
tof c17 b21
tof a7 c22
tof a7 b19
tof a7 c3
tof a7 c27
tof a7 c0
tof a7 a13
tof b17 c12
tof a7 b20
tof a7 b3
tof a7 a0
tof a7 b5
tof a7 a5
tof a22 b8
tof a22 a29
tof b11 b8
tof b11 a29
tof b30 b8
tof b11 a14
tof b11 b19
tof b11 c27
tof b11 a13
tof b11 c12
tof b11 c26
tof a29 a8
tof b11 b20
tof b11 b3
tof a22 c11
tof b11 c22
tof b11 a5
tof b11 b17
tof b11 a7
tof b27 c15
tof c29 c15
tof b27 a13
tof b27 b8
tof b27 b20
tof a15 c1
tof a15 a14
tof a15 b19
tof a15 c27
tof a15 c12
tof a15 c29
tof a15 a5
tof a15 a7
tof a15 b11
tof a15 b27
tof a15 a29
tof a15 c22
tof a15 b17
tof a15 b10
tof b15 b28
tof b15 a5
tof c30 a5
tof b15 a14
tof b15 b19
tof b15 c27
tof b15 c12
tof b15 a1
tof b15 a7
tof b15 b11
tof b15 a6
tof b15 a29
tof b15 c22
tof b15 b17
tof b15 b10
tof b15 a15
tof b15 c1
tof b15 b27
tof b15 c16
tof b15 c29
tof b15 b0
tof a19 a24
tof a19 a14
tof a19 b19
tof b25 b19
tof a27 b19
tof a27 c28
tof b19 a24
tof b25 a14
tof b25 c27
tof b25 a13
tof b25 c5
tof a27 c12
tof b25 a11
tof b25 a8
tof b25 b3
tof b25 c11
tof b25 b21
tof a27 c7
tof b25 b13
tof b25 a9
tof b25 a10
tof b25 c31
tof b25 c19
tof b25 c18
tof b25 c14
tof b25 c21
tof b25 c24
tof b25 b18
tof b25 a17
tof b25 a5
tof a27 a7
tof a27 b11
tof a27 a19
tof a27 a29
tof a27 c22
tof a27 b17
tof a27 b10
tof a27 a15
tof a27 c1
tof a27 b27
tof a27 c16
tof a27 c29
tof a27 b0
tof a27 b15
tof a27 b28
tof a27 a1
tof a27 c30
tof a27 a6
tof a27 c8
tof c4 b11
tof a12 b11
tof c4 a24
tof a12 a14
tof c4 b19
tof a12 c3
tof a12 c0
tof c4 c12
tof a12 a8
tof b11 b20
tof b11 a0
tof b11 b13
tof b11 c17
tof b11 a9
tof b11 a10
tof b11 c31
tof b11 c19
tof b11 c18
tof b11 c14
tof b11 c21
tof b11 c24
tof b11 b18
tof b11 a17
tof a12 b5
tof b11 b25
tof b11 c20
tof b11 a22
tof c4 a7
tof c4 a19
tof c4 a29
tof c4 c22
tof c4 b17
tof c4 b10
tof c4 a15
tof c4 c1
tof c4 b27
tof c4 c16
tof c4 c29
tof c4 b0
tof c4 b15
tof c4 b28
tof c4 a1
tof c4 c30
tof c4 a6
tof c4 c8
tof c4 a27
tof c4 c28
tof c4 c7
tof a16 a24
tof a16 a31
tof a16 c3
tof a16 c0
tof b31 a11
tof b31 a8
tof b31 b21
tof b23 a28
tof b23 a24
tof b23 b19
tof b23 c12
tof b23 b20
tof b23 a0
tof b23 a4
tof b23 b13
tof b23 c17
tof b23 a9
tof b23 a10
tof b23 c31
tof b23 c19
tof b23 c18
tof b23 c14
tof b23 c21
tof b23 c24
tof b23 b18
tof b23 a17
tof b23 b25
tof b23 c20
tof b23 a22
tof b23 a7
tof b23 b11
tof b23 a29
tof b23 c22
tof b23 b17
tof b23 b10
tof b23 a15
tof b23 c1
tof b23 b27
tof b23 c16
tof b23 c29
tof b23 b0
tof b23 b15
tof b23 b28
tof b23 a1
tof b23 c30
tof b23 a6
tof b23 c8
tof b23 a27
tof b23 c28
tof b23 c7
tof b23 c4
tof b23 a19
tof c23 a0
tof b9 c23
tof b9 a22
tof b12 a0
tof b12 c23
tof b12 a22
tof b9 a24
tof b9 b19
tof b9 c12
tof b12 a11
tof a0 c26
tof a22 a8
tof b9 b20
tof b12 c11
tof b12 b21
tof b9 a4
tof b9 b13
tof b9 c17
tof b9 a9
tof b9 a10
tof b9 c31
tof b9 c19
tof b9 c18
tof b9 c14
tof b9 c21
tof b9 c24
tof b9 b18
tof b9 a17
tof b12 b30
tof b9 b25
tof b9 c20
tof b9 a7
tof b9 b11
tof b9 a28
tof b9 c13
tof b9 a16
tof b12 b31
tof a25 b20
tof a25 a7
tof c10 a3
tof a30 a14
tof a30 c3
tof a30 c0
tof a18 a21
tof a26 a20
tof a26 a24
tof a26 a14
tof a26 c3
tof a26 c0
tof a26 a13
tof a26 c5
tof a26 c12
tof a26 a8
tof a26 b3
tof a26 b13
tof a26 a9
tof a26 a10
tof a26 a30
tof a26 c31
tof a26 c19
tof a26 c18
tof a26 c14
tof a26 c21
tof a26 c24
tof a26 b18
tof a26 a17
tof a26 b5
tof a26 a2
tof a26 b25
tof a26 a22
tof a26 a7
tof a26 a12
tof a26 b7
tof a26 b9
tof a26 b12
tof a26 b30
tof a26 b16
tof a26 b4
tof a26 b1
tof a20 a5
tof c6 b31
tof c6 b24
tof b26 b31
tof b31 a11
tof b31 a8
tof b31 c11
tof b31 b21
tof b31 a2
tof b31 a22
tof c6 a26
tof c6 b1
T c6
T* b26
T* b1
T a26
T* b14
T* a20
T* a5
T b24
T* a18
T* a21
T* c25
T b4
T* c10
T* b16
T b30
T b12
T b31
T a3
P b9
T b9
T* b7
T* a16
T* c13
T* b23
T* a19
T* c4
T* c7
T* c28
T* a27
T* c8
T* a6
T* c30
T* a1
T* b28
T* b15
T* b0
T* c29
T* c16
T* b27
T* c1
T* a15
T* b10
T* b17
T* c22
T* a29
T* a28
T a12
T* a25
T* b11
T a7
T* a22
T* c20
T* b25
T* c23
T* a2
T* b5
T* a17
T* b18
T* c24
T* c21
T* c14
T* c18
T* c19
T* c31
T* a30
T* a10
T* a9
T* c17
T* b13
T* a4
T* b21
T* c11
T* a0
T* b3
T* b20
T a8
T c26
T* a11
T c12
T* b8
T* c5
T* a13
T* c0
T* c15
T* c27
T* a23
T* c3
T b19
T a31
T* a14
T* a24
tof a20 c6
tof a5 c6
tof b9 c6
tof c30 c6
tof b11 a25
tof a7 a25
tof c18 b1
tof a9 a26
tof b1 c6
tof a25 c6
tof b1 b26
tof a25 b26
tof a26 b1
tof b4 a20
tof c10 a20
tof b9 b14
tof a16 a20
tof c30 a5
tof a25 a26
tof a5 b14
tof a5 a20
tof a21 a18
tof b9 a5
tof c19 a18
tof a9 b24
tof b24 a5
tof a25 a5
tof a25 b24
tof a25 a18
tof c10 b4
tof b9 b4
tof a16 b4
tof a25 a21
tof c19 a21
tof c25 a21
tof b12 b16
tof b31 b30
tof b9 b16
tof a29 b16
tof a12 b30
tof a25 b16
tof b11 b16
tof a22 b30
tof b9 b12
tof a29 b12
tof a12 b31
tof b11 b12
tof a22 b31
tof b13 a3
tof b31 b12
tof a25 b12
tof a3 b31
tof a25 b31
tof a25 a3
tof b0 b9
tof b0 b7
tof b0 a16
tof b0 c13
tof b0 b23
tof b0 a19
tof b0 c4
tof b0 c7
tof b0 c28
tof b0 a27
tof b0 c8
tof b0 a6
tof b0 c30
tof b0 a1
tof b0 b28
tof b0 b15
tof a29 b0
tof a29 c29
tof a29 c16
tof a29 b27
tof a29 c1
tof a29 a15
tof a29 b10
tof a29 b17
tof a29 c22
tof a28 a29
tof a0 a12
tof a25 a12
tof b11 a25
tof c21 b11
tof c21 a7
tof c21 a22
tof c21 c20
tof c21 b25
tof c21 c23
tof c21 a2
tof c21 b5
tof c21 a17
tof c21 b18
tof c21 c24
tof c14 c21
tof a4 c14
tof b3 c19
tof a4 c18
tof a4 c19
tof a4 c31
tof a14 a30
tof a4 a30
tof a4 a10
tof a4 a9
tof a23 b13
tof a4 c17
tof a4 b13
tof a14 c0
tof a14 c3
tof b13 a23
tof a30 a14
tof a30 c0
tof a30 c3
tof c19 b3
tof c21 c14
tof c14 b3
tof c14 c31
tof c14 a9
tof c14 a23
tof c14 a4
tof c14 c18
tof c14 c19
tof c14 c0
tof c14 b13
tof c14 c3
tof c14 a30
tof c14 a14
tof c14 c17
tof c14 a10
tof b18 a13
tof b18 a31
tof c23 c26
tof a22 c11
tof c20 a8
tof b11 a7
tof a25 b11
tof b11 b3
tof b11 b5
tof b11 a9
tof a12 a0
tof b11 a23
tof b11 a4
tof b11 c11
tof b11 c19
tof b11 a8
tof b11 c26
tof b11 c12
tof b11 a13
tof b11 c0
tof b11 b13
tof b11 c3
tof b11 b19
tof b11 a31
tof b11 a30
tof b11 a14
tof b11 b18
tof b11 c20
tof b11 c23
tof b11 c14
tof b11 c17
tof b11 a10
tof b11 c31
tof b11 c18
tof b11 c21
tof b11 c24
tof b11 a17
tof b11 a2
tof b11 b25
tof b11 a22
tof a29 a28
tof a15 a8
tof a15 c26
tof b17 c12
tof b27 b20
tof b27 b8
tof b0 c29
tof b0 c16
tof b0 a28
tof b0 b20
tof b0 a8
tof b0 c26
tof b0 c12
tof b0 b8
tof c29 c15
tof b0 c1
tof b0 a29
tof b0 b10
tof b0 c22
tof b0 b17
tof b0 a15
tof b0 b27
tof a19 b19
tof b9 a16
tof b9 b7
tof b9 c16
tof b9 a28
tof b9 b20
tof b9 a8
tof b9 c26
tof b9 c12
tof b9 b8
tof b9 c15
tof b9 b19
tof a16 a31
tof b9 c1
tof b9 a29
tof b9 b10
tof b9 c22
tof b9 b17
tof b9 a15
tof b9 b27
tof b9 c29
tof b9 b15
tof b9 a1
tof b9 a6
tof b9 a27
tof b9 c7
tof b9 a19
tof b9 b0
tof b9 c13
tof b9 b23
tof b9 c4
tof b9 c28
tof b9 c8
tof b9 c30
tof b9 b28
tof b31 a3
tof b12 a3
tof b12 b31
tof b12 a0
tof b12 a12
tof b12 c5
tof a21 c25
tof b4 c10
tof b4 c27
tof a5 b24
tof a18 a24
tof a20 c10
tof a20 c27
tof a20 b4
tof b1 a26
tof b26 b21
tof b26 a11
H a24
tof a5 a23
tof c25 a23
tof a3 a9
tof a3 a14
tof a3 b3
tof a3 a18
tof a3 b11
tof a2 c23
tof c11 b5
tof a4 c23
tof a3 b18
tof c24 b26
tof c25 b26
tof a3 c20
tof a3 a7
tof a3 a0
tof a3 b0
tof a3 b30
tof c22 b10
tof c10 c16
tof a3 b10
tof a3 c1
tof c10 b9
tof c10 b28
tof c10 c30
tof c10 c8
tof c10 c28
tof c10 c4
tof c10 b23
tof c10 c13
tof c10 b7
tof c25 b14
tof c10 b16
tof c10 a20
tof b24 c6
tof a16 c6
tof c10 a16
tof a3 b4
tof c10 a19
tof c10 c7
tof c10 a27
tof c10 a6
tof c10 a1
tof a3 c29
tof c10 b15
tof c10 b27
tof a3 c22
tof c10 a15
tof c10 b17
tof a2 a22
tof c11 a22
tof a4 a22
tof a3 b12
tof a3 a25
tof a3 b25
tof a3 a2
tof a3 a17
tof a3 c24
tof a3 c21
tof a3 c18
tof a3 c31
tof a3 a10
tof a3 c17
tof a3 c14
tof a3 a29
tof a3 b31
tof c10 a21
tof c25 a5
tof a26 b1
tof a5 a21
tof a3 a5
tof c10 b19
tof a3 a30
tof a3 a31
tof a4 c3
tof a3 c3
tof a3 b13
tof a4 c27
tof a3 c27
tof c10 c0
tof a3 c15
tof a3 a13
tof a3 c5
tof a3 b8
tof a3 c12
tof c11 c26
tof a4 c26
tof a3 a11
tof a3 c26
tof a3 a8
tof a3 b20
tof c10 c19
tof a4 c11
tof a3 b21
tof a3 a4
tof b24 c10
tof a3 a28
tof a26 a3
tof c10 b24
tof a5 c15
tof c21 c25
tof c21 a3
tof c21 a26
tof a2 c11
tof a2 c3
tof a2 c27
tof a2 c26
tof a22 c11
tof a22 c26
tof c22 a13
tof c22 c12
tof c22 a12
tof c29 b13
tof c7 b19
tof a19 c0
tof a16 c19
tof a16 c10
tof b10 a12
tof a0 a11
tof b0 a8
tof a0 a4
tof b30 a28
tof a7 c5
tof a7 b8
tof c20 b20
tof c20 c25
tof a7 b21
tof a7 a26
tof b18 a31
tof c23 c3
tof c23 c27
tof c23 a22
tof a9 a30
tof a23 c15
tof a23 a5
tof a23 a21
T* a3
T a26
T* b1
T* c10
T c6
T* b14
T b26
T c25
T a23
P* b24
T* b24
T* a20
T* a16
T* b16
T* b7
T* a19
T* c13
T* c7
T* b23
T* a27
T* c4
T* a6
T* c28
T* a1
T* c8
T* b15
T* c30
T* b28
T* b27
T* b9
T* a15
T* c16
T* b17
T a21
T* b4
T* c29
T* c1
T* c22
T b10
T* b30
T* b12
T* b0
T* a25
T* a0
T* c11
T* a7
T* b25
T* a2
T* c20
T* a17
T* c24
T* c21
T* b18
T* c18
T* b11
T* c31
T* a18
T* a10
T* b3
T* c17
T* a14
T* c14
T* a9
T* a29
T* a5
T* b31
T* a28
T* a4
T c23
T* b21
T a22
T* b5
T* a12
T* c19
T* b20
T* a8
T* c26
T* a11
T* c12
T* b8
T* c5
T* a13
T* c0
T* c15
T* c27
T* b13
T* c3
T* b19
T* a31
T* a30
tof c10 b1
tof b24 b1
tof a16 b1
tof a5 b1
tof b6 a26
tof a7 a3
tof c21 a3
tof a7 a26
tof c21 a26
tof a7 b1
tof a16 b24
tof b24 c10
tof b24 c6
tof b24 b14
tof b24 c25
tof c20 c25
tof c24 b26
tof c21 c25
tof a5 a23
tof a0 b26
tof a0 a23
tof b4 b24
tof a0 b24
tof a16 a20
tof b16 a16
tof a19 b16
tof a19 b7
tof c7 a19
tof c7 c13
tof a27 c7
tof a27 b23
tof a6 a27
tof a6 c4
tof a1 a6
tof a1 c28
tof b15 a1
tof b15 c8
tof c30 b15
tof b27 c30
tof b27 b28
tof a15 b27
tof a15 b9
tof b17 a15
tof b11 b4
tof a10 b4
tof a5 a21
tof b17 c16
tof b4 b17
tof a0 b17
tof a0 a21
tof b11 b4
tof a10 b4
tof c29 b4
tof c22 c29
tof c22 c1
tof a0 b10
tof b12 c22
tof b12 b30
tof a25 b12
tof a25 b0
tof c11 a25
tof a17 a0
tof c9 a5
tof c11 a0
tof a7 a0
tof b25 c11
tof a5 a7
tof c18 c20
tof b6 a17
tof a2 b25
tof a17 a2
tof c24 a17
tof c21 c24
tof c18 c21
tof a4 a5
tof c23 a5
tof a22 a5
tof b5 a5
tof b6 a5
tof c18 b18
tof a5 c18
tof a5 b11
tof a4 a18
tof c23 a18
tof a22 a18
tof b5 a18
tof a5 c31
tof a5 a18
tof b6 a18
tof a5 a10
tof b6 a10
tof a4 a5
tof c23 a5
tof a22 a5
tof b5 a5
tof b6 a5
tof a5 b3
tof a5 c17
tof a5 a14
tof a5 c14
tof a5 a9
tof a5 a29
tof c23 a4
tof a22 a4
tof b5 a4
tof b6 a4
tof b31 a5
tof a4 b31
tof a22 c23
tof b5 c23
tof b6 b21
tof b6 a22
tof b5 a22
tof b6 a11
tof c9 c5
tof c9 c15
tof b6 a31
tof b5 a31
tof a22 c3
tof a12 b13
tof a22 c27
tof a12 c0
tof b5 a11
tof a4 c23
tof a4 a30
tof a4 b19
tof a4 c3
tof a4 c27
tof a4 a13
tof a4 b8
tof c23 a11
tof a4 b5
tof a4 a22
tof a5 b31
tof a9 a30
tof a9 c15
tof a14 a31
tof b3 a13
tof a14 a11
tof a14 b5
tof a10 c23
tof a18 a10
tof a10 a31
tof a18 b19
tof a18 a11
tof a10 b5
tof a10 a4
tof a18 c9
tof a18 a5
tof a18 a9
tof a18 a29
tof a18 a14
tof a18 c14
tof a18 b3
tof a18 c17
tof b11 c23
tof c18 a31
tof c18 b11
tof b18 a31
tof c18 a30
tof c18 b19
tof c18 a13
tof c18 b8
tof c23 a11
tof b18 c26
tof b11 b5
tof c18 b31
tof b11 a4
tof b11 a10
tof c18 c31
tof c24 c21
tof a17 c21
tof a17 c24
tof c21 a30
tof c21 b19
tof c21 a13
tof c21 b8
tof c21 c26
tof c21 b20
tof c21 b5
tof c21 b31
tof c21 a4
tof c21 a10
tof c21 b11
tof c21 b18
tof c21 c31
tof c21 c18
tof c20 b20
tof a2 b20
tof a2 a10
tof b25 b20
tof b25 a2
tof a2 a30
tof a10 a31
tof a2 b19
tof b25 c3
tof b25 c27
tof a2 a13
tof a2 b8
tof a10 a11
tof a2 c26
tof a10 b5
tof a10 c23
tof a2 b31
tof a10 a4
tof a10 c9
tof a10 a5
tof a10 a9
tof a10 a29
tof a10 a14
tof a10 c14
tof a10 b3
tof a10 c17
tof a2 b11
tof a2 b18
tof a2 c31
tof b25 c18
tof a2 c21
tof b25 a22
tof a2 c24
tof a2 a17
tof a7 b8
tof a7 b5
tof a7 c18
tof c11 b8
tof c11 c18
tof c11 a2
tof a0 b5
tof a0 c18
tof a0 a2
tof c11 a30
tof b5 a31
tof c11 b19
tof c11 c3
tof c11 c27
tof c18 c0
tof c11 a13
tof a7 c5
tof b5 a11
tof c11 c26
tof c11 b20
tof a2 b21
tof c18 c23
tof c11 b31
tof c18 a4
tof c18 c9
tof c18 a5
tof c18 a9
tof c18 a29
tof c18 a14
tof c18 c14
tof c18 b3
tof c18 c17
tof c18 a10
tof a2 b6
tof c11 b11
tof c11 b18
tof c11 c31
tof c11 c21
tof c11 a22
tof c11 c24
tof c11 a17
tof c11 b25
tof a7 a18
tof b12 b0
tof b12 a25
tof a25 a30
tof a25 a31
tof a25 b19
tof a25 c3
tof a25 c27
tof a25 c0
tof a25 a13
tof a25 b8
tof a25 a11
tof b0 a8
tof a25 b20
tof a25 b31
tof a25 b11
tof a25 b18
tof a25 c31
tof a25 c18
tof a25 c21
tof a25 a22
tof a25 c24
tof a25 a17
tof a25 a0
tof a25 b25
tof a25 c11
tof b10 c0
tof c22 c0
tof c22 b30
tof c22 a30
tof c22 a31
tof c22 b19
tof c22 c3
tof b10 b13
tof c22 c27
tof c22 a13
tof c22 b8
tof c22 c12
tof c22 a11
tof c22 a8
tof c22 b20
tof b10 a12
tof b30 a28
tof c22 b31
tof c22 b11
tof c22 b18
tof c22 c31
tof c22 c18
tof c22 c21
tof c22 a22
tof c22 c24
tof c22 a17
tof c22 a0
tof c22 b25
tof c22 c11
tof c22 b0
tof c22 a25
tof c22 b12
tof c29 b13
tof c29 c1
tof b4 c1
tof b4 c29
tof c29 a30
tof c29 a31
tof c29 b19
tof c29 c3
tof c29 c27
tof c29 b8
tof c29 a11
tof c29 a8
tof c29 b20
tof c29 a12
tof c29 a28
tof c29 b31
tof c29 b11
tof c29 b18
tof c29 c31
tof c29 c18
tof c29 c21
tof c29 a22
tof c29 c24
tof c29 a17
tof c29 a0
tof c29 b25
tof c29 c11
tof c29 b0
tof c29 a25
tof c29 b30
tof c29 b12
tof c29 b10
tof c29 c22
tof b17 a30
tof b17 b19
tof b17 c3
tof b17 c27
tof b17 b8
tof b17 a8
tof b17 b20
tof b17 a12
tof b27 a15
tof b27 b9
tof a15 a30
tof a15 b19
tof a15 c3
tof a15 c27
tof a15 b8
tof a15 a8
tof a15 a12
tof a15 b17
tof a15 c16
tof c30 b28
tof b15 b28
tof b15 c30
tof c30 a30
tof c30 b19
tof c30 c3
tof c30 c27
tof c30 b8
tof c30 a8
tof b28 c19
tof c30 a12
tof c30 b17
tof c30 c16
tof c30 a15
tof c30 b9
tof c30 b27
tof a1 c8
tof a1 a30
tof a1 b19
tof a1 c27
tof a1 b8
tof a1 a8
tof a1 c19
tof a1 a12
tof a1 b17
tof a1 c16
tof a1 a15
tof a1 b9
tof a1 b27
tof a1 b28
tof a1 c30
tof a1 b15
tof a6 c27
tof a27 a6
tof a27 c4
tof a6 a30
tof a6 b19
tof a6 b8
tof a6 a8
tof a6 c19
tof a6 a12
tof a6 b17
tof a6 c16
tof a6 a15
tof a6 b9
tof a6 b27
tof a6 b28
tof a6 c30
tof a6 b15
tof a6 c8
tof a6 a1
tof a6 c28
tof c7 b23
tof c7 a30
tof c7 b19
tof c7 a8
tof c7 c19
tof c7 a12
tof c7 b17
tof c7 c16
tof c7 a15
tof c7 b9
tof c7 b27
tof c7 b28
tof c7 c30
tof c7 b15
tof c7 c8
tof c7 a1
tof c7 c28
tof c7 a6
tof c7 c4
tof c7 a27
tof a19 a12
tof b16 a19
tof b16 b7
tof a12 b13
tof a12 c0
tof a19 c19
tof a19 b17
tof a19 c16
tof a19 a15
tof a19 b9
tof a19 b27
tof a19 b28
tof a19 c30
tof a19 b15
tof a19 c8
tof a19 a1
tof a19 c28
tof a19 a6
tof a19 c4
tof a19 a27
tof a19 b23
tof a19 c7
tof a19 c13
tof a16 b17
tof b24 b17
tof b17 a30
tof b17 b19
tof b17 c3
tof b17 b13
tof b17 c27
tof b17 c0
tof b17 b8
tof b24 a11
tof b17 a8
tof b17 b20
tof a16 c19
tof b17 a12
tof b24 b31
tof b17 c9
tof b17 a5
tof b17 a9
tof b17 a29
tof b17 a14
tof b17 c14
tof b17 b3
tof b17 c17
tof b17 a10
tof b24 b11
tof b24 b18
tof b24 c31
tof b24 c18
tof b24 c21
tof b24 a22
tof b24 c24
tof b24 a17
tof b24 a0
tof b24 b25
tof b24 c11
tof b24 b0
tof b24 a25
tof b24 b30
tof b24 b12
tof b24 b10
tof b24 c22
tof b24 c1
tof b24 c29
tof a16 c16
tof a16 a15
tof a16 b9
tof a16 b27
tof a16 b28
tof a16 c30
tof a16 b15
tof b24 b4
tof a16 c8
tof a16 a1
tof a16 c28
tof a16 a6
tof a16 c4
tof a16 a27
tof a16 b23
tof a16 c7
tof a16 c13
tof a16 a19
tof a16 b7
tof a16 b16
tof c25 b31
tof b26 b31
tof c25 b11
tof c25 b18
tof c25 c31
tof c25 c18
tof c25 c21
tof c25 a22
tof c25 c24
tof c25 a17
tof c25 a0
tof c25 b25
tof c25 c11
tof c25 b0
tof c25 a25
tof c25 b30
tof c25 b12
tof c25 b10
tof c25 c22
tof c25 c1
tof c25 c29
tof c25 c16
tof c25 a15
tof c25 b9
tof c25 b27
tof c25 b28
tof c25 c30
tof c25 b15
tof c25 b4
tof c25 c8
tof c25 a1
tof c25 c28
tof c25 a6
tof c25 c4
tof c25 a27
tof c25 b23
tof c25 c7
tof c25 c13
tof c25 a19
tof c25 b7
tof c25 b16
tof c25 a16
tof c25 b24
tof c25 a20
tof c10 a30
tof c10 a31
tof c10 b19
tof c10 b13
tof c10 c0
tof c10 b8
tof c10 a11
tof c10 a8
tof c10 b20
tof c10 b21
tof c10 a21
tof c10 c9
tof c10 a5
tof c10 a9
tof c10 a29
tof c10 a14
tof c10 c14
tof c10 b3
tof c10 c17
tof c10 a10
tof c10 a23
tof c10 b11
tof c10 b18
tof c10 c31
tof c10 c18
tof c10 c21
tof c10 c24
tof c10 a17
tof c10 b26
tof c10 b25
tof c10 c11
tof c10 b0
tof c10 a25
tof c10 b30
tof c10 b12
tof c10 c22
tof c10 c1
tof c10 c29
tof c10 b4
tof c10 b24
tof c10 c20
tof c10 a4
tof c10 a2
tof a26 a2
tof a3 b1
tof a3 a2
tof a2 a30
tof a2 a31
tof a2 b19
tof a2 b13
tof a2 c0
tof a2 b8
tof a2 a11
tof a2 a8
tof a2 b20
tof a2 b21
tof a2 a21
tof a2 c9
tof a2 a5
tof a2 a9
tof a2 a29
tof a2 a14
tof a2 c14
tof a2 b3
tof a2 c17
tof a2 a10
tof a2 a23
tof a2 b11
tof a2 b18
tof a2 c31
tof a2 c18
tof a2 c21
tof a2 c24
tof a2 a17
tof a2 b26
tof a2 b25
tof a2 c11
tof a2 b0
tof a2 a25
tof a2 b30
tof a2 b12
tof a2 c22
tof a2 c1
tof a2 c29
tof a2 b4
tof a2 b24
tof a2 b6
tof a3 a7
tof a3 a18
T* a26
T* a3
T* a18
T a7
T* c10
T* c6
T* a2
T a4
T* b6
T c20
T b1
T* c25
T b14
T* a20
T* b24
T* a16
T* b16
T* b7
T* a19
T* c13
T* c7
T* b23
T* a27
T* c4
T* a6
T* c28
T* a1
T* c8
T* b4
T* b15
T* c30
T* b28
T* b27
T* b9
T* a15
T* c16
T* c29
T* c1
T* c22
T* b10
T* b12
T* b30
T* a25
T* b0
T* c11
T* b25
T a0
T* b26
T* a17
T* c24
T* a22
T* c21
T* c18
T* c31
T* b18
T* b11
T* a23
T b17
T* a10
T* c17
T* b3
T* c14
T* a14
T* a29
T* a9
T* a5
T* c9
T* a21
T* b31
T* a28
T* c23
T b21
T* b5
T* a12
T* c19
T* b20
T* a8
T* c26
T* a11
T* c12
T* b8
T* c5
T* a13
T* c0
T* c15
T* c27
T* b13
T* c3
T* b19
T a31
T* a30
tof c10 a3
tof b6 a3
tof a10 a18
tof c9 a18
tof a3 a26
tof a18 a3
tof a7 a18
tof a4 a2
tof b6 a2
tof a0 a2
tof b11 a2
tof a2 c10
tof a2 c6
tof a0 a4
tof c21 c20
tof c20 a2
tof b11 a2
tof b6 a4
tof b11 a4
tof c20 b6
tof b11 b6
tof b14 c25
tof b11 c20
tof b1 c20
tof b11 b14
tof b11 a20
tof b11 b24
tof b11 a16
tof b11 b16
tof b11 b7
tof b11 a19
tof b11 c13
tof b11 c7
tof b11 b23
tof b11 a27
tof b11 c4
tof b11 a6
tof b11 c28
tof b11 a1
tof b11 c8
tof b11 b4
tof b11 b15
tof b11 c30
tof b11 b28
tof b11 b27
tof b11 b9
tof b11 a15
tof b11 c16
tof b11 c29
tof b11 c1
tof b11 c22
tof b11 b10
tof b11 b12
tof b11 b30
tof b11 a25
tof b11 b0
tof b11 c11
tof b31 b26
tof b11 b25
tof b11 a0
tof b11 b26
tof b11 a17
tof b11 c24
tof b11 a22
tof c0 c18
tof b11 c21
tof b11 c18
tof b11 c31
tof b11 b18
tof a23 b11
tof b19 a10
tof c9 b17
tof c9 a10
tof c9 c17
tof a13 b3
tof c9 b3
tof c9 c14
tof c9 a14
tof c9 a29
tof c9 a9
tof c9 a5
tof a21 c9
tof b19 c23
tof c9 a21
tof a9 c15
tof b3 a13
tof a14 b5
tof a10 c23
tof a10 b19
tof b11 a23
tof b18 c26
tof c18 c0
tof b26 b31
tof c22 c12
tof a15 b20
tof b28 c19
tof a1 c3
tof a27 c27
tof a19 a8
tof c7 b8
tof a19 a30
tof b16 a12
tof b16 b13
tof b24 a28
tof b14 a11
tof b24 a31
tof c20 b1
tof c25 a11
tof c25 b14
tof a2 b6
tof a2 b1
tof a2 c20
tof b6 a0
tof c10 c6
tof c10 b1
tof c10 a23
tof c10 b26
tof c10 a28
tof c10 a12
tof c10 c19
tof c10 b20
tof c10 a8
tof c10 c26
tof c10 a11
tof c10 c12
tof c10 b8
tof c10 c18
tof c10 c27
tof c10 b13
tof c10 c3
tof c10 a30
tof c10 c20
tof c10 b11
tof c10 b17
tof c10 c31
tof c10 c21
tof c10 c24
tof c10 a17
tof c10 b25
tof c10 c11
tof c10 a25
tof c10 b12
tof c10 c22
tof c10 c29
tof c10 a15
tof c10 b27
tof c10 c30
tof c10 b4
tof c10 a1
tof c10 a6
tof c10 a27
tof c10 c7
tof c10 a19
tof c10 b16
tof c10 b24
tof c10 b14
tof c10 a20
tof c10 a16
tof c10 b7
tof c10 c13
tof c10 b23
tof c10 c4
tof c10 c28
tof c10 c8
tof c10 b15
tof c10 b28
tof c10 b9
tof c10 c16
tof c10 c1
tof c10 b10
tof c10 b30
tof c10 b0
tof c10 a4
tof c10 b6
tof c10 b31
tof c10 a22
tof c10 c0
tof c10 b18
tof a18 a7
tof a3 a7
tof a3 a21
tof a3 c23
tof a3 b5
tof a3 c5
tof a3 b3
tof a3 c15
tof a3 a10
tof a3 c20
tof a3 c9
tof a3 a5
tof a3 a29
tof a3 c14
tof a3 c17
tof a3 b17
tof a3 b19
tof a3 a13
tof a3 a14
tof a3 a9
H a30
H a31
H a10
H c3
H b13
H c27
H c15
H c18
H b3
H c5
H b8
H c12
H a11
tof b1 a3
tof b1 a9
tof b1 a14
tof b1 a13
tof b1 b19
tof b1 c10
tof b1 b18
tof b1 c0
tof b1 a22
tof a17 b6
tof b1 a2
tof b1 b31
tof b1 b6
tof a7 a4
tof a7 b0
tof a7 b30
tof a7 b10
tof a7 c1
tof a7 c16
tof a7 b9
tof a7 b28
tof a7 b15
tof a7 c8
tof a7 c28
tof a7 c4
tof a7 b23
tof a7 c13
tof a7 b7
tof a7 a16
tof a7 a20
tof a7 c25
tof a7 c6
tof b14 a26
tof a7 a26
tof a7 b14
tof a7 b24
tof a7 b16
tof a7 a19
tof a7 c7
tof a7 a27
tof a7 a6
tof a7 a1
tof a7 b4
tof a7 c30
tof a7 b27
tof a7 a15
tof a7 c29
tof a7 c22
tof a7 b12
tof a7 a25
tof a7 c11
tof a7 b25
tof a7 a0
tof b1 c24
tof b1 c21
tof b1 c31
tof b1 b17
tof b1 c17
tof b1 c14
tof b1 a29
tof b1 a5
tof b1 c9
tof b1 b11
tof b1 c20
tof a7 a18
tof b1 c26
tof b1 b20
tof b1 c19
tof b1 a12
tof b1 c23
tof a7 b5
tof a7 b21
tof a7 b26
tof b1 a28
tof b1 a21
tof b1 a23
tof a17 a28
tof a17 a7
tof c24 b1
tof b25 b5
tof a25 b21
tof b10 b26
tof a4 a17
tof b31 c23
tof b6 a28
tof a2 a23
tof b31 b1
tof b18 b20
tof c0 a12
tof a13 c26
tof c10 a21
tof a14 c19
T* b14
T a26
T* c6
T* b24
T* c25
T* b16
T* a20
T* a19
T* a16
T* c7
T* b7
T* a27
T* c13
T* a6
T* b23
T* a1
T* c4
T* b4
T* c28
T* c30
T* c8
T* b27
T* b15
T* a15
T* b28
T* c29
T* b9
T* c22
T* c16
T* b12
T* c1
T* a25
T* b10
T* c11
T* b30
T* b25
T* b0
T* a0
T* a4
T* a7
T a17
T* a18
T b6
T* b31
T* c24
T b1
T* a2
T* c21
T* a22
T* c31
T* c0
T* b17
T* b18
T* c17
T* c10
T* c14
T* b19
T* a29
T* a13
T* a5
T* a14
T* c9
T* a9
T* b11
T* a3
T* c20
T* a23
T* a21
T* b26
T* a28
T* c23
T* b21
T* b5
T* a12
T* c19
T* b20
T* c26
tof a7 a4
tof a17 a4
tof a26 b14
tof a4 a26
tof a4 c6
tof a4 b24
tof a4 c25
tof a4 b16
tof a4 a20
tof a4 a19
tof a4 a16
tof a4 c7
tof a4 b7
tof a4 a27
tof a4 c13
tof a4 a6
tof a4 b23
tof a4 a1
tof a4 c4
tof a4 b4
tof a4 c28
tof a4 c30
tof a4 c8
tof a4 b27
tof a4 b15
tof a4 a15
tof a4 b28
tof a4 c29
tof a4 b9
tof a4 c22
tof a4 c16
tof a4 b12
tof a4 c1
tof a4 a25
tof a4 b10
tof a4 c11
tof a4 b30
tof a4 b25
tof b6 a7
tof b31 a7
tof c24 a7
tof b1 a7
tof a4 b0
tof a4 a0
tof a7 a4
tof b6 a17
tof b31 a17
tof c24 a17
tof b1 a17
tof a17 a7
tof a18 a17
tof b1 c24
tof b31 b6
tof c24 b6
tof c24 b31
tof a14 b31
tof a14 b1
tof a14 a2
tof a14 c21
tof a14 a22
tof a14 c31
tof a14 c0
tof a14 b17
tof a14 b18
tof a14 c17
tof a21 c10
tof a14 c10
tof a14 c14
tof a14 b19
tof a14 a29
tof a14 a13
tof a14 a5
tof c9 a14
tof b11 c9
tof b11 a9
tof c20 b11
tof c20 a3
tof b11 c20
tof b11 a3
tof c9 a9
tof a14 a9
tof a14 c9
tof c9 c20
tof c9 a3
tof c9 b11
tof a13 c26
tof c10 a21
tof b18 b20
tof c0 a12
tof a2 a23
tof c24 b1
tof b31 b1
tof b31 a21
tof b31 c20
tof b31 a23
tof b31 c10
tof c24 c23
tof b31 a12
tof b31 c19
tof b31 b20
tof b31 c26
tof b31 b18
tof b31 b11
tof b31 c9
tof b31 a14
tof b31 a5
tof b31 a29
tof b31 c14
tof b31 c17
tof b31 b17
tof b31 c31
tof b31 c21
tof b31 a2
tof b31 c0
tof b31 a13
tof b31 a3
tof b31 b19
tof b31 a22
tof b31 a9
tof a17 a18
tof a7 a18
tof a7 a17
tof a4 a18
tof a4 a28
tof a4 a17
tof a4 b6
tof b25 b5
tof b10 b26
tof a25 b21
tof b14 a26
H c26
H a8
H b20
H c19
H a12
H b5
H b21
H c23
H a28
H b26
H c10
H a23
H c20
H a18
tof a3 a13
tof a13 a3
tof a3 a13
tof a13 b0
tof b0 a13
tof a13 b0
tof b0 a26
tof a26 b0
tof b0 a26
tof a26 b7
tof b7 a26
tof a26 b7
tof b7 a1
tof a1 b7
tof b7 a1
tof a1 a9
tof a9 a1
tof a1 a9
tof a9 a2
tof a2 a9
tof a9 a2
tof a2 b31
tof b31 a2
tof a2 b31
tof b31 a17
tof a17 b31
tof b31 a17
tof a17 c16
tof c16 a17
tof a17 c16
tof c16 c12
tof c12 c16
tof c16 c12
tof c12 c18
tof c18 c12
tof c12 c18
tof c18 c26
tof c26 c18
tof c18 c26
tof c26 a28
tof a28 c26
tof c26 a28
tof a28 a20
tof a20 a28
tof a28 a20
tof a20 b15
tof b15 a20
tof a20 b15
tof b15 a25
tof a25 b15
tof b15 a25
tof a25 c13
tof c13 a25
tof a25 c13
tof c13 b3
tof b3 c13
tof c13 b3
tof b3 a19
tof a19 b3
tof b3 a19
tof a19 b28
tof b28 a19
tof a19 b28
tof b28 a14
tof a14 b28
tof b28 a14
tof a14 b30
tof b30 a14
tof a14 b30
tof b30 b11
tof b11 b30
tof b30 b11
tof b11 a15
tof a15 b11
tof b11 a15
tof a15 b10
tof b10 a15
tof a15 b10
tof b10 b27
tof b27 b10
tof b10 b27
tof b27 a5
tof a5 b27
tof b27 a5
tof a5 a21
tof a21 a5
tof a5 a21
tof a21 c8
tof c8 a21
tof a21 c8
tof c8 c3
tof c3 c8
tof c8 c3
tof c3 b2
tof b2 c3
tof c3 b2
tof b2 b16
tof b16 b2
tof b2 b16
tof b16 c11
tof c11 b16
tof b16 c11
tof c11 c15
tof c15 c11
tof c11 c15
tof c15 b8
tof b8 c15
tof c15 b8
tof b8 b4
tof b4 b8
tof b8 b4
tof b4 c7
tof c7 b4
tof b4 c7
tof c7 a10
tof a10 c7
tof c7 a10
tof a10 c24
tof c24 a10
tof a10 c24
tof c24 b21
tof b21 c24
tof c24 b21
tof b21 c21
tof c21 b21
tof b21 c21
tof c21 c19
tof c19 c21
tof c21 c19
tof c19 a8
tof a8 c19
tof c19 a8
tof a8 a22
tof a22 a8
tof a8 a22
tof a22 c28
tof c28 a22
tof a22 c28
tof c28 c10
tof c10 c28
tof c28 c10
tof c10 c27
tof c27 c10
tof c10 c27
tof c27 b26
tof b26 c27
tof c27 b26
tof b26 a29
tof a29 b26
tof b26 a29
tof a29 c25
tof c25 a29
tof a29 c25
tof c25 c23
tof c23 c25
tof c25 c23
tof c23 b5
tof b5 c23
tof c23 b5
tof b5 a27
tof a27 b5
tof b5 a27
tof a27 a16
tof a16 a27
tof a27 a16
tof a16 c1
tof c1 a16
tof a16 c1
tof c1 b29
tof b29 c1
tof c1 b29
tof b29 c9
tof c9 b29
tof b29 c9
tof c9 b13
tof b13 c9
tof c9 b13
tof b13 c22
tof c22 b13
tof b13 c22
tof c22 a12
tof a12 c22
tof c22 a12
tof a12 a7
tof a7 a12
tof a12 a7
tof a7 c0
tof c0 a7
tof a7 c0
tof c0 c2
tof c2 c0
tof c0 c2
tof c2 b22
tof b22 c2
tof c2 b22
tof b22 c31
tof c31 b22
tof b22 c31
tof c31 a18
tof a18 c31
tof c31 a18
tof a18 b9
tof b9 a18
tof a18 b9
tof b9 c30
tof c30 b9
tof b9 c30
tof c30 c20
tof c20 c30
tof c30 c20
tof c20 b20
tof b20 c20
tof c20 b20
tof b20 b1
tof b1 b20
tof b20 b1
tof b1 b24
tof b24 b1
tof b1 b24
tof b24 c17
tof c17 b24
tof b24 c17
tof c17 a11
tof a11 c17
tof c17 a11
tof a11 a4
tof a4 a11
tof a11 a4
tof a4 b19
tof b19 a4
tof a4 b19
tof b19 b6
tof b6 b19
tof b19 b6
tof b6 a6
tof a6 b6
tof b6 a6
tof a6 b18
tof b18 a6
tof a6 b18
tof b18 a0
tof a0 b18
tof b18 a0
tof c4 a24
tof a24 c4
tof c4 a24
tof a24 b23
tof b23 a24
tof a24 b23
tof b23 b17
tof b17 b23
tof b23 b17
tof b17 b25
tof b25 b17
tof b17 b25
tof b25 c14
tof c14 b25
tof b25 c14
tof c14 c5
tof c5 c14
tof c14 c5
tof c5 a30
tof a30 c5
tof c5 a30
tof a30 c6
tof c6 a30
tof a30 c6
tof c6 a31
tof a31 c6
tof c6 a31
tof a31 b14
tof b14 a31
tof a31 b14
tof b14 b12
tof b12 b14
tof b14 b12
tof b12 c29
tof c29 b12
tof b12 c29
tof c29 a23
tof a23 c29
tof c29 a23
END
