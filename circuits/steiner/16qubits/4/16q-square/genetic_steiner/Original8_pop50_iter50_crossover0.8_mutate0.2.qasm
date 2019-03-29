// Initial wiring: [6, 0, 4, 7, 1, 13, 11, 12, 3, 8, 5, 9, 14, 15, 2, 10]
// Resulting wiring: [6, 0, 4, 7, 1, 13, 11, 12, 3, 8, 5, 9, 14, 15, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[6];
cx q[6], q[9];
cx q[0], q[1];
