# Feynman -- quantum circuit toolkit
# Original (qcla_mod_7.qc):
#   Qubits: 26
#   H: 82
#   T: 413
#   X: 7
#   cnot: 441
#   Depth: 197
#   T depth: 66
# Result (216.999ms):
#   Qubits: 26
#   H: 82
#   S: 24
#   T: 237
#   X: 7
#   cnot: 360
#   Depth: 192
#   T depth: 67
.v e a0 b0 c0 d0 a1 b1 c1 d1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6
.i a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 a6 b6
.o e a0 b0 c0 d0 a1 b1 c1 d1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6
BEGIN 
H e
H c0
H d0
H c1
H d1
H c2
H d2
H c3
H c4
H d4
H c5
H d5
T c0
cnot b0 c0
cnot a0 c0
T* c0
cnot b1 c0
cnot a1 c0
T c0
cnot b0 c0
cnot a0 c0
T* c0
cnot b1 c0
cnot a6 b6
cnot a5 b5
cnot a4 b4
cnot a3 b3
cnot a1 c0
cnot a2 b2
cnot a1 b1
cnot a0 b0
H c0
T d0
cnot a0 d0
T* d0
cnot b0 d0
T* d0
cnot a0 d0
T d0
cnot b0 d0
H d0
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
T c1
cnot c0 c1
T* c1
cnot c2 c1
T c1
cnot c0 c1
T* c1
cnot c2 c1
H c1
S d1
cnot a1 d1
T* d1
cnot b1 d1
T* d1
cnot a1 d1
cnot d0 d1
T d1
cnot b1 d1
T* d1
cnot d0 d1
H d1
T c5
cnot b6 c5
T* c5
cnot c4 c5
T c5
cnot b6 c5
T* c5
cnot c4 c5
H c5
S d5
cnot a5 d5
T* d5
cnot b5 d5
T* d5
cnot a5 d5
cnot d4 d5
T d5
cnot b5 d5
T* d5
cnot d4 d5
H d5
T c3
cnot c2 c3
T c3
cnot d1 c3
T* c3
cnot c2 c3
T c3
cnot a3 c3
cnot d1 c3
T* c3
cnot b3 c3
T* c3
cnot d2 c3
cnot a3 c3
T c3
cnot b3 c3
T* c3
cnot d2 c3
H c3
S* e
cnot a6 e
T* e
cnot b6 e
T* e
cnot a6 e
S e
cnot c1 e
cnot b6 e
T e
cnot c5 e
T* e
cnot c1 e
S e
cnot c3 e
T* e
cnot c5 e
T e
cnot d5 e
cnot c3 e
T e
cnot b6 e
T* e
cnot d5 e
cnot b6 e
H e
T* c3
cnot c5 c3
T c3
cnot c5 c3
H c3
T* c3
cnot c1 c3
T c3
cnot e c3
T* c3
cnot c1 c3
T c3
cnot e c3
H c3
T* d1
cnot c2 d1
T d1
cnot c2 d1
H d1
S* c1
cnot c5 c1
T c1
cnot e c1
cnot c5 c1
T c1
cnot e c1
H c1
T d0
cnot b1 d0
T* d0
cnot b1 d0
H d0
T d4
cnot b5 d4
T* d4
cnot b5 d4
H d4
S* c5
H c5
T* d5
cnot b6 d5
T d5
cnot b6 d5
H d5
T* d0
cnot b0 d0
T d0
cnot e d0
T* d0
cnot b0 d0
T d0
cnot e d0
H d0
T* d1
cnot c0 d1
T d1
cnot e d1
T* d1
cnot c0 d1
T d1
cnot e d1
H d1
T* d4
cnot b4 d4
T d4
cnot c3 d4
T* d4
cnot b4 d4
T d4
cnot c3 d4
H d4
T* d5
cnot c3 d5
T d5
cnot c4 d5
T* d5
cnot c3 d5
T d5
cnot c4 d5
H d5
T* c0
cnot c1 c0
T c0
cnot c2 c0
T* c0
cnot c1 c0
cnot e c0
cnot c2 c0
T c0
cnot e c0
H c0
T* c2
cnot c1 c2
T c2
cnot c1 c2
H c2
T d2
cnot b3 d2
T* d2
cnot b3 d2
H d2
T* c4
cnot b6 c4
cnot c5 c4
T* c4
cnot b6 c4
T c4
cnot c3 c4
cnot c5 c4
T c4
cnot c3 c4
H c4
T* d2
cnot b2 d2
T d2
cnot d1 d2
T* d2
cnot b2 d2
T d2
cnot d1 d2
H d2
cnot b2 b3
cnot c2 b3
T* b3
cnot b2 b3
T b3
cnot a3 b3
cnot c2 b3
T b3
cnot d0 b1
cnot e b0
cnot c3 b4
cnot d1 b2
cnot d2 b3
cnot d4 b5
cnot d5 b6
cnot a6 b6
cnot a5 b5
cnot a4 b4
cnot a2 b2
cnot a1 b1
cnot a0 b0
H d2
cnot b0 c0
T c0
cnot b1 c0
T c0
cnot b0 c0
T c0
cnot d0 c0
cnot a1 c0
T c0
cnot e c0
cnot b0 c0
cnot a0 c0
T* c0
cnot d0 c0
cnot b1 c0
cnot a1 c0
T c0
cnot e c0
cnot b0 c0
cnot a0 c0
H c0
cnot b2 c2
T c2
cnot b3 c2
T c2
cnot b2 c2
T c2
cnot d1 c2
cnot b3 c2
cnot b2 c2
cnot a2 c2
T c2
cnot d1 c2
cnot b2 c2
cnot a2 c2
H c2
T d2
cnot b2 d2
T d2
cnot d1 d2
T* d2
cnot b2 d2
T* d2
cnot d1 d2
H d2
cnot b4 c4
T c4
cnot b5 c4
T c4
cnot b4 c4
T c4
cnot c3 c4
cnot b5 c4
cnot b4 c4
cnot a4 c4
T c4
cnot d4 c4
cnot b5 c4
cnot a5 c4
T* c4
cnot c3 c4
cnot b4 c4
cnot a4 c4
T c4
cnot d4 c4
cnot b5 c4
cnot a5 c4
H c4
cnot b1 d0
T d0
cnot b1 d0
H d0
cnot b2 d1
S d1
cnot a2 d1
S* d1
cnot b2 d1
cnot a2 d1
H d1
cnot b5 d4
T d4
cnot b5 d4
H d4
cnot b6 d5
T d5
cnot a6 d5
S* d5
cnot c5 d5
T d5
cnot c5 d5
cnot b6 d5
cnot a6 d5
H d5
T d1
cnot c0 d1
T* d1
cnot e d1
T d1
cnot c0 d1
T* d1
cnot e d1
H d1
cnot c0 c1
T* c1
cnot c2 c1
T c1
cnot c0 c1
T* c1
cnot c2 c1
H c1
T d0
cnot b0 d0
T d0
cnot e d0
T* d0
cnot b0 d0
T* d0
cnot e d0
H d0
T d4
cnot b4 d4
T d4
cnot c3 d4
T* d4
cnot b4 d4
T* d4
cnot c3 d4
H d4
cnot b6 c5
T c5
cnot c4 c5
T* c5
cnot b6 c5
T* c5
cnot c4 c5
H c5
T d5
cnot c3 d5
T* d5
cnot c4 d5
T d5
cnot c3 d5
T* d5
cnot c4 d5
H d5
cnot b4 c3
S c3
cnot a4 c3
S* c3
cnot c4 c3
cnot b4 c3
cnot a4 c3
T* c3
cnot c4 c3
H c3
cnot c1 e
T* e
cnot c3 e
T e
cnot c1 e
T* e
cnot b0 e
cnot c3 e
S e
cnot a0 e
S* e
cnot c0 e
cnot b0 e
cnot a0 e
T* e
cnot c0 e
H e
T c3
cnot c1 c3
T* c3
cnot c1 c3
H c3
T c3
cnot c5 c3
T* c3
cnot e c3
T c3
cnot c5 c3
T* c3
cnot e c3
H c3
T c1
H c1
T d1
cnot c2 d1
T* d1
cnot c3 d1
T d1
cnot c2 d1
T* d1
cnot c3 d1
H d1
T c5
cnot e c5
T* c5
cnot e c5
H c5
T d5
cnot b6 d5
T d5
cnot e d5
T* d5
cnot b6 d5
T* d5
cnot e d5
H d5
T c0
cnot c1 c0
T c0
cnot c2 c0
T* c0
cnot c1 c0
cnot c2 c0
H c0
T* d0
cnot b1 d0
T* d0
cnot d1 d0
T d0
cnot b1 d0
T d0
cnot d1 d0
H d0
T c2
cnot c1 c2
T c2
cnot c3 c2
cnot c1 c2
T* c2
cnot c3 c2
H c2
T* d2
cnot b3 d2
T* d2
cnot c3 d2
T d2
cnot b3 d2
T d2
cnot c3 d2
H d2
T c4
cnot b6 c4
cnot c5 c4
T c4
cnot b6 c4
T c4
cnot c5 c4
H c4
T* d4
cnot b5 d4
T* d4
cnot d5 d4
T d4
cnot b5 d4
T d4
cnot d5 d4
H d4
T e
cnot a6 e
T e
cnot b6 e
T* e
cnot a6 e
S e
cnot b6 e
cnot a6 b6
cnot a5 b5
cnot a4 b4
cnot a3 b3
cnot a2 b2
cnot a1 b1
cnot a0 b0
H e
T* c0
cnot b0 c0
cnot a0 c0
T* c0
cnot b1 c0
cnot a1 c0
T* c0
cnot b0 c0
cnot a0 c0
T* c0
cnot b1 c0
cnot a1 c0
H c0
T* d0
cnot a0 d0
T d0
cnot b0 d0
T d0
cnot a0 d0
T* d0
cnot b0 d0
H d0
T* c1
H c1
S* d1
cnot a1 d1
T d1
cnot b1 d1
cnot a1 d1
T* d1
cnot b1 d1
H d1
T* c2
cnot b2 c2
cnot a2 c2
T* c2
cnot b3 c2
cnot a3 c2
T* c2
cnot b2 c2
cnot a2 c2
T* c2
cnot b3 c2
cnot a3 c2
H c2
T* d2
cnot a2 d2
T d2
cnot b2 d2
T d2
cnot a2 d2
T* d2
cnot b2 d2
H d2
T* c3
cnot a3 c3
T c3
cnot b3 c3
cnot a3 c3
T* c3
cnot b3 c3
H c3
T* c4
cnot b4 c4
cnot a4 c4
T* c4
cnot b5 c4
cnot a5 c4
T* c4
cnot b4 c4
cnot a4 c4
T* c4
cnot b5 c4
cnot a5 c4
H c4
T* d4
cnot a4 d4
T d4
cnot b4 d4
T d4
cnot a4 d4
T* d4
cnot b4 d4
H d4
T* c5
cnot b6 c5
cnot a6 c5
T* c5
cnot b6 c5
cnot a6 c5
H c5
S* d5
cnot a5 d5
T d5
cnot b5 d5
cnot a5 d5
T* d5
cnot b5 d5
H d5
S b0
cnot a0 b0
S* b0
S b2
cnot b2 a2
S* a2
S b4
cnot b4 a4
S* a4
T b6
cnot b6 a6
S* a6
T b1
T b3
T b5
cnot b2 a2
cnot b4 a4
cnot b6 a6
cnot a0 b0
X b0
X b1
X b2
X b3
X b4
X b5
X b6
END
