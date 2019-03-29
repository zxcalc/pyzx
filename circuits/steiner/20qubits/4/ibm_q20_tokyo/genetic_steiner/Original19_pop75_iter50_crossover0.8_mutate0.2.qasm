// Initial wiring: [16, 5, 4, 17, 10, 0, 1, 19, 9, 2, 11, 15, 8, 14, 6, 12, 7, 3, 13, 18]
// Resulting wiring: [16, 5, 4, 17, 10, 0, 1, 19, 9, 2, 11, 15, 8, 14, 6, 12, 7, 3, 13, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[15], q[16];
cx q[4], q[6];
cx q[2], q[7];
