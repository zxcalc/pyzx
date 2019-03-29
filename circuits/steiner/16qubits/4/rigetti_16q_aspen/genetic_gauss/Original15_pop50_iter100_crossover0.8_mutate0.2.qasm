// Initial wiring: [6, 2, 3, 15, 11, 9, 1, 10, 14, 8, 12, 0, 13, 7, 4, 5]
// Resulting wiring: [6, 2, 3, 15, 11, 9, 1, 10, 14, 8, 12, 0, 13, 7, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[10];
cx q[10], q[14];
cx q[0], q[15];
cx q[1], q[12];
