# Feynman -- quantum circuit toolkit
# Original (ham15-low.qc):
#   Qubits: 17
#   H: 46
#   T: 161
#   cnot: 259
#   Depth: 263
#   T depth: 69
# Result (74.644ms):
#   Qubits: 17
#   H: 38
#   S: 4
#   T: 97
#   cnot: 208
#   Depth: 249
#   T depth: 82
.v a b c d e f g h i j k l m n o 0 1
.i a b c d e f g h i j k l m n o
.o a b c d e f g h i j k l m n o
BEGIN 
cnot k a
cnot k f
cnot k g
cnot k h
cnot m i
cnot m n
cnot n l
cnot l n
cnot i h
cnot i e
H i
T i
cnot l i
T* i
cnot m i
T i
cnot l i
T* i
cnot m i
H i
T m
cnot l m
T* m
cnot o a
cnot i e
cnot o g
cnot i h
cnot o i
cnot o n
cnot l m
cnot m d
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
T o
cnot n o
T* o
cnot m d
cnot n o
cnot m n
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
T m
cnot m k
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
cnot k e
cnot k i
cnot k j
cnot m k
cnot k d
cnot k c
cnot k b
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
cnot 0 1
T 1
cnot n 1
T* 1
cnot 0 1
cnot n 1
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
cnot m 0
T* 0
cnot n 0
T 0
cnot m 0
cnot n 0
cnot k b
cnot k c
cnot k d
cnot k e
cnot k g
cnot k j
cnot l k
H 0
T l
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
cnot n 0
cnot m 0
T* 0
cnot l 0
T 0
cnot n 0
T* 0
cnot l 0
T 0
cnot m 0
cnot k f
cnot m h
cnot n k
cnot l k
cnot l m
H 0
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
cnot l 0
T* 0
cnot m 0
T* 0
cnot l 0
S 0
cnot n 0
T* 0
cnot m 0
T 0
cnot n 0
cnot n c
cnot n d
cnot l f
cnot n e
cnot l m
cnot m j
H 0
S n
cnot o n
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
cnot 0 m
T m
cnot l m
T* m
cnot 0 m
cnot n c
cnot n d
cnot n k
cnot l m
cnot k i
cnot m c
cnot k a
cnot m a
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
cnot l 0
cnot m 0
T 0
cnot l 0
T* 0
cnot m 0
cnot m c
cnot o g
cnot m h
cnot o k
cnot o n
cnot k h
cnot n e
H 0
S* o
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
T* 0
cnot l 0
T 0
cnot m 0
T* 0
cnot l 0
T 0
cnot m 0
H 0
T l
cnot o g
cnot o k
cnot o l
cnot o m
cnot m e
cnot m a
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
T l
S n
cnot l n
T* n
cnot k g
cnot k j
cnot o l
cnot l n
cnot n k
cnot k n
cnot n o
cnot j m
cnot j i
cnot i m
cnot i l
cnot i h
cnot h l
cnot j n
cnot h k
cnot h g
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
