// Initial wiring: [8, 7, 10, 0, 2, 4, 15, 12, 1, 5, 11, 14, 13, 9, 3, 6]
// Resulting wiring: [8, 7, 10, 0, 2, 4, 15, 12, 1, 5, 11, 14, 13, 9, 3, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[8];
cx q[8], q[12];
cx q[0], q[5];
cx q[0], q[8];
