# Original circuit
#   qubits: 7
#   qubits used: 7
#   H: 10
#   cnot: 35
#   X: 0
#   T: 35
#   P: 0
#   Z: 0
#   tdepth (by partitions): 15
#   tdepth (by critical paths): 15
# Optimized circuit
#   qubits: 7
#   qubits used: 7
#   H: 10
#   cnot: 63
#   X: 0
#   T: 23
#   P: 6
#   Z: 0
#   tdepth (by partitions): 9
#   tdepth (by critical paths): 9
#   Time: 0.000 s
.v 1 2 3 4 5 6 7
.i 1 2 3 4 7
.o 1 2 3 4 5 6 7

BEGIN
H 5
tof 5 1
tof 5 2
tof 5 6
tof 2 5
tof 1 5
T 6
T* 1
T* 2
T 5
T 4
tof 1 6
tof 2 6
tof 5 6
tof 5 1
tof 2 5
tof 1 2
H 2
H 6
tof 6 3
tof 6 2
T 6
T* 3
T* 2
tof 3 6
tof 2 6
tof 3 2
tof 6 2
tof 6 3
T 6
tof 3 6
tof 2 6
H 2
H 7
tof 2 4
T 2
T 7
T* 4
tof 7 2
tof 4 2
tof 4 7
tof 2 4
T* 2
T* 4
T 7
tof 7 2
tof 7 4
tof 4 7
tof 2 7
H 7
H 2
tof 2 6
tof 2 3
T 2
T* 6
T* 3
tof 6 2
tof 3 2
tof 6 3
tof 2 3
tof 2 6
T 2
tof 6 2
tof 3 2
H 3
P 5
P 1
P 2
P 6
tof 1 5
tof 6 2
P* 5
P* 2
tof 1 5
tof 6 2
H 6
tof 6 5
tof 6 1
T 6
T* 5
T* 1
tof 5 6
tof 1 6
tof 5 1
tof 6 1
tof 6 5
T 6
tof 5 6
tof 1 6
H 1
tof 6 3
tof 3 6
tof 6 3
tof 3 2
tof 2 3
tof 3 2
tof 2 5
tof 5 2
tof 2 5
tof 5 1
tof 1 5
tof 5 1
END
