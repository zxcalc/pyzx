.v b0 a0 b1 a1 c1 b2 a2 b3 a3 c3 d3 b4 a4 b5 a5 c5 d5 e5 b6 a6 b7 a7 z c7
.i b0 a0 b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 b6 a6 b7 a7 z

BEGIN

tof a1 b1
tof a3 b3
tof a5 b5
tof a7 b7
tof a1 c1
tof a3 c3
tof a5 c5
tof a7 z

H a1
H a3
H a5
H a7

Z b0 a0 a1
Z b2 a2 a3
Z b4 a4 a5
Z b6 a6 a7

H a1
H a3
H a5
H a7

H c1
H c3
H c5
H z
H d3
H d5
H c7

Z b1 a1 c1
Z b3 a3 c3
Z b3 a3 d3
Z b5 a5 c5
Z b5 a5 d5
Z b7 a7 z
Z b7 a7 c7

tof a2 b2
tof a4 b4
tof a6 b6
tof b2 a3
tof b4 a5
tof b6 a7

Z b3 a3 d3
Z b5 a5 d5
Z b7 a7 c7

H c1
H d3
H c5
H d5
H c7

H e5

Z d5 c7 e5

Zd c5 c7 z
Zd c1 d3 c3

H e5
H c3

H c5

Zd c3 e5 z
Zd c3 d5 c5

H c5
H z

H e5

Zd d5 c7 e5

H e5

H d3
H d5
H c7

Zd b3 a3 d3
Zd b5 a5 d5
Zd b7 a7 c7

tof b2 a3
tof b4 a5
tof b6 a7
tof a2 b2
tof a4 b4
tof a6 b6

Zd b3 a3 d3
Zd b5 a5 d5
Zd b7 a7 c7

H c7

H a1
H a3
H a5
H a7

Zd b0 a0 a1
Zd b2 a2 a3
Zd b4 a4 a5
Zd b6 a6 a7

H a1
H a3
H a5
H a7

tof a1 b1
tof a3 b3
tof a5 b5
tof a7 b7
tof a2 b2
tof a4 b4
tof a6 b6
tof a2 a3
tof a4 a5
tof a6 a7
tof c1 a2
tof c3 a4
tof c5 a6

H a1
H a3
H a5
H a7

Z b0 a0 a1
Z b2 a2 a3
Z b4 a4 a5
Z b6 a6 a7

H a1
H a3
H a5
H a7

tof a1 b1
tof a3 b3
tof a5 b5
tof a7 b7

H a1
H a3
H a5
H a7

Zd b0 a0 a1
Zd b2 a2 a3
Zd b4 a4 a5
Zd b6 a6 a7

H a1
H a3
H a5
H a7

tof a2 b2
tof a4 b4
tof a6 b6
tof c1 a2
tof c3 a4
tof c5 a6
tof a2 a3
tof a4 a5
tof a6 a7
tof a0 b0
tof a2 b2
tof a4 b4
tof a6 b6

X b0
X b1
X b2
X b3
X b4
X b5

tof a1 b1
tof a3 b3
tof a5 b5

H a1
H a3
H a5

Z b0 a0 a1
Z b2 a2 a3
Z b4 a4 a5

H a1
H a3
H a5

tof a2 b2
tof a4 b4
Z b3 a3 d3
Z b5 a5 d5
tof b2 a3
tof b4 a5
Z b3 a3 d3
Z b5 a5 d5

H d3
H d5

H c5

Z c3 d5 c5

H c3

Z c1 d3 c3

H c1
H d3
H d5

Zd b3 a3 d3
Zd b5 a5 d5
tof b2 a3
tof b4 a5
Zd b3 a3 d3
Zd b5 a5 d5
tof a2 b2
tof a4 b4
Zd b3 a3 c3
Zd b5 a5 c5
Zd b1 a1 c1

H c1
H c3
H d3
H c5
H d5

H a1
H a3
H a5

Zd b0 a0 a1
Zd b2 a2 a3
Zd b4 a4 a5

H a1
H a3
H a5

tof a1 c1
tof a3 c3
tof a5 c5
tof a1 b1
tof a3 b3
tof a5 b5

X b0
X b1
X b2
X b3
X b4
X b5

END
