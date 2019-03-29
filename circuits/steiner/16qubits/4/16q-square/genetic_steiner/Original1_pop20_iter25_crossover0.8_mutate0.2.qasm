// Initial wiring: [10, 13, 14, 11, 12, 6, 8, 15, 7, 5, 9, 2, 0, 4, 1, 3]
// Resulting wiring: [10, 13, 14, 11, 12, 6, 8, 15, 7, 5, 9, 2, 0, 4, 1, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[14];
cx q[8], q[15];
cx q[8], q[9];
cx q[1], q[2];
