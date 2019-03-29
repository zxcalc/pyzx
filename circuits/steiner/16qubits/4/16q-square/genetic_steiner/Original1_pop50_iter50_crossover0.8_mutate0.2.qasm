// Initial wiring: [6, 11, 1, 3, 7, 5, 0, 10, 4, 14, 9, 12, 15, 2, 13, 8]
// Resulting wiring: [6, 11, 1, 3, 7, 5, 0, 10, 4, 14, 9, 12, 15, 2, 13, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[2];
cx q[14], q[9];
cx q[4], q[5];
