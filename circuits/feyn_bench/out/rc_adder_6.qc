# Feynman -- quantum circuit toolkit
# Original (rc_adder_6.qc):
#   Qubits: 14
#   H: 22
#   T: 77
#   X: 8
#   cnot: 104
#   Depth: 104
#   T depth: 33
# Result (19.396ms):
#   Qubits: 14
#   H: 22
#   T: 47
#   cnot: 71
#   Depth: 92
#   T depth: 36
.v b0 a0 e b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 z
.i b0 a0 b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 z
.o b0 a0 e b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 z
BEGIN 
cnot a5 b5
cnot a4 b4
cnot a3 b3
cnot a2 b2
cnot a1 e
cnot a1 b1
H e
T e
cnot a0 e
T* e
cnot b0 e
T e
cnot a0 e
T* e
cnot b0 e
H e
cnot a2 a1
H a1
T a1
cnot b1 a1
T* a1
cnot e a1
T a1
cnot b1 a1
T* a1
cnot e a1
H a1
cnot a3 a2
H a2
T a2
cnot a1 a2
T* a2
cnot b2 a2
T a2
cnot a1 a2
T* a2
cnot b2 a2
H a2
cnot a4 a3
H a3
T a3
cnot a2 a3
T* a3
cnot b3 a3
T a3
cnot a2 a3
T* a3
cnot b3 a3
H a3
cnot a5 a4
H a4
T a4
cnot a3 a4
T* a4
cnot b4 a4
T a4
cnot a3 a4
T* a4
cnot b4 a4
H a4
cnot a5 z
H z
T z
cnot a4 z
T* z
cnot b5 z
T z
cnot a4 z
T* z
cnot b5 z
H z
T a4
T b5
cnot e b1
cnot a4 b5
cnot a3 b4
cnot a2 b3
cnot a1 b2
H a4
T* a4
cnot a3 a4
T a4
cnot b4 a4
T a4
cnot a3 a4
T* a4
cnot b4 a4
H a4
H a3
T* a3
cnot a2 a3
T a3
cnot b3 a3
T a3
cnot a2 a3
T* a3
cnot b3 a3
H a3
cnot a5 a4
H a2
T* a2
cnot a1 a2
T a2
cnot b2 a2
T a2
cnot a1 a2
T* a2
cnot b2 a2
H a2
cnot a4 a3
H a1
T* a1
cnot b1 a1
T* a1
cnot e a1
T a1
cnot b1 a1
T a1
cnot e a1
H a1
cnot a3 a2
H e
T* e
cnot a0 e
T e
cnot b0 e
T* e
cnot a0 e
T e
cnot b0 e
H e
cnot a0 b0
T* b5
cnot a2 a1
cnot a5 b5
cnot a4 b4
cnot a3 b3
cnot a2 b2
cnot a1 e
cnot a1 b1
END
