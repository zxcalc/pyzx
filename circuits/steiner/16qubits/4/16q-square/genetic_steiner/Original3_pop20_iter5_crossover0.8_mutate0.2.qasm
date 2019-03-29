// Initial wiring: [2, 15, 10, 3, 8, 12, 4, 9, 11, 14, 0, 13, 7, 5, 1, 6]
// Resulting wiring: [2, 15, 10, 3, 8, 12, 4, 9, 11, 14, 0, 13, 7, 5, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[13], q[12];
cx q[14], q[9];
cx q[4], q[5];
