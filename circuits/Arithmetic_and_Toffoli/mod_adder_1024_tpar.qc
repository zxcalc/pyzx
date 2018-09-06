# Original circuit
#   qubits: 28
#   qubits used: 28
#   H: 570
#   cnot: 2005
#   X: 0
#   T: 1995
#   P: 0
#   Z: 0
#   tdepth (by partitions): 855
#   tdepth (by critical paths): 831
# Optimized circuit
#   qubits: 28
#   qubits used: 28
#   H: 330
#   cnot: 3540
#   X: 0
#   T: 1011
#   P: 302
#   Z: 0
#   tdepth (by partitions): 259
#   tdepth (by critical paths): 250
#   Time: 0.098 s
.v x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 0 1 2 3 4 5 6 7
.i x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20
.o x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 0 1 2 3 4 5 6 7

BEGIN
tof x10 x20
H x20
tof x9 x19
H 0
tof 0 x8
tof x19 x9
tof x20 x9
tof 0 4
tof 0 6
tof x20 3
tof x19 3
tof x20 1
tof x18 4
tof x18 2
tof x11 5
tof x9 3
tof x9 1
tof x9 x19
tof x8 6
tof x8 2
tof x1 5
T 3
T 1
T x20
T* x19
T* x9
P 6
T 6
P x18
T x18
T 0
T* x8
T* 4
T 2
P* x7
T* x7
P* x17
T* x17
T* x6
T* x16
T x5
T x15
P x4
T x4
P x14
T x14
P* x3
T* x3
P* x13
T* x13
T* x2
T* x12
T x1
T x11
T* 5
tof x19 3
tof x9 1
tof x20 3
tof x20 1
tof x19 x20
tof x9 x19
tof 0 6
tof x8 6
tof x8 0
tof 5 x11
tof x11 5
tof x1 x11
tof x8 4
tof x8 2
tof 0 4
tof x18 4
tof x18 2
tof 0 x8
tof x20 x19
tof x19 x9
tof x20 x19
H x8
tof x19 x20
tof x8 x19
tof x8 x9
tof 1 x8
tof x8 1
tof x9 x8
tof x19 x8
T 1
T* x19
T* x9
T x8
tof x20 x19
tof x19 1
tof x9 x19
tof x20 x8
tof x9 x8
tof 1 x19
tof 1 x8
tof x19 x9
tof 1 x20
H x9
H x20
tof x9 0
tof x20 x18
tof x9 x18
tof x8 x18
tof 2 x9
tof x8 x9
tof x8 2
tof x9 2
tof x20 x8
tof x20 2
tof x18 x9
tof x18 x8
tof 0 x18
tof 0 2
T* 0
T* x8
T x20
T* 2
T* x9
T x18
tof x20 0
tof 2 0
tof x8 0
tof 2 x20
tof 2 x18
tof x20 2
tof 2 x9
tof 0 x8
tof 0 x9
tof 0 x18
H 2
H x18
tof x18 x7
tof x18 x17
tof x19 2
tof x18 x9
tof 2 x19
tof x17 x18
tof x7 x18
T x9
T* x7
T* x17
T x18
T x19
T* 2
tof x17 x9
tof x18 x7
tof x7 x9
tof x18 x17
tof 2 x19
tof x19 2
tof x17 x18
tof x7 x18
tof x20 0
H x18
tof 0 x20
tof x8 0
tof x18 0
tof x18 x8
T* x8
T 0
tof x20 0
tof 0 x8
tof x18 0
tof x8 0
tof x20 x8
tof x18 x8
P 0
P x18
P* x8
tof x8 x18
tof x20 x18
tof x20 x8
tof x18 x8
H 0
tof 0 x19
tof x9 2
tof x19 2
tof 0 x9
tof x19 x9
tof 2 x9
T 0
T* x9
T* x19
T 2
tof x19 0
tof x19 x9
tof x19 2
tof 0 x9
tof x9 2
tof 0 x19
tof x18 x20
H x19
tof x20 x18
tof x19 x17
tof x8 x20
tof x19 x7
tof x19 x20
tof 2 x19
tof x8 2
tof x19 2
tof x20 x8
tof x7 x19
tof x17 x19
T* 2
T* x8
T x20
T* x17
T* x7
T x19
tof x20 2
tof x17 x8
tof x8 2
tof x18 x8
tof x18 x20
tof x17 x20
tof x7 x17
tof x7 x19
tof x17 x7
tof x8 x20
tof 2 x8
tof 2 x19
tof 2 x7
tof 2 x17
H x20
P x7
P x20
tof x18 x8
H x7
H x9
tof x20 2
tof x7 x8
tof x20 x17
tof x19 x7
tof 4 x19
tof x19 4
tof x7 x19
tof x7 4
tof x9 3
tof x9 x7
tof x9 x19
tof x8 3
tof x8 x7
T* 2
T* x17
T 4
T x9
T* x8
T* x19
T* x7
T 3
tof x20 2
tof x20 x17
tof x8 4
tof x18 4
tof x7 x19
tof x18 x8
tof x18 x19
tof x18 x7
tof x18 3
tof x8 x19
tof x8 3
tof x9 x7
tof 4 x7
tof x7 x19
tof x9 3
tof 4 x8
tof 4 x18
H x9
H x8
H x18
tof x17 2
tof x18 2
tof x8 x17
tof x18 x17
tof 0 x9
tof 3 x8
tof x19 x8
tof x19 x7
tof 3 x7
tof 3 x19
tof x8 3
tof x8 x7
tof x8 x19
tof x9 0
tof x18 3
tof x17 x18
tof x17 x7
tof x18 x19
tof 3 x8
tof 2 x19
tof 2 3
tof 2 x17
T* x17
T* x18
T 3
T x8
T* x19
T* x7
T 2
T 0
T* x9
tof x19 x18
tof 2 x18
tof x18 x17
tof 2 3
tof x19 3
tof x19 x8
tof 2 x19
tof 2 x7
tof x9 0
tof 0 x9
tof x19 2
tof x18 3
tof x17 3
tof x17 x8
tof x17 x7
tof x17 2
H 2
H x7
tof x7 x6
tof x18 2
tof x8 x7
tof x7 x8
tof 2 x18
tof x16 x8
tof x6 x16
T x7
T* x6
T* x8
T x16
P x18
T x18
T* 2
tof x8 x7
tof x16 x6
tof x6 x7
tof x16 x8
tof 2 x18
tof x8 x16
tof x6 x16
tof x17 x19
H x16
tof x19 x17
tof x20 x19
tof x16 x19
tof x16 x20
T* x20
T x19
tof x17 x19
tof x19 x20
tof x16 x19
tof x20 x19
H x19
tof x19 2
tof x19 x18
T* x18
T 2
tof x19 x18
tof x19 2
tof x18 2
tof x17 x20
tof x16 x20
tof x19 2
P x18
P x16
P* x20
P x19
P* 2
tof x20 x16
tof x17 x16
tof 2 x19
tof x17 x20
tof x19 2
tof x16 x20
H x18
tof x18 0
tof x7 x9
tof 0 x9
tof x18 x7
tof 0 x7
tof x9 x7
T x18
T* x7
T* 0
T x9
tof 0 x18
tof 0 x7
tof 0 x9
tof x18 x7
tof x7 x9
tof x18 0
tof x16 x17
H 0
tof x17 x16
tof 0 x17
tof 0 x19
tof 2 0
tof x19 2
T* 0
T* x19
T 2
T* x17
tof 2 0
tof x17 x19
tof x16 x19
tof x19 0
tof x16 x17
tof x17 2
tof x19 2
tof 0 x19
tof 0 x17
tof 0 x16
H 2
tof x6 x8
tof 2 x8
tof x9 x8
tof x16 0
tof 2 x6
tof 2 x16
tof x20 x16
tof x20 2
tof x9 x20
tof x20 x9
tof 2 x20
tof x16 x9
tof x6 x20
tof x8 x20
T* 2
T* x9
T x16
T* x20
T* x6
T x8
tof x16 2
tof x20 x9
tof x9 2
tof 0 x9
tof 0 x16
tof x20 x16
tof x6 x20
tof x6 x8
tof x20 x6
tof x9 x16
tof 2 x9
tof 2 x8
tof 2 x6
tof 2 x20
H x16
P x17
P x6
P x16
tof 0 x9
H x6
tof x16 2
tof x16 x20
tof x17 x9
tof x6 x9
tof x6 x17
T* 2
T* x20
T* x17
T x9
tof x16 2
tof x16 x20
tof 0 x9
tof x9 x17
tof x6 x9
tof x17 x9
H x9
H x7
tof x7 x19
tof x11 x19
tof x11 x9
tof x11 3
tof x9 x11
tof x9 x8
tof x9 3
tof x7 3
tof x7 x9
tof x19 x9
tof x19 x8
T x11
T x7
T* x9
T* 3
T* x19
T x8
tof x9 x11
tof x9 3
tof 3 x19
tof x9 x8
tof x7 3
tof x11 3
tof 3 x19
tof x7 x8
tof x11 x9
tof x17 0
H x7
H x9
tof x20 2
tof x9 2
tof 0 x17
tof x9 0
tof x6 0
tof x18 x7
tof x8 x6
tof x6 x9
tof x6 x8
tof x9 x6
tof x7 x18
tof 0 x8
tof x20 x6
tof 2 x20
T* x9
T* x8
T 0
T* x20
T* x6
T 2
T x18
T* x7
tof 0 x9
tof x20 x8
tof x6 x8
tof 2 x8
tof x8 x9
tof x17 x8
tof x6 0
tof 2 x20
tof x17 0
tof x20 0
tof 2 x6
tof x7 x18
tof x18 x7
tof x6 2
tof x20 2
tof x8 0
tof x17 x8
tof 0 x8
P 0
P* x8
P 2
tof x17 x8
tof x8 0
tof 0 x8
tof 0 x17
H x8
H 2
H x11
tof x8 x6
tof x17 0
tof x8 x20
tof 2 x17
tof 3 x11
tof 3 2
tof x19 2
tof 3 x9
tof x19 x9
tof x19 3
tof 3 x19
tof 2 3
tof 2 x9
tof x11 x19
tof x17 x11
tof x19 x9
tof x11 2
tof x20 x8
tof x6 x8
T* x6
T* x20
T x8
T 3
T x19
T* x17
T* x9
T* 2
T x11
tof x8 x6
tof x8 x20
tof x17 3
tof 0 3
tof 0 x17
tof 0 2
tof 0 x11
tof x9 x11
tof x17 x9
tof x19 x9
tof x19 2
tof x9 x11
tof 3 2
tof 3 x9
tof 3 x17
tof x20 x8
tof x6 x8
tof 3 0
H x19
H x17
H 0
tof 0 x20
tof 6 x6
tof x9 x19
tof x17 0
tof x17 x19
tof 6 x11
tof 6 2
tof x17 6
tof x17 x9
tof x17 x11
tof x19 x9
tof 0 x11
tof 0 x17
tof 0 2
tof x6 x11
tof x6 2
tof x6 6
tof x20 2
tof x20 0
tof x20 x6
T* 0
T* 6
T 2
T x17
T* x20
T* x11
T x6
P x9
T x9
T* x19
tof x17 0
tof x20 0
tof 6 0
tof x20 x17
tof x17 2
tof x9 x19
tof x20 x11
tof x20 x6
tof x17 x11
tof x17 x20
tof 6 2
tof 0 6
tof 0 x6
tof 0 x11
tof 6 x19
H x20
H x19
tof x19 x5
tof x19 x11
tof x20 x8
tof x15 x19
tof x5 x15
T x11
T* x5
T* x19
T x15
P* x20
T* x20
T* x8
tof x19 x11
tof x15 x5
tof x5 x11
tof x15 x19
tof x8 x20
tof x19 x15
tof x5 x15
tof x17 0
H x15
tof 0 x17
tof x16 0
tof x15 0
tof x15 x16
T* x16
T 0
tof x17 0
tof 0 x16
tof x15 0
tof x16 0
H 0
tof 0 x8
tof 0 x20
T* x20
T x8
tof 0 x20
tof 0 x8
tof x20 x8
tof x17 x16
tof x15 x16
tof 0 x8
P x20
P 6
P x15
P* x16
P 0
P* x8
tof x17 x16
tof x16 x15
tof x8 0
tof 0 x8
tof x15 x16
H x20
tof 6 x9
tof x20 x9
tof x20 6
T* 6
T x9
tof x9 6
tof x20 x9
tof 6 x9
H x9
tof x9 x18
tof x11 x7
tof x18 x7
tof x11 x9
tof x9 x11
tof x18 x9
tof x7 x9
T x11
T* x9
T* x18
T x7
tof x18 x11
tof x18 x9
tof x18 x7
tof x11 x9
tof x9 x7
tof x11 x18
H x18
tof x18 0
tof x18 6
tof x20 x18
tof 6 x20
T* x18
T* 6
T x20
T* 0
tof x20 x18
tof 0 6
tof 0 x20
tof 6 x20
tof x18 6
tof 6 0
tof x20 x18
P x20
P* x18
P 0
tof x18 x20
tof x17 x15
tof x20 x18
H x18
tof x18 x15
tof x18 6
tof x8 6
tof x8 x18
tof 6 x8
T* x18
T* x8
T 6
T* x15
tof 6 x18
tof x15 x8
tof x17 x8
tof x8 x18
tof x17 x15
tof x15 6
tof x8 6
tof x18 x8
tof x18 x15
tof x18 x17
H 6
tof x5 x19
tof x17 x18
tof 6 x19
tof x7 x19
tof 6 x17
tof x7 x5
tof x7 6
tof x16 x7
tof 6 x7
tof x5 6
tof x17 x16
tof x19 x5
T* x7
T* x17
T x16
T* x5
T* 6
T x19
tof x16 x7
tof x5 x17
tof x17 x7
tof x18 x17
tof x18 x16
tof x5 x16
tof 6 x5
tof 6 x19
tof x5 6
tof x17 x16
tof x7 x17
tof x7 x19
tof x7 6
tof x7 x5
H x16
P x15
P 6
P x16
tof x18 x17
H 6
tof x16 x7
tof x15 x17
tof 6 x17
tof x16 x5
tof 6 x15
T* x7
T* x5
T* x15
T x17
tof x16 x7
tof x16 x5
tof x18 x17
tof x17 x15
tof 6 x17
tof x15 x17
H x17
tof 0 x8
tof x17 x8
tof x17 0
T* 0
T x8
tof x8 0
tof x17 x8
tof 0 x8
H x8
H x9
tof x9 x20
tof x19 x20
tof x19 x8
tof x19 x6
tof x8 2
tof x8 x19
tof x8 x6
tof x9 x6
tof x9 x8
tof x20 x8
tof x20 2
T x19
T x9
T* x8
T* x6
T* x20
T 2
tof x8 x19
tof x20 x6
tof x8 x6
tof x8 2
tof x9 x20
tof x19 x20
tof x20 x6
tof x9 2
tof x19 x8
tof x15 x18
H x9
H x8
tof x18 x15
tof x8 x18
tof x8 0
tof x17 x8
tof x9 x11
tof 0 x17
T* x8
T* 0
T x17
T* x18
T x9
T* x11
tof x17 x8
tof x18 0
tof x15 0
tof 0 x8
tof x15 x18
tof x18 x17
tof x11 x9
tof x9 x11
tof 0 x17
tof x8 0
tof x8 x18
tof x15 x8
tof 6 x8
tof x17 0
P 6
P* x8
P x17
P* 0
P x18
tof x15 x8
tof x8 6
tof 0 x17
tof x17 0
tof 6 x8
tof 6 x15
H 0
tof x5 x7
tof x15 6
tof 0 x7
tof x20 x7
tof 0 x15
tof x20 x5
tof x8 0
tof x20 x8
tof x8 x20
tof 0 x8
tof x5 x8
tof x15 x20
tof x7 x5
T* 0
T* x15
T x20
T* x5
T* x8
T x7
tof x20 0
tof x5 x15
tof x15 0
tof 6 x15
tof 6 x20
tof x5 x20
tof x8 x5
tof x8 x7
tof x5 x8
tof x15 x20
tof 0 x15
tof 0 x7
tof 0 x8
tof 0 x5
H x20
P x8
P x20
tof 6 x15
H x8
tof x20 0
tof x18 x15
tof x8 x15
tof x20 x5
tof x8 x18
tof x5 x20
tof 0 x20
T* 0
T* x5
T x20
T* x18
T x15
tof x20 0
tof x20 x5
tof x15 x18
tof 6 x18
tof 6 x15
tof x8 x15
tof x18 x15
tof x5 x20
tof 0 x20
H x15
H x19
tof x7 x17
tof x19 x17
tof x7 x15
tof x7 x6
tof x15 x7
tof x15 2
tof x15 x6
tof x19 x15
tof x17 x15
tof x19 x6
tof x17 2
T x7
T x19
T* x15
T* x6
T* x17
T 2
tof x15 x7
tof x17 x6
tof x15 x6
tof x15 2
tof x19 x17
tof x7 x17
tof x17 x6
tof x19 2
tof x7 x15
tof x18 6
H x19
H x15
tof 0 x5
tof 6 x18
tof x15 x5
tof x15 6
tof x8 6
tof x17 6
tof x8 x17
tof x15 x8
tof 0 x15
tof 6 x17
tof x5 0
T* x8
T* x17
T 6
T* 0
T* x15
T x5
P x19
T x19
tof x15 0
tof x5 0
tof x18 x17
tof 0 x8
tof 0 x17
tof x18 6
tof 0 6
tof x15 0
tof x5 x15
tof x15 x5
tof 0 x5
tof x17 6
tof x8 6
tof x18 x17
tof x8 x17
P x8
P* x17
P x5
tof x18 x17
tof x17 x8
tof x8 x17
tof x8 x18
H x17
H x5
H x7
tof x18 x8
tof x17 x15
tof x7 x18
tof x17 0
tof 6 x18
tof x6 x5
tof x6 6
tof 6 2
tof x5 2
tof x5 x6
tof x5 6
tof x7 6
tof x7 x5
tof x18 6
tof 0 x17
tof x18 2
tof x15 x17
T* x15
T* 0
T x17
T x6
T x7
T* 6
T* x5
T* x18
T 2
tof x17 x15
tof x17 0
tof 6 x6
tof x8 x6
tof x8 6
tof 2 x5
tof x8 x5
tof x8 x18
tof x8 2
tof 6 2
tof x7 2
tof 2 x5
tof x7 x18
tof x6 x5
tof x6 x18
tof x6 6
tof 0 x17
tof x15 x17
tof x6 x8
H x7
H 6
H x8
tof x8 0
tof x18 0
tof x8 x15
tof x18 x8
tof 6 x19
tof x18 6
tof 6 x18
tof 6 2
tof 6 x5
tof x7 x17
tof x8 x18
tof x15 x8
tof x18 2
tof x15 x5
tof x8 6
tof 0 x5
tof 0 x18
tof 0 x8
T* x18
T* 6
T x5
T 2
T* 0
T* x15
T x8
P* x7
T* x7
T* x17
T* x19
tof x15 x18
tof x8 x18
tof 6 x18
tof x19 6
tof x8 x5
tof x19 x5
tof x15 x5
tof x15 2
tof x8 0
tof x8 x15
tof x17 x7
tof x15 x8
tof 6 x5
tof x18 6
tof x18 2
tof x18 0
tof x18 x8
tof 6 x19
H x8
H 0
tof x14 x4
tof 0 x4
tof 2 0
tof 0 2
tof x8 x20
tof x14 2
tof x4 x14
T 0
T* x14
T* 2
T x4
T* x8
T* x20
tof 2 0
tof x4 x14
tof x14 0
tof x4 2
tof x20 x8
tof 2 x4
tof x14 x4
tof x15 x18
H x4
tof x18 x15
tof x16 x18
tof x4 x18
tof x4 x16
T* x16
T x18
tof x15 x18
tof x18 x16
tof x4 x18
tof x16 x18
H x18
tof x18 x20
tof x18 x8
T* x8
T x20
tof x18 x8
tof x18 x20
tof x8 x20
H x8
tof x8 x17
tof x8 x7
T* x7
T x17
tof x8 x7
tof x8 x17
tof x7 x17
tof x15 x16
tof x4 x16
tof x8 x17
tof x18 x20
P x7
P x19
P x4
P* x16
P x18
P* x20
P x8
P* x17
tof x15 x16
tof x16 x4
tof x20 x18
tof x17 x8
tof x8 x17
tof x18 x20
tof x4 x16
H x7
tof x19 6
tof x7 6
tof x7 x19
T* x19
T 6
tof 6 x19
tof x7 6
tof x19 6
H 6
tof 6 x11
tof 6 x9
tof 6 0
tof x9 0
tof x11 0
T 6
T* x11
T* x9
T 0
tof x9 6
tof x9 x11
tof x9 0
tof 6 x11
tof x11 0
tof 6 x9
H x9
tof x9 x8
tof x9 x19
tof x7 x9
tof x19 x7
T* x9
T* x19
T x7
T* x8
tof x7 x9
tof x8 x19
tof x8 x7
tof x19 x7
tof x9 x19
tof x19 x8
tof x7 x9
P x7
P* x9
P x8
tof x9 x7
tof x15 x4
tof x7 x9
H x9
tof x9 x18
tof x9 x19
tof x17 x9
tof x19 x17
T* x9
T* x19
T x17
T* x18
tof x17 x9
tof x18 x19
tof x18 x17
tof x19 x17
tof x9 x19
tof x19 x18
H x17
tof x17 x4
tof x17 x19
tof x20 x17
tof x19 x20
T* x17
T* x19
T x20
T* x4
tof x20 x17
tof x4 x19
tof x15 x19
tof x19 x17
tof x15 x4
tof x4 x20
tof x19 x20
tof x17 x19
tof x17 x4
tof x17 x15
H x20
tof x20 2
tof x15 x17
tof 0 x14
tof x20 x15
tof x16 x20
tof x16 0
tof x20 0
tof x15 x16
tof x14 0
tof 2 x14
T* x20
T* x15
T x16
T* 2
T* 0
T x14
tof x16 x20
tof 2 x15
tof x15 x20
tof x17 x15
tof x17 x16
tof 2 x16
tof 0 2
tof 0 x14
tof 2 0
tof x15 x16
tof x20 x15
tof x20 x14
tof x20 0
tof x20 2
H x16
P x18
P x4
P 0
P x16
tof x17 x15
H 0
tof x16 x20
tof x16 2
tof x4 x15
tof 0 x15
tof 0 x4
T* x20
T* 2
T* x4
T x15
tof x16 x20
tof x16 2
tof x17 x15
tof x15 x4
tof 0 x15
tof x4 x15
H x15
tof x18 x19
tof x15 x19
tof x15 x18
T* x18
T x19
tof x19 x18
tof x15 x19
tof x18 x19
H x19
tof x8 x9
tof x19 x9
tof x19 x8
T* x8
T x9
tof x9 x8
tof x19 x9
tof x8 x9
H x9
H x11
tof x11 x7
tof x14 x7
tof x14 x9
tof x5 x14
tof x14 x5
tof x9 x14
tof x9 7
tof x9 x5
tof x11 x14
tof x11 x9
tof x7 x9
tof x7 7
T x5
T x11
T* x9
T* x14
T* x7
T 7
tof x9 x5
tof x7 x14
tof x9 x14
tof x9 7
tof x11 x7
tof x5 x7
tof x11 7
tof x7 x14
tof x5 x9
H x11
H x9
tof x9 x18
tof x9 x8
tof x19 x9
tof x11 6
tof x8 x19
T* x9
T* x8
T x19
T* x18
T x11
T* 6
tof x19 x9
tof x18 x8
tof x18 x19
tof 6 x11
tof x11 6
tof x8 x19
tof x9 x8
tof x8 x18
tof x17 x4
tof 0 x4
tof x19 x9
tof x15 x8
P 0
P* x4
P x15
P* x8
P x19
P* x9
P x18
tof x17 x4
tof x4 0
tof x8 x15
tof x9 x19
tof x19 x9
tof x15 x8
tof 0 x4
tof 0 x17
H x9
tof x17 0
tof x9 x17
tof x9 x15
tof x8 x9
tof x15 x8
T* x9
T* x15
T x8
T* x17
tof x8 x9
tof x17 x15
tof 0 x15
tof x15 x9
tof 0 x17
tof x17 x8
tof x15 x8
tof x9 x15
tof x9 x17
tof x9 0
H x8
tof x8 x20
tof 0 x9
tof x7 2
tof x8 0
tof x7 x8
tof x4 x7
tof x8 x7
tof 0 x4
tof 2 x8
tof x20 2
T* x7
T* 0
T x4
T* x20
T* x8
T 2
tof x4 x7
tof x20 0
tof 0 x7
tof x9 0
tof x9 x4
tof x20 x4
tof x8 x20
tof x8 2
tof x20 x8
tof 0 x4
tof x7 0
tof x7 2
tof x7 x8
tof x7 x20
H x4
P x17
P x8
P x4
tof x9 0
H x8
tof x20 x7
tof x4 x7
tof x4 x20
tof x17 0
tof x8 0
tof x8 x17
tof x20 x4
tof x7 x4
T* x4
T* x20
T x7
T* x17
T 0
tof x7 x4
tof x7 x20
tof 0 x17
tof x9 x17
tof x9 0
tof x8 0
tof x17 0
tof x20 x7
tof x4 x7
H 0
tof x18 x15
tof 0 x15
tof 0 x18
T* x18
T x15
tof x15 x18
tof 0 x15
tof x18 x15
H x15
H x5
tof 2 x19
tof x5 x19
tof 2 x15
tof 2 x14
tof x15 2
tof x15 x14
tof x15 7
tof x5 x15
tof x19 x15
tof x5 x14
tof x19 7
T 2
T x5
T* x15
T* x14
T* x19
T 7
tof x15 2
tof x19 x14
tof x15 x14
tof x15 7
tof x5 x19
tof 2 x19
tof x5 7
tof x19 x14
tof 2 x15
tof x17 x9
H x5
H x15
tof x9 x17
tof x15 x9
tof x15 x18
tof 0 x15
tof x18 0
T* x15
T* x18
T 0
T* x9
P x5
T x5
tof 0 x15
tof x9 x18
tof x17 x18
tof x18 x15
tof x17 x9
tof x9 0
tof x18 0
tof x15 x18
tof x15 x9
tof x17 x15
tof x8 x15
tof 0 x18
P x8
P* x15
P 0
P* x18
P x9
tof x17 x15
tof x15 x8
tof x18 0
tof 0 x18
tof x8 x15
tof x8 x17
H x18
tof x18 x20
tof x17 x8
tof x19 x4
tof x18 x17
tof x15 x18
tof x15 x19
tof x18 x19
tof x17 x15
tof x4 x19
tof x20 x4
T* x18
T* x17
T x15
T* x20
T* x19
T x4
tof x15 x18
tof x20 x17
tof x17 x18
tof x8 x17
tof x8 x15
tof x20 x15
tof x19 x20
tof x19 x4
tof x20 x19
tof x17 x15
tof x18 x17
tof x18 x4
tof x18 x19
tof x18 x20
H x15
P x19
P x15
tof x8 x17
H x19
tof x20 x18
tof x15 x18
tof x15 x20
tof x9 x17
tof x19 x17
tof x19 x9
tof x20 x15
tof x18 x15
T* x15
T* x20
T x18
T* x9
T x17
tof x18 x15
tof x18 x20
tof x17 x9
tof x8 x9
tof x8 x17
tof x19 x17
tof x9 x17
tof x20 x18
tof x15 x18
H x17
H 2
tof x17 0
tof x17 2
tof x4 2
tof x4 x17
tof x4 x14
tof x17 7
tof x17 x4
tof 2 x14
tof 2 x17
tof 2 7
tof 0 7
tof 0 2
T x4
T x17
T* 0
T* x14
T* 2
T 7
tof 0 x4
tof 2 x14
tof 0 x14
tof 0 7
tof x17 2
tof x4 2
tof x17 7
tof 2 x14
tof x4 0
tof x9 x8
H x17
H 0
tof 0 x20
tof x8 x9
tof 0 x8
tof x19 x8
tof 2 x8
tof 2 x19
tof x19 2
tof 0 2
tof x8 x19
tof x15 0
tof x20 x15
T* 2
T* x19
T x8
T* x20
T* 0
T x15
P* x17
T* x17
tof 0 x20
tof x15 x20
tof x9 x19
tof x20 2
tof x20 x19
tof x9 x8
tof x20 x8
tof 0 x20
tof x15 0
tof 0 x15
tof x20 x15
tof x19 x8
tof 2 x8
tof x9 x19
tof 2 x19
P 2
P* x19
P x15
tof x9 x19
tof x19 2
tof 2 x19
tof 2 x9
H x19
H x15
H x4
tof x20 0
tof x19 0
tof x9 2
tof x14 x9
tof x4 x9
tof x15 x4
tof x19 x17
tof x8 x15
tof x14 x8
tof 7 x8
tof x14 7
tof x8 7
tof x15 x8
tof x15 7
tof x4 x14
tof x9 x14
tof x4 7
tof x9 x8
tof x20 x19
tof 0 x20
T* x20
T* x19
T 0
T x15
T 7
T* x14
T* x4
T* x9
T x8
T* x17
tof 0 x20
tof 0 x19
tof 7 x15
tof x4 x15
tof x17 0
tof x4 7
tof 2 x14
tof x14 7
tof 2 x9
tof 2 x8
tof x4 x9
tof x4 x8
tof x14 x9
tof 7 x14
tof 7 x8
tof x14 x4
tof x19 0
tof x20 0
tof 0 x17
tof 7 2
H x4
H x14
H 2
tof x20 x19
tof x14 x19
tof x8 x19
tof 2 x20
tof x14 x20
tof x9 x20
tof x8 x20
tof x14 2
tof x8 2
tof x14 x5
tof x9 x14
tof x9 x15
tof x8 x15
tof x8 x9
tof x14 x8
tof x14 x15
tof 2 x15
tof 2 x14
tof 2 x9
tof x4 x18
tof x20 x14
tof x20 x9
tof x20 x8
tof x19 x9
tof x19 2
tof x19 x20
T* x9
T* x14
T x19
T x15
T* x20
T* x8
T 2
T* x4
T* x18
T* x5
tof x8 x9
tof 2 x9
tof x14 x9
tof x5 x14
tof 2 x19
tof x5 x19
tof x8 x19
tof x8 x15
tof 2 x20
tof x18 x4
tof x8 2
tof x14 x19
tof x9 x14
tof x9 x20
tof x9 x15
tof x9 x8
tof x14 x5
H x8
H x15
tof x13 x3
tof x15 x3
tof x15 x20
tof x8 x7
tof x13 x15
tof x3 x13
T x20
T* x13
T* x15
T x3
T x8
T* x7
tof x15 x20
tof x3 x13
tof x13 x20
tof x3 x15
tof x7 x8
tof x15 x3
tof x13 x3
tof 2 x9
H x3
tof x9 2
tof x16 x9
tof x3 x9
tof x3 x16
T* x16
T x9
tof 2 x9
tof x9 x16
tof x3 x9
tof x16 x9
H x9
tof x9 x7
tof x9 x8
T* x8
T x7
tof x9 x8
tof x9 x7
tof x8 x7
H x8
tof x8 x18
tof x8 x4
T* x4
T x18
tof x8 x4
tof x8 x18
tof x4 x18
H x4
tof x17 0
tof x4 0
tof x4 x17
T* x17
T 0
tof 0 x17
tof x4 0
tof x17 0
tof 2 x16
tof x3 x16
tof x4 x17
tof x8 x18
tof x9 x7
P 0
P x5
P x3
P* x16
P x9
P* x7
P x8
P* x18
P x4
P* x17
tof 2 x16
tof x16 x3
tof x7 x9
tof x18 x8
tof x17 x4
tof x4 x17
tof x8 x18
tof x9 x7
tof x3 x16
H 0
tof x5 x14
tof 0 x14
tof 0 x5
T* x5
T x14
tof x14 x5
tof 0 x14
tof x5 x14
H x14
tof x14 6
tof x20 x11
tof x14 x20
tof x11 x20
tof 6 x11
T x14
T* 6
T* x20
T x11
tof x20 x14
tof x20 6
tof x20 x11
tof x14 6
tof 6 x11
tof x14 x20
H x20
tof x20 x4
tof x20 x5
tof 0 x20
tof x5 0
T* x20
T* x5
T 0
T* x4
tof 0 x20
tof x4 x5
tof x4 0
tof x5 0
tof x20 x5
tof x5 x4
tof 0 x20
P 0
P* x20
P x4
tof x20 0
tof 2 x3
tof 0 x20
H x20
tof x20 x8
tof x20 x5
tof x17 x20
tof x5 x17
T* x20
T* x5
T x17
T* x8
tof x17 x20
tof x8 x5
tof x8 x17
tof x5 x17
tof x20 x5
tof x5 x8
H x17
tof x18 x5
tof x17 x9
tof x17 x5
tof x18 x17
tof x5 x18
T* x17
T* x18
T x5
T* x9
tof x5 x17
tof x9 x18
tof x9 x5
tof x18 x5
tof x17 x18
tof x18 x9
H x5
tof x5 x3
tof x5 x18
tof x7 x5
tof x18 x7
T* x5
T* x18
T x7
T* x3
tof x7 x5
tof x3 x18
tof 2 x18
tof x18 x5
tof 2 x3
tof x3 x7
tof x18 x7
tof x5 x18
tof x5 x3
tof x5 2
H x7
tof 2 x5
tof x7 x15
tof x7 x13
tof x7 2
tof x11 x7
tof x11 x16
tof x16 x11
tof x7 x16
tof 2 x11
tof x13 x7
tof x15 x7
T* x16
T* 2
T x11
T* x15
T* x13
T x7
tof x11 x16
tof x15 2
tof 2 x16
tof x5 2
tof x5 x11
tof x15 x11
tof x13 x15
tof x13 x7
tof x15 x13
tof 2 x11
tof x16 2
tof x16 x7
tof x16 x13
tof x16 x15
H x11
P x8
P x9
P x3
P x13
P x11
tof x5 2
H x13
tof x11 x16
tof x3 2
tof x13 2
tof x11 x15
tof x13 x3
T* x16
T* x15
T* x3
T 2
tof x11 x16
tof x11 x15
tof x5 2
tof 2 x3
tof x13 2
tof x3 2
H 2
tof x9 x18
tof 2 x18
tof 2 x9
T* x9
T x18
tof x18 x9
tof 2 x18
tof x9 x18
H x18
tof x8 x17
tof x18 x17
tof x18 x8
T* x8
T x17
tof x17 x8
tof x18 x17
tof x8 x17
H x17
tof x4 x20
tof x17 x20
tof x17 x4
T* x4
T x20
tof x20 x4
tof x17 x20
tof x4 x20
H x20
H 6
tof x20 0
tof x20 6
tof x7 6
tof x7 x20
tof x19 x7
tof x7 x19
tof x20 x19
tof 6 x7
tof 6 x20
tof 0 x7
T x19
T x20
T* 0
T* 6
T* x7
tof 0 x20
tof 0 6
tof 6 x7
tof x20 6
tof x19 6
tof 6 x7
tof x20 0
T x20
tof x19 x20
tof 0 x20
H 0
H x19
tof x19 x8
tof x19 x4
tof x17 x19
tof 0 x14
tof x4 x17
T* x19
T* x4
T x17
T* x8
T 0
T* x14
tof x17 x19
tof x8 x4
tof x8 x17
tof x14 0
tof 0 x14
tof x4 x17
tof x19 x4
tof x4 x8
tof x5 x3
tof x13 x3
tof x18 x4
tof x17 x19
tof 2 x9
P x13
P* x3
P 2
P* x9
P x18
P* x4
P x17
P* x19
P x8
tof x5 x3
tof x3 x13
tof x9 2
tof x4 x18
tof x19 x17
tof x17 x19
tof x18 x4
tof 2 x9
tof x13 x3
H x19
tof x4 x18
tof x19 2
tof x19 x18
tof x4 x19
tof x18 x4
T* x19
T* x4
T x18
T* 2
tof x18 x19
tof 2 x4
tof 2 x18
tof x4 x18
tof x19 x4
tof x4 2
tof x13 x5
H x18
tof x5 x13
tof x18 x5
tof x18 x4
tof x9 x18
tof x4 x9
T* x18
T* x4
T x9
T* x5
tof x9 x18
tof x5 x4
tof x13 x4
tof x4 x18
tof x13 x5
tof x5 x9
tof x4 x9
tof x18 x4
tof x18 x5
tof x18 x13
H x9
tof x13 x18
tof x9 x16
tof x9 x15
tof x9 x13
tof 6 x9
tof x3 6
tof x9 6
tof x13 x3
tof x15 x9
tof x16 x9
T* 6
T* x13
T x3
T* x16
T* x15
T x9
tof x3 6
tof x16 x13
tof x13 6
tof x18 x13
tof x18 x3
tof x16 x3
tof x15 x16
tof x15 x9
tof x16 x15
tof x13 x3
tof 6 x13
tof 6 x9
tof 6 x15
tof 6 x16
H x3
P 2
P x5
P x15
P x3
tof x18 x13
H x15
tof x16 6
tof x3 6
tof x5 x13
tof x15 x13
tof x3 x16
tof x15 x5
tof x16 x3
tof 6 x3
T* x3
T* x16
T 6
T* x5
T x13
tof 6 x3
tof 6 x16
tof x13 x5
tof x18 x5
tof x18 x13
tof x15 x13
tof x5 x13
tof x16 6
tof x3 6
H x13
tof 2 x4
tof x13 x4
tof x13 2
T* 2
T x4
tof x4 2
tof x13 x4
tof 2 x4
H x4
tof x8 x19
tof x4 x19
tof x4 x8
T* x8
T x19
tof x19 x8
tof x4 x19
tof x8 x19
H x19
H x20
tof x19 x17
tof x19 x9
tof x19 x7
tof x20 x7
tof x17 x7
tof x20 x9
T x19
T x20
T* x17
T* x9
T* x7
tof x17 x20
tof x17 x9
tof x9 x7
tof x20 x9
tof x19 x9
tof x9 x7
tof x20 x17
T x20
tof x19 x20
tof x17 x20
H x17
H x19
tof x19 2
tof x19 x8
tof x4 x19
tof x8 x4
T* x19
T* x8
T x4
T* 2
P x17
T x17
tof x4 x19
tof 2 x8
tof 2 x4
tof x8 x4
tof x19 x8
tof x8 2
tof x18 x5
tof x15 x5
tof x13 x8
tof x4 x19
P x15
P* x5
P x13
P* x8
P x4
P* x19
P 2
tof x18 x5
tof x5 x15
tof x8 x13
tof x19 x4
tof x4 x19
tof x13 x8
tof x15 x5
tof x15 x18
H x19
tof x18 x15
tof x19 x18
tof x19 x13
tof x8 x19
tof x13 x8
T* x19
T* x13
T x8
T* x18
tof x8 x19
tof x18 x13
tof x15 x13
tof x13 x19
tof x15 x18
tof x18 x8
tof x13 x8
tof x19 x13
tof x19 x18
tof x19 x15
H x8
tof x15 x19
tof x8 x16
tof x8 x3
tof x8 x15
tof x9 x8
tof x5 x9
tof x8 x9
tof x15 x5
tof x3 x8
tof x16 x8
T* x9
T* x15
T x5
T* x16
T* x3
T x8
tof x5 x9
tof x16 x15
tof x15 x9
tof x19 x15
tof x19 x5
tof x16 x5
tof x3 x16
tof x3 x8
tof x16 x3
tof x15 x5
tof x9 x15
tof x9 x8
tof x9 x3
tof x9 x16
H x5
P x18
P x3
P x5
tof x19 x15
H x3
tof x16 x9
tof x5 x9
tof x18 x15
tof x3 x15
tof x5 x16
tof x3 x18
tof x16 x5
tof x9 x5
T* x5
T* x16
T x9
T* x18
T x15
tof x9 x5
tof x9 x16
tof x15 x18
tof x19 x18
tof x19 x15
tof x3 x15
tof x18 x15
tof x16 x9
tof x5 x9
H x15
tof 2 x13
tof x15 x13
tof x15 2
T* 2
T x13
tof x13 2
tof x15 x13
tof 2 x13
H x13
H x20
tof x20 x4
tof x7 x4
tof x13 x7
tof x13 x8
tof x20 x8
tof x20 x7
tof x4 x7
T x13
T x20
T* x7
T* x8
T* x4
tof x7 x20
tof x7 x8
tof x8 x4
tof x20 x8
tof x13 x8
tof x8 x4
tof x20 x7
T x20
tof x13 x20
tof x7 x20
tof x18 x19
H x7
H x13
tof x19 x18
tof x13 x19
tof x13 2
tof x15 x13
tof 2 x15
T* x13
T* 2
T x15
T* x19
P* x7
T* x7
tof x15 x13
tof x19 2
tof x18 2
tof 2 x13
tof x18 x19
tof x19 x15
tof 2 x15
tof x13 2
tof x13 x19
tof x18 x13
tof x3 x13
tof x15 2
P x3
P* x13
P x15
P* 2
P x19
tof x18 x13
tof x13 x3
tof 2 x15
tof x15 2
tof x3 x13
tof x3 x18
H 2
tof x18 x3
tof 2 x16
tof 2 x5
tof 2 x18
tof x8 2
tof x8 x13
tof x13 x8
tof 2 x13
tof x18 x8
tof x5 2
tof x16 2
T* x13
T* x18
T x8
T* x16
T* x5
T 2
tof x8 x13
tof x16 x18
tof x18 x13
tof x3 x18
tof x3 x8
tof x16 x8
tof x5 x16
tof x5 2
tof x16 x5
tof x18 x8
tof x13 x18
tof x13 2
tof x13 x5
tof x13 x16
H x8
P x5
P x8
tof x3 x18
H x5
tof x16 x13
tof x8 x13
tof x19 x18
tof x5 x18
tof x8 x16
tof x5 x19
tof x16 x8
tof x13 x8
T* x8
T* x16
T x13
T* x19
T x18
tof x13 x8
tof x13 x16
tof x18 x19
tof x3 x19
tof x3 x18
tof x5 x18
tof x19 x18
tof x16 x13
tof x8 x13
H x18
H x20
tof x4 x15
tof x20 x15
tof 2 x18
tof x4 2
tof 2 x4
tof x18 x4
tof x18 2
tof x20 2
tof x15 2
tof x20 x18
T x4
T x20
T* 2
T* x18
T* x15
tof 2 x20
tof 2 x18
tof x18 x15
tof x20 x18
tof x4 x18
tof x18 x15
tof x20 2
T x20
tof x4 x20
tof 2 x20
tof x19 x3
H 2
H x4
tof x3 x19
tof x4 x16
tof x4 x8
tof x4 x3
tof x13 2
tof x18 x4
tof x5 x4
tof x5 x18
tof x4 x18
tof 2 x13
tof x3 x5
tof x8 x18
tof x16 x18
T* x4
T* x3
T x5
T* x16
T* x8
T x18
T* x13
T* 2
tof x5 x4
tof x16 x3
tof x8 x3
tof x18 x3
tof x3 x4
tof x19 x3
tof x8 x5
tof x18 x16
tof x19 x5
tof x16 x5
tof x18 x8
tof 2 x13
tof x8 x18
tof x16 x18
tof x3 x5
tof x19 x3
tof x5 x3
P x5
P* x3
P x18
tof x19 x3
tof x3 x5
tof x5 x3
tof x5 x19
H x3
H x18
H x20
tof x16 x8
tof x19 x5
tof x3 x8
tof x18 x19
tof x18 x20
tof x15 x20
tof x3 x7
tof x4 x18
tof x15 x4
tof x18 x4
tof x20 x4
tof x20 x15
tof x16 x3
tof x19 x20
tof x8 x16
T* x16
T* x3
T x8
T x18
T x4
T* x19
T* x15
T* x20
T* x7
tof x8 x16
tof x8 x3
tof x4 x18
tof x15 x18
tof x7 x8
tof x19 x4
tof x15 x19
tof x19 x20
tof x4 x19
tof x19 x15
tof x3 x8
tof x16 x8
tof x8 x7
T x4
tof x5 x4
tof x19 x4
tof x15 x4
tof x4 x5
H x15
H x19
H x5
tof x16 x3
tof x19 x3
tof x18 x3
tof x19 x5
tof x18 x16
tof x20 x5
tof x5 x16
tof x19 x17
tof x20 x19
tof x18 x20
tof x19 x18
tof x19 x20
tof x15 x9
tof x5 x19
tof x16 x5
tof x5 x20
tof x16 x18
tof x3 x5
tof x3 x16
T* x5
T* x20
T x3
T x19
T* x16
T* x18
T x15
T* x9
T* x17
tof x19 x20
tof x17 x18
tof x20 x5
tof x18 x20
tof x17 x19
tof x19 x3
tof x18 x19
tof x17 x18
tof x9 x15
tof x19 x16
tof x19 x18
tof x20 x3
tof x5 x3
tof x5 x16
tof x20 x17
T x5
tof x19 x5
tof x18 x5
H x18
H x3
tof x3 x2
tof x3 x12
tof x3 x16
tof x18 6
tof x12 x3
tof x2 x3
T x16
T* x2
T* x12
T x3
P x18
T x18
T* 6
tof x12 x16
tof x3 x2
tof x2 x16
tof x3 x12
tof 6 x18
tof x12 x3
tof x2 x3
tof x5 x19
H x3
tof x19 x5
tof x11 x19
tof x3 x19
tof x3 x11
T* x11
T x19
tof x5 x19
tof x19 x11
tof x3 x19
tof x11 x19
H x19
tof x19 6
tof x19 x18
T* x18
T 6
tof x19 x18
tof x19 6
tof x18 6
H x18
tof x18 x9
tof x18 x15
T* x15
T x9
tof x18 x15
tof x18 x9
tof x15 x9
H x15
tof x15 2
tof x15 x13
T* x13
T 2
tof x15 x13
tof x15 2
tof x13 2
H x13
tof x7 x8
tof x13 x8
tof x13 x7
T* x7
T x8
tof x8 x7
tof x13 x8
tof x7 x8
tof x5 x11
tof x3 x11
tof x15 2
tof x13 x7
tof x18 x9
tof x19 6
P x8
P x17
P x3
P* x11
P x19
P* 6
P x18
P* x9
P x15
P* 2
P x13
P* x7
tof x5 x11
tof x11 x3
tof 6 x19
tof x9 x18
tof 2 x15
tof x7 x13
tof x13 x7
tof x15 2
tof x18 x9
tof x19 6
tof x3 x11
H x8
tof x17 x20
tof x8 x20
tof x8 x17
T* x17
T x20
tof x20 x17
tof x8 x20
tof x17 x20
H x20
tof x20 0
tof x16 x14
tof 0 x14
tof x20 x16
tof 0 x16
tof x14 x16
T x20
T* x16
T* 0
T x14
tof 0 x20
tof 0 x16
tof 0 x14
tof x20 x16
tof x16 x14
tof x20 0
H 0
tof x8 x17
tof 0 x13
tof 0 x17
tof x8 0
tof x17 x8
T* 0
T* x8
T x17
T* x13
tof x17 0
tof x13 x8
tof x13 x17
tof x8 x17
tof 0 x8
tof x8 x13
tof x17 0
P x17
P* 0
P x13
tof 0 x17
tof x5 x3
tof x17 0
H 0
tof 0 x15
tof 0 x8
tof x7 x8
tof x7 0
tof x8 x7
T* 0
T* x7
T x8
T* x15
tof x8 0
tof x15 x7
tof x15 x8
tof x7 x8
tof 0 x7
tof x7 x15
H x8
tof 2 x7
tof x8 x18
tof x8 x7
tof 2 x8
tof x7 2
T* x8
T* 2
T x7
T* x18
tof x7 x8
tof x18 2
tof x18 x7
tof 2 x7
tof x8 2
tof 2 x18
H x7
tof x7 x19
tof x7 2
tof x9 2
tof x9 x7
tof 2 x9
T* x7
T* x9
T 2
T* x19
tof 2 x7
tof x19 x9
tof x19 2
tof x9 2
tof x7 x9
tof x9 x19
H 2
tof 2 x3
tof 2 x9
tof 6 2
tof x9 6
T* 2
T* x9
T 6
T* x3
tof 6 2
tof x3 x9
tof x5 x9
tof x9 2
tof x5 x3
tof x3 6
tof x9 6
tof 2 x9
tof 2 x3
tof 2 x5
H 6
tof 6 x12
tof x5 2
tof 6 x2
tof 6 x5
tof x11 6
tof x11 x14
tof 6 x14
tof x5 x11
tof x2 x14
tof x12 x14
T* 6
T* x5
T x11
T* x12
T* x2
T x14
tof x11 6
tof x12 x5
tof x5 6
tof 2 x5
tof 2 x11
tof x12 x11
tof x2 x12
tof x2 x14
tof x12 x2
tof x5 x11
tof 6 x5
tof 6 x14
tof 6 x2
tof 6 x12
H x11
P x15
P x18
P x19
P x3
P x2
P x11
tof 2 x5
H x2
tof x11 6
tof x11 x12
tof x3 x5
tof x2 x5
tof x2 x3
T* 6
T* x12
T* x3
T x5
tof x11 6
tof x11 x12
tof 2 x5
tof x5 x3
tof x2 x5
tof x3 x5
H x5
tof x19 x9
tof x5 x9
tof x5 x19
T* x19
T x9
tof x9 x19
tof x5 x9
tof x19 x9
H x9
tof x18 x7
tof x9 x7
tof x9 x18
T* x18
T x7
tof x7 x18
tof x9 x7
tof x18 x7
H x7
tof x15 x8
tof x7 x8
tof x7 x15
T* x15
T x8
tof x8 x15
tof x7 x8
tof x15 x8
H x8
tof x13 0
tof x8 0
tof x8 x13
T* x13
T 0
tof 0 x13
tof x8 0
tof x13 0
H 0
H x16
tof 0 x17
tof 0 x16
tof x14 x16
tof 0 x14
tof x16 x14
T 0
T x14
T* x17
T* x16
tof x17 x14
tof x14 0
tof x17 x16
tof 0 x16
tof x14 x17
T* 0
T x14
tof x17 0
tof x17 x14
tof 0 x14
H x17
H x14
tof x14 x15
tof x14 x13
tof x8 x13
tof x20 x17
tof x8 x14
tof x17 x20
tof x13 x8
T* x14
T* x8
T x13
T* x15
T x20
T* x17
tof x13 x14
tof x15 x8
tof x15 x13
tof x17 x20
tof x20 x17
tof x8 x13
tof x14 x8
tof x8 x15
tof 2 x3
tof x2 x3
tof x13 x14
tof x9 x18
tof x7 x8
tof x5 x19
P x2
P* x3
P x5
P* x19
P x9
P* x18
P x7
P* x8
P x13
P* x14
P x15
tof 2 x3
tof x3 x2
tof x19 x5
tof x18 x9
tof x8 x7
tof x14 x13
tof x13 x14
tof x7 x8
tof x9 x18
tof x5 x19
tof x2 x3
H x14
tof x8 x7
tof x14 x9
tof x14 x7
tof x8 x14
tof x7 x8
T* x14
T* x8
T x7
T* x9
tof x7 x14
tof x9 x8
tof x9 x7
tof x8 x7
tof x14 x8
tof x8 x9
H x7
tof x7 x5
tof x7 x8
tof x18 x8
tof x18 x7
tof x8 x18
T* x7
T* x18
T x8
T* x5
tof x8 x7
tof x5 x18
tof x5 x8
tof x18 x8
tof x7 x18
tof x18 x5
tof x2 2
H x8
tof 2 x2
tof x8 2
tof x8 x18
tof x19 x8
tof x18 x19
T* x8
T* x18
T x19
T* 2
tof x19 x8
tof 2 x18
tof x2 x18
tof x18 x8
tof x2 2
tof 2 x19
tof x18 x19
tof x8 x18
tof x8 2
tof x8 x2
H x19
tof x19 6
tof x2 x8
tof x19 x12
tof x19 x2
tof x3 x19
tof x16 x3
tof x3 x16
tof x19 x3
tof x2 x16
tof x12 x3
tof 6 x3
T* x19
T* x2
T x16
T* 6
T* x12
T x3
tof x16 x19
tof 6 x2
tof x2 x19
tof x8 x2
tof x8 x16
tof 6 x16
tof x12 6
tof x12 x3
tof 6 x12
tof x2 x16
tof x19 x2
tof x19 x3
tof x19 x12
tof x19 6
H x16
P x9
P x5
P 2
P x12
P x16
tof x8 x2
H x12
tof x16 x19
tof x16 6
tof 2 x2
tof x12 x2
tof x12 2
tof 6 x16
tof x19 x16
T* x19
T* 6
T x16
T* 2
T x2
tof x16 x19
tof x16 6
tof x2 2
tof x8 2
tof x8 x2
tof x12 x2
tof 2 x2
tof 6 x16
tof x19 x16
H x2
tof x5 x18
tof x2 x18
tof x2 x5
T* x5
T x18
tof x18 x5
tof x2 x18
tof x5 x18
H x18
tof x9 x7
tof x18 x7
tof x18 x9
T* x9
T x7
tof x7 x9
tof x18 x7
tof x9 x7
H x7
tof x15 x14
tof x7 x14
tof x7 x15
T* x15
T x14
tof x14 x15
tof x7 x14
tof x15 x14
H x14
H 0
tof x3 0
tof x14 x13
tof x14 0
tof x3 x14
tof x14 x3
tof 0 x14
T x3
T x14
T* x13
T* 0
tof x13 x14
tof x14 x3
tof x13 0
tof x3 0
tof x14 x13
T* x3
T x14
tof x13 x3
tof x13 x14
tof x3 x14
H x13
H x14
tof x14 x9
tof x14 x15
tof x7 x14
tof x15 x7
T* x14
T* x15
T x7
T* x9
P x13
T x13
tof x7 x14
tof x9 x15
tof x9 x7
tof x15 x7
tof x14 x15
tof x15 x9
tof x8 2
tof x12 2
tof x7 x14
tof x2 x5
tof x18 x15
P x12
P* 2
P x2
P* x5
P x18
P* x15
P x7
P* x14
P x9
tof x8 2
tof 2 x12
tof x5 x2
tof x15 x18
tof x14 x7
tof x7 x14
tof x18 x15
tof x2 x5
tof x12 2
H x14
tof x14 x2
tof x14 x18
tof x15 x18
tof x15 x14
tof x18 x15
T* x14
T* x15
T x18
T* x2
tof x18 x14
tof x2 x15
tof x2 x18
tof x15 x18
tof x14 x15
tof x15 x2
tof x12 x8
H x18
tof x8 x12
tof x18 x8
tof x18 x15
tof x5 x18
tof x15 x5
T* x18
T* x15
T x5
T* x8
tof x5 x18
tof x8 x15
tof x12 x15
tof x15 x18
tof x12 x8
tof x8 x5
tof x15 x5
tof x18 x15
tof x18 x8
tof x18 x12
H x5
tof x5 6
tof x12 x18
tof x5 x19
tof x5 x12
tof 2 x5
tof 0 2
tof 2 0
tof x5 2
tof x12 0
tof x19 2
tof 6 2
T* x5
T* x12
T 0
T* 6
T* x19
T 2
tof 0 x5
tof 6 x12
tof x12 x5
tof x18 x12
tof x18 0
tof 6 0
tof x19 6
tof x19 2
tof 6 x19
tof x12 0
tof x5 x12
tof x5 2
tof x5 x19
tof x5 6
H 0
P x2
P x8
P x19
P 0
tof x18 x12
H x19
tof 0 x5
tof 0 6
tof x8 x12
tof x19 x12
tof x19 x8
tof 6 0
tof x5 0
T* x5
T* 6
T 0
T* x8
T x12
tof 0 x5
tof 0 6
tof x12 x8
tof x18 x8
tof x18 x12
tof x19 x12
tof x8 x12
tof 6 0
tof x5 0
H x12
tof x2 x15
tof x12 x15
tof x12 x2
T* x2
T x15
tof x15 x2
tof x12 x15
tof x2 x15
H x15
tof x9 x14
tof x15 x14
tof x15 x9
T* x9
T x14
tof x14 x9
tof x15 x14
tof x9 x14
H x14
H x3
tof x14 x7
tof x14 x3
tof 2 x3
tof x14 2
tof x3 2
T x14
T 2
T* x7
T* x3
tof x7 2
tof 2 x14
tof x7 x3
tof x14 x3
tof 2 x7
T* x14
T 2
tof x7 x14
tof x7 2
tof x14 2
H x7
H 2
tof 2 x2
tof 2 x9
tof x15 2
tof x9 x15
T* 2
T* x9
T x15
T* x2
P* x7
T* x7
tof x15 2
tof x2 x9
tof x2 x15
tof x9 x15
tof 2 x9
tof x9 x2
tof x18 x8
tof x19 x8
tof x15 2
tof x12 x9
P x19
P* x8
P x12
P* x9
P x15
P* 2
P x2
tof x18 x8
tof x8 x19
tof x9 x12
tof 2 x15
tof x15 2
tof x12 x9
tof x19 x8
tof x19 x18
H 2
tof x18 x19
tof 2 x18
tof 2 x12
tof x9 2
tof x12 x9
T* 2
T* x12
T x9
T* x18
tof x9 2
tof x18 x12
tof x19 x12
tof x12 2
tof x19 x18
tof x18 x9
tof x12 x9
tof 2 x12
tof 2 x18
tof 2 x19
H x9
tof x9 6
tof x19 2
tof x9 x5
tof x9 x19
tof x3 x9
tof x8 x3
tof x9 x3
tof x19 x8
tof x5 x9
tof 6 x9
T* x3
T* x19
T x8
T* 6
T* x5
T x9
tof x8 x3
tof 6 x19
tof x19 x3
tof 2 x19
tof 2 x8
tof 6 x8
tof x5 6
tof x5 x9
tof 6 x5
tof x19 x8
tof x3 x19
tof x3 x9
tof x3 x5
tof x3 6
H x8
P x18
P x5
P x8
tof 2 x19
H x5
tof x8 x3
tof x8 6
tof x18 x19
tof x5 x19
tof x5 x18
tof 6 x8
tof x3 x8
T* x3
T* 6
T x8
T* x18
T x19
tof x8 x3
tof x8 6
tof x19 x18
tof 2 x18
tof 2 x19
tof x5 x19
tof x18 x19
tof 6 x8
tof x3 x8
H x19
tof x2 x12
tof x19 x12
tof x19 x2
T* x2
T x12
tof x12 x2
tof x19 x12
tof x2 x12
H x12
H x14
tof x9 x14
tof x12 x15
tof x12 x14
tof x9 x12
tof x12 x9
tof x14 x12
T x9
T x12
T* x15
T* x14
tof x15 x12
tof x12 x9
tof x15 x14
tof x9 x14
tof x12 x15
T* x9
T x12
tof x15 x9
tof x15 x12
tof x9 x12
tof x18 2
H x15
H x12
tof 2 x18
tof x12 2
tof x12 x2
tof x19 x12
tof x2 x19
T* x12
T* x2
T x19
T* 2
T* x15
tof x19 x12
tof 2 x2
tof x18 x2
tof x2 x12
tof x18 2
tof 2 x19
tof x2 x19
tof x12 x2
tof x12 2
tof x18 x12
tof x5 x12
tof x19 x2
P x5
P* x12
P x19
P* x2
P 2
tof x18 x12
tof x12 x5
tof x2 x19
tof x19 x2
tof x5 x12
tof x5 x18
H x2
tof x2 6
tof x18 x5
tof x2 x3
tof x2 x18
tof x14 x2
tof x14 x12
tof x12 x14
tof x2 x12
tof x18 x14
tof x3 x2
tof 6 x2
T* x12
T* x18
T x14
T* 6
T* x3
T x2
tof x14 x12
tof 6 x18
tof x18 x12
tof x5 x18
tof x5 x14
tof 6 x14
tof x3 6
tof x3 x2
tof 6 x3
tof x18 x14
tof x12 x18
tof x12 x2
tof x12 x3
tof x12 6
H x14
P x3
P x14
tof x5 x18
H x3
tof x14 x12
tof x14 6
tof 2 x18
tof x3 x18
tof x14 x15
tof x3 2
tof 6 x14
tof x12 x14
T* x12
T* 6
T x14
T* 2
T x18
T* x15
tof x14 x12
tof x14 6
tof x18 2
tof x15 x14
tof x5 2
tof x5 x18
tof x3 x18
tof 2 x18
tof 6 x14
tof x12 x14
tof x14 x15
H x18
H x9
tof x18 x19
tof x18 x2
tof x9 x2
T x18
T x9
T* x19
T* x2
tof x19 x9
tof x9 x18
tof x19 x2
tof x18 x2
tof x9 x19
T* x18
T x9
tof x19 x18
tof x19 x9
tof x18 x9
tof 2 x5
H x19
H x9
tof x9 6
tof x5 2
tof x9 x12
tof x9 x5
tof x3 x2
tof x9 x2
tof x19 x8
tof x5 x3
tof x12 x9
tof 6 x9
T* x2
T* x5
T x3
T* 6
T* x12
T x9
T x19
T* x8
tof x3 x2
tof 6 x5
tof x12 x5
tof x9 x5
tof x5 x2
tof 2 x5
tof x12 x3
tof x9 6
tof 2 x3
tof 6 x3
tof x9 x12
tof x8 x19
tof x12 x9
tof 6 x9
tof x5 x3
tof 2 x5
tof x3 x5
P x3
P* x5
P x9
tof 2 x5
tof x5 x3
tof x3 x5
tof x3 2
H x5
H x9
H x18
tof x5 x12
tof 2 x3
tof x5 6
tof x9 2
tof x9 x18
tof x5 x7
tof x2 x9
tof x9 x2
tof x18 x2
tof 6 x5
tof x12 x5
T* x12
T* 6
T x5
T x9
T x2
T* 2
T* x18
T* x7
tof x5 x12
tof x5 6
tof x2 x9
tof x18 x9
tof x7 x5
tof x18 2
tof 2 x18
tof x2 x18
tof 6 x5
tof x12 x5
tof x5 x7
T* 2
T x18
tof x2 x3
tof x3 2
tof x3 x18
tof x2 x3
tof 2 x18
tof 2 x3
H x2
H x18
H x3
tof x18 6
tof x18 x12
tof x18 x3
tof x18 x13
tof x9 x18
tof x18 x9
tof x3 x9
tof x2 0
tof x12 x18
tof 6 x3
tof 6 x18
T* 6
T* x12
T x18
T x9
T* x3
P x2
T x2
T* 0
T* x13
tof x3 6
tof x13 x9
tof x12 6
tof x9 x12
tof x13 x3
tof x3 x18
tof x3 x9
tof 0 x2
tof x13 x3
tof x9 x3
tof x12 x18
tof 6 x12
tof x12 x13
tof 6 x9
T* 6
T x9
tof x9 6
tof x3 x9
H x3
H x18
tof x18 x1
tof x18 5
tof x16 x3
tof x3 x16
T x18
T* x1
T* 5
P* x16
T* x16
T* x3
tof 5 x18
tof x1 x18
tof x3 x16
tof x18 x1
tof x1 5
T x18
tof x1 x18
tof 5 x18
H 5
tof x9 6
tof x11 x9
tof 5 x9
tof 5 x11
T* x11
T x9
tof 6 x9
tof x9 x11
tof 5 x9
tof x11 x9
H x9
tof x9 x3
tof x9 x16
T* x16
T x3
tof x9 x16
tof x9 x3
tof x16 x3
H x16
tof x16 0
tof x16 x2
T* x2
T 0
tof x16 x2
tof x16 0
tof x2 0
H x2
tof x2 x8
tof x2 x19
T* x19
T x8
tof x2 x19
tof x2 x8
tof x19 x8
H x19
tof x15 x14
tof x19 x14
tof x19 x15
T* x15
T x14
tof x14 x15
tof x19 x14
tof x15 x14
H x14
tof x7 x5
tof x14 x5
tof x14 x7
T* x7
T x5
tof x5 x7
tof x14 x5
tof x7 x5
tof 6 x11
tof 5 x11
tof x14 x7
tof x2 x8
tof x19 x15
tof x16 0
tof x9 x3
P x5
P x13
P 5
P* x11
P x9
P* x3
P x16
P* 0
P x2
P* x8
P x19
P* x15
P x14
P* x7
tof x11 5
tof x3 x9
tof 0 x16
tof x8 x2
tof x15 x19
tof x7 x14
tof x14 x7
tof x19 x15
tof x2 x8
tof x16 0
tof x9 x3
tof 5 x11
tof 5 6
H x5
tof x13 x12
tof x5 x12
tof x5 x13
T* x13
T x12
tof x12 x13
tof x5 x12
tof x13 x12
H x12
tof x12 x17
tof x12 x20
T x12
T* x17
T* x20
tof x20 x17
tof x17 x12
tof x12 x17
tof x12 x20
T x12
tof x20 x12
tof x17 x12
H x12
H x17
tof x5 x13
tof x17 x14
tof x17 x13
tof x5 x17
tof x13 x5
tof 6 5
T* x17
T* x5
T x13
T* x14
tof x13 x17
tof x14 x5
tof x14 x13
tof x5 x13
tof x17 x5
tof x5 x14
tof x13 x17
P x13
P* x17
P x14
tof x17 x13
tof 5 6
tof x13 x17
H x17
tof x17 x19
tof x17 x5
tof x7 x5
tof x7 x17
tof x5 x7
T* x17
T* x7
T x5
T* x19
tof x5 x17
tof x19 x7
tof x19 x5
tof x7 x5
tof x17 x7
tof x7 x19
H x5
tof x15 x7
tof x5 x2
tof x5 x7
tof x15 x5
tof x7 x15
T* x5
T* x15
T x7
T* x2
tof x7 x5
tof x2 x15
tof x2 x7
tof x15 x7
tof x5 x15
tof x15 x2
H x7
tof x7 x16
tof x7 x15
tof x8 x15
tof x8 x7
tof x15 x8
T* x7
T* x8
T x15
T* x16
tof x15 x7
tof x16 x8
tof x16 x15
tof x8 x15
tof x7 x8
tof x8 x16
H x15
tof x15 x9
tof x15 x8
tof 0 x15
tof x8 0
T* x15
T* x8
T 0
T* x9
tof 0 x15
tof x9 x8
tof x9 0
tof x8 0
tof x15 x8
tof x8 x9
H 0
tof 0 6
tof 0 x8
tof x3 x8
tof x3 0
tof x8 x3
T* 0
T* x3
T x8
T* 6
tof x8 0
tof 6 x3
tof 5 x3
tof x3 0
tof 5 6
tof 6 x8
tof x3 x8
tof 0 x3
tof 0 6
tof 0 5
H x8
tof 5 0
tof x8 x18
tof x11 5
tof x8 x1
tof x8 5
tof x11 x8
tof 5 x11
T* x8
T* x11
T 5
T* x18
T* x1
tof 5 x8
tof x18 x11
tof x11 x8
tof 0 x11
tof 0 5
tof x18 5
tof x1 x18
tof x18 x1
tof x11 5
tof x8 x11
tof x8 x1
tof x8 x18
H 5
tof 5 x8
tof 5 x18
tof x18 x1
tof x8 x1
T 5
T* x8
T* x18
T x1
tof x18 5
tof x8 5
tof x1 x18
tof x18 x1
tof x8 x18
tof 5 x8
tof x8 x1
T 5
tof x8 5
tof x1 5
H x1
P x19
P x2
P x16
P x9
P 6
P x18
tof 0 x11
H x18
tof 6 x11
tof x18 x11
tof x18 6
T* 6
T x11
tof 0 x11
tof x11 6
tof x18 x11
tof 6 x11
H x11
tof x9 x3
tof x11 x3
tof x11 x9
T* x9
T x3
tof x3 x9
tof x11 x3
tof x9 x3
H x3
tof x16 x15
tof x3 x15
tof x3 x16
T* x16
T x15
tof x15 x16
tof x3 x15
tof x16 x15
H x15
tof x2 x7
tof x15 x7
tof x15 x2
T* x2
T x7
tof x7 x2
tof x15 x7
tof x2 x7
H x7
tof x19 x5
tof x7 x5
tof x7 x19
T* x19
T x5
tof x5 x19
tof x7 x5
tof x19 x5
H x5
tof x14 x17
tof x5 x17
tof x5 x14
T* x14
T x17
tof x17 x14
tof x5 x17
tof x14 x17
H x17
H x20
tof x17 x13
T x17
T x20
T* x13
tof x20 x17
tof x13 x20
tof x17 x13
T* x17
T* x13
T x20
tof x20 x17
tof x20 x13
tof x13 x20
tof x17 x20
H x20
H x13
tof x13 x19
tof x13 x14
tof x5 x14
tof x5 x13
tof x14 x5
T* x13
T* x5
T x14
T* x19
tof x14 x13
tof x19 x5
tof x19 x14
tof x5 x14
tof x13 x5
tof x5 x19
tof 0 6
tof x18 6
tof x14 x13
tof x15 x2
tof x7 x5
tof x11 x9
tof x3 x16
P x18
P* 6
P x11
P* x9
P x3
P* x16
P x15
P* x2
P x7
P* x5
P x14
P* x13
P x19
tof 0 6
tof 6 x18
tof x9 x11
tof x16 x3
tof x2 x15
tof x5 x7
tof x13 x14
tof x14 x13
tof x7 x5
tof x15 x2
tof x3 x16
tof x11 x9
tof x18 6
H x13
tof x5 x7
tof x13 x15
tof x13 x7
tof x5 x13
tof x7 x5
T* x13
T* x5
T x7
T* x15
tof x7 x13
tof x15 x5
tof x15 x7
tof x5 x7
tof x13 x5
tof x5 x15
H x7
tof x7 x3
tof x7 x5
tof x2 x5
tof x2 x7
tof x5 x2
T* x7
T* x2
T x5
T* x3
tof x5 x7
tof x3 x2
tof x3 x5
tof x2 x5
tof x7 x2
tof x2 x3
H x5
tof x5 x11
tof x5 x2
tof x16 x5
tof x2 x16
T* x5
T* x2
T x16
T* x11
tof x16 x5
tof x11 x2
tof x11 x16
tof x2 x16
tof x5 x2
tof x2 x11
tof x18 0
H x16
tof 0 x18
tof x16 0
tof x16 x2
tof x9 x2
tof x9 x16
tof x2 x9
T* x16
T* x9
T x2
T* 0
tof x2 x16
tof 0 x9
tof x18 x9
tof x9 x16
tof x18 0
tof 0 x2
tof x9 x2
tof x16 x9
tof x16 0
tof x16 x18
H x2
tof x18 x16
tof x2 5
tof 6 x18
tof x2 x8
tof x2 x18
tof 6 x2
tof x18 6
T* x2
T* 6
T x18
T* 5
T* x8
tof x18 x2
tof 5 6
tof 6 x2
tof x16 6
tof x16 x18
tof 5 x18
tof x8 5
tof 5 x8
tof 6 x18
tof x2 6
tof x2 x8
tof x2 5
H x18
tof x18 x2
tof x18 5
tof 5 x8
tof x2 x8
T x18
T* x2
T* 5
T x8
tof 5 x18
tof x2 x18
tof x8 5
tof 5 x8
tof x2 5
tof x18 x2
tof x2 x8
T x18
tof x2 x18
tof x8 x18
H x8
P x15
P x3
P x11
P 0
P 5
tof x16 6
H 5
tof 0 6
tof 5 6
tof 5 0
T* 0
T 6
tof x16 6
tof 6 0
tof 5 6
tof 0 6
H 6
tof x11 x9
tof 6 x9
tof 6 x11
T* x11
T x9
tof x9 x11
tof 6 x9
tof x11 x9
H x9
tof x3 x5
tof x9 x5
tof x9 x3
T* x3
T x5
tof x5 x3
tof x9 x5
tof x3 x5
H x5
tof x15 x7
tof x5 x7
tof x5 x15
T* x15
T x7
tof x7 x15
tof x5 x7
tof x15 x7
H x7
tof x19 x13
tof x7 x13
tof x7 x19
T* x19
T x13
tof x13 x19
tof x7 x13
tof x19 x13
H x13
H x17
tof x13 x14
T x13
T x17
T* x14
tof x17 x13
tof x14 x17
tof x13 x14
T* x13
T* x14
T x17
tof x17 x13
tof x17 x14
tof x14 x17
tof x13 x17
H x17
H x14
tof x7 x19
tof x14 x15
tof x14 x19
tof x7 x14
tof x19 x7
T* x14
T* x7
T x19
T* x15
tof x19 x14
tof x15 x7
tof x15 x19
tof x7 x19
tof x14 x7
tof x7 x15
tof x16 0
tof 5 0
tof x19 x14
tof x9 x3
tof x5 x7
tof 6 x11
P 5
P* 0
P 6
P* x11
P x9
P* x3
P x5
P* x7
P x19
P* x14
P x15
tof x16 0
tof 0 5
tof x11 6
tof x3 x9
tof x7 x5
tof x14 x19
tof x19 x14
tof x5 x7
tof x9 x3
tof 6 x11
tof 5 0
H x14
tof x14 x9
tof x14 x5
tof x7 x5
tof x7 x14
tof x5 x7
T* x14
T* x7
T x5
T* x9
tof x5 x14
tof x9 x7
tof x9 x5
tof x7 x5
tof x14 x7
tof x7 x9
H x5
tof x5 6
tof x5 x7
tof x3 x5
tof x7 x3
T* x5
T* x7
T x3
T* 6
tof x3 x5
tof 6 x7
tof 6 x3
tof x7 x3
tof x5 x7
tof x7 6
tof 5 x16
H x3
tof x16 5
tof x3 x16
tof x3 x7
tof x11 x7
tof x11 x3
tof x7 x11
T* x3
T* x11
T x7
T* x16
tof x7 x3
tof x16 x11
tof 5 x11
tof x11 x3
tof 5 x16
tof x16 x7
tof x11 x7
tof x3 x11
tof x3 x16
tof x3 5
H x7
tof 5 x3
tof x7 x18
tof 0 5
tof x7 x2
tof x7 5
tof 0 x7
tof 5 0
T* x7
T* 0
T 5
T* x18
T* x2
tof 5 x7
tof x18 0
tof 0 x7
tof x3 0
tof x3 5
tof x18 5
tof x2 x18
tof x18 x2
tof 0 5
tof x7 0
tof x7 x2
tof x7 x18
H 5
tof 5 x7
tof 5 x18
tof x18 x2
tof x7 x2
T 5
T* x7
T* x18
T x2
tof x18 5
tof x7 5
tof x2 x18
tof x18 x2
tof x7 x18
tof 5 x7
tof x7 x2
T 5
tof x7 5
tof x2 5
H x2
P x9
P 6
P x16
P x18
tof x3 0
H x18
tof x16 0
tof x18 0
tof x18 x16
T* x16
T 0
tof x3 0
tof 0 x16
tof x18 0
tof x16 0
H 0
tof 6 x11
tof 0 x11
tof 0 6
T* 6
T x11
tof x11 6
tof 0 x11
tof 6 x11
H x11
tof x9 x5
tof x11 x5
tof x11 x9
T* x9
T x5
tof x5 x9
tof x11 x5
tof x9 x5
H x5
tof x15 x14
tof x5 x14
tof x5 x15
T* x15
T x14
tof x14 x15
tof x5 x14
tof x15 x14
H x14
H x13
tof x14 x19
T x14
T x13
T* x19
tof x13 x14
tof x19 x13
tof x14 x19
T* x14
T* x19
T x13
tof x13 x14
tof x13 x19
tof x19 x13
tof x14 x13
H x13
H x19
tof x19 x9
tof x19 x15
tof x5 x15
tof x5 x19
tof x15 x5
T* x19
T* x5
T x15
T* x9
tof x15 x19
tof x9 x5
tof x9 x15
tof x5 x15
tof x19 x5
tof x5 x9
tof x3 x16
tof x18 x16
tof x15 x19
tof 0 6
tof x11 x5
P x18
P* x16
P 0
P* 6
P x11
P* x5
P x15
P* x19
P x9
tof x3 x16
tof x16 x18
tof 6 0
tof x5 x11
tof x19 x15
tof x15 x19
tof x11 x5
tof 0 6
tof x18 x16
H x19
tof x19 0
tof x19 x11
tof x5 x19
tof x11 x5
T* x19
T* x11
T x5
T* 0
tof x5 x19
tof 0 x11
tof 0 x5
tof x11 x5
tof x19 x11
tof x11 0
tof x18 x3
H x5
tof x3 x18
tof x5 x3
tof x5 x11
tof 6 x11
tof 6 x5
tof x11 6
T* x5
T* 6
T x11
T* x3
tof x11 x5
tof x3 6
tof x18 6
tof 6 x5
tof x18 x3
tof x3 x11
tof 6 x11
tof x5 6
tof x5 x3
tof x5 x18
H x11
tof x18 x5
tof x11 5
tof x16 x18
tof x11 x7
tof x11 x18
tof x16 x11
tof x18 x16
T* x11
T* x16
T x18
T* 5
T* x7
tof x18 x11
tof 5 x16
tof x16 x11
tof x5 x16
tof x5 x18
tof 5 x18
tof x7 5
tof 5 x7
tof x16 x18
tof x11 x16
tof x11 x7
tof x11 5
H x18
tof x18 x11
tof x18 5
tof 5 x7
tof x11 x7
T x18
T* x11
T* 5
T x7
tof 5 x18
tof x11 x18
tof x7 5
tof 5 x7
tof x11 5
tof x18 x11
tof x11 x7
T x18
tof x11 x18
tof x7 x18
H x7
P 0
P x3
P 5
tof x5 x16
H 5
tof x3 x16
tof 5 x16
tof 5 x3
T* x3
T x16
tof x5 x16
tof x16 x3
tof 5 x16
tof x3 x16
H x16
tof 0 6
tof x16 6
tof x16 0
T* 0
T 6
tof 6 0
tof x16 6
tof 0 6
H 6
tof x9 x19
tof 6 x19
tof 6 x9
T* x9
T x19
tof x19 x9
tof 6 x19
tof x9 x19
H x19
H x14
tof x19 x15
T x19
T x14
T* x15
tof x14 x19
tof x15 x14
tof x19 x15
T* x19
T* x15
T x14
tof x14 x19
tof x14 x15
tof x15 x14
tof x19 x14
H x14
H x15
tof x15 0
tof x15 x9
tof 6 x15
tof x9 6
T* x15
T* x9
T 6
T* 0
tof 6 x15
tof 0 x9
tof 0 6
tof x9 6
tof x15 x9
tof x9 0
tof x5 x3
tof 5 x3
tof 6 x15
tof x16 x9
P 5
P* x3
P x16
P* x9
P 6
P* x15
P 0
tof x5 x3
tof x3 5
tof x9 x16
tof x15 6
tof 6 x15
tof x16 x9
tof 5 x3
tof 5 x5
H x15
tof x5 5
tof x15 x5
tof x15 x16
tof x9 x16
tof x9 x15
tof x16 x9
T* x15
T* x9
T x16
T* x5
tof x16 x15
tof x5 x9
tof 5 x9
tof x9 x15
tof 5 x5
tof x5 x16
tof x9 x16
tof x15 x9
tof x15 x5
tof x15 5
H x16
tof 5 x15
tof x16 x18
tof x3 5
tof x16 x11
tof x16 5
tof x3 x16
tof 5 x3
T* x16
T* x3
T 5
T* x18
T* x11
tof 5 x16
tof x18 x3
tof x3 x16
tof x15 x3
tof x15 5
tof x18 5
tof x11 x18
tof x18 x11
tof x3 5
tof x16 x3
tof x16 x11
tof x16 x18
H 5
tof 5 x16
tof 5 x18
tof x18 x11
tof x16 x11
T 5
T* x16
T* x18
T x11
tof x18 5
tof x16 5
tof x11 x18
tof x18 x11
tof x16 x18
tof 5 x16
tof x16 x11
T 5
tof x16 5
tof x11 5
H x11
P x5
P x18
tof x15 x3
H x18
tof x5 x3
tof x18 x3
tof x18 x5
T* x5
T x3
tof x15 x3
tof x3 x5
tof x18 x3
tof x5 x3
H x3
tof 0 x9
tof x3 x9
tof x3 0
T* 0
T x9
tof x9 0
tof x3 x9
tof 0 x9
H x9
H x19
tof x9 6
T x9
T x19
T* 6
tof x19 x9
tof 6 x19
tof x9 6
T* x9
T* 6
T x19
tof x19 x9
tof x19 6
tof 6 x19
tof x9 x19
tof x5 x15
H x19
H 6
tof x15 x5
tof 6 x15
tof 6 0
tof x3 0
tof x3 6
tof 0 x3
T* 6
T* x3
T 0
T* x15
tof 0 6
tof x15 x3
tof x5 x3
tof x3 6
tof x5 x15
tof x15 0
tof x3 0
tof 6 x3
tof 6 x15
tof x5 6
tof x18 6
tof 0 x3
P x18
P* 6
P 0
P* x3
P x15
tof x5 6
tof 6 x18
tof x3 0
tof 0 x3
tof x18 6
tof x18 x5
H x3
tof x5 x18
tof x3 5
tof 6 x5
tof x3 x16
tof x3 x5
tof 6 x3
tof x5 6
T* x3
T* 6
T x5
T* 5
T* x16
tof x5 x3
tof 5 6
tof 6 x3
tof x18 6
tof x18 x5
tof 5 x5
tof x16 5
tof 5 x16
tof 6 x5
tof x3 6
tof x3 x16
tof x3 5
H x5
tof x5 x3
tof x5 5
tof 5 x16
tof x3 x16
T x5
T* x3
T* 5
T x16
tof 5 x5
tof x3 x5
tof x16 5
tof 5 x16
tof x3 5
tof x5 x3
tof x3 x16
T x5
tof x3 x5
tof x16 x5
H x16
P 5
tof x18 6
H 5
tof x15 6
tof 5 6
tof 5 x15
T* x15
T 6
tof x18 6
tof 6 x15
tof 5 6
tof x15 6
H 6
H x9
tof 6 0
T 6
T x9
T* 0
tof x9 6
tof 0 x9
tof 6 0
T* 6
T* 0
T x9
tof x9 6
tof x9 0
tof 0 x9
tof 6 x9
tof x15 x18
H x9
H 0
tof x18 x15
tof 0 x5
tof 5 x18
tof 0 x3
tof 0 x18
tof 5 0
tof x18 5
T* 0
T* 5
T x18
T* x5
T* x3
tof x18 0
tof x5 5
tof 5 0
tof x15 5
tof x15 x18
tof x5 x18
tof x3 x5
tof x5 x3
tof 5 x18
tof 0 5
tof 0 x3
tof 0 x5
tof x15 5
tof x18 5
P x18
P* 5
P x3
tof x15 5
tof 5 x18
tof x18 5
H 5
tof 5 0
tof 5 x5
tof x5 x3
tof 0 x3
T 5
T* 0
T* x5
T x3
tof x5 5
tof 0 5
tof x3 x5
tof x5 x3
tof 0 x5
tof 5 0
tof 0 x3
T 5
tof 0 5
tof x3 5
tof x18 x15
H x3
H x5
H 6
tof x15 x18
tof x5 x15
T x5
T 6
T* x15
tof 6 x5
tof x15 6
tof x5 x15
T* x5
T* x15
T 6
tof x18 x5
tof 6 x5
tof 6 x15
tof x18 6
tof x15 6
tof x5 6
H 6
H x15
tof x15 5
tof x15 0
T x15
T* 5
T* 0
tof 0 x15
tof 5 x15
tof x15 5
tof 5 0
T x15
tof 5 x15
tof 0 x15
tof x5 x18
H 0
H x18
tof x18 x15
tof x18 5
T x18
T* x15
T* 5
tof 5 x18
tof x15 x18
tof x18 x15
tof x15 5
T x18
tof x15 x18
tof 5 x18
H 5
tof x18 x15
tof x3 2
tof 2 x3
tof x3 2
tof 2 x16
tof x16 2
tof 2 x16
tof x16 x14
tof x14 x16
tof x16 x14
tof x14 x9
tof x9 x14
tof x14 x9
tof x9 1
tof 1 x9
tof x9 1
tof x11 x15
tof x15 x11
tof x11 x15
tof x15 x19
tof x19 x15
tof x15 x19
tof x19 x20
tof x20 x19
tof x19 x20
tof x20 x12
tof x12 x20
tof x20 x12
tof x12 5
tof 5 x12
tof x12 5
tof 5 x2
tof x2 5
tof 5 x2
tof x2 x5
tof x5 x2
tof x2 x5
tof x5 7
tof 7 x5
tof x5 7
tof 7 x1
tof x1 7
tof 7 x1
tof x1 x18
tof x18 x1
tof x1 x18
tof x18 x17
tof x17 x18
tof x18 x17
tof x17 x13
tof x13 x17
tof x17 x13
tof x13 6
tof 6 x13
tof x13 6
tof 6 x8
tof x8 6
tof 6 x8
tof x8 4
tof 4 x8
tof x8 4
tof 4 x7
tof x7 4
tof 4 x7
tof x7 3
tof 3 x7
tof x7 3
END
