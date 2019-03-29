// Initial wiring: [6, 13, 8, 1, 15, 12, 9, 2, 4, 10, 3, 11, 7, 0, 5, 14]
// Resulting wiring: [6, 13, 8, 1, 15, 12, 9, 2, 4, 10, 3, 11, 7, 0, 5, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[6];
cx q[5], q[6];
cx q[4], q[5];
