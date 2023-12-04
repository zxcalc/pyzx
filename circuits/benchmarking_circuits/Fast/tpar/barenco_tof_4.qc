# Original circuit
#   qubits: 7
#   qubits used: 7
#   H: 10
#   cnot: 56
#   X: 0
#   T: 56
#   P: 0
#   Z: 0
#   tdepth (by partitions): 24
#   tdepth (by critical paths): 24
# Optimized circuit
#   qubits: 7
#   qubits used: 7
#   H: 10
#   cnot: 90
#   X: 0
#   T: 28
#   P: 12
#   Z: 1
#   tdepth (by partitions): 13
#   tdepth (by critical paths): 13
#   Time: 0.000 s
.v 1 2 3 4 5 6 7
.i 1 2 3 4 5 6 7
.o 1 2 3 4 5 6 7

BEGIN
H 7
tof 5 3
tof 6 4
tof 6 7
T 6
T* 4
T* 7
T 5
T* 3
tof 4 6
tof 7 6
tof 7 4
tof 3 5
tof 5 3
tof 4 7
tof 6 7
tof 6 4
T 6
tof 4 6
H 4
tof 3 5
tof 4 5
tof 4 3
T* 3
T 5
tof 5 3
tof 4 5
tof 3 5
H 5
tof 5 1
tof 5 2
T 5
T* 1
T* 2
tof 1 5
tof 2 5
tof 1 2
tof 5 2
tof 5 1
T 5
tof 1 5
tof 2 5
H 2
tof 2 3
tof 4 3
tof 4 2
tof 2 4
T* 2
T 3
tof 3 2
tof 4 3
tof 2 3
tof 1 5
tof 3 2
P 7
P* 6
P 3
P* 2
P* 5
P 4
tof 6 7
tof 2 3
tof 1 5
tof 3 2
tof 7 6
H 2
tof 2 7
tof 6 2
tof 2 6
T 6
T* 7
T* 2
tof 7 6
tof 2 6
tof 7 2
tof 6 2
tof 6 7
T 6
tof 7 6
tof 2 6
H 7
H 2
tof 4 3
tof 2 3
tof 2 4
T* 4
T 3
tof 3 4
tof 2 3
P 6
Z 4
P 5
P 1
P* 3
P 2
tof 4 3
H 3
tof 3 5
tof 3 1
T 3
T* 5
T* 1
tof 5 3
tof 1 3
tof 5 1
tof 3 1
tof 3 5
T 3
tof 5 3
tof 1 3
H 1
tof 1 4
tof 2 1
tof 1 2
T 2
T* 4
T* 1
tof 4 2
tof 1 2
tof 4 1
tof 2 1
tof 2 4
T 2
tof 4 2
tof 1 2
tof 4 2
P* 2
tof 4 2
H 4
tof 3 2
tof 2 3
tof 3 2
tof 2 5
tof 5 2
tof 2 5
tof 5 1
tof 1 5
tof 5 1
tof 6 4
tof 4 6
tof 6 4
END
