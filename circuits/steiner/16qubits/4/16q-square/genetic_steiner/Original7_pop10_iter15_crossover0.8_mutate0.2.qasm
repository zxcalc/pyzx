// Initial wiring: [10, 8, 15, 12, 4, 11, 1, 2, 13, 5, 9, 0, 14, 3, 6, 7]
// Resulting wiring: [10, 8, 15, 12, 4, 11, 1, 2, 13, 5, 9, 0, 14, 3, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[4], q[5];
cx q[5], q[10];
cx q[2], q[3];
