# Feynman -- quantum circuit toolkit
# Original (csla_mux_3.qc):
#   Qubits: 15
#   H: 20
#   T: 70
#   cnot: 90
#   Depth: 66
#   T depth: 21
# Result (17.334ms):
#   Qubits: 15
#   H: 20
#   T: 62
#   cnot: 111
#   swap: 7
#   Depth: 95
#   T depth: 29
.v cin a0 b0 c0 d0 a1 b1 c1 d1 e1 a2 b2 c2 d2 e2
.i cin a0 b0 a1 b1 a2 b2
.o cin a0 b0 c0 d0 a1 b1 c1 d1 e1 a2 b2 c2 d2 e2
BEGIN 
H c0
H c1
H c2
T c0
cnot a0 c0
T* c0
cnot b0 c0
T c0
cnot a0 c0
T* c0
cnot b0 c0
H c0
T c1
cnot a1 c1
T* c1
cnot b1 c1
T c1
cnot a1 c1
T* c1
cnot b1 c1
H c1
T c2
cnot a2 c2
T* c2
cnot b2 c2
T c2
cnot a2 c2
T* c2
cnot b2 c2
H c2
cnot c2 e2
cnot c1 e1
cnot c0 d0
cnot a2 b2
cnot a1 b1
cnot a0 b0
H c1
H e1
H c2
H e2
T e1
cnot b1 e1
T* e1
cnot c0 e1
T e1
cnot b1 e1
T* e1
swap d0 d2
cnot c0 e1
cnot c0 d2
cnot c0 d0
cnot d2 b2
cnot b2 d2
cnot b0 c0
H e1
T* c1
cnot b1 c1
T c1
cnot c0 c1
T* c1
cnot b1 c1
T c1
cnot c0 c1
H c1
T c2
cnot b2 c2
T* c2
cnot c1 c2
T c2
cnot b2 c2
T* c2
cnot c0 b1
cnot d2 b2
cnot d1 c1
cnot d1 c2
cnot d2 d1
cnot e1 d2
cnot c1 d1
cnot c1 c2
swap b2 d1
cnot b1 d1
cnot b0 d1
H c2
T* e2
cnot c1 e2
cnot b2 e2
T e2
cnot d2 e2
T e2
cnot c1 e2
cnot b2 e2
T* e2
cnot d2 e2
H e2
cnot d2 b2
cnot e1 c1
cnot e2 c2
cnot e1 d1
swap d1 e1
swap c1 d1
cnot b2 d1
cnot b2 c1
cnot b1 e1
swap b1 d1
cnot b0 e1
cnot b0 d1
cnot b0 b1
H e2
T d2
cnot b2 d2
T* d2
cnot c1 d2
T* d2
cnot a2 d2
T d2
cnot c1 d2
cnot b2 d2
cnot a2 d2
H d2
T* d1
cnot b0 d1
T d1
cnot c0 d1
T* d1
cnot a1 d1
T d1
cnot c0 d1
cnot b0 d1
cnot a1 d1
H d1
T e2
cnot c2 e2
T* e2
cnot cin e2
T e2
cnot c2 e2
T* e2
cnot cin e2
H e2
T* d2
cnot b2 d2
T d2
cnot cin d2
T* d2
cnot b2 d2
T d2
cnot cin d2
H d2
T d1
cnot b0 d1
T* d1
cnot cin d1
T d1
cnot b0 d1
T* d1
cnot cin d1
H d1
T a0
cnot b0 a0
T a0
T cin
cnot b0 cin
T* cin
T* b2
cnot cin b2
cnot b0 b2
T b2
T* c0
cnot b0 c0
T c0
T c1
cnot cin c1
cnot b2 c1
cnot b0 c1
T* c1
T c2
cnot cin c2
cnot b0 c2
T* c2
T a1
T a2
cnot b0 a0
cnot d1 b0
cnot d2 b2
cnot d1 c0
cnot d2 c1
cnot d1 cin
cnot e2 c2
cnot cin c2
cnot cin d1
cnot cin b2
swap b1 d1
cnot b2 c1
swap b0 b1
cnot b1 d1
cnot b1 cin
cnot b1 c2
cnot b1 c1
cnot b1 c0
cnot b1 b2
END
