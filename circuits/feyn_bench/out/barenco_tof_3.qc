# Feynman -- quantum circuit toolkit
# Original (barenco_tof_3.qc):
#   Qubits: 5
#   H: 8
#   T: 28
#   cnot: 28
#   Depth: 36
#   T depth: 12
# Result (1.981ms):
#   Qubits: 5
#   H: 6
#   T: 16
#   cnot: 18
#   Depth: 37
#   T depth: 16
.v 1 2 3 4 5
.i 1 2 3 4 5
.o 1 2 3 4 5
BEGIN 
H 5
T 4
cnot 3 4
T* 4
cnot 5 4
T 4
cnot 3 4
T* 4
cnot 5 4
H 4
T 4
cnot 1 4
T* 4
cnot 2 4
T 4
cnot 1 4
T* 4
cnot 2 4
H 4
cnot 3 5
cnot 4 5
T* 5
cnot 3 5
T 5
cnot 4 5
H 5
T* 4
cnot 3 4
T 4
cnot 3 4
H 4
T* 4
cnot 1 4
T 4
cnot 2 4
T* 4
cnot 1 4
T 4
cnot 2 4
H 4
END
