.v e a0 b0 c0 d0 a1 b1 c1 d1 a2 b2 c2 d2 a3 b3 c3 a4 b4 c4 d4 a5 b5 c5 d5 a6 b6
.i a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 a6 b6

BEGIN

H e
H c0
H d0
H c1
H d1
H c2
H d2
H c3
H c4
H d4
H c5
H d5

Z a0 b0 d0
Z a1 b1 d1
Z a2 b2 d2
Z a3 b3 c3
Z a4 b4 d4
Z a5 b5 d5
Z a6 b6 e

tof a0 b0
tof a1 b1
tof a2 b2
tof a3 b3
tof a4 b4
tof a5 b5
tof a6 b6

Z b0 b1 c0
Z b2 b3 c2
Z b4 b5 c4

H c0
H d0
H c2
H d2
H c4
H d4

Z c0 c2 c1
Z c4 b6 c5
Z d0 b1 d1
Z d2 b3 c3
Z d4 b5 d5

H c1
H d1
H c5
H d5

Zd d1 c2 c3

H c3

Zd c1 c5 e
Zd b6 d5 e
Zd c5 c3 e

H e
H c3

Zd e c1 c3

H c3
H d1
H c1
H d0
H d4
H c5
H d5

Zd e c0 d1
Zd e b0 d0
Zd c0 c2 c1
Zd c3 c4 d5
Zd c3 b4 d4
Zd c4 b6 c5

H d0
H d1
H d4
H d5

H c0
H c2
H d2
H c4

Zd b0 b1 c0
Zd b2 b3 c2
Zd d1 b2 d2
Zd b4 b5 c4

H d2

tof e b0
tof d0 b1
tof d1 b2
tof d2 b3
tof c3 b4
tof d4 b5
tof d5 b6

X b0
X b1
X b2
X b3
X b4
X b5
X b6

tof a0 b0
tof a1 b1
tof a2 b2
tof a3 b3
tof a4 b4
tof a5 b5
tof a6 b6

H d2

Z b0 b1 c0
Z b2 b3 c2
Z d1 b2 d2
Z b4 b5 c4

H c0
H c2
H d2
H c4
H d0
H d1
H d4
H d5

Z e c0 d1
Z e b0 d0
Z c0 c2 c1
Z c3 c4 d5
Z c3 b4 d4
Z c4 b6 c5

H d1
H c1
H d0
H d4
H c5
H d5
H c3

Z e c1 c3

H e
H c3

Z b6 d5 e
Z c5 c3 e

H c3

Z d1 c2 c3

H c1
H d1
H c5
H d5

Zd c0 c2 c1
Zd c4 b6 c5
Zd d0 b1 d1
Zd d2 b3 c3
Zd d4 b5 d5

H c0
H d0
H c2
H d2
H c4
H d4

Zd b0 b1 c0
Zd b2 b3 c2
Zd b4 b5 c4

tof a0 b0
tof a1 b1
tof a2 b2
tof a3 b3
tof a4 b4
tof a5 b5
tof a6 b6

Zd a0 b0 d0
Zd a1 b1 d1
Zd a2 b2 d2
Zd a3 b3 c3
Zd a4 b4 d4
Zd a5 b5 d5
Zd a6 b6 e

H e
H c0
H d0
H c1
H d1
H c2
H d2
H c3
H c4
H d4
H c5
H d5

END
