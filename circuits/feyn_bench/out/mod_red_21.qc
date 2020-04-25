# Feynman -- quantum circuit toolkit
# Original (mod_red_21.qc):
#   Qubits: 11
#   H: 30
#   T: 119
#   X: 24
#   cnot: 122
#   Depth: 158
#   T depth: 48
# Result (32.799ms):
#   Qubits: 11
#   H: 30
#   S: 1
#   T: 73
#   cnot: 86
#   Depth: 152
#   T depth: 59
.v x0 x1 c1 x2 c2 x3 c3 x4 c4 d4 z
.i x0 x1 x2 x3 x4 z
.o x0 x1 c1 x2 c2 x3 c3 x4 c4 d4 z
BEGIN 
H c2
T c2
cnot x1 c2
T* c2
cnot x2 c2
T c2
cnot x1 c2
T* c2
cnot x2 c2
H c2
H c3
T c3
cnot c2 c3
T c3
cnot x3 c3
T c3
cnot c2 c3
T c3
cnot x3 c3
H c3
H d4
T d4
cnot c3 d4
T d4
cnot x4 d4
T* d4
cnot c3 d4
T* d4
cnot x4 d4
H d4
T* c3
cnot x4 c3
T c3
cnot x4 c3
H c3
H c4
T c4
cnot d4 c4
T* c4
cnot z c4
T c4
cnot d4 c4
T* c4
cnot z c4
H c4
cnot c3 c2
T* c2
cnot x3 c2
T* c2
cnot c3 c2
cnot x3 c2
H c2
H c1
T c1
cnot x0 c1
cnot c4 c1
T* c1
cnot x1 c1
cnot c4 c1
T c1
cnot x0 c1
cnot c4 c1
T* c1
cnot c4 x3
cnot c4 x1
cnot c4 x0
cnot x1 c1
H c1
cnot c1 c2
T c2
cnot x2 c2
T* c2
cnot c1 c2
cnot x1 c2
cnot c4 c2
T* c2
cnot x2 c2
T c2
cnot c4 c2
cnot x1 c2
H c2
cnot c2 c3
T c3
cnot x3 c3
T* c3
cnot c2 c3
T* c3
cnot c4 c3
T* c3
cnot x3 c3
cnot c4 c3
H c3
T x4
H x4
T x4
cnot c3 x4
T x4
cnot c4 x4
T* x4
cnot c3 x4
T* x4
cnot c4 x4
H x4
T* c3
cnot c4 c3
T c3
cnot c4 c3
H c3
T* c3
cnot c2 c3
T* c3
cnot x3 c3
T c3
cnot c2 c3
T c3
cnot x3 c3
H c3
H x3
T* x3
cnot c2 x3
T x3
cnot c4 x3
T* x3
cnot c2 x3
T x3
cnot c4 x3
H x3
T* c2
cnot c4 c2
T c2
cnot c4 c2
H c2
T* c2
cnot c1 c2
T* c2
cnot x2 c2
T c2
cnot c1 c2
T c2
cnot x2 c2
H c2
H x2
T* x2
cnot c1 x2
T* x2
cnot c4 x2
T x2
cnot c1 x2
T x2
cnot c4 x2
H x2
T c1
cnot c4 c1
T* c1
cnot c4 c1
H c1
T* c1
cnot x0 c1
T c1
cnot x1 c1
T* c1
cnot x0 c1
T c1
cnot x1 c1
H c1
H x1
T* x1
cnot c4 x1
T x1
cnot x0 x1
T x1
cnot c4 x1
T* x1
cnot x0 x1
H x1
S* c4
cnot x0 c4
T* c4
cnot x0 c4
H c4
T* c4
cnot d4 c4
T c4
cnot z c4
T* c4
cnot d4 c4
T c4
cnot z c4
H c4
T x0
END
