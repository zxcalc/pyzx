.v cin a0 b0 c0 d0 a1 b1 c1 d1 e1 a2 b2 c2 d2 e2
.i cin a0 b0 a1 b1 a2 b2

BEGIN

H c0
H c1
H c2

Z a0 b0 c0
Z a1 b1 c1
Z a2 b2 c2

H c0
H c1
H c2

tof a0 b0
tof c0 d0
tof a1 b1
tof c1 e1
tof a2 b2
tof c2 e2

H c1
H e1
H c2
H e2

tof b0 c0
tof b2 d2
Z d0 b1 e1

H e1

Zd c0 b1 c1
Zd e1 b2 e2

H c1

Z c1 b2 c2

tof b1 d1

tof c0 b1
tof c1 b2

tof d0 d1
tof e1 d2

H c2
H e2

tof e2 c2
tof d2 b2
tof d1 b1

H e2
H d2
H d1

Z cin c2 e2
Zd cin b2 d2
Z cin b1 d1

H e2
H d2
H d1

tof e2 c2
tof d2 b2
tof d1 b1

tof cin b0

END
