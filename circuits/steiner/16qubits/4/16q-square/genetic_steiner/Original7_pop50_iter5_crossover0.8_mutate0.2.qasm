// Initial wiring: [6, 7, 5, 1, 3, 15, 10, 8, 4, 11, 12, 0, 14, 13, 9, 2]
// Resulting wiring: [6, 7, 5, 1, 3, 15, 10, 8, 4, 11, 12, 0, 14, 13, 9, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[9];
cx q[9], q[14];
cx q[5], q[10];
cx q[2], q[3];
