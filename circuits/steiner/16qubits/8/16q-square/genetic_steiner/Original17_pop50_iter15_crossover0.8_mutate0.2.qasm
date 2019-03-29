// Initial wiring: [10, 8, 4, 6, 1, 12, 3, 7, 11, 14, 15, 9, 5, 13, 2, 0]
// Resulting wiring: [10, 8, 4, 6, 1, 12, 3, 7, 11, 14, 15, 9, 5, 13, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[15], q[8];
cx q[8], q[9];
cx q[5], q[10];
cx q[3], q[4];
cx q[2], q[5];
cx q[5], q[4];
cx q[4], q[11];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[10];
