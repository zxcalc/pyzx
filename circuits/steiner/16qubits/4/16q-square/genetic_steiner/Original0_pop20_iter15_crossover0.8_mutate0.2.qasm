// Initial wiring: [6, 9, 14, 10, 8, 3, 5, 1, 12, 15, 4, 13, 2, 0, 7, 11]
// Resulting wiring: [6, 9, 14, 10, 8, 3, 5, 1, 12, 15, 4, 13, 2, 0, 7, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[6];
cx q[10], q[9];
cx q[2], q[5];
