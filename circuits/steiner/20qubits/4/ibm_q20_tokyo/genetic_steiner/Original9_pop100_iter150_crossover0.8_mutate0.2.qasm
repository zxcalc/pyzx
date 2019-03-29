// Initial wiring: [5, 10, 7, 6, 14, 4, 19, 16, 8, 13, 3, 9, 11, 12, 1, 2, 15, 0, 17, 18]
// Resulting wiring: [5, 10, 7, 6, 14, 4, 19, 16, 8, 13, 3, 9, 11, 12, 1, 2, 15, 0, 17, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[13], q[16];
cx q[2], q[8];
cx q[1], q[8];
