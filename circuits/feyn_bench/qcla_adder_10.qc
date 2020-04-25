.v a0 b0 c0 a1 b1 c1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6 c6 d6 a7 b7 c7 a8 b8 c8 d8 a9 b9 c9 e
.i a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 a6 b6 a7 b7 a8 b8 a9 b9

BEGIN
H c0
H c1
H c2
H d2
H c3
H c4
H d4
H c5
H d5
H c6
H d6
H c7
H c8
H d8
H c9

Z a0 b0 c0
Z a1 b1 c1
Z a2 b2 d2
Z a3 b3 c3
Z a4 b4 d4
Z a5 b5 d5
Z a6 b6 d6
Z a7 b7 c7
Z a8 b8 d8
Z a9 b9 c9

tof a1 b1
tof a2 b2
tof a3 b3
tof a4 b4
tof a5 b5
tof a6 b6
tof a7 b7
tof a8 b8
tof a9 b9

Z b2 b3 c2
Z b4 b5 c4
Z b6 b7 c6
Z b8 b9 c8

H c0
H c2
H d2
H c4
H d4
H c6
H d6
H c8
H d8

Zd c0 b1 c1
Zd d2 b3 c3
Zd d4 b5 d5
Zd d6 b7 c7
Zd d8 b9 c9
Zd c4 c6 c5

H c1
H c5
H d5

Z c1 c2 c3
Z d5 c6 c7

H c3
H d5

Zd c3 c5 c7
Z c3 c4 d5

H c7
H d5

H d2
H d4
H d6
H d8
H c5

Zd c1 b2 d2
Zd c3 b4 d4
Zd d5 b6 d6
Zd c7 b8 d8
Z c7 c8 c9
Z c4 c6 c5

H c2
H c4
H c6
H c8

Z b2 b3 c2
Z b4 b5 c4
Z b6 b7 c6
Z b8 b9 c8

H d2
H d4
H d6
H d8
H c9
H c5
H c2
H c4
H c6
H c8

tof b0 e
tof b1 c0
tof b2 c1
tof b3 d2
tof b4 c3
tof b5 d4
tof b6 d5
tof b7 d6
tof b8 c7
tof b9 c8

tof a0 e
tof a1 b1
tof a2 b2
tof a3 b3
tof a4 b4
tof a5 b5
tof a6 b6
tof a7 b7
tof a8 b8
tof a9 b9


END
