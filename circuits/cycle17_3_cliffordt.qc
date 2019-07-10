# Feynman -- quantum circuit toolkit
# Original (cycle17_3.qc):
#   Qubits: 35
#   H: 1354
#   T: 4739
#   cnot: 4742
#   Depth: 6096
#   T depth: 2031
# Result (24.348ms):
#   Qubits: 35
#   H: 258
#   T: 903
#   cnot: 906
#   Depth: 1164
#   T depth: 387
.v a b c d e f g h i j k l m n o p q r s t anc0 anc1 anc2 anc3 anc4 anc5 anc6 anc7 anc8 anc9 anc10 anc11 anc12 anc13 anc14
.i a b c d e f g h i j k l m n o p q r s t
.o a b c d e f g h i j k l m n o p q r s t
BEGIN 
H anc0
T c
T d
T anc0
cnot c d
cnot d anc0
cnot anc0 c
T* c
T* d
T anc0
cnot d c
T* c
cnot d anc0
cnot anc0 c
cnot c d
H anc0
H anc1
T anc0
T e
T anc1
cnot anc0 e
cnot e anc1
cnot anc1 anc0
T* anc0
T* e
T anc1
cnot e anc0
T* anc0
cnot e anc1
cnot anc1 anc0
cnot anc0 e
H anc1
H anc2
T anc1
T f
T anc2
cnot anc1 f
cnot f anc2
cnot anc2 anc1
T* anc1
T* f
T anc2
cnot f anc1
T* anc1
cnot f anc2
cnot anc2 anc1
cnot anc1 f
H anc2
H anc3
T anc2
T g
T anc3
cnot anc2 g
cnot g anc3
cnot anc3 anc2
T* anc2
T* g
T anc3
cnot g anc2
T* anc2
cnot g anc3
cnot anc3 anc2
cnot anc2 g
H anc3
H anc4
T anc3
T h
T anc4
cnot anc3 h
cnot h anc4
cnot anc4 anc3
T* anc3
T* h
T anc4
cnot h anc3
T* anc3
cnot h anc4
cnot anc4 anc3
cnot anc3 h
H anc4
H anc5
T anc4
T i
T anc5
cnot anc4 i
cnot i anc5
cnot anc5 anc4
T* anc4
T* i
T anc5
cnot i anc4
T* anc4
cnot i anc5
cnot anc5 anc4
cnot anc4 i
H anc5
H anc6
T anc5
T j
T anc6
cnot anc5 j
cnot j anc6
cnot anc6 anc5
T* anc5
T* j
T anc6
cnot j anc5
T* anc5
cnot j anc6
cnot anc6 anc5
cnot anc5 j
H anc6
H anc7
T anc6
T k
T anc7
cnot anc6 k
cnot k anc7
cnot anc7 anc6
T* anc6
T* k
T anc7
cnot k anc6
T* anc6
cnot k anc7
cnot anc7 anc6
cnot anc6 k
H anc7
H anc8
T anc7
T l
T anc8
cnot anc7 l
cnot l anc8
cnot anc8 anc7
T* anc7
T* l
T anc8
cnot l anc7
T* anc7
cnot l anc8
cnot anc8 anc7
cnot anc7 l
H anc8
H anc9
T anc8
T m
T anc9
cnot anc8 m
cnot m anc9
cnot anc9 anc8
T* anc8
T* m
T anc9
cnot m anc8
T* anc8
cnot m anc9
cnot anc9 anc8
cnot anc8 m
H anc9
H anc10
T anc9
T n
T anc10
cnot anc9 n
cnot n anc10
cnot anc10 anc9
T* anc9
T* n
T anc10
cnot n anc9
T* anc9
cnot n anc10
cnot anc10 anc9
cnot anc9 n
H anc10
H anc11
T anc10
T o
T anc11
cnot anc10 o
cnot o anc11
cnot anc11 anc10
T* anc10
T* o
T anc11
cnot o anc10
T* anc10
cnot o anc11
cnot anc11 anc10
cnot anc10 o
H anc11
H anc12
T anc11
T p
T anc12
cnot anc11 p
cnot p anc12
cnot anc12 anc11
T* anc11
T* p
T anc12
cnot p anc11
T* anc11
cnot p anc12
cnot anc12 anc11
cnot anc11 p
H anc12
H q
T anc12
T t
T q
cnot anc12 t
cnot t q
cnot q anc12
T* anc12
T* t
T q
cnot t anc12
T* anc12
cnot t q
cnot q anc12
cnot anc12 t
H q
H anc12
T anc11
T p
T anc12
cnot anc11 p
cnot p anc12
cnot anc12 anc11
T* anc11
T* p
T anc12
cnot p anc11
T* anc11
cnot p anc12
cnot anc12 anc11
cnot anc11 p
H anc12
H p
T anc11
T t
T p
cnot anc11 t
cnot t p
cnot p anc11
T* anc11
T* t
T p
cnot t anc11
T* anc11
cnot t p
cnot p anc11
cnot anc11 t
H p
H anc11
T anc10
T o
T anc11
cnot anc10 o
cnot o anc11
cnot anc11 anc10
T* anc10
T* o
T anc11
cnot o anc10
T* anc10
cnot o anc11
cnot anc11 anc10
cnot anc10 o
H anc11
H o
T anc10
T t
T o
cnot anc10 t
cnot t o
cnot o anc10
T* anc10
T* t
T o
cnot t anc10
T* anc10
cnot t o
cnot o anc10
cnot anc10 t
H o
H anc10
T anc9
T n
T anc10
cnot anc9 n
cnot n anc10
cnot anc10 anc9
T* anc9
T* n
T anc10
cnot n anc9
T* anc9
cnot n anc10
cnot anc10 anc9
cnot anc9 n
H anc10
H n
T anc9
T t
T n
cnot anc9 t
cnot t n
cnot n anc9
T* anc9
T* t
T n
cnot t anc9
T* anc9
cnot t n
cnot n anc9
cnot anc9 t
H n
H anc9
T anc8
T m
T anc9
cnot anc8 m
cnot m anc9
cnot anc9 anc8
T* anc8
T* m
T anc9
cnot m anc8
T* anc8
cnot m anc9
cnot anc9 anc8
cnot anc8 m
H anc9
H m
T anc8
T t
T m
cnot anc8 t
cnot t m
cnot m anc8
T* anc8
T* t
T m
cnot t anc8
T* anc8
cnot t m
cnot m anc8
cnot anc8 t
H m
H anc8
T anc7
T l
T anc8
cnot anc7 l
cnot l anc8
cnot anc8 anc7
T* anc7
T* l
T anc8
cnot l anc7
T* anc7
cnot l anc8
cnot anc8 anc7
cnot anc7 l
H anc8
H l
T anc7
T t
T l
cnot anc7 t
cnot t l
cnot l anc7
T* anc7
T* t
T l
cnot t anc7
T* anc7
cnot t l
cnot l anc7
cnot anc7 t
H l
H anc7
T anc6
T k
T anc7
cnot anc6 k
cnot k anc7
cnot anc7 anc6
T* anc6
T* k
T anc7
cnot k anc6
T* anc6
cnot k anc7
cnot anc7 anc6
cnot anc6 k
H anc7
H k
T anc6
T t
T k
cnot anc6 t
cnot t k
cnot k anc6
T* anc6
T* t
T k
cnot t anc6
T* anc6
cnot t k
cnot k anc6
cnot anc6 t
H k
H anc6
T anc5
T j
T anc6
cnot anc5 j
cnot j anc6
cnot anc6 anc5
T* anc5
T* j
T anc6
cnot j anc5
T* anc5
cnot j anc6
cnot anc6 anc5
cnot anc5 j
H anc6
H j
T anc5
T t
T j
cnot anc5 t
cnot t j
cnot j anc5
T* anc5
T* t
T j
cnot t anc5
T* anc5
cnot t j
cnot j anc5
cnot anc5 t
H j
H anc5
T anc4
T i
T anc5
cnot anc4 i
cnot i anc5
cnot anc5 anc4
T* anc4
T* i
T anc5
cnot i anc4
T* anc4
cnot i anc5
cnot anc5 anc4
cnot anc4 i
H anc5
H i
T anc4
T t
T i
cnot anc4 t
cnot t i
cnot i anc4
T* anc4
T* t
T i
cnot t anc4
T* anc4
cnot t i
cnot i anc4
cnot anc4 t
H i
H anc4
T anc3
T h
T anc4
cnot anc3 h
cnot h anc4
cnot anc4 anc3
T* anc3
T* h
T anc4
cnot h anc3
T* anc3
cnot h anc4
cnot anc4 anc3
cnot anc3 h
H anc4
H h
T anc3
T t
T h
cnot anc3 t
cnot t h
cnot h anc3
T* anc3
T* t
T h
cnot t anc3
T* anc3
cnot t h
cnot h anc3
cnot anc3 t
H h
H anc3
T anc2
T g
T anc3
cnot anc2 g
cnot g anc3
cnot anc3 anc2
T* anc2
T* g
T anc3
cnot g anc2
T* anc2
cnot g anc3
cnot anc3 anc2
cnot anc2 g
H anc3
H g
T anc2
T t
T g
cnot anc2 t
cnot t g
cnot g anc2
T* anc2
T* t
T g
cnot t anc2
T* anc2
cnot t g
cnot g anc2
cnot anc2 t
H g
H anc2
T anc1
T f
T anc2
cnot anc1 f
cnot f anc2
cnot anc2 anc1
T* anc1
T* f
T anc2
cnot f anc1
T* anc1
cnot f anc2
cnot anc2 anc1
cnot anc1 f
H anc2
H f
T anc1
T t
T f
cnot anc1 t
cnot t f
cnot f anc1
T* anc1
T* t
T f
cnot t anc1
T* anc1
cnot t f
cnot f anc1
cnot anc1 t
H f
H anc1
T anc0
T e
T anc1
cnot anc0 e
cnot e anc1
cnot anc1 anc0
T* anc0
T* e
T anc1
cnot e anc0
T* anc0
cnot e anc1
cnot anc1 anc0
cnot anc0 e
H anc1
H e
T anc0
T t
T e
cnot anc0 t
cnot t e
cnot e anc0
T* anc0
T* t
T e
cnot t anc0
T* anc0
cnot t e
cnot e anc0
cnot anc0 t
H e
H anc0
T c
T d
T anc0
cnot c d
cnot d anc0
cnot anc0 c
T* c
T* d
T anc0
cnot d c
T* c
cnot d anc0
cnot anc0 c
cnot c d
H anc0
H d
T c
T t
T d
cnot c t
cnot t d
cnot d c
T* c
T* t
T d
cnot t c
T* c
cnot t d
cnot d c
cnot c t
H d
cnot t c
H anc0
T b
T c
T anc0
cnot b c
cnot c anc0
cnot anc0 b
T* b
T* c
T anc0
cnot c b
T* b
cnot c anc0
cnot anc0 b
cnot b c
H anc0
H anc1
T anc0
T d
T anc1
cnot anc0 d
cnot d anc1
cnot anc1 anc0
T* anc0
T* d
T anc1
cnot d anc0
T* anc0
cnot d anc1
cnot anc1 anc0
cnot anc0 d
H anc1
H anc2
T anc1
T e
T anc2
cnot anc1 e
cnot e anc2
cnot anc2 anc1
T* anc1
T* e
T anc2
cnot e anc1
T* anc1
cnot e anc2
cnot anc2 anc1
cnot anc1 e
H anc2
H anc3
T anc2
T f
T anc3
cnot anc2 f
cnot f anc3
cnot anc3 anc2
T* anc2
T* f
T anc3
cnot f anc2
T* anc2
cnot f anc3
cnot anc3 anc2
cnot anc2 f
H anc3
H anc4
T anc3
T g
T anc4
cnot anc3 g
cnot g anc4
cnot anc4 anc3
T* anc3
T* g
T anc4
cnot g anc3
T* anc3
cnot g anc4
cnot anc4 anc3
cnot anc3 g
H anc4
H anc5
T anc4
T h
T anc5
cnot anc4 h
cnot h anc5
cnot anc5 anc4
T* anc4
T* h
T anc5
cnot h anc4
T* anc4
cnot h anc5
cnot anc5 anc4
cnot anc4 h
H anc5
H anc6
T anc5
T i
T anc6
cnot anc5 i
cnot i anc6
cnot anc6 anc5
T* anc5
T* i
T anc6
cnot i anc5
T* anc5
cnot i anc6
cnot anc6 anc5
cnot anc5 i
H anc6
H anc7
T anc6
T j
T anc7
cnot anc6 j
cnot j anc7
cnot anc7 anc6
T* anc6
T* j
T anc7
cnot j anc6
T* anc6
cnot j anc7
cnot anc7 anc6
cnot anc6 j
H anc7
H anc8
T anc7
T k
T anc8
cnot anc7 k
cnot k anc8
cnot anc8 anc7
T* anc7
T* k
T anc8
cnot k anc7
T* anc7
cnot k anc8
cnot anc8 anc7
cnot anc7 k
H anc8
H anc9
T anc8
T l
T anc9
cnot anc8 l
cnot l anc9
cnot anc9 anc8
T* anc8
T* l
T anc9
cnot l anc8
T* anc8
cnot l anc9
cnot anc9 anc8
cnot anc8 l
H anc9
H anc10
T anc9
T m
T anc10
cnot anc9 m
cnot m anc10
cnot anc10 anc9
T* anc9
T* m
T anc10
cnot m anc9
T* anc9
cnot m anc10
cnot anc10 anc9
cnot anc9 m
H anc10
H anc11
T anc10
T n
T anc11
cnot anc10 n
cnot n anc11
cnot anc11 anc10
T* anc10
T* n
T anc11
cnot n anc10
T* anc10
cnot n anc11
cnot anc11 anc10
cnot anc10 n
H anc11
H anc12
T anc11
T o
T anc12
cnot anc11 o
cnot o anc12
cnot anc12 anc11
T* anc11
T* o
T anc12
cnot o anc11
T* anc11
cnot o anc12
cnot anc12 anc11
cnot anc11 o
H anc12
H anc13
T anc12
T p
T anc13
cnot anc12 p
cnot p anc13
cnot anc13 anc12
T* anc12
T* p
T anc13
cnot p anc12
T* anc12
cnot p anc13
cnot anc13 anc12
cnot anc12 p
H anc13
H q
T anc13
T s
T q
cnot anc13 s
cnot s q
cnot q anc13
T* anc13
T* s
T q
cnot s anc13
T* anc13
cnot s q
cnot q anc13
cnot anc13 s
H q
H anc13
T anc12
T p
T anc13
cnot anc12 p
cnot p anc13
cnot anc13 anc12
T* anc12
T* p
T anc13
cnot p anc12
T* anc12
cnot p anc13
cnot anc13 anc12
cnot anc12 p
H anc13
H p
T anc12
T s
T p
cnot anc12 s
cnot s p
cnot p anc12
T* anc12
T* s
T p
cnot s anc12
T* anc12
cnot s p
cnot p anc12
cnot anc12 s
H p
H anc12
T anc11
T o
T anc12
cnot anc11 o
cnot o anc12
cnot anc12 anc11
T* anc11
T* o
T anc12
cnot o anc11
T* anc11
cnot o anc12
cnot anc12 anc11
cnot anc11 o
H anc12
H o
T anc11
T s
T o
cnot anc11 s
cnot s o
cnot o anc11
T* anc11
T* s
T o
cnot s anc11
T* anc11
cnot s o
cnot o anc11
cnot anc11 s
H o
H anc11
T anc10
T n
T anc11
cnot anc10 n
cnot n anc11
cnot anc11 anc10
T* anc10
T* n
T anc11
cnot n anc10
T* anc10
cnot n anc11
cnot anc11 anc10
cnot anc10 n
H anc11
H n
T anc10
T s
T n
cnot anc10 s
cnot s n
cnot n anc10
T* anc10
T* s
T n
cnot s anc10
T* anc10
cnot s n
cnot n anc10
cnot anc10 s
H n
H anc10
T anc9
T m
T anc10
cnot anc9 m
cnot m anc10
cnot anc10 anc9
T* anc9
T* m
T anc10
cnot m anc9
T* anc9
cnot m anc10
cnot anc10 anc9
cnot anc9 m
H anc10
H m
T anc9
T s
T m
cnot anc9 s
cnot s m
cnot m anc9
T* anc9
T* s
T m
cnot s anc9
T* anc9
cnot s m
cnot m anc9
cnot anc9 s
H m
H anc9
T anc8
T l
T anc9
cnot anc8 l
cnot l anc9
cnot anc9 anc8
T* anc8
T* l
T anc9
cnot l anc8
T* anc8
cnot l anc9
cnot anc9 anc8
cnot anc8 l
H anc9
H l
T anc8
T s
T l
cnot anc8 s
cnot s l
cnot l anc8
T* anc8
T* s
T l
cnot s anc8
T* anc8
cnot s l
cnot l anc8
cnot anc8 s
H l
H anc8
T anc7
T k
T anc8
cnot anc7 k
cnot k anc8
cnot anc8 anc7
T* anc7
T* k
T anc8
cnot k anc7
T* anc7
cnot k anc8
cnot anc8 anc7
cnot anc7 k
H anc8
H k
T anc7
T s
T k
cnot anc7 s
cnot s k
cnot k anc7
T* anc7
T* s
T k
cnot s anc7
T* anc7
cnot s k
cnot k anc7
cnot anc7 s
H k
H anc7
T anc6
T j
T anc7
cnot anc6 j
cnot j anc7
cnot anc7 anc6
T* anc6
T* j
T anc7
cnot j anc6
T* anc6
cnot j anc7
cnot anc7 anc6
cnot anc6 j
H anc7
H j
T anc6
T s
T j
cnot anc6 s
cnot s j
cnot j anc6
T* anc6
T* s
T j
cnot s anc6
T* anc6
cnot s j
cnot j anc6
cnot anc6 s
H j
H anc6
T anc5
T i
T anc6
cnot anc5 i
cnot i anc6
cnot anc6 anc5
T* anc5
T* i
T anc6
cnot i anc5
T* anc5
cnot i anc6
cnot anc6 anc5
cnot anc5 i
H anc6
H i
T anc5
T s
T i
cnot anc5 s
cnot s i
cnot i anc5
T* anc5
T* s
T i
cnot s anc5
T* anc5
cnot s i
cnot i anc5
cnot anc5 s
H i
H anc5
T anc4
T h
T anc5
cnot anc4 h
cnot h anc5
cnot anc5 anc4
T* anc4
T* h
T anc5
cnot h anc4
T* anc4
cnot h anc5
cnot anc5 anc4
cnot anc4 h
H anc5
H h
T anc4
T s
T h
cnot anc4 s
cnot s h
cnot h anc4
T* anc4
T* s
T h
cnot s anc4
T* anc4
cnot s h
cnot h anc4
cnot anc4 s
H h
H anc4
T anc3
T g
T anc4
cnot anc3 g
cnot g anc4
cnot anc4 anc3
T* anc3
T* g
T anc4
cnot g anc3
T* anc3
cnot g anc4
cnot anc4 anc3
cnot anc3 g
H anc4
H g
T anc3
T s
T g
cnot anc3 s
cnot s g
cnot g anc3
T* anc3
T* s
T g
cnot s anc3
T* anc3
cnot s g
cnot g anc3
cnot anc3 s
H g
H anc3
T anc2
T f
T anc3
cnot anc2 f
cnot f anc3
cnot anc3 anc2
T* anc2
T* f
T anc3
cnot f anc2
T* anc2
cnot f anc3
cnot anc3 anc2
cnot anc2 f
H anc3
H f
T anc2
T s
T f
cnot anc2 s
cnot s f
cnot f anc2
T* anc2
T* s
T f
cnot s anc2
T* anc2
cnot s f
cnot f anc2
cnot anc2 s
H f
H anc2
T anc1
T e
T anc2
cnot anc1 e
cnot e anc2
cnot anc2 anc1
T* anc1
T* e
T anc2
cnot e anc1
T* anc1
cnot e anc2
cnot anc2 anc1
cnot anc1 e
H anc2
H e
T anc1
T s
T e
cnot anc1 s
cnot s e
cnot e anc1
T* anc1
T* s
T e
cnot s anc1
T* anc1
cnot s e
cnot e anc1
cnot anc1 s
H e
H anc1
T anc0
T d
T anc1
cnot anc0 d
cnot d anc1
cnot anc1 anc0
T* anc0
T* d
T anc1
cnot d anc0
T* anc0
cnot d anc1
cnot anc1 anc0
cnot anc0 d
H anc1
H d
T anc0
T s
T d
cnot anc0 s
cnot s d
cnot d anc0
T* anc0
T* s
T d
cnot s anc0
T* anc0
cnot s d
cnot d anc0
cnot anc0 s
H d
H anc0
T b
T c
T anc0
cnot b c
cnot c anc0
cnot anc0 b
T* b
T* c
T anc0
cnot c b
T* b
cnot c anc0
cnot anc0 b
cnot b c
H anc0
H c
T b
T s
T c
cnot b s
cnot s c
cnot c b
T* b
T* s
T c
cnot s b
T* b
cnot s c
cnot c b
cnot b s
H c
cnot s b
H anc0
T a
T b
T anc0
cnot a b
cnot b anc0
cnot anc0 a
T* a
T* b
T anc0
cnot b a
T* a
cnot b anc0
cnot anc0 a
cnot a b
H anc0
H anc1
T anc0
T c
T anc1
cnot anc0 c
cnot c anc1
cnot anc1 anc0
T* anc0
T* c
T anc1
cnot c anc0
T* anc0
cnot c anc1
cnot anc1 anc0
cnot anc0 c
H anc1
H anc2
T anc1
T d
T anc2
cnot anc1 d
cnot d anc2
cnot anc2 anc1
T* anc1
T* d
T anc2
cnot d anc1
T* anc1
cnot d anc2
cnot anc2 anc1
cnot anc1 d
H anc2
H anc3
T anc2
T e
T anc3
cnot anc2 e
cnot e anc3
cnot anc3 anc2
T* anc2
T* e
T anc3
cnot e anc2
T* anc2
cnot e anc3
cnot anc3 anc2
cnot anc2 e
H anc3
H anc4
T anc3
T f
T anc4
cnot anc3 f
cnot f anc4
cnot anc4 anc3
T* anc3
T* f
T anc4
cnot f anc3
T* anc3
cnot f anc4
cnot anc4 anc3
cnot anc3 f
H anc4
H anc5
T anc4
T g
T anc5
cnot anc4 g
cnot g anc5
cnot anc5 anc4
T* anc4
T* g
T anc5
cnot g anc4
T* anc4
cnot g anc5
cnot anc5 anc4
cnot anc4 g
H anc5
H anc6
T anc5
T h
T anc6
cnot anc5 h
cnot h anc6
cnot anc6 anc5
T* anc5
T* h
T anc6
cnot h anc5
T* anc5
cnot h anc6
cnot anc6 anc5
cnot anc5 h
H anc6
H anc7
T anc6
T i
T anc7
cnot anc6 i
cnot i anc7
cnot anc7 anc6
T* anc6
T* i
T anc7
cnot i anc6
T* anc6
cnot i anc7
cnot anc7 anc6
cnot anc6 i
H anc7
H anc8
T anc7
T j
T anc8
cnot anc7 j
cnot j anc8
cnot anc8 anc7
T* anc7
T* j
T anc8
cnot j anc7
T* anc7
cnot j anc8
cnot anc8 anc7
cnot anc7 j
H anc8
H anc9
T anc8
T k
T anc9
cnot anc8 k
cnot k anc9
cnot anc9 anc8
T* anc8
T* k
T anc9
cnot k anc8
T* anc8
cnot k anc9
cnot anc9 anc8
cnot anc8 k
H anc9
H anc10
T anc9
T l
T anc10
cnot anc9 l
cnot l anc10
cnot anc10 anc9
T* anc9
T* l
T anc10
cnot l anc9
T* anc9
cnot l anc10
cnot anc10 anc9
cnot anc9 l
H anc10
H anc11
T anc10
T m
T anc11
cnot anc10 m
cnot m anc11
cnot anc11 anc10
T* anc10
T* m
T anc11
cnot m anc10
T* anc10
cnot m anc11
cnot anc11 anc10
cnot anc10 m
H anc11
H anc12
T anc11
T n
T anc12
cnot anc11 n
cnot n anc12
cnot anc12 anc11
T* anc11
T* n
T anc12
cnot n anc11
T* anc11
cnot n anc12
cnot anc12 anc11
cnot anc11 n
H anc12
H anc13
T anc12
T o
T anc13
cnot anc12 o
cnot o anc13
cnot anc13 anc12
T* anc12
T* o
T anc13
cnot o anc12
T* anc12
cnot o anc13
cnot anc13 anc12
cnot anc12 o
H anc13
H anc14
T anc13
T p
T anc14
cnot anc13 p
cnot p anc14
cnot anc14 anc13
T* anc13
T* p
T anc14
cnot p anc13
T* anc13
cnot p anc14
cnot anc14 anc13
cnot anc13 p
H anc14
H q
T anc14
T r
T q
cnot anc14 r
cnot r q
cnot q anc14
T* anc14
T* r
T q
cnot r anc14
T* anc14
cnot r q
cnot q anc14
cnot anc14 r
H q
H anc14
T anc13
T p
T anc14
cnot anc13 p
cnot p anc14
cnot anc14 anc13
T* anc13
T* p
T anc14
cnot p anc13
T* anc13
cnot p anc14
cnot anc14 anc13
cnot anc13 p
H anc14
H p
T anc13
T r
T p
cnot anc13 r
cnot r p
cnot p anc13
T* anc13
T* r
T p
cnot r anc13
T* anc13
cnot r p
cnot p anc13
cnot anc13 r
H p
H anc13
T anc12
T o
T anc13
cnot anc12 o
cnot o anc13
cnot anc13 anc12
T* anc12
T* o
T anc13
cnot o anc12
T* anc12
cnot o anc13
cnot anc13 anc12
cnot anc12 o
H anc13
H o
T anc12
T r
T o
cnot anc12 r
cnot r o
cnot o anc12
T* anc12
T* r
T o
cnot r anc12
T* anc12
cnot r o
cnot o anc12
cnot anc12 r
H o
H anc12
T anc11
T n
T anc12
cnot anc11 n
cnot n anc12
cnot anc12 anc11
T* anc11
T* n
T anc12
cnot n anc11
T* anc11
cnot n anc12
cnot anc12 anc11
cnot anc11 n
H anc12
H n
T anc11
T r
T n
cnot anc11 r
cnot r n
cnot n anc11
T* anc11
T* r
T n
cnot r anc11
T* anc11
cnot r n
cnot n anc11
cnot anc11 r
H n
H anc11
T anc10
T m
T anc11
cnot anc10 m
cnot m anc11
cnot anc11 anc10
T* anc10
T* m
T anc11
cnot m anc10
T* anc10
cnot m anc11
cnot anc11 anc10
cnot anc10 m
H anc11
H m
T anc10
T r
T m
cnot anc10 r
cnot r m
cnot m anc10
T* anc10
T* r
T m
cnot r anc10
T* anc10
cnot r m
cnot m anc10
cnot anc10 r
H m
H anc10
T anc9
T l
T anc10
cnot anc9 l
cnot l anc10
cnot anc10 anc9
T* anc9
T* l
T anc10
cnot l anc9
T* anc9
cnot l anc10
cnot anc10 anc9
cnot anc9 l
H anc10
H l
T anc9
T r
T l
cnot anc9 r
cnot r l
cnot l anc9
T* anc9
T* r
T l
cnot r anc9
T* anc9
cnot r l
cnot l anc9
cnot anc9 r
H l
H anc9
T anc8
T k
T anc9
cnot anc8 k
cnot k anc9
cnot anc9 anc8
T* anc8
T* k
T anc9
cnot k anc8
T* anc8
cnot k anc9
cnot anc9 anc8
cnot anc8 k
H anc9
H k
T anc8
T r
T k
cnot anc8 r
cnot r k
cnot k anc8
T* anc8
T* r
T k
cnot r anc8
T* anc8
cnot r k
cnot k anc8
cnot anc8 r
H k
H anc8
T anc7
T j
T anc8
cnot anc7 j
cnot j anc8
cnot anc8 anc7
T* anc7
T* j
T anc8
cnot j anc7
T* anc7
cnot j anc8
cnot anc8 anc7
cnot anc7 j
H anc8
H j
T anc7
T r
T j
cnot anc7 r
cnot r j
cnot j anc7
T* anc7
T* r
T j
cnot r anc7
T* anc7
cnot r j
cnot j anc7
cnot anc7 r
H j
H anc7
T anc6
T i
T anc7
cnot anc6 i
cnot i anc7
cnot anc7 anc6
T* anc6
T* i
T anc7
cnot i anc6
T* anc6
cnot i anc7
cnot anc7 anc6
cnot anc6 i
H anc7
H i
T anc6
T r
T i
cnot anc6 r
cnot r i
cnot i anc6
T* anc6
T* r
T i
cnot r anc6
T* anc6
cnot r i
cnot i anc6
cnot anc6 r
H i
H anc6
T anc5
T h
T anc6
cnot anc5 h
cnot h anc6
cnot anc6 anc5
T* anc5
T* h
T anc6
cnot h anc5
T* anc5
cnot h anc6
cnot anc6 anc5
cnot anc5 h
H anc6
H h
T anc5
T r
T h
cnot anc5 r
cnot r h
cnot h anc5
T* anc5
T* r
T h
cnot r anc5
T* anc5
cnot r h
cnot h anc5
cnot anc5 r
H h
H anc5
T anc4
T g
T anc5
cnot anc4 g
cnot g anc5
cnot anc5 anc4
T* anc4
T* g
T anc5
cnot g anc4
T* anc4
cnot g anc5
cnot anc5 anc4
cnot anc4 g
H anc5
H g
T anc4
T r
T g
cnot anc4 r
cnot r g
cnot g anc4
T* anc4
T* r
T g
cnot r anc4
T* anc4
cnot r g
cnot g anc4
cnot anc4 r
H g
H anc4
T anc3
T f
T anc4
cnot anc3 f
cnot f anc4
cnot anc4 anc3
T* anc3
T* f
T anc4
cnot f anc3
T* anc3
cnot f anc4
cnot anc4 anc3
cnot anc3 f
H anc4
H f
T anc3
T r
T f
cnot anc3 r
cnot r f
cnot f anc3
T* anc3
T* r
T f
cnot r anc3
T* anc3
cnot r f
cnot f anc3
cnot anc3 r
H f
H anc3
T anc2
T e
T anc3
cnot anc2 e
cnot e anc3
cnot anc3 anc2
T* anc2
T* e
T anc3
cnot e anc2
T* anc2
cnot e anc3
cnot anc3 anc2
cnot anc2 e
H anc3
H e
T anc2
T r
T e
cnot anc2 r
cnot r e
cnot e anc2
T* anc2
T* r
T e
cnot r anc2
T* anc2
cnot r e
cnot e anc2
cnot anc2 r
H e
H anc2
T anc1
T d
T anc2
cnot anc1 d
cnot d anc2
cnot anc2 anc1
T* anc1
T* d
T anc2
cnot d anc1
T* anc1
cnot d anc2
cnot anc2 anc1
cnot anc1 d
H anc2
H d
T anc1
T r
T d
cnot anc1 r
cnot r d
cnot d anc1
T* anc1
T* r
T d
cnot r anc1
T* anc1
cnot r d
cnot d anc1
cnot anc1 r
H d
H anc1
T anc0
T c
T anc1
cnot anc0 c
cnot c anc1
cnot anc1 anc0
T* anc0
T* c
T anc1
cnot c anc0
T* anc0
cnot c anc1
cnot anc1 anc0
cnot anc0 c
H anc1
H c
T anc0
T r
T c
cnot anc0 r
cnot r c
cnot c anc0
T* anc0
T* r
T c
cnot r anc0
T* anc0
cnot r c
cnot c anc0
cnot anc0 r
H c
H anc0
T a
T b
T anc0
cnot a b
cnot b anc0
cnot anc0 a
T* a
T* b
T anc0
cnot b a
T* a
cnot b anc0
cnot anc0 a
cnot a b
H anc0
H b
T a
T r
T b
cnot a r
cnot r b
cnot b a
T* a
T* r
T b
cnot r a
T* a
cnot r b
cnot b a
cnot a r
H b
cnot r a
END
