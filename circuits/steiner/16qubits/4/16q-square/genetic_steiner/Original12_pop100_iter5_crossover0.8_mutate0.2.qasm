// Initial wiring: [9, 1, 2, 3, 15, 4, 11, 6, 12, 14, 0, 5, 13, 10, 8, 7]
// Resulting wiring: [9, 1, 2, 3, 15, 4, 11, 6, 12, 14, 0, 5, 13, 10, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[9], q[6];
cx q[4], q[5];
cx q[1], q[6];
