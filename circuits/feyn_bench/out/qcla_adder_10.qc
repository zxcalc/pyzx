# Feynman -- quantum circuit toolkit
# Original (qcla_adder_10.qc):
#   Qubits: 36
#   H: 50
#   T: 238
#   cnot: 267
#   Depth: 73
#   T depth: 24
# Result (337.274ms):
#   Qubits: 36
#   H: 50
#   S: 10
#   T: 162
#   cnot: 214
#   Depth: 82
#   T depth: 29
.v a0 b0 c0 a1 b1 c1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6 c6 d6 a7 b7 c7 a8 b8 c8 d8 a9 b9 c9 e
.i a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 a6 b6 a7 b7 a8 b8 a9 b9
.o a0 b0 c0 a1 b1 c1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6 c6 d6 a7 b7 c7 a8 b8 c8 d8 a9 b9 c9 e
BEGIN 
H c0
H c1
H c2
H d2
H c3
H c4
H d4
H c5
H d5
H c6
H d6
H c7
H c8
H d8
H c9
T c0
cnot a0 c0
T* c0
cnot b0 c0
T c0
cnot a0 c0
T* c0
cnot b0 c0
cnot a9 b9
cnot a8 b8
cnot a7 b7
cnot a6 b6
cnot a5 b5
cnot a4 b4
cnot a3 b3
cnot a2 b2
cnot a1 b1
H c0
T c2
cnot b2 c2
T* c2
cnot b3 c2
T c2
cnot b2 c2
T* c2
cnot b3 c2
H c2
T d2
cnot a2 d2
T* d2
cnot b2 d2
T* d2
cnot a2 d2
T d2
cnot b2 d2
H d2
T c4
cnot b4 c4
T* c4
cnot b5 c4
T c4
cnot b4 c4
T* c4
cnot b5 c4
H c4
T d4
cnot a4 d4
T* d4
cnot b4 d4
T* d4
cnot a4 d4
T d4
cnot b4 d4
H d4
T c6
cnot b6 c6
T* c6
cnot b7 c6
T c6
cnot b6 c6
T* c6
cnot b7 c6
H c6
T d6
cnot a6 d6
T* d6
cnot b6 d6
T* d6
cnot a6 d6
T d6
cnot b6 d6
H d6
T c8
cnot b8 c8
T* c8
cnot b9 c8
T c8
cnot b8 c8
T* c8
cnot b9 c8
H c8
T d8
cnot a8 d8
T* d8
cnot b8 d8
T* d8
cnot a8 d8
T d8
cnot b8 d8
H d8
cnot a1 c1
T* c1
cnot b1 c1
T* c1
cnot a1 c1
S c1
cnot c0 c1
T* c1
cnot b1 c1
T c1
cnot c0 c1
H c1
T* c5
cnot c4 c5
T c5
cnot c6 c5
T* c5
cnot c4 c5
T c5
cnot c6 c5
H c5
cnot a5 d5
T* d5
cnot b5 d5
T* d5
cnot a5 d5
S d5
cnot d4 d5
T* d5
cnot b5 d5
T d5
cnot d4 d5
H d5
T c3
cnot a3 c3
T* c3
cnot b3 c3
T* c3
cnot a3 c3
S c3
cnot c1 c3
cnot b3 c3
T* c3
cnot c2 c3
T c3
cnot c1 c3
T* c3
cnot d2 c3
cnot c2 c3
T c3
cnot b3 c3
T* c3
cnot d2 c3
cnot b3 c3
H c3
T d5
cnot c6 d5
T* d5
cnot c7 d5
T d5
cnot c6 d5
T* d5
cnot c7 d5
H d5
cnot a7 c7
T* c7
cnot b7 c7
T* c7
cnot a7 c7
S c7
cnot c3 c7
cnot b7 c7
T c7
cnot c5 c7
T* c7
cnot c3 c7
T c7
cnot d6 c7
cnot c5 c7
T c7
cnot b7 c7
T* c7
cnot c6 c7
cnot d6 c7
cnot b7 c7
T* c7
cnot c6 c7
H c7
T d5
cnot c3 d5
T* d5
cnot c4 d5
T d5
cnot c3 d5
T* d5
cnot c4 d5
H d5
T* d2
cnot b3 d2
T d2
cnot b3 d2
H d2
T* d4
cnot b5 d4
T d4
cnot b5 d4
H d4
T* d6
cnot b7 d6
T d6
cnot b7 d6
H d6
T* d8
cnot b9 d8
T d8
cnot c9 d8
T* d8
cnot b9 d8
T d8
cnot c9 d8
H d8
T* c5
cnot c3 c5
T c5
cnot c3 c5
H c5
T c2
cnot c1 c2
T* c2
cnot c1 c2
H c2
T c4
cnot c5 c4
T* c4
cnot c6 c4
T c4
cnot c5 c4
cnot c3 c4
cnot c6 c4
T* c4
cnot c3 c4
H c4
T c6
cnot c5 c6
T* c6
cnot c5 c6
H c6
T c8
cnot c7 c8
T* c8
cnot c9 c8
T c8
cnot c7 c8
T* c8
cnot c9 c8
H c8
T* d2
cnot b2 d2
T d2
cnot c1 d2
T* d2
cnot b2 d2
T d2
cnot c1 d2
H d2
T* d4
cnot b4 d4
T d4
cnot c3 d4
T* d4
cnot b4 d4
T d4
cnot c3 d4
H d4
T* d6
cnot b6 d6
T d6
cnot d5 d6
T* d6
cnot b6 d6
T d6
cnot d5 d6
H d6
T* d8
cnot b8 d8
T d8
cnot c7 d8
T* d8
cnot b8 d8
T d8
cnot c7 d8
H d8
T c9
cnot a9 c9
T* c9
cnot b9 c9
T* c9
cnot a9 c9
S c9
cnot c7 c9
cnot b9 c9
T* c9
cnot c7 c9
H c9
T c5
H c5
T c2
cnot b2 c2
T* c2
cnot b3 c2
T c2
cnot b2 c2
T* c2
cnot b3 c2
H c2
T c4
cnot b4 c4
T* c4
cnot b5 c4
T c4
cnot b4 c4
T* c4
cnot b5 c4
H c4
T c6
cnot b6 c6
T* c6
cnot b7 c6
T c6
cnot b6 c6
T* c6
cnot b7 c6
H c6
T c8
cnot b8 c8
T* c8
cnot b9 c8
T c8
cnot b8 c8
T* c8
cnot b9 c8
H c8
T a0
T b0
cnot a0 b0
T* b0
T a1
S* b1
cnot a1 b1
T b1
T a2
T a3
cnot a2 b2
T b2
cnot a3 b3
T b3
cnot b2 b3
cnot a3 b3
cnot a2 b3
S* b3
T a4
T a5
cnot a4 b4
T b4
cnot a5 b5
T b5
cnot b4 b5
cnot a5 b5
cnot a4 b5
S* b5
T a6
T a7
cnot a6 b6
T b6
cnot a7 b7
T b7
cnot b6 b7
cnot a7 b7
cnot a6 b7
S* b7
T a8
T a9
cnot a8 b8
T b8
cnot a9 b9
T b9
cnot b8 b9
cnot a9 b9
cnot a8 b9
S* b9
T* c0
cnot b1 c0
cnot a1 c0
T c0
T* c3
cnot b4 c3
cnot a4 c3
T c3
T* d5
cnot b6 d5
cnot a6 d5
T d5
cnot b2 c1
cnot a2 c1
T c1
cnot b8 c7
cnot a8 c7
T c7
cnot b8 b9
cnot b9 c8
cnot b6 b7
cnot b7 d6
cnot b5 d4
cnot b2 b3
cnot b4 d4
cnot b3 d2
cnot b4 b5
cnot b0 e
cnot a9 b9
cnot a7 b7
cnot a6 b7
cnot a6 d6
cnot a8 c8
cnot a8 b9
cnot a5 b5
cnot a4 b5
cnot a4 d4
cnot a3 b3
cnot a2 d2
cnot a2 b3
cnot a0 b0
END
