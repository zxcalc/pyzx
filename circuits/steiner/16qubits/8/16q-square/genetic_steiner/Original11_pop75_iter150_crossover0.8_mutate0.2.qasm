// Initial wiring: [6, 9, 14, 12, 13, 7, 2, 10, 15, 8, 3, 4, 1, 11, 0, 5]
// Resulting wiring: [6, 9, 14, 12, 13, 7, 2, 10, 15, 8, 3, 4, 1, 11, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[6], q[1];
cx q[15], q[14];
cx q[12], q[13];
cx q[13], q[14];
cx q[9], q[10];
cx q[0], q[1];
