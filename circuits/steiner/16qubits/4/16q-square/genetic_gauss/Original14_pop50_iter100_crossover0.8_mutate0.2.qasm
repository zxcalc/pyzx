// Initial wiring: [9, 6, 4, 5, 13, 10, 1, 11, 14, 12, 8, 2, 3, 0, 7, 15]
// Resulting wiring: [9, 6, 4, 5, 13, 10, 1, 11, 14, 12, 8, 2, 3, 0, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[14];
cx q[7], q[12];
cx q[1], q[5];
cx q[1], q[9];
