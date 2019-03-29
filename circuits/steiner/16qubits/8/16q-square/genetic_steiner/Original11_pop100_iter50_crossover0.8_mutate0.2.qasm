// Initial wiring: [9, 14, 6, 15, 1, 11, 10, 2, 4, 12, 0, 3, 8, 5, 13, 7]
// Resulting wiring: [9, 14, 6, 15, 1, 11, 10, 2, 4, 12, 0, 3, 8, 5, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[2], q[1];
cx q[7], q[0];
cx q[12], q[11];
cx q[13], q[10];
cx q[15], q[14];
cx q[4], q[5];
cx q[5], q[10];
