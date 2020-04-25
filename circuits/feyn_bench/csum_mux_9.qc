.v c00 c01 c10 c11 e10 e11 c20 c21 c30 c31 a0 a1 e30 e31 c40 c41 c50 c51 e50 e51 c60 c61 c70 c71 b0 b1 b2 b3 e70 e71
.i c00 c01 c10 c11 e10 e11 c20 c21 c30 c31 e30 e31 c40 c41 c50 c51 e50 e51 c60 c61 c70 c71 e70 e71

BEGIN

H e10
H e11
H a0
H a1
H e30
H e31
H e50
H e51
H b0
H b1
H b2
H b3
H e70
H e71


Z c00 c11 e10

X c01
Z c01 c10 e11
X c01

X c00
Z c00 c10 e10
X c00

Z c01 c11 e11



Z c20 c31 a0

X c21
Z c21 c30 a1
X c21

X c20
Z c20 c30 a0
X c20

Z c21 c31 a1



Z c40 c51 e50

X c41
Z c41 c50 e51
X c41

X c40
Z c40 c50 e50
X c40

Z c41 c51 e51




Z c60 c71 b0

X c61
Z c61 c70 b1
X c61

X c60
Z c60 c70 b0
X c60

Z c61 c71 b1

H e10
H e11
H a0
H a1
H e50
H e51
H b0
H b1


X e10
Z e10 a0 e30
X e10

Z e11 a1 e31

X e11
Z e11 a0 e31
X e11

Z e10 a1 e30



X e50
Z e50 b0 b2
X e50

Z e51 b1 b3

X e51
Z e51 b0 b3
X e51

Z e50 b1 b2

H e30
H e31
H b2
H b3



X e30
Z e30 b2 e70
X e30

Z e31 b3 e71

X e31
Z e31 b2 e71
X e31

Z e30 b3 e70

H e70
H e71

END
