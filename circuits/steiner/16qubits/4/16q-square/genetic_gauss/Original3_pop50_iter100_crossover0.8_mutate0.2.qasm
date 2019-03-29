// Initial wiring: [8, 14, 15, 2, 3, 12, 0, 9, 4, 6, 10, 11, 5, 1, 13, 7]
// Resulting wiring: [8, 14, 15, 2, 3, 12, 0, 9, 4, 6, 10, 11, 5, 1, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[1];
cx q[12], q[15];
cx q[2], q[3];
cx q[0], q[5];
