// Initial wiring: [11, 4, 13, 5, 10, 6, 12, 2, 15, 9, 0, 1, 8, 3, 14, 7]
// Resulting wiring: [11, 4, 13, 5, 10, 6, 12, 2, 15, 9, 0, 1, 8, 3, 14, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[5];
cx q[11], q[4];
cx q[13], q[10];
cx q[10], q[5];
cx q[13], q[10];
cx q[14], q[15];
cx q[10], q[11];
cx q[6], q[7];
