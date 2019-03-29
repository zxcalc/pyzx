// Initial wiring: [4, 15, 8, 11, 7, 0, 6, 1, 10, 13, 9, 2, 12, 3, 5, 14]
// Resulting wiring: [4, 15, 8, 11, 7, 0, 6, 1, 10, 13, 9, 2, 12, 3, 5, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[9], q[8];
cx q[13], q[12];
cx q[14], q[9];
