# Original circuit
#   qubits: 10
#   qubits used: 10
#   H: 10
#   cnot: 80
#   X: 0
#   T: 70
#   P: 0
#   Z: 0
#   tdepth (by partitions): 30
#   tdepth (by critical paths): 24
# Optimized circuit
#   qubits: 10
#   qubits used: 10
#   H: 10
#   cnot: 114
#   X: 0
#   T: 24
#   P: 13
#   Z: 0
#   tdepth (by partitions): 9
#   tdepth (by critical paths): 9
#   Time: 0.000 s
.v 0 1 2 3 4 5 6 7 8 9
.i 0 1 2 3 4 5 6 7 8 9
.o 0 1 2 3 4 5 6 7 8 9

BEGIN
H 3
H 6
H 9
tof 3 0
tof 3 1
tof 3 2
T* 1
T* 2
T* 0
T 7
T 8
tof 2 1
tof 0 1
tof 0 2
tof 3 2
tof 9 7
tof 9 8
tof 6 4
tof 6 5
tof 2 0
tof 1 2
T 1
T* 4
T* 5
T* 7
T* 8
tof 2 1
tof 0 1
tof 3 1
tof 6 4
tof 6 5
tof 9 7
tof 9 8
tof 2 1
tof 0 1
P 3
P* 1
P 4
P 5
P 6
P 9
tof 2 1
tof 0 1
tof 0 2
tof 2 0
H 3
tof 4 3
tof 5 3
tof 6 3
tof 5 4
tof 4 6
tof 3 6
tof 3 4
T* 4
T 3
tof 3 4
tof 5 4
tof 5 3
tof 6 3
tof 4 3
H 3
tof 7 3
tof 8 3
tof 8 7
tof 9 7
tof 7 9
tof 3 9
tof 3 7
T 9
T* 3
T* 7
tof 3 9
tof 7 9
tof 3 7
tof 9 7
tof 9 3
T 9
tof 8 9
tof 3 9
tof 7 9
tof 7 8
tof 9 8
tof 4 5
H 3
H 7
tof 7 6
tof 7 4
tof 8 9
tof 9 8
tof 6 5
tof 0 2
T* 6
T 5
T* 4
tof 5 6
tof 4 6
tof 4 5
tof 7 5
tof 7 4
tof 6 5
T* 6
tof 7 6
tof 6 4
tof 5 4
P 0
P 2
P 1
P 5
P* 4
P 7
tof 6 4
tof 8 9
tof 4 6
tof 5 4
tof 0 2
H 7
H 5
tof 5 1
tof 5 0
tof 6 4
tof 9 8
tof 8 9
tof 4 6
tof 1 2
T* 1
T 2
T* 0
tof 2 1
tof 0 1
tof 0 2
tof 5 2
tof 5 0
tof 1 2
T* 1
tof 5 1
P 5
tof 0 2
tof 1 2
tof 9 8
tof 6 4
tof 0 1
tof 2 1
H 5
tof 1 0
tof 0 1
tof 1 0
tof 5 4
tof 4 5
tof 5 4
tof 4 6
tof 6 4
tof 4 6
tof 6 7
tof 7 6
tof 6 7
tof 7 9
tof 9 7
tof 7 9
tof 9 3
tof 3 9
tof 9 3
END
