# Original circuit
#   qubits: 19
#   qubits used: 19
#   H: 34
#   cnot: 119
#   X: 0
#   T: 119
#   P: 0
#   Z: 0
#   tdepth (by partitions): 51
#   tdepth (by critical paths): 51
# Optimized circuit
#   qubits: 19
#   qubits used: 19
#   H: 34
#   cnot: 232
#   X: 0
#   T: 71
#   P: 24
#   Z: 0
#   tdepth (by partitions): 27
#   tdepth (by critical paths): 27
#   Time: 0.002 s
.v 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
.i 1 2 3 4 5 6 7 8 9 10 19
.o 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19

BEGIN
H 11
tof 11 1
tof 11 2
tof 11 13
tof 2 11
tof 1 11
T 13
T* 1
T* 2
T 11
T 10
tof 2 13
tof 11 1
tof 1 13
tof 2 11
tof 1 2
H 2
H 12
tof 2 3
tof 12 3
tof 14 3
tof 14 2
tof 12 14
tof 2 14
tof 3 2
T 12
T* 2
T* 14
T 3
tof 2 12
tof 14 2
tof 14 3
tof 12 2
tof 12 3
tof 2 14
H 14
H 13
tof 14 4
tof 13 4
tof 15 4
tof 15 14
tof 15 13
tof 13 15
tof 14 13
tof 4 14
T 15
T* 14
T* 13
T 4
tof 14 15
tof 13 14
tof 13 4
tof 15 14
tof 15 4
tof 14 13
H 13
H 3
tof 3 5
tof 3 13
tof 16 3
tof 3 16
tof 13 3
tof 5 3
T 16
T* 5
T* 13
T 3
tof 5 16
tof 13 5
tof 13 3
tof 16 5
tof 16 3
tof 5 13
H 13
H 4
tof 4 6
tof 4 13
tof 17 4
tof 4 17
tof 13 4
tof 6 4
T 17
T* 6
T* 13
T 4
tof 6 17
tof 13 6
tof 13 4
tof 17 6
tof 17 4
tof 6 13
H 13
H 3
tof 13 7
tof 3 7
tof 18 7
tof 3 13
tof 3 18
tof 13 18
tof 7 18
T 3
T* 18
T* 13
T 7
tof 18 3
tof 13 18
tof 13 7
tof 3 18
tof 3 7
tof 18 13
H 13
H 4
tof 13 8
tof 4 8
tof 7 8
tof 4 13
tof 7 4
tof 4 7
tof 13 4
tof 8 4
T 7
T* 4
T* 13
T 8
tof 4 7
tof 13 4
tof 13 8
tof 7 4
tof 7 8
tof 4 13
H 13
H 8
tof 8 9
tof 8 13
T 8
T* 9
T* 13
tof 13 8
tof 9 8
tof 8 9
tof 9 13
T 8
tof 9 8
tof 13 8
H 13
H 19
tof 13 10
T 13
T 19
T* 10
tof 10 19
tof 19 13
tof 13 10
T* 13
T* 10
T 19
tof 19 13
tof 19 10
tof 10 19
tof 13 19
H 19
H 13
tof 13 8
tof 13 9
T 13
T* 8
T* 9
tof 9 13
tof 8 13
tof 13 8
tof 8 9
T 13
tof 8 13
tof 9 13
H 9
tof 1 11
tof 2 12
tof 14 15
tof 5 16
tof 6 17
tof 18 3
tof 4 7
tof 8 13
P* 11
P* 12
P* 15
P* 16
P* 17
P 18
P* 3
P 4
P* 7
P 8
P* 13
tof 1 11
tof 2 12
tof 14 15
tof 5 16
tof 3 18
tof 6 17
tof 7 4
tof 13 8
tof 8 13
tof 4 7
tof 18 3
H 13
tof 13 4
tof 13 7
T 13
T* 4
T* 7
tof 7 13
tof 4 13
tof 13 4
tof 4 7
T 13
tof 4 13
tof 7 13
H 7
H 4
tof 4 18
tof 4 3
T 4
T* 18
T* 3
tof 3 4
tof 18 4
tof 4 18
tof 18 3
T 4
tof 18 4
tof 3 4
H 3
H 18
tof 18 17
tof 18 6
T 18
T* 17
T* 6
tof 6 18
tof 17 18
tof 18 17
tof 17 6
T 18
tof 17 18
tof 6 18
H 6
P 11
P 1
P 12
P 2
P 15
P 14
P 16
P 5
P 18
P 17
P 4
P 13
P 8
H 17
tof 17 16
tof 17 5
T 17
T* 16
T* 5
tof 5 17
tof 16 17
tof 17 16
tof 16 5
T 17
tof 16 17
tof 5 17
H 5
H 16
tof 16 15
tof 16 14
T 16
T* 15
T* 14
tof 14 16
tof 15 16
tof 16 15
tof 15 14
T 16
tof 15 16
tof 14 16
H 14
H 15
tof 15 12
tof 15 2
T 15
T* 12
T* 2
tof 2 15
tof 12 15
tof 15 12
tof 12 2
T 15
tof 12 15
tof 2 15
H 2
H 12
tof 12 11
tof 12 1
T 12
T* 11
T* 1
tof 1 12
tof 11 12
tof 12 11
tof 11 1
T 12
tof 1 12
tof 11 12
H 1
tof 12 2
tof 2 12
tof 12 2
tof 2 11
tof 11 2
tof 2 11
tof 11 1
tof 1 11
tof 11 1
tof 14 5
tof 5 14
tof 14 5
tof 5 17
tof 17 5
tof 5 17
tof 17 7
tof 7 17
tof 17 7
tof 7 4
tof 4 7
tof 7 4
tof 4 16
tof 16 4
tof 4 16
tof 16 3
tof 3 16
tof 16 3
tof 3 15
tof 15 3
tof 3 15
tof 15 6
tof 6 15
tof 15 6
tof 6 18
tof 18 6
tof 6 18
tof 18 9
tof 9 18
tof 18 9
tof 9 8
tof 8 9
tof 9 8
tof 8 13
tof 13 8
tof 8 13
END
