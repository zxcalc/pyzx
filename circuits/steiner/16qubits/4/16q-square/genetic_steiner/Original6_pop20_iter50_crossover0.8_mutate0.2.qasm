// Initial wiring: [4, 13, 6, 7, 12, 5, 10, 15, 14, 11, 3, 1, 0, 8, 9, 2]
// Resulting wiring: [4, 13, 6, 7, 12, 5, 10, 15, 14, 11, 3, 1, 0, 8, 9, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[6], q[9];
cx q[9], q[8];
cx q[5], q[6];
cx q[6], q[9];
cx q[9], q[6];
