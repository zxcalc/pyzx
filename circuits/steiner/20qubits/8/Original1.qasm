// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[9];
cx q[12], q[9];
cx q[12], q[14];
cx q[8], q[5];
cx q[12], q[6];
cx q[3], q[4];
cx q[2], q[4];
cx q[13], q[4];
