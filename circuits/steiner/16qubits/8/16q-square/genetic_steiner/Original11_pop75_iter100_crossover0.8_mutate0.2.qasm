// Initial wiring: [5, 0, 2, 15, 6, 9, 11, 1, 10, 12, 14, 3, 8, 4, 13, 7]
// Resulting wiring: [5, 0, 2, 15, 6, 9, 11, 1, 10, 12, 14, 3, 8, 4, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[1];
cx q[10], q[5];
cx q[12], q[11];
cx q[15], q[14];
cx q[4], q[5];
cx q[2], q[5];
cx q[0], q[1];
