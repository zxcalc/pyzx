// Initial wiring: [8, 10, 9, 13, 2, 17, 11, 0, 19, 1, 12, 15, 3, 4, 16, 7, 14, 5, 6, 18]
// Resulting wiring: [8, 10, 9, 13, 2, 17, 11, 0, 19, 1, 12, 15, 3, 4, 16, 7, 14, 5, 6, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[4];
cx q[15], q[5];
cx q[16], q[8];
cx q[12], q[9];
cx q[19], q[16];
cx q[15], q[18];
cx q[9], q[18];
cx q[3], q[11];
