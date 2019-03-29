// Initial wiring: [2, 5, 16, 1, 19, 14, 7, 12, 6, 13, 10, 3, 15, 18, 17, 0, 9, 4, 8, 11]
// Resulting wiring: [2, 5, 16, 1, 19, 14, 7, 12, 6, 13, 10, 3, 15, 18, 17, 0, 9, 4, 8, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[4];
cx q[12], q[6];
cx q[13], q[12];
cx q[13], q[19];
cx q[5], q[14];
cx q[4], q[6];
