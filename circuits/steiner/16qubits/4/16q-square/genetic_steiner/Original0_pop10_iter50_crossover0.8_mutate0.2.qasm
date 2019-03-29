// Initial wiring: [15, 4, 10, 8, 12, 14, 9, 13, 5, 1, 3, 2, 6, 11, 0, 7]
// Resulting wiring: [15, 4, 10, 8, 12, 14, 9, 13, 5, 1, 3, 2, 6, 11, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[8];
cx q[2], q[5];
cx q[5], q[10];
