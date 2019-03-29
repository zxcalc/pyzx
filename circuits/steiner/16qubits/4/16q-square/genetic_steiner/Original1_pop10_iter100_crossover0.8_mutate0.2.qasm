// Initial wiring: [11, 3, 7, 12, 1, 5, 0, 8, 13, 14, 9, 4, 10, 15, 2, 6]
// Resulting wiring: [11, 3, 7, 12, 1, 5, 0, 8, 13, 14, 9, 4, 10, 15, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[8], q[9];
cx q[2], q[5];
