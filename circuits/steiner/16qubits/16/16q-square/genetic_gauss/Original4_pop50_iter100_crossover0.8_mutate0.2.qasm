// Initial wiring: [10, 4, 12, 6, 0, 8, 13, 15, 2, 3, 1, 9, 11, 14, 5, 7]
// Resulting wiring: [10, 4, 12, 6, 0, 8, 13, 15, 2, 3, 1, 9, 11, 14, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[6];
cx q[9], q[0];
cx q[6], q[1];
cx q[12], q[3];
cx q[13], q[3];
cx q[12], q[6];
cx q[8], q[10];
cx q[7], q[12];
cx q[7], q[9];
cx q[6], q[7];
cx q[5], q[8];
cx q[4], q[9];
cx q[2], q[9];
cx q[1], q[5];
cx q[0], q[9];
cx q[0], q[3];
cx q[0], q[6];
