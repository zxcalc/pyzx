# Feynman -- quantum circuit toolkit
# Original (hwb6.qc):
#   Qubits: 7
#   H: 30
#   T: 105
#   X: 8
#   cnot: 131
#   Depth: 152
#   T depth: 45
# Result (17.929ms):
#   Qubits: 7
#   H: 26
#   S: 7
#   T: 75
#   X: 5
#   Z: 4
#   cnot: 110
#   swap: 1
#   Depth: 175
#   T depth: 63
.v a b c d e f 0
.i a b c d e f
.o a b c d e f
BEGIN 
cnot c a
H c
T c
cnot a c
T c
cnot b c
T* c
cnot a c
T* c
cnot b c
H c
T b
cnot a b
T b
cnot f d
cnot e f
cnot a b
H b
T b
cnot a b
T b
cnot c b
T* b
cnot a b
T* b
cnot c b
H b
H f
S f
cnot a f
T f
cnot c f
T* f
cnot a f
T* f
cnot b f
cnot c f
T f
cnot d f
T* f
cnot b f
T* f
cnot d f
cnot b d
H f
T d
cnot b d
T d
cnot f e
cnot b e
cnot b d
swap a b
H d
T d
cnot b d
T d
cnot c d
T* d
cnot b d
T* d
cnot c d
H d
T* c
Z c
cnot b c
T* c
Z c
cnot b c
cnot b f
H c
T c
cnot e c
T c
cnot f c
T* c
cnot e c
T* c
cnot f c
H c
H 0
T 0
cnot c 0
T* 0
cnot e 0
T* 0
cnot c 0
T 0
cnot e 0
H 0
Z b
X b
H b
T b
cnot 0 b
T* b
cnot f b
T b
cnot 0 b
T* b
cnot f b
H b
T 0
cnot f 0
T* 0
cnot f 0
H 0
T* 0
cnot c 0
T 0
cnot e 0
T 0
cnot c 0
T* 0
cnot e 0
H 0
T* a
S f
cnot e f
T f
cnot e f
cnot f c
cnot f a
cnot a d
H f
S f
cnot b f
T* f
cnot c f
T f
cnot b f
S* f
cnot e f
cnot d f
T f
cnot c f
T* f
cnot d b
cnot d e
cnot e f
cnot e a
H f
cnot b d
T d
cnot c d
T* d
cnot e d
cnot c d
cnot b d
T* d
cnot f c
cnot e d
cnot e f
X d
H d
T d
cnot b d
T d
cnot e d
T* d
cnot b d
T* d
cnot e d
H d
cnot c f
T* f
cnot e f
S f
cnot e f
cnot c f
H f
T f
cnot a f
T f
cnot d f
T* f
cnot a f
T* f
cnot d f
H f
T* a
cnot d a
T a
cnot d a
cnot a c
H a
T a
cnot b a
T a
cnot e a
T* a
cnot b a
T* a
cnot e a
H a
S* b
cnot e b
S b
cnot d c
cnot e b
X b
H b
T b
cnot a b
T* b
cnot c b
T b
cnot a b
T* b
cnot c b
H b
T a
T c
cnot a c
T* c
T d
T* e
Z e
cnot b a
cnot f d
cnot f e
cnot d e
cnot c e
cnot b e
cnot a e
cnot a c
cnot a b
X c
X f
END
