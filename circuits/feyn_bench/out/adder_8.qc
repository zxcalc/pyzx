# Feynman -- quantum circuit toolkit
# Original (adder_8.qc):
#   Qubits: 24
#   H: 80
#   T: 399
#   X: 12
#   cnot: 466
#   Depth: 223
#   T depth: 69
# Result (146.554ms):
#   Qubits: 24
#   H: 80
#   S: 16
#   T: 215
#   cnot: 359
#   Depth: 213
#   T depth: 73
.v b0 a0 b1 a1 c1 b2 a2 b3 a3 c3 d3 b4 a4 b5 a5 c5 d5 e5 b6 a6 b7 a7 z c7
.i b0 a0 b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 b6 a6 b7 a7 z
.o b0 a0 b1 a1 c1 b2 a2 b3 a3 c3 d3 b4 a4 b5 a5 c5 d5 e5 b6 a6 b7 a7 z c7
BEGIN 
cnot a7 z
cnot a7 b7
cnot a5 c5
cnot a3 c3
cnot a5 b5
cnot a3 b3
cnot a1 c1
cnot a1 b1
H a1
H a3
H a5
H a7
T a1
cnot a0 a1
T* a1
cnot b0 a1
T a1
cnot a0 a1
T* a1
cnot b0 a1
H a1
T a3
cnot a2 a3
T* a3
cnot b2 a3
T a3
cnot a2 a3
T* a3
cnot b2 a3
H a3
T a5
cnot a4 a5
T* a5
cnot b4 a5
T a5
cnot a4 a5
T* a5
cnot b4 a5
H a5
T a7
cnot a6 a7
T* a7
cnot b6 a7
T a7
cnot a6 a7
T* a7
cnot b6 a7
H a7
H c1
H c3
H c5
H z
H d3
H d5
H c7
T c1
cnot a1 c1
T* c1
cnot b1 c1
T c1
cnot a1 c1
T* c1
cnot b2 a3
cnot b4 a5
cnot b6 a7
cnot b1 c1
cnot a6 a7
cnot a6 b6
cnot a4 a5
cnot a4 b4
cnot a2 b2
cnot a2 a3
H c1
S d3
cnot a3 d3
T* d3
cnot b3 d3
T d3
cnot a3 d3
S* d3
cnot b2 d3
cnot a3 d3
T d3
cnot b3 d3
T* d3
cnot b2 d3
cnot a3 d3
H d3
T c5
cnot b4 c5
cnot a5 c5
T* c5
cnot b5 c5
T c5
cnot b4 c5
cnot a5 c5
T* c5
cnot b5 c5
H c5
S d5
cnot a5 d5
T* d5
cnot b5 d5
T d5
cnot a5 d5
S* d5
cnot b4 d5
cnot a5 d5
T d5
cnot b5 d5
T* d5
cnot b4 d5
cnot a5 d5
H d5
S c7
cnot a7 c7
T* c7
cnot b7 c7
T c7
cnot a7 c7
S* c7
cnot b6 c7
cnot a7 c7
T c7
cnot b7 c7
T* c7
cnot b6 c7
cnot a7 c7
H c7
H e5
T e5
cnot c7 e5
T* e5
cnot d5 e5
T e5
cnot c7 e5
T* e5
cnot d5 e5
H e5
cnot b2 c3
cnot a3 c3
T* c3
cnot b3 c3
T c3
cnot b2 c3
cnot a3 c3
T* c3
cnot c1 c3
cnot b3 c3
T c3
cnot d3 c3
T* c3
cnot c1 c3
T c3
cnot d3 c3
H c3
T* c5
cnot c7 c5
T c5
cnot z c5
T* c5
cnot c7 c5
T c5
cnot z c5
H c5
T* c5
cnot c3 c5
T c5
cnot d5 c5
T* c5
cnot c3 c5
T c5
cnot d5 c5
H c5
T* z
cnot b6 z
cnot a7 z
T* z
cnot b7 z
T z
cnot b6 z
cnot a7 z
T* z
cnot c3 z
cnot b7 z
T z
cnot e5 z
T* z
cnot c3 z
T z
cnot c7 z
cnot e5 z
T z
cnot c7 z
H z
T* e5
cnot c3 e5
T e5
cnot c3 e5
H e5
T* e5
cnot c7 e5
T e5
cnot d5 e5
T* e5
cnot c7 e5
T e5
cnot d5 e5
H e5
T* d3
cnot c1 d3
T d3
cnot c1 d3
H d3
T* d5
cnot c3 d5
T d5
cnot c3 d5
H d5
T* c7
H c7
S* c7
cnot a7 c7
T c7
cnot b7 c7
T* c7
cnot a7 c7
S c7
cnot b6 c7
cnot a7 c7
T* c7
cnot b7 c7
T c7
cnot b2 a3
cnot b4 a5
cnot b6 a7
cnot a7 c7
cnot a6 b6
cnot a4 b4
cnot a2 b2
H c7
T a1
cnot b1 a1
T* a1
cnot b1 a1
H a1
T a3
cnot b3 a3
T* a3
cnot d3 a3
T* a3
cnot b2 a3
cnot a2 a3
T* a3
cnot b3 a3
T a3
cnot b2 a3
cnot a2 a3
T a3
cnot d3 a3
H a3
T a5
cnot b5 a5
T* a5
cnot d5 a5
T* a5
cnot b4 a5
cnot a4 a5
T* a5
cnot b5 a5
T a5
cnot b4 a5
cnot a4 a5
T a5
cnot d5 a5
H a5
T a7
cnot b7 a7
T* a7
cnot b7 a7
H a7
T* a1
cnot a0 a1
T a1
cnot b0 a1
T* a1
cnot a0 a1
T a1
cnot b0 a1
H a1
T* a3
cnot a2 a3
T a3
cnot b2 a3
T* a3
cnot a2 a3
T a3
cnot b2 a3
H a3
T* a5
cnot a4 a5
T a5
cnot b4 a5
T* a5
cnot a4 a5
T a5
cnot b4 a5
H a5
T* a7
cnot a6 a7
T a7
cnot b6 a7
T* a7
cnot a6 a7
T a7
cnot b6 a7
H a7
T b1
cnot c1 a2
cnot c1 a3
cnot c3 a4
cnot c3 a5
cnot c5 a6
cnot c5 a7
cnot c1 b2
cnot c1 b3
cnot c5 b6
cnot c3 b4
cnot c3 b5
cnot c5 b7
cnot a7 b7
cnot a6 a7
cnot a6 b6
cnot a5 b5
cnot a4 a5
cnot a4 b4
cnot a3 b3
cnot a2 b2
cnot a1 b1
cnot a2 a3
H a1
cnot b3 c1
cnot a3 c1
cnot a2 c1
T c1
cnot d3 c1
S c1
cnot d3 c1
cnot b3 c1
cnot a3 c1
cnot a2 c1
H a3
cnot b5 c3
cnot a5 c3
cnot a4 c3
T c3
cnot d5 c3
S c3
cnot d5 c3
cnot b5 c3
cnot a5 c3
cnot a4 c3
H a5
cnot b7 c5
cnot a7 c5
cnot a6 c5
T c5
cnot b7 c5
cnot a7 c5
cnot a6 c5
H a7
T a1
cnot a0 a1
T* a1
cnot b0 a1
T a1
cnot a0 a1
T* a1
cnot b0 a1
H a1
T a3
cnot a2 a3
T* a3
cnot b2 a3
T a3
cnot a2 a3
T* a3
cnot b2 a3
H a3
T a5
cnot a4 a5
T* a5
cnot b4 a5
T a5
cnot a4 a5
T* a5
cnot b4 a5
H a5
T a7
cnot a6 a7
T* a7
cnot b6 a7
T a7
cnot a6 a7
T* a7
cnot b6 a7
H a7
cnot a7 b7
cnot a5 b5
cnot a3 b3
cnot a1 b1
H a1
H a3
H a5
H a7
T* a1
cnot a0 a1
T a1
cnot b0 a1
T* a1
cnot a0 a1
T a1
cnot b0 a1
H a1
T* a3
cnot a2 a3
T a3
cnot b2 a3
T* a3
cnot a2 a3
T a3
cnot b2 a3
H a3
T* a5
cnot a4 a5
T a5
cnot b4 a5
T* a5
cnot a4 a5
T a5
cnot b4 a5
H a5
T* a7
cnot a6 a7
T a7
cnot b6 a7
T* a7
cnot a6 a7
T a7
cnot b6 a7
H a7
cnot c1 a2
cnot c3 a4
cnot c5 a6
cnot c1 b2
cnot c3 b4
cnot c5 b6
cnot a6 a7
cnot a4 a5
cnot a5 b5
cnot a3 b3
cnot a2 b3
cnot a1 b1
cnot a0 b0
cnot a2 a3
H a1
H a3
H a5
T a1
cnot a0 a1
T* a1
cnot b0 a1
T* a1
cnot a0 a1
T a1
cnot b0 a1
H a1
T a3
cnot a2 a3
T* a3
cnot b2 a3
T* a3
cnot a2 a3
T a3
cnot b2 a3
H a3
T a5
cnot a4 a5
T* a5
cnot b4 a5
T* a5
cnot a4 a5
T a5
cnot b4 a5
H a5
cnot a3 d3
T* d3
cnot b3 d3
T* d3
cnot a3 d3
S d3
cnot b2 d3
cnot a3 d3
cnot a2 d3
T d3
cnot b3 d3
T d3
cnot b2 a3
cnot b4 a5
cnot a4 a5
cnot a3 d3
cnot a4 b4
cnot a2 d3
cnot a2 b2
cnot a2 a3
H d3
cnot b5 d5
S d5
cnot a5 d5
T d5
cnot b4 d5
T* d5
cnot b5 d5
T* d5
cnot b4 d5
T d5
cnot a5 d5
H d5
H c5
T* c3
cnot c5 c3
T* c3
cnot d5 c3
T c3
cnot c5 c3
T* c3
cnot d5 c3
H c3
cnot c3 c1
T* c1
cnot d3 c1
T c1
cnot c3 c1
T* c1
cnot d3 c1
H c1
T d3
cnot c3 d3
T* d3
cnot c3 d3
H d3
T d5
cnot c5 d5
T* d5
cnot c5 d5
H d5
T* c1
cnot a1 c1
T c1
cnot b1 c1
T c1
cnot a1 c1
T* c1
cnot b2 a3
cnot b4 a5
cnot b1 c1
cnot a4 b4
cnot a2 b2
H c1
cnot a3 c3
T c3
cnot b3 c3
T c3
cnot a3 c3
T* c3
cnot b3 c3
H c3
S* d3
cnot a3 d3
T d3
cnot b3 d3
T d3
cnot a3 d3
S* d3
cnot b2 d3
cnot a3 d3
cnot a2 d3
T* d3
cnot b3 d3
T* d3
cnot b2 d3
cnot a3 d3
cnot a2 d3
H d3
cnot a5 c5
T c5
cnot b5 c5
T c5
cnot a5 c5
T* c5
cnot b5 c5
H c5
S* d5
cnot a5 d5
T d5
cnot b5 d5
T d5
cnot a5 d5
S* d5
cnot b4 d5
cnot a5 d5
cnot a4 d5
T* d5
cnot b5 d5
T* d5
cnot b4 d5
cnot a5 d5
cnot a4 d5
H d5
T* a1
cnot b1 a1
T* a1
cnot b1 a1
H a1
T* a3
cnot b3 a3
T* a3
cnot b3 a3
H a3
T* a5
cnot b5 a5
T* a5
cnot b5 a5
H a5
T* a1
cnot a0 a1
T a1
cnot b0 a1
T a1
cnot a0 a1
T* a1
cnot b0 a1
H a1
T* a3
cnot a2 a3
T a3
cnot b2 a3
T a3
cnot a2 a3
T* a3
cnot b2 a3
H a3
T* a5
cnot a4 a5
T a5
cnot b4 a5
T a5
cnot a4 a5
T* a5
cnot b4 a5
H a5
T b1
T b3
T b5
cnot a5 c5
cnot a3 c3
cnot a5 b5
cnot a3 b3
cnot a1 c1
cnot a1 b1
END
