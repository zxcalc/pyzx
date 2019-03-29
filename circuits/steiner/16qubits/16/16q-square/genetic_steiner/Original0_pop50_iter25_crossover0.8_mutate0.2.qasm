// Initial wiring: [3, 9, 6, 0, 8, 10, 1, 13, 12, 14, 11, 4, 5, 7, 2, 15]
// Resulting wiring: [3, 9, 6, 0, 8, 10, 1, 13, 12, 14, 11, 4, 5, 7, 2, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[0];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[10], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[10], q[5];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[4];
cx q[13], q[10];
cx q[14], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[11];
cx q[8], q[9];
