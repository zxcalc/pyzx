// Initial wiring: [9, 2, 10, 1, 13, 15, 7, 8, 11, 3, 5, 6, 0, 12, 4, 14]
// Resulting wiring: [9, 2, 10, 1, 13, 15, 7, 8, 11, 3, 5, 6, 0, 12, 4, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[6];
cx q[8], q[7];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[14], q[13];
cx q[9], q[10];
cx q[10], q[11];
cx q[7], q[8];
cx q[8], q[9];
cx q[6], q[9];
cx q[5], q[10];
cx q[2], q[5];
cx q[2], q[3];
cx q[5], q[10];
cx q[3], q[4];
cx q[0], q[7];
cx q[7], q[8];
