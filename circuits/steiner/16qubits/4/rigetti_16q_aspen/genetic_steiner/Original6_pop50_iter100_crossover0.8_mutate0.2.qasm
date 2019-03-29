// Initial wiring: [4, 13, 0, 1, 8, 3, 5, 11, 10, 2, 6, 9, 7, 12, 15, 14]
// Resulting wiring: [4, 13, 0, 1, 8, 3, 5, 11, 10, 2, 6, 9, 7, 12, 15, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[8];
cx q[8], q[15];
cx q[6], q[7];
