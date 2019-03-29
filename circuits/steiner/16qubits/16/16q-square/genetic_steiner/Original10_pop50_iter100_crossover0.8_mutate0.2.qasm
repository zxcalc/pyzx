// Initial wiring: [11, 10, 9, 5, 13, 1, 2, 6, 15, 12, 4, 8, 0, 14, 3, 7]
// Resulting wiring: [11, 10, 9, 5, 13, 1, 2, 6, 15, 12, 4, 8, 0, 14, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[2], q[1];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[1], q[0];
cx q[5], q[2];
cx q[10], q[9];
cx q[11], q[4];
cx q[15], q[14];
cx q[14], q[15];
cx q[9], q[10];
cx q[7], q[8];
cx q[6], q[9];
cx q[9], q[10];
cx q[9], q[8];
cx q[5], q[6];
cx q[0], q[1];
cx q[1], q[6];
