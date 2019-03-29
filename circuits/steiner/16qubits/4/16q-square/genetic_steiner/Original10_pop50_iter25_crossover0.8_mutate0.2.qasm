// Initial wiring: [2, 4, 8, 5, 9, 1, 13, 3, 12, 10, 7, 11, 14, 15, 0, 6]
// Resulting wiring: [2, 4, 8, 5, 9, 1, 13, 3, 12, 10, 7, 11, 14, 15, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[5];
cx q[5], q[6];
cx q[2], q[5];
