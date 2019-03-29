// Initial wiring: [8, 15, 14, 4, 3, 2, 12, 5, 9, 11, 13, 1, 6, 10, 0, 7]
// Resulting wiring: [8, 15, 14, 4, 3, 2, 12, 5, 9, 11, 13, 1, 6, 10, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[9];
cx q[12], q[8];
cx q[15], q[10];
cx q[9], q[14];
cx q[7], q[14];
cx q[5], q[8];
cx q[2], q[8];
cx q[0], q[4];
