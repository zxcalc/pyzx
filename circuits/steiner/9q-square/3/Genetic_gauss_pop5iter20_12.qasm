// Initial wiring: [0 3 2 4 1 5 6 7 8]
// Resulting wiring: [0 3 2 4 1 5 6 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[5], q[4];
cx q[3], q[8];
