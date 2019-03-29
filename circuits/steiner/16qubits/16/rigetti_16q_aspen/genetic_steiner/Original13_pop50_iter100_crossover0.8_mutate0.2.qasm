// Initial wiring: [8, 7, 4, 3, 15, 9, 14, 12, 5, 6, 0, 10, 13, 1, 11, 2]
// Resulting wiring: [8, 7, 4, 3, 15, 9, 14, 12, 5, 6, 0, 10, 13, 1, 11, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[3], q[2];
cx q[2], q[1];
cx q[1], q[0];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[4], q[3];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[7], q[6];
cx q[9], q[8];
cx q[15], q[14];
cx q[13], q[14];
cx q[10], q[11];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[2], q[3];
