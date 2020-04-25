# Feynman -- quantum circuit toolkit
# Original (tof_3.qc):
#   Qubits: 5
#   H: 6
#   T: 21
#   cnot: 21
#   Depth: 27
#   T depth: 9
# Result (1.772ms):
#   Qubits: 5
#   H: 6
#   T: 15
#   cnot: 14
#   Depth: 29
#   T depth: 12
.v 1 2 3 4 5
.i 1 2 3 4
.o 1 2 3 4 5
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
H 4
T 4
cnot 3 4
T* 4
cnot 5 4
T 4
cnot 3 4
T* 4
cnot 5 4
H 4
T 5
cnot 3 5
T* 5
cnot 3 5
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
T 3
END
