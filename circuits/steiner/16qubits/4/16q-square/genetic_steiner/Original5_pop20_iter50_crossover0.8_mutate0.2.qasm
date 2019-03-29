// Initial wiring: [14, 11, 3, 1, 4, 12, 8, 7, 0, 10, 15, 6, 9, 2, 13, 5]
// Resulting wiring: [14, 11, 3, 1, 4, 12, 8, 7, 0, 10, 15, 6, 9, 2, 13, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[15], q[14];
cx q[2], q[5];
cx q[1], q[6];
