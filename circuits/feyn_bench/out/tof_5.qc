# Feynman -- quantum circuit toolkit
# Original (tof_5.qc):
#   Qubits: 9
#   H: 14
#   T: 49
#   cnot: 49
#   Depth: 63
#   T depth: 21
# Result (4.976ms):
#   Qubits: 9
#   H: 14
#   T: 31
#   cnot: 30
#   Depth: 59
#   T depth: 24
.v 1 2 3 4 5 6 7 8 9
.i 1 2 3 4 5 9
.o 1 2 3 4 5 6 7 8 9
BEGIN 
H 6
T 6
cnot 1 6
T* 6
cnot 2 6
T 6
cnot 1 6
T* 6
cnot 2 6
H 6
H 7
T 7
cnot 3 7
T* 7
cnot 6 7
T 7
cnot 3 7
T* 7
cnot 6 7
H 7
H 8
T 8
cnot 4 8
T* 8
cnot 7 8
T 8
cnot 4 8
T* 8
cnot 7 8
H 8
H 9
T 9
cnot 5 9
T* 9
cnot 8 9
T 9
cnot 5 9
T* 9
cnot 8 9
H 9
T 8
cnot 5 8
T* 8
cnot 5 8
H 8
T* 8
cnot 4 8
T 8
cnot 7 8
T* 8
cnot 4 8
T 8
cnot 7 8
H 8
H 7
T* 7
cnot 3 7
T 7
cnot 6 7
T* 7
cnot 3 7
T 7
cnot 6 7
H 7
H 6
T* 6
cnot 1 6
T 6
cnot 2 6
T* 6
cnot 1 6
T 6
cnot 2 6
H 6
T 5
END
