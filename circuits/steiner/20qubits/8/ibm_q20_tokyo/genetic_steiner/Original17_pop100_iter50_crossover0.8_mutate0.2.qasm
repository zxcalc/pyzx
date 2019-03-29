// Initial wiring: [18, 8, 6, 14, 9, 16, 19, 3, 2, 1, 11, 4, 12, 15, 0, 5, 17, 10, 7, 13]
// Resulting wiring: [18, 8, 6, 14, 9, 16, 19, 3, 2, 1, 11, 4, 12, 15, 0, 5, 17, 10, 7, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[0];
cx q[18], q[19];
cx q[15], q[16];
cx q[4], q[5];
cx q[1], q[2];
cx q[2], q[3];
