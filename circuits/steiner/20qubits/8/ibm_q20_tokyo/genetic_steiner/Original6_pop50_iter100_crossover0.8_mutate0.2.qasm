// Initial wiring: [16, 17, 6, 19, 14, 18, 2, 1, 7, 9, 8, 11, 3, 4, 15, 12, 13, 5, 10, 0]
// Resulting wiring: [16, 17, 6, 19, 14, 18, 2, 1, 7, 9, 8, 11, 3, 4, 15, 12, 13, 5, 10, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[5], q[4];
cx q[7], q[6];
cx q[8], q[2];
cx q[8], q[1];
cx q[12], q[7];
cx q[7], q[2];
cx q[16], q[14];
