// Initial wiring: [9, 10, 11, 13, 3, 15, 8, 5, 12, 4, 7, 6, 0, 1, 2, 14]
// Resulting wiring: [9, 10, 11, 13, 3, 15, 8, 5, 12, 4, 7, 6, 0, 1, 2, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[13], q[14];
cx q[10], q[11];
cx q[4], q[5];
