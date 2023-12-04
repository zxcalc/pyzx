.v x1 x2 x3 x4 0
.i x1 x2 x3 x4

BEGIN

H x1

tof x1 x2
T* x2
tof x1 x2
T x1
T x2

H 0
tof x3 x1
P* x3
tof x1 0 
tof 0 x3
T x3
T* 0
tof x1 x3
tof x1 0
T x3
T* 0
tof x3 0
H x3
T x3
H x3
tof x3 0
T* x3
T 0
tof x1 0
tof x1 x3
T 0
T* x3
tof 0 x3
tof x1 0
P x3
tof x3 x1
H 0

tof x1 0
H x1
Z x4 0 x1
H x1
tof x1 0
T 0
P 0
H 0
T 0
P 0
H 0
T 0
H 0
T 0
P 0
H 0
T 0
P 0
H 0
T 0
P 0
H 0
T 0
H 0
T 0
P 0
H 0
T 0
P 0
H 0
T 0
P 0
H 0
T 0
H 0
T 0
P 0
H 0
T 0
P 0
H 0
T 0
H 0
T 0
P 0
H 0
T 0
H 0
T 0
H 0
T 0
H 0
T 0
H 0
T 0
P 0
H 0
T 0
H 0
T 0
P 0
H 0
T 0
P 0
H 0
T 0
P 0
H 0
T 0
P 0
H 0
T 0
P* 0
H 0
T 0
H 0
T 0
P 0
tof x1 0
H x1
Z x4 0 x1
H x1
tof x1 0

H x2

tof x2 x3
T* x3
tof x2 x3
T x2
T x3

H 0
tof x4 x2
P* x4
tof x2 0 
tof 0 x4
T x4
T* 0
tof x2 x4
tof x2 0
T x4
T* 0
tof x4 0
H x4
T x4
H x4
tof x4 0
T* x4
T 0
tof x2 0
tof x2 x4
T 0
T* x4
tof 0 x4
tof x2 0
P x4
tof x4 x2
H 0

H x3

tof x3 x4
T* x4
tof x3 x4
T x3
T x4

END

