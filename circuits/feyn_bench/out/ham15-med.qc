# Feynman -- quantum circuit toolkit
# Original (ham15-med.qc):
#   Qubits: 17
#   H: 164
#   T: 574
#   cnot: 616
#   Depth: 750
#   T depth: 240
# Result (163.208ms):
#   Qubits: 17
#   H: 86
#   S: 8
#   T: 242
#   Z: 7
#   cnot: 357
#   swap: 1
#   Depth: 576
#   T depth: 201
.v a b c d e f g h i j k l m n o 0 1
.i a b c d e f g h i j k l m n o
.o a b c d e f g h i j k l m n o
BEGIN 
cnot o j
cnot n o
H 1
T 1
cnot l 1
T* 1
cnot m 1
T 1
cnot l 1
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
cnot 1 l
T l
cnot m l
T* l
cnot 1 l
T o
cnot o l
cnot m l
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
T n
cnot 0 n
T n
cnot m n
cnot 0 n
T* n
cnot m n
H n
T n
cnot l n
T* n
cnot o n
T n
cnot l n
T* n
cnot o n
H n
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
T* 0
cnot n 0
H 0
H b
T b
cnot 0 b
T* b
cnot o b
T b
cnot 0 b
T* b
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
cnot l 0
T* 0
cnot m 0
T 0
cnot l 0
T* 0
cnot n 0
cnot m 0
T 0
cnot n 0
cnot o k
H 0
S o
cnot l o
T* o
cnot l o
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
H j
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
H a
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
T 0
cnot a 0
T* 0
cnot o 0
T 0
cnot a 0
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
cnot 1 m
T m
cnot l m
T* m
cnot o m
T m
cnot l m
T* m
cnot 1 m
H 1
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
H 0
H d
T d
cnot 0 d
T* d
cnot o d
T d
cnot 0 d
T* d
cnot o d
H d
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
H c
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
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
cnot n 1
T* 1
cnot 0 1
cnot n 1
H 1
cnot l 0
T* 0
cnot m 0
T 0
cnot l 0
T* 0
cnot n 0
cnot m 0
T 0
cnot n 0
H 0
S n
cnot a n
T* n
cnot o n
T n
cnot a n
T* n
cnot o n
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
cnot l 0
T 0
cnot m 0
T* 0
cnot l 0
cnot n 0
T 0
cnot m 0
T* 0
cnot n 0
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
cnot m c
T c
cnot o c
T* c
cnot m c
H c
T 0
cnot o 0
T* 0
cnot o 0
S l
cnot 1 l
T l
cnot m l
T* l
cnot 1 l
cnot o l
cnot m l
T* l
cnot j l
T l
cnot o l
T* l
cnot j l
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
Z a
cnot l a
T* a
cnot o a
T a
cnot l a
Z a
cnot m a
T* a
cnot o a
T a
cnot m a
H a
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
cnot 0 n
T n
cnot 0 n
H n
T n
cnot l n
T* n
cnot o n
T n
cnot l n
T* n
cnot o n
H n
S l
cnot 1 l
T l
cnot m l
T* l
cnot 1 l
cnot o l
cnot m l
S* l
cnot o l
H l
T l
cnot n l
T* l
cnot o l
T l
cnot n l
T* l
cnot o l
H l
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
T* 0
cnot n 0
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
T m
cnot 1 m
T m
cnot l m
T* m
cnot 1 m
cnot j m
cnot l m
T* m
cnot o m
T m
cnot j m
cnot o m
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
cnot l 0
T* 0
cnot n 0
T 0
cnot l 0
H 0
T* j
Z j
cnot 0 j
T* j
cnot o j
T j
cnot 0 j
T j
Z j
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
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
cnot n 0
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
cnot n 1
T* 1
cnot 0 1
cnot n 1
Z o
cnot k o
T* o
cnot n o
cnot k o
T* o
cnot n o
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
S k
cnot l k
T* k
cnot n k
T k
cnot l k
T* k
cnot n k
H k
cnot o n
cnot 1 0
T* 0
cnot n 0
T 0
cnot 1 0
T* 0
cnot o 0
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
S l
T o
cnot n o
S o
cnot l o
T* o
T m
cnot l m
T* m
cnot k j
cnot o l
cnot n o
cnot o m
swap m n
cnot l n
cnot k n
cnot k o
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
