// Initial wiring: [2, 13, 4, 11, 6, 3, 12, 15, 8, 9, 5, 10, 1, 0, 7, 14]
// Resulting wiring: [2, 13, 4, 11, 6, 3, 12, 15, 8, 9, 5, 10, 1, 0, 7, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[4];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[1];
cx q[1], q[0];
cx q[6], q[1];
cx q[9], q[6];
cx q[12], q[11];
cx q[13], q[12];
cx q[15], q[14];
cx q[2], q[3];
