# Feynman -- quantum circuit toolkit
# Original (barenco_tof_10.qc):
#   Qubits: 19
#   H: 34
#   T: 224
#   cnot: 224
#   Depth: 288
#   T depth: 96
# Result (35.620ms):
#   Qubits: 19
#   H: 34
#   T: 100
#   cnot: 144
#   Depth: 242
#   T depth: 81
.v 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
.i 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
.o 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
BEGIN 
H 19
T 18
cnot 10 18
T* 18
cnot 19 18
T 18
cnot 10 18
T* 18
cnot 19 18
H 18
T 17
cnot 18 17
T* 17
cnot 9 17
T 17
cnot 18 17
T* 17
cnot 9 17
H 17
T 16
cnot 17 16
T* 16
cnot 8 16
T 16
cnot 17 16
T* 16
cnot 8 16
H 16
T 15
cnot 16 15
T* 15
cnot 7 15
T 15
cnot 16 15
T* 15
cnot 7 15
H 15
T 14
cnot 15 14
T* 14
cnot 6 14
T 14
cnot 15 14
T* 14
cnot 6 14
H 14
T 13
cnot 14 13
T* 13
cnot 5 13
T 13
cnot 14 13
T* 13
cnot 5 13
H 13
T 12
cnot 13 12
T* 12
cnot 4 12
T 12
cnot 13 12
T* 12
cnot 4 12
H 12
T 11
cnot 12 11
T* 11
cnot 3 11
T 11
cnot 12 11
T* 11
cnot 3 11
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
cnot 11 12
T 12
cnot 3 12
T* 12
cnot 11 12
cnot 3 12
H 12
cnot 12 13
T 13
cnot 4 13
T* 13
cnot 12 13
cnot 4 13
H 13
cnot 13 14
T 14
cnot 5 14
T* 14
cnot 13 14
cnot 5 14
H 14
cnot 14 15
T 15
cnot 6 15
T* 15
cnot 14 15
cnot 6 15
H 15
cnot 15 16
T 16
cnot 7 16
T* 16
cnot 15 16
cnot 7 16
H 16
cnot 16 17
T 17
cnot 8 17
T* 17
cnot 16 17
cnot 8 17
H 17
cnot 17 18
T 18
cnot 9 18
T* 18
cnot 17 18
cnot 9 18
H 18
cnot 10 19
cnot 18 19
T* 19
cnot 10 19
T 19
cnot 18 19
H 19
T* 18
cnot 10 18
T 18
cnot 10 18
H 18
cnot 18 17
T* 17
cnot 9 17
T 17
cnot 18 17
cnot 9 17
H 17
cnot 17 16
T* 16
cnot 8 16
T 16
cnot 17 16
cnot 8 16
H 16
cnot 16 15
T* 15
cnot 7 15
T 15
cnot 16 15
cnot 7 15
H 15
cnot 15 14
T* 14
cnot 6 14
T 14
cnot 15 14
cnot 6 14
H 14
cnot 14 13
T* 13
cnot 5 13
T 13
cnot 14 13
cnot 5 13
H 13
cnot 13 12
T* 12
cnot 4 12
T 12
cnot 13 12
cnot 4 12
H 12
cnot 12 11
T* 11
cnot 3 11
T 11
cnot 12 11
cnot 3 11
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
cnot 11 12
T 12
cnot 3 12
T* 12
cnot 11 12
cnot 3 12
H 12
cnot 12 13
T 13
cnot 4 13
T* 13
cnot 12 13
cnot 4 13
H 13
cnot 13 14
T 14
cnot 5 14
T* 14
cnot 13 14
cnot 5 14
H 14
cnot 14 15
T 15
cnot 6 15
T* 15
cnot 14 15
cnot 6 15
H 15
cnot 15 16
T 16
cnot 7 16
T* 16
cnot 15 16
cnot 7 16
H 16
cnot 16 17
T 17
cnot 8 17
T* 17
cnot 16 17
cnot 8 17
H 17
cnot 17 18
T 18
cnot 9 18
T* 18
cnot 17 18
cnot 9 18
H 18
T* 11
T* 12
T* 13
T* 14
T* 15
T* 16
T* 17
cnot 11 3
T 3
cnot 12 4
T 4
cnot 13 5
T 5
cnot 14 6
T 6
cnot 15 7
T 7
cnot 16 8
T 8
cnot 17 9
T 9
cnot 17 9
cnot 16 8
cnot 15 7
cnot 14 6
cnot 13 5
cnot 12 4
cnot 11 3
END
