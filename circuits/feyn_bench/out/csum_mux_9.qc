# Feynman -- quantum circuit toolkit
# Original (csum_mux_9.qc):
#   Qubits: 30
#   H: 28
#   T: 196
#   X: 28
#   cnot: 196
#   Depth: 59
#   T depth: 18
# Result (57.561ms):
#   Qubits: 30
#   H: 28
#   S: 28
#   T: 84
#   cnot: 148
#   Depth: 50
#   T depth: 16
.v c00 c01 c10 c11 e10 e11 c20 c21 c30 c31 a0 a1 e30 e31 c40 c41 c50 c51 e50 e51 c60 c61 c70 c71 b0 b1 b2 b3 e70 e71
.i c00 c01 c10 c11 e10 e11 c20 c21 c30 c31 e30 e31 c40 c41 c50 c51 e50 e51 c60 c61 c70 c71 e70 e71
.o c00 c01 c10 c11 e10 e11 c20 c21 c30 c31 a0 a1 e30 e31 c40 c41 c50 c51 e50 e51 c60 c61 c70 c71 b0 b1 b2 b3 e70 e71
BEGIN 
H e10
H e11
H a0
H a1
H e30
H e31
H e50
H e51
H b0
H b1
H b2
H b3
H e70
H e71
S e10
cnot c10 e10
T* e10
cnot c00 e10
T* e10
cnot c11 e10
cnot c10 e10
T e10
cnot c00 e10
T* e10
cnot c11 e10
H e10
S e11
cnot c10 e11
T* e11
cnot c01 e11
T* e11
cnot c11 e11
cnot c10 e11
T e11
cnot c01 e11
T* e11
cnot c11 e11
H e11
S a0
cnot c30 a0
T* a0
cnot c20 a0
T* a0
cnot c31 a0
cnot c30 a0
T a0
cnot c20 a0
T* a0
cnot c31 a0
H a0
S a1
cnot c30 a1
T* a1
cnot c21 a1
T* a1
cnot c31 a1
cnot c30 a1
T a1
cnot c21 a1
T* a1
cnot c31 a1
H a1
S e50
cnot c50 e50
T* e50
cnot c40 e50
T* e50
cnot c51 e50
cnot c50 e50
T e50
cnot c40 e50
T* e50
cnot c51 e50
H e50
S e51
cnot c50 e51
T* e51
cnot c41 e51
T* e51
cnot c51 e51
cnot c50 e51
T e51
cnot c41 e51
T* e51
cnot c51 e51
H e51
S b0
cnot c70 b0
T* b0
cnot c60 b0
T* b0
cnot c71 b0
cnot c70 b0
T b0
cnot c60 b0
T* b0
cnot c71 b0
H b0
S b1
cnot c70 b1
T* b1
cnot c61 b1
T* b1
cnot c71 b1
cnot c70 b1
T b1
cnot c61 b1
T* b1
cnot c71 b1
H b1
S e30
cnot a0 e30
T* e30
cnot e10 e30
T* e30
cnot a0 e30
cnot a1 e30
T e30
cnot e10 e30
T* e30
cnot a1 e30
H e30
S e31
cnot a0 e31
T* e31
cnot e11 e31
T* e31
cnot a0 e31
cnot a1 e31
T e31
cnot e11 e31
T* e31
cnot a1 e31
H e31
S b2
cnot b0 b2
T* b2
cnot e50 b2
T* b2
cnot b0 b2
cnot b1 b2
T b2
cnot e50 b2
T* b2
cnot b1 b2
H b2
S b3
cnot b0 b3
T* b3
cnot e51 b3
T* b3
cnot b0 b3
cnot b1 b3
T b3
cnot e51 b3
T* b3
cnot b1 b3
H b3
S e70
cnot b2 e70
T* e70
cnot e30 e70
T* e70
cnot b2 e70
cnot b3 e70
T e70
cnot e30 e70
T* e70
cnot b3 e70
H e70
S e71
cnot b2 e71
T* e71
cnot e31 e71
T* e71
cnot b2 e71
cnot b3 e71
T e71
cnot e31 e71
T* e71
cnot b3 e71
H e71
S c10
cnot c00 c10
T c10
S c11
cnot c00 c11
T* c11
cnot c00 c01
cnot c10 c01
T c01
cnot c11 c01
cnot c10 c01
T* c01
S c30
cnot c30 c20
T c20
S c31
cnot c30 c31
cnot c20 c31
T* c31
cnot c30 c21
T c21
cnot c31 c21
cnot c20 c21
T* c21
S c50
cnot c50 c40
T c40
S c51
cnot c50 c51
cnot c40 c51
T* c51
cnot c50 c41
T c41
cnot c51 c41
cnot c40 c41
T* c41
S c70
cnot c70 c60
T c60
S c71
cnot c70 c71
cnot c60 c71
T* c71
cnot c70 c61
T c61
cnot c71 c61
cnot c60 c61
T* c61
S a0
S a1
cnot a0 e10
T e10
cnot a1 e10
cnot a0 e10
T* e10
cnot a0 e11
T e11
cnot a1 e11
cnot a0 e11
T* e11
S b2
S b3
cnot b2 e30
T e30
cnot b3 e30
cnot b2 e30
T* e30
cnot b2 e31
T e31
cnot b3 e31
cnot b2 e31
T* e31
S b0
S b1
cnot b0 e50
T e50
cnot b1 e50
cnot b0 e50
T* e50
cnot b0 e51
T e51
cnot b1 e51
cnot b0 e51
T* e51
cnot c11 c01
cnot c30 c20
cnot c31 c21
cnot c50 c40
cnot c51 c41
cnot c71 c61
cnot c70 c60
cnot c60 c61
cnot c60 c71
cnot c40 c51
cnot c40 c41
cnot c20 c21
cnot c20 c31
cnot c00 c10
cnot c00 c01
cnot c00 c11
cnot b1 e51
cnot b1 e50
cnot b3 e31
cnot b3 e30
cnot a1 e11
cnot a1 e10
END
