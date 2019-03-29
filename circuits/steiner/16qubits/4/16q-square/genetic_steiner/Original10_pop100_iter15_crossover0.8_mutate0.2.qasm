// Initial wiring: [4, 8, 10, 3, 9, 13, 1, 12, 7, 5, 11, 0, 15, 2, 6, 14]
// Resulting wiring: [4, 8, 10, 3, 9, 13, 1, 12, 7, 5, 11, 0, 15, 2, 6, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[6], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[1], q[6];
