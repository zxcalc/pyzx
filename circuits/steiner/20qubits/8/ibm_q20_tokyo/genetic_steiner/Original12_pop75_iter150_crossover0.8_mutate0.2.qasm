// Initial wiring: [9, 4, 8, 3, 1, 2, 17, 19, 18, 5, 10, 16, 11, 13, 15, 12, 6, 0, 14, 7]
// Resulting wiring: [9, 4, 8, 3, 1, 2, 17, 19, 18, 5, 10, 16, 11, 13, 15, 12, 6, 0, 14, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[6], q[5];
cx q[6], q[4];
cx q[11], q[8];
cx q[17], q[16];
cx q[19], q[18];
cx q[8], q[11];
cx q[2], q[3];
