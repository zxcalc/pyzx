// Initial wiring: [6, 14, 11, 0, 15, 2, 4, 3, 10, 5, 9, 12, 7, 8, 13, 1]
// Resulting wiring: [6, 14, 11, 0, 15, 2, 4, 3, 10, 5, 9, 12, 7, 8, 13, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[13], q[14];
cx q[5], q[10];
cx q[4], q[11];
