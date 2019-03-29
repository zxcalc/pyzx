// Initial wiring: [11, 7, 8, 4, 9, 1, 13, 15, 0, 5, 6, 12, 14, 2, 10, 3]
// Resulting wiring: [11, 7, 8, 4, 9, 1, 13, 15, 0, 5, 6, 12, 14, 2, 10, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[5];
cx q[5], q[6];
cx q[2], q[5];
cx q[2], q[3];
