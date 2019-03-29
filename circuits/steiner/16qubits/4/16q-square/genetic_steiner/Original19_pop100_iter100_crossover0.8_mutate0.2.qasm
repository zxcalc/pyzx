// Initial wiring: [15, 4, 2, 6, 11, 14, 13, 10, 12, 1, 8, 9, 5, 7, 0, 3]
// Resulting wiring: [15, 4, 2, 6, 11, 14, 13, 10, 12, 1, 8, 9, 5, 7, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[1];
cx q[4], q[5];
cx q[0], q[1];
