// Initial wiring: [9, 11, 14, 1, 13, 0, 12, 6, 4, 2, 5, 7, 8, 10, 3, 15]
// Resulting wiring: [9, 11, 14, 1, 13, 0, 12, 6, 4, 2, 5, 7, 8, 10, 3, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[2];
cx q[14], q[9];
cx q[15], q[8];
