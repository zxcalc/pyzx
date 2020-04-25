.v a0 a1 a2 a3 b0 b1 b2 b3 c0 c1 c2 c3
.i a0 a1 a2 a3 b0 b1 b2 b3

BEGIN

H c0
H c1
H c2

Z a3 b1 c0
Z a2 b2 c0
Z a1 b3 c0
Zd a3 b2 c1
Zd a2 b3 c1
Z a3 b3 c2

H c0
H c1
H c2

tof c2 c3
tof c1 c2
tof c0 c1

H c0
H c1
H c2
H c3

Zd a3 b0 c3
Zd a2 b1 c3
Zd a1 b2 c3
Zd a0 b3 c3
Z a2 b0 c2
Z a1 b1 c2
Z a0 b2 c2
Zd a1 b0 c1
Zd a0 b1 c1
Z a0 b0 c0

H c0
H c1
H c2
H c3

END
