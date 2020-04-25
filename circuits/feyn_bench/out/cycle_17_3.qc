# Feynman -- quantum circuit toolkit
# Original (cycle_17_3.qc):
#   Qubits: 35
#   H: 1354
#   T: 4739
#   cnot: 4742
#   Depth: 5974
#   T depth: 2001
# Result (2018.665ms):
#   Qubits: 35
#   H: 682
#   S: 48
#   T: 1955
#   Z: 18
#   cnot: 2968
#   swap: 21
#   Depth: 5411
#   T depth: 1857
.v a b c d e f g h i j k l m n o p q r s t 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
.i a b c d e f g h i j k l m n o p q r s t
.o a b c d e f g h i j k l m n o p q r s t
BEGIN 
H 12
H 11
H 10
H 9
H 8
S 8
T h
swap 4 8
H 8
H 7
T 7
cnot 8 7
T* 7
cnot i 7
T 7
cnot 8 7
T* 7
cnot i 7
swap 3 5
H 7
H 6
T 6
cnot 7 6
T* 6
cnot j 6
T 6
cnot 7 6
T* 6
cnot j 6
H 6
H 5
T 5
cnot 6 5
T* 5
cnot k 5
T 5
cnot 6 5
T* 5
cnot k 5
H 5
H 4
T 4
cnot 5 4
T* 4
cnot l 4
T 4
cnot 5 4
T* 4
cnot l 4
H 4
H 3
T 3
cnot 4 3
T* 3
cnot m 3
T 3
cnot 4 3
T* 3
cnot m 3
H 3
H 2
T 2
cnot 3 2
T* 2
cnot n 2
T 2
cnot 3 2
T* 2
cnot n 2
H 2
H 1
T 1
cnot 2 1
T* 1
cnot o 1
T 1
cnot 2 1
T* 1
cnot o 1
H 1
H 0
T 0
cnot 1 0
T* 0
cnot p 0
T 0
cnot 1 0
T* 0
cnot p 0
H 0
H q
T 0
cnot q 0
T* 0
cnot t 0
T 0
cnot q 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot p 1
T* 1
cnot 0 1
cnot p 1
H 1
cnot 1 2
T 2
cnot o 2
T* 2
cnot 1 2
cnot o 2
H 2
cnot 2 3
T 3
cnot n 3
T* 3
cnot 2 3
cnot n 3
H 3
cnot 3 4
T 4
cnot m 4
T* 4
cnot 3 4
cnot m 4
H 4
cnot 4 5
T 5
cnot l 5
T* 5
cnot 4 5
cnot l 5
H 5
cnot 5 6
T 6
cnot k 6
T* 6
cnot 5 6
cnot k 6
H 6
cnot 6 7
T 7
cnot j 7
T* 7
cnot 6 7
cnot j 7
H 7
cnot 7 8
T 8
cnot i 8
T* 8
cnot 7 8
cnot i 8
H 8
S* 8
T h
Z h
swap 7 8
swap 6 8
swap 5 8
swap 4 8
swap 3 8
swap 2 8
swap 1 8
swap 0 8
H 8
T* 8
cnot 11 8
T 8
cnot e 8
T* 8
cnot 10 8
cnot 11 8
T 8
cnot f 8
cnot e 8
T* 8
cnot 9 8
cnot 10 8
T 8
cnot g 8
cnot f 8
T* 8
cnot 9 8
T 8
cnot g 8
H 8
S 8
cnot 9 g
T g
cnot 9 g
H 8
cnot 8 7
T* 7
cnot h 7
T 7
cnot 8 7
T* 7
cnot i 7
cnot h 7
T 7
cnot i 7
H 7
cnot 7 6
T* 6
cnot i 6
T 6
cnot 7 6
T* 6
cnot j 6
cnot i 6
T 6
cnot j 6
H 6
cnot 6 5
T* 5
cnot j 5
T 5
cnot 6 5
T* 5
cnot k 5
cnot j 5
T 5
cnot k 5
H 5
cnot 5 4
T* 4
cnot k 4
T 4
cnot 5 4
T* 4
cnot l 4
cnot k 4
T 4
cnot l 4
H 4
cnot 4 3
T* 3
cnot l 3
T 3
cnot 4 3
T* 3
cnot m 3
cnot l 3
T 3
cnot m 3
H 3
cnot 3 2
T* 2
cnot m 2
T 2
cnot 3 2
T* 2
cnot n 2
cnot m 2
T 2
cnot n 2
H 2
cnot 2 1
T* 1
cnot n 1
T 1
cnot 2 1
T* 1
cnot o 1
cnot n 1
T 1
cnot o 1
H 1
cnot 1 0
T* 0
cnot o 0
T 0
cnot 1 0
T* 0
cnot p 0
cnot o 0
T 0
cnot p 0
H 0
H p
T p
cnot 0 p
T* p
cnot t p
T p
cnot 0 p
T* p
cnot t p
H p
T 0
cnot t 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot o 1
T* 1
cnot 0 1
cnot o 1
H 1
cnot 1 2
T 2
cnot n 2
T* 2
cnot 1 2
cnot n 2
H 2
cnot 2 3
T 3
cnot m 3
T* 3
cnot 2 3
cnot m 3
H 3
cnot 3 4
T 4
cnot l 4
T* 4
cnot 3 4
cnot l 4
H 4
cnot 4 5
T 5
cnot k 5
T* 5
cnot 4 5
cnot k 5
H 5
cnot 5 6
T 6
cnot j 6
T* 6
cnot 5 6
cnot j 6
H 6
cnot 6 7
T 7
cnot i 7
T* 7
cnot 6 7
cnot i 7
H 7
cnot 7 8
T 8
cnot h 8
T* 8
cnot 7 8
cnot h 8
H 8
S* 8
T g
Z g
H 8
T* 8
cnot 10 8
T 8
cnot e 8
T* 8
cnot 10 8
cnot 9 8
T 8
cnot e 8
cnot f 8
T* 8
cnot 9 8
T 8
cnot f 8
H 8
S 8
cnot 10 f
T f
cnot 10 f
H 8
cnot 8 7
T* 7
cnot g 7
T 7
cnot 8 7
T* 7
cnot h 7
cnot g 7
T 7
cnot h 7
H 7
cnot 7 6
T* 6
cnot h 6
T 6
cnot 7 6
T* 6
cnot i 6
cnot h 6
T 6
cnot i 6
H 6
cnot 6 5
T* 5
cnot i 5
T 5
cnot 6 5
T* 5
cnot j 5
cnot i 5
T 5
cnot j 5
H 5
cnot 5 4
T* 4
cnot j 4
T 4
cnot 5 4
T* 4
cnot k 4
cnot j 4
T 4
cnot k 4
H 4
cnot 4 3
T* 3
cnot k 3
T 3
cnot 4 3
T* 3
cnot l 3
cnot k 3
T 3
cnot l 3
H 3
cnot 3 2
T* 2
cnot l 2
T 2
cnot 3 2
T* 2
cnot m 2
cnot l 2
T 2
cnot m 2
H 2
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
T* 1
cnot n 1
cnot m 1
T 1
cnot n 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
T* 0
cnot o 0
cnot n 0
T 0
cnot o 0
H 0
H o
T o
cnot 0 o
T* o
cnot t o
T o
cnot 0 o
T* o
cnot t o
H o
T 0
cnot t 0
T* 0
cnot t 0
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
cnot 4 5
T 5
cnot j 5
T* 5
cnot 4 5
cnot j 5
H 5
cnot 5 6
T 6
cnot i 6
T* 6
cnot 5 6
cnot i 6
H 6
cnot 6 7
T 7
cnot h 7
T* 7
cnot 6 7
cnot h 7
H 7
cnot 7 8
T 8
cnot g 8
T* 8
cnot 7 8
cnot g 8
H 8
S* 8
T f
Z f
H 8
T* 8
cnot 9 8
T 8
cnot e 8
T* 8
cnot 9 8
T 8
cnot e 8
H 8
S 8
cnot 11 e
T e
cnot 11 e
H 8
cnot 8 7
T* 7
cnot f 7
T 7
cnot 8 7
T* 7
cnot g 7
cnot f 7
T 7
cnot g 7
H 7
cnot 7 6
T* 6
cnot g 6
T 6
cnot 7 6
T* 6
cnot h 6
cnot g 6
T 6
cnot h 6
H 6
cnot 6 5
T* 5
cnot h 5
T 5
cnot 6 5
T* 5
cnot i 5
cnot h 5
T 5
cnot i 5
H 5
cnot 5 4
T* 4
cnot i 4
T 4
cnot 5 4
T* 4
cnot j 4
cnot i 4
T 4
cnot j 4
H 4
cnot 4 3
T* 3
cnot j 3
T 3
cnot 4 3
T* 3
cnot k 3
cnot j 3
T 3
cnot k 3
H 3
cnot 3 2
T* 2
cnot k 2
T 2
cnot 3 2
T* 2
cnot l 2
cnot k 2
T 2
cnot l 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
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
cnot t n
T n
cnot 0 n
T* n
cnot t n
H n
T 0
cnot t 0
T* 0
cnot t 0
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
cnot 2 3
T 3
cnot k 3
T* 3
cnot 2 3
cnot k 3
H 3
cnot 3 4
T 4
cnot j 4
T* 4
cnot 3 4
cnot j 4
H 4
cnot 4 5
T 5
cnot i 5
T* 5
cnot 4 5
cnot i 5
H 5
cnot 5 6
T 6
cnot h 6
T* 6
cnot 5 6
cnot h 6
H 6
cnot 6 7
T 7
cnot g 7
T* 7
cnot 6 7
cnot g 7
H 7
cnot 7 8
T 8
cnot f 8
T* 8
cnot 7 8
cnot f 8
H 8
S* 8
T e
Z e
H 8
cnot 8 7
T* 7
cnot e 7
T 7
cnot 8 7
T* 7
cnot f 7
cnot e 7
T 7
cnot f 7
H 7
cnot 7 6
T* 6
cnot f 6
T 6
cnot 7 6
T* 6
cnot g 6
cnot f 6
T 6
cnot g 6
H 6
cnot 6 5
T* 5
cnot g 5
T 5
cnot 6 5
T* 5
cnot h 5
cnot g 5
T 5
cnot h 5
H 5
cnot 5 4
T* 4
cnot h 4
T 4
cnot 5 4
T* 4
cnot i 4
cnot h 4
T 4
cnot i 4
H 4
cnot 4 3
T* 3
cnot i 3
T 3
cnot 4 3
T* 3
cnot j 3
cnot i 3
T 3
cnot j 3
H 3
cnot 3 2
T* 2
cnot j 2
T 2
cnot 3 2
T* 2
cnot k 2
cnot j 2
T 2
cnot k 2
H 2
cnot 2 1
T* 1
cnot k 1
T 1
cnot 2 1
T* 1
cnot l 1
cnot k 1
T 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot l 0
T 0
cnot 1 0
T* 0
cnot m 0
cnot l 0
T 0
cnot m 0
H 0
H m
T m
cnot 0 m
T* m
cnot t m
T m
cnot 0 m
T* m
cnot t m
H m
T 0
cnot t 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot l 1
T* 1
cnot 0 1
cnot l 1
H 1
cnot 1 2
T 2
cnot k 2
T* 2
cnot 1 2
cnot k 2
H 2
cnot 2 3
T 3
cnot j 3
T* 3
cnot 2 3
cnot j 3
H 3
cnot 3 4
T 4
cnot i 4
T* 4
cnot 3 4
cnot i 4
H 4
cnot 4 5
T 5
cnot h 5
T* 5
cnot 4 5
cnot h 5
H 5
cnot 5 6
T 6
cnot g 6
T* 6
cnot 5 6
cnot g 6
H 6
cnot 6 7
T 7
cnot f 7
T* 7
cnot 6 7
cnot f 7
H 7
cnot 7 8
T 8
cnot e 8
T* 8
cnot 7 8
cnot e 8
H 8
T* 8
cnot c 8
T 8
cnot d 8
T* 8
cnot c 8
T 8
cnot d 8
H 8
cnot c 7
T* 7
cnot d 7
T 7
cnot c 7
T* 7
cnot e 7
cnot d 7
T 7
cnot e 7
H 7
cnot 7 6
T* 6
cnot e 6
T 6
cnot 7 6
T* 6
cnot f 6
cnot e 6
T 6
cnot f 6
H 6
cnot 6 5
T* 5
cnot f 5
T 5
cnot 6 5
T* 5
cnot g 5
cnot f 5
T 5
cnot g 5
H 5
cnot 5 4
T* 4
cnot g 4
T 4
cnot 5 4
T* 4
cnot h 4
cnot g 4
T 4
cnot h 4
H 4
cnot 4 3
T* 3
cnot h 3
T 3
cnot 4 3
T* 3
cnot i 3
cnot h 3
T 3
cnot i 3
H 3
cnot 3 2
T* 2
cnot i 2
T 2
cnot 3 2
T* 2
cnot j 2
cnot i 2
T 2
cnot j 2
H 2
cnot 2 1
T* 1
cnot j 1
T 1
cnot 2 1
T* 1
cnot k 1
cnot j 1
T 1
cnot k 1
H 1
cnot 1 0
T* 0
cnot k 0
T 0
cnot 1 0
T* 0
cnot l 0
cnot k 0
T 0
cnot l 0
H 0
H l
T l
cnot 0 l
T* l
cnot t l
T l
cnot 0 l
T* l
cnot t l
H l
T 0
cnot t 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot k 1
T* 1
cnot 0 1
cnot k 1
H 1
cnot 1 2
T 2
cnot j 2
T* 2
cnot 1 2
cnot j 2
H 2
cnot 2 3
T 3
cnot i 3
T* 3
cnot 2 3
cnot i 3
H 3
cnot 3 4
T 4
cnot h 4
T* 4
cnot 3 4
cnot h 4
H 4
cnot 4 5
T 5
cnot g 5
T* 5
cnot 4 5
cnot g 5
H 5
cnot 5 6
T 6
cnot f 6
T* 6
cnot 5 6
cnot f 6
H 6
cnot 6 7
T 7
cnot e 7
T* 7
cnot 6 7
cnot e 7
H 7
cnot c 6
T* 6
cnot d 6
T 6
cnot c 6
T* 6
cnot e 6
cnot d 6
T 6
cnot e 6
H 6
cnot 6 5
T* 5
cnot e 5
T 5
cnot 6 5
T* 5
cnot f 5
cnot e 5
T 5
cnot f 5
H 5
cnot 5 4
T* 4
cnot f 4
T 4
cnot 5 4
T* 4
cnot g 4
cnot f 4
T 4
cnot g 4
H 4
cnot 4 3
T* 3
cnot g 3
T 3
cnot 4 3
T* 3
cnot h 3
cnot g 3
T 3
cnot h 3
H 3
cnot 3 2
T* 2
cnot h 2
T 2
cnot 3 2
T* 2
cnot i 2
cnot h 2
T 2
cnot i 2
H 2
cnot 2 1
T* 1
cnot i 1
T 1
cnot 2 1
T* 1
cnot j 1
cnot i 1
T 1
cnot j 1
H 1
cnot 1 0
T* 0
cnot j 0
T 0
cnot 1 0
T* 0
cnot k 0
cnot j 0
T 0
cnot k 0
H 0
H k
T k
cnot 0 k
T* k
cnot t k
T k
cnot 0 k
T* k
cnot t k
H k
T 0
cnot t 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot j 1
T* 1
cnot 0 1
cnot j 1
H 1
cnot 1 2
T 2
cnot i 2
T* 2
cnot 1 2
cnot i 2
H 2
cnot 2 3
T 3
cnot h 3
T* 3
cnot 2 3
cnot h 3
H 3
cnot 3 4
T 4
cnot g 4
T* 4
cnot 3 4
cnot g 4
H 4
cnot 4 5
T 5
cnot f 5
T* 5
cnot 4 5
cnot f 5
H 5
cnot 5 6
T 6
cnot e 6
T* 6
cnot 5 6
cnot e 6
H 6
cnot c 5
T* 5
cnot d 5
T 5
cnot c 5
T* 5
cnot e 5
cnot d 5
T 5
cnot e 5
H 5
cnot 5 4
T* 4
cnot e 4
T 4
cnot 5 4
T* 4
cnot f 4
cnot e 4
T 4
cnot f 4
H 4
cnot 4 3
T* 3
cnot f 3
T 3
cnot 4 3
T* 3
cnot g 3
cnot f 3
T 3
cnot g 3
H 3
cnot 3 2
T* 2
cnot g 2
T 2
cnot 3 2
T* 2
cnot h 2
cnot g 2
T 2
cnot h 2
H 2
cnot 2 1
T* 1
cnot h 1
T 1
cnot 2 1
T* 1
cnot i 1
cnot h 1
T 1
cnot i 1
H 1
cnot 1 0
T* 0
cnot i 0
T 0
cnot 1 0
T* 0
cnot j 0
cnot i 0
T 0
cnot j 0
H 0
H j
T j
cnot 0 j
T* j
cnot t j
T j
cnot 0 j
T* j
cnot t j
H j
T 0
cnot t 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot i 1
T* 1
cnot 0 1
cnot i 1
H 1
cnot 1 2
T 2
cnot h 2
T* 2
cnot 1 2
cnot h 2
H 2
cnot 2 3
T 3
cnot g 3
T* 3
cnot 2 3
cnot g 3
H 3
cnot 3 4
T 4
cnot f 4
T* 4
cnot 3 4
cnot f 4
H 4
cnot 4 5
T 5
cnot e 5
T* 5
cnot 4 5
cnot e 5
H 5
cnot c 4
T* 4
cnot d 4
T 4
cnot c 4
T* 4
cnot e 4
cnot d 4
T 4
cnot e 4
H 4
cnot 4 3
T* 3
cnot e 3
T 3
cnot 4 3
T* 3
cnot f 3
cnot e 3
T 3
cnot f 3
H 3
cnot 3 2
T* 2
cnot f 2
T 2
cnot 3 2
T* 2
cnot g 2
cnot f 2
T 2
cnot g 2
H 2
cnot 2 1
T* 1
cnot g 1
T 1
cnot 2 1
T* 1
cnot h 1
cnot g 1
T 1
cnot h 1
H 1
cnot 1 0
T* 0
cnot h 0
T 0
cnot 1 0
T* 0
cnot i 0
cnot h 0
T 0
cnot i 0
H 0
H i
T i
cnot 0 i
T* i
cnot t i
T i
cnot 0 i
T* i
cnot t i
H i
T 0
cnot t 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot h 1
T* 1
cnot 0 1
cnot h 1
H 1
cnot 1 2
T 2
cnot g 2
T* 2
cnot 1 2
cnot g 2
H 2
cnot 2 3
T 3
cnot f 3
T* 3
cnot 2 3
cnot f 3
H 3
cnot 3 4
T 4
cnot e 4
T* 4
cnot 3 4
cnot e 4
H 4
cnot c 3
T* 3
cnot d 3
T 3
cnot c 3
T* 3
cnot e 3
cnot d 3
T 3
cnot e 3
H 3
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot f 2
cnot e 2
T 2
cnot f 2
H 2
cnot 2 1
T* 1
cnot f 1
T 1
cnot 2 1
T* 1
cnot g 1
cnot f 1
T 1
cnot g 1
H 1
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot h 0
cnot g 0
T 0
cnot h 0
H 0
S h
H h
T h
cnot 0 h
T* h
cnot t h
T h
cnot 0 h
T* h
cnot t h
H h
T 0
cnot t 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot g 1
T* 1
cnot 0 1
cnot g 1
H 1
cnot 1 2
T 2
cnot f 2
T* 2
cnot 1 2
cnot f 2
H 2
cnot 2 3
T 3
cnot e 3
T* 3
cnot 2 3
cnot e 3
H 3
cnot c 2
T* 2
cnot d 2
T 2
cnot c 2
T* 2
cnot e 2
cnot d 2
T 2
cnot e 2
H 2
cnot 2 1
T* 1
cnot e 1
T 1
cnot 2 1
T* 1
cnot f 1
cnot e 1
T 1
cnot f 1
H 1
cnot 1 0
T* 0
cnot f 0
T 0
cnot 1 0
T* 0
cnot g 0
cnot f 0
T 0
cnot g 0
H 0
S g
H g
T g
cnot 0 g
T* g
cnot t g
T g
cnot 0 g
T* g
cnot t g
H g
T 0
cnot t 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot f 1
T* 1
cnot 0 1
cnot f 1
H 1
cnot 1 2
T 2
cnot e 2
T* 2
cnot 1 2
cnot e 2
H 2
cnot c 1
T* 1
cnot d 1
T 1
cnot c 1
T* 1
cnot e 1
cnot d 1
T 1
cnot e 1
H 1
cnot 1 0
T* 0
cnot e 0
T 0
cnot 1 0
T* 0
cnot f 0
cnot e 0
T 0
cnot f 0
H 0
S f
H f
T f
cnot 0 f
T* f
cnot t f
T f
cnot 0 f
T* f
cnot t f
H f
T 0
cnot t 0
T* 0
cnot t 0
H 0
cnot 0 1
T 1
cnot e 1
T* 1
cnot 0 1
cnot e 1
H 1
cnot c 0
T* 0
cnot d 0
T 0
cnot c 0
T* 0
cnot e 0
cnot d 0
T 0
cnot e 0
H 0
S e
H e
T e
cnot 0 e
T* e
cnot t e
T e
cnot 0 e
T* e
cnot t e
H e
T 0
cnot t 0
T* 0
cnot t 0
H 0
T* d
cnot 0 d
T d
cnot c d
T* d
cnot 0 d
T d
cnot 1 d
T* d
cnot c d
T d
cnot 2 d
cnot 1 d
T d
cnot c d
T* d
cnot 3 d
cnot 2 d
T* d
cnot c d
T d
cnot 4 d
cnot 3 d
T d
cnot c d
T* d
cnot 5 d
cnot 4 d
T* d
cnot c d
T d
cnot 6 d
cnot 5 d
T d
cnot c d
T* d
cnot 7 d
cnot 6 d
T* d
cnot c d
T d
cnot 7 d
H d
T d
cnot c d
T* d
cnot t d
T d
cnot c d
T* d
cnot t d
H d
cnot t c
H 13
Z 8
cnot 12 8
T* 8
cnot d 8
T 8
cnot 12 8
T* 8
cnot 11 8
cnot d 8
T* 8
cnot e 8
T 8
cnot 11 8
T* 8
cnot 10 8
cnot e 8
T* 8
cnot f 8
T 8
cnot 10 8
T* 8
cnot 9 8
cnot f 8
T* 8
cnot g 8
T 8
cnot 9 8
T* 8
cnot g 8
H 8
S 8
T h
swap 14 8
H 8
cnot 8 7
T* 7
cnot i 7
T 7
cnot 8 7
T* 7
cnot t 7
cnot i 7
cnot c 7
T 7
cnot c 7
cnot t 7
H 7
cnot 7 6
T* 6
cnot j 6
T 6
cnot 7 6
T* 6
cnot t 6
cnot j 6
cnot c 6
T 6
cnot c 6
cnot t 6
H 6
cnot 6 5
T* 5
cnot k 5
T 5
cnot 6 5
T* 5
cnot t 5
cnot k 5
cnot c 5
T 5
cnot c 5
cnot t 5
H 5
cnot 5 4
T* 4
cnot l 4
T 4
cnot 5 4
T* 4
cnot t 4
cnot l 4
cnot c 4
T 4
cnot c 4
cnot t 4
H 4
cnot 4 3
T* 3
cnot m 3
T 3
cnot 4 3
T* 3
cnot t 3
cnot m 3
cnot c 3
T 3
cnot c 3
cnot t 3
H 3
cnot 3 2
T* 2
cnot n 2
T 2
cnot 3 2
T* 2
cnot t 2
cnot n 2
cnot c 2
T 2
cnot c 2
cnot t 2
H 2
cnot 2 1
T* 1
cnot o 1
T 1
cnot 2 1
T* 1
cnot t 1
cnot o 1
cnot c 1
T 1
cnot c 1
cnot t 1
H 1
cnot 1 0
T* 0
cnot p 0
T 0
cnot 1 0
T* 0
cnot t 0
cnot p 0
cnot c 0
T 0
cnot c 0
cnot t 0
H 0
T 0
cnot q 0
T* 0
cnot s 0
T 0
cnot q 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot p 1
T* 1
cnot 0 1
cnot p 1
H 1
cnot 1 2
T 2
cnot o 2
T* 2
cnot 1 2
cnot o 2
H 2
cnot 2 3
T 3
cnot n 3
T* 3
cnot 2 3
cnot n 3
H 3
cnot 3 4
T 4
cnot m 4
T* 4
cnot 3 4
cnot m 4
H 4
cnot 4 5
T 5
cnot l 5
T* 5
cnot 4 5
cnot l 5
H 5
cnot 5 6
T 6
cnot k 6
T* 6
cnot 5 6
cnot k 6
H 6
cnot 6 7
T 7
cnot j 7
T* 7
cnot 6 7
cnot j 7
H 7
cnot 7 8
T 8
cnot i 8
T* 8
cnot 7 8
cnot i 8
H 8
S* 8
T h
Z h
swap 14 8
H 8
T* 8
cnot 12 8
T 8
cnot d 8
T* 8
cnot 11 8
cnot 12 8
T 8
cnot e 8
cnot d 8
T* 8
cnot 10 8
cnot 11 8
T 8
cnot f 8
cnot e 8
T* 8
cnot 9 8
cnot 10 8
T 8
cnot g 8
cnot f 8
T* 8
cnot 9 8
T 8
cnot g 8
H 8
S 8
T g
swap 14 8
H 8
cnot 8 7
T* 7
cnot h 7
T 7
cnot 8 7
T* 7
cnot i 7
cnot h 7
T 7
cnot i 7
H 7
cnot 7 6
T* 6
cnot i 6
T 6
cnot 7 6
T* 6
cnot j 6
cnot i 6
T 6
cnot j 6
H 6
cnot 6 5
T* 5
cnot j 5
T 5
cnot 6 5
T* 5
cnot k 5
cnot j 5
T 5
cnot k 5
H 5
cnot 5 4
T* 4
cnot k 4
T 4
cnot 5 4
T* 4
cnot l 4
cnot k 4
T 4
cnot l 4
H 4
cnot 4 3
T* 3
cnot l 3
T 3
cnot 4 3
T* 3
cnot m 3
cnot l 3
T 3
cnot m 3
H 3
cnot 3 2
T* 2
cnot m 2
T 2
cnot 3 2
T* 2
cnot n 2
cnot m 2
T 2
cnot n 2
H 2
cnot 2 1
T* 1
cnot n 1
T 1
cnot 2 1
T* 1
cnot o 1
cnot n 1
T 1
cnot o 1
H 1
cnot 1 0
T* 0
cnot o 0
T 0
cnot 1 0
T* 0
cnot p 0
cnot o 0
T 0
cnot p 0
H 0
H p
T p
cnot 0 p
T* p
cnot s p
T p
cnot 0 p
T* p
cnot s p
H p
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot o 1
T* 1
cnot 0 1
cnot o 1
H 1
cnot 1 2
T 2
cnot n 2
T* 2
cnot 1 2
cnot n 2
H 2
cnot 2 3
T 3
cnot m 3
T* 3
cnot 2 3
cnot m 3
H 3
cnot 3 4
T 4
cnot l 4
T* 4
cnot 3 4
cnot l 4
H 4
cnot 4 5
T 5
cnot k 5
T* 5
cnot 4 5
cnot k 5
H 5
cnot 5 6
T 6
cnot j 6
T* 6
cnot 5 6
cnot j 6
H 6
cnot 6 7
T 7
cnot i 7
T* 7
cnot 6 7
cnot i 7
H 7
cnot 7 8
T 8
cnot h 8
T* 8
cnot 7 8
cnot h 8
H 8
S* 8
T g
Z g
swap 14 8
H 8
T* 8
cnot 11 8
T 8
cnot d 8
T* 8
cnot 10 8
cnot 11 8
T 8
cnot e 8
cnot d 8
T* 8
cnot 9 8
cnot 10 8
T 8
cnot f 8
cnot e 8
T* 8
cnot 9 8
T 8
cnot f 8
H 8
S 8
T f
swap 14 8
H 8
cnot 8 7
T* 7
cnot g 7
T 7
cnot 8 7
T* 7
cnot h 7
cnot g 7
T 7
cnot h 7
H 7
cnot 7 6
T* 6
cnot h 6
T 6
cnot 7 6
T* 6
cnot i 6
cnot h 6
T 6
cnot i 6
H 6
cnot 6 5
T* 5
cnot i 5
T 5
cnot 6 5
T* 5
cnot j 5
cnot i 5
T 5
cnot j 5
H 5
cnot 5 4
T* 4
cnot j 4
T 4
cnot 5 4
T* 4
cnot k 4
cnot j 4
T 4
cnot k 4
H 4
cnot 4 3
T* 3
cnot k 3
T 3
cnot 4 3
T* 3
cnot l 3
cnot k 3
T 3
cnot l 3
H 3
cnot 3 2
T* 2
cnot l 2
T 2
cnot 3 2
T* 2
cnot m 2
cnot l 2
T 2
cnot m 2
H 2
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
T* 1
cnot n 1
cnot m 1
T 1
cnot n 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
T* 0
cnot o 0
cnot n 0
T 0
cnot o 0
H 0
H o
T o
cnot 0 o
T* o
cnot s o
T o
cnot 0 o
T* o
cnot s o
H o
T 0
cnot s 0
T* 0
cnot s 0
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
cnot 4 5
T 5
cnot j 5
T* 5
cnot 4 5
cnot j 5
H 5
cnot 5 6
T 6
cnot i 6
T* 6
cnot 5 6
cnot i 6
H 6
cnot 6 7
T 7
cnot h 7
T* 7
cnot 6 7
cnot h 7
H 7
cnot 7 8
T 8
cnot g 8
T* 8
cnot 7 8
cnot g 8
H 8
S* 8
T f
Z f
swap 14 8
H 8
T* 8
cnot 10 8
T 8
cnot d 8
T* 8
cnot 10 8
cnot 9 8
T 8
cnot d 8
cnot e 8
T* 8
cnot 9 8
T 8
cnot e 8
H 8
S 8
T e
swap 14 8
H 8
cnot 8 7
T* 7
cnot f 7
T 7
cnot 8 7
T* 7
cnot g 7
cnot f 7
T 7
cnot g 7
H 7
cnot 7 6
T* 6
cnot g 6
T 6
cnot 7 6
T* 6
cnot h 6
cnot g 6
T 6
cnot h 6
H 6
cnot 6 5
T* 5
cnot h 5
T 5
cnot 6 5
T* 5
cnot i 5
cnot h 5
T 5
cnot i 5
H 5
cnot 5 4
T* 4
cnot i 4
T 4
cnot 5 4
T* 4
cnot j 4
cnot i 4
T 4
cnot j 4
H 4
cnot 4 3
T* 3
cnot j 3
T 3
cnot 4 3
T* 3
cnot k 3
cnot j 3
T 3
cnot k 3
H 3
cnot 3 2
T* 2
cnot k 2
T 2
cnot 3 2
T* 2
cnot l 2
cnot k 2
T 2
cnot l 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
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
cnot s n
T n
cnot 0 n
T* n
cnot s n
H n
T 0
cnot s 0
T* 0
cnot s 0
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
cnot 2 3
T 3
cnot k 3
T* 3
cnot 2 3
cnot k 3
H 3
cnot 3 4
T 4
cnot j 4
T* 4
cnot 3 4
cnot j 4
H 4
cnot 4 5
T 5
cnot i 5
T* 5
cnot 4 5
cnot i 5
H 5
cnot 5 6
T 6
cnot h 6
T* 6
cnot 5 6
cnot h 6
H 6
cnot 6 7
T 7
cnot g 7
T* 7
cnot 6 7
cnot g 7
H 7
cnot 7 8
T 8
cnot f 8
T* 8
cnot 7 8
cnot f 8
H 8
S* 8
T e
Z e
swap 14 8
H 8
T* 8
cnot 9 8
T 8
cnot d 8
T* 8
cnot 9 8
T 8
cnot d 8
H 8
S 8
T d
swap 14 8
H 8
cnot 8 7
T* 7
cnot e 7
T 7
cnot 8 7
T* 7
cnot f 7
cnot e 7
T 7
cnot f 7
H 7
cnot 7 6
T* 6
cnot f 6
T 6
cnot 7 6
T* 6
cnot g 6
cnot f 6
T 6
cnot g 6
H 6
cnot 6 5
T* 5
cnot g 5
T 5
cnot 6 5
T* 5
cnot h 5
cnot g 5
T 5
cnot h 5
H 5
cnot 5 4
T* 4
cnot h 4
T 4
cnot 5 4
T* 4
cnot i 4
cnot h 4
T 4
cnot i 4
H 4
cnot 4 3
T* 3
cnot i 3
T 3
cnot 4 3
T* 3
cnot j 3
cnot i 3
T 3
cnot j 3
H 3
cnot 3 2
T* 2
cnot j 2
T 2
cnot 3 2
T* 2
cnot k 2
cnot j 2
T 2
cnot k 2
H 2
cnot 2 1
T* 1
cnot k 1
T 1
cnot 2 1
T* 1
cnot l 1
cnot k 1
T 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot l 0
T 0
cnot 1 0
T* 0
cnot m 0
cnot l 0
T 0
cnot m 0
H 0
H m
T m
cnot 0 m
T* m
cnot s m
T m
cnot 0 m
T* m
cnot s m
H m
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot l 1
T* 1
cnot 0 1
cnot l 1
H 1
cnot 1 2
T 2
cnot k 2
T* 2
cnot 1 2
cnot k 2
H 2
cnot 2 3
T 3
cnot j 3
T* 3
cnot 2 3
cnot j 3
H 3
cnot 3 4
T 4
cnot i 4
T* 4
cnot 3 4
cnot i 4
H 4
cnot 4 5
T 5
cnot h 5
T* 5
cnot 4 5
cnot h 5
H 5
cnot 5 6
T 6
cnot g 6
T* 6
cnot 5 6
cnot g 6
H 6
cnot 6 7
T 7
cnot f 7
T* 7
cnot 6 7
cnot f 7
H 7
cnot 7 8
T 8
cnot e 8
T* 8
cnot 7 8
cnot e 8
H 8
S* 8
T d
Z d
swap 14 8
H 8
cnot 8 7
T* 7
cnot d 7
T 7
cnot 8 7
T* 7
cnot e 7
cnot d 7
T 7
cnot e 7
H 7
cnot 7 6
T* 6
cnot e 6
T 6
cnot 7 6
T* 6
cnot f 6
cnot e 6
T 6
cnot f 6
H 6
cnot 6 5
T* 5
cnot f 5
T 5
cnot 6 5
T* 5
cnot g 5
cnot f 5
T 5
cnot g 5
H 5
cnot 5 4
T* 4
cnot g 4
T 4
cnot 5 4
T* 4
cnot h 4
cnot g 4
T 4
cnot h 4
H 4
cnot 4 3
T* 3
cnot h 3
T 3
cnot 4 3
T* 3
cnot i 3
cnot h 3
T 3
cnot i 3
H 3
cnot 3 2
T* 2
cnot i 2
T 2
cnot 3 2
T* 2
cnot j 2
cnot i 2
T 2
cnot j 2
H 2
cnot 2 1
T* 1
cnot j 1
T 1
cnot 2 1
T* 1
cnot k 1
cnot j 1
T 1
cnot k 1
H 1
cnot 1 0
T* 0
cnot k 0
T 0
cnot 1 0
T* 0
cnot l 0
cnot k 0
T 0
cnot l 0
H 0
H l
T l
cnot 0 l
T* l
cnot s l
T l
cnot 0 l
T* l
cnot s l
H l
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot k 1
T* 1
cnot 0 1
cnot k 1
H 1
cnot 1 2
T 2
cnot j 2
T* 2
cnot 1 2
cnot j 2
H 2
cnot 2 3
T 3
cnot i 3
T* 3
cnot 2 3
cnot i 3
H 3
cnot 3 4
T 4
cnot h 4
T* 4
cnot 3 4
cnot h 4
H 4
cnot 4 5
T 5
cnot g 5
T* 5
cnot 4 5
cnot g 5
H 5
cnot 5 6
T 6
cnot f 6
T* 6
cnot 5 6
cnot f 6
H 6
cnot 6 7
T 7
cnot e 7
T* 7
cnot 6 7
cnot e 7
H 7
cnot 7 8
T 8
cnot d 8
T* 8
cnot 7 8
cnot d 8
H 8
T* 8
cnot b 8
T 8
cnot c 8
T* 8
cnot b 8
T 8
cnot c 8
H 8
cnot b 7
T* 7
cnot c 7
T 7
cnot b 7
T* 7
cnot d 7
cnot c 7
T 7
cnot d 7
H 7
cnot 7 6
T* 6
cnot d 6
T 6
cnot 7 6
T* 6
cnot e 6
cnot d 6
T 6
cnot e 6
H 6
cnot 6 5
T* 5
cnot e 5
T 5
cnot 6 5
T* 5
cnot f 5
cnot e 5
T 5
cnot f 5
H 5
cnot 5 4
T* 4
cnot f 4
T 4
cnot 5 4
T* 4
cnot g 4
cnot f 4
T 4
cnot g 4
H 4
cnot 4 3
T* 3
cnot g 3
T 3
cnot 4 3
T* 3
cnot h 3
cnot g 3
T 3
cnot h 3
H 3
cnot 3 2
T* 2
cnot h 2
T 2
cnot 3 2
T* 2
cnot i 2
cnot h 2
T 2
cnot i 2
H 2
cnot 2 1
T* 1
cnot i 1
T 1
cnot 2 1
T* 1
cnot j 1
cnot i 1
T 1
cnot j 1
H 1
cnot 1 0
T* 0
cnot j 0
T 0
cnot 1 0
T* 0
cnot k 0
cnot j 0
T 0
cnot k 0
H 0
H k
T k
cnot 0 k
T* k
cnot s k
T k
cnot 0 k
T* k
cnot s k
H k
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot j 1
T* 1
cnot 0 1
cnot j 1
H 1
cnot 1 2
T 2
cnot i 2
T* 2
cnot 1 2
cnot i 2
H 2
cnot 2 3
T 3
cnot h 3
T* 3
cnot 2 3
cnot h 3
H 3
cnot 3 4
T 4
cnot g 4
T* 4
cnot 3 4
cnot g 4
H 4
cnot 4 5
T 5
cnot f 5
T* 5
cnot 4 5
cnot f 5
H 5
cnot 5 6
T 6
cnot e 6
T* 6
cnot 5 6
cnot e 6
H 6
cnot 6 7
T 7
cnot d 7
T* 7
cnot 6 7
cnot d 7
H 7
cnot b 6
T* 6
cnot c 6
T 6
cnot b 6
T* 6
cnot d 6
cnot c 6
T 6
cnot d 6
H 6
cnot 6 5
T* 5
cnot d 5
T 5
cnot 6 5
T* 5
cnot e 5
cnot d 5
T 5
cnot e 5
H 5
cnot 5 4
T* 4
cnot e 4
T 4
cnot 5 4
T* 4
cnot f 4
cnot e 4
T 4
cnot f 4
H 4
cnot 4 3
T* 3
cnot f 3
T 3
cnot 4 3
T* 3
cnot g 3
cnot f 3
T 3
cnot g 3
H 3
cnot 3 2
T* 2
cnot g 2
T 2
cnot 3 2
T* 2
cnot h 2
cnot g 2
T 2
cnot h 2
H 2
cnot 2 1
T* 1
cnot h 1
T 1
cnot 2 1
T* 1
cnot i 1
cnot h 1
T 1
cnot i 1
H 1
cnot 1 0
T* 0
cnot i 0
T 0
cnot 1 0
T* 0
cnot j 0
cnot i 0
T 0
cnot j 0
H 0
H j
T j
cnot 0 j
T* j
cnot s j
T j
cnot 0 j
T* j
cnot s j
H j
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot i 1
T* 1
cnot 0 1
cnot i 1
H 1
cnot 1 2
T 2
cnot h 2
T* 2
cnot 1 2
cnot h 2
H 2
cnot 2 3
T 3
cnot g 3
T* 3
cnot 2 3
cnot g 3
H 3
cnot 3 4
T 4
cnot f 4
T* 4
cnot 3 4
cnot f 4
H 4
cnot 4 5
T 5
cnot e 5
T* 5
cnot 4 5
cnot e 5
H 5
cnot 5 6
T 6
cnot d 6
T* 6
cnot 5 6
cnot d 6
H 6
cnot b 5
T* 5
cnot c 5
T 5
cnot b 5
T* 5
cnot d 5
cnot c 5
T 5
cnot d 5
H 5
cnot 5 4
T* 4
cnot d 4
T 4
cnot 5 4
T* 4
cnot e 4
cnot d 4
T 4
cnot e 4
H 4
cnot 4 3
T* 3
cnot e 3
T 3
cnot 4 3
T* 3
cnot f 3
cnot e 3
T 3
cnot f 3
H 3
cnot 3 2
T* 2
cnot f 2
T 2
cnot 3 2
T* 2
cnot g 2
cnot f 2
T 2
cnot g 2
H 2
cnot 2 1
T* 1
cnot g 1
T 1
cnot 2 1
T* 1
cnot h 1
cnot g 1
T 1
cnot h 1
H 1
cnot 1 0
T* 0
cnot h 0
T 0
cnot 1 0
T* 0
cnot i 0
cnot h 0
T 0
cnot i 0
H 0
H i
T i
cnot 0 i
T* i
cnot s i
T i
cnot 0 i
T* i
cnot s i
H i
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot h 1
T* 1
cnot 0 1
cnot h 1
H 1
cnot 1 2
T 2
cnot g 2
T* 2
cnot 1 2
cnot g 2
H 2
cnot 2 3
T 3
cnot f 3
T* 3
cnot 2 3
cnot f 3
H 3
cnot 3 4
T 4
cnot e 4
T* 4
cnot 3 4
cnot e 4
H 4
cnot 4 5
T 5
cnot d 5
T* 5
cnot 4 5
cnot d 5
H 5
cnot b 4
T* 4
cnot c 4
T 4
cnot b 4
T* 4
cnot d 4
cnot c 4
T 4
cnot d 4
H 4
cnot 4 3
T* 3
cnot d 3
T 3
cnot 4 3
T* 3
cnot e 3
cnot d 3
T 3
cnot e 3
H 3
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot f 2
cnot e 2
T 2
cnot f 2
H 2
cnot 2 1
T* 1
cnot f 1
T 1
cnot 2 1
T* 1
cnot g 1
cnot f 1
T 1
cnot g 1
H 1
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot h 0
cnot g 0
T 0
cnot h 0
H 0
S h
H h
T h
cnot 0 h
T* h
cnot s h
T h
cnot 0 h
T* h
cnot s h
H h
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot g 1
T* 1
cnot 0 1
cnot g 1
H 1
cnot 1 2
T 2
cnot f 2
T* 2
cnot 1 2
cnot f 2
H 2
cnot 2 3
T 3
cnot e 3
T* 3
cnot 2 3
cnot e 3
H 3
cnot 3 4
T 4
cnot d 4
T* 4
cnot 3 4
cnot d 4
H 4
cnot b 3
T* 3
cnot c 3
T 3
cnot b 3
T* 3
cnot d 3
cnot c 3
T 3
cnot d 3
H 3
cnot 3 2
T* 2
cnot d 2
T 2
cnot 3 2
T* 2
cnot e 2
cnot d 2
T 2
cnot e 2
H 2
cnot 2 1
T* 1
cnot e 1
T 1
cnot 2 1
T* 1
cnot f 1
cnot e 1
T 1
cnot f 1
H 1
cnot 1 0
T* 0
cnot f 0
T 0
cnot 1 0
T* 0
cnot g 0
cnot f 0
T 0
cnot g 0
H 0
S g
H g
T g
cnot 0 g
T* g
cnot s g
T g
cnot 0 g
T* g
cnot s g
H g
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot f 1
T* 1
cnot 0 1
cnot f 1
H 1
cnot 1 2
T 2
cnot e 2
T* 2
cnot 1 2
cnot e 2
H 2
cnot 2 3
T 3
cnot d 3
T* 3
cnot 2 3
cnot d 3
H 3
cnot b 2
T* 2
cnot c 2
T 2
cnot b 2
T* 2
cnot d 2
cnot c 2
T 2
cnot d 2
H 2
cnot 2 1
T* 1
cnot d 1
T 1
cnot 2 1
T* 1
cnot e 1
cnot d 1
T 1
cnot e 1
H 1
cnot 1 0
T* 0
cnot e 0
T 0
cnot 1 0
T* 0
cnot f 0
cnot e 0
T 0
cnot f 0
H 0
S f
H f
T f
cnot 0 f
T* f
cnot s f
T f
cnot 0 f
T* f
cnot s f
H f
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot e 1
T* 1
cnot 0 1
cnot e 1
H 1
cnot 1 2
T 2
cnot d 2
T* 2
cnot 1 2
cnot d 2
H 2
cnot b 1
T* 1
cnot c 1
T 1
cnot b 1
T* 1
cnot d 1
cnot c 1
T 1
cnot d 1
H 1
cnot 1 0
T* 0
cnot d 0
T 0
cnot 1 0
T* 0
cnot e 0
cnot d 0
T 0
cnot e 0
H 0
S e
H e
T e
cnot 0 e
T* e
cnot s e
T e
cnot 0 e
T* e
cnot s e
H e
T 0
cnot s 0
T* 0
cnot s 0
H 0
cnot 0 1
T 1
cnot d 1
T* 1
cnot 0 1
cnot d 1
H 1
cnot b 0
T* 0
cnot c 0
T 0
cnot b 0
T* 0
cnot d 0
cnot c 0
T 0
cnot d 0
H 0
S d
H d
T d
cnot 0 d
T* d
cnot s d
T d
cnot 0 d
T* d
cnot s d
H d
T 0
cnot s 0
T* 0
cnot s 0
H 0
S* c
cnot 0 c
T c
cnot b c
T* c
cnot 0 c
T c
cnot 1 c
T* c
cnot b c
T c
cnot 2 c
cnot 1 c
T c
cnot b c
T* c
cnot 3 c
cnot 2 c
T* c
cnot b c
T c
cnot 4 c
cnot 3 c
T c
cnot b c
T* c
cnot 5 c
cnot 4 c
T* c
cnot b c
T c
cnot 6 c
cnot 5 c
T c
cnot b c
T* c
cnot 7 c
cnot 6 c
T* c
cnot b c
T c
cnot 7 c
H c
T c
cnot b c
T* c
cnot s c
T c
cnot b c
T* c
cnot s c
H c
cnot s b
T 8
Z 8
cnot 13 8
T* 8
cnot c 8
T 8
cnot 13 8
T* 8
cnot 12 8
cnot c 8
T* 8
cnot d 8
T 8
cnot 12 8
T* 8
cnot 11 8
cnot d 8
T* 8
cnot e 8
T 8
cnot 11 8
T* 8
cnot 10 8
cnot e 8
T* 8
cnot f 8
T 8
cnot 10 8
T* 8
cnot 9 8
cnot f 8
T* 8
cnot g 8
T 8
cnot 9 8
T* 8
cnot g 8
H 8
S 8
T h
H 8
cnot 8 7
T* 7
cnot i 7
T 7
cnot 8 7
T* 7
cnot s 7
cnot i 7
cnot b 7
T 7
cnot b 7
cnot s 7
H 7
cnot 7 6
T* 6
cnot j 6
T 6
cnot 7 6
T* 6
cnot s 6
cnot j 6
cnot b 6
T 6
cnot b 6
cnot s 6
H 6
cnot 6 5
T* 5
cnot k 5
T 5
cnot 6 5
T* 5
cnot s 5
cnot k 5
cnot b 5
T 5
cnot b 5
cnot s 5
H 5
cnot 5 4
T* 4
cnot l 4
T 4
cnot 5 4
T* 4
cnot s 4
cnot l 4
cnot b 4
T 4
cnot b 4
cnot s 4
H 4
cnot 4 3
T* 3
cnot m 3
T 3
cnot 4 3
T* 3
cnot s 3
cnot m 3
cnot b 3
T 3
cnot b 3
cnot s 3
H 3
cnot 3 2
T* 2
cnot n 2
T 2
cnot 3 2
T* 2
cnot s 2
cnot n 2
cnot b 2
T 2
cnot b 2
cnot s 2
H 2
cnot 2 1
T* 1
cnot o 1
T 1
cnot 2 1
T* 1
cnot s 1
cnot o 1
cnot b 1
T 1
cnot b 1
cnot s 1
H 1
cnot 1 0
T* 0
cnot p 0
T 0
cnot 1 0
T* 0
cnot s 0
cnot p 0
cnot b 0
T 0
cnot b 0
cnot s 0
H 0
T* q
Z q
cnot 0 q
T* q
cnot r q
T q
cnot 0 q
T* q
cnot s q
cnot r q
T* q
cnot t q
cnot s q
T* q
cnot t q
H q
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot p 1
T* 1
cnot 0 1
cnot p 1
H 1
cnot 1 2
T 2
cnot o 2
T* 2
cnot 1 2
cnot o 2
H 2
cnot 2 3
T 3
cnot n 3
T* 3
cnot 2 3
cnot n 3
H 3
cnot 3 4
T 4
cnot m 4
T* 4
cnot 3 4
cnot m 4
H 4
cnot 4 5
T 5
cnot l 5
T* 5
cnot 4 5
cnot l 5
H 5
cnot 5 6
T 6
cnot k 6
T* 6
cnot 5 6
cnot k 6
H 6
cnot 6 7
T 7
cnot j 7
T* 7
cnot 6 7
cnot j 7
H 7
cnot 7 8
T 8
cnot i 8
T* 8
cnot 7 8
cnot i 8
H 8
S* 8
T h
Z h
H 8
T* 8
cnot 13 8
T 8
cnot c 8
T* 8
cnot 12 8
cnot 13 8
T 8
cnot d 8
cnot c 8
T* 8
cnot 11 8
cnot 12 8
T 8
cnot e 8
cnot d 8
T* 8
cnot 10 8
cnot 11 8
T 8
cnot f 8
cnot e 8
T* 8
cnot 9 8
cnot 10 8
T 8
cnot g 8
cnot f 8
T* 8
cnot 9 8
T 8
cnot g 8
H 8
S 8
T g
H 8
cnot 8 7
T* 7
cnot h 7
T 7
cnot 8 7
T* 7
cnot i 7
cnot h 7
T 7
cnot i 7
H 7
cnot 7 6
T* 6
cnot i 6
T 6
cnot 7 6
T* 6
cnot j 6
cnot i 6
T 6
cnot j 6
H 6
cnot 6 5
T* 5
cnot j 5
T 5
cnot 6 5
T* 5
cnot k 5
cnot j 5
T 5
cnot k 5
H 5
cnot 5 4
T* 4
cnot k 4
T 4
cnot 5 4
T* 4
cnot l 4
cnot k 4
T 4
cnot l 4
H 4
cnot 4 3
T* 3
cnot l 3
T 3
cnot 4 3
T* 3
cnot m 3
cnot l 3
T 3
cnot m 3
H 3
cnot 3 2
T* 2
cnot m 2
T 2
cnot 3 2
T* 2
cnot n 2
cnot m 2
T 2
cnot n 2
H 2
cnot 2 1
T* 1
cnot n 1
T 1
cnot 2 1
T* 1
cnot o 1
cnot n 1
T 1
cnot o 1
H 1
cnot 1 0
T* 0
cnot o 0
T 0
cnot 1 0
T* 0
cnot p 0
cnot o 0
T 0
cnot p 0
H 0
H p
T p
cnot 0 p
T* p
cnot r p
T p
cnot 0 p
T* p
cnot r p
H p
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot o 1
T* 1
cnot 0 1
cnot o 1
H 1
cnot 1 2
T 2
cnot n 2
T* 2
cnot 1 2
cnot n 2
H 2
cnot 2 3
T 3
cnot m 3
T* 3
cnot 2 3
cnot m 3
H 3
cnot 3 4
T 4
cnot l 4
T* 4
cnot 3 4
cnot l 4
H 4
cnot 4 5
T 5
cnot k 5
T* 5
cnot 4 5
cnot k 5
H 5
cnot 5 6
T 6
cnot j 6
T* 6
cnot 5 6
cnot j 6
H 6
cnot 6 7
T 7
cnot i 7
T* 7
cnot 6 7
cnot i 7
H 7
cnot 7 8
T 8
cnot h 8
T* 8
cnot 7 8
cnot h 8
H 8
S* 8
T g
Z g
H 8
H 13
T* 8
cnot 12 8
T 8
cnot c 8
T* 8
cnot 11 8
cnot 12 8
T 8
cnot d 8
cnot c 8
T* 8
cnot 10 8
cnot 11 8
T 8
cnot e 8
cnot d 8
T* 8
cnot 9 8
cnot 10 8
T 8
cnot f 8
cnot e 8
T* 8
cnot 9 8
T 8
cnot f 8
H 8
S 8
T f
H 8
cnot 8 7
T* 7
cnot g 7
T 7
cnot 8 7
T* 7
cnot h 7
cnot g 7
T 7
cnot h 7
H 7
cnot 7 6
T* 6
cnot h 6
T 6
cnot 7 6
T* 6
cnot i 6
cnot h 6
T 6
cnot i 6
H 6
cnot 6 5
T* 5
cnot i 5
T 5
cnot 6 5
T* 5
cnot j 5
cnot i 5
T 5
cnot j 5
H 5
cnot 5 4
T* 4
cnot j 4
T 4
cnot 5 4
T* 4
cnot k 4
cnot j 4
T 4
cnot k 4
H 4
cnot 4 3
T* 3
cnot k 3
T 3
cnot 4 3
T* 3
cnot l 3
cnot k 3
T 3
cnot l 3
H 3
cnot 3 2
T* 2
cnot l 2
T 2
cnot 3 2
T* 2
cnot m 2
cnot l 2
T 2
cnot m 2
H 2
cnot 2 1
T* 1
cnot m 1
T 1
cnot 2 1
T* 1
cnot n 1
cnot m 1
T 1
cnot n 1
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
T* 0
cnot o 0
cnot n 0
T 0
cnot o 0
H 0
H o
T o
cnot 0 o
T* o
cnot r o
T o
cnot 0 o
T* o
cnot r o
H o
T 0
cnot r 0
T* 0
cnot r 0
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
cnot 4 5
T 5
cnot j 5
T* 5
cnot 4 5
cnot j 5
H 5
cnot 5 6
T 6
cnot i 6
T* 6
cnot 5 6
cnot i 6
H 6
cnot 6 7
T 7
cnot h 7
T* 7
cnot 6 7
cnot h 7
H 7
cnot 7 8
T 8
cnot g 8
T* 8
cnot 7 8
cnot g 8
H 8
S* 8
T f
Z f
H 8
H 12
T* 8
cnot 11 8
T 8
cnot c 8
T* 8
cnot 10 8
cnot 11 8
T 8
cnot d 8
cnot c 8
T* 8
cnot 9 8
cnot 10 8
T 8
cnot e 8
cnot d 8
T* 8
cnot 9 8
T 8
cnot e 8
H 8
S 8
T e
H 8
cnot 8 7
T* 7
cnot f 7
T 7
cnot 8 7
T* 7
cnot g 7
cnot f 7
T 7
cnot g 7
H 7
cnot 7 6
T* 6
cnot g 6
T 6
cnot 7 6
T* 6
cnot h 6
cnot g 6
T 6
cnot h 6
H 6
cnot 6 5
T* 5
cnot h 5
T 5
cnot 6 5
T* 5
cnot i 5
cnot h 5
T 5
cnot i 5
H 5
cnot 5 4
T* 4
cnot i 4
T 4
cnot 5 4
T* 4
cnot j 4
cnot i 4
T 4
cnot j 4
H 4
cnot 4 3
T* 3
cnot j 3
T 3
cnot 4 3
T* 3
cnot k 3
cnot j 3
T 3
cnot k 3
H 3
cnot 3 2
T* 2
cnot k 2
T 2
cnot 3 2
T* 2
cnot l 2
cnot k 2
T 2
cnot l 2
H 2
cnot 2 1
T* 1
cnot l 1
T 1
cnot 2 1
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
cnot r n
T n
cnot 0 n
T* n
cnot r n
H n
T 0
cnot r 0
T* 0
cnot r 0
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
cnot 2 3
T 3
cnot k 3
T* 3
cnot 2 3
cnot k 3
H 3
cnot 3 4
T 4
cnot j 4
T* 4
cnot 3 4
cnot j 4
H 4
cnot 4 5
T 5
cnot i 5
T* 5
cnot 4 5
cnot i 5
H 5
cnot 5 6
T 6
cnot h 6
T* 6
cnot 5 6
cnot h 6
H 6
cnot 6 7
T 7
cnot g 7
T* 7
cnot 6 7
cnot g 7
H 7
cnot 7 8
T 8
cnot f 8
T* 8
cnot 7 8
cnot f 8
H 8
S* 8
T e
Z e
H 8
T* 11
H 11
T* 8
cnot 10 8
T 8
cnot c 8
T* 8
cnot 10 8
cnot 9 8
T 8
cnot c 8
cnot d 8
T* 8
cnot 9 8
T 8
cnot d 8
H 8
S 8
T d
H 8
cnot 8 7
T* 7
cnot e 7
T 7
cnot 8 7
T* 7
cnot f 7
cnot e 7
T 7
cnot f 7
H 7
cnot 7 6
T* 6
cnot f 6
T 6
cnot 7 6
T* 6
cnot g 6
cnot f 6
T 6
cnot g 6
H 6
cnot 6 5
T* 5
cnot g 5
T 5
cnot 6 5
T* 5
cnot h 5
cnot g 5
T 5
cnot h 5
H 5
cnot 5 4
T* 4
cnot h 4
T 4
cnot 5 4
T* 4
cnot i 4
cnot h 4
T 4
cnot i 4
H 4
cnot 4 3
T* 3
cnot i 3
T 3
cnot 4 3
T* 3
cnot j 3
cnot i 3
T 3
cnot j 3
H 3
cnot 3 2
T* 2
cnot j 2
T 2
cnot 3 2
T* 2
cnot k 2
cnot j 2
T 2
cnot k 2
H 2
cnot 2 1
T* 1
cnot k 1
T 1
cnot 2 1
T* 1
cnot l 1
cnot k 1
T 1
cnot l 1
H 1
cnot 1 0
T* 0
cnot l 0
T 0
cnot 1 0
T* 0
cnot m 0
cnot l 0
T 0
cnot m 0
H 0
H m
T m
cnot 0 m
T* m
cnot r m
T m
cnot 0 m
T* m
cnot r m
H m
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot l 1
T* 1
cnot 0 1
cnot l 1
H 1
cnot 1 2
T 2
cnot k 2
T* 2
cnot 1 2
cnot k 2
H 2
cnot 2 3
T 3
cnot j 3
T* 3
cnot 2 3
cnot j 3
H 3
cnot 3 4
T 4
cnot i 4
T* 4
cnot 3 4
cnot i 4
H 4
cnot 4 5
T 5
cnot h 5
T* 5
cnot 4 5
cnot h 5
H 5
cnot 5 6
T 6
cnot g 6
T* 6
cnot 5 6
cnot g 6
H 6
cnot 6 7
T 7
cnot f 7
T* 7
cnot 6 7
cnot f 7
H 7
cnot 7 8
T 8
cnot e 8
T* 8
cnot 7 8
cnot e 8
H 8
S* 8
T d
Z d
H 8
T* 10
H 10
T* 8
cnot 9 8
T 8
cnot c 8
T* 8
cnot 9 8
T 8
cnot c 8
H 8
S 8
T c
H 8
cnot 8 7
T* 7
cnot d 7
T 7
cnot 8 7
T* 7
cnot e 7
cnot d 7
T 7
cnot e 7
H 7
cnot 7 6
T* 6
cnot e 6
T 6
cnot 7 6
T* 6
cnot f 6
cnot e 6
T 6
cnot f 6
H 6
cnot 6 5
T* 5
cnot f 5
T 5
cnot 6 5
T* 5
cnot g 5
cnot f 5
T 5
cnot g 5
H 5
cnot 5 4
T* 4
cnot g 4
T 4
cnot 5 4
T* 4
cnot h 4
cnot g 4
T 4
cnot h 4
H 4
cnot 4 3
T* 3
cnot h 3
T 3
cnot 4 3
T* 3
cnot i 3
cnot h 3
T 3
cnot i 3
H 3
cnot 3 2
T* 2
cnot i 2
T 2
cnot 3 2
T* 2
cnot j 2
cnot i 2
T 2
cnot j 2
H 2
cnot 2 1
T* 1
cnot j 1
T 1
cnot 2 1
T* 1
cnot k 1
cnot j 1
T 1
cnot k 1
H 1
cnot 1 0
T* 0
cnot k 0
T 0
cnot 1 0
T* 0
cnot l 0
cnot k 0
T 0
cnot l 0
H 0
H l
T l
cnot 0 l
T* l
cnot r l
T l
cnot 0 l
T* l
cnot r l
H l
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot k 1
T* 1
cnot 0 1
cnot k 1
H 1
cnot 1 2
T 2
cnot j 2
T* 2
cnot 1 2
cnot j 2
H 2
cnot 2 3
T 3
cnot i 3
T* 3
cnot 2 3
cnot i 3
H 3
cnot 3 4
T 4
cnot h 4
T* 4
cnot 3 4
cnot h 4
H 4
cnot 4 5
T 5
cnot g 5
T* 5
cnot 4 5
cnot g 5
H 5
cnot 5 6
T 6
cnot f 6
T* 6
cnot 5 6
cnot f 6
H 6
cnot 6 7
T 7
cnot e 7
T* 7
cnot 6 7
cnot e 7
H 7
cnot 7 8
T 8
cnot d 8
T* 8
cnot 7 8
cnot d 8
H 8
S* 8
T* 9
T c
Z c
H 9
H 8
cnot 8 7
T* 7
cnot c 7
T 7
cnot 8 7
T* 7
cnot d 7
cnot c 7
T 7
cnot d 7
H 7
cnot 7 6
T* 6
cnot d 6
T 6
cnot 7 6
T* 6
cnot e 6
cnot d 6
T 6
cnot e 6
H 6
cnot 6 5
T* 5
cnot e 5
T 5
cnot 6 5
T* 5
cnot f 5
cnot e 5
T 5
cnot f 5
H 5
cnot 5 4
T* 4
cnot f 4
T 4
cnot 5 4
T* 4
cnot g 4
cnot f 4
T 4
cnot g 4
H 4
cnot 4 3
T* 3
cnot g 3
T 3
cnot 4 3
T* 3
cnot h 3
cnot g 3
T 3
cnot h 3
H 3
cnot 3 2
T* 2
cnot h 2
T 2
cnot 3 2
T* 2
cnot i 2
cnot h 2
T 2
cnot i 2
H 2
cnot 2 1
T* 1
cnot i 1
T 1
cnot 2 1
T* 1
cnot j 1
cnot i 1
T 1
cnot j 1
H 1
cnot 1 0
T* 0
cnot j 0
T 0
cnot 1 0
T* 0
cnot k 0
cnot j 0
T 0
cnot k 0
H 0
H k
T k
cnot 0 k
T* k
cnot r k
T k
cnot 0 k
T* k
cnot r k
H k
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot j 1
T* 1
cnot 0 1
cnot j 1
H 1
cnot 1 2
T 2
cnot i 2
T* 2
cnot 1 2
cnot i 2
H 2
cnot 2 3
T 3
cnot h 3
T* 3
cnot 2 3
cnot h 3
H 3
cnot 3 4
T 4
cnot g 4
T* 4
cnot 3 4
cnot g 4
H 4
cnot 4 5
T 5
cnot f 5
T* 5
cnot 4 5
cnot f 5
H 5
cnot 5 6
T 6
cnot e 6
T* 6
cnot 5 6
cnot e 6
H 6
cnot 6 7
T 7
cnot d 7
T* 7
cnot 6 7
cnot d 7
H 7
cnot 7 8
T 8
cnot c 8
T* 8
cnot 7 8
cnot c 8
H 8
T* 8
cnot a 8
T 8
cnot b 8
T* 8
cnot a 8
T 8
cnot b 8
H 8
cnot a 7
T* 7
cnot b 7
T 7
cnot a 7
T* 7
cnot c 7
cnot b 7
T 7
cnot c 7
H 7
cnot 7 6
T* 6
cnot c 6
T 6
cnot 7 6
T* 6
cnot d 6
cnot c 6
T 6
cnot d 6
H 6
cnot 6 5
T* 5
cnot d 5
T 5
cnot 6 5
T* 5
cnot e 5
cnot d 5
T 5
cnot e 5
H 5
cnot 5 4
T* 4
cnot e 4
T 4
cnot 5 4
T* 4
cnot f 4
cnot e 4
T 4
cnot f 4
H 4
cnot 4 3
T* 3
cnot f 3
T 3
cnot 4 3
T* 3
cnot g 3
cnot f 3
T 3
cnot g 3
H 3
cnot 3 2
T* 2
cnot g 2
T 2
cnot 3 2
T* 2
cnot h 2
cnot g 2
T 2
cnot h 2
H 2
cnot 2 1
T* 1
cnot h 1
T 1
cnot 2 1
T* 1
cnot i 1
cnot h 1
T 1
cnot i 1
H 1
cnot 1 0
T* 0
cnot i 0
T 0
cnot 1 0
T* 0
cnot j 0
cnot i 0
T 0
cnot j 0
H 0
H j
T j
cnot 0 j
T* j
cnot r j
T j
cnot 0 j
T* j
cnot r j
H j
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot i 1
T* 1
cnot 0 1
cnot i 1
H 1
cnot 1 2
T 2
cnot h 2
T* 2
cnot 1 2
cnot h 2
H 2
cnot 2 3
T 3
cnot g 3
T* 3
cnot 2 3
cnot g 3
H 3
cnot 3 4
T 4
cnot f 4
T* 4
cnot 3 4
cnot f 4
H 4
cnot 4 5
T 5
cnot e 5
T* 5
cnot 4 5
cnot e 5
H 5
cnot 5 6
T 6
cnot d 6
T* 6
cnot 5 6
cnot d 6
H 6
cnot 6 7
T 7
cnot c 7
T* 7
cnot 6 7
cnot c 7
H 7
T* 7
cnot a 7
T 7
cnot b 7
T* 7
cnot a 7
T 7
cnot b 7
H 7
cnot a 6
T* 6
cnot b 6
T 6
cnot a 6
T* 6
cnot c 6
cnot b 6
T 6
cnot c 6
H 6
cnot 6 5
T* 5
cnot c 5
T 5
cnot 6 5
T* 5
cnot d 5
cnot c 5
T 5
cnot d 5
H 5
cnot 5 4
T* 4
cnot d 4
T 4
cnot 5 4
T* 4
cnot e 4
cnot d 4
T 4
cnot e 4
H 4
cnot 4 3
T* 3
cnot e 3
T 3
cnot 4 3
T* 3
cnot f 3
cnot e 3
T 3
cnot f 3
H 3
cnot 3 2
T* 2
cnot f 2
T 2
cnot 3 2
T* 2
cnot g 2
cnot f 2
T 2
cnot g 2
H 2
cnot 2 1
T* 1
cnot g 1
T 1
cnot 2 1
T* 1
cnot h 1
cnot g 1
T 1
cnot h 1
H 1
cnot 1 0
T* 0
cnot h 0
T 0
cnot 1 0
T* 0
cnot i 0
cnot h 0
T 0
cnot i 0
H 0
H i
T i
cnot 0 i
T* i
cnot r i
T i
cnot 0 i
T* i
cnot r i
H i
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot h 1
T* 1
cnot 0 1
cnot h 1
H 1
cnot 1 2
T 2
cnot g 2
T* 2
cnot 1 2
cnot g 2
H 2
cnot 2 3
T 3
cnot f 3
T* 3
cnot 2 3
cnot f 3
H 3
cnot 3 4
T 4
cnot e 4
T* 4
cnot 3 4
cnot e 4
H 4
cnot 4 5
T 5
cnot d 5
T* 5
cnot 4 5
cnot d 5
H 5
cnot 5 6
T 6
cnot c 6
T* 6
cnot 5 6
cnot c 6
H 6
T* 6
cnot a 6
T 6
cnot b 6
T* 6
cnot a 6
T 6
cnot b 6
H 6
cnot a 5
T* 5
cnot b 5
T 5
cnot a 5
T* 5
cnot c 5
cnot b 5
T 5
cnot c 5
H 5
cnot 5 4
T* 4
cnot c 4
T 4
cnot 5 4
T* 4
cnot d 4
cnot c 4
T 4
cnot d 4
H 4
cnot 4 3
T* 3
cnot d 3
T 3
cnot 4 3
T* 3
cnot e 3
cnot d 3
T 3
cnot e 3
H 3
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot f 2
cnot e 2
T 2
cnot f 2
H 2
cnot 2 1
T* 1
cnot f 1
T 1
cnot 2 1
T* 1
cnot g 1
cnot f 1
T 1
cnot g 1
H 1
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot h 0
cnot g 0
T 0
cnot h 0
H 0
S h
H h
T h
cnot 0 h
T* h
cnot r h
T h
cnot 0 h
T* h
cnot r h
H h
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot g 1
T* 1
cnot 0 1
cnot g 1
H 1
cnot 1 2
T 2
cnot f 2
T* 2
cnot 1 2
cnot f 2
H 2
cnot 2 3
T 3
cnot e 3
T* 3
cnot 2 3
cnot e 3
H 3
cnot 3 4
T 4
cnot d 4
T* 4
cnot 3 4
cnot d 4
H 4
cnot 4 5
T 5
cnot c 5
T* 5
cnot 4 5
cnot c 5
H 5
T* 5
cnot a 5
T 5
cnot b 5
T* 5
cnot a 5
T 5
cnot b 5
H 5
cnot a 4
T* 4
cnot b 4
T 4
cnot a 4
T* 4
cnot c 4
cnot b 4
T 4
cnot c 4
H 4
cnot 4 3
T* 3
cnot c 3
T 3
cnot 4 3
T* 3
cnot d 3
cnot c 3
T 3
cnot d 3
H 3
cnot 3 2
T* 2
cnot d 2
T 2
cnot 3 2
T* 2
cnot e 2
cnot d 2
T 2
cnot e 2
H 2
cnot 2 1
T* 1
cnot e 1
T 1
cnot 2 1
T* 1
cnot f 1
cnot e 1
T 1
cnot f 1
H 1
cnot 1 0
T* 0
cnot f 0
T 0
cnot 1 0
T* 0
cnot g 0
cnot f 0
T 0
cnot g 0
H 0
S g
H g
T g
cnot 0 g
T* g
cnot r g
T g
cnot 0 g
T* g
cnot r g
H g
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot f 1
T* 1
cnot 0 1
cnot f 1
H 1
cnot 1 2
T 2
cnot e 2
T* 2
cnot 1 2
cnot e 2
H 2
cnot 2 3
T 3
cnot d 3
T* 3
cnot 2 3
cnot d 3
H 3
cnot 3 4
T 4
cnot c 4
T* 4
cnot 3 4
cnot c 4
H 4
T* 4
cnot a 4
T 4
cnot b 4
T* 4
cnot a 4
T 4
cnot b 4
H 4
cnot a 3
T* 3
cnot b 3
T 3
cnot a 3
T* 3
cnot c 3
cnot b 3
T 3
cnot c 3
H 3
cnot 3 2
T* 2
cnot c 2
T 2
cnot 3 2
T* 2
cnot d 2
cnot c 2
T 2
cnot d 2
H 2
cnot 2 1
T* 1
cnot d 1
T 1
cnot 2 1
T* 1
cnot e 1
cnot d 1
T 1
cnot e 1
H 1
cnot 1 0
T* 0
cnot e 0
T 0
cnot 1 0
T* 0
cnot f 0
cnot e 0
T 0
cnot f 0
H 0
S f
H f
T f
cnot 0 f
T* f
cnot r f
T f
cnot 0 f
T* f
cnot r f
H f
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot e 1
T* 1
cnot 0 1
cnot e 1
H 1
cnot 1 2
T 2
cnot d 2
T* 2
cnot 1 2
cnot d 2
H 2
cnot 2 3
T 3
cnot c 3
T* 3
cnot 2 3
cnot c 3
H 3
T* 3
cnot a 3
T 3
cnot b 3
T* 3
cnot a 3
T 3
cnot b 3
H 3
cnot a 2
T* 2
cnot b 2
T 2
cnot a 2
T* 2
cnot c 2
cnot b 2
T 2
cnot c 2
H 2
cnot 2 1
T* 1
cnot c 1
T 1
cnot 2 1
T* 1
cnot d 1
cnot c 1
T 1
cnot d 1
H 1
cnot 1 0
T* 0
cnot d 0
T 0
cnot 1 0
T* 0
cnot e 0
cnot d 0
T 0
cnot e 0
H 0
S e
H e
T e
cnot 0 e
T* e
cnot r e
T e
cnot 0 e
T* e
cnot r e
H e
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot d 1
T* 1
cnot 0 1
cnot d 1
H 1
cnot 1 2
T 2
cnot c 2
T* 2
cnot 1 2
cnot c 2
H 2
T* 2
cnot a 2
T 2
cnot b 2
T* 2
cnot a 2
T 2
cnot b 2
H 2
cnot a 1
T* 1
cnot b 1
T 1
cnot a 1
T* 1
cnot c 1
cnot b 1
T 1
cnot c 1
H 1
cnot 1 0
T* 0
cnot c 0
T 0
cnot 1 0
T* 0
cnot d 0
cnot c 0
T 0
cnot d 0
H 0
S d
H d
T d
cnot 0 d
T* d
cnot r d
T d
cnot 0 d
T* d
cnot r d
H d
T 0
cnot r 0
T* 0
cnot r 0
H 0
cnot 0 1
T 1
cnot c 1
T* 1
cnot 0 1
cnot c 1
H 1
T* 1
cnot a 1
T 1
cnot b 1
T* 1
cnot a 1
T 1
cnot b 1
H 1
cnot a 0
T* 0
cnot b 0
T 0
cnot a 0
T* 0
cnot c 0
cnot b 0
T 0
cnot c 0
H 0
S c
H c
T c
cnot 0 c
T* c
cnot r c
T c
cnot 0 c
T* c
cnot r c
H c
T 0
cnot r 0
T* 0
cnot r 0
H 0
T* 0
cnot a 0
T 0
cnot b 0
T* 0
cnot a 0
T 0
cnot b 0
H 0
S* b
cnot a b
T b
cnot a b
H b
T b
cnot a b
T* b
cnot r b
T b
cnot a b
T* b
cnot r b
H b
cnot a r
T* r
T* s
S* t
cnot r a
swap a r
END
