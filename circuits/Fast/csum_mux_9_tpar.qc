# Original circuit
#   qubits: 30
#   qubits used: 30
#   H: 28
#   cnot: 196
#   X: 28
#   T: 196
#   P: 0
#   Z: 0
#   tdepth (by partitions): 84
#   tdepth (by critical paths): 18
# Optimized circuit
#   qubits: 30
#   qubits used: 30
#   H: 28
#   cnot: 405
#   X: 24
#   T: 112
#   P: 42
#   Z: 0
#   tdepth (by partitions): 9
#   tdepth (by critical paths): 9
#   Time: 0.006 s
.v c00 c01 c10 c11 e10 e11 c20 c21 c30 c31 a0 a1 e30 e31 c40 c41 c50 c51 e50 e51 c60 c61 c70 c71 b0 b1 b2 b3 e70 e71
.i c00 c01 c10 c11 e10 e11 c20 c21 c30 c31 e30 e31 c40 c41 c50 c51 e50 e51 c60 c61 c70 c71 e70 e71
.o c00 c01 c10 c11 e10 e11 c20 c21 c30 c31 a0 a1 e30 e31 c40 c41 c50 c51 e50 e51 c60 c61 c70 c71 b0 b1 b2 b3 e70 e71

BEGIN
H e10
H e11
H a0
H a1
H e50
H e51
tof c21
H b0
H b1
tof e30 c01
tof e30 e10
tof c31 c20
tof e30 c21
tof a1 c30
tof e30 c31
tof e30 a0
tof c51 c40
tof e50 c40
tof e50 c51
tof b2 c61
tof b1 c70
tof b2 c70
tof b2 b1
tof b3 b2
tof b2 b3
tof c70 b1
tof c60 c71
tof c61 b3
tof c61 c70
tof c61 b2
tof c41 b2
tof c40 e50
tof c41 c61
tof c40 c51
tof c41 b1
tof e30 b3
tof e30 b2
tof e30 c61
tof e30 b1
tof e30 c41
tof e30 c50
tof c30 b2
tof c30 a1
tof c21 b2
tof c20 a0
tof c20 c61
tof c20 c31
tof c21 c30
tof c21 a1
tof c00 e10
tof c01 e11
tof c01 c10
tof c00 c11
tof c01
tof c10
tof e11
tof c21
tof a1
tof c30
tof e30
tof c50
tof c41
tof b1
tof b2
tof c70
T c00
T* c11
T c01
T* c10
T* e11
T* c20
T c21
T* a1
T c30
T c51
T* e50
T c40
T e30
T* c50
T c60
T* c71
T c41
T* b1
T* e10
T c31
T* c61
T a0
T b2
T c70
tof e10 c11
tof b3 c00
tof b3 c11
tof e11 c10
tof c10 c01
tof b3 c10
tof c31 c20
tof a0 c20
tof b3 e11
tof c30 a1
tof a1 c21
tof b3 a1
tof e50 c51
tof c40 c51
tof b2 c30
tof b3 e50
tof c40 e50
tof b3 e30
tof b3 c50
tof b3 c60
tof b3 c71
tof b3 c41
tof b3 b1
tof c61 c31
tof a0 c31
tof b3 e10
tof b3 a0
tof a0 c61
tof c31 c61
tof b1 c70
tof c41 c70
tof c71 b0
tof e30 e51
tof e50 c40
tof c51 e50
tof c30 b2
tof a1 b2
tof c21 a1
tof c21 c31
tof c20 c31
tof c20 c30
tof c01 c10
tof c00 c11
T* e10
T c01
T c61
T* c20
T a0
T* c21
T* c51
T c00
T c11
T c10
T* e11
T* c30
T a1
T* b2
T* c31
T e50
T* c40
T e30
T* c50
T* e51
T c60
T* c71
T b0
T c41
T* b1
T* c70
tof c00 e10
tof c11 e10
tof e11 c01
tof b3 c01
tof c01 e10
tof e51 c01
tof c30 c20
tof e51 c20
tof c60 c20
tof c71 c20
tof b0 c20
tof c30 a0
tof c31 c21
tof e30 c21
tof c50 c21
tof c60 a0
tof c71 a0
tof b0 a0
tof b3 c21
tof e51 a0
tof e51 c21
tof b3 c00
tof e51 c51
tof e51 c00
tof e51 c10
tof b3 c11
tof c60 c30
tof c71 c30
tof b0 c30
tof e51 e11
tof e51 c30
tof c40 e50
tof e30 c31
tof c50 c31
tof e51 c31
tof c50 e30
tof e51 c40
tof b3 c40
tof b1 c41
tof c70 c41
tof e51 c50
tof c41 e51
tof b0 c71
tof b3 c60
tof c71 c60
tof b3 b0
tof c41 b1
tof c41 c70
tof e51 c70
tof e51 c41
tof e30 c50
tof e50 c40
tof a1 b2
tof a1 c31
tof c51 c40
tof c51 e50
tof c21 c31
tof c20 c30
tof c61 c30
tof c20 a0
tof c01 c00
tof e10 c00
tof c01 c41
tof c01 c20
tof c01 e50
tof c01 c51
tof c01 e11
tof c01 c10
tof c01 e51
tof c01 c70
tof c01 e30
T c11
T* c01
T e30
T* c60
T b0
T* c70
T e51
T* e10
T* c10
T e11
T* c51
T e50
T c21
T* c20
tof e10 c11
tof c50 c01
tof c41 c11
tof c41 c01
tof c41 e30
tof c50 e30
tof c71 c60
tof c41 c70
tof c71 b0
tof b1 c70
tof c00 e10
tof b1 e51
tof c41 e51
tof c41 e10
tof c41 c10
tof c41 e11
tof c40 c41
tof c41 c51
tof c41 e50
tof c41 c20
tof c40 c20
tof c50 c21
tof c71 c20
tof c40 c41
tof c51 e50
tof c10 e11
tof c70 e51
tof c60 c20
tof e30 c21
tof c60 b0
tof c01 e30
tof c11 c00
tof c30 a0
tof c21 a0
tof c21 c30
tof c31 c20
tof c30 c21
tof a0 c30
tof b2 c31
P c11
P* c00
P c41
P e11
P c30
P c21
P* a0
P b2
P c20
P* c31
P e50
P c40
P e30
P b0
P e51
tof c00 c11
tof c31 c20
tof b2 c20
tof b2 c31
tof c21 a0
tof c30 a0
tof c11 c00
H c00
tof e11 c41
tof c40 e50
tof c50 e30
tof c71 b0
tof b1 e51
P c11
P* c41
P* e50
P c50
P* e30
P c71
P* b0
P b1
P* e51
tof e11 c41
tof e30 c50
tof c40 e50
tof b0 c71
tof e51 b1
tof b1 e51
tof c71 b0
tof c50 e30
H e11
H c21
H c31
tof c51
H c40
H e30
tof c70
H b0
H e51
H b3
H e31
H a0
H c20
tof e31 e11
tof c40 e11
tof c40 b3
tof c40 e31
tof a0 c40
tof a0 e30
tof a0 b0
tof e51 c20
tof c40 e30
tof c40 b0
tof c40 a0
tof e30 c20
tof e30 e51
tof e11 e31
tof c00 e11
tof e31 c31
tof c00 a0
tof c00 c20
tof c00 e51
tof c00 e30
tof c00 b3
tof e10 a0
tof e10 c20
tof e10 e51
tof e10 e30
tof e10 e11
tof e10 c00
tof e10 c21
tof e10
tof c21
tof c00
tof b3
tof b0
tof c40
T e10
T* c21
T e31
T* c31
T c00
T* b3
T* e11
T* b0
T* c40
T e30
T* e51
T c20
tof b3 e10
tof a0 c21
tof c21 e10
tof e11 e31
tof a0 c31
tof c31 e31
tof a0 c00
tof a0 b3
tof a0 e11
tof a0 b0
tof a0 c40
tof a0 e30
tof a0 e51
tof e51 c20
tof e30 c20
tof b0 c40
tof c00 c40
T* b3
T e10
T* e11
T e31
T* b0
T e30
T* e51
T* c21
T* c31
T c00
T c40
T* c20
tof c21 b3
tof e10 b3
tof a0 e10
tof c31 e11
tof e31 e11
tof a0 e31
tof e51 e30
tof c00 b0
tof c40 b0
tof c20 e30
tof a0 e30
tof a0 c00
tof a0 c40
tof a0 c20
tof e30 e51
tof b0 c00
tof e31 c31
tof e10 c21
T* b0
T c40
T* c20
T e30
T b3
T e10
T e11
T e31
tof c00 a0
tof a0 b0
tof a0 c40
tof e51 c20
tof e51 e30
tof c21 e10
tof c31 e31
tof c00 a0
tof a0 e11
tof a0 e31
tof e11 e31
tof b3 e10
tof c20 e30
tof b0 c40
tof e10 c21
tof e31 c31
P e10
P* c21
P e31
P* c31
P c40
P e30
tof c21 e10
tof c31 e31
tof c00 c40
tof e51 e30
tof e31 c31
tof e10 c21
P e10
P e31
P c00
P* c40
P e51
P* e30
tof c40 c00
tof e30 e51
tof e51 e30
tof c00 c40
H e10
H e31
H c40
H e30
H e70
H e71
tof c40 e10
tof c40 e31
tof c40 e70
tof e30 e71
tof e10 e31
tof e10 c40
tof e31 e71
tof e31 e30
tof a0 c40
tof a0 e71
tof a0 e30
tof a0 e31
tof a0 e70
tof a0
tof e70
tof e10
T a0
T e70
T* e10
T e31
T* e30
T e71
tof e10 e70
tof c40 a0
tof e70 a0
tof c40 e10
tof c40 e31
tof c40 e30
tof e30 e71
tof e31 e71
tof a0 e70
T* e10
T* a0
T e31
T* e30
T e70
T* e71
tof e70 e10
tof a0 e10
tof c40 a0
tof e71 e31
tof c40 e31
tof e30 e31
tof c40 e71
tof e31 e30
tof a0 e70
T* e71
T e31
T* a0
T e10
tof e30 e71
tof e30 e31
tof e70 a0
tof e70 e10
tof a0 e10
tof e71 e31
P e10
P e70
P e31
tof e70 e10
tof e30 e31
P* e10
P e30
P* e31
tof e31 e30
tof e70 e10
tof e30 e31
H e70
H e31
tof c21 a1
tof a1 c21
tof c21 a1
tof a1 c31
tof c31 a1
tof a1 c31
tof c31 c30
tof c30 c31
tof c31 c30
tof c30 b2
tof b2 c30
tof c30 b2
tof b2 e10
tof e10 b2
tof b2 e10
tof e10 b3
tof b3 e10
tof e10 b3
tof b3 e30
tof e30 b3
tof b3 e30
tof e30 a0
tof a0 e30
tof e30 a0
tof c00 c40
tof c40 c00
tof c00 c40
tof c40 c51
tof c51 c40
tof c40 c51
tof c51 e50
tof e50 c51
tof c51 e50
tof e50 b0
tof b0 e50
tof e50 b0
tof e51 c20
tof c20 e51
tof e51 c20
tof c20 c61
tof c61 c20
tof c20 c61
tof c61 c70
tof c70 c61
tof c61 c70
tof c70 b1
tof b1 c70
tof c70 b1
tof c10 c41
tof c41 c10
tof c10 c41
tof c41 c01
tof c01 c41
tof c41 c01
tof e71 e31
tof e31 e71
tof e71 e31
END
