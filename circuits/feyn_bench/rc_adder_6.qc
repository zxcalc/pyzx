.v b0 a0 e b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 z
.i b0 a0 b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 z
.o b0 a0 e b1 a1 b2 a2 b3 a3 b4 a4 b5 a5 z

BEGIN

tof a1 b1
tof a2 b2
tof a3 b3
tof a4 b4
tof a5 b5

tof a1 e

H e
Z b0 a0 e
H e
tof a2 a1

H a1
Z e b1 a1
H a1
tof a3 a2

H a2
Z a1 b2 a2
H a2
tof a4 a3

H a3
Z a2 b3 a3
H a3
tof a5 a4

H a4
Z a3 b4 a4
H a4
tof a5 z

X b1
X b2
X b3
X b4
H z
Z a4 b5 z
H z

tof e b1
tof a1 b2
tof a2 b3
tof a3 b4
tof a4 b5

H a4
Zd a3 b4 a4
H a4

H a3
Zd a2 b3 a3
H a3
X b4
tof a5 a4

H a2
Zd a1 b2 a2
H a2
X b3
tof a4 a3

H a1
Zd e b1 a1
H a1
X b2
tof a3 a2

H e
Zd b0 a0 e
H e
X b1
tof a2 a1

tof a1 e

tof a0 b0
tof a1 b1
tof a2 b2
tof a3 b3
tof a4 b4
tof a5 b5

END
