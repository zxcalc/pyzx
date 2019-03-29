// Initial wiring: [6, 5, 3, 10, 9, 13, 12, 1, 15, 4, 0, 8, 2, 11, 14, 7]
// Resulting wiring: [6, 5, 3, 10, 9, 13, 12, 1, 15, 4, 0, 8, 2, 11, 14, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[4];
cx q[12], q[11];
cx q[15], q[8];
cx q[9], q[14];
cx q[9], q[10];
cx q[1], q[6];
cx q[1], q[2];
