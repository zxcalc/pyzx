// Initial wiring: [9, 4, 14, 2, 13, 11, 5, 3, 10, 0, 8, 1, 12, 15, 6, 7]
// Resulting wiring: [9, 4, 14, 2, 13, 11, 5, 3, 10, 0, 8, 1, 12, 15, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[4], q[5];
cx q[4], q[11];
cx q[5], q[10];
