# Original circuit
#   qubits: 5
#   qubits used: 5
#   H: 6
#   cnot: 21
#   X: 0
#   T: 21
#   P: 0
#   Z: 0
#   tdepth (by partitions): 9
#   tdepth (by critical paths): 9
# Optimized circuit
#   qubits: 5
#   qubits used: 5
#   H: 6
#   cnot: 35
#   X: 0
#   T: 15
#   P: 3
#   Z: 0
#   tdepth (by partitions): 6
#   tdepth (by critical paths): 6
#   Time: 0.000 s
.v 1 2 3 4 5
.i 1 2 3 4
.o 1 2 3 4 5

BEGIN
H 5
tof 5 1
tof 5 2
T 5
T* 1
T* 2
T 3
tof 1 5
tof 2 5
tof 1 2
tof 5 2
tof 5 1
T 5
tof 1 5
tof 2 5
H 2
H 4
tof 2 3
T 2
T 4
T* 3
tof 4 2
tof 3 2
tof 3 4
tof 2 3
T* 2
T* 3
T 4
tof 4 2
tof 4 3
tof 3 4
tof 2 4
H 4
H 2
tof 2 5
tof 2 1
T 2
T* 5
T* 1
tof 5 2
tof 1 2
tof 5 1
tof 2 1
tof 2 5
T 2
tof 5 2
tof 1 2
H 1
tof 5 2
P* 2
tof 5 2
P 2
P 5
tof 2 5
tof 5 2
tof 2 5
tof 5 1
tof 1 5
tof 5 1
END
