# Feynman -- quantum circuit toolkit
# Original (barenco_tof_4.qc):
#   Qubits: 7
#   H: 10
#   T: 56
#   cnot: 56
#   Depth: 72
#   T depth: 24
# Result (4.491ms):
#   Qubits: 7
#   H: 10
#   T: 28
#   cnot: 36
#   Depth: 64
#   T depth: 26
.v 1 2 3 4 5 6 7
.i 1 2 3 4 5 6 7
.o 1 2 3 4 5 6 7
BEGIN 
H 7
T 6
cnot 4 6
T* 6
cnot 7 6
T 6
cnot 4 6
T* 6
cnot 7 6
H 6
T 5
cnot 3 5
T* 5
cnot 6 5
T 5
cnot 3 5
T* 5
cnot 6 5
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
cnot 3 6
cnot 5 6
T* 6
cnot 3 6
T 6
cnot 5 6
H 6
cnot 4 7
cnot 6 7
T* 7
cnot 4 7
T 7
cnot 6 7
H 7
T* 6
cnot 4 6
T 6
cnot 4 6
H 6
cnot 3 5
cnot 6 5
T 5
cnot 3 5
T* 5
cnot 6 5
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
cnot 3 6
cnot 5 6
T* 6
cnot 3 6
T 6
cnot 5 6
H 6
T* 5
cnot 3 5
T 5
cnot 3 5
END
