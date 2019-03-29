// Initial wiring: [9, 12, 3, 7, 2, 4, 13, 5, 0, 6, 1, 8, 11, 15, 14, 10]
// Resulting wiring: [9, 12, 3, 7, 2, 4, 13, 5, 0, 6, 1, 8, 11, 15, 14, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[5];
cx q[12], q[11];
cx q[15], q[8];
cx q[5], q[10];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[10];
cx q[0], q[7];
