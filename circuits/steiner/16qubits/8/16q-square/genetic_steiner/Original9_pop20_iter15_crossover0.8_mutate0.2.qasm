// Initial wiring: [11, 15, 12, 9, 6, 14, 7, 2, 3, 1, 8, 10, 4, 0, 13, 5]
// Resulting wiring: [11, 15, 12, 9, 6, 14, 7, 2, 3, 1, 8, 10, 4, 0, 13, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[6];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[9];
cx q[11], q[4];
cx q[10], q[11];
cx q[8], q[15];
cx q[6], q[9];
cx q[4], q[5];
cx q[5], q[4];
cx q[2], q[5];
cx q[5], q[4];
cx q[1], q[6];
cx q[6], q[9];
cx q[9], q[8];
cx q[9], q[6];
