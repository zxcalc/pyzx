// Initial wiring: [4, 13, 8, 1, 3, 12, 6, 9, 5, 11, 15, 2, 0, 14, 10, 7]
// Resulting wiring: [4, 13, 8, 1, 3, 12, 6, 9, 5, 11, 15, 2, 0, 14, 10, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[14];
cx q[14], q[13];
cx q[8], q[9];
