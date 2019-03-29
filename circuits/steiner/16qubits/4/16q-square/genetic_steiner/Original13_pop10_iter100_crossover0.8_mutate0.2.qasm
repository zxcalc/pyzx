// Initial wiring: [1, 13, 15, 14, 12, 11, 4, 9, 2, 3, 8, 0, 5, 10, 6, 7]
// Resulting wiring: [1, 13, 15, 14, 12, 11, 4, 9, 2, 3, 8, 0, 5, 10, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[9];
cx q[5], q[6];
cx q[3], q[4];
cx q[1], q[6];
