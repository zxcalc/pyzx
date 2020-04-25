# Feynman -- quantum circuit toolkit
# Original (vbe_adder_3.qc):
#   Qubits: 10
#   H: 10
#   T: 70
#   cnot: 80
#   Depth: 79
#   T depth: 24
# Result (5.230ms):
#   Qubits: 10
#   H: 10
#   S: 6
#   T: 24
#   cnot: 46
#   Depth: 62
#   T depth: 17
.v 0 1 2 3 4 5 6 7 8 9
.i 0 1 2 3 4 5 6 7 8 9
.o 0 1 2 3 4 5 6 7 8 9
BEGIN 
H 3
H 6
H 9
cnot 1 3
T* 3
cnot 2 3
S 3
cnot 1 3
T* 3
cnot 0 3
cnot 1 3
T* 3
cnot 2 3
cnot 1 3
T 3
cnot 0 3
cnot 1 2
H 3
cnot 4 6
T* 6
cnot 5 6
S 6
cnot 4 6
T* 6
cnot 3 6
cnot 4 6
T* 6
cnot 5 6
cnot 4 6
T 6
cnot 4 5
cnot 3 6
H 6
cnot 7 9
T* 9
cnot 8 9
S 9
cnot 7 9
T* 9
cnot 6 9
cnot 7 9
T* 9
cnot 8 9
cnot 7 9
T 9
cnot 7 8
cnot 6 8
cnot 6 9
H 9
T* 6
cnot 8 6
S* 6
cnot 7 6
T 6
cnot 8 6
cnot 7 6
H 6
cnot 3 6
T* 6
cnot 5 6
T 6
cnot 3 6
S* 6
cnot 4 6
T 6
cnot 5 6
T 6
cnot 4 6
cnot 3 5
H 6
H 3
cnot 0 3
T* 3
cnot 2 3
T 3
cnot 0 3
S* 3
cnot 1 3
T 3
cnot 2 3
T 3
cnot 1 3
cnot 0 2
H 3
T 7
T 8
END
