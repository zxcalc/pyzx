// Initial wiring: [9, 2, 3, 7, 5, 11, 10, 4, 13, 14, 12, 1, 8, 0, 15, 6]
// Resulting wiring: [9, 2, 3, 7, 5, 11, 10, 4, 13, 14, 12, 1, 8, 0, 15, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[5], q[6];
cx q[6], q[9];
cx q[4], q[5];
