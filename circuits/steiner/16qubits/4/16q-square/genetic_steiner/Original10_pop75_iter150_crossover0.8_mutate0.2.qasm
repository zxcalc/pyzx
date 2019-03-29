// Initial wiring: [6, 11, 4, 10, 0, 8, 14, 12, 3, 13, 1, 9, 5, 15, 2, 7]
// Resulting wiring: [6, 11, 4, 10, 0, 8, 14, 12, 3, 13, 1, 9, 5, 15, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[11], q[10];
cx q[10], q[9];
cx q[5], q[10];
