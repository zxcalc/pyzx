// Initial wiring: [6, 3, 14, 12, 8, 1, 11, 9, 15, 2, 10, 7, 5, 4, 13, 0]
// Resulting wiring: [6, 3, 14, 12, 8, 1, 11, 9, 15, 2, 10, 7, 5, 4, 13, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[2];
cx q[12], q[11];
cx q[8], q[9];
