# Original circuit
#   qubits: 9
#   qubits used: 9
#   H: 14
#   cnot: 55
#   X: 8
#   T: 49
#   P: 0
#   Z: 0
#   tdepth (by partitions): 21
#   tdepth (by critical paths): 15
# Optimized circuit
#   qubits: 9
#   qubits used: 9
#   H: 14
#   cnot: 161
#   X: 13
#   T: 37
#   P: 6
#   Z: 0
#   tdepth (by partitions): 7
#   tdepth (by critical paths): 7
#   Time: 0.001 s
.v x0 x1 x2 y0 y1 y2 y3 y4 y5
.i x0 x1 x2
.o x0 x1 x2 y0 y1 y2 y3 y4 y5

BEGIN
H y4
tof y4 y1
tof y4 y2
tof y4 y3
tof x1 x2
tof x1 y3
tof x1 y2
tof x1 y0
tof x0 y3
tof x0 y1
tof x0 y0
tof x1
tof y0
tof y2
tof y3
T x0
T x1
T y4
P* y0
T* y0
T* y1
T* y2
T y3
tof x2 x1
tof x2 y0
tof x2 y2
tof x2 y3
tof y4 y3
tof y4 y2
tof y4 y1
tof x1 y0
tof x1 y3
tof x1 y2
tof x0 y0
tof x0 y3
tof x0 y1
H y4
tof x0
H y3
H y5
tof y5 x0
tof y4 x2
tof y5 x1
tof y4 y0
tof y3 y1
tof y4 y1
tof y3 y2
tof y4 y3
tof y3 y4
tof x2 y4
tof x2 y3
tof x0
T y0
T y2
T* x2
T* y3
T* y1
T y4
T y5
T* x0
T* x1
tof y3 y0
tof y4 y0
tof x2 y2
tof y4 y2
tof y4 x2
tof y4 y3
tof y5 y4
tof x0 y4
tof x1 y4
tof x1 y5
tof y5 x0
tof y5 x1
tof y4 x0
tof y3 x0
tof y3 y4
tof y3 y1
tof x2 x0
tof x2 y4
tof x2 y1
tof y4
T y4
tof x0 y4
tof y5 y4
tof x1 y4
H x1
H x2
tof x2 y0
tof x2 y2
tof x1 y3
H y0
H y2
tof x1 y4
tof x1 y1
tof x1 y3
tof y0 y1
tof x0 y3
tof y4 y3
tof y4 y1
tof y4 y2
T x1
T* y4
T y2
T y0
T* x0
T* y1
tof y2 x1
tof y0 x1
tof y1 x1
tof y0 y4
tof y1 y4
tof y0 y2
tof x0 y2
tof y1 y0
tof y1 x0
tof x0 y1
tof y0 x0
tof y4 y2
tof x1 y2
tof x1 y4
tof x1 y0
T x1
T* y0
T* y4
T* y2
T x0
T* y1
tof y0 x1
tof y2 x1
tof x0 x1
tof y4 y0
tof y2 y0
tof x0 y0
tof x0 y2
tof y1 y2
tof y1 x0
tof y3 x0
tof y3 y1
tof y2 y1
tof y0 y4
H y4
H x0
tof y4 x1
tof x2 y0
H x2
H y0
tof x1 y3
tof y0 y3
tof x2 y1
tof y0 y5
tof y2 y4
tof x2 y4
tof x1 y2
tof y1 y2
tof y4
tof y2
tof y3
T x2
T* y1
T* y4
T y2
T y0
T* y3
T* y5
tof y1 x2
tof y0 x2
tof y3 x2
tof y5 x2
tof x1 x2
tof y2 y1
tof x1 y1
tof y2 y4
tof y0 y4
tof y3 y4
tof y5 y4
tof x1 y4
tof y0 y2
tof y3 y2
tof y5 y2
tof y3 y0
tof y5 y0
tof x1 y0
tof y5 y3
tof x1 y3
tof y3 y5
tof y0 y5
tof y0 y3
tof y1 y2
tof x2 y4
tof x2 y2
tof x2 y0
T x2
tof y0 x2
tof y5 x2
tof y3 x2
tof x1 y4
tof x2
H y3
H y2
tof x1 x2
tof x1 y1
tof y0 y4
tof x2
tof x1
P y0
P x2
P y5
P y4
P x1
tof y1 x2
tof y1 x1
tof y2 y3
tof y0 y4
tof x2 y5
tof y5 x2
tof x2 y5
tof y5 y3
tof y3 y5
tof y5 y3
tof y3 y4
tof y4 y3
tof y3 y4
tof y4 x1
tof x1 y4
tof y4 x1
tof x1 y0
tof y0 x1
tof x1 y0
tof y0 x0
tof x0 y0
tof y0 x0
END
