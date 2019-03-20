// Initial wiring: [6, 4, 8, 0, 3, 1, 2, 7, 5]
// Resulting wiring: [6, 4, 8, 0, 3, 1, 2, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[1], q[4];
cx q[4], q[5];
cx q[3], q[8];
cx q[2], q[3];
cx q[3], q[8];
