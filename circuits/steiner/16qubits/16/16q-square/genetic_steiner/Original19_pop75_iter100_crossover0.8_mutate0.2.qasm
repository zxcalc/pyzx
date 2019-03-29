// Initial wiring: [3, 12, 2, 7, 13, 9, 11, 4, 10, 5, 6, 1, 15, 8, 14, 0]
// Resulting wiring: [3, 12, 2, 7, 13, 9, 11, 4, 10, 5, 6, 1, 15, 8, 14, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[5], q[2];
cx q[2], q[1];
cx q[1], q[0];
cx q[5], q[2];
cx q[7], q[0];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[8];
cx q[13], q[12];
cx q[12], q[11];
cx q[15], q[14];
cx q[7], q[8];
cx q[4], q[11];
cx q[2], q[3];
cx q[1], q[6];
cx q[0], q[1];
