# Feynman -- quantum circuit toolkit
# Original (barenco_tof_5.qc):
#   Qubits: 9
#   H: 14
#   T: 84
#   cnot: 84
#   Depth: 108
#   T depth: 36
# Result (5.617ms):
#   Qubits: 9
#   H: 14
#   T: 40
#   cnot: 54
#   Depth: 88
#   T depth: 34
.v 1 2 3 4 5 6 7 8 9
.i 1 2 3 4 5 6 7 8 9
.o 1 2 3 4 5 6 7 8 9
BEGIN 
H 9
T 8
cnot 5 8
T* 8
cnot 9 8
T 8
cnot 5 8
T* 8
cnot 9 8
H 8
T 7
cnot 4 7
T* 7
cnot 8 7
T 7
cnot 4 7
T* 7
cnot 8 7
H 7
T 6
cnot 3 6
T* 6
cnot 7 6
T 6
cnot 3 6
T* 6
cnot 7 6
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
cnot 3 7
cnot 6 7
T* 7
cnot 3 7
T 7
cnot 6 7
H 7
cnot 4 8
cnot 7 8
T* 8
cnot 4 8
T 8
cnot 7 8
H 8
cnot 5 9
cnot 8 9
T* 9
cnot 5 9
T 9
cnot 8 9
H 9
T* 8
cnot 5 8
T 8
cnot 5 8
H 8
cnot 4 7
cnot 8 7
T 7
cnot 4 7
T* 7
cnot 8 7
H 7
cnot 3 6
cnot 7 6
T 6
cnot 3 6
T* 6
cnot 7 6
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
cnot 3 7
cnot 6 7
T* 7
cnot 3 7
T 7
cnot 6 7
H 7
cnot 4 8
cnot 7 8
T* 8
cnot 4 8
T 8
cnot 7 8
H 8
T* 6
cnot 3 6
T 6
T* 7
cnot 7 4
T 4
cnot 7 4
cnot 3 6
END
