# Original circuit
#   qubits: 11
#   qubits used: 11
#   H: 30
#   cnot: 122
#   X: 24
#   T: 119
#   P: 0
#   Z: 0
#   tdepth (by partitions): 51
#   tdepth (by critical paths): 48
# Optimized circuit
#   qubits: 11
#   qubits used: 11
#   H: 30
#   cnot: 290
#   X: 19
#   T: 73
#   P: 19
#   Z: 2
#   tdepth (by partitions): 25
#   tdepth (by critical paths): 25
#   Time: 0.003 s
.v x0 x1 c1 x2 c2 x3 c3 x4 c4 d4 z
.i x0 x1 x2 x3 x4 z
.o x0 x1 c1 x2 c2 x3 c3 x4 c4 d4 z

BEGIN
H c2
tof x3 x0
tof c2 x1
tof c3 c2
tof c2 c3
tof x2 c3
tof x1 x2
T c2
T* x1
T* c3
T x2
T x4
T* x0
tof x1 c2
tof c3 c2
tof x2 c2
tof x2 x1
tof x2 c3
tof x3 x0
tof c3 x2
tof x1 x2
H x2
tof x3
H c2
tof c2 x0
tof c2 x2
tof c4 x3
tof c2 c4
tof x3 c4
tof x2 c4
tof x2 x3
tof x0 x2
tof x0 c4
tof x0
tof c4
T c2
T* x0
T* c4
T x3
tof c4 c2
tof x2 c2
tof c4 x0
tof x2 c4
tof c4 x3
tof x0 x3
tof c2 x3
tof c2 c4
tof c2 x0
H c4
H d4
tof d4 c1
tof d4 x3
tof x4 x3
tof x2 c4
tof x2 c1
tof x2 x4
tof x2
tof x4
tof c1
T x2
T d4
T* x4
T* c1
T* x3
tof c4 x2
tof x4 d4
tof c4 c1
tof c4 x3
tof x4 c1
tof d4 c1
tof d4 x3
tof d4 x4
tof x2 c1
tof x2 x3
T d4
tof c4 d4
tof x2 d4
tof x4 d4
H x4
H x2
H x3
tof x2 c4
tof x3 c1
tof x4 c1
tof z c1
tof x2 x0
tof z x3
tof z x4
tof x3 x4
tof x3 z
tof x0 x2
tof x0 c2
tof c4 c2
tof c4 x2
tof c4
tof x2
T* c4
T* x2
T x0
T z
T* x3
T* x4
T c1
tof x0 c4
tof c2 c4
tof x0 x2
tof c2 x2
tof x3 z
tof x4 x3
tof x4 c1
tof x3 x4
tof z c1
tof z x4
tof z x3
tof x2 x0
tof c4 x0
H x4
tof c3 c2
tof x1 c3
tof d4 c1
tof d4 c4
tof c1
tof c4
Z x1
P* c3
P c1
P c4
P* x2
P z
P x3
P* c2
tof c3 x1
tof c2 x1
tof c2 c3
tof c4 c1
tof x2 c1
tof x2 c4
tof d4 c4
tof c4 x2
tof x1 c3
tof x1 c2
H c4
H c1
tof d4 x1
tof x4 x1
tof c3 c2
tof c4 c2
tof x0 x2
tof x4 x2
tof c2 c3
T* c3
T c2
T c1
T* x2
T x1
tof c1 c3
tof x4 c3
tof c4 c3
tof c1 c2
tof x4 c2
tof c4 c2
tof x1 c1
tof d4 c1
tof x0 x2
tof x4 x2
tof d4 x1
tof c3 c2
tof c3 x1
T* c1
T* c3
T x1
tof x1 c1
tof x4 c1
tof x1 c3
tof x4 c3
tof c3 x1
tof c1 x1
tof x4 c3
tof x4 c1
tof x4 x2
H x1
tof x1 c3
tof c4 c2
tof c3 x1
tof c3 x4
tof c3 c2
tof c3 c4
P c3
T c3
T* c4
T c2
T* x4
tof x4 c3
tof c2 c4
tof x4 c2
tof x1 x4
tof c4 c2
tof c3 x4
tof c3 c2
tof c3 c1
tof c2 c4
tof x3 z
tof c1 c3
P c1
P x0
P* z
P c2
P* c4
P x1
P c3
P x2
tof c3 c1
tof x3 z
tof c4 c2
tof c2 c4
H c4
tof c4 x1
tof x0 x1
tof x0 c4
tof c1 x0
tof x0 c1
tof c4 c1
tof c4 x0
tof x1 c4
tof x1 x2
T* x1
T x2
T c1
T* x0
tof x2 x1
tof c1 x2
tof c4 x2
tof x0 c1
tof c1 x0
tof x1 x2
H x2
H d4
tof c4 x2
tof c4 c1
tof c4
tof c1
T c4
T d4
T* c1
tof d4 c4
tof c1 d4
tof c4 c1
T* c4
T* c1
T d4
tof d4 c4
tof d4 c1
tof x2 c1
tof x2 d4
tof c1 d4
tof c4 d4
H d4
H c1
tof c1 x2
tof c1 x0
tof c1 x1
tof x2 x0
tof x2
T c1
T* x2
T* x1
tof x2 c1
tof x1 c1
tof x1 x2
tof x0 x1
tof c1 x2
tof c1 x1
T c1
tof x0 c1
tof x1 c1
tof x2 c1
H x2
tof x4 x0
tof c2 x0
tof c2 x4
tof c1 x4
tof x1 c2
tof c1 c2
tof c1 x1
tof x4 c2
tof x4 c1
tof x4 x1
tof x0 x1
tof x0 x4
tof x0 c1
tof c1
tof x4
P* x0
P c1
P* x4
Z c4
tof x1 x0
tof c2 x0
tof x1 c1
tof x1 x4
tof c1 x4
H x4
tof x4 c1
tof x4 c4
T x4
T* c1
T* c4
tof c1 x4
tof c4 x4
tof c4 c1
tof x4 c1
tof x4 c4
T x4
tof c4 x4
tof c1 x4
H c1
H c4
tof c4 x1
tof c4 c2
tof c4 x0
tof x1 c2
tof x1
T c4
T* x1
T* x0
tof x1 c4
tof x0 c4
tof x0 x1
tof c2 x0
tof c4 x1
tof c4 x0
T c4
tof c2 c4
tof x0 c4
tof x1 c4
H x1
H c4
tof c4 c2
tof c4 x0
tof x4 c4
tof c4 x4
tof c2 x0
tof c2
T x4
T* c2
T* c4
tof c2 x4
tof c4 x4
tof c4 c2
tof x0 c4
tof x4 c2
tof x4 c4
T x4
tof x0 x4
tof c4 x4
tof c2 x4
H c2
H c4
tof c4 x0
tof c4 c3
T c4
T* x0
T* c3
tof x0 c4
tof c3 c4
tof x0 c3
tof c4 c3
tof c4 x0
T c4
tof x0 c4
tof c3 c4
H c3
tof c4
H x0
tof x0 c4
tof z c4
tof x0 x4
tof c4
T x0
T* c4
T* x4
tof c4 x0
tof x4 x0
tof c4 x4
tof x0 x4
tof x0 c4
T x0
tof z x0
tof c4 x0
tof x4 x0
H x4
H c4
tof c4 z
tof c4 x3
T c4
T* z
T* x3
tof z c4
tof x3 c4
tof z x3
tof c4 x3
tof c4 z
T c4
tof z c4
tof x3 c4
H x3
tof c3 x2
tof x2 c3
tof c3 x2
tof x2 c2
tof c2 x2
tof x2 c2
tof c2 x1
tof x1 c2
tof c2 x1
tof x1 x4
tof x4 x1
tof x1 x4
tof x4 d4
tof d4 x4
tof x4 d4
tof d4 z
tof z d4
tof d4 z
tof z c4
tof c4 z
tof z c4
tof c4 x3
tof x3 c4
tof c4 x3
tof x3 c1
tof c1 x3
tof x3 c1
END
