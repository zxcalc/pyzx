.v x0 x1 c1 x2 c2 x3 c3 x4 c4 d4 z
.i x0 x1 x2 x3 x4 z
.o x0 x1 c1 x2 c2 x3 c3 x4 c4 d4 z

BEGIN

H c2
Z x1 x2 c2
H c2

X c2
X x3
H c3
Z c2 x3 c3
H c3
X x3
X c2

X c3
H d4
Z c3 x4 d4
H d4
X c3

X c2
X x3
H c3
H c4
Zd c2 x3 c3
Z z d4 c4
H c4
X x3
X c2

H c2
H c1

Zd x1 x2 c2
tof c4 x0
tof c4 x1
tof c4 x3
Z x0 x1 c1

H c1

X c1
Z c1 x2 c2
H c2
X c1

X c2
Z c2 x3 c3
H c3
X c2

X c3
H x4
Z c3 c4 x4
H x4
X c3

X c2
H c3
Zd c2 x3 c3
H c3
X c2

H x3
Zd c2 c4 x3
H x3

X c1
H c2
Zd c1 x2 c2
H c2
X c1

X c1
H x2
Zd c1 c4 x2
H x2
X c1

H c1
Zd x0 x1 c1
H c1

X x0
H x1
Zd x0 c4 x1
H x1
X x0

H c4
Zd z d4 c4
H c4

END
