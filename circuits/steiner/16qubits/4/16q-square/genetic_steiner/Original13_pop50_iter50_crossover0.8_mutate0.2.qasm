// Initial wiring: [14, 12, 0, 9, 8, 3, 2, 15, 13, 4, 5, 7, 10, 1, 11, 6]
// Resulting wiring: [14, 12, 0, 9, 8, 3, 2, 15, 13, 4, 5, 7, 10, 1, 11, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[14], q[9];
cx q[8], q[9];
cx q[0], q[1];
