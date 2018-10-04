# Original circuit
#   qubits: 5
#   qubits used: 5
#   H: 6
#   cnot: 28
#   X: 0
#   T: 28
#   P: 0
#   Z: 0
#   tdepth (by partitions): 12
#   tdepth (by critical paths): 12
# Optimized circuit
#   qubits: 5
#   qubits used: 5
#   H: 6
#   cnot: 54
#   X: 0
#   T: 16
#   P: 6
#   Z: 0
#   tdepth (by partitions): 8
#   tdepth (by critical paths): 8
#   Time: 0.000 s
.v 1 2 3 4 5
.i 1 2 3 4 5
.o 1 2 3 4 5

BEGIN
H 5
tof 4 3
tof 4 5
T 4
T* 3
T* 5
tof 3 4
tof 5 4
tof 5 3
tof 3 5
tof 4 5
tof 4 3
T 4
tof 3 4
tof 5 4
H 3
tof 3 1
tof 3 2
T 3
T* 1
T* 2
tof 1 3
tof 2 3
tof 1 2
tof 3 2
tof 3 1
T 3
tof 1 3
tof 2 3
H 2
tof 2 4
tof 2 5
T 2
T* 4
T* 5
tof 4 2
tof 5 2
tof 4 5
tof 2 5
tof 2 4
T 2
tof 4 2
tof 5 2
tof 1 3
tof 4 2
P 4
P* 2
P* 3
tof 2 4
tof 1 3
tof 4 2
H 2
H 5
tof 5 3
tof 5 1
T 5
T* 3
T* 1
tof 3 5
tof 1 5
tof 3 1
tof 5 1
tof 5 3
T 5
tof 3 5
tof 1 5
H 1
P 4
P 5
P 3
tof 5 4
tof 4 5
tof 5 4
tof 4 1
tof 1 4
tof 4 1
tof 3 5
tof 5 3
tof 3 5
tof 5 2
tof 2 5
tof 5 2
END
