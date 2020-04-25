# Feynman -- quantum circuit toolkit
# Original (grover_5.qc):
#   Qubits: 9
#   H: 142
#   T: 336
#   X: 65
#   cnot: 336
#   Depth: 457
#   T depth: 144
# Result (45.969ms):
#   Qubits: 9
#   H: 84
#   S: 12
#   T: 154
#   cnot: 226
#   swap: 1
#   Depth: 382
#   T depth: 128
.v a b c d e result 0 1 2
.i 
.o a b c d e result 0 1 2
BEGIN 
H a
H b
H c
H d
H e
H 0
T 0
cnot a 0
T 0
cnot b 0
T 0
cnot a 0
T 0
cnot b 0
swap 1 2
H 0
H 1
T 1
cnot 0 1
T* 1
cnot c 1
T 1
cnot 0 1
T* 1
cnot c 1
H 1
H 2
T 2
cnot 1 2
T* 2
cnot d 2
T 2
cnot 1 2
T* 2
cnot d 2
H 2
S 2
cnot e 2
S 2
cnot e 2
H 2
cnot 2 1
T 1
cnot d 1
T* 1
cnot 2 1
cnot d 1
H 1
cnot 1 0
T 0
cnot c 0
T* 0
cnot 1 0
cnot c 0
H 0
cnot 0 a
T* a
cnot b a
T* a
cnot 0 a
cnot b a
H a
cnot 0 b
T* b
cnot 0 b
H b
cnot 1 c
T c
cnot 1 c
H c
cnot 2 d
T d
cnot 2 d
H d
S* e
cnot a 0
T 0
cnot b 0
T 0
cnot a 0
T 0
cnot b 0
H 0
cnot 0 1
T* 1
cnot c 1
T* 1
cnot 0 1
T 1
cnot c 1
H 1
T e
cnot 1 e
T* e
cnot d e
T* e
cnot 1 e
T e
cnot d e
T 1
cnot d 1
T 1
cnot d 1
H 1
cnot 1 0
T 0
cnot c 0
T 0
cnot 1 0
cnot c 0
H 0
cnot 0 a
T* a
cnot b a
T* a
cnot 0 a
cnot b a
H a
cnot 0 b
T* b
cnot 0 b
H b
cnot 1 c
T* c
cnot 1 c
H c
T* d
H d
cnot a 0
T 0
cnot b 0
T 0
cnot a 0
T 0
cnot b 0
H 0
cnot 0 1
T* 1
cnot c 1
T 1
cnot 0 1
T* 1
cnot c 1
H 1
cnot 1 2
T* 2
cnot d 2
T 2
cnot 1 2
T* 2
cnot d 2
H 2
S 2
cnot e 2
S 2
cnot e 2
H 2
cnot 2 1
T 1
cnot d 1
T* 1
cnot 2 1
cnot d 1
H 1
cnot 1 0
T 0
cnot c 0
T* 0
cnot 1 0
cnot c 0
H 0
cnot 0 a
T* a
cnot b a
T* a
cnot 0 a
cnot b a
H a
cnot 0 b
T* b
cnot 0 b
H b
cnot 1 c
T c
cnot 1 c
H c
cnot 2 d
T d
cnot 2 d
H d
S* e
cnot a 0
T 0
cnot b 0
T 0
cnot a 0
T 0
cnot b 0
H 0
cnot 0 1
T* 1
cnot c 1
T* 1
cnot 0 1
T 1
cnot c 1
H 1
T e
cnot 1 e
T* e
cnot d e
T* e
cnot 1 e
T e
cnot d e
T 1
cnot d 1
T 1
cnot d 1
H 1
cnot 1 0
T 0
cnot c 0
T 0
cnot 1 0
cnot c 0
H 0
cnot 0 a
T* a
cnot b a
T* a
cnot 0 a
cnot b a
H a
cnot 0 b
T* b
cnot 0 b
H b
cnot 1 c
T* c
cnot 1 c
H c
T* d
H d
cnot a 0
T 0
cnot b 0
T 0
cnot a 0
T 0
cnot b 0
H 0
cnot 0 1
T* 1
cnot c 1
T 1
cnot 0 1
T* 1
cnot c 1
H 1
cnot 1 2
T* 2
cnot d 2
T 2
cnot 1 2
T* 2
cnot d 2
H 2
S 2
cnot e 2
S 2
cnot e 2
H 2
cnot 2 1
T 1
cnot d 1
T* 1
cnot 2 1
cnot d 1
H 1
cnot 1 0
T 0
cnot c 0
T* 0
cnot 1 0
cnot c 0
H 0
cnot 0 a
T* a
cnot b a
T* a
cnot 0 a
cnot b a
H a
cnot 0 b
T* b
cnot 0 b
H b
cnot 1 c
T c
cnot 1 c
H c
cnot 2 d
T d
cnot 2 d
H d
S* e
cnot a 0
T 0
cnot b 0
T 0
cnot a 0
T 0
cnot b 0
H 0
cnot 0 1
T* 1
cnot c 1
T* 1
cnot 0 1
T 1
cnot c 1
H 1
T e
cnot 1 e
T* e
cnot d e
T* e
cnot 1 e
T e
cnot d e
T 1
cnot d 1
T 1
cnot d 1
H 1
cnot 1 0
T 0
cnot c 0
T 0
cnot 1 0
cnot c 0
H 0
cnot 0 a
T* a
cnot b a
T* a
cnot 0 a
cnot b a
H a
cnot 0 b
T* b
cnot 0 b
H b
cnot 1 c
T* c
cnot 1 c
H c
T* d
H d
cnot a 0
T 0
cnot b 0
T 0
cnot a 0
T 0
cnot b 0
H 0
cnot 0 1
T* 1
cnot c 1
T 1
cnot 0 1
T* 1
cnot c 1
H 1
cnot 1 2
T* 2
cnot d 2
T 2
cnot 1 2
T* 2
cnot d 2
H 2
H result
S 2
cnot e 2
S 2
cnot e 2
H 2
T* 2
cnot 1 2
T 2
cnot d 2
T* 2
cnot 1 2
T 2
cnot d 2
H 2
H 1
cnot 1 0
T 0
cnot c 0
T* 0
cnot 1 0
cnot c 0
H 0
cnot 0 a
T* a
cnot b a
T* a
cnot 0 a
cnot b a
H a
cnot 0 b
T* b
cnot 0 b
H b
cnot 1 c
T c
cnot 1 c
H c
H d
S* e
cnot a 0
T 0
cnot b 0
T 0
cnot a 0
T 0
cnot b 0
H 0
cnot 0 1
T* 1
cnot c 1
T* 1
cnot 0 1
T 1
cnot c 1
H 1
T e
cnot 1 e
T* e
cnot d e
T* e
cnot 1 e
T e
cnot d e
T 1
cnot d 1
T 1
cnot d 1
H 1
T* 1
cnot 0 1
T 1
cnot c 1
T 1
cnot 0 1
T* 1
cnot c 1
H 1
H 0
T* 0
cnot a 0
T* 0
cnot b 0
T* 0
cnot a 0
T* 0
cnot b 0
H 0
H a
H b
H c
T* d
H d
END
