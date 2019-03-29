// Initial wiring: [5, 0, 3, 15, 2, 13, 14, 1, 10, 4, 12, 9, 6, 11, 8, 7]
// Resulting wiring: [5, 0, 3, 15, 2, 13, 14, 1, 10, 4, 12, 9, 6, 11, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[13], q[10];
cx q[15], q[14];
cx q[15], q[8];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[10];
cx q[10], q[11];
cx q[4], q[5];
cx q[5], q[10];
