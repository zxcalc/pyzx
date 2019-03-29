// Initial wiring: [9, 13, 2, 14, 8, 3, 6, 5, 0, 10, 15, 4, 1, 7, 12, 11]
// Resulting wiring: [9, 13, 2, 14, 8, 3, 6, 5, 0, 10, 15, 4, 1, 7, 12, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[1];
cx q[9], q[6];
cx q[13], q[10];
cx q[12], q[13];
cx q[13], q[14];
cx q[5], q[6];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[5];
