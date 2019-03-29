// Initial wiring: [9, 13, 1, 15, 7, 8, 4, 5, 14, 10, 2, 12, 0, 11, 6, 3]
// Resulting wiring: [9, 13, 1, 15, 7, 8, 4, 5, 14, 10, 2, 12, 0, 11, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[5], q[6];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
