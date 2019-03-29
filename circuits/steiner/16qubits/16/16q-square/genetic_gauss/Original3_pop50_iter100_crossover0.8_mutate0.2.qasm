// Initial wiring: [4, 12, 8, 11, 7, 9, 2, 0, 10, 3, 6, 13, 14, 1, 15, 5]
// Resulting wiring: [4, 12, 8, 11, 7, 9, 2, 0, 10, 3, 6, 13, 14, 1, 15, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[2];
cx q[15], q[13];
cx q[13], q[2];
cx q[15], q[5];
cx q[12], q[10];
cx q[6], q[13];
cx q[3], q[14];
cx q[1], q[14];
cx q[1], q[8];
cx q[0], q[5];
cx q[0], q[1];
cx q[0], q[10];
cx q[8], q[9];
cx q[3], q[7];
cx q[1], q[6];
