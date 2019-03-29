// Initial wiring: [3, 15, 14, 8, 2, 1, 6, 7, 13, 11, 9, 5, 4, 12, 0, 10]
// Resulting wiring: [3, 15, 14, 8, 2, 1, 6, 7, 13, 11, 9, 5, 4, 12, 0, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[6];
cx q[8], q[9];
cx q[0], q[1];
