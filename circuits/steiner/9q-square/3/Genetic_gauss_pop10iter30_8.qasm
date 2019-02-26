// Initial wiring: [0 1 2 3 7 5 4 6 8]
// Resulting wiring: [0 1 2 3 8 5 4 6 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[3], q[4];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[3], q[8];
