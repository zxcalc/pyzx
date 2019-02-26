// Initial wiring: [4, 3, 2, 5, 0, 8, 6, 7, 1]
// Resulting wiring: [4, 3, 2, 5, 0, 8, 6, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[3], q[8];
cx q[2], q[3];
cx q[1], q[2];
cx q[3], q[8];
cx q[6], q[5];
