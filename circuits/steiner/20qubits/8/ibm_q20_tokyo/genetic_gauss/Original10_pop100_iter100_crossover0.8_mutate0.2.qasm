// Initial wiring: [5, 8, 9, 11, 2, 15, 7, 14, 13, 19, 10, 1, 12, 3, 17, 18, 4, 6, 16, 0]
// Resulting wiring: [5, 8, 9, 11, 2, 15, 7, 14, 13, 19, 10, 1, 12, 3, 17, 18, 4, 6, 16, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[2];
cx q[8], q[7];
cx q[8], q[5];
cx q[16], q[0];
cx q[16], q[4];
cx q[12], q[18];
cx q[2], q[19];
cx q[3], q[18];
