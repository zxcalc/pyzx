# Feynman -- quantum circuit toolkit
# Original (hwb8.qc):
#   Qubits: 12
#   H: 1682
#   T: 5887
#   X: 158
#   cnot: 7970
#   Depth: 7956
#   T depth: 2139
# Result (5061.034ms):
#   Qubits: 12
#   H: 1140
#   S: 689
#   T: 3531
#   X: 151
#   Z: 133
#   cnot: 6835
#   swap: 160
#   Depth: 9005
#   T depth: 2753
.v a b c d e f g h 0 1 2 3
.i a b c d e f g h
.o a b c d e f g h
BEGIN 
cnot d a
cnot e a
cnot h a
cnot d c
cnot f d
cnot g e
cnot h f
cnot h g
swap f g
swap e h
swap d e
cnot g c
cnot h c
swap c f
cnot e h
cnot b e
cnot a e
swap a c
swap 1 2
swap 0 3
H h
T h
cnot b h
T* h
cnot c h
T* h
cnot b h
T h
cnot c h
H h
T b
cnot c b
T b
cnot c b
cnot h f
swap 0 1
H b
T b
cnot c b
T b
cnot h b
T* b
cnot c b
T* b
cnot h b
H b
cnot b e
H b
T b
cnot e b
T b
cnot h b
T* b
cnot e b
T* b
cnot h b
H b
T* e
cnot h e
T e
cnot h e
X e
H e
T e
cnot b e
T* e
cnot h e
T e
cnot b e
T* e
cnot h e
H e
cnot e g
H e
T e
cnot g e
T* e
cnot h e
T e
cnot g e
T* e
cnot h e
swap 0 3
H e
H f
T f
cnot b f
T* f
cnot h f
T f
cnot b f
T* f
cnot h f
H f
S b
S* c
cnot b h
S* h
cnot c h
cnot b h
T h
T g
cnot h g
T g
cnot c g
T* g
cnot c b
cnot h g
cnot g h
cnot g f
cnot f g
cnot e g
cnot g h
cnot c g
cnot c f
cnot f a
cnot a h
cnot a g
cnot b f
swap 2 3
swap 1 2
swap 0 1
X c
H c
T c
cnot b c
T c
cnot g c
T c
cnot b c
T c
cnot g c
swap 1 2
H c
T* b
cnot g b
T* b
cnot e b
cnot g b
cnot b c
swap 2 3
swap 0 3
H e
T e
cnot b e
T e
cnot f e
T e
cnot b e
T e
cnot f e
swap 1 3
H e
T* f
cnot b f
T* f
cnot h f
cnot a f
T f
Z f
cnot h f
cnot a b
cnot b f
cnot a e
cnot a c
swap 0 3
X f
H f
T f
cnot g f
T f
cnot h f
T* f
cnot g f
T* f
cnot h f
swap 1 3
H f
T h
H h
H 1
T 1
cnot b 1
T 1
cnot c 1
T 1
cnot b 1
T 1
cnot c 1
H 1
H 0
T 0
cnot 1 0
T* 0
cnot d 0
T* 0
cnot 1 0
T 0
cnot d 0
H 0
T a
cnot f a
T* a
cnot h a
T a
cnot f a
T* a
cnot b a
cnot h a
T* a
cnot b a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S h
cnot a h
T* h
cnot f h
T h
cnot a h
S* h
cnot f h
H h
S f
cnot a f
T* f
cnot a f
H f
T f
cnot g f
T f
cnot h f
T* f
cnot g f
T* f
cnot h f
H f
T g
Z g
cnot h g
T g
cnot h g
X g
H g
S a
cnot f a
T* a
cnot g a
T a
cnot f a
T* a
cnot g a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S 0
cnot e 0
S* 0
cnot e 0
H 0
S 1
cnot 0 1
T* 1
cnot d 1
T* 1
cnot 0 1
S 1
cnot d 1
H 1
S g
cnot a g
T* g
cnot f g
T g
cnot a g
S* g
cnot f g
H g
S e
cnot b c
cnot a b
cnot a e
H e
T e
cnot b e
T e
cnot f e
T* e
cnot b e
T* e
cnot f e
H e
S* c
cnot 1 c
T c
cnot b c
cnot a c
T c
cnot 1 c
S* c
cnot e b
cnot e c
cnot b c
cnot a c
H c
T c
cnot b c
T c
cnot g c
T* c
cnot b c
T* c
cnot g c
H c
T a
cnot e a
cnot b a
S* a
T* f
Z f
cnot e f
cnot b f
T f
cnot a 1
T 1
cnot a 1
cnot f a
cnot b a
cnot c b
cnot g f
cnot h f
cnot e f
cnot e h
cnot e g
cnot c g
cnot c f
cnot a h
cnot a g
cnot a f
H f
S f
cnot b f
T f
cnot h f
T f
cnot b f
S f
cnot c f
T* f
cnot h f
T* f
cnot c f
H f
cnot c e
cnot b e
T* e
cnot g e
cnot a e
cnot b e
T e
cnot c e
cnot b e
T e
cnot h e
cnot g e
cnot b e
T e
cnot h e
cnot a e
H e
T e
cnot g e
T e
cnot h e
T e
cnot g e
T e
cnot h e
H e
T* b
T* g
cnot b h
T* h
cnot g h
cnot b h
T* h
cnot b c
T* c
cnot c a
T* a
cnot c a
cnot g h
cnot e g
cnot b e
cnot b c
X b
H b
T b
cnot e b
T b
cnot h b
T b
cnot e b
T b
cnot h b
H b
T* e
cnot h e
T* e
cnot h e
X e
H e
T e
cnot b e
T* e
cnot h e
T* e
cnot b e
T e
cnot h e
H e
T b
cnot h b
T b
cnot h b
cnot e g
cnot b f
H b
T b
cnot c b
T* b
cnot h b
T* b
cnot c b
T b
cnot h b
H b
S h
cnot c h
S h
cnot c h
cnot b g
cnot b f
cnot b e
X h
H h
T h
cnot b h
T* h
cnot c h
T h
cnot b h
T* h
cnot c h
H h
T b
S* d
cnot 0 d
T d
cnot b c
T* c
cnot c b
cnot g a
cnot e d
cnot d c
cnot g d
cnot g f
cnot h g
cnot g h
swap f h
cnot h e
cnot e h
swap e f
swap d e
swap c e
cnot e h
cnot c f
cnot b e
swap b c
cnot e a
cnot a e
swap a b
cnot b h
cnot e f
cnot c d
cnot 0 f
cnot 0 b
cnot 0 a
H d
T d
cnot c d
T d
cnot h d
T d
cnot c d
T d
cnot h d
H d
cnot d a
cnot d b
cnot d g
cnot d e
H d
T d
cnot b d
T d
cnot h d
T d
cnot b d
T d
cnot h d
H d
S* h
cnot b h
T* h
cnot c h
cnot b h
T* h
cnot c h
X h
H h
T h
cnot b h
T h
cnot e h
T* h
cnot b h
T* h
cnot e h
H h
S* b
T e
cnot a b
cnot a e
X a
H a
T a
cnot g a
T* a
cnot h a
T a
cnot g a
T* a
cnot h a
H a
cnot c b
cnot a b
cnot a e
H f
T f
cnot b f
T f
cnot h f
T* f
cnot b f
T* f
cnot h f
H f
S c
cnot e c
cnot b c
T c
T g
cnot g h
T* h
cnot e c
cnot h f
cnot f g
cnot e g
cnot g h
cnot c g
cnot b g
cnot f a
cnot a g
cnot a h
cnot b f
cnot b c
X c
H c
T c
cnot b c
T c
cnot g c
T* c
cnot b c
T* c
cnot g c
H c
S* b
cnot g b
T b
cnot f h
cnot e h
cnot a h
T h
cnot e b
cnot g b
cnot f h
cnot e h
cnot a h
cnot b c
X e
H e
T e
cnot b e
T* e
cnot f e
T* e
cnot b e
T e
cnot f e
H e
T* f
cnot b f
T f
cnot h f
cnot a f
S f
cnot h f
cnot a b
cnot b f
cnot a e
cnot a c
X f
H f
T f
cnot g f
T* f
cnot h f
T* f
cnot g f
T f
cnot h f
H f
T* h
cnot g h
T h
cnot g h
X h
H h
S 1
cnot b 1
T* 1
cnot c 1
T 1
cnot b 1
T* 1
cnot c 1
H 1
S 0
cnot 1 0
T* 0
cnot d 0
T* 0
cnot 1 0
T 0
cnot d 0
H 0
T a
cnot f a
T* a
cnot h a
T a
cnot f a
T* a
cnot b a
cnot h a
T a
cnot b a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S h
cnot a h
T* h
cnot f h
T h
cnot a h
S* h
cnot f h
H h
S f
cnot a f
T* f
cnot a f
H f
T f
cnot g f
T* f
cnot h f
T f
cnot g f
T* f
cnot h f
H f
T* g
Z g
cnot h g
T* g
cnot h g
H g
S a
cnot f a
T* a
cnot g a
T a
cnot f a
T* a
cnot g a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S 0
cnot e 0
S* 0
cnot e 0
H 0
S 1
cnot 0 1
T* 1
cnot d 1
T* 1
cnot 0 1
S 1
cnot d 1
H 1
S g
cnot a g
T* g
cnot f g
T g
cnot a g
S* g
cnot f g
H g
S e
cnot b c
cnot a b
cnot a e
H e
T e
cnot b e
T* e
cnot f e
T e
cnot b e
T* e
cnot f e
H e
S* c
cnot 1 c
T c
cnot b c
cnot a c
T* c
cnot 1 c
S c
cnot e b
cnot e c
cnot b c
cnot a c
H c
T c
cnot b c
T* c
cnot g c
T c
cnot b c
T* c
cnot g c
H c
T a
cnot e a
cnot b a
S a
T* f
Z f
cnot e f
cnot b f
T* f
cnot a 1
T* 1
cnot a 1
cnot f a
cnot b a
cnot c b
cnot g f
cnot h f
cnot e f
cnot e h
cnot e g
cnot c g
cnot c f
cnot a h
cnot a g
H f
S f
cnot b f
T* f
cnot h f
T f
cnot b f
S* f
cnot c f
T f
cnot h f
T* f
cnot c f
H f
T b
cnot c b
T b
cnot g b
cnot e b
cnot c b
cnot a b
T* b
cnot h b
cnot g b
cnot e b
cnot a b
T* b
cnot h b
cnot a b
cnot a e
H a
T a
cnot g a
T* a
cnot h a
T a
cnot g a
T* a
cnot h a
H a
T* h
Z h
cnot c h
T* h
cnot e h
cnot c h
T h
cnot g h
cnot e h
T* h
cnot g h
cnot a b
cnot a e
H h
T h
cnot b h
T* h
cnot e h
T h
cnot b h
T* h
cnot e h
H h
S* d
cnot 0 d
T d
cnot 0 d
H d
T d
cnot b d
T* d
cnot h d
T d
cnot b d
T* d
cnot h d
H d
S b
T e
T g
cnot g c
cnot e c
cnot a c
T c
cnot b h
T* h
cnot d a
cnot d b
cnot e c
cnot d h
cnot d g
cnot d e
cnot g c
cnot b h
cnot a e
cnot a c
cnot a b
H d
T d
cnot c d
T* d
cnot h d
T d
cnot c d
T* d
cnot h d
H d
S c
cnot b e
T* e
cnot c h
T* h
cnot g a
cnot h a
cnot b a
cnot c b
cnot e d
cnot f d
cnot g c
cnot h c
cnot g e
cnot h e
swap f g
cnot e g
cnot g h
swap d g
cnot g h
cnot c f
cnot c d
cnot e b
cnot b e
swap b d
cnot g a
cnot a e
swap a d
cnot d f
cnot a c
H b
T b
cnot c b
T b
cnot h b
T* b
cnot c b
T* b
cnot h b
H b
T* c
cnot d e
T* e
cnot d f
S f
T h
cnot d a
cnot d b
cnot d c
cnot d h
cnot d f
cnot d e
cnot b g
cnot b e
X d
H d
T d
cnot b d
T d
cnot h d
T d
cnot b d
T d
cnot h d
H d
T* h
cnot b h
T* h
cnot c h
cnot b h
T h
cnot d a
cnot d h
cnot c h
H d
T d
cnot g d
T* d
cnot h d
T* d
cnot g d
T d
cnot h d
H d
cnot c b
H f
T f
cnot b f
T f
cnot h f
T f
cnot b f
T f
cnot h f
H f
cnot b c
T* c
T g
cnot g h
T h
cnot h f
cnot f g
cnot e g
cnot g h
cnot c g
cnot b g
cnot f a
cnot a g
cnot a h
cnot b f
cnot b c
H c
T c
cnot b c
T c
cnot g c
T* c
cnot b c
T* c
cnot g c
H c
S* b
cnot g b
T b
cnot f h
cnot e h
cnot a h
T* h
cnot e b
cnot g b
cnot f h
cnot e h
cnot a h
cnot b c
X e
H e
T e
cnot b e
T* e
cnot f e
T e
cnot b e
T* e
cnot f e
H e
T f
cnot b f
T* f
cnot h f
cnot a f
S* f
cnot h f
cnot a b
cnot b f
cnot a e
cnot a c
H f
T f
cnot g f
T* f
cnot h f
T* f
cnot g f
T f
cnot h f
H f
T* h
cnot g h
T h
cnot g h
X h
H h
S 1
cnot b 1
T* 1
cnot c 1
T 1
cnot b 1
T* 1
cnot c 1
H 1
S 0
cnot 1 0
T* 0
cnot d 0
T* 0
cnot 1 0
T 0
cnot d 0
H 0
T a
cnot f a
T* a
cnot h a
T a
cnot f a
T* a
cnot b a
cnot h a
S a
cnot b a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S h
cnot a h
T* h
cnot f h
T h
cnot a h
S* h
cnot f h
H h
S f
cnot a f
T* f
cnot a f
H f
T f
cnot g f
T* f
cnot h f
T f
cnot g f
T* f
cnot h f
H f
T* g
Z g
cnot h g
T* g
cnot h g
H g
S a
cnot f a
T* a
cnot g a
T a
cnot f a
T* a
cnot g a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S 0
cnot e 0
S* 0
cnot e 0
H 0
S 1
cnot 0 1
T* 1
cnot d 1
T* 1
cnot 0 1
S 1
cnot d 1
H 1
S g
cnot a g
T* g
cnot f g
T g
cnot a g
S* g
cnot f g
H g
S e
cnot b c
cnot a b
cnot a e
H e
T e
cnot b e
T* e
cnot f e
T e
cnot b e
T* e
cnot f e
H e
S* c
cnot 1 c
T c
cnot b c
cnot a c
T* c
cnot 1 c
S c
cnot e b
cnot e c
cnot b c
cnot a c
H c
T c
cnot b c
T* c
cnot g c
T c
cnot b c
T* c
cnot g c
H c
T a
cnot e a
cnot b a
S a
T* f
Z f
cnot e f
cnot b f
T* f
cnot a 1
T* 1
cnot a 1
cnot f a
cnot b a
cnot c b
cnot g f
cnot h f
cnot e f
cnot e h
cnot e g
cnot c g
cnot c f
cnot a h
cnot a g
H f
S f
cnot b f
T* f
cnot h f
T f
cnot b f
S* f
cnot c f
T f
cnot h f
T* f
cnot c f
H f
S* d
cnot 0 d
T d
cnot 0 d
H d
T d
cnot g d
T* d
cnot h d
T d
cnot g d
T* d
cnot h d
H d
cnot b c
T c
cnot a c
T* c
T* h
Z h
cnot b h
T* h
cnot c h
cnot a h
T* h
cnot g h
cnot c h
cnot b h
cnot a h
T* h
cnot g e
cnot b e
cnot a e
T* e
cnot c e
cnot a e
T e
cnot d a
cnot d c
cnot g e
cnot g h
cnot d e
cnot c e
cnot d h
cnot b c
cnot a c
cnot b e
H d
T d
cnot b d
T* d
cnot h d
T d
cnot b d
T* d
cnot h d
H d
S b
cnot b h
T* h
cnot e h
cnot b h
cnot a h
T h
T g
cnot d a
cnot d b
cnot d c
cnot e h
cnot d g
cnot d e
cnot a h
cnot b g
cnot b e
H b
T b
cnot c b
T* b
cnot h b
T b
cnot c b
T* b
cnot h b
H b
cnot c d
T d
cnot h d
cnot c d
T d
cnot e a
cnot b a
cnot f c
cnot d c
cnot h e
cnot f e
cnot h g
swap g h
cnot h f
swap f g
cnot e h
cnot e d
cnot d g
cnot c g
swap c e
cnot b d
cnot g a
cnot a b
cnot a h
cnot a g
cnot d e
cnot b c
H a
T a
cnot c a
T* a
cnot h a
T a
cnot c a
T* a
cnot h a
H a
T c
T f
cnot c h
T* h
cnot h g
cnot c g
T g
cnot d b
cnot d c
cnot h g
cnot g f
cnot f h
cnot d f
cnot c f
cnot f h
cnot c g
cnot d e
cnot a g
cnot a f
X d
H d
T d
cnot b d
T* d
cnot h d
T d
cnot b d
T* d
cnot h d
H d
T b
cnot b h
T* h
cnot f h
cnot b h
cnot a h
T* h
cnot f h
cnot a b
cnot a h
cnot a e
cnot a d
H a
T a
cnot g a
T a
cnot h a
T* a
cnot g a
T* a
cnot h a
H a
cnot c b
cnot a b
cnot a f
cnot a e
cnot a d
H f
T f
cnot b f
T f
cnot h f
T* f
cnot b f
T* f
cnot h f
H f
T* g
cnot h g
T g
cnot h f
cnot h g
cnot g h
cnot f g
cnot e g
cnot g h
cnot c g
cnot f a
cnot a h
cnot a g
cnot b f
X c
H c
T c
cnot b c
T c
cnot g c
T c
cnot b c
T c
cnot g c
H c
S* b
cnot g b
T* b
cnot f h
cnot e h
cnot a h
T h
cnot e b
cnot g b
cnot f h
cnot e h
cnot a h
cnot b c
X e
H e
T e
cnot b e
T* e
cnot f e
T* e
cnot b e
T e
cnot f e
H e
T* f
cnot b f
T f
cnot h f
cnot a f
Z f
cnot h f
cnot a b
cnot b f
cnot a e
cnot a c
X f
H f
T f
cnot g f
T f
cnot h f
T f
cnot g f
T f
cnot h f
H f
T* h
cnot g h
T* h
cnot g h
X h
H h
S 1
cnot b 1
T* 1
cnot c 1
T 1
cnot b 1
T* 1
cnot c 1
H 1
S 0
cnot 1 0
T* 0
cnot d 0
T* 0
cnot 1 0
T 0
cnot d 0
H 0
T a
cnot f a
T* a
cnot h a
T a
cnot f a
T* a
cnot b a
cnot h a
S a
cnot b a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S h
cnot a h
T* h
cnot f h
T h
cnot a h
S* h
cnot f h
H h
S f
cnot a f
T* f
cnot a f
H f
T f
cnot g f
T f
cnot h f
T* f
cnot g f
T* f
cnot h f
H f
T g
Z g
cnot h g
T g
cnot h g
X g
H g
S a
cnot f a
T* a
cnot g a
T a
cnot f a
T* a
cnot g a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S 0
cnot e 0
S* 0
cnot e 0
H 0
S 1
cnot 0 1
T* 1
cnot d 1
T* 1
cnot 0 1
S 1
cnot d 1
H 1
S g
cnot a g
T* g
cnot f g
T g
cnot a g
S* g
cnot f g
H g
S e
cnot b c
cnot a b
cnot a e
H e
T e
cnot b e
T* e
cnot f e
T e
cnot b e
T* e
cnot f e
H e
S* c
cnot 1 c
T c
cnot b c
cnot a c
T* c
cnot 1 c
S c
cnot e b
cnot e c
cnot b c
cnot a c
H c
T c
cnot b c
T* c
cnot g c
T c
cnot b c
T* c
cnot g c
H c
T a
cnot e a
cnot b a
S a
T* f
Z f
cnot e f
cnot b f
T* f
cnot a 1
T* 1
cnot a 1
cnot f a
cnot b a
cnot c b
cnot g f
cnot h f
cnot e f
cnot e h
cnot e g
cnot c g
cnot c f
cnot a h
cnot a g
cnot a f
H f
S f
cnot b f
T* f
cnot h f
T f
cnot b f
S* f
cnot c f
T f
cnot h f
T* f
cnot c f
H f
T b
S* d
cnot 0 d
T d
cnot b c
T c
cnot e g
cnot b g
cnot a g
T* g
cnot b h
T* h
cnot e g
cnot c h
cnot b c
cnot a b
cnot c h
cnot b g
cnot a e
cnot a d
cnot 0 d
H a
T a
cnot g a
T* a
cnot h a
T a
cnot g a
T* a
cnot h a
H a
cnot a b
cnot a e
cnot a d
H d
T d
cnot b d
T* d
cnot h d
T d
cnot b d
T* d
cnot h d
H d
cnot b c
cnot a c
T* c
T g
cnot g h
T* h
cnot h e
cnot g e
cnot a e
T e
cnot d b
cnot f e
cnot g h
cnot h e
cnot d g
cnot d f
cnot b c
cnot a c
cnot a g
cnot a e
H a
T a
cnot c a
T* a
cnot h a
T a
cnot c a
T* a
cnot h a
H a
T c
cnot d c
T c
T h
Z h
cnot h b
cnot d b
T* b
cnot d a
cnot g a
cnot h a
cnot h b
cnot h g
cnot g h
cnot g f
cnot f h
swap f g
cnot h e
cnot e g
cnot e f
cnot h d
cnot f c
cnot c d
cnot d h
cnot c g
cnot d f
cnot g b
swap a f
X a
H a
T a
cnot b a
T* a
cnot e a
T a
cnot b a
T* a
cnot e a
H a
T c
cnot e c
cnot d c
cnot b c
T c
cnot g c
cnot e c
cnot b c
T* c
cnot g c
cnot d c
cnot a b
cnot a h
cnot a e
X c
H c
T c
cnot e c
T* c
cnot h c
T c
cnot e c
T* c
cnot h c
H c
cnot a b
T b
T e
cnot b e
cnot a e
T* e
cnot e h
cnot b h
cnot a h
T* h
cnot e h
cnot b e
cnot a b
cnot b h
cnot a g
H a
T a
cnot c a
T* a
cnot h a
T a
cnot c a
T* a
cnot h a
H a
S h
cnot c h
T* h
cnot g h
cnot d h
cnot c h
T* h
cnot g h
cnot d h
cnot a g
H h
T h
cnot b h
T* h
cnot c h
T h
cnot b h
T* h
cnot c h
H h
S c
cnot b c
T* c
T e
cnot c f
cnot c e
cnot b e
cnot a e
cnot b f
cnot b c
H c
T c
cnot b c
T* c
cnot h c
T c
cnot b c
T* c
cnot h c
H c
T h
cnot b h
T* h
cnot d c
cnot e f
cnot d e
cnot c e
cnot d h
cnot e f
cnot b h
X d
H d
T d
cnot g d
T* d
cnot h d
T* d
cnot g d
T d
cnot h d
H d
cnot c b
H f
T f
cnot b f
T f
cnot h f
T f
cnot b f
T f
cnot h f
H f
cnot b c
S c
T g
cnot g h
T h
cnot h f
cnot f g
cnot e g
cnot g h
cnot c g
cnot b g
cnot f a
cnot a g
cnot a h
cnot b f
cnot b c
X c
H c
T c
cnot b c
T c
cnot g c
T c
cnot b c
T c
cnot g c
H c
S* b
cnot g b
T* b
cnot f h
cnot e h
cnot a h
T* h
cnot e b
cnot g b
cnot f h
cnot e h
cnot a h
cnot b c
H e
T e
cnot b e
T e
cnot f e
T* e
cnot b e
T* e
cnot f e
H e
T f
cnot b f
T f
cnot h f
cnot a f
S* f
cnot h f
cnot a b
cnot b f
cnot a e
cnot a c
H f
T f
cnot g f
T f
cnot h f
T f
cnot g f
T f
cnot h f
H f
T* h
cnot g h
T* h
cnot g h
X h
H h
S 1
cnot b 1
T* 1
cnot c 1
T 1
cnot b 1
T* 1
cnot c 1
H 1
S 0
cnot 1 0
T* 0
cnot d 0
T* 0
cnot 1 0
T 0
cnot d 0
H 0
T* a
cnot f a
T a
cnot h a
T* a
cnot f a
T a
cnot b a
cnot h a
T* a
cnot g a
T a
cnot g a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot e a
T* a
cnot 0 a
T a
cnot e a
H a
S h
cnot a h
T* h
cnot f h
T h
cnot a h
S* h
cnot f h
H h
S f
cnot a f
T* f
cnot a f
H f
T f
cnot g f
T f
cnot h f
T* f
cnot g f
T* f
cnot h f
H f
T g
Z g
cnot h g
T g
cnot h g
X g
H g
S a
cnot f a
T* a
cnot g a
T a
cnot f a
T* a
cnot g a
H a
T a
cnot 0 a
T* a
cnot e a
T* a
cnot 0 a
T a
cnot e a
H a
S 0
cnot e 0
S 0
cnot e 0
H 0
S 1
cnot 0 1
T* 1
cnot d 1
T* 1
cnot 0 1
S 1
cnot d 1
H 1
S g
cnot a g
T* g
cnot f g
T g
cnot a g
S* g
cnot f g
H g
S* e
cnot b c
cnot a b
cnot a e
X e
H e
T e
cnot b e
T* e
cnot f e
T e
cnot b e
T* e
cnot f e
H e
S* c
cnot 1 c
T c
cnot b c
cnot a c
T* c
cnot 1 c
S c
cnot e b
cnot e c
cnot b c
cnot a c
H c
T c
cnot b c
T* c
cnot g c
T c
cnot b c
T* c
cnot g c
H c
T a
cnot e a
cnot b a
S a
T* f
Z f
cnot e f
cnot b f
T* f
cnot a 1
T* 1
cnot a 1
cnot f a
cnot b a
cnot c b
cnot g f
cnot h f
cnot e f
cnot e h
cnot e g
cnot c g
cnot c f
cnot a h
cnot a g
H f
S f
cnot b f
T* f
cnot h f
T f
cnot b f
S* f
cnot c f
T f
cnot h f
T* f
cnot c f
H f
S* d
cnot 0 d
T d
cnot 0 d
H d
T d
cnot g d
T* d
cnot h d
T d
cnot g d
T* d
cnot h d
H d
T c
cnot b c
T c
cnot a c
T* c
cnot h c
cnot b c
cnot a c
T* c
cnot h e
cnot a e
T e
cnot h g
T* g
cnot e g
cnot b g
T* g
cnot h e
cnot e g
cnot d h
cnot h c
cnot c f
cnot c e
cnot b g
cnot a e
H c
T c
cnot b c
T* c
cnot h c
T c
cnot b c
T* c
cnot h c
H c
T h
cnot b h
T* h
cnot d h
T* h
cnot b h
T* h
Z h
cnot d h
cnot c f
cnot c e
H h
T h
cnot b h
T* h
cnot c h
T h
cnot b h
T* h
cnot c h
H h
cnot d e
cnot c e
cnot b e
T e
T g
cnot e g
cnot b g
cnot a g
T g
cnot e g
cnot d e
cnot c e
cnot b e
cnot a e
cnot b g
H a
T a
cnot c a
T* a
cnot h a
T a
cnot c a
T* a
cnot h a
H a
S c
cnot b c
T* c
cnot h c
cnot b c
T* c
cnot h c
cnot a g
cnot a e
H c
T c
cnot e c
T* c
cnot h c
T c
cnot e c
T* c
cnot h c
H c
T* b
Z b
T e
S h
cnot a b
cnot a h
cnot a e
H a
T a
cnot b a
T* a
cnot e a
T a
cnot b a
T* a
cnot e a
H a
cnot g c
cnot e c
cnot e d
cnot g f
cnot h f
cnot f h
swap f g
cnot h e
cnot e h
cnot d g
cnot c d
cnot g h
cnot c f
cnot e b
cnot h a
H a
T a
cnot e a
T* a
cnot f a
T* a
cnot e a
T a
cnot f a
H a
T* f
cnot e f
T f
cnot d a
cnot g f
cnot h f
cnot e f
cnot d g
cnot d e
cnot a g
cnot a e
X f
H f
T f
cnot d f
T f
cnot h f
T f
cnot d f
T f
cnot h f
H f
T* d
cnot e d
cnot a d
T d
cnot b d
T d
cnot h d
cnot e d
cnot b d
cnot a d
T* d
cnot g d
cnot a d
T d
cnot g d
cnot h d
cnot d c
cnot a d
cnot a c
X d
H d
S d
cnot b d
T d
cnot h d
T d
cnot b d
S d
cnot g d
T d
cnot h d
T d
cnot g d
H d
T* b
T* g
cnot b h
T* h
cnot g h
cnot b h
T* h
cnot c b
cnot f g
cnot e g
cnot g h
cnot d g
cnot c g
cnot d h
cnot d f
cnot f a
cnot a h
cnot a g
cnot b f
H c
T c
cnot b c
T c
cnot g c
T* c
cnot b c
T* c
cnot g c
H c
T* b
cnot g b
T b
cnot f b
cnot a b
T* b
cnot e b
cnot f b
cnot g b
cnot a b
cnot b c
H e
T e
cnot b e
T e
cnot f e
T e
cnot b e
T e
cnot f e
H e
T* f
cnot b f
T* f
cnot h f
cnot a f
T f
Z f
cnot h f
cnot a b
cnot b f
cnot a e
cnot a c
X f
H f
T f
cnot g f
T* f
cnot h f
T f
cnot g f
T* f
cnot h f
H f
T h
cnot g h
T* h
cnot b h
cnot a h
T* h
cnot g h
cnot b h
cnot a h
H h
S 1
cnot b 1
T* 1
cnot c 1
T 1
cnot b 1
T* 1
cnot c 1
H 1
S 0
cnot 1 0
T* 0
cnot d 0
T* 0
cnot 1 0
T 0
cnot d 0
H 0
T* a
cnot f a
T a
cnot h a
T* a
cnot f a
T a
cnot b a
cnot h a
T* a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot e a
T* a
cnot 0 a
T a
cnot e a
H a
S h
cnot a h
T* h
cnot f h
T h
cnot a h
S* h
cnot f h
H h
S f
cnot a f
T* f
cnot a f
H f
T f
cnot g f
T* f
cnot h f
T f
cnot g f
T* f
cnot h f
H f
T* g
Z g
cnot h g
T* g
cnot h g
H g
S a
cnot f a
T* a
cnot g a
T a
cnot f a
T* a
cnot g a
H a
T a
cnot 0 a
T* a
cnot e a
T* a
cnot 0 a
T a
cnot e a
H a
S 0
cnot e 0
S 0
cnot e 0
H 0
S 1
cnot 0 1
T* 1
cnot d 1
T* 1
cnot 0 1
S 1
cnot d 1
H 1
S g
cnot a g
T* g
cnot f g
T g
cnot a g
S* g
cnot f g
H g
S* e
cnot b c
cnot a b
cnot a e
X e
H e
T e
cnot b e
T* e
cnot f e
T e
cnot b e
T* e
cnot f e
H e
S* c
cnot 1 c
T c
cnot b c
cnot a c
T* c
cnot 1 c
S c
cnot e b
cnot e c
cnot b c
cnot a c
H c
T c
cnot b c
T* c
cnot g c
T c
cnot b c
T* c
cnot g c
H c
T a
cnot e a
cnot b a
S a
T* f
Z f
cnot e f
cnot b f
T* f
cnot a 1
T* 1
cnot a 1
cnot f a
cnot b a
cnot c b
cnot g f
cnot h f
cnot e f
cnot e h
cnot e g
cnot c g
cnot c f
cnot a h
cnot a g
H f
S f
cnot b f
T* f
cnot h f
T f
cnot b f
S* f
cnot c f
T f
cnot h f
T* f
cnot c f
H f
S* d
cnot 0 d
T d
cnot d f
cnot 0 f
cnot 0 d
H d
T d
cnot g d
T* d
cnot h d
T d
cnot g d
T* d
cnot h d
H d
cnot d f
H d
T d
cnot b d
T* d
cnot h d
T d
cnot b d
T* d
cnot h d
H d
cnot d a
cnot d b
cnot d c
cnot d f
H f
T f
cnot c f
T* f
cnot h f
T f
cnot c f
T* f
cnot h f
H f
cnot c e
cnot b e
T e
T g
cnot e g
cnot a g
cnot b g
T g
cnot c g
cnot b g
T* g
cnot c d
T d
cnot b d
cnot a d
T* d
cnot g h
cnot e h
cnot c h
cnot a h
T* h
cnot g h
cnot e h
cnot e g
cnot d e
cnot c d
cnot c h
cnot c g
cnot b d
cnot a d
cnot a h
cnot a f
cnot d e
H a
T a
cnot e a
T* a
cnot f a
T a
cnot e a
T* a
cnot f a
H a
cnot c b
T b
cnot d b
cnot c b
S b
T h
Z h
cnot c h
T* h
cnot d h
T* h
T e
T f
cnot d a
cnot f b
cnot h a
cnot e c
cnot h e
swap g h
swap e h
cnot f g
cnot g d
swap d h
swap c d
cnot d f
cnot a b
cnot a e
H d
T d
cnot c d
T d
cnot h d
T* d
cnot c d
T* d
cnot h d
H d
cnot f g
T g
T* c
cnot h c
T c
cnot g c
cnot b c
cnot a c
S* c
cnot f c
cnot h c
cnot b c
cnot a c
T* c
cnot d b
cnot d c
cnot f g
cnot d f
cnot g c
cnot c f
H d
T d
cnot b d
T d
cnot h d
T* d
cnot b d
T* d
cnot h d
H d
S h
cnot b h
T h
cnot b h
H h
T h
cnot c h
T h
cnot e h
T h
cnot c h
T h
cnot e h
H h
T* c
T* e
cnot c e
X c
H c
T c
cnot g c
T* c
cnot h c
T c
cnot g c
T* c
cnot h c
H c
cnot f g
T g
cnot c b
cnot h f
cnot h g
cnot f g
cnot e g
cnot c f
cnot c e
H f
T f
cnot b f
T f
cnot h f
T* f
cnot b f
T* f
cnot h f
H f
cnot b c
T* c
cnot e c
cnot b c
T* c
cnot g c
T c
cnot h c
T* c
cnot f a
cnot e c
cnot g c
cnot h c
cnot f h
cnot e h
cnot f g
cnot a h
cnot a g
cnot b f
H c
T c
cnot b c
T c
cnot g c
T* c
cnot b c
T* c
cnot g c
H c
S* b
cnot g b
T b
cnot f h
cnot e h
cnot a h
T h
cnot e b
cnot g b
cnot f h
cnot e h
cnot a h
cnot b c
H e
T e
cnot b e
T e
cnot f e
T e
cnot b e
T e
cnot f e
H e
T* f
cnot b f
T* f
cnot h f
cnot a f
S f
cnot h f
cnot a b
cnot b f
cnot a e
cnot a c
X f
H f
T f
cnot g f
T* f
cnot h f
T f
cnot g f
T* f
cnot h f
H f
T h
cnot g h
T* h
cnot g h
H h
S 1
cnot b 1
T 1
cnot c 1
T 1
cnot b 1
T 1
cnot c 1
H 1
S 0
cnot 1 0
T* 0
cnot d 0
T* 0
cnot 1 0
T 0
cnot d 0
H 0
T a
cnot f a
T* a
cnot h a
T a
cnot f a
T* a
cnot b a
cnot h a
T* a
cnot b a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S h
cnot a h
T* h
cnot f h
T h
cnot a h
S* h
cnot f h
H h
S f
cnot a f
T* f
cnot a f
H f
T f
cnot g f
T* f
cnot h f
T f
cnot g f
T* f
cnot h f
H f
T* g
Z g
cnot h g
T* g
cnot h g
H g
S a
cnot f a
T* a
cnot g a
T a
cnot f a
T* a
cnot g a
H a
T a
cnot 0 a
T* a
cnot e a
T a
cnot 0 a
T* a
cnot e a
H a
S 0
cnot e 0
S* 0
cnot e 0
H 0
S 1
cnot 0 1
T* 1
cnot d 1
T* 1
cnot 0 1
S 1
cnot d 1
H 1
S g
cnot a g
T* g
cnot f g
T g
cnot a g
S* g
cnot f g
H g
S e
cnot b c
cnot a b
cnot a e
H e
T e
cnot b e
T e
cnot f e
T* e
cnot b e
T* e
cnot f e
H e
S* c
cnot 1 c
T c
cnot b c
cnot a c
T c
cnot 1 c
S* c
cnot e b
cnot e c
cnot b c
cnot a c
H c
T c
cnot b c
T c
cnot g c
T* c
cnot b c
T* c
cnot g c
H c
T a
cnot e a
cnot b a
S* a
T* f
Z f
cnot e f
cnot b f
T f
cnot a 1
T 1
cnot a 1
cnot f a
cnot b a
cnot c b
cnot h f
cnot e h
cnot e g
cnot c g
cnot a h
cnot a g
cnot a f
H f
S f
cnot b f
T f
cnot h f
T f
cnot b f
S f
cnot c f
T* f
cnot h f
T* f
cnot c f
H f
T c
cnot b c
T* c
cnot a c
T* c
cnot h c
cnot b c
cnot a c
T c
cnot h e
cnot a e
T e
cnot h g
T* g
cnot e g
cnot b g
T g
cnot h c
cnot h e
cnot e g
cnot c f
cnot c e
cnot b g
cnot a e
H c
T c
cnot g c
T c
cnot h c
T c
cnot g c
T c
cnot h c
H c
T h
Z h
cnot b h
T* h
cnot c f
cnot c e
cnot b h
X h
H h
T h
cnot c h
T* h
cnot e h
T h
cnot c h
T* h
cnot e h
H h
S* d
cnot 0 d
T d
cnot 0 d
H d
T d
cnot b d
T d
cnot h d
T* d
cnot b d
T* d
cnot h d
H d
S* b
T c
cnot c e
T* e
cnot e g
cnot a g
T g
cnot b h
T h
cnot d b
cnot d c
cnot e g
cnot d e
cnot c e
cnot d h
cnot d f
cnot b h
cnot a g
H d
T d
cnot c d
T* d
cnot h d
T d
cnot c d
T* d
cnot h d
H d
T c
cnot e c
cnot b c
T* c
S h
cnot d b
cnot h b
cnot f c
cnot g f
cnot g h
cnot f h
cnot h e
swap e g
cnot g d
cnot d h
cnot d g
swap d e
cnot c h
cnot c f
cnot c d
cnot f b
cnot b h
cnot b f
cnot b e
swap b c
cnot b a
swap a g
H f
T f
cnot b f
T* f
cnot d f
T* f
cnot b f
T f
cnot d f
H f
T* d
cnot h d
T* d
cnot f b
cnot f h
cnot h d
X d
H d
T d
cnot c d
T d
cnot g d
T d
cnot c d
T d
cnot g d
H d
cnot b f
T f
T* g
cnot c g
T* g
cnot c g
cnot b h
cnot b g
cnot b f
H b
T b
cnot c b
T b
cnot d b
T* b
cnot c b
T* b
cnot d b
H b
cnot f d
cnot g d
cnot h g
cnot g h
cnot g f
swap f g
cnot g h
cnot h c
cnot c d
cnot f b
cnot b h
cnot g a
cnot a h
cnot a f
cnot b d
cnot b c
X g
H g
T g
cnot f g
T g
cnot h g
T g
cnot f g
T g
cnot h g
H g
T* f
cnot c f
cnot b f
T f
cnot h f
cnot c f
cnot b f
T* f
cnot d f
cnot c f
cnot b f
T f
cnot a f
cnot h f
cnot c f
T f
cnot d f
cnot b f
cnot a f
X f
H f
T f
cnot b f
T f
cnot g f
T* f
cnot b f
T* f
cnot g f
H f
T* h
cnot c h
cnot a h
S* h
cnot c h
cnot a h
X h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
T c
cnot g c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
T 1
cnot f 1
T 1
cnot e 1
T 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T a
cnot c a
T* a
cnot d a
T* a
cnot c a
T a
cnot g a
S a
cnot b a
T a
cnot d a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T* c
cnot a c
S c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* b
X b
H b
T 0
cnot b 0
T* 0
cnot d 0
T* 0
cnot b 0
T 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T* b
cnot 0 b
S b
cnot d b
H b
T 0
cnot d 0
T 0
cnot d 0
H 0
S* h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S* f
cnot 1 f
T f
cnot e f
T f
cnot 1 f
S* f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
T b
T c
Z c
cnot 0 c
T* c
cnot a c
T c
cnot 0 c
S* c
cnot a d
Z d
T h
cnot h f
T* f
cnot g a
cnot h b
cnot g d
cnot h c
cnot h f
cnot h g
cnot f g
cnot c d
cnot d h
cnot g b
cnot b d
cnot a b
cnot d h
cnot b g
H b
T b
cnot c b
T* b
cnot d b
T* b
cnot c b
T b
cnot d b
H b
T* d
cnot c d
T d
cnot c d
cnot b h
cnot b g
X d
H d
T d
cnot c d
T* d
cnot g d
T d
cnot c d
T* d
cnot g d
H d
T f
cnot f b
cnot f d
cnot f h
cnot a b
cnot a h
cnot a f
cnot a d
H f
T f
cnot b f
T* f
cnot d f
T f
cnot b f
T* f
cnot d f
H f
T b
cnot g h
T h
cnot a h
S h
cnot 0 h
T* h
cnot b d
T* d
cnot h a
cnot g c
cnot g d
cnot h f
cnot h g
cnot g h
cnot f g
cnot e g
cnot e h
cnot f d
swap d f
cnot f b
cnot b f
swap b d
cnot c a
cnot a f
swap a b
cnot b h
cnot f g
cnot b e
cnot b c
cnot 0 h
cnot 0 g
cnot 0 f
cnot 0 e
cnot 0 d
cnot 0 c
cnot 0 b
cnot 0 a
H f
T f
cnot c f
T* f
cnot d f
T* f
cnot c f
T f
cnot d f
H f
cnot b c
T* c
T* d
cnot c d
T* d
cnot b d
T d
cnot e h
S h
cnot c h
S h
cnot e a
cnot e b
cnot e d
cnot f c
cnot e f
cnot e h
cnot c d
cnot c h
cnot b d
cnot b c
X e
H e
T e
cnot c e
T e
cnot d e
T e
cnot c e
T e
cnot d e
H e
cnot f d
cnot h d
cnot h g
cnot g f
swap f g
cnot g h
cnot h c
cnot c d
cnot f b
cnot g a
cnot a h
cnot a f
cnot b d
X g
H g
T g
cnot f g
T* g
cnot h g
T* g
cnot f g
T g
cnot h g
H g
T f
cnot b f
cnot a f
S* f
cnot 1 f
T f
cnot d f
cnot 1 f
T* f
cnot c f
cnot a f
T f
cnot h f
T* f
cnot h f
cnot d f
cnot c f
cnot b f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
T* h
cnot c h
cnot a h
T* h
cnot c h
cnot a h
X h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
T c
cnot g c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
T 1
cnot f 1
T* 1
cnot e 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T a
cnot c a
T* a
cnot d a
T a
cnot g a
cnot c a
S a
cnot b a
T* a
cnot d a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T c
cnot a c
S* c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T b
H b
T 0
cnot b 0
T* 0
cnot d 0
T 0
cnot b 0
T* 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T* a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T* 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T b
cnot 0 b
S* b
cnot d b
H b
T 0
cnot d 0
T* 0
cnot d 0
H 0
S h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S f
cnot 1 f
T* f
cnot e f
T* f
cnot 1 f
S f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
S* e
cnot 1 e
T e
cnot f b
cnot g a
cnot g b
cnot g c
cnot h c
cnot h g
cnot f g
cnot c d
cnot b d
cnot a b
cnot a h
cnot a f
cnot a c
cnot 1 e
H e
T e
cnot c e
T* e
cnot d e
T e
cnot c e
T* e
cnot d e
H e
T c
T d
cnot a f
T f
cnot a h
T h
cnot h g
cnot b g
cnot a g
T g
cnot e a
cnot e b
cnot e c
cnot f c
cnot f d
cnot h g
cnot f h
cnot e g
cnot b g
cnot a g
cnot a f
cnot a d
cnot a c
H f
T f
cnot c f
T* f
cnot d f
T f
cnot c f
T* f
cnot d f
H f
T d
T* h
cnot g h
cnot a h
S h
cnot 0 h
T* h
cnot d c
T* c
cnot g e
cnot d e
cnot c e
T e
Z e
cnot 0 e
T* e
cnot c b
cnot g f
cnot h b
cnot f a
cnot f b
cnot g c
cnot d c
cnot h d
cnot h g
cnot f h
cnot f e
cnot e h
cnot e g
swap d f
cnot h c
cnot c h
cnot f g
cnot c d
cnot b g
swap b d
cnot a g
cnot d f
cnot a c
cnot a b
cnot 0 e
cnot 0 d
X e
H e
T e
cnot c e
T* e
cnot d e
T e
cnot c e
T* e
cnot d e
H e
cnot f d
cnot h d
cnot h g
cnot g f
swap f g
cnot g h
cnot h c
cnot c d
cnot f b
cnot g a
cnot a h
cnot a f
cnot b d
H g
T g
cnot f g
T g
cnot h g
T* g
cnot f g
T* g
cnot h g
H g
T* f
cnot d f
cnot b f
cnot a f
T* f
cnot h f
cnot b f
T* f
cnot d f
cnot a f
T f
cnot b f
T f
cnot c f
cnot d f
T f
cnot h f
cnot d f
cnot c f
cnot b f
X f
H f
T f
cnot b f
T f
cnot g f
T* f
cnot b f
T* f
cnot g f
H f
T h
cnot c h
cnot a h
T h
cnot c h
cnot a h
H h
T h
cnot c h
T h
cnot g h
T* h
cnot c h
T* h
cnot g h
H h
T* c
cnot a c
S* c
cnot 0 c
T c
cnot g c
cnot a c
cnot 0 c
T c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
X c
H c
S 1
cnot e 1
T 1
cnot f 1
T 1
cnot e 1
T 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
cnot c a
T a
cnot d a
T* a
cnot c a
T a
Z a
cnot g a
S a
cnot b a
T a
cnot d a
cnot g a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T c
cnot a c
S* c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* b
X b
H b
T 0
cnot b 0
T* 0
cnot d 0
T 0
cnot b 0
T* 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T* a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T b
cnot 0 b
S* b
cnot d b
H b
T 0
cnot d 0
T* 0
cnot d 0
H 0
S* h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
X h
H h
T h
cnot c h
T* h
cnot g h
T* h
cnot c h
T h
cnot g h
H h
cnot d f
S* f
cnot 1 f
T f
cnot e f
T f
cnot 1 f
S* f
cnot e f
cnot d f
X f
H f
T f
cnot b f
T* f
cnot g f
T* f
cnot b f
T f
cnot g f
H f
S* g
cnot b g
T g
cnot c g
cnot b g
T g
cnot d g
cnot c g
Z g
cnot d g
X g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
S* e
cnot 1 e
T e
cnot f b
cnot g a
cnot g b
cnot g c
cnot h c
cnot h g
cnot f g
cnot c d
cnot b d
cnot a b
cnot a h
cnot a f
cnot a c
cnot 1 e
H e
T e
cnot c e
T* e
cnot d e
T e
cnot c e
T* e
cnot d e
H e
cnot f a
T a
cnot h a
cnot f a
T a
cnot c a
S* a
cnot 0 a
T a
cnot f g
cnot c g
T g
Z g
cnot 0 g
T* g
cnot g d
cnot c d
cnot b d
cnot a d
Z d
cnot c a
cnot e b
cnot f b
cnot g a
cnot e d
cnot f c
cnot g c
cnot h d
cnot h f
cnot h g
cnot g h
swap f h
cnot g e
swap e g
swap c e
cnot e g
swap b g
cnot a g
swap a c
cnot g h
cnot c f
cnot c e
cnot c d
cnot 0 f
cnot 0 e
cnot 0 a
H f
T f
cnot b f
T* f
cnot d f
T* f
cnot b f
T f
cnot d f
H f
T* d
cnot b d
T d
cnot g d
cnot e d
cnot b d
cnot a d
T* d
cnot h d
cnot g d
cnot e d
cnot c d
cnot a d
T d
cnot f a
cnot f b
cnot f d
cnot h d
cnot c d
X d
H d
T d
cnot c d
T d
cnot g d
T d
cnot c d
T d
cnot g d
H d
cnot b f
T f
T* g
cnot c g
T* g
cnot c g
cnot b h
cnot b g
cnot b f
H b
T b
cnot c b
T b
cnot d b
T* b
cnot c b
T* b
cnot d b
H b
cnot f d
cnot g d
cnot h g
cnot g h
cnot g f
swap f g
cnot g h
cnot h c
cnot c d
cnot f b
cnot b h
cnot g a
cnot a h
cnot a f
cnot b d
cnot b c
X g
H g
T g
cnot f g
T g
cnot h g
T g
cnot f g
T g
cnot h g
H g
T* f
cnot a f
T* f
cnot c f
cnot b f
cnot a f
T f
cnot d f
cnot c f
cnot a f
T f
cnot h f
cnot a f
cnot c f
T f
cnot d f
cnot c f
cnot b f
T* f
cnot h f
X f
H f
T f
cnot b f
T f
cnot g f
T* f
cnot b f
T* f
cnot g f
H f
T* h
cnot c h
cnot a h
S* h
cnot e h
cnot a h
T h
cnot e h
cnot c h
X h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
T c
cnot g c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
T 1
cnot f 1
T 1
cnot e 1
T 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot e 0
cnot g 0
cnot a 0
T* 0
cnot a 0
cnot e 0
H 0
T a
cnot c a
T* a
cnot d a
T* a
cnot c a
T a
cnot g a
S a
cnot b a
T a
cnot e a
cnot g a
cnot d a
cnot b a
S a
cnot e a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T* c
cnot a c
S c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* b
X b
H b
T 0
cnot b 0
T* 0
cnot d 0
T* 0
cnot b 0
T 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T* b
cnot 0 b
S b
cnot d b
H b
T 0
cnot d 0
T 0
cnot d 0
H 0
S* h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S* f
cnot 1 f
T f
cnot e f
T f
cnot 1 f
S* f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
T b
T c
Z c
cnot 0 c
T* c
cnot a c
T c
cnot 0 c
S* c
cnot a d
Z d
T h
cnot h f
T* f
cnot g a
cnot h b
cnot g d
cnot h c
cnot h f
cnot h g
cnot f g
cnot c d
cnot d h
cnot g b
cnot b d
cnot a b
cnot d h
cnot b g
cnot a f
H b
T b
cnot c b
T* b
cnot d b
T* b
cnot c b
T b
cnot d b
H b
T* d
cnot c d
T d
cnot c d
cnot b h
cnot b g
X d
H d
T d
cnot c d
T* d
cnot g d
T d
cnot c d
T* d
cnot g d
H d
cnot f a
cnot f b
cnot f d
H f
T f
cnot b f
T* f
cnot d f
T f
cnot b f
T* f
cnot d f
H f
T a
S* e
cnot 1 e
T e
T b
S c
cnot b d
T* d
cnot c g
T* g
cnot c a
cnot c b
cnot h c
cnot g d
cnot h e
cnot h g
swap g h
cnot c h
cnot c g
cnot c f
cnot b h
cnot b f
cnot b e
cnot b c
cnot h a
cnot a h
cnot a e
cnot a d
swap a c
cnot 1 e
X g
H g
T g
cnot b g
T g
cnot d g
T g
cnot b g
T g
cnot d g
H g
T* b
cnot a c
S c
cnot 0 c
T* c
T* d
cnot g b
cnot h a
cnot h b
cnot f d
cnot g d
cnot h c
cnot h f
swap f h
cnot a c
cnot 0 c
H f
T f
cnot c f
T* f
cnot d f
T* f
cnot c f
T f
cnot d f
H f
cnot c g
cnot b g
T g
cnot h g
cnot d g
cnot c g
cnot b g
T g
cnot h d
cnot h g
cnot g f
cnot f h
cnot d h
cnot d g
cnot d f
cnot h c
cnot c d
cnot f b
cnot b d
cnot f a
cnot a h
cnot a f
H g
T g
cnot f g
T g
cnot h g
T g
cnot f g
T g
cnot h g
H g
T* f
cnot d f
cnot a f
cnot b f
T f
cnot c f
cnot b f
T* f
cnot h f
cnot a f
cnot b f
T* f
cnot d f
cnot c f
cnot b f
T* f
cnot h f
X f
H f
T f
cnot b f
T f
cnot g f
T* f
cnot b f
T* f
cnot g f
H f
T* h
cnot c h
cnot a h
T h
cnot c h
cnot a h
X h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
T c
cnot g c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
T 1
cnot f 1
T* 1
cnot e 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
cnot c a
T a
cnot d a
T a
cnot c a
T* a
cnot g a
S a
cnot b a
T a
cnot d a
cnot g a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T* c
cnot a c
S c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* b
X b
H b
T 0
cnot b 0
T* 0
cnot d 0
T* 0
cnot b 0
T 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T* 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T* b
cnot 0 b
S b
cnot d b
H b
T 0
cnot d 0
T 0
cnot d 0
H 0
S h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
X h
H h
T h
cnot c h
T* h
cnot g h
T* h
cnot c h
T h
cnot g h
H h
cnot d f
S f
cnot 1 f
T* f
cnot e f
T* f
cnot 1 f
S f
cnot e f
cnot d f
X f
H f
T f
cnot b f
T* f
cnot g f
T* f
cnot b f
T f
cnot g f
H f
S* g
cnot b g
T g
cnot c g
cnot b g
T g
cnot d g
cnot c g
Z g
cnot d g
X g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
S a
cnot 0 a
T* a
T c
Z c
cnot 0 c
T* c
T b
cnot a d
cnot 0 d
Z d
cnot g b
cnot h a
cnot b a
cnot c b
cnot f c
cnot g c
cnot d c
cnot h d
cnot h g
cnot f h
cnot f g
swap d f
cnot c f
swap c d
swap b c
cnot a c
swap a b
cnot c f
cnot b d
cnot 0 f
cnot 0 b
H f
T f
cnot c f
T* f
cnot d f
T* f
cnot c f
T f
cnot d f
H f
T* d
cnot c d
T d
cnot f a
cnot f b
cnot g d
cnot h f
cnot f h
cnot f d
cnot c d
H g
T g
cnot b g
T* g
cnot d g
T* g
cnot b g
T g
cnot d g
H g
T b
T* d
cnot c b
cnot d b
cnot g b
cnot e d
cnot f c
cnot f d
cnot g e
cnot f e
cnot h f
swap f g
swap e g
swap d f
swap c d
cnot d h
cnot d e
cnot b f
swap b d
cnot e a
cnot a d
cnot a g
cnot a b
X f
H f
T f
cnot c f
T f
cnot d f
T f
cnot c f
T f
cnot d f
H f
cnot h d
cnot f e
cnot h g
cnot g f
cnot f h
cnot h c
cnot c d
cnot g b
cnot f a
cnot a h
cnot a f
cnot b d
X g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
T f
cnot e f
cnot b f
cnot a f
S* f
cnot h f
T f
cnot e f
cnot b f
cnot a f
T* f
cnot d f
cnot e f
T f
cnot h f
cnot e f
cnot b f
cnot a f
T* f
cnot 0 f
cnot e f
cnot d f
T f
cnot c f
cnot h f
cnot e f
cnot d f
cnot a f
cnot 0 f
T* f
cnot h f
cnot d f
cnot c f
cnot b f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S h
cnot c h
cnot a h
T* h
cnot e h
cnot a h
S* h
cnot 1 h
T h
cnot b h
cnot c h
cnot a h
cnot 1 h
T h
cnot e h
cnot b h
cnot a h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
T c
cnot g c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
T 1
cnot f 1
T 1
cnot e 1
T 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
cnot c a
T a
cnot d a
T* a
cnot c a
T a
cnot g a
S a
cnot b a
T* a
cnot e a
cnot g a
cnot d a
T* a
cnot e a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T c
cnot a c
S* c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T b
H b
T 0
cnot b 0
T* 0
cnot d 0
T 0
cnot b 0
T* 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T* a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T b
cnot 0 b
S* b
cnot d b
H b
T 0
cnot d 0
T* 0
cnot d 0
H 0
S* h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
X h
H h
T h
cnot c h
T* h
cnot g h
T* h
cnot c h
T h
cnot g h
H h
cnot d f
S* f
cnot 1 f
T f
cnot e f
T f
cnot 1 f
S* f
cnot e f
cnot d f
X f
H f
T f
cnot b f
T* f
cnot g f
T* f
cnot b f
T f
cnot g f
H f
S* g
cnot b g
T g
cnot c g
cnot b g
T g
cnot d g
cnot c g
Z g
cnot d g
X g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
S a
cnot 0 a
T* a
T c
Z c
cnot 0 c
T* c
S* e
cnot e 1
T 1
cnot e 1
cnot c a
cnot g b
cnot h a
cnot d c
cnot e d
cnot h g
swap e f
cnot e h
cnot e g
swap d e
cnot g c
cnot c e
swap c d
cnot e f
swap a c
cnot c f
cnot c e
cnot b d
cnot 0 f
cnot 0 e
cnot 0 d
H f
T f
cnot c f
T* f
cnot d f
T f
cnot c f
T* f
cnot d f
H f
T a
T c
T* h
cnot c h
cnot a h
S* h
cnot h 0
T 0
cnot c d
T* d
cnot h 0
cnot c a
cnot f b
cnot e c
cnot f d
cnot g c
cnot h f
cnot g h
cnot h e
cnot e f
cnot e h
cnot e g
cnot g d
swap c e
cnot e f
cnot c b
cnot b e
swap b c
cnot a e
swap a c
cnot c h
cnot e g
X h
H h
T h
cnot c h
T h
cnot d h
T h
cnot c h
T h
cnot d h
H h
T* c
cnot d c
T* c
cnot e c
cnot b c
Z c
cnot a c
cnot d c
T c
cnot f a
cnot e c
cnot f d
cnot h c
cnot h d
cnot h g
cnot f g
cnot b c
cnot a c
X c
H c
T c
cnot b c
T* c
cnot h c
T c
cnot b c
T* c
cnot h c
H c
cnot d f
cnot g f
cnot e f
T f
cnot h f
cnot g f
cnot e f
T* f
cnot h f
cnot d f
X d
H d
T d
cnot b d
T* d
cnot h d
T d
cnot b d
T* d
cnot h d
H d
S h
cnot b h
S* h
cnot g h
T h
cnot g h
cnot f h
cnot b h
H f
T f
cnot c f
T* f
cnot d f
T f
cnot c f
T* f
cnot d f
H f
cnot h d
cnot h g
cnot g f
cnot f h
cnot h c
cnot c d
cnot f b
cnot g a
cnot a h
cnot a f
cnot b d
H g
T g
cnot f g
T g
cnot h g
T g
cnot f g
T g
cnot h g
H g
T* f
cnot b f
cnot a f
S f
cnot d f
T* f
cnot h f
cnot d f
cnot b f
cnot a f
T* f
cnot c f
cnot d f
cnot b f
T f
cnot h f
cnot d f
cnot c f
cnot b f
X f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
T* h
cnot c h
cnot a h
T h
cnot c h
cnot a h
X h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
T c
cnot g c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
T* 1
cnot f 1
T 1
cnot e 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
cnot c a
T a
cnot d a
T a
cnot c a
T* a
cnot g a
S a
cnot b a
T* a
cnot d a
cnot g a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T* c
cnot a c
S c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T b
H b
T 0
cnot b 0
T* 0
cnot d 0
T* 0
cnot b 0
T 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T* 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T* b
cnot 0 b
S b
cnot d b
H b
T 0
cnot d 0
T 0
cnot d 0
H 0
S h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
X h
H h
T h
cnot c h
T* h
cnot g h
T* h
cnot c h
T h
cnot g h
H h
cnot d f
S f
cnot 1 f
T* f
cnot e f
T f
cnot 1 f
S* f
cnot e f
cnot d f
X f
H f
T f
cnot b f
T* f
cnot g f
T* f
cnot b f
T f
cnot g f
H f
S* g
cnot b g
T g
cnot c g
cnot b g
T g
cnot d g
cnot c g
Z g
cnot d g
X g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
T b
T c
Z c
cnot 0 c
T* c
cnot a c
T c
cnot 0 c
S* c
T f
T h
cnot f b
cnot g a
cnot g b
cnot h c
cnot h g
cnot f h
cnot f g
cnot c d
cnot a b
cnot a f
cnot b d
H f
T f
cnot c f
T* f
cnot d f
T* f
cnot c f
T f
cnot d f
H f
T c
T* d
cnot h g
cnot f h
cnot h d
cnot h c
cnot c d
H c
T c
cnot b c
T* c
cnot h c
T c
cnot b c
T* c
cnot h c
H c
T h
cnot b h
T* h
cnot f h
cnot b h
T* h
cnot f a
cnot f c
cnot f e
cnot f h
cnot e f
cnot c d
H h
T h
cnot c h
T* h
cnot d h
T* h
cnot c h
T h
cnot d h
H h
T* d
cnot c d
S d
cnot g d
cnot f d
cnot e d
cnot b d
cnot a d
Z d
cnot e a
cnot h b
cnot g c
cnot h c
cnot d c
cnot f d
cnot g e
cnot f e
cnot e f
cnot e g
swap d e
cnot c e
swap c d
cnot e h
cnot e g
cnot e f
cnot b c
cnot g a
cnot a b
cnot b h
cnot b f
cnot c e
cnot a d
X d
H d
T d
cnot c d
T d
cnot g d
T* d
cnot c d
T* d
cnot g d
H d
cnot a f
cnot b f
S f
cnot 0 f
T* f
cnot e f
cnot b f
cnot 0 f
S f
cnot 1 f
T* f
T g
cnot g c
T c
cnot g c
cnot e f
cnot f g
cnot a g
cnot a f
cnot 1 g
cnot 1 f
X f
H f
T f
cnot c f
T f
cnot d f
T* f
cnot c f
T* f
cnot d f
H f
cnot g h
T h
cnot h a
cnot h b
cnot g c
cnot g d
cnot h f
swap g h
cnot f d
cnot c d
cnot a h
cnot a f
cnot b d
X g
H g
T g
cnot f g
T g
cnot h g
T g
cnot f g
T g
cnot h g
H g
T* f
cnot d f
cnot b f
cnot a f
T f
cnot h f
cnot d f
cnot b f
cnot a f
T* f
cnot c f
cnot d f
cnot b f
T f
cnot h f
cnot d f
cnot c f
cnot b f
X f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
T* h
cnot c h
cnot a h
S* h
cnot c h
cnot a h
X h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
T c
cnot e c
cnot a c
T c
cnot g c
cnot e c
cnot a c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
T* 1
cnot f 1
T 1
cnot e 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T a
cnot c a
T* a
cnot d a
T a
cnot c a
T* a
cnot g a
S a
cnot b a
T* a
cnot d a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T c
cnot a c
S* c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T b
H b
T 0
cnot b 0
T* 0
cnot d 0
T 0
cnot b 0
T* 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T* a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T* 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T b
cnot 0 b
S* b
cnot d b
H b
T 0
cnot d 0
T* 0
cnot d 0
H 0
S h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S f
cnot 1 f
T* f
cnot e f
T f
cnot 1 f
S* f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
cnot a d
Z d
T f
cnot f h
T* h
cnot g a
cnot g b
cnot f d
cnot g d
cnot h g
cnot f h
cnot f g
cnot g c
cnot c d
cnot b d
cnot a d
cnot a h
cnot a g
cnot a f
cnot a c
H f
T f
cnot c f
T* f
cnot d f
T f
cnot c f
T* f
cnot d f
H f
T d
cnot c d
T* d
cnot f g
cnot g d
cnot g c
cnot c d
H d
T d
cnot c d
T* d
cnot g d
T d
cnot c d
T* d
cnot g d
H d
T c
cnot f c
T c
Z c
cnot 0 c
T* c
T g
cnot g h
cnot f h
cnot a h
S h
cnot 0 h
T* h
S e
cnot e 1
T* 1
cnot h b
cnot a b
cnot 0 b
T b
cnot e 1
cnot c b
cnot g a
cnot g d
cnot h c
cnot h e
cnot h g
cnot g f
cnot f g
cnot e f
cnot f h
cnot h d
cnot c d
cnot c g
cnot f b
cnot b h
swap b e
cnot a h
cnot a g
cnot a f
cnot a b
cnot 0 e
cnot 0 d
cnot 0 b
H h
T h
cnot c h
T h
cnot d h
T* h
cnot c h
T* h
cnot d h
H h
T c
Z c
cnot 0 c
T c
cnot d c
cnot 0 c
T c
cnot f b
cnot h c
cnot d c
cnot h g
cnot f h
cnot h d
H f
T f
cnot c f
T f
cnot d f
T* f
cnot c f
T* f
cnot d f
H f
cnot d h
T h
cnot g c
cnot g d
cnot h f
swap g h
cnot f g
cnot f d
swap d f
cnot f g
cnot c d
cnot f b
cnot g a
cnot a h
cnot a f
cnot b d
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
T f
cnot b f
cnot a f
T f
cnot d f
T f
cnot h f
cnot d f
cnot b f
cnot a f
T* f
cnot c f
cnot d f
cnot b f
T f
cnot h f
cnot d f
cnot c f
cnot b f
H f
T f
cnot b f
T f
cnot g f
T* f
cnot b f
T* f
cnot g f
H f
T h
cnot c h
cnot a h
T* h
cnot c h
cnot a h
H h
T h
cnot c h
T h
cnot g h
T* h
cnot c h
T* h
cnot g h
H h
T* c
cnot g c
T c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
X c
H c
S 1
cnot e 1
T 1
cnot f 1
T* 1
cnot e 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T a
cnot c a
T* a
cnot d a
T a
cnot c a
T* a
cnot g a
S a
cnot b a
T a
cnot d a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T c
cnot a c
S* c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* b
X b
H b
T 0
cnot b 0
T* 0
cnot d 0
T 0
cnot b 0
T* 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T* a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T* 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T b
cnot 0 b
S* b
cnot d b
H b
T 0
cnot d 0
T* 0
cnot d 0
H 0
S h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S f
cnot 1 f
T* f
cnot e f
T* f
cnot 1 f
S f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
T b
T f
cnot f h
T* h
cnot f b
cnot g a
cnot g b
cnot g c
cnot f h
cnot h c
cnot c d
cnot b d
cnot a b
cnot a h
cnot a f
cnot a c
H f
T f
cnot c f
T* f
cnot d f
T f
cnot c f
T* f
cnot d f
H f
T c
T d
cnot a h
T h
cnot f b
cnot h d
cnot g e
cnot f e
cnot f h
cnot e f
cnot h c
cnot a h
cnot a d
cnot a c
H h
T h
cnot c h
T* h
cnot d h
T h
cnot c h
T* h
cnot d h
H h
T c
cnot f g
S* g
cnot 1 g
T g
cnot c d
T* d
cnot g b
cnot f b
cnot d b
cnot a b
cnot 1 b
Z b
cnot f e
cnot d e
T* e
cnot c a
cnot e a
cnot f d
cnot b a
cnot d b
cnot e d
cnot f d
cnot g e
cnot g f
swap g h
swap e h
cnot f g
swap d h
cnot f c
cnot c g
cnot c e
cnot g b
cnot b e
cnot a b
cnot b h
cnot e f
cnot b d
cnot a c
cnot 1 f
cnot 1 d
cnot 1 c
H e
T e
cnot c e
T* e
cnot d e
T* e
cnot c e
T e
cnot d e
H e
cnot f h
T h
cnot d h
cnot b h
cnot a h
T h
cnot f a
cnot g d
cnot h d
cnot h f
cnot h g
swap g h
cnot f h
cnot f g
swap d f
cnot h c
cnot f g
cnot c d
cnot f b
cnot b g
cnot f a
cnot a g
swap a b
cnot a h
cnot b f
cnot a d
X g
H g
T g
cnot f g
T* g
cnot h g
T* g
cnot f g
T g
cnot h g
H g
T f
cnot b f
S f
cnot 0 f
T* f
cnot c f
T* f
cnot 0 f
T f
Z f
cnot d f
cnot c f
cnot a f
T f
cnot h f
cnot c f
cnot a f
T* f
cnot h f
cnot d f
cnot c f
cnot b f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
T* h
cnot c h
cnot a h
T h
cnot c h
cnot a h
X h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
T* c
cnot 0 c
T c
cnot g c
cnot 0 c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
T 1
cnot f 1
T* 1
cnot e 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
cnot c a
T a
cnot d a
T a
cnot c a
T* a
cnot g a
S a
cnot b a
T* a
cnot d a
cnot g a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T* c
cnot a c
S c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T b
H b
T 0
cnot b 0
T* 0
cnot d 0
T* 0
cnot b 0
T 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T* 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T* b
cnot 0 b
S b
cnot d b
H b
T 0
cnot d 0
T 0
cnot d 0
H 0
S h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
X h
H h
T h
cnot c h
T* h
cnot g h
T* h
cnot c h
T h
cnot g h
H h
cnot d f
S f
cnot 1 f
T* f
cnot e f
T* f
cnot 1 f
S f
cnot e f
cnot d f
X f
H f
T f
cnot b f
T* f
cnot g f
T* f
cnot b f
T f
cnot g f
H f
S* g
cnot b g
T g
cnot c g
cnot b g
T g
cnot d g
cnot c g
Z g
cnot d g
X g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
S* e
cnot 1 e
T e
cnot f b
cnot g a
cnot g b
cnot h g
cnot g c
cnot c d
cnot b d
cnot a b
cnot a h
cnot a g
cnot a f
cnot a c
cnot 1 e
H e
T e
cnot c e
T* e
cnot d e
T* e
cnot c e
T e
cnot d e
H e
cnot g h
cnot b h
cnot d h
cnot c h
cnot a h
Z h
cnot f h
cnot d h
cnot c h
cnot a h
T h
cnot b a
cnot c a
cnot f e
cnot g f
cnot h f
cnot f h
cnot e h
cnot e g
cnot g d
cnot f c
cnot c h
cnot c e
cnot h b
cnot b h
cnot b d
cnot e a
cnot a h
swap a g
H h
T h
cnot b h
T h
cnot d h
T* h
cnot b h
T* h
cnot d h
H h
T* b
cnot d b
T b
cnot a b
T* b
cnot f b
cnot c b
T b
cnot d b
T* b
cnot g b
cnot e b
cnot c b
T b
cnot g b
cnot h a
cnot e a
cnot e b
cnot e d
cnot f c
cnot h d
cnot f h
cnot e f
cnot a b
X e
H e
T e
cnot c e
T e
cnot d e
T e
cnot c e
T e
cnot d e
H e
cnot f d
cnot h d
cnot h g
cnot g f
swap f g
cnot g h
cnot h c
cnot c d
cnot f b
cnot g a
cnot a h
cnot a f
cnot b d
H g
T g
cnot f g
T* g
cnot h g
T* g
cnot f g
T g
cnot h g
H g
T f
cnot d f
cnot b f
cnot a f
T* f
cnot h f
cnot d f
cnot b f
cnot a f
T f
cnot c f
cnot d f
cnot b f
T* f
cnot h f
cnot d f
cnot c f
cnot b f
H f
T f
cnot b f
T f
cnot g f
T* f
cnot b f
T* f
cnot g f
H f
Z h
cnot 0 h
T* h
cnot a h
T h
cnot 0 h
S* h
cnot a h
X h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
S c
cnot d c
cnot b c
T c
cnot g c
cnot d c
cnot b c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
T 1
cnot f 1
T 1
cnot e 1
T 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot a 0
cnot g 0
T* 0
cnot a 0
H 0
T* a
Z a
cnot c a
T* a
cnot d a
T* a
cnot c a
T a
cnot g a
S a
cnot b a
T a
cnot d a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T* c
cnot a c
S c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* b
X b
H b
T 0
cnot b 0
T* 0
cnot d 0
T* 0
cnot b 0
T 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T* b
cnot 0 b
S b
cnot d b
H b
T 0
cnot d 0
T 0
cnot d 0
H 0
S* h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S* f
cnot 1 f
T f
cnot e f
T f
cnot 1 f
S* f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
S* e
cnot 1 e
T e
cnot f b
cnot g a
cnot g b
cnot g c
cnot h c
cnot h g
cnot f g
cnot c d
cnot b d
cnot a b
cnot a h
cnot a f
cnot a c
cnot 1 e
H e
T e
cnot c e
T* e
cnot d e
T* e
cnot c e
T e
cnot d e
H e
T* d
cnot c d
T d
cnot a f
T f
cnot f h
cnot a h
T* h
cnot e b
cnot f b
cnot h a
cnot e d
cnot f d
cnot h f
cnot e f
cnot e h
cnot f c
cnot c d
cnot a b
cnot a f
cnot a c
H h
T h
cnot b h
T* h
cnot d h
T* h
cnot b h
T h
cnot d h
H h
T b
cnot d b
T b
cnot g b
cnot c b
cnot a b
Z b
cnot e b
cnot d b
T b
cnot c b
cnot a b
T b
cnot h a
cnot b a
cnot g b
cnot g d
cnot h d
cnot f e
cnot g f
cnot f h
cnot e f
cnot e g
swap c f
cnot f h
cnot f g
cnot g b
swap b c
cnot e a
swap a b
cnot b h
cnot c g
cnot c e
cnot b d
X e
H e
T e
cnot c e
T e
cnot d e
T* e
cnot c e
T* e
cnot d e
H e
cnot g h
S* h
cnot d h
cnot c h
cnot a h
T* h
cnot d c
cnot b a
cnot c b
cnot h g
cnot d c
cnot g d
cnot h f
swap g h
cnot f h
cnot f g
cnot h c
cnot c d
cnot d h
cnot d g
cnot b f
swap b d
cnot g a
cnot a f
swap a b
cnot f g
X g
H g
T g
cnot f g
T g
cnot h g
T* g
cnot f g
T* g
cnot h g
H g
Z f
cnot 0 f
T* f
cnot a f
T f
cnot c f
cnot a f
cnot 0 f
T f
cnot d f
cnot c f
cnot b f
cnot a f
T f
cnot h f
cnot a f
cnot c f
T f
cnot d f
cnot c f
cnot b f
T f
cnot h f
X f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
cnot c h
cnot a h
T* h
cnot c h
cnot a h
H h
T h
cnot c h
T h
cnot g h
T* h
cnot c h
T* h
cnot g h
H h
T* c
cnot a c
T c
cnot g c
cnot a c
T c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
X c
H c
S 1
cnot e 1
T 1
cnot f 1
T* 1
cnot e 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot a 0
cnot g 0
T* 0
cnot a 0
H 0
T* a
Z a
cnot c a
T* a
cnot d a
T a
cnot c a
T* a
cnot g a
S a
cnot b a
T* a
cnot d a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T c
cnot a c
S* c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T b
H b
T 0
cnot b 0
T* 0
cnot d 0
T 0
cnot b 0
T* 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T* a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T* 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T b
cnot 0 b
S* b
cnot d b
H b
T 0
cnot d 0
T* 0
cnot d 0
H 0
S h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S f
cnot 1 f
T* f
cnot e f
T* f
cnot 1 f
S f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
S* e
cnot 1 e
T e
cnot f b
cnot g a
cnot g b
cnot h g
cnot g c
cnot c d
cnot b d
cnot a b
cnot a h
cnot a g
cnot a f
cnot a c
cnot 1 e
H e
T e
cnot c e
T* e
cnot d e
T e
cnot c e
T* e
cnot d e
H e
T d
T c
cnot g c
T c
Z c
cnot 0 c
T* c
cnot h c
cnot g c
cnot a c
T c
cnot 0 c
S* c
cnot d c
cnot g c
cnot b c
Z c
cnot h f
T* f
cnot g f
T* f
cnot b f
T f
cnot f b
cnot h a
cnot g a
cnot g b
cnot g c
cnot h c
cnot d c
cnot h g
cnot g f
cnot g e
cnot f h
cnot e g
cnot h d
cnot c d
cnot c h
cnot c f
cnot b f
cnot a f
swap a e
cnot f h
cnot e g
cnot b c
H f
T f
cnot a f
T f
cnot g f
T* f
cnot a f
T* f
cnot g f
H f
T* a
T g
cnot f a
cnot f g
H f
T f
cnot c f
T f
cnot d f
T* f
cnot c f
T* f
cnot d f
H f
cnot h d
cnot h g
cnot g f
cnot f h
cnot h c
cnot c d
cnot f b
cnot g a
cnot a h
cnot a f
cnot b d
H g
T g
cnot f g
T g
cnot h g
T g
cnot f g
T g
cnot h g
H g
T* f
cnot h f
T* f
cnot a f
T f
cnot d f
cnot h f
cnot b f
T f
cnot c f
cnot a f
cnot b f
T* f
cnot h f
cnot b f
T f
cnot e f
cnot h f
cnot d f
cnot c f
T f
cnot e f
cnot b f
X f
H f
T f
cnot b f
T f
cnot g f
T* f
cnot b f
T* f
cnot g f
H f
T* h
cnot c h
cnot a h
T* h
cnot c h
cnot a h
X h
H h
T h
cnot c h
T h
cnot g h
T* h
cnot c h
T* h
cnot g h
H h
T* c
cnot g c
T c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
X c
H c
S 1
cnot e 1
T 1
cnot f 1
T* 1
cnot e 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot e 0
cnot g 0
T* 0
cnot e 0
H 0
cnot c a
T a
cnot d a
T a
cnot c a
T* a
cnot g a
S a
cnot b a
T a
cnot e a
cnot g a
cnot d a
cnot b a
T a
cnot e a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T* c
cnot a c
S c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* b
X b
H b
T 0
cnot b 0
T* 0
cnot d 0
T* 0
cnot b 0
T 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T* 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T* b
cnot 0 b
S b
cnot d b
H b
T 0
cnot d 0
T 0
cnot d 0
H 0
S h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
X h
H h
T h
cnot c h
T* h
cnot g h
T* h
cnot c h
T h
cnot g h
H h
cnot d f
S f
cnot 1 f
T* f
cnot e f
T* f
cnot 1 f
S f
cnot e f
cnot d f
X f
H f
T f
cnot b f
T* f
cnot g f
T* f
cnot b f
T f
cnot g f
H f
S* g
cnot b g
T g
cnot c g
cnot b g
T g
cnot d g
cnot c g
Z g
cnot d g
X g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
T b
T c
Z c
cnot 0 c
T* c
cnot a c
T c
cnot 0 c
S* c
T f
T h
cnot f b
cnot g a
cnot g b
cnot h c
cnot h g
cnot f h
cnot f g
cnot c d
cnot a b
cnot a f
cnot b d
H f
T f
cnot c f
T* f
cnot d f
T* f
cnot c f
T f
cnot d f
H f
cnot f a
cnot f g
H f
T f
cnot a f
T* f
cnot g f
T f
cnot a f
T* f
cnot g f
H f
T c
T g
cnot a g
T* g
T* d
T* h
cnot c a
cnot e a
cnot f b
cnot h a
cnot e c
cnot g c
cnot g d
cnot g h
cnot h f
cnot f h
swap f g
cnot e g
cnot c h
cnot c g
swap a b
cnot b g
cnot a d
cnot a c
X f
H f
T f
cnot c f
T f
cnot d f
T* f
cnot c f
T* f
cnot d f
H f
cnot g h
cnot e h
cnot c h
cnot a h
T h
cnot c b
cnot d b
cnot f b
cnot f c
cnot g c
cnot h g
cnot g h
cnot g f
swap f g
cnot e g
cnot g h
cnot e f
cnot h d
swap d f
cnot c h
cnot c g
cnot c d
cnot b f
swap b d
cnot f a
cnot a f
swap a b
cnot f g
X g
H g
T g
cnot f g
T g
cnot h g
T g
cnot f g
T g
cnot h g
H g
T* f
cnot d f
cnot b f
cnot a f
T f
cnot h f
cnot d f
cnot b f
cnot a f
T* f
cnot c f
cnot d f
cnot b f
T f
cnot e f
cnot h f
cnot c f
cnot a f
T f
cnot e f
cnot d f
cnot b f
cnot a f
X f
H f
T f
cnot b f
T f
cnot g f
T* f
cnot b f
T* f
cnot g f
H f
T* h
cnot c h
cnot a h
T* h
cnot c h
cnot a h
X h
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
T c
cnot d c
Z c
cnot g c
cnot d c
T* c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
H c
S 1
cnot e 1
cnot f 1
T* 1
cnot e 1
T 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot e 0
cnot g 0
cnot b 0
T* 0
cnot b 0
cnot e 0
H 0
T a
cnot c a
T* a
cnot d a
T* a
cnot c a
T a
cnot g a
S a
cnot b a
T a
cnot d a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T* c
cnot a c
S c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* b
cnot e b
S b
cnot e b
X b
H b
T 0
cnot b 0
T* 0
cnot d 0
T* 0
cnot b 0
T 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T* b
cnot 0 b
S b
cnot d b
H b
T 0
cnot d 0
T 0
cnot d 0
H 0
S* h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S* f
cnot 1 f
T f
cnot e f
T* f
cnot 1 f
S f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
S a
cnot 0 a
T* a
T c
Z c
cnot 0 c
T* c
cnot c a
cnot h a
cnot d c
cnot g d
cnot h g
cnot f h
cnot f g
swap d f
cnot h c
cnot c f
swap c d
swap a c
cnot c f
cnot b d
cnot 0 f
cnot 0 d
H f
T f
cnot c f
T* f
cnot d f
T* f
cnot c f
T f
cnot d f
H f
T* d
cnot c d
T d
cnot b d
cnot a d
Z d
cnot c b
cnot e b
cnot g d
cnot h c
cnot f e
cnot g f
swap e h
cnot f g
cnot h d
cnot h c
cnot c d
cnot c g
cnot c f
cnot c e
swap a c
cnot c h
cnot c g
cnot c f
cnot b e
cnot b d
H f
T f
cnot c f
T f
cnot d f
T* f
cnot c f
T* f
cnot d f
H f
T d
cnot b e
cnot a e
T* e
cnot f e
cnot e c
cnot e d
cnot f e
cnot f g
cnot c d
cnot c e
cnot b c
cnot a c
cnot c e
cnot c d
X e
H e
T e
cnot c e
T* e
cnot d e
T* e
cnot c e
T e
cnot d e
H e
cnot f d
cnot h d
cnot h g
cnot g f
swap f g
cnot g h
cnot h c
cnot c d
cnot f b
cnot g a
cnot a h
cnot a f
cnot b d
X g
H g
T g
cnot f g
T g
cnot h g
T g
cnot f g
T g
cnot h g
H g
T* f
cnot c f
T f
cnot h f
cnot c f
T* f
cnot d f
cnot c f
cnot b f
T* f
cnot a f
cnot h f
cnot c f
S f
cnot d f
cnot b f
cnot a f
X f
H f
T f
cnot b f
T f
cnot g f
T* f
cnot b f
T* f
cnot g f
H f
T h
Z h
cnot 0 h
T h
cnot c h
cnot a h
cnot 0 h
T h
cnot b h
cnot a h
T h
cnot c h
cnot b h
X h
H h
T h
cnot c h
T h
cnot g h
T* h
cnot c h
T* h
cnot g h
H h
T* c
cnot b c
T c
cnot g c
cnot b c
T c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
X c
H c
S 1
cnot e 1
T 1
cnot f 1
T 1
cnot e 1
T 1
cnot a 1
cnot f 1
T* 1
cnot a 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
Z a
cnot c a
T* a
cnot d a
T* a
cnot c a
T a
cnot g a
S a
cnot b a
T a
cnot d a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T* c
cnot a c
S c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* b
X b
H b
T 0
cnot b 0
T* 0
cnot d 0
T* 0
cnot b 0
T 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T* b
cnot 0 b
S b
cnot d b
H b
T 0
cnot d 0
T 0
cnot d 0
H 0
S* h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S* f
cnot 1 f
T f
cnot e f
T f
cnot 1 f
S* f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
S* e
cnot 1 e
T e
cnot f b
cnot g a
cnot g b
cnot g c
cnot h c
cnot c d
cnot b d
cnot a b
cnot a h
cnot a f
cnot a c
cnot 1 e
H e
T e
cnot c e
T* e
cnot d e
T* e
cnot c e
T e
cnot d e
H e
T c
cnot a f
T f
cnot c h
cnot a h
S* h
cnot 0 h
T h
cnot g h
cnot a h
T* h
cnot 0 h
T h
Z h
cnot f h
T* h
cnot g h
cnot c h
cnot a h
T* h
cnot g b
cnot f b
cnot a b
T b
T* d
cnot e a
cnot g b
cnot f c
cnot f d
cnot e f
cnot f h
cnot f b
cnot a b
cnot a h
cnot a f
cnot a d
cnot a c
H f
T f
cnot c f
T* f
cnot d f
T* f
cnot c f
T f
cnot d f
H f
cnot e g
S g
cnot a g
S g
cnot 0 g
T* g
cnot g a
cnot g b
cnot h c
cnot d c
cnot f d
cnot g e
cnot f e
cnot h f
swap f g
cnot e g
cnot e h
cnot d e
cnot c e
swap c d
cnot c g
cnot e f
cnot h b
cnot b h
swap b d
cnot c a
cnot a d
cnot a g
cnot a c
cnot a b
cnot 0 h
cnot 0 e
cnot 0 d
cnot 0 c
cnot 0 b
cnot 0 a
H f
T f
cnot b f
T* f
cnot d f
T* f
cnot b f
T f
cnot d f
H f
T* d
cnot b d
T d
cnot e d
cnot c d
cnot b d
Z d
cnot h d
S d
cnot g d
cnot e d
cnot c d
T* d
cnot f a
cnot f b
cnot g d
cnot f h
cnot f g
cnot h d
X d
H d
T d
cnot b d
T* d
cnot c d
T d
cnot b d
T* d
cnot c d
H d
cnot a h
H a
T a
cnot c a
T* a
cnot d a
T a
cnot c a
T* a
cnot d a
H a
cnot b f
T f
cnot f a
cnot f d
cnot g d
cnot h c
cnot h g
cnot g f
cnot f g
cnot c d
cnot f b
cnot b a
swap a b
cnot b g
cnot b f
cnot a d
cnot a c
H g
T g
cnot f g
T* g
cnot h g
T* g
cnot f g
T g
cnot h g
H g
T f
cnot b f
cnot a f
T f
cnot h f
cnot b f
cnot a f
T f
cnot c f
cnot b f
T* f
cnot d f
T f
cnot h f
cnot c f
cnot a f
T* f
cnot d f
cnot b f
cnot a f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
T* h
cnot a h
T h
cnot a h
X h
H h
T h
cnot c h
T h
cnot g h
T* h
cnot c h
T* h
cnot g h
H h
T* c
cnot e c
T c
cnot g c
cnot e c
T c
cnot g c
cnot d h
cnot d g
cnot d f
cnot a d
X c
H c
S 1
cnot e 1
T 1
cnot f 1
T* 1
cnot e 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T a
cnot c a
T* a
cnot d a
T a
cnot c a
T* a
cnot g a
S a
cnot b a
T* a
cnot d a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S c
cnot a c
T* c
cnot d c
T c
cnot a c
S* c
cnot d c
H c
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T b
H b
T 0
cnot b 0
T* 0
cnot d 0
T 0
cnot b 0
T* 0
cnot d 0
H 0
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot 1 0
cnot c 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
Z a
cnot c a
S* a
cnot d a
cnot c a
T* a
cnot d a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
Z 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
Z 1
cnot g 1
H 1
S 0
cnot a 0
T* 0
cnot c 0
T 0
cnot a 0
T* 0
cnot g 0
cnot c 0
T* 0
cnot g 0
H 0
S b
cnot 0 b
T* b
cnot d b
T b
cnot 0 b
S* b
cnot d b
H b
T 0
cnot d 0
T* 0
cnot d 0
H 0
S h
cnot d h
cnot d g
cnot d f
cnot a h
cnot a g
cnot a f
cnot a d
H h
T h
cnot c h
T* h
cnot g h
T h
cnot c h
T* h
cnot g h
H h
cnot d f
S f
cnot 1 f
T* f
cnot e f
T* f
cnot 1 f
S f
cnot e f
cnot d f
H f
T f
cnot b f
T* f
cnot g f
T f
cnot b f
T* f
cnot g f
H f
S g
cnot b g
T* g
cnot c g
cnot b g
T* g
cnot d g
cnot c g
Z g
cnot d g
H g
T g
cnot f g
T* g
cnot h g
T g
cnot f g
T* g
cnot h g
H g
T b
T f
cnot f h
T* h
cnot f b
cnot g a
cnot g b
cnot h g
cnot f h
cnot f g
cnot g c
cnot c d
cnot b d
cnot a b
cnot a g
cnot a f
cnot a c
H a
T a
cnot c a
T* a
cnot d a
T a
cnot c a
T* a
cnot d a
H a
T d
cnot c d
T* d
cnot h d
cnot g d
cnot b d
Z d
cnot f a
cnot g d
cnot h d
cnot c d
cnot a h
cnot b d
H d
T d
cnot b d
T* d
cnot c d
T d
cnot b d
T* d
cnot c d
H d
T b
cnot c b
T* b
cnot c b
cnot f b
cnot f d
H f
T f
cnot b f
T* f
cnot d f
T f
cnot b f
T* f
cnot d f
H f
T b
cnot d b
T* b
cnot b a
cnot c b
cnot f c
cnot h f
cnot h g
cnot f h
cnot e h
cnot g d
cnot c g
cnot c f
cnot d b
swap b e
cnot f a
swap a c
cnot e h
cnot c g
cnot c f
cnot c d
X c
H c
T c
cnot a c
T c
cnot b c
T* c
cnot a c
T* c
cnot b c
H c
T* a
cnot g a
T a
cnot f a
T a
Z a
cnot 0 a
T* a
cnot b a
cnot g a
cnot f a
cnot 0 a
T a
cnot h a
cnot d a
S* a
cnot 0 a
T a
cnot e a
cnot d a
cnot 0 a
S a
cnot e a
cnot f a
cnot h a
cnot b a
cnot g f
cnot f c
cnot f b
H g
T g
cnot a g
T g
cnot f g
T* g
cnot a g
T* g
cnot f g
H g
cnot f b
cnot 1 b
T b
cnot h b
cnot f b
cnot d b
cnot 1 b
S b
cnot 0 b
T* b
cnot d b
cnot h b
cnot h f
cnot h g
cnot 0 b
H b
H 2
T 2
cnot d 2
T* 2
cnot e 2
T 2
cnot d 2
T* 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
S* a
cnot b a
T a
cnot c a
T* a
cnot b a
T a
cnot h a
cnot f a
cnot d a
cnot c a
T a
cnot d a
cnot f a
cnot h a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
S b
cnot a b
T* b
cnot c b
T b
cnot a b
S* b
cnot c b
H b
T* h
cnot 0 h
T h
cnot f h
cnot 0 h
T h
cnot f h
X h
H h
T h
cnot b h
T* h
cnot c h
T h
cnot b h
T* h
cnot c h
H h
T a
cnot c a
T* a
cnot c a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
S 0
cnot h 0
T* 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
S 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T* 2
cnot 1 2
S 2
cnot f 2
H 2
T h
H h
T h
cnot b h
T* h
cnot c h
T h
cnot b h
T* h
cnot c h
H h
S* g
cnot 0 g
T g
cnot h f
cnot h g
cnot 0 g
X g
H g
T g
cnot a g
T* g
cnot f g
T* g
cnot a g
T g
cnot f g
H g
Z c
cnot b c
S* c
cnot f b
cnot g f
cnot f a
cnot b c
X c
H c
T c
cnot a c
T c
cnot b c
T c
cnot a c
T c
cnot b c
H c
T* a
cnot b a
T* a
cnot h a
cnot g c
cnot h c
cnot g f
cnot h g
cnot g h
cnot f h
cnot e f
cnot f g
cnot c g
cnot c f
cnot c b
cnot b g
swap b c
cnot a g
swap a c
cnot c h
cnot a e
cnot a d
cnot a b
X c
H c
T c
cnot a c
T c
cnot b c
T c
cnot a c
T c
cnot b c
H c
H 3
T 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
T 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot a 2
T* 2
cnot d 2
cnot a 2
T 2
cnot e 2
cnot a 2
T* 2
cnot a 2
cnot d 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot h 1
cnot g 1
cnot a 1
T 1
cnot a 1
cnot f 1
cnot g 1
cnot h 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
cnot b a
T* a
cnot d a
cnot b a
S a
cnot e a
cnot d a
S a
cnot g a
T a
cnot f a
cnot e a
cnot b a
T a
cnot h a
cnot b a
S* a
cnot f a
cnot g a
cnot h a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
S* 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T* 2
cnot 1 2
S 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T 3
cnot 2 3
S* 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T* c
cnot a c
T c
cnot b c
H c
S* f
S g
cnot 0 g
T* g
cnot f 1
T 1
S e
cnot e 2
T* 2
S* d
cnot d 3
T 3
T* h
cnot f 1
cnot e 2
cnot d 3
cnot c a
cnot d a
cnot h a
cnot g c
cnot h c
cnot e d
cnot g e
cnot h e
cnot g f
swap g h
cnot e h
cnot e g
cnot d f
cnot d e
cnot c h
cnot c g
cnot c f
swap c e
cnot g b
cnot b f
swap b e
cnot a h
cnot a f
cnot a d
swap a b
cnot 0 h
cnot 0 c
cnot 0 a
X c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
T 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T 1
cnot 2 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T a
cnot b a
T* a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
S 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T 2
cnot 1 2
S* 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T 3
cnot 2 3
S* 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
S f
S* g
cnot 0 g
T g
cnot f 1
T* 1
S e
cnot e 2
T* 2
S* d
cnot d 3
T 3
T a
S b
cnot f 1
cnot d 3
cnot e 2
cnot e a
cnot h a
cnot b a
cnot d b
cnot d c
cnot g d
cnot g e
cnot g f
cnot h g
cnot g h
cnot e g
cnot d f
cnot g c
cnot c f
swap c d
cnot d h
cnot c g
cnot d e
cnot e b
cnot b g
swap b d
cnot a g
swap a c
cnot c h
cnot 0 h
cnot 0 e
cnot 0 d
cnot 0 a
X c
H c
T c
cnot a c
T c
cnot b c
T* c
cnot a c
T* c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
T 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
cnot b a
T a
cnot e a
T a
cnot g a
cnot e a
cnot d a
cnot b a
T* a
cnot h a
cnot e a
T a
cnot d a
cnot e a
cnot g a
cnot h a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
S* 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T* 2
cnot 1 2
S 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T 3
cnot 2 3
S* 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
S g
cnot 0 g
T* g
T* h
cnot e c
cnot h c
cnot f e
cnot h g
swap g h
swap f g
cnot e g
swap e f
cnot g h
swap c e
cnot e h
cnot e g
cnot g b
cnot b e
cnot a e
swap a b
cnot e h
cnot e g
cnot e f
cnot a d
cnot b c
cnot 0 h
X c
H c
T c
cnot a c
T c
cnot b c
T c
cnot a c
T c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
T 3
cnot a 3
T 3
cnot a 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot g 2
cnot e 2
cnot b 2
cnot a 2
T* 2
cnot a 2
cnot b 2
cnot g 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T 1
cnot 2 1
T* 1
cnot g 1
cnot e 1
cnot b 1
cnot a 1
T 1
cnot a 1
cnot b 1
cnot e 1
cnot f 1
cnot g 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
cnot b a
T* a
cnot g a
S a
cnot e a
T* a
cnot b a
S a
cnot d a
cnot g a
cnot e a
S* a
cnot f a
cnot g a
cnot e a
cnot d a
cnot b a
S* a
cnot e a
cnot f a
cnot g a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
S 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T 2
cnot 1 2
S* 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T 3
cnot 2 3
S* 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T* c
cnot a c
T c
cnot b c
H c
S* d
S* g
cnot 0 g
T g
cnot d 3
T 3
T* h
cnot d 3
cnot g d
swap g h
cnot d h
cnot c h
cnot c g
cnot d f
cnot d e
cnot b d
cnot d a
cnot a d
swap a b
cnot a h
cnot d g
cnot b f
cnot b e
cnot b c
cnot 0 c
cnot 0 b
H c
T c
cnot a c
T c
cnot b c
T* c
cnot a c
T* c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
T 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot d 2
cnot a 2
T* 2
cnot a 2
cnot d 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot d 1
cnot a 1
T* 1
cnot a 1
cnot d 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
S* a
cnot b a
T a
cnot d a
cnot b a
T a
cnot e a
S a
cnot f a
cnot e a
S a
cnot d a
cnot f a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
S* 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T* 2
cnot 1 2
S 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T 3
cnot 2 3
S* 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
S e
S* f
cnot 1 f
T f
cnot e 2
T* 2
T* d
cnot d 3
T 3
S b
cnot b a
T* a
T h
cnot d 3
cnot e 2
cnot d a
cnot e b
cnot e c
cnot d c
cnot h e
cnot f e
swap f h
cnot e h
swap e f
cnot h d
cnot d f
swap d e
cnot c e
swap c d
cnot e h
cnot e g
cnot b c
cnot e a
cnot a c
cnot b h
cnot b f
cnot a e
cnot c d
cnot 1 f
X c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T 3
cnot c 3
T* 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T* 2
cnot 3 2
T 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T 1
cnot 2 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot e 0
cnot a 0
T* 0
cnot a 0
cnot e 0
cnot g 0
H 0
T a
cnot b a
T* a
cnot g a
cnot e a
cnot b a
S a
cnot e a
cnot g a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
S* 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T 2
cnot 1 2
S* 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T* 3
cnot 2 3
S 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T c
cnot 3 c
S* c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
T a
S g
cnot 0 g
T* g
cnot a b
T* b
T h
cnot c b
cnot d b
cnot h a
cnot h e
cnot h f
swap g h
cnot e f
cnot e h
cnot e g
cnot e c
swap c e
cnot e f
cnot h b
cnot b h
swap b g
cnot h a
cnot a g
cnot a e
cnot a d
cnot a c
cnot a b
cnot 0 g
X c
H c
T c
cnot a c
T c
cnot b c
T c
cnot a c
T c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T 3
cnot c 3
T* 3
cnot a 3
T* 3
cnot a 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T* 2
cnot 3 2
T 2
cnot b 2
cnot e 2
cnot a 2
T 2
cnot a 2
cnot b 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot e 1
cnot b 1
T* 1
cnot b 1
cnot e 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot g 0
H 0
T* a
cnot b a
T a
Z a
cnot d a
cnot b a
T* a
Z a
cnot d a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
S* 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T* 2
cnot 1 2
S 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T* 3
cnot 2 3
S 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T c
cnot 3 c
S* c
cnot d c
cnot a d
H c
T c
cnot a c
T* c
cnot b c
T* c
cnot a c
T c
cnot b c
H c
T a
S* f
cnot 1 f
T f
cnot a d
S d
cnot d 3
T* 3
S* b
T* h
cnot d 3
cnot b a
cnot d b
cnot e c
cnot f d
cnot h d
cnot h e
swap f h
cnot e g
swap d f
cnot c f
cnot c h
cnot c g
cnot c e
cnot c d
cnot e b
cnot b f
swap b d
cnot e a
cnot a d
cnot f h
cnot a e
cnot a c
cnot a b
cnot 1 f
H c
T c
cnot a c
T* c
cnot b c
T* c
cnot a c
T c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
T 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot b 2
T 2
cnot b 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T 1
cnot 2 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot e 0
cnot a 0
T* 0
cnot a 0
cnot e 0
cnot g 0
H 0
T a
cnot b a
T a
cnot g a
cnot e a
cnot b a
S a
cnot e a
cnot g a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
S 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T 2
cnot 1 2
S* 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T 3
cnot 2 3
S* 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T* c
cnot a c
T c
cnot b c
cnot d b
cnot d h
cnot d g
cnot d e
swap b d
cnot d a
cnot a d
swap a b
cnot d f
cnot d e
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
T 3
cnot a 3
cnot d 3
T 3
cnot a 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot d 2
cnot a 2
T* 2
cnot a 2
cnot d 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot d 1
T* 1
cnot d 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot a 0
T 0
cnot a 0
cnot g 0
H 0
T* a
cnot b a
cnot d a
S* a
cnot e a
cnot b a
T* a
Z a
cnot g a
cnot e a
cnot d a
S* a
cnot h a
cnot g a
T* a
cnot h a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
S 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T* 2
cnot 1 2
S 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T 3
cnot 2 3
S* 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
S* f
S* g
cnot 0 g
T g
cnot f 1
T 1
S e
cnot e 2
T* 2
T* d
cnot d 3
T 3
S b
cnot b a
T* a
T h
cnot f 1
cnot d 3
cnot e 2
cnot c b
cnot f a
cnot h b
cnot h e
cnot f e
cnot h g
swap g h
cnot h f
swap f g
cnot e g
swap e f
cnot g h
cnot h d
cnot d f
swap d e
cnot h c
cnot c f
swap c e
cnot e h
cnot c d
cnot b e
cnot f a
cnot a b
cnot e h
cnot a g
cnot a f
cnot b d
cnot b c
cnot 0 g
X c
H c
T c
cnot a c
T c
cnot b c
T* c
cnot a c
T* c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T 3
cnot c 3
T* 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T* 2
cnot 3 2
T 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T 1
cnot 2 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T* a
cnot b a
T a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
S 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T 2
cnot 1 2
S* 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T* 3
cnot 2 3
S 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T c
cnot 3 c
S* c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
T* d
Z d
S f
cnot 1 f
T* f
cnot d 3
T* 3
T a
S b
T* h
cnot d 3
cnot e b
cnot g f
cnot f a
cnot f b
cnot f d
cnot g d
cnot g f
cnot h g
swap g h
swap f h
swap e f
cnot f g
cnot d g
swap d e
cnot e c
cnot c g
cnot c h
cnot c d
swap b e
cnot a e
cnot a h
cnot e g
cnot e f
cnot a d
cnot 1 h
cnot 1 c
cnot 1 b
cnot 1 a
X c
H c
T c
cnot a c
T c
cnot b c
T* c
cnot a c
T* c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
T 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T* 2
cnot 3 2
T 2
cnot f 2
T 2
cnot e 2
cnot f 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T 1
cnot 2 1
T* 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot f 0
cnot d 0
cnot b 0
cnot a 0
T 0
cnot a 0
cnot b 0
cnot d 0
cnot f 0
cnot g 0
H 0
T* a
cnot b a
T a
cnot g a
cnot f a
cnot d a
S* a
cnot d a
cnot f a
cnot g a
cnot b a
X a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
S 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T 2
cnot 1 2
S* 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T* 3
cnot 2 3
S 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
cnot f b
cnot g b
cnot g c
cnot f e
swap f g
swap b g
cnot g a
swap a g
cnot g h
cnot a c
cnot a b
X c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
S 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T* 2
cnot 3 2
T 2
cnot b 2
cnot a 2
T 2
cnot a 2
cnot b 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot b 1
cnot f 1
cnot a 1
T* 1
cnot a 1
cnot b 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T 0
cnot 1 0
T* 0
cnot f 0
cnot g 0
T 0
cnot f 0
H 0
T a
cnot b a
cnot e a
S* a
cnot g a
cnot e a
cnot b a
T a
cnot f a
cnot b a
T* a
cnot f a
cnot g a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T* a
cnot 0 a
T a
cnot h a
H a
T 0
cnot h 0
T 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T 1
cnot 0 1
S* 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T* 2
cnot 1 2
S 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T* 3
cnot 2 3
S 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
T a
S g
cnot 0 g
T* g
cnot a b
T* b
T* h
cnot c b
cnot g a
cnot h f
cnot h g
swap g h
cnot f h
cnot e h
cnot f g
cnot c h
cnot c f
cnot h b
cnot f a
cnot a b
cnot b h
cnot b f
cnot b e
cnot b c
cnot 0 h
cnot 0 a
H c
T c
cnot a c
T* c
cnot b c
T* c
cnot a c
T c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
S 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T 2
cnot 3 2
T* 2
cnot b 2
T 2
cnot b 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot g 1
cnot f 1
T 1
cnot g 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
T a
cnot b a
T a
cnot b a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
S 1
cnot 0 1
T* 1
cnot g 1
T* 1
cnot 0 1
S 1
cnot g 1
H 1
S 2
cnot 1 2
T* 2
cnot f 2
T* 2
cnot 1 2
S 2
cnot f 2
H 2
S 3
cnot 2 3
T* 3
cnot e 3
T 3
cnot 2 3
S* 3
cnot e 3
H 3
S c
cnot 3 c
T* c
cnot d c
T* c
cnot 3 c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T* c
cnot a c
T c
cnot b c
H c
T a
S e
cnot 2 e
T* e
S* b
cnot e b
cnot h a
cnot e c
cnot g f
cnot g h
swap f g
cnot h e
swap e g
cnot g h
cnot e c
cnot c h
cnot c g
cnot e b
cnot c a
cnot b h
cnot b e
cnot 2 h
cnot 2 e
cnot 2 c
cnot 2 b
cnot 2 a
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
S 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
S 3
cnot d 3
H 3
S 2
cnot 3 2
T* 2
cnot e 2
T* 2
cnot 3 2
T 2
cnot e 2
H 2
S 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot e 1
cnot b 1
T 1
cnot b 1
cnot e 1
cnot f 1
H 1
S 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot f 0
cnot g 0
T 0
cnot f 0
H 0
T a
cnot b a
T* a
cnot g a
cnot f a
cnot e a
cnot b a
T a
cnot e a
cnot f a
cnot g a
H a
T a
cnot 0 a
T* a
cnot h a
T a
cnot 0 a
T* a
cnot h a
H a
T 0
cnot h 0
T* 0
cnot h 0
H 0
T 0
cnot 1 0
T* 0
cnot g 0
T* 0
cnot 1 0
T 0
cnot g 0
H 0
S 1
cnot g 1
S 1
cnot g 1
H 1
T 1
cnot 2 1
T* 1
cnot f 1
T* 1
cnot 2 1
T 1
cnot f 1
H 1
S 2
cnot f 2
S 2
cnot f 2
H 2
T 2
cnot 3 2
T* 2
cnot e 2
T* 2
cnot 3 2
T 2
cnot e 2
H 2
S 3
cnot e 3
S 3
cnot e 3
H 3
T 3
cnot c 3
T* 3
cnot d 3
T* 3
cnot c 3
T 3
cnot d 3
H 3
S c
cnot d c
S c
cnot d c
H c
T c
cnot a c
T* c
cnot b c
T c
cnot a c
T* c
cnot b c
H c
Z b
T e
Z e
cnot d e
cnot b e
Z e
cnot b f
T f
cnot d f
cnot b f
T* f
cnot e f
cnot d f
cnot b f
S f
S* g
T h
cnot g h
T* h
cnot f h
cnot e h
T h
T a
cnot b a
T* a
cnot g c
cnot h c
cnot f e
cnot h g
cnot g e
cnot e h
cnot e g
cnot d f
swap d e
cnot c f
cnot c h
cnot g b
cnot b c
cnot a c
swap a b
cnot b h
cnot c g
cnot c f
cnot c d
X a
X e
X f
X g
END
