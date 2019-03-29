// Initial wiring: [6, 10, 15, 0, 9, 12, 1, 5, 13, 8, 4, 2, 3, 14, 11, 7]
// Resulting wiring: [6, 10, 15, 0, 9, 12, 1, 5, 13, 8, 4, 2, 3, 14, 11, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[9], q[8];
cx q[11], q[4];
cx q[2], q[5];
