// Initial wiring: [8, 10, 2, 0, 3, 14, 1, 11, 12, 9, 13, 6, 15, 4, 5, 7]
// Resulting wiring: [8, 10, 2, 0, 3, 14, 1, 11, 12, 9, 13, 6, 15, 4, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[1];
cx q[9], q[5];
cx q[12], q[0];
cx q[14], q[3];
cx q[13], q[4];
cx q[13], q[5];
cx q[13], q[8];
cx q[12], q[11];
cx q[6], q[7];
cx q[8], q[12];
cx q[0], q[4];
cx q[0], q[2];
cx q[4], q[15];
cx q[1], q[6];
