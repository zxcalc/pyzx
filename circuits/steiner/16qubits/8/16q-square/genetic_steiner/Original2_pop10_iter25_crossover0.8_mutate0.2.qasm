// Initial wiring: [4, 0, 8, 5, 15, 10, 1, 7, 11, 14, 2, 12, 13, 9, 6, 3]
// Resulting wiring: [4, 0, 8, 5, 15, 10, 1, 7, 11, 14, 2, 12, 13, 9, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[13], q[10];
cx q[15], q[14];
cx q[7], q[8];
cx q[4], q[11];
cx q[11], q[10];
cx q[1], q[6];
cx q[0], q[7];
cx q[7], q[8];
cx q[8], q[7];
