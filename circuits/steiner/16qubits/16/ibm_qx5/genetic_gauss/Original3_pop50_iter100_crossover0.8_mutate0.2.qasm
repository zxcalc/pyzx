// Initial wiring: [15, 0, 6, 10, 12, 2, 1, 11, 4, 3, 13, 9, 8, 5, 7, 14]
// Resulting wiring: [15, 0, 6, 10, 12, 2, 1, 11, 4, 3, 13, 9, 8, 5, 7, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[4], q[0];
cx q[7], q[0];
cx q[7], q[1];
cx q[8], q[2];
cx q[8], q[4];
cx q[15], q[2];
cx q[13], q[6];
cx q[13], q[11];
cx q[9], q[12];
cx q[8], q[11];
cx q[6], q[12];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[9];
