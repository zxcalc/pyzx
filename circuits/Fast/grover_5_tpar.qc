# Original circuit
#   qubits: 9
#   qubits used: 7
#   H: 85
#   cnot: 140
#   X: 40
#   T: 140
#   P: 0
#   Z: 0
#   tdepth (by partitions): 60
#   tdepth (by critical paths): 60
# Optimized circuit
#   qubits: 9
#   qubits used: 9
#   H: 27
#   cnot: 317
#   X: 25
#   T: 52
#   P: 26
#   Z: 1
#   tdepth (by partitions): 18
#   tdepth (by critical paths): 18
#   Time: 0.001 s
.v a b c d e Workspace 0 1 2
.i a b c d e
.o a b c d e Workspace 0 1 2

BEGIN
tof a
tof b
H 0
tof 0 a
tof c b
tof 0 b
tof 0 Workspace
tof b Workspace
tof a Workspace
T 0
T* a
T* b
T Workspace
tof a 0
tof b a
tof c b
tof b Workspace
tof a b
tof 0 Workspace
tof 0 b
tof 0 a
tof 0
tof e
H b
H 1
tof 1 0
tof 1 c
tof b Workspace
tof 1 b
tof 0 c
tof 0 Workspace
T 1
T* 0
T* b
T Workspace
tof 0 1
tof b 0
tof c 0
tof c Workspace
tof b Workspace
tof 0 b
tof 1 Workspace
tof 1 b
tof 1 0
tof c
H b
H e
tof b c
tof b d
tof b e
tof 2 e
tof 2 Workspace
tof b 2
tof e 2
tof e Workspace
tof c d
tof c Workspace
T b
T 2
T* c
T* Workspace
T* e
tof c 2
tof c e
tof 2 e
tof 2 Workspace
tof 2 c
tof b e
tof b Workspace
T 2
tof b 2
tof c 2
tof d
H b
tof 0 d
tof b d
tof 0 1
tof b 1
tof b 0
tof d 1
T* 0
T d
tof d 0
tof 1 d
tof b d
tof 0 d
tof 0 1
tof d 1
tof 2 0
tof d 0
tof b d
tof Workspace d
tof Workspace b
tof b Workspace
tof d b
tof 0 2
tof 1 2
tof 1 d
tof 1 0
P b
P* 1
Z 0
P Workspace
P* d
tof 1 b
tof 2 b
tof 2 1
tof 2 0
tof d Workspace
tof 2 Workspace
tof 2 d
tof Workspace d
tof b 1
tof b Workspace
tof 2
tof a
H 1
tof 1 2
tof b a
tof 1 a
tof 1 Workspace
tof a Workspace
tof 2 Workspace
P 1
P* 2
P* a
P Workspace
tof 2 1
tof a 2
tof Workspace a
tof b a
tof a Workspace
tof 2 Workspace
tof 1 Workspace
tof 1 a
tof 1 2
tof 1
H Workspace
tof Workspace 1
tof d 1
tof Workspace b
tof d b
tof Workspace d
tof 1 b
T* d
T 1
tof 1 d
tof b 1
tof Workspace 1
tof d 1
tof b
H 1
tof 1 b
tof 1 0
tof 1 c
tof e c
tof e a
tof 1 e
tof c e
tof c a
tof b 0
tof b a
T 1
T e
T* b
T* a
T* c
tof b e
tof b c
tof e c
tof e a
tof e b
tof 1 c
tof 1 a
T e
tof 1 e
tof b e
tof 0
H 1
tof Workspace 0
tof 1 0
tof Workspace d
tof 1 d
tof 1 Workspace
tof 0 d
T* Workspace
T 0
tof 0 Workspace
tof d 0
tof 1 0
tof Workspace 0
tof Workspace d
tof 0 d
tof 0 Workspace
tof a 1
tof 1 a
tof 0 1
tof d Workspace
tof d 1
P 0
P* d
P a
P* 1
tof d 0
tof Workspace 0
tof Workspace d
tof 1 a
tof Workspace a
tof Workspace 1
tof a 1
tof 0 d
tof 0 a
tof Workspace
tof 2
H d
tof d Workspace
tof 0 2
tof d 2
tof d a
tof 2 a
tof Workspace a
P d
P* Workspace
P* 2
P a
tof Workspace d
tof 2 Workspace
tof a 2
tof 0 2
tof 2 a
tof Workspace a
tof d a
tof d 2
tof d Workspace
tof d
H a
tof a d
tof 1 d
tof a 0
tof 1 0
tof a 1
tof d 0
T* 1
T d
tof d 1
tof 0 d
tof a d
tof 1 d
tof 0
H d
tof d 0
tof d e
tof d b
tof c b
tof c 2
tof d c
tof b c
tof b 2
tof 0 e
tof 0 2
T d
T c
T* 0
T* 2
T* b
tof 0 c
tof 0 b
tof c b
tof c 2
tof c 0
tof d b
tof d 2
T c
tof d c
tof 0 c
tof e
H d
tof a e
tof d e
tof a 1
tof d 1
tof d a
tof e 1
T* a
T e
tof e a
tof 1 e
tof d e
tof a e
tof a 1
tof e 1
tof e a
tof 2 d
tof d 2
tof e d
tof 1 a
tof 1 d
P e
P* 1
P 2
P* d
tof 1 e
tof a e
tof a 1
tof d 2
tof a 2
tof a d
tof 2 d
tof e 1
tof e 2
tof a
tof Workspace
H 1
tof 1 a
tof e Workspace
tof 1 Workspace
tof 1 2
tof Workspace 2
tof a 2
P 1
P* a
P* Workspace
P 2
tof a 1
tof Workspace a
tof 2 Workspace
tof e Workspace
tof Workspace 2
tof a 2
tof 1 2
tof 1 Workspace
tof 1 a
tof 1
H 2
tof 2 1
tof d 1
tof 2 e
tof d e
tof 2 d
tof 1 e
T* d
T 1
tof 1 d
tof e 1
tof 2 1
tof d 1
tof e
H 1
tof 1 e
tof 1 c
tof 1 0
tof b 0
tof b Workspace
tof 1 b
tof 0 b
tof 0 Workspace
tof e c
tof e Workspace
T 1
T b
T* e
T* Workspace
T* 0
tof e b
tof e 0
tof b 0
tof b Workspace
tof b e
tof 1 0
tof 1 Workspace
T b
tof 1 b
tof e b
tof c
H e
H 1
tof 1 c
tof 1 d
tof 2 Workspace
tof 1 2
tof c d
tof c Workspace
T 1
T* c
T* 2
T Workspace
tof c 1
tof 2 c
tof d c
tof d Workspace
tof 2 Workspace
tof c 2
tof 1 Workspace
tof 1 2
tof 1 c
tof d
H 2
tof c d
tof c 1
tof d 1
P c
P* d
tof d c
tof 1 d
tof c d
tof 1
tof a
H d
tof d 1
tof c a
tof d a
tof d Workspace
tof a Workspace
tof 1 Workspace
T d
T* 1
T* a
T Workspace
tof 1 d
tof a 1
tof c a
tof a Workspace
tof 1 a
tof d Workspace
tof d a
tof d 1
H a
tof e
H d
H 1
H c
H b
H e
tof a d
tof d a
tof a d
tof d b
tof b d
tof d b
tof b 1
tof 1 b
tof b 1
tof 1 2
tof 2 1
tof 1 2
tof 2 0
tof 0 2
tof 2 0
END
