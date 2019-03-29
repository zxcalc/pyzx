// Initial wiring: [4, 2, 1, 14, 3, 9, 13, 5, 0, 8, 12, 10, 15, 11, 6, 7]
// Resulting wiring: [4, 2, 1, 14, 3, 9, 13, 5, 0, 8, 12, 10, 15, 11, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[13], q[14];
cx q[8], q[15];
cx q[5], q[10];
cx q[3], q[4];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[5];
