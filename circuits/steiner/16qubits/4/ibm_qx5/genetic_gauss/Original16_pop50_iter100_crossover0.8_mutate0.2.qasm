// Initial wiring: [13, 0, 2, 14, 7, 10, 15, 12, 3, 5, 11, 9, 4, 1, 8, 6]
// Resulting wiring: [13, 0, 2, 14, 7, 10, 15, 12, 3, 5, 11, 9, 4, 1, 8, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[6];
cx q[13], q[2];
cx q[4], q[15];
cx q[0], q[10];
