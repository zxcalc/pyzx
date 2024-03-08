# Original circuit
#   qubits: 9
#   qubits used: 9
#   H: 14
#   cnot: 49
#   X: 0
#   T: 49
#   P: 0
#   Z: 0
#   tdepth (by partitions): 21
#   tdepth (by critical paths): 21
# Optimized circuit
#   qubits: 9
#   qubits used: 9
#   H: 14
#   cnot: 94
#   X: 0
#   T: 31
#   P: 9
#   Z: 0
#   tdepth (by partitions): 12
#   tdepth (by critical paths): 12
#   Time: 0.001 s
.v 1 2 3 4 5 6 7 8 9
.i 1 2 3 4 5 9
.o 1 2 3 4 5 6 7 8 9

BEGIN
H 6
tof 6 1
tof 6 2
tof 8 6
tof 6 8
tof 2 8
tof 1 8
T 6
T* 1
T* 2
T 8
T 5
tof 1 6
tof 2 6
tof 8 6
tof 8 1
tof 2 8
tof 1 2
H 2
H 7
tof 2 3
tof 7 3
tof 6 3
tof 6 2
tof 6 7
tof 7 6
tof 2 7
tof 3 2
T 6
T* 2
T* 7
T 3
tof 2 6
tof 7 2
tof 7 3
tof 2 7
tof 6 3
tof 6 7
tof 6 2
H 7
H 3
tof 3 4
tof 3 7
T 3
T* 4
T* 7
tof 4 3
tof 7 3
tof 4 7
tof 3 7
tof 3 4
T 3
tof 4 3
tof 7 3
H 7
H 9
tof 7 5
T 7
T 9
T* 5
tof 9 7
tof 5 7
tof 5 9
tof 7 5
T* 7
T* 5
T 9
tof 9 7
tof 9 5
tof 5 9
tof 7 9
H 9
H 7
tof 7 3
tof 7 4
T 7
T* 3
T* 4
tof 3 7
tof 4 7
tof 3 4
tof 7 4
tof 7 3
T 7
tof 3 7
tof 4 7
H 4
tof 1 8
tof 3 7
P* 8
P 2
P 3
P* 7
tof 1 8
tof 7 3
tof 3 7
H 7
tof 7 6
tof 7 2
T 7
T* 6
T* 2
tof 6 7
tof 2 7
tof 6 2
tof 7 2
tof 7 6
T 7
tof 6 7
tof 2 7
H 2
tof 7 6
P 8
P 1
P 7
P* 6
P 3
tof 7 6
H 6
tof 6 8
tof 6 1
T 6
T* 8
T* 1
tof 8 6
tof 1 6
tof 8 1
tof 6 1
tof 6 8
T 6
tof 8 6
tof 1 6
H 1
tof 6 1
tof 1 6
tof 6 1
tof 8 4
tof 4 8
tof 8 4
tof 4 3
tof 3 4
tof 4 3
tof 3 7
tof 7 3
tof 3 7
tof 7 2
tof 2 7
tof 7 2
END
