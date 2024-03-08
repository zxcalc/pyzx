# Original circuit
#   qubits: 19
#   qubits used: 19
#   H: 34
#   cnot: 224
#   X: 0
#   T: 224
#   P: 0
#   Z: 0
#   tdepth (by partitions): 96
#   tdepth (by critical paths): 96
# Optimized circuit
#   qubits: 19
#   qubits used: 19
#   H: 34
#   cnot: 328
#   X: 0
#   T: 100
#   P: 48
#   Z: 7
#   tdepth (by partitions): 43
#   tdepth (by critical paths): 43
#   Time: 0.003 s
.v 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
.i 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
.o 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19

BEGIN
H 19
tof 11 3
tof 12 4
tof 13 5
tof 14 6
tof 15 7
tof 16 8
tof 17 9
tof 18 10
tof 19 18
tof 18 19
T 19
T* 10
T* 18
T 17
T* 9
T 16
T* 8
T 15
T* 7
T 14
T* 6
T 13
T* 5
T 12
T* 4
T 11
T* 3
tof 18 10
tof 10 19
tof 9 17
tof 8 16
tof 7 15
tof 3 11
tof 11 3
tof 15 7
tof 16 8
tof 17 9
tof 19 10
tof 10 18
T 19
tof 10 19
H 10
tof 9 17
tof 10 17
tof 10 9
T* 9
T 17
tof 17 9
tof 10 17
tof 9 17
H 17
tof 8 16
tof 17 16
tof 17 8
T* 8
T 16
tof 16 8
tof 17 16
tof 8 16
H 16
tof 7 15
tof 16 15
tof 16 7
T* 7
T 15
tof 15 7
tof 16 15
tof 7 15
H 15
tof 15 6
tof 15 14
T* 14
T 6
tof 6 14
tof 15 6
tof 14 6
H 6
tof 6 5
tof 6 13
T* 13
T 5
tof 5 13
tof 6 5
tof 13 5
H 5
tof 5 4
tof 5 12
T* 12
T 4
tof 4 12
tof 5 4
tof 12 4
H 4
tof 3 11
tof 4 11
tof 4 3
T* 3
T 11
tof 11 3
tof 4 11
tof 3 11
H 11
tof 11 1
tof 11 2
T 11
T* 1
T* 2
tof 2 11
tof 1 11
tof 11 1
tof 1 2
T 11
tof 2 11
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
tof 5 12
tof 3 2
tof 15 14
tof 6 13
tof 17 8
tof 16 7
tof 10 9
P 18
P* 19
P 10
P* 9
P 17
P* 8
P 16
P* 7
P 15
P* 14
P 6
P* 13
P 5
P* 12
P 3
P* 2
P* 11
P 4
tof 19 18
tof 9 10
tof 8 17
tof 7 16
tof 2 3
tof 1 11
tof 3 2
tof 5 12
tof 6 13
tof 15 14
tof 16 7
tof 17 8
tof 10 9
tof 18 19
H 2
tof 2 12
tof 5 12
tof 5 2
tof 2 5
T* 2
T 12
tof 12 2
tof 5 12
tof 2 12
H 12
tof 12 13
tof 6 13
tof 6 12
tof 12 6
T* 12
T 13
tof 13 12
tof 6 13
tof 12 13
H 13
tof 13 14
tof 15 14
tof 15 13
tof 13 15
T* 13
T 14
tof 14 13
tof 15 14
tof 13 14
H 14
tof 14 16
tof 7 16
tof 7 14
tof 14 7
T* 14
T 16
tof 16 14
tof 7 16
tof 14 16
H 16
tof 16 17
tof 8 17
tof 8 16
tof 16 8
T* 16
T 17
tof 17 16
tof 8 17
tof 16 17
H 17
tof 17 10
tof 9 10
tof 9 17
tof 17 9
T* 17
T 10
tof 10 17
tof 9 10
tof 17 10
H 10
tof 10 18
tof 10 19
T 10
T* 18
T* 19
tof 19 10
tof 18 10
tof 10 18
tof 18 19
T 10
tof 18 10
tof 19 10
H 18
H 19
tof 9 17
tof 19 17
tof 19 9
T* 9
T 17
tof 17 9
tof 19 17
tof 9 17
tof 5 2
tof 6 12
tof 15 13
tof 7 14
tof 8 16
tof 17 9
P* 2
P 6
P* 12
P 15
P* 13
P 7
P* 14
P 8
P* 16
P 17
P* 9
P 19
tof 12 6
tof 13 15
tof 14 7
tof 16 8
tof 9 17
tof 17 9
tof 8 16
tof 7 14
tof 15 13
tof 6 12
H 9
tof 16 8
tof 9 8
tof 9 16
T* 16
T 8
tof 8 16
tof 9 8
tof 16 8
H 8
tof 14 7
tof 8 7
tof 8 14
T* 14
T 7
tof 7 14
tof 8 7
tof 14 7
H 7
tof 13 15
tof 7 15
tof 7 13
T* 13
T 15
tof 15 13
tof 7 15
tof 13 15
H 15
tof 12 6
tof 15 6
tof 15 12
T* 12
T 6
tof 6 12
tof 15 6
tof 12 6
H 6
tof 6 2
tof 6 5
T* 5
T 2
tof 2 5
tof 6 2
tof 5 2
tof 17 19
tof 3 4
P 10
Z 17
Z 16
Z 14
Z 13
Z 12
Z 5
Z 3
P 11
P 1
P* 4
P 2
P* 19
P 9
tof 3 4
tof 17 19
H 2
tof 4 3
tof 2 3
tof 2 4
T* 4
T 3
tof 3 4
tof 2 3
tof 4 3
H 3
tof 3 11
tof 3 1
T 3
T* 11
T* 1
tof 1 3
tof 11 3
tof 3 11
tof 11 1
T 3
tof 1 3
tof 11 3
H 1
tof 1 4
tof 2 1
tof 1 2
T 2
T* 4
T* 1
tof 1 2
tof 4 2
tof 2 4
tof 4 1
T 2
tof 4 2
tof 1 2
tof 6 5
tof 4 2
tof 7 13
tof 15 12
tof 9 16
tof 8 14
P* 16
P 8
P* 14
P 7
P* 13
P 15
P* 12
P 6
P* 5
P 4
P* 2
tof 14 8
tof 9 16
tof 13 7
tof 12 15
tof 4 2
tof 6 5
tof 15 12
tof 7 13
tof 8 14
H 4
tof 4 5
tof 4 6
T 4
T* 5
T* 6
tof 6 4
tof 5 4
tof 4 5
tof 5 6
T 4
tof 5 4
tof 6 4
H 5
tof 5 15
tof 5 12
T 5
T* 15
T* 12
tof 12 5
tof 15 5
tof 5 15
tof 15 12
T 5
tof 15 5
tof 12 5
H 15
tof 15 7
tof 15 13
T 15
T* 7
T* 13
tof 13 15
tof 7 15
tof 15 7
tof 7 13
T 15
tof 7 15
tof 13 15
H 7
tof 7 8
tof 14 7
tof 7 14
T 14
T* 8
T* 7
tof 7 14
tof 8 14
tof 14 8
tof 8 7
T 14
tof 8 14
tof 7 14
H 8
tof 8 16
tof 9 8
tof 8 9
T 9
T* 16
T* 8
tof 8 9
tof 16 9
tof 9 16
tof 16 8
T 9
tof 16 9
H 16
tof 16 17
tof 19 16
tof 16 19
T 19
T* 17
T* 16
tof 16 19
tof 17 19
tof 19 17
tof 17 16
T 19
tof 17 19
tof 16 19
H 17
tof 3 2
tof 2 3
tof 3 2
tof 2 11
tof 11 2
tof 2 11
tof 11 1
tof 1 11
tof 11 1
tof 6 15
tof 15 6
tof 6 15
tof 15 7
tof 7 15
tof 15 7
tof 7 14
tof 14 7
tof 7 14
tof 14 13
tof 13 14
tof 14 13
tof 13 12
tof 12 13
tof 13 12
tof 9 8
tof 8 9
tof 9 19
tof 19 9
tof 9 19
tof 19 18
tof 18 19
tof 19 18
tof 18 17
tof 17 18
tof 18 17
tof 17 16
tof 16 17
tof 17 16
END
