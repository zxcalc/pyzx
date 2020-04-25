# Feynman -- quantum circuit toolkit
# Original (ham15-high.qc):
#   Qubits: 20
#   H: 702
#   T: 2457
#   cnot: 2500
#   Depth: 3026
#   T depth: 996
# Result (768.784ms):
#   Qubits: 20
#   H: 356
#   S: 27
#   T: 1021
#   Z: 12
#   cnot: 1502
#   swap: 3
#   Depth: 2347
#   T depth: 836
.v a b c d e f g h i j k l m n o 0 1 2 3 4
.i a b c d e f g h i j k l m n o
.o a b c d e f g h i j k l m n o
BEGIN 
H 4
T 4
cnot f 4
T* 4
cnot j 4
T 4
cnot f 4
T* 4
cnot j 4
H 4
H 3
T 3
cnot 4 3
T* 3
cnot k 3
T 3
cnot 4 3
T* 3
cnot k 3
swap 0 1
H 3
H 2
T 2
cnot 3 2
T* 2
cnot l 2
T 2
cnot 3 2
T* 2
cnot l 2
H 2
H 1
T 1
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
T* 1
cnot m 1
H 1
H 0
T 0
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
T* 0
cnot n 0
H 0
H b
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot m 2
T* 2
cnot 1 2
cnot m 2
H 2
cnot 2 3
T 3
cnot l 3
T* 3
cnot 2 3
cnot l 3
H 3
cnot 3 4
T 4
cnot k 4
T* 4
cnot 3 4
cnot k 4
H 4
T* 4
cnot f 4
T 4
cnot j 4
T* 4
cnot f 4
T 4
cnot j 4
H 4
cnot f 3
T* 3
cnot j 3
T 3
cnot f 3
T* 3
cnot k 3
cnot j 3
T 3
cnot k 3
H 3
cnot 3 2
T* 2
cnot l 2
T 2
cnot 3 2
cnot l 2
H 2
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot m 2
T* 2
cnot 1 2
cnot m 2
H 2
cnot 2 3
T 3
cnot l 3
T* 3
cnot 2 3
cnot l 3
cnot j 2
T* 2
cnot l 2
T 2
cnot j 2
cnot l 2
H 2
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot m 2
T* 2
cnot 1 2
cnot m 2
H 2
cnot j 1
T* 1
cnot m 1
T 1
cnot j 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot c 2
T* 2
cnot j 2
T 2
cnot c 2
cnot l 2
T* 2
cnot j 2
T 2
cnot l 2
H 2
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
cnot j 1
T* 1
cnot m 1
T 1
cnot j 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot m 2
T* 2
cnot 1 2
cnot m 2
H 2
cnot c 1
T* 1
cnot m 1
T 1
cnot c 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot f 2
T* 2
cnot c 2
T 2
cnot j 2
cnot f 2
T* 2
cnot c 2
T 2
cnot j 2
H 2
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
cnot c 1
T* 1
cnot m 1
T 1
cnot c 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot m 2
T* 2
cnot 1 2
cnot m 2
H 2
cnot c 2
T 2
cnot f 2
T* 2
cnot c 2
T 2
cnot k 2
cnot f 2
T* 2
cnot l 2
T 2
cnot k 2
T* 2
cnot l 2
H 2
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
H c
T 0
cnot c 0
T* 0
cnot o 0
T 0
cnot c 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot m 2
T* 2
cnot 1 2
cnot m 2
H 2
cnot f 1
T* 1
cnot l 1
T 1
cnot f 1
T* 1
cnot m 1
cnot l 1
T 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
S c
cnot 0 c
T* c
cnot o c
T c
cnot 0 c
S* c
cnot o c
H c
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot c 2
T* 2
cnot j 2
T 2
cnot c 2
T* 2
cnot k 2
cnot j 2
T 2
cnot l 2
T* 2
cnot k 2
T 2
cnot l 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
cnot f 1
T* 1
cnot l 1
T 1
cnot f 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot l 2
T* 2
cnot 1 2
cnot l 2
H 2
cnot c 1
T* 1
cnot l 1
T 1
cnot c 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot f 2
T* 2
cnot c 2
T 2
cnot j 2
cnot f 2
T* 2
cnot c 2
T 2
cnot j 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
cnot c 1
T* 1
cnot l 1
T 1
cnot c 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot l 2
T* 2
cnot 1 2
cnot l 2
H 2
cnot h 1
T* 1
cnot m 1
T 1
cnot h 1
T* 1
cnot l 1
cnot m 1
T 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot m 0
T* 0
cnot n 0
T 0
cnot m 0
cnot n 0
H 0
cnot 1 h
T h
cnot m h
T* h
cnot 1 h
cnot m h
H h
T 0
cnot h 0
T* 0
cnot o 0
T 0
cnot h 0
T* 0
cnot o 0
H 0
cnot l 1
T* 1
cnot m 1
T 1
cnot l 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot m 0
T* 0
cnot n 0
T 0
cnot m 0
H 0
S h
cnot 0 h
T* h
cnot o h
T h
cnot 0 h
S* h
cnot o h
H h
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot h 1
T* 1
cnot m 1
T 1
cnot h 1
cnot l 1
T* 1
cnot m 1
T 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot h 1
T 1
cnot m 1
T* 1
cnot h 1
cnot l 1
T 1
cnot m 1
T* 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
H d
T 0
cnot d 0
T* 0
cnot o 0
T 0
cnot d 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot l 0
T* 0
cnot n 0
T 0
cnot l 0
cnot n 0
H 0
T 0
cnot d 0
T* 0
cnot o 0
T 0
cnot d 0
T* 0
cnot o 0
H 0
cnot f 1
T* 1
cnot l 1
T 1
cnot f 1
cnot m 1
T* 1
cnot l 1
T 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot l 0
T* 0
cnot n 0
T 0
cnot l 0
H 0
T 0
cnot d 0
T* 0
cnot o 0
T 0
cnot d 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot l 0
T* 0
cnot n 0
T 0
cnot l 0
cnot n 0
H 0
H m
T m
cnot 0 m
T* m
cnot o m
T m
cnot 0 m
T* m
cnot o m
H m
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot l 0
T 0
cnot n 0
T* 0
cnot l 0
cnot m 0
T 0
cnot n 0
T* 0
cnot m 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot c 2
T 2
cnot f 2
T* 2
cnot c 2
T 2
cnot 3 2
cnot f 2
T* 2
cnot k 2
T 2
cnot 3 2
T* 2
cnot k 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
cnot f 1
T* 1
cnot l 1
T 1
cnot f 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot m 0
T* 0
cnot n 0
T 0
cnot m 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot l 2
T* 2
cnot 1 2
cnot l 2
H 2
cnot 2 3
T 3
cnot k 3
T* 3
cnot 2 3
cnot k 3
H 3
T* 3
cnot f 3
T 3
cnot j 3
T* 3
cnot f 3
T 3
cnot j 3
H 3
cnot f 2
T* 2
cnot k 2
T 2
cnot f 2
cnot k 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot l 2
T* 2
cnot 1 2
cnot l 2
H 2
cnot k 1
T* 1
cnot l 1
T 1
cnot k 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot f 2
T 2
cnot k 2
T* 2
cnot f 2
cnot j 2
T 2
cnot k 2
T* 2
cnot j 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
cnot k 1
T* 1
cnot l 1
T 1
cnot k 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot l 2
T* 2
cnot 1 2
cnot l 2
H 2
cnot l 1
cnot m 1
T 1
cnot l 1
T* 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
cnot 2 j
T j
cnot k j
T* j
cnot k j
cnot 2 j
H j
T j
cnot 0 j
T* j
cnot o j
T j
cnot 0 j
T* j
cnot o j
H j
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot m 0
T* 0
cnot n 0
T 0
cnot m 0
cnot n 0
H 0
cnot 2 k
T k
cnot 2 k
H k
T k
cnot 0 k
T* k
cnot o k
T k
cnot 0 k
T* k
cnot o k
H k
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot l 0
T* 0
cnot n 0
T 0
cnot l 0
cnot m 0
T* 0
cnot n 0
T 0
cnot m 0
H 0
H c
T 0
cnot c 0
T* 0
cnot o 0
T 0
cnot c 0
T* 0
cnot o 0
H 0
cnot m 0
T* 0
cnot l 0
T 0
cnot n 0
cnot m 0
T* 0
cnot l 0
T 0
cnot n 0
H 0
H n
T n
cnot 0 n
T* n
cnot o n
T n
cnot 0 n
T* n
cnot o n
H n
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot f 2
T* 2
cnot k 2
T 2
cnot f 2
T* 2
cnot k 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
cnot m 1
T* 1
cnot l 1
T 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
cnot l 0
T* 0
cnot m 0
T 0
cnot l 0
H 0
T 0
cnot c 0
T* 0
cnot o 0
T 0
cnot c 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot 1 2
T 2
cnot l 2
T* 2
cnot 1 2
cnot l 2
H 2
cnot k 1
T* 1
cnot l 1
T 1
cnot k 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
cnot m 0
H 0
T* c
Z c
cnot 0 c
T* c
cnot o c
T c
cnot 0 c
T c
Z c
cnot o c
H c
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot l 0
T* 0
cnot m 0
T 0
cnot l 0
cnot m 0
H 0
T 0
cnot d 0
T* 0
cnot o 0
T 0
cnot d 0
T* 0
cnot o 0
H 0
cnot c 2
T* 2
cnot j 2
T 2
cnot c 2
T* 2
cnot f 2
cnot j 2
T 2
cnot k 2
T* 2
cnot f 2
T 2
cnot k 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
cnot k 1
T* 1
cnot l 1
T 1
cnot k 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
cnot l 0
T* 0
cnot m 0
T 0
cnot l 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot 1 2
T 2
cnot l 2
T* 2
cnot 1 2
cnot l 2
H 2
cnot j 1
T* 1
cnot l 1
T 1
cnot j 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
cnot m 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot j 0
T* 0
cnot m 0
T 0
cnot j 0
cnot m 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot f 1
T* 1
cnot l 1
T 1
cnot f 1
cnot j 1
T* 1
cnot l 1
T 1
cnot j 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
cnot j 0
T* 0
cnot m 0
T 0
cnot j 0
H 0
H k
T 0
cnot k 0
T* 0
cnot o 0
T 0
cnot k 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot f 2
T* 2
cnot c 2
T 2
cnot j 2
cnot f 2
T* 2
cnot c 2
T 2
cnot j 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
cnot f 1
T* 1
cnot l 1
T 1
cnot f 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
cnot m 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot 1 2
T 2
cnot l 2
T* 2
cnot 1 2
cnot l 2
H 2
cnot l 1
cnot m 1
T 1
cnot l 1
T* 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
T* 0
cnot m 0
cnot n 0
T 0
cnot m 0
H 0
cnot 2 f
T f
cnot c f
T* f
cnot c f
cnot 2 f
H f
T f
cnot 0 f
T* f
cnot o f
T f
cnot 0 f
T* f
cnot o f
H f
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot f 1
T* 1
cnot l 1
T 1
cnot f 1
cnot m 1
T* 1
cnot l 1
T 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
cnot 2 c
T c
cnot 2 c
H c
T c
cnot 0 c
T* c
cnot o c
T c
cnot 0 c
T* c
cnot o c
H c
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot c 2
T* 2
cnot f 2
T 2
cnot c 2
T* 2
cnot f 2
H 2
cnot 2 1
T* 1
cnot j 1
T 1
cnot 2 1
T* 1
cnot f 1
cnot j 1
T 1
cnot l 1
T* 1
cnot f 1
T 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
T* 0
cnot n 0
cnot m 0
T 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot 1 2
T 2
cnot j 2
T* 2
cnot 1 2
cnot j 2
H 2
cnot f 1
T* 1
cnot j 1
T 1
cnot f 1
cnot j 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
cnot m 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot c 0
T* 0
cnot n 0
T 0
cnot c 0
T* 0
cnot m 0
cnot n 0
T 0
cnot m 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot f 1
T 1
cnot j 1
T* 1
cnot f 1
T 1
cnot l 1
cnot j 1
T* 1
cnot m 1
T 1
cnot l 1
T* 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot c 0
T* 0
cnot n 0
T 0
cnot c 0
H 0
H a
T a
cnot 0 a
T* a
cnot o a
T a
cnot 0 a
T* a
cnot o a
H a
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot f 0
T* 0
cnot m 0
T 0
cnot f 0
T* 0
cnot n 0
cnot m 0
T 0
cnot n 0
H 0
H n
T n
cnot 0 n
T* n
cnot o n
T n
cnot 0 n
T* n
cnot o n
H n
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot f 0
T 0
cnot m 0
T* 0
cnot f 0
cnot n 0
T 0
cnot m 0
T* 0
cnot n 0
H 0
cnot 1 l
T l
cnot m l
T* l
cnot m l
cnot 1 l
H l
T l
cnot 0 l
T* l
cnot o l
T l
cnot 0 l
T* l
cnot o l
H l
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot f 1
T* 1
cnot l 1
T 1
cnot f 1
T* 1
cnot m 1
cnot l 1
T 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
cnot n 0
T* 0
cnot m 0
T 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot l 0
T* 0
cnot n 0
T 0
cnot l 0
T* 0
cnot m 0
cnot n 0
T 0
cnot m 0
H 0
S k
cnot 0 k
T* k
cnot o k
T k
cnot 0 k
S* k
cnot o k
H k
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot c 1
T* 1
cnot j 1
T 1
cnot c 1
T* 1
cnot f 1
cnot j 1
T 1
cnot l 1
T* 1
cnot f 1
T 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
T* 0
cnot l 0
cnot m 0
T 0
cnot n 0
T* 0
cnot l 0
T 0
cnot n 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot l 0
T* 0
cnot m 0
T 0
cnot l 0
cnot m 0
H 0
cnot 2 c
T c
cnot f c
T* c
cnot 2 c
cnot 1 c
cnot f c
T c
cnot j c
T* c
cnot 1 c
cnot j c
H c
T c
cnot 0 c
T* c
cnot o c
T c
cnot 0 c
T* c
cnot o c
H c
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot f 0
T* 0
cnot m 0
T 0
cnot f 0
cnot l 0
T* 0
cnot m 0
T 0
cnot l 0
H 0
cnot 1 j
T j
cnot 1 j
H j
T 0
cnot j 0
T* 0
cnot o 0
T 0
cnot j 0
T* 0
cnot o 0
H 0
cnot 0 m
T m
cnot f m
T* m
cnot f m
cnot 0 m
H m
T m
cnot n m
T* m
cnot o m
T m
cnot n m
T* m
cnot o m
H m
T n
cnot o n
T* n
cnot o n
H n
T n
cnot m n
T* n
cnot o n
T n
cnot m n
T* n
cnot o n
H n
cnot c 0
T* 0
cnot m 0
T 0
cnot c 0
T* 0
cnot f 0
cnot m 0
T 0
cnot f 0
H 0
T 0
cnot b 0
T* 0
cnot o 0
T 0
cnot b 0
T* 0
cnot o 0
H 0
cnot 0 c
T c
cnot m c
T* c
cnot 0 c
cnot m c
H c
T c
cnot m c
T* c
cnot o c
T c
cnot m c
T* c
cnot o c
H c
cnot m 0
cnot n 0
T 0
cnot m 0
T* 0
cnot n 0
H 0
S j
cnot 0 j
T* j
cnot o j
T j
cnot 0 j
S* j
cnot o j
H j
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot c 2
T* 2
cnot j 2
T 2
cnot c 2
T* 2
cnot f 2
cnot j 2
T 2
cnot f 2
H 2
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
T* 1
cnot m 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot m 0
T* 0
cnot n 0
T 0
cnot m 0
H 0
Z b
cnot 0 b
T* b
cnot o b
T b
cnot 0 b
Z b
cnot o b
H b
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot 1 2
T 2
cnot m 2
T* 2
cnot 1 2
cnot m 2
H 2
T* 2
cnot c 2
T 2
cnot j 2
T* 2
cnot c 2
T 2
cnot j 2
H 2
cnot c 0
T* 0
cnot l 0
T 0
cnot c 0
T* 0
cnot n 0
cnot l 0
T 0
cnot n 0
H 0
S m
cnot 1 m
T m
cnot o m
cnot 1 m
S* m
cnot o m
H m
T 0
cnot m 0
T* 0
cnot o 0
T 0
cnot m 0
T* 0
cnot o 0
H 0
cnot c 1
T* 1
cnot k 1
T 1
cnot c 1
T* 1
cnot k 1
H 1
cnot 1 0
T* 0
cnot l 0
T 0
cnot 1 0
cnot c 0
T* 0
cnot l 0
T 0
cnot c 0
H 0
T 0
cnot m 0
T* 0
cnot o 0
T 0
cnot m 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot l 1
T* 1
cnot 0 1
cnot l 1
H 1
cnot k 0
T* 0
cnot l 0
T 0
cnot k 0
cnot l 0
H 0
T* m
Z m
cnot 0 m
T* m
cnot o m
T m
cnot 0 m
T m
Z m
cnot o m
H m
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 l
T l
cnot k l
T* l
cnot k l
cnot 0 l
H l
T l
cnot m l
T* l
cnot o l
T l
cnot m l
T* l
cnot o l
H l
cnot 1 c
T c
cnot k c
T* c
cnot k c
cnot 1 c
H c
S m
cnot c m
T* m
cnot o m
T m
cnot c m
S* m
cnot o m
H m
T m
cnot l m
T* m
cnot o m
T m
cnot l m
T* m
cnot o m
H m
cnot 0 k
T k
cnot 1 k
cnot 0 k
T k
cnot 1 k
H k
T k
cnot m k
T* k
cnot o k
T k
cnot m k
T* k
cnot o k
H k
cnot k 1
T* 1
cnot l 1
T 1
cnot k 1
T* 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
T* 0
cnot m 0
H 0
S c
cnot 0 c
T* c
cnot o c
T c
cnot 0 c
S* c
cnot o c
H c
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot c 1
T* 1
cnot k 1
T 1
cnot c 1
cnot l 1
T* 1
cnot k 1
T 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
cnot m 0
H 0
T l
cnot o l
T* l
cnot o l
H l
T 0
cnot l 0
T* 0
cnot o 0
T 0
cnot l 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
S l
cnot f l
T* l
cnot o l
T l
cnot f l
S* l
cnot o l
H l
T m
cnot 0 m
T m
cnot o m
cnot 0 m
T* m
cnot o m
H m
T m
cnot f m
T* m
cnot o m
T m
cnot f m
T* m
cnot o m
H m
cnot c 1
T 1
cnot k 1
T* 1
cnot c 1
T 1
cnot f 1
cnot k 1
T* 1
cnot l 1
T 1
cnot f 1
T* 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot m 0
T 0
cnot 1 0
T* 0
cnot m 0
H 0
T 0
cnot d 0
T* 0
cnot o 0
T 0
cnot d 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot m 1
T* 1
cnot 0 1
cnot m 1
H 1
cnot 1 l
T l
cnot f l
T* l
cnot 1 l
cnot o m
cnot f l
H l
T l
cnot m l
T* l
cnot o l
T l
cnot m l
T* l
cnot o l
H l
cnot l 0
T* 0
cnot m 0
T 0
cnot l 0
T* 0
cnot o 0
T 0
cnot m 0
cnot o 0
H 0
S* d
cnot 0 d
T* d
cnot o d
T d
cnot 0 d
S d
cnot o d
H d
T 0
cnot o 0
T* 0
cnot o 0
S* o
cnot f o
S* o
cnot m o
cnot f o
T* o
cnot m o
H o
T o
cnot 0 o
T* o
cnot n o
T o
cnot 0 o
T* o
cnot n o
H o
T 0
cnot n 0
T* 0
cnot n 0
H 0
S f
cnot 1 f
T f
cnot 1 f
H f
T f
cnot n f
T* f
cnot o f
T f
cnot n f
T* f
cnot o f
H f
cnot l 1
T* 1
cnot m 1
T 1
cnot l 1
T* 1
cnot m 1
H 1
cnot l 0
T 0
cnot m 0
T* 0
cnot l 0
T 0
cnot 1 0
cnot m 0
T* 0
cnot n 0
T 0
cnot 1 0
T* 0
cnot n 0
H 0
H e
T e
cnot 0 e
T* e
cnot o e
T e
cnot 0 e
T* e
cnot o e
H e
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot f 0
T* 0
cnot m 0
T 0
cnot f 0
T* 0
cnot n 0
cnot m 0
T 0
cnot n 0
H 0
S o
cnot n o
T* o
cnot n o
H o
T o
cnot 0 o
T* o
cnot n o
T o
cnot 0 o
T* o
cnot n o
H o
T 0
cnot n 0
T* 0
cnot n 0
H 0
cnot 0 f
T f
cnot m f
T* f
cnot 0 f
cnot m f
cnot o m
H f
T o
cnot f o
T* o
cnot n o
T o
cnot f o
T* o
cnot m o
cnot n o
T o
cnot 0 o
T o
cnot 1 o
cnot 0 o
T o
cnot l o
T* o
cnot m o
cnot l o
cnot 1 o
H o
T o
cnot m o
T* o
cnot n o
T o
cnot m o
T* o
cnot n o
H o
cnot m 0
T* 0
cnot n 0
T 0
cnot m 0
T* 0
cnot n 0
H 0
S f
cnot 0 f
T* f
cnot o f
T f
cnot 0 f
T* f
cnot n f
cnot o f
T* f
cnot n f
H f
T 0
cnot o 0
T* 0
cnot o 0
H 0
T m
cnot 0 m
T m
cnot n m
T* m
cnot 0 m
T* m
cnot n m
H m
T n
Z n
S o
cnot f o
T* o
cnot m o
T o
cnot f o
T* o
cnot n 0
T 0
cnot n 0
cnot o n
cnot m o
cnot m n
H o
T o
cnot l o
T* o
cnot n o
T o
cnot l o
T* o
cnot n o
H o
H k
T k
cnot l k
T* k
cnot n k
T k
cnot l k
T* k
cnot n k
H k
S m
cnot l m
T* m
cnot n m
T m
cnot l m
T* m
cnot f m
cnot n m
T* m
cnot f m
H m
cnot l 0
T* 0
cnot m 0
T 0
cnot l 0
T* 0
cnot m 0
H 0
H j
T 0
cnot j 0
T* 0
cnot n 0
T 0
cnot j 0
T* 0
cnot n 0
H 0
cnot l 1
cnot m 1
T 1
cnot l 1
T* 1
cnot m 1
H 1
cnot l 0
T 0
cnot m 0
T* 0
cnot l 0
T 0
cnot 1 0
cnot m 0
T* 0
cnot n 0
T 0
cnot 1 0
T* 0
cnot n 0
H 0
H g
T g
cnot 0 g
T* g
cnot o g
T g
cnot 0 g
T* g
cnot o g
H g
T 0
cnot o 0
T* 0
cnot o 0
H 0
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
Z n
cnot 0 n
T n
cnot j n
cnot 0 n
T* n
cnot l n
cnot j n
T n
Z n
cnot l n
H n
T n
cnot m n
T* n
cnot o n
T n
cnot m n
T* n
cnot o n
H n
T* l
Z l
cnot 1 l
T l
cnot m l
T* l
cnot 1 l
cnot m l
H l
T l
cnot m l
T* l
cnot o l
T l
cnot m l
T* l
cnot o l
H l
cnot n 0
T* 0
cnot o 0
cnot l 0
T* 0
cnot n 0
T 0
cnot l 0
cnot o 0
cnot n o
cnot o l
H 0
H h
T h
cnot 0 h
T* h
cnot o h
T h
cnot 0 h
T* h
cnot o h
H h
T 0
cnot o 0
T* 0
cnot o 0
H 0
T o
cnot n o
T* o
Z o
cnot m o
S* o
cnot n o
cnot m o
H o
T o
cnot l o
T* o
cnot m o
T o
cnot l o
T* o
cnot m o
H o
cnot l 1
T* 1
cnot m 1
T 1
cnot l 1
cnot m 1
cnot o n
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
T* 0
cnot l 0
cnot n 0
T 0
cnot o 0
cnot n 0
T* 0
cnot l 0
T 0
cnot n 0
cnot o 0
H 0
H i
T i
cnot 0 i
T* i
cnot o i
T i
cnot 0 i
T* i
cnot o i
H i
T 0
cnot o 0
T* 0
cnot o 0
H 0
T* 0
cnot 1 0
T 0
cnot n 0
T* 0
cnot 1 0
T 0
cnot n 0
H 0
H 1
T* 1
cnot l 1
T 1
cnot m 1
T* 1
cnot l 1
T 1
cnot m 1
H 1
S j
cnot m j
T* j
cnot n j
T* j
cnot m j
T j
cnot n j
cnot o l
swap l o
cnot k o
cnot m n
H j
Z m
T n
cnot m n
T* n
T l
cnot l o
cnot k o
T o
cnot m o
T* o
T f
cnot n l
cnot n m
cnot m o
swap m n
cnot l o
cnot k o
cnot k n
cnot n j
cnot j m
cnot m i
cnot i m
cnot i l
cnot l h
cnot h l
cnot j n
cnot h k
cnot k g
cnot g j
cnot j f
cnot f j
cnot f i
cnot i e
cnot e i
cnot g k
cnot e h
cnot h d
cnot d g
cnot g c
cnot c g
cnot c f
cnot f b
cnot b f
cnot d h
cnot b e
cnot e a
cnot a e
cnot a d
END
