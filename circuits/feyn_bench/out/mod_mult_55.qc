# Feynman -- quantum circuit toolkit
# Original (mod_mult_55.qc):
#   Qubits: 9
#   H: 14
#   T: 49
#   X: 8
#   cnot: 55
#   Depth: 50
#   T depth: 15
# Result (12.330ms):
#   Qubits: 9
#   H: 14
#   S: 1
#   T: 35
#   cnot: 40
#   swap: 3
#   Depth: 53
#   T depth: 20
.v x0 x1 x2 y0 y1 y2 y3 y4 y5
.i x0 x1 x2
.o x0 x1 x2 y0 y1 y2 y3 y4 y5
BEGIN 
H y4
T y4
cnot x0 y4
T* y4
cnot x2 y4
T* y4
cnot x0 y4
T y4
cnot x2 y4
H y4
H y3
H y5
T y5
cnot x0 y5
T y5
cnot x2 y5
T* y5
cnot x0 y5
T* y5
cnot x2 y5
H y5
T y3
cnot x1 y3
T* y3
cnot y4 y3
T y3
cnot x1 y3
T* y3
cnot y4 y3
swap y0 y1
H y3
cnot y3 y0
cnot y3 y1
cnot y5 y4
swap y2 y3
swap y1 y3
H y0
H y3
T y3
cnot x1 y3
T y3
cnot y5 y3
T* y3
cnot x1 y3
T* y3
cnot y5 y3
H y3
T* y0
cnot x1 y0
T* y0
cnot y4 y0
T* y0
cnot x1 y0
T* y0
cnot y4 y0
H y0
T y5
cnot x1 y5
T y5
cnot y4 y5
T* y5
cnot x1 y5
T y5
cnot y3 y1
cnot y4 y5
cnot y2 y5
H y2
H y5
T* y5
cnot x0 y5
T* y5
cnot x2 y5
T y5
cnot x0 y5
T y5
cnot x2 y5
H y5
T* y2
cnot x1 y2
T y2
cnot y4 y2
T y2
cnot x1 y2
T* y2
cnot y4 y2
H y2
T x0
T* x2
cnot x0 x2
T x2
S y4
cnot y2 y5
cnot x0 x2
END
