// Initial wiring: [0, 1, 10, 4, 11, 5, 14, 9, 2, 15, 13, 12, 8, 3, 7, 6]
// Resulting wiring: [0, 1, 10, 4, 11, 5, 14, 9, 2, 15, 13, 12, 8, 3, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[2];
cx q[6], q[5];
cx q[7], q[6];
cx q[9], q[6];
cx q[11], q[4];
cx q[12], q[11];
cx q[13], q[12];
cx q[9], q[10];
cx q[7], q[8];
cx q[6], q[7];
cx q[4], q[5];
cx q[5], q[6];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[2], q[3];
cx q[7], q[6];
cx q[1], q[6];
cx q[0], q[1];
cx q[0], q[7];
cx q[1], q[6];
