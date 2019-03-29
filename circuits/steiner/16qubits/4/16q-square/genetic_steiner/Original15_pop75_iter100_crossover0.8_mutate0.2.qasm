// Initial wiring: [6, 10, 9, 7, 12, 4, 1, 5, 13, 2, 11, 14, 3, 8, 0, 15]
// Resulting wiring: [6, 10, 9, 7, 12, 4, 1, 5, 13, 2, 11, 14, 3, 8, 0, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[11], q[4];
cx q[4], q[5];
cx q[0], q[7];
