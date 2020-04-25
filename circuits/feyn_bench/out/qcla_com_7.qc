# Feynman -- quantum circuit toolkit
# Original (qcla_com_7.qc):
#   Qubits: 24
#   H: 39
#   T: 203
#   X: 15
#   cnot: 215
#   Depth: 81
#   T depth: 27
# Result (102.927ms):
#   Qubits: 24
#   H: 37
#   S: 5
#   T: 94
#   X: 1
#   Z: 3
#   cnot: 136
#   Depth: 75
#   T depth: 28
.v a0 b0 c0 a1 b1 c1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6 c6
.i a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 a6 b6
.o a0 b0 c0 a1 b1 c1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6 c6
BEGIN 
H c0
H c1
H c2
H d2
H c3
H c4
H d4
H d5
H c6
T c0
cnot a0 c0
T c0
cnot b0 c0
T* c0
cnot a0 c0
T* c0
cnot b0 c0
cnot a6 b6
cnot a5 b5
cnot a4 b4
cnot a3 b3
cnot a2 b2
cnot a1 b1
H c0
T c2
cnot b2 c2
T c2
cnot b3 c2
T c2
cnot b2 c2
T c2
cnot b3 c2
H c2
T d2
cnot a2 d2
T d2
cnot b2 d2
T* d2
cnot a2 d2
T* d2
cnot b2 d2
H d2
T c4
cnot b4 c4
T c4
cnot b5 c4
T c4
cnot b4 c4
T c4
cnot b5 c4
H c4
T d4
cnot a4 d4
T d4
cnot b4 d4
T* d4
cnot a4 d4
T* d4
cnot b4 d4
H d4
S c1
cnot a1 c1
T c1
cnot b1 c1
T* c1
cnot a1 c1
cnot c0 c1
T* c1
cnot b1 c1
T* c1
cnot c0 c1
H c1
H c5
S d5
cnot a5 d5
T d5
cnot b5 d5
T* d5
cnot a5 d5
cnot d4 d5
T* d5
cnot b5 d5
T* d5
cnot d4 d5
H d5
T* c3
Z c3
cnot c1 c3
T* c3
cnot c2 c3
T c3
cnot c1 c3
T* c3
cnot a3 c3
cnot c2 c3
T c3
cnot b3 c3
T* c3
cnot d2 c3
cnot a3 c3
T* c3
cnot b3 c3
T* c3
cnot d2 c3
H c3
T c3
cnot c5 c3
T* c3
cnot c6 c3
T c3
cnot c5 c3
T* c3
cnot c6 c3
H c3
T c5
cnot c6 c5
T* c5
cnot c6 c5
H c5
T* d5
cnot b6 d5
T* d5
cnot c6 d5
T d5
cnot b6 d5
T d5
cnot c6 d5
H d5
cnot c2 c1
cnot c3 c1
T* c1
cnot c2 c1
T c1
cnot c3 c1
H c1
cnot b1 c0
cnot c1 c0
T c0
cnot b1 c0
T c0
cnot c1 c0
H c0
cnot c3 c2
T c2
cnot c3 c2
H c2
cnot b3 d2
cnot c3 d2
T d2
cnot b3 d2
T d2
cnot c3 d2
H d2
T* c4
cnot b6 c4
T* c4
cnot c5 c4
T c4
cnot b6 c4
T c4
cnot c5 c4
H c4
cnot b5 d4
cnot d5 d4
T d4
cnot b5 d4
T d4
cnot d5 d4
H d4
T* c0
cnot a0 c0
T* c0
cnot b0 c0
T c0
cnot a0 c0
T c0
cnot b0 c0
cnot a6 b6
cnot a5 b5
cnot a4 b4
cnot a3 b3
cnot a2 b2
cnot a1 b1
H c0
S* c1
cnot a1 c1
T* c1
cnot b1 c1
cnot a1 c1
T c1
cnot b1 c1
H c1
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
T* d2
cnot b2 d2
T d2
cnot a2 d2
T d2
cnot b2 d2
H d2
T c3
Z c3
cnot a3 c3
T* c3
cnot b3 c3
cnot a3 c3
T c3
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
T* d4
cnot b4 d4
T d4
cnot a4 d4
T d4
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
T* d5
cnot b5 d5
cnot a5 d5
T d5
cnot b5 d5
H d5
T c6
cnot a6 c6
T c6
cnot b6 c6
S* c6
cnot a6 c6
T* c6
cnot b6 c6
H c6
T* a6
T b6
cnot a6 b6
T* b6
Z b6
cnot a6 b6
X c6
END
