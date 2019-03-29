// Initial wiring: [9, 1, 13, 3, 8, 11, 5, 4, 10, 2, 6, 0, 12, 7, 14, 15]
// Resulting wiring: [9, 1, 13, 3, 8, 11, 5, 4, 10, 2, 6, 0, 12, 7, 14, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[10], q[11];
cx q[2], q[5];
cx q[5], q[4];
