// Initial wiring: [6, 9, 8, 3, 2, 4, 12, 5, 15, 0, 14, 10, 1, 11, 13, 7]
// Resulting wiring: [6, 9, 8, 3, 2, 4, 12, 5, 15, 0, 14, 10, 1, 11, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[5], q[2];
cx q[5], q[0];
cx q[9], q[0];
cx q[8], q[2];
cx q[12], q[9];
cx q[13], q[4];
cx q[14], q[13];
cx q[15], q[14];
cx q[15], q[9];
cx q[13], q[1];
cx q[13], q[2];
cx q[14], q[3];
cx q[13], q[8];
cx q[14], q[11];
cx q[9], q[11];
cx q[3], q[7];
cx q[2], q[3];
cx q[7], q[11];
cx q[7], q[10];
cx q[1], q[9];
cx q[7], q[8];
cx q[2], q[6];
