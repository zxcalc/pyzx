# Original circuit
#   qubits: 5
#   qubits used: 5
#   H: 6
#   cnot: 32
#   X: 1
#   T: 28
#   P: 0
#   Z: 0
#   tdepth (by partitions): 12
#   tdepth (by critical paths): 12
# Optimized circuit
#   qubits: 5
#   qubits used: 5
#   H: 6
#   cnot: 48
#   X: 1
#   T: 16
#   P: 6
#   Z: 0
#   tdepth (by partitions): 6
#   tdepth (by critical paths): 6
#   Time: 0.000 s
.v b c d e a
.i b c d e
.o b c d e a

BEGIN
tof a
H a
tof e b
tof d c
tof e d
tof a d
tof d a
T* b
T* a
T d
T* c
tof a b
tof d b
tof e b
tof d a
tof e d
tof d c
tof b c
tof b e
T* b
T e
T* d
T* c
tof a b
tof a e
tof a d
tof b e
tof b c
P b
P e
P a
P d
P c
tof a e
P* e
tof a e
H a
tof e a
H a
tof a c
tof a d
T a
T* c
T* d
tof c a
tof d a
tof c d
tof a d
tof a c
T a
tof c a
tof d a
H d
tof c d
H d
tof d b
tof d a
T d
T* b
T* a
tof b d
tof a d
tof b a
tof d a
tof d b
T d
tof b d
tof a d
H a
tof b a
tof d a
tof d c
tof c d
tof d c
tof c b
tof b c
tof c b
END
