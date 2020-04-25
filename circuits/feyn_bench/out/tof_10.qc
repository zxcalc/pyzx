# Feynman -- quantum circuit toolkit
# Original (tof_10.qc):
#   Qubits: 19
#   H: 34
#   T: 119
#   cnot: 119
#   Depth: 153
#   T depth: 51
# Result (33.765ms):
#   Qubits: 19
#   H: 34
#   T: 71
#   cnot: 70
#   Depth: 134
#   T depth: 54
.v 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
.i 1 2 3 4 5 6 7 8 9 10 19
.o 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
BEGIN 
H 11
T 11
cnot 1 11
T* 11
cnot 2 11
T 11
cnot 1 11
T* 11
cnot 2 11
H 11
H 12
T 12
cnot 11 12
T* 12
cnot 3 12
T 12
cnot 11 12
T* 12
cnot 3 12
H 12
H 13
T 13
cnot 12 13
T* 13
cnot 4 13
T 13
cnot 12 13
T* 13
cnot 4 13
H 13
H 14
T 14
cnot 13 14
T* 14
cnot 5 14
T 14
cnot 13 14
T* 14
cnot 5 14
H 14
H 15
T 15
cnot 14 15
T* 15
cnot 6 15
T 15
cnot 14 15
T* 15
cnot 6 15
H 15
H 16
T 16
cnot 15 16
T* 16
cnot 7 16
T 16
cnot 15 16
T* 16
cnot 7 16
H 16
H 17
T 17
cnot 16 17
T* 17
cnot 8 17
T 17
cnot 16 17
T* 17
cnot 8 17
H 17
H 18
T 18
cnot 17 18
T* 18
cnot 9 18
T 18
cnot 17 18
T* 18
cnot 9 18
H 18
H 19
T 19
cnot 10 19
T* 19
cnot 18 19
T 19
cnot 10 19
T* 19
cnot 18 19
H 19
T 18
cnot 10 18
T* 18
cnot 10 18
H 18
T* 18
cnot 17 18
T 18
cnot 9 18
T* 18
cnot 17 18
T 18
cnot 9 18
H 18
H 17
T* 17
cnot 16 17
T 17
cnot 8 17
T* 17
cnot 16 17
T 17
cnot 8 17
H 17
H 16
T* 16
cnot 15 16
T 16
cnot 7 16
T* 16
cnot 15 16
T 16
cnot 7 16
H 16
H 15
T* 15
cnot 14 15
T 15
cnot 6 15
T* 15
cnot 14 15
T 15
cnot 6 15
H 15
H 14
T* 14
cnot 13 14
T 14
cnot 5 14
T* 14
cnot 13 14
T 14
cnot 5 14
H 14
H 13
T* 13
cnot 12 13
T 13
cnot 4 13
T* 13
cnot 12 13
T 13
cnot 4 13
H 13
H 12
T* 12
cnot 11 12
T 12
cnot 3 12
T* 12
cnot 11 12
T 12
cnot 3 12
H 12
H 11
T* 11
cnot 1 11
T 11
cnot 2 11
T* 11
cnot 1 11
T 11
cnot 2 11
H 11
T 10
END
