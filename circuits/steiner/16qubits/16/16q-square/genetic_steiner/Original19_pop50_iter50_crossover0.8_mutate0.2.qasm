// Initial wiring: [10, 13, 6, 5, 11, 3, 1, 4, 0, 15, 12, 7, 2, 9, 8, 14]
// Resulting wiring: [10, 13, 6, 5, 11, 3, 1, 4, 0, 15, 12, 7, 2, 9, 8, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[2], q[1];
cx q[1], q[0];
cx q[2], q[1];
cx q[3], q[2];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[0];
cx q[7], q[6];
cx q[10], q[5];
cx q[5], q[4];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[4];
cx q[14], q[9];
cx q[9], q[6];
cx q[8], q[15];
cx q[5], q[10];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[6];
