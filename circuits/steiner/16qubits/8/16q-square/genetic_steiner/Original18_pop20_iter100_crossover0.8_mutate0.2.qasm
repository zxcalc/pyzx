// Initial wiring: [6, 10, 13, 5, 11, 15, 3, 4, 12, 2, 1, 8, 9, 0, 14, 7]
// Resulting wiring: [6, 10, 13, 5, 11, 15, 3, 4, 12, 2, 1, 8, 9, 0, 14, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[10], q[9];
cx q[13], q[10];
cx q[13], q[14];
cx q[5], q[6];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[1], q[2];
