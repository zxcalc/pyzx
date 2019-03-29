// Initial wiring: [4, 14, 3, 0, 2, 15, 1, 9, 5, 8, 11, 6, 13, 10, 12, 7]
// Resulting wiring: [4, 14, 3, 0, 2, 15, 1, 9, 5, 8, 11, 6, 13, 10, 12, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[1];
cx q[9], q[14];
cx q[8], q[15];
