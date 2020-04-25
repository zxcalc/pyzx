# Feynman -- quantum circuit toolkit
# Original (mod_adder_1024.qc):
#   Qubits: 28
#   H: 570
#   T: 1995
#   cnot: 2005
#   Depth: 2503
#   T depth: 831
# Result (1680.682ms):
#   Qubits: 28
#   H: 330
#   S: 7
#   T: 1011
#   cnot: 1390
#   swap: 3
#   Depth: 2393
#   T depth: 864
.v x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 0 1 2 3 4 5 6 7
.i x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20
.o x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20
BEGIN 
cnot x10 x20
H x20
cnot x9 x19
H 0
T 0
cnot x18 0
T* 0
cnot x8 0
T 0
cnot x18 0
T* 0
cnot x8 0
swap 1 7
H 0
T 0
cnot x19 0
T* 0
cnot x20 0
T 0
cnot x19 0
T* 0
cnot x20 0
H 0
cnot x20 x19
cnot x9 x19
T* x19
cnot x20 x19
T x19
cnot x9 x19
H x19
T x19
cnot x18 x19
T* x19
cnot x8 x19
T x19
cnot x18 x19
T* x19
cnot x8 x19
H x19
cnot x8 x18
H 1
T 1
cnot x17 1
T* 1
cnot x7 1
T 1
cnot x17 1
T* 1
cnot x7 1
swap 2 6
H 1
cnot 1 0
T* 0
cnot x18 0
T 0
cnot 1 0
S* 0
cnot x8 0
T 0
cnot x18 0
T 0
cnot x8 0
H 0
T 0
cnot x19 0
T* 0
cnot x20 0
T 0
cnot x19 0
T* 0
cnot x20 0
H 0
cnot 0 1
T 1
cnot x18 1
T* 1
cnot 0 1
cnot x18 1
H 1
cnot x17 0
T* 0
cnot x7 0
T 0
cnot x17 0
T* 0
cnot x18 0
cnot x7 0
T 0
cnot x18 0
H 0
T x19
cnot x20 x19
T* x19
cnot x20 x19
H x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
H x19
T 0
cnot x18 0
T* 0
cnot x18 0
H 0
cnot x8 x18
T x18
cnot x8 x18
H x18
T x18
cnot x17 x18
T* x18
cnot x7 x18
T x18
cnot x17 x18
T* x18
cnot x7 x18
H x18
cnot x7 x17
H 2
T 2
cnot x16 2
T* 2
cnot x6 2
T 2
cnot x16 2
T* 2
cnot x6 2
swap 3 5
H 2
cnot 2 1
T* 1
cnot x17 1
T 1
cnot 2 1
S* 1
cnot x7 1
T 1
cnot x17 1
T 1
cnot x7 1
H 1
cnot 1 0
T* 0
cnot x18 0
T 0
cnot 1 0
T* 0
cnot x17 0
cnot x18 0
T* 0
cnot x7 0
T 0
cnot x17 0
T 0
cnot x7 0
H 0
T 0
cnot x19 0
T* 0
cnot x20 0
T 0
cnot x19 0
T* 0
cnot x20 0
H 0
cnot 0 1
T 1
cnot x18 1
T* 1
cnot 0 1
cnot x18 1
H 1
cnot 1 2
T 2
cnot x17 2
T* 2
cnot 1 2
cnot x17 2
H 2
cnot x16 1
T* 1
cnot x6 1
T 1
cnot x16 1
T* 1
cnot x17 1
cnot x6 1
T 1
cnot x17 1
H 1
cnot 1 0
T* 0
cnot x17 0
T 0
cnot 1 0
T* 0
cnot x18 0
cnot x17 0
T 0
cnot x18 0
H 0
T x19
cnot x20 x19
T* x19
cnot x20 x19
H x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
H x19
T 0
cnot x18 0
T* 0
cnot x18 0
H 0
cnot 0 1
T 1
cnot x17 1
T* 1
cnot 0 1
cnot x17 1
H 1
cnot x16 0
T* 0
cnot x6 0
T 0
cnot x16 0
T* 0
cnot x17 0
cnot x6 0
T 0
cnot x17 0
H 0
T x18
H x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
H x18
T 0
cnot x17 0
T* 0
cnot x17 0
H 0
cnot x7 x17
T x17
cnot x7 x17
H x17
T x17
cnot x16 x17
T* x17
cnot x6 x17
T x17
cnot x16 x17
T* x17
cnot x6 x17
H x17
cnot x6 x16
H 3
T 3
cnot x15 3
T* 3
cnot x5 3
T 3
cnot x15 3
T* 3
cnot x5 3
H 3
cnot 3 2
T* 2
cnot x16 2
T 2
cnot 3 2
S* 2
cnot x6 2
T 2
cnot x16 2
T 2
cnot x6 2
H 2
cnot 2 1
T* 1
cnot x17 1
T 1
cnot 2 1
T* 1
cnot x16 1
cnot x17 1
T* 1
cnot x6 1
T 1
cnot x16 1
T 1
cnot x6 1
H 1
cnot 1 0
T* 0
cnot x18 0
T 0
cnot 1 0
T* 0
cnot x16 0
cnot x18 0
T* 0
cnot x6 0
T 0
cnot x16 0
T 0
cnot x6 0
H 0
T 0
cnot x19 0
T* 0
cnot x20 0
T 0
cnot x19 0
T* 0
cnot x20 0
H 0
cnot 0 1
T 1
cnot x18 1
T* 1
cnot 0 1
cnot x18 1
H 1
cnot 1 2
T 2
cnot x17 2
T* 2
cnot 1 2
cnot x17 2
H 2
cnot 2 3
T 3
cnot x16 3
T* 3
cnot 2 3
cnot x16 3
H 3
cnot x15 2
T* 2
cnot x5 2
T 2
cnot x15 2
T* 2
cnot x16 2
cnot x5 2
T 2
cnot x16 2
H 2
cnot 2 1
T* 1
cnot x16 1
T 1
cnot 2 1
T* 1
cnot x17 1
cnot x16 1
T 1
cnot x17 1
H 1
cnot 1 0
T* 0
cnot x17 0
T 0
cnot 1 0
T* 0
cnot x18 0
cnot x17 0
T 0
cnot x18 0
H 0
T x19
cnot x20 x19
T* x19
cnot x20 x19
H x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
H x19
T 0
cnot x18 0
T* 0
cnot x18 0
H 0
cnot 0 1
T 1
cnot x17 1
T* 1
cnot 0 1
cnot x17 1
H 1
cnot 1 2
T 2
cnot x16 2
T* 2
cnot 1 2
cnot x16 2
H 2
cnot x15 1
T* 1
cnot x5 1
T 1
cnot x15 1
T* 1
cnot x16 1
cnot x5 1
T 1
cnot x16 1
H 1
cnot 1 0
T* 0
cnot x16 0
T 0
cnot 1 0
T* 0
cnot x17 0
cnot x16 0
T 0
cnot x17 0
H 0
T x18
H x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
H x18
T 0
cnot x17 0
T* 0
cnot x17 0
H 0
cnot 0 1
T 1
cnot x16 1
T* 1
cnot 0 1
cnot x16 1
H 1
cnot x15 0
T* 0
cnot x5 0
T 0
cnot x15 0
T* 0
cnot x16 0
cnot x5 0
T 0
cnot x16 0
H 0
T x17
H x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
H x17
T 0
cnot x16 0
T* 0
cnot x16 0
H 0
cnot x6 x16
T x16
cnot x6 x16
H x16
T x16
cnot x15 x16
T* x16
cnot x5 x16
T x16
cnot x15 x16
T* x16
cnot x5 x16
H x16
cnot x5 x15
H 4
T 4
cnot x14 4
T* 4
cnot x4 4
T 4
cnot x14 4
T* 4
cnot x4 4
H 4
cnot 4 3
T* 3
cnot x15 3
T 3
cnot 4 3
S* 3
cnot x5 3
T 3
cnot x15 3
T 3
cnot x5 3
H 3
cnot 3 2
T* 2
cnot x16 2
T 2
cnot 3 2
T* 2
cnot x15 2
cnot x16 2
T* 2
cnot x5 2
T 2
cnot x15 2
T 2
cnot x5 2
H 2
cnot 2 1
T* 1
cnot x17 1
T 1
cnot 2 1
T* 1
cnot x15 1
cnot x17 1
T* 1
cnot x5 1
T 1
cnot x15 1
T 1
cnot x5 1
H 1
cnot 1 0
T* 0
cnot x18 0
T 0
cnot 1 0
T* 0
cnot x15 0
cnot x18 0
T* 0
cnot x5 0
T 0
cnot x15 0
T 0
cnot x5 0
H 0
T 0
cnot x19 0
T* 0
cnot x20 0
T 0
cnot x19 0
T* 0
cnot x20 0
H 0
cnot 0 1
T 1
cnot x18 1
T* 1
cnot 0 1
cnot x18 1
H 1
cnot 1 2
T 2
cnot x17 2
T* 2
cnot 1 2
cnot x17 2
H 2
cnot 2 3
T 3
cnot x16 3
T* 3
cnot 2 3
cnot x16 3
H 3
cnot 3 4
T 4
cnot x15 4
T* 4
cnot 3 4
cnot x15 4
H 4
cnot x14 3
T* 3
cnot x4 3
T 3
cnot x14 3
T* 3
cnot x15 3
cnot x4 3
T 3
cnot x15 3
H 3
cnot 3 2
T* 2
cnot x15 2
T 2
cnot 3 2
T* 2
cnot x16 2
cnot x15 2
T 2
cnot x16 2
H 2
cnot 2 1
T* 1
cnot x16 1
T 1
cnot 2 1
T* 1
cnot x17 1
cnot x16 1
T 1
cnot x17 1
H 1
cnot 1 0
T* 0
cnot x17 0
T 0
cnot 1 0
T* 0
cnot x18 0
cnot x17 0
T 0
cnot x18 0
H 0
T x19
cnot x20 x19
T* x19
cnot x20 x19
H x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
H x19
T 0
cnot x18 0
T* 0
cnot x18 0
H 0
cnot 0 1
T 1
cnot x17 1
T* 1
cnot 0 1
cnot x17 1
H 1
cnot 1 2
T 2
cnot x16 2
T* 2
cnot 1 2
cnot x16 2
H 2
cnot 2 3
T 3
cnot x15 3
T* 3
cnot 2 3
cnot x15 3
H 3
cnot x14 2
T* 2
cnot x4 2
T 2
cnot x14 2
T* 2
cnot x15 2
cnot x4 2
T 2
cnot x15 2
H 2
cnot 2 1
T* 1
cnot x15 1
T 1
cnot 2 1
T* 1
cnot x16 1
cnot x15 1
T 1
cnot x16 1
H 1
cnot 1 0
T* 0
cnot x16 0
T 0
cnot 1 0
T* 0
cnot x17 0
cnot x16 0
T 0
cnot x17 0
H 0
T x18
H x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
H x18
T 0
cnot x17 0
T* 0
cnot x17 0
H 0
cnot 0 1
T 1
cnot x16 1
T* 1
cnot 0 1
cnot x16 1
H 1
cnot 1 2
T 2
cnot x15 2
T* 2
cnot 1 2
cnot x15 2
H 2
cnot x14 1
T* 1
cnot x4 1
T 1
cnot x14 1
T* 1
cnot x15 1
cnot x4 1
T 1
cnot x15 1
H 1
cnot 1 0
T* 0
cnot x15 0
T 0
cnot 1 0
T* 0
cnot x16 0
cnot x15 0
T 0
cnot x16 0
H 0
T x17
H x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
H x17
T 0
cnot x16 0
T* 0
cnot x16 0
H 0
cnot 0 1
T 1
cnot x15 1
T* 1
cnot 0 1
cnot x15 1
H 1
cnot x14 0
T* 0
cnot x4 0
T 0
cnot x14 0
T* 0
cnot x15 0
cnot x4 0
T 0
cnot x15 0
H 0
T x16
H x16
T x16
cnot 0 x16
T* x16
cnot x15 x16
T x16
cnot 0 x16
T* x16
cnot x15 x16
H x16
T 0
cnot x15 0
T* 0
cnot x15 0
H 0
cnot x5 x15
T x15
cnot x5 x15
H x15
T x15
cnot x14 x15
T* x15
cnot x4 x15
T x15
cnot x14 x15
T* x15
cnot x4 x15
H x15
cnot x4 x14
H 5
T 5
cnot x13 5
T* 5
cnot x3 5
T 5
cnot x13 5
T* 5
cnot x3 5
H 5
cnot 5 4
T* 4
cnot x14 4
T 4
cnot 5 4
S* 4
cnot x4 4
T 4
cnot x14 4
T 4
cnot x4 4
H 4
cnot 4 3
T* 3
cnot x15 3
T 3
cnot 4 3
T* 3
cnot x14 3
cnot x15 3
T* 3
cnot x4 3
T 3
cnot x14 3
T 3
cnot x4 3
H 3
cnot 3 2
T* 2
cnot x16 2
T 2
cnot 3 2
T* 2
cnot x14 2
cnot x16 2
T* 2
cnot x4 2
T 2
cnot x14 2
T 2
cnot x4 2
H 2
cnot 2 1
T* 1
cnot x17 1
T 1
cnot 2 1
T* 1
cnot x14 1
cnot x17 1
T* 1
cnot x4 1
T 1
cnot x14 1
T 1
cnot x4 1
H 1
cnot 1 0
T* 0
cnot x18 0
T 0
cnot 1 0
T* 0
cnot x14 0
cnot x18 0
T* 0
cnot x4 0
T 0
cnot x14 0
T 0
cnot x4 0
H 0
T 0
cnot x19 0
T* 0
cnot x20 0
T 0
cnot x19 0
T* 0
cnot x20 0
H 0
cnot 0 1
T 1
cnot x18 1
T* 1
cnot 0 1
cnot x18 1
H 1
cnot 1 2
T 2
cnot x17 2
T* 2
cnot 1 2
cnot x17 2
H 2
cnot 2 3
T 3
cnot x16 3
T* 3
cnot 2 3
cnot x16 3
H 3
cnot 3 4
T 4
cnot x15 4
T* 4
cnot 3 4
cnot x15 4
H 4
cnot 4 5
T 5
cnot x14 5
T* 5
cnot 4 5
cnot x14 5
H 5
cnot x13 4
T* 4
cnot x3 4
T 4
cnot x13 4
T* 4
cnot x14 4
cnot x3 4
T 4
cnot x14 4
H 4
cnot 4 3
T* 3
cnot x14 3
T 3
cnot 4 3
T* 3
cnot x15 3
cnot x14 3
T 3
cnot x15 3
H 3
cnot 3 2
T* 2
cnot x15 2
T 2
cnot 3 2
T* 2
cnot x16 2
cnot x15 2
T 2
cnot x16 2
H 2
cnot 2 1
T* 1
cnot x16 1
T 1
cnot 2 1
T* 1
cnot x17 1
cnot x16 1
T 1
cnot x17 1
H 1
cnot 1 0
T* 0
cnot x17 0
T 0
cnot 1 0
T* 0
cnot x18 0
cnot x17 0
T 0
cnot x18 0
H 0
T x19
cnot x20 x19
T* x19
cnot x20 x19
H x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
H x19
T 0
cnot x18 0
T* 0
cnot x18 0
H 0
cnot 0 1
T 1
cnot x17 1
T* 1
cnot 0 1
cnot x17 1
H 1
cnot 1 2
T 2
cnot x16 2
T* 2
cnot 1 2
cnot x16 2
H 2
cnot 2 3
T 3
cnot x15 3
T* 3
cnot 2 3
cnot x15 3
H 3
cnot 3 4
T 4
cnot x14 4
T* 4
cnot 3 4
cnot x14 4
H 4
cnot x13 3
T* 3
cnot x3 3
T 3
cnot x13 3
T* 3
cnot x14 3
cnot x3 3
T 3
cnot x14 3
H 3
cnot 3 2
T* 2
cnot x14 2
T 2
cnot 3 2
T* 2
cnot x15 2
cnot x14 2
T 2
cnot x15 2
H 2
cnot 2 1
T* 1
cnot x15 1
T 1
cnot 2 1
T* 1
cnot x16 1
cnot x15 1
T 1
cnot x16 1
H 1
cnot 1 0
T* 0
cnot x16 0
T 0
cnot 1 0
T* 0
cnot x17 0
cnot x16 0
T 0
cnot x17 0
H 0
T x18
H x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
H x18
T 0
cnot x17 0
T* 0
cnot x17 0
H 0
cnot 0 1
T 1
cnot x16 1
T* 1
cnot 0 1
cnot x16 1
H 1
cnot 1 2
T 2
cnot x15 2
T* 2
cnot 1 2
cnot x15 2
H 2
cnot 2 3
T 3
cnot x14 3
T* 3
cnot 2 3
cnot x14 3
H 3
cnot x13 2
T* 2
cnot x3 2
T 2
cnot x13 2
T* 2
cnot x14 2
cnot x3 2
T 2
cnot x14 2
H 2
cnot 2 1
T* 1
cnot x14 1
T 1
cnot 2 1
T* 1
cnot x15 1
cnot x14 1
T 1
cnot x15 1
H 1
cnot 1 0
T* 0
cnot x15 0
T 0
cnot 1 0
T* 0
cnot x16 0
cnot x15 0
T 0
cnot x16 0
H 0
T x17
H x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
H x17
T 0
cnot x16 0
T* 0
cnot x16 0
H 0
cnot 0 1
T 1
cnot x15 1
T* 1
cnot 0 1
cnot x15 1
H 1
cnot 1 2
T 2
cnot x14 2
T* 2
cnot 1 2
cnot x14 2
H 2
cnot x13 1
T* 1
cnot x3 1
T 1
cnot x13 1
T* 1
cnot x14 1
cnot x3 1
T 1
cnot x14 1
H 1
cnot 1 0
T* 0
cnot x14 0
T 0
cnot 1 0
T* 0
cnot x15 0
cnot x14 0
T 0
cnot x15 0
H 0
T x16
H x16
T x16
cnot 0 x16
T* x16
cnot x15 x16
T x16
cnot 0 x16
T* x16
cnot x15 x16
H x16
T 0
cnot x15 0
T* 0
cnot x15 0
H 0
cnot 0 1
T 1
cnot x14 1
T* 1
cnot 0 1
cnot x14 1
H 1
cnot x13 0
T* 0
cnot x3 0
T 0
cnot x13 0
T* 0
cnot x14 0
cnot x3 0
T 0
cnot x14 0
H 0
T x15
H x15
T x15
cnot 0 x15
T* x15
cnot x14 x15
T x15
cnot 0 x15
T* x15
cnot x14 x15
H x15
T 0
cnot x14 0
T* 0
cnot x14 0
H 0
cnot x4 x14
T x14
cnot x4 x14
H x14
T x14
cnot x13 x14
T* x14
cnot x3 x14
T x14
cnot x13 x14
T* x14
cnot x3 x14
H x14
cnot x3 x13
H 6
T 6
cnot x12 6
T* 6
cnot x2 6
T 6
cnot x12 6
T* 6
cnot x2 6
H 6
cnot 6 5
T* 5
cnot x13 5
T 5
cnot 6 5
S* 5
cnot x3 5
T 5
cnot x13 5
T 5
cnot x3 5
H 5
cnot 5 4
T* 4
cnot x14 4
T 4
cnot 5 4
T* 4
cnot x13 4
cnot x14 4
T* 4
cnot x3 4
T 4
cnot x13 4
T 4
cnot x3 4
H 4
cnot 4 3
T* 3
cnot x15 3
T 3
cnot 4 3
T* 3
cnot x13 3
cnot x15 3
T* 3
cnot x3 3
T 3
cnot x13 3
T 3
cnot x3 3
H 3
cnot 3 2
T* 2
cnot x16 2
T 2
cnot 3 2
T* 2
cnot x13 2
cnot x16 2
T* 2
cnot x3 2
T 2
cnot x13 2
T 2
cnot x3 2
H 2
cnot 2 1
T* 1
cnot x17 1
T 1
cnot 2 1
T* 1
cnot x13 1
cnot x17 1
T* 1
cnot x3 1
T 1
cnot x13 1
T 1
cnot x3 1
H 1
cnot 1 0
T* 0
cnot x18 0
T 0
cnot 1 0
T* 0
cnot x13 0
cnot x18 0
T* 0
cnot x3 0
T 0
cnot x13 0
T 0
cnot x3 0
H 0
T 0
cnot x19 0
T* 0
cnot x20 0
T 0
cnot x19 0
T* 0
cnot x20 0
H 0
cnot 0 1
T 1
cnot x18 1
T* 1
cnot 0 1
cnot x18 1
H 1
cnot 1 2
T 2
cnot x17 2
T* 2
cnot 1 2
cnot x17 2
H 2
cnot 2 3
T 3
cnot x16 3
T* 3
cnot 2 3
cnot x16 3
H 3
cnot 3 4
T 4
cnot x15 4
T* 4
cnot 3 4
cnot x15 4
H 4
cnot 4 5
T 5
cnot x14 5
T* 5
cnot 4 5
cnot x14 5
H 5
cnot 5 6
T 6
cnot x13 6
T* 6
cnot 5 6
cnot x13 6
H 6
cnot x12 5
T* 5
cnot x2 5
T 5
cnot x12 5
T* 5
cnot x13 5
cnot x2 5
T 5
cnot x13 5
H 5
cnot 5 4
T* 4
cnot x13 4
T 4
cnot 5 4
T* 4
cnot x14 4
cnot x13 4
T 4
cnot x14 4
H 4
cnot 4 3
T* 3
cnot x14 3
T 3
cnot 4 3
T* 3
cnot x15 3
cnot x14 3
T 3
cnot x15 3
H 3
cnot 3 2
T* 2
cnot x15 2
T 2
cnot 3 2
T* 2
cnot x16 2
cnot x15 2
T 2
cnot x16 2
H 2
cnot 2 1
T* 1
cnot x16 1
T 1
cnot 2 1
T* 1
cnot x17 1
cnot x16 1
T 1
cnot x17 1
H 1
cnot 1 0
T* 0
cnot x17 0
T 0
cnot 1 0
T* 0
cnot x18 0
cnot x17 0
T 0
cnot x18 0
H 0
T x19
cnot x20 x19
T* x19
cnot x20 x19
H x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
H x19
T 0
cnot x18 0
T* 0
cnot x18 0
H 0
cnot 0 1
T 1
cnot x17 1
T* 1
cnot 0 1
cnot x17 1
H 1
cnot 1 2
T 2
cnot x16 2
T* 2
cnot 1 2
cnot x16 2
H 2
cnot 2 3
T 3
cnot x15 3
T* 3
cnot 2 3
cnot x15 3
H 3
cnot 3 4
T 4
cnot x14 4
T* 4
cnot 3 4
cnot x14 4
H 4
cnot 4 5
T 5
cnot x13 5
T* 5
cnot 4 5
cnot x13 5
H 5
cnot x12 4
T* 4
cnot x2 4
T 4
cnot x12 4
T* 4
cnot x13 4
cnot x2 4
T 4
cnot x13 4
H 4
cnot 4 3
T* 3
cnot x13 3
T 3
cnot 4 3
T* 3
cnot x14 3
cnot x13 3
T 3
cnot x14 3
H 3
cnot 3 2
T* 2
cnot x14 2
T 2
cnot 3 2
T* 2
cnot x15 2
cnot x14 2
T 2
cnot x15 2
H 2
cnot 2 1
T* 1
cnot x15 1
T 1
cnot 2 1
T* 1
cnot x16 1
cnot x15 1
T 1
cnot x16 1
H 1
cnot 1 0
T* 0
cnot x16 0
T 0
cnot 1 0
T* 0
cnot x17 0
cnot x16 0
T 0
cnot x17 0
H 0
T x18
H x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
H x18
T 0
cnot x17 0
T* 0
cnot x17 0
H 0
cnot 0 1
T 1
cnot x16 1
T* 1
cnot 0 1
cnot x16 1
H 1
cnot 1 2
T 2
cnot x15 2
T* 2
cnot 1 2
cnot x15 2
H 2
cnot 2 3
T 3
cnot x14 3
T* 3
cnot 2 3
cnot x14 3
H 3
cnot 3 4
T 4
cnot x13 4
T* 4
cnot 3 4
cnot x13 4
H 4
cnot x12 3
T* 3
cnot x2 3
T 3
cnot x12 3
T* 3
cnot x13 3
cnot x2 3
T 3
cnot x13 3
H 3
cnot 3 2
T* 2
cnot x13 2
T 2
cnot 3 2
T* 2
cnot x14 2
cnot x13 2
T 2
cnot x14 2
H 2
cnot 2 1
T* 1
cnot x14 1
T 1
cnot 2 1
T* 1
cnot x15 1
cnot x14 1
T 1
cnot x15 1
H 1
cnot 1 0
T* 0
cnot x15 0
T 0
cnot 1 0
T* 0
cnot x16 0
cnot x15 0
T 0
cnot x16 0
H 0
T x17
H x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
H x17
T 0
cnot x16 0
T* 0
cnot x16 0
H 0
cnot 0 1
T 1
cnot x15 1
T* 1
cnot 0 1
cnot x15 1
H 1
cnot 1 2
T 2
cnot x14 2
T* 2
cnot 1 2
cnot x14 2
H 2
cnot 2 3
T 3
cnot x13 3
T* 3
cnot 2 3
cnot x13 3
H 3
cnot x12 2
T* 2
cnot x2 2
T 2
cnot x12 2
T* 2
cnot x13 2
cnot x2 2
T 2
cnot x13 2
H 2
cnot 2 1
T* 1
cnot x13 1
T 1
cnot 2 1
T* 1
cnot x14 1
cnot x13 1
T 1
cnot x14 1
H 1
cnot 1 0
T* 0
cnot x14 0
T 0
cnot 1 0
T* 0
cnot x15 0
cnot x14 0
T 0
cnot x15 0
H 0
T x16
H x16
T x16
cnot 0 x16
T* x16
cnot x15 x16
T x16
cnot 0 x16
T* x16
cnot x15 x16
H x16
T 0
cnot x15 0
T* 0
cnot x15 0
H 0
cnot 0 1
T 1
cnot x14 1
T* 1
cnot 0 1
cnot x14 1
H 1
cnot 1 2
T 2
cnot x13 2
T* 2
cnot 1 2
cnot x13 2
H 2
cnot x12 1
T* 1
cnot x2 1
T 1
cnot x12 1
T* 1
cnot x13 1
cnot x2 1
T 1
cnot x13 1
H 1
cnot 1 0
T* 0
cnot x13 0
T 0
cnot 1 0
T* 0
cnot x14 0
cnot x13 0
T 0
cnot x14 0
H 0
T x15
H x15
T x15
cnot 0 x15
T* x15
cnot x14 x15
T x15
cnot 0 x15
T* x15
cnot x14 x15
H x15
T 0
cnot x14 0
T* 0
cnot x14 0
H 0
cnot 0 1
T 1
cnot x13 1
T* 1
cnot 0 1
cnot x13 1
H 1
cnot x12 0
T* 0
cnot x2 0
T 0
cnot x12 0
T* 0
cnot x13 0
cnot x2 0
T 0
cnot x13 0
H 0
T x14
H x14
T x14
cnot 0 x14
T* x14
cnot x13 x14
T x14
cnot 0 x14
T* x14
cnot x13 x14
H x14
T 0
cnot x13 0
T* 0
cnot x13 0
H 0
cnot x3 x13
T x13
cnot x3 x13
H x13
T x13
cnot x12 x13
T* x13
cnot x2 x13
T x13
cnot x12 x13
T* x13
cnot x2 x13
H x13
cnot x2 x12
H 7
T 7
cnot x1 7
T* 7
cnot x11 7
T 7
cnot x1 7
T* 7
cnot x11 7
H 7
cnot 7 6
T* 6
cnot x12 6
T 6
cnot 7 6
S* 6
cnot x2 6
T 6
cnot x12 6
T 6
cnot x2 6
H 6
cnot 6 5
T* 5
cnot x13 5
T 5
cnot 6 5
T* 5
cnot x12 5
cnot x13 5
T* 5
cnot x2 5
T 5
cnot x12 5
T 5
cnot x2 5
H 5
cnot 5 4
T* 4
cnot x14 4
T 4
cnot 5 4
T* 4
cnot x12 4
cnot x14 4
T* 4
cnot x2 4
T 4
cnot x12 4
T 4
cnot x2 4
H 4
cnot 4 3
T* 3
cnot x15 3
T 3
cnot 4 3
T* 3
cnot x12 3
cnot x15 3
T* 3
cnot x2 3
T 3
cnot x12 3
T 3
cnot x2 3
H 3
cnot 3 2
T* 2
cnot x16 2
T 2
cnot 3 2
T* 2
cnot x12 2
cnot x16 2
T* 2
cnot x2 2
T 2
cnot x12 2
T 2
cnot x2 2
H 2
cnot 2 1
T* 1
cnot x17 1
T 1
cnot 2 1
T* 1
cnot x12 1
cnot x17 1
T* 1
cnot x2 1
T 1
cnot x12 1
T 1
cnot x2 1
H 1
cnot 1 0
T* 0
cnot x18 0
T 0
cnot 1 0
T* 0
cnot x12 0
cnot x18 0
T* 0
cnot x2 0
T 0
cnot x12 0
T 0
cnot x2 0
H 0
T x20
cnot 0 x20
T* x20
cnot x19 x20
T x20
cnot 0 x20
T* x20
cnot x9 x20
cnot x19 x20
T* x20
cnot x9 x20
H x20
T 0
cnot x19 0
T* 0
cnot x19 0
H 0
cnot 0 1
T 1
cnot x18 1
T* 1
cnot 0 1
cnot x18 1
H 1
cnot 1 2
T 2
cnot x17 2
T* 2
cnot 1 2
cnot x17 2
H 2
cnot 2 3
T 3
cnot x16 3
T* 3
cnot 2 3
cnot x16 3
H 3
cnot 3 4
T 4
cnot x15 4
T* 4
cnot 3 4
cnot x15 4
H 4
cnot 4 5
T 5
cnot x14 5
T* 5
cnot 4 5
cnot x14 5
H 5
cnot 5 6
T 6
cnot x13 6
T* 6
cnot 5 6
cnot x13 6
H 6
cnot 6 7
T 7
cnot x12 7
T* 7
cnot 6 7
cnot x12 7
H 7
T* 7
cnot x1 7
T 7
cnot x11 7
T* 7
cnot x1 7
T 7
cnot x11 7
H 7
cnot x1 6
T* 6
cnot x11 6
T 6
cnot x1 6
T* 6
cnot x12 6
cnot x11 6
T 6
cnot x12 6
H 6
cnot 6 5
T* 5
cnot x12 5
T 5
cnot 6 5
T* 5
cnot x13 5
cnot x12 5
T 5
cnot x13 5
H 5
cnot 5 4
T* 4
cnot x13 4
T 4
cnot 5 4
T* 4
cnot x14 4
cnot x13 4
T 4
cnot x14 4
H 4
cnot 4 3
T* 3
cnot x14 3
T 3
cnot 4 3
T* 3
cnot x15 3
cnot x14 3
T 3
cnot x15 3
H 3
cnot 3 2
T* 2
cnot x15 2
T 2
cnot 3 2
T* 2
cnot x16 2
cnot x15 2
T 2
cnot x16 2
H 2
cnot 2 1
T* 1
cnot x16 1
T 1
cnot 2 1
T* 1
cnot x17 1
cnot x16 1
T 1
cnot x17 1
H 1
cnot 1 0
T* 0
cnot x17 0
T 0
cnot 1 0
T* 0
cnot x18 0
cnot x17 0
T 0
cnot x18 0
H 0
T x19
H x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
T x19
cnot 0 x19
T* x19
cnot x18 x19
H x19
T 0
cnot x18 0
T* 0
cnot x18 0
H 0
cnot 0 1
T 1
cnot x17 1
T* 1
cnot 0 1
cnot x17 1
H 1
cnot 1 2
T 2
cnot x16 2
T* 2
cnot 1 2
cnot x16 2
H 2
cnot 2 3
T 3
cnot x15 3
T* 3
cnot 2 3
cnot x15 3
H 3
cnot 3 4
T 4
cnot x14 4
T* 4
cnot 3 4
cnot x14 4
H 4
cnot 4 5
T 5
cnot x13 5
T* 5
cnot 4 5
cnot x13 5
H 5
cnot 5 6
T 6
cnot x12 6
T* 6
cnot 5 6
cnot x12 6
H 6
T* 6
cnot x1 6
T 6
cnot x11 6
T* 6
cnot x1 6
T 6
cnot x11 6
H 6
cnot x1 5
T* 5
cnot x11 5
T 5
cnot x1 5
T* 5
cnot x12 5
cnot x11 5
T 5
cnot x12 5
H 5
cnot 5 4
T* 4
cnot x12 4
T 4
cnot 5 4
T* 4
cnot x13 4
cnot x12 4
T 4
cnot x13 4
H 4
cnot 4 3
T* 3
cnot x13 3
T 3
cnot 4 3
T* 3
cnot x14 3
cnot x13 3
T 3
cnot x14 3
H 3
cnot 3 2
T* 2
cnot x14 2
T 2
cnot 3 2
T* 2
cnot x15 2
cnot x14 2
T 2
cnot x15 2
H 2
cnot 2 1
T* 1
cnot x15 1
T 1
cnot 2 1
T* 1
cnot x16 1
cnot x15 1
T 1
cnot x16 1
H 1
cnot 1 0
T* 0
cnot x16 0
T 0
cnot 1 0
T* 0
cnot x17 0
cnot x16 0
T 0
cnot x17 0
H 0
T x18
H x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
T x18
cnot 0 x18
T* x18
cnot x17 x18
H x18
T 0
cnot x17 0
T* 0
cnot x17 0
H 0
cnot 0 1
T 1
cnot x16 1
T* 1
cnot 0 1
cnot x16 1
H 1
cnot 1 2
T 2
cnot x15 2
T* 2
cnot 1 2
cnot x15 2
H 2
cnot 2 3
T 3
cnot x14 3
T* 3
cnot 2 3
cnot x14 3
H 3
cnot 3 4
T 4
cnot x13 4
T* 4
cnot 3 4
cnot x13 4
H 4
cnot 4 5
T 5
cnot x12 5
T* 5
cnot 4 5
cnot x12 5
H 5
T* 5
cnot x1 5
T 5
cnot x11 5
T* 5
cnot x1 5
T 5
cnot x11 5
H 5
cnot x1 4
T* 4
cnot x11 4
T 4
cnot x1 4
T* 4
cnot x12 4
cnot x11 4
T 4
cnot x12 4
H 4
cnot 4 3
T* 3
cnot x12 3
T 3
cnot 4 3
T* 3
cnot x13 3
cnot x12 3
T 3
cnot x13 3
H 3
cnot 3 2
T* 2
cnot x13 2
T 2
cnot 3 2
T* 2
cnot x14 2
cnot x13 2
T 2
cnot x14 2
H 2
cnot 2 1
T* 1
cnot x14 1
T 1
cnot 2 1
T* 1
cnot x15 1
cnot x14 1
T 1
cnot x15 1
H 1
cnot 1 0
T* 0
cnot x15 0
T 0
cnot 1 0
T* 0
cnot x16 0
cnot x15 0
T 0
cnot x16 0
H 0
T x17
H x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
T x17
cnot 0 x17
T* x17
cnot x16 x17
H x17
T 0
cnot x16 0
T* 0
cnot x16 0
H 0
cnot 0 1
T 1
cnot x15 1
T* 1
cnot 0 1
cnot x15 1
H 1
cnot 1 2
T 2
cnot x14 2
T* 2
cnot 1 2
cnot x14 2
H 2
cnot 2 3
T 3
cnot x13 3
T* 3
cnot 2 3
cnot x13 3
H 3
cnot 3 4
T 4
cnot x12 4
T* 4
cnot 3 4
cnot x12 4
H 4
T* 4
cnot x1 4
T 4
cnot x11 4
T* 4
cnot x1 4
T 4
cnot x11 4
H 4
cnot x1 3
T* 3
cnot x11 3
T 3
cnot x1 3
T* 3
cnot x12 3
cnot x11 3
T 3
cnot x12 3
H 3
cnot 3 2
T* 2
cnot x12 2
T 2
cnot 3 2
T* 2
cnot x13 2
cnot x12 2
T 2
cnot x13 2
H 2
cnot 2 1
T* 1
cnot x13 1
T 1
cnot 2 1
T* 1
cnot x14 1
cnot x13 1
T 1
cnot x14 1
H 1
cnot 1 0
T* 0
cnot x14 0
T 0
cnot 1 0
T* 0
cnot x15 0
cnot x14 0
T 0
cnot x15 0
H 0
T x16
H x16
T x16
cnot 0 x16
T* x16
cnot x15 x16
T x16
cnot 0 x16
T* x16
cnot x15 x16
H x16
T 0
cnot x15 0
T* 0
cnot x15 0
H 0
cnot 0 1
T 1
cnot x14 1
T* 1
cnot 0 1
cnot x14 1
H 1
cnot 1 2
T 2
cnot x13 2
T* 2
cnot 1 2
cnot x13 2
H 2
cnot 2 3
T 3
cnot x12 3
T* 3
cnot 2 3
cnot x12 3
H 3
T* 3
cnot x1 3
T 3
cnot x11 3
T* 3
cnot x1 3
T 3
cnot x11 3
H 3
cnot x1 2
T* 2
cnot x11 2
T 2
cnot x1 2
T* 2
cnot x12 2
cnot x11 2
T 2
cnot x12 2
H 2
cnot 2 1
T* 1
cnot x12 1
T 1
cnot 2 1
T* 1
cnot x13 1
cnot x12 1
T 1
cnot x13 1
H 1
cnot 1 0
T* 0
cnot x13 0
T 0
cnot 1 0
T* 0
cnot x14 0
cnot x13 0
T 0
cnot x14 0
H 0
T x15
H x15
T x15
cnot 0 x15
T* x15
cnot x14 x15
T x15
cnot 0 x15
T* x15
cnot x14 x15
H x15
T 0
cnot x14 0
T* 0
cnot x14 0
H 0
cnot 0 1
T 1
cnot x13 1
T* 1
cnot 0 1
cnot x13 1
H 1
cnot 1 2
T 2
cnot x12 2
T* 2
cnot 1 2
cnot x12 2
H 2
T* 2
cnot x1 2
T 2
cnot x11 2
T* 2
cnot x1 2
T 2
cnot x11 2
H 2
cnot x1 1
T* 1
cnot x11 1
T 1
cnot x1 1
T* 1
cnot x12 1
cnot x11 1
T 1
cnot x12 1
H 1
cnot 1 0
T* 0
cnot x12 0
T 0
cnot 1 0
T* 0
cnot x13 0
cnot x12 0
T 0
cnot x13 0
H 0
T x14
H x14
T x14
cnot 0 x14
T* x14
cnot x13 x14
T x14
cnot 0 x14
T* x14
cnot x13 x14
H x14
T 0
cnot x13 0
T* 0
cnot x13 0
H 0
cnot 0 1
T 1
cnot x12 1
T* 1
cnot 0 1
cnot x12 1
H 1
T* 1
cnot x1 1
T 1
cnot x11 1
T* 1
cnot x1 1
T 1
cnot x11 1
H 1
cnot x1 0
T* 0
cnot x11 0
T 0
cnot x1 0
T* 0
cnot x12 0
cnot x11 0
T 0
cnot x12 0
H 0
T x13
H x13
T x13
cnot 0 x13
T* x13
cnot x12 x13
T x13
cnot 0 x13
T* x13
cnot x12 x13
H x13
T 0
cnot x12 0
T* 0
cnot x12 0
H 0
T* 0
cnot x1 0
T 0
cnot x11 0
T* 0
cnot x1 0
T 0
cnot x11 0
H 0
cnot x2 x12
T x12
cnot x2 x12
H x12
T x12
cnot x1 x12
T* x12
cnot x11 x12
T x12
cnot x1 x12
T* x12
cnot x11 x12
H x12
T x1
T x11
cnot x1 x11
T* x11
T x2
T x3
T x4
T x5
T x6
T x7
T x8
T x9
END
