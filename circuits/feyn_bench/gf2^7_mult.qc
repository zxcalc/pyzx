.v a0 a1 a2 a3 a4 a5 a6 b0 b1 b2 b3 b4 b5 b6 c0 c1 c2 c3 c4 c5 c6
.i a0 a1 a2 a3 a4 a5 a6 b0 b1 b2 b3 b4 b5 b6

BEGIN

H c0
H c1
H c2
H c3
H c4
H c5

Z a6 b1 c0
Z a5 b2 c0
Z a4 b3 c0
Z a3 b4 c0
Z a2 b5 c0
Z a1 b6 c0
Z a6 b2 c1
Z a5 b3 c1
Z a4 b4 c1
Z a3 b5 c1
Z a2 b6 c1
Z a6 b3 c2
Z a5 b4 c2
Z a4 b5 c2
Z a3 b6 c2
Z a6 b4 c3
Z a5 b5 c3
Z a4 b6 c3
Z a6 b5 c4
Z a5 b6 c4
Z a6 b6 c5

H c0
H c1
H c2
H c3
H c4
H c5

tof c5 c6
tof c4 c5
tof c3 c4
tof c2 c3
tof c1 c2
tof c0 c1

H c0
H c1
H c2
H c3
H c4
H c5
H c6

Z a6 b0 c6
Z a5 b1 c6
Z a4 b2 c6
Z a3 b3 c6
Z a2 b4 c6
Z a1 b5 c6
Z a0 b6 c6
Z a5 b0 c5
Z a4 b1 c5
Z a3 b2 c5
Z a2 b3 c5
Z a1 b4 c5
Z a0 b5 c5
Z a4 b0 c4
Z a3 b1 c4
Z a2 b2 c4
Z a1 b3 c4
Z a0 b4 c4
Z a3 b0 c3
Z a2 b1 c3
Z a1 b2 c3
Z a0 b3 c3
Z a2 b0 c2
Z a1 b1 c2
Z a0 b2 c2
Z a1 b0 c1
Z a0 b1 c1
Z a0 b0 c0

H c0
H c1
H c2
H c3
H c4
H c5
H c6

END
