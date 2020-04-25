# Feynman -- quantum circuit toolkit
# Original (tof_4.qc):
#   Qubits: 7
#   H: 10
#   T: 35
#   cnot: 35
#   Depth: 45
#   T depth: 15
# Result (3.470ms):
#   Qubits: 7
#   H: 10
#   T: 23
#   cnot: 22
#   Depth: 44
#   T depth: 18
.v 1 2 3 4 5 6 7
.i 1 2 3 4 7
.o 1 2 3 4 5 6 7
BEGIN 
H 5
T 5
cnot 1 5
T* 5
cnot 2 5
T 5
cnot 1 5
T* 5
cnot 2 5
H 5
H 6
T 6
cnot 3 6
T* 6
cnot 5 6
T 6
cnot 3 6
T* 6
cnot 5 6
H 6
H 7
T 7
cnot 4 7
T* 7
cnot 6 7
T 7
cnot 4 7
T* 7
cnot 6 7
H 7
T 6
cnot 4 6
T* 6
cnot 4 6
H 6
T* 6
cnot 3 6
T 6
cnot 5 6
T* 6
cnot 3 6
T 6
cnot 5 6
H 6
H 5
T* 5
cnot 1 5
T 5
cnot 2 5
T* 5
cnot 1 5
T 5
cnot 2 5
H 5
T 4
END
