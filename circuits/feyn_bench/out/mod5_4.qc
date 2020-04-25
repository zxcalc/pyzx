# Feynman -- quantum circuit toolkit
# Original (mod5_4.qc):
#   Qubits: 5
#   H: 6
#   T: 28
#   X: 1
#   cnot: 32
#   Depth: 41
#   T depth: 12
# Result (4.640ms):
#   Qubits: 5
#   H: 6
#   T: 16
#   X: 1
#   cnot: 26
#   Depth: 44
#   T depth: 15
.v b c d e a
.i b c d e
.o b c d e a
BEGIN 
X a
H a
cnot b a
T* a
cnot e a
T a
cnot b a
cnot d a
T* a
cnot e a
T a
cnot d a
H a
cnot e a
H a
T a
cnot c a
T* a
cnot d a
T a
cnot c a
T* a
cnot d a
H a
cnot d a
H a
T* a
cnot b a
T a
cnot c a
T* a
cnot b a
T a
cnot c a
H a
cnot b c
T c
cnot d c
cnot b c
T* c
cnot b e
T* e
cnot d e
cnot b e
T e
cnot b a
cnot d c
cnot d e
cnot c a
END
