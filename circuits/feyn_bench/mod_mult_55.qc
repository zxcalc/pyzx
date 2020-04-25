.v x0 x1 x2 y0 y1 y2 y3 y4 y5
.i x0 x1 x2
.o x0 x1 x2 y0 y1 y2 y3 y4 y5

BEGIN

X x2
H y4
Z x0 x2 y4
H y4
X x2

X x0
H y3
H y5
Z x1 y4 y3
Z x0 x2 y5
H y5
H y3

tof y3 y2
tof y3 y0
tof y5 y4

X x1
X y4
H y0
H y3
Z x1 y5 y3
Zd x1 y4 y0
H y3
H y0
X x1

tof y3 y1
tof y2 y5

H y2
H y5
Zd x1 y4 y2
Zd x0 x2 y5
H y5
H y2
X x0
X y4

tof y2 y5

END
